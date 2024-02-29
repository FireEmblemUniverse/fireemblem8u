
#include "global.h"

#include "proc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "cp_utility.h"
#include "cp_script.h"
#include "bmsave.h"
#include "bmmind.h"
#include "constants/classes.h"

#include "cp_common.h"

static void CpDecide_Suspend(ProcPtr proc);
static void CpDecide_Main(ProcPtr proc);

static void DecideHealOrEscape(void);
static void DecideScriptA(void);
static void DecideScriptB(void);
static void DecideSpecialItems(void);

EWRAM_DATA struct AiDecision gAiDecision = {0};

typedef void(*DecideFunc)(void);

static DecideFunc CONST_DATA sDecideFuncList[] =
{
    DecideHealOrEscape,
    DecideScriptA,
    DecideScriptB,
    DecideSpecialItems,
    NULL, NULL,
};

static DecideFunc CONST_DATA sUnused_085A7FB4[] =
{
    DecideSpecialItems,
    DecideScriptA,
    DecideHealOrEscape,
    DecideScriptB,
    NULL, NULL,
};

struct ProcCmd CONST_DATA gProcScr_CpDecide[] =
{
    PROC_NAME("E_CPDECIDE"),

PROC_LABEL(0),
    PROC_CALL(CpDecide_Main),
    PROC_SLEEP(0),

    PROC_CALL(CpDecide_Suspend),

    PROC_GOTO(0),

    PROC_END,
};

void CpDecide_Suspend(ProcPtr proc)
{
    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gActionData.suspendPointType = SUSPEND_POINT_BSKPHASE;
    else
        gActionData.suspendPointType = SUSPEND_POINT_CPPHASE;

    WriteSuspendSave(SAVE_ID_SUSPEND);
}

void CpDecide_Main(ProcPtr proc)
{
next_unit:
    gAiState.decideState = 0;

    if (*gAiState.unitIt)
    {
        gAiState.unk7C = 0;

        gActiveUnitId = *gAiState.unitIt;
        gActiveUnit = GetUnit(gActiveUnitId);

        if (gActiveUnit->state & (US_DEAD | US_UNSELECTABLE) || !gActiveUnit->pCharacterData)
        {
            gAiState.unitIt++;
            goto next_unit;
        }

        do
        {
            RefreshEntityBmMaps();
            RenderBmMap();
            RefreshUnitSprites();

            AiUpdateNoMoveFlag(gActiveUnit);

            gAiState.combatWeightTableId = (gActiveUnit->ai3And4 & 0xF8) >> 3;

            gAiState.dangerMapFilled = FALSE;
            AiInitDangerMap();

            AiClearDecision();
            AiDecideMainFunc();

            gActiveUnit->state |= US_HAS_MOVED_AI;

            if (!gAiDecision.actionPerformed ||
                (gActiveUnit->xPos == gAiDecision.xMove && gActiveUnit->yPos == gAiDecision.yMove && gAiDecision.actionId == AI_ACTION_NONE))
            {
                // Ignoring actions that are just moving to the same square

                gAiState.unitIt++;
                Proc_Goto(proc, 0);
            }
            else
            {
                gAiState.unitIt++;
                Proc_StartBlocking(gProcScr_CpPerform, proc);
            }
        } while (0);
    }
    else
    {
        Proc_End(proc);
    }
}

void AiClearDecision(void)
{
    gAiDecision.actionId = 0;

    gAiDecision.unitId = 0;
    gAiDecision.xMove = 0;
    gAiDecision.yMove = 0;
    gAiDecision.unk04 = 0;
    gAiDecision.unk05 = 0;
    gAiDecision.targetId = 0;
    gAiDecision.itemSlot = 0;
    gAiDecision.xTarget = 0;
    gAiDecision.yTarget = 0;

    gAiDecision.actionPerformed = FALSE;
}

void AiSetDecision(s16 xMove, s16 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    gAiDecision.unitId = gActiveUnitId;
    gAiDecision.xMove = xMove;
    gAiDecision.yMove = yMove;

    gAiDecision.actionId = actionId;

    gAiDecision.targetId = targetId;
    gAiDecision.itemSlot = itemSlot;
    gAiDecision.xTarget = xTarget;
    gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}

void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    if (actionId != 0xFF)
        gAiDecision.actionId = actionId;

    if (targetId != 0xFF)
        gAiDecision.targetId = targetId;

    if (itemSlot != 0xFF)
        gAiDecision.itemSlot = itemSlot;

    if (xTarget != 0xFF)
        gAiDecision.xTarget = xTarget;

    if (yTarget != 0xFF)
        gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}

void AiDecideMain(void)
{
    while (sDecideFuncList[gAiState.decideState] && !gAiDecision.actionPerformed)
    {
        sDecideFuncList[gAiState.decideState++]();
    }
}

void DecideHealOrEscape(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    if (AiUpdateGetUnitIsHealing(gActiveUnit) == TRUE)
    {
        struct Vec2 vec2;

        if (AiTryHealSelf() == TRUE)
            return;

        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
        {
            AiTryDanceOrStealAfterMove();
            return;
        }

        if (AiTryGetNearestHealPoint(&vec2) != TRUE)
            return;

        AiTryMoveTowards(vec2.x, vec2.y, 0, 0, 1);

        if (gAiDecision.actionPerformed == TRUE)
            AiTryActionAfterMove();
    }
    else
    {
        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
            AiTryDanceOrStealAfterMove();
    }
}

void DecideSpecialItems(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    AiTryDoSpecialItems();
}

void DecideScriptA(void)
{
    int i = 0;

    if (UNIT_IS_GORGON_EGG(gActiveUnit))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        AiDoBerserkAction();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (AiTryExecScriptA() == TRUE)
            return;
    }

    AiExecFallbackScriptA();
}

void DecideScriptB(void)
{
    int i = 0;

    if ((gActiveUnit->state & US_IN_BALLISTA) && (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) != NULL))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        AiDoBerserkMove();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (AiTryExecScriptB() == TRUE)
            return;
    }

    AiExecFallbackScriptB();
}
