xi = xi or {}
xi.battlegrounds = xi.battlegrounds or {}

xi.battlegrounds.checkLootValid = function(party, item)
    for _, member in pairs(party) do
        if not member:hasItem(item) then
            return true -- Return true if a player can acquire an ex item
        end
    end

    return false
end

xi.battlegrounds.checkZone = function(zone)
    local flag = true

    -- Reset the zone if no participating players remain
    if zone:getLocalVar('[XISP]battlefieldInProgress') == 1 then
        for _, player in pairs(zone:getPlayers()) do
            if player:getLocalVar('[XISP]inBattle') == 1 then
                flag = false
            end
        end

        if flag then
            xi.battlegrounds.resetZone(zone)
        end
    end
end

xi.battlegrounds.handleLoot = function(zone, level, player)
    lootPool = {}

    -- Augment Loot
    for i, group in ipairs(xi.battlegrounds.lootTables[level].AUGMENT) do
        if math.random(1, 100) <= group.CHANCE then
            local item = group.ITEMS[math.random(1, #group.ITEMS)]
            table.insert(lootPool, item)
        end
    end

    -- Equipment Loot
    for i, group in ipairs(xi.battlegrounds.lootTables[level].EQUIPMENT) do
        if math.random(1, 100) <= group.CHANCE then
            local item = group.ITEMS[math.random(1, #group.ITEMS)]

            if xi.battlegrounds.checkLootValid(player:getParty(), item) then
                table.insert(lootPool, item)
            end
        end
    end

    -- Zone specific Loot
    for _, specialGroup in ipairs(xi.battlegrounds.zoneInfo[zone:getID()].SPECIAL_LOOT) do
        if math.random(1, 100) <= specialGroup.CHANCE then
            local item = specialGroup.ITEMS[math.random(1, #specialGroup.ITEMS)]
            if xi.battlegrounds.checkLootValid(player:getParty(), item) then
                table.insert(lootPool, item)
            end
        end
    end

    -- If no item, give gil instead
    if #lootPool > 0 then
        for _, item in pairs(lootPool) do
            player:addTreasure(item)
        end
    else
        for _, member in pairs(player:getParty()) do
            npcUtil.giveCurrency(member, 'gil', math.random(100, 150) * (level - 5))
            npcUtil.giveReward(member, { exp = math.random(40, 75) * (level - 10), })
        end
    end
end

xi.battlegrounds.spawnChest = function(zone, level, pos, player)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 1, 4)

    local chest = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Treasure Chest",
        x = posX,
        y = pos.y,
        z = posZ,
        rotation = pos.rotation,
        look = xi.battlegrounds.models.CHEST,

        onTrigger = function(player, chest)
            if chest:getLocalVar('isOpen') == 0 then
                -- Check if mobs are still alive
                for _, variables in pairs(chest:getLocalVars()) do
                    mobID = chest:getLocalVar(variables.varname)
                    if
                        mobID > 100 and -- Filter out unrelated variables
                        GetMobByID(mobID) ~= nil and
                        GetMobByID(mobID):isAlive()
                    then
                        player:printToPlayer("There are still monsters about!", xi.msg.channel.NS_SAY, "")
                        return
                    end
                end

                chest:setLocalVar('isOpen', 1)
                chest:entityAnimationPacket(xi.animationString.OPEN_CRATE_GLOW)
                xi.battlegrounds.handleLoot(zone, level, player)

            else
                player:printToPlayer("This chest has already been open.", xi.msg.channel.NS_SAY, "")
            end
        end,
    })
    chest:setStatus(xi.status.NORMAL)
    chest:setLocalVar('[XISP]bgFlag', 1)
    return chest
end

xi.battlegrounds.spawnTorch = function(zone, pos)
    local torch = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = xi.battlegrounds.models.TORCH,
        namevis = false,
    })
    torch:setStatus(xi.status.NORMAL)
    torch:setLocalVar('[XISP]bgFlag', 1)
    torch:setUntargetable(true)
end

xi.battlegrounds.spawnBanner = function(zone, pos)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 6, 8)

    local banner = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = posX,
        y = pos.y,
        z = posZ,
        rotation = math.random(0, 249),
        look = xi.battlegrounds.models.BANNER,
        namevis = false,
    })
    banner:setStatus(xi.status.NORMAL)
    banner:setLocalVar('[XISP]bgFlag', 1)
    banner:setUntargetable(true)
end

