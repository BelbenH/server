-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Fonteloube
-- Phalanx: Used for renaming your chocobo
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.xispchocobo.onNameTrigger(player, npc)
end

return entity
