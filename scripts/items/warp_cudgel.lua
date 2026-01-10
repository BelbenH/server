-----------------------------------
-- ID: 17040
-- Warp Cudgel 
-- Transports the user to their Home Point
-- (PHALANX Escape Cudgel)
-- (PHALANX Transports the user outside of the current dungeon)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.ESCAPE, 0, 3)
end

return itemObject
