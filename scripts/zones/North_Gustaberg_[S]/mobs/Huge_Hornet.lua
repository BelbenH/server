-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Huge Hornet
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity