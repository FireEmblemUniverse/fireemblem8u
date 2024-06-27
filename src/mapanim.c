#include "global.h"

#include "bmbattle.h"
#include "bmunit.h"
#include "event.h"
#include "fontgrp.h"
#include "functions.h"
#include "mu.h"
#include "proc.h"
#include "types.h"
#include "uiutils.h"
#include "variables.h"
#include "ap.h"
#include "hardware.h"
#include "bmio.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmap.h"
#include "bm.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "popup.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/classes.h"

#include "mapanim.h"

EWRAM_DATA struct MapAnimState gManimSt = { 0 };

// unreferenced
void MapAnimProc_DisplayItemStealingPopup(ProcPtr proc) {
    if (gManimSt.u62 == 1) {
        NewPopup_ItemStealing(gManimSt.actor[1].bu->weapon, proc);
    }
}

void DisplayWpnBrokePopup(ProcPtr proc) {
    struct BattleUnit *unit = 0;
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleActor)) {
        unit = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleTarget)) {
        unit = &gBattleTarget;
    }
    if (unit) {
        NewPopup_WeaponBroke(unit->weaponBefore, proc);
    }
}

s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *u) {
    u32 result;
    if (u->unit.index & 0xc0)
        result = 0;
    else
        result = DidBattleUnitBreakWeapon(u);
    return result;
}

void DisplayWRankUpPopup(ProcPtr proc) {
    struct BattleUnit *unit = 0;
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleActor)) {
        unit = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleTarget)) {
        unit = &gBattleTarget;
    }
    if (unit) {
        NewPopup_WRankIncrease(unit->weaponType, proc);
    }
}

s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *u) {
    u32 result;
    if (u->unit.index & 0xc0)
        return 0;
    if (HasBattleUnitGainedWeaponLevel(u) == 0)
        return 0;
    return 1;
}

void _InitFontForUIDefault(void) {
    ResetText();
}

void MapAnim_Cleanup(void) {
    MU_AllRestartAnimations();
	ResetTextFont();
	DeleteBattleAnimInfoThing();
	InitBmBgLayers();
	LoadUiFrameGraphics();
	LoadObjUIGfx();
	if (EventEngineExists())
        MU_EndAll();
}

void MapAnim_AdvanceBattleRound(void) {
    struct MapAnimState *state = &gManimSt;
    struct BattleHit *round = state->pCurrentRound;
    u8 r = (round->info >> 3);
    state->subjectActorId = r % 2;
    state->targetActorId = 1 - state->subjectActorId;
    state->hitAttributes = *(u32 *)round;
    state->hitInfo = round->info;
    state->hitDamage = round->hpChange;
    if (state->actorCount_maybe == 1) {
        state->subjectActorId = 0;
        state->targetActorId = 0;
    }
    state->pCurrentRound++;
}

void MapAnim_PrepareNextBattleRound(ProcPtr p) {
    struct MapAnimState *state = &gManimSt;
    u16 weapon;
    struct BattleUnit *unit;
    if (state->pCurrentRound->info & 0x10) {
        Proc_Break(p);
        Proc_GotoScript(p, gProc_MapAnimEnd);
        return;
    }
    MapAnim_AdvanceBattleRound();
    unit = state->actor[state->subjectActorId].bu;
    weapon = unit->weaponBefore;
    state->specialProcScr = GetSpellAssocAlt6CPointer(weapon);
    Proc_Break(p);
}

void MapAnim_DisplayRoundAnim(ProcPtr p) {
	Proc_StartBlocking(GetItemAnim6CCode(), p);
}

