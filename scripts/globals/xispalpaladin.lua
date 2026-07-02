------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local table = xi.xispal.palInfo[xi.job.PLD]
local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

menu =
{
    title = 'In need of my services?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[xi.job.PLD])
            player:printToPlayer("Understood. Let us be on our way.", xi.msg.channel.PARTY, table.name)
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
    title = 'Shall I remain here?',
    options = {},
}

dialogue2 =
{
    {
        'Yes. Take care.',
        function(player)
            player:printToPlayer("Very well. I hope to see you soon.", xi.msg.channel.PARTY, table.name)
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

-- Isolde (XISP)
xi.xispal.onPaladinInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -30.5,
        y         = -1.50,
        z         = 9.50,
        rotation  = 182,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onPaladinTrigger(player, npc)
        end,
    })
end

xi.xispal.onPaladinTrigger = function(player, npc)
    local hasKnight = player:getCharVar('[XISP]hasKnight')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkKnightRequirements(player, true, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)
            player:printToPlayer("You've the look of one who walks the path with purpose, or at least, with courage.", xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer("I am a daughter of San d'Oria, trained beneath cathedral spires and battlefield sun alike.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("Though my name bears no weight, I have vowed to raise it high on virtue and steel.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("This chapel offers peace, but peace does little for the family I serve and the faith I keep.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("I believe the Goddess places trials before us not to hinder, but to shape us.", xi.msg.channel.SAY, table.name)
                            player:timer(6000, function(player)
                                player:printToPlayer("Perhaps you are one such trial, or a calling. Either way, I choose not to ignore it.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("Allow me to walk beside you. I will guard you, and by doing so, guard my vow.", xi.msg.channel.SAY, table.name)
                                player:timer(6000, function(player)
                                    player:printToPlayer("Together, let us earn a legacy that echoes far beyond these chapel walls.", xi.msg.channel.SAY, table.name)
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
                    player:printToPlayer("Welcome back to Jeuno.", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.WELCOME, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has knight, but this one isn't in party, or we need to recruit
                elseif
                    player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 and
                    ((hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                    hasKnight == 0)
                then
                    player:printToPlayer("There you are. I was just beginning to worry about you.", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.SALUTE, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("Hi there. Did you need something?", xi.msg.channel.SAY, table.name)
    end
end