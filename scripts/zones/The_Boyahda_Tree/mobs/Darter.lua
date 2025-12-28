-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Darter
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Darter', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 724, 2, xi.regime.type.GROUNDS)
end

return entity
