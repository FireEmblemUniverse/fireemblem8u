
#include "global.h"

#include "proc.h"
#include "bmitem.h"
#include "bmunit.h"

#include "cp_common.h"

static void CpOrderMain(struct Proc* proc);
static void CpOrderBerserkInit(struct Proc* proc);
static void CpOrderFunc_BeginDecide(struct Proc* proc);
static int GetUnitBattleAiPriority(struct Unit* unit);
static int GetUnitAiPriority(struct Unit* unit);
static int BuildAiUnitList(void);
static void SortAiUnitList(int count);
static void CpOrderFunc_End(struct Proc* proc);

void sub_8039CAC(struct Proc* proc);

extern ProcFunc gCpDecideMainFunc;

static
u32* CONST_DATA sUnitPriorityArray = (void*) gUnknown_02020188;

struct ProcCmd CONST_DATA gProcScr_CpOrder[] =
{
    PROC_SET_NAME("E_CPORDER"),

    PROC_LOOP_ROUTINE(CpOrderMain),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_BerserkCpOrder[] =
{
    PROC_SET_NAME("E_BSKORDER"),

    PROC_CALL_ROUTINE(CpOrderBerserkInit),
    PROC_LOOP_ROUTINE(CpOrderFunc_End),

    PROC_END,
};

static
ProcFunc CONST_DATA sCpOrderFuncList[] =
{
    CpOrderFunc_BeginDecide,
    CpOrderFunc_End,
};

void CpOrderMain(struct Proc* proc)
{
    sCpOrderFuncList[gAiState.orderState++](proc);
}

void CpOrderBerserkInit(struct Proc* proc)
{
    int i, aiNum = 0;

    u32 faction = gUnknown_0202BCF0.chapterPhaseIndex;

    int factionUnitCountLut[3] = { 62, 20, 50 }; // TODO: named constant for those

    for (i = 0; i < factionUnitCountLut[faction >> 6]; ++i)
    {
        struct Unit* unit = GetUnit(faction + i + 1);

        if (!unit->pCharacterData)
            continue;

        if (unit->statusIndex != UNIT_STATUS_BERSERK)
            continue;

        if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_RESCUED | US_HAS_MOVED_AI))
            continue;

        gAiState.units[aiNum++] = faction + i + 1;
    }

    if (aiNum != 0)
    {
        gAiState.units[aiNum] = 0;
        gAiState.unitIt = gAiState.units;

        gCpDecideMainFunc = sub_8039CAC;

        Proc_CreateBlockingChild(gProcScr_CpDecide, proc);
    }
}

void CpOrderFunc_BeginDecide(struct Proc* proc)
{
    int unitAmt = BuildAiUnitList();

    if (unitAmt != 0)
    {
        SortAiUnitList(unitAmt);

        gAiState.units[unitAmt] = 0;
        gAiState.unitIt = gAiState.units;

        gCpDecideMainFunc = sub_8039CAC;

        Proc_CreateBlockingChild(gProcScr_CpDecide, proc);
    }
}

int GetUnitBattleAiPriority(struct Unit* unit)
{
    int i, item;

    u8 rangedAmt = 0;
    u8 meleeAmt = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && !!(item = unit->items[i]); ++i)
    {
        if (!CanUnitUseWeapon(unit, item) && !CanUnitUseStaff(unit, item))
            continue;

        if (GetItemAttributes(item) & IA_STAFF)
        {
            return 72;
        }

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            int range = GetItemMaxRange(item);

            if (range > 1)
                rangedAmt++;
            else
                meleeAmt++;
        }
    }

    if (rangedAmt != 0)
        return 40;

    if (meleeAmt != 0)
        return 20;

    return 87;
}

