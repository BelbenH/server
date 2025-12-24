-----------------------------------
-- Area: Bibiki Bay
--  Mob: Hypnos Eft
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:renameEntity('Hobgoblin Spazz', true)
end

return entity
