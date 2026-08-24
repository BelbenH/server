------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.BRD
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.LOWER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.mageGearSets[job][2])
local sandyTable = table[xi.zone.SOUTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.mageGearSets[job][2])

local songNames =
{
    [1] = 'ballads',
    [2] = 'madrigals',
    [3] = 'minuets',
    [4] = 'marches',
    [5] = 'paeons',
    [6] = 'minnes',
}

local menuInvite =
{
    title = 'You need me to come with you?',
    options = 
    {
        {
            'Please do.',
            function(player)
                xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.BRD])
                player:printToPlayer('Okay! Where are we going?', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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
    title = 'What can I do for you?',
    options = 
    {
        {
            'Let\'s talk music.',
            function(player)
                xi.xisp.sendMenu(player, bardMenu1)
            end,
        },
        {
            'Stay here for a while.',
            function(player)
                player:printToPlayer("Aww! No fun. Bye-bye!", xi.msg.channel.PARTY, table[player:getZoneID()].name)
                return
            end,
        },
    },
}

local bardMenu1 =
{
    title = 'Which songs should I sing?',
    options = 
    {
        {
            'Ballads.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 1)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
        {
            'Madrigals.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 2)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
        {
            'Minuets.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 3)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
        {
            'Marches.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 4)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
        {
            'Paeons.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 5)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
        {
            'Minnes.',
            function(player)
                player:setCharVar('[XISP]bardSongs1', 6)
                xi.xisp.sendMenu(player, bardMenu2)
            end,
        },
    },
}

local bardMenu2 =
{
    title = 'Got it. Anything else?',
    options = 
    {
        {
            'Ballads.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 1)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Madrigals.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 2)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Minuets.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 3)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Marches.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 4)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Paeons.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 5)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
        {
            'Minnes.',
            function(player)
                player:setCharVar('[XISP]bardSongs2', 6)
                player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
            end,
        },
    },
}

xi.xispal.onBardInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.LOWER_JEUNO then
        palLook  = jeunoLook
        palTable = jeunoTable
    elseif zoneID == xi.zone.SOUTHERN_SAN_DORIA then
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
            xi.xispal.onBardTrigger(player, npc)
        end,
    })
end

xi.xispal.onBardTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if xi.xispal.checkMageRequirements(player, true, table) then
        -- Currently in party
        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == job then
            player:printToPlayer('Yes, ' .. player:getName() .. '? Care to hear a paeon while you rest?', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has mage, but this one isn't in party, or we need to recruit
        elseif
            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= job) or
            hasMage == 0
        then
            player:printToPlayer('An adventurer! What are you doing here?', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.JOY, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Shouldn't be reached. But a fail-safe
            player:printToPlayer('Good day, '.. player:getName() .. '. Please come back later, I am busy.', xi.msg.channel.SAY, npc:getPacketName())
        end
    else
        player:printToPlayer('Care to hear a ballad? My performance is just about to start!', xi.msg.channel.SAY, npc:getPacketName())
    end
end

