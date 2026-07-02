xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.ability =
{
    { id = xi.ja.SHIELD_BASH,     timer = 60,  needsTarget = true,  effect = nil,                       lvl = { [xi.job.PLD] = 15, } },
    { id = xi.ja.WEAPON_BASH,     timer = 180, needsTarget = true,  effect = nil,                       lvl = { [xi.job.DRK] = 20, } },
    { id = xi.ja.PROVOKE,         timer = 30,  needsTarget = true,  effect = nil,                       lvl = { [xi.job.PLD] = 10, [xi.job.SAM] = 10, } },
    { id = xi.ja.SENTINEL,        timer = 180, needsTarget = false, effect = nil,                       lvl = { [xi.job.PLD] = 30, } },
    { id = xi.ja.WARCRY,          timer = 300, needsTarget = false, effect = xi.effect.WARCRY,          lvl = { [xi.job.DRG] = 70, [xi.job.PLD] = 70, [xi.job.DRK] = 70, [xi.job.SAM] = 70, } },
    { id = xi.ja.LAST_RESORT,     timer = 300, needsTarget = false, effect = xi.effect.LAST_RESORT,     lvl = { [xi.job.DRK] = 15, } },
    { id = xi.ja.BERSERK,         timer = 180, needsTarget = false, effect = xi.effect.BERSERK,         lvl = { [xi.job.DRG] = 30, [xi.job.DRK] = 30, [xi.job.SAM] = 30, } },
    { id = xi.ja.SOULEATER,       timer = 360, needsTarget = false, effect = xi.effect.SOULEATER,       lvl = { [xi.job.DRK] = 30, } },
    { id = xi.ja.HASSO,           timer = 300, needsTarget = false, effect = xi.effect.HASSO,           lvl = { [xi.job.SAM] = 35, } },
    { id = xi.ja.SEIGAN,          timer = 300, needsTarget = false, effect = xi.effect.SEIGAN,          lvl = { [xi.job.SAM] = 35, } },
    { id = xi.ja.THIRD_EYE,       timer = 30,  needsTarget = false, effect = xi.effect.THIRD_EYE,       lvl = { [xi.job.SAM] = 15, } },
    { id = xi.ja.MEDITATE,        timer = 180, needsTarget = false, effect = nil,                       lvl = { [xi.job.SAM] = 30, } },
    { id = xi.ja.DEFENDER,        timer = 180, needsTarget = false, effect = xi.effect.DEFENDER,        lvl = { [xi.job.PLD] = 50, [xi.job.SAM] = 50, } },
    { id = xi.ja.CONVERT,         timer = 600, needsTarget = false, effect = nil,                       lvl = { [xi.job.RDM] = 40, } },
    { id = xi.ja.INNIN,           timer = 180, needsTarget = false, effect = xi.effect.INNIN,           lvl = { [xi.job.NIN] = 40, } },
    { id = xi.ja.JUMP,            timer = 60,  needsTarget = true,  effect = nil,                       lvl = { [xi.job.DRG] = 10, } },
    { id = xi.ja.AFFLATUS_SOLACE, timer = 60,  needsTarget = false, effect = xi.effect.AFFLATUS_SOLACE, lvl = { [xi.job.WHM] = 40, } },
}

xi.xispal.weaponSkills =
{
    [xi.job.DRG] =
    {
        { id = 120, lvl = 71, questRequired = true,  priority = true, }, -- Impulse Drive
        { id = 116, lvl = 49, questRequired = false, priority = true, }, -- Penta Thrust
        { id = 112, lvl = 3,  questRequired = false, priority = false }, -- Double Thrust
    },

    [xi.job.PLD] =
    {
        { id = 42, lvl = 71, questRequired = true,  priority = true, }, -- Savage Blade
        { id = 41, lvl = 65, questRequired = false, priority = true, }, -- Swift Blade
        { id = 40, lvl = 60, questRequired = false, priority = true, }, -- Vorpal Blade
        { id = 34, lvl = 15, questRequired = false, priority = false }, -- Red Lotus Blade
        { id = 32, lvl = 3,  questRequired = false, priority = false }, -- Fast Blade
    },

    [xi.job.DRK] =
    {
        { id = 56, lvl = 71, questRequired = true,  priority = true, }, -- Ground Strike
        { id = 55, lvl = 65, questRequired = false, priority = true, }, -- Spinning Slash
        { id = 53, lvl = 55, questRequired = false, priority = false }, -- Crescent Moon
        { id = 48, lvl = 9,  questRequired = false, priority = false }, -- Power Slash
        { id = 59, lvl = 3,  questRequired = false, priority = false }, -- Hard Slash
    },

    [xi.job.SAM] =
    {
        { id = 152, lvl = 71, questRequired = true,   priority = true, }, -- Tachi: Kasha
        { id = 151, lvl = 65, questRequired = false,  priority = true, }, -- Tachi: Gekko
        { id = 150, lvl = 60, questRequired = false,  priority = true, }, -- Tachi: Yukikaze
        { id = 144, lvl = 3,  questRequired = false,  priority = false }, -- Tachi: Enpi
    },

    [xi.job.THF] =
    {
        { id = 25, lvl = 71, questRequired = true,  priority = true, }, -- Evisceration
        { id = 24, lvl = 65, questRequired = false, priority = true, }, -- Shark Bite
        { id = 17, lvl = 33, questRequired = false, priority = false }, -- Viper Bite
        { id = 16, lvl = 3,  questRequired = false, priority = false }, -- Wasp Sting
    },

    [xi.job.RDM] =
    {
        { id = 42, lvl = 71, questRequired = true,  priority = true  }, -- Savage Blade
        { id = 41, lvl = 65, questRequired = false, priority = false }, -- Swift Blade
        { id = 34, lvl = 15, questRequired = false, priority = false }, -- Red Lotus Blade
        { id = 32, lvl = 3,  questRequired = false, priority = false }, -- Fast Blade
    },
}

