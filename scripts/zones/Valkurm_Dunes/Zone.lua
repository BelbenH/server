-----------------------------------
-- Zone: Valkurm_Dunes (103)
-----------------------------------
local ID = zones[xi.zone.VALKURM_DUNES]
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.conquest.setRegionalConquestOverseers(zone:getRegionID())
    xi.mogTablet.onZoneInitialize(zone)

    local qm2 = GetNPCByID(ID.npc.WHM_AF1_QM)
    if qm2 then
        local time = VanadielHour()
        if time < 5 or time >= 18 then
            qm2:setStatus(xi.status.NORMAL)
        else
            qm2:setStatus(xi.status.DISAPPEAR)
        end
    end
end

zoneObject.onZoneTick = function(zone)
    xi.mogTablet.onZoneTick(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(60.989, -4.898, -151.001, 198)
    end

    -- AMK06/AMK07
    if xi.settings.main.ENABLE_AMK == 1 then
        xi.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    xi.chocoboGame.handleMessage(player)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onGameHour = function(zone)
    local qm2 = GetNPCByID(ID.npc.WHM_AF1_QM)

    if qm2 then
        if VanadielHour() == 5 then
            qm2:setStatus(xi.status.DISAPPEAR)
        end

        if VanadielHour() == 18 then
            qm2:setStatus(xi.status.NORMAL)
        end
    end

    local weather = zone:getWeather()
    
    if weather == xi.weather.NONE or weather == xi.weather.SUNSHINE then
        local fireChance = math.random(1, 100)
    
        if fireChance < 5 then
            -- zone:setWeather(xi.weather.HEAT_WAVE)
        elseif fireChance < 20 then
            -- zone:setWeather(xi.weather.HOT_SPELL)
        end
    end
end

zoneObject.onZoneWeatherChange = function(weather)
    local qm1 = GetNPCByID(ID.npc.SUNSAND_QM) -- Quest: An Empty Vessel

    if qm1 then
        if weather == xi.weather.DUST_STORM then
            qm1:setStatus(xi.status.NORMAL)
        else
            qm1:setStatus(xi.status.DISAPPEAR)
        end
    end
end

return zoneObject
