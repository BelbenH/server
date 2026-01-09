-----------------------------------
-- func: announcemaint
-- desc: Warns the players the server will be coming down in 5 minutes
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 's'
}

commandObj.onTrigger = function(player, message)
    player:printToArea(message, xi.msg.channel.SYSTEM_1, xi.msg.area.SYSTEM, '', false)
end

return commandObj
