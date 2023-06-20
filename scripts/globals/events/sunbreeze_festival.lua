------------------------------------
-- Starlight Celebration
------------------------------------
require("scripts/globals/settings")
------------------------------------
xi = xi or {}
xi.events = xi.events or {}
xi.events.sunbreeze_festival = xi.events.sunbreeze_festival or {}

local event = SeasonalEvent:new("SunbreezeFestival")

xi.events.sunbreeze_festival.enabledCheck = function()
    local month = tonumber(os.date("%m"))
    return month == 6 -- 8
end

event:setEnableCheck(xi.events.sunbreeze_festival.enabledCheck)

local sunbreezeEntites =
{
    -- Goldfish NPCs
    17789025, -- Mei (Rabao)
    17187570, -- Saradorial (West Ronfaure)
    17216210, -- Fish Eyes (North Gustaberg)
    17253106, -- Kesha Shopehllok (East Sarutabaruta)

    -- Bastok Markets
    17740105, -- Fountain
    17740106, -- Deco Tree
    17740107, -- Deco Tree
    17740108, -- Deco Tree
    17740109, -- Deco Tree
    17740110, -- Deco Tree
}

local sunbreezeFireworks =
{
    [xi.zone.WEST_RONFAURE]         = { 17187546, 17187569 },
    [xi.zone.EAST_RONFAURE]         = { 17191555 },
    [xi.zone.NORTH_GUSTABERG]       = { 17212131 },
    [xi.zone.SOUTH_GUSTABERG]       = { 17216209 },
    [xi.zone.EASTERN_ALTEPA_DESERT] = { 17244668 },
    [xi.zone.WESTERN_ALTEPA_DESERT] = { 17289818 },
    [xi.zone.WEST_SARUTABARUTA]     = { 17248881 },
    [xi.zone.EAST_SARUTABARUTA]     = { 17253105 },
    [xi.zone.SOUTHERN_SAN_DORIA]    = { 17719783 },
    [xi.zone.PORT_SAN_DORIA]        = { 17727646 },
    [xi.zone.NORTHERN_SAN_DORIA]    = { 17723780 },
    [xi.zone.BASTOK_MINES]          = { 17735938 },
    [xi.zone.BASTOK_MARKETS]        = { 17740146, 17740091 },
    [xi.zone.PORT_BASTOK]           = { 17744126 },
    [xi.zone.WINDURST_WATERS]       = { 17752515 },
    [xi.zone.WINDURST_WALLS]        = { 17756373 },
    [xi.zone.PORT_WINDURST]         = { 17760486 },
    [xi.zone.WINDURST_WOODS]        = { 17764738 },
    [xi.zone.RABAO]                 = { 17788993 },
}

local sunbreezeMusicZones =
{
    -- Cities
    xi.zone.SOUTHERN_SAN_DORIA,
    xi.zone.PORT_SAN_DORIA,
    xi.zone.NORTHERN_SAN_DORIA,
    xi.zone.WINDURST_WOODS,
    xi.zone.WINDURST_WATERS,
    xi.zone.WINDURST_WALLS,
    xi.zone.PORT_WINDURST,
    xi.zone.BASTOK_MARKETS,
    xi.zone.BASTOK_MINES,
    xi.zone.PORT_BASTOK,
    xi.zone.RABAO,
    xi.zone.WEST_RONFAURE,
    xi.zone.EAST_RONFAURE,
    xi.zone.NORTH_GUSTABERG,
    xi.zone.SOUTH_GUSTABERG,
    xi.zone.EAST_SARUTABARUTA,
    xi.zone.WEST_SARUTABARUTA,
}

local originalMusic =
{
    [xi.zone.SOUTHERN_SAN_DORIA] = 107,
    [xi.zone.PORT_SAN_DORIA]     = 107,
    [xi.zone.NORTHERN_SAN_DORIA] = 107,
    [xi.zone.WINDURST_WOODS]     = 151,
    [xi.zone.WINDURST_WATERS]    = 151,
    [xi.zone.WINDURST_WALLS]     = 151,
    [xi.zone.PORT_WINDURST]      = 151,
    [xi.zone.BASTOK_MARKETS]     = 152,
    [xi.zone.BASTOK_MINES]       = 152,
    [xi.zone.PORT_BASTOK]        = 152,
    [xi.zone.RABAO]              = 208,
    [xi.zone.WEST_RONFAURE]      = 109,
    [xi.zone.EAST_RONFAURE]      = 109,
    [xi.zone.NORTH_GUSTABERG]    = 116,
    [xi.zone.SOUTH_GUSTABERG]    = 116,
    [xi.zone.EAST_SARUTABARUTA]  = 113,
    [xi.zone.WEST_SARUTABARUTA]  = 113,
}


