-----------------------------------
-- Ability: Hide
-- User becomes invisible.
-- Obtained: Thief Level 45
-- Recast Time: 5:00
-- Duration: Random
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Run the default Hide logic
    local result = xi.job_utils.thief.useHide(player, target, ability)

    -- Optional: only shed hate if Hide actually succeeded
    -- (adjust this condition if your useHide returns something different)
    -- if result == 0 then

    -- Get whatever you’re currently targeting (likely the mob you have hate on)
    local mob = player:getTarget()
    if mob ~= nil and mob:isMob() then
        -- Tell THAT mob to forget its enmity for this player
        mob:resetEnmity(player)
    end

    -- end

    return result
end

return abilityObject
