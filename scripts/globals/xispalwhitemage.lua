------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local table = xi.xispal.palInfo[xi.job.WHM]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

menu =
{
    title = 'Shall I join your party?',
    options = {},
}

dialogue =
{
    {
        'Yes, please.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.WHM])
            player:printToPlayer("Excellent. I will take your lead.", xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Let me think about it.',
        function(player)
            return
        end,
    },
}

menu2 =
{
    title = 'Shall I leave your party?',
    options = {},
}

dialogue2 =
{
    {
        'Take care.',
        function(player)
            player:printToPlayer("Hopefully I can afford some more spells now.", xi.msg.channel.PARTY, table.name)
            xi.xispal.removeMage(player)
        end,
    },
    {
        'On second thought...',
        function(player)
            return
        end,
    },
}

-- Rilea (XISP)
xi.xispal.onWhiteMageInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -30.8,
        y         = 5.9,
        z         = -90.7,
        rotation  = 249,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onWhiteMageTrigger(player, npc)
        end,
    })
end

xi.xispal.onWhiteMageTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkMageRequirements(player, false, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer("Ah... pardon me, adventurer. Might I have a word, if you would be so kind?", xi.msg.channel.SAY, table.name)

            player:timer(6000, function(player)
                player:printToPlayer("My name is Rilea, humble servant of Altana and apprentice to His Highness, Prince Pieuje.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("I have dwelled long within the halls of Altana, devoting my days to healing and prayer...", xi.msg.channel.SAY, table.name)
                    player:printToPlayer("Yet the time has come when the needs of the kingdom call me beyond the stone and sanctity of the cathedral.", xi.msg.channel.SAY, table.name)
                    player:timer(8000, function(player)
                        player:printToPlayer("San d'Oria trembles beneath burdens both seen and unseen, and though I am but a single soul, I would offer what strength I have.", xi.msg.channel.SAY, table.name)
                        player:printToPlayer("My arts lie not in blade or arrow, but in light-the light that mends, that shields, that soothes the wounded spirit.", xi.msg.channel.SAY, table.name)
                        player:timer(8000, function(player)
                            player:printToPlayer("Would you allow me to accompany you on your journey? That I may serve both the light of Altana and the hopes of our noble nation?", xi.msg.channel.SAY, table.name)
                            player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                            npc:setLocalVar('dialogueLock', 0)
                            player:setCharVar('[XISP]hasUnlockedMages', 1)
                        end)
                    end)
                end)
            end)
        else
            if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                -- Currently in party
                if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                    player:printToPlayer("What do you require of me, " .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has mage, but this one isn't in party, or we need to recruit
                elseif
                    (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                    hasMage == 0
                then
                    player:printToPlayer("Yes, " .. player:getName() .. "? Are you in need of a healer?", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.JOY, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("No, no no... I already have these spells!", xi.msg.channel.SAY, table.name)
        npc:sendEmote(player, xi.emote.ANGRY, xi.emoteMode.MOTION, false)
    end
end