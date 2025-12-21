-----------------------------------
-- Area: Bastok Mines
--  NPC: Zemedars
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BRONZE_SUBLIGAR,     218, 3 },
        { xi.item.BRASS_SUBLIGAR,     2100, 3 },
        { xi.item.IRON_SUBLIGAR,     26357, 3 },
        { xi.item.LEATHER_TROUSERS,    562, 3 },
        { xi.item.LIZARD_TROUSERS,    5656, 3 },
        { xi.item.CHAIN_HOSE,        13230, 3 },
        { xi.item.BRONZE_LEGGINGS,     134, 3 },
        { xi.item.BRASS_LEGGINGS,     1302, 3 },
        { xi.item.LEGGINGS,          16373, 3 },
        { xi.item.LEATHER_HIGHBOOTS,   352, 3 },
        { xi.item.LIZARD_LEDELSENS,   3575, 3 },
        { xi.item.GREAVES,            8127, 3 },
        { xi.item.MAPLE_SHIELD,        635, 3 },
        { xi.item.LAUAN_SHIELD,        126, 3 },
        { xi.item.TARGE,             12642, 3 },
        { xi.item.BUCKLER,           35658, 3 },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MINES].text.ZEMEDARS_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
