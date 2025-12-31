-----------------------------------
-- Area: Ranguemont Pass
--  Mob: OOE Goblins
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Bear Grylls', true)
end

return entity
