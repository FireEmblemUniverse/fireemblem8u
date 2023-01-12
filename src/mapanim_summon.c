#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "bm.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmmap.h"
#include "proc.h"
#include "soundwrapper.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "mapanim.h"

void New6C_SummonGfx_FromActionPos(ProcPtr proc)
{
    New6C_SummonGfx(proc, gActionData.xOther, gActionData.yOther);
}

void GenerateSummonUnitDef(void)
{
    u8 rand100 = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Unit* unit;
    short summonerNum, i;

    // 1. Find summoner number from active unit
    summonerNum = -1;
    for (i = 0; i < 3; ++i) {
        if (UNIT_CHAR_ID(gActiveUnit) == gUnknown_0895F5A4[i][0]) {
            summonerNum = i;
            break;
        }
    }

    if (summonerNum == -1)
        return;

    // 2. Clear existing summon
    // NOTE: this may have been a macro? (because of different i and unit?)
    {
        int i;
        for (i = 1; i < 0x40; ++i) {
            struct Unit* unit = GetUnit(i);

            if (UNIT_IS_VALID(unit)) {
                if (UNIT_CHAR_ID(unit) == gUnknown_0895F5A4[summonerNum][1])
                    ClearUnit(unit);
            }
        }
    }

    // 3. Set up unit definition
    unit = NULL;

    // 3.1. Character/Class/Faction/Level/Position
    gUnitDef1.charIndex       = gUnknown_0895F5A4[summonerNum][1];
    gUnitDef1.classIndex      = CLASS_PHANTOM;
    gUnitDef1.leaderCharIndex = CHARACTER_NONE;
    gUnitDef1.autolevel       = TRUE;

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gUnitDef1.allegiance = 0;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_RED)
        gUnitDef1.allegiance = 2;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_GREEN)
        gUnitDef1.allegiance = 1;

    gUnitDef1.level = gActiveUnit->level;

    gUnitDef1.xPosition = gActionData.xOther;
    gUnitDef1.yPosition = gActionData.yOther;

    gUnitDef1.redaCount = 0;
    gUnitDef1.redas = NULL;

    gUnitDef1.genMonster = FALSE;
    gUnitDef1.itemDrop = FALSE;

    // 3.2. Items (generated from random number)
    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
        gUnitDef1.items[i] = ITEM_NONE;

    if (gActiveUnit->level <= 5)
        gUnitDef1.items[0] = ITEM_AXE_IRON;
    else if (gActiveUnit->level <= 10) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;
        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 15) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 20) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else if (rand100 >= 26 && rand100 < 37)
            gUnitDef1.items[0] = ITEM_AXE_TOMAHAWK;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }

    // 3.3. Ai (is null)
    for (i = 0; i < 4; ++i)
        gUnitDef1.ai[i] = 0;

    // 4. Load unit
    unit = GetUnitFromCharId(gUnknown_0895F5A4[summonerNum][1]);

    if (unit == NULL) {
        struct BattleUnit bu = gBattleActor;
        LoadUnits(&gUnitDef1);
        gBattleActor = bu;
    }

    // 5. Set level and weapon ranks
    unit = GetUnitFromCharId(gUnknown_0895F5A4[summonerNum][1]);

    for (i = 0; i < 4; ++i)
        unit->ranks[i] = 0;

    unit->level = gActiveUnit->level;
    unit->exp   = UNIT_EXP_DISABLED;

    if (gActiveUnit->level <= 5)
        unit->ranks[ITYPE_AXE] = WPN_EXP_D;
    else if (gActiveUnit->level <= 10)
        unit->ranks[ITYPE_AXE] = WPN_EXP_C;
    else if (gActiveUnit->level <= 15)
        unit->ranks[ITYPE_AXE] = WPN_EXP_B;
    else if (gActiveUnit->level <= 20)
        unit->ranks[ITYPE_AXE] = WPN_EXP_A;
}

void ProcSummonDK_InitCounters(struct SumProc* proc)
{
    proc->counter = 0;
    proc->monsters = 0;
}

void ProcSummonDK_CheckIsEnough(struct SumProc* proc)
{
    if (proc->counter < 8)
        Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_START);
}

s8 CheckCanSummon(struct SumProc* proc)
{
    s8 count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit)) {
            if (count >= 40) {
                Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_TERMINAL);
                return TRUE;
            }
            count++;
        }
    }

    if (proc->counter < 8 && proc->monsters < 4)
        return FALSE;

    Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_TERMINAL);
    return TRUE;
}

