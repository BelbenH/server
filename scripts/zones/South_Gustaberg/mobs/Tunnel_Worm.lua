-----------------------------------
-- Area: South Gustaberg
--  Mob: Tunnel Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
	-- Set respawn time in seconds
	mob:setRespawnTime(30)
    mob:setMod(xi.mod.EXP_LVL_MOD, -2)

    -- Only award regime credit if we have a valid killer
    if player ~= nil and optParams ~= nil and optParams.isKiller then
        xi.regime.checkRegime(player, mob, 1, 1, xi.regime.type.FIELDS)
    end
end

return entity
