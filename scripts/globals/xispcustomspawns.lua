xi = xi or {}
xi.customspawn = xi.customspawn or {}

xi.customspawn.nms =
{
    [17203216] = xi.item.APTANT_OF_DURUS,  -- King Arthro
    [17289575] = xi.item.APTANT_OF_AECUS,  -- King of Vinegarroon
    [17596720] = xi.item.APTANT_OF_AECUS,  -- Serket
    [17269106] = xi.item.APTANT_OF_HAELAN, -- Roc
    [17228242] = xi.item.APTANT_OF_HAELAN, -- Simurgh
}

xi.customspawn.spawnQM = function(zone, pos, mobID)
    local qm = zone:insertDynamicEntity({
        objtype               = xi.objType.NPC,
        name                  = '???',
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = 0,
        look                  = '0x0000340000000000000000000000000000000000',
        releaseIdOnDisappear  = true,
        namevis               = false,

        onTrade = function(player, qm, trade)
            xi.customspawn.tradeQM(player, qm, trade, mobID)
        end,
    })
    qm:setStatus(xi.status.NORMAL)
end

xi.customspawn.tradeQM = function(player, npc, trade, mobID)
    if
        npcUtil.tradeHasExactly(trade, xi.customspawn.nms[mobID]) and
        npcUtil.popFromQM(player, npc, mobID, { claim = true, radius = 5 })
    then
        player:confirmTrade()
    end
end
