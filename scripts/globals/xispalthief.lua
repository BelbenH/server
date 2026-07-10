------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local table = xi.xispal.palInfo[xi.job.THF]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][2])

menu =
{
    title = 'You need me or something?',
    options = {},
}

dialogue =
{
    {
        'Unfortunately I do',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[xi.job.THF])
            player:printToPlayer("Let's get a move on!", xi.msg.channel.PARTY, table.name)
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
    title = 'You want me to scram?',
    options = {},
}

dialogue2 =
{
    {
        'See ya later!',
        function(player)
            player:printToPlayer("Fine! I was getting tired of you anyways.", xi.msg.channel.PARTY, table.name)
            xi.xispal.removeKnight(player)
        end,
    },
    {
        'On second thought...',
        function(player)
            return
        end,
    },
}

-- Ayala (XISP)
xi.xispal.onThiefInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -1.35,
        y         = 0,
        z         = 24.92,
        rotation  = 80,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onThiefTrigger(player, npc)
        end,
    })
end

xi.xispal.onThiefTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkKnightRequirements(player, false, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer("Well now... Look at you. Clean boots, eyes full of purpose. You've got that whole 'I'm going to change the world' look to you.", xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer("Name's Ayala. I'm what you might call a... facilitator of fortunes. I've got a knack of finding things other don't even know they've lost.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("And you? You look like someone who opens doors. Me? I slip through 'em.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("See, we could be useful to each other. You've got strength, presence-enough to get us into places most wouldn't dare tread.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("I've got eyes for opportunity and hands quicker than a Sahagin in shallow water. You like loot? I do.", xi.msg.channel.SAY, table.name)
                            player:printToPlayer("You like not dying in a pit full of goblin firetraps? I like that too.", xi.msg.channel.SAY, table.name)
                            player:timer(8000, function(player)
                                player:printToPlayer("Stick with me and you won't just see the riches of Vanadiel-you'll own them. so what do you say? Partners?", xi.msg.channel.SAY, table.name)
                                player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                npc:setLocalVar('dialogueLock', 0)
                                return
                            end)
                        end)
                    end)

                end)
            end)
        else
            if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                -- Currently in party
                if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == table.job then
                    player:printToPlayer("Yes, " .. player:getName() .. ". Whaddya want?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has knight, but this one isn't in party, or we need to recruit
                elseif
                    (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                    hasKnight == 0
                then
                    player:printToPlayer("Oh, " .. player:getName() .. "! About the gil I owe you...", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.PANIC, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Scram, kid! I'm trying to get a deal.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer('Scram, kid! Can\'t you see I\'m doing something here? I\'m trying to get a deal.', xi.msg.channel.SAY, table.name)
    end
end