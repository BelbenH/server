xi = xi or {}
xi.xispal = xi.xispal or {}

-- Forward declarations (required)
local menu      = {}
local dialogue1 = {}

local menu2     = {}
local dialogue2 = {}
local dialogue3 = {}
local dialogue4 = {}

local menu3     = {}
local dialogue9 = {}

local sendMenu = function(player, menuID)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuID)
    end)
end

local spawnNewSquire = function(player)
    local squire = GetMobByID(player:getCharVar('[XISP]squireID'))

    player:setCharVar('[XISP]squireProg', 7)

    if squire and squire:isSpawned() then
        squire:independentAnimation(squire, 201, 4)
        squire:timer(2000, function(squireArg)
            squireArg:setBehavior(bit.band(squireArg:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
            DespawnMob(squireArg:getID())
            xi.xispal.spawnSquire(player, player:getZone())
            player:addSpell(920, { silentLog = true })
            player:setCharVar('[XISP]squireJob', xi.job.RDM)
        end)
    end
end

menu =
{
    title = 'Do you think they\'re ready?',
    options = {},
}

dialogue1 =
{
    {
        'They are.',
        function(playerArg)
            playerArg:printToPlayer("This is great news. The nation welcomes a new adventurer to its roster.", xi.msg.channel.SAY, 'Milchupain')
            menu2.options = dialogue2
            sendMenu(playerArg, menu2)
        end,
    },
    {
        'They are not.',
        function(playerArg)
            playerArg:printToPlayer("Very well. Return to me when you believe they are ready.", xi.msg.channel.SAY, 'Milchupain')
        end,
    },
}

menu2 =
{
    title = 'Select desired face:',
    options = {},
}

dialogue2 =
{
    {
        '1A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 0)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '1B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 1)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '2A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 2)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '2B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 3)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        'Next page',
        function(playerArg)
            menu2.options = dialogue3
            sendMenu(playerArg, menu2)
        end,
    },
}
dialogue3 =
{
    {
        '3A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 4)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '3B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 5)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '4A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 6)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '4B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 7)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        'Next page',
        function(playerArg)
            menu2.options = dialogue4
            sendMenu(playerArg, menu2)
        end,
    },
}
dialogue4 =
{
    {
        '5A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 8)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '5B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 9)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '6A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 10)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '6B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 11)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        'Next page',
        function(playerArg)
            menu2.options = dialogue5
            sendMenu(playerArg, menu2)
        end,
    },
}
dialogue5 =
{
    {
        '7A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 12)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '7B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 13)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '8A',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 14)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        '8B',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireFace', 15)
            menu3.options = dialogue9
            sendMenu(playerArg, menu3)
        end,
    },
    {
        'Restart',
        function(playerArg)
            menu2.options = dialogue2
            sendMenu(playerArg, menu2)
        end,
    },
}

menu3 =
{
    title = 'Are you sure?',
    options = {},
}

dialogue9 =
{
    {
        'That\'s it!',
        function(playerArg)
            spawnNewSquire(playerArg)
        end,
    },
    {
        'Let\'s see...',
        function(playerArg)
            menu2.options = dialogue2
            sendMenu(playerArg, menu2)
        end,
    },
}

xi.xispal.quest2 = function(player, npc)
    if player:getCharVar('[XISP]squireProg') < 7 then
        player:printToPlayer("My have they grown! Dare I say they're ready to join you in the field.", xi.msg.channel.SAY, npc:getName())
        menu.options = dialogue1
        sendMenu(player, menu)
    end
end