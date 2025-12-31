-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Dire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Dire Bat', true)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 631, 1, xi.regime.type.GROUNDS)
end

return entity
