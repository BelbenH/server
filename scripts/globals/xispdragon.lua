xi = xi or {}
xi.dragon = xi.dragon or {}

xi.dragon.info =
{
    { look = 783, skillID = 260, }, -- FAFNIR
    { look = 608, skillID = 393, }, -- TIAMAT
    { look = 611, skillID = 391, }, -- VRTRA
    { look = 609, skillID = 392, }, -- JORM
    { look = 610, skillID = 259, }, -- OURYU
    { look = "0x0000600200000000000000000000000000000000", skillID = 874, } -- SMOK
}

xi.dragon.names =
{
    "Ashvhar",  "Brimfang", "Cindresh", "Drakthar", "Ebonmaw", "Fireskorn", "Gloomash", "Hellsing",
    "Icevorn",  "Jhorvex", "Karnith", "Lazuryn", "Mordrake", "Nivhess", "Onyxen", "Pyraxis", "Quellak", "Ravmage",
    "Searloch", "Thornak", "Umbrith", "Vulkhar", "Wrathos", "Xaldrik", "Ysmirak", "Zenthra", "Aegvorn", "Blaziel",
    "Cravash",  "Drelgath", "Elvaxor", "Fyrskal", "Garnyth", "Harkrax", "Ignivar", "Jurnash", "Kyranok", "Lygrash",
    "Maelrix",  "Nozdrel", "Ormigon", "Pharvix", "Qundral", "Rysshar", "Skaarok", "Thavrix", "Ulmigon", "Vaelgor",
    "Wyrgarth", "Xendrith", "Yalgron", "Zarvokk", "Arzuron", "Belmorn", "Crythix", "Draxorn", "Elyskar","Faelgor",
    "Grivash",  "Haemrok", "Ironskyr", "Javhorn", "Kezrath", "Lokgrim", "Mournex", "Narthal", "Ogrymon", "Pyrmoth",
    "Quavrix",  "Rexigar", "Sinthyr", "Tazroth", "Urghast", "Vyrmoth", "Wrothak", "Xyzakon", "Yhrisak", "Zolven",
    "Ankrath",  "Braknor", "Cazroth", "Durnval", "Ergron", "Flamrok", "Gharzon", "Hexovar", "Iskaran", "Jaelgor",
    "Kroven",   "Larvok", "Mazgron", "Nyvakar", "Othlarn", "Praxion", "Quornix", "Rhazgul", "Sythrak", "Torgrax",
    "Ulvreth",  "Vorgrim", "Wyrrash", "Xarnok", "Yzareth", "Zindral", "Auvronyx", "Baskrath", "Corthuun", "Drazmeth",
    "Elarion",  "Falkvyr", "Gorvhal", "Hyrnix", "Isvalar", "Jurnyx", "Krozmir", "Lirvash", "Myzthor", "Nalkryn",
    "Ozravan",  "Phaldrak", "Quethys", "Rymvark", "Sylkran", "Tharnyx", "Ulgryth", "Varnok", "Wynthal","Xorthin",
    "Yarnak",   "Zulkrin", "Averusk", "Brimorn", "Calvok", "Durnak", "Eylgar", "Fralnix", "Gavron", "Harkral","Iveros",
    "Jundrel",  "Khaelin", "Lorgrax", "Molthin", "Nyvarn", "Opharon", "Pryntar", "Qyvenar", "Ralkosh", "Skarnyx",
    "Thazruk",  "Ulzakar", "Vorgrax", "Wyrnth", "Xandrek", "Yvelgon", "Zurkash", "Aethros", "Bolgrim", "Cyrkarn", "Droxyl",
    "Egvorn",   "Fylnar", "Goreth", "Haskor", "Inzrak", "Jelgrim", "Kyrval", "Lumith", "Morvex", "Nyzrak", "Orlyth",
    "Pygron",   "Qarnyx", "Ruzgar", "Synrel", "Tavrak", "Ungroth", "Vayrion", "Wenthak", "Xorvak", "Yazven", "Zynthor",
    "Azgron",   "Balvok", "Cindrak", "Drenos", "Ethalor", "Furvak", "Gralkor", "Hymnix", "Izrakel", "Jorvas", "Kellnix", "Lorvak",
    "Myrron",   "Narkesh", "Ormin", "Pavrix", "Quarth", "Rylnax", "Sornak", "Tylroth", "Urvath",
    "Viskor",   "Wulvok", "Xarven", "Yorvik", "Zaldrak",
}

