-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Wivre
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity('Wivre', true)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
