-----------------------------------
-- ID: 17040
-- Warp Cudgel 
-- Transports the user to their Home Point
-- (PHALANX Escape Cudgel)
-- (PHALANX Transports the user outside of the current dungeon)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, caster)
    return 0
end

itemObject.onItemUse = function(target)
   target:addStatusEffect(xi.effect.TELEPORT, { power = xi.teleport.id.ESCAPE, duration = 3, origin = user, icon = 0 })
end

return itemObject
