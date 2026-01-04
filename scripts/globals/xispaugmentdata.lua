xi = xi or {}
xi.augment = xi.augment or {}

xi.augment.augmentItems =
{
    [1] =
    {
        xi.item.STONE_OF_BALANCE, -- Balance Stone
        xi.item.STONE_OF_VOYAGE, -- Voyage Stone
        xi.item.STONE_OF_ARDOR, -- Ardor Stone
        xi.item.MYTHRIL_MEED, -- Copper Meed
    },

    [2] =
    {
        xi.item.COIN_OF_BALANCE, -- Balance Coin
        xi.item.COIN_OF_VOYAGE, -- Voyage Coin
        xi.item.COIN_OF_WIELDANCE, -- Wieldance Coin
        xi.item.COIN_OF_ARDOR, -- Ardor Coin
        xi.item.COIN_OF_VISION, -- Vision Coin
        xi.item.DARK_MEED, -- Gold Meed
    },

    [3] =
    {
        xi.item.JEWEL_OF_BALANCE, -- Balance Jewel
        xi.item.JEWEL_OF_VOYAGE, -- Voyage Jewel
        xi.item.JEWEL_OF_WIELDANCE, -- Wieldance Jewel
        xi.item.JEWEL_OF_ARDOR, -- Ardor Jewel
        xi.item.JEWEL_OF_BALANCE, -- Balance Jewel
        xi.item.DARK_MEED,
    }
}

