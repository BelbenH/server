-----------------------------------
-- Trust: Rainemard (920)
-- Replacement trust for player RDM squire
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
    mob:hideName(true)
    mob:setStatus(xi.status.INVISIBLE)

    local player = mob:getMaster()

    if not player then
        return
    end

    local face = player:getCharVar('[XISP]squireFace')
    local race = player:getCharVar('[XISP]squireRace')
    local lvl  = player:getMainLvl()
    local tier = 0

    if xi.xispal.hasCompletedAF(player) and lvl >= 60 then
        tier = 4
    elseif lvl >= 40 then
        tier = 3
    elseif lvl >= 30 then
        tier = 2
    elseif lvl >= 20 then
        tier = 1
    end

    if mob:getMainLvl() < 35 then
        mob:setLocalVar('isMelee', 1)
    end

    mob:renameEntity(xi.xispal.squireName[player:getCharVar('[XISP]squireName')])
    mob:setLookString(xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], xi.xispal.squireGearSets[tier]))
    mob:setLocalVar('[XISP]spellRecast', GetSystemTime() + math.random(7, 12))

    mob:setMobMod(xi.mobMod.SPELL_LIST, 1000)

    player:timer(400, function(playerArg)
        mob:setLocalVar('[XISP]spellRecast', GetSystemTime() + math.random(7, 12))
        mob:setLocalVar('[XISP]isPal', 1)
        mob:setStatus(xi.status.NORMAL)
        mob:hideName(false)
    end)
end

spellObject.onMobRoam = function(mob)
    local player = mob:getMaster()

    xi.xispal.idleSquireChat(mob, player)
    xi.xispal.onMobRoam(mob, player)
end

spellObject.onMobFight = function(mob, target)
    local player = mob:getMaster()
    xi.xispal.onMobFight(mob, target, player)
end

spellObject.onMobDisengage = function(mob)
    xi.xispal.onMobDisengage(mob)
end

spellObject.onMobDespawn = function(mob)
end

spellObject.onMobDeath = function(mob)
end

return spellObject
