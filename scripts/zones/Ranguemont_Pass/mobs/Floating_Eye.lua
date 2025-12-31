-----------------------------------
-- Area: Ranguemont Pass
--  Mob: OOE mob
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Floating Eye', true)
end

return entity
