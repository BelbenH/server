-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Tyger(ZNM T4))
-- !pos -766 -12 632 79
-----------------------------------
local ID = zones[xi.zone.CAEDARVA_MIRE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.item.EXPERIMENTAL_LAMIAS_ARMBAND) and
        npcUtil.tradeHas(trade, xi.item.MAHJLAEFS_STAFF) and
        npcUtil.tradeHas(trade, xi.item.NUHNS_ESCA) and
        npcUtil.popFromQM(player, npc, ID.mob.TYGER)
    then
        player:confirmTrade()
        player:messageSpecial(ID.text.DRAWS_NEAR)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.STIFLING_STENCH)
end

return entity
