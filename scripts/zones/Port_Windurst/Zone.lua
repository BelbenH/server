-----------------------------------
-- Zone: Port_Windurst (240)
-----------------------------------
local ID = zones[xi.zone.PORT_WINDURST]
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.server.setExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    -- Phalanx custom tele
    local frogPos = { x = -218.925, y = -8.18, z = 221.79, rot = 64 }
    xi.xispteleport.spawnFrog(zone, frogPos)

    -- Phalanx Teleport Moogle
    local mooglePos = { x = -212.06, y = -8.1, z = 194.45, rot = 169 }
    xi.nomadmoogle.spawnMoogle(zone, mooglePos)
end

zoneObject.onZoneIn = function(player, prevZone)
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        if prevZone == xi.zone.WINDURST_JEUNO_AIRSHIP then
            player:setPos(228.000, -3.000, 76.000, 160)
            return 10004
        end
    end

    return xi.moghouse.onMoghouseZoneEvent(player, prevZone)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTransportEvent = function(player, prevZoneId, transportId)
    player:startEvent(10002)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 10002 then
        player:setPos(0, 0, 0, 0, 225)
    end
end

return zoneObject
