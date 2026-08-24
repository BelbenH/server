xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.squireName =
{
    -- Hume Male
    [0] = 'Valeth',
    [1] = 'Eryndor',
    [2] = 'Serendil',
    [3] = 'Alistair',

    -- Elvaan Male
    [4] = 'Edron',
    [5] = 'Halric',
    [6] = 'Zani',
    [7] = 'Petyr',

    -- Taru Male
    [8]  = 'Totoro',
    [9]  = 'Pancha',
    [10] = 'Soruo',
    [11] = 'Gurido',

    -- Galka
    [12] = 'Korvahn',
    [13] = 'Draggarim',
    [14] = 'Werei',
    [15] = 'Belben',

    -- Elvaan Female
    [16] = 'Ariette',
    [17] = 'Ophelia',
    [18] = 'Iselienne',
    [19] = 'Odette',

    -- Hume Female
    [20] = 'Thera',
    [21] = 'Brienne',
    [22] = 'Anju',
    [23] = 'Nora',

    -- Taru Female
    [24] = 'Lulu',
    [25] = 'Pipira',
    [26] = 'Nanaka',
    [27] = 'Mimi',

    -- Mithra
    [28] = 'Sora',
    [29] = 'Mikota',
    [30] = 'Vira',
    [31] = 'Paya',
}

xi.xispal.afQuests =
{
    { xi.questLog.BASTOK,      xi.quest.id.bastok.THE_TALEKEEPERS_GIFT,      }, -- WAR
    { xi.questLog.BASTOK,      xi.quest.id.bastok.TRUE_STRENGTH,             }, -- MNK
    { xi.questLog.SANDORIA,    xi.quest.id.sandoria.PIEUJES_DECISION,        }, -- WHM
    { xi.questLog.WINDURST,    xi.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM, }, -- BLM
    { xi.questLog.SANDORIA,    xi.quest.id.sandoria.PEACE_FOR_THE_SPIRIT,    }, -- RDM
    { xi.questLog.WINDURST,    xi.quest.id.windurst.AS_THICK_AS_THIEVES,     }, -- THF
    { xi.questLog.SANDORIA,    xi.quest.id.sandoria.UNDER_OATH,              }, -- PLD
    { xi.questLog.BASTOK,      xi.quest.id.bastok.BLADE_OF_EVIL,             }, -- DRK
    { xi.questLog.JEUNO,       xi.quest.id.jeuno.A_NEW_DAWN,                 }, -- BST
    { xi.questLog.JEUNO,       xi.quest.id.jeuno.THE_CIRCLE_OF_TIME,         }, -- BRD
    { xi.questLog.WINDURST,    xi.quest.id.windurst.UNBRIDLED_PASSION,       }, -- RNG
    { xi.questLog.OUTLANDS,    xi.quest.id.outlands.A_THIEF_IN_NORG,         }, -- SAM
    { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRUE_WILL,               }, -- NIN
    { xi.questLog.SANDORIA,    xi.quest.id.sandoria.KNIGHT_STALKER,          }, -- DRG
    { xi.questLog.WINDURST,    xi.quest.id.windurst.CARBUNCLE_DEBACLE        }, -- SMN
    { xi.questLog.AHT_URHGAN,  xi.quest.id.ahtUrhgan.TRANSFORMATIONS,        }, -- BLU
    { xi.questLog.AHT_URHGAN,  xi.quest.id.ahtUrhgan.AGAINST_ALL_ODDS,       }, -- COR
    { xi.questLog.AHT_URHGAN,  xi.quest.id.ahtUrhgan.PUPPETMASTER_BLUES,     }, -- PUP
    { xi.questLog.JEUNO,       xi.quest.id.jeuno.COMEBACK_QUEEN,             }, -- DNC
    { xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.SEEING_BLOOD_RED,      }, -- SCH
}

xi.xispal.face =
{
    [0]  = '00', -- FACE1A
    [1]  = '01', -- FACE1B
    [2]  = '02', -- FACE2A
    [3]  = '03', -- FACE2B
    [4]  = '04', -- FACE3A
    [5]  = '05', -- FACE3B
    [6]  = '06', -- FACE4A
    [7]  = '07', -- FACE4B
    [8]  = '08', -- FACE5A
    [9]  = '09', -- FACE5B
    [10] = '0A', -- FACE6A
    [11] = '0B', -- FACE6B
    [12] = '0C', -- FACE7A
    [13] = '0D', -- FACE7B
    [14] = '0E', -- FACE8A
    [15] = '0F', -- FACE8B
}

xi.xispal.youngLook =
{
    [xi.race.HUME_M  ] = "0x0100001F00100020003000400050006000700000",
    [xi.race.HUME_F  ] = "0x0100011E02100520013003400350006000700000",
    [xi.race.ELVAAN_M] = "0x00009B0000000000000000000000000000000000",
    [xi.race.ELVAAN_F] = "0x0100151E00101420143014401450006000700000",
    [xi.race.TARU_M  ] = "0x0000A80000000000000000000000000000000000",
    [xi.race.TARU_F  ] = "0x0000AA0000000000000000000000000000000000",
    [xi.race.MITHRA  ] = "0x0100031D00100420003000400350036003700000",
    [xi.race.GALKA   ] = "0x0000BA0300000000000000000000000000000000",
}

xi.xispal.race =
{
    [xi.race.HUME_M  ] = "01",
    [xi.race.HUME_F  ] = "02",
    [xi.race.ELVAAN_M] = "03",
    [xi.race.ELVAAN_F] = "04",
    [xi.race.TARU_M  ] = "05",
    [xi.race.TARU_F  ] = "06",
    [xi.race.MITHRA  ] = "07",
    [xi.race.GALKA   ] = "08",
}

xi.xispal.groupID =
{
    [xi.race.HUME_M  ] = 1000,
    [xi.race.HUME_F  ] = 1000,
    [xi.race.ELVAAN_M] = 1001,
    [xi.race.ELVAAN_F] = 1001,
    [xi.race.TARU_M  ] = 1002,
    [xi.race.TARU_F  ] = 1002,
    [xi.race.MITHRA  ] = 1003,
    [xi.race.GALKA   ] = 1004,
}

