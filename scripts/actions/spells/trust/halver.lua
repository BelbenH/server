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

    mob:addMod(xi.mod.ENMITY, 5)
    mob:addMod(xi.mod.STORETP, 25)

    mob:addGambit(ai.t.SELF,  { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })

    local tpCond =
        (ai.c.TP_GTE) or
        (ai.c.TP_GE)  or
        (ai.c.TP_GEQ) or
        (ai.c.TP_GT)

    local penta =
        (xi.ws and xi.ws.PENTA_THRUST) or
        (xi.weaponskills and xi.weaponskills.PENTA_THRUST) or
        (xi.weaponskill and xi.weaponskill.PENTA_THRUST)

    local dbl =
        (xi.ws and xi.ws.DOUBLE_THRUST) or
        (xi.weaponskills and xi.weaponskills.DOUBLE_THRUST) or
        (xi.weaponskill and xi.weaponskill.DOUBLE_THRUST)

    -- Penta first = preferred
    if tpCond ~= nil and penta ~= nil then
        mob:addGambit(ai.t.TARGET, { tpCond, 999 }, { ai.r.WS, ai.s.SPECIFIC, penta })
    end

    -- Double second = fallback (only if Penta isn't usable for some reason)
    if tpCond ~= nil and dbl ~= nil then
        mob:addGambit(ai.t.TARGET, { tpCond, 999 }, { ai.r.WS, ai.s.SPECIFIC, dbl })
    end
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
