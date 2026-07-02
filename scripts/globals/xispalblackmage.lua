------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local table = xi.xispal.palInfo[xi.job.BLM]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

menu =
{
    title = 'Are you in need?',
    options = {},
}

dialogue =
{
    {
        'Let\'s go.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.BLM])
            player:printToPlayer("Very well. Let us be on our way.", xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'On second thought...',
        function(player)
            return
        end,
    },
}

menu2 =
{
    title = 'Can I tend to personal matters?',
    options = {},
}

dialogue2 =
{
    {
        'Take care.',
        function(player)
            player:printToPlayer("Don\'t tell the ministry about our adventures!", xi.msg.channel.PARTY, table.name)
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

-- Vivio (XISP)
xi.xispal.onBlackMageInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -35.8,
        y         = -1,
        z         = -14.8,
        rotation  = 132,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onBlackMageTrigger(player, npc)
        end,
    })
end

xi.xispal.onBlackMageTrigger = function(player, npc)
local hasMage = player:getCharVar('[XISP]hasMage')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkMageRequirements(player, false, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer("This is no good.. The ministry sent me here, only for me to get lost!", xi.msg.channel.SAY, table.name)
            player:timer(4000, function(player)
                player:printToPlayer("I was tasked in searching for aid in order to save the Mother Tree. But here I am lost in Jeuno.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("The Mother Tree speaks in silence. Her needs are endless, and her wisdom vast.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("However, I've been told my duties no longer end beneath the soil.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("Many suffer beyond the Windurstian walls. Adventurers stretched thin, far from any sanctuary.", xi.msg.channel.SAY, table.name)
                            player:timer(6000, function(player)
                                player:printToPlayer("I struggled with the thought of leaving. But the Star Sybil insisted I go where I'm needed.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("And something in you... suggests this is the right soil to plant my next step.", xi.msg.channel.SAY, table.name)
                                player:timer(6000, function(player)
                                    player:printToPlayer("If you'll have me, I'll lend you my spells. For the world above, and the roots below.", xi.msg.channel.SAY, table.name)
                                    player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                    npc:setLocalVar('dialogueLock', 0)
                                    player:setCharVar('[XISP]hasUnlockedMages', 1)
                                    return
                                end)
                            end)
                        end)
                    end)
                end)
            end)
        else
            if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                -- Currently in party
                if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                    player:printToPlayer("Yes, " .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has mage, but this one isn't in party, or we need to recruit
                elseif
                    (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                    hasMage == 0
                then
                    player:printToPlayer("You're back! Would you be able to acquire this map for me?", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.WAVE, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("Shantotto will have my head when I get back to the ministry!", xi.msg.channel.SAY, table.name)
        npc:sendEmote(player, xi.emote.SIGH, xi.emoteMode.MOTION, false)
    end
end

