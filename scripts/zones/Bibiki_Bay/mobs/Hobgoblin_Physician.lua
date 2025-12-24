-----------------------------------
-- Area: Bibiki Bay
--  Mob: Hobgoblin Physician
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:renameEntity('Hobgoblin Doc', true)
end

return entity
