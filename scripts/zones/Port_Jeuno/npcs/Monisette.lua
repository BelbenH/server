-----------------------------------
-- Area: Port Jeuno
--  NPC: Monisette (Pal quest giver)
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.xispal.quest1(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
