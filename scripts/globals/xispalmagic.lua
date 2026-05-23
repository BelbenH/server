xi = xi or {}
xi.xispal = xi.xispal or {}

-- Pals will be similar to the player in that they possess 2/3 the SJ lvl compared to 75.
-- Ex. 75/49 -- 50/33 -- 25 / 16

-- Lists are organized per section based on priority. The higher up on the list, the more it will be prioritized.

xi.xispal.white =
{
    NA   =
    {
        -- Na spells
        { spell = xi.magic.spell.CURE,     effect = xi.effect.SLEEP_I,       lvl = { [xi.job.WHM] = 1,  [xi.job.RDM] = 3, [xi.job.PLD] = 5, }, [xi.job.BRD] = 2, },
        { spell = xi.magic.spell.CURE,     effect = xi.effect.SLEEP_II,      lvl = { [xi.job.WHM] = 1,  [xi.job.RDM] = 3, [xi.job.PLD] = 5, }, [xi.job.BRD] = 2, },
        { spell = xi.magic.spell.POISONA,  effect = xi.effect.POISON,        lvl = { [xi.job.WHM] = 6,  [xi.job.RDM] = 12, [xi.job.BRD] = 12, }, },
        { spell = xi.magic.spell.PARALYNA, effect = xi.effect.PARALYSIS,     lvl = { [xi.job.WHM] = 9,  [xi.job.RDM] = 18, [xi.job.BRD] = 18, }, },
        { spell = xi.magic.spell.BLINDNA,  effect = xi.effect.BLINDNESS,     lvl = { [xi.job.WHM] = 14, [xi.job.RDM] = 28, [xi.job.BRD] = 28, }, },
        { spell = xi.magic.spell.SILENA,   effect = xi.effect.SILENCE,       lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 38, [xi.job.BRD] = 38, }, },
        { spell = xi.magic.spell.CURSNA,   effect = xi.effect.CURSE_I,       lvl = { [xi.job.WHM] = 29, [xi.job.RDM] = 58, }, },
        { spell = xi.magic.spell.CURSNA,   effect = xi.effect.DOOM,          lvl = { [xi.job.WHM] = 29, [xi.job.RDM] = 58, }, },
        { spell = xi.magic.spell.VIRUNA,   effect = xi.effect.DISEASE,       lvl = { [xi.job.WHM] = 34, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.STONA,    effect = xi.effect.PETRIFICATION, lvl = { [xi.job.WHM] = 39, },                    },

        -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DEFENSE_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIND,         lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.WEIGHT,       lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DIA,          lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIO,          lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BURN,         lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SHOCK,        lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.CHOKE,        lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DROWN,        lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.RASP,         lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.FROST,        lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SLOW,         lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.STR_DOWN,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DEX_DOWN,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
    },

    BUFF =
    {
        -- High priority buffs
        { spell = xi.magic.spell.REFRESH,   effect = xi.effect.REFRESH,   lvl = { [xi.job.RDM] = 41, },  },

        -- Other Buffs
        { spell = xi.magic.spell.HASTE,     effect = xi.effect.HASTE,     lvl = { [xi.job.WHM] = 40, [xi.job.RDM] = 48, }, combatOnly = true, },
        { spell = xi.magic.spell.BLINK,     effect = xi.effect.BLINK,     lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 23, [xi.job.BLM] = 46 }, combatOnly = true, selfOnly = true, },
        { spell = xi.magic.spell.STONESKIN, effect = xi.effect.STONESKIN, lvl = { [xi.job.WHM] = 28, [xi.job.RDM] = 31, [xi.job.BLM] = 68 }, combatOnly = true, selfOnly = true, },
        { spell = xi.magic.spell.ENAERO,    effect = xi.effect.ENAERO,    lvl = { [xi.job.RDM] = 20, }, combatOnly = true, selfOnly = true, },

        -- Protect / Shell
        { spell = xi.magic.spell.PROTECTRA_IV,  effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 63, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_IV,    effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 68, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA_III, effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 47, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_III,   effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 57, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA_II,  effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 27, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_II,    effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 37, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA,     effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 7,  }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA,       effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 17, }, selfOnly = true, },

        { spell = xi.magic.spell.PROTECT_IV,    effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 63, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_IV,      effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 68, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT_III,   effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 47, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_III,     effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 57, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT_II,    effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 27, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_II,      effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 37, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT,       effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 7,  }, selfOnly = true },
        { spell = xi.magic.spell.SHELL,         effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 17, }, selfOnly = true },
    },

    CURE =
    {
        { spell = xi.magic.spell.CURE_V,   threshold = 400, cost = 0, lvl = { [xi.job.WHM] = 61, } },
        { spell = xi.magic.spell.CURE_IV,  threshold = 350, cost = 0, lvl = { [xi.job.WHM] = 41, [xi.job.RDM] = 48, [xi.job.PLD] = 55, } },
        { spell = xi.magic.spell.CURE_III, threshold = 180, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 26, [xi.job.PLD] = 30, [xi.job.BRD] = 42, } },
        { spell = xi.magic.spell.CURE_II,  threshold = 100, cost = 0, lvl = { [xi.job.WHM] = 11, [xi.job.RDM] = 14, [xi.job.PLD] = 17, [xi.job.BRD] = 22, } },
        { spell = xi.magic.spell.CURE,     threshold = 35,  cost = 0, lvl = { [xi.job.WHM] = 1,  [xi.job.RDM] = 3,  [xi.job.PLD] = 5,  [xi.job.BRD] = 2,  } },
    },

    REGEN =
    {
        { spell = xi.magic.spell.REGEN_III, effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 66, } }, -- Regen III
        { spell = xi.magic.spell.REGEN_II,  effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 44, } }, -- Regen II
        { spell = xi.magic.spell.REGEN,     effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 21, } }, -- Regen
    },

    RAISE =
    {
        { spell = xi.magic.spell.RAISE_II, power = 3, castTime = 13000, lvl = { [xi.job.WHM] = 75, } }, -- Raise III
        { spell = xi.magic.spell.RAISE_II, power = 2, castTime = 14000, lvl = { [xi.job.WHM] = 56, } }, -- Raise II
        { spell = xi.magic.spell.RAISE,    power = 1, castTime = 15000, lvl = { [xi.job.WHM] = 25, [xi.job.RDM] = 38, [xi.job.PLD] = 50, } }, -- Raise
    }
}

