-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Tiny Mandragora
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.CANNOT_GUARD, 1)
    mob:setMobMod(xi.mobMod.NO_H2H_PENALTY, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.ATT, 1)
    mob:setMod(xi.mod.EXP_LVL_MOD, -2) -- Subtract 2 levels for /check and exp purposes
end

entity.onMobDeath = function(mob, player, optParams)
	mob:setRespawnTime(30) -- Set respawn time in seconds
    xi.regime.checkRegime(player, mob, 26, 1, xi.regime.type.FIELDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity