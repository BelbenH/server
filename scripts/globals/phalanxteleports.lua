xi = xi or {}
xi.phalanxTeleports = xi.phalanxTeleports or {}

local moogleTeleCost = 500

local menu =
{
    title = 'Where would you like to go? ' .. moogleTeleCost .. 'g.',
    options = {},
}

local moogleTeleTable =
{
    {
        zoneID = xi.zone.NORTHERN_SAN_DORIA
        options =
        {
            'San d\'Oria',
            function(playerArg)
                local teleData = { x = 131.046, y = -0.199, z = -4.6613, rot = 160, zone = xi.zone.NORTHERN_SANDORIA }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.PORT_WINDURST
        options =
        {
            'Windurst',
            function(playerArg)
                local teleData = { x = 185.6, y = -12, z = 223.5, rot = 96, zone = xi.zone.PORT_WINDURST }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.BASTOK_MINES
        options =
        {
            'Bastok',
            function(playerArg)
                local teleData = { x = 76.82, y = 0, z = -66.12, rot = 232, zone = xi.zone.BASTOK_MINES }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.MHAURA
        options =
        {
            'Mhaura',
            function(playerArg)
                local teleData = { x = 2.87, y = -4, z = 71.95, rot = 0, zone = xi.zone.MHAURA }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.SELBINA
        options =
        {
            'Selbina',
            function(playerArg)
                local teleData = { x = 14.67, y = -14.56, z = 66.69, rot = 96, zone = xi.zone.SELBINA }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.RULUDE_GARDENS
        options =
        {
            'Jeuno',
            function(playerArg)
                local teleData = { x = 48.95, y = 10, z = 71.26, rot = 192, zone = xi.zone.RULUDE_GARDENS }
                xi.phalanxTeleports.moogleTeleTo(playerArg, teleData)
            end,
        },
    },
}

xi.phalanxTeleports.moogleTeleTo = function(player, data)
    if xi.phalanxTeleports.gilCheck(player) then
        local moogle = GetNPCByID(player:getLocalVar('moogleID'))
        player:printToPlayer('Up, up, and away!', xi.msg.channel.SAY, 'Explorer Moogle')

        moogle:injectActionPacket(player:getID(), 4, 261, 0, 0, 0, 10, 1) -- Warp Animation

        player:timer(3000, function(playerArg)
            playerArg:setPos(data.x, data.y, data.z, data.rot, data.zone)
        end)
    else
        return player:printToPlayer('I\'m sorry-upo, but you can\'t afford my services, kupo....', xi.msg.channel.SAY, 'Explorer Moogle')
    end
end

xi.phalanxTeleports.gilCheck = function(player, cost)
    if player:getGil() >= cost then
        player:delGil(cost)
    end
end

xi.phalanxTeleports.moogleTrigger = function(player, npc)
    local playerZoneID = player:getZoneID()
    player:printToPlayer('WHAT I SAY WHEN YOU CLICK ON ME GOES HERE.', xi.msg.channel.SAY, 'Explorer Moogle')

    for _, zoneData in pairs(moogleTeleTable) do
        if playerZoneID ~= zoneData.zoneID then
            table.insert(menu.options, zoneData.options)
        end
    end

    player:setLLocalVar('moogleID', npc:getID())
    xi.xisp.sendMenu(player, menu)
end

xi.phalanxTeleports.spawnMoogle = function(zone, pos)
    local moog = zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = 'Explorer Moogle',
        look      = 1418,
        x         = pos.x,
        y         = pos.y,
        z         = pos.z,
        rotation  = pos.z,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.phalanxTeleports.moogleTrigger(player, npc)
        end,
    })

    moog:setStatus(xi.status.NORMAL)
end