local goldfishRewardTable =
{
    [5]  =
    {
        { item = xi.items.SUPER_SCOOP, amount = 1 },
    },

    [15] =
    {
        -- assorted fireworks
    },

    [25] =
    {
        { item = xi.items.SUMMER_FAN, xi.items.FESTIVE_FAN, amount = 1 },
    },

    [30] =
    {
        { item = xi.items.RED_DROP,    amount = 1 },
        { item = xi.items.CLEAR_DROP,  amount = 1 },
        { item = xi.items.GREEN_DROP,  amount = 1 },
        { item = xi.items.YELLOW_DROP, amount = 1 },
        { item = xi.items.PURPLE_DROP, amount = 1 },
        { item = xi.items.BLUE_DROP,   amount = 1 },
        { item = xi.items.WHITE_DROP,  amount = 1 },
        { item = xi.items.BLACK_DROP,  amount = 1 },
    },

    [50] =
    {
        { item = xi.items.SPIRIT_MASQUE, amount = 12 },
    },

    [60] =
    {
        { item = xi.items.PUNY_PLANET_KIT, amount = 1 },
    },

    [65] =
    {
        { item = xi.items.GOLDFISH_SET, amount = 1 },
    },

    [70] =
    {
        { item = xi.items.WHITE_BUTTERFLY, amount = 5 },
        { item = xi.items.BELL_CRICKET,    amount = 5 },
        { item = xi.items.GLOWFLY,         amount = 5 },
    },
}

local goldfishVendorStock =
{
    xi.items.SUPER_SCOOP, 100,
}

local moogleVendorStock2005 =
{
    xi.items.HUME_GILET,
    xi.items.HUME_TOP_P1,
    xi.items.HUME_TRUNKS,
    xi.items.HUME_TRUNKS_P1,

    xi.items.HUME_TOP,
    xi.items.HUME_TOP_P1,
    xi.items.HUME_SHORTS,
    xi.items.HUME_SHORTS_P1,

    xi.items.ELVAAN_GILET,
    xi.items.ELVAAN_TOP_P1,
    xi.items.ELVAAN_TRUNKS,
    xi.items.ELVAAN_TRUNKS_P1,

    xi.items.ELVAAN_TOP,
    xi.items.ELVAAN_TOP_P1,
    xi.items.ELVAAN_SHORTS,
    xi.items.ELVAAN_SHORTS_P1,

    xi.items.TARUTARU_MAILLOT,
    xi.items.TARUTARU_TOP_P1,
    xi.items.TARUTARU_TRUNKS,
    xi.items.TARUTARU_TRUNKS_P1,

    xi.items.TARUTARU_TOP,
    xi.items.TARUTARU_TOP_P1,
    xi.items.TARUTARU_SHORTS,
    xi.items.TARUTARU_SHORTS_P1,

    xi.items.MITHRA_TOP,
    xi.items.MITHRA_TOP_P1,
    xi.items.MITHRA_SHORTS,
    xi.items.MITHRA_SHORTS_P1,

    xi.items.GALKA_GILET,
    xi.items.GALKA_TOP_P1,
    xi.items.GALKA_TRUNKS,
    xi.items.GALKA_TRUNKS_P1,
}

local fishValue =
{
    [xi.items.TINY_GOLDFISH]    = 1,
    [xi.items.BLACK_BUBBLE_EYE] = 2,
    [xi.items.LIONHEAD]         = 10,
    [xi.items.PEARLSCALE]       = 30,
    [xi.items.CALICO_COMET]     = 30,
}

xi.events.sunbreeze_festival.goldfishVendorOnTrade = function(player, npc, trade, csid)
    local hasBasket = 0
    local points    = 0
    local itemQty
    local itemID

    -- This bool must be passed into the event call as an integer
    if player:hasItem(xi.items.GOLDFISH_BASKET) then
        hasBasket = 1
    end

    -- Manually handles the trade in order to calculate the points rewarded
    for i = 0, trade:getSlotCount()-1 do
        itemID  = trade:getItemId(i)
        itemQty = trade:getItemQty(itemID)

        if fishValue[itemID] == nil then
            break
        else
            trade:confirmItem(itemID, itemQty)
            points = points + fishValue[itemID] * itemQty
        end
    end

    if points > 0 then
        player:setCharVar("[SUNBREEZE]goldfishPoints", player:getCharVar("[SUNBREEZE]goldfishPoints") + points)
        player:startEvent(csid + 1, points, hasBasket, 4)
    end
end

