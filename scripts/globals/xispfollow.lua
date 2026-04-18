xi = xi or {}
xi.xispfollow = xi.xispfollow or {}

xi.xispfollow.follow = function(entity, player)
    -- Fail safe: If player isn't logged in, despawn the pal
    if not player then
        DespawnMob(entity:getID())
        return
    end

    if player:getID() ~= entity:getLocalVar('ownerID') then
        player = GetPlayerByID(player:getID())

        if not player then
            print('DEBUG: Couldn\'t find player with ID ' .. entity:getLocalVar('ownerID') .. ' to follow. Despawning follower.')
            if entity and entity:isSpawned() then
                entity:setBehavior(bit.band(entity:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                DespawnMob(entity:getID())
                return
            end
        end
    end

    local party      = player:getPartyWithTrusts()
    local lPos       = player:getPos()
    local posX, posZ = xi.xisp.getPointAroundLoc(lPos, 4, 4)
    local pos        = entity:getPos()
    local dist       = 10

    if entity:getLocalVar('[XISP]isPal') == 1 and entity:getLocalVar('[XISP]isChocobo') == 0 then
        dist = 7
    end

    -- Match leader's speed
    entity:setBaseSpeed(player:getSpeed())

    -- Teleport to player if far away
    if entity:checkDistance(player) > 40 then
        entity:setPos(posX, lPos.y, posZ)
        entity:setLocalVar('isMoving', 1)
        entity:pathTo(posX, lPos.y, posZ)
        return
    end

    -- Update movement parameters
    if entity:checkDistance(player) > dist then
        entity:setLocalVar('isMoving', 1)

        if entity:getLocalVar('[XISP]isResting') == 1 then
            return
        end

        entity:pathTo(posX, lPos.y, posZ)
    else
        entity:setLocalVar('isMoving', 0)
        entity:pathTo(pos.x, pos.y, pos.z)
    end

    if entity:getLocalVar('[XISP]isResting') == 0 and entity:getLocalVar('isMoving', 0) then
        for _, member in pairs(party) do
            if
                member and
                member ~= entity and
                entity:checkDistance(member) <= 0.5
            then
                local lPos = member:getPos()
                local posX, posZ = xi.xisp.getPointAroundLoc(lPos, 4, 4)
                entity:setBaseSpeed(20) -- Walk speed

                entity:setLocalVar('[XISP]isMoving', 1)
                entity:pathTo(posX, lPos.y, posZ)
                break
            end
        end
    end
end

-- Used by pals in combat that want to maintain a distance from the mob they've engaged
xi.xispfollow.keepDistance = function(pal, target, distance)
    if target:getTarget() == pal then
        return
    end

    local master       = pal:getMaster()
    local currDistance = pal:checkDistance(target)
    local maxDistance  = 20

    if pal:getMainJob() == xi.job.BRD then
        maxDistance = 13
    end

    if
        (currDistance < distance or currDistance > 20) and
        pal:checkDistance(master) < 20 and -- Don't move too far from master
        pal:getLocalVar('[XISP]isResting') == 0 and
        pal:getLocalVar('movementCooldown') < GetSystemTime()
    then
        local bestPos = nil
        local bestScore = math.huge

        -- This signals for the pal to start moving. Send the signal and return
        if pal:getLocalVar('[XISP]isResting') == 1 then
            pal:setLocalVar('isMoving', 1)
            return
        end

        for i = 0, 360, 30 do -- 12 sample points (adjust density if needed)
            local angle = math.rad(i)

            local pos = GetFurthestValidPosition(target, distance, angle)

            if pos then
                local distToMaster = master:checkDistance(pos)

                if distToMaster <= 20 then
                    -- Score = how close we are to ideal situation
                    local distToTarget = target:checkDistance(pos)

                    local score =
                    math.abs(distToTarget - distance) +  -- prefer correct range
                    (distToMaster * 0.1)                -- slight bias toward master proximity

                    if score < bestScore then
                        bestScore = score
                        bestPos = pos
                    end
                end
            end
        end

        if bestPos then
            pal:pathTo(bestPos.x + math.random(-1, 1), bestPos.y, bestPos.z + math.random(-1, 1))
            pal:setLocalVar('movementCooldown', GetSystemTime() + 10)
            pal:setLocalVar('[XISP]spellRecast', GetSystemTime() + 5) -- Delay casting a little
            pal:setLocalVar('isMoving', 1)
        end
    else
        pal:setLocalVar('isMoving', 0)
    end
end