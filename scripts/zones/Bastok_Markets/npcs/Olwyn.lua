-----------------------------------
-- Area: Bastok Markets
--  NPC: Olwyn
-- !pos -322.123 -10.319 -169.418 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.PICKAXE,             15000, 3 },
		{ xi.item.HATCHET,             15000, 3 },
		{ xi.item.SICKLE,              15000, 3 },
        { xi.item.FLASK_OF_EYE_DROPS,   1698, 3 },
        { xi.item.ANTIDOTE,              228, 3 },
        { xi.item.FLASK_OF_ECHO_DROPS,   832, 3 },
        { xi.item.POTION,                546, 3 },
        { xi.item.ETHER,                2025, 3 },
        -- 🔥 Added Ninja Tools --
        { xi.item.SHIHEI,              	 101, 3 },
        { xi.item.SAIRUI_RAN,          	 101, 3 },
		{ xi.item.KAGINAWA,          	 101, 3 },
        { xi.item.JUSATSU,          	 101, 3 },
        { xi.item.KODOKU,              	 101, 3 },
        { xi.item.SHINOBI_TABI,        	 101, 3 },
		{ xi.item.SANJAKU_TENUGUI,     	 101, 3 },
        { xi.item.INOSHISHINOFUDA,     	 501, 3 },
        { xi.item.SHIKANOFUDA,         	 501, 3 },
        { xi.item.CHONOFUDA,             501, 3 },
		-- 🔥 Added Ninja Tools --
    }

    player:showText(npc, zones[xi.zone.BASTOK_MARKETS].text.OLWYN_SHOP_DIALOG)
    xi.shop.general(player, xi.shop.phalanxShops.lowTierEssentials, xi.fameArea.BASTOK)
end

return entity