xi.xispal.chocoboColor =
{
    [0] = 0x0000, -- yellow
    [1] = 0x0200, -- black
    [2] = 0x0400, -- blue
    [3] = 0x0600, -- red
    [4] = 0x0800, -- green
}

-- Items needed by the squire in order to grow up
xi.xispal.squireItems =
{
    [1] = -- Simple Weapons
    {
        xi.item.BRONZE_SWORD,
        xi.item.MAPLE_WAND,
        xi.item.ASH_STAFF,
        xi.item.RUSTY_GREATSWORD,
        17153, -- Self Bow
    },
    [2] = -- Simple Armor
    {
        12576, -- Bronze Harness
        12568, -- Leather Vest
        12600, -- Robe
        12608, -- Tunic
    },
    [3] = -- Strange Item
    {
        1112, -- Orcish Mail Scales
        553,  -- Dangruf Stone
        576,  -- Siren's Tear
        938,  -- Papaka Grass
        2842, -- Flawed Garnet (Original NM)
    },
    [4] = -- Rarer Weapons
    {
        16551, -- Sapara
        16583, -- Claymore
        17050, -- Willow Wand
        17089, -- Ash Staff
        17160, -- Long Bow
    },
    [5] = -- Rarer Armor
    {
        12560, -- Scale Mail
        12592, -- Doublet
        12577, -- Brass Harness
        12601, -- Linen Robe
    },
    [6] = -- NM loot
    {
        15351, -- Leaping Boots
        16296, -- Armiger's Lace
        16185, -- Pelte
        16486, -- Beestinger
        13607, -- Mist Silk Cape
        16443, -- Fruit Punches
        18394, -- Pilgrim's Wand
        19305, -- Pike
    },
}

xi.xispal.palInfo =
{
    -- Knights
    [xi.job.DRG] =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            name = 'Emilien',
            face = 4,
            race = xi.race.ELVAAN_M,
            pos  = { x = -70.7, y = 6.0, z = -91.6, rot = 20 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Brunloc',
            face = 1,
            race = xi.race.HUME_M,
            pos  = { x = 14.4, y = -0.2, z = 82, rot = 99 },
        },

        job     = xi.job.DRG,
        quest   = { xi.questLog.SANDORIA, xi.quest.id.sandoria.THE_HOLY_CREST },
        groupID = 1005,
        trust   = 899, -- Excenmille
    },

    [xi.job.THF] =
    {
        [xi.zone.UPPER_JEUNO] =
        {
            name = 'Ayala',
            face = 13,
            race = xi.race.MITHRA,
            pos  = { x = -1.35, y = 0, z = 24.92, rot = 80 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Garrik',
            face = 9,
            race = xi.race.HUME_M,
            pos  = { x = -149.7, y = 12, z = 219.7, rot = 32 },
        },
        [xi.zone.PORT_WINDURST] =
        {
            name = 'Lulu',
            face = 3,
            race = xi.race.TARU_F,
            pos  = { x = -15.3, y = -6, z = 152.4, rot = 58 },
        },

        job     = xi.job.THF,
        groupID = 1006,
        trust   = 901, -- Nanaa-mihgo
    },

    [xi.job.SAM] =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            name = 'Nadir',
            face = 14,
            race = xi.race.HUME_M,
            pos  = { x = 24.35, y = -0.1, z = -13.2, rot = 177 },
        },
        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            name = 'Natsune',
            face = 14,
            race = xi.race.ELVAAN_F,
            pos  = { x = 96, y = 1, z = 102.5, rot = 15 },
        },

        job     = xi.job.SAM,
        quest   = { xi.questLog.OUTLANDS, xi.quest.id.outlands.FORGE_YOUR_DESTINY },
        groupID = 1007,
        trust   = 908, -- Tenzen
    },

    [xi.job.DRK] =
    {
        [xi.zone.UPPER_JEUNO] =
        {
            name = 'Yaric',
            face = 1,
            race = xi.race.GALKA,
            pos  = { x = -38.2, y = -0.7, z = 68.4, rot = 129 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Lorisette',
            face = 12,
            race = xi.race.ELVAAN_M,
            pos  = { x = -166.8, y = 12, z = 159.2, rot = 208 },
        },
        [xi.zone.PORT_WINDURST] =
        {
            name = 'Brolo-yolo',
            face = 8,
            race = xi.race.TARU_M,
            pos  = { x = -87.7, y = -5.75, z = 170.4, rot = 75 },
        },

        job     = xi.job.DRK,
        quest   = { xi.questLog.BASTOK, xi.quest.id.bastok.BLADE_OF_DARKNESS },
        groupID = 1008,
        trust   = 906, -- Zeid
    },

    [xi.job.PLD] =
    {
        [xi.zone.UPPER_JEUNO] =
        {
            name = 'Isolde',
            face = 3,
            race = xi.race.ELVAAN_F,
            pos  = { x = -30.9, y = -1, z = 9.2, rot = 179 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Zedant',
            face = 9,
            race = xi.race.ELVAAN_M,
            pos  = { x = -247.3, y = 7, z = 30.9, rot = 13 },
        },
        [xi.zone.PORT_WINDURST] =
        {
            name = 'Pinoy-Tinoy',
            face = 4,
            race = xi.race.TARU_M,
            pos  = { x = -229, y = -8, z = 213.4, rot = 0 },
        },

        job     = xi.job.PLD,
        quest   = { xi.questLog.SANDORIA, xi.quest.id.sandoria.A_KNIGHTS_TEST },
        groupID = 1009,
        trust   = 902, -- Curilla
    },

    -- Mages
    [xi.job.WHM] =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            name = 'Rilea',
            face = 10,
            race = xi.race.HUME_F,
            pos  = { x = -30.8, y = 5.9, z = -90.7, rot = 249 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Sephaut',
            face = 15,
            race = xi.race.ELVAAN_M,
            pos  = { x = 139.56, y = 0, z = 124.2, rot = 127 },
        },
        [xi.zone.PORT_WINDURST] =
        {
            name = 'Maru-Batsu',
            face = 4,
            race = xi.race.TARU_M,
            pos  = { x = -119.4, y = -3.5, z = 121.9, rot = 126 },
        },

        job     = xi.job.WHM,
        groupID = 1010,
        trust   = 898, -- Kupipi
    },

    [xi.job.BLM] =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            name = 'Vivio',
            face = 5,
            race = xi.race.TARU_M,
            pos  = { x = -35.8, y = -1, z = -14.8, rot = 132 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Vivia',
            face = 5,
            race = xi.race.TARU_F,
            pos  = { x = -50, y = -2, z = 28.5, rot = 168 },
        },
        [xi.zone.PORT_WINDURST] =
        {
            name = 'Batsu-Maru',
            face = 5,
            race = xi.race.TARU_M,
            pos  = { x = -119.4, y = -3.5, z = 120, rot = 126 },
        },

        job     = xi.job.BLM,
        groupID = 1011,
        trust   = 904, -- Ajido-marujido
    },

    [xi.job.SMN] =
    {
        [xi.zone.UPPER_JEUNO] =
        {
            name = 'Irving',
            face = 3,
            race = xi.race.HUME_M,
            pos  = { x = 7.5, y = 2, z = 75.8, rot = 95 },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            name = 'Tsalolo',
            face = 9,
            race = xi.race.TARU_F,
            pos  = { x = -188.1, y = 0, z = 102.4, rot = 227 },
        },
        [xi.zone.WINDURST_WATERS] =
        {
            name = 'Mihoy-Nimoy',
            face = 2,
            race = xi.race.TARU_M,
            pos  = { x = 26.5, y = -1.25, z = -220.6, rot = 73 },
        },

        job     = xi.job.SMN,
        quest   = { xi.questLog.WINDURST, xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW },
        groupID = 1012,
        trust   = 936, -- Karaha-baraha
    },

    [xi.job.BRD] =
    {
        [xi.zone.LOWER_JEUNO] =
        {
            name = 'Thessa',
            face = 7,
            race = xi.race.MITHRA,
            pos  = { x = -19.2, y = -0.1, z = -66.21, rot = 174 },
        },
        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            name = 'Bartholomew',
            face = 7,
            race = xi.race.GALKA,
            pos  = { x = 89.9, y = 0, z = 105.7, rot = 198 },
        },

        job     = xi.job.BRD,
        quest   = { xi.questLog.JEUNO, xi.quest.id.jeuno.PATH_OF_THE_BARD },
        groupID = 1013,
        trust   = 911, -- Joachim
    },

    [xi.job.NIN] =
    {
        [xi.zone.UPPER_JEUNO] =
        {
            name    = 'Umbria',
            face    = 2,
            race    = xi.race.TARU_F,
            -- Inconspicuous Door NPC
        },
        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            name    = 'Umbria',
            face    = 9,
            race    = xi.race.ELVAAN_F,
            pos  = { x = -167.5, y = -2, z = 70.3, rot = 38 },
        },

        job     = xi.job.NIN,
        quest   = { xi.questLog.BASTOK, xi.quest.id.bastok.AYAME_AND_KAEDE },
        groupID = 1014,
        trust   = 918, -- Gessho
    },
}

