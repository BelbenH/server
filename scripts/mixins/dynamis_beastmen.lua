-----------------------------------
-- Dynamis procs mixin
-----------------------------------
require('scripts/globals/mixins')
require('scripts/globals/dynamis')
-----------------------------------
g_mixins = g_mixins or {}

g_mixins.dynamis_beastmen = function(dynamisBeastmenMob)
    local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
    }

    local familyCurrency =
    {
        [xi.mobFamily.ORC   ] = xi.item.ORDELLE_BRONZEPIECE, -- Orc
        [xi.mobFamily.QUADAV] = xi.item.ONE_BYNE_BILL,       -- Quadav
        [xi.mobFamily.YAGUDO] = xi.item.TUKUKU_WHITESHELL,   -- Yagudo
    }

    -- Default drop rate w/o TH is 10%. Proc'ing the monster opens up extra slots
    -- to drop at higher drop rates. The indexing is based off the amount of times that the
    -- mob was proc'ed
    local thCurrency =
    {
        [0] = { single = 1000, hundred = 50  }, 
        [1] = { single = 1000, hundred = 50  },
        [2] = { single = 1000, hundred = 100 },
        [3] = { single = 1500, hundred = 100 },
        [4] = { single = 2400, hundred = 500 },
    }

    local elementData =
    {
        xi.damageType.FIRE,
        xi.damageType.ICE,
        xi.damageType.WIND,
        xi.damageType.EARTH,
        xi.damageType.THUNDER,
        xi.damageType.WATER,
        xi.damageType.LIGHT,
        xi.damageType.DARK,
    }

    dynamisBeastmenMob:addListener('SPAWN', 'DYNAMIS_SPAWN', function(mob)
        mob:setLocalVar('element', math.random(1, #elementData))
    end)

    -- Need a 4th trigger method. Skillchains? the better the skillchain, the greater the chance

    dynamisBeastmenMob:addListener('TAKE_DAMAGE', 'DYNAMIS_DEALT_DAMAGE', function(mobArg, damage, attacker, attackType, damageType)
        if not attacker then
            return
        end

        local triggerElement = elementData[mobArg:getLocalVar('element')]

        if 
            damageType == triggerElement and
            damage >= 100
        then
            local chance = 35
            xi.dynamis.procMonster(target, attacker, chance)
        end
    end)

    dynamisBeastmenMob:addListener('WEAPONSKILL_TAKE', 'DYNAMIS_WS_PROC_CHECK', function(user, target, skill, tp, action)
        local chance = 15
        xi.dynamis.procMonster(target, user, chance)
    end)

    dynamisBeastmenMob:addListener('ABILITY_TAKE', 'DYNAMIS_ABILITY_PROC_CHECK', function(user, target, skill, action)
        local chance = 10
        xi.dynamis.procMonster(target, user, chance)
    end)

    dynamisBeastmenMob:addListener('DEATH', 'DYNAMIS_ITEM_DISTRIBUTION', function(mob, killer)
        if not killer then
            return
        end

        local currency      = familyCurrency[mob:getFamily()] or xi.item.TUKUKU_WHITESHELL + math.randomInt(0, 2) * 3
        local singleChance  = mob:getMainLvl() > 90 and math.floor(th.single * 1.5) or th.single
        local hundredChance = th.hundred
        local procRate      = mob:getLocalVar('dynamis_proc')
        local thLvl         = mob:getTHLevel()
        local dropRate      = 0
        local thDropRate    = 0

        print('==DYNAMIS== Droprate test to ensure math.random runs on runtime and not on build' .. math.random(1, 10))
        
        for _, member in pairs(killer:getAlliance()) do
            -- Base hundred slot
            if mob:isNM() then
                dropRate   = thCurrency[procRate]
                thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

                if math.random(1,10000) < thDropRate then
                    npcUtil.giveItem(member, currency + 1)
                end
            end
            
            -- White (4 procs) adds single slot
            if procRate >= 4 then
                dropRate   = thCurrency[4]
                thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

                if math.random(1,10000) < thDropRate then
                    npcUtil.giveItem(member, currency)
                end
            end

            -- red (3 procs) adds single slot
            if procRate >= 3 then
                dropRate   = thCurrency[3]
                thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

                if math.random(1,10000) < thDropRate then
                    npcUtil.giveItem(member, currency)
                end
            end
    
            -- yellow (2 procs) adds single slot
            if procRate >= 2 then
                dropRate   = thCurrency[2]
                thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

                if math.random(1,10000) < thDropRate then
                    npcUtil.giveItem(member, currency)
                end
            end
    
            -- blue (1 proc) adds single slot
            if procRate >= 1 then
                dropRate   = thCurrency[1]
                thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

                if math.random(1,10000) < thDropRate then
                    npcUtil.giveItem(member, currency)
                end
            end
    
            -- Base single slot
            dropRate   = thCurrency[procRate]
            thDropRate = xi.combat.treasureHunter.getDropRate(thLvl, dropRate)

            if math.random(1,10000) < thDropRate then
                npcUtil.giveItem(member, currency)
            end
        end
        
    end)
end

return g_mixins.dynamis_beastmen
