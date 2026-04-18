-----------------------------------
-- Area: Upper Jeuno
--  NPC: Inconspicuous Door
-- NIN Pal (XISP)
-- !pos -75 -1 58 244
-----------------------------------
-----------------------------------
---@type TNpcEntity
local entity = {}

local menu      = {}
local menu2     = {}
local dialogue  = {}
local dialogue2 = {}
local palJob    = xi.job.NIN
local table     = xi.xispal.palInfo[palJob]

menu =
{
    title = 'In need of a shadow?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. I will meet you in the field.", xi.msg.channel.PARTY, table.name)
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
            player:printToPlayer("I return to the shadows.", xi.msg.channel.PARTY, table.name)
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

-- Umbria (XISP)
entity.onTrigger = function(player, npc)
    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    local hasMage   = player:getCharVar('[XISP]hasMage')


    if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 6 then
        if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
            npc:setLocalVar('dialogueLock', 1)

            player:printToPlayer("Strange... the wind shifts when you walk past. You're not like the others.", xi.msg.channel.SAY, table.name)
            player:timer(6000, function(player)
                player:printToPlayer("I've watched you from the mists that cling to docks... you draw attention.", xi.msg.channel.SAY, table.name)
                player:timer(6000, function(player)
                    player:printToPlayer("Good. I prefer to travel with those who move tides, not drift with them.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("My name? Hm... Names are like smoke. They vanish the tighter you grasp.", xi.msg.channel.SAY, table.name)
                        player:timer(6000, function(player)
                            player:printToPlayer("But if you must call me something... 'Umbria' will suffice.", xi.msg.channel.SAY, table.name)
                            player:timer(8000, function(player)
                                player:printToPlayer("I know this world. Its alleys, its blades, its whispers. I can be useful.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("Or dangerous. That depends on who points to me and why.", xi.msg.channel.SAY, table.name)
                                player:timer(8000, function(player)
                                    player:printToPlayer("Take me with you. You'll never see a move I make. Only the results.", xi.msg.channel.SAY, table.name)
                                    player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                    npc:setLocalVar('dialogueLock', 0)
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
                    player:printToPlayer("Have I not pleased you, " .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                    menu2.options = dialogue2
                    xi.xisp.sendMenu(player, menu2)

                -- Player has mage, but this one isn't in party, or we need to recruit
                elseif
                    (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                    hasMage == 0
                then
                    player:printToPlayer("Yes, " .. player:getName() .. "? Are your foes in need of dispatchment?", xi.msg.channel.SAY, table.name)
                    menu.options = dialogue
                    xi.xisp.sendMenu(player, menu)

                else -- Shouldn't be reached. But a fail-safe
                    player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                end
            end
        end
    else
        player:printToPlayer("The winds do not blow in your favor. Nor do the tides.", xi.msg.channel.SAY, table.name)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
