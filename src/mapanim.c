#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "fontgrp.h"
#include "proc.h"
#include "event.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "uiutils.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"

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

s8 GetSpellAssocReturnBool(int item);
void NewMapBattleInfoThing(int x, int y, struct Proc* parent);

void CallBattleQuoteEventsIfAny(int charA, int charB);

void New6C_SummonGfx(struct Proc* parent, int xMap, int yMap);

extern const struct ProcCmd gUnknown_089A35B0[];
extern const struct ProcCmd gUnknown_089A36F8[];

void sub_807A708(struct Proc* proc)
{
    if (gMapBattle.u62 == 1)
        sub_8011694(gMapBattle.actor[1].bu->weapon, (struct Proc*)(proc));
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
    gMapBattle.attackerActorNum = !!(gMapBattle.hitIt->info & BATTLE_HIT_INFO_RETALIATION);
    gMapBattle.defenderActorNum = 1 - gMapBattle.attackerActorNum;

    gMapBattle.hitAttributes = gMapBattle.hitIt->attributes;
    gMapBattle.hitInfo = gMapBattle.hitIt->info;
    gMapBattle.hitDamage = gMapBattle.hitIt->hpChange;

    if (gMapBattle.actorCount_maybe == 1)
    {
        gMapBattle.attackerActorNum = 0;
        gMapBattle.defenderActorNum = 0;
    }

    gMapBattle.hitIt++;
}

void MapAnim_PrepareNextBattleRound(struct Proc* proc)
{
    if (gMapBattle.hitIt->info & BATTLE_HIT_INFO_END)
    {
        Proc_ClearNativeCallback(proc);
        Proc_JumpToPointer(proc, gUnknown_089A35B0);

        return;
    }

    MapAnim_AdvanceBattleRound();

    gMapBattle.specialProcScr = GetSpellAssocAlt6CPointer(
        gMapBattle.actor[gMapBattle.attackerActorNum].bu->weaponBefore);

    Proc_ClearNativeCallback(proc);
}

void MapAnim_DisplayRoundAnim(struct Proc* proc)
{
    Proc_CreateBlockingChild(GetItemAnim6CCode(), proc);
}

