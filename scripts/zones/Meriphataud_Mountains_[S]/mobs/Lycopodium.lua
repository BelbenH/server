-----------------------------------
-- Area: Meriphataud Mountains [S]
--  Mob: Lycopodium
-----------------------------------
mixins = { require('scripts/mixins/families/lycopodium') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player)
end

return entity
