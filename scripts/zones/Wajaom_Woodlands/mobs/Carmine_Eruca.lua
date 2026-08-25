-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Carmine Eruca
-----------------------------------
mixins =
{
    require('scripts/mixins/families/eruca'),
    require('scripts/mixins/sleep_at_night'),
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.alphamob.spawnAlpha(mob, player, optParams)
end

return entity
