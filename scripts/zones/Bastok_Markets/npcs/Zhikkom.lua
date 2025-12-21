-----------------------------------
-- Area: Bastok Markets
--  NPC: Zhikkom
-- !pos -288.669 -10.319 -135.064 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.RUSTY_GREATSWORD,      416, 3, },
        { xi.item.CLAYMORE,             2828, 3, },
        { xi.item.MYTHRIL_CLAYMORE,    43680, 3, },
        { xi.item.BRONZE_SWORD,          281, 3, },
        { xi.item.IRON_SWORD,           8316, 3, },
        { xi.item.MYTHRIL_SWORD,       35776, 3, },
        { xi.item.BROADSWORD,          24344, 3, },
        { xi.item.DEGEN,               10735, 3, },
        { xi.item.TUCK,                13391, 3, },
        { xi.item.SAPARA,                814, 3, },
        { xi.item.SCIMITAR,             4751, 3, },
        { xi.item.FALCHION,            70720, 3, },
        { xi.item.XIPHOS,                705, 3, },
        { xi.item.SPATHA,               1953, 3, },
        { xi.item.BILBO,                3669, 3, },
        { xi.item.HARPOON,               389, 3, },
        { xi.item.BRONZE_SPEAR,          915, 3, },
        { xi.item.BRASS_SPEAR,          5408, 3, },
        { xi.item.SPEAR,               18345, 3, },
        { xi.item.LANCE,               19156, 3, },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MARKETS].text.ZHIKKOM_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
