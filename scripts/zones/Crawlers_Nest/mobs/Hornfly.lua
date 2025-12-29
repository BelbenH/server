-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Hornfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Hornfly', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 690, 2, xi.regime.type.GROUNDS)
end

return entity
