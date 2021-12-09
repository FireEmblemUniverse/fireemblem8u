#include "global.h"

#include "bmbattle.h"
#include "bmunit.h"
#include "event.h"
#include "fontgrp.h"
#include "functions.h"
#include "mu.h"
#include "types.h"
#include "uiutils.h"
#include "variables.h"

#include "mapanim.h"

void unused_sub_807A708(u32 a) {
    if (gUnknown_0203E1F0.u62 == 1) {
        sub_8011694(gUnknown_0203E1F0.actors[1].pBattleUnit->weapon, a);
    }
}

void DisplayWpnBrokePopup(u32 a) {
    struct BattleUnit * something = 0;
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleActor)) {
        something = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleTarget)) {
        something = &gBattleTarget;
    }
    if (something) {
        NewPopup_WeaponBroke(something->weaponBefore, a);
    }
}

s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *u) {
    u32 result;
    if ((u->unit.index & 0xc0))
        result = 0; else
        result = DidBattleUnitBreakWeapon(u);
    return result;
}

void DisplayWRankUpPopup(u32 a) {
    struct BattleUnit * something = 0;
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleActor)) {
        something = &gBattleActor;
    }
    if (BattleUnit_ShouldDisplayWRankUp(&gBattleTarget)) {
        something = &gBattleTarget;
    }
    if (something) {
        NewPopup_WRankIncrease(something->weaponType, a);
    }
}

s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *u) {
    u32 result;
    if ((u->unit.index & 0xc0))
        return 0;
    if (HasBattleUnitGainedWeaponLevel(u) == 0) {
        return 0;
    }
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
    struct MapAnimState *state = &gUnknown_0203E1F0;
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
