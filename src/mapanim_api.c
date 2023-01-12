#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmbattle.h"
#include "mu.h"
#include "event.h"
#include "hardware.h"
#include "ap.h"
#include "bmio.h"
#include "event.h"
#include "bmudisp.h"
#include "bm.h"
#include "constants/items.h"
#include "mapanim.h"

void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit)
{
    if (!bu)
        return;

    gCurrentMapAnimState.actors[maActor].pUnit = unit;
    gCurrentMapAnimState.actors[maActor].pBattleUnit   = bu;
    gCurrentMapAnimState.actors[maActor].pMUProc   = MU_Create(unit);

    gCurrentMapAnimState.actors[maActor].pMUProc->pAPHandle->frameTimer    = 0;
    gCurrentMapAnimState.actors[maActor].pMUProc->pAPHandle->frameInterval = 0;

    if (BUNIT_IS_OBSTACLE(bu))
        MU_Hide(gCurrentMapAnimState.actors[maActor].pMUProc);

    switch (unit->statusIndex) {

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        MU_SetPaletteId(gCurrentMapAnimState.actors[maActor].pMUProc, BM_OBJPAL_UNIT_GRAYED);
        break;
    } // switch (unit->statusIndex)
}

void SetBattleAnimFacing(int maActor, int maOpponent, int facing)
{
    int muFacing;
    switch (facing){
    case MA_FACING_OPPONENT:
        muFacing = GetFacingDirection(
            gCurrentMapAnimState.actors[maActor].pUnit->xPos,    gCurrentMapAnimState.actors[maActor].pUnit->yPos,
            gCurrentMapAnimState.actors[maOpponent].pUnit->xPos, gCurrentMapAnimState.actors[maOpponent].pUnit->yPos);

        MU_SetFacing(gCurrentMapAnimState.actors[maActor].pMUProc, muFacing);

        break;

    case MA_FACING_DEFAULT:
        MU_SetDefaultFacing(gCurrentMapAnimState.actors[maActor].pMUProc);
        break;

    case MA_FACING_UNK:
        muFacing = GetFacingDirection(
            gCurrentMapAnimState.actors[maActor].pUnit->xPos, gCurrentMapAnimState.actors[maActor].pUnit->yPos, 0, 0);

        MU_SetFacing(gCurrentMapAnimState.actors[maActor].pMUProc, muFacing);
        break;
    } // switch (facing)
}

void SetupBattleMOVEUNITs(void)
{
    int maFacing = GetSpellAssocFacing(gCurrentMapAnimState.actors[0].pBattleUnit->weaponBefore);
    sub_807B4D0();

    switch (gCurrentMapAnimState.actorCount_maybe) {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK) {
            // In triangle attacks, both partners face the opponent too
            SetBattleAnimFacing(2, 1, maFacing);
            SetBattleAnimFacing(3, 1, maFacing);
        }

        SetBattleAnimFacing(1, 0, maFacing);
        // fallthrough

    case 1:
        SetBattleAnimFacing(0, 1, maFacing);
        break;
    } // switch (gCurrentMapAnimState.actorCount_maybe)
}

void sub_807B4D0(void)
{
    u8 array[4];
    int i, j;
    int count = gCurrentMapAnimState.actorCount_maybe;

    switch (gCurrentMapAnimState.actorCount_maybe) {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
            count += 2;
        break;

    case 1:
        break;

    } // switch (gCurrentMapAnimState.actorCount_maybe)

    // Init ref array
    for (i = 0; i < count; ++i)
        array[i] = i;

    // Sort ref array
    for (i = 0; i < count-1; ++i) {
        for (j = i+1; j < count; ++j) {
            int swap = FALSE;
            if (gCurrentMapAnimState.actors[array[i]].pUnit->yPos == gCurrentMapAnimState.actors[array[j]].pUnit->yPos) {
                if (gCurrentMapAnimState.actors[array[i]].pUnit->xPos >= gCurrentMapAnimState.actors[array[j]].pUnit->xPos)
                    swap = TRUE;
            } else if (gCurrentMapAnimState.actors[array[i]].pUnit->yPos >= gCurrentMapAnimState.actors[array[j]].pUnit->yPos)
                swap = TRUE;

            if (swap) {
                u8 tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }

    // Apply
    for (i = 0; i < count; ++i)
        gCurrentMapAnimState.actors[array[i]].pMUProc->pAPHandle->objLayer = gUnknown_08205714[i];
}

void BeginMapAnimForPoisonDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 0;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimPoisonDmg, PROC_TREE_3);
}

void BeginMapAnimForEggDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 0;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimEggDmg, PROC_TREE_3);
}

void BeginMapAnimForCritAtk(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 0;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimCritAtk, PROC_TREE_3);
}

void BeginMapAnimForSteal(void)
{
    gBattleActor.weaponBefore = ITEM_SWORD_IRON;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 1;
    gCurrentMapAnimState.actorCount_maybe = 2;

    gCurrentMapAnimState.subjectActorId = 0;
    gCurrentMapAnimState.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSteal, PROC_TREE_3);
}

void BeginMapAnimForSummon(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 2;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.subjectActorId = 0;
    gCurrentMapAnimState.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSummon, PROC_TREE_3);
}

