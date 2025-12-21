-----------------------------------
-- func: capallskills
-- desc: Caps all the players skills.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    xi.xisp.trackGM(player, 'capAllSkills')
    player:capAllSkills()
    player:printToPlayer('All skills capped!')
end

return commandObj