xi.xispal.black =
{
    ELEMENTAL =
    {
        { spell = xi.magic.spell.THUNDER_IV,   hppThreshold = 40, lvl = { [xi.job.BLM] = 66, } },
        { spell = xi.magic.spell.BLIZZARD_IV,  hppThreshold = 40, lvl = { [xi.job.BLM] = 64, } },
        { spell = xi.magic.spell.FIRE_IV,      hppThreshold = 40, lvl = { [xi.job.BLM] = 62, } },
        { spell = xi.magic.spell.AERO_IV,      hppThreshold = 40, lvl = { [xi.job.BLM] = 59, } },
        { spell = xi.magic.spell.WATER_IV,     hppThreshold = 40, lvl = { [xi.job.BLM] = 55, } },
        { spell = xi.magic.spell.STONE_IV,     hppThreshold = 40, lvl = { [xi.job.BLM] = 51, } },
        { spell = xi.magic.spell.THUNDER_III,  hppThreshold = 30, lvl = { [xi.job.BLM] = 66, [xi.job.RDM] = 75 } },
        { spell = xi.magic.spell.BLIZZARD_III, hppThreshold = 30, lvl = { [xi.job.BLM] = 64, [xi.job.RDM] = 73 } },
        { spell = xi.magic.spell.FIRE_III,     hppThreshold = 30, lvl = { [xi.job.BLM] = 62, [xi.job.RDM] = 71 } },
        { spell = xi.magic.spell.AERO_III,     hppThreshold = 30, lvl = { [xi.job.BLM] = 59, [xi.job.RDM] = 69 } },
        { spell = xi.magic.spell.WATER_III,    hppThreshold = 30, lvl = { [xi.job.BLM] = 55, [xi.job.RDM] = 67 } },
        { spell = xi.magic.spell.STONE_III,    hppThreshold = 30, lvl = { [xi.job.BLM] = 51, [xi.job.RDM] = 65 } },
        { spell = xi.magic.spell.THUNDER_II,   hppThreshold = 20, lvl = { [xi.job.BLM] = 46, [xi.job.RDM] = 60 } },
        { spell = xi.magic.spell.BLIZZARD_II,  hppThreshold = 20, lvl = { [xi.job.BLM] = 42, [xi.job.RDM] = 55 } },
        { spell = xi.magic.spell.FIRE_II,      hppThreshold = 20, lvl = { [xi.job.BLM] = 38, [xi.job.RDM] = 50 } },
        { spell = xi.magic.spell.AERO_II,      hppThreshold = 20, lvl = { [xi.job.BLM] = 34, [xi.job.RDM] = 45 } },
        { spell = xi.magic.spell.WATER_II,     hppThreshold = 20, lvl = { [xi.job.BLM] = 30, [xi.job.RDM] = 40 } },
        { spell = xi.magic.spell.STONE_II,     hppThreshold = 20, lvl = { [xi.job.BLM] = 26, [xi.job.RDM] = 35 } },
        { spell = xi.magic.spell.THUNDER,      hppThreshold = 5,  lvl = { [xi.job.BLM] = 22, [xi.job.RDM] = 30 } },
        { spell = xi.magic.spell.BLIZZARD,     hppThreshold = 5,  lvl = { [xi.job.BLM] = 17, [xi.job.RDM] = 25 } },
        { spell = xi.magic.spell.FIRE,         hppThreshold = 5,  lvl = { [xi.job.BLM] = 13, [xi.job.RDM] = 19 } },
        { spell = xi.magic.spell.AERO,         hppThreshold = 5,  lvl = { [xi.job.BLM] = 9,  [xi.job.RDM] = 14 } },
        { spell = xi.magic.spell.WATER,        hppThreshold = 5,  lvl = { [xi.job.BLM] = 5,  [xi.job.RDM] = 9  } },
        { spell = xi.magic.spell.STONE,        hppThreshold = 5,  lvl = { [xi.job.BLM] = 1,  [xi.job.RDM] = 4  } },
    },

    ENFEEBLE =
    {
        [xi.job.BLM] =
        {
            { spell = xi.magic.spell.BURN,      effect = xi.effect.BURN,  immunity = xi.immunity.NONE, lvl = 24, },
            { spell = xi.magic.spell.SHOCK,     effect = xi.effect.SHOCK, immunity = xi.immunity.NONE, lvl = 16, },
            { spell = xi.magic.spell.CHOKE,     effect = xi.effect.CHOKE, immunity = xi.immunity.NONE, lvl = 20, },
        },

        [xi.job.RDM] =
        {
            { spell = xi.magic.spell.SILENCE,   effect = xi.effect.SILENCE,   immunity = xi.immunity.SILENCE,  lvl =  18, },
            { spell = xi.magic.spell.PARALYZE,  effect = xi.effect.PARALYSIS, immunity = xi.immunity.PARALYZE, lvl =  6,  },
            { spell = xi.magic.spell.BLIND,     effect = xi.effect.BLINDNESS, immunity = xi.immunity.BLIND,    lvl =  5,  },
            { spell = xi.magic.spell.DIA_II,    effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl =  31, },
            { spell = xi.magic.spell.DIA,       effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl =  1,  },
            { spell = xi.magic.spell.SLOW,      effect = xi.effect.SLOW,      immunity = xi.immunity.SLOW,     lvl =  13, },
            { spell = xi.magic.spell.POISON_II, effect = xi.effect.POISON,    immunity = xi.immunity.POISON,   lvl =  46, },
            { spell = xi.magic.spell.POISON,    effect = xi.effect.POISON,    immunity = xi.immunity.POISON,   lvl =  8,  },
        },
    },

    DRAIN =
    {
        { spell = xi.magic.spell.DRAIN,                                        lvl = { [xi.job.DRK] = 10, [xi.job.BLM] = 12 } },
        { spell = xi.magic.spell.ASPIR,                                        lvl = { [xi.job.DRK] = 20, [xi.job.BLM] = 25 } },
        { spell = xi.magic.spell.ABSORB_ACC, effect = xi.effect.ACCURACY_DOWN, lvl = { [xi.job.DRK] = 61, }, },
        { spell = xi.magic.spell.ABSORB_TP,                                    lvl = { [xi.job.DRK] = 45, }, },
        { spell = xi.magic.spell.ABSORB_STR, effect = xi.effect.STR_DOWN,      lvl = { [xi.job.DRK] = 43, }, },
        { spell = xi.magic.spell.ABSORB_DEX, effect = xi.effect.DEX_DOWN,      lvl = { [xi.job.DRK] = 41, }, },
        { spell = xi.magic.spell.ABSORB_VIT, effect = xi.effect.VIT_DOWN,      lvl = { [xi.job.DRK] = 35, }, },
    }
}

