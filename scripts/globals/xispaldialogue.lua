xi = xi or {}
xi.xispal = xi.xispal or {}

-- Returns true if dialogue should be skip passed trading an item
xi.xispal.youngSquireTrade = function(player, pal)
    local menu = {}
    local dialogue = {}

    menu =
    {
        title = 'Can I borrow it?',
        options = {},
    }

    dialogue =
    {
        {
            'Of course!',
            function(playerArg)
                local item = xi.xispal.squireItems[player:getCharVar('[XISP]squireProg') + 1][player:getCharVar('[XISP]palItem')]
                for i = xi.inv.INVENTORY, xi.inv.WARDROBE8 do -- inventory locations enums
                    if player:hasItem(item, i) then
                        break
                    end
                end
                playerArg:printToPlayer("Thank you! Thank you! Thank you! I can't wait to start my training with this.", xi.msg.channel.PARTY, pal:getPacketName())
                playerArg:setCharVar('[XISP]palTimer1', VanadielUniqueDay() + 1)
                playerArg:incrementCharVar('[XISP]squireProg', 1)
            end,
        },
        {
            'You\'re not ready yet.',
            function(playerArg)
            end,
        },
    }

    if player:getCharVar('[XISP]palTimer1') > VanadielUniqueDay() or player:getCharVar('[XISP]squireProg') >= 6 then
        return true

    else
        local random   = xi.xisp.playerSeed(player:getID())
        local progress = player:getCharVar('[XISP]squireProg')

        player:setCharVar('[XISP]palItem', random(#xi.xispal.squireItems[progress + 1]))
        local item = xi.xispal.squireItems[progress + 1][player:getCharVar('[XISP]palItem')]

        if player:hasItem(item) then
            player:printToPlayer("You found a " .. GetItemByID(item):getName():gsub('%_', " ") .. "! This is just what I was looking for!", xi.msg.channel.PARTY, pal:getPacketName())
            menu.options = dialogue
            xi.xisp.sendMenu(player, menu)
            return false
        end

        return true
    end
end

xi.xispal.youngSquireChat = function(player, pal)
    local random      = xi.xisp.playerSeed(player:getID())
    local progress    = player:getCharVar('[XISP]squireProg')
    local chatControl = player:getCharVar('[XISP]chatControl')
    local wait        = player:getCharVar('[XISP]palTimer1')

    if progress >= 6 then
        player:printToPlayer("Master I've completed my training. I'm ready to join you in the field. Can we go see the recruiter?", xi.msg.channel.PARTY, pal:getPacketName())
        return
    end

    -- This generation will always be the same based on the server seed
    player:setCharVar('[XISP]palItem', random(#xi.xispal.squireItems[progress + 1]))
    local item = xi.xispal.squireItems[progress + 1][player:getCharVar('[XISP]palItem')]

    if wait > VanadielUniqueDay() then
        player:printToPlayer("I've been deep in my studies, Master " .. player:getName() .. "!", xi.msg.channel.PARTY, pal:getPacketName())
    else
        if chatControl == 0 then
            player:printToPlayer("Hi, " .. player:getName() .. "! It's so very nice to meet you.", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 1)
            return
        elseif chatControl == 1 then
            local itemName = GetItemByID(item):getName():gsub('%_', " ")
            player:printToPlayer("There are a few things I need in order to continue in my training...", xi.msg.channel.PARTY, pal:getPacketName())
            player:printToPlayer("I think a " .. itemName .. " would help me get started! Can you help me find one?", xi.msg.channel.PARTY, pal:getPacketName())
            return
        end
    end
end

xi.xispal.onSquireTrigger = function(player, pal)
    local baseMenu, jobMenu = {}
    local meleeMenu, meleeMenu2, meleeMenu3 = {}
    local songMenu1, songMenu2 = {}
    local magicMenu, magicMenu2, magicMenu3 = {}
    local pldOption, drkOption, drgOption, samOption = {}
    local smnOption, brdOption = {}
    local squireName = xi.xispal.squireName[player:getCharVar('[XISP]squireName')]
    local songNames =
    {
        [1] = 'ballads',
        [2] = 'madrigals',
        [3] = 'minuets',
        [4] = 'marches',
        [5] = 'paeons',
        [6] = 'minnes',
    }

    local changeSquireJob = function(player, newJob)
        local currJob = player:getCharVar('[XISP]squireJob') 

        player:delSpell(xi.xispal.squireJobInfo[currJob].trust)
        player:addSpell(xi.xispal.squireJobInfo[newJob].trust, { silentLog = true })
        player:setCharVar('[XISP]squireJob', newJob)
        player:printToPlayer('Very well. It shall be done.', xi.msg.channel.PARTY, squireName)

        xi.xispal.changeJob(player)
    end

    songMenu1 =
    {
        title = 'Which songs should I sing?',
        options =
        {
            {
                'Ballads.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 1)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
            {
                'Madrigals.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 2)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
            {
                'Minuets.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 3)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
            {
                'Marches.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 4)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
            {
                'Paeons.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 5)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
            {
                'Minnes.',
                function(player)
                    player:setCharVar('[XISP]bardSongs1', 6)
                    xi.xisp.sendMenu(player, songMenu2)
                end,
            },
        },
    }

    songMenu2 =
    {
        title = 'Got it. Anything else?',
        options =
        {
            {
                'Ballads.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 1)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
            {
                'Madrigals.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 2)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
            {
                'Minuets.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 3)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
            {
                'Marches.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 4)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
            {
                'Paeons.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 5)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
            {
                'Minnes.',
                function(player)
                    player:setCharVar('[XISP]bardSongs2', 6)
                    player:printToPlayer('Okay. I\'ll sing ' .. songNames[player:getCharVar('[XISP]bardSongs1')] .. ' and ' .. songNames[player:getCharVar('[XISP]bardSongs2')] .. '.', xi.msg.channel.PARTY, squireName)
                end,
            },
        },
    }

    pldOption =
    {
        'Paladin',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.PLD)
        end,
    }
    drkOption =
    {
        'Dark Knight',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.DRK)
        end,
    }
    drgOption =
    {
        'Dragoon',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.DRG)
        end,
    }
    samOption =
    {
        'Samurai',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.SAM)
        end,
    }
    brdOption =
    {
        'Bard',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.BRD)
        end,
    }
    smnOption =
    {
        'Summoner',
        function(playerArg)
            changeSquireJob(playerArg, xi.job.SMN)
        end,
    }

    baseMenu =
    {
        title = 'What do you require?',
        options =
        {
            {
                'Change your job.',
                function(playerArg)
                    xi.xisp.sendMenu(playerArg, jobMenu)
                end,
            },
            {
                'Upgrade your gear.',
                function(playerArg)
                end,
            },
        },
    }

    jobMenu =
    {
        title = 'Which job should I assume?',
        options =
        {
            {
                'Melee',
                function(playerArg)
                    xi.xisp.sendMenu(playerArg, meleeMenu)
                end,
            },
            {
                'Magic',
                function(playerArg)
                    xi.xisp.sendMenu(playerArg, magicMenu)
                end,
            },
        },
    }

    meleeMenu =
    {
        title = 'Now which job?',
        options =
        {
            {
                'Go back.',
                function(playerArg)
                    xi.xisp.sendMenu(playerArg, jobMenu)
                end,
            },
            {
                'Thief',
                function(playerArg)
                    changeSquireJob(playerArg, xi.job.THF)
                end,
            },
        },
    }

    magicMenu =
    {
        title = 'Now which job?',
        options =
        {
            {
                'Go back.',
                function(playerArg)
                    xi.xisp.sendMenu(playerArg, jobMenu)
                end,
            },
            {
                'White Mage',
                function(playerArg)
                    changeSquireJob(playerArg, xi.job.WHM)
                end,
            },
            {
                'Black Mage',
                function(playerArg)
                    changeSquireJob(playerArg, xi.job.BLM)
                end,
            },
            {
                'Red Mage',
                function(playerArg)
                    changeSquireJob(playerArg, xi.job.RDM)
                end,
            },
        },
    }

    -- Temp fix for old players (Remove when all players have spoken to their squire once)
    if player:getCharVar('[XISP]squireJob') == 0 then
        player:setCharVar('[XISP]squireJob', xi.job.RDM)
    end

    local master = GetPlayerByID(pal:getLocalVar('[XISP]ownerID'))
    
    if master == player then
        pal:lookAt(player:getPos())
        player:printToPlayer('Yes, ' .. player:getName() .. '?', xi.msg.channel.PARTY, pal:getPacketName())
        
        -- Populate melee jobs
        local job      = player:getCharVar('[XISP]squireJob')
        local jobTable = xi.xispal.squireJobInfo
        local pldTable = jobTable[xi.job.PLD].quest
        local drkTable = jobTable[xi.job.DRK].quest
        local drgTable = jobTable[xi.job.DRG].quest
        local samTable = jobTable[xi.job.SAM].quest

        if player:hasCompletedQuest(pldTable[1], pldTable[2]) and job ~= xi.job.PLD then
            table.insert(meleeMenu.options, pldOption)
        end
        if player:hasCompletedQuest(drkTable[1], drkTable[2]) and job ~= xi.job.DRK then
            table.insert(meleeMenu.options, drkOption)
        end
        if player:hasCompletedQuest(drgTable[1], drgTable[2]) and job ~= xi.job.DRG then
            table.insert(meleeMenu.options, drgOption)
        end
        if player:hasCompletedQuest(samTable[1], samTable[2]) and job ~= xi.job.SAM then
            table.insert(meleeMenu.options, samOption)
        end

        -- Populate mage jobs
        local smnTable = jobTable[xi.job.SMN].quest
        local brdTable = jobTable[xi.job.BRD].quest

        if player:hasCompletedQuest(smnTable[1], smnTable[2]) and job ~= xi.job.SMN then
            table.insert(magicMenu.options, smnOption)
        end
        if player:hasCompletedQuest(brdTable[1], brdTable[2]) and job ~= xi.job.BRD then
            table.insert(magicMenu.options, brdOption)
        end

        local brdOption =
        {
            'Let\'s talk songs.',
            function(playerArg)
                xi.xisp.sendMenu(master, songMenu1)
            end,
        }
        local nvm =
        {
            'Nevermind.',
            function(playerArg)
            end,
        }

        if job == xi.job.BRD then
            table.insert(baseMenu.options, brdOption)
        end

        table.insert(baseMenu.options, nvm)

        xi.xisp.sendMenu(master, baseMenu)
    end
end

xi.xispal.idleYoungSquireChat = function(pal, player)
    local palName    = pal:getPacketName()

    if player:getCharVar('[XISP]squireIdleChat') < GetSystemTime() then
        player:setCharVar('[XISP]squireIdleChat', GetSystemTime() + math.random(720, 900)) -- 12 to 15 min

        local random = math.random(1, 30)

        if random == 1 then player:printToPlayer("Ahh... buildings that don't try to eat you. What a concept.", xi.msg.channel.PARTY, palName)
        elseif random == 2 then player:printToPlayer("It smells like fresh bread. And... steel? That's comforting.", xi.msg.channel.PARTY, palName)
        elseif random == 3 then player:printToPlayer("Look at all the people... Do you think they've got stories like yours?", xi.msg.channel.PARTY, palName)
        elseif random == 4 then player:printToPlayer("No monsters, no traps, no cursed fog... just a good breeze and cobblestones.", xi.msg.channel.PARTY, palName)
        elseif random == 5 then player:printToPlayer("I wonder if the shops here have new gear. Or sweets!", xi.msg.channel.PARTY, palName)
        elseif random == 6 then player:printToPlayer("This place feels like a pause in the middle of a song.", xi.msg.channel.PARTY, palName)
        elseif random == 7 then player:printToPlayer("I think my boots finally get to dry out here.", xi.msg.channel.PARTY, palName)
        elseif random == 8 then player:printToPlayer("People actually smile here... that's weird. Nice, though.", xi.msg.channel.PARTY, palName)
        elseif random == 9 then player:printToPlayer("Let's try not to get lost, alright? These alleys all look the same to me.", xi.msg.channel.PARTY, palName)
        elseif random == 10 then player:printToPlayer("Did you see that knight? Their armor practically glowed!", xi.msg.channel.PARTY, palName)
        elseif random == 11 then player:printToPlayer("This feels like a good place to rest. Or eavesdrop.", xi.msg.channel.PARTY, palName)
        elseif random == 12 then player:printToPlayer("No one's staring at us... that's new.", xi.msg.channel.PARTY, palName)
        elseif random == 13 then player:printToPlayer("So many banners here. Must be some kind of festival soon?", xi.msg.channel.PARTY, palName)
        elseif random == 14 then player:printToPlayer("You ever think about just... staying in a place like this?", xi.msg.channel.PARTY, palName)
        elseif random == 15 then player:printToPlayer("Taverns here are louder than a goblin ambush. I like it.", xi.msg.channel.PARTY, palName)
        elseif random == 16 then player:printToPlayer("I could listen to this marketplace for hours. So many voices.", xi.msg.channel.PARTY, palName)
        elseif random == 17 then player:printToPlayer("I feel like I should be on my best behavior here. Should I bow to someone?", xi.msg.channel.PARTY, palName)
        elseif random == 18 then player:printToPlayer("Not hearing swords clashing in the distance is... relaxing.", xi.msg.channel.PARTY, palName)
        elseif random == 19 then player:printToPlayer("Everything smells better in town. Except the chocobo stables.", xi.msg.channel.PARTY, palName)
        elseif random == 20 then player:printToPlayer("Somewhere in this town, someone's writing a letter. I just know it.", xi.msg.channel.PARTY, palName)
        elseif random == 21 then player:printToPlayer("I don't even care if the beds are scratchy. It's a bed!", xi.msg.channel.PARTY, palName)
        elseif random == 22 then player:printToPlayer("Everyone walks with purpose here. Should I be doing that too?", xi.msg.channel.PARTY, palName)
        elseif random == 23 then player:printToPlayer("The guard at the gate gave me a nod. That counts as respect, right?", xi.msg.channel.PARTY, palName)
        elseif random == 24 then player:printToPlayer("It's so loud, but not the scary kind. Just... alive.", xi.msg.channel.PARTY, palName)
        elseif random == 25 then player:printToPlayer("Do you think they'd let me train in the barracks here?", xi.msg.channel.PARTY, palName)
        elseif random == 26 then player:printToPlayer("My feet hurt less already. Town magic, maybe?", xi.msg.channel.PARTY, palName)
        elseif random == 27 then player:printToPlayer("So this is what peace feels like. I could get used to it.", xi.msg.channel.PARTY, palName)
        elseif random == 28 then player:printToPlayer("I swear, my stomach knows when we hit a town. It's already growling.", xi.msg.channel.PARTY, palName)
        elseif random == 29 then player:printToPlayer("Hey, if you go shopping, don't forget I've got a wishlist!", xi.msg.channel.PARTY, palName)
        else player:printToPlayer("Just give me five minutes. I wanna soak this place in.", xi.msg.channel.PARTY, palName)
        end
    end
end

xi.xispal.playerLevelUpChat = function(player)
    local pal = GetMobByID(player:getCharVar('[XISP]squireID'))

    if pal then
        local palName = pal:getPacketName()
        local random  = math.random(1, 20)

        if random == 1 then player:printToPlayer("You're standing taller than you were this morning... or is that just me?", xi.msg.channel.PARTY, palName)
        elseif random == 2 then player:printToPlayer("Did you always move that fast? That was amazing!", xi.msg.channel.PARTY, palName)
        elseif random == 3 then player:printToPlayer("Something's different about you... like you've sharpened somehow.", xi.msg.channel.PARTY, palName)
        elseif random == 4 then player:printToPlayer("Every fight, you're more and more like the stories.", xi.msg.channel.PARTY, palName)
        elseif random == 5 then player:printToPlayer("You didn't even flinch that time. That used to knock you back!", xi.msg.channel.PARTY, palName)
        elseif random == 6 then player:printToPlayer("You make this look easy. I hope I get there someday too.", xi.msg.channel.PARTY, palName)
        elseif random == 7 then player:printToPlayer("I think the monsters are starting to realize who they're dealing with.", xi.msg.channel.PARTY, palName)
        elseif random == 8 then player:printToPlayer("You're starting to give off that hero kind of... aura. It's weird, but cool!", xi.msg.channel.PARTY, palName)
        elseif random == 9 then player:printToPlayer("Even your footsteps sound more confident now.", xi.msg.channel.PARTY, palName)
        elseif random == 10 then player:printToPlayer("If we keep going like this, you'll be a legend before sundown.", xi.msg.channel.PARTY, palName)
        elseif random == 11 then player:printToPlayer("You've grown a lot, haven't you? It's kinda inspiring.", xi.msg.channel.PARTY, palName)
        elseif random == 12 then player:printToPlayer("You didn't used to strike that clean. I noticed!", xi.msg.channel.PARTY, palName)
        elseif random == 13 then player:printToPlayer("I'd ask how you do it, but I doubt I could keep up!", xi.msg.channel.PARTY, palName)
        elseif random == 14 then player:printToPlayer("You make those monsters look like practice dummies now.", xi.msg.channel.PARTY, palName)
        elseif random == 15 then player:printToPlayer("I don't know what changed, but it suits you.", xi.msg.channel.PARTY, palName)
        elseif random == 16 then player:printToPlayer("Even your gear looks better on you than it did yesterday.", xi.msg.channel.PARTY, palName)
        elseif random == 17 then player:printToPlayer("That last swing? Flawless. Seriously.", xi.msg.channel.PARTY, palName)
        elseif random == 18 then player:printToPlayer("I hope the bards are taking notes somewhere.", xi.msg.channel.PARTY, palName)
        elseif random == 19 then player:printToPlayer("You're turning into exactly the kind of adventurer I hoped I'd follow.", xi.msg.channel.PARTY, palName)
        else player:printToPlayer("You feel... steadier now. Like the world doesn't shake you as much.", xi.msg.channel.PARTY, palName)
        end
    end
end

xi.xispal.playerDied = function(player)
    local pal = GetMobByID(player:getCharVar('[XISP]squireID'))

    if pal then
        local palName = pal:getPacketName()
        local random  = math.random(1, 20)

        if random == 1 then player:printToPlayer("No-no no no! Please get back up...!", xi.msg.channel.PARTY, palName)
        elseif random == 2 then player:printToPlayer("I wasn't fast enough... I'm sorry!", xi.msg.channel.PARTY, palName)
        elseif random == 3 then player:printToPlayer("Don't do this to me... You *promised* you'd be alright!", xi.msg.channel.PARTY, palName)
        elseif random == 4 then player:printToPlayer("I... I'll find you again. I swear it!", xi.msg.channel.PARTY, palName)
        elseif random == 5 then player:printToPlayer("We weren't supposed to fall here...!", xi.msg.channel.PARTY, palName)
        elseif random == 6 then player:printToPlayer("Hang on! Please, just hang on!", xi.msg.channel.PARTY, palName)
        elseif random == 7 then player:printToPlayer("I'll be waiting... so don't take too long, okay?", xi.msg.channel.PARTY, palName)
        elseif random == 8 then player:printToPlayer("You can't just leave me here... I'm not ready to do this without you!", xi.msg.channel.PARTY, palName)
        elseif random == 9 then player:printToPlayer("I knew I should've stepped in sooner!", xi.msg.channel.PARTY, palName)
        elseif random == 10 then player:printToPlayer("This isn't where our journey ends. It can't be.", xi.msg.channel.PARTY, palName)
        elseif random == 11 then player:printToPlayer("I'll find a way back to you. Promise.", xi.msg.channel.PARTY, palName)
        elseif random == 12 then player:printToPlayer("Please don't be gone for long... I don't like the silence.", xi.msg.channel.PARTY, palName)
        elseif random == 13 then player:printToPlayer("I'll keep my sword sharp until you return.", xi.msg.channel.PARTY, palName)
        elseif random == 14 then player:printToPlayer("I should've done more... I should've been braver!", xi.msg.channel.PARTY, palName)
        elseif random == 15 then player:printToPlayer("This wasn't supposed to happen. Not like this.", xi.msg.channel.PARTY, palName)
        elseif random == 16 then player:printToPlayer("Don't you dare be done. You hear me? Don't you dare!", xi.msg.channel.PARTY, palName)
        elseif random == 17 then player:printToPlayer("They won't keep us apart for long... I'll see you soon.", xi.msg.channel.PARTY, palName)
        elseif random == 18 then player:printToPlayer("You were supposed to teach me everything... not leave me behind!", xi.msg.channel.PARTY, palName)
        elseif random == 19 then player:printToPlayer("I'll retreat for now... until you're back where you belong.", xi.msg.channel.PARTY, palName)
        else player:printToPlayer("No more lessons today... I'll see you when you rise again.", xi.msg.channel.PARTY, palName) end
    end
end

xi.xispal.idleSquireChat = function(pal, player)
    local palName  = pal:getPacketName()

    if player == nil then
        return
    end

    local zone     = player:getZone()

    if zone == nil then
        return
    end

    local zoneType = zone:getTypeMask()
    local weather  = zone:getWeather()

    if player:getCharVar('[XISP]squireIdleChat') < GetSystemTime() then
        player:setCharVar('[XISP]squireIdleChat', GetSystemTime() + math.random(720, 900)) -- 12 to 15 min

        if zoneType == xi.zoneType.CITY then
            local random = math.random(1, 200)

            if random == 1 then player:printToPlayer("Ah, the smell of roasted almonds again. It's good to be back.", xi.msg.channel.PARTY, palName)
            elseif random == 2 then player:printToPlayer("Think they'll let me try on that fancy armor in the shop?", xi.msg.channel.PARTY, palName)
            elseif random == 3 then player:printToPlayer("Cities always make my feet hurt. Too much stone, not enough grass.", xi.msg.channel.PARTY, palName)
            elseif random == 4 then player:printToPlayer("I wonder what it's like to sleep in a real bed. Not that I'm hinting, Master.", xi.msg.channel.PARTY, palName)
            elseif random == 5 then player:printToPlayer("This city buzzes like a beehive. I prefer the quiet of the field.", xi.msg.channel.PARTY, palName)
            elseif random == 6 then player:printToPlayer("Do you think they'd sell me a sword if I asked nicely? Or lied about my age?", xi.msg.channel.PARTY, palName)
            elseif random == 7 then player:printToPlayer("Smells like burnt chocobo tailfeathers around here. Must be the food stalls.", xi.msg.channel.PARTY, palName)
            elseif random == 8 then player:printToPlayer("That merchant gave me a funny look. Maybe I shouldn't have touched the fruit.", xi.msg.channel.PARTY, palName)
            elseif random == 9 then player:printToPlayer("Oh no. It's the guard who chased me for climbing the fountain last time.", xi.msg.channel.PARTY, palName)
            elseif random == 10 then player:printToPlayer("A proper squire should act with dignity in a place like this. I'll try.", xi.msg.channel.PARTY, palName)
            elseif random == 11 then player:printToPlayer("So many people. I always forget how loud cities are.", xi.msg.channel.PARTY, palName)
            elseif random == 12 then player:printToPlayer("They've got roast dodo legs on sticks! Can we stop? Please?", xi.msg.channel.PARTY, palName)
            elseif random == 13 then player:printToPlayer("I think someone just called me a street urchin. Rude, but not inaccurate.", xi.msg.channel.PARTY, palName)
            elseif random == 14 then player:printToPlayer("Some of these nobles wouldn't last a bell out in the wild.", xi.msg.channel.PARTY, palName)
            elseif random == 15 then player:printToPlayer("If I had gil for every time I got lost here, I'd own that jewelry stall.", xi.msg.channel.PARTY, palName)
            elseif random == 16 then player:printToPlayer("The city makes me itch. Too many rules, not enough trees.", xi.msg.channel.PARTY, palName)
            elseif random == 17 then player:printToPlayer("That bard just winked at me. Should I be worried or flattered?", xi.msg.channel.PARTY, palName)
            elseif random == 18 then player:printToPlayer("This place has more alleys than an ant colony.", xi.msg.channel.PARTY, palName)
            elseif random == 19 then player:printToPlayer("I swear, that chocobo looked at me funny.", xi.msg.channel.PARTY, palName)
            elseif random == 20 then player:printToPlayer("Ah, Master. We're not in danger of being eaten here. Strange feeling.", xi.msg.channel.PARTY, palName)
            elseif random == 21 then player:printToPlayer("I saw a kid juggling daggers. Should I be impressed or report him?", xi.msg.channel.PARTY, palName)
            elseif random == 22 then player:printToPlayer("I overheard someone selling 'invisible boots'. Sounds like a scam.", xi.msg.channel.PARTY, palName)
            elseif random == 23 then player:printToPlayer("Do you think I could pass as a noble's apprentice? Just for the free food.", xi.msg.channel.PARTY, palName)
            elseif random == 24 then player:printToPlayer("Everyone's in such a rush. What's the hurry? We'll all still be poor tomorrow.", xi.msg.channel.PARTY, palName)
            elseif random == 25 then player:printToPlayer("Careful, Master. That shopkeeper looks like he'd sell your boots back to you.", xi.msg.channel.PARTY, palName)
            elseif random == 26 then player:printToPlayer("The cobblestones are prettier than some of the nobles.", xi.msg.channel.PARTY, palName)
            elseif random == 27 then player:printToPlayer("How do these people live packed so close together? I'd go mad.", xi.msg.channel.PARTY, palName)
            elseif random == 28 then player:printToPlayer("My coin pouch is still here. That's a good start.", xi.msg.channel.PARTY, palName)
            elseif random == 29 then player:printToPlayer("If I get lost, look for the bakery. I'll be near it. Inside, probably.", xi.msg.channel.PARTY, palName)
            elseif random == 30 then player:printToPlayer("Let's not stay too long, Master. I miss the wind on my face.", xi.msg.channel.PARTY, palName)
            elseif random == 31 then player:printToPlayer("The city has its charm. Mostly in the form of pie.", xi.msg.channel.PARTY, palName)
            elseif random == 32 then player:printToPlayer("Saw a mage buy a rock for 500 gil. I'm in the wrong profession.", xi.msg.channel.PARTY, palName)
            elseif random == 33 then player:printToPlayer("They say every stone here has a story. Bet most of them involve tripping.", xi.msg.channel.PARTY, palName)
            elseif random == 34 then player:printToPlayer("I'm not lost. I'm just exploring with a severe lack of direction.", xi.msg.channel.PARTY, palName)
            elseif random == 35 then player:printToPlayer("Oh! That lady just dropped a purse! Wait... is that bait?", xi.msg.channel.PARTY, palName)
            elseif random == 36 then player:printToPlayer("I can't tell if that guard is staring at me or asleep standing up.", xi.msg.channel.PARTY, palName)
            elseif random == 37 then player:printToPlayer("Do we have time for a quick pastry run? For morale, Master.", xi.msg.channel.PARTY, palName)
            elseif random == 38 then player:printToPlayer("Do they really need this many guards? What are they guarding? The pigeons?", xi.msg.channel.PARTY, palName)
            elseif random == 39 then player:printToPlayer("City life is noisy, crowded, and overpriced... but the food is good.", xi.msg.channel.PARTY, palName)
            elseif random == 40 then player:printToPlayer("If I had a gil for every time I've heard 'Watch where you're going!'", xi.msg.channel.PARTY, palName)
            elseif random == 41 then player:printToPlayer("Should I bow to that guy? He looks important... or constipated.", xi.msg.channel.PARTY, palName)
            elseif random == 42 then player:printToPlayer("Let's not spend our earnings on trinkets... even if they sparkle.", xi.msg.channel.PARTY, palName)
            elseif random == 43 then player:printToPlayer("The city is a maze. A loud, smelly maze with overpriced maps.", xi.msg.channel.PARTY, palName)
            elseif random == 44 then player:printToPlayer("I'm starting to understand why so many adventurers drink in these parts.", xi.msg.channel.PARTY, palName)
            elseif random == 45 then player:printToPlayer("Did I just get judged by a cat? I swear it narrowed its eyes at me.", xi.msg.channel.PARTY, palName)
            elseif random == 46 then player:printToPlayer("One day, Master, I'll have a tavern table with my name etched into it.", xi.msg.channel.PARTY, palName)
            elseif random == 47 then player:printToPlayer("You know what this place needs? Trees. And less people yelling.", xi.msg.channel.PARTY, palName)
            elseif random == 48 then player:printToPlayer("If anyone asks, I'm not the one who knocked over the fruit stand.", xi.msg.channel.PARTY, palName)
            elseif random == 49 then player:printToPlayer("They have fountains here that spit water. Can I put my head in one?", xi.msg.channel.PARTY, palName)
            elseif random == 50 then player:printToPlayer("I could get used to this pace... if my boots weren't soaked.", xi.msg.channel.PARTY, palName)
            elseif random == 51 then player:printToPlayer("It's so clean here. I'm afraid to breathe too hard and ruin it.", xi.msg.channel.PARTY, palName)
            elseif random == 52 then player:printToPlayer("Saw someone selling 'genuine dragon scales'. Looked suspiciously like fish.", xi.msg.channel.PARTY, palName)
            elseif random == 53 then player:printToPlayer("One of the guards winked at me. Or he had dust in his eye. Either way, I'm flattered.", xi.msg.channel.PARTY, palName)
            elseif random == 54 then player:printToPlayer("I swear that statue moved. No, really! It looked at me funny.", xi.msg.channel.PARTY, palName)
            elseif random == 55 then player:printToPlayer("Do you think they'd let me sing for coin? I only know marching chants.", xi.msg.channel.PARTY, palName)
            elseif random == 56 then player:printToPlayer("You smell that? Fried something. We should investigate. Thoroughly.", xi.msg.channel.PARTY, palName)
            elseif random == 57 then player:printToPlayer("Every building looks the same to me. I hope you know where we're going.", xi.msg.channel.PARTY, palName)
            elseif random == 58 then player:printToPlayer("I saw a child pickpocket two men in a blink. I should ask him for tips.", xi.msg.channel.PARTY, palName)
            elseif random == 59 then player:printToPlayer("These steps are brutal. Who builds cities on hills?", xi.msg.channel.PARTY, palName)
            elseif random == 60 then player:printToPlayer("If I had to wear one of those heavy noble coats, I'd melt.", xi.msg.channel.PARTY, palName)
            elseif random == 61 then player:printToPlayer("Master, did we remember to lock our storage chest? City folk are sneaky.", xi.msg.channel.PARTY, palName)
            elseif random == 62 then player:printToPlayer("Don't look now, but I think that merchant is following us.", xi.msg.channel.PARTY, palName)
            elseif random == 63 then player:printToPlayer("This place has too many rules. I just got scolded for leaning on a wall.", xi.msg.channel.PARTY, palName)
            elseif random == 64 then player:printToPlayer("Imagine owning a shop here. I'd probably just eat all my stock.", xi.msg.channel.PARTY, palName)
            elseif random == 65 then player:printToPlayer("Can I climb that fountain again? I promise not to fall this time.", xi.msg.channel.PARTY, palName)
            elseif random == 66 then player:printToPlayer("You'd think a city this big would have a better map.", xi.msg.channel.PARTY, palName)
            elseif random == 67 then player:printToPlayer("If I get turned around again, just leave breadcrumbs, alright?", xi.msg.channel.PARTY, palName)
            elseif random == 68 then player:printToPlayer("I passed a bakery three times now... or three different bakeries?", xi.msg.channel.PARTY, palName)
            elseif random == 69 then player:printToPlayer("These cobblestones are oddly well swept. Suspiciously clean.", xi.msg.channel.PARTY, palName)
            elseif random == 70 then player:printToPlayer("I'd rather face a goblin horde than haggle with that fruit vendor again.", xi.msg.channel.PARTY, palName)
            elseif random == 71 then player:printToPlayer("A squire's life isn't supposed to involve this much window shopping.", xi.msg.channel.PARTY, palName)
            elseif random == 72 then player:printToPlayer("Let's get what we need and go. The city makes me twitchy.", xi.msg.channel.PARTY, palName)
            elseif random == 73 then player:printToPlayer("If you see me staring, I'm just imagining life as a rich merchant.", xi.msg.channel.PARTY, palName)
            elseif random == 74 then player:printToPlayer("Did that noble just say I smelled of 'stable'? Rude. And accurate.", xi.msg.channel.PARTY, palName)
            elseif random == 75 then player:printToPlayer("One more street performer and I'm throwing gil just to make them stop.", xi.msg.channel.PARTY, palName)
            elseif random == 76 then player:printToPlayer("Cities are good for one thing, finding new boots when yours fall apart.", xi.msg.channel.PARTY, palName)
            elseif random == 77 then player:printToPlayer("I don't trust that innkeeper. He's got a shifty mustache.", xi.msg.channel.PARTY, palName)
            elseif random == 78 then player:printToPlayer("They should call this place Gil's End. I've already spent too much.", xi.msg.channel.PARTY, palName)
            elseif random == 79 then player:printToPlayer("A cat just followed me for three blocks. I think it wants a name.", xi.msg.channel.PARTY, palName)
            elseif random == 80 then player:printToPlayer("Master, I think we need to clean our gear. We're starting to draw flies.", xi.msg.channel.PARTY, palName)
            elseif random == 81 then player:printToPlayer("Some cities have songs written about them. This one probably has a complaint list.", xi.msg.channel.PARTY, palName)
            elseif random == 82 then player:printToPlayer("I never know how to act around nobles. Stand tall? Bow? Run?", xi.msg.channel.PARTY, palName)
            elseif random == 83 then player:printToPlayer("I saw someone juggling fire. It ended exactly how you'd expect.", xi.msg.channel.PARTY, palName)
            elseif random == 84 then player:printToPlayer("Can I take my boots off just for a bit? My toes feel like pickles.", xi.msg.channel.PARTY, palName)
            elseif random == 85 then player:printToPlayer("I've counted twelve taverns already. Why do they need so many?", xi.msg.channel.PARTY, palName)
            elseif random == 86 then player:printToPlayer("Let's avoid the market square. I'm still banned from there. Long story.", xi.msg.channel.PARTY, palName)
            elseif random == 87 then player:printToPlayer("Is it just me, or is every alley whispering secrets?", xi.msg.channel.PARTY, palName)
            elseif random == 88 then player:printToPlayer("The armor shops here make me drool. Not literally. Anymore.", xi.msg.channel.PARTY, palName)
            elseif random == 89 then player:printToPlayer("You know you're in a city when even the birds sound annoyed.", xi.msg.channel.PARTY, palName)
            elseif random == 90 then player:printToPlayer("I don't need a bath. I've had two this month already.", xi.msg.channel.PARTY, palName)
            elseif random == 91 then player:printToPlayer("We could stay here a night, maybe two... just until my legs stop hurting.", xi.msg.channel.PARTY, palName)
            elseif random == 92 then player:printToPlayer("They say this place never sleeps. I might challenge that with a nap.", xi.msg.channel.PARTY, palName)
            elseif random == 93 then player:printToPlayer("Hey, Master. Let's not mention the fountain incident to the guards, alright?", xi.msg.channel.PARTY, palName)
            elseif random == 94 then player:printToPlayer("I'd trade my left boot for a warm pie... actually, both boots.", xi.msg.channel.PARTY, palName)
            elseif random == 95 then player:printToPlayer("This city may be full of life, but I prefer the kind that doesn't yell all day.", xi.msg.channel.PARTY, palName)
            elseif random == 96 then player:printToPlayer("Do you ever feel like everyone's staring? Just me?", xi.msg.channel.PARTY, palName)
            elseif random == 97 then player:printToPlayer("Look at that tower! Bet it's got a hundred stairs... no thank you.", xi.msg.channel.PARTY, palName)
            elseif random == 98 then player:printToPlayer("I wonder if any of the shops take moss-covered coins.", xi.msg.channel.PARTY, palName)
            elseif random == 99 then player:printToPlayer("At least cities have clean water. No frogs, no slime, just cold and crisp.", xi.msg.channel.PARTY, palName)
            elseif random == 100 then player:printToPlayer("Alright, Master. I've talked enough. But this place brings it out of me.", xi.msg.channel.PARTY, palName)
            elseif random == 101 then player:printToPlayer("This city smells like spices and wet stone. Oddly comforting.", xi.msg.channel.PARTY, palName)
            elseif random == 102 then player:printToPlayer("I almost bought a hat I didn't need. Cities are dangerous like that.", xi.msg.channel.PARTY, palName)
            elseif random == 103 then player:printToPlayer("We should get matching cloaks. Something flashy to scare off pickpockets.", xi.msg.channel.PARTY, palName)
            elseif random == 104 then player:printToPlayer("They say the best deals are found in alleys. Sounds like a trap to me.", xi.msg.channel.PARTY, palName)
            elseif random == 105 then player:printToPlayer("That bard's been playing the same tune for hours. It's haunting me.", xi.msg.channel.PARTY, palName)
            elseif random == 106 then player:printToPlayer("Master, are we staying long? My coin pouch is getting nervous.", xi.msg.channel.PARTY, palName)
            elseif random == 107 then player:printToPlayer("I tried to impress a vendor with my sword. Got a discount and a lecture.", xi.msg.channel.PARTY, palName)
            elseif random == 108 then player:printToPlayer("Why do nobles always look like they smelled something bad?", xi.msg.channel.PARTY, palName)
            elseif random == 109 then player:printToPlayer("I think I just stepped on something valuable. Or sticky. Possibly both.", xi.msg.channel.PARTY, palName)
            elseif random == 110 then player:printToPlayer("Someone asked me if I was your bodyguard. I didn't correct them.", xi.msg.channel.PARTY, palName)
            elseif random == 111 then player:printToPlayer("I got lost and ended up in a garden. Best mistake I've made today.", xi.msg.channel.PARTY, palName)
            elseif random == 112 then player:printToPlayer("Some folks live their whole lives in one city. Can you imagine?", xi.msg.channel.PARTY, palName)
            elseif random == 113 then player:printToPlayer("I'm starting to recognize the pigeons here. That can't be good.", xi.msg.channel.PARTY, palName)
            elseif random == 114 then player:printToPlayer("My boots are echoing too loudly. I feel like a one-man parade.", xi.msg.channel.PARTY, palName)
            elseif random == 115 then player:printToPlayer("They've got fountains, music, and food. We should build a house here.", xi.msg.channel.PARTY, palName)
            elseif random == 116 then player:printToPlayer("A merchant tried to sell me a 'lucky rock'. I think it was just a rock.", xi.msg.channel.PARTY, palName)
            elseif random == 117 then player:printToPlayer("This city could use more signs. Or fewer identical alleys.", xi.msg.channel.PARTY, palName)
            elseif random == 118 then player:printToPlayer("I could spend all day in the market. And all our gil, too.", xi.msg.channel.PARTY, palName)
            elseif random == 119 then player:printToPlayer("Why do all the statues have stern faces? Lighten up, stone man!", xi.msg.channel.PARTY, palName)
            elseif random == 120 then player:printToPlayer("I caught a glimpse of myself in a shop mirror. We clean up alright.", xi.msg.channel.PARTY, palName)
            elseif random == 121 then player:printToPlayer("Even the street dogs here look fancy. Do they have jobs?", xi.msg.channel.PARTY, palName)
            elseif random == 122 then player:printToPlayer("A kid offered to shine my boots. Then he just ran off. Smooth.", xi.msg.channel.PARTY, palName)
            elseif random == 123 then player:printToPlayer("I saw a street magician vanish a purse... I don't think it was a trick.", xi.msg.channel.PARTY, palName)
            elseif random == 124 then player:printToPlayer("Let's not make eye contact with any more recruiters. Please.", xi.msg.channel.PARTY, palName)
            elseif random == 125 then player:printToPlayer("You think we could blend in with a noble crowd? I'd need a wig.", xi.msg.channel.PARTY, palName)
            elseif random == 126 then player:printToPlayer("I could eat something that didn't come from a campfire for once.", xi.msg.channel.PARTY, palName)
            elseif random == 127 then player:printToPlayer("Everything's so tall here. I feel like an ant. A dirty ant.", xi.msg.channel.PARTY, palName)
            elseif random == 128 then player:printToPlayer("Master, remind me again why we didn't just stay at that nice inn?", xi.msg.channel.PARTY, palName)
            elseif random == 129 then player:printToPlayer("I could get used to sleeping in a bed with sheets again.", xi.msg.channel.PARTY, palName)
            elseif random == 130 then player:printToPlayer("Someone said my armor looked 'rustic'. I think that was an insult.", xi.msg.channel.PARTY, palName)
            elseif random == 131 then player:printToPlayer("Is it just me, or does every shopkeeper have the same laugh?", xi.msg.channel.PARTY, palName)
            elseif random == 132 then player:printToPlayer("I saw a merchant cleaning coins with his sleeve. Classy.", xi.msg.channel.PARTY, palName)
            elseif random == 133 then player:printToPlayer("If I wave to the guards, they frown. If I don't, they frown. I can't win.", xi.msg.channel.PARTY, palName)
            elseif random == 134 then player:printToPlayer("That alley smells like regret and bad decisions.", xi.msg.channel.PARTY, palName)
            elseif random == 135 then player:printToPlayer("We should come back here during a festival. I want to see you dance.", xi.msg.channel.PARTY, palName)
            elseif random == 136 then player:printToPlayer("The last time I drank city wine, I woke up with a tattoo.", xi.msg.channel.PARTY, palName)
            elseif random == 137 then player:printToPlayer("Even the pigeons here walk with pride. City's got to them too.", xi.msg.channel.PARTY, palName)
            elseif random == 138 then player:printToPlayer("A bard tried to rhyme my name. Gave up halfway. I don't blame them.", xi.msg.channel.PARTY, palName)
            elseif random == 139 then player:printToPlayer("If I disappear for a while, I'm probably lost in a bakery.", xi.msg.channel.PARTY, palName)
            elseif random == 140 then player:printToPlayer("They should charge for city air. It smells like someone's cooking dreams.", xi.msg.channel.PARTY, palName)
            elseif random == 141 then player:printToPlayer("Is that a parade? Or a riot? Hard to tell here.", xi.msg.channel.PARTY, palName)
            elseif random == 142 then player:printToPlayer("I miss trees. These stone walls make me twitchy.", xi.msg.channel.PARTY, palName)
            elseif random == 143 then player:printToPlayer("This place feels like a maze. I should've brought breadcrumbs.", xi.msg.channel.PARTY, palName)
            elseif random == 144 then player:printToPlayer("I tried haggling. Ended up paying more. I'm a natural.", xi.msg.channel.PARTY, palName)
            elseif random == 145 then player:printToPlayer("You think nobles ever walk these streets? Or do they just float around?", xi.msg.channel.PARTY, palName)
            elseif random == 146 then player:printToPlayer("All this noise. Makes me miss the quiet of campfires.", xi.msg.channel.PARTY, palName)
            elseif random == 147 then player:printToPlayer("I like the food here. I don't like the price.", xi.msg.channel.PARTY, palName)
            elseif random == 148 then player:printToPlayer("Master, if I vanish, assume I got adopted by a street theatre troupe.", xi.msg.channel.PARTY, palName)
            elseif random == 149 then player:printToPlayer("I asked for directions and got a lecture. City folk are intense.", xi.msg.channel.PARTY, palName)
            elseif random == 150 then player:printToPlayer("Let's avoid that tavern. The ale tastes like regret and roof water.", xi.msg.channel.PARTY, palName)
            elseif random == 151 then player:printToPlayer("If I were a noble, I'd outlaw cobblestones. My feet would thank me.", xi.msg.channel.PARTY, palName)
            elseif random == 152 then player:printToPlayer("Do city rats wear cloaks, or was I hallucinating again?", xi.msg.channel.PARTY, palName)
            elseif random == 153 then player:printToPlayer("This place has more alley cats than guards. Maybe that's intentional.", xi.msg.channel.PARTY, palName)
            elseif random == 154 then player:printToPlayer("You ever wonder how many secrets these walls have heard?", xi.msg.channel.PARTY, palName)
            elseif random == 155 then player:printToPlayer("The sun reflects off the stone here like it's trying to blind me.", xi.msg.channel.PARTY, palName)
            elseif random == 156 then player:printToPlayer("You'd think with all the people, someone would've said 'hello'.", xi.msg.channel.PARTY, palName)
            elseif random == 157 then player:printToPlayer("Master, I saw a man fight a goose and lose. This city is wild.", xi.msg.channel.PARTY, palName)
            elseif random == 158 then player:printToPlayer("Is it weird I kind of like the smell of blacksmiths' shops?", xi.msg.channel.PARTY, palName)
            elseif random == 159 then player:printToPlayer("There's a bird on that chimney that's been staring at me for hours.", xi.msg.channel.PARTY, palName)
            elseif random == 160 then player:printToPlayer("Some day, I want to be rich enough to complain about soup.", xi.msg.channel.PARTY, palName)
            elseif random == 161 then player:printToPlayer("There's something about city rain. Feels like it washes away more than dirt.", xi.msg.channel.PARTY, palName)
            elseif random == 162 then player:printToPlayer("I saw a kid juggling knives in the plaza. Remind me to never owe him money.", xi.msg.channel.PARTY, palName)
            elseif random == 163 then player:printToPlayer("Master, I think someone just offered to sell me a ghost.", xi.msg.channel.PARTY, palName)
            elseif random == 164 then player:printToPlayer("You ever notice how everyone in cities walks like they're late for something?", xi.msg.channel.PARTY, palName)
            elseif random == 165 then player:printToPlayer("If I had a gil for every suspicious look I got, we could afford real armor.", xi.msg.channel.PARTY, palName)
            elseif random == 166 then player:printToPlayer("A street performer asked for volunteers. I ran.", xi.msg.channel.PARTY, palName)
            elseif random == 167 then player:printToPlayer("It's strange seeing so many people and still feeling alone.", xi.msg.channel.PARTY, palName)
            elseif random == 168 then player:printToPlayer("The way some folks look at us... like we don't belong. Maybe we don't.", xi.msg.channel.PARTY, palName)
            elseif random == 169 then player:printToPlayer("A noble spilled wine on me and didn't even blink. I'll remember that.", xi.msg.channel.PARTY, palName)
            elseif random == 170 then player:printToPlayer("You think we'll ever own a house here? One with a garden?", xi.msg.channel.PARTY, palName)
            elseif random == 171 then player:printToPlayer("They say every street has a secret. I just want one with less garbage.", xi.msg.channel.PARTY, palName)
            elseif random == 172 then player:printToPlayer("A girl gave me a flower. Then tried to sell me three more.", xi.msg.channel.PARTY, palName)
            elseif random == 173 then player:printToPlayer("Someone tried to pick my pocket. Joke's on them, I'm broke.", xi.msg.channel.PARTY, palName)
            elseif random == 174 then player:printToPlayer("You can hear music on every corner. I wonder what they play for themselves.", xi.msg.channel.PARTY, palName)
            elseif random == 175 then player:printToPlayer("I miss the stars. These lamps are too bright and not half as kind.", xi.msg.channel.PARTY, palName)
            elseif random == 176 then player:printToPlayer("Master, I saw someone wearing a cloak made of feathers. Real ones.", xi.msg.channel.PARTY, palName)
            elseif random == 177 then player:printToPlayer("A cat followed me from a bakery. I think I'm its new parent now.", xi.msg.channel.PARTY, palName)
            elseif random == 178 then player:printToPlayer("Cities make me nervous. So many people pretending not to look at you.", xi.msg.channel.PARTY, palName)
            elseif random == 179 then player:printToPlayer("We walked by a nobleman. He sniffed and turned away. My armor isn't that bad!", xi.msg.channel.PARTY, palName)
            elseif random == 180 then player:printToPlayer("If I vanish, assume I joined a theater troupe or got lost in a pastry shop.", xi.msg.channel.PARTY, palName)
            elseif random == 181 then player:printToPlayer("The market smells like spices and ambition.", xi.msg.channel.PARTY, palName)
            elseif random == 182 then player:printToPlayer("I tried city stew once. It was... a flavor. Not good. But a flavor.", xi.msg.channel.PARTY, palName)
            elseif random == 183 then player:printToPlayer("A kid asked if I was a knight. I said yes... don't tell anyone.", xi.msg.channel.PARTY, palName)
            elseif random == 184 then player:printToPlayer("Someone offered me a 'potion of boldness'. It was just hot tea.", xi.msg.channel.PARTY, palName)
            elseif random == 185 then player:printToPlayer("I think one of those pigeons is following us. Look at his eyes!", xi.msg.channel.PARTY, palName)
            elseif random == 186 then player:printToPlayer("Do you think guards ever laugh? I've never seen it happen.", xi.msg.channel.PARTY, palName)
            elseif random == 187 then player:printToPlayer("I saw a man fencing a fish in the square. City life is strange.", xi.msg.channel.PARTY, palName)
            elseif random == 188 then player:printToPlayer("The innkeeper tried to charge me extra for 'road dust'.", xi.msg.channel.PARTY, palName)
            elseif random == 189 then player:printToPlayer("I heard a rumor about a ghost in the cathedral. Should we investigate?", xi.msg.channel.PARTY, palName)
            elseif random == 190 then player:printToPlayer("One day, we'll walk these streets as heroes. Not just travelers.", xi.msg.channel.PARTY, palName)
            elseif random == 191 then player:printToPlayer("Someone told me I had the 'face of a mercenary'. Is that a compliment?", xi.msg.channel.PARTY, palName)
            elseif random == 192 then player:printToPlayer("Even the chickens here strut like royalty.", xi.msg.channel.PARTY, palName)
            elseif random == 193 then player:printToPlayer("A smith complimented my blade. Then offered to buy it. I ran.", xi.msg.channel.PARTY, palName)
            elseif random == 194 then player:printToPlayer("Do you smell cinnamon? Or is that just my imagination again?", xi.msg.channel.PARTY, palName)
            elseif random == 195 then player:printToPlayer("Master, let's not drink that glowing blue wine again.", xi.msg.channel.PARTY, palName)
            elseif random == 196 then player:printToPlayer("That minstrel's ballad sounded suspiciously like our last battle...", xi.msg.channel.PARTY, palName)
            elseif random == 197 then player:printToPlayer("I bought a scarf. No idea why. Felt right.", xi.msg.channel.PARTY, palName)
            elseif random == 198 then player:printToPlayer("City folk sure like to talk. And talk. And talk.", xi.msg.channel.PARTY, palName)
            elseif random == 199 then player:printToPlayer("I think that guard was hitting on me or issuing a warning. Or both?", xi.msg.channel.PARTY, palName)
            elseif random == 200 then player:printToPlayer("It's funny. I used to dream of cities. Now I dream of trees.", xi.msg.channel.PARTY, palName)
            end

        elseif zoneType == xi.zoneType.OUTDOORS then
            if weather == xi.weather.RAIN or weather == xi.weather.SQUALL then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("Rain again? My socks haven't been dry since Jeuno.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("If this keeps up, we'll need a boat instead of boots.", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("It's not the monsters I fear, it's the soggy cloaks.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("Even the trees look miserable in this downpour.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("You ever seen a goblin slip in the mud? It's a rare treat.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("Rain like this always makes me think someone's watching. Don't ask why.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("I hope our next destination has a roof.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("Careful, the mud's slick. I nearly lost a boot back there.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("If this keeps up, I might grow mushrooms on my armor.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("Can't tell if that's thunder or my stomach complaining.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("Rain makes the world feel heavier. Or maybe that's just my gear.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Master, why does everything smell worse when it's wet?", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("This weather would make even a behemoth grumble.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("The road is mud, my cloak is soup, and I miss dry bread.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Something about rain makes all the monsters bolder. Or maybe I'm just colder.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("I'm soaked through. Again. Just thought I'd share.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("If you're trying to look heroic, wet hair isn't helping.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("They say rain washes away bad luck. Let's hope they're right.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("I think even the chocobos are hiding from this storm.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("This storm better not wash out the trail again.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("A warm fire sounds like a dream right now.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("Master, my gear is rusting as we speak.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("At least the rain masks our scent... or so I hope.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("If I sneeze and alert a beast, it's the rain's fault.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("A little lightning makes everything dramatic. Try striking a pose next time it flashes.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("Do you think ghosts get wetter than us?", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("The weather suits your mood, doesn't it?", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("I know we're heroes and all, but couldn't we hero in the dry?", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("Even the slimes are staying indoors. What does that tell you?", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("Who needs a shower when the sky won't stop dumping water on us?", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("The wind howls like it's trying to chase us off. Not today, sky!", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("Everything smells like wet dog... and we don't have a dog.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("Maybe we can bottle this rain and sell it in Bastok... 'Adventurer Essence.'", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("If lightning strikes me, I expect a statue in Windurst.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("I'm wet, tired, and I swear this puddle just moved.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("Even my thoughts are damp.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("If this keeps up, I'm naming my next sword 'The Sponge.'", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("You know, a warm inn sounds pretty good right about now.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("We're either brave or soaked fools. Probably both.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("The sky weeps like a bard after too much wine.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Raindrops on plate armor are louder than they should be.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("I can't tell if the splash was me stepping or something lurking.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("I could swear that tree just coughed. Or maybe it was me.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("Let's make a pact: if one of us starts growing moss, the other speaks up.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("I think my armor gained weight from all the water.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("Every squelch I hear could be my boot or something slimy.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("I wonder if the weather spirits are just in a mood today.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("Keep your sword sharp, even when the skies cry.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("You're still leading, rain or no. Just don't get us lost again.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("No fire, no shelter, and soaked socks. Perfect adventuring weather, huh?", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.WIND or weather == xi.weather.GALES then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("The wind's got a mind of its own today. Trying to mess with us, I bet.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("If the wind picks up any more, I might just take flight. Careful below!", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("My cloak is doing more flapping than guarding. Hardly useful in this gale.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("Wind's like an unruly horse ,  you gotta hold tight or get tossed.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("I'm starting to think the wind wants to race us. Spoiler: it's winning.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("The gusts keep messing with my footing. I'm not made for ballet, you know.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("If this wind was a foe, I'd name it 'The Annoying One.'", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("The wind's howling like it's got a score to settle. Hope it's not with us.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("I nearly lost my helmet twice. You're lucky I caught it before it flew away.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("I'm half expecting the wind to blow a wyvern our way. Just my luck.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("The breeze today's got more bite than a hungry goblin. Watch your back.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Careful when you swing your sword. The wind might just catch it mid-air.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("Wind's picking up the dust like it's dusting a shelf. Annoying as ever.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("If I didn't know better, I'd say the wind's playing tricks on us.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("I can't tell if I'm shivering from cold or just the wind's teasing.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("The gusts are so strong, I'm starting to question my balance.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("This wind's testing my patience and my armor's sturdiness.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("Did the wind just carry a laugh? Or am I imagining things?", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("Even the trees seem to be bowing to this fierce wind.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("If the wind gets any stronger, I'll need to tie myself down.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("You think the wind can hear us? Might want to watch what we say.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("I'm convinced the wind's conspiring with the wyverns today.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("The wind's messing with my helmet straps. I'm not a fan.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("The gust almost knocked me off my feet. Maybe it's time to sit down.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("I swear the wind just carried away my last good mood.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("If the wind blows any harder, I'll be flying instead of walking.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("This wind makes even the calmest moments feel like a battle.", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("The wind's fierce today. I'm grateful you're steadier than me.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("The gusts keep stealing my breath. Either that or I'm out of shape.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("Watch your footing. The wind's sneaky and the ground's slippery.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("I think I just lost a boot to the wind. Careful, you might be next.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("The wind's whipping around like it's angry. Guess it's had a bad day.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("If this wind was a weapon, it'd be a cruel, biting blade.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("The gusts remind me of the battlefield, chaotic and relentless.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("My cape's flapping so hard, it's like a flag of surrender.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("The wind's trying to whistle a tune. Unfortunately, it's off-key.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("I feel like the wind's challenging me to a duel. Not on my watch.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("This wind's got more attitude than half the soldiers I know.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("Hold onto your gear. The wind's eager to lighten our load.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("The gust nearly knocked my sword from my hand. Lucky reflexes.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("I'm starting to think the wind's got a grudge against us.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("The wind's stirring up dust and trouble alike.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("I can't hear myself think over this howling wind.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("If I were a kite, I'd be soaring by now. Not a squire, though.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("The wind's playing tricks with shadows. Stay alert.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("Better keep your cloak tight. The wind's a relentless foe.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("I'm getting dizzy just from fighting the wind. Time for a break?", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("If the wind keeps this up, I might need a helmet tether.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("The gust nearly swept me off my feet. I'll be sticking close to you.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("The wind's making a nuisance of itself again. It's almost impressive.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.HOT_SPELL or weather == xi.weather.HEAT_WAVE then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("The sun's beating down hard. Feels like the whole sky's on fire today.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("This heat's making me wonder if the earth itself is boiling beneath us.", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("Sweat's running down my back like a river. Could use a nice breeze right now.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("I'm not sure if it's the heat or you making things hotter out here.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("The sun's glare's sharp enough to blind a hawk. Watch your step, alright?", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("Feels like the desert sands are creeping into the air. Keep hydrated out there.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("If this heat keeps up, I'm volunteering for the next swim in the lake.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("Even the lizards are hiding from this blaze. I'm starting to get why.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("My armor's sticking to me like a second skin. This heat's no joke.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("The ground's shimmering with heat waves. Hard to believe we're still moving.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("You're lucky you don't sweat as much as I do. I'm a mess under this sun.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Even the birds are quiet, like they're conserving energy in this blazing heat.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("This sun's a relentless beast today. Don't get careless in this furnace.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("I can feel the sweat drying before it even hits the ground. We're baking out here.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Keep your water close. This heat could drain even the strongest warrior.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("I'm half expecting the earth to crack and spit fire with this blazing weather.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("The sun's turned the world into a frying pan. I'm hoping for a shade soon.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("Feels like we're walking through the forge of the gods themselves today.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("I envy the rocks for just sitting there, soaking up all this heat without moving.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("The air's so thick with heat it feels like wading through molasses.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("Even the wind's got no chill today. It's like a warm breath of the desert.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("I think the sun's got a personal grudge against us today. It's relentless.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("My throat's dry enough to start speaking in tongues. Better find some water.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("If this heat were any stronger, it'd cook us like stew in a pot.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("I swear the sun's trying to melt the very metal of my armor.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("Stay alert. Heat like this can wear down even the toughest fighter.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("I'm starting to question if the sun's a friend or a cruel enemy today.", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("Your face's as red as a roasted beet. Don't tell me you're feeling this heat too.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("The horizon looks like it's melting into the sky. This heat's playing tricks.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("I'm counting the moments until we find some shade or a cold drink.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("This heat's got me thinking about ice cream. Ever hear of that, Master?", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("Even the toughest trees look wilted. Nature's feeling this blaze just like us.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("I'd suggest we march faster, but my legs feel like lead in this inferno.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("The sun's a tyrant today. Better keep your wits about you.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("I can almost hear the earth groaning under this unending heat.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("Keep your hat on, or you'll fry faster than any beast in these lands.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("This weather's making me miss the cold winters of home. What a strange feeling.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("The sweat's dripping down, but we press on. No rest for us today.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("It's a good day to remember why shade is a gift from the gods.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("I'm not complaining, but this heat's making me grumpy. You feeling it too?", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("The sun's baking the earth, but your determination keeps us moving forward.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("I'm half expecting to see mirages dancing in the distance. Is it just me?", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("If we find a pool of water soon, I'm jumping in without hesitation.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("This heat's no joke. Don't push yourself too hard, alright?", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("I bet the sun's got a score to settle. Either way, we've got to survive.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("Your skin's glowing like a roasted chestnut. You sure you're alright?", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("The air's heavy with heat. I'm glad you're here to keep me focused.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("If the sun had a face, I'd tell it to ease up a bit. No luck so far.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("The world feels like it's simmering. I'm ready for the next cool breeze.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Even my sword feels warmer in this blazing sun. Let's finish this quickly.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.SNOW or weather == xi.weather.BLIZZARDS then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("The snow's piling up fast. Feels like the world's trying to freeze us out.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("My teeth're chattering like a thief's in a quiet town. You holding up alright?", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("The wind's biting sharper than any blade today. Keep your cloak tight.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("If we don't find shelter soon, I'll turn into a walking icicle.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("The snowflakes look peaceful, but the cold's anything but kind.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("Every step crunches underfoot. The silence in snow always feels eerie.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("You look like you could use a warm fire and a hot drink right about now.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("The frost's creeping in through my armor. This chill's relentless.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("I swear the snow's trying to swallow us whole. Watch your footing.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("I'm dreaming of a fireplace. This cold's testing my patience.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("Even the stars seem dim behind this swirling snowstorm.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("If the cold were any harsher, I'd start believing in ghost stories.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("I'm pretty sure my fingers are starting to forget what warmth feels like.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("The snow's a blanket, but it's a heavy one. Keep your strength up.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Blizzards like this make me wish for a simpler life by the hearth.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("Watch your breath, it's turning into frost before it even leaves your lips.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("The cold's gnawing at my bones. You're tougher than you look, I'll give you that.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("The snow's turning the world into a white wasteland. It's almost beautiful.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("If we stay out here too long, we'll be frozen statues for the next traveler.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("I'm half convinced the snow's got a mind of its own, trying to trap us here.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("This cold makes even the fiercest warrior think twice. Keep your head clear.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("I hope the warmth of your spirit keeps you from freezing up like me.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("Snow's falling thick, and the wind's howling like a pack of wolves.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("If only we had a fire nearby. I'd trade my sword for a warm blanket right now.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("My boots are soaked and cold. I can only imagine how frozen you must feel.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("The chill in the air is unforgiving. Stay close so we don't lose each other.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("Snowflakes are falling so fast, they blur the path ahead. Eyes sharp, alright?", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("I'm not complaining, but I'd rather be anywhere but out here in this freeze.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("Even the toughest trees are bent low under the weight of the snow.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("I think I just saw my breath freeze mid-air. That's got to be a bad omen.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("The wind's so cold it feels like tiny needles pricking my skin.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("If you see any warmth around, grab it quick. We're running low on it here.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("This weather's a cruel test of endurance. I'm glad you're here to share it.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("I'm beginning to think snow is the world's way of punishing us.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("The world's quiet under all this snow... almost like it's holding its breath.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("We should find a warm inn soon, or I'll start thinking about hibernation.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("Your cheeks are as red as the berries that sometimes peek through the snow.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("If this keeps up, I'll start carving snowmen instead of fighting monsters.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("Snow's falling so thick it muffles even the loudest roars. Strange silence.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("I'm not sure what's colder, the snow or your glare when I complain.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Frost's creeping over the edges of my armor. Feels like I'm turning to ice.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("Keep moving and keep warm. Stopping means freezing, and freezing means trouble.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("I'm shivering just watching the snow fall. You holding up better than me?", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("The cold makes every breath feel like a battle. Let's not lose this fight.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("The snow's turning the world into a ghostly place. Makes me a little nervous.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("If only the warmth of the sun could break through this cold and gloom.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("I'm counting on your fire to keep my spirits from freezing solid.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("The blizzard's got us pinned, but no storm can keep me from watching your back.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("This cold's a cruel reminder of how fragile we are. Let's stay sharp.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Even the fiercest warriors feel the sting of winter. I'm glad you're here.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.THUNDER or weather == xi.weather.THUNDERSTORMS then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("The sky's roaring like a beast. Keep your guard up; lightning's no friend.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("Thunder cracks overhead, like the world itself is about to break apart.", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("Feel that electricity in the air? I swear it makes my hair stand on end.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("The storm's angry tonight. Don't let your guard down, no matter what.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("Every flash lights up the sky like the gods are throwing a tantrum.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("That rumble makes my chest tight. You holding steady or shaking in your boots?", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("Lightning's striking close. Could be a warning or just bad luck, either way, be ready.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("The rain's coming down hard, and the thunder's like drums of war echoing through Vanadiel.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("I don't mind a good storm, but this one feels like it's got a grudge against us.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("Storms like this make me wonder if the gods are watching or just messing with us.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("Lightning split a tree nearby. Remind me to avoid standing under those from now on.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Thunder's shaking the ground. Makes it hard to think straight, doesn't it?", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("Storms have a way of revealing what we're really made of. Ready to show me?", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("Every lightning flash paints the world in stark white. It's eerie but kind of beautiful.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("I'm not scared of thunder, but I'm not looking to get struck either.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("The storm's wild, but so are we. Let's keep moving and keep safe.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("That crack of thunder nearly made me drop my sword. Keep your wits about you.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("Thunderstorms are nature's way of reminding us who's boss. Doesn't mean we bow.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("I swear the sky's trying to tear itself apart. We'd better find shelter soon.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("Rain's soaking through my armor, but it's the thunder that really shakes me.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("Storm's got us pinned, but it won't pin me down. I'm watching your six.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("Feel that spark? Thunderstorms are wild magic at its finest, or worst.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("Lightning's a quick killer. Don't let your guard slip, even for a second.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("The storm's fury matches your fighting spirit. Let's show it who's stronger.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("Thunder rumbles like the growl of some giant beast. I'd rather not meet it.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("If we get caught in a lightning strike, I'll be blaming you for not dodging.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("The rain's stinging my eyes, but it's the thunder that makes me jump.", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("This storm's got a temper. I hope it's not aimed at us for too long.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("I'm starting to think the gods are having a bit too much fun with this thunder.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("We'll need to keep our heads clear if this storm's gonna last all day.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("Thunder's shaking the very earth beneath us. Makes even the brave hesitate.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("If the sky falls, I'm trusting you to catch me. Don't let me down.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("Rain and thunder don't bother me, but a stray lightning bolt might.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("Storm's so loud I can barely hear my own thoughts. Stay sharp out there.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("I'm not complaining, but I'm wishing for clear skies and dry boots right now.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("The thunder sounds like the drums of battle. Let's not disappoint, shall we?", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("If the lightning strikes near, don't freeze up like I might. Keep moving!", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("The storm's got a rhythm. Maybe it's trying to tell us something with that thunder.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("Watch out for falling branches and lightning. This storm's no joke.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("Thunder cracks like a whip. If I didn't know better, I'd say it's a warning.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Rain's cold and thunder's loud, but your company makes it bearable.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("I'm half-expecting a bolt to split the sky right over us. Stay ready.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("That flash nearly blinded me. You better watch your step in this storm.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("Thunderstorms always remind me of old legends. Let's hope we don't become one.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("I'm grateful for your steady hand. This thunder makes my nerves jumpy.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("The storm's brewing something fierce. Let's make sure we're ready for it.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("Rain's washing the earth clean, but that thunder makes me want to hide.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("Every thunderclap feels like the gods are arguing above us.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("Let's keep our heads low and spirits high. This storm won't last forever.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Thunder's shaking the skies, but I'm standing firm, mostly because of you.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.DUST_STORM or weather == xi.weather.SAND_STORM then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("Dust's choking the air. Keep your eyes sharp, can't see a thing in this haze.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("This storm's got grit in every breath. I'm not sure if I'm fighting or sandblasting.", xi.msg.channel.PARTY, palName)
                elseif random  == 3 then player:printToPlayer("Watch your footing, dust storms make the ground tricky to trust.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("Can't tell if that's a shadow or just a dust swirl. Stay close, yeah?", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("Sand's everywhere. I'm half worried it'll get inside my armor and never leave.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("Dust storms are nature's way of saying, 'Good luck seeing me coming.'", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("I don't mind dirt, but this sand is an uninvited guest in my throat.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("Hold tight, the wind's carrying more than just dust today.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("Squinting through this mess is tiring. Think you can lead the way?", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("Dust stings my eyes like tiny needles. Maybe I should wear goggles next time.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("Even the beasts seem to hide from this storm. We'd best be cautious.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("This storm's relentless, but I'm not about to let it slow us down.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("Dust swirling in the air like ghosts. Keep your sword ready just in case.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("I'm starting to taste sand. Can't say I'm a fan.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Watch your step, the sand shifts underfoot like a restless spirit.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("If something moves in this dust, I'll be ready. How about you?", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("Dust storms remind me why some folks avoid the wilds altogether.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("This storm's got no mercy. I'm grateful you're still breathing beside me.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("I can barely tell the sky from the ground right now. Keep close!", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("Feels like the desert's trying to swallow us whole in this storm.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("Dust in my mouth and eyes, guess it's not a day for picnics.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("I'm not saying this storm's dangerous, but it's definitely annoying.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("Every gust feels like a punch to the face. Not how I wanted to train today.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("Keep your head down and your eyes open. This storm hides more than dust.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("I'd trade this dust storm for a rainstorm any day. At least rain cools you off.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("The wind howls like it's got a grudge. I'm trying not to take it personally.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("Dust's creeping into every crack. This storm's a nuisance, no doubt.", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("If this dust gets in my eyes one more time, I might just scream.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("This haze makes everything look like a ghost town. Stay alert.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("The wind's kicking up sand like it's got a message. I just hope we're not the target.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("I swear I saw something move in that cloud of dust. Could be nothing... or not.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("Dust storms are like nature's sneaky ambush. Keep your eyes peeled.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("If this storm doesn't kill us, the sand stuck in my gear might.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("Squinting doesn't help much, but I guess it's better than nothing.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("The air tastes like dry dirt. I miss fresh mountain breezes already.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("I'm not sure what's worse, this dust or the monsters it hides.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("Dust storms make for great training. If you can fight in this, you can fight anywhere.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("If a dust devil spins by, I'm blaming you for making me dizzy.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("The sand's so thick, I'm half expecting to find a scorpion in my boots.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("Keep your mouth shut as much as you can. This dust's not just annoying.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Even the bravest need a break in weather like this. Think we can find some shelter?", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("Dust storms make you appreciate a clear sky more than ever.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("I'm not saying this dust storm is evil, but it sure feels personal.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("Every step's a gamble when the sand hides the ground beneath.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("I'm dustier than a goblin's boots. When's the next bath break?", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("Dust storms make the world look like a sepia painting. Creepy, right?", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("I'm starting to think the desert doesn't want visitors today.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("Hold your shield tight; this storm's got a bite to it.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("If I have to sneeze one more time, I'm blaming the sand, not you.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Dust storms are like nature's way of telling us to slow down. Too bad we don't listen.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.AURORAS or weather == xi.weather.STELLAR_GLARE then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("The night sky's alive with colors. Makes me forget the danger for a moment.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("Those shimmering lights remind me of the legends. Ever believe in old tales?", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("Stars are dazzling tonight. It's almost like Vanadiel's showing off for us.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("That glow makes it hard to see the path, but it's beautiful all the same.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("Auroras dance across the sky like spirits celebrating. A rare sight, indeed.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("The stellar glare's blinding, but it's strangely calming. Almost magical.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("Keep your eyes peeled despite the glow. Beauty can hide danger too.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("I'm tempted to stop and watch those lights all night. Duty calls, though.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("The sky's a canvas tonight. Makes me think maybe we're part of a bigger story.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("That shimmering light makes even the cold nights feel less harsh.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("The stars seem to be guiding us. Let's hope they're on our side.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("It's hard to stay focused when the sky puts on a show like this.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("I heard that those lights can grant wishes. Got anything you want to try?", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("The stellar glare's like a spotlight. Don't trip while you're in the glow.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Those lights make me wonder if the gods are watching us tonight.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("If the stars are lucky, maybe they'll shine on us during the next battle.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("The aurora's colors are mesmerizing, but don't get lost staring up too long.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("That stellar glare might mess with your eyes, but at least it lights the way.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("Some say the aurora hides secrets. I say let's just enjoy the show.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("The sky's painting stories above us. I'm just glad you're here to watch with me.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("Auroras always make me feel small, but also hopeful. Strange feeling, huh?", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("That stellar glare's bright enough to make shadows dance. Watch out!", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("The night feels alive with those lights. Almost like the world's breathing.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("If you ask me, the aurora's nature's way of reminding us to look up sometimes.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("Those shimmering colors are like a lullaby for the sky.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("I'm no scholar, but I think those lights mean good things are coming.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("The stellar glare's got me feeling like I'm in a dream. Don't pinch me!", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("I'd trade a thousand nights like this for a single day in town.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("The aurora's glow makes even the darkest corners seem less frightening.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("Keep your guard up, but maybe sneak a peek at those lights every now and then.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("Those colors remind me of the jewels in your armor. Fancy, huh?", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("The stellar glare's dazzling, but not as dazzling as your swordplay.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("I'd say the aurora's a good omen, but we both know luck's earned, not given.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("The sky's alive with magic tonight. Makes me want to believe in miracles.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("Those lights are like a dance of spirits. Ever wonder who's watching us?", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("That stellar glare's almost blinding. Let's hope the monsters don't think so.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("Auroras always feel like a reward after a long day. Worth the wait.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("I'll admit it, the lights have me a little distracted. Don't tell anyone.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("The stellar glare's got me squinting, but I'm still ready for whatever comes.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("The sky's showing off tonight. Let's not let it steal our focus for long.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("If those lights mean anything, I hope it's that we survive another day.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("The aurora's colors shift like they're alive. Almost like they're trying to tell us something.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("That stellar glare makes me want to tell tales around a campfire.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("The night's too bright with those lights. Hard to hide, but easier to admire.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("If the stars could speak, I wonder what stories they'd share tonight.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("That glow's a rare treat. Let's enjoy it while it lasts, shall we?", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("The stellar glare's a reminder that even in darkness, there's light.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("I can't help but smile at those lights. Makes me think we're not so alone.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("The aurora's glow warms the cold night better than any fire could.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Keep your eyes open and your heart steady. The night holds more than just light.", xi.msg.channel.PARTY, palName)
                end

            elseif weather == xi.weather.DARKNESS or weather == xi.weather.GLOOM then
                local random = math.random(1, 50)
                if random == 1 then player:printToPlayer("This gloom feels unnatural... like the shadows themselves are watching us.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("The darkness here isn't just absence of light. It's something... more sinister.", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("I swear I saw a shape move just beyond the edge of the gloom. Stay sharp.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("This magical darkness is heavy... like it's trying to swallow us whole.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("Even your blade seems duller under this oppressive gloom. Stay close.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("I hate this place. The gloom makes it hard to trust my own eyes.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("We move like ghosts here, but I fear something else is watching us, too.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("The air's thick with dark magic. It's like the shadows are alive.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("If the darkness has a heartbeat, it's pounding right now. Be ready.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("The gloom plays tricks. Don't trust every sound or shadow you see.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("This kind of darkness can crush a man's spirit if he lets it. Keep your will strong.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Something about this gloom feels ancient, like a curse that's lasted centuries.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("Watch your step, this darkness hides more than just shadows.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("I can't shake the feeling that eyes are watching us from the blackness.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("The gloom is like a living thing, creeping closer with every breath.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("No stars pierce this veil of darkness. Feels like the world's holding its breath.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("If there's hope in this gloom, I can't see it yet. Just shadows and silence.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("Keep your senses sharp. This kind of darkness can fool even the best eyes.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("I don't like the way the shadows twitch here. Feels like they're alive.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("The gloom presses down on us, but don't let it weigh on your courage.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("I'd rather face a dozen goblins than this creeping darkness. It's maddening.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("This place reeks of forgotten magic. We should move fast before it wakes fully.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("If your heart falters here, the gloom will devour it whole.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("No light can pierce this veil. Trust only your instincts, not your eyes.", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("I can feel the shadows crawling over my skin. Stay close, don't stray.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("This magical darkness... it's like the land itself is bleeding shadow.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("Your sword might not shine here, but your resolve must.", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("The gloom seems to swallow sound, but I swear I hear whispers beneath it.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("Don't let the darkness fool you into thinking we're alone out here.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("I'm starting to think this gloom feeds on fear. Let's starve it.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("If I didn't know better, I'd say the shadows have teeth tonight.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("The air's thick and cold, like the darkness is trying to choke us.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("I don't like the silence that comes with this gloom. It feels too heavy.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("Every step feels like we're sinking deeper into the abyss. Keep your wits.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("The magical darkness is like a living shadow, always moving just out of sight.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("Sometimes I wonder if the gloom is punishment for something long forgotten.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("I can feel the weight of unseen eyes watching us through this darkness.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("This gloom is thick, but don't let it cloud your mind. Stay sharp.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("It's hard to tell what's real in this darkness. Trust yourself, not your eyes.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("The shadows here seem to pulse with dark magic. Let's be quick and quiet.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Your courage is the only light in this overwhelming gloom.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("I feel like we're being swallowed whole by this darkness. Don't let it win.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("This place twists the mind. Focus on the task, not the creeping fear.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("The gloom hides things we can't see. Stay alert for the unexpected.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("I'm not sure what's worse, monsters or this suffocating shadow.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("The darkness isn't just a lack of light, it's an enemy in itself.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("Don't let the gloom seep into your heart. Remember why we fight.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("There's a weight here that drags at my soul. We need to move quickly.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("This darkness feels like a shroud. Keep your blade ready and your mind sharper.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Even in this magical gloom, your presence gives me a sliver of hope.", xi.msg.channel.PARTY, palName)
                end

            else
                local random = math.random(1, 100)
                if random == 1 then player:printToPlayer("The wind here carries secrets. Bet you're the one who'll uncover them.", xi.msg.channel.PARTY, palName)
                elseif random == 2 then player:printToPlayer("Watch your step-this path's been known to fool the unwary more than once.", xi.msg.channel.PARTY, palName)
                elseif random == 3 then player:printToPlayer("I'll never tire of the open sky, even if it means dodging more than a few arrows.", xi.msg.channel.PARTY, palName)
                elseif random == 4 then player:printToPlayer("Master, if you get lost out here, you're buying the next round of ale.", xi.msg.channel.PARTY, palName)
                elseif random == 5 then player:printToPlayer("The trees whisper stories of old-if only they'd tell us straight for once.", xi.msg.channel.PARTY, palName)
                elseif random == 6 then player:printToPlayer("Don't get too cocky-nature has a nasty way of humbling even the best.", xi.msg.channel.PARTY, palName)
                elseif random == 7 then player:printToPlayer("I'm not saying the bugs here bite, but if they did, you'd be first in line.", xi.msg.channel.PARTY, palName)
                elseif random == 8 then player:printToPlayer("You ever wonder what's beyond those mountains? I'm too chicken to find out.", xi.msg.channel.PARTY, palName)
                elseif random == 9 then player:printToPlayer("The stars look clear tonight. Maybe even the gods are watching your antics.", xi.msg.channel.PARTY, palName)
                elseif random == 10 then player:printToPlayer("Master, keep your eyes peeled. The wilderness doesn't suffer fools gladly.", xi.msg.channel.PARTY, palName)
                elseif random == 11 then player:printToPlayer("The grass sways like it's breathing. Creepy, but peaceful in its own way.", xi.msg.channel.PARTY, palName)
                elseif random == 12 then player:printToPlayer("Out here, every shadow could be a friend or a foe. Don't bet on the first.", xi.msg.channel.PARTY, palName)
                elseif random == 13 then player:printToPlayer("That river looks calm. Too calm. My gut says we don't cross there.", xi.msg.channel.PARTY, palName)
                elseif random == 14 then player:printToPlayer("I'd rather deal with bandits than this endless stretch of nothingness.", xi.msg.channel.PARTY, palName)
                elseif random == 15 then player:printToPlayer("Master, if you start daydreaming, I'm leaving you behind. Not joking.", xi.msg.channel.PARTY, palName)
                elseif random == 16 then player:printToPlayer("The birds are oddly quiet. Feels like the calm before the storm.", xi.msg.channel.PARTY, palName)
                elseif random == 17 then player:printToPlayer("If the trees had eyes, they'd be laughing at how lost you look right now.", xi.msg.channel.PARTY, palName)
                elseif random == 18 then player:printToPlayer("This place might look beautiful, but nature doesn't care about beauty.", xi.msg.channel.PARTY, palName)
                elseif random == 19 then player:printToPlayer("You handle the wild better than I expected. Just don't get too cocky.", xi.msg.channel.PARTY, palName)
                elseif random == 20 then player:printToPlayer("Remember, Master, the wilderness isn't forgiving. Neither am I.", xi.msg.channel.PARTY, palName)
                elseif random == 21 then player:printToPlayer("The wind's picking up. Might be a storm, or just Vanadiel breathing.", xi.msg.channel.PARTY, palName)
                elseif random == 22 then player:printToPlayer("I stepped in something squishy. Nature is not always kind.", xi.msg.channel.PARTY, palName)
                elseif random == 23 then player:printToPlayer("Look there, rabbit tracks. Or... goblin? Hm. Either way, something with feet.", xi.msg.channel.PARTY, palName)
                elseif random == 24 then player:printToPlayer("You ever feel like we're being watched out here? No, seriously...", xi.msg.channel.PARTY, palName)
                elseif random == 25 then player:printToPlayer("I saw a flower blooming through stone once. Thought that was brave.", xi.msg.channel.PARTY, palName)
                elseif random == 26 then player:printToPlayer("Out here, every shadow has a story. Most of them end with teeth.", xi.msg.channel.PARTY, palName)
                elseif random == 27 then player:printToPlayer("Master, do we have a plan? Or are we following the breeze again?", xi.msg.channel.PARTY, palName)
                elseif random == 28 then player:printToPlayer("Something's rustling in the grass. If it's another giant worm, I'm leaving.", xi.msg.channel.PARTY, palName)
                elseif random == 29 then player:printToPlayer("It smells like rain and moss. I think I like it.", xi.msg.channel.PARTY, palName)
                elseif random == 30 then player:printToPlayer("The road is long, but at least it's mostly pointing forward.", xi.msg.channel.PARTY, palName)
                elseif random == 31 then player:printToPlayer("We passed a tree shaped like a moogle earlier. I swear I'm not imagining it.", xi.msg.channel.PARTY, palName)
                elseif random == 32 then player:printToPlayer("You hear that? Wind in the grass. Or monsters sneaking. Could be both.", xi.msg.channel.PARTY, palName)
                elseif random == 33 then player:printToPlayer("I almost miss the sound of people shouting. Almost.", xi.msg.channel.PARTY, palName)
                elseif random == 34 then player:printToPlayer("The wilderness feels honest. Dangerous, but honest.", xi.msg.channel.PARTY, palName)
                elseif random == 35 then player:printToPlayer("How do the stars look so close out here? Like you could just pluck one.", xi.msg.channel.PARTY, palName)
                elseif random == 36 then player:printToPlayer("My boots are full of pebbles again. Nature's way of saying hello.", xi.msg.channel.PARTY, palName)
                elseif random == 37 then player:printToPlayer("I thought I saw a dragon wing earlier. Just cloud tricks. I think.", xi.msg.channel.PARTY, palName)
                elseif random == 38 then player:printToPlayer("Do trees talk to each other? They look like they know things.", xi.msg.channel.PARTY, palName)
                elseif random == 39 then player:printToPlayer("If I vanish, assume a chocobo stole my soul.", xi.msg.channel.PARTY, palName)
                elseif random == 40 then player:printToPlayer("I keep finding feathers. Something's watching us from above.", xi.msg.channel.PARTY, palName)
                elseif random == 41 then player:printToPlayer("Let's rest soon. The birds are mocking my pace.", xi.msg.channel.PARTY, palName)
                elseif random == 42 then player:printToPlayer("Sunsets in the wild hit different. Like the world's sighing in color.", xi.msg.channel.PARTY, palName)
                elseif random == 43 then player:printToPlayer("This trail looks fresh... and unsettling. Let's keep our weapons close.", xi.msg.channel.PARTY, palName)
                elseif random == 44 then player:printToPlayer("I like the quiet out here. Until the quiet gets too quiet.", xi.msg.channel.PARTY, palName)
                elseif random == 45 then player:printToPlayer("Smells like something died out here. Or is about to.", xi.msg.channel.PARTY, palName)
                elseif random == 46 then player:printToPlayer("I'd forgotten how big the sky is until we left the cities.", xi.msg.channel.PARTY, palName)
                elseif random == 47 then player:printToPlayer("Sometimes I think the wind is whispering names. But that's probably just nerves.", xi.msg.channel.PARTY, palName)
                elseif random == 48 then player:printToPlayer("My sword's rattling again. That usually means trouble. Or I'm hungry.", xi.msg.channel.PARTY, palName)
                elseif random == 49 then player:printToPlayer("I've got a rock in my boot. Might name it. It's been with me all day.", xi.msg.channel.PARTY, palName)
                elseif random == 50 then player:printToPlayer("Do you think the stars remember our footsteps?", xi.msg.channel.PARTY, palName)
                elseif random == 51 then player:printToPlayer("A beetle just tried to climb into my pack. Guess it wants to join our quest.", xi.msg.channel.PARTY, palName)
                elseif random == 52 then player:printToPlayer("There's something oddly comforting about the rustling grass.", xi.msg.channel.PARTY, palName)
                elseif random == 53 then player:printToPlayer("I'd say this view is worth the journey. If my legs weren't on fire.", xi.msg.channel.PARTY, palName)
                elseif random == 54 then player:printToPlayer("What's that? Wind in the trees? Or whispers? Either way, I'm staying close.", xi.msg.channel.PARTY, palName)
                elseif random == 55 then player:printToPlayer("We haven't seen another soul for hours. Just how I like it.", xi.msg.channel.PARTY, palName)
                elseif random == 56 then player:printToPlayer("I keep expecting the ground to open up. Maybe I've read too many stories.", xi.msg.channel.PARTY, palName)
                elseif random == 57 then player:printToPlayer("Is it normal for frogs to glow like that? Should I be concerned?", xi.msg.channel.PARTY, palName)
                elseif random == 58 then player:printToPlayer("I'm trying to decide if I like this silence. Or if it's just the prelude to screaming.", xi.msg.channel.PARTY, palName)
                elseif random == 59 then player:printToPlayer("If I get eaten by a plant, please avenge me with fire.", xi.msg.channel.PARTY, palName)
                elseif random == 60 then player:printToPlayer("Even the trees here seem judgmental. Or maybe I'm just tired.", xi.msg.channel.PARTY, palName)
                elseif random == 61 then player:printToPlayer("The stars are watching. I hope they approve.", xi.msg.channel.PARTY, palName)
                elseif random == 62 then player:printToPlayer("Nature's all fun until it starts buzzing in your ear.", xi.msg.channel.PARTY, palName)
                elseif random == 63 then player:printToPlayer("If we get lost out here, I'm blaming the map. Or the lack of one.", xi.msg.channel.PARTY, palName)
                elseif random == 64 then player:printToPlayer("That tree looks like it's seen things. I relate.", xi.msg.channel.PARTY, palName)
                elseif random == 65 then player:printToPlayer("I think I just made eye contact with a squirrel. It looked disappointed.", xi.msg.channel.PARTY, palName)
                elseif random == 66 then player:printToPlayer("Are we wandering or adventuring? I can never tell the difference.", xi.msg.channel.PARTY, palName)
                elseif random == 67 then player:printToPlayer("Watch your step. The wilds have a habit of biting.", xi.msg.channel.PARTY, palName)
                elseif random == 68 then player:printToPlayer("Why do the birds go quiet sometimes? That's always when the worst starts.", xi.msg.channel.PARTY, palName)
                elseif random == 69 then player:printToPlayer("I'd like to believe we're not the only ones out here. But not too much.", xi.msg.channel.PARTY, palName)
                elseif random == 70 then player:printToPlayer("Sometimes I forget how dangerous the world is until the wind changes.", xi.msg.channel.PARTY, palName)
                elseif random == 71 then player:printToPlayer("We've walked so far, I think my boots are starting to develop personalities.", xi.msg.channel.PARTY, palName)
                elseif random == 72 then player:printToPlayer("Did that tree just move? No? Alright. I'm just tired then.", xi.msg.channel.PARTY, palName)
                elseif random == 73 then player:printToPlayer("If we keep heading this way, we're either getting somewhere important or very lost.", xi.msg.channel.PARTY, palName)
                elseif random == 74 then player:printToPlayer("Feels like the kind of day where goblins crawl out just to ruin it.", xi.msg.channel.PARTY, palName)
                elseif random == 75 then player:printToPlayer("I wonder what that cloud looks like to a dragon. Lunch, maybe?", xi.msg.channel.PARTY, palName)
                elseif random == 76 then player:printToPlayer("Out here, even the breeze carries secrets.", xi.msg.channel.PARTY, palName)
                elseif random == 77 then player:printToPlayer("That hill looks suspicious. Hills shouldn't look suspicious, right?", xi.msg.channel.PARTY, palName)
                elseif random == 78 then player:printToPlayer("If we had a gil for every step, we'd have enough to rent a real squire tent.", xi.msg.channel.PARTY, palName)
                elseif random == 79 then player:printToPlayer("I like it better out here when things aren't screaming.", xi.msg.channel.PARTY, palName)
                elseif random == 80 then player:printToPlayer("The light hits the grass just right today. Almost makes me forget about the monsters.", xi.msg.channel.PARTY, palName)
                elseif random == 81 then player:printToPlayer("Hope you're not allergic to bees, Master... They seem fond of us.", xi.msg.channel.PARTY, palName)
                elseif random == 82 then player:printToPlayer("If the trees start whispering again, I'm plugging my ears this time.", xi.msg.channel.PARTY, palName)
                elseif random == 83 then player:printToPlayer("You ever think the land remembers who walked it before us?", xi.msg.channel.PARTY, palName)
                elseif random == 84 then player:printToPlayer("I swear if another lizard crawls into my boot, I'm retiring.", xi.msg.channel.PARTY, palName)
                elseif random == 85 then player:printToPlayer("Do you smell that? Smells like adventure... or something rotting.", xi.msg.channel.PARTY, palName)
                elseif random == 86 then player:printToPlayer("The trees have faces. Not real ones. I think. You see it too, right?", xi.msg.channel.PARTY, palName)
                elseif random == 87 then player:printToPlayer("I dreamed of open skies like this once. Then a mandragora bit me.", xi.msg.channel.PARTY, palName)
                elseif random == 88 then player:printToPlayer("The wild makes you think strange thoughts. Like wondering if squirrels judge you.", xi.msg.channel.PARTY, palName)
                elseif random == 89 then player:printToPlayer("I'm pretty sure that bush just growled at me.", xi.msg.channel.PARTY, palName)
                elseif random == 90 then player:printToPlayer("Next time we camp, can we pick somewhere not haunted by mosquitoes?", xi.msg.channel.PARTY, palName)
                elseif random == 91 then player:printToPlayer("They say every road leads to something. Let's hope it's not a troll.", xi.msg.channel.PARTY, palName)
                elseif random == 92 then player:printToPlayer("I feel like we're walking straight into a legend. Hopefully not the tragic kind.", xi.msg.channel.PARTY, palName)
                elseif random == 93 then player:printToPlayer("Out here, even silence feels like it's watching you.", xi.msg.channel.PARTY, palName)
                elseif random == 94 then player:printToPlayer("That rock looks like a face. Not a friendly one.", xi.msg.channel.PARTY, palName)
                elseif random == 95 then player:printToPlayer("Maybe one day, someone will follow our footprints. Hope they bring snacks.", xi.msg.channel.PARTY, palName)
                elseif random == 96 then player:printToPlayer("We should mark this spot. In case we need to run back screaming.", xi.msg.channel.PARTY, palName)
                elseif random == 97 then player:printToPlayer("The clouds out here drift like dreams. Probably better than the ones I've been having.", xi.msg.channel.PARTY, palName)
                elseif random == 98 then player:printToPlayer("I think we just walked through a story no one finished writing.", xi.msg.channel.PARTY, palName)
                elseif random == 99 then player:printToPlayer("Out here, every step feels like it's daring fate.", xi.msg.channel.PARTY, palName)
                elseif random == 100 then player:printToPlayer("If you hear rustling behind us, assume it's something that bites.", xi.msg.channel.PARTY, palName)
                end
            end

        elseif zoneType == xi.zoneType.DUNGEON then
            local random = math.random(1, 300)

            if random == 1 then player:printToPlayer("I don't like this place. Too quiet, like it's waiting to pounce.", xi.msg.channel.PARTY, palName)
            elseif random == 2 then player:printToPlayer("Master, remember to light your torch before the shadows consume us.", xi.msg.channel.PARTY, palName)
            elseif random == 3 then player:printToPlayer("I'm pretty sure those walls have seen better days... and fewer screams.", xi.msg.channel.PARTY, palName)
            elseif random == 4 then player:printToPlayer("If you get separated, don't try heroics. Come back in one piece, alright?", xi.msg.channel.PARTY, palName)
            elseif random == 5 then player:printToPlayer("Watch for traps. Wouldn't be the first time we've danced with death down here.", xi.msg.channel.PARTY, palName)
            elseif random == 6 then player:printToPlayer("I swear I heard something moving just now. Not exactly a friendly welcome.", xi.msg.channel.PARTY, palName)
            elseif random == 7 then player:printToPlayer("Master, if you start humming, I'm throwing a rock at you. Focus, please.", xi.msg.channel.PARTY, palName)
            elseif random == 8 then player:printToPlayer("This place reeks of old magic and bad decisions. Mostly the latter.", xi.msg.channel.PARTY, palName)
            elseif random == 9 then player:printToPlayer("Keep your sword sharp and your wits sharper. We're gonna need both.", xi.msg.channel.PARTY, palName)
            elseif random == 10 then player:printToPlayer("You think this dungeon has a 'you are here' map? Yeah, me neither.", xi.msg.channel.PARTY, palName)
            elseif random == 11 then player:printToPlayer("I don't envy those poor souls trapped here. Let's not join their club.", xi.msg.channel.PARTY, palName)
            elseif random == 12 then player:printToPlayer("Hear that? Sounds like something big is coming. Ready yourself.", xi.msg.channel.PARTY, palName)
            elseif random == 13 then player:printToPlayer("Master, keep an eye on the ceiling. Falling rocks aren't just legends.", xi.msg.channel.PARTY, palName)
            elseif random == 14 then player:printToPlayer("Sometimes I think these halls breathe... and not in a good way.", xi.msg.channel.PARTY, palName)
            elseif random == 15 then player:printToPlayer("No matter what happens, I'm not letting you be the first to fall.", xi.msg.channel.PARTY, palName)
            elseif random == 16 then player:printToPlayer("I hate dungeons. And I hate spiders. Coincidence? I think not.", xi.msg.channel.PARTY, palName)
            elseif random == 17 then player:printToPlayer("Master, if you're planning to charge ahead, count me out. Wait for me.", xi.msg.channel.PARTY, palName)
            elseif random == 18 then player:printToPlayer("You've got that look again-like you're planning something reckless.", xi.msg.channel.PARTY, palName)
            elseif random == 19 then player:printToPlayer("Don't forget to listen for echoes. They can tell us who's coming.", xi.msg.channel.PARTY, palName)
            elseif random == 20 then player:printToPlayer("I don't mind a fight, but let's not make this dungeon our graveyard.", xi.msg.channel.PARTY, palName)
            end
        end
    end
end
