-----------------------------------
-- Area: Quicksand Caves
--  Mob: Girtab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 818, 1, xi.regime.type.GROUNDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
