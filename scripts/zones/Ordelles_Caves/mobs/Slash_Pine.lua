-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Slash Pine
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Slash Pine', true)
end


entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 658, 2, xi.regime.type.GROUNDS)
end

return entity