xi.battlegrounds.spawnCampfire = function(zone, pos)
    local campfire = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = math.random(0, 249),
        look = xi.battlegrounds.models.CAMMPFIRE,
        namevis = false,
    })
    campfire:setStatus(xi.status.NORMAL)
    campfire:setLocalVar('[XISP]bgFlag', 1)
    campfire:setUntargetable(true)
end

xi.battlegrounds.spawnCamp = function(zone, level, pos)
    -- Spawn Decorations
    xi.battlegrounds.spawnCampfire(zone, pos)
    xi.battlegrounds.spawnBanner(zone, pos)

    -- Generate Torches in a guaranteed circle around camp
    local newPos = { x = 0, y = 0, z = 0, }
    newPos.y = pos.y
    newPos.x = pos.x + math.random(8, 10)
    newPos.z = pos.z + math.random(8, 10)
    xi.battlegrounds.spawnTorch(zone, newPos)
    newPos.x = pos.x + math.random(8, 10)
    newPos.z = pos.z - math.random(8, 10)
    xi.battlegrounds.spawnTorch(zone, newPos)
    newPos.x = pos.x - math.random(8, 10)
    newPos.z = pos.z + math.random(8, 10)
    xi.battlegrounds.spawnTorch(zone, newPos)
    newPos.x = pos.x - math.random(8, 10)
    newPos.z = pos.z - math.random(8, 10)
    xi.battlegrounds.spawnTorch(zone, newPos)
end

xi.battlegrounds.spawnAlly = function(zone, pos, level)
    local table      = xi.battlegrounds.zoneInfo[zone:getID()]
    local info       = table.ALLIES[math.random(1, #table.ALLIES)]

    local ally = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(ally)
            if info.spellList > 0 then
                ally:setSpellList(info.spellList)
            end
            ally:setMobMod(xi.mobMod.SKILL_LIST, info.skillList)
            ally:addStatusEffect(xi.effect.LEVEL_RESTRICTION, { power = info.LEVEL, origin = ally })
            ally:setLocalVar('[XISP]bgFlag', 1)
            ally:setMod(xi.mod.REGEN, 300)
            ally:changeJob(info.job)
            ally:setMobLevel(level)
            ally:setUnkillable(true)
        end,

        onMobEngage = function(ally, target)
            target:updateEnmity(ally)
        end,
    })
    ally:setSpawn(pos.x, pos.y, pos.z)
    return ally
end

xi.battlegrounds.spawnMobDeco = function(zone, pos, level)
    local table      = xi.battlegrounds.zoneInfo[zone:getID()]
    local info       = table.MOBS[math.random(1, #table.MOBS)]

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        minLevel              = level,
        maxLevel              = level,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,
        namevis               = false,

        onMobSpawn = function(mob)
            mob:changeJob(info.job)

            mob:setSpellList(info.spellList)
            mob:setLocalVar('[XISP]bgFlag', 1)
            mob:setMod(xi.mod.REGEN, 300)
            mob:addStatusEffect(xi.effect.LEVEL_RESTRICTION, { power = info.LEVEL, origin = mob })
            mob:setUnkillable(true)
        end,
    })
    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end

xi.battlegrounds.generateMob = function(zone, pos, level)
    local table      = xi.battlegrounds.zoneInfo[zone:getID()]
    local info       = table.MOBS[math.random(1, #table.MOBS)] -- Pick a random mob from table
    local newLevel = level + math.random(2, 3)

    if level == 15 then
        newLevel = level + math.random(-2, 0)
    end -- Players will typically be solo / only with a squire at this point

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        minLevel              = newLevel,
        maxLevel              = newLevel,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            mob:changeJob(info.job)

            mob:addStatusEffect(xi.effect.LEVEL_RESTRICTION, { power = info.LEVEL, origin = mob })
            mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 10)
            mob:setSpellList(info.spellList)
            mob:setLocalVar('[XISP]bgFlag', 1)
        end,
    })

    mob:addListener('DEATH', 'BATTLEFIELD_MOB_DEATH', function(mobArg, player)
        local zone = mobArg:getZone()

        zone:setLocalVar('mobsKilled', zone:getLocalVar('mobsKilled') + 1)

        if zone:getLocalVar('mobsKilled') >= zone:getLocalVar('mobsRequired') then
            xi.battlegrounds.completeBattlefield(player)
        else
            -- Try to spawn an NM
            if math.random(1, 100) < 5 then
                local nm = xi.battlegrounds.generateNM(zone, mobArg:getPos(), level + 2)
                nm:spawn()
                nm:updateEnmity(player)
            end
        end
    end)

    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end

