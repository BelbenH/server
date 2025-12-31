-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Armet Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Armet Beetle', true)
end

return entity
