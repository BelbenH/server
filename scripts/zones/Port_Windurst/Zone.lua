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
    local pos = { x = 116.440, y = 0, z = -8.460, rot = 160 } -- Correct Coordinates
    xi.phalanxTeleports.spawnNPC(zone, pos)
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