xi.dragon.spawnpoints =
{
    { x = -168, y = 0,    z = 453,  rotation = 119, zone = xi.zone.JUGNER_FOREST_S,        },
    { x = -653, y = -23,  z = -276, rotation = 231, zone = xi.zone.ROLANBERRY_FIELDS_S,    },
    { x = -28,  y = 7,    z = 47,   rotation = 166, zone = xi.zone.SAUROMUGUE_CHAMPAIGN_S, },
    { x = -434, y = -32,  z = 611,  rotation = 34,  zone = xi.zone.VUNKERL_INLET_S,        },
    { x = -500, y = -168, z = 216,  rotation = 23,  zone = xi.zone.GRAUBERG_S,             },
    { x = -443, y = -28,  z = 323,  rotation = 13,  zone = xi.zone.FORT_KARUGO_NARUGO_S,   },
}

local drawIn = function(mob, target)
    local spawnPos = mob:getSpawnPos()
    local drawInTable =
    {
        condition = target:checkDistance(spawnPos) >= 18,
        positon = mob:getPos(),
        wait = 3,
    }

    if drawInTable.condition then
        mob:setMobMod(xi.mobMod.NO_MOVE, 1)
        utils.drawIn(target, drawInTable)
    else
        mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    end
end

local levelSync = function(player)

end

xi.dragon.spawnDragon = function(zone, index)
    local info      = xi.dragon.info[math.random(1, #xi.dragon.info)]
    local name      = xi.dragon.names[math.random(1, #xi.dragon.names)]
    local spawnInfo = xi.dragon.spawnpoints[index]

    -- Don't double down on a zone where a dragon is already spawned
    if zone:getLocalVar('[XISP]dragonSpawned') == 1 then
        return
    end

    local dragon = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = name,
        x                     = spawnInfo.x,
        y                     = spawnInfo.y,
        z                     = spawnInfo.z,
        rotation              = spawnInfo.rotation,
        look                  = info.look,
        groupId               = 101,
        groupZoneId           = 210,
        releaseIdOnDisappear  = true,
        dropId                = 4515,

        onMobSpawn = function(mob)
            zone:setLocalVar('[XISP]dragonSpawned', 1) -- Used for Dragon watchers
            mob:setLocalVar('[XISP]isDragon', 1)
            print("PHALANX DEBUG: Spawning dragon in zone: " .. zone:getName())
            mob:setMobMod(xi.mobMod.SKILL_LIST, info.skillID)
            mob:setMobMod(xi.mobMod.NO_MOVE, 0)
            mob:setMobMod(xi.mobMod.WEAPON_BONUS, 25)
            mob:setMobMod(xi.mobMod.GIL_MIN, 10000)
            mob:setMobMod(xi.mobMod.GIL_MAX, 20000)
            mob:addMod(xi.mod.ATT, 150)
        end,

        onMobRoam = function(mob)
        end,

        onMobEngage = function(mob, target)
        end,

        onMobFight = function(mob, target)
            drawIn(mob, target)
            levelSync(target)
        end,

        onMobDeath = function(mob, player, optParams)
        end,

        onMobDespawn = function(mob, player, optParams)
            zone:setLocalVar('[XISP]dragonSpawned', 0)
        end,
    })

    dragon:setSpawn(spawnInfo.x, spawnInfo.y, spawnInfo.z, spawnInfo.rotation)
    dragon:spawn()
end

xi.dragon.spawnHandler = function()
    if GetServerVariable('[XISP]DragonRespawn') < GetSystemTime() then
        local dragonTable = xi.dragon.spawnpoints
        local index       = math.random(1, #dragonTable)
        local dragon      = dragonTable[index]

        SetServerVariable('[XISP]DragonRespawn', GetSystemTime() + 43200 + math.random(-1200, 1200)) -- Try to spawn a new dragon every ~12 hours
        xi.dragon.spawnDragon(GetZone(dragon.zone), index)
    end
end

xi.dragon.startTimer = function()
    if GetServerVariable('[XISP]DragonRespawn') < GetSystemTime() then
        SetServerVariable('[XISP]DragonRespawn', GetSystemTime() + math.random(600, 900))
    end
end

xi.dragon.onTrigger = function(player, npc)
    local debug = false

    if debug then
        xi.dragon.spawnDragon(GetZone(xi.zone.ROLANBERRY_FIELDS_S), 2)
        return
    end

    for _, dragon in pairs(xi.dragon.spawnpoints) do
        if GetZone(dragon.zone):getLocalVar('[XISP]dragonSpawned') == 1 then
            local zoneName = GetZone(dragon.zone):getName()
            zoneName = zoneName:gsub("%_", " ")
            zoneName = string.gsub(" " .. zoneName, "%W%l", string.upper):sub(2)

            player:printToPlayer("Adventurer! We must amass the dragoons! A dragon was spotted in " .. zoneName .. "!", 0, npc:getPacketName())
            return
        end
    end

    player:printToPlayer("Remain vigilant, adventurer. We have not been able to track any dragons at the moment.", 0, npc:getPacketName())
end