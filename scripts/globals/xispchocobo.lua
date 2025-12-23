xi = xi or {}
xi.xispchocobo = xi.xispchocobo or {}

xi.xispchocobo.names =
{
    [1]  = 'Ruby',
    [2]  = 'Vivi',
    [3]  = 'Pickle',
    [4]  = 'Sunny',
    [5]  = 'Coco',
    [6]  = 'Peaches',
    [7]  = 'Koko',
    [8]  = 'Daisy',
    [9]  = 'Pumpkin',
    [10] = 'Shamrock',
    [11] = 'Boko',
    [12] = 'Chocolina',
    [13] = 'Sunploom',
    [14] = 'Poppy',
    [15] = 'Sunstride',
    [16] = 'Kwehlington',
    [17] = 'Chocobro',
    [18] = 'Ten',
    [19] = 'Peep',
    [20] = 'Goldrush',
    [21] = 'Gysalyn',
    [22] = 'Ironbeak',
    [23] = 'Olive',
    [24] = 'Slippers',
    [25] = 'Pippin',
    [26] = 'Buttons',
    [27] = 'Beakachu',
    [28] = 'Pookie',
}

local menu1 =
{
    title = 'Would you like to raise a new chocobo?',
    options = {},
}

local dialogue1 =
{
    {
        'Can\'t wait!',
        function(playerArg)
            playerArg:printToPlayer('Congratulations on your new chocobo! All the best to you both.', xi.msg.channel.SAY, ' ')
            playerArg:setCharVar('[XISP]hasChocobo', 1)
            playerArg:setCharVar('[XISP]chocoGrow', 0)
            playerArg:setCharVar('[XISP]hasEgg', 0)

            local colorChance = math.random(1, 100)
            if colorChance <= 3 then
                playerArg:setCharVar('[XISP]chocoColor', 2) -- Black   3% chance
            elseif colorChance <= 8 then
                playerArg:setCharVar('[XISP]chocoColor', 4) -- Blue    5% chance
            elseif colorChance <= 13 then
                playerArg:setCharVar('[XISP]chocoColor', 6) -- Red     5% chance
            elseif colorChance <= 18 then
                playerArg:setCharVar('[XISP]chocoColor', 8) -- Green   5% chance
            else
                playerArg:setCharVar('[XISP]chocoColor', 1) -- Normal 82% chance
            end

            xi.xispchocobo.spawnChocobo(playerArg, playerArg:getZone())
        end,
    },
    {
        'On second thought...',
        function(playerArg)
        end,
    },
}

local namePrompt1 =
{
    title = 'Page 1:',
}

local namePrompt2 =
{
    title = 'Page 2:',
}

local namePrompt3 =
{
    title = 'Page 3:',
}

local namePrompt4 =
{
    title = 'Page 4:',
}

local namePrompt5 = -- Unused for now
{
    title = 'Page 5:',
}

local namePromptConfirm =
{
    title = 'Are you sure you that\'s what you want?',
}

local nameList1 = {}
local nameList2 = {}
local nameList3 = {}
local nameList4 = {}
local nameList5 = {} -- Unused for now

nameList1 =
{
    {
        xi.xispchocobo.names[1],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 1)
        end,
    },

    {
        xi.xispchocobo.names[2],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 2)
        end,
    },

    {
        xi.xispchocobo.names[3],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 3)
        end,
    },

    {
        xi.xispchocobo.names[4],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 4)
        end,
    },

    {
        xi.xispchocobo.names[5],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 5)
        end,
    },

    {
        xi.xispchocobo.names[6],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 6)
        end,
    },

    {
        xi.xispchocobo.names[7],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 7)
        end,
    },

    {
        'Next Page',
        function(playerArg)
            namePrompt2.options = nameList2
            xi.xisp.sendMenu(playerArg, namePrompt2)
        end,
    },
}

nameList2 =
{
    {
        xi.xispchocobo.names[8],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 8)
        end,
    },

    {
        xi.xispchocobo.names[9],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 9)
        end,
    },

    {
        xi.xispchocobo.names[10],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 10)
        end,
    },

    {
        xi.xispchocobo.names[11],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 11)
        end,
    },

    {
        xi.xispchocobo.names[12],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 12)
        end,
    },

    {
        xi.xispchocobo.names[13],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 13)
        end,
    },

    {
        'Next Page',
        function(playerArg)
            namePrompt3.options = nameList3
            xi.xisp.sendMenu(playerArg, namePrompt3)
        end,
    },

    {
        'Go Back',
        function(playerArg)
            namePrompt1.options = nameList1
            xi.xisp.sendMenu(playerArg, namePrompt1)
        end,
    },
}

