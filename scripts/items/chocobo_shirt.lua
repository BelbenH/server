-----------------------------------
-- ID: 10293
-- Chocobo Shirt
-- Dispense: Crystals
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    -- Crystal Item IDs:
    -- 4096 Fire
    -- 4097 Ice
    -- 4098 Wind
    -- 4099 Earth
    -- 4100 Thunder
    -- 4101 Water
    -- 4102 Light
    -- 4103 Dark (Changed starting check value to 4103 to do clusters instead of crystals.)
    local itemID = 4103 + VanadielDayElement()
    npcUtil.giveItem(target, { { itemID, math.random(1, 3) } })
end

return itemObject
