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
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/classes.h"

#include "mapanim.h"

// unreferenced
void sub_807A708(ProcPtr proc) {
    if (gMapBattle.u62 == 1) {
        NewPopup_ItemStealing(gMapBattle.actors[1].pBattleUnit->weapon, proc);
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
    Font_InitForUIDefault();
}

void MapAnim_Cleanup(void) {
    MU_AllRestartAnimations();
	Font_ResetAllocation();
	DeleteBattleAnimInfoThing();
	SetupBackgroundForWeatherMaybe();
	LoadUiFrameGraphics();
	LoadObjUIGfx();
	if (EventEngineExists())
        MU_EndAll();
}

void MapAnim_AdvanceBattleRound(void) {
    struct MapAnimState *state = &gMapBattle;
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
    struct MapAnimState *state = &gMapBattle;
    u16 weapon;
    struct BattleUnit *unit;
    if (state->pCurrentRound->info & 0x10) {
        Proc_Break(p);
        Proc_GotoScript(p, gUnknown_089A35B0);
        return;
    }
    MapAnim_AdvanceBattleRound();
    unit = state->actors[state->subjectActorId].pBattleUnit;
    weapon = unit->weaponBefore;
    state->specialProcScr = GetSpellAssocAlt6CPointer(weapon);
    Proc_Break(p);
}

void MapAnim_DisplayRoundAnim(ProcPtr p) {
	Proc_StartBlocking(GetItemAnim6CCode(), p);
}

void MapAnim_ShowPoisonEffectIfAny(ProcPtr p) {
    struct MapAnimState *state = &gMapBattle;
    if (state->hitAttributes & 0x40) {
        NewMapPoisonEffect(state->actors[state->targetActorId].pUnit);
        NewBlockingTimer(p, 100);
    }
}

void MapAnim_MoveCameraOntoSubject(ProcPtr p) {
    struct MapAnimState *state = &gMapBattle;
	int x = state->actors[0].pUnit->xPos;
	int y = state->actors[0].pUnit->yPos;
    EnsureCameraOntoPosition(p, x, y);
}

void MapAnim_MoveCameraOntoTarget(ProcPtr p) {
    struct MapAnimState *state = &gMapBattle;
    if (state->actorCount_maybe != 1) {
        int x = state->actors[1].pUnit->xPos;
        int y = state->actors[1].pUnit->yPos;
        EnsureCameraOntoPosition(p, x, y);
    }
}

void sub_807A984(void)
{
    int actorNum = -1;
    switch (gMapBattle.actorCount_maybe) {
    case 2:
        if (gMapBattle.actors[1].u0D == 0)
            actorNum = 1;
        // fallthrough

    case 1:
        if (gMapBattle.actors[0].u0D == 0)
            actorNum = 0;
        break;
    } // switch (gMapBattle.actorCount_maybe)

    if (actorNum != -1) {
        int charid = UNIT_CHAR_ID(gMapBattle.actors[actorNum].pUnit);

        switch (charid) {
        case CHARACTER_EIRIKA:
        case CHARACTER_EPHRAIM:
            if (CheckEventId(0x65)) // TODO: flag constants
                UnsetEventId(0x65); // TODO: flag constants
            break;
        }

        if (sub_80835A8(charid)) {
            DeleteBattleAnimInfoThing();
            sub_80835DC(charid);
        }
    }
}

void sub_807AA00(void)
{
    int actorNum = -1;
    switch (gMapBattle.actorCount_maybe) {
    case 2:
        if (gMapBattle.actors[1].u0D == 0)
            actorNum = 1;
        // fallthrough

    case 1:
        if (gMapBattle.actors[0].u0D == 0)
            actorNum = 0;
        break;
    } // switch (gMapBattle.actorCount_maybe)

    if (actorNum != -1)
        MU_StartDeathFade(gMapBattle.actors[actorNum].pMUProc);
}

void sub_807AA4C(struct Proc* proc)
{
    int actorNum = -1;
    switch (gMapBattle.actorCount_maybe) {
    case 2:
        if (gMapBattle.actors[1].pBattleUnit->expGain != 0)
            actorNum = 1;

    case 1:
        if (gMapBattle.actors[0].pBattleUnit->expGain != 0)
            actorNum = 0;
        break;
    }

    if (actorNum >= 0) {
        struct MAExpBarProc* expProc = Proc_StartBlocking(gUnknown_089A36F8, proc);

        expProc->expFrom = gMapBattle.actors[actorNum].pBattleUnit->expPrevious;
        expProc->expTo   = gMapBattle.actors[actorNum].pBattleUnit->expPrevious + gMapBattle.actors[actorNum].pBattleUnit->expGain;
        expProc->actorId = actorNum;
    }
}

void sub_807AADC(struct Proc* proc)
{
    SetDefaultColorEffects();

    switch (gMapBattle.u62) {
    case 1:
    case 2:
        return;

    default:
        break;
    }

    if (GetSpellAssocReturnBool(gMapBattle.actors[0].pBattleUnit->weaponBefore))
    {
        int y;
        if (gMapBattle.actorCount_maybe == 1) {
            y = gMapBattle.actors[0].pUnit->yPos*16 - gGameState.camera.y;

            if (y >= 112)
                y = y - 40;
            else
                y = y + 24;

        } else {
            int array[2];
            int i, actorNum;

            for (i = 0; i < gMapBattle.actorCount_maybe; ++i)
                array[i] = gMapBattle.actors[i].pUnit->yPos*16 - gGameState.camera.y;

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
    if (gMapBattle.actorCount_maybe == 2) {
        CallBattleQuoteEventsIfAny(
            UNIT_CHAR_ID(gMapBattle.actors[0].pUnit), UNIT_CHAR_ID(gMapBattle.actors[1].pUnit));
    }
}

void SetBattleMuPaletteByIndex(int actorNum)
{
    if (UNIT_FACTION(gMapBattle.actors[0].pUnit) == UNIT_FACTION(gMapBattle.actors[1].pUnit))
        if (!BUNIT_IS_OBSTACLE(gMapBattle.actors[0].pBattleUnit) && !BUNIT_IS_OBSTACLE(gMapBattle.actors[1].pBattleUnit))
            return;

    // Check actor class
    if (UNIT_CLASS_ID(gMapBattle.actors[actorNum].pUnit) != CLASS_MANAKETE_MYRRH)
        return;

    // Check actor status
    switch (gMapBattle.actors[actorNum].pUnit->statusIndex) {
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        return;

    } // switch (gMapBattle.actors[actorNum].unit->statusIndex)

    // Check other actor weapon
    switch (GetItemIndex(gMapBattle.actors[actorNum ^ 1 ].pBattleUnit->weaponBefore)) {
    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
    case ITEM_MONSTER_STONE:
        return;

    } // switch (GetItemIndex(gMapBattle.actors[actorNum ^ 1 ].pBattleUnit->weaponBefore))

    // Check actor weapon
    if (GetItemIndex(gMapBattle.actors[actorNum].pBattleUnit->weaponBefore) != ITEM_DIVINESTONE)
        return;

    MU_SetPaletteId(gMapBattle.actors[actorNum].pMUProc, BM_OBJPAL_BANIM_SPECIALMU + actorNum);
    MU_SetSpecialSprite(gMapBattle.actors[actorNum].pMUProc, CLASS_MANAKETE, gUnknown_089A8F74);
}

void SetBattleMuPalette(void)
{
    switch (gMapBattle.actorCount_maybe) {
    case 2:
        SetBattleMuPaletteByIndex(1);
        // fallthrough
    case 1:
        SetBattleMuPaletteByIndex(0);
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

void New6C_SummonGfx_FromActionPos(ProcPtr proc)
{
    New6C_SummonGfx(proc, gActionData.xOther, gActionData.yOther);
}

void sub_807AD1C(void)
{
    u8 rand100 = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Unit* unit;
    short summonerNum, i;

    // 1. Find summoner number from active unit
    summonerNum = -1;
    for (i = 0; i < 3; ++i) {
        if (UNIT_CHAR_ID(gActiveUnit) == gUnknown_0895F5A4[i][0]) {
            summonerNum = i;
            break;
        }
    }

    if (summonerNum == -1)
        return;

    // 2. Clear existing summon
    // NOTE: this may have been a macro? (because of different i and unit?)
    {
        int i;
        for (i = 1; i < 0x40; ++i) {
            struct Unit* unit = GetUnit(i);

            if (UNIT_IS_VALID(unit)) {
                if (UNIT_CHAR_ID(unit) == gUnknown_0895F5A4[summonerNum][1])
                    ClearUnit(unit);
            }
        }
    }

    // 3. Set up unit definition
    unit = NULL;

    // 3.1. Character/Class/Faction/Level/Position
    gUnitDef1.charIndex       = gUnknown_0895F5A4[summonerNum][1];
    gUnitDef1.classIndex      = CLASS_PHANTOM;
    gUnitDef1.leaderCharIndex = CHARACTER_NONE;
    gUnitDef1.autolevel       = TRUE;

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gUnitDef1.allegiance = 0;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_RED)
        gUnitDef1.allegiance = 2;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_GREEN)
        gUnitDef1.allegiance = 1;

    gUnitDef1.level = gActiveUnit->level;

    gUnitDef1.xPosition = gActionData.xOther;
    gUnitDef1.yPosition = gActionData.yOther;

    gUnitDef1.redaCount = 0;
    gUnitDef1.redas = NULL;

    gUnitDef1.genMonster = FALSE;
    gUnitDef1.itemDrop = FALSE;

    // 3.2. Items (generated from random number)
    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
        gUnitDef1.items[i] = ITEM_NONE;

    if (gActiveUnit->level <= 5)
        gUnitDef1.items[0] = ITEM_AXE_IRON;
    else if (gActiveUnit->level <= 10) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;
        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 15) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 20) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else if (rand100 >= 26 && rand100 < 37)
            gUnitDef1.items[0] = ITEM_AXE_TOMAHAWK;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }

    // 3.3. Ai (is null)
    for (i = 0; i < 4; ++i)
        gUnitDef1.ai[i] = 0;

    // 4. Load unit
    unit = GetUnitFromCharId(gUnknown_0895F5A4[summonerNum][1]);

    if (unit == NULL) {
        struct BattleUnit bu = gBattleActor;
        LoadUnits(&gUnitDef1);
        gBattleActor = bu;
    }

    // 5. Set level and weapon ranks
    unit = GetUnitFromCharId(gUnknown_0895F5A4[summonerNum][1]);

    for (i = 0; i < 4; ++i)
        unit->ranks[i] = 0;

    unit->level = gActiveUnit->level;
    unit->exp   = UNIT_EXP_DISABLED;

    if (gActiveUnit->level <= 5)
        unit->ranks[ITYPE_AXE] = WPN_EXP_D;
    else if (gActiveUnit->level <= 10)
        unit->ranks[ITYPE_AXE] = WPN_EXP_C;
    else if (gActiveUnit->level <= 15)
        unit->ranks[ITYPE_AXE] = WPN_EXP_B;
    else if (gActiveUnit->level <= 20)
        unit->ranks[ITYPE_AXE] = WPN_EXP_A;
}

