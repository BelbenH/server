-----------------------------------
-- Zone: Eastern_Altepa_Desert (114)
-----------------------------------
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.conquest.setRegionalConquestOverseers(zone:getRegionID())
    xi.chocobo.initZone(zone)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(260.09, 6.013, 320.454, 76)
    end

    -- AMK06/AMK07
    if xi.settings.main.ENABLE_AMK == 1 then
        xi.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zoneObject.onGameHour = function(zone)
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

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
