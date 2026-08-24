-- Timeline of pal acquisition and stepping stones:
--      Initially a pal will scale and get better gear as the player does.
--      This will peak, and halt AFTER the player achieves full AF armor
--      Stage 1: Defeating a random HENM (King A - Squire, etc.)
--      Stage 2: Defeating a sky god (Random, Kirin included)
--      Stage 3: Defeating an HENM (Fafnir - Drg, etc.)
--      Stage 4: Defeating Ultima / Omega
--      Stage 5: Unlocking a relic
--
xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.getTier = function(player, pal)
    local lvl  = player:getMainLvl()
    local tier = 0
    local job  = player:getCharVar('[XISP]squireJob')

    if pal ~= nil then
        job = pal:getMainJob()
    end

    if xi.xispal.hasCompletedAF(player) and lvl >= 60 then
        tier = 4
    elseif lvl >= 40 then
        tier = 3
    elseif lvl >= 30 then
        tier =  2
    elseif lvl >= 20 then
        tier = 1
    end

    return tier + player:getCharVar('[XISP]palCosmeticUpgrade' .. job)
end

xi.xispal.spawnYoungSquire = function(player, zone)
    -- Only spawn NPC squire inside of cities
    if zone and zone:getTypeMask() ~= xi.zoneType.CITY then
        return
    end

    local look = xi.xispal.youngLook[player:getCharVar('[XISP]squireRace')]
    local pos  = player:getPos()

    if player:getCharVar('[XISP]quest1Var') ~= 1 then
        return
    end
    
    player:setCharVar('[XISP]squireIdleChat', GetSystemTime() + math.random(720, 900))

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = xi.xispal.squireName[player:getCharVar('[XISP]squireName')],
        x                     = pos.x + 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onTrigger = function(player, pal)
            if player ~= GetPlayerByID(pal:getLocalVar('[XISP]ownerID')) then
                return
            end
            
            if xi.xispal.youngSquireTrade(player, pal) then
                xi.xispal.youngSquireChat(player, pal)
            end
        end,

        onMobSpawn = function(pal)
            if not player then
                return
            end

            pal:setLocalVar('[XISP]ownerID', player:getID())
            pal:setLocalVar('[XISP]isPal', 1)
            pal:setRoamFlags(xi.roamFlag.SCRIPTED)
            pal:setStatus(xi.status.NORMAL)
            pal:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1)
            pal:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
            pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
            pal:setMobMod(xi.mobMod.ROAM_COOL, 0)
            pal:setMobMod(xi.mobMod.NO_REST, 1)
        end,
        
        onMobRoam = function(pal)
            xi.xispfollow.follow(pal, GetPlayerByID(pal:getLocalVar('[XISP]ownerID')))
            xi.xispal.idleYoungSquireChat(pal, GetPlayerByID(pal:getLocalVar('[XISP]ownerID')))
        end,
    })
    
    player:setCharVar('[XISP]squireID', pal:getID())
    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    pal:spawn()
end

