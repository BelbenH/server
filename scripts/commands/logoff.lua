-----------------------------------
-- func: logoff
-- desc: Logs the target player off by force.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, target)
    -- validate target
    local targ = player

    -- logoff target
    targ:leaveGame()
    if targ:getID() ~= player:getID() then
        player:printToPlayer(string.format('%s has been logged off.', targ:getName()))
    end
end

return commandObj
