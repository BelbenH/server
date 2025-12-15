-----------------------------------
-- ID: 5909
-- Pickled Rarab Tail
-- Sometimes old man? Sometimes real fast
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 1800
    local chance = math.random(1, 100)

    if chance <= 20 then
        target:addStatusEffect(xi.effect.WEIGHT, 75, 0, duration / 2)
        target:addStatusEffect(xi.effect.COSTUME, 91, 0, duration / 2)
        target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.WEIGHT)
    else
        target:addStatusEffect(xi.effect.QUICKENING, 10, 0, duration)
        target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.QUICKENING)
    end
end

return itemObject
