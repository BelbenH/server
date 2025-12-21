-----------------------------------
-- Area: Bastok Mines
--  NPC: Deegis
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BRONZE_CAP,        176, 3 },
        { xi.item.BRASS_CAP,        1716, 3 },
        { xi.item.PADDED_CAP,      21216, 3 },
        { xi.item.LEATHER_BANDANA,   462, 3 },
        { xi.item.IRON_MASK,       10670, 3 },
        { xi.item.BRONZE_HARNESS,    268, 3 },
        { xi.item.BRASS_HARNESS,    2609, 3 },
        { xi.item.PADDED_ARMOR,    32747, 3 },
        { xi.item.LEATHER_VEST,      705, 3 },
        { xi.item.CHAINMAIL,       16632, 3 },
        { xi.item.BRONZE_MITTENS,    147, 3 },
        { xi.item.BRASS_MITTENS,    1433, 3 },
        { xi.item.IRON_MITTENS,    17971, 3 },
        { xi.item.LEATHER_GLOVES,    378, 3 },
        { xi.item.CHAIN_MITTENS,    8883, 3 },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MINES].text.DEEGIS_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
