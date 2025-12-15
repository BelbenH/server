xi = xi or {}
xi.alphamob = xi.alphamob or {}

local tierOne   = 1
local tierTwo   = 30
local tierThree = 60

local familyData =
{
    [xi.mobSuperFamily.RABBIT] =
    {
        skillID = 404,
        name    = { "Alpha Jack", "Grim Hare", "Big Thumper", "Mad Hopper", "Bunzilla", },
        [tierOne]   = { dropList = 4500, groupID = 200, look = 268,  mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.EVA] = 10, }, },
        [tierTwo]   = { dropList = 4501, groupID = 201, look = 2955, mobMods = { [xi.mobMod.EXP_BONUS] = 200, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.EVA] = 15, }, },
        [tierThree] = { dropList = 4502, groupID = 202, look = 1937, mobMods = { [xi.mobMod.EXP_BONUS] = 250, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.EVA] = 25, }, },
    },
}

xi.alphamob.spawnAlpha = function(mob, player, phList)
    local roll     = math.random(1, 100)
    local mobLvl   = mob:getMainLvl()
    local chance   = xi.settings.main.ALPHA_MOB_SPAWN_CHANCE -- replace with a setting from main.lua (Can be used for events)
    local phFlag   = false

    -- Check if the mob is a proper ph
    if phList then
        for _, phID in pairs(phList) do
            if mob:getID() == phID then
                phFlag = true
                break
            end
        end
    else
        phFlag = true
    end

    -- Quit if mob isn't a listed placeholder
    if not phFlag then
        return
    end

    if player:getMainLvl() - mobLvl <= 9 and roll <= chance then
        local alphaData    = familyData[mob:getSuperFamily()]
        local levelData    = {}
        local zone         = mob:getZone()
        local pos          = mob:getPos()
        local alphaLvl     = mobLvl

        if not alphaData then
            print("DEBUG: No alpha data for mob super family ID " .. mob:getMobSuperFamily())
            return
        end

        if mobLvl >= tierOne then
            levelData = alphaData[tierOne]
            alphaLvl  = alphaLvl + 4
        elseif mobLvl >= tierTwo then
            levelData = alphaData[tierTwo]
            alphaLvl  = alphaLvl + 6
        elseif mobLvl >= tierThree then
            levelData = alphaData[tierThree]
            alphaLvl  = alphaLvl + 8
        end


        local alpha = zone:insertDynamicEntity({
            objtype               = xi.objType.MOB,
            name                  = alphaData.name[math.random(1, #alphaData.name)],
            x                     = pos.x,
            y                     = pos.y,
            z                     = pos.z + 1,
            rotation              = math.random(0, 360),
            minLevel              = alphaLvl,
            maxLevel              = alphaLvl + 2,
            look                  = levelData.look,
            entityFlags           = 2,
            dropId                = levelData.dropList,
            groupId               = levelData.groupID,
            groupZoneId           = xi.zone.GM_HOME,
            releaseIdOnDisappear  = true,

            onMobSpawn = function(alpha)
                alpha:setLocalVar('phSpawnID', mob:getID())
                xi.alphamob.calculateStats(alpha, levelData)
            end,

            onMobDeath = function(alpha)
            end,

            onMobDespawn = function(alpha)
                DisallowRespawn(alpha:getLocalVar('phSpawnID'), false)
            end,
        })

        DisallowRespawn(mob:getID(), true) -- Prevent PH from spawning
        alpha:setSpawn(pos.x, pos.y, pos.z)
        alpha:spawn()
    end
end

xi.alphamob.calculateStats = function(mob, levelData)
    -- Add mods if any
    mob:addMod(xi.mod.EVA,  levelData.mods[xi.mod.EVA]  or 0)
    mob:addMod(xi.mod.ACC,  levelData.mods[xi.mod.ACC]  or 0)
    mob:addMod(xi.mod.DEF,  levelData.mods[xi.mod.DEF]  or 0)
    mob:addMod(xi.mod.MEVA, levelData.mods[xi.mod.MEVA] or 0)
    mob:addMod(xi.mod.MDEF, levelData.mods[xi.mod.MDEF] or 0)
    mob:addMod(xi.mod.ATTP, levelData.mods[xi.mod.ATTP] or 0)

    -- Add mob mods if any
    mob:addMobMod(xi.mobMod.WEAPON_BONUS, levelData.mobMods[xi.mobMod.WEAPON_BONUS] or 0)
    mob:addMobMod(xi.mobMod.GIL_MIN,      levelData.mobMods[xi.mobMod.GIL_MIN]      or 0)
    mob:addMobMod(xi.mobMod.GIL_MAX,      levelData.mobMods[xi.mobMod.GIL_MAX]      or 0)
    mob:addMobMod(xi.mobMod.EXP_BONUS,    levelData.mobMods[xi.mobMod.EXP_BONUS]    or 0)
end
