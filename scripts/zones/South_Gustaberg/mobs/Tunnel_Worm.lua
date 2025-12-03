-----------------------------------
-- Area: South Gustaberg
--  Mob: Tunnel Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    -- Set respawn time in **seconds**
    mob:setRespawnTime(30)  -- 30 seconds on respawn.
end

return entity
