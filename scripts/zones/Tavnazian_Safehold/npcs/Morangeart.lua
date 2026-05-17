-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Morangeart
-- Type: ENM Quest Activator
-- !pos -74.308 -24.782 -28.475 26
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
-----------------------------------
local entity = {}

local menu =
{
    title = 'What do you say?',
    options = {},
}
local dialogue =
{
    {
        'Take me there.',
        function(playerArg)
            
            local npc = GetNPCByID(16883835)
            
            if npc then
                npc:injectActionPacket(playerArg:getID(), 4, 261, 0, 0, 0, 10, 1) -- Warp Animation
                
                playerArg:timer(3000, function(playerArg1)
                    playerArg1:delGil(3500)
                    playerArg1:setPos(0, 0, 0, 0, 31)
                end)
            end
        end,
    },

    {
        'I\'m not ready.',
        function(playerArg)
        end,
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local cd = player:getCharVar("[ENM]MonarchBeard")
    
    if player:hasKeyItem(xi.ki.MONARCH_BEARD) and player:getGil() >= 3500 then
        player:printToPlayer('I see you\'re prepared to face the darkness...', xi.msg.channel.SAY, npc:getName())
        npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
        
        player:timer(2000, function(playerArg)
            playerArg:printToPlayer('I can send you to Monarch Linn for 3500 gil.', xi.msg.channel.SAY, npc:getName())
            menu.options = dialogue
            xi.xisp.sendMenu(playerArg, menu)
        end)

    elseif
        player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.AN_ETERNAL_MELODY and
        cd < VanadielTime()
    then
        if player:hasKeyItem(xi.ki.MONARCH_BEARD) then
            player:startEvent(520)
        else
            player:startEvent(521)
        end
    elseif player:hasKeyItem(xi.ki.MONARCH_LINN_PATROL_PERMIT) and player:getGil() >= 3500 then
        player:printToPlayer('I see you\'re prepared to face the darkness...', xi.msg.channel.SAY, npc:getName())
        npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
        
        player:timer(2000, function(playerArg)
            playerArg:printToPlayer('I can send you to Monarch Linn for 3500 gil.', xi.msg.channel.SAY, npc:getName())
            menu.options = dialogue
            xi.xisp.sendMenu(playerArg, menu)
        end)
    elseif
        player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.AN_ETERNAL_MELODY and
        cd > VanadielTime()
    then
        player:startEvent(522, cd)
    else
        player:startEvent(523)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 521 then
        player:addKeyItem(xi.ki.MONARCH_BEARD)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MONARCH_BEARD)
        player:setCharVar("[ENM]MonarchBeard", VanadielTime() + (xi.settings.main.ENM_COOLDOWN * 3600)) -- Current time + (ENM_COOLDOWN*1hr in seconds)
    end
end

return entity