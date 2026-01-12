-----------------------------------
-- Trust: Halver
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -------------------------------------------------
    -- Sticky hate (tune as you like)
    -------------------------------------------------
    if xi.mod.ENMITY then
        mob:addMod(xi.mod.ENMITY, 95)
    end

    if xi.mod.ENMITY_LOSS_REDUCTION then
        mob:addMod(xi.mod.ENMITY_LOSS_REDUCTION, 95)
    end

    -------------------------------------------------
    -- MP sustain for cures
    -------------------------------------------------
    if xi.mod.REFRESH then
        mob:addMod(xi.mod.REFRESH, 2)
    end

    -------------------------------------------------
    -- Cures (highest available Cure in his spell list)
    -------------------------------------------------
    mob:addGambit(ai.t.SELF,  { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -------------------------------------------------
    -- Provoke
    -------------------------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })

    -------------------------------------------------
    -- Weapon Skill: Penta Thrust @ 1000+ TP
    -- (Your error is almost certainly here: wrong constant path.)
    -------------------------------------------------
    local tpCond =
        (ai.c.TP_GT)  or
        (ai.c.TP_GTE) or
        (ai.c.TP_GEQ) or
        (ai.c.TP_GE)

    local penta =
        (xi.ws and xi.ws.PENTA_THRUST) or
        (xi.weaponskills and xi.weaponskills.PENTA_THRUST) or
        (xi.weaponskill and xi.weaponskill.PENTA_THRUST)

    -- Only add the WS gambit if both constants exist in your fork.
    if tpCond ~= nil and penta ~= nil then
        mob:addGambit(ai.t.TARGET, { tpCond, 999 }, { ai.r.WS, ai.s.SPECIFIC, penta })
    else
        -- If you want a visible hint in logs, uncomment:
        -- printf('[Halver] Missing TP condition or Penta Thrust id (tpCond=%s, penta=%s)', tostring(tpCond), tostring(penta))
    end

    -------------------------------------------------
    -- Quality bump
    -------------------------------------------------
    if xi.mod.STORETP then
        mob:addMod(xi.mod.STORETP, 25)
    end
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
