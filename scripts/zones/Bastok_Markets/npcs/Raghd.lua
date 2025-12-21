-----------------------------------
-- Area: Bastok Markets
--  NPC: Raghd
-- !pos -149.200 -4.819 -74.939 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.RED_ROCK,          2800, 3 },
        { xi.item.BLUE_ROCK,         2800, 3 },
        { xi.item.YELLOW_ROCK,       2800, 3 },
        { xi.item.GREEN_ROCK,        2800, 3 },
        { xi.item.TRANSLUCENT_ROCK,  2800, 3 },
        { xi.item.PURPLE_ROCK,       2800, 3 },
        { xi.item.BLACK_ROCK,        2800, 3 },
        { xi.item.WHITE_ROCK,        2800, 3 },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MARKETS].text.RAGHD_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
