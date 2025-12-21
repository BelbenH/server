-----------------------------------
-- func: givegil <amount> <player>
-- desc: Gives the specified amount of gil to GM or target player.
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
    player:printToPlayer('!givegil <amount> (player)')
end

commandObj.onTrigger = function(player, amount, target)
    xi.xisp.trackGM(player, 'giveItem')
    print('GM COMMAND: ' .. player:getName() .. ' gave '.. amount .. ' gil to self.')
    -- validate amount
    if amount == nil or amount < 1 then
        error(player, 'Invalid amount of gil.')
        return
    end

    -- validate target
    local targ = player

    -- give gil to target
    targ:addGil(amount)
    player:printToPlayer(string.format('Gave %i gil to %s.  They now have %i gil.', amount, targ:getName(), targ:getGil()))
end

return commandObj
