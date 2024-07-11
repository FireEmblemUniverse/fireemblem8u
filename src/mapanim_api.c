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
#include "spellassoc.h"
#include "constants/items.h"
#include "mapanim.h"

void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit)
{
    if (!bu)
        return;

    gManimSt.actor[maActor].unit = unit;
    gManimSt.actor[maActor].bu   = bu;
    gManimSt.actor[maActor].mu   = StartMu(unit);

    gManimSt.actor[maActor].mu->sprite_anim->frameTimer    = 0;
    gManimSt.actor[maActor].mu->sprite_anim->frameInterval = 0;

    if (BUNIT_IS_OBSTACLE(bu))
        HideMu(gManimSt.actor[maActor].mu);

    switch (unit->statusIndex) {

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        SetMuPal(gManimSt.actor[maActor].mu, BM_OBJPAL_UNIT_GRAYED);
        break;
    } // switch (unit->statusIndex)
}

void SetBattleAnimFacing(int maActor, int maOpponent, int facing)
{
    int muFacing;
    switch (facing){
    case MA_FACING_OPPONENT:
        muFacing = GetFacingDirection(
            gManimSt.actor[maActor].unit->xPos,    gManimSt.actor[maActor].unit->yPos,
            gManimSt.actor[maOpponent].unit->xPos, gManimSt.actor[maOpponent].unit->yPos);

        SetMuFacing(gManimSt.actor[maActor].mu, muFacing);

        break;

    case MA_FACING_DEFAULT:
        SetMuDefaultFacing(gManimSt.actor[maActor].mu);
        break;

    case MA_FACING_UNK:
        muFacing = GetFacingDirection(
            gManimSt.actor[maActor].unit->xPos, gManimSt.actor[maActor].unit->yPos, 0, 0);

        SetMuFacing(gManimSt.actor[maActor].mu, muFacing);
        break;
    } // switch (facing)
}

void SetupBattleMOVEUNITs(void)
{
    int maFacing = GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore);
    sub_807B4D0();

    switch (gManimSt.actorCount_maybe) {
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
    } // switch (gManimSt.actorCount_maybe)
}

void sub_807B4D0(void)
{
    u8 array[4];
    int i, j;
    int count = gManimSt.actorCount_maybe;

    switch (gManimSt.actorCount_maybe) {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
            count += 2;
        break;

    case 1:
        break;

    } // switch (gManimSt.actorCount_maybe)

    // Init ref array
    for (i = 0; i < count; ++i)
        array[i] = i;

    // Sort ref array
    for (i = 0; i < count-1; ++i) {
        for (j = i+1; j < count; ++j) {
            int swap = FALSE;
            if (gManimSt.actor[array[i]].unit->yPos == gManimSt.actor[array[j]].unit->yPos) {
                if (gManimSt.actor[array[i]].unit->xPos >= gManimSt.actor[array[j]].unit->xPos)
                    swap = TRUE;
            } else if (gManimSt.actor[array[i]].unit->yPos >= gManimSt.actor[array[j]].unit->yPos)
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
        gManimSt.actor[array[i]].mu->sprite_anim->objLayer = gUnknown_08205714[i];
}

void BeginMapAnimForPoisonDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 0;
    gManimSt.actorCount_maybe = 1;

    gManimSt.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimPoisonDmg, PROC_TREE_3);
}

void BeginMapAnimForEggDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 0;
    gManimSt.actorCount_maybe = 1;

    gManimSt.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimEggDmg, PROC_TREE_3);
}

void BeginMapAnimForCritAtk(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 0;
    gManimSt.actorCount_maybe = 1;

    gManimSt.pCurrentRound = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimCritAtk, PROC_TREE_3);
}

void BeginMapAnimForSteal(void)
{
    gBattleActor.weaponBefore = ITEM_SWORD_IRON;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 1;
    gManimSt.actorCount_maybe = 2;

    gManimSt.subjectActorId = 0;
    gManimSt.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSteal, PROC_TREE_3);
}

void BeginMapAnimForSummon(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 2;
    gManimSt.actorCount_maybe = 1;

    gManimSt.subjectActorId = 0;
    gManimSt.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSummon, PROC_TREE_3);
}

void BeginMapAnimForSummonDK(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 2;
    gManimSt.actorCount_maybe = 1;

    gManimSt.subjectActorId = 0;
    gManimSt.targetActorId = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimSumDK, PROC_TREE_3);
}

void BeginMapAnimForDance(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 2;
    gManimSt.actorCount_maybe = 1;

    gManimSt.subjectActorId = 0;
    gManimSt.targetActorId = 0;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_MapAnimDance, PROC_TREE_3);
}

void BeginBattleMapAnims(void)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_DANCERING)) {
        BeginMapAnimForDance();
        return;
    }

    gManimSt.hp_changing = 0;
    gManimSt.u62 = 0;

    SetupMapAnimSpellData(&gBattleActor, &gBattleTarget, gBattleHitArray);
    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);

    if (!EventEngineExists())
        Proc_Start(ProcScr_MapAnimBattle, PROC_TREE_3);
    else
        Proc_Start(ProcScr_MapAnimEventBattle, PROC_TREE_3);
}

void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    gManimSt.actorCount_maybe = GetSpellAssocCharCount(actor->weaponBefore);
    gManimSt.pCurrentRound    = hit;
    gManimSt.specialProcScr   = GetSpellAssocAlt6CPointer(actor->weaponBefore);
}

void SetupMapBattleAnim(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    int i;

    MakeBattleMOVEUNIT(0, actor, &actor->unit);

    if (gManimSt.actorCount_maybe > 1)
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

    for (i = 0; i < gManimSt.actorCount_maybe; ++i)
    {
        gManimSt.actor[i].hp_cur = gManimSt.actor[i].bu->hpInitial;
        gManimSt.actor[i].hp_max = GetUnitMaxHp(gManimSt.actor[i].unit);
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
    PROC_CALL(LockGame),
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
    PROC_CALL(LockGame),
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
    PROC_WHILE_EXISTS(ProcScr_MuDeathFade),
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
    PROC_CALL(UnlockGame),
    PROC_CALL(MapAnim_Cleanup),
    PROC_END
};
