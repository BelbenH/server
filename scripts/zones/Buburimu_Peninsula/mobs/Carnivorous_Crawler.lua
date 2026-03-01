-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Carnivorous Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 33, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 34, 2, xi.regime.type.FIELDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
