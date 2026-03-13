-----------------------------------
-- Moonlight -- Modified for Phalanx Rising
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local clubSkill = player:getSkillLevel(11)
    local maxMP = player:getMaxMP()
    local intStat = player:getStat(xi.mod.INT)

    -- Halved from previous version, spent hours testing this for balance and this feels really good. -Belben
    local base = (clubSkill * 0.04) + (maxMP * 0.075) + (intStat * 0.895)

    local tpMultiplier = (20 + (tp * 0.05)) / 130

    local damagemod = math.floor(base * tpMultiplier * xi.settings.main.WEAPON_SKILL_POWER)

    print(string.format(
        "Moonlight BALANCE TEST -> lvl=%s skill=%s maxMP=%s INT=%s tp=%s base=%.4f tpMult=%.4f raw=%s",
        tostring(player:getMainLvl()),
        tostring(clubSkill),
        tostring(maxMP),
        tostring(intStat),
        tostring(tp),
        base,
        tpMultiplier,
        tostring(damagemod)
    ))

    return 1, 0, false, damagemod
end

return weaponskillObject