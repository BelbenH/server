xi = xi or {}
xi.xispteleport = xi.xispteleport or {}

local frogTeleCost = 500

local menu =
{
    title = 'Where does your path lead? Cost: ' .. frogTeleCost .. 'g.',
    options = {},
}

local frogTeleTable =
{
    {
        zoneID = xi.zone.NORTHERN_SAN_DORIA,
        options =
        {
            'San d\'Oria',
            function(playerArg)
                local teleData = { x = -230.898, y = 8, z = 13.7368, rot = 255, zone = xi.zone.NORTHERN_SAN_DORIA }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.PORT_WINDURST,
        options =
        {
            'Windurst',
            function(playerArg)
                local teleData = { x = -224.533, y = -8, z = 199.853, rot = 2, zone = xi.zone.PORT_WINDURST }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.BASTOK_MINES,
        options =
        {
            'Bastok',
            function(playerArg)
                local teleData = { x = 76.82, y = 0, z = -66.12, rot = 232, zone = xi.zone.BASTOK_MINES }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.MHAURA,
        options =
        {
            'Mhaura',
            function(playerArg)
                local teleData = { x = 2.87, y = -4, z = 71.95, rot = 0, zone = xi.zone.MHAURA }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.SELBINA,
        options =
        {
            'Selbina',
            function(playerArg)
                local teleData = { x = 14.67, y = -14.56, z = 66.69, rot = 96, zone = xi.zone.SELBINA }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },

    {
        zoneID = xi.zone.RULUDE_GARDENS,
        options =
        {
            'Jeuno',
            function(playerArg)
                local teleData = { x = -0.0377164, y = 9, z = -28.4753, rot = 64, zone = xi.zone.RULUDE_GARDENS }
                xi.xispteleport.frogTeleTo(playerArg, teleData)
            end,
        },
    },
}

xi.xispteleport.frogTeleTo = function(player, data)
    if xi.xispteleport.gilCheck(player, frogTeleCost) then
        local frog = GetNPCByID(player:getLocalVar('frogID'))
        player:printToPlayer('Off you go.', xi.msg.channel.SAY, 'Vivi\'s Disciple')

        if frog then
            frog:injectActionPacket(player:getID(), 4, 261, 0, 0, 0, 10, 1) -- Warp Animation

            player:timer(3000, function(playerArg)
                playerArg:setPos(data.x, data.y, data.z, data.rot, data.zone)
            end)
        end
    else
        return player:printToPlayer('Come back when you have the proper coin.', xi.msg.channel.SAY, 'Vivi\'s Disciple')
    end
end

xi.xispteleport.gilCheck = function(player, cost)
    if player:getGil() >= cost then
        player:delGil(cost)

        return true
    end

    return false
end

xi.xispteleport.frogTrigger = function(player, npc)
    local playerZoneID = player:getZoneID()
    player:printToPlayer('By the grace of Vivi, I will move your spirit throughout this realm.', xi.msg.channel.SAY, 'Vivi\'s Disciple')
    menu.options = {}

    for _, zoneData in pairs(frogTeleTable) do
        if playerZoneID ~= zoneData.zoneID then
            table.insert(menu.options, zoneData.options)
        end
    end

    player:setLocalVar('frogID', npc:getID())
    xi.xisp.sendMenu(player, menu)
end

xi.xispteleport.spawnFrog = function(zone, pos)
    local frog = zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = 'Vivi\'s Disciple',
        look      = 1811,
        x         = pos.x,
        y         = pos.y,
        z         = pos.z,
        rotation  = pos.rot,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispteleport.frogTrigger(player, npc)
        end,
    })

    frog:setStatus(xi.status.NORMAL)
end
