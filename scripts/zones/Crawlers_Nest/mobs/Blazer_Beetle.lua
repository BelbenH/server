-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Blazer Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 688, 2, xi.regime.type.GROUNDS)
end

return entity
