-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Lusiane
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.LUGWORM,                        12, 2, },
        { xi.item.LITTLE_WORM,                     4, 3, },
        { xi.item.BAMBOO_FISHING_ROD,            561, 1, },
        { xi.item.YEW_FISHING_ROD,               245, 2, },
        { xi.item.WILLOW_FISHING_ROD,             74, 3, },
        { xi.item.SCROLL_OF_LIGHT_THRENODY,      124, 3, },
        { xi.item.SCROLL_OF_LIGHTNING_THRENODY, 1431, 3, },
    }

    player:printToPlayer('Welcome, adventurer.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('This shop offers simple fishing tackle and equipment for those just beginning.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('Treat it well, and it will serve you.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.lowTierTackleShop, xi.fameArea.SANDORIA)
end

return entity