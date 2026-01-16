-----------------------------------
-- Paladin Job Utilities
-----------------------------------
xi = xi or {}
xi.job_utils = xi.job_utils or {}
xi.job_utils.paladin = xi.job_utils.paladin or {}

-----------------------------------
-- Main-job-only Enmity Tuning
--
-- CE = Cumulative Enmity (sticks around longer)
-- VE = Volatile Enmity (big snap hate that decays fast)
--
-- To increase hate: raise CE and/or VE values below.
-- To reduce hate: lower CE and/or VE values below.
--
-- NOTE: These apply ONLY when PLD is the MAIN job.
-----------------------------------
local ENMITY_TUNE =
{
    -- “Snap” defensive tools
    Cover        = { CE = 600, VE = 2200 }, -- Big spike: taking hits for someone.
    Invincible   = { CE = 200, VE = 1000  }, -- Baseline; JP adds additional VE below.
    Rampart      = { CE = 300, VE = 900  },
    Sentinel     = { CE = 400, VE = 1200 },

    -- Mid tier / stance-like tools
    Palisade     = { CE = 250, VE = 750  },
    Majesty      = { CE = 150, VE = 450  },
    Fealty       = { CE = 200, VE = 600  },
    DivineEmblem = { CE = 200, VE = 600  },

    -- Flavor / situational
    HolyCircle   = { CE = 100, VE = 300  },
    Sepulcher    = { CE = 250, VE = 750  }, -- Only works on undead anyway.
    Chivalry     = { CE = 150, VE = 450  },

    -- Damage abilities (already generate hate via damage)
    Intervene    = { CE = 0,   VE = 600  }, -- Extra snap on top of damage.
    ShieldBash   = { CE = 0,   VE = 750  }, -- Extra snap on top of damage + stun.
}

-----------------------------------
-- Main-job-only enmity helper
-----------------------------------
local function addMainPLDEnmity(player, ability, ceAdd, veAdd)
    -- Enmity boosts apply ONLY if PLD is MAIN job.
    if player:getMainJob() ~= xi.job.PLD then
        return
    end

    local curCE = (ability.getCE and ability:getCE()) or 0
    local curVE = (ability.getVE and ability:getVE()) or 0

    if ceAdd and ability.setCE then
        -- Increase/decrease CE by changing ceAdd (or ENMITY_TUNE values)
        ability:setCE(curCE + ceAdd)
    end

    if veAdd and ability.setVE then
        -- Increase/decrease VE by changing veAdd (or ENMITY_TUNE values)
        ability:setVE(curVE + veAdd)
    end
end

-- Convenience wrapper so you can tune in ENMITY_TUNE table
local function addMainPLDEnmityByKey(player, ability, key)
    local t = ENMITY_TUNE[key]
    if not t then
        return
    end

    addMainPLDEnmity(player, ability, t.CE or 0, t.VE or 0)
end

-----------------------------------
-- Ability Check Functions
-----------------------------------
xi.job_utils.paladin.checkCover = function(player, target, ability)
    if
        target == nil or
        target:getID() == player:getID() or
        not target:isPC()
    then
        return xi.msg.basic.CANNOT_PERFORM_TARG, 0
    end

    -- ENMITY BOOST (main PLD only):
    -- Edit ENMITY_TUNE.Cover CE/VE to increase or decrease this.
    addMainPLDEnmityByKey(player, ability, 'Cover')

    return 0, 0
end

xi.job_utils.paladin.checkIntervene = function(player, target, ability)
    if player:getShieldSize() == 0 then
        return xi.msg.basic.REQUIRES_SHIELD, 0
    end

    -- ENMITY BOOST (main PLD only):
    -- Intervene does damage (already creates hate),
    -- this adds extra snap VE on top.
    -- Edit ENMITY_TUNE.Intervene VE to change this.
    addMainPLDEnmityByKey(player, ability, 'Intervene')

    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

xi.job_utils.paladin.checkInvincible = function(player, target, ability)
    local jpValue = player:getJobPointLevel(xi.jp.INVINCIBLE_EFFECT)

    -- ENMITY BOOST (main PLD only):
    -- Baseline snap in addition to JP scaling below.
    -- Edit ENMITY_TUNE.Invincible CE/VE to change baseline.
    addMainPLDEnmityByKey(player, ability, 'Invincible')

    -- Existing behavior: Job Points add extra VE
    ability:setVE(ability:getVE() + 100 * jpValue)

    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

xi.job_utils.paladin.checkSepulcher = function(player, target, ability)
    if target:isUndead() then
        -- ENMITY BOOST (main PLD only):
        -- Edit ENMITY_TUNE.Sepulcher CE/VE to change this.
        addMainPLDEnmityByKey(player, ability, 'Sepulcher')

        return 0, 0
    else
        return xi.msg.basic.CANNOT_ON_THAT_TARG, 0
    end