xi.xispal.ninjutsu =
{
    UTSUSEMI = -- Utsusemi
    {
        { spell = xi.magic.spell.UTSUSEMI_NI,   effect = xi.effect.COPY_IMAGE, lvl = 37, recast = 60},
        { spell = xi.magic.spell.UTSUSEMI_ICHI, effect = xi.effect.COPY_IMAGE, lvl = 11, recast = 40},
    },
    WHEEL = -- Elemental Wheel
    {
        [1] =
        {
            { spell = xi.magic.spell.SUITON_SAN, lvl = 75, recast = 55, },
            { spell = xi.magic.spell.RAITON_SAN, lvl = 75, recast = 55, },
            { spell = xi.magic.spell.DOTON_SAN,  lvl = 75, recast = 55, },
            { spell = xi.magic.spell.HUTON_SAN,  lvl = 75, recast = 55, },
            { spell = xi.magic.spell.HYOTON_SAN, lvl = 75, recast = 55, },
            { spell = xi.magic.spell.KATON_SAN,  lvl = 75, recast = 55, },
        },

        [2] =
        {
            { spell = xi.magic.spell.SUITON_NI, lvl = 40, recast = 55, },
            { spell = xi.magic.spell.RAITON_NI, lvl = 40, recast = 55, },
            { spell = xi.magic.spell.DOTON_NI,  lvl = 40, recast = 55, },
            { spell = xi.magic.spell.HUTON_NI,  lvl = 40, recast = 55, },
            { spell = xi.magic.spell.HYOTON_NI, lvl = 40, recast = 55, },
            { spell = xi.magic.spell.KATON_NI,  lvl = 40, recast = 55, },
        },

        [3] =
        {
            { spell = xi.magic.spell.SUITON_ICHI, lvl = 15, recast = 55, },
            { spell = xi.magic.spell.RAITON_ICHI, lvl = 15, recast = 55, },
            { spell = xi.magic.spell.DOTON_ICHI,  lvl = 15, recast = 55, },
            { spell = xi.magic.spell.HUTON_ICHI,  lvl = 15, recast = 55, },
            { spell = xi.magic.spell.HYOTON_ICHI, lvl = 15, recast = 55, },
            { spell = xi.magic.spell.KATON_ICHI,  lvl = 15, recast = 55, },
        },
    },
}

