-----------------------------------
-- func: homepoint
-- desc: Sends the target to their homepoint.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!homepoint (player)')
end

commandObj.onTrigger = function(player, target)
    -- validate target
    local targ = player

    -- homepoint target
    targ:warp()
    if targ:getID() ~= player:getID() then
        player:printToPlayer(string.format('Sent %s to their homepoint.', targ:getName()))
    end
end

return commandObj
