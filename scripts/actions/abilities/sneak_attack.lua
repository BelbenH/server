-----------------------------------
-- Ability: Sneak Attack
-- Deals critical damage when striking from behind.
-- Obtained: Thief Level 15
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:getMainJob() == xi.job.THF then
        ability:setRecast(45)
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.thief.useSneakAttack(player, target, ability)
end

return abilityObject
