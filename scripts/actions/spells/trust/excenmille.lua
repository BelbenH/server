-----------------------------------
-- Trust: Excenmille (899)
-- Replacement trust for Emilien (PLD XISP)
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
    xi.xispal.onKnightSpawn(mob, mob:getMaster(), xi.xispal.palInfo[mob:getMaster():getCharVar('[XISP]knightJob')])
end

spellObject.onMobRoam = function(mob)
    xi.xispal.onMobRoam(mob, mob:getMaster())
end

spellObject.onMobFight = function(mob, target)
    xi.xispal.onMobFight(mob, target, mob:getMaster())
end

spellObject.onMobDisengage = function(mob)
    xi.xispal.onMobDisengage(mob)
end

spellObject.onMobDespawn = function(mob)
end

spellObject.onMobDeath = function(mob)
    if mob:getPet() then
        mob:getPet():setHP(0)
    end
end

return spellObject
