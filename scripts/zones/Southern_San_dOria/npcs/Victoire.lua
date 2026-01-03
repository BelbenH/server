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

    player:printToPlayer('If a cape distracts you more than it protects, you chose poorly.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('If something catches your eye, let me know.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.lowTierMisc, xi.fameArea.SANDORIA)
end

return entity