void MapAnim_ShowPoisonEffectIfAny(ProcPtr p) {
    struct MapAnimState *state = &gManimSt;
    if (state->hitAttributes & 0x40) {
        NewMapPoisonEffect(state->actor[state->targetActorId].unit);
        StartTemporaryLock(p, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(ProcPtr p) {
    struct MapAnimState *state = &gManimSt;
	int x = state->actor[0].unit->xPos;
	int y = state->actor[0].unit->yPos;
    EnsureCameraOntoPosition(p, x, y);
}

void MapAnim_MoveCameraOntoTarget(ProcPtr p) {
    struct MapAnimState *state = &gManimSt;
    if (state->actorCount_maybe != 1) {
        int x = state->actor[1].unit->xPos;
        int y = state->actor[1].unit->yPos;
        EnsureCameraOntoPosition(p, x, y);
    }
}

void MapAnimProc_DisplayDeahQuote(void)
{
    int actorNum = -1;
    switch (gManimSt.actorCount_maybe) {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actorNum = 1;
        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actorNum = 0;
        break;
    } // switch (gManimSt.actorCount_maybe)

    if (actorNum != -1) {
        int charid = UNIT_CHAR_ID(gManimSt.actor[actorNum].unit);

        switch (charid) {
        case CHARACTER_EIRIKA:
        case CHARACTER_EPHRAIM:
            if (CheckFlag(0x65)) // TODO: flag constants
                ClearFlag(0x65); // TODO: flag constants
            break;
        }

        if (CheckBattleDefeatTalk(charid)) {
            DeleteBattleAnimInfoThing();
            DisplayDefeatTalkForPid(charid);
        }
    }
}

void MapAnmiProc_DisplayDeathFade(void)
{
    int actorNum = -1;
    switch (gManimSt.actorCount_maybe) {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actorNum = 1;
        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actorNum = 0;
        break;
    } // switch (gManimSt.actorCount_maybe)

    if (actorNum != -1)
        MU_StartDeathFade(gManimSt.actor[actorNum].mu);
}

void MapAnimProc_DisplayExpBar(struct Proc* proc)
{
    int actorNum = -1;
    switch (gManimSt.actorCount_maybe) {
    case 2:
        if (gManimSt.actor[1].bu->expGain != 0)
            actorNum = 1;

    case 1:
        if (gManimSt.actor[0].bu->expGain != 0)
            actorNum = 0;
        break;
    }

    if (actorNum >= 0) {
        struct MAExpBarProc* expProc = Proc_StartBlocking(gProc_MapAnimExpBar, proc);

        expProc->expFrom = gManimSt.actor[actorNum].bu->expPrevious;
        expProc->expTo   = gManimSt.actor[actorNum].bu->expPrevious + gManimSt.actor[actorNum].bu->expGain;
        expProc->actorId = actorNum;
    }
}

void MapAnim_InitInfoBox(ProcPtr proc)
{
    SetDefaultColorEffects();

    switch (gManimSt.u62) {
    case 1:
    case 2:
        return;

    default:
        break;
    }

    if (GetSpellAssocReturnBool(gManimSt.actor[0].bu->weaponBefore)) {
        int y;
        if (gManimSt.actorCount_maybe == 1) {
            y = gManimSt.actor[0].unit->yPos*16 - gBmSt.camera.y;

            if (y >= 112)
                y = y - 40;
            else
                y = y + 24;

        } else {
            int array[2];
            int i, actorNum;

            for (i = 0; i < gManimSt.actorCount_maybe; ++i)
                array[i] = gManimSt.actor[i].unit->yPos*16 - gBmSt.camera.y;

            if (array[0] - array[1] >= 0) {
                if (array[0] - array[1] >= 80)
                    goto disp_center;
            }
            else if (array[1] - array[0] >= 80) {
            disp_center:
                y = 64;
                goto disp;
            }

            actorNum = array[0] > array[1] ? 0 : 1;
            if (array[actorNum] >= 112)
                y = array[1 - actorNum] - 40;
            else
                y = array[actorNum] + 24;
        }

    disp:
        NewMapBattleInfoThing(15, y / 8, proc);
    }
}

void MapAnim_CallBattleQuoteEvents(void)
{
    if (gManimSt.actorCount_maybe == 2) {
        CallBattleQuoteEventsIfAny(
            UNIT_CHAR_ID(gManimSt.actor[0].unit), UNIT_CHAR_ID(gManimSt.actor[1].unit));
    }
}

void SetBattleMuPaletteByIndex(int actorNum)
{
    if (UNIT_FACTION(gManimSt.actor[0].unit) == UNIT_FACTION(gManimSt.actor[1].unit))
        if (!BUNIT_IS_OBSTACLE(gManimSt.actor[0].bu) && !BUNIT_IS_OBSTACLE(gManimSt.actor[1].bu))
            return;

    // Check actor class
    if (UNIT_CLASS_ID(gManimSt.actor[actorNum].unit) != CLASS_MANAKETE_MYRRH)
        return;

    // Check actor status
    switch (gManimSt.actor[actorNum].unit->statusIndex) {
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        return;

    } // switch (gManimSt.actor[actorNum].unit->statusIndex)

    // Check other actor weapon
    switch (GetItemIndex(gManimSt.actor[actorNum ^ 1 ].bu->weaponBefore)) {
    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
    case ITEM_MONSTER_STONE:
        return;

    } // switch (GetItemIndex(gManimSt.actor[actorNum ^ 1 ].bu->weaponBefore))

    // Check actor weapon
    if (GetItemIndex(gManimSt.actor[actorNum].bu->weaponBefore) != ITEM_DIVINESTONE)
        return;

    MU_SetPaletteId(gManimSt.actor[actorNum].mu, BM_OBJPAL_BANIM_SPECIALMU + actorNum);
    MU_SetSpecialSprite(gManimSt.actor[actorNum].mu, CLASS_MANAKETE, gUnknown_089A8F74);
}

void SetBattleMuPalette(void)
{
    switch (gManimSt.actorCount_maybe) {
    case 2:
        SetBattleMuPaletteByIndex(1);
        // fallthrough
    case 1:
        SetBattleMuPaletteByIndex(0);
        break;

    } // switch (gManimSt.actorCount_maybe)
}

void PlaySoundIdA0(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void sub_807ACEC(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}


/** 
 * section.data
*/

CONST_DATA struct ProcCmd ProcScr_MapAnimPoisonDmg[] = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),
    PROC_START_CHILD_BLOCKING(ProcScr_PoisonDmgMapEffect),
    PROC_SLEEP(0x1),
    PROC_JUMP(gProc_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimEggDmg[] = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),
    PROC_START_CHILD_BLOCKING(ProcScr_EggDmgMapEffect1),
    PROC_SLEEP(0x1),
    PROC_START_CHILD_BLOCKING(ProcScr_EggDmgMapEffect2),
    PROC_SLEEP(0x1),
    PROC_JUMP(gProc_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimCritAtk[] = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),
    PROC_START_CHILD_BLOCKING(ProcScr_CritAtkMapEffect),
    PROC_SLEEP(0x1),
    PROC_JUMP(gProc_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimSteal[] = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_MoveCameraOntoTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x14),
    PROC_CALL(MapAnim_BeginSubjectFastAnim),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(PlaySoundIdA0),
    PROC_SLEEP(0x14),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x14),
    PROC_JUMP(gProc_MapAnimEnd),
};
