-----------------------------------
-- Area: North Gustaberg
--  Mob: Huge Hornet
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
    mob:setMod(xi.mod.EXP_LVL_MOD, -2)
end

return entity
