------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.SAM
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.LOWER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.knightGearSets[job][2])
local sandyTable = table[xi.zone.SOUTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.knightGearSets[job][2])

local menuInvite =
{
    title = 'You need me?',
    options = 
    {
        {
            'I do.',
            function(player)
                xi.xispal.setKnight(player, table)
                player:printToPlayer('Very well. Let us press onward.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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
    title = 'Can I get back to drinking?',
    options = 
    {
        {
            'Let\'s talk battle.',
            function(player)
                xi.xisp.sendMenu(player, roleMenu)
            end,
        },
        {
            'Take your fill!',
            function(player)
                player:printToPlayer('Aye. Take care.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                xi.xispal.removeKnight(player)
            end,
        },
    },
}

local roleMenu =
{
    title = 'Should I tank, or deal damage?',
    options = 
    {
        {
            'Try to maintain enmity.',
            function(player)
                player:setCharVar('[XISP]SamuraiTankMode', 1)
                player:printToPlayer("Very well. You best have a healer!", xi.msg.channel.PARTY, jeunoTable.name)
                return
            end,
        },
        {
            'Focus on dealing damage.',
            function(player)
                player:setCharVar('[XISP]SamuraiTankMode', 0)
                player:printToPlayer('Then I had better sharpen my blade.', xi.msg.channel.PARTY, jeunoTable.name)
                return
            end,
        },
    },
}

-- Yamagi (XISP)
xi.xispal.onSamuraiInitialize = function(zone)
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
            xi.xispal.onSamuraiTrigger(player, npc)
        end,
    })
end

xi.xispal.onSamuraiTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if xi.xispal.checkKnightRequirements(player, true, table) then
        -- Currently in party
        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == job then
            player:printToPlayer('What is it, ' .. player:getName() .. '? Come to have a drink?', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.LAUGH, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has knight, but this one isn't in party, or we need to recruit
        elseif
            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= job) or
            hasKnight == 0
        then
            player:printToPlayer('' .. player:getName() .. '! Come have a nice cold Tavnazian ale.', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.WELCOME, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Shouldn't be reached. But a fail-safe
            player:printToPlayer('Good day, ' .. player:getName() .. '. Please come back later. I must attend to my duties.', xi.msg.channel.SAY, npc:getPacketName())
        end
    else
        player:printToPlayer('Do I know you? Sorry, but leave me be.', xi.msg.channel.SAY, npc:getPacketName())
    end
end