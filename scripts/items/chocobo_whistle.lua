-----------------------------------
-- ID: 15533
-- Item: Chocobo Whistle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if not target:canUseMisc(xi.zoneMisc.MOUNT) then
        return xi.msg.basic.CANT_BE_USED_IN_AREA
    elseif
        not target:hasKeyItem(xi.ki.CHOCOBO_LICENSE) or
        target:hasEnmity() or
        target:getCharVar('[XISP]chocoboSpawned') == 1
    then
        return xi.msg.basic.ITEM_UNABLE_TO_USE -- Todo: Verify/correct message, order of message priority.
    end

    return 0
end

itemObject.onItemUse = function(target)
    xi.xispchocobo.spawnChocobo(target)
end

return itemObject
