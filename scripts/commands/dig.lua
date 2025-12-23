-- func: dig
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player, target)
    player:printToPlayer(string.format('Chocobo digging skill: ' .. player:getCharSkillLevel(xi.skill.DIG) / 10))
    -- -- 55 is the standard internal ID for xi.skill.DIG
    -- local realSkill = player:getCharSkillLevel(55) 
    
    -- -- Convert internal value (e.g. 105) to display format (10.5)
    -- local displaySkill = string.format("%.1f", realSkill / 10)
    
    -- -- Calculate progress toward the next whole level
    -- -- e.g., if skill is 10.5, this shows "5/10 points to Level 11"
    -- local pointsProgress = realSkill % 10
    -- local nextLevel = math.floor(realSkill / 10) + 1
    
    -- -- Retrieve the current rank (0-10)
    -- local skillRank = player:getSkillRank(55)
    
    -- local rankNames = {
    --     [0]  = "Amateur",
    --     [1]  = "Recruit",
    --     [2]  = "Initiate",
    --     [3]  = "Novice",
    --     [4]  = "Apprentice",
    --     [5]  = "Journeyman",
    --     [6]  = "Craftsman",
    --     [7]  = "Artisan",
    --     [8]  = "Adept",
    --     [9]  = "Veteran",
    --     [10] = "Master"
    -- }
    
    -- local rankName = rankNames[skillRank] or "Unknown"

    -- -- Display the current stats to the player using color 0x1D (Success Yellow)
    -- player:printToPlayer(string.format("Digging Skill: %s (%s)", displaySkill, rankName), 0x1D)
    
    -- if realSkill < 1000 then
    --     player:printToPlayer(string.format("Progress: %d/10 points toward Level %d.", pointsProgress, nextLevel), 0x1D)
    -- else
    --     player:printToPlayer("Your digging skill is at the maximum limit!", 0x1D)
    -- end
end

return commandObj