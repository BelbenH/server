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
    { x =  220.000, y =  18.800, z =  -64.000 },
    { x =  221.000, y =  20.000, z = -112.000 },
    { x =  244.000, y =  20.000, z =  -79.000 },
    { x =  272.000, y =  20.000, z =  -79.000 }
}
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
