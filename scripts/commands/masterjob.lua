-----------------------------------
-- func: masterjob
-- desc: Masters the player's current job
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, target)
    local targ = player

    targ:masterJob()
    player:printToPlayer(string.format('Mastered %s\'s main job!', targ:getName()))
end

return commandObj
