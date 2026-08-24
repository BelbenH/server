------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.BLM
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.LOWER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.mageGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.mageGearSets[job][2])
local windyTable = table[xi.zone.PORT_WINDURST]
local windyLook  = xi.xispal.generateModelID(xi.xispal.face[windyTable.face], xi.xispal.race[windyTable.race], xi.xispal.mageGearSets[job][2])

local menuInvite =
{
    title = 'Are you in need?',
    options = 
    {
        {
            'Let\'s go.',
            function(player)
                xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.BLM])
                player:printToPlayer('Very well. Let us be on our way.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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

local menuDismiss =
{
    title = 'Can I tend to personal matters?',
    options = 
    {
        {
            'Take care.',
            function(player)
                player:printToPlayer('Don\'t tell the ministry about our adventures!', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                xi.xispal.removeMage(player)
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

xi.xispal.onBlackMageInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.LOWER_JEUNO then
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
            xi.xispal.onBlackMageTrigger(player, npc)
        end,
    })
end

xi.xispal.onBlackMageTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if xi.xispal.checkMageRequirements(player, false, table) then
        -- Currently in party
        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == job then
            player:printToPlayer('Yes, ' .. player:getName() .. '?', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has mage, but this one isn't in party, or we need to recruit
        elseif
            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= job) or
            hasMage == 0
        then
            player:printToPlayer('Would you, by chance, require a sorcerer of the dark arts?', xi.msg.channel.SAY,  npc:getPacketName())
            npc:sendEmote(player, xi.emote.WAVE, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)

        else -- Shouldn't be reached. But a fail-safe
            player:printToPlayer('Good day, adventurer. Please come back later, I am busy.', xi.msg.channel.SAY,  npc:getPacketName())
        end
    else
        player:printToPlayer('Shantotto will have my head when I get back to the ministry!', xi.msg.channel.SAY,  npc:getPacketName())
        npc:sendEmote(player, xi.emote.SIGH, xi.emoteMode.MOTION, false)
    end
end