xi.xispal.squireJobInfo =
{
    -- Knights
    [xi.job.DRG] =
    {
        quest   = { xi.questLog.SANDORIA, xi.quest.id.sandoria.THE_HOLY_CREST },
        trust   = 915, -- Shikaree Z
    },
    [xi.job.THF] =
    {
        trust  = 930, -- Aldo
    },
    [xi.job.SAM] =
    {
        quest   = { xi.questLog.OUTLANDS, xi.quest.id.outlands.FORGE_YOUR_DESTINY },
        trust  = 900, -- Ayame
    },
    [xi.job.DRK] =
    {
        quest   = { xi.questLog.BASTOK, xi.quest.id.bastok.BLADE_OF_DARKNESS },
        trust   = 1010, -- Zeid II
    },
    [xi.job.PLD] =
    {
        quest   = { xi.questLog.SANDORIA, xi.quest.id.sandoria.A_KNIGHTS_TEST },
        trust   = 905, -- Trion
    },
    [xi.job.WHM] =
    {
        trust   = 916, -- Cherukiki
    },
    [xi.job.BLM] =
    {
        trust   = 896, -- Shantotto
    },
    [xi.job.SMN] =
    {
        quest   = { xi.questLog.WINDURST, xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW },
        trust   = 935, -- Star Sibyl
    },
    [xi.job.BRD] =
    {
        quest   = { xi.questLog.JEUNO, xi.quest.id.jeuno.PATH_OF_THE_BARD },
        trust   = 914, -- Ulmia
    },
    [xi.job.RDM] =
    {
        trust   = 920, -- Rainemard
    },
}

