-----------------------------------
--  Mob: Phalanx out of era mob
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Scavenger Crab', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player)
end

return entity
