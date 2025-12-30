-----------------------------------
-- Area: Gusgen Mines
--  Mob: Sadfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Sadfly', true)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
