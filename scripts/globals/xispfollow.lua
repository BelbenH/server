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
            print('DEBUG: Couldn\'t find player with ID ' .. entity:getLocalVar('ownerID') .. ' to follow. Despawning chocobo.')
            if entity and entity:isSpawned() then
                entity:setBehavior(bit.band(entity:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                DespawnMob(entity:getID())
                return
            end
        end
    end

    local lPos   = player:getPos()
    local posX, posZ = xi.xisp.getPointAroundLoc(lPos, 2, 2)
    local pos    = entity:getPos()
    local dist   = 10

    -- Match leader's speed
    entity:setBaseSpeed(player:getSpeed())

    -- Teleport to player if far away
    if entity:checkDistance(player) > 40 then
        entity:setPos(posX, lPos.y, posZ)
        entity:setLocalVar('isMoving', 1)
        entity:pathTo(posX, lPos.y, posZ, xi.path.flag.RUN)
        return
    end

    -- Update movement parameters
    if entity:checkDistance(player) > dist then
        print(true)
        entity:setLocalVar('isMoving', 1)
        entity:pathTo(posX, lPos.y, posZ, xi.path.flag.RUN)
    else
        print("Not following")
        entity:setLocalVar('isMoving', 0)
        entity:pathTo(pos.x, pos.y, pos.z)
    end
end