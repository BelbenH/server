-----------------------------------
-- Area: Bibiki Bay
--  Mob: Hypnos Eft
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:renameEntity('Hypnos Eft', true)
end

return entity
