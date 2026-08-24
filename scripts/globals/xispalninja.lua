-- For Umbria (Upper Jeuno) see Inconspicuous_Door.lua
------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local job        = xi.job.NIN
local table      = xi.xispal.palInfo[job]
local sandyTable = table[xi.zone.SOUTHERN_SAN_DORIA]
local sandyLook  = xi.xispal.generateModelID(xi.xispal.face[sandyTable.face], xi.xispal.race[sandyTable.race], xi.xispal.mageGearSets[job][2])

local menuInvite =
{
    title = 'In need of a shadow?',
    options = 
    {
        {
            'I am.',
            function(player)
                xi.xispal.setMage(player, table)
                player:printToPlayer('Very well. I will meet you in the field.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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
                player:printToPlayer('I return to the shadows.', xi.msg.channel.PARTY, table[player:getZoneID()].name)
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

xi.xispal.onNinjaInitialize = function(zone)
    local zoneID = zone:getID()
    local palLook = ''
    local palTable = {}

    if zoneID == xi.zone.SOUTHERN_SAN_DORIA then
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
            xi.xispal.onNinjaTrigger(player, npc)
        end,
    })
end

xi.xispal.onNinjaTrigger = function(player, npc)
    local hasMage   = player:getCharVar('[XISP]hasMage')

    if xi.xispal.checkMageRequirements(player, true, table) then
        -- Currently in party
        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == job then
            player:printToPlayer('Have I not pleased you, ' .. player:getName() .. '?', xi.msg.channel.PARTY, jeunoTable.name)
            xi.xisp.sendMenu(player, menuDismiss)

        -- Player has mage, but this one isn't in party, or we need to recruit
        elseif
            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= job) or
            hasMage == 0
        then
            player:printToPlayer('Adventurer... The tides bend to your will. Are your foes in need of dispatchment?', xi.msg.channel.SAY, table.name)
            xi.xisp.sendMenu(player, menuInvite)
        end
    else
        player:printToPlayer('The winds do not blow in your favor. Nor do the tides.', xi.msg.channel.SAY, '???')
    end
end
