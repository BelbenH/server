xi = xi or {}
xi.augment = xi.augment or {}

local menu1     = {}
local dialogue1 = {}
local menu2     = {}
local dialogue2 = {}
local menu3     = {}
local dialogue3 = {}
local menu4     = {}
local dialogue4 = {}

menu1 =
{
    title = 'Attach this enchantment?',
    options = {},
}

dialogue1 =
{
    {
        "Let's do it!",
        function(playerArg)
            local ID = zones[playerArg:getZoneID()]
            playerArg:printToPlayer("Hold onto your hats...", xi.msg.channel.SAY, "Wiseman")

            playerArg:independentAnimation(playerArg, 248, 4)

            playerArg:timer(3000, function(playerArg1)
                local item         = playerArg1:getCharVar('[XISP]storedAugment')
                local itemToDelete = playerArg1:getCharVar('[XISP]itemToDelete')
                local aug1ID       = playerArg1:getCharVar('[XISP]' .. item .. 'aug1ID')
                local aug1pow      = playerArg1:getCharVar('[XISP]' .. item .. 'aug1pow')
                local aug2ID       = playerArg1:getCharVar('[XISP]' .. item .. 'aug2ID')
                local aug2pow      = playerArg1:getCharVar('[XISP]' .. item .. 'aug2pow')
                local aug3ID       = playerArg1:getCharVar('[XISP]' .. item .. 'aug3ID')
                local aug3pow      = playerArg1:getCharVar('[XISP]' .. item .. 'aug3pow')

                playerArg1:messageSpecial(ID.text.ITEM_OBTAINED, item)
                playerArg1:addItem(item, 1, aug1ID, aug1pow, aug2ID, aug2pow, aug3ID, aug3pow)
                playerArg1:setCharVar('[XISP]storedAugment', 0)
                xi.xisp.setExData(GetItemByID(itemToDelete), 0) -- Reset the stored data
                playerArg1:delItem(itemToDelete, 1)
            end)
        end,
    },
    {
        'On second thought...',
        function(playerArg)
            return
        end,
    },
}

menu2 =
{
    title = 'Take your equipment back?',
    options = {},
}

dialogue2 =
{
    {
        "Yes, please.",
        function(playerArg)
            local ID = zones[playerArg:getZoneID()]
            playerArg:printToPlayer("Very well. Here you are.", xi.msg.channel.SAY, "Wiseman")

            local item         = playerArg:getCharVar('[XISP]storedAugment')
            local itemToDelete = playerArg:getCharVar('[XISP]itemToDelete')
            local aug1ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug1ID')
            local aug1pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug1pow')
            local aug2ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug2ID')
            local aug2pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug2pow')
            local aug3ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug3ID')
            local aug3pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug3pow')

            playerArg:messageSpecial(ID.text.ITEM_OBTAINED, item)
            playerArg:addItem(item, 1, aug1ID, aug1pow, aug2ID, aug2pow, aug3ID, aug3pow)
            playerArg:setCharVar('[XISP]storedAugment', 0)
        end,
    },
    {
        'Not now.',
        function(playerArg)
            return
        end,
    },
}

menu3 =
{
    title = "What's the plan?",
    options = {},
}

dialogue3 =
{
    {
        "Reset Equipment",
        function(playerArg)
            menu4.options = dialogue4
            xi.xisp.sendMenu(playerArg, menu4)
        end,
    },
    {
        'Give me back my equipment.',
        function(playerArg)
            menu2.options = dialogue2
            xi.xisp.sendMenu(playerArg, menu2)
        end,
    },
    {
        "Nothing.",
        function(playerArg)
            return
        end,
    },
}

menu4 =
{
    title = 'Are you positive?!',
    options = {},
}

