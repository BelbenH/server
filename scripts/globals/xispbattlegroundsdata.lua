xi = xi or {}
xi.battlegrounds = xi.battlegrounds or {}

xi.battlegrounds.lootTables =
{
    [15] = -- Level 15
    {
        AUGMENT =
        {
            { CHANCE = 60, ITEMS = { xi.augment.augmentItems[1][1], xi.augment.augmentItems[1][2], xi.augment.augmentItems[1][3] }, }, -- Level 1 Enchantments
        },
        EQUIPMENT =
        {
            { CHANCE = 7, ITEMS = { 14563, 14559, 14547, 14551, 14555 }, }, -- Body Armor (Lvl 15)
            { CHANCE = 7, ITEMS = { 14978, 14974, 14962, 14966, 14970 }, }, -- Hand Armor (Lvl 15)
            { CHANCE = 7, ITEMS = { 15642, 15638, 15626, 15630, 15634 }, }, -- Leg Armor (Lvl 15)
            { CHANCE = 7, ITEMS = { 15728, 15724, 15712, 15716, 15720 }, }, -- Feet Armor (Lvl 15)
            { CHANCE = 7, ITEMS = { 16101, 16097, 16085, 16089, 16093 }, }, -- Head Armor (Lvl 15)
        },
    },

    [25] = -- Level 25
    {
        { CHANCE = 75, { xi.augment.augmentItems[1][1], xi.augment.augmentItems[1][2], xi.augment.augmentItems[1][3] }, }, -- Level 1 Enchantments
        { CHANCE = 10, { 14564, 14560, 14548, 14552, 14556 }, }, -- Body Armor (Lvl 25)
        { CHANCE = 15, { 14979, 14975, 14963, 14967, 14971 }, }, -- Hand Armor (Lvl 25)
        { CHANCE = 15, { 15643, 15639, 15627, 15631, 15635 }, }, -- Leg Armor (Lvl 25)
        { CHANCE = 15, { 15729, 15725, 15713, 15717, 15721 }, }, -- Feet Armor (Lvl 25)
        { CHANCE = 15, { 16102, 16098, 16086, 16090, 16094 }, }, -- Head Armor (Lvl 25)
        { CHANCE = 25, { 5258 }, }, -- Revive Feather
        { CHANCE = 10, { 5259 }, }, -- Rebirth Feather
    },

    [35] = -- Level 35
    {
        { CHANCE = 75, { xi.augment.augmentItems[1][1], xi.augment.augmentItems[1][2], xi.augment.augmentItems[1][3] }, }, -- Level 1 Enchantments
        { CHANCE = 10, { 14565, 14561, 14549, 14553, 14557 }, }, -- Body Armor (Lvl 35)
        { CHANCE = 15, { 14980, 14976, 14964, 14968, 14972 }, }, -- Hand Armor (Lvl 35)
        { CHANCE = 15, { 15644, 15640, 15628, 15632, 15636 }, }, -- Leg Armor (Lvl 35)
        { CHANCE = 15, { 15730, 15726, 15714, 15718, 15722 }, }, -- Feet Armor (Lvl 35)
        { CHANCE = 15, { 16103, 16099, 16087, 16091, 16095 }, }, -- Head Armor (Lvl 35)
        { CHANCE = 25, { 3225, 3229, 3217, 3213, 3334 }, }, -- Level 2 Enchantments
        { CHANCE = 25, { 5258 }, }, -- Revive Feather
        { CHANCE = 10, { 5259 }, }, -- Rebirth Feather
    },
}

xi.battlegrounds.models =
{
    CAMMPFIRE  = 2411,
    TORCH      = 2412,
    CRATE      = 2413,
    SM_CRATE   = 2331,
    CHEST      = 960,
    BANNER     = 2313,
}

