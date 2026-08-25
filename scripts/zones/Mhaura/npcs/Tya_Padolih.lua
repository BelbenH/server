-----------------------------------
-- Area: Mhaura
--  NPC: Tya Padolih
-- !pos -48 -4 30 249
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_REGEN,       4320 },
        { xi.item.SCROLL_OF_REGEN_II,    7830 },
        { xi.item.SCROLL_OF_SLEEPGA,    11200 },
        { xi.item.SCROLL_OF_BARAMNESIA, 30240 },
        { xi.item.SCROLL_OF_BARAMNESRA, 30240 },
        { xi.item.SCROLL_OF_INVISIBLE,   5754 },
        { xi.item.SCROLL_OF_SNEAK,       2500 },
        { xi.item.SCROLL_OF_DEODORIZE,   1295 },
        { xi.item.SCROLL_OF_DISTRACT,   19600 },
        { xi.item.SCROLL_OF_FRAZZLE,    27216 },
    }

    player:printToPlayer('I sell tools, not excuses. If you fail... that part is free.', xi.msg.channel.SAY, npc:getName())
    xi.shop.general(player, xi.shop.phalanxShops.ninjaEssentials, xi.fameArea.WINDURST)
end

return entity