xi.xispal.upgradeTable =
{
    [xi.job.RDM] =
    {
        [1]  = { item = xi.item.DARK_STAFF,       mods = { { mod = xi.mod.MPHEAL, val = 10 } }}, -- Dark Staff
        [2]  = { item = xi.item.RED_CAPE,         mods = { { mod = xi.mod.INT,    val = 3 },  { mod = xi.mod.MND, val = 3  } }}, -- Red Cape
        [3]  = { item = xi.item.ETHER_RING,       mods = { { mod = xi.mod.MP,     val = 30 }, { mod = xi.mod.HP, val = -30 } }}, -- Ether Ring
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [6]  = { item = xi.item.VERMILLION_CLOAK, mods = { { mod = xi.mod.REFRESH, val = 1 }, { mod = xi.mod.MP, val = 20 } }}, -- Vermillion Cloak
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, 
        [13] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
    },
    [xi.job.PLD] =
    {
        [1]  = { cosmetic = false, item = xi.item.JELLY_RING,         mods = { { mod = xi.mod.DMGPHYS, val = -500 }, }},
        [2]  = { cosmetic = false, item = xi.item.PARADE_GORGET,      mods = { { mod = xi.mod.REFRESH, val = 1 }, { mod = xi.mod.MP,       val = 10 } }},
        [3]  = { cosmetic = false, item = xi.item.RESENTMENT_CAPE,    mods = { { mod = xi.mod.ENMITY,  val = 5 }, { mod = xi.mod.DMGMAGIC, val = -500 } }},
        [4]  = { cosmetic = false, item = xi.item.WARWOLF_BELT,       mods = { { mod = xi.mod.ENMITY,  val = 3 }, { mod = xi.mod.STR,      val = 5 }, { mod = xi.mod.DEX,   val = 5 }, { mod = xi.mod.VIT, val = 5  }, }},
        [5]  = { cosmetic = false, item = xi.item.HARMONIAS_TORQUE,   mods = { { mod = xi.mod.ENMITY,  val = 3 }, { mod = xi.mod.STR,      val = 2 }, }},
        [6]  = { cosmetic = true,  item = xi.item.ADAMAN_CUIRASS,     mods = { { mod = xi.mod.ENMITY,  val = 3 }, { mod = xi.mod.VIT,      val = 4 }, { mod = xi.mod.MND,   val = 4 }, { mod = xi.mod.DEF, val = 40 }, }},
        [7]  = { cosmetic = false, item = xi.item.PALMERINS_SHIELD,   mods = { { mod = xi.mod.DMGPHYS, val = -200 }, }},
        [8]  = { cosmetic = false, item = xi.item.HOSPITALER_EARRING, mods = { { mod = xi.mod.CURE_POTENCY, val = 5 }, }},
        [9]  = { cosmetic = false, item = xi.item.HERCULES_RING,      mods = { { mod = xi.mod.ENMITY,  val = 3 }, { mod = xi.mod.REFRESH,  val = 1 }, { mod = xi.mod.REGEN, val = 1 } }},
        [10] = { cosmetic = true,  item = xi.item.DURANDAL,           mods = { { mod = xi.mod.ENMITY,  val = 3 }, { mod = xi.mod.VIT,      val = 4 }, }},
        [11] = { cosmetic = true,  item = xi.item.AEGISHJALMR,        mods = { { mod = xi.mod.ENMITY,  val = 7 }, { mod = xi.mod.HP,       val = 25 } }},
    },
    [xi.job.DRK] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- 
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Parade Gorget
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Royal Knight Breeches
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Haubergeon
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Alky Bracelets
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Peacock Charm / Amulet
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Pole Grip
        [13] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Hands
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Feet
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Naglering
    },
    [xi.job.DRG] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Thrakon Breastplate
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Peacock Charm / Amulet
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Pole Grip
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Hands
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Feet
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
    },
    [xi.job.SAM] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Haubergeon
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Ochiudo's Kote
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Fuma Kyahan
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Peacock Charm / Amulet
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Pole Grip
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Hands
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Dusk Feet
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Hagun
    },
    [xi.job.THF] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Thief's Knife
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Scorpion Harnes
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Bravo's Subligar
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Peacock Charm
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
    },
    [xi.job.WHM] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Light Staff / Dark Staff
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Qiqirn Sash
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Errant Cape
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Noble's Tunic
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Cure Clogs
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- W Turban
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Antivenom Earrings
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Medicine Ring
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Serket Ring
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Blessed Mitts
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Rostrum Pumps
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Blessed Trousers
    },
    [xi.job.BLM] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Moldavite Earring
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Ice Staff
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Phantom Tathlum
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Demon Helm
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Black Cloak
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Penitent's Rope
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Druid's Slops
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Sorcerer's Ring
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Uggalepih Pendant
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Rostrum Pumps
        [11] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Elemental Earring
        [12] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Igqira Weskit
        [14] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Elemental Torque
        [15] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Novio Earring
    },
    [xi.job.SMN] =
    {
    },
    [xi.job.NIN] =
    {
    },
    [xi.job.BRD] =
    {
        [1]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [2]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }}, -- Demon Helm
        [3]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [4]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [5]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [6]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [7]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [8]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [9]  = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
        [10] = { item = 0, mods = { { mod = 0, val = 0 }, { mod = 0, val = 0 } }},
    },
}

