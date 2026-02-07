-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Lividroot Amooshah(ZNM T2))
-- !pos 334 -10 184 52
-----------------------------------
local ID = zones[xi.zone.BHAFLAU_THICKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.item.CHAMROSHS_BEAK) and
        npcUtil.popFromQM(player, npc, ID.mob.LIVIDROOT_AMOOSHAH)
    then
        player:confirmTrade()
        player:messageSpecial(ID.text.DRAWS_NEAR)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.BLOOD_STAINS)
end

return entity
