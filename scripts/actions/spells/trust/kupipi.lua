-----------------------------------
-- Trust: Kupipi
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
    xi.xispal.onMageSpawn(mob, mob:getMaster(), xi.xispal.palInfo[mob:getMaster():getCharVar('[XISP]mageJob')])
end

spellObject.onMobRoam = function(mob)
    local player = mob:getMaster()
    xi.xispal.onMobRoam(mob, player)
end

spellObject.onMobFight = function(mob, target)
    local player = mob:getMaster()

    if not mob:hasStatusEffect(xi.effect.AFFLATUS_SOLACE) then
        mob:useJobAbility(xi.ja.AFFLATUS_SOLACE, mob)
    end

    xi.xispal.onMobFight(mob, target, player)
end

spellObject.onMobDisengage = function(mob)
    xi.xispal.onMobDisengage(mob)
end

spellObject.onMobDespawn = function(mob)
end

spellObject.onMobDeath = function(mob)
end

return spellObject
