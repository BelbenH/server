-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Seeker Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Seeker Bats', true)
end

return entity
