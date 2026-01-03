-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Carautia
-- !pos 70 0 39 230
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.CIRCLET,                 200, 3, },
        { xi.item.COPPER_HAIRPIN,          185, 3, },
        { xi.item.BONE_HAIRPIN,            540, 3, },
        { xi.item.HEADGEAR,               2013, 3, },
        { xi.item.BRASS_HAIRPIN,          1295, 3, },
        { xi.item.PILGRIM_TUNICA,         7777, 3, },
        { xi.item.ROBE,                    300, 3, },
        { xi.item.TUNIC,                  1400, 3, },
        { xi.item.DOUBLET,                2854, 3, },
        { xi.item.GLOVES,                 1575, 3, },
        { xi.item.CUFFS,                   165, 3, },
        { xi.item.MITTS,                   655, 3, },
        { xi.item.SLOPS,                   240, 3, },
        { xi.item.BRAIS,                  2194, 3, },
        { xi.item.ASH_CLOGS,               155, 3, },
        { xi.item.GAITERS,                1466, 3, },
    }

    player:printToPlayer('Basic magic armor, taught by Master Nyelbert\'s principles, start here.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('If you\'re looking for higher tier armors, you must speak with Graine in Mhaura or Falgima in Selbina.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.lowTierMageArmor, xi.fameArea.SANDORIA)
end

return entity
