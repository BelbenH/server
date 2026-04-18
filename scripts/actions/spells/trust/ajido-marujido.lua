-----------------------------------
-- Trust: Ajido-Marujido (904)
-- Replacement trust for Vivio (BLM XISP)
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

spellObject.onMobEngage = function(mob, target)
    mob:setLocalVar('[XISP]spellRecast', GetSystemTime() + math.random(10, 15))
end

spellObject.onMobRoam = function(mob)
    local player = mob:getMaster()
    xi.xispal.onMobRoam(mob, player)
end

spellObject.onMobFight = function(mob, target)
    local player = mob:getMaster()
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