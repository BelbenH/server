-----------------------------------
-- Area: Batok Markets
--  NPC: Mjoll
-- !pos -318.902 -10.319 -178.087 235
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        { xi.item.SHORTBOW,                       45, 3, },
        { xi.item.SELF_BOW,                      557, 3, },
        { xi.item.WRAPPED_BOW,                  8236, 3, },
        { xi.item.LONGBOW,                       511, 3, },
        { xi.item.GREAT_BOW,                   22684, 3, },
        { xi.item.LIGHT_CROSSBOW,                187, 3, },
        { xi.item.CROSSBOW,                     2472, 3, },
        { xi.item.ZAMBURAK,                    16005, 3, },
        { xi.item.WOODEN_ARROW,                    3, 3, }, --orginally 4g
        { xi.item.BONE_ARROW,                      5, 3, }, --added
        { xi.item.IRON_ARROW,                      8, 3, },
        { xi.item.FANG_ARROW,                     16, 3, }, --added
        { xi.item.BEETLE_ARROW,                   14, 3, }, --added
        { xi.item.SILVER_ARROW,                   16, 3, }, 
        { xi.item.HORN_ARROW,                     26, 3, }, --added
        { xi.item.SLEEP_ARROW,                    41, 3, }, --added
        { xi.item.SCORPION_ARROW,                 30, 3, }, --added
        { xi.item.FIRE_ARROW,                     50, 3, }, --orginally 145g
        { xi.item.PLATINUM_ARROW,                 69, 3, }, --added
        { xi.item.DEMON_ARROW,                    56, 3, }, --added
        { xi.item.CROSSBOW_BOLT,                   6, 3, }, 
        { xi.item.BLIND_BOLT,                     23, 3, }, --added
        { xi.item.ACID_BOLT,                      26, 3, }, --added
        { xi.item.SLEEP_BOLT,                     29, 3, }, --added
        { xi.item.BLOODY_BOLT,                    32, 3, }, --added
        { xi.item.VENOM_BOLT,                     35, 3, }, --added
        { xi.item.HOLY_BOLT,                      38, 3, }, --added
        { xi.item.MYTHRIL_BOLT,                   25, 3, }, --added
        { xi.item.BOOMERANG,                    1820, 3, },
        { xi.item.TATHLUM,                        90, 3, }, --added
        { xi.item.SCROLL_OF_BATTLEFIELD_ELEGY,  4992, 3, },
    }

    player:showText(npc, zones[xi.zone.BASTOK_MARKETS].text.MJOLL_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
