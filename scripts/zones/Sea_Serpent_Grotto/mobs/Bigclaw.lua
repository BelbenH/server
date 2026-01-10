-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Bigclaw
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 807, 2, xi.regime.type.GROUNDS)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
