------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.THF
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.UPPER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.knightGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.knightGearSets[job][2])
local windyTable = table[xi.zone.PORT_WINDURST]
local windyLook  = xi.xispal.generateModelID(xi.xispal.face[windyTable.face], xi.xispal.race[windyTable.race], xi.xispal.knightGearSets[job][2])

local menuInvite =
{
    title = 'You need a thief or something?',
    options =
    {
        {
            'Unfortunately I do',
            function(player)
                xi.xispal.setKnight(player, table)
                player:printToPlayer('Let\'s get a move on!', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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
    title = 'You want me to scram?',
    options = 
    {
        {
            'See ya later!',
            function(player)
                player:printToPlayer('Fine! I was getting tired of you anyways.', table[player:getZoneID()].name)
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

-- Ayala (XISP)
xi.xispal.onThiefInitialize = function(zone)
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
            xi.xispal.onThiefTrigger(player, npc)
        end,
    })
end

xi.xispal.onThiefTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if xi.xispal.checkKnightRequirements(player, false, table) then
        -- Currently in party
        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == job then
            player:printToPlayer('Oh, ' .. player:getName() .. '! About the gil I owe you...', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has knight, but this one isn't in party, or we need to recruit
        elseif
            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= job) or
            hasKnight == 0
        then
            player:printToPlayer('Yes, adventurer? What are you looking at?', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.PANIC, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Shouldn't be reached. But a fail-safe
            player:printToPlayer('Scram, kid! I\'m trying to get a deal.', xi.msg.channel.SAY, npc:getPacketName())
        end
    else
        player:printToPlayer('Scram, kid! Can\'t you see I\'m doing something here? I\'m trying to get a deal.', xi.msg.channel.SAY, npc:getPacketName())
    end
end