xi.xispal.equipment =
{
    NONE            = 0,
    LEATHER         = 1,
    BREASTPLATE     = 2,
    TUNIC           = 3,
    SHINOBI         = 4,
    CHAINMAIL       = 5,
    LIZARD          = 6,
    RAPTOR          = 7,
    RSE             = 8,
    HARA            = 9,
    CLOAK           = 10,
    SILK            = 11,
    SQUIRE          = 12,
    KNIGHT          = 13,
    PADDED          = 14,
    BRONZE          = 15,
    BONE            = 16,
    KENPOGI         = 17,
    WOOL            = 18,
    TACTICIAN       = 19,
    ROBE            = 20,
    DOUBLET         = 21,
    DARKSTEEL_PLATE = 22,
    GAMBY           = 23,
    JUPON           = 24,
    MUSKET          = 25,
    CENTURION       = 26,
    GAVIAL          = 27,
    SCALE           = 28,
    MYTHRIL_PLATE   = 29,
    JUDGE           = 30,
    RSE2            = 31,
    -- ------ Body only ------ --
    ASSAULT         = 32,
    CARDINAL        = 33,
    SCORPION        = 34,
    DEMON           = 35,
    LORD            = 36,
    JUJITSU         = 37,
    AKETONRK        = 38,
    AKETON          = 39,
    HAUBERGEON      = 40,
    BYRNIE          = 41,
    WARSHINOBI      = 42,
    EARTH           = 43,
    BRIG            = 44,
    JUSTAU          = 45,
    BLACKCLOAK      = 46,
    VERMILION       = 47,
    BLUECOTE        = 48,
    BLACKCOTE       = 49,
    UNKNOWN         = 50,
    -- ----------------------- --
    TIGER           = 51,
    IRONSCALE       = 52,
    STEELSCALE      = 53,
    COEURL          = 54,
    ADAMAN_PLATE    = 55,
    CORAL           = 56,
    NOBLE           = 57,
    HAUBERK         = 58,
    ARHAT           = 59,
    DRAGON          = 60,
    RASETSU         = 61,
    CRIMSON         = 62,
    ADAMAN_HAUBERK  = 63,
    -- --- Job Specific --- --
    WAR_AF          = 64,
    WAR_RELIC       = 65,
    MNK_AF          = 66,
    MNK_RELIC       = 67,
    WHM_AF          = 68,
    WHM_RELIC       = 69,
    BLM_AF          = 70,
    BLM_RELIC       = 71,
    RDM_AF          = 72,
    RDM_RELIC       = 73,
    THF_AF          = 74,
    THF_RELIC       = 75,
    PLD_AF          = 76,
    PLD_RELIC       = 77,
    DRK_AF          = 78,
    DRK_RELIC       = 79,
    BST_AF          = 80,
    BST_RELIC       = 81,
    BRD_AF          = 82,
    BRD_RELIC       = 83,
    RNG_AF          = 84,
    RNG_RELIC       = 85,
    SAM_AF          = 86,
    SAM_RELIC       = 87,
    NIN_AF          = 88,
    NIN_RELIC       = 89,
    DRG_AF          = 90,
    DRG_RELIC       = 91,
    SMN_AF          = 92,
    SMN_RELIC       = 93,
    --------------------------
    OGRE            = 94,
    KOENIG          = 95,
    WAR_AKETON      = 96,
    HOLY_PLATE      = 97,
    YASHA           = 98,
    KIRIN           = 99,
    HECATOMB        = 100,
    ERRANT          = 101,
    FISHTUNIC       = 102,
    CHOCOJACK       = 103,
    VAGABOND        = 104,
    FIELD           = 105,
    SHURA           = 106,
    DALMATICA       = 107,
    CARAPACE        = 108,
    DUSK            = 109,
    DRAGON_HARNESS  = 110,
    SAN_AKETON      = 111, -- Body only
    WIN_AKETON      = 112, -- Body only
    BASTOK_AKETON   = 113, -- Body only
    SCORP_BREAST    = 114,
    AUSTERE         = 115,
    -- Leather: 116
    CARP_APRON      = 117,
    SMITH_APRON     = 118,
    WEAVE_APRON     = 119,
    ALCH_APRON      = 120,
    BONE_APRON      = 121,
    FISH_APRON      = 122,
    TANA_PRON       = 123,
    COOK_APRON      = 124,
    GOLD_APRON      = 125,
    SUNBREEZE       = 126,
    -- Leather: 127
    HYDRA_HARNESS   = 128,
    SHADE           = 129,
    HYDRA_DOUB      = 130,
    SEER            = 131,
    HYDRA_NOCT      = 132,
    NOCT            = 133,
    BISON           = 134,
    SHAIR           = 135,
    BARONE          = 136,
    IGQIRA          = 137,
    EISEN           = 138,
    AURUM           = 139,
    CHRISTMAS       = 140,
    HACHIMAN        = 141,
    BLESSED         = 142,
    ORACLE          = 142,
    -- Aprons: 143 - 147
    UNICORN         = 148,
    TRADER          = 149,
    ALUMINE         = 150,
    PLASTRON        = 151,
    -- Aprons: 152 - 156
    SUNBREEZE_2     = 157,
    -- Leather: 158
    HOMAM           = 159,
    NASHEERA        = 160,
    -- Repeats: 161-163
    HYDRA_ALUMINE   = 164,
    BLU_AF          = 165,
    BLU_RELIC       = 166,
    COR_AF          = 167,
    COR_RELIC       = 168,
    PUP_AF          = 169,
    PUP_RELIC       = 170,
    -- TOAU Gear:   = 171 - 176
    -- Repeat:      = 177, (Oracle)
    -- Leather:     = 178,
    COOL_SCOUT      = 180,
    COOL_TANK       = 181,
    ASKAR           = 182,
    COOL_NIN        = 184,
    COOL_MAGE       = 186,
    -- Zest:        = 187 - 194
    -- OOE stuff
    TIDAL_TALISMAN  = 228,
    -- OOE stuff
}

-- Weapons
xi.xispal.weapons =
{
    [0]  = { 64,   75 }, -- GS:      64  -  75
    [1]  = { 76,   91 }, -- 1H Axe:  76  -  91
    [2]  = { 92,   99 }, -- GAXE:    92  -  99
    [3]  = { 100, 116 }, -- Clubs:   100 - 116
    [4]  = { 117, 143 }, -- H2H:     117 - 143
    [5]  = { 144, 156 }, -- GKAT:    144 - 156
    [6]  = { 157, 180 }, -- Dagger:  157 - 180
    [7]  = { 181, 193 }, -- Rapiers: 181 - 193
    [8]  = { 194, 201 }, -- Scythe:  194 - 201
    [9]  = { 202, 217 }, -- Polearm: 202 - 217 (Ends with Gungnir, sick)
    [10] = { 218, 248 }, -- Wands:   218 - 248
    [11] = { 249, 255 }, -- Swords:  249 - 255
}

xi.xispal.subs =
{
    [0] = { 19,   63 }, -- Shields: 19  -  63
    [1] = { 76,   96 }, -- 1H axe:  76  -  96
    [2] = { 100, 116 }, -- Clubs:   100 - 116
    [3] = { 117, 143 }, -- H2H:     117 - 143
    [4] = { 157, 180 }, -- Daggers: 157 - 180
    [5] = { 181, 193 }, -- Rapiers: 181 - 193
    [6] = { 193, 248 }, -- Wands:   218 - 248
    [7] = { 249, 255 }, -- Swords:  249 - 255
}

