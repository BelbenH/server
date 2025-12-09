-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Apply the standard Defender behavior
    xi.job_utils.warrior.useDefender(player, target, ability)

    -- Add your custom 15% heal
    local maxHP = player:getMaxHP()
    local healAmount = math.floor(maxHP * 0.15)

    player:addHP(healAmount)
    player:printToPlayer("Defender restores " .. healAmount .. " HP!", xi.msg.channel.SYSTEM_3)
end

return abilityObject
