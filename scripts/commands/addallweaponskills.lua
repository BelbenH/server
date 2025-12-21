-----------------------------------
-- func: addallweaponskills
-- desc: Adds all learned weaponskills to the given target. If no target then to the current player.
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
    player:printToPlayer('!addallweaponskills (player)')
end

commandObj.onTrigger = function(player, target)
    xi.xisp.trackGM(player, 'addAllWeaponskills')
    -- validate target
    local targ = player

    -- add all learned weaponskills
    for _, wsUnlockId in pairs(xi.wsUnlock) do
        targ:addLearnedWeaponskill(wsUnlockId)
    end

    player:printToPlayer(string.format('%s now has all learned weaponskills.', targ:getName()))
end

return commandObj
