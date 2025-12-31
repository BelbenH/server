-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Thousand Eyes
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Thousand Eyes', true)
end

return entity
