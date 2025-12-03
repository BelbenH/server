-----------------------------------
-- Area: West Ronfaure
--  Mob: Wild Rabbit
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob)
    -- Set respawn time in **seconds**
    mob:setRespawnTime(30)  -- 30 seconds respawn.
end

return entity