xi.battlegrounds.generateNM = function(zone, pos, level)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 5, 12)
    local table      = xi.battlegrounds.zoneInfo[zone:getID()]
    local info       = table.NMS[math.random(1, #table.NMS)] -- Pick a random mob from table
    local rot        = math.random(0, 249)

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = posX,
        y                     = pos.y,
        z                     = posZ,
        minLevel              = level,
        maxLevel              = level,
        rotation              = rot,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            mob:addStatusEffect(xi.effect.LEVEL_RESTRICTION, { power = info.LEVEL, origin = mob })
            mob:setMobLevel(newLevel)
            mob:changeJob(info.job)
            mob:setMobMod(xi.mobMod.EXP_BONUS, math.random(10, 15) * level)
            mob:setMobMod(xi.mobMod.GIL_MIN, 10 * level)
            mob:setMobMod(xi.mobMod.GIL_MAX, 15 * level)
            mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 5)
            mob:setLocalVar('[XISP]bgFlag', 1)
            mob:setSpellList(info.spellList)
        end,
    })
    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end

local menu = {}
local dialogue = {}

menu =
{
    title = "Are you and your allies for battle?",
    options = {}
}

dialogue =
{
    {
        "We are.",
        function(playerArg)
            local zone = playerArg:getZone()

            zone:setLocalVar('[XISP]battlefieldCooldown', GetSystemTime() + 10800) -- 3 hour cooldown
            zone:setLocalVar('[XISP]battlefieldTimeLimit', GetSystemTime() + 3600) -- 1 hour time limit
            zone:setLocalVar('[XISP]battlefieldInProgress', 1)
            playerArg:setLocalVar('[XISP]inBattle', 1) -- Used for chocobo mount music
            xi.battlegrounds.beginBattle(playerArg)
        end,
    },
    {
        'Not yet.',
        function(playerArg)
        end,
    },
}

xi.battlegrounds.spawnNPC = function(zone, pos)
    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Warden",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = 1315,

        onTrigger = function(player, npc)
            xi.battlegrounds.initZone(player, npc)
        end
    })
    npc:setStatus(xi.status.NORMAL)
end

xi.battlegrounds.initZone = function(player, npc)
    local debug = false
    local zone  = player:getZone()
    local party = player:getParty()

    local requirements = xi.battlegrounds.zoneInfo[player:getZone():getID()].REQUIREMENTS

    if zone:getLocalVar('[XISP]battlefieldInProgress') == 0 or debug then
        -- Check for requirements of all members
        for _, member in pairs(party) do
            -- Ensure all members are in the zone
            if member:getZone() ~= zone then
                player:printToPlayer("You have members that are not present and ready to begin the offensive.", 0, npc:getPacketName())
                return

            -- Ensure all members are high enough level
            elseif member:getMainLvl() < requirements.LEVEL then
                player:printToPlayer("Adventurer, build up your strength. I do not see your potential in aiding us in this fight.", 0, npc:getPacketName())
                return

            -- Ensure all members meet rank requirements
            elseif member:getRank(player:getNation()) < requirements.RANK then
                player:printToPlayer("Adventurer, an you or an ally must build up rank in their nation before they can be recognized in this conflict.", 0, npc:getPacketName())
                return

            -- Ensure all members are not on conquest tally cooldown
            elseif member:getCharVar('[XISP]conquestCooldown') == 1 then
                player:printToPlayer("The land lies quiet, friend. No horns nor warcries echo today. Enjoy the stillness. Vanadiel knows rare peace.", 0, npc:getPacketName())
                return
            end
        end

        player:printToPlayer("Halt, adventurer! Shadows stir beyond the horizon, beastmen gather in force. Steel thy blade, for war is nearly upon us!", 0, npc:getPacketName())
        menu.options = dialogue
        xi.xisp.sendMenu(player, menu)

    elseif player:getZone():getLocalVar('[XISP]battlefieldInProgress') == 1 then
        player:printToPlayer("Beastmen forces have breached the outer line! The kingdom has already dispatched warriors to engage the enemy.", 0, npc:getPacketName())

    else
        player:printToPlayer("The land lies quiet, friend. No horns nor warcries echo today. Enjoy the stillness. Vanadiel knows rare peace.", 0, npc:getPacketName())
    end
end

