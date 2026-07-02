------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local table = xi.xispal.palInfo[xi.job.DRK]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

menu =
{
    title = 'In need of a knight?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[xi.job.DRK])
            player:printToPlayer("Very well. I will meet you outside.", xi.msg.channel.PARTY, table.name)
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
    title = 'Can I get back to my post?',
    options = {},
}

dialogue2 =
{
    {
        'Yes, thank you.',
        function(player)
            player:printToPlayer("Of course. Be safe.", xi.msg.channel.PARTY, table.name)
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

-- Yaric (XISP)
xi.xispal.onDarkKnightInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -38.2,
        y         = -0.7,
        z         = 68.4,
        rotation  = 129,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onDarkKnightTrigger(player, npc)
        end,
    })
end

xi.xispal.onDarkKnightTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkKnightRequirements(player, true, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)
            player:printToPlayer("I worked in the metalworks. I didn't mind the soot... It comes with the job..", xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer("They called it 'honest work.' Maybe it is. But I felt those walls closing in.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("Every hammer strike echoed in my chest. Not from pride, but a longing.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("I've trained. Drilled. Waited. But adventure? It never reaches us grunts.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("And yet, here you are. Living what I only dreamed of between shifts.", xi.msg.channel.SAY, table.name)
                            player:timer(8000, function(player)
                                player:printToPlayer("I won't lie. I wanted out. Not to run, but to matter. To *fight* for Bastok.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("But asking felt... wrong. I had orders. I had a duty to my post.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("Still... if you'd let me stand beside you, I'd show you my worth. No regrets.", xi.msg.channel.SAY, table.name)
                                    player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                    npc:setLocalVar('dialogueLock', 0)
                                    player:setCharVar('[XISP]hasUnlockedKnights', 1)
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
                    player:printToPlayer("What is it, " .. player:getName() .. "? What brings us to Jeuno?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.HUH, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has knight, but this one isn't in party, or we need to recruit
                elseif
                    (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                    hasKnight == 0
                then
                    player:printToPlayer("" .. player:getName() .. "? I trust there is no problem..", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.NO, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("Do the Musketeers normally use scythes or blades alongside black magic?", xi.msg.channel.SAY, table.name)
        npc:sendEmote(player, xi.emote.THINK, xi.emoteMode.MOTION, false)
    end
end