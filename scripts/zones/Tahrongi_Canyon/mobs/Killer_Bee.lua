-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Killer Bee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 30, 2, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 95, 2, xi.regime.type.FIELDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