nameList3 =
{
    {
        xi.xispchocobo.names[14],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 14)
        end,
    },

    {
        xi.xispchocobo.names[15],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 15)
        end,
    },

    {
        xi.xispchocobo.names[16],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 16)
        end,
    },

    {
        xi.xispchocobo.names[17],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 17)
        end,
    },

    {
        xi.xispchocobo.names[18],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 18)
        end,
    },

    {
        xi.xispchocobo.names[19],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 19)
        end,
    },

    {
        'Next Page',
        function(playerArg)
            namePrompt4.options = nameList4
            xi.xisp.sendMenu(playerArg, namePrompt4)
        end,
    },

    {
        'Go Back',
        function(playerArg)
            namePrompt2.options = nameList2
            xi.xisp.sendMenu(playerArg, namePrompt2)
        end,
    },
}

nameList4 =
{
    {
        xi.xispchocobo.names[20],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 20)
        end,
    },

    {
        xi.xispchocobo.names[21],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 21)
        end,
    },

    {
        xi.xispchocobo.names[22],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 22)
        end,
    },

    {
        xi.xispchocobo.names[23],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 23)
        end,
    },

    {
        xi.xispchocobo.names[24],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 24)
        end,
    },

    {
        xi.xispchocobo.names[25],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 25)
        end,
    },

    {
        'Next Page',
        function(playerArg)
            namePrompt5.options = nameList5
            xi.xisp.sendMenu(playerArg, namePrompt5)
        end,
    },

    {
        'Go Back',
        function(playerArg)
            namePrompt3.options = nameList3
            xi.xisp.sendMenu(playerArg, namePrompt3)
        end,
    },
}

nameList5 =
{
    {
        xi.xispchocobo.names[26],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 26)
        end,
    },

    {
        xi.xispchocobo.names[27],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 27)
        end,
    },

    {
        xi.xispchocobo.names[28],
        function(playerArg)
            xi.xispchocobo.confirmNamePrompt(playerArg, 28)
        end,
    },

    {
        'Go Back',
        function(playerArg)
            namePrompt4.options = nameList4
            xi.xisp.sendMenu(playerArg, namePrompt4)
        end,
    },
}

xi.xispchocobo.confirmNamePrompt = function(player, name)
    namePromptConfirm.options =
    {
        {
            'Yes, ' .. xi.xispchocobo.names[name] .. ' is perfect!',
            function(playerArg)
                print('Chocobo named ' .. name .. '!')
                playerArg:setCharVar('[XISP]chocoName', name)
                playerArg:printToPlayer('Your chocobo has been named ' .. xi.xispchocobo.names[name] .. '!', xi.msg.channel.SAY, 'Fonteloube')
            end,
        },
        {
            'No, I want to choose a different name.',
            function(playerArg)
                namePrompt1.options = nameList1
                xi.xisp.sendMenu(playerArg, namePrompt1)
            end,
        },
    }

    xi.xisp.sendMenu(player, namePromptConfirm)
end

xi.xispchocobo.onNameTrigger = function(player, npc)
    if player:getCharVar('[XISP]hasChocobo') == 1 then
        if player:getCharVar('[XISP]chocoName') > 0 then
            player:printToPlayer('Your chocobo has already been named.', xi.msg.channel.SAY, npc:getName())
            return
        else
            player:printToPlayer('Hello, Adventurer. I see you have raised a chocobo. Would you like to give it a name?', xi.msg.channel.SAY, npc:getName())
            namePrompt1.options = nameList1
            xi.xisp.sendMenu(player, namePrompt1)
        end
    end
end

xi.xispchocobo.onTrainerTrade = function(player, npc, trade)
    local name = npc:getName()

    if trade then
        if
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_FAINTLY_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_SLIGHTLY_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_A_BIT_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_A_LITTLE_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_SOMEWHAT_WARM)
        then
            if player:getCharVar('[XISP]hasChocobo') == 1 then
                player:printToPlayer('It looks like you already have a chocobo.', xi.msg.channel.SAY, name)
                return
            else
                player:printToPlayer('A new chocobo egg? How wonderful! I will hold onto it for you.', xi.msg.channel.SAY, name)
                player:setCharVar('[XISP]hasEgg', 1)
                player:confirmTrade()

                menu1.options = dialogue1
                xi.xisp.sendMenu(player, menu1)
            end
        end
    end