xi.xispal.spawnSquire = function(player, zone)
    if player:getCharVar('[XISP]squireJob') == 0 then
        player:setCharVar('[XISP]squireJob', xi.job.RDM)
    end

    -- Only spawn NPC squire inside of cities
    if zone and zone:getTypeMask() ~= xi.zoneType.CITY then
        return
    end

    local face = player:getCharVar('[XISP]squireFace')
    local race = player:getCharVar('[XISP]squireRace')
    local lvl  = player:getMainLvl()
    local job  = player:getCharVar('[XISP]squireJob')
    local tier = xi.xispal.getTier(player)
    local look = ''

    if job == xi.job.PLD or job == xi.job.SAM or job == xi.job.DRK or job == xi.job.THF or job == xi.job.DRG then
        look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], xi.xispal.knightGearSets[job][tier])
    else
        look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], xi.xispal.mageGearSets[job][tier])
    end

    local pos  = player:getPos()

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = xi.xispal.squireName[player:getCharVar('[XISP]squireName')],
        x                     = pos.x + 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        minLevel              = 1,
        maxLevel              = 99,
        look                  = look,
        groupId               = xi.xispal.groupID[race],
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onTrigger = function(player, pal)
            xi.xispal.onSquireTrigger(player, pal)
        end,

        onMobSpawn = function(pal)
            if not player or not table then
                return
            end

            pal:setLocalVar('[XISP]ownerID', player:getID())
            pal:setLocalVar('[XISP]isPal', 1)

            pal:hideName(true)
            pal:setStatus(xi.status.INVISIBLE)

            pal:setRoamFlags(xi.roamFlag.SCRIPTED)

            local zone = player:getZone()

            -- Update appearance for players so they're not naked
            player:timer(4000, function(playerArg)
                pal:setStatus(xi.status.NORMAL)
                pal:hideName(false)

                pal:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1)
                pal:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
                pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
                pal:setMobMod(xi.mobMod.ROAM_COOL, 0)
                pal:setMobMod(xi.mobMod.NO_REST, 1)

                local zonePlayers = zone:getPlayers()

                for _, nearbyPlayer in pairs(zonePlayers) do
                    if nearbyPlayer:checkDistance(pal) <= 50 then
                        nearbyPlayer:sendEntityUpdateToPlayer(pal, xi.entityUpdate.ENTITY_SPAWN, xi.updateType.UPDATE_LOOK)
                    end
                end
            end)
        end,

        onMobRoam = function(pal)
            xi.xispfollow.follow(pal, GetPlayerByID(pal:getLocalVar('[XISP]ownerID')))
            xi.xispal.idleSquireChat(pal, GetPlayerByID(pal:getLocalVar('[XISP]ownerID')))
        end,
    })

    player:setCharVar('[XISP]squireID', pal:getID())
    pal:setSpawn(pos.x + 1, pos.y, pos.z)
    pal:spawn()
end

xi.xispal.spawnWyvern = function(pal)
    local zone = pal:getZone()
    local pos  = pal:getPos()

    local healingBreath = function(wyvern)
        local master = wyvern:getMaster()
        local lvl    = master:getMainLvl()
        local hpp    = master:getHPP()
        local healAmount = 80

        if master and master:isAlive() and hpp < 50 and wyvern:getLocalVar('breathCooldown') < GetSystemTime() then
            wyvern:setLocalVar('breathCooldown', GetSystemTime() + 20)
            wyvern:useMobAbility(896, pal)
        end
    end

    local wyvern = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = 'Tatang',
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z - 1,
        rotation              = pos.rotation,
        minLevel              = 1,
        maxLevel              = 75,
        look                  = 24,
        groupId               = 110,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(wyvern)
            wyvern:setMobLevel(pal:getMainLvl() - 2)
            wyvern:addMobMod(xi.mobMod.NO_DESPAWN, 1)
            wyvern:setUntargetable(true)
            wyvern:addStatusEffect(xi.effect.MAX_HP_DOWN, { power = 75, origin = wyvern, })
        end,

        onMobRoam = function(wyvern)
            local master = wyvern:getMaster()
            if not master or not master:isAlive() then
                DespawnMob(wyvern:getID())
                return
            else
                if master:isEngaged() and not wyvern:isEngaged() then
                    wyvern:updateEnmity(master:getTarget())
                end
                healingBreath(wyvern)
            end
        end,

        onMobFight = function(wyvern, target)
            local master = wyvern:getMaster()
            if not master or not master:isAlive() then
                DespawnMob(wyvern:getID())
            else
                healingBreath(wyvern)
            end
        end,
    })

    return wyvern
end

xi.xispal.getMaster = function(entity)
    for _, member in pairs(GetPlayerByID(entity:getLocalVar('[XISP]playerID')):getPartyWithTrusts()) do
        if member:isTrust() and member:getTrustID() == 936 then
            return member
        end
    end

    return nil
end

