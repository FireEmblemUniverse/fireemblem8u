#include "global.h"

#include "bmbattle.h"
#include "bmunit.h"
#include "event.h"
#include "fontgrp.h"
#include "mu.h"
#include "proc.h"
#include "uiutils.h"
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
#include "constants/classes.h"
#include "constants/event-flags.h"
#include "constants/items.h"
#include "constants/songs.h"

#include "mapanim.h"

EWRAM_DATA struct MapAnimState gManimSt = { 0 };

void MapAnim_StoleItemPopup(ProcPtr proc)
{
    if (gManimSt.mapAnimKind == MANIM_KIND_STEAL)
        NewPopup_ItemStealing(gManimSt.actor[1].bu->weapon, proc);
}

void DisplayWpnBrokePopup(ProcPtr proc)
{
    struct BattleUnit * unit = NULL;

    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleActor))
        unit = &gBattleActor;

    if (BattleUnit_ShouldDisplayWpnBroke(&gBattleTarget))
        unit = &gBattleTarget;

    if (unit != NULL)
        NewPopup_WeaponBroke(unit->weaponBefore, proc);
}

bool BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit * bu)
{
    if (UNIT_FACTION(&bu->unit) == FACTION_BLUE)
        return DidBattleUnitBreakWeapon(bu);

    return false;
}

void DisplayWRankUpPopup(ProcPtr proc)
{
    struct BattleUnit * bu = NULL;

    if (BattleUnit_ShouldDisplayWRankUp(&gBattleActor))
        bu = &gBattleActor;

    if (BattleUnit_ShouldDisplayWRankUp(&gBattleTarget))
        bu = &gBattleTarget;

    if (bu != NULL)
        NewPopup_WRankIncrease(bu->weaponType, proc);
}

bool BattleUnit_ShouldDisplayWRankUp(struct BattleUnit * bu)
{
    if (UNIT_FACTION(&bu->unit) == FACTION_BLUE)
        if (HasBattleUnitGainedWeaponLevel(bu))
            return true;

    return false;
}

void MapAnim_PrepareBattleTalk(void)
{
    ResetText();
}

void MapAnim_Cleanup(void)
{
    ResetMuAnims();
    ResetTextFont();
    EndMapAnimInfoWindow();
    InitBmBgLayers();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    if (EventEngineExists())
        EndAllMus();
}

void MapAnim_AdvanceBattleRound(void)
{
    gManimSt.subjectActorId = !!(gManimSt.pCurrentRound->info & BATTLE_HIT_INFO_RETALIATION);
    gManimSt.targetActorId = 1 - gManimSt.subjectActorId;

    gManimSt.hitAttributes = gManimSt.pCurrentRound->attributes;
    gManimSt.hitInfo = gManimSt.pCurrentRound->info;
    gManimSt.hitDamage = gManimSt.pCurrentRound->hpChange;

    if (gManimSt.actorCount == 1)
    {
        gManimSt.subjectActorId = 0;
        gManimSt.targetActorId = 0;
    }

    gManimSt.pCurrentRound++;
}

void MapAnim_PrepareNextBattleRound(ProcPtr proc)
{
    if (gManimSt.pCurrentRound->info & BATTLE_HIT_INFO_END)
    {
        Proc_Break(proc);
        Proc_GotoScript(proc, ProcScr_MapAnimEnd);
        return;
    }

    MapAnim_AdvanceBattleRound();
    gManimSt.specialProcScr = GetSpellAssocMapAnimProcScript(gManimSt.actor[gManimSt.subjectActorId].bu->weaponBefore);

    Proc_Break(proc);
}

void MapAnim_DisplayRoundAnim(ProcPtr proc)
{
    Proc_StartBlocking(MapAnim_GetRoundProcScript(), proc);
}

