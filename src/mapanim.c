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

#include "mapanim.h"

// unreferenced
void sub_807A708(u32 a) {
    if (gCurrentMapAnimState.u62 == 1) {
        sub_8011694(gCurrentMapAnimState.actors[1].pBattleUnit->weapon, a);
    }
}

void DisplayWpnBrokePopup(u32 a) {
    struct BattleUnit *unit = 0;
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleActor)) {
        unit = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleTarget)) {
        unit = &gBattleTarget;
    }
    if (unit) {
        NewPopup_WeaponBroke(unit->weaponBefore, a);
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

void DisplayWRankUpPopup(u32 a) {
    struct BattleUnit *unit = 0;
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleActor)) {
        unit = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleTarget)) {
        unit = &gBattleTarget;
    }
    if (unit) {
        NewPopup_WRankIncrease(unit->weaponType, a);
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
    Font_InitForUIDefault();
}

void MapAnim_Cleanup(void) {
    MU_AllRestartAnimations();
	sub_8003D20();
	DeleteBattleAnimInfoThing();
	SetupBackgroundForWeatherMaybe();
	LoadUiFrameGraphics();
	LoadObjUIGfx();
	if (EventEngineExists())
        MU_EndAll();
}

void MapAnim_AdvanceBattleRound(void) {
    struct MapAnimState *state = &gCurrentMapAnimState;
    struct CurrentRound *round = state->pCurrentRound;
    u8 r = (round->c >> 3);
    state->subjectActorId = r % 2;
    state->targetActorId = 1 - state->subjectActorId;
    state->roundBits = *(u32 *)round;
    state->u5C = round->c;
    state->u5D = round->d;
    if (state->actorCount_maybe == 1) {
        state->subjectActorId = 0;
        state->targetActorId = 0;
    }
    state->pCurrentRound++;
}

void MapAnim_PrepareNextBattleRound(ProcPtr p) {
    struct MapAnimState *state = &gCurrentMapAnimState;
    u16 weapon;
    struct BattleUnit *unit;
    if (state->pCurrentRound->c & 0x10) {
        Proc_Break(p);
        Proc_GotoScript(p, &gUnknown_089A35B0);
        return;
    }
    MapAnim_AdvanceBattleRound();
    unit = state->actors[state->subjectActorId].pBattleUnit;
    weapon = unit->weaponBefore;
    state->pItemMapAnimProcScript = GetSpellAssocAlt6CPointer(weapon);
    Proc_Break(p);
}

void MapAnim_DisplayRoundAnim(ProcPtr p) {
	Proc_StartBlocking(GetItemAnim6CCode(), p);
}

void MapAnim_ShowPoisonEffectIfAny(ProcPtr p) {
    struct MapAnimState *state = &gCurrentMapAnimState;
    if (state->roundBits & 0x40) {
        NewMapPoisonEffect(state->actors[state->targetActorId].pUnit);
        NewBlockingTimer(p, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(ProcPtr p) {
    struct MapAnimState *state = &gCurrentMapAnimState;
	int x = state->actors[0].pUnit->xPos;
	int y = state->actors[0].pUnit->yPos;
    EnsureCameraOntoPosition(p, x, y);
}

void MapAnim_MoveCameraOntoTarget(ProcPtr p) {
    struct MapAnimState *state = &gCurrentMapAnimState;
    if (state->actorCount_maybe != 1) {
        int x = state->actors[1].pUnit->xPos;
        int y = state->actors[1].pUnit->yPos;
        EnsureCameraOntoPosition(p, x, y);
    }
}