xi.battlegrounds.beginBattle = function(player)
    local zone = player:getZone()
    local info = xi.battlegrounds.zoneInfo[zone:getID()]
    local maxMobs = 0

    -- Give player and party shared battlefield level sync
    for _, member in pairs(player:getParty()) do
        member:setCharVar('[XISP]conquestCooldown', 1, NextConquestTally())
        member:addStatusEffect(xi.effect.LEVEL_RESTRICTION, { power = info.LEVEL, origin = member })
        member:changeMusic(0, 247) -- Night Music
        member:changeMusic(1, 247) -- Day Music
        member:changeMusic(2, 247) -- Battle Music
    end

    -- Setup the decos + spawn mobs
    for _, camp in pairs(info.CAMPS) do
        local chest = xi.battlegrounds.spawnChest(zone, info.LEVEL, camp.pos)
        xi.battlegrounds.spawnCamp(zone, info.LEVEL, camp.pos)

        maxMobs = maxMobs + camp.numMobs

        -- Spawn mobs for each numMobs in camp
        for i = 1, camp.numMobs do
            local pos = camp.pos
            pos.x, pos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 5)
            pos.rotation = math.random(0, 249)
            local mob = xi.battlegrounds.generateMob(zone, pos, info.LEVEL)
            mob:spawn()
            chest:setLocalVar('tetheredMob' .. i, mob:getID())
        end
    end

    zone:setLocalVar('mobsRequired', maxMobs)

    -- Setup allies and deco mobs
    for _, camp in pairs(info.DEFENDER_CAMPS) do
        for i = 1, camp.numGroups do
            local newPos = { x = 0, y = 0, z = 0, }
            newPos.y = camp.pos.y
            newPos.x, newPos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 10)
            newPos.rotation = math.random(0, 249)
            local ally = xi.battlegrounds.spawnAlly(zone, newPos, info.LEVEL)

            newPos.x, newPos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 10)
            newPos.rotation = math.random(0, 249)
            local decoMob = xi.battlegrounds.spawnMobDeco(zone, newPos, info.LEVEL)

            ally:spawn()
            decoMob:spawn()
            ally:updateEnmity(decoMob)
        end
    end
    -- Mount music handled in mounted.lua
end

xi.battlegrounds.resetZone = function(zone)
    if zone then
        zone:setLocalVar('[XISP]battlefieldInProgress', 0)
        zone:setLocalVar('mobsKilled', 0)

        -- Give players some time to open last crate
        for _, npc in pairs(zone:getNPCs()) do
            if npc:getLocalVar('[XISP]bgFlag') == 1 then
                npc:setStatus(xi.status.DISAPPEAR)
            end
        end

        for _, mob in pairs(zone:getMobs()) do
            if mob:getLocalVar('[XISP]bgFlag') == 1 then
                DespawnMob(mob:getID())
            end
        end

        for _, player in pairs(zone:getPlayers()) do
            player:changeMusic(0, zone:getBackgroundMusicDay())
            player:changeMusic(1, zone:getBackgroundMusicNight())
            player:changeMusic(2, zone:getSoloBattleMusic())
        end
    end
end

xi.battlegrounds.completeBattlefield = function(player)
    local zone = player:getZone()

    for _, mob in pairs(zone:getMobs()) do
        if mob:getLocalVar('[XISP]bgFlag') == 1 then
            DespawnMob(mob:getID())
        end
    end

    zone:setLocalVar('[XISP]battlefieldInProgress', 0)

    for _, member in pairs(player:getPartyWithTrusts()) do
        if not member:isTrust() then
            npcUtil.giveReward(member, { exp = math.random(70, 75) * member:getMainLvl() })
            member:changeMusic(0, 120)
            member:changeMusic(1, 120)
            member:changeMusic(2, zone:getSoloBattleMusic()) -- Normal Combat Music

            member:setLocalVar('[XISP]inBattle', 0)
        end

        member:delStatusEffect(xi.effect.LEVEL_RESTRICTION)
    end

    local pos = xi.battlegrounds.zoneInfo[zone:getID()].DEFENDER_CAMPS[1].pos

    local fireworks = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = "0x0000470100000000000000000000000000000000",
    })

    fireworks:setStatus(xi.status.NORMAL)
    fireworks:setUntargetable(true)

    fireworks:timer(60000, function(fireworksArg)
        xi.battlegrounds.resetZone(zone)
        fireworksArg:setStatus(xi.status.DISAPPEAR)
    end)
end
