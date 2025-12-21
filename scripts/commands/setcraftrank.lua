-----------------------------------
-- func: setcraftRank <craft skill or ID> <craft rank> <target>
-- desc: sets target's RANK of specified craft skill
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
    player:printToPlayer('!setcraftRank <craft skill or ID> <craft rank> (player)')
end

commandObj.onTrigger = function(player, craftName, tier, target)
    if craftName == nil then
        error(player, 'You must specify a craft skill to set!')
        return
    end

    local skillID = tonumber(craftName) or xi.skill[string.upper(craftName)]

    if skillID == nil or skillID < 48 or skillID > 57 then
        error(player, 'You must specify a valid craft skill.')
        return
    end

    if tier == nil then
        error(player, 'You must specify a rank to set the craft skill to.')
        return
    end

    local craftRank = tonumber(tier) or xi.craftRank[string.upper(tier)]
    if craftRank == nil then
        error(player, 'Invalid craft rank!')
        return
    end

    targ = player

    targ:setSkillRank(skillID, craftRank)
    targ:printToPlayer(string.format('Your %s craft skill rank has been adjusted to: %s', craftName, craftRank))
    if targ ~= player then
        player:printToPlayer(string.format('%s\'s new skillID \'%s\' rank: %u', targ:getName(), craftName, targ:getSkillRank(skillID)))
    end
end

return commandObj