xi.xispal.twoHour =
{
    [xi.job.DRG] = { xi.ja.SPIRIT_SURGE  },
    [xi.job.THF] = { xi.ja.PERFECT_DODGE },
    [xi.job.PLD] = { xi.ja.INVINCIBLE    },
    [xi.job.DRK] = { xi.ja.BLOOD_WEAPON  },
    [xi.job.SAM] = { xi.ja.MEIKYO_SHISUI },
}

xi.xispal.checkAbilities = function(pal, player, job)
    if pal:getLocalVar('abilityCooldown') > GetSystemTime() then
        return
    end

    local lvl    = pal:getMainLvl()

    for _, ability in pairs(xi.xispal.ability) do
        local flag   = true
        local target = pal

        -- Skip effect abilities if we already have them
        if ability.effect ~= nil and pal:hasStatusEffect(ability.effect) then
            goto skip
        end

        if
            ability.lvl[job] and lvl >= ability.lvl[job] and
            pal:getLocalVar('abilityRecast' .. ability.id) < GetSystemTime()
        then
            if ability.needsTarget then
                target = xi.xispal.getTarget(pal)
            end

            -- Only use conver while under 15% MP
            if ability.id == xi.ja.CONVERT and pal:getMPP() > 15 then
                flag = false
            end

            -- Don't use souleater with low HP
            if
                ability.id == xi.ja.SOULEATER and
                (pal:getHPP() < 80 or pal:getBattleTime() < 45)
            then
                flag = false
            end

            -- Don't immediately use warcry
            if ability.id == xi.ja.WARCRY and pal:getBattleTime() < 15 then
                flag = false
            end

            -- Only try to use sentinel if HP is getting low
            if ability.id == xi.ja.SENTINEL and pal:getHPP() > 60 then
                flag = false
            end

            -- Only use shield bash / weapon bash if
            if
                (ability.id == xi.ja.SHIELD_BASH or ability.id == xi.ja.WEAPON_BASH ) and
                target:getCurrentAction() ~= xi.action.category.MAGIC_CASTING
            then
                flag = false
            end

            if ability.id == xi.ja.PROVOKE and pal:checkDistance(target) > 12 then
                flag = false
            end

            -- Tank mode case for SAM
            if job == xi.job.SAM then
                local tankMode = player:getCharVar('[XISP]SamuraiTankMode')
                if tankMode == 1 then
                    if ability.id == xi.ja.HASSO or ability.id == xi.ja.BERSERK then
                        flag = false
                    end
                else
                    if ability.id == xi.ja.SEIGAN or ability.id == xi.ja.PROVOKE or ability.id == xi.ja.DEFENDER or ability.id == xi.ja.THIRD_EYE then
                        flag = false
                    end
                end
            end

            if flag and target and pal:getLocalVar('abilityRecast' .. ability.id) < GetSystemTime() then
                pal:setLocalVar('abilityRecast' .. ability.id, GetSystemTime() + ability.timer)
                pal:setLocalVar('abilityCooldown', GetSystemTime() + 3)
                pal:useJobAbility(ability.id, target)
                return
            end
        end

        ::skip::
    end
end

xi.xispal.hasCompletedWeaponQuest = function(player)
    for _, quest in pairs(xi.xispal.afQuests) do
        if player:hasCompletedQuest(quest[1], quest[2]) then
            return true
        end
    end
    return false
end

xi.xispal.checkWeaponSkill = function(pal, target, player, job)
    local weaponskills = {}
    local gate = false -- Used to determine whether older weaponskills should be used

    if pal:getTP() < 1000 then
        return
    end

    -- TODO: Chat telling player they're almost ready
    --       Logic to attempt skill chains

    for _, skill in pairs(xi.xispal.weaponSkills[job]) do
        if pal:getMainLvl() >= skill.lvl then
            if skill.priority then
                gate = true -- Now we should only add high level Weaponskills
            end

            if skill.questRequired and xi.xispal.hasCompletedWeaponQuest(player) then
                table.insert(weaponskills, skill.id)
            elseif skill.questRequired == false then
                if gate and skill.priority then
                    table.insert(weaponskills, skill.id)
                elseif gate == false then
                    table.insert(weaponskills, skill.id)
                end
            end
        end
    end

    if #weaponskills == 0 then
        return
    end

    pal:useMobAbility(weaponskills[math.random(1, #weaponskills)], target)
    pal:setTP(math.random(5, 110))
end