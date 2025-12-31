-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Stygian Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Stygian Pugil', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 621, 2, xi.regime.type.GROUNDS)
end

return entity
