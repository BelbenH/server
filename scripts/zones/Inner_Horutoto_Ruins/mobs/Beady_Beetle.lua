-----------------------------------
--  Mob: Out of Era adjusted mob
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:renameEntity('Beady Beetle', true)
end

return entity
