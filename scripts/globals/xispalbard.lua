------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local menu3 = {}
local menu4 = {}
local dialogue = {}
local dialogue2 = {}
local dialogue3 = {}
local dialogue4 = {}

local table = xi.xispal.palInfo[xi.job.BRD]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

local songNames =
{
    [1] = 'ballads',
    [2] = 'madrigals',
    [3] = 'minuets',
    [4] = 'marches',
    [5] = 'paeons',
    [6] = 'minnes',
}

menu =
{
    title = 'You need me to come with you?',
    options = {},
}

dialogue =
{
    {
        'Please do.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.BRD])
            player:printToPlayer('Okay! Where are we going?', xi.msg.channel.PARTY, table.name)
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
    title = 'What can I do for you?',
    options = {},
}

dialogue2 =
{
    {
        'Let\'s talk music.',
        function(player)
            menu3.options = dialogue3
            xi.xisp.sendMenu(player, menu3)
        end,
    },
    {
        'Stay here for a while.',
        function(player)
            player:printToPlayer("Aww! No fun. Bye-bye!", xi.msg.channel.PARTY, table.name)
            return
        end,
    },
}

menu3 =
{
    title = 'Which songs should I sing?',
    options = {},
}

dialogue3 =
{
    {
        'Ballads.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 1)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
    {
        'Madrigals.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 2)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
    {
        'Minuets.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 3)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
    {
        'Marches.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 4)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
    {
        'Paeons.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 5)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
    {
        'Minnes.',
        function(player)
            player:setCharVar('[XISP]bardSongs1', 6)
            menu4.options = dialogue4
            xi.xisp.sendMenu(player, menu4)
        end,
    },
}

menu4 =
{
    title = 'Got it. Anything else?',
    options = {},
}

dialogue4 =
{
    {
        'Ballads.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 1)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Madrigals.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 2)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Minuets.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 3)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Marches.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 4)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Paeons.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 5)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Minnes.',
        function(player)
            player:setCharVar('[XISP]bardSongs2', 6)
            player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, table.name)
        end,
    },
}

-- Thessa (XISP)
xi.xispal.onBardInitialize = function(zone)

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -19.2,
        y         = -0.1,
        z         = -66.21,
        rotation  = 174,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onBardTrigger(player, npc)
        end,
    })
end

xi.xispal.onBardTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkMageRequirements(player, true, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer('Ah, hello... sorry, I didn\'t mean to bother you.', xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer('I just... noticed your gear. You\'ve clearly seen the world.', xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer('I\'m... a bard. Or at least, I hope to be. I\'ve trained, quietly, here in town.', xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer('But I haven\'t had the courage to leave on my own. Not yet.', xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer('The songs I want to write, they need real stories. Real people.', xi.msg.channel.SAY, table.name)
                            player:timer(8000, function(player)
                                player:printToPlayer('If you\'d let me come with you… I\'d do my best to support you.', xi.msg.channel.SAY, table.name)
                                player:printToPlayer('Quietly, of course. I don\'t need the spotlight. Just a place to begin.', xi.msg.channel.SAY, table.name)
                                player:timer(6000, function(player)
                                    player:printToPlayer('May I follow you? Just until I find the courage to stand on my own.', xi.msg.channel.SAY, table.name)
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
                    player:printToPlayer('Yes, ' .. player:getName() .. '? Care to hear a paeon while you rest?', xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has mage, but this one isn't in party, or we need to recruit
                elseif
                    (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                    hasMage == 0
                then
                    player:printToPlayer('' .. player:getName() .. '! What are you doing here?', xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.JOY, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer('Good day, '.. player:getName() .. '. Please come back later, I am busy.', xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer('Care to hear a ballad? Ms. Almobankha just started.', xi.msg.channel.SAY, table.name)
    end
end

