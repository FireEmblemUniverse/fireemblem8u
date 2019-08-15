#include "global.h"

#include "fontgrp.h"
#include "proc.h"
#include "event.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "uiutils.h"

#include "constants/characters.h"

struct MapAnimProc
{
    /* 00 */ PROC_HEADER;
};

struct MapAnimExpProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8  pad29[0x64 - 0x29];
    /* 64 */ u16 expFrom;
    /* 66 */ u16 expTo;
    /* 68 */ u16 actorId;
};

void sub_8011694(int item, struct Proc* parent);
void NewPopup_WeaponBroke(int item, struct Proc* parent);
void NewPopup_WRankIncrease(int wtype, struct Proc* parent);

s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit* bu);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit* bu);

void NewMapPoisonEffect(struct Unit* unit);
void NewBlockingTimer(struct Proc* proc, int duration);

const struct ProcCmd* GetSpellAssocAlt6CPointer(int item);
const struct ProcCmd* GetItemAnim6CCode(void);

s8 sub_80835A8(int charid);
void sub_80835DC(int charid);

void DeleteBattleAnimInfoThing(void);

extern const struct ProcCmd gUnknown_089A35B0[];
extern const struct ProcCmd gUnknown_089A36F8[];

void sub_807A708(struct Proc* proc)
{
    if (gUnknown_0203E1F0.u62 == TRUE)
        sub_8011694(gUnknown_0203E1F0.actors[1].pBattleUnit->weapon, (struct Proc*)(proc));
}

void DisplayWpnBrokePopup(struct Proc* proc)
{
    struct BattleUnit* bu = NULL;

    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleActor))
        bu = &gBattleActor;

    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleTarget))
        bu = &gBattleTarget;

    if (bu)
        NewPopup_WeaponBroke(bu->weaponBefore, proc);
}

s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit* bu)
{
    if (UNIT_FACTION(&bu->unit) == FACTION_BLUE)
        return DidBattleUnitBreakWeapon(bu);

    return FALSE;
}

void DisplayWRankUpPopup(struct Proc* proc)
{
    struct BattleUnit* bu = NULL;

    if (BattleUnit_ShouldDisplayWRankUp(&gBattleActor))
        bu = &gBattleActor;

    if (BattleUnit_ShouldDisplayWRankUp(&gBattleTarget))
        bu = &gBattleTarget;

    if (bu)
        NewPopup_WRankIncrease(bu->weaponType, proc);
}

s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit* bu)
{
    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return FALSE;

    if (!HasBattleUnitGainedWeaponLevel(bu))
        return FALSE;

    return TRUE;
}

void _InitFontForUIDefault(struct Proc* proc)
{
    Font_InitForUIDefault();
}

void DeleteBattleAnimInfoThing(void);

void MapAnim_Cleanup(void)
{
    MU_AllRestartAnimations();
    sub_8003D20();
    DeleteBattleAnimInfoThing();
    SetupBackgroundForWeatherMaybe();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    if (EventEngineExists())
        MU_EndAll();
}

void MapAnim_AdvanceBattleRound(void)
{
    gUnknown_0203E1F0.subjectActorId = !!(gUnknown_0203E1F0.pCurrentRound->info & BATTLE_HIT_INFO_RETALIATION);
    gUnknown_0203E1F0.targetActorId  = 1 - gUnknown_0203E1F0.subjectActorId;

    gUnknown_0203E1F0.hitAttributes = gUnknown_0203E1F0.pCurrentRound->attributes;
    gUnknown_0203E1F0.hitInfo = gUnknown_0203E1F0.pCurrentRound->info;
    gUnknown_0203E1F0.hitDamage = gUnknown_0203E1F0.pCurrentRound->hpChange;

    if (gUnknown_0203E1F0.actorCount_maybe == 1)
    {
        gUnknown_0203E1F0.subjectActorId = 0;
        gUnknown_0203E1F0.targetActorId = 0;
    }

    gUnknown_0203E1F0.pCurrentRound++;
}