void BeginMapAnimForSummonDK(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 2;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.subjectActorId = 0;
    gCurrentMapAnimState.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSumDK, PROC_TREE_3);
}

void BeginMapAnimForDance(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 2;
    gCurrentMapAnimState.actorCount_maybe = 1;

    gCurrentMapAnimState.subjectActorId = 0;
    gCurrentMapAnimState.targetActorId = 0;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimDance, PROC_TREE_3);
}

void BeginBattleMapAnims(void)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_DANCERING)) {
        BeginMapAnimForDance();
        return;
    }

    gCurrentMapAnimState.u5F = 0;
    gCurrentMapAnimState.u62 = 0;

    SetupMapAnimSpellData(&gBattleActor, &gBattleTarget, gBattleHitArray);
    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);

    if (!EventEngineExists())
        Proc_Start(ProcScr_MapAnimBattle, PROC_TREE_3);
    else
        Proc_Start(ProcScr_MapAnimEventBattle, PROC_TREE_3);
}

void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    gCurrentMapAnimState.actorCount_maybe = GetSpellAssocCharCount(actor->weaponBefore);
    gCurrentMapAnimState.pCurrentRound    = hit;
    gCurrentMapAnimState.specialProcScr   = GetSpellAssocAlt6CPointer(actor->weaponBefore);
}

void SetupMapBattleAnim(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    int i;

    MakeBattleMOVEUNIT(0, actor, &actor->unit);

    if (gCurrentMapAnimState.actorCount_maybe > 1)
    {
        HideUnitSprite(&gBattleTarget.unit); // NOTE: uses gBattleTarget instead of target argument
        MakeBattleMOVEUNIT(1, target, &target->unit);
    }

    if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
    {
        MakeBattleMOVEUNIT(2, actor, gBattleStats.taUnitA);
        MakeBattleMOVEUNIT(3, actor, gBattleStats.taUnitB);

        HideUnitSprite(gBattleStats.taUnitA);
        HideUnitSprite(gBattleStats.taUnitB);
    }

    SetupBattleMOVEUNITs();

    for (i = 0; i < gCurrentMapAnimState.actorCount_maybe; ++i)
    {
        gCurrentMapAnimState.actors[i].u0D = gCurrentMapAnimState.actors[i].pBattleUnit->hpInitial;
        gCurrentMapAnimState.actors[i].u0C = GetUnitMaxHp(gCurrentMapAnimState.actors[i].pUnit);
    }

    SetDefaultColorEffects();
}

int GetFacingDirection(int xFrom, int yFrom, int xTo, int yTo)
{
    if (ABS(xTo - xFrom)*2 < ABS(yTo - yFrom))
    {
        if (yFrom < yTo)
            return MU_FACING_DOWN;
        else
            return MU_FACING_UP;
    }
    else
    {
        if (xFrom < xTo)
            return MU_FACING_RIGHT;
        else
            return MU_FACING_LEFT;
    }
}

/* section.rodata */
const u8 gUnknown_08205714[4] = {
    10, 9, 8, 7,
};


/* section.data */
CONST_DATA struct ProcCmd ProcScr_MapAnimDance[] = {
    PROC_CALL(AddSkipThread2),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x14),
    PROC_CALL(sub_80812C0),
    PROC_SLEEP(0x50),
    PROC_CALL(StartDanceringAnim),
    PROC_SLEEP(0xA),
    PROC_CALL(sub_80813C0),
    PROC_SLEEP(0x14),
    PROC_JUMP(gProc_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimBattle[] = {
    PROC_CALL(AddSkipThread2),
    PROC_CALL(_InitFontForUIDefault),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_CallBattleQuoteEvents),
    PROC_WHILE(BattleEventEngineExists),
    PROC_SLEEP(0x5),
    PROC_CALL(SetBattleMuPalette),
    PROC_CALL(SetupBattleMOVEUNITs),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),
PROC_LABEL(0x0),
    PROC_REPEAT(MapAnim_PrepareNextBattleRound),
    PROC_CALL(MapAnim_DisplayRoundAnim),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_ShowPoisonEffectIfAny),
    PROC_SLEEP(0x1),
    PROC_SLEEP(0x5),
    PROC_GOTO(0x0),
};

CONST_DATA struct ProcCmd gProc_MapAnimEnd[] = {
    PROC_CALL(MapAnimProc_DisplayDeahQuote),
    PROC_WHILE(BattleEventEngineExists),
    PROC_CALL(MapAnmiProc_DisplayDeathFade),
    PROC_WHILE_EXISTS(gProcScr_MUDeathFade),
    PROC_CALL(DeleteBattleAnimInfoThing),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnimProc_DisplayItemStealingPopup),
    PROC_YIELD,
    PROC_CALL(MapAnimProc_DisplayExpBar),
    PROC_YIELD,
    PROC_CALL(DisplayWpnBrokePopup),
    PROC_SLEEP(0x8),
    PROC_CALL(DisplayWRankUpPopup),
    PROC_YIELD,
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(SubSkipThread2),
    PROC_CALL(MapAnim_Cleanup),
    PROC_END
};
