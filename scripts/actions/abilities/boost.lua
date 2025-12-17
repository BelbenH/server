-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Phalanx Custom changes
    local enmityTarget = player:getTarget()

    if enmityTarget then
        local power = 10

        if player:getMainJob() == xi.job.MNK then
            power = power + math.floor(player:getStat(xi.mod.VIT) / 10) + math.floor(player:getMainLvl() / 5)
        else
            power = power + math.floor(player:getStat(xi.mod.VIT) / 15)
        end

        for _, mob in pairs(player:getNotorietyList()) do
            if mob:isMob() and mob == enmityTarget then
                player:addEnmity(mob, 1, 300)
            end
        end
    end

    return xi.job_utils.monk.useBoost(player, target, ability)
end

return abilityObject
