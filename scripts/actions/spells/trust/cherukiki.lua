-----------------------------------
-- Trust: Cherukiki (916)
-- Replacement trust for player WHM squire
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
    xi.xispal.onSquireSpawn(mob)
end

spellObject.onMobRoam = function(mob)
    local player = mob:getMaster()

    xi.xispal.idleSquireChat(mob, player)
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