xi.xispal.songs =
{
    [1] =
    {
        { spell = xi.magic.spell.MAGES_BALLAD_II, potency = 2, effect = xi.effect.BALLAD, lvl = 55, },
        { spell = xi.magic.spell.MAGES_BALLAD,    potency = 2, effect = xi.effect.BALLAD, lvl = 25, },
    },
    [2] =
    {
        { spell = xi.magic.spell.BLADE_MADRIGAL, potency = 2, effect = xi.effect.MADRIGAL, lvl = 51, },
        { spell = xi.magic.spell.SWORD_MADRIGAL, potency = 1, effect = xi.effect.MADRIGAL, lvl = 11, },
    },
    [3] =
    {
        { spell = xi.magic.spell.VALOR_MINUET_IV,  potency = 4, effect = xi.effect.MINUET, lvl = 63, },
        { spell = xi.magic.spell.VALOR_MINUET_III, potency = 3, effect = xi.effect.MINUET, lvl = 43, },
        { spell = xi.magic.spell.VALOR_MINUET_II,  potency = 2, effect = xi.effect.MINUET, lvl = 23, },
        { spell = xi.magic.spell.VALOR_MINUET,     potency = 1, effect = xi.effect.MINUET, lvl = 3, },
    },
    [4] =
    {
        { spell = xi.magic.spell.VICTORY_MARCH,   potency = 2, effect = xi.effect.MARCH, lvl = 60, },
        { spell = xi.magic.spell.ADVANCING_MARCH, potency = 1, effect = xi.effect.MARCH, lvl = 29, },
    },
    [5] =
    {
        { spell = xi.magic.spell.ARMYS_PAEON_V,   potency = 5, effect = xi.effect.PAEON, lvl = 65, },
        { spell = xi.magic.spell.ARMYS_PAEON_IV,  potency = 4, effect = xi.effect.PAEON, lvl = 45, },
        { spell = xi.magic.spell.ARMYS_PAEON_III, potency = 3, effect = xi.effect.PAEON, lvl = 35, },
        { spell = xi.magic.spell.ARMYS_PAEON_II,  potency = 2, effect = xi.effect.PAEON, lvl = 15, },
        { spell = xi.magic.spell.ARMYS_PAEON,     potency = 1, effect = xi.effect.PAEON, lvl = 5,  },
    },
    [6] =
    {
        { spell = xi.magic.spell.KNIGHTS_MINNE_IV,  potency = 4, effect = xi.effect.MINNE, lvl = 61, },
        { spell = xi.magic.spell.KNIGHTS_MINNE_III, potency = 3, effect = xi.effect.MINNE, lvl = 41, },
        { spell = xi.magic.spell.KNIGHTS_MINNE_II,  potency = 2, effect = xi.effect.MINNE, lvl = 21, },
        { spell = xi.magic.spell.KNIGHTS_MINNE,     potency = 1, effect = xi.effect.MINNE, lvl = 1,  },
    },
    [10] =
    {
        { spell = xi.magic.spell.CARNAGE_ELEGY,     effect = xi.effect.ELEGY,          lvl = 59, },
        { spell = xi.magic.spell.BATTLEFIELD_ELEGY, effect = xi.effect.ELEGY,          lvl = 39, },

        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.DEFENSE_BOOST,  lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.ATTACK_BOOST,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.EVASION_BOOST,  lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.ACCURACY_BOOST, lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.BLAZE_SPIKES,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.ICE_SPIKES,     lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.SHOCK_SPIKES,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE,      effect = xi.effect.ACCURACY_BOOST, lvl = 33, },

    },
    [11] = -- Mazurka
    {
        { spell = xi.magic.spell.CHOCOBO_MAZURKA, effect = xi.effect.MAZURKA, lvl = 73, },
        { spell = xi.magic.spell.RAPTOR_MAZURKA,  effect = xi.effect.MAZURKA, lvl = 37, },
    },
}


xi.xispal.raisePlayer = function(pal, player)
    local job = pal:getMainJob()
    local lvl = pal:getMainLvl()

    if
        pal:getLocalVar('isCasting') == 1 or
        player:hasRaiseTractorMenu() or
        pal:getCurrentAction() == xi.action.MAGIC_CASTING
    then
        return
    end

    if pal:hasStatusEffect(xi.effect.HEALING) then
        pal:delStatusEffect(xi.effect.HEALING)
        return
    end

    if player and player:isDead() and pal:getMP() > 150 then
        pal:setLocalVar('isCasting', 1)
        pal:setAnimation(0)

        local spell = nil
        for _, raise in pairs(xi.xispal.white.RAISE) do
            if raise.lvl[job] and lvl >= raise.lvl[job] then
                spell = raise
            end
        end

        if spell and pal:checkDistance(player) <= 20 then
            pal:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_START)
            pal:timer(spell.castTime, function(palArg)
                palArg:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_STOP)
                palArg:independentAnimation(player, spell.spell, 0)

                player:sendRaise(spell.power)
                palArg:setMP(palArg:getMP() - 150)

                palArg:timer(20 * 1000, function(palArg2)
                    palArg2:setLocalVar('isCasting', 0)
                end)
            end)
        end
    end
end