xi.xispal.spawnAvatar = function(pal, player)
    local avatarToSummon = {}
    local avatarData =
    {
        { name = "Carbuncle", look = 16, quest = { xi.questLog.WINDURST,    xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW }, skillID = 2031, groupId = 102,},
        { name = "Fenrir",    look = 17, quest = { xi.questLog.WINDURST,    xi.quest.id.windurst.THE_MOONLIT_PATH },     skillID = 325,  groupId = 109,},
        { name = "Ifrit",     look = 18, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_FIRE },        skillID = 2013, groupId = 106,},
        { name = "Titan",     look = 19, quest = { xi.questLog.BASTOK,      xi.quest.id.bastok.TRIAL_BY_EARTH },         skillID = 2029, groupId = 103,},
        { name = "Leviathan", look = 20, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_WATER },       skillID = 2028, groupId = 104,},
        { name = "Garuda",    look = 21, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_WIND },        skillID = 2026, groupId = 105,},
        { name = "Shiva",     look = 22, quest = { xi.questLog.SANDORIA,    xi.quest.id.sandoria.TRIAL_BY_ICE },         skillID = 2025, groupId = 107,},
        { name = "Ramuh",     look = 23, quest = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING }, skillID = 2027, groupId = 108,},
    }
    local zone  = pal:getZone()
    local pos   = pal:getPos()
    local summon = nil

    -- Build table of possible summons
    for i, sum in pairs(avatarData) do
        if
            player:hasCompletedQuest(sum.quest[1], sum.quest[2]) or
            i == 1 -- Always include Carbuncle
        then
            table.insert(avatarToSummon, sum)
        end
    end
    -- Select one at random
    summon = avatarToSummon[math.random(1, #avatarToSummon)]

    local avatar = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = summon.name,
        x                     = pos.x + math.random(1, 2),
        y                     = pos.y,
        z                     = pos.z + math.random(1, 2),
        rotation              = pos.rotation,
        look                  = summon.look,
        minLevel              = 1,
        maxLevel              = 75,
        groupId               = avatarData.groupId,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,

        onMobSpawn = function(avatar)
            avatar:setStatus(xi.status.NORMAL)
            avatar:setLocalVar('[XISP]playerID', player:getID())
            avatar:setMobLevel(player:getMainLvl() - 2)
            avatar:setMobMod(xi.mobMod.SKILL_LIST, summon.skillID)
            avatar:setMod(xi.mod.REGAIN, 100) -- Could use rebalancing
            avatar:setLocalVar('canEngage', GetSystemTime() + 3)

            avatar:timer(10000, function(avatarArg)
                avatarArg:setTP(3000) -- Use ability right out of the gates
            end)
        end,

        onTrigger = function(avatar, player)
        end,

        onMobRoam = function(avatar)
            local master = avatar:getMaster()

            if not master then
                DespawnMob(avatar:getID())
                return
            end

            if avatar:checkDistance(master) > 5 then
                local pos = master:getPos()
                avatar:pathTo(pos.x, pos.y, pos.z, xi.path.flag.RUN)
            else
                local pos = avatar:getPos()
                avatar:pathTo(pos.x, pos.y, pos.z, xi.path.flag.RUN)
            end
        end,

        onMobEngage = function(avatar, target)
            local master = avatar:getMaster()
            if master then
                master:independentAnimation(master, 94, 2)
            end
        end,

        onMobFight = function(avatar, target)
            local master = avatar:getMaster()
            if master and not master:isAlive() then
                DespawnMob(avatar:getID())
            end

            if avatar:getBattleTime() > 15 or master:getMPP() < 10 then
                master:independentAnimation(master, 94, 2)
                avatar:setHP(0)
            end
        end,

        onMobDeath = function(avatar)
            DespawnMob(avatar:getID())
        end,

        onMobSkillReadyTime = function(avatar, target)
            local master = avatar:getMaster()
            if master then
                master:independentAnimation(master, 94, 2)
            end
        end,
    })

    return avatar
end
