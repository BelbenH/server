-----------------------------------
-- Area: La Theine Plateau
--  Mob: Steppe Hare
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 5, 1, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
