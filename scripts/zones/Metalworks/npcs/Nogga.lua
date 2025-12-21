-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BOMB_ARM,                    787, 3 },
        { xi.item.GRENADE,                    1264, 3 },
        { xi.item.QUAKE_GRENADE,             11599, 3 },
        { xi.item.FLASQUE_OF_CATALYTIC_OIL,    105, 3 },
        { xi.item.PINCH_OF_SOOT,               661, 3 },
    }

    player:showText(npc, zones[xi.zone.METALWORKS].text.NOGGA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
