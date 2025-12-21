-----------------------------------
-- func: delspell <spellID> <player>
-- desc: Removes a spell from the players spell list.
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
    player:printToPlayer('!delspell <spellID/spellName> (player)')
end

commandObj.onTrigger = function(player, spellParam, target)
    xi.xisp.trackGM(player, 'delSpell')
    local spellId = tonumber(spellParam) or xi.magic.spell[string.upper(spellParam)]

    -- validate spellId
    if spellId == nil then
        error(player, 'Invalid spellID.')
        return
    end

    -- validate target
    local targ = player

    -- add spell
    targ:delSpell(spellId)
    player:printToPlayer(string.format('Deleted spell %i from %s.', spellId, targ:getName()))
end

return commandObj
