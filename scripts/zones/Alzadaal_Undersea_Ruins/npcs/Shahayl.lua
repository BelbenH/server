-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Shahayl
-- Type: Assault
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local toauMission = player:getCurrentMission(xi.mission.log_id.TOAU)
    -- ASSAULT
    if toauMission >= xi.mission.id.toau.PRESIDENT_SALAHEEM then
        local IPpoint = player:getCurrency('imperial_standing')
        local Apoint  = player:getAssaultPoint(xi.assault.assaultArea.NYZUL_ISLE)

        if
            player:hasKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS) and
            not player:hasKeyItem(xi.ki.ASSAULT_ARMBAND)
        then
            player:startEvent(412, IPpoint, IPpoint, IPpoint, IPpoint)
        else
            player:startEvent(413)
        end

    -- DEFAULT DIALOG
    else
        player:startEvent(413)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    -- ASSAULT
    if csid == 412 and option == 1 then
        player:delCurrency('imperial_standing', 50)
        npcUtil.giveKeyItem(player, xi.ki.ASSAULT_ARMBAND)
    end
end

return entity
