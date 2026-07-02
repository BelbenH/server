xi = xi or {}
xi.xisp = xi.xisp or {}

xi.xisp.getItemFromTrade = function(trade)
    local item = nil

    for slotID = 0, 7 do
        if trade:getItem(slotID) then
            item = trade:getItem(slotID)
            break
        end
    end

    return item
end

-- Augmenting an item
xi.xisp.createExData = function(val)
    local exData = {}
    if val ~= nil then
        exData[0    ] = bit.band(val, 0x00FF)
        exData[0 + 1] = bit.rshift(bit.band(val, 0xFF00), 8)
    end

    return exData
end

xi.xisp.getExData = function(item)
    local data = item:getExDataRaw()
    return (bit.lshift(data[0 + 1], 8) + data[0]) or 0
end

xi.xisp.setExData = function(item, val)
    if item ~= nil then
        local newData = xi.xisp.createExData(val)

        if newData then
            item:setExDataRaw(newData)
        end
    end
end

-- Custom GM Menus
xi.xisp.sendMenu = function(player, menuID)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuID)
    end)
end

xi.xisp.onZone = function(player)
    player:timer(4000, function(playerArg)
        -- Spawn if chick / teen by default
        if playerArg:getCharVar('[XISP]chocoGrow') <= 19 then
            xi.xispchocobo.spawnChocobo(playerArg)
        else
            xi.xispchocobo.despawnChocobo(playerArg)
        end

        -- Pals
        xi.xispal.onZone(player)
    end)
end

-- Get random point around a location
xi.xisp.getPointAroundLoc = function(pos, min, max)
    local random = math.random(1, 4)
    local posX
    local posZ

    if random == 1 then
        posX = pos.x + math.random(min, max)
        posZ = pos.z + math.random(min, max)
    elseif random == 2 then
        posX = pos.x + math.random(min, max)
        posZ = pos.z - math.random(min, max)
    elseif random == 3 then
        posX = pos.x - math.random(min, max)
        posZ = pos.z + math.random(min, max)
    else
        posX = pos.x - math.random(min, max)
        posZ = pos.z - math.random(min, max)
    end

    return posX, posZ
end

xi.xisp.trackGM = function(player, commandName)
    print('GM COMMAND:' .. player:getName() .. ' used command: ' .. commandName)
end

xi.xisp.playerSeed = function(player_seed)
    local available = {}
    local max = 0

    -- Initialize available numbers from 1 to max
    local function initializeAvailable(new_max)
        available = {}  -- Reset available list each time we need it
        max = new_max
        for i = 1, max do
            table.insert(available, i)
        end
    end

    -- Step 2: Random function that returns values from the available list
    local function random(new_max)
        -- If max is different from the table size, reinitialize the available list
        if max ~= new_max then
            initializeAvailable(new_max)
        end

        if #available == 0 then
            return nil
        end

        -- Advance the seed
        player_seed = (1103515245 * player_seed + 12345) % 2^31
        local r = player_seed / 2^31

        -- Pick a random index from available
        local idx = math.floor(r * #available) + 1
        local number = available[idx]

        -- Remove the chosen number to prevent duplicates
        table.remove(available, idx)

        return number
    end

    return random
end
