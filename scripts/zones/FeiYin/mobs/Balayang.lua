-----------------------------------
-- Area: Fei'Yin
--  Mob: Balayang
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Vampire Bat', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 717, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 718, 1, xi.regime.type.GROUNDS)
end

return entity
