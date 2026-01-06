-----------------------------------
-- func: diggingskill
-- desc: Print out player's digging skill
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player, number, target)
    player:printToPlayer('Your current digging skill is: ' .. player:getCharSkillLevel(xi.skill.DIG) / 10, xi.msg.channel.SYSTEM_3, '')
end

return commandObj
