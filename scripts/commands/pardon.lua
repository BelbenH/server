-----------------------------------
-- func: pardon
-- desc: Pardons a player from jail. (Mordion Gaol)
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, target)
    if target == nil then
        player:printToPlayer('You must enter a valid player name.')
        return
    end

    -- Validate the target..
    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Invalid player \'%s\' given.', target))
        return
    end

    if targ:getCharVar('inJail') >= 1 then
        local message = string.format('%s is pardoning %s from jail.', player:getName(), targ:getName())
        printf(message)

        targ:setCharVar('inJail', 0)

        -- get previous zone
        local zoneId = targ:getPreviousZone()
        if
            zoneId == nil or
            zoneId == xi.zone.UNKNOWN or
            zoneId == xi.zone.RESIDENTIAL_AREA
        then
            target:warp()
            return
        end

        -- zone target
        targ:setPos(0, 0, 0, 0, zoneId)
        if targ:getID() ~= player:getID() then
            player:printToPlayer(string.format('%s was returned to zone %i.', targ:getName(), zoneId))
        end
    end
end

return commandObj