dialogue4 =
{
    {
        "Yes, do it.",
        function(playerArg)
            local item = playerArg:getCharVar('[XISP]storedAugment')
            local ID   = zones[playerArg:getZoneID()]

            playerArg:printToPlayer("Very well. Here you are.", xi.msg.channel.NS_SAY, "")

            playerArg:setCharVar('[XISP]storedAugment', 0)
            playerArg:setCharVar('[XISP]itemToDelete', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug1ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug1pow', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug2ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug2pow', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug3ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug3pow', 0)

            playerArg:messageSpecial(ID.text.ITEM_OBTAINED, item)
            playerArg:addItem(item, 1)
            playerArg:setCharVar('[XISP]storedAugment', 0)
        end,
    },
    {
        'Wait!',
        function(playerArg)
            return
        end,
    },
}

xi.augment.onAugmentTrade = function(player, npc, trade)
    local augmentItem = player:getCharVar('[XISP]storedAugment')
    local item   = GetItemByID(trade:getItemId())

    if item == nil or trade:getItemCount() > 1 then
        return
    end

    local itemID = item:getID()
    local data  = 0
    local flag  = 0
    local tier  = 0
    local augID = 0
    local name  = ""
    local power = 0

    -- Trading Equipment
    if item:isType(xi.itemType.WEAPON) or item:isType(xi.itemType.ARMOR) then
        if augmentItem == 0 then
            player:setCharVar('[XISP]storedAugment', itemID)
            player:printToPlayer("Wonderful! I will keep this safe. Now, got any enchantment items by chance?", 0, npc:getPacketName())
            player:tradeComplete()
            return
        else
            player:printToPlayer("You've already given me a piece of equipment.", 0, npc:getPacketName())
            return
        end
    end

    -- Check for augment item and determine tier
    for groupID, group in ipairs(xi.augment.augmentItems) do
        for i, id in ipairs(group) do
            if id == itemID then
                tier = groupID
                flag = 1
                break
            end
        end
    end

    print(augmentItem)

    -- Augment Item
    if flag == 1 then
        local table = xi.augment.augmentTable[tier][itemID]
        data        = xi.xisp.getExData(item)

        -- Dump if we're trying to upgrade armor with weapon enchantment, or vice versa
        if augmentItem > 0 then
            if
                augmentItem >= 16512 and augmentItem <= 22154 and
                (itemID ~= 3333 and itemID ~= 3334 and itemID ~= 3337)
            then
                player:printToPlayer("Weapons require a specific type of item. Come back when you've found one.", 0, npc:getPacketName())
                return
            elseif
                (augmentItem < 16512 or augmentItem > 22154) and
                (itemID == 3333 or itemID == 3334 or itemID == 3337)
            then
                player:printToPlayer("This item only works on weapons, unfortunately.", 0, npc:getPacketName())
                return
            end
        end

        if data == 0 then -- It was never initialized. Let's do it now
            local newVal = math.random(1, #table)
            augID   = table[newVal].augmentID
            name    = table[newVal].name
            power   = table[newVal].value
            xi.xisp.setExData(item, augID)
            data = xi.xisp.getExData(item)

        else -- Otherwise let's pull up the information
            for _, augment in pairs(table) do
                if augment.augmentID == data then
                    augID = augment.augmentID
                    power = augment.value
                    name  = augment.name
                end
            end
        end

        player:setCharVar('[XISP]itemToDelete', item:getID())
        player:printToPlayer('Looks like you found yourself an enchanting item!', 0, npc:getPacketName())
        player:printToPlayer("Hmmm... If I'm not mistaken, it appears to contain: " .. name, 0, npc:getPacketName())
    end

    -- Now proceed to ask if player wants to add it to the stored item
    if flag == 1 and augmentItem > 0 then
        local aug1ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug1ID')
        local aug2ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug2ID')
        local aug3ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug3ID')
        local max     = 1

        if tier == 3 then
            max = 2
        end

        if -- Check for full pieces
            (max == 1 and aug1ID ~= 0) or
            (max == 2 and aug2ID ~= 0)
        then
            player:printToPlayer("I do apologize. It appears that this enchantment isn't strong enough to add to your equipment.", 0, npc:getPacketName())
            player:printToPlayer("Or perhaps you've enchanted a similar piece?.", 0, npc:getPacketName())
            return
        elseif aug3ID ~= 0 then
            player:printToPlayer("This piece of equipment is fully upgraded and cannot take any more enchantments.", 0, npc:getPacketName())
            return
        end

        -- Determine which slot to attach to
        if aug1ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug1ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug1pow', power)
        elseif aug2ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug2ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug2pow', power)
        elseif aug3ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug3ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug3pow', power)
        end

        player:printToPlayer('Would you like to attach this to the item you gave me earlier?', 0, npc:getPacketName())
        menu1.options = dialogue1
        xi.xisp.sendMenu(player, menu1)
    end
end

xi.augment.onAugmentTrigger = function(player, npc)
    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    local item = player:getCharVar('[XISP]storedAugment')

    if item ~= 0 then
        local itemName = GetItemByID(item):getName()
        itemName = itemName:gsub("%_", " ")
        itemName = string.gsub(" " .. itemName, "%W%l", string.upper):sub(2)

        player:printToPlayer("Hello adventurer. Is this about your " .. itemName .. "?", 0, npc:getPacketName())
        menu3.options = dialogue3
        xi.xisp.sendMenu(player, menu3)
    else
        if npc:getLocalVar('introduction') == 1 then
            player:printToPlayer("Ah, if it isn't my favorite meddler of metal and magic! What'll it be today? Need something enchanted, hmmm?", 0, npc:getPacketName())
        else
            npc:setLocalVar('dialogueLock', 1)
            player:printToPlayer("Ho ho! Well now, what's this? A fresh face with a good head on their shoulders! Welcome, welcome!", 0, npc:getPacketName())
            player:printToPlayer("The name's Orin, but people know me as the Wiseman. Spent my younger days enchanting blades for the Royal Knights.", 0, npc:getPacketName())
            player:timer(8000, function(playerArg)
                playerArg:printToPlayer("These days, I keep it simple. Helping adventurers like yourself bring a bit of magic into their gear", 0, npc:getPacketName())
                playerArg:printToPlayer("Enchantments, augments, and the occasional curious trinket. If it glows, I know how to make it glow brighter!", 0, npc:getPacketName())
                npc:setLocalVar('dialogueLock', 0)
                npc:setLocalVar('introduction', 1)
            end)
        end
    end
end

xi.augment.spawnWiseman = function(zone, pos)
    local wiseman = zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = 'Wiseman',
        look      = 2430,
        x         = pos.x,
        y         = pos.y,
        z         = pos.z,
        rotation  = pos.rot,
        widescan  = 1,

        onTrade = function(player, npc, trade)
            xi.augment.onAugmentTrade(player, npc, trade)
        end,

        onTrigger = function(player, npc)
            xi.augment.onAugmentTrigger(player, npc)
        end,
    })

    wiseman:setStatus(xi.status.NORMAL)
end
