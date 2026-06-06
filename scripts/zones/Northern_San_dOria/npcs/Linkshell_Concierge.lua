-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Linkshell Concierge
-- !pos 76.260 0.000 9.700 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:printToPlayer('Welcome! As a new adventurer, you are being gifted a Linkshell to help you connect with others on your journey.', xi.msg.channel.NS_SAY, 'Linkshell Concierge')
    player:addLinkpearl('PhalanxRising', false)
end

return entity
