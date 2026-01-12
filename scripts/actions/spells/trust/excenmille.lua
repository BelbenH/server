-----------------------------------
-- Trust: Excenmille
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.EXCENMILLE_S)
end

spellObject.onSpellCast = function(caster, target, spell)
    local sandoriaFirstTrust = caster:getCharVar('SandoriaFirstTrust')
    local zone = caster:getZoneID()

    if
        sandoriaFirstTrust == 1 and
        (zone == xi.zone.WEST_RONFAURE or zone == xi.zone.EAST_RONFAURE)
    then
        caster:setCharVar('SandoriaFirstTrust', 2)
    end

    return xi.trust.spawn(caster, spell)
end

-- Re-adds Excenmille's "base" gambits (everything except Sentinel).
local function addBaseGambits(mob)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH })
    mob:addGambit(ai.t.PARTY,  { ai.c.HPP_LT, 75 },               { ai.r.MA, ai.s.HIGHEST,  xi.magic.spellFamily.CURE })
end

-- Attaches a TAKE_DAMAGE listener to the current target so we can detect Excenmille landing *any* damage.
local function watchTargetForFirstHit(mob, targetId)
    local listenerName = string.format('EXCEN_FIRST_HIT_%u', mob:getID())

    -- Remove from previous target (if any) to avoid listener buildup.
    local prevTargetId = mob:getLocalVar('[EXCEN]WatchTargetId')
    if prevTargetId ~= 0 and prevTargetId ~= targetId then
        local prev = GetMobByID(prevTargetId)
        if prev and prev.removeListener then
            prev:removeListener('TAKE_DAMAGE', listenerName)
        end
    end

    mob:setLocalVar('[EXCEN]WatchTargetId', targetId)

    local target = GetMobByID(targetId)
    if not target then
        return
    end

    -- Attach listener: when the TARGET takes damage, if attacker == Excenmille, we mark "hit once".
    target:addListener('TAKE_DAMAGE', listenerName, function(targ, amount, attacker)
        if attacker and attacker:getID() == mob:getID() and amount and amount > 0 then
            mob:setLocalVar('[EXCEN]HitOnce', 1)
        end
    end)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.RAHAL] = xi.trust.messageOffset.TEAMWORK_1,
    })

    -- Base behavior (no Sentinel yet)
    addBaseGambits(mob)

    mob:addMod(xi.mod.STORETP, 25)

    -- State
    mob:setLocalVar('[EXCEN]HitOnce', 0)
    mob:setLocalVar('[EXCEN]SentinelAdded', 0)
    mob:setLocalVar('[EXCEN]WatchTargetId', 0)

    -- Track target changes + enable Sentinel only after first landed hit on that target.
    mob:addListener('COMBAT_TICK', 'EXCEN_SENTINEL_GATE', function(mobArg)
        local target = mobArg:getTarget()
        if not target then
            return
        end

        local tid = target:getID()

        -- Target changed: reset gate and begin watching new target for a landed hit.
        if tid ~= mobArg:getLocalVar('[EXCEN]WatchTargetId') then
            mobArg:setLocalVar('[EXCEN]HitOnce', 0)
            mobArg:setLocalVar('[EXCEN]SentinelAdded', 0)
            watchTargetForFirstHit(mobArg, tid)

            -- Optional: if your core supports it, this guarantees Sentinel gambit won't persist across targets.
            if mobArg.clearGambits then
                mobArg:clearGambits()
                addBaseGambits(mobArg)
            end
        end

        -- Once Excenmille has actually hit the mob at least once, *then* allow Sentinel via gambit.
        if mobArg:getLocalVar('[EXCEN]HitOnce') == 1 and mobArg:getLocalVar('[EXCEN]SentinelAdded') == 0 then
            mobArg:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.SENTINEL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL })
            mobArg:setLocalVar('[EXCEN]SentinelAdded', 1)
        end
    end)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
