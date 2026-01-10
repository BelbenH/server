-----------------------------------
-- xi.effect.MOUNTED
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local mountId    = effect:getPower()
    -- Retail sends a music change packet (packet ID 0x5F) in both cases.

    local animation = xi.animation.NONE

    if
        mountId == xi.mount.CHOCOBO or
        mountId == xi.mount.NOBLE_CHOCOBO
    then
        target:changeMusic(4, 212)
        animation = xi.anim.CHOCOBO
    else
        target:changeMusic(4, 84)
        animation = xi.anim.MOUNT
    end

    if not target:isInEvent() then
        target:setAnimation(animation)
    end

    -- Chocobo and mounts uncharm current pet
    local pet = target:getPet()
    if pet ~= nil and pet:isCharmed() then
        target:despawnPet()
    end

    -- XISP Changes ------------------------------------------
    local hasChocobo     = target:getCharVar('[XISP]chocoID')
    local ridingOwnChoco = target:getCharVar('ownChoco')

    if hasChocobo > 0 then
        target:setCharVar('[XISP]chocoID', 0)
    end

    if ridingOwnChoco == 1 then
        xi.xispchocobo.despawnChocobo(target)
        target:changeMusic(4, 177) -- Special XISP mount music
    end
    ---------------------------------------------------------
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if not target:isInEvent() then -- Paranoia safety check
        target:setAnimation(xi.anim.NONE)
    end

    -- Remove CharVars from player participating in chocobo riding game
    if target:isPC() then
        xi.chocoboGame.dismountChoco(target)

        -- XISP Changes ------------------------------------------
        if target:getCharVar('ownChoco') == 1 then
            target:setCharVar('[XISP]chocoboTimer', GetSystemTime()+ math.random(180, 300)) -- 3 - 5 minutes
            target:setCharVar('ownChoco', 0)
        end


        target:timer(3000, function(targetArg)
            if targetArg:getCharVar('[XISP]hasChocobo') == 1 then
                xi.xispchocobo.spawnChocobo(targetArg, targetArg:getZone())
            end
        end)
        ---------------------------------------------------------
    end
end

return effectObject
