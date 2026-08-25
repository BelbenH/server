-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Argus
-----------------------------------
local ID = zones[xi.zone.MAZE_OF_SHAKHRAMI]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.spawnPoints =
{
    { x = 220.112, y = 18.762, z =  -63.954 },
    { x = 241.938, y = 20.000, z =  -74.946 },
    { x = 228.487, y = 19.971, z =  -92.704 },
    { x = 221.185, y = 20.000, z = -112.845 },
    { x = 246.046, y = 19.971, z =  -83.494 }
}
entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    local respawnTime = math.random(64800, 108000) -- 18 - 30 hours
    SetServerVariable("LeechKing_Argus_Respawn", GetSystemTime() + respawnTime)

    if math.random(1, 100) <= 50 then
        DisallowRespawn(ID.mob.LEECH_KING, true)
        DisallowRespawn(ID.mob.ARGUS, false)
        xi.mob.updateNMSpawnPoint(ID.mob.ARGUS)
        GetMobByID(ID.mob.ARGUS):setRespawnTime(respawnTime)
    else
        DisallowRespawn(ID.mob.ARGUS, true)
        DisallowRespawn(ID.mob.LEECH_KING, false)
        xi.mob.updateNMSpawnPoint(ID.mob.LEECH_KING)
        GetMobByID(ID.mob.LEECH_KING):setRespawnTime(respawnTime)
    end
end

return entity
