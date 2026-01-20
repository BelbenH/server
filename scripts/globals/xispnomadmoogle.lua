xi = xi or {}
xi.nomadmoogle = xi.nomadmoogle or {}

xi.nomadmoogle.spawnMoogle = function(zone, pos)
    local moogle = zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = 'Nomad Moogle',
        look      = 981,
        x         = pos.x,
        y         = pos.y,
        z         = pos.z,
        rotation  = pos.rot,
        widescan  = 1,

        onTrigger  = function(player, moogle)
            player:printToPlayer('I can help you access your Mog House storage from here, kupo!', xi.msg.channel.SAY, 'Nomad Moogle')
            player:sendMenu(xi.menuType.MOOGLE)
        end,
    })

    moogle:setStatus(xi.status.NORMAL)
end
