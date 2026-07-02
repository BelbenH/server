xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.generateModelID = function(face, race, table)
    local BODY_OFFSET  = 0x1000
    local HANDS_OFFSET = 0x2000
    local LEGS_OFFSET  = 0x3000
    local FEET_OFFSET  = 0x4000
    local MAIN_OFFSET  = 0x5000
    local SUB_OFFSET   = 0x6000
    local RANGE_OFFSET = 0x7000

    local modelID = "0x0100"

    -- Look
    modelID = modelID .. face
    modelID = modelID .. race
    modelID = modelID .. "00"

    -- Equipment
    modelID = modelID .. string.format("%04X", BODY_OFFSET + table.body)
    modelID = modelID .. string.format("%04X", HANDS_OFFSET + table.hands)
    modelID = modelID .. string.format("%04X", LEGS_OFFSET + table.legs)
    modelID = modelID .. string.format("%04X", FEET_OFFSET + table.feet)
    modelID = modelID .. string.format("%04X", MAIN_OFFSET + table.main)
    modelID = modelID .. string.format("%04X", SUB_OFFSET + table.sub)
    modelID = modelID .. string.format("%04X", RANGE_OFFSET)

    modelID = modelID .. "80"

    return modelID
end

xi.xispal.checkKnightRequirements = function(player, isAdvanced, table)
    if player:getCharVar('[XISP]squireProg') < 7 then
        return false
    end

    if player:getCharVar('[XISP]hasUnlockedKnights') == 1 then
        return true
    end

    if isAdvanced then
        if
            player:hasCompletedQuest(table.quest[1], table.quest[2]) and
            player:getMainLvl() >= 30 and
            player:getRank(player:getNation()) >= 3
        then
            return true
        end
    else
        if
            player:getMainLvl() >= 30 and
            player:getRank(player:getNation()) >= 3
        then
            return true
        end
    end

    return false
end

xi.xispal.checkMageRequirements = function(player, isAdvanced, table)
    local flag = false

    if player:getCharVar('[XISP]squireProg') < 7 then
        return false
    end

    if player:getCharVar('[XISP]hasUnlockedMages') == 1 then
        return true
    end

    if isAdvanced then
        if
            player:hasCompletedQuest(table.quest[1], table.quest[2]) and
            player:getMainLvl() >= 40 and
            player:getRank(player:getNation()) >= 4
        then
            flag = true
        end
    else
        if
            player:getMainLvl() >= 40 and
            player:getRank(player:getNation()) >= 4
        then
            flag = true
        end
    end

    return flag
end

xi.xispal.setKnight = function(player, table)
    xi.xispal.removeKnight(player)
    player:setCharVar('[XISP]hasKnight', 1)
    player:setCharVar('[XISP]knightFace', table.face)
    player:setCharVar('[XISP]knightRace', table.race)
    player:setCharVar('[XISP]knightJob', table.job)
    player:addSpell(table.trust, { silentLog = true })
end

xi.xispal.removeKnight = function(player)
    local currJob = player:getCharVar('[XISP]knightJob')

    if currJob > 0 then
        player:delSpell(xi.xispal.palInfo[currJob].trust)
    end
    player:setCharVar('[XISP]hasKnight', 0)
    player:setCharVar('[XISP]knightFace', 0)
    player:setCharVar('[XISP]knightRace', 0)
    player:setCharVar('[XISP]knightJob', 0)
end

xi.xispal.setMage = function(player, table)
    xi.xispal.removeMage(player)
    player:setCharVar('[XISP]hasMage', 1)
    player:setCharVar('[XISP]mageFace', table.face)
    player:setCharVar('[XISP]mageRace', table.race)
    player:setCharVar('[XISP]mageJob', table.job)
    player:addSpell(table.trust, { silentLog = true })
end

xi.xispal.removeMage = function(player)
    local currJob = player:getCharVar('[XISP]mageJob')

    if currJob > 0 then
        player:delSpell(xi.xispal.palInfo[currJob].trust)
    end

    player:setCharVar('[XISP]hasMage', 0)
    player:setCharVar('[XISP]mageFace', 0)
    player:setCharVar('[XISP]mageRace', 0)
    player:setCharVar('[XISP]mageJob', 0)
