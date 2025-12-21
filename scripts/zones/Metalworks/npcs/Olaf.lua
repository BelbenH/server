-----------------------------------
-- Area: Metalworks
--  NPC: Olaf
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.MUSKETOON,                  7137, 3 }, -- (Phalanx) added.
        { xi.item.BANDITS_GUN,               34642, 3 }, -- (Phalanx) Replaced the Arquebus.
        { xi.item.MILITARY_GUN,              64642, 3 }, -- (Phalanx) added.
        { xi.item.BRONZE_BULLET,                29, 3 }, -- (Phalanx) added.
        { xi.item.TIN_BULLET,                   39, 3 }, -- (Phalanx) added.
        { xi.item.BULLET,                       93, 3 }, -- (Phalanx) Price change (original 105g ea.)
        { xi.item.IRON_BULLET,                 119, 3 }, -- (Phalanx) added.
        { xi.item.PLATINUM_BULLET,             159, 3 }, -- (Phalanx) added.
        { xi.item.PINCH_OF_BOMB_ASH,           540, 3 },
        { xi.item.JAR_OF_FIRESAND,            1060, 3 }, -- (Phalanx) added.
    }

    player:showText(npc, zones[xi.zone.METALWORKS].text.OLAF_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
