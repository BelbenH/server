-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  ZNM: Cheese Hoarder Gigiroon
-- TODO: Running around mechanic and dropping bombs
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setRespawnTime(3600) -- Spawns 1 hour after server restart
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(75600, 77400)) -- 21 to 21.5 hours
end

return entity
