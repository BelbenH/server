-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Victoire
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.LAUAN_SHIELD,                 124, 3, },
        { xi.item.MAPLE_SHIELD,                 629, 3, },
        { xi.item.ASPIS,                        945, 3, },
        { xi.item.ETHER_TANK,                  6040, 3, },
        { xi.item.POTION_TANK,                 2926, 3, },
        { xi.item.APPLE_AU_LAIT_TANK,          3880, 3, },
        { xi.item.RABBIT_MANTLE,                220, 3, },
        { xi.item.CAPE,                         425, 3, },
        { xi.item.BLOOD_STONE,                  125, 3, },
        { xi.item.LEATHER_BELT,                 425, 3, },
        { xi.item.HEKO_OBI,                     495, 3, },
    }

    player:showText(npc, ID.text.CARAUTIA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

return entity