xi.battlegrounds.zoneInfo =
{
    [xi.zone.WEST_SARUTABARUTA] =
    {
        LEVEL = 15,
        REQUIREMENTS = { LEVEL = 15, RANK = 2, },
        MOBS =
        {
            { look = 582, name = "Yagudo Seer",   groupID = 2007, spellList = 1, job = xi.job.WHM }, -- Wand
            { look = 584, name = "Yagudo Doomer", groupID = 2007, spellList = 2, job = xi.job.BLM }, -- Staff
            { look = 580, name = "Yagudo Purger", groupID = 2007, spellList = 0, job = xi.job.MNK }, -- H2H
            { look = 599, name = "Yagudo Flayer", groupID = 2007, spellList = 0, job = xi.job.WAR }, -- Great Katana
        },
        NMS =
        {
            { look = 2077, name = "Quokk the Pale", groupID = 2010, spellList = 0, job = xi.job.SAM },
            { look = 2080, name = "Bloodplume",     groupID = 2010, spellList = 0, job = xi.job.NIN },
            { look = 2082, name = "Khot the Grim",  groupID = 2010, spellList = 0, job = xi.job.MNK },
        },
        ALLIES =
        {
            { look = '0x0000AF0100000000000000000000000000000000', name = "Eight of Clubs", groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
            { look = '0x0000AF0100000000000000000000000000000000', name = "Six of Spades",  groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
            { look = '0x0000AF0100000000000000000000000000000000', name = "Two of Hearts",  groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
        },
        CAMPS =
        {
            { pos = { x = 282, y = -4,    z = 48,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 324, y = -4,    z = 44,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 170, y = -25.5, z = 240, rotation = 0, }, numMobs = 3, },
            { pos = { x = 170, y = -4.8,  z = 104, rotation = 0, }, numMobs = 3, },
            { pos = { x = 222, y = -5.0,  z = 95,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 325, y = -12.0, z = 202, rotation = 0, }, numMobs = 3, },
            { pos = { x = 265, y = -16.5, z = 210, rotation = 0, }, numMobs = 2, },
            { pos = { x = 210, y = -23.0, z = 241, rotation = 0, }, numMobs = 3, },
            { pos = { x = 70,  y = -9.0,  z = 141, rotation = 0, }, numMobs = 3, },
            { pos = { x = 76,  y = -12.0, z = 202, rotation = 0, }, numMobs = 3, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 320, y = -4, z = -10, rotation = 0, }, numGroups = 5, },
            { pos = { x = 303, y = -5, z = 4,   rotation = 0, }, numGroups = 3, },
        },
        SPECIAL_LOOT =
        {
            { CHANCE = 10, ITEMS = { 14559, 14974, 15638, 15724, 16097 }, }, -- Anu's Gear
            { CHANCE = 10, ITEMS = { 14563, 14978, 15642, 15728, 16101 }, }, -- Nemain's Gear
        },
    },

    [xi.zone.WEST_RONFAURE] =
    {
        LEVEL = 15,
        REQUIREMENTS = { LEVEL = 15, RANK = 2, },
        MOBS =
        {
            { look = 614, name = "Orcish Gorer",    groupID = 2006, spellList = 4, job = xi.job.PLD },
            { look = 621, name = "Orcish Scorcher", groupID = 2006, spellList = 2, job = xi.job.BLM },
            { look = 612, name = "Orcish Fangman",  groupID = 2006, spellList = 0, job = xi.job.DRG },
            { look = 624, name = "Orcish Belcher",  groupID = 2006, spellList = 0, job = xi.job.MNK },
        },
        NMS =
        {
            { look = 2036, name = "Zogdrek",  groupID = 2009, spellList = 0, job = xi.job.WAR },
            { look = 2040, name = "Krallgok", groupID = 2009, spellList = 0, job = xi.job.DRG },
            { look = 2049, name = "Brukkzog", groupID = 2009, spellList = 0, job = xi.job.MNK },
        },
        ALLIES =
        {
            { look = "0x01000E031A101C201A301C401A50046000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010006031C101C201C301C401C50056000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x01000C031A101C201A301C401A50056000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = -190, y = -60, z = 295, rotation = 0, }, numMobs = 3, },
            { pos = { x = -246, y = -50, z = 281, rotation = 0, }, numMobs = 2, },
            { pos = { x = -286, y = -50, z = 257, rotation = 0, }, numMobs = 3, },
            { pos = { x = -283, y = -50, z = 318, rotation = 0, }, numMobs = 3, },
            { pos = { x = -354, y = -50, z = 284, rotation = 0, }, numMobs = 3, },
            { pos = { x = -342, y = -50, z = 401, rotation = 0, }, numMobs = 2, },
            { pos = { x = -275, y = -60, z = 448, rotation = 0, }, numMobs = 3, },
            { pos = { x = -320, y = -50, z = 203, rotation = 0, }, numMobs = 3, },
            { pos = { x = -278, y = -40, z = 152, rotation = 0, }, numMobs = 2, },
            { pos = { x = -241, y = -50, z = 204, rotation = 0, }, numMobs = 3, },
            { pos = { x = -165, y = -50, z = 195, rotation = 0, }, numMobs = 3, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = -183, y = -58, z = 259, rotation = 0, }, numGroups = 3, },
            { pos = { x = -147, y = -60, z = 250, rotation = 0, }, numGroups = 2, },
        },
        SPECIAL_LOOT =
        {
            { CHANCE = 10, ITEMS = { 14547, 14962, 15626, 15712, 16085 }, }, -- Enyo's Set
            { CHANCE = 10, ITEMS = { 14551, 14966, 15630, 15716, 16089 }, }, -- Njord's Set
        },
    },

    [xi.zone.SOUTH_GUSTABERG] =
    {
        LEVEL = 15,
        REQUIREMENTS = { LEVEL = 15, RANK = 2, },
        MOBS =
        {
            { look = 646, name = "Rusted Quadav",  groupID = 2005, spellList = 4, job = xi.job.PLD },
            { look = 661, name = "Jeweled Quadav", groupID = 2005, spellList = 2, job = xi.job.BLM },
            { look = 644, name = "Tin Quadav",     groupID = 2005, spellList = 0, job = xi.job.WAR },
            { look = 647, name = "Zinc Quadav",    groupID = 2005, spellList = 5, job = xi.job.DRK },
        },
        NMS =
        {
            { look = 2154, name = "Marble Quadav",  groupID = 2008, spellList = 0, job = xi.job.WAR },
            { look = 2154, name = "Granite Quadav", groupID = 2008, spellList = 0, job = xi.job.WAR },
            { look = 2154, name = "Diorite Quadav", groupID = 2008, spellList = 0, job = xi.job.WAR },
        },
        ALLIES =
        {
            { look = "0x0100030100100520163005400550B86000700000", name = "Iron Musketeer",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x01000908021002200230024002504E601E700000", name = "Iron Musketeer",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x01000A08021002200230024002504E601E700000", name = "Iron Musketeer",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = 524, y = 0, z = -349, rotation = 0, }, numMobs = 3, },
            { pos = { x = 547, y = 2, z = -382, rotation = 0, }, numMobs = 2, },
            { pos = { x = 597, y = 0, z = -390, rotation = 0, }, numMobs = 3, },
            { pos = { x = 521, y = 0, z = -412, rotation = 0, }, numMobs = 3, },
            { pos = { x = 547, y = 2, z = -453, rotation = 0, }, numMobs = 3, },
            { pos = { x = 503, y = 2, z = -462, rotation = 0, }, numMobs = 2, },
            { pos = { x = 518, y = 0, z = -496, rotation = 0, }, numMobs = 3, },
            { pos = { x = 582, y = 0, z = -500, rotation = 0, }, numMobs = 3, },
            { pos = { x = 539, y = 0, z = -555, rotation = 0, }, numMobs = 2, },
            { pos = { x = 585, y = 1, z = -560, rotation = 0, }, numMobs = 3, },
            { pos = { x = 602, y = 0, z = -602, rotation = 0, }, numMobs = 3, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 581, y = 2, z = -328, rotation = 0, }, numGroups = 4, },
            { pos = { x = 560, y = 0, z = -330, rotation = 0, }, numGroups = 3, },
        },
        SPECIAL_LOOT =
        {
            { CHANCE = 10, ITEMS = { 14547, 14962, 15626, 15712, 16085 }, }, -- Enyo's Set
            { CHANCE = 10, ITEMS = { 14555, 14970, 15634, 15720, 16093 }, }, -- Hoshikazu's Set
        },
    },

    [xi.zone.VALKURM_DUNES] =
    {
        LEVEL = 30,
        REQUIREMENTS = { LEVEL = 30, RANK = 3, },
        MOBS =
        {
            { look = 508, name = "Goblin Hacker",  groupID = 2014, spellList = 0, job = xi.job.WAR },
            { look = 488, name = "Goblin Chanter", groupID = 2014, spellList = 2, job = xi.job.BLM },
            { look = 498, name = "Goblin Blizter", groupID = 2014, spellList = 0, job = xi.job.WAR },
            { look = 495, name = "Goblin Knight",  groupID = 2014, spellList = 5, job = xi.job.DRK },
        },
        NMS =
        {
            { look = 2216, name = "Pickflix", groupID = 2015, spellList = 2, job = xi.job.BLM },
            { look = 1087, name = "Dilnox",   groupID = 2015, spellList = 5, job = xi.job.DRK },
            { look = 685,  name = "Swagstox", groupID = 2015, spellList = 0, job = xi.job.WAR },
        },
        ALLIES =
        {
            { look = "0x01000C030F100F200F300F400F504E601E700000", name = "Selbina Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010005081410172008300A4003504E601E700000", name = "Selbina Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010006040E1007201230114008504E601E700000", name = "Selbina Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = 55,  y = 0,  z = -5,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 90,  y = 0,  z = -5,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 150, y = 0,  z = -30, rotation = 0, }, numMobs = 3, },
            { pos = { x = 180, y = 0,  z = 0,   rotation = 0, }, numMobs = 3, },
            { pos = { x = 153, y = -6, z = 40,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 115, y = -7, z = 65,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 80,  y = -8, z = 50,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 65,  y = -8, z = 100, rotation = 0, }, numMobs = 3, },
            { pos = { x = 15,  y = -7, z = 80,  rotation = 0, }, numMobs = 2, },
            { pos = { x = -10, y = -1, z = 30,  rotation = 0, }, numMobs = 3, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 50, y = 1, z = -60, rotation = 0, }, numGroups = 4, },
            { pos = { x = 75, y = 0, z = -50, rotation = 0, }, numGroups = 3, },
        },
        SPECIAL_LOOT =
        {
        },
    },

    [xi.zone.BUBURIMU_PENINSULA] =
    {
        LEVEL = 30,
        REQUIREMENTS = { LEVEL = 30, RANK = 3, },
        MOBS =
        {
            { look = 508, name = "Goblin Hacker",  groupID = 2014, spellList = 0, job = xi.job.WAR },
            { look = 488, name = "Goblin Chanter", groupID = 2014, spellList = 2, job = xi.job.BLM },
            { look = 498, name = "Goblin Blizter", groupID = 2014, spellList = 0, job = xi.job.WAR },
            { look = 495, name = "Goblin Knight",  groupID = 2014, spellList = 5, job = xi.job.DRK },
        },
        NMS =
        {
            { look = 2216, name = "Pickflix", groupID = 2015, spellList = 2, job = xi.job.BLM },
            { look = 1087, name = "Dilnox",   groupID = 2015, spellList = 5, job = xi.job.DRK },
            { look = 685,  name = "Swagstox", groupID = 2015, spellList = 0, job = xi.job.WAR },
        },
        ALLIES =
        {
            { look = "0x01000C030F100F200F300F400F504E601E700000", name = "Mhaura Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010005081410172008300A4003504E601E700000", name = "Mhaura Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010006040E1007201230114008504E601E700000", name = "Mhaura Militia",  groupID = 2008, spellList = 0, skillList = 776, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = 30,  y = -15, z = 0,    rotation = 0, }, numMobs = 3, },
            { pos = { x = 20,  y = -7,  z = -40,  rotation = 0, }, numMobs = 4, },
            { pos = { x = 60,  y = -7,  z = -38,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 62,  y = 0,   z = -77,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 120, y = 0,   z = -80,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 100, y = 0,   z = -112, rotation = 0, }, numMobs = 4, },
            { pos = { x = 85,  y = 0,   z = -150, rotation = 0, }, numMobs = 3, },
            { pos = { x = 170, y = 0,   z = -115, rotation = 0, }, numMobs = 3, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 155, y = 0, z = -150, rotation = 0, }, numGroups = 4, },
            { pos = { x = 135, y = 0, z = -155, rotation = 0, }, numGroups = 3, },
        },
        SPECIAL_LOOT =
        {
        },
    },

    [xi.zone.YUHTUNGA_JUNGLE] =
    {
        LEVEL = 40,
        REQUIREMENTS = { LEVEL = 40, RANK = 4, },
        MOBS =
        {
            { look = 1330, name = "Shore Sahagin", groupID = 2019, spellList = 6, job = xi.job.BRD },
            { look = 1318, name = "Coral Sahagin", groupID = 2019, spellList = 1, job = xi.job.WHM },
            { look = 1299, name = "Beach Sahagin", groupID = 2019, spellList = 0, job = xi.job.MNK },
            { look = 1301, name = "Shell Sahagin", groupID = 2019, spellList = 0, job = xi.job.WAR },
        },
        NMS =
        {
            { look = 1310, name = "Fuluve",   groupID = 2021, spellList = 0, job = xi.job.WAR },
            { look = 1311, name = "Semi Ika", groupID = 2021, spellList = 0, job = xi.job.WAR },
            { look = 1312, name = "Nun Inoa", groupID = 2021, spellList = 0, job = xi.job.WAR },
        },
        ALLIES =
        {
            { look = "0x01000C031A102A200D3004400D50916000700000", name = "Norg Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
            { look = "0x010005011A102A200D3004400D50916000700000", name = "Norg Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
            { look = "0x0100030204102320093009400C50916000700000", name = "Norg Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = -292, y = 0,  z = -368, rotation = 0, }, numMobs = 4, },
            { pos = { x = -278, y = 0,  z = -395, rotation = 0, }, numMobs = 5, },
            { pos = { x = -235, y = 0,  z = -377, rotation = 0, }, numMobs = 4, },
            { pos = { x = -326, y = 17, z = -362, rotation = 0, }, numMobs = 4, },
            { pos = { x = -361, y = 17, z = -438, rotation = 0, }, numMobs = 4, },
            { pos = { x = -362, y = 17, z = -370, rotation = 0, }, numMobs = 5, },
            { pos = { x = -428, y = 17, z = -417, rotation = 0, }, numMobs = 4, },
            { pos = { x = -417, y = 17, z = -329, rotation = 0, }, numMobs = 4, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = -447, y = 16, z = -352, rotation = 0, }, numGroups = 4, },
        },
        SPECIAL_LOOT =
        {
        },
    },

    [xi.zone.WESTERN_ALTEPA_DESERT] =
    {
        LEVEL = 40,
        REQUIREMENTS = { LEVEL = 40, RANK = 4, },
        MOBS =
        {
            { look = 1254, name = "Antican Invader", groupID = 2018, spellList = 0, job = xi.job.WAR },
            { look = 1270, name = "Antican Invader", groupID = 2018, spellList = 0, job = xi.job.RNG },
            { look = 1288, name = "Antican Invader", groupID = 2018, spellList = 4, job = xi.job.PLD },
        },
        NMS =
        {
            { look = 1270, name = "Centurio IX", groupID = 2020, spellList = 0, job = xi.job.RNG },
            { look = 1298, name = "Legatus IV",  groupID = 2020, spellList = 4, job = xi.job.PLD },
        },
        ALLIES =
        {
            { look = "0x01000B0617102B20103010401050B86000700000", name = "Rabao Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
            { look = "0x01000D0800101F201F301F401F504E601E700000", name = "Rabao Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
            { look = "0x01000808021032200230164016504E601E700000", name = "Rabao Militia",  groupID = 2008, spellList = 0, skillList = 0, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = 390, y = 0, z = 220, rotation = 0, }, numMobs = 4, },
            { pos = { x = 350, y = 0, z = 200, rotation = 0, }, numMobs = 5, },
            { pos = { x = 400, y = 0, z = 180, rotation = 0, }, numMobs = 4, },
            { pos = { x = 450, y = 0, z = 190, rotation = 0, }, numMobs = 4, },
            { pos = { x = 300, y = 0, z = 105, rotation = 0, }, numMobs = 4, },
            { pos = { x = 195, y = 0, z = 155, rotation = 0, }, numMobs = 5, },
            { pos = { x = 115, y = 0, z = 130, rotation = 0, }, numMobs = 4, },
            { pos = { x = 105, y = 0, z = 180, rotation = 0, }, numMobs = 4, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 435, y = 0, z = 325, rotation = 0, }, numGroups = 3, },
            { pos = { x = 400, y = 0, z = 305, rotation = 0, }, numGroups = 2, },
        },
        SPECIAL_LOOT =
        {
        },
    },
    -- Wajaom Woodlands (60)

    -- Bhaflau Thickets (60)

    -- Caedarva mire (60)

    -- Xarcabard (75)
}