xi.events.sunbreeze_festival.goldfishVendorOnTrigger = function(player, npc, csid)
    local hasBasket = 0

    -- This bool must be passed into the event call as an integer
    if player:hasItem(xi.items.GOLDFISH_BASKET) then
        hasBasket = 1
    end

    local points    = player:getCharVar("[SUNBREEZE]goldfishPoints")
    npc:setLocalVar("event", csid)

    player:startEvent(csid, hasBasket, points, 0, 0, 0, 0, 101, 0)

end

xi.events.sunbreeze_festival.goldfishVendorOnEventUpdate = function(player, csid, option)
    local hasBasket = 0
    local kesha     = 55
    local fish      = 903
    local sara      = 139
    local mei       = 115

    -- This bool must be passed into the event call as an integer
    if player:hasItem(xi.items.GOLDFISH_BASKET) then
        hasBasket = 1
    end

    if
        csid == kesha or
        csid == fish or
        csid == sara or
        csid == mei
    then
        if option == 10 then
            player:updateEvent(247, hasBasket, xi.items.GOLDFISH_BASKET)

        elseif option == 13 then
            player:updateEvent(247, hasBasket, xi.items.GOLDFISH_BASKET)
        end
    end
end

xi.events.sunbreeze_festival.goldfishVendorOnTEventFinish = function(player, csid, option)
    print(option)
    -- Open Shop
    if option == 1 then
        xi.shop.general(player, goldfishVendorStock)

    -- Player's getting a new basket
    elseif
        option == 2 or
        option == 4
    then
        if not player:hasItem(xi.items.GOLDFISH_BASKET) then
            npcUtil.giveItem(player, xi.items.GOLDFISH_BASKET)
        end
        player:setCharVar("[SUNBREEZE]goldfishPoints", 0)

    -- Reward Points
    elseif option == 3 then
        player:messageSpecial(zones[player:getZoneID()].text.POINT_UPDATE, player:getCharVar("[SUNBREEZE]goldfishPoints"))
        player:confirmTrade()

    -- Reward Item
    elseif option == 16 then
        -- Delete points player used to purchase
        -- Reward item they chose
    end
end

xi.events.sunbreeze_festival.moogleVendorOnTrigger = function(player, npc)
    -- Show text
    xi.shop.general(player, moogleVendorStock2005)
end

xi.events.sunbreeze_festival.setMusic = function(flag)
    local sunbreezeMusic = 227
    -- If true, set sunbreeze music
    if flag then
        for _, zoneId in pairs(sunbreezeMusicZones) do
            local zone = GetZone(zoneId)
            if zone then
                zone:setBackgroundMusicNight(sunbreezeMusic)

                for _, player in pairs(zone:getPlayers()) do
                    player:changeMusic(1, sunbreezeMusic)
                end
            end
        end

    -- Reset music to original tracks
    else
        for _, zoneId in pairs(sunbreezeMusicZones) do
            local zone = GetZone(zoneId)

            if zone then
                zone:setBackgroundMusicNight(originalMusic[zoneId])

                for _, player in pairs(zone:getPlayers()) do
                    player:changeMusic(1, originalMusic[zoneId])
                end
            end
        end
    end
end

xi.events.sunbreeze_festival.onZoneTick = function(zone, npc)
    if
        zone:getLocalVar("[SUNBREEZE]goldfishDialogueTimer") < os.time() and
        xi.settings.main.SUNBREEZE == 1
    then
        -- npc:showText(npc, zones[zone:getID()].text.GOLDFISH_NPC_DIALOGUE + math.random(0, 2))
        zone:setLocalVar("[SUNBREEZE]goldfishDialogueTimer", os.time() + 20)
    end
end

xi.events.sunbreeze_festival.spawnFireworks = function(zone)
    if xi.settings.main.SUNBREEZE == 1 then
        for _, firework in pairs(sunbreezeFireworks[zone:getID()]) do
            local fireworkNPC = GetNPCByID(firework)
            local hour = VanadielHour()

            if hour <= 6 or hour >= 18 then
                fireworkNPC:setStatus(xi.status.NORMAL)
            else
                fireworkNPC:setStatus(xi.status.INVISIBLE)
            end
        end
    end
end

xi.events.sunbreeze_festival.showEntities = function(enabled)
    for _, entityID in pairs(sunbreezeEntites) do
        local entity = GetNPCByID(entityID)

        if entity then
            if enabled then
                entity:setStatus(xi.status.NORMAL)
            else
                entity:setStatus(xi.status.INVISIBLE)
            end
        end
    end
end

event:setStartFunction(function()
    xi.events.sunbreeze_festival.setMusic(true)
    xi.events.sunbreeze_festival.showEntities(true)
end)

event:setEndFunction(function()
    xi.events.sunbreeze_festival.setMusic(false)
    xi.events.sunbreeze_festival.showEntities(false)
end)

return event
