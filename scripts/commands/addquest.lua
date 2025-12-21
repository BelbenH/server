-----------------------------------
-- func: addquest <logID> <questID> <player>
-- desc: Adds a quest to the given targets log.
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
    player:printToPlayer('!addquest <logID> <questID> (player)')
end

commandObj.onTrigger = function(player, logId, questId, target)
    xi.xisp.trackGM(player, 'addQuest')

    -- validate logId
    local questLog = logIdHelpers.getQuestLogInfo(logId)
    if questLog == nil then
        error(player, 'Invalid logID.')
        return
    end

    local logName = questLog.full_name
    logId = questLog.quest_log

    -- validate questId
    local areaQuestIds = xi.quest.id[xi.quest.area[logId]]
    if questId ~= nil then
        questId = tonumber(questId) or areaQuestIds[string.upper(questId)]
    end

    if questId == nil or questId < 0 then
        error(player, 'Invalid questID.')
        return
    end

    -- validate target
    local targ = player

    -- add quest
    targ:addQuest(logId, questId)
    player:printToPlayer(string.format('Added %s quest %i to %s.', logName, questId, targ:getName()))
end

return commandObj
