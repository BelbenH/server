-----------------------------------
-- func: addallmounts
-- desc: Adds all mount key items to player, granting access to their associated mounts
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
    player:printToPlayer('!addallmounts (player)')
end

commandObj.onTrigger = function(player, target)
    xi.xisp.trackGM(player, 'addAllMounts')
    -- validate target
    local targ = player

    -- add all mount key items
    for i = xi.ki.CHOCOBO_COMPANION, xi.ki.CHOCOBO_COMPANION + 26 do
        targ:addKeyItem(i)
    end

    player:printToPlayer(string.format('%s now has all mounts.', targ:getName()))
end

return commandObj
