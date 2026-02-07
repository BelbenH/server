-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  Mob: Ob
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}
-- Todo: Pups can make it change frames, Overload causes Rage

entity.onMobInitialize = function(mob)
    -- mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addImmunity(xi.immunity.SILENCE)
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
