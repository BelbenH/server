-----------------------------------
-- Area: Palborough Mines
--  Mob: Rabit Rat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player)
end

return entity