xi.xispal.knightGearSets =
{
    [xi.job.DRG] = -- SANDORIA
    {
        [0] = -- Initial
        {
            body  = xi.xispal.equipment.BRONZE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.BRONZE,
            feet  = xi.xispal.equipment.BRONZE,
            main  = xi.xispal.weapons[9][1] + 3, -- Bronze
            sub   = 0,
        },
        [1] = 
        {
            body  = xi.xispal.equipment.BONE,
            hands = xi.xispal.equipment.LEATHER,
            legs  = xi.xispal.equipment.BONE,
            feet  = xi.xispal.equipment.BONE,
            main  = xi.xispal.weapons[9][1] + 0, -- Halberd
            sub   = 0,
        },
        [2] = 
        {
            body  = xi.xispal.equipment.CENTURION,
            hands = xi.xispal.equipment.SQUIRE,
            legs  = xi.xispal.equipment.CENTURION,
            feet  = xi.xispal.equipment.LIZARD,
            main  = xi.xispal.weapons[9][1] + 0, -- Halberd
            sub   = 0,
        },
        [3] = -- 
        {
            body  = xi.xispal.equipment.BRIG,
            hands = xi.xispal.equipment.COEURL,
            legs  = xi.xispal.equipment.GAMBY,
            feet  = xi.xispal.equipment.BREASTPLATE,
            main  = xi.xispal.weapons[9][1] + 0, -- Halberd
            sub   = 0,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.DRG_AF,
            hands = xi.xispal.equipment.DRG_AF,
            legs  = xi.xispal.equipment.DRG_AF,
            feet  = xi.xispal.equipment.DRG_AF,
            main  = xi.xispal.weapons[9][1] + 7, -- Thalassocrat
            sub   = 0,
        },
    },

    [xi.job.SAM] = -- Norg
    {
        [0] = -- Initial
        {
            body  = xi.xispal.equipment.KENPOGI,
            hands = xi.xispal.equipment.KENPOGI,
            legs  = xi.xispal.equipment.KENPOGI,
            feet  = xi.xispal.equipment.KENPOGI,
            main  = xi.xispal.weapons[5][1] + 6,
            sub   = 0,
        },
        [1] = -- 
        {
            body  = xi.xispal.equipment.CHAINMAIL,
            hands = xi.xispal.equipment.LEATHER,
            legs  = xi.xispal.equipment.KENPOGI,
            feet  = xi.xispal.equipment.LIZARD,
            main  = xi.xispal.weapons[5][1] + 6,
            sub   = 0,
        },
        [2] = -- 
        {
            body  = xi.xispal.equipment.SQUIRE,
            hands = xi.xispal.equipment.SQUIRE,
            legs  = xi.xispal.equipment.SHINOBI,
            feet  = xi.xispal.equipment.HARA,
            main  = xi.xispal.weapons[5][1] + 6,
            sub   = 0,
        },
        [3] = -- 
        {
            body  = xi.xispal.equipment.JUJITSU,
            hands = xi.xispal.equipment.HARA,
            legs  = xi.xispal.equipment.SHINOBI,
            feet  = xi.xispal.equipment.HARA,
            main  = xi.xispal.weapons[5][1] + 6,
            sub   = 0,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.SAM_AF,
            hands = xi.xispal.equipment.SAM_AF,
            legs  = xi.xispal.equipment.SAM_AF,
            feet  = xi.xispal.equipment.SAM_AF,
            main  = xi.xispal.weapons[5][1] + 6,
            sub   = 0,
        },
    },

    [xi.job.DRK] = -- BASTOK
    {
        [0] = -- Initial
        {
            body  = xi.xispal.equipment.BRONZE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.LEATHER,
            feet  = xi.xispal.equipment.BRONZE,
            main  = xi.xispal.weapons[0][1] + 3,
            sub   = 0,
        },
        [1] = -- 
        {
            body  = xi.xispal.equipment.BONE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.DARKSTEEL_PLATE,
            feet  = xi.xispal.equipment.LIZARD,
            main  = xi.xispal.weapons[0][1] + 8,
            sub   = 0,
        },
        [2] = -- 
        {
            body  = xi.xispal.equipment.CARAPACE,
            hands = xi.xispal.equipment.RSE2,
            legs  = xi.xispal.equipment.MYTHRIL_PLATE,
            feet  = xi.xispal.equipment.MYTHRIL_PLATE,
            main  = xi.xispal.weapons[0][1] + 8,
            sub   = 0,
        },
        [3] = -- 
        {
            body  = xi.xispal.equipment.DARKSTEEL_PLATE,
            hands = xi.xispal.equipment.DARKSTEEL_PLATE,
            legs  = xi.xispal.equipment.DARKSTEEL_PLATE,
            feet  = xi.xispal.equipment.DARKSTEEL_PLATE,
            main  = xi.xispal.weapons[0][1] + 8,
            sub   = 0,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.DRK_AF,
            hands = xi.xispal.equipment.DRK_AF,
            legs  = xi.xispal.equipment.DRK_AF,
            feet  = xi.xispal.equipment.DRK_AF,
            main  = xi.xispal.weapons[0][1] + 6,
            sub   = 0,
        },
    },

    [xi.job.PLD] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.BRONZE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.LEATHER,
            feet  = xi.xispal.equipment.LEATHER,
            main  = xi.xispal.weapons[11][1] + 4, -- 253 a cool sword
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [1] =
        {
            body  = xi.xispal.equipment.CHAINMAIL,
            hands = xi.xispal.equipment.LEATHER,
            legs  = xi.xispal.equipment.CHAINMAIL,
            feet  = xi.xispal.equipment.BONE,
            main  = xi.xispal.weapons[11][1] + 4, -- 253 a cool sword
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [2] =
        {
            body  = xi.xispal.equipment.CENTURION,
            hands = xi.xispal.equipment.BREASTPLATE,
            legs  = xi.xispal.equipment.BREASTPLATE,
            feet  = xi.xispal.equipment.BREASTPLATE,
            main  = xi.xispal.weapons[11][1] + 4, -- 253 a cool sword
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [3] =
        {
            body  = xi.xispal.equipment.MYTHRIL_PLATE,
            hands = xi.xispal.equipment.DARKSTEEL_PLATE,
            legs  = xi.xispal.equipment.DARKSTEEL_PLATE,
            feet  = xi.xispal.equipment.DARKSTEEL_PLATE,
            main  = xi.xispal.weapons[11][1] + 4,
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.PLD_AF,
            hands = xi.xispal.equipment.PLD_AF,
            legs  = xi.xispal.equipment.PLD_AF,
            feet  = xi.xispal.equipment.PLD_AF,
            main  = xi.xispal.weapons[11][1] + 4,
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [5] = -- Adaman Cuirass upgrade
        {
            body  = xi.xispal.equipment.ADAMAN_PLATE,
            hands = xi.xispal.equipment.PLD_AF,
            legs  = xi.xispal.equipment.PLD_AF,
            feet  = xi.xispal.equipment.PLD_AF,
            main  = xi.xispal.weapons[11][1] + 4,
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [6] = -- Palmerin's Shield upgrade
        {
            body  = xi.xispal.equipment.ADAMAN_PLATE,
            hands = xi.xispal.equipment.PLD_AF,
            legs  = xi.xispal.equipment.ADAMAN_PLATE,
            feet  = xi.xispal.equipment.PLD_AF,
            main  = xi.xispal.weapons[11][1] + 4,
            sub   = xi.xispal.subs[0][1] + 9,
        },
        [7] = -- Durandal upgrade
        {
            body  = xi.xispal.equipment.ADAMAN_PLATE,
            hands = xi.xispal.equipment.ADAMAN_PLATE,
            legs  = xi.xispal.equipment.ADAMAN_PLATE,
            feet  = xi.xispal.equipment.ADAMAN_PLATE,
            main  = xi.xispal.weapons[11][1] + 4,
            sub   = xi.xispal.subs[0][1] + 9,
        },
    },

    [xi.job.THF] =
    {
        [0] = -- Initial
        {
            body  = xi.xispal.equipment.ROBE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.LEATHER,
            feet  = xi.xispal.equipment.RSE,
            main  = xi.xispal.weapons[6][1] + 10,
            sub   = 0,
        },
        [1] =
        {
            body  = xi.xispal.equipment.LIZARD,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.LIZARD,
            feet  = xi.xispal.equipment.LIZARD,
            main  = xi.xispal.weapons[6][1] + 11,
            sub   = 0,
        },
        [2] =
        {
            body  = xi.xispal.equipment.BRIG,
            hands = xi.xispal.equipment.TIGER,
            legs  = xi.xispal.equipment.TACTICIAN,
            feet  = xi.xispal.equipment.LIZARD,
            main  = xi.xispal.weapons[6][1] + 11,
            sub   = 0,
        },
        [3] = -- 
        {
            body  = xi.xispal.equipment.BLUECOTE,
            hands = xi.xispal.equipment.JUPON,
            legs  = xi.xispal.equipment.TACTICIAN,
            feet  = xi.xispal.equipment.TUNIC,
            main  = xi.xispal.weapons[6][1] + 11,
            sub   = 0,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.THF_AF,
            hands = xi.xispal.equipment.THF_AF,
            legs  = xi.xispal.equipment.THF_AF,
            feet  = xi.xispal.equipment.THF_AF,
            main  = xi.xispal.weapons[6][1] + 12,
            sub   = xi.xispal.weapons[6][1] + 12,
        },
    },
}

xi.xispal.mageGearSets =
{
    [xi.job.RDM] =
    {
        [0] = -- Level 1-10
        {
            body  = xi.xispal.equipment.RSE,
            hands = xi.xispal.equipment.BRONZE,
            legs  = xi.xispal.equipment.RSE,
            feet  = xi.xispal.equipment.BRONZE,
            main  = xi.xispal.weapons[11][1] + 0,
            sub   = 0,
        },
        [1] = -- Lvl 10-25
        {
            body  = xi.xispal.equipment.BONE,
            hands = xi.xispal.equipment.LEATHER,
            legs  = xi.xispal.equipment.DOUBLET,
            feet  = xi.xispal.equipment.KENPOGI,
            main  = xi.xispal.weapons[11][1] + 3,
            sub   = xi.xispal.subs[0][1] + 0,
        },
        [2] = -- Lvl 25-35
        {
            body  = xi.xispal.equipment.WOOL,
            hands = xi.xispal.equipment.RAPTOR,
            legs  = xi.xispal.equipment.DOUBLET,
            feet  = xi.xispal.equipment.RAPTOR,
            main  = xi.xispal.weapons[11][1] + 3, -- Iron Sword
            sub   = xi.xispal.subs[0][1] + 16, -- Faerie
        },
        [3] = -- Lvl 40-50
        {
            body  = xi.xispal.equipment.RSE2,
            hands = xi.xispal.equipment.SILK,
            legs  = xi.xispal.equipment.RSE2,
            feet  = xi.xispal.equipment.SILK,
            main  = xi.xispal.weapons[0][1] + 10,
            sub   = 256,
        },
        [4] = -- Unlock full AF set
        {
            body  = xi.xispal.equipment.RDM_AF,
            hands = xi.xispal.equipment.RDM_AF,
            legs  = xi.xispal.equipment.RDM_AF,
            feet  = xi.xispal.equipment.RDM_AF,
            main  = xi.xispal.weapons[0][1] + 10,
            sub   = 256,
        },
    },
    [xi.job.WHM] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.ROBE,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.ROBE,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [1] =
        {
            body  = xi.xispal.equipment.DOUBLET,
            hands = xi.xispal.equipment.DOUBLET,
            legs  = xi.xispal.equipment.DOUBLET,
            feet  = xi.xispal.equipment.DOUBLET,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [2] =
        {
            body  = xi.xispal.equipment.RSE2,
            hands = xi.xispal.equipment.CLOAK,
            legs  = xi.xispal.equipment.CLOAK,
            feet  = xi.xispal.equipment.CLOAK,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [3] =
        {
            body  = xi.xispal.equipment.CLOAK,
            hands = xi.xispal.equipment.CLOAK,
            legs  = xi.xispal.equipment.SILK,
            feet  = xi.xispal.equipment.CLOAK,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3 -- Light Staff
            sub   = 256,
        },
        [4] =
        {
            body  = xi.xispal.equipment.WHM_AF,
            hands = xi.xispal.equipment.WHM_AF,
            legs  = xi.xispal.equipment.WHM_AF,
            feet  = xi.xispal.equipment.WHM_AF,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
    },

    [xi.job.BLM] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.ROBE,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.ROBE,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 4,
            sub   = 256,
        },
        [1] =
        {
            body  = xi.xispal.equipment.TUNIC,
            hands = xi.xispal.equipment.TUNIC,
            legs  = xi.xispal.equipment.TUNIC,
            feet  = xi.xispal.equipment.TUNIC,
            main  = xi.xispal.weapons[0][1] + 4,
            sub   = 256,
        },
        [2] =
        {
            body  = xi.xispal.equipment.SEER,
            hands = xi.xispal.equipment.SEER,
            legs  = xi.xispal.equipment.SEER,
            feet  = xi.xispal.equipment.SEER,
            main  = xi.xispal.weapons[0][1] + 4,
            sub   = 256,
        },
        [3] =
        {
            body  = xi.xispal.equipment.BLACKCLOAK,
            hands = xi.xispal.equipment.SILK,
            legs  = xi.xispal.equipment.SILK,
            feet  = xi.xispal.equipment.SILK,
            main  = xi.xispal.weapons[0][1] + 4,
            sub   = 256,
        },
        [4] =
        {
            body  = xi.xispal.equipment.BLM_AF,
            hands = xi.xispal.equipment.BLM_AF,
            legs  = xi.xispal.equipment.BLM_AF,
            feet  = xi.xispal.equipment.BLM_AF,
            main  = xi.xispal.weapons[0][1] + 4,
            sub   = 256,
        },
    },

    [xi.job.SMN] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.ROBE,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.ROBE,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [1] =
        {
            body  = xi.xispal.equipment.DOUBLET,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.ROBE,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [2] =
        {
            body  = xi.xispal.equipment.SEER,
            hands = xi.xispal.equipment.SEER,
            legs  = xi.xispal.equipment.SEER,
            feet  = xi.xispal.equipment.SEER,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [3] =
        {
            body  = xi.xispal.equipment.CLOAK,
            hands = xi.xispal.equipment.CLOAK,
            legs  = xi.xispal.equipment.CLOAK,
            feet  = xi.xispal.equipment.CLOAK,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [4] =
        {
            body  = xi.xispal.equipment.SMN_AF,
            hands = xi.xispal.equipment.SMN_AF,
            legs  = xi.xispal.equipment.SMN_AF,
            feet  = xi.xispal.equipment.SMN_AF,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
    },

    [xi.job.BRD] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.ROBE,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.ROBE,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [1] =
        {
            body  = xi.xispal.equipment.DOUBLET,
            hands = xi.xispal.equipment.ROBE,
            legs  = xi.xispal.equipment.DOUBLET,
            feet  = xi.xispal.equipment.ROBE,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [2] =
        {
            body  = xi.xispal.equipment.GAMBY,
            hands = xi.xispal.equipment.GAMBY,
            legs  = xi.xispal.equipment.GAMBY,
            feet  = xi.xispal.equipment.GAMBY,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [3] =
        {
            body  = xi.xispal.equipment.JUPON,
            hands = xi.xispal.equipment.JUPON,
            legs  = xi.xispal.equipment.JUPON,
            feet  = xi.xispal.equipment.JUPON,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
        [4] =
        {
            body  = xi.xispal.equipment.BRD_AF,
            hands = xi.xispal.equipment.BRD_AF,
            legs  = xi.xispal.equipment.BRD_AF,
            feet  = xi.xispal.equipment.BRD_AF,
            main  = xi.xispal.weapons[0][1] + 10, -- 0, 1, 3
            sub   = 256,
        },
    },

    [xi.job.NIN] =
    {
        [0] =
        {
            body  = xi.xispal.equipment.KENPOGI,
            hands = xi.xispal.equipment.KENPOGI,
            legs  = xi.xispal.equipment.KENPOGI,
            feet  = xi.xispal.equipment.KENPOGI,
            main  = xi.xispal.weapons[0][1] + 5, -- 0, 1, 3
            sub   = 256,
        },
        [1] =
        {
            body  = xi.xispal.equipment.SHADE,
            hands = xi.xispal.equipment.SHADE,
            legs  = xi.xispal.equipment.SHADE,
            feet  = xi.xispal.equipment.SHADE,
            main  = xi.xispal.weapons[0][1] + 5, -- 0, 1, 3
            sub   = 256,
        },
        [2] =
        {
            body  = xi.xispal.equipment.NIN_AF,
            hands = xi.xispal.equipment.NIN_AF,
            legs  = xi.xispal.equipment.NIN_AF,
            feet  = xi.xispal.equipment.NIN_AF,
            main  = xi.xispal.weapons[0][1] + 5, -- 0, 1, 3
            sub   = 256,
        },
        [3] =
        {
            body  = xi.xispal.equipment.NIN_AF,
            hands = xi.xispal.equipment.NIN_AF,
            legs  = xi.xispal.equipment.NIN_AF,
            feet  = xi.xispal.equipment.NIN_AF,
            main  = xi.xispal.weapons[0][1] + 5, -- 0, 1, 3
            sub   = 256,
        },
        [4] =
        {
            body  = xi.xispal.equipment.NIN_AF,
            hands = xi.xispal.equipment.NIN_AF,
            legs  = xi.xispal.equipment.NIN_AF,
            feet  = xi.xispal.equipment.NIN_AF,
            main  = xi.xispal.weapons[0][1] + 5, -- 0, 1, 3
            sub   = 256,
        },
    },
}
