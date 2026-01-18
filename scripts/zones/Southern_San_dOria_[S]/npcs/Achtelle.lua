-----------------------------------
-- Area: Southern Sand'Oria [S]
--  NPC: Achtelle 
-- Type: Dragon Watcher
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.dragon.onTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