xi.xispal.checkNa = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getMPP() < 5 then
        return
    end

    local spells    = xi.xispal.white.NA
    local na        = nil
    local target    = nil
    local extraTime = 0
    local mp        = pal:getMP()

    -- Dump if a player is in need of a cure
    for _, member in pairs(party) do
        if member:getHPP() < 50 then
            return
        end
    end

    for _, member in pairs(party) do
        for _, spell in pairs(spells) do
            local spellObject = GetSpell(spell.spell)

            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                member:hasStatusEffect(spell.effect) and
                spellObject and mp >= spellObject:getMPCost()
            then
                na = spell.spell
                target = member
                break
            end
        end
    end

    if target and na then
        xi.xispal.castSpell(pal, na, target, job, extraTime)
        return
    end
end

xi.xispal.checkRegen = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) then
        return
    end
    local spells    = xi.xispal.white.REGEN
    local target    = nil
    local regen     = nil
    local extraTime = 0
    local mp        = pal:getMP()

    -- First loop through to see if anyone is in dire need of cure, if so skip regen and wait for the next check
    for _, member in pairs(party) do
        if member:getHPP() < 50 then
            return
        end
    end

    for _, member in pairs(party) do
        if member:isAlive() and pal:checkDistance(member) <= 20 then
            for _, spell in pairs(spells) do
                local spellObject = GetSpell(spell.spell)

                -- First check if we can cast this spell
                if
                    spell.lvl[job] and lvl >= spell.lvl[job] and
                    spellObject and mp >= spellObject:getMPCost()
                then
                    if
                        not member:hasStatusEffect(xi.effect.REGEN) and
                        member:getHPP() < 95
                    then
                        regen = spell.spell
                        target = member
                        break -- Break searching for the spell to cast
                    end
                end
            end
        end
    end

    if target and regen then
        xi.xispal.castSpell(pal, regen, target, job, extraTime)
        return
    end
end

xi.xispal.checkCure = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) then
        return
    end

    local spells    = xi.xispal.white.CURE
    local target    = nil
    local cure      = nil
    local extraTime = 0
    local mp        = pal:getMP()

    
    
    for _, member in pairs(party) do
        if member:isAlive() and pal:checkDistance(member) <= 20 then
            local hasRegen = member:hasStatusEffect(xi.effect.REGEN)
            -- For each member, check if they need a cure
            for _, spell in pairs(spells) do
                local spellObject = GetSpell(spell.spell)
                
                -- First check if we can cast this spell
                if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                spellObject and mp >= spellObject:getMPCost()
                then
                    local threshold = spell.threshold

                    -- Don't cure bomb while there is no combat. Let regen do the work
                    if not xi.xispal.getTarget(pal) then
                        threshold = threshold * 3
                    end

                    -- Ignore Cure I over lvl 30
                    if lvl > 30 and spell.spell == xi.magic.spell.CURE then
                        break
                    end

                    -- Jobs other than whm will heal with more specific behaviors
                    if job == xi.job.RDM then
                        threshold = threshold * 1.5
                        extraTime = 5
                    elseif job == xi.job.PLD and member ~= pal then
                        extraTime = 10
                        threshold = threshold * 2
                    elseif job ~= xi.job.WHM then -- All other jobs
                        threshold = threshold * 3
                        extraTime = 12
                    end

                    -- Prioritize less if they have regen
                    if hasRegen then
                        threshold = threshold * 1.5
                    end

                    -- Prioritize less if they're resting
                    if member:getLocalVar('[XISP]isResting') == 1 then
                        threshold = threshold * 2
                    end

                    if member:getMaxHP() - member:getHP() > threshold then
                        cure   = spell.spell
                        target = member
                        break -- Break searching for the spell to cast
                    end
                end
            end
        end

        if target and cure then
            xi.xispal.castSpell(pal, cure, target, job, extraTime)
            return
        end
    end
end


