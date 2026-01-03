-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arachagnon
-----------------------------------
local ID = zones[xi.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.ELVAAN_JERKIN,      312, },
        { xi.item.ELVAAN_BODICE,      312, },
        { xi.item.ELVAAN_GLOVES,      187, },
        { xi.item.ELVAAN_GAUNTLETS,   187, },
        { xi.item.ELVAAN_M_CHAUSSES,  270, },
        { xi.item.ELVAAN_F_CHAUSSES,  270, },
        { xi.item.ELVAAN_M_LEDELSENS, 187, },
        { xi.item.ELVAAN_F_LEDELSENS, 187, },
    }

    player:printToPlayer('I offer standard adventurer-issue armor for beginners, as well as equipment befitting the Elvaan.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('Our race values strength and discipline, and this RSE reflects that. Choose carefully-no refunds are given.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.customArachagnonShop, xi.fameArea.SANDORIA)
end

return entity
