-----------------------------------
-- func: disengage
-- desc: Commands trusts to disengage
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local party = player:getPartyWithTrusts()

    for _, trust in pairs(party) do
        if trust:isTrust() and (trust:isEngaged() or trust:getLocalVar('currentTarget') > 0) then
            player:injectActionPacket(player:getID(), 6, 94, 0, 0, 0, 10, 1)
            trust:disengage()
            trust:setLocalVar('currentTarget', 0)
        end
    end

end

return commandObj