void MapAnim_ShowPoisonEffectIfAny(struct Proc* proc)
{
    if (gMapBattle.hitAttributes & BATTLE_HIT_ATTR_POISON)
    {
        NewMapPoisonEffect(gMapBattle.actor[gMapBattle.defenderActorNum].unit);
        NewBlockingTimer(proc, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(struct Proc* proc)
{
    EnsureCameraOntoPosition(
        proc, gMapBattle.actor[0].unit->xPos, gMapBattle.actor[0].unit->yPos);
}

void MapAnim_MoveCameraOntoTarget(struct Proc* proc)
{
    if (gMapBattle.actorCount_maybe != 1)
    {
        EnsureCameraOntoPosition(
            proc, gMapBattle.actor[1].unit->xPos, gMapBattle.actor[1].unit->yPos);
    }
}

void sub_807A984(void)
{
    int actorNum = -1;

    switch (gMapBattle.actorCount_maybe)
    {

    case 2:
        if (gMapBattle.actor[1].u0D == 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gMapBattle.actor[0].u0D == 0)
            actorNum = 0;

        break;

    } // switch (gMapBattle.actorCount_maybe)

    if (actorNum != -1)
    {
        int charid = UNIT_CHAR_ID(gMapBattle.actor[actorNum].unit);

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
    int actorNum = -1;

    switch (gMapBattle.actorCount_maybe)
    {

    case 2:
        if (gMapBattle.actor[1].u0D == 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gMapBattle.actor[0].u0D == 0)
            actorNum = 0;

        break;

    } // switch (gMapBattle.actorCount_maybe)

    if (actorNum != -1)
        MU_StartDeathFade(gMapBattle.actor[actorNum].mu);
}

void sub_807AA4C(struct Proc* proc)
{
    int actorNum = -1;

    switch (gMapBattle.actorCount_maybe)
    {

    case 2:
        if (gMapBattle.actor[1].bu->expGain != 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gMapBattle.actor[0].bu->expGain != 0)
            actorNum = 0;

        break;

    } // switch (gMapBattle.actorCount_maybe)

    if (actorNum >= 0)
    {
        struct MapAnimExpProc* expProc = (struct MapAnimExpProc*) Proc_CreateBlockingChild(gUnknown_089A36F8, proc);

        expProc->expFrom = gMapBattle.actor[actorNum].bu->expPrevious;
        expProc->expTo   = gMapBattle.actor[actorNum].bu->expPrevious + gMapBattle.actor[actorNum].bu->expGain;
        expProc->actorId = actorNum;
    }
}

void sub_807AADC(struct Proc* proc)
{
    SetDefaultColorEffects();

    switch (gMapBattle.u62)
    {
    case 1:
    case 2:
        return;

    default:
        break;
    }

    if (GetSpellAssocReturnBool(gMapBattle.actor[0].bu->weaponBefore))
    {
        int y;

        if (gMapBattle.actorCount_maybe == 1)
        {
            y = gMapBattle.actor[0].unit->yPos*16 - gUnknown_0202BCB0.camera.y;

            if (y >= 112)
                y = y - 40;
            else
                y = y + 24;
        }
        else
        {
            int array[2];
            int i, actorNum;

            for (i = 0; i < gMapBattle.actorCount_maybe; ++i)
                array[i] = gMapBattle.actor[i].unit->yPos*16 - gUnknown_0202BCB0.camera.y;

            if (array[0] - array[1] >= 0)
            {
                if (array[0] - array[1] >= 80)
                    goto disp_center;
            }
            else if (array[1] - array[0] >= 80)
            {
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
    if (gMapBattle.actorCount_maybe == 2)
    {
        CallBattleQuoteEventsIfAny(
            UNIT_CHAR_ID(gMapBattle.actor[0].unit), UNIT_CHAR_ID(gMapBattle.actor[1].unit));
    }
}

extern CONST_DATA u16 gUnknown_089A8F74[];

void sub_807ABE0(int actorNum)
{
    if (UNIT_FACTION(gMapBattle.actor[0].unit) == UNIT_FACTION(gMapBattle.actor[1].unit))
        if (!BUNIT_IS_OBSTACLE(gMapBattle.actor[0].bu) && !BUNIT_IS_OBSTACLE(gMapBattle.actor[1].bu))
            return;

    // Check actor class

    if (UNIT_CLASS_ID(gMapBattle.actor[actorNum].unit) != CLASS_MYRRH)
        return;

    // Check actor status

    switch (gMapBattle.actor[actorNum].unit->statusIndex)
    {

    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        return;

    } // switch (gMapBattle.actor[actorNum].unit->statusIndex)

    // Check other actor weapon

    switch (GetItemIndex(gMapBattle.actor[actorNum ^ 1 ].bu->weaponBefore))
    {

    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
    case ITEM_MONSTER_STONE:
        return;

    } // switch (GetItemIndex(gMapBattle.actor[actorNum ^ 1 ].bu->weaponBefore))

    // Check actor weapon

    if (GetItemIndex(gMapBattle.actor[actorNum].bu->weaponBefore) != ITEM_DIVINESTONE)
        return;

    MU_SetPaletteId(gMapBattle.actor[actorNum].mu, BM_OBJPAL_BANIM_SPECIALMU + actorNum);
    MU_SetSpecialSprite(gMapBattle.actor[actorNum].mu, CLASS_MYRRH_TRANSFORMED, gUnknown_089A8F74);
}

void sub_807ACAC(void)
{
    switch (gMapBattle.actorCount_maybe)
    {

    case 2:
        sub_807ABE0(1);
        // fallthrough
    case 1:
        sub_807ABE0(0);
        break;

    } // switch (gMapBattle.actorCount_maybe)
}

void PlaySoundIdA0(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void sub_807ACEC(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void New6C_SummonGfx_FromActionPos(struct Proc* proc)
{
    New6C_SummonGfx(proc, gActionData.xOther, gActionData.yOther);
}
