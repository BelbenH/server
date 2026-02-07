-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Chigre
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}
-- Todo: add enailments, Drain samba on target if all ailments on, very fast enmity decay, capture speed

entity.onMobInitialize = function(mob)
    -- mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setRespawnTime(3600) -- Spawns 1 hour after server restart
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
    mob:addImmunity(xi.immunity.GRAVITY)
    mob:addImmunity(xi.immunity.BIND)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(75600, 77400)) -- 21 to 21.5 hours
end

return entity
