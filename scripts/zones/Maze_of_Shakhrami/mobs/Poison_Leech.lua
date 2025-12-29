-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Poison Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Poison Leech', true)
end

return entity