int GetUnitAiPriority(struct Unit* unit)
{
    int priority = UNIT_MOV(unit);

    u16 lead = GetUnitLeaderCharId(unit);

    if (UNIT_CATTRIBUTES(unit) & (CA_DANCE | CA_PLAY))
        return priority - 149;

    if (!(unit->_u0A & 1))
    {
        priority += lead << 8;

        if (UNIT_CATTRIBUTES(unit) & CA_STEAL)
            return priority + 60;

        if ((unit->pCharacterData->number == lead) || (UNIT_CATTRIBUTES(unit) & CA_LORD))
            return priority + 87;

        priority = priority + GetUnitBattleAiPriority(unit);
    }

    return priority;
}

int BuildAiUnitList(void)
{
    int i, aiNum = 0;

    u32 faction = gUnknown_0202BCF0.chapterPhaseIndex;
    u32* prioIt = sUnitPriorityArray;

    int factionUnitCountLut[3] = { 62, 20, 50 }; // TODO: named constant for those

    for (i = 0; i < factionUnitCountLut[faction >> 6]; ++i)
    {
        struct Unit* unit = GetUnit(faction + i + 1);

        if (!unit->pCharacterData)
            continue;

        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            continue;

        if (unit->statusIndex == UNIT_STATUS_BERSERK)
            continue;

        if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_RESCUED | US_HAS_MOVED_AI))
            continue;

        gAiState.units[aiNum] = faction + i + 1;
        *prioIt++ = GetUnitAiPriority(unit);

        aiNum++;
    }

    return aiNum;
}

#ifdef NONMATCHING

void SortAiUnitList(int count)
{
    int i, j;

    if (count <= 1)
        return;

    // this is a bubble sort, I think

    for (i = 0; i <= count - 2; ++i)
    {
        for (j = count - 2; j >= i; --j)
        {
            if (sUnitPriorityArray[j] > sUnitPriorityArray[j+1])
            {
                // swap

                int tmp;

                tmp = sUnitPriorityArray[j];
                sUnitPriorityArray[j] = sUnitPriorityArray[j+1];
                sUnitPriorityArray[j+1] = tmp;

                tmp = gAiState.units[j];
                gAiState.units[j] = gAiState.units[j+1];
                gAiState.units[j+1] = tmp;
            }
        }
    }
}

#else // NONMATCH

__attribute__((naked))
void SortAiUnitList(int count)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        cmp r0, #1\n\
        ble _08039AA6\n\
        movs r5, #0\n\
        subs r0, #2\n\
        cmp r5, r0\n\
        bgt _08039AA6\n\
        mov ip, r0\n\
        ldr r1, _08039AB4  @ sUnitPriorityArray\n\
        mov r9, r1\n\
        ldr r1, _08039AB8  @ gAiState\n\
        mov r8, r1\n\
    _08039A6E:\n\
        adds r4, r0, #0\n\
        adds r6, r5, #1\n\
        cmp r0, r5\n\
        blt _08039A9E\n\
        mov r7, r9\n\
        mov r1, r8\n\
        adds r3, r0, r1\n\
    _08039A7C:\n\
        ldr r1, [r7]\n\
        lsls r0, r4, #2\n\
        adds r0, r0, r1\n\
        ldr r2, [r0]\n\
        ldr r1, [r0, #4]\n\
        cmp r2, r1\n\
        bls _08039A96\n\
        str r1, [r0]\n\
        str r2, [r0, #4]\n\
        ldrb r1, [r3]\n\
        ldrb r0, [r3, #1]\n\
        strb r0, [r3]\n\
        strb r1, [r3, #1]\n\
    _08039A96:\n\
        subs r3, #1\n\
        subs r4, #1\n\
        cmp r4, r5\n\
        bge _08039A7C\n\
    _08039A9E:\n\
        adds r5, r6, #0\n\
        mov r0, ip\n\
        cmp r5, r0\n\
        ble _08039A6E\n\
    _08039AA6:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08039AB4: .4byte sUnitPriorityArray\n\
    _08039AB8: .4byte gAiState\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCH

void CpOrderFunc_End(struct Proc* proc)
{
    Proc_ClearNativeCallback(proc);
}
