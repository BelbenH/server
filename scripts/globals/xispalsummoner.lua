------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.SMN
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.UPPER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.mageGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.mageGearSets[job][2])
local windyTable = table[xi.zone.WINDURST_WATERS]
local windyLook  = xi.xispal.generateModelID(xi.xispal.face[windyTable.face], xi.xispal.race[windyTable.race], xi.xispal.mageGearSets[job][2])

local menuInvite =
{
    title = 'Shall I join your party?',
    options = 
    {
        {
            'Yes, please.',
            function(player)
                xi.xispal.setMage(player, xi.xispal.palInfo[job])
                player:printToPlayer('Excellent. Let us harness the powers of the avatars.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                player:printToPlayer("WARNING: Summoner is in beta, and is unrefined. Use with caution.", xi.msg.channel.SYSTEM_1, 'System')
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
    title = 'Shall I stay behind?',
    options = 
    {
        {
            'Take care.',
            function(player)
                player:printToPlayer("Understood.", xi.msg.channel.PARTY, table[player:getZoneID()].name)
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

-- Irving (XISP)
xi.xispal.onSummonerInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.UPPER_JEUNO then
        palLook  = jeunoLook
        palTable = jeunoTable
    elseif zoneID == xi.zone.NORTHERN_SAN_DORIA then
        palLook  = sandyLook
        palTable = sandyTable
        elseif zoneID == xi.zone.WINDURST_WATERS then
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
            xi.xispal.onSummonerTrigger(player, npc)
        end,
    })
end

xi.xispal.onSummonerTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if xi.xispal.checkMageRequirements(player, true, table) then
        -- Currently in party
        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == job then
            player:printToPlayer("What is it, " .. player:getName() .. ". What is our next challenge?", xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.WAVE, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has mage, but this one isn't in party, or we need to recruit
        elseif
            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= job) or
            hasMage == 0
        then
            player:printToPlayer('Adventurer. allow me.', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.BOW, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)
        end
    else
        player:printToPlayer('I don\'t have the time for idle chat. I must seek out their power.', xi.msg.channel.SAY, npc:getPacketName())
        npc:sendEmote(player, xi.emote.ANGRY, xi.emoteMode.MOTION, false)
    end
end