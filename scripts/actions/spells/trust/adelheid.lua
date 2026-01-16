-----------------------------------
-- Trust: Adelheid
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Adelheid
    if caster:getEminenceProgress(936) then
        xi.roe.onRecordTrigger(caster, 936)
    end

    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    local lvl = mob:getMainLvl()

    -------------------------------------------------
    -- QoL / Behavior tuning
    -------------------------------------------------
    mob:addMod(xi.mod.REFRESH, 2) -- Refresh +2

    -- Magic Attack Bonus +10
    mob:addMod(xi.mod.MAGIC_ATK_BONUS, 50)

    -- Reduce hate generation (tune: -15 mild, -25 solid, -40 very safe)
    mob:addMod(xi.mod.ENMITY, -45)

    -------------------------------------------------
    -- SCH Job Abilities (Level-gated)
    -------------------------------------------------
    if lvl >= 10 then
        mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.DARK_ARTS }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.DARK_ARTS })
    end

    if lvl >= 30 then
        mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.ADDENDUM_BLACK }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.ADDENDUM_BLACK })
    end

    -------------------------------------------------
    -- Interrupts (highest priority)
    -------------------------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })

    -------------------------------------------------
    -- Healing (priority; keep party alive)
    -------------------------------------------------
    mob:addGambit(ai.t.TANK,  { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 33 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -------------------------------------------------
    -- MP tools (keeps nuking sustainable)
    -------------------------------------------------
    if lvl >= 36 then
        -- When MP gets low, refill
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_LT, 40 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ASPIR }, 8)
    end

    if lvl >= 21 then
        mob:addGambit(ai.t.TARGET, { ai.c.HPP_LT, 80 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DRAIN }, 20)
    end

    -------------------------------------------------
    -- Addendum: Black utility (keep but not spammy)
    -------------------------------------------------
    if lvl >= 30 then
        mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SLEEP }, 25)
    end

    if lvl >= 32 then
        mob:addGambit(ai.t.TARGET, { ai.c.TARGET_HAS_BUFF, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL }, 25)
    end

    if lvl >= 65 then
        mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SLEEP_II }, 30)
    end

    -------------------------------------------------
    -- FAST, MP-GATED Elemental Nuking (explicit spells)
    -- This is the key change: short recast + MP thresholds.
    -------------------------------------------------
    local function addFastNukes(spStone, spWater, spAero, spFire, spBliz, spThun, mppMin, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spStone }, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spWater }, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spAero  }, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spFire  }, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spBliz  }, recast)
        mob:addGambit(ai.t.TARGET, { ai.c.MPP_GT, mppMin }, { ai.r.MA, ai.s.SPECIFIC, spThun  }, recast)
    end

    -- These values are tuned to “cast often but not go OOM”
    if lvl >= 70 then
        -- Tier IV: only when MP is healthy
        addFastNukes(
            xi.magic.spell.STONE_IV, xi.magic.spell.WATER_IV, xi.magic.spell.AERO_IV,
            xi.magic.spell.FIRE_IV,  xi.magic.spell.BLIZZARD_IV, xi.magic.spell.THUNDER_IV,
            55, 6
        )
    elseif lvl >= 54 then
        -- Tier III: common damage tier
        addFastNukes(
            xi.magic.spell.STONE_III, xi.magic.spell.WATER_III, xi.magic.spell.AERO_III,
            xi.magic.spell.FIRE_III,  xi.magic.spell.BLIZZARD_III, xi.magic.spell.THUNDER_III,
            45, 6
        )
    elseif lvl >= 30 then
        -- Tier II: very active
        addFastNukes(
            xi.magic.spell.STONE_II, xi.magic.spell.WATER_II, xi.magic.spell.AERO_II,
            xi.magic.spell.FIRE_II,  xi.magic.spell.BLIZZARD_II, xi.magic.spell.THUNDER_II,
            40, 7
        )
    elseif lvl >= 4 then
        -- Tier I: active at low levels, but keep MP > 35%
        addFastNukes(
            xi.magic.spell.STONE, xi.magic.spell.WATER, xi.magic.spell.AERO,
            xi.magic.spell.FIRE,  xi.magic.spell.BLIZZARD, xi.magic.spell.THUNDER,
            35, 8
        )
    end

    -------------------------------------------------
    -- Storm / Helix (DE-PRIORITIZED to prevent “utility lock”)
    -------------------------------------------------
    -- Storm occasionally
    mob:addGambit(ai.t.SELF, { ai.c.NO_STORM, 0 }, { ai.r.MA, ai.s.STORM_DAY, 0 }, 600)

    -- Helix occasionally (long recast to avoid crowding nukes)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.HELIX }, { ai.r.MA, ai.s.HELIX_DAY, 0 }, 180)

    -------------------------------------------------
    -- Weapon skill listener (keep)
    -------------------------------------------------
    mob:addListener('WEAPONSKILL_USE', 'ADELHEID_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3469 then -- Twirling Dervish
            if math.random(1, 100) <= 33 then
                xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
            end
        end
    end)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject