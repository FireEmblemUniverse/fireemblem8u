#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmbattle.h"
#include "mu.h"
#include "event.h"
#include "hardware.h"
#include "ap.h"
#include "bmio.h"
#include "constants/items.h"
#include "mapanim.h"

void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit)
{
    if (!bu)
        return;

    gMapBattle.actors[maActor].pUnit = unit;
    gMapBattle.actors[maActor].pBattleUnit   = bu;
    gMapBattle.actors[maActor].pMUProc   = MU_Create(unit);

    gMapBattle.actors[maActor].pMUProc->pAPHandle->frameTimer    = 0;
    gMapBattle.actors[maActor].pMUProc->pAPHandle->frameInterval = 0;

    if (BUNIT_IS_OBSTACLE(bu))
        MU_Hide(gMapBattle.actors[maActor].pMUProc);

    switch (unit->statusIndex) {

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        MU_SetPaletteId(gMapBattle.actors[maActor].pMUProc, BM_OBJPAL_UNIT_GRAYED);
        break;
    } // switch (unit->statusIndex)
}

void SetBattleAnimFacing(int maActor, int maOpponent, int facing)
{
    int muFacing;
    switch (facing){
    case MA_FACING_OPPONENT:
        muFacing = GetFacingDirection(
            gMapBattle.actors[maActor].pUnit->xPos,    gMapBattle.actors[maActor].pUnit->yPos,
            gMapBattle.actors[maOpponent].pUnit->xPos, gMapBattle.actors[maOpponent].pUnit->yPos);

        MU_SetFacing(gMapBattle.actors[maActor].pMUProc, muFacing);

        break;

    case MA_FACING_DEFAULT:
        MU_SetDefaultFacing(gMapBattle.actors[maActor].pMUProc);
        break;

    case MA_FACING_UNK:
        muFacing = GetFacingDirection(
            gMapBattle.actors[maActor].pUnit->xPos, gMapBattle.actors[maActor].pUnit->yPos, 0, 0);

        MU_SetFacing(gMapBattle.actors[maActor].pMUProc, muFacing);
        break;
    } // switch (facing)
}

void SetupBattleMOVEUNITs(void)
{
    int maFacing = GetSpellAssocFacing(gMapBattle.actors[0].pBattleUnit->weaponBefore);
    sub_807B4D0();

    switch (gMapBattle.actorCount_maybe) {
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
    } // switch (gMapBattle.actorCount_maybe)
}

void sub_807B4D0(void)
{
    u8 array[4];
    int i, j;
    int count = gMapBattle.actorCount_maybe;

    switch (gMapBattle.actorCount_maybe) {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
            count += 2;
        break;

    case 1:
        break;

    } // switch (gMapBattle.actorCount_maybe)

    // Init ref array
    for (i = 0; i < count; ++i)
        array[i] = i;

    // Sort ref array
    for (i = 0; i < count-1; ++i) {
        for (j = i+1; j < count; ++j) {
            int swap = FALSE;
            if (gMapBattle.actors[array[i]].pUnit->yPos == gMapBattle.actors[array[j]].pUnit->yPos) {
                if (gMapBattle.actors[array[i]].pUnit->xPos >= gMapBattle.actors[array[j]].pUnit->xPos)
                    swap = TRUE;
            } else if (gMapBattle.actors[array[i]].pUnit->yPos >= gMapBattle.actors[array[j]].pUnit->yPos)
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
        gMapBattle.actors[array[i]].pMUProc->pAPHandle->objLayer = gUnknown_08205714[i];
}

void BeginMapAnimForPoisonDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimPoisonDmg, PROC_TREE_3);
}

void BeginMapAnimForEggDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimEggDmg, PROC_TREE_3);
}

void BeginMapAnimForCritAtk(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimCritAtk, PROC_TREE_3);
}

void BeginMapAnimForSteal(void)
{
    gBattleActor.weaponBefore = ITEM_SWORD_IRON;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 1;
    gMapBattle.actorCount_maybe = 2;

    gMapBattle.subjectActorId = 0;
    gMapBattle.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSteal, PROC_TREE_3);
}

void BeginMapAnimForSummon(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.subjectActorId = 0;
    gMapBattle.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSummon, PROC_TREE_3);
}

void BeginMapAnimForSummonDK(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.subjectActorId = 0;
    gMapBattle.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSumDK, PROC_TREE_3);
}

void BeginMapAnimForDance(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.subjectActorId = 0;
    gMapBattle.targetActorId = 0;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimDance, PROC_TREE_3);
}

void BeginBattleMapAnims(void)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_DANCERING)) {
        BeginMapAnimForDance();
        return;
    }

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;

    SetupMapAnimSpellData(&gBattleActor, &gBattleTarget, gBattleHitArray);
    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);

    if (!EventEngineExists())
        Proc_Start(ProcScr_MapAnimBattle, PROC_TREE_3);
    else
        Proc_Start(ProcScr_MapAnimEventBattle, PROC_TREE_3);
}

void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    gMapBattle.actorCount_maybe = GetSpellAssocCharCount(actor->weaponBefore);
    gMapBattle.pCurrentRound    = hit;
    gMapBattle.specialProcScr   = GetSpellAssocAlt6CPointer(actor->weaponBefore);
}

void SetupMapBattleAnim(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    int i;

    MakeBattleMOVEUNIT(0, actor, &actor->unit);

    if (gMapBattle.actorCount_maybe > 1)
    {
        HideUnitSMS(&gBattleTarget.unit); // NOTE: uses gBattleTarget instead of target argument
        MakeBattleMOVEUNIT(1, target, &target->unit);
    }

    if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
    {
        MakeBattleMOVEUNIT(2, actor, gBattleStats.taUnitA);
        MakeBattleMOVEUNIT(3, actor, gBattleStats.taUnitB);

        HideUnitSMS(gBattleStats.taUnitA);
        HideUnitSMS(gBattleStats.taUnitB);
    }

    SetupBattleMOVEUNITs();

    for (i = 0; i < gMapBattle.actorCount_maybe; ++i)
    {
        gMapBattle.actors[i].u0D = gMapBattle.actors[i].pBattleUnit->hpInitial;
        gMapBattle.actors[i].u0C = GetUnitMaxHp(gMapBattle.actors[i].pUnit);
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
