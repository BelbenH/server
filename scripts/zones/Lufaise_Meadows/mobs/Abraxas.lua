-----------------------------------
-- Area: Quicksand Caves
--  Mob: Girtab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addMobMod(xi.mobMod.EXP_BONUS, 20)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
