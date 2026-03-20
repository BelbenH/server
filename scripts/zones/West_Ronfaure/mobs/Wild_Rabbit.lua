-----------------------------------
-- Area: West Ronfaure
--  Mob: Wild Rabbit
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
	-- Set respawn time in seconds
	mob:setRespawnTime(30)
    mob:setMod(xi.mod.EXP_LVL_MOD, -2) -- Subtract 2 levels for /check and exp purposes
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