void MapAnim_PrepareNextBattleRound(struct Proc* proc)
{
    if (gUnknown_0203E1F0.pCurrentRound->info & BATTLE_HIT_INFO_END)
    {
        Proc_ClearNativeCallback(proc);
        Proc_JumpToPointer(proc, gUnknown_089A35B0);

        return;
    }

    MapAnim_AdvanceBattleRound();

    gUnknown_0203E1F0.pItemMapAnimProcScript = GetSpellAssocAlt6CPointer(
        gUnknown_0203E1F0.actors[gUnknown_0203E1F0.subjectActorId].pBattleUnit->weaponBefore);

    Proc_ClearNativeCallback(proc);
}

void MapAnim_DisplayRoundAnim(struct Proc* proc)
{
    Proc_CreateBlockingChild(GetItemAnim6CCode(), proc);
}

void MapAnim_ShowPoisonEffectIfAny(struct Proc* proc)
{
    if (gUnknown_0203E1F0.hitAttributes & BATTLE_HIT_ATTR_POISON)
    {
        NewMapPoisonEffect(gUnknown_0203E1F0.actors[gUnknown_0203E1F0.targetActorId].pUnit);
        NewBlockingTimer(proc, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(struct Proc* proc)
{
    EnsureCameraOntoPosition(
        proc, gUnknown_0203E1F0.actors[0].pUnit->xPos, gUnknown_0203E1F0.actors[0].pUnit->yPos);
}

void MapAnim_MoveCameraOntoTarget(struct Proc* proc)
{
    if (gUnknown_0203E1F0.actorCount_maybe != 1)
    {
        EnsureCameraOntoPosition(
            proc, gUnknown_0203E1F0.actors[1].pUnit->xPos, gUnknown_0203E1F0.actors[1].pUnit->yPos);
    }
}

void sub_807A984(void)
{
    int actor = -1;

    switch (gUnknown_0203E1F0.actorCount_maybe)
    {

    case 2:
        if (gUnknown_0203E1F0.actors[1].u0D == 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gUnknown_0203E1F0.actors[0].u0D == 0)
            actor = 0;

        break;

    } // switch (gUnknown_0203E1F0.actorCount_maybe)

    if (actor != -1)
    {
        int charid = gUnknown_0203E1F0.actors[actor].pUnit->pCharacterData->number;

        switch (charid)
        {

        case CHARACTER_EIRIKA:
        case CHARACTER_EPHRAIM:
            if (CheckEventId(0x65)) // TODO: flag constants
                UnsetEventId(0x65); // TODO: flag constants

            break;

        }

        if (sub_80835A8(charid))
        {
            DeleteBattleAnimInfoThing();
            sub_80835DC(charid);
        }
    }
}

void sub_807AA00(void)
{
    int actor = -1;

    switch (gUnknown_0203E1F0.actorCount_maybe)
    {

    case 2:
        if (gUnknown_0203E1F0.actors[1].u0D == 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gUnknown_0203E1F0.actors[0].u0D == 0)
            actor = 0;

        break;

    } // switch (gUnknown_0203E1F0.actorCount_maybe)

    if (actor != -1)
        MU_StartDeathFade(gUnknown_0203E1F0.actors[actor].pMUProc);
}

void sub_807AA4C(struct Proc* proc)
{
    int actor = -1;

    switch (gUnknown_0203E1F0.actorCount_maybe)
    {

    case 2:
        if (gUnknown_0203E1F0.actors[1].pBattleUnit->expGain != 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gUnknown_0203E1F0.actors[0].pBattleUnit->expGain != 0)
            actor = 0;

        break;

    } // switch (gUnknown_0203E1F0.actorCount_maybe)

    if (actor >= 0)
    {
        struct MapAnimExpProc* expProc = (struct MapAnimExpProc*) Proc_CreateBlockingChild(gUnknown_089A36F8, proc);

        expProc->expFrom = gUnknown_0203E1F0.actors[actor].pBattleUnit->expPrevious;
        expProc->expTo   = gUnknown_0203E1F0.actors[actor].pBattleUnit->expPrevious + gUnknown_0203E1F0.actors[actor].pBattleUnit->expGain;
        expProc->actorId = actor;
    }
}
