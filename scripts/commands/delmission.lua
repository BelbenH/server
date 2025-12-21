-----------------------------------
-- func: delmission <logID> <missionID> <player>
-- desc: Deletes the given mission from the GM or target player.
-----------------------------------
local logIdHelpers = require('scripts/globals/log_ids')
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'sss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!delmission <logID> <missionID> (player)')
end

commandObj.onTrigger = function(player, logId, missionId, target)
    xi.xisp.trackGM(player, 'delMission')

    -- validate logId
    local logName
    local logInfo = logIdHelpers.getMissionLogInfo(logId)
    if logInfo == nil then
        error(player, 'Invalid logID.')
        return
    end

    logName = logInfo.full_name
    logId = logInfo.mission_log

    -- validate missionId
    local areaMissionIds = xi.mission.id[xi.mission.area[logId]]
    if missionId ~= nil then
        missionId = tonumber(missionId) or areaMissionIds[string.upper(missionId)] or _G[string.upper(missionId)]
    end

    if missionId == nil or missionId < 0 then
        error(player, 'Invalid missionID.')
        return
    end

    -- validate target
    local targ = player

    -- delete mission
    targ:delMission(logId, missionId)
    player:printToPlayer(string.format('Deleted %s mission %i from %s.', logName, missionId, targ:getName()))
    player:printToPlayer('NOTE! This does NOT clear or update ANY mission variables! ')
end

return commandObj
