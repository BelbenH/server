-----------------------------------
-- Area: Wajaom Woodlands
-- Mob: Soldier Pephredo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
