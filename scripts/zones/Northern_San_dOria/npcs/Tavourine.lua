-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Tavourine
-----------------------------------
local ID = zones[xi.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BRONZE_KNIFE,           170, 3, },
        { xi.item.KNIFE,                 2522, 3, },
        { xi.item.BRONZE_ROD,             104, 3, },
        { xi.item.BRASS_ROD,              717, 3, },
        { xi.item.ROD,                   2758, 3, },
        { xi.item.BRONZE_MACE,            195, 3, },
        { xi.item.MACE,                  5041, 3, },
        { xi.item.BRONZE_AXE,             328, 3, },
        { xi.item.RUSTY_GREATSWORD,       416, 3, },
        { xi.item.CLAYMORE,              2828, 3, },
        { xi.item.MYTHRIL_CLAYMORE,     43680, 3, },
        { xi.item.HARPOON,                389, 3, },
        { xi.item.BRONZE_SPEAR,           915, 3, },
        { xi.item.BRASS_SPEAR,           5408, 3, },
        { xi.item.SPEAR,                18345, 3, },
        { xi.item.LANCE,                19156, 3, },
    }

    player:printToPlayer('These ranged weapons meet Royal Armory standards for initial training. Careless use reflects poorly on you.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.lowTierRanged, xi.fameArea.SANDORIA)
end

return entity