xi.augment.augmentTable =
{
    [1] =
    {
        [xi.item.STONE_OF_BALANCE] =
        {
            { augmentID = 512, value = 0, name = "STR +1", },
            { augmentID = 513, value = 0, name = "DEX +1", },
            { augmentID = 514, value = 0, name = "VIT +1", },
            { augmentID = 515, value = 0, name = "AGI +1", },
            { augmentID = 516, value = 0, name = "INT +1", },
            { augmentID = 517, value = 0, name = "MND +1", },
            { augmentID = 518, value = 0, name = "CHR +1", },
        },

        [xi.item.STONE_OF_VOYAGE] =
        {
            { augmentID = 52,  value = 0, name = "MP Recovered While Healing +1", },
            { augmentID = 35,  value = 0, name = "Magic Accuracy +1", },
            { augmentID = 9,   value = 4, name = "MP +5", },
        },

        [xi.item.STONE_OF_ARDOR] =
        {
            { augmentID = 69,  value = 1, name = "Ranged Acc. and Ranged Attk. +2", },
            { augmentID = 51,  value = 1, name = "HP Recovered While Healing +2", },
            { augmentID = 68,  value = 1, name = "Accuracy and Attack +2", },
            { augmentID = 31,  value = 2, name = "Evasion +3", },
            { augmentID = 33,  value = 2, name = "Defense +3", },
            { augmentID = 1,   value = 4, name = "HP +5", },
        },

        [xi.item.MYTHRIL_MEED] =
        {
            { augmentID = 740,  value = 0, name = "Damage +1", },
        },

    },
    -- Mid Level Augments (One allowed per item)
    [2] =
    {
        [xi.item.COIN_OF_BALANCE] = -- Stat Augments (Balance)
        {
            { augmentID = 550, value = 2, name = "STR and DEX +3" },
            { augmentID = 554, value = 2, name = "INT and MND +3" },
            { augmentID = 514, value = 2, name = "VIT +3", },
            { augmentID = 515, value = 2, name = "AGI +3", },
        },

        [xi.item.COIN_OF_VOYAGE] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,  value = 2, name = "MP Recovered While Healing +3", },
            { augmentID = 42,  value = 0, name = "Enemity Critical Hit Rate -1%" },
            { augmentID = 131, value = 0, name = "Magic Attack and Accuracy +2" },
            { augmentID = 53,  value = 0, name = "Spell Interruption Rate -1%" },
            { augmentID = 40,  value = 0, name = "Enmity -1" },
            { augmentID = 9,   value = 14,name = "MP +15" },
        },

        [xi.item.COIN_OF_ARDOR] = -- Combat Augments (Ardor)
        {
            { augmentID = 51,  value = 2, name = "HP Recovered While Healing +3", },
            { augmentID = 69,  value = 4, name = "Ranged Acc. and Ranged Attk. +5" },
            { augmentID = 54,  value = 0, name = "Physical Damage Taken -1%" },
            { augmentID = 55,  value = 0, name = "Magical Damage Taken -1%" },
            { augmentID = 68,  value = 4, name = "Accuracy and Attack +5" },
            { augmentID = 41,  value = 0, name = "Critical Hit Rate +1%" },
            { augmentID = 44,  value = 0, name = "Store TP +1" },
            { augmentID = 145, value = 0, name = "Counter +1" },
            { augmentID = 31,  value = 4, name = "Evasion +5" },
            { augmentID = 33,  value = 9, name = "Defense +10" },
            { augmentID = 39,  value = 0, name = "Enmity +1" },
            { augmentID = 1,   value = 19,name = "HP +15" },
        },

        [xi.item.COIN_OF_VISION] = -- Misc / Job specific Augments (Vision)
        {
            { augmentID = 320, value = 0, name = "Blood Pact Delay -1" },
            { augmentID = 215, value = 0, name = "Tool Expertise +1" },
            { augmentID = 151, value = 0, name = "Martial Arts +1" },
            { augmentID = 194, value = 0, name = "Kick Attack +1" },
            { augmentID = 17,  value = 9, name = "HP and MP +10" },
            { augmentID = 141, value = 0, name = "Conserve MP+1" },
            { augmentID = 195, value = 0, name = "Subtle Blow_1" },
            { augmentID = 120, value = 0, name = "Gilfinder +1" },
            { augmentID = 212, value = 0, name = "Recycle +1" },
            { augmentID = 198, value = 0, name = "Zanshin +1" },
            { augmentID = 49,  value = 0, name = "Haste +1%" },
            { augmentID = 772, value = 4, name = "Lightning Resistance +5" },
            { augmentID = 774, value = 4, name = "Light Resistance +5" },
            { augmentID = 771, value = 4, name = "Earth Resistance +5" },
            { augmentID = 773, value = 4, name = "Water Resistance +5" },
            { augmentID = 770, value = 4, name = "Wind Resistance +5" },
            { augmentID = 768, value = 4, name = "Fire Resistance +5" },
            { augmentID = 775, value = 4, name = "Dark Resistance +5" },
            { augmentID = 769, value = 4, name = "Ice Resistance +5" },
        },
        [xi.item.DARK_MEED] = -- Weapons (Dark Meed)
        {
            { augmentID = 740,  value = 1, name = "Damage +2", },
        },
    },
    -- High Level Augments (Two allowed per item)
    [3] =
    {
        [xi.item.JEWEL_OF_BALANCE] = -- Stat Augments (Balance)
        {
            { augmentID = 550,  value = 4,  name = "STR and DEX +5" },
            { augmentID = 554,  value = 4,  name = "INT and MND +5" },
            { augmentID = 514,  value = 4,  name = "VIT +5" },
            { augmentID = 515,  value = 4,  name = "AGI +5" },
        },

        [xi.item.JEWEL_OF_VOYAGE] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,   value = 4,  name = "MP Recovered While Healing +5" },
            { augmentID = 42,   value = 4,  name = "Enemity Critical Hit Rate -5%" },
            { augmentID = 131,  value = 2,  name = "Magic Attack and Accuracy + 3" },
            { augmentID = 53,   value = 1,  name = "Spell Interruption Rate -2%" },
            { augmentID = 335,  value = 1,  name = "Magic Critical Damage +2%" },
            { augmentID = 120,  value = 4,  name = "Avatar Magic Attack +5" },
            { augmentID = 55,   value = 1,  name = "Magic Damage Taken -2%" },
            { augmentID = 343,  value = 9,  name = "Drain and Aspir +10" },
            { augmentID = 330,  value = 1,  name = "Waltz Potency +2%" },
            { augmentID = 329,  value = 1,  name = "Cure Potency +2%" },
            { augmentID = 141,  value = 1,  name = "Conserve MP +2" },
            { augmentID = 368,  value = 0,  name = "Phalanx +1" },
            { augmentID = 9,    value = 29, name = "MP +30" },
        },

        [xi.item.JEWEL_OF_WIELDANCE] = -- Skill Augments (Wieldance)
        {
            { augmentID = 266,  value = 1,  name = "Great Katana Skill +2" },
            { augmentID = 257,  value = 1,  name = "Hand-to-hand Skill +2" },
            { augmentID = 260,  value = 1,  name = "Great Sword Skill +2" },
            { augmentID = 291,  value = 1,  name = "Enfeebling Skill +2" },
            { augmentID = 299,  value = 1,  name = "Blue Magic Skill +2" },
            { augmentID = 290,  value = 1,  name = "Enhancing Skill +2" },
            { augmentID = 292,  value = 1,  name = "Elemental Skill +2" },
            { augmentID = 262,  value = 1,  name = "Great Axe Skill +2" },
            { augmentID = 295,  value = 1,  name = "Ninjutsu Skill +2" },
            { augmentID = 289,  value = 1,  name = "Healing Skill +2" },
            { augmentID = 296,  value = 1,  name = "Singing Skill +2" },
            { augmentID = 264,  value = 1,  name = "Polearm Skill +2" },
            { augmentID = 294,  value = 1,  name = "Summon Skill +2" },
            { augmentID = 286,  value = 1,  name = "Shield Skill +2" },
            { augmentID = 288,  value = 1,  name = "Divine Skill +2" },
            { augmentID = 263,  value = 1,  name = "Scythe Skill +2" },
            { augmentID = 265,  value = 1,  name = "Katana Skill +2" },
            { augmentID = 258,  value = 1,  name = "Dagger Skill +2" },
            { augmentID = 297,  value = 1,  name = "String Skill +2" },
            { augmentID = 268,  value = 1,  name = "Staff Skill +2" },
            { augmentID = 287,  value = 1,  name = "Parry Skill +2" },
            { augmentID = 259,  value = 1,  name = "Sword Skill +2" },
            { augmentID = 298,  value = 1,  name = "Wind Skill +2" },
            { augmentID = 267,  value = 1,  name = "Club Skill +2" },
            { augmentID = 293,  value = 1,  name = "Dark Skill +2" },
            { augmentID = 261,  value = 1,  name = "Axe Skill +2" },
        },

        [xi.item.JEWEL_OF_ARDOR] = -- Combat Augments (Ador)
        {
            { augmentID = 51,   value = 9,  name = "HP Recovered While Healing +10" },
            { augmentID = 129,  value = 6,  name = "Ranged Acc. and Ranged Attk. +7" },
            { augmentID = 1248, value = 9,  name = "Enhancing Magic Duration +10" },
            { augmentID = 54,   value = 1,  name = "Physical Damage Taken -2%" },
            { augmentID = 326,  value = 1,  name = "Weapon Skill Accuracy +2" },
            { augmentID = 327,  value = 0,  name = "Weapon Skill Damage +1%" },
            { augmentID = 56,   value = 1,  name = "Breath Damage Taken -2%" },
            { augmentID = 68,   value = 6,  name = "Accuracy and Attack +7" },
            { augmentID = 41,   value = 1,  name = "Critical Hit Rate +2%" },
            { augmentID = 143,  value = 0,  name = "Double Attack +1%" },
            { augmentID = 195,  value = 4,  name = "Subtle Blow +5" },
            { augmentID = 33,   value = 14,  name = "Defense +15" },
            { augmentID = 44,   value = 4,  name = "Store TP +5" },
            { augmentID = 31,   value = 7,  name = "Evasion +8" },
            { augmentID = 145,  value = 1,  name = "Counter +2" },
            { augmentID = 39,   value = 1,  name = "Enmity +2" },
            { augmentID = 40,   value = 1,  name = "Enmity -2" },
            { augmentID = 78,   value = 29, name = "HP +30" },
        },

        [xi.item.JEWEL_OF_VISION] = -- Misc / Job Specific Augments (Vision)
        {
            { augmentID = 1246, value = 1,  name = "Pet: Physical Damage Taken -2%" },
            { augmentID = 1247, value = 1,  name = "Pet: Magical Damage Taken -2%" },
            { augmentID = 796,  value = 4,  name = "All Elemental Resistances +5", },
            { augmentID = 112,  value = 1,  name = "Pet: Damage Taken -2%" },
            { augmentID = 1264, value = 2,  name = "Meditate Duration +3" },
            { augmentID = 71,   value = 1,  name = "All Damage Taken -2%" },
            { augmentID = 320,  value = 1,  name = "Blood Pact Delay -2" },
            { augmentID = 328,  value = 0,  name = "Critical Damage +1%" },
            { augmentID = 134,  value = 0,  name = "Magic Defense +1" },
            { augmentID = 363,  value = 1,  name = "Block Chance +2" },
            { augmentID = 17,   value = 14, name = "HP and MP +15" },
            { augmentID = 211,  value = 0,  name = "Snapshot +1" },
            { augmentID = 251,  value = 0,  name = "Darken +1" },
            { augmentID = 49,   value = 1,  name = "Haste +2%" },
            { augmentID = 137,  value = 0,  name = "Regen +1" },
        },
        [xi.item.DARK_MEED] = -- Weapon (Dark Meed)
        {
            { augmentID = 896,  value = 4, name = "Sword Enhancement Spell Damage +5", },
            { augmentID = 932,  value = 0, name = "Lightning Affinity +1", },
            { augmentID = 931,  value = 1, name = "Earth Affinity +1", },
            { augmentID = 934,  value = 1, name = "Light Affinity +1", },
            { augmentID = 933,  value = 1, name = "Water Affinity +1", },
            { augmentID = 928,  value = 1, name = "Fire Affinity +1", },
            { augmentID = 930,  value = 1, name = "Wind Affinity +1", },
            { augmentID = 935,  value = 1, name = "Dark Affinity +1", },
            { augmentID = 929,  value = 1, name = "Ice Affinity +1", },
            { augmentID = 740,  value = 4, name = "Damage +3", },
        },
    },
}
