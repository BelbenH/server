-----------------------------------
-- Area: East Ronfaure
--  Mob: Wild Rabbit
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
	-- Set respawn time in seconds
    xi.alphamob.spawnAlpha(mob, player, optParams)
    mob:setMod(xi.mod.EXP_LVL_MOD, -2)
end

return entity
