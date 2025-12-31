-----------------------------------
--  Mob: Phalanx out of era mob
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Starmite', true)
end

return entity