xi.xispal.checkStun = function(pal, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getLocalVar('stunRecast') > GetSystemTime() then
        return
    end

    local target = xi.xispal.getTarget(pal)
    local flag   = false
    local job    = pal:getMainJob()

    if job == xi.job.DRK and lvl < 37 then
        return
    elseif job == xi.job.BLM and lvl < 45 then
        return
    end

    if target then
        local currAction = target:getCurrentAction()

        if currAction == xi.action.category.MAGIC_CASTING then
            flag = true
        end

        if flag then
            pal:setLocalVar('stunRecast', GetSystemTime() + 45)
            xi.xispal.castSpell(pal, xi.magic.spell.STUN, target, job)
            return
        end
    end
end


xi.xispal.checkDrain = function(pal, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getLocalVar('drainRecast') > GetSystemTime() then
        return
    end

    local spells    = xi.xispal.black.DRAIN
    local target    = xi.xispal.getTarget(pal)
    local drain     = nil
    local spellObj  = nil
    local specTime  = 60
    local extraTime = 0
    local mp        = pal:getMP()
    local mpp       = pal:getMPP()
    local hpp       = pal:getHPP()

    if target == nil then
        return
    end

    for _, spell in pairs(spells) do
        local spellObject  = GetSpell(spell.spell)
        local job          = pal:getMainJob()

        if
            spell.lvl[job] and lvl >= spell.lvl[job] and
            pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
            spellObject and mp >= spellObject:getMPCost()
        then
            if spell.spell == xi.magic.spell.DRAIN and hpp < 90 and not target:isUndead() then
                drain = spell.spell
                break
            end

            if
                spell.spell == xi.magic.spell.ASPIR and
                mpp < 75 and target:getMP() > 50 and
                not target:isUndead()
            then
                drain = spell.spell
                break
            end

            if
                spell.spell == xi.magic.spell.ABSORB_TP and
                pal:getTP() < 1000 and target:getTP() > 250
            then
                drain = spell.spell
                break
            end

            if spell.effect and not target:hasStatusEffect(spell.effect) then
                drain = spell.spell
            end
        end
    end

    if drain then
        pal:setLocalVar('spellRecast' .. drain, GetSystemTime() + specTime)
        pal:setLocalVar('drainRecast', GetSystemTime() + 15)
        xi.xispal.castSpell(pal, drain, target, job, extraTime)
        return
    end
end


-- Logic:
-- Each round to determine which spell to cast will do the following:
-- First check if we can cast the spell or not, then next is to see the recommended
-- HPP threshold in which we should be casting. We will then build a table until
-- we have 6 or less spells, then cast one of the spells at random.
xi.xispal.checkElemental = function(pal, player, job, lvl)
    if
        xi.xispal.checkCast(pal) or
        (job == xi.job.RDM and pal:getMPP() < 60) or
        (job == xi.job.BLM and pal:getMPP() < 30) or
        pal:getLocalVar('elementalRecast') > GetSystemTime()
    then
        return
    end

    local target = xi.xispal.getTarget(pal)

    if target == nil then
        return
    end

    local hpp       = target:getHPP()
    local maxSpells = 6
    local spells    = {}
    local mp        = pal:getMP()

    for _, spell in pairs(xi.xispal.black.ELEMENTAL) do
        local spellObject = GetSpell(spell.spell)
        local threshold = math.max(5, spell.hppThreshold - target:getMainLvl() / 10)

        if #spells >= maxSpells then
            break
        else
            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                hpp >= threshold and
                spellObject and mp >= spellObject:getMPCost()
            then
                table.insert(spells, spell.spell)
            end
        end
    end

    local spellToCast = spells[math.random(1, #spells)]

    if target and spellToCast then
        local recast    = math.random(34, 38)
        local extraTime = 5

        if job == xi.job.RDM then
            recast = math.random(50, 60)
        end

        xi.xispal.castSpell(pal, spellToCast, target, job, extraTime)
        pal:setLocalVar('elementalRecast', GetSystemTime() + recast)
        return
    end
end


-- Enfeeble casting will go through all possible spells to be cast, then
-- cast one at random from the needed list.
xi.xispal.checkEnfeeble = function(pal, job, lvl)
    local target = xi.xispal.getTarget(pal)

    if
        xi.xispal.checkCast(pal) or
        target == nil or pal:getMPP() < 25 or
        pal:getLocalVar('enfeebRecast') > GetSystemTime()
    then
        return
    end

    -- Dump if a player is in need of a cure
    for _, member in pairs(pal:getMaster():getPartyWithTrusts()) do
        if member:getHPP() < 50 then
            return
        end
    end

    local table     = xi.xispal.black.ENFEEBLE[job]
    local extraTime = 0
    local specTime  = 0 -- Used by DRK
    local enfeeb    = nil
    local flag      = true
    local mp        = pal:getMP()

    if table then
        if job == xi.job.RDM or job == xi.job.BLM then
            for _, spell in pairs(table) do
                local spellObject = GetSpell(spell.spell)

                if spell.spell == xi.magic.spell.SILENCE and not target:hasSpellList() then
                    flag = false
                end

                if
                    pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
                    not target:getStatusEffect(spell.effect) and
                    not target:hasImmunity(spell.immunity) and
                    lvl >= spell.lvl and -- Check level
                    flag == true and
                    spellObject and mp >= spellObject:getMPCost()
                then
                    enfeeb = spell.spell
                    break
                end
            end

        elseif job == xi.job.DRK then
            for _, spell in pairs(table) do
                local spellObject = GetSpell(spell.spell)

                if
                    pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
                    spell.lvl[job] and lvl >= spell.lvl[job] and
                    spellObject and mp >= spellObject:getMPCost()
                then

                    if -- Special case for absorb TP
                        spell.spell == xi.magic.spell.ABSORB_TP and
                        pal:getTP() < 1000
                    then
                        specTime = 30 -- Casts absorb TP much more often
                        enfeeb = spell.spell
                        break
                    else
                        if not target:hasStatusEffect(spell.effect) then
                            specTime = 300 -- Only casts each absorb every 5 minutes
                            enfeeb = spell.spell
                            break
                        end
                    end
                end
            end
        end
    end

    if target and enfeeb then
        pal:setLocalVar('spellRecast' .. enfeeb, GetSystemTime() + math.random(15, 20) + specTime)
        pal:setLocalVar('enfeebRecast', GetSystemTime() + math.random(10, 15))
        xi.xispal.castSpell(pal, enfeeb, target, job, extraTime)
        return
    end
end


xi.xispal.checkBuff = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getLocalVar('buffTimer') > GetSystemTime() then
        return
    end

    local spells    = xi.xispal.white.BUFF
    local buff      = nil
    local target    = nil
    local specTime  = 30
    local extraTime = 0
    local mp        = pal:getMP()

    -- Dump if a player is in need of a cure
    for _, member in pairs(party) do
        if member:getHPP() < 50 then
            return
        end
    end

    for _, member in pairs(party) do
        for _, spell in pairs(spells) do
            local spellControl = true
            local spellObject  = GetSpell(spell.spell)
            local memberJob    = member:getMainJob()

            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
                not member:hasStatusEffect(spell.effect) and
                spellObject and mp >= spellObject:getMPCost()
            then
                -- Don't cast refresh on 100% MP targets
                if
                    spell.spell == xi.magic.spell.REFRESH and
                    (member:getMPP() >= 95 or member:getMaxMP() < 75)
                then
                    spellControl = false
                end

                -- Don't cast combat only buffs on targets that aren't engaged
                if spell.combatOnly and not member:isEngaged() then
                    spellControl = false
                end

                -- Only cast self only spells on ourselves
                if spell.selfOnly and member ~= pal then
                    spellControl = false
                end

                -- Only cast stoneskin / blink if we're the target
                if
                    xi.xispal.getTarget(pal) and
                    (spell.spell == xi.magic.spell.STONESKIN or
                    spell.spell == xi.magic.spell.BLINK)
                then
                    if xi.xispal.getTarget(pal):getTarget() ~= pal then
                        spellControl = false
                    end
                end

                if spell.spell == xi.magic.spell.HASTE then
                    if
                        memberJob == xi.job.WHM or memberJob == xi.job.BLM or
                        memberJob == xi.job.SMN or memberJob == xi.job.RNG or
                        memberJob == xi.job.SCH or memberJob == xi.job.BRD
                    then
                        spellControl = false
                    end
                end

                if spellControl == true then
                    buff = spell.spell
                    target = member
                end

                if target then break end
            end
        end

        if target then break end
    end

    if target and buff then
        pal:setLocalVar('spellRecast' .. buff, GetSystemTime() + specTime)
        pal:setLocalVar('buffTimer', GetSystemTime() + math.random(10, 20))
        xi.xispal.castSpell(pal, buff, target, job, extraTime)
        return
    end
end


xi.xispal.checkSongs = function(pal, party, job, lvl, player)
    if xi.xispal.checkCast(pal) then
        return
    end

    local target = xi.xispal.getTarget(pal)

    -- Only cast near player
    if pal:checkDistance(player) > 9 then
        return
    end

    -- Combat
    if target then
        local song1  = player:getCharVar('[XISP]bardSongs1')
        local song2  = player:getCharVar('[XISP]bardSongs2')

        if song1 == 0 then
            song1 = 1
        end

        if song2 == 0 then
            song2 = 4
        end

        local table1 = xi.xispal.songs[song1]
        local table2 = xi.xispal.songs[song2]

        -- Buffs first
        if pal:getLocalVar('buffRecast') < GetSystemTime() then
            if pal:getLocalVar('table1Recast') < GetSystemTime() then
                for _, song in pairs(table1) do
                    if lvl >= song.lvl and pal:getLocalVar('spellRecast .. song.spell') < GetSystemTime() then
                        pal:setLocalVar('buffRecast', GetSystemTime() + 25)
                        pal:setLocalVar('table1Recast', GetSystemTime() + 95)
                        xi.xispal.castSpell(pal, song.spell, pal, job, 5)
                        return
                    end
                end
            end

            if pal:getLocalVar('table2Recast') < GetSystemTime() then
                local flag = false
                for _, song in pairs(table2) do
                    if lvl >= song.lvl then
                        -- Skipper upper song if doubling songs (This will only flag once and for the upper most song)
                        if song1 == song2 and flag == false then
                            flag = true
                            goto skip
                        end

                        pal:setLocalVar('buffRecast', GetSystemTime() + 25)
                        pal:setLocalVar('table2Recast', GetSystemTime() + 95)
                        xi.xispal.castSpell(pal, song.spell, pal, job, 5)
                        return
                    end
                    ::skip::
                end
            end
        end

        -- Debuffs
        if pal:getLocalVar('enfeebleRecast') < GetSystemTime() then
            for _, song in pairs(xi.xispal.songs[10]) do
                if lvl >= song.lvl then
                    if song.effect == xi.effect.ELEGY then
                        if target:hasStatusEffect(song.effect) then
                            pal:setLocalVar('enfeebleRecast', GetSystemTime() + 25)
                            xi.xispal.castSpell(pal, song.spell, target, job, 5)
                            return
                        end
                    elseif target:hasStatusEffect(song.effect) then
                        pal:setLocalVar('enfeebleRecast', GetSystemTime() + 25)
                        xi.xispal.castSpell(pal, song.spell, target, job, 5)
                        return
                    end
                end
            end
        end

    -- Roaming
    else
        -- Mazurkas
        for _, song in pairs(xi.xispal.songs[11]) do
            if
                lvl >= song.lvl and not pal:hasStatusEffect(song.effect) and
                pal:getZone():getTypeMask() ~= xi.zoneType.DUNGEON
            then
                xi.xispal.castSpell(pal, song.spell, pal, job, 10)
                return
            end
        end
    end
end


xi.xispal.checkNinjutsu = function(pal, job, lvl)
    if xi.xispal.checkCast(pal) then
        return
    end

    for _, spell in pairs(xi.xispal.ninjutsu.UTSUSEMI) do -- Shadows
        if
            pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
            not pal:hasStatusEffect(spell.effect) and
            lvl >= spell.lvl
        then
            pal:setLocalVar('spellRecast' .. spell.spell, GetSystemTime() + spell.recast)
            xi.xispal.castSpell(pal, spell.spell, pal, job, 0)
            return
        end
    end

    local target = xi.xispal.getTarget(pal)

    if pal:getLocalVar('wheelRecast') > GetSystemTime() or not target then
        return
    end

    local tier = 3

    if lvl == 75 then
        tier = 1
    elseif lvl >= 40 then
        tier = 2
    end

    local wheelTable = xi.xispal.ninjutsu.WHEEL[tier]

    for _, spell in pairs(wheelTable) do -- Elemental Wheel
        if
            pal:getLocalVar('spellRecast' .. spell.spell) < GetSystemTime() and
            lvl >= spell.lvl and target
        then
            pal:setLocalVar('spellRecast' .. spell.spell, GetSystemTime() + spell.recast)
            pal:setLocalVar('wheelRecast', GetSystemTime() + 6)
            xi.xispal.castSpell(pal, spell.spell, target, job, 0)
            return
        end
    end
end


-- Each casting class has their own priorty of casting, therefore it was more
-- simple to just do if statements or switch based on the pal's job
xi.xispal.checkMagic = function(pal, player)
    if
        xi.xispal.checkCast(pal) or
        (pal:getMPP() < 40 and pal:getCurrentAction() == xi.action.ROAMING)
    then
        return
    end

    local party  = player:getPartyWithTrusts()
    local job    = pal:getMainJob()
    local lvl    = pal:getMainLvl()


    if job == xi.job.WHM then
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkRegen(pal, party, job, lvl)
        xi.xispal.checkCure(pal, party, job, lvl)
        xi.xispal.checkBuff(pal, party, job, lvl)

    elseif job == xi.job.PLD then
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkCure(pal, party, job, lvl)

    elseif job == xi.job.RDM then
        local hasWHM = false

        for _, member in pairs(party) do
            if member:getMainJob() == xi.job.WHM then
                hasWHM = true
            end
        end

        xi.xispal.checkBuff(pal, party, job, lvl)
        xi.xispal.checkEnfeeble(pal, job, lvl)

        -- RDM only uses regen if the party doesn't have a WHM
        if not hasWHM then
            xi.xispal.checkRegen(pal, party, job, lvl)
        end

        xi.xispal.checkCure(pal, party, job, lvl)
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)

    elseif job == xi.job.BLM then
        xi.xispal.checkStun(pal, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)
        xi.xispal.checkDrain(pal, job, lvl)

    elseif job == xi.job.DRK then
        xi.xispal.checkStun(pal, job, lvl)
        xi.xispal.checkDrain(pal, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)

    elseif job == xi.job.BRD then
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkSongs(pal, party, job, lvl, player)
        xi.xispal.checkCure(pal, party, job, lvl)

    elseif job == xi.job.NIN then
        xi.xispal.checkNinjutsu(pal, job, lvl)
    end
end


xi.xispal.castSpell = function(pal, spell, target, job, extraTime)
    local pos = pal:getPos()
    pal:pathTo(pos.x, pos.y, pos.z) -- Stop pal in their tracks

    pal:setLocalVar('[XISP]canRest', GetSystemTime() + 12)
    xi.xispal.setRecast(pal, job, extraTime)

    -- Add a small timer here to prevent sliding while casting
    pal:timer(250, function(palArg)
        -- Add a small delay to cast if pal was resting
        if xi.xispal.stopResting(palArg) then
            palArg:timer(1500, function(palArg2)
                palArg2:castSpell(spell, target)
            end)
        else
            palArg:castSpell(spell, target)
        end
    end)
end


xi.xispal.checkCast = function(pal)
    return pal:getCurrentAction() == xi.action.MAGIC_CASTING or pal:getLocalVar('[XISP]spellRecast') > GetSystemTime()
end


-- Sets the speed in which a pal casts spells. This is based on their job
-- The var extraTime allows fluctuation if needed (say a pal is weakened or low HP
-- and doesn't want to pull more agro, they don't have stoneskin up, etc.)
xi.xispal.setRecast = function(pal, job, extraTime)
    if extraTime == nil then
        extraTime = 0
    end

    local jobTable =
    {
        [xi.job.WHM] = 5,
        [xi.job.RDM] = 7,
        [xi.job.PLD] = 10,
        [xi.job.BLM] = 15,
        [xi.job.DRK] = 15,
        [xi.job.NIN] = 5,
        [xi.job.BRD] = 15,
    }

    pal:setLocalVar('[XISP]spellRecast', jobTable[job] + GetSystemTime() + extraTime)
end


xi.xispal.getTarget = function(pal)
    if pal:isEngaged() then
        return pal:getTarget()
    end

    if pal:getLocalVar('currentTarget') == 0 then
        return nil
    end

    local target = GetMobByID(pal:getLocalVar('currentTarget'))

    if target then
        if target:isAlive() then
            return target
        else
            pal:setLocalVar('currentTarget', 0)
        end
    else
        return nil
    end
end