end

xi.xispchocobo.onTrainerTrigger = function(player, npc)
    if player:getCharVar('[XISP]hasEgg') == 1 then
        menu1.options = dialogue1
        xi.xisp.sendMenu(player, menu1)
    end
end

xi.xispchocobo.chocoboTrigger = function(player, choco)
    menu =
    {
        title = 'Your chocobo awaits your command.',
        options = {},
    }

    dialogue =
    {
        {
            'Mount my chocobo.',
            function(playerArg)
                local choco = GetMobByID(playerArg:getCharVar('[XISP]chocoID'))
                if choco then
                    playerArg:delStatusEffectSilent(xi.effect.MOUNTED)
                    playerArg:setCharVar('ownChoco', 1)

                    local traits =
                    {
                        largeBeak   = false,
                        fullTail    = false,
                        largeTalons = false,
                    }

                    -- This line registers the player's chocobo as the player's mount
                    playerArg:registerChocobo(playerArg:getCharVar('[XISP]chocoColor'), traits)

                    playerArg:addStatusEffectEx(xi.effect.MOUNTED, xi.effect.MOUNTED, xi.mount.CHOCOBO, 0, 0, 0, 360, true)
                    choco:setBehavior(bit.band(choco:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                    DespawnMob(choco:getID())
                end
            end,
        },

        {
            'Nevermind.',
            function(playerArg)
                return
            end,
        },

        {
            'Dismiss',
            function(playerArg)
                xi.xispchocobo.despawnChocobo(playerArg)
            end,
        },
    }

    local chocogrow = player:getCharVar('[XISP]chocoGrow')

    if choco:getLocalVar('[XISP]ownerID') ~= player:getID() then
        player:printToPlayer('This chocobo does not seem to recognize you as its owner.', xi.msg.channel.NS_SAY, ' ')
        return
    end

    if chocogrow >= 20 then -- Adult
        if player:getLocalVar('needsToZone') == 1 then -- First time reaching adult stage
            return
        end

        if player:getMainLvl() < 20 then
            player:printToPlayer('You need to be at least level 20 to ride your chocobo.', xi.msg.channel.NS_SAY, ' ')
            return
        elseif #player:getNotorietyList() > 0 then
            player:printToPlayer('You cannot mount your chocobo while in combat.', xi.msg.channel.NS_SAY, ' ')
            return
        elseif player:getCharVar('[XISP]chocoboTimer') > os.time() then -- Timer set when getting off mount
            local chocoTimer = player:getCharVar('[XISP]chocoboTimer') - os.time()
            local minutes    = math.floor(chocoTimer / 60)
            local seconds    = chocoTimer % 60
            player:printToPlayer('Your chocobo appears too tired to ride.', xi.msg.channel.NS_SAY, ' ')
            player:printToPlayer('You must wait ' .. minutes .. ' more minute(s) and ' .. seconds .. " seconds(s).", xi.msg.channel.NS_SAY, ' ')
            return
        end

        menu.options = dialogue
        xi.xisp.sendMenu(player, menu)

    else
        if player:getCharVar('[XISP]chocoWait') <= VanadielUniqueDay() then
            player:setCharVar('[XISP]chocoGrow', chocogrow + 1)
            player:setCharVar('[XISP]chocoWait', VanadielUniqueDay() + 1)
            chocogrow = player:getCharVar('[XISP]chocoGrow')

            if chocogrow < 1 then
                player:printToPlayer('Your chocobo seems a little nervous.', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow < 3 then
                player:printToPlayer('Your chocobo has begun to warm up to you.', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow < 6 then
                player:printToPlayer('Your chocobo refuses to leave your side.', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow <= 9 then
                player:printToPlayer('Your chocobo has come to adore you.', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow <= 12 then
                player:printToPlayer('Your chocobo is growing rapidly!', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow <= 15 then
                player:printToPlayer('Your chocobo considers you as their parent.', xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow <= 19 then
                player:printToPlayer('Your chocobo seems almost fully grown!', xi.msg.channel.SYSTEM_3, ' ')
            else
                player:setLocalVar('needsToZone', 1)
            end
        end

        if chocogrow <= 8 then
            choco:independentAnimation(choco, 252, 4)
        else
            choco:independentAnimation(choco, 251, 4)
        end
    end
end

xi.xispchocobo.despawnChocobo = function(player)
    if player:getCharVar('[XISP]hasChocobo') == 1 then
        local choco = GetMobByID(player:getCharVar('[XISP]chocoID'))

        if choco and choco:isSpawned() then
            choco:setBehavior(bit.band(choco:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
            DespawnMob(choco:getID())
        end
    end
end

xi.xispchocobo.spawnChocobo = function(player)
    xi.xispchocobo.despawnChocobo(player) -- Always despawn when spawning a new one

    -- Don't spawn chocobo if player is mounted
    if player:hasStatusEffect(xi.effect.MOUNTED) then
        return
    end

    if player:getCharVar('[XISP]hasChocobo') == 1 then
        local look       = '0x0700200000000000000000000000000000000000' -- Default yellow chocobo
        local pos        = player:getPos()
        local name       = 'Chocobo'
        local chocoStage = player:getCharVar('[XISP]chocoGrow')
        local color      = player:getCharVar('[XISP]chocoColor')
        local babyLook   = 1997
        local zone       = player:getZone()

        if chocoStage < 10 then
            name = 'Baby Chocobo'
        elseif chocoStage < 20 then
            name = 'Young Chocobo'
        end

        if player:getCharVar('[XISP]chocoName') > 0 then
            name = xi.xispchocobo.names[player:getCharVar('[XISP]chocoName')]
        end

        -- Alternatively check for zones we don't want chocobo in
        if
            player:getStatusEffect(xi.effect.MOUNTED) ~= nil or
            (chocoStage >= 20 and
            zone and
            zone:getTypeMask() ~= xi.zoneType.OUTDOORS)
        then
            return
        end

        -- Check for color overrides (Teen)
        if chocoStage >= 10 and chocoStage < 20 then
            if color == 2 then -- Black
                babyLook = 1999
            elseif color == 4 then -- Blue
                babyLook = 2000
            elseif color == 6 then -- Red
                babyLook = 2001
            elseif color == 8 then -- Green
                babyLook = 2002
            else
                babyLook = 1998 -- Normal Teen
            end

        -- Check for color overrides (Adult)
        elseif chocoStage >= 20 then
            if color == 2 then
                look = '0x0700210000000000000000000000000000000000' -- Black
            elseif color == 4 then
                look = '0x0700220000000000000000000000000000000000' -- Blue
            elseif color == 6 then
                look = '0x0700230000000000000000000000000000000000' -- Red
            elseif color == 8 then
                look = '0x0700240000000000000000000000000000000000' -- Green
            end
        end

        local choco = zone:insertDynamicEntity({
            objtype               = xi.objType.MOB,
            allegiance            = xi.allegiance.PLAYER,
            name                  = name,
            x                     = pos.x,
            y                     = pos.y,
            z                     = pos.z + 1,
            rotation              = 0 + math.random(0, 360),
            look                  = (chocoStage >= 20) and look or babyLook,
            groupId               = 100,
            groupZoneId           = xi.zone.GM_HOME,
            releaseIdOnDisappear  = true,

            onTrigger = function(player, choco)
                xi.xispchocobo.chocoboTrigger(player, choco)
            end,

            onMobSpawn = function(choco)
                choco:setRotation(player:getPos().rot + math.random(-5, 5))
                choco:setRoamFlags(xi.roamFlag.SCRIPTED)
                choco:setAutoAttackEnabled(false)
                choco:setUnkillable(true)
                choco:setStatus(xi.status.NORMAL)
                choco:setLocalVar('[XISP]isChocobo', 1)
                choco:setLocalVar('[XISP]ownerID', player:getID())
                player:setCharVar('[XISP]chocoID', choco:getID())

                choco:timer(400, function(chocoArg)
                    chocoArg:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1)
                    chocoArg:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
                    chocoArg:setMobMod(xi.mobMod.NO_DESPAWN, 1)
                    chocoArg:setMobMod(xi.mobMod.ROAM_COOL, 0)
                    chocoArg:setMobMod(xi.mobMod.NO_REST, 1)
                end)
            end,

            onMobRoam = function(choco)
                xi.xispfollow.follow(choco, GetPlayerByID(choco:getLocalVar('[XISP]ownerID')))
            end,
        })

        choco:setSpawn(pos.x + 1, pos.y, pos.z - 1)
        choco:spawn()
    end
end
