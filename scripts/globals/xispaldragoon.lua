------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.DRG
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.LOWER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.knightGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.knightGearSets[job][2])

local menuInvite =
{
    title = 'Shall I join your party?',
    options = 
    {
        {
        'Yes, please.',
            function(player)
                xi.xispal.setKnight(player, table)
                player:printToPlayer('Very well. Let us thwart our enemies!', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Let me think about it.',
            function(player)
                return
            end,
        },
    },
}

local menuDismiss =
{
    title = 'Shall I leave your party?',
    options =
    {
        {
            'Take care.',
            function(player)
                player:printToPlayer('Call on me should you ever need me.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                xi.xispal.removeKnight(player)
            end,
        },
        {
            'On second thought...',
            function(player)
                return
            end,
        },
    },
}

-- Emilien (XISP)
xi.xispal.onDragoonInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.LOWER_JEUNO then
        palLook  = jeunoLook
        palTable = jeunoTable
    elseif zoneID == xi.zone.NORTHERN_SAN_DORIA then
        palLook  = sandyLook
        palTable = sandyTable
    end

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = palTable.name,
        look      = palLook,
        x         = palTable.pos.x,
        y         = palTable.pos.y,
        z         = palTable.pos.z,
        rotation  = palTable.pos.rot,
        widescan  = 1,
    
        onTrigger  = function(player, npc)
            xi.xispal.onDragoonTrigger(player, npc)
        end,
    })
end

xi.xispal.onDragoonTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if xi.xispal.checkKnightRequirements(player, true, table) then
        -- Currently in party
        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == job then
            player:printToPlayer('Hail, ' .. player:getName() .. '. How am I to be of service?', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.SALUTE, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has knight, but this one isn't in party,  or we need to recruit
        elseif
            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= job) or
            hasKnight == 0
        then
            player:printToPlayer('Good day, ' .. player:getName() .. '. How can I be of service?', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.SALUTE, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Fail-safe
            player:printToPlayer('Good day, fellow adventurer. Please come back later. I must attend to my duties.', xi.msg.channel.SAY, npc:getPacketName())
        end
    else
        player:printToPlayer('Good day, adventurer. Please leave me be.', xi.msg.channel.SAY, npc:getPacketName())
    end
end
