-----------------------------------
-- xi.effect.COSTUME
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:setCostume(effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- Case for Pickled Rarab Tail (Phalanx)
    if effect:getPower() == 91 and target:hasStatusEffect(xi.effect.WEIGHT) then
        target:delStatusEffect(xi.effect.WEIGHT)
    end

    target:setCostume(0)
end

return effectObject
