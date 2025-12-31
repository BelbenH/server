-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Wurdalak
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:setCharVar('[XISP]rareMob1', 1) -- Phalanx (Custom rare mob hunting quest)
end

return entity