void MapAnim_ShowPoisonEffectIfAny(ProcPtr proc)
{
    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_POISON)
    {
        NewMapPoisonEffect(gManimSt.actor[gManimSt.targetActorId].unit);
        StartTemporaryLock(proc, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(ProcPtr proc)
{
    EnsureCameraOntoPosition(proc, gManimSt.actor[0].unit->xPos, gManimSt.actor[0].unit->yPos);
}

void MapAnim_MoveCameraOntoTarget(ProcPtr proc)
{
    if (gManimSt.actorCount != 1)
        EnsureCameraOntoPosition(proc, gManimSt.actor[1].unit->xPos, gManimSt.actor[1].unit->yPos);
}

void MapAnim_DisplayDeathQuote(void)
{
    int actorNum = -1;

    switch (gManimSt.actorCount)
    {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actorNum = 0;

        break;
    } // switch (gManimSt.actorCount)

    if (actorNum != -1)
    {
        int pid = UNIT_CHAR_ID(gManimSt.actor[actorNum].unit);

        switch (pid)
        {
        case CHARACTER_EIRIKA:
        case CHARACTER_EPHRAIM:
            if (CheckFlag(EVFLAG_GAMEOVER))
                ClearFlag(EVFLAG_GAMEOVER);

            break;
        }

        if (CheckBattleDefeatTalk(pid))
        {
            EndMapAnimInfoWindow();
            DisplayDefeatTalkForPid(pid);
        }
    }
}

void MapAnim_DisplayDeathFade(void)
{
    int actorNum = -1;

    switch (gManimSt.actorCount)
    {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actorNum = 0;

        break;
    } // switch (gManimSt.actorCount)

    if (actorNum != -1)
        MU_StartDeathFade(gManimSt.actor[actorNum].mu);
}

void MapAnim_DisplayExpBar(ProcPtr proc)
{
    int actorNum = -1;

    switch (gManimSt.actorCount)
    {
    case 2:
        if (gManimSt.actor[1].bu->expGain != 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].bu->expGain != 0)
            actorNum = 0;

        break;
    }

    if (actorNum >= 0)
    {
        struct MAExpBarProc * expProc = Proc_StartBlocking(ProcScr_MapAnimExpBar, proc);

        expProc->expFrom = gManimSt.actor[actorNum].bu->expPrevious;
        expProc->expTo   = gManimSt.actor[actorNum].bu->expPrevious + gManimSt.actor[actorNum].bu->expGain;
        expProc->actorId = actorNum;
    }
}

void MapAnim_InitInfoBox(ProcPtr proc)
{
    SetDefaultColorEffects();

    switch (gManimSt.mapAnimKind)
    {
    case MANIM_KIND_STEAL:
    case MANIM_KIND_REFRESH:
        return;

    default:
        break;
    }

    if (GetSpellAssocReturnBool(gManimSt.actor[0].bu->weaponBefore))
    {
        int y;
        if (gManimSt.actorCount == 1)
        {
            y = gManimSt.actor[0].unit->yPos * 16 - gBmSt.camera.y;

            if (y >= 112)
                y = y - 40;
            else
                y = y + 24;

        }
        else
        {
            int array[2];
            int i;
            int actorNum;

            for (i = 0; i < gManimSt.actorCount; ++i)
                array[i] = gManimSt.actor[i].unit->yPos * 16 - gBmSt.camera.y;

            if (ABS(array[0] - array[1]) >= 80)
            {
                y = 64;
            }
            else
            {
                actorNum = array[0] > array[1] ? 0 : 1;

                if (array[actorNum] >= 112)
                    y = array[1 - actorNum] - 40;
                else
                    y = array[actorNum] + 24;
            }
        }

        StartMapAnimInfoWindow(15, y / 8, proc);
    }
}

void MapAnim_CallBattleQuoteEvents(void)
{
    if (gManimSt.actorCount == 2)
    {
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
    switch (gManimSt.actor[actorNum].unit->statusIndex)
    {
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        return;

    } // switch (gManimSt.actor[actorNum].unit->statusIndex)

    // Check other actor weapon
    switch (GetItemIndex(gManimSt.actor[actorNum ^ 1].bu->weaponBefore))
    {
    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
    case ITEM_MONSTER_STONE:
        return;

    } // switch (GetItemIndex(gManimSt.actor[actorNum ^ 1].bu->weaponBefore))

    // Check actor weapon
    if (GetItemIndex(gManimSt.actor[actorNum].bu->weaponBefore) != ITEM_DIVINESTONE)
        return;

    SetMuPal(gManimSt.actor[actorNum].mu, BM_OBJPAL_BANIM_SPECIALMU + actorNum);
    SetMuSpecialSprite(gManimSt.actor[actorNum].mu, CLASS_MANAKETE, Pal_MapAnimManaketeMu);
}

void SetBattleMuPalette(void)
{
    switch (gManimSt.actorCount)
    {
    case 2:
        SetBattleMuPaletteByIndex(1);

        // fallthrough

    case 1:
        SetBattleMuPaletteByIndex(0);

        break;

    } // switch (gManimSt.actorCount)
}

void MapAnim_PlayStealSe(void)
{
    PlaySoundEffect(SONG_SE_BMP_MOVE_BIRD1A_T1);
}

void MapAnim_PlayStealSe_Unused(void)
{
    PlaySoundEffect(SONG_SE_BMP_MOVE_BIRD1A_T1);
}

/** 
 * section.data
*/

// clang-format off

CONST_DATA struct ProcCmd ProcScr_MapAnimPoisonDmg[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),

    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(15),

    PROC_START_CHILD_BLOCKING(ProcScr_PoisonDmgMapEffect),
    PROC_SLEEP(1),

    PROC_JUMP(ProcScr_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimEggDmg[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),

    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(15),

    PROC_START_CHILD_BLOCKING(ProcScr_EggDmgMapEffect1),
    PROC_SLEEP(1),

    PROC_START_CHILD_BLOCKING(ProcScr_EggDmgMapEffect2),
    PROC_SLEEP(1),

    PROC_JUMP(ProcScr_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimCritAtk[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),

    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(15),

    PROC_START_CHILD_BLOCKING(ProcScr_CritAtkMapEffect),
    PROC_SLEEP(1),

    PROC_JUMP(ProcScr_MapAnimEnd),
};

CONST_DATA struct ProcCmd ProcScr_MapAnimSteal[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(MapAnim_MoveCameraOntoTarget),
    PROC_SLEEP(2),

    PROC_CALL(MapAnim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_SLEEP(20),

    PROC_CALL(MapAnim_BeginSubjectFastAnim),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_PlayStealSe),
    PROC_SLEEP(20),

    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(20),

    PROC_JUMP(ProcScr_MapAnimEnd),
};

// clang-format on
