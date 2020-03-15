
#include "global.h"

#include "proc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"

#include "constants/classes.h"

#include "cp_common.h"

void ClearSomeAIRelatedStruct(void);

s8 UpdateUnitHealingAIStatus(struct Unit* unit);

struct Trap* sub_803795C(int x, int y);
void sub_803BA08(int x, int y, int arg2, int arg3, int arg4);
s8 sub_803C4BC(void);
void sub_803C510(void);
s8 sub_803C54C();
void sub_803C5A0();
void sub_803D3E4(void);
void sub_803D404(void);
void sub_803E2F4(void);
s8 sub_803E470(struct Vec2* out);
s8 sub_803E718(void);
s8 sub_803E7D0(void);
void sub_803ECC4(void);
void sub_803ECF0(void);
void sub_8040844(void);
void sub_8041090(struct Unit* unit);

extern void(*(gUnknown_085A7F9C[]))(void);

void sub_8039AC8(void)
{
    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gActionData.suspendPointType = SUSPEND_POINT_BSKPHASE;
    else
        gActionData.suspendPointType = SUSPEND_POINT_CPPHASE;

    SaveSuspendedGame(SAVE_BLOCK_SUSPEND_BASE);
}

#if NONMATCHING

void Call6C_E_CPDECIDE(ProcPtr proc)
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

        RefreshEntityBmMaps();
        RenderBmMap();
        SMS_UpdateFromGameData();

        sub_8041090(gActiveUnit);

        gAiState.combatWeightTableId = (gActiveUnit->ai3And4 & 0xF8) >> 3;

        gAiState.dangerMapFilled = FALSE;
        sub_803E2F4();

        ClearSomeAIRelatedStruct();

        gCpDecideMainFunc();

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
    }
    else
    {
        Proc_End(proc);
    }
}

#else // if !NONMATCHING

