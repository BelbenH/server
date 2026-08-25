-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Miogique
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.BRONZE_CAP,        168, 3, },
        { xi.item.BRASS_CAP,        1635, 3, },
        { xi.item.LEATHER_BANDANA,   440, 3, },
        { xi.item.STUDDED_BANDANA, 14326, 2, },
        { xi.item.IRON_MASK,       10260, 1, },
        { xi.item.BRONZE_HARNESS,    256, 3, },
        { xi.item.BRASS_HARNESS,    2485, 3, },
        { xi.item.LEATHER_VEST,      672, 3, },
        { xi.item.STUDDED_VEST,    22800, 2, },
        { xi.item.CHAINMAIL,       15840, 1, },
        { xi.item.BRONZE_MITTENS,    140, 3, },
        { xi.item.BRASS_MITTENS,    1365, 3, },
        { xi.item.LEATHER_GLOVES,    360, 3, },
        { xi.item.STUDDED_GLOVES,  11970, 2, },
        { xi.item.CHAIN_MITTENS,    8460, 1, },
        { xi.item.GAUNTLETS,       25920, 1, },
    }

    player:printToPlayer('It will not save you from recklessness, but it will protect you if worn properly.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('Take a look.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.lowTierMeleeArmor, xi.fameArea.SANDORIA)
end

return entity
