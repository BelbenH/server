-----------------------------------
-- Area: La Theine Plateau
--  Mob: Thickshell
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 70, 2, xi.regime.type.FIELDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