end

xi.job_utils.paladin.checkShieldBash = function(player, target, ability)
    if player:getShieldSize() == 0 then
        return xi.msg.basic.REQUIRES_SHIELD, 0
    end

    -- ENMITY BOOST (main PLD only):
    -- Shield Bash does damage (already creates hate),
    -- this adds extra snap VE on top.
    -- Edit ENMITY_TUNE.ShieldBash VE to change this.
    addMainPLDEnmityByKey(player, ability, 'ShieldBash')

    return 0, 0
end

-- Added: checks for other PLD abilities (main-job-only hate boosts)
xi.job_utils.paladin.checkRampart = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Rampart CE/VE
    addMainPLDEnmityByKey(player, ability, 'Rampart')
    return 0, 0
end

xi.job_utils.paladin.checkSentinel = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Sentinel CE/VE
    addMainPLDEnmityByKey(player, ability, 'Sentinel')
    return 0, 0
end

xi.job_utils.paladin.checkPalisade = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Palisade CE/VE
    addMainPLDEnmityByKey(player, ability, 'Palisade')
    return 0, 0
end

xi.job_utils.paladin.checkMajesty = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Majesty CE/VE
    addMainPLDEnmityByKey(player, ability, 'Majesty')
    return 0, 0
end

xi.job_utils.paladin.checkDivineEmblem = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.DivineEmblem CE/VE
    addMainPLDEnmityByKey(player, ability, 'DivineEmblem')
    return 0, 0
end

xi.job_utils.paladin.checkFealty = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Fealty CE/VE
    addMainPLDEnmityByKey(player, ability, 'Fealty')
    return 0, 0
end

xi.job_utils.paladin.checkHolyCircle = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.HolyCircle CE/VE
    addMainPLDEnmityByKey(player, ability, 'HolyCircle')
    return 0, 0
end

xi.job_utils.paladin.checkChivalry = function(player, target, ability)
    -- ENMITY BOOST (main PLD only): Edit ENMITY_TUNE.Chivalry CE/VE
    addMainPLDEnmityByKey(player, ability, 'Chivalry')
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
xi.job_utils.paladin.useChivalry = function(player, target, ability)
    local merits = player:getMerit(xi.merit.CHIVALRY) - 5
    local tp     = target:getTP()
    local base   = 0.05 + (player:getMod(xi.mod.ENHANCES_CHIVALRY) / 100)
    -- MP gained = (TP * 0.05) + (0.0015 * TP * MND) * Merits
    local amount = (tp * base) + (0.0015 * tp * target:getStat(xi.mod.MND)) * ((100 + merits) / 100)

    target:setTP(0)

    return target:addMP(amount)
end

xi.job_utils.paladin.useCover = function(player, target, ability)
    local baseDuration = 15
    local bonusTime    = utils.clamp(math.floor((player:getStat(xi.mod.VIT) + player:getStat(xi.mod.MND) - target:getStat(xi.mod.VIT) * 2) / 4), 0, 15)
    local jpValue      = player:getJobPointLevel(xi.jp.COVER_DURATION)
    local duration     = baseDuration + bonusTime + player:getMerit(xi.merit.COVER_EFFECT_LENGTH) + player:getMod(xi.mod.COVER_DURATION) + jpValue

    player:addStatusEffect(xi.effect.COVER, player:getMod(xi.mod.COVER_TO_MP), 0, duration)
    player:setLocalVar('COVER_ABILITY_TARGET', target:getID())
    ability:setMsg(xi.msg.basic.COVER_SUCCESS)
end

xi.job_utils.paladin.useDivineEmblem = function(player, target, ability)
    -- Divine Magic bonus damage handled in globals/magic.lua
    local power = 50 + player:getMod(xi.mod.ENHANCES_DIVINE_EMBLEM) -- 50% increase to enmity

    player:addStatusEffect(xi.effect.DIVINE_EMBLEM, power, 0, 60)

    return xi.effect.DIVINE_EMBLEM
end

xi.job_utils.paladin.useFealty = function(player, target, ability)
    local merits    = player:getMerit(xi.merit.FEALTY) - 5
    local enhFealty = (player:getMerit(xi.merit.FEALTY) / 5) * player:getMod(xi.mod.ENHANCES_FEALTY)
    local duration  = 60 + merits + enhFealty

    player:addStatusEffect(xi.effect.FEALTY, 1, 0, duration)

    return xi.effect.FEALTY
end

