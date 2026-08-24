------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.PLD
local table      = xi.xispal.palInfo[job]
local jeunoTable = table[xi.zone.UPPER_JEUNO]
local jeunoLook  = xi.xispal.generateModelID(xi.xispal.face[jeunoTable.face], xi.xispal.race[jeunoTable.race], xi.xispal.knightGearSets[job][2])
local sandyTable = table[xi.zone.NORTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.knightGearSets[job][2])
local windyTable = table[xi.zone.PORT_WINDURST]
local windyLook  = xi.xispal.generateModelID(xi.xispal.face[windyTable.face], xi.xispal.race[windyTable.race], xi.xispal.knightGearSets[job][2])

local menuInvite =
{
    title = 'In need of my services?',
    options = 
    {
        {
            'I am.',
            function(player)
                xi.xispal.setKnight(player, table)
                player:printToPlayer("Understood. Let us be on our way.", xi.msg.channel.PARTY, table[player:getZoneID()].name)
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

local upgradeOption =
{

}

local menuDismiss =
{
    title = 'What do you need?',
    options = 
    {
        {
            'Leave my service.',
            function(player)
                player:printToPlayer('Very well. I hope to see you soon.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                xi.xispal.removeKnight(player)
            end,
        },
        {
            'Upgrade your gear.',
            function(player)
                local itemID = xi.xispal.upgradeTable[job][player:getCharVar('[XISP]palUpgrade' .. job) + 1].item
                local item   = GetItemByID(itemID)
                local itemName = item:getName():gsub('_', ' ')

                if xi.xispal.hasCompletedAF(player) then
                    player:printToPlayer('Right. I have been seeking a \'' .. itemName .. '\'. But it is no small task to obtain.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                    player:printToPlayer('Would you lend me your assistance, ' .. player:getName() .. '?', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                else
                    player:printToPlayer('' .. player:getName() '! I appreciate the gesture, but I am not ready to do so.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
                end

            end,
        },
        {
            'Nothing.',
            function(player)
                return
            end,
        },
    },
}

xi.xispal.onPaladinInitialize = function(zone)
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
            xi.xispal.onPaladinTrigger(player, npc)
        end,
    })
end

xi.xispal.onPaladinTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if xi.xispal.checkKnightRequirements(player, true, table) then
        -- Currently in party
        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == job then
            player:printToPlayer('Ah. it is you, ' .. player:getName() .. '.', xi.msg.channel.PARTY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.WELCOME, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has knight, but this one isn't in party, or we need to recruit
        elseif
            ((hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= job) or
            hasKnight == 0)
        then
            player:printToPlayer('There you are. I was just beginning to worry about you.', xi.msg.channel.SAY, npc:getPacketName())
            npc:sendEmote(player, xi.emote.SALUTE, xi.emoteMode.MOTION, false)
            xi.xisp.sendMenu(player, menuInvite)
        end
    else
        player:printToPlayer('Hi there. Did you need something?', xi.msg.channel.SAY, npc:getPacketName())
    end
end