end

xi.xispal.updateFollowers = function(player)
    player:timer(5000, function(playerArg)
        for _, member in pairs(xi.xispal.getParty(player)) do
            member:independentAnimation(member, 2, 3)
        end
    end)
end

-- Power should only range between 1-3
xi.xispal.resurrect = function(player, power)
    local pal

    for _, member in pairs(xi.xispal.getParty(player)) do
        if member and not member:isAlive() then
            pal = member
            break
        end
    end

    if pal and not pal:isAlive() then
        pal:independentAnimation(pal, 12, 4)

        pal:timer(6000, function(palArg)
            palArg:hideName(true)
            palArg:entityAnimationPacket(xi.animationString.EFFECT_RAISE_PLAYER)
        end)

        pal:timer(10000, function(palArg)
            palArg:hideName(false)
            palArg:resetAI()
            palArg:independentAnimation(palArg, 2, 3)
            palArg:setHP(palArg:getMaxHP() * (0.33 * power))
            palArg:setMP(palArg:getMaxMP() * (0.33 * power))
            palArg:setAnimation(0)
            palArg:stun(4000)
        end)
    end
end


xi.xispal.hasCompletedAF = function(player)
    for _, quest in pairs(xi.xispal.afQuests) do
        if player:hasCompletedQuest(quest[1], quest[2]) then
            return true
        end
    end
    return false
end


xi.xispal.isCaster = function(pal)
    local job = pal:getMainJob()

    if not pal:isPC() then
        return (job == xi.job.WHM or job == xi.job.BLM or job == xi.job.SMN or job == xi.job.BRD)
    end
end


-- A pal should be told to stop resting before any action is called upon them
-- This can be readily used with xi.xispal.stopResting(pal)
-- After a pal stops resting, they will be unable to do so for another 5 seconds
-- Some logic is handled in healing.lua + xi.xispal.follow
xi.xispal.rest = function(pal, player)
    -- Increase timer if casting spell
    if
        pal:getCurrentAction() == xi.action.category.MAGIC_CASTING or
        pal:getLocalVar('isMoving') == 1
    then
        pal:setLocalVar('[XISP]canRest', GetSystemTime() + 3)
    end

    if
        (pal:getHP() >= pal:getMaxHP() and pal:getMP() >= pal:getMaxMP()) or
        pal:getLocalVar('[XISP]canRest') > GetSystemTime() or
        pal:getCurrentAction() ~= xi.action.category.ROAMING or
        pal:checkDistance(player) >= 15 or
        pal:getLocalVar('isMoving') == 1 or
        pal:isEngaged()
    then
        -- Delete healing if any of these conditions are met
        if pal:getStatusEffect(xi.effect.HEALING) then
            pal:delStatusEffectSilent(xi.effect.HEALING)
        end

        return
    end

    if not pal:hasStatusEffect(xi.effect.HEALING) then
        if pal:getMPP() < 15 then
            pal:setLocalVar('restTime', GetSystemTime() + 20)
        end
        pal:addStatusEffect(xi.effect.HEALING, { origin = pal, tick = 10, icon = 0 })
    end
end


-- This should be checked before casting spells to ensure not casting while resting
xi.xispal.stopResting = function(pal)
    if pal:getStatusEffect(xi.effect.HEALING) then
        pal:delStatusEffectSilent(xi.effect.HEALING)
        return true
    else
        return false
    end
end