xi.job_utils.paladin.useHolyCircle = function(player, target, ability)
    -- TODO:
    -- Create Bonus vs Ecosystem handling
    -- https://www.bg-wiki.com/ffxi/Holy_Circle
    -- Main (PLD) job gives a unique 15% damage bonus against undead, 15% damage resistance from undead, and likely +15% Undead Killer.
    -- When subbed, gives 5% of these bonuses.
    local duration = 180 + player:getMod(xi.mod.HOLY_CIRCLE_DURATION)
    local power    = 15

    if player:getMainJob() ~= xi.job.PLD then
        power = 5
    end

    power = power + player:getMod(xi.mod.HOLY_CIRCLE_POTENCY)

    target:addStatusEffect(xi.effect.HOLY_CIRCLE, power, 0, duration)

    return xi.effect.HOLY_CIRCLE
end

xi.job_utils.paladin.useIntervene = function(player, target, ability)
    -- TODO: Retail testing to determine damage
    local shieldSize = player:getShieldSize()
    local jpValue    = 1 + (player:getJobPointLevel(xi.jp.INTERVENE_EFFECT) / 100)
    local damage     = math.floor(player:getMainLvl() * 3.36)

    if shieldSize == 2 then
        damage = 13 + damage
    elseif shieldSize == 3 then
        damage = 40 + damage
    elseif shieldSize == 4 then
        damage = 67 + damage
    end

    damage = damage * jpValue

    target:addStatusEffect(xi.effect.INTERVENE, 1, 0, 30)

    return damage
end

xi.job_utils.paladin.useInvincible = function(player, target, ability)
    player:addStatusEffect(xi.effect.INVINCIBLE, 1, 0, 30)

    return xi.effect.INVINCIBLE
end

xi.job_utils.paladin.useMajesty = function(player, target, ability)
    player:addStatusEffect(xi.effect.MAJESTY, 25, 0, 180)

    return xi.effect.MAJESTY
end

xi.job_utils.paladin.usePalisade = function(player, target, ability)
    local jpValue = player:getJobPointLevel(xi.jp.PALISADE_EFFECT)
    local power   = 30 + jpValue

    player:addStatusEffect(xi.effect.PALISADE, power, 0, 60)

    return xi.effect.PALISADE
end

xi.job_utils.paladin.useRampart = function(player, target, ability)
    local duration = 30 + player:getMod(xi.mod.RAMPART_DURATION)

    target:addStatusEffect(xi.effect.RAMPART, 2500, 0, duration)

    return xi.effect.RAMPART
end

xi.job_utils.paladin.useSentinel = function(player, target, ability)
    -- Whether feet have to be equipped before using ability, or if they can be swapped in
    -- is disputed.  Source used: http://wiki.bluegartr.com/bg/Sentinel
    local power       = (90 + player:getMod(xi.mod.SENTINEL_EFFECT)) * 100
    local guardian    = player:getMerit(xi.merit.GUARDIAN)
    local enhGuardian = player:getMod(xi.mod.ENHANCES_GUARDIAN) * (guardian / 19)
    local jpValue     = player:getJobPointLevel(xi.jp.SENTINEL_EFFECT)
    local duration    = 30 + enhGuardian

    -- Sent as positive power because UINTs, man.
    player:addStatusEffect(xi.effect.SENTINEL, power, 3, duration, 0, guardian + jpValue)

    return xi.effect.SENTINEL
end

xi.job_utils.paladin.useSepulcher = function(player, target, ability)
    local power    = 20
    local jpValue  = player:getJobPointLevel(xi.jp.SEPULCHER_DURATION)
    local duration = 180 + jpValue

    target:addStatusEffect(xi.effect.SEPULCHER, power, 0, duration)
end

xi.job_utils.paladin.useShieldBash = function(player, target, ability)
    local shieldSize = player:getShieldSize()
    local jpValue    = player:getJobPointLevel(xi.jp.SHIELD_BASH_EFFECT)
    local damage     = math.floor(player:getMainLvl() * 0.273)
    local chance     = 90

    if shieldSize == 2 then
        damage = 13 + damage
    elseif shieldSize == 3 then
        damage = 40 + damage
    elseif shieldSize == 4 then
        damage = 67 + damage
    end

    -- Main job factors
    if player:getMainJob() ~= xi.job.PLD then
        damage = math.floor(damage / 2.5)
        chance = 60
    else
        damage = math.floor(damage)
    end

    damage = damage + player:getMod(xi.mod.SHIELD_BASH) + (jpValue * 10)

    -- Calculate stun proc chance
    chance = chance + (player:getMainLvl() - target:getMainLvl()) * 10

    if math.random(1, 100) <= chance then
        target:addStatusEffect(xi.effect.STUN, 1, 0, 6)
    end

    -- Randomize damage
    local randomizer = 1 + (math.random(1, 5) / 100)

    damage = damage * randomizer
    damage = utils.handleStoneskin(target, damage)

    target:takeDamage(damage, player, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    target:updateEnmityFromDamage(player, damage)
    ability:setMsg(xi.msg.basic.JA_DAMAGE)

    return damage
end