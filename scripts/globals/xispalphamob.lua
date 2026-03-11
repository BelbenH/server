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
        [tierOne]   = { dropList = 4500, groupID = 200, look = 268,  exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.EVA] = 10, }, },
        [tierTwo]   = { dropList = 4501, groupID = 200, look = 2955, exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.EVA] = 15, }, },
        [tierThree] = { dropList = 4502, groupID = 200, look = 1937, exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.EVA] = 25, }, },
    },

    [xi.mobSuperFamily.MANDRAGORA] =
    {
        skillID = 496,
        bonusSpawnChance = 0,
        name    = { 'Mandragore', 'Root Reaper', 'Sproutbane', 'Sapling Hex', 'Briar Imp', },
        [tierOne]   = { dropList = 4503, groupID = 201, look = 2954,                                         exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.REGEN] = 2,  [xi.mod.REGAIN] = 100, }, },
        [tierTwo]   = { dropList = 4504, groupID = 201, look = 2378,                                         exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.REGEN] = 5,  [xi.mod.REGAIN] = 150, }, },
        [tierThree] = { dropList = 4505, groupID = 201, look = '0x00008E0B00000000000000000000000000000000', exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.REGEN] = 10, [xi.mod.REGAIN] = 200, }, },
    },

    [xi.mobSuperFamily.CRAB] =
    {
        skillID = 75,
        bonusSpawnChance = 0,
        name    = { 'Tidebreaker', 'Lord of Brine', 'Bloodreef', 'Old Carapax', 'Reef Bulwark', },
        [tierOne]   = { dropList = 4506, groupID = 202, look = 366,  exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.DEF] = 50,  [xi.mod.MDEF] = -10, }, },
        [tierTwo]   = { dropList = 4507, groupID = 202, look = 358, exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.DEF] = 75,  [xi.mod.MDEF] = -8,  }, },
        [tierThree] = { dropList = 4508, groupID = 202, look = '0x0000660100000000000000000000000000000000',  exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.DEF] = 150, [xi.mod.MDEF] = -5,  }, },
    },

    [xi.mobSuperFamily.SCORPION] =
    {
        skillID = 217,
        bonusSpawnChance = 3, -- Very few scorpions. Also they're not used as EXP generally
        name    = { 'Toxic Maw', 'Vashara', 'Khepracis', 'Crown Teslon', 'Sable Stinger', },
        [tierOne]   = { dropList = 4509, groupID = 203, look = 286,  exp = 950,  gil = 1500, mobMods = {  }, mods = { [xi.mod.ATTP] = 10, }, },
        [tierTwo]   = { dropList = 4510, groupID = 203, look = 337,  exp = 1750, gil = 2000, mobMods = {  }, mods = { [xi.mod.ATTP] = 20, }, },
        [tierThree] = { dropList = 4511, groupID = 203, look = 2107, exp = 2100, gil = 3000, mobMods = {  }, mods = { [xi.mod.ATTP] = 30, }, },
    },

    [xi.mobSuperFamily.GREATER_BIRD] =
    {
        skillID = 125,
        bonusSpawnChance = 0,
        name    = { 'Zephyr', 'Aeralith', 'Omenwing', 'Pidgeotto', 'Sky Seraph', },
        [tierOne]   = { dropList = 4512, groupID = 204, look = 336, exp = 750,  gil = 1500, mobMods = { [xi.mobMod.EXP_BONUS] = 150, [xi.mobMod.GIL_MIN] = 500,  [xi.mobMod.GIL_MAX] = 1000, }, mods = { [xi.mod.EVA] = 50,  [xi.mod.DOUBLE_ATTACK] = 15, }, },
        [tierTwo]   = { dropList = 4513, groupID = 204, look = 337, exp = 1250, gil = 2000, mobMods = { [xi.mobMod.EXP_BONUS] = 400, [xi.mobMod.GIL_MIN] = 1000, [xi.mobMod.GIL_MAX] = 2500, }, mods = { [xi.mod.EVA] = 75,  [xi.mod.DOUBLE_ATTACK] = 20, }, },
        [tierThree] = { dropList = 4514, groupID = 204, look = 338, exp = 1500, gil = 3000, mobMods = { [xi.mobMod.EXP_BONUS] = 650, [xi.mobMod.GIL_MIN] = 2500, [xi.mobMod.GIL_MAX] = 5000, }, mods = { [xi.mod.EVA] = 100, [xi.mod.DOUBLE_ATTACK] = 25, }, },
    },
    
    [xi.mobSuperFamily.BEE] =
    {
        skillID = 814,
        bonusSpawnChance = 0,
        name    = { 'Hive Tyrant', 'Regina Vespa', 'Buzzkiller', 'Needler', 'Stingfather', 'Beelzebuzz', 'Stingularity', 'Apis Dominus', },
        [tierOne]   = { dropList = 4520, groupID = 205, look = '0x0000900700000000000000000000000000000000',  exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.ACC] = 10, [xi.mod.ATTP] = 10, }, },
        [tierTwo]   = { dropList = 4521, groupID = 205, look = '0x0000900700000000000000000000000000000000',  exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.ACC] = 15, [xi.mod.ATTP] = 15, }, },
        [tierThree] = { dropList = 4522, groupID = 205, look = '0x0000C40900000000000000000000000000000000',  exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.ACC] = 25, [xi.mod.ATTP] = 25, }, },
    },

    [xi.mobSuperFamily.CRAWLER] =
    {
        skillID = 79,
        bonusSpawnChance = 0,
        name    = { 'Silk Sovereign', 'Thread Tyrant', 'Cocoon King', 'Webwinder', 'Spindlefiend', },
        [tierOne]   = { dropList = 4523, groupID = 206, look = 397,  exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.DEF] = 25, [xi.mod.REGEN] = 2, }, },
        [tierTwo]   = { dropList = 4524, groupID = 206, look = 406,  exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.DEF] = 50, [xi.mod.REGEN] = 5, }, },
        [tierThree] = { dropList = 4525, groupID = 206, look = 1809, exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.DEF] = 75, [xi.mod.REGEN] = 10, }, },
    },

    [xi.mobSuperFamily.BAT] =
    {
        skillID = 46,
        bonusSpawnChance = 0,
        name    = { 'Nightreaver', 'Duskfang', 'Bloodwing', 'Grave Flutter', 'Nocturnis', },
        [tierOne]   = { dropList = 4526, groupID = 207, look = '0x0000010100000000000000000000000000000000', exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.EVA] = 10, [xi.mod.ACC] = 10, }, },
        [tierTwo]   = { dropList = 4527, groupID = 207, look = '0x0000010100000000000000000000000000000000', exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.EVA] = 15, [xi.mod.ACC] = 15, }, },
        [tierThree] = { dropList = 4528, groupID = 207, look = '0x0000010100000000000000000000000000000000', exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.EVA] = 25, [xi.mod.ACC] = 25, }, },
    },

    [xi.mobSuperFamily.LIZARD] =
    {
        skillID = 468,
        bonusSpawnChance = 0,
        name    = { 'Moltwretch', 'Warped Husk', 'Nightscale', 'Crawling Molt', 'Rotmaw', 'Umbral Husk', 'Failed Molt', },
        [tierOne]   = { dropList = 4529, groupID = 208, look = '0x0000050A00000000000000000000000000000000', exp = 750,  gil = 1500, mobMods = {  }, mods = { [xi.mod.ATT] = 10, [xi.mod.ACC] = 10, }, },
        [tierTwo]   = { dropList = 4530, groupID = 208, look = '0x0000050A00000000000000000000000000000000', exp = 1250, gil = 2000, mobMods = {  }, mods = { [xi.mod.ATT] = 15, [xi.mod.ACC] = 15, }, },
        [tierThree] = { dropList = 4531, groupID = 208, look = '0x0000050A00000000000000000000000000000000', exp = 1500, gil = 3000, mobMods = {  }, mods = { [xi.mod.ATT] = 25, [xi.mod.ACC] = 25, }, },
    },
}

