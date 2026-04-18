-----------------------------------
-- func: engage
-- desc: Commands pals to engage in battle
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player, target)
    local target = player:getCursorTarget()
    local timer  = player:getLocalVar('[XISP]palEngageTimer')
    local flag   = false

    for _, member in pairs(player:getPartyWithTrusts()) do
        if member:isTrust() then
            flag = true
        end
    end

    if not flag then
        player:printToPlayer('You have no pals at your side.', xi.msg.channel.SYSTEM_3, '')
        return
    end

    if timer > GetSystemTime() then
        player:printToPlayer('Your pals are not ready to engage yet.', xi.msg.channel.SYSTEM_3, '')
        return
    end

    if target then
        if target:isMob() then
            xi.xispal.engageTarget(player, target)
        else
            player:printToPlayer('Your pals cannot engage that target.', xi.msg.channel.SYSTEM_3, '')
        end
    end

end

return commandObj
