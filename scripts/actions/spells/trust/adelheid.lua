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

    mob:addMod(xi.mod.REFRESH, 2)
    mob:addMod(xi.mod.MATT, 15)
    mob:addMod(xi.mod.ENMITY, -10) 

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.DARK_ARTS }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.DARK_ARTS }, 5)
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.ADDENDUM_BLACK }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.ADDENDUM_BLACK }, 5)

    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 },  { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 100)

    -- Storms matching day
    mob:addGambit(ai.t.SELF, { ai.c.NO_STORM, 0 }, { ai.r.MA, ai.s.STORM_DAY, 0 }, 20)

    -- Helix matching day 
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.HELIX }, { ai.r.MA, ai.s.HELIX_DAY, 0 }, 15)

    -- Healing (keep high-ish priority)
    mob:addGambit(ai.t.TANK,  { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }, 85)
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 33 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }, 90)

    -- Elemental nukes more often 
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
                mob:addGambit(
                    ai.t.TARGET,
                    combatCond,
                    { ai.r.MA, ai.s.SPECIFIC, spellId },
                    weight
                )
                weight = math.max(1, weight - 1)
            end
        end
    end

    local s = xi.magic.spell
    addElementNukes({ s.FIRE_VI,     s.FIRE_V,     s.FIRE_IV,     s.FIRE_III,     s.FIRE_II,     s.FIRE },     70)
    addElementNukes({ s.BLIZZARD_VI, s.BLIZZARD_V, s.BLIZZARD_IV, s.BLIZZARD_III, s.BLIZZARD_II, s.BLIZZARD }, 69)
    addElementNukes({ s.THUNDER_VI,  s.THUNDER_V,  s.THUNDER_IV,  s.THUNDER_III,  s.THUNDER_II,  s.THUNDER },  68)
    addElementNukes({ s.AERO_VI,     s.AERO_V,     s.AERO_IV,     s.AERO_III,     s.AERO_II,     s.AERO },     67)
    addElementNukes({ s.WATER_VI,    s.WATER_V,    s.WATER_IV,    s.WATER_III,    s.WATER_II,    s.WATER },    66)
    addElementNukes({ s.STONE_VI,    s.STONE_V,    s.STONE_IV,    s.STONE_III,    s.STONE_II,    s.STONE },    65)

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