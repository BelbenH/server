xi = xi or {}
xi.elementals = xi.elementals or {}

xi.elementals.spawnChart =
{
    [xi.zone.EASTERN_ALTEPA_DESERT] =
    {
        minLevel = 52,
        maxLevel = 56,
        posTable =
        {
            { x = 0, y = 0, z = 0, },
            { x = 0, y = 0, z = 0, },
            { x = 0, y = 0, z = 0, },
        },
    }
}

xi.elementals.spawnElemental = function(zone, index)
    local table = xi.elementals.spawnChart[zone:getID()]

    if not table then
        return
    end

    local pos = table.posTable[index]

    if not pos then
        pos = table.posTable[1]
    end

    local elemental = zone:insertDynamicEntity({
            objtype               = xi.objType.MOB,
            allegiance            = xi.allegiance.PLAYER,
            name                  = 'Fire Elemental',
            x                     = pos.x,
            y                     = pos.y,
            z                     = pos.z,
            rotation              = 0 + math.random(0, 360),
            minLevel              = table.minLevel,
            maxLevel              = table.maxLevel,
            look                  = 0,
            groupId               = 101,
            groupZoneId           = xi.zone.GM_HOME,
            releaseIdOnDisappear  = true,

            onMobSpawn = function(elemental)
                elemental:setLocalVar('[XISP]zoneIndex', index)
            end,

            onMobRoam = function(elemental)
                local weather = elemental:getZone():getWeather()

                if weather == xi.weather.SAND_STORM or weather == xi.weather.DUST_STORM then
                    DespawnMob(elemental:getID())
                end
            end,

            onMobDespawn = function(elemental)
                local zone = elemental:getZone()
                zone:setLocalVar('[XISP]respawnTimer' .. elemental:getLocalVar('[XISP]zoneIndex'), GetSystemTime() + 900) -- 15 minute respawn timer
            end,
        })

        elemental:setSpawn(pos.x + 1, pos.y, pos.z - 1)
        elemental:spawn()
end

xi.elementals.checkSpawn = function(zone)
    local weather = zone:getWeather()

    if weather == xi.weather.SAND_STORM or weather == xi.weather.DUST_STORM then
        return
    end

    -- Loop through all possible elementals in the defined zone
    for index = 1, #xi.elementals.spawnChart[zone:getID()].posTable, 1 do
        if zone:getLocalVar('[XISP]respawnTimer' .. index) < GetSystemTime() then
            xi.elementals.spawnElemental(zone, index)
        end
    end
end