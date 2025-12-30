-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ore Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Ore Eater', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 681, 1, xi.regime.type.GROUNDS)
end

return entity
