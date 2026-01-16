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

    -------------------------------------------------
    -- SAFE helpers (prevents nil crashes across forks)
    -------------------------------------------------
    local function safeAddMod(modId, value)
        if modId ~= nil and value ~= nil then
            mob:addMod(modId, value)
        end
    end

    local function safeAddGambit(targetType, cond, action, weight)
        -- Ensure required tables exist
        if not (ai and ai.t and ai.c and ai.r and ai.s) then
            return
        end
        if targetType == nil or cond == nil or action == nil or weight == nil then
            return
        end
        -- For SPECIFIC spell gambits, action[3] must be numeric
        if action[3] == nil then
            return
        end

        mob:addGambit(targetType, cond, action, weight)
    end

    -------------------------------------------------
    -- Your tuning (mods only) - SAFE across forks
    -------------------------------------------------
    if xi.mod then
        safeAddMod(xi.mod.REFRESH, 2) -- Refresh +2

        -- Some forks use MAGIC_ATK_BONUS, others use MATT
        if xi.mod.MAGIC_ATK_BONUS then
            safeAddMod(xi.mod.MAGIC_ATK_BONUS, 150)
        elseif xi.mod.MATT then
            safeAddMod(xi.mod.MATT, 150)
        end

        safeAddMod(xi.mod.ENMITY, -95) -- Enmity -95
    end

    -------------------------------------------------
    -- Arts / Addendum (FIXED so it doesn't JA-spam)
    -- (also guarded so missing enums don't crash)
    -------------------------------------------------
    if xi.effect and xi.effect.DARK_ARTS and xi.ja and xi.ja.DARK_ARTS then
        safeAddGambit(
            ai.t.SELF,
            { ai.c.NOT_STATUS, xi.effect.DARK_ARTS },
            { ai.r.JA, ai.s.SPECIFIC, xi.ja.DARK_ARTS },
            5
        )
    end

    if xi.effect and xi.effect.ADDENDUM_BLACK and xi.ja and xi.ja.ADDENDUM_BLACK then
        safeAddGambit(
            ai.t.SELF,
            { ai.c.NOT_STATUS, xi.effect.ADDENDUM_BLACK },
            { ai.r.JA, ai.s.SPECIFIC, xi.ja.ADDENDUM_BLACK },
            5
        )
    end

    -------------------------------------------------
    -- Interrupt / Control (keep high priority)
    -------------------------------------------------
    if xi.magic and xi.magic.spell and xi.magic.spell.STUN then
        safeAddGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
        safeAddGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
        safeAddGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
        safeAddGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 },  { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
    end

    -------------------------------------------------
    -- Storms / Helix (keep your existing behavior)
    -------------------------------------------------
    -- Storms matching day
    if ai.s and ai.s.STORM_DAY then
        safeAddGambit(ai.t.SELF, { ai.c.NO_STORM, 0 }, { ai.r.MA, ai.s.STORM_DAY, 0 }, 20)
    end

    -- Helix matching day (requires HELIX status enum)
    if xi.effect and xi.effect.HELIX and ai.s and ai.s.HELIX_DAY then
        safeAddGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.HELIX }, { ai.r.MA, ai.s.HELIX_DAY, 0 }, 15)
    end

    -------------------------------------------------
    -- Healing (keep high-ish priority)
    -------------------------------------------------
    if xi.magic and xi.magic.spellFamily and xi.magic.spellFamily.CURE then
        safeAddGambit(ai.t.TANK,  { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }, 85)
        safeAddGambit(ai.t.PARTY, { ai.c.HPP_LT, 33 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }, 90)
    end

    -------------------------------------------------
    -- OFFENSE: Elemental nukes more often (SPECIFIC, fork-safe)
    -------------------------------------------------
    local combatCond
    if ai.c and ai.c.IN_COMBAT then
        combatCond = { ai.c.IN_COMBAT, 0 }
    else
        combatCond = { ai.c.ALWAYS, 0 }
    end

    local function addElementNukes(spellTable, weight)
        if not (xi.magic and xi.magic.spell) then
            return
        end
        for _, spellId in ipairs(spellTable) do
            if spellId then
                safeAddGambit(
                    ai.t.TARGET,
                    combatCond,
                    { ai.r.MA, ai.s.SPECIFIC, spellId },
                    weight
                )
                weight = math.max(1, weight - 1)
            end
        end
    end

    if xi.magic and xi.magic.spell then
        local s = xi.magic.spell

        -- Highest -> lowest tiers; nil entries are skipped safely
        addElementNukes({ s.FIRE_VI,     s.FIRE_V,     s.FIRE_IV,     s.FIRE_III,     s.FIRE_II,     s.FIRE },     70)
        addElementNukes({ s.BLIZZARD_VI, s.BLIZZARD_V, s.BLIZZARD_IV, s.BLIZZARD_III, s.BLIZZARD_II, s.BLIZZARD }, 69)
        addElementNukes({ s.THUNDER_VI,  s.THUNDER_V,  s.THUNDER_IV,  s.THUNDER_III,  s.THUNDER_II,  s.THUNDER },  68)
        addElementNukes({ s.AERO_VI,     s.AERO_V,     s.AERO_IV,     s.AERO_III,     s.AERO_II,     s.AERO },     67)
        addElementNukes({ s.WATER_VI,    s.WATER_V,    s.WATER_IV,    s.WATER_III,    s.WATER_II,    s.WATER },    66)
        addElementNukes({ s.STONE_VI,    s.STONE_V,    s.STONE_IV,    s.STONE_III,    s.STONE_II,    s.STONE },    65)
    end

    -------------------------------------------------
    -- Flavor: WS message
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