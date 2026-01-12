-----------------------------------
-- Trust: Halver
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -------------------------------------------------
    -- Make Halver hold hate (VERY sticky)
    -------------------------------------------------
    mob:addMod(xi.mod.ENMITY, 90) -- try 60-120 depending on how "tank" you want him

    -- Some forks name this differently. If this errors, comment it out and tell me the error.
    mob:addMod(xi.mod.ENMITY_LOSS_REDUCTION, 90) -- try 50-100 for "hard to peel"

    -------------------------------------------------
    -- MP sustain for curing
    -------------------------------------------------
    -- Refresh helps a ton even if his base MP is low.
    mob:addMod(xi.mod.REFRESH, 2)

    -- Optional: if your fork supports it. If you get an error, delete this line.
    -- mob:addMod(xi.mod.MPP, 100)

    -------------------------------------------------
    -- Job Ability: Provoke
    -------------------------------------------------
    -- Keep it simple and reliable: gambit attempts it, recast prevents spam.
    mob:addGambit(
        ai.t.TARGET,
        { ai.c.ALWAYS, 0 },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE }
    )

    -------------------------------------------------
    -- Weapon Skill: Penta Thrust @ 1000+ TP
    -------------------------------------------------
    -- If your fork doesn't have ai.c.TP_GT, tell me what TP condition enum it uses and I'll swap it.
    mob:addGambit(
        ai.t.TARGET,
        { ai.c.TP_GT, 999 },
        { ai.r.WS, ai.s.SPECIFIC, xi.ws.PENTA_THRUST }
    )

    -------------------------------------------------
    -- Cures (match Excenmille-style behavior)
    -------------------------------------------------
    -- Uses the highest Cure available to him (based on his spell list).
    mob:addGambit(
        ai.t.SELF,
        { ai.c.HPP_LT, 75 },
        { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }
    )

    mob:addGambit(
        ai.t.PARTY,
        { ai.c.HPP_LT, 75 },
        { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE }
    )

    -------------------------------------------------
    -- Quality bump
    -------------------------------------------------
    mob:addMod(xi.mod.STORETP, 25)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