__attribute__((naked))
void Call6C_E_CPDECIDE(ProcPtr proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r7, r0, #0\n\
    _08039B04:\n\
        ldr r4, _08039B48  @ gAiState\n\
        adds r0, r4, #0\n\
        adds r0, #0x79\n\
        movs r1, #0\n\
        strb r1, [r0]\n\
        ldr r2, [r4, #0x74]\n\
        ldrb r0, [r2]\n\
        cmp r0, #0\n\
        beq _08039BF4\n\
        adds r0, r4, #0\n\
        adds r0, #0x7c\n\
        strb r1, [r0]\n\
        ldr r1, _08039B4C  @ gActiveUnitId\n\
        ldrb r0, [r2]\n\
        strb r0, [r1]\n\
        ldrb r0, [r1]\n\
        bl GetUnit\n\
        adds r1, r0, #0\n\
        ldr r6, _08039B50  @ gActiveUnit\n\
        str r1, [r6]\n\
        ldr r5, [r1, #0xc]\n\
        movs r0, #6\n\
        ands r5, r0\n\
        cmp r5, #0\n\
        bne _08039B3E\n\
        ldr r0, [r1]\n\
        cmp r0, #0\n\
        bne _08039B54\n\
    _08039B3E:\n\
        ldr r0, [r4, #0x74]\n\
        adds r0, #1\n\
        str r0, [r4, #0x74]\n\
        b _08039B04\n\
        .align 2, 0\n\
    _08039B48: .4byte gAiState\n\
    _08039B4C: .4byte gActiveUnitId\n\
    _08039B50: .4byte gActiveUnit\n\
    _08039B54:\n\
        bl RefreshEntityBmMaps\n\
        bl RenderBmMap\n\
        bl SMS_UpdateFromGameData\n\
        ldr r0, [r6]\n\
        bl sub_8041090\n\
        ldr r0, [r6]\n\
        adds r0, #0x40\n\
        ldrh r1, [r0]\n\
        movs r0, #0xf8\n\
        ands r0, r1\n\
        lsrs r0, r0, #3\n\
        adds r1, r4, #0\n\
        adds r1, #0x7d\n\
        strb r0, [r1]\n\
        adds r0, r4, #0\n\
        adds r0, #0x7a\n\
        strb r5, [r0]\n\
        bl sub_803E2F4\n\
        bl ClearSomeAIRelatedStruct\n\
        ldr r0, _08039BD0  @ gCpDecideMainFunc\n\
        ldr r0, [r0]\n\
        bl _call_via_r0\n\
        ldr r2, [r6]\n\
        ldr r0, [r2, #0xc]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        orrs r0, r1\n\
        str r0, [r2, #0xc]\n\
        ldr r1, _08039BD4  @ gAiDecision\n\
        movs r0, #0xa\n\
        ldrsb r0, [r1, r0]\n\
        cmp r0, #0\n\
        beq _08039BBE\n\
        movs r0, #0x10\n\
        ldrsb r0, [r2, r0]\n\
        ldrb r3, [r1, #2]\n\
        cmp r0, r3\n\
        bne _08039BD8\n\
        movs r0, #0x11\n\
        ldrsb r0, [r2, r0]\n\
        ldrb r2, [r1, #3]\n\
        cmp r0, r2\n\
        bne _08039BD8\n\
        ldrb r0, [r1]\n\
        cmp r0, #0\n\
        bne _08039BD8\n\
    _08039BBE:\n\
        ldr r0, [r4, #0x74]\n\
        adds r0, #1\n\
        str r0, [r4, #0x74]\n\
        adds r0, r7, #0\n\
        movs r1, #0\n\
        bl Proc_Goto\n\
        b _08039BFA\n\
        .align 2, 0\n\
    _08039BD0: .4byte gCpDecideMainFunc\n\
    _08039BD4: .4byte gAiDecision\n\
    _08039BD8:\n\
        ldr r0, _08039BEC  @ gAiState\n\
        ldr r1, [r0, #0x74]\n\
        adds r1, #1\n\
        str r1, [r0, #0x74]\n\
        ldr r0, _08039BF0  @ gProcScr_CpPerform\n\
        adds r1, r7, #0\n\
        bl Proc_StartBlocking\n\
        b _08039BFA\n\
        .align 2, 0\n\
    _08039BEC: .4byte gAiState\n\
    _08039BF0: .4byte gProcScr_CpPerform\n\
    _08039BF4:\n\
        adds r0, r7, #0\n\
        bl Proc_End\n\
    _08039BFA:\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void ClearSomeAIRelatedStruct(void)
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

void sub_8039C20(u8 xMove, u8 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
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

void sub_8039C64(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
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

void sub_8039CAC(void)
{
    while (gUnknown_085A7F9C[gAiState.decideState] && !gAiDecision.actionPerformed)
    {
        gUnknown_085A7F9C[gAiState.decideState++]();
    }
}

void sub_8039D10(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    if (UpdateUnitHealingAIStatus(gActiveUnit) == TRUE)
    {
        struct Vec2 vec2;

        if (sub_803E718() == TRUE)
            return;

        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (sub_803E7D0() == TRUE))
        {
            sub_803ECC4();
            return;
        }

        if (sub_803E470(&vec2) != TRUE)
            return;

        sub_803BA08(vec2.x, vec2.y, 0, 0, 1);

        if (gAiDecision.actionPerformed == TRUE)
            sub_803ECF0();
    }
    else
    {
        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (sub_803E7D0() == TRUE))
            sub_803ECC4();
    }
}

void sub_8039DC4(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    sub_8040844();
}

void sub_8039DE0(void)
{
    int i = 0;

    if (UNIT_IS_GORGON_EGG(gActiveUnit))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        sub_803D3E4();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (sub_803C4BC() == TRUE)
            return;
    }

    sub_803C510();
}

void sub_8039E2C(void)
{
    int i = 0;

    if ((gActiveUnit->state & US_IN_BALLISTA) && (sub_803795C(gActiveUnit->xPos, gActiveUnit->yPos) != NULL))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        sub_803D404();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (sub_803C54C() == TRUE)
            return;
    }

    sub_803C5A0();
}