-- DON'T TOUCH ANYTHING BELOW THIS LINE -- THIS IS THE TEMPLATE FOR HOW ALL OTHER MOBS ARE SETUP BY DEFAULT! --
xi.alphamob.spawnAlpha = function(mob, player, optParams)
    local roll      = math.random(1, 100)
    local mobLvl    = mob:getMainLvl()
    local playerLvl = player:getMainLvl()
    local chance    = xi.settings.main.ALPHA_MOB_SPAWN_CHANCE -- replace with a setting from main.lua (Can be used for events)
    local flag      = false

    if optParams.isKiller or optParams.noKiller then
        flag = true
    end

    if not flag then
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

    if not alphaData then
        print('DEBUG: No alpha data for mob super family ID ' .. mob:getSuperFamily())
        return
    end

    chance = chance + (alphaData.bonusSpawnChance or 0)

    -- Only spawn if the mob was exp rewarding to the player
    if playerLvl - mobLvl <= 10 and roll <= chance then
        local levelData = {}
        local zone      = mob:getZone()
        local pos       = mob:getPos()
        local alphaLvl  = playerLvl

        if mobLvl >= tierThree then
            levelData = alphaData[tierThree]
            alphaLvl  = alphaLvl + 3
        elseif mobLvl >= tierTwo then
            levelData = alphaData[tierTwo]
            alphaLvl  = alphaLvl + 2
        elseif mobLvl >= tierOne then
            levelData = alphaData[tierOne]
            alphaLvl  = alphaLvl + 1
        end

        local alpha = zone:insertDynamicEntity({
            objtype               = xi.objType.MOB,
            name                  = alphaData.name[math.random(1, #alphaData.name)],
            x                     = pos.x + math.random(-2, 2),
            y                     = pos.y,
            z                     = pos.z + math.random(-2, 2),
            rotation              = pos.rot,
            minLevel              = alphaLvl,
            maxLevel              = alphaLvl + 2,
            look                  = levelData.look,
            entityFlags           = 2,
            dropId                = levelData.dropList,
            groupId               = levelData.groupID,
            groupZoneId           = xi.zone.GM_HOME,
            releaseIdOnDisappear  = true,

            onMobSpawn = function(alpha)
                local phId = mob:getID()
                alpha:setLocalVar('phSpawnID', phId)
                print(string.format('DEBUG ALPHA: Spawned alpha %u for PH %u', alpha:getID(), phId))
                xi.alphamob.calculateStats(alpha, levelData)
            end,
            
            onMobDeath = function(alpha, player)
                local phId = alpha:getLocalVar('phSpawnID')
                local phMob = GetMobByID(phId)
            
                print(string.format('DEBUG ALPHA: Alpha %u died, restoring PH %u', alpha:getID(), phId))
            
                DisallowRespawn(phId, false)
            
                if phMob then
                    phMob:setLocalVar('[XISP]spawnControl', 0)
                
                    -- Temporary workaround: force a new respawn timer
                    phMob:setRespawnTime(math.random(45, 75))
                    print(string.format('DEBUG ALPHA: Restarted PH %u respawn timer', phId))
                else
                    print(string.format('DEBUG ALPHA: Failed to find PH mob object for %u', phId))
                end
            
                if player and player:getMainLvl() < alpha:getMainLvl() then
                    player:addExp(xi.settings.main.EXP_RATE * levelData.exp + math.random(-250, 250))
                    npcUtil.giveCurrency(player, 'gil', levelData.gil + math.random(-100, 100))
                end
            end,
            
            onMobDespawn = function(alpha)
                local phId = alpha:getLocalVar('phSpawnID')
                local phMob = GetMobByID(phId)
            
                print(string.format('DEBUG ALPHA: Alpha %u despawned, restoring PH %u', alpha:getID(), phId))
            
                DisallowRespawn(phId, false)
            
                if phMob then
                    phMob:setLocalVar('[XISP]spawnControl', 0)
                
                    -- Temporary workaround: force a new respawn timer
                    phMob:setRespawnTime(math.random(45, 75))
                    print(string.format('DEBUG ALPHA: Restarted PH %u respawn timer after despawn', phId))
                else
                    print(string.format('DEBUG ALPHA: Failed to find PH mob object for %u', phId))
                end
            end,
        })

        print(string.format('DEBUG ALPHA: Blocking PH respawn for mob %u', mob:getID()))
        DisallowRespawn(mob:getID(), true)
        alpha:setSpawn(pos.x, pos.y, pos.z)
        alpha:spawn()
    end
end

xi.alphamob.calculateStats = function(mob, levelData)
    -- Add mods if any
    mob:addMod(xi.mod.EVA,           levelData.mods[xi.mod.EVA]          or 0)
    mob:addMod(xi.mod.ACC,           levelData.mods[xi.mod.ACC]          or 0)
    mob:addMod(xi.mod.DEF,           levelData.mods[xi.mod.DEF]          or 0)
    mob:addMod(xi.mod.MEVA,          levelData.mods[xi.mod.MEVA]         or 0)
    mob:addMod(xi.mod.MDEF,          levelData.mods[xi.mod.MDEF]         or 0)
    mob:addMod(xi.mod.ATTP,          levelData.mods[xi.mod.ATTP]         or 0)
    mob:addMod(xi.mod.REGEN,         levelData.mods[xi.mod.REGEN]        or 0)
    mob:addMod(xi.mod.DOUBLE_ATTACK, levelData.mods[xi.mod.DOUBLE_ATTACK] or 0)

    -- Add mob mods if any
    mob:addMobMod(xi.mobMod.WEAPON_BONUS, levelData.mobMods[xi.mobMod.WEAPON_BONUS] or 0)
    mob:addMobMod(xi.mobMod.EXP_BONUS, -100) -- Don't reward exp naturally
end