xi.xispal.checkPet = function(pal, player)
    local job = pal:getMainJob()
    local pos = pal:getPos()

    if job ~= xi.job.DRG and job ~= xi.job.SMN then
        return
    end

    if pal:getLocalVar('[XISP]spellRecast') > GetSystemTime() then
        return
    end

    if job == xi.job.DRG then
        if
            pal:getLocalVar('petSummon') < GetSystemTime() and
            pal:getPet() == nil
        then
            pal:setLocalVar('petSummon', GetSystemTime() + 900)
            local wyvern = xi.xispal.spawnWyvern(pal)

            wyvern:setSpawn(pos.x + 1, pos.y, pos.z)
            SpawnMob(wyvern:getID())
            pal:setPet(wyvern)
            pal:spawnPet()
            pal:independentAnimation(pal, 94, 2)
        end
    end

    if job == xi.job.SMN then
        local target = xi.xispal.getTarget(pal)
        local pet = pal:getPet()

        if not target then
            return
        end

        if
            pal:getLocalVar('petSummon') < GetSystemTime() and
            not pal:hasPet() and
            player:hasClaim(target)
        then
            pal:setLocalVar('petSummon', GetSystemTime() + 45)
            pal:entityAnimationPacket(xi.animationString.CAST_SUMMONER_START)
            pal:addStatusEffect(xi.effect.STUN, { power = 1, duration = 5, origin = pal })

            pal:timer(5000, function(palArg)
                local avatar = xi.xispal.spawnAvatar(palArg, player)

                if avatar then
                    avatar:setSpawn(pos.x + math.random(1, 2), pos.y, pos.z + math.random(1, 2))
                    palArg:entityAnimationPacket(xi.animationString.CAST_SUMMONER_STOP)
                    avatar:spawn()
                    pal:setPet(avatar)
                end
            end)

        elseif
            target and
            pet and pet:isAlive() and
            not pet:isEngaged() and
            pet:getLocalVar('canEngage') < GetSystemTime() and
            player:hasClaim(target)
        then
            pet:updateEnmity(target)
        end
    end
end

xi.xispal.onMobSpawn = function(pal, player, table)
    if not player or not table then
        return
    end

    pal:hideName(true)
    pal:setStatus(xi.status.INVISIBLE)

    pal:renameEntity(table.name)

    pal:setLocalVar('petSummon', GetSystemTime() + 5) -- Used for DRG + SMN
    pal:setLocalVar('[XISP]spellRecast', GetSystemTime() + math.random(7, 12))
    pal:setLocalVar('[XISP]isPal', 1)


    pal:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1)
    pal:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
    pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
    pal:setMobMod(xi.mobMod.ROAM_COOL, 0)
    pal:setMobMod(xi.mobMod.NO_REST, 1)

    -- Update appearance for players so they're not naked
    player:timer(400, function(playerArg)
        pal:setStatus(xi.status.NORMAL)
        pal:hideName(false)
    end)
end

xi.xispal.onMageSpawn = function(pal, player, table)
    local look = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    local lvl  = player:getMainLvl()
    local tier = 0

    if lvl >= 60 then
        tier = 4
    elseif lvl >= 40 then
        tier = 3
    elseif lvl >= 30 then
        tier = 2
    elseif lvl >= 20 then
        tier = 1
    end

    -- Base bonuses for mages
    pal:addMod(xi.mod.MPHEAL, tier)

    pal:setAutoAttackEnabled(false)
    pal:setLookString(look)

    xi.xispal.onMobSpawn(pal, player, table)
end

xi.xispal.onKnightSpawn = function(pal, player, table)
    local tier    = 0
    local lvl     = player:getMainLvl()
    local job     = pal:getMainJob()
    local attp    = 0
    local THPower = 0
    local acc     = 15

    if xi.xispal.hasCompletedAF(player) and lvl >= 60 then
        tier = 2
    elseif lvl >= 30 then
        tier = 1
    end

    -- THF (Add Treasure Hunter)
    if job == xi.job.THF then
        if lvl >= 45 then
            THPower = 2
            attp = -20
        else
            attp = -10
            THPower = 1
        end

    -- DRG (Boost attk)
    elseif job == xi.job.DRG then
        if lvl == 75 then
            attp = 250
        elseif lvl > 65 then
            attp = 150
        elseif lvl == 40 then
            attp = 65
            else
            attp = 40
        end

    elseif job == xi.job.SAM then
        if lvl == 75 then
            attp = 275
        elseif lvl > 65 then
            attp = 175
        elseif lvl == 40 then
            attp = 75
        else
            attp = 50
        end

    -- DRK (Boost attk)
    elseif job == xi.job.DRK then
        if lvl == 75 then
            attp = 300
        elseif lvl > 65 then
            attp = 200
        elseif lvl == 40 then
            attp = 100
        else
            attp = 75
        end
    end

    pal:addMod(xi.mod.ATT, attp)
    pal:addMod(xi.mod.ACC, acc)
    pal:addMod(xi.mod.TREASURE_HUNTER, THPower)

    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][tier])
    pal:setLocalVar('isMelee', 1)
    pal:setLookString(look)

    xi.xispal.onMobSpawn(pal, player, table)
