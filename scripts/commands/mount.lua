---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'sss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!mount <mount ID> (player)')
end

commandObj.onTrigger = function(player, mount, target)
    -- Default to Chocobo (0)
    if mount == nil then
        mount = 0
    end

    -- validate mount
    mount = tonumber(mount) or xi.mount[string.upper(mount)]
    if mount == nil or mount < 0 or mount >= xi.mount.MOUNT_MAX then
        error(player, 'Invalid mount ID.')
        return
    end

    -- validate target
    local targ = player

    targ:addStatusEffectEx(xi.effect.MOUNTED, xi.effect.MOUNTED, mount, 0, 0, true)
end

return commandObj
