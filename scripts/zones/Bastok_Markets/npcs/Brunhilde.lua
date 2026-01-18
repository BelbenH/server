-----------------------------------
-- Area: Bastok Markets
--  NPC: Brunhilde
-- !pos -305.775 -10.319 -152.173 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BRONZE_CAP,               176, 3 },
        { xi.item.FACEGUARD,               1522, 3 },
        { xi.item.BRASS_MASK,             13440, 3 },
        { xi.item.SALLET,                 33453, 3 },
        { xi.item.MYTHRIL_SALLET,         59109, 3 },
        { xi.item.BRONZE_HARNESS,           268, 3 },
        { xi.item.SCALE_MAIL,              2341, 3 },
        { xi.item.BRASS_SCALE_MAIL,       20462, 3 },
        { xi.item.BREASTPLATE,            51105, 3 },
        { xi.item.BRONZE_MITTENS,           147, 3 },
        { xi.item.SCALE_FINGER_GAUNTLETS,  1249, 3 },
        { xi.item.BRASS_FINGER_GAUNTLETS, 10886, 3 },
        { xi.item.GAUNTLETS,              26956, 3 },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MARKETS].text.BRUNHILDE_SHOP_DIALOG)
    xi.shop.general(player, xi.shop.phalanxShops.lowTierMeleeArmor, xi.fameArea.BASTOK)
end

return entity