end

xi.xispal.onMobRoam = function(pal, player)
    local job      = pal:getMainJob()
    local distance = 15
    local target   = xi.xispal.getTarget(pal)

    if job == xi.job.BRD then
        distance = 10
    end

    if player then
        xi.xispal.rest(pal, player)
        xi.xispal.checkPet(pal, player)
        xi.xispal.checkMagic(pal, player)

        if pal:getLocalVar('isMelee') == 0 then
            xi.xispal.checkAbilities(pal, player, job)

            if target ~= nil then
                xi.xispfollow.keepDistance(pal, target, distance)
            else
                xi.xispfollow.follow(pal, player)
            end
        else
            if target ~= nil then
                pal:engage(target:getTargID())
            else
                xi.xispfollow.follow(pal, player) -- Rest logic is needed before follow
            end
        end
    else
        DespawnMob(pal:getID())
    end
end

xi.xispal.onMobEngage = function(pal, target, player)
end

xi.xispal.onMobFight = function(pal, target, player)
    local job = pal:getMainJob()

    -- Fix not approaching target
    if pal:checkDistance(target) > 10 then
        local pos = target:getPos()
        pal:pathTo(pos.x, pos.y, pos.z, bit.bor(xi.pathflag.RUN, xi.pathflag.SCRIPT))
    end

    xi.xispal.checkMagic(pal, player)
    xi.xispal.checkAbilities(pal, player, job)
    xi.xispal.checkWeaponSkill(pal, target, player, job)
    xi.xispal.checkPet(pal, player)
end

xi.xispal.onMobDisengage = function(pal)
    pal:setLocalVar('[XISP]canRest', GetSystemTime() + 5)

    if pal:getMainJob() == xi.job.BRD then
        pal:setLocalVar('[XISP]spellRecast', GetSystemTime() + 5)
    end
    
    if pal:getPet() then
        pal:getPet():disengage()
    end
end

-- No despawn handled in mob_pool
xi.xispal.onMobDeath = function(pal, player)
end

xi.xispal.engageTarget = function(player, target)
    local party = player:getPartyWithTrusts()

    if player:checkDistance(target) > 18 then
            player:printToPlayer('Target is too far away.', xi.msg.channel.SYSTEM_3, '')
            return
        end

    for _, trust in pairs(party) do
        if trust:isTrust() and trust:getMaster() == player then
            trust:setLocalVar('currentTarget', target:getID())
            trust:setLocalVar('elementalRecast', GetSystemTime() + 10)

            if trust:getLocalVar('isMelee') == 1 then
                trust:engage(target:getTargID())
            end
        end
    end

    player:injectActionPacket(player:getID(), 6, 94, 0, 0, 0, 10, 1)
    player:setLocalVar('[XISP]palEngageTimer', GetSystemTime() + 5)
end

xi.xispal.getTarget = function(pal)
    if pal:isEngaged() and pal:getTarget() then
        return pal:getTarget()
    end

    if pal:getLocalVar('currentTarget') == 0 then
        return nil
    end

    local target = GetMobByID(pal:getLocalVar('currentTarget'))

    if target then
        if target:isAlive() then
            return target
        else
            pal:setLocalVar('currentTarget', 0)
        end
    else
        return nil
    end
end

xi.xispal.onZone = function(player)
    local zone = player:getZone()

    if zone == nil then
        return
    end

    if player:inMogHouse() then
        return
    end

    -- Spawn Squire
    if player:getCharVar('[XISP]quest1Var') >= 1 then
        if player:getCharVar('[XISP]squireProg') < 7 then
            xi.xispal.spawnYoungSquire(player, zone)
        else
            xi.xispal.spawnSquire(player, zone)
        end
    end
end
