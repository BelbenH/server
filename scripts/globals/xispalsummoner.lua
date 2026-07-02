------------------------------------------
require('scripts/globals/xispaldata')
------------------------------------------
xi = xi or {}
xi.xispal = xi.xispal or {}

local menu      = {}
local menu2     = {}
local dialogue  = {}
local dialogue2 = {}
local table     = xi.xispal.palInfo[xi.job.SMN]
local look      = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

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
            xi.xispal.setMage(player, xi.xispal.palInfo[xi.job.SMN])
            player:printToPlayer("Excellent. Let us harness the powers of the avatars.", xi.msg.channel.PARTY, table.name)
            player:printToPlayer("WARNING: Summoner is in beta, and is unrefined. Use with caution.", xi.msg.channel.SYSTEM_1, 'System')
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
            player:printToPlayer("Understood.", xi.msg.channel.PARTY, table.name)
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

-- Irving (XISP)
xi.xispal.onSummonerInitialize = function(zone)
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 7.5,
        y         = 2,
        z         = 75.8,
        rotation  = 95,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispal.onSummonerTrigger(player, npc)
        end,
    })
end

xi.xispal.onSummonerTrigger = function(player, npc)
    local hasMage = player:getCharVar('[XISP]hasMage')

    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    if xi.xispal.checkMageRequirements(player, true, table) then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer("Ah, another summoner... I could feel your presence before I laid eyes on you. The air shifts when one who commands ", xi.msg.channel.SAY, table.name)
            player:printToPlayer("the astral steps into view.", xi.msg.channel.SAY, table.name)
            player:timer(8000, function(player)
                player:printToPlayer("I am Irving. No, not of noble blood, though the name does carry a certain flair, doesn't it?", xi.msg.channel.SAY, table.name)

                player:timer(8000, function(player)
                    player:printToPlayer("I walk the path of the avatars not as a servant, but as one chosen - recognized. The astral lords know me.", xi.msg.channel.SAY, table.name)
                    player:printToPlayer("Not as their master, not as an equal, but as the inevitable. And I sense that you too have tasted a fraction of their power.", xi.msg.channel.SAY, table.name)

                    player:timer(8000, function(player)
                        player:printToPlayer("You and I, together, could do what few dare even dream. The prime avatars hide their strength behind", xi.msg.channel.SAY, table.name)
                        player:printToPlayer("trials and riddles, but I believe they await kindred flames. Two summoners, aligned not in submission, but in purpose.", xi.msg.channel.SAY, table.name)

                        player:timer(8000, function(player)
                            player:printToPlayer("What say you? Shall we shake the heavens until even Bahamut stirs?", xi.msg.channel.SAY, table.name)
                            player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                            npc:setLocalVar('dialogueLock', 0)
                            player:setCharVar('[XISP]hasUnlockedMages', 1)
                            return
                        end)
                    end)

                end)
            end)
        else
            if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                -- Currently in party
                if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                    player:printToPlayer("What is it, " .. player:getName() .. ". What is our next challenge?", xi.msg.channel.PARTY, table.name)
                    npc:sendEmote(player, xi.emote.WAVE, xi.emoteMode.MOTION, false)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has mage, but this one isn't in party, or we need to recruit
                elseif
                    (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                    hasMage == 0
                then
                    player:printToPlayer("" .. player:getName() .. ", allow me.", xi.msg.channel.SAY, table.name)
                    npc:sendEmote(player, xi.emote.BOW, xi.emoteMode.MOTION, false)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("I don't have the time for idle chat. I must seek out their power.", xi.msg.channel.SAY, table.name)
        npc:sendEmote(player, xi.emote.ANGRY, xi.emoteMode.MOTION, false)
    end
end