-----------------------------------
-- func: completerecord <recordID> <player>
-- desc: Completes the given quest for the GM or target player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!completerecord <recordID> (player)')
end

commandObj.onTrigger = function(player, recordID, target)
    xi.xisp.trackGM(player, 'completeROERecord')

    -- validate logId
    if recordID == nil then
        error(player, 'Invalid recordID.')
        return
    end

    -- validate target
    local targ = player

    -- complete quest
    targ:setEminenceCompleted(recordID)
    player:printToPlayer(string.format('Completed RoE Record with ID %u for %s', recordID, targ:getName()))
end

return commandObj