void sub_807AFD0(struct SumProc* proc)
{
    proc->unk64 = 0;
    proc->monsters = 0;
}

void sub_807AFE0(struct SumProc* proc)
{
    if (proc->unk64 < 8)
        Proc_Goto(proc, 0); // TODO: this proc's label enum
}

s8 CheckCanSummon(struct SumProc* proc)
{
    s8 count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit)) {
            if (count >= 40) {
                Proc_Goto(proc, 1); // TODO: this proc's label enum
                return TRUE;
            }
            count++;
        }
    }

    if (proc->unk64 < 8 && proc->monsters < 4)
        return FALSE;

    Proc_Goto(proc, 1); // TODO: this proc's label enum
    return TRUE;
}

void sub_807B054(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void sub_807B070(struct SumProc* proc)
{
    proc->unk64++;
    proc->monsters = 0;

    New6C_SummonGfx(proc, proc->x, proc->y);
}

s8 SelectSummonPos(int x, int y, struct SumThing* result)
{
    // It is very strange that in this function, CanUnitCrossTerrain should return as int(*)(Unit*, int)
    extern int CanUnitCrossTerrain(struct Unit* unit, int terrain);

    struct SumThing array[9];
    u8 chosen, count = 0;
    short iy, ix;

    for (iy = y - 1; iy < y + 2; ++iy) {
        if (iy < 0 || gBmMapSize.y <= iy)
            continue;

        for (ix = x - 1; ix < x + 2; ++ix) {
            if (ix < 0 || gBmMapSize.x <= ix)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue; // there's a unit here!

            if (gRAMChapterData.chapterVisionRange && gBmMapFog[iy][ix] == 0)
                continue; // there's fog here!

            if (!CanUnitCrossTerrain(&gBattleActor.unit, gBmMapTerrain[iy][ix]))
                continue; // can't cross terrain!

            array[count].x = ix;
            array[count].y = iy;
            array[count].boolAvailable = TRUE;
            count++;
        }
    }

    if (!count)
        return -1;

    chosen = NextRN_N(count);
    *result = array[chosen];
    return 1;
}

void SelSumPosAndMoveCamera(struct SumProc* proc, s8 x, s8 y, short arg3)
{
    struct SumThing thing;
    if (CheckCanSummon(proc))
        return;

    if (SelectSummonPos(x, y, &thing) == -1 || thing.boolAvailable == -1) {
        proc->monsters++;
        Proc_Goto((struct Proc*) proc, arg3);
    } else {
        proc->x = thing.x;
        proc->y = thing.y;

        EnsureCameraOntoPosition(proc, proc->x, proc->y);
    }
}

void SelSumAtDownPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos + 4,
        3); // TODO: proc label enums!
}

void SelSumAtRightPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos + 4, gBattleActor.unit.yPos,
        4); // TODO: proc label enums!
}

void SelSumAtLeftPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos - 4, gBattleActor.unit.yPos,
        5); // TODO: proc label enums!
}

void SelSumAtUpPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos - 4,
        6); // TODO: proc label enums!
}

void LoadSumMonsterFromDK(struct SumProc* proc)
{
    u8 num = DivRem(AdvanceGetLCGRNValue(), 11);

    gUnitDef2 = gUnitDefSumDK[num];

    gUnitDef2.autolevel = TRUE;
    gUnitDef2.allegiance = 2;
    gUnitDef2.level = 5 + num;

    gUnitDef2.xPosition = proc->x;
    gUnitDef2.yPosition = proc->y;

    LoadUnits(&gUnitDef2);
}