void sub_807B054(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void ProcSummonDK_ResetCounter(struct SumProc* proc)
{
    proc->counter++;
    proc->monsters = 0;

    New6C_SummonGfx(proc, proc->x, proc->y);
}

s8 SelectSummonPos(int x, int y, struct SumThing* result)
{
    // It is very strange that in this function, CanUnitCrossTerrain should return as int(*)(Unit*, int)
    extern int CanUnitCrossTerrain(struct Unit* unit, int terrain);

    struct SumThing array[9];
    u8 chosen, count = 0;
    short iy, ix;

    for (iy = y - 1; iy < y + 2; ++iy) {
        if (iy < 0 || gBmMapSize.y <= iy)
            continue;

        for (ix = x - 1; ix < x + 2; ++ix) {
            if (ix < 0 || gBmMapSize.x <= ix)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue; // there's a unit here!

            if (gRAMChapterData.chapterVisionRange && gBmMapFog[iy][ix] == 0)
                continue; // there's fog here!

            if (!CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[iy][ix]))
                continue; // can't cross terrain!

            array[count].x = ix;
            array[count].y = iy;
            array[count].boolAvailable = TRUE;
            count++;
        }
    }

    if (!count)
        return -1;

    chosen = NextRN_N(count);
    *result = array[chosen];
    return 1;
}

void SelSumPosAndMoveCamera(struct SumProc* proc, s8 x, s8 y, short arg3)
{
    struct SumThing thing;
    if (CheckCanSummon(proc))
        return;

    if (SelectSummonPos(x, y, &thing) == -1 || thing.boolAvailable == -1) {
        proc->monsters++;
        Proc_Goto(proc, arg3);
    } else {
        proc->x = thing.x;
        proc->y = thing.y;

        EnsureCameraOntoPosition(proc, proc->x, proc->y);
    }
}

void ProcSummonDK_SelectDownPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos + 4,
        PROC_LABEL_SUMDK_LOAD_POS_RIGHT);
}

void ProcSummonDK_SelectRightPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos + 4, gBattleActor.unit.yPos,
        PROC_LABEL_SUMDK_LOAD_POS_LEFT);
}

void ProcSummonDK_SelectLeftPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos - 4, gBattleActor.unit.yPos,
        PROC_LABEL_SUMDK_LOAD_POS_UP);
}

void ProcSummonDK_SelectUpPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos - 4,
        PROC_LABEL_SUMDK_LOAD_POS_END);
}

void LoadSumMonsterFromDK(struct SumProc* proc)
{
    u8 num = DivRem(AdvanceGetLCGRNValue(), 11);

    gUnitDef2 = gUnitDefSumDK[num];

    gUnitDef2.autolevel = TRUE;
    gUnitDef2.allegiance = 2;
    gUnitDef2.level = 5 + num;

    gUnitDef2.xPosition = proc->x;
    gUnitDef2.yPosition = proc->y;

    LoadUnits(&gUnitDef2);
}

/** 
 * section.data
*/

CONST_DATA struct ProcCmd ProcScr_MapAnimSummon[] = {
    PROC_CALL(AddSkipThread2),
    PROC_CALL(GenerateSummonUnitDef),
    PROC_CALL(New6C_SummonGfx_FromActionPos),
    PROC_SLEEP(0x5),
    PROC_JUMP(gProc_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimSumDK[] = {
    PROC_CALL(AddSkipThread2),
    PROC_CALL(ProcSummonDK_InitCounters),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_START),
    PROC_CALL(ProcSummonDK_SelectDownPos),
    PROC_SLEEP(0x5),
    PROC_CALL(LoadSumMonsterFromDK),
    PROC_CALL(ProcSummonDK_ResetCounter),
    PROC_SLEEP(0x5),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_POS_RIGHT),
    PROC_CALL(ProcSummonDK_SelectRightPos),
    PROC_SLEEP(0x5),
    PROC_CALL(LoadSumMonsterFromDK),
    PROC_CALL(ProcSummonDK_ResetCounter),
    PROC_SLEEP(0x5),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_POS_LEFT),
    PROC_CALL(ProcSummonDK_SelectLeftPos),
    PROC_SLEEP(0x5),
    PROC_CALL(LoadSumMonsterFromDK),
    PROC_CALL(ProcSummonDK_ResetCounter),
    PROC_SLEEP(0x5),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_POS_UP),
    PROC_CALL(ProcSummonDK_SelectUpPos),
    PROC_SLEEP(0x5),
    PROC_CALL(LoadSumMonsterFromDK),
    PROC_CALL(ProcSummonDK_ResetCounter),
    PROC_SLEEP(0x5),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_POS_END),
    PROC_CALL(ProcSummonDK_CheckIsEnough),
    PROC_LABEL(PROC_LABEL_SUMDK_LOAD_TERMINAL),
    PROC_JUMP(gProc_MapAnimEnd),
};
