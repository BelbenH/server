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
        bonusSpawnChance = 0,
        name    = { 'Alpha Jack', 'Grim Hare', 'Big Thumper', 'Mad Hopper', 'Bunzilla', }, --mob_mod.lua
        [tierOne]   = { dropList = 4500, groupID = 200, look = 268,  mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.EVA] = 10, }, },
        [tierTwo]   = { dropList = 4501, groupID = 200, look = 2955, mobMods = { [xi.mobMod.EXP_BONUS] = 400, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.EVA] = 15, }, },
        [tierThree] = { dropList = 4502, groupID = 200, look = 1937, mobMods = { [xi.mobMod.EXP_BONUS] = 650, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.EVA] = 25, }, },
    },

    [xi.mobSuperFamily.MANDRAGORA] =
    {
        skillID = 496,
        bonusSpawnChance = 0,
        name    = { 'Mandragore', 'Root Reaper', 'Sproutbane', 'Sapling Hex', 'Briar Imp', },
        [tierOne]   = { dropList = 4503, groupID = 201, look = 268,                                          mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.REGAIN] = 100, }, },
        [tierTwo]   = { dropList = 4504, groupID = 201, look = 2955,                                         mobMods = { [xi.mobMod.EXP_BONUS] = 400, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.REGAIN] = 100, }, },
        [tierThree] = { dropList = 4505, groupID = 201, look = '0x00008E0B00000000000000000000000000000000', mobMods = { [xi.mobMod.EXP_BONUS] = 650, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.REGAIN] = 100, }, },
    },

    [xi.mobSuperFamily.CRAB] =
    {
        skillID = 75,
        bonusSpawnChance = 0,
        name    = { 'Tidebreaker', 'Lord of Brine', 'Bloodreef', 'Old Carapax', 'Reef Bulwark', },
        [tierOne]   = { dropList = 4506, groupID = 202, look = 366,  mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.DEF] = 50,  }, },
        [tierTwo]   = { dropList = 4507, groupID = 202, look = 2965, mobMods = { [xi.mobMod.EXP_BONUS] = 400, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.DEF] = 75,  }, },
        [tierThree] = { dropList = 4508, groupID = 202, look = 358,  mobMods = { [xi.mobMod.EXP_BONUS] = 650, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.DEF] = 150, }, },
    },

    [xi.mobSuperFamily.SCORPION] =
    {
        skillID = 217,
        bonusSpawnChance = 2, -- Very few scorpions. Also they're not used as EXP generally
        name    = { 'Toxic Maw', 'Vashara', 'Khepracis', 'Crown Teslon', 'Sable Stinger', },
        [tierOne]   = { dropList = 4509, groupID = 203, look = 286,  mobMods = { [xi.mobMod.EXP_BONUS] = 450, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.ATTP] = 10, }, },
        [tierTwo]   = { dropList = 4510, groupID = 203, look = 337,  mobMods = { [xi.mobMod.EXP_BONUS] = 700, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.ATTP] = 20, }, },
        [tierThree] = { dropList = 4511, groupID = 203, look = 2107, mobMods = { [xi.mobMod.EXP_BONUS] = 950, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.ATTP] = 30, }, },
    },

    [xi.mobSuperFamily.GREATER_BIRD] =
    {
        skillID = 125,
        bonusSpawnChance = 0,
        name    = { 'Zephyr', 'Aeralith', 'Omenwing', 'Pidgeotto', 'Sky Seraph', },
        [tierOne]   = { dropList = 4512, groupID = 204, look = 366,  mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.EVA] = 50,  [xi.mod.DOUBLE_ATTACK] = 15, }, },
        [tierTwo]   = { dropList = 4513, groupID = 204, look = 2965, mobMods = { [xi.mobMod.EXP_BONUS] = 400, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.EVA] = 75,  [xi.mod.DOUBLE_ATTACK] = 20, }, },
        [tierThree] = { dropList = 4514, groupID = 204, look = 227,  mobMods = { [xi.mobMod.EXP_BONUS] = 650, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.EVA] = 100, [xi.mod.DOUBLE_ATTACK] = 25, }, },
    },
}

-- DON'T TOUCH ANYTHING BELOW THIS LINE -- THIS IS THE TEMPLATE FOR HOW ALL OTHER MOBS ARE SETUP BY DEFAULT! --
xi.alphamob.spawnAlpha = function(mob, player, phList)
    local roll      = math.random(1, 100)
    local mobLvl    = mob:getMainLvl()
    local playerLvl = player:getMainLvl()
    local chance    = xi.settings.main.ALPHA_MOB_SPAWN_CHANCE -- replace with a setting from main.lua (Can be used for events)
    local phFlag    = false


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

    -- Return if mob isn't a listed placeholder
    if not phFlag then
        return
    end

    -- Only call this func one time
    if mob:getLocalVar('[XISP]spawnControl') == 0 then
        mob:setLocalVar('[XISP]spawnControl', 1)
    else
        return
    end

    -- Evaluate chance based on mob family's bonus chances
    local alphaData = familyData[mob:getSuperFamily()]
    chance = chance + alphaData.bonusSpawnChance

    if not alphaData then
        print('DEBUG: No alpha data for mob super family ID ' .. mob:getSuperFamily())
        return
    end

    -- Only spawn if the mob was exp rewarding to the player
    if playerLvl - mobLvl <= 9 and roll <= chance then
        local levelData = {}
        local zone      = mob:getZone()
        local pos       = mob:getPos()
        local alphaLvl  = playerLvl

        if mobLvl >= tierOne then
            levelData = alphaData[tierOne]
            alphaLvl  = alphaLvl + 2
        elseif mobLvl >= tierTwo then
            levelData = alphaData[tierTwo]
            alphaLvl  = alphaLvl + 3
        elseif mobLvl >= tierThree then
            levelData = alphaData[tierThree]
            alphaLvl  = alphaLvl + 4
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
    mob:addMod(xi.mod.EVA,           levelData.mods[xi.mod.EVA]           or 0)
    mob:addMod(xi.mod.ACC,           levelData.mods[xi.mod.ACC]           or 0)
    mob:addMod(xi.mod.DEF,           levelData.mods[xi.mod.DEF]           or 0)
    mob:addMod(xi.mod.MEVA,          levelData.mods[xi.mod.MEVA]          or 0)
    mob:addMod(xi.mod.MDEF,          levelData.mods[xi.mod.MDEF]          or 0)
    mob:addMod(xi.mod.ATTP,          levelData.mods[xi.mod.ATTP]          or 0)
    mob:addMod(xi.mod.DOUBLE_ATTACK, levelData.mods[xi.mod.DOUBLE_ATTACK] or 0)

    -- Add mob mods if any
    mob:addMobMod(xi.mobMod.WEAPON_BONUS, levelData.mobMods[xi.mobMod.WEAPON_BONUS] or 0)
    mob:addMobMod(xi.mobMod.GIL_MIN,      levelData.mobMods[xi.mobMod.GIL_MIN]      or 0)
    mob:addMobMod(xi.mobMod.GIL_MAX,      levelData.mobMods[xi.mobMod.GIL_MAX]      or 0)
    mob:addMobMod(xi.mobMod.EXP_BONUS,    levelData.mobMods[xi.mobMod.EXP_BONUS]    or 0)
end
