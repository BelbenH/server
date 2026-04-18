------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu  = {}
local menu2 = {}
local menu3 = {}
local dialogue  = {}
local dialogue2 = {}
local dialogue3 = {}
local table = xi.xispal.palInfo[xi.job.SAM]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

menu =
{
    title = 'You need me?',
    options = {},
}

dialogue =
{
    {
        'I do.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[xi.job.SAM])
            player:printToPlayer("Very well. Let us press onward, young 'in.", xi.msg.channel.PARTY, table.name)
        end,
    },
    {
        'Not right now.',
        function(player)
            return
        end,
    },
}

menu2 =
{
    title = 'Can I get back to drinking?',
    options = {},
}

dialogue2 =
{
    {
        'Let\'s talk battle.',
        function(player)
            menu3.options = dialogue3
            xi.xisp.sendMenu(player, menu3)
        end,
    },
    {
        'Take your fill!',
        function(player)
            player:printToPlayer('Aye. Take care.', xi.msg.channel.PARTY, table.name)
            xi.xispal.removeKnight(player)
        end,
    },
}

menu3 =
{
    title = 'Should I tank, or deal damage?',
    options = {},
}

dialogue3 =
{
    {
        'Try to maintain enmity.',
        function(player)
            player:setCharVar('[XISP]SamuraiTankMode', 1)
            player:printToPlayer("Very well. You best have a healer!", xi.msg.channel.PARTY, table.name)
            return
        end,
    },
    {
        'Focus on dealing damage.',
        function(player)
            player:setCharVar('[XISP]SamuraiTankMode', 0)
            player:printToPlayer('Better sharpen the ol\' blade.', xi.msg.channel.PARTY, table.name)
            return
        end,
    },
}

-- Yamagi (XISP)
xi.xispal.onSamuraiInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 24.35,
        y         = -0.1,
        z         = -13.2,
        rotation  = 177,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onSamuraiTrigger(player, npc)
        end,
    })
end

xi.xispal.onSamuraiTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkKnightRequirements(player, true, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)
            player:printToPlayer("Oi! That stance... you're no greenhorn. Samurai, ain't ya?", xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer("Heh! Thought I smelled steel and honor. Haven't seen a new of us in years!", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("I'm an ol' vet. Used to swing steel so fast it made the wind jealous... now I just swing bottle of Tavnazian ale.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("But you? You've got a certain fire. That itch for battle. I can see it in your blade.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("Makes my old blood stir. Maybe it's time I dust off the blade, eh?", xi.msg.channel.SAY, table.name)
                            player:timer(6000, function(player)
                                player:printToPlayer("What say you, samurai? Let an old warrior tag along? I won't get in your way.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("Or maybe I will! Gives me more to laugh at between battles.", xi.msg.channel.SAY, table.name)
                                player:timer(6000, function(player)
                                    player:printToPlayer("Let's make the ground shake again. Just like the old days!", xi.msg.channel.SAY, table.name)
                                    player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                    player:setCharVar('[XISP]SamuraiTankMode', 0)
                                    npc:setLocalVar('dialogueLock', 0)
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
                if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == table.job then
                    player:printToPlayer("What is it, " .. player:getName() .. "? Come to have a drink?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.LAUGH, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has knight, but this one isn't in party, or we need to recruit
                elseif
                    (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                    hasKnight == 0
                then
                    player:printToPlayer("" .. player:getName() .. "! Come have a nice cold Tavnazian ale.", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.WELCOME, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("Do I know you? Sorry, but leave me be.", xi.msg.channel.SAY, table.name)
    end
end