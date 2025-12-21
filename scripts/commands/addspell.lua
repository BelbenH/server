-----------------------------------
-- func: addspell <spellID> <player>
-- desc: adds the ability to use a spell to the player
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!addspell <spellID/spellName> (player)')
end

commandObj.onTrigger = function(player, spellParam, target)
    xi.xisp.trackGM(player, 'addSpell')

    local spellId = tonumber(spellParam) or xi.magic.spell[string.upper(spellParam)]

    -- validate spellId
    if spellId == nil then
        error(player, 'Invalid spellID.')
        return
    end

    -- validate target
    local targ = player

    -- add spell
    targ:addSpell(spellId)
    player:printToPlayer(string.format('Added spell %i to %s.', spellId, targ:getName()))
end

return commandObj
