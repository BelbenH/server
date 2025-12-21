-----------------------------------
-- func: ah
-- desc: opens the Auction House menu anywhere in the world
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = ''
}

commandObj.onTrigger = function(player)
    xi.xisp.trackGM(player, 'auctionHouse')

    player:sendMenu(xi.menuType.AUCTION)
end

return commandObj
