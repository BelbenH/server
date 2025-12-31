-----------------------------------
-- Area: Fei'Yin
--  Mob: Shadow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Shadow', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 712, 1, xi.regime.type.GROUNDS)
end

return entity
