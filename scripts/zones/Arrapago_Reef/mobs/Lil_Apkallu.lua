-----------------------------------
-- Area: Arrapago Reef
--  ZNM: Lil Apkallu
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}
-- Todo: Apkallu hate, Hundred Fists, Movement and TP pattern

entity.onMobInitialize = function(mob)
    -- mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setRespawnTime(3600) -- Spawns 1 hour after server restart
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(75600, 77400)) -- 21 to 21.5 hours
end

return entity
