-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  Mob: War Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
