-----------------------------------
-- Area: Mhaura
--  NPC: Zhon Kihshimo
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:printToPlayer('Welcome to the Sailorrr\'s Stay! \nIf you need armor or shields, we got those! Just speak with Graine inside and she\'ll show you our wares.', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('If you\'re in need of weapons, speak with Runito-Monito at the counter! He\'s got the meanest weapons this side of the Bastore Sea!', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('If it\'s a hot meal you\'re after, speak with Take, best cook this side of the Bastore Sea!', xi.msg.channel.SAY, npc:getName())
    player:printToPlayer('Enjoy your stay friend!', xi.msg.channel.SAY, npc:getName())
end

return entity
