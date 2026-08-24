------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.DRK
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.UPPER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.knightGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.knightGearSets[job][2])
local windyTable = table[xi.zone.PORT_WINDURST]
local windyLook  = xi.xispal.generateModelID(xi.xispal.face[windyTable.face], xi.xispal.race[windyTable.race], xi.xispal.knightGearSets[job][2])

local menuInvite =
{
    title = 'In need of a knight?',
    options = 
    {
        {
            'I am.',
            function(player)
                xi.xispal.setKnight(player, table)
                player:printToPlayer("Very well. I will meet you outside.", xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Not right now.',
            function(player)
                return
            end,
        },
    },
}

local menuDismiss =
{
    title = 'Can I get back to my post?',
    options = 
    {
        {
            'Yes, thank you.',
            function(player)
                player:printToPlayer("Of course. Be safe.", xi.msg.channel.PARTY, table[player:getZoneID()].name)
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

xi.xispal.onDarkKnightInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.UPPER_JEUNO then
        palLook  = jeunoLook
        palTable = jeunoTable
    elseif zoneID == xi.zone.NORTHERN_SAN_DORIA then
        palLook  = sandyLook
        palTable = sandyTable
        elseif zoneID == xi.zone.PORT_WINDURST then
        palLook  = windyLook
        palTable = windyTable
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
            xi.xispal.onDarkKnightTrigger(player, npc)
        end,
    })
end

xi.xispal.onDarkKnightTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if xi.xispal.checkKnightRequirements(player, true, table) then
        -- Currently in party
        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == job then
            player:printToPlayer('What is it, ' .. player:getName() .. '? What brings us to Jeuno?', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.HUH, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has knight, but this one isn't in party, or we need to recruit
        elseif
            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= job) or
            hasKnight == 0
        then
            player:printToPlayer('' .. player:getName() .. '? I trust there is no problem..', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.NO, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Shouldn't be reached. But a fail-safe
            player:printToPlayer('Good day, adventurer. Please come back later. I must attend to my duties.', xi.msg.channel.SAY, npc:getPacketName())
        end
    else
        player:printToPlayer('Do the Musketeers normally use scythes or blades alongside black magic?', xi.msg.channel.SAY, npc:getPacketName())
        npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
    end
end