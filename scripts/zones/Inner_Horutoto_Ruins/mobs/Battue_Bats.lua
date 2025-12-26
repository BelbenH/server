-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Battue Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:renameEntity('Battue Bats', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 647, 1, xi.regime.type.GROUNDS)
end

return entity
