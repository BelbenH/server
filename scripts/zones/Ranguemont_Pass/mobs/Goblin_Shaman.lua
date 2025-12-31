-----------------------------------
-- Area: Ranguemont Pass
--  Mob: OOE Goblins
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Goblin Shaman', true)
end

return entity
