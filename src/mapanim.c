#include "global.h"

#include "rng.h"
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

extern const u16 gUnknown_089A8F74[];

extern u8 gUnknown_0895F5A4[][2];
extern struct UnitDefinition gUnknown_03001C38;

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

#ifdef NONMATCHING

void sub_807AD1C(void)
{
    u8 r7 = DivRem(AdvanceGetLCGRNValue(), 101);
    short r6 = -1, r4;
    struct Unit* unit;
    int i;

    for (r4 = 0; r4 < 3; ++r4) // TODO: sizeof(gUnknown_0895F5A4) / 2
    {
        if (UNIT_CHAR_ID(gActiveUnit) == gUnknown_0895F5A4[r4][0])
        {
            r6 = r4;
            break;
        }
    }

    if (r6 == -1)
        return;

    for (i = 1; i < 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
        {
            if (UNIT_CHAR_ID(unit) == gUnknown_0895F5A4[r6][1])
                ClearUnit(unit);
        }
    }

    gUnknown_03001C38.charIndex       = gUnknown_0895F5A4[r6][1];
    gUnknown_03001C38.classIndex      = CLASS_PHANTOM;
    gUnknown_03001C38.leaderCharIndex = CHARACTER_NONE;
    gUnknown_03001C38.autolevel       = TRUE;

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gUnknown_03001C38.allegiance = 0;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_RED)
        gUnknown_03001C38.allegiance = 2;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_GREEN)
        gUnknown_03001C38.allegiance = 1;

    gUnknown_03001C38.level = gActiveUnit->level;

    gUnknown_03001C38.xPosition = gActionData.xOther;
    gUnknown_03001C38.yPosition = gActionData.yOther;

    gUnknown_03001C38.redaCount = 0;
    gUnknown_03001C38.redas = NULL;

    gUnknown_03001C38.genMonster = FALSE;
    gUnknown_03001C38.itemDrop = FALSE;

    for (r4 = 0; r4 < UNIT_DEFINITION_ITEM_COUNT; ++r4)
        gUnknown_03001C38.items[r4] = ITEM_NONE;

    if (gActiveUnit->level <= 5)
    {
        gUnknown_03001C38.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 10)
    {
        if (r7 < 6)
            gUnknown_03001C38.items[0] = ITEM_AXE_DEVIL;
        else
            gUnknown_03001C38.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 15)
    {
        if (r7 < 6)
            gUnknown_03001C38.items[0] = ITEM_AXE_DEVIL;
        else if (r7 >= 6 && r7 < 26)
            gUnknown_03001C38.items[0] = ITEM_AXE_KILLER;
        else
            gUnknown_03001C38.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 20)
    {
        if (r7 < 6)
            gUnknown_03001C38.items[0] = ITEM_AXE_DEVIL;
        else if (r7 >= 6 && r7 < 26)
            gUnknown_03001C38.items[0] = ITEM_AXE_KILLER;
        else if (r7 >= 26 && r7 < 37)
            gUnknown_03001C38.items[0] = ITEM_AXE_TOMAHAWK;
        else
            gUnknown_03001C38.items[0] = ITEM_AXE_IRON;
    }

    for (r4 = 0; r4 < 4; ++r4)
        gUnknown_03001C38.ai[r4] = 0;

    unit = GetUnitFromCharId(gUnknown_0895F5A4[r6][1]);

    if (unit == NULL)
    {
        struct BattleUnit bu = gBattleActor;
        LoadUnits(&gUnknown_03001C38);
        gBattleActor = bu;
    }

    unit = GetUnitFromCharId(gUnknown_0895F5A4[r6][1]);

    for (r4 = 0; r4 < 4; ++r4)
        unit->ranks[r4] = 0;

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

#else // NONMATCHING

__attribute__((naked))
void sub_807AD1C(void)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0x80\n\
        bl AdvanceGetLCGRNValue\n\
        movs r1, #0x65\n\
        bl DivRem\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r6, _0807AD4C  @ 0x0000FFFF\n\
        movs r4, #0\n\
        ldr r0, _0807AD50  @ gActiveUnit\n\
        ldr r0, [r0]\n\
        ldr r0, [r0]\n\
        ldr r1, _0807AD54  @ gUnknown_0895F5A4\n\
        ldrb r0, [r0, #4]\n\
        ldrb r1, [r1]\n\
        cmp r0, r1\n\
        bne _0807AD58\n\
        movs r6, #0\n\
        b _0807AD80\n\
        .align 2, 0\n\
    _0807AD4C: .4byte 0x0000FFFF\n\
    _0807AD50: .4byte gActiveUnit\n\
    _0807AD54: .4byte gUnknown_0895F5A4\n\
    _0807AD58:\n\
        lsls r0, r4, #0x10\n\
        movs r1, #0x80\n\
        lsls r1, r1, #9\n\
        adds r0, r0, r1\n\
        lsrs r4, r0, #0x10\n\
        lsls r5, r4, #0x10\n\
        asrs r3, r5, #0x10\n\
        cmp r3, #2\n\
        bgt _0807AD80\n\
        ldr r0, _0807ADFC  @ gActiveUnit\n\
        ldr r0, [r0]\n\
        ldr r2, [r0]\n\
        ldr r1, _0807AE00  @ gUnknown_0895F5A4\n\
        lsls r0, r3, #1\n\
        adds r0, r0, r1\n\
        ldrb r1, [r2, #4]\n\
        ldrb r0, [r0]\n\
        cmp r1, r0\n\
        bne _0807AD58\n\
        lsrs r6, r5, #0x10\n\
    _0807AD80:\n\
        lsls r0, r6, #0x10\n\
        asrs r2, r0, #0x10\n\
        movs r1, #1\n\
        negs r1, r1\n\
        mov r8, r0\n\
        cmp r2, r1\n\
        bne _0807AD90\n\
        b _0807AFC0\n\
    _0807AD90:\n\
        movs r4, #1\n\
        lsls r1, r2, #1\n\
        ldr r0, _0807AE04  @ gUnknown_0895F5A5\n\
        adds r5, r1, r0\n\
    _0807AD98:\n\
        adds r0, r4, #0\n\
        bl GetUnit\n\
        adds r1, r0, #0\n\
        cmp r1, #0\n\
        beq _0807ADB8\n\
        ldr r0, [r1]\n\
        cmp r0, #0\n\
        beq _0807ADB8\n\
        ldrb r0, [r0, #4]\n\
        ldrb r2, [r5]\n\
        cmp r0, r2\n\
        bne _0807ADB8\n\
        adds r0, r1, #0\n\
        bl ClearUnit\n\
    _0807ADB8:\n\
        adds r4, #1\n\
        cmp r4, #0x3f\n\
        ble _0807AD98\n\
        movs r5, #0\n\
        ldr r2, _0807AE08  @ gUnknown_03001C38\n\
        ldr r3, _0807AE00  @ gUnknown_0895F5A4\n\
        mov r1, r8\n\
        asrs r0, r1, #0xf\n\
        adds r1, r3, #1\n\
        adds r0, r0, r1\n\
        ldrb r0, [r0]\n\
        strb r0, [r2]\n\
        movs r0, #0x51\n\
        strb r0, [r2, #1]\n\
        strb r5, [r2, #2]\n\
        ldrb r1, [r2, #3]\n\
        movs r0, #1\n\
        adds r4, r1, #0\n\
        orrs r4, r0\n\
        strb r4, [r2, #3]\n\
        ldr r1, _0807ADFC  @ gActiveUnit\n\
        ldr r0, [r1]\n\
        movs r5, #0xb\n\
        ldrsb r5, [r0, r5]\n\
        movs r0, #0xc0\n\
        ands r5, r0\n\
        mov ip, r1\n\
        mov r9, r3\n\
        adds r6, r2, #0\n\
        cmp r5, #0\n\
        bne _0807AE0C\n\
        subs r0, #0xc7\n\
        ands r4, r0\n\
        b _0807AE28\n\
        .align 2, 0\n\
    _0807ADFC: .4byte gActiveUnit\n\
    _0807AE00: .4byte gUnknown_0895F5A4\n\
    _0807AE04: .4byte gUnknown_0895F5A5\n\
    _0807AE08: .4byte gUnknown_03001C38\n\
    _0807AE0C:\n\
        cmp r5, #0x80\n\
        bne _0807AE1A\n\
        movs r0, #7\n\
        negs r0, r0\n\
        ands r4, r0\n\
        movs r0, #4\n\
        b _0807AE26\n\
    _0807AE1A:\n\
        cmp r5, #0x40\n\
        bne _0807AE2A\n\
        movs r0, #7\n\
        negs r0, r0\n\
        ands r4, r0\n\
        movs r0, #2\n\
    _0807AE26:\n\
        orrs r4, r0\n\
    _0807AE28:\n\
        strb r4, [r6, #3]\n\
    _0807AE2A:\n\
        mov r2, ip\n\
        ldr r0, [r2]\n\
        ldrb r1, [r0, #8]\n\
        lsls r1, r1, #3\n\
        ldrb r2, [r6, #3]\n\
        movs r0, #7\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strb r0, [r6, #3]\n\
        ldr r3, _0807AEAC  @ gActionData\n\
        movs r0, #0x3f\n\
        ldrb r1, [r3, #0x13]\n\
        ands r1, r0\n\
        ldrb r2, [r6, #4]\n\
        movs r0, #0x40\n\
        negs r0, r0\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strb r0, [r6, #4]\n\
        ldrb r1, [r3, #0x14]\n\
        movs r0, #0x3f\n\
        ands r1, r0\n\
        lsls r1, r1, #6\n\
        ldrh r2, [r6, #4]\n\
        ldr r0, _0807AEB0  @ 0xFFFFF03F\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strh r0, [r6, #4]\n\
        movs r0, #0\n\
        strb r0, [r6, #7]\n\
        str r0, [r6, #8]\n\
        ldrb r1, [r6, #5]\n\
        subs r0, #0x11\n\
        ands r0, r1\n\
        movs r1, #0x21\n\
        negs r1, r1\n\
        ands r0, r1\n\
        strb r0, [r6, #5]\n\
        movs r4, #0\n\
        adds r3, r6, #0\n\
        adds r3, #0xc\n\
        movs r2, #0\n\
    _0807AE7E:\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        adds r1, r0, r3\n\
        strb r2, [r1]\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        cmp r0, #3\n\
        ble _0807AE7E\n\
        mov r1, ip\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #8]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        cmp r0, #5\n\
        ble _0807AEF8\n\
        cmp r0, #0xa\n\
        bgt _0807AEB4\n\
        cmp r7, #5\n\
        bhi _0807AEF8\n\
        movs r0, #0x27\n\
        b _0807AEFA\n\
        .align 2, 0\n\
    _0807AEAC: .4byte gActionData\n\
    _0807AEB0: .4byte 0xFFFFF03F\n\
    _0807AEB4:\n\
        cmp r0, #0xf\n\
        bgt _0807AECE\n\
        cmp r7, #5\n\
        bhi _0807AEC0\n\
        movs r0, #0x27\n\
        b _0807AEFA\n\
    _0807AEC0:\n\
        subs r0, r7, #6\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0x13\n\
        bhi _0807AEF8\n\
        movs r0, #0x24\n\
        b _0807AEFA\n\
    _0807AECE:\n\
        cmp r0, #0x14\n\
        bgt _0807AEFC\n\
        cmp r7, #5\n\
        bhi _0807AEDA\n\
        movs r0, #0x27\n\
        b _0807AEFA\n\
    _0807AEDA:\n\
        subs r0, r7, #6\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0x13\n\
        bhi _0807AEE8\n\
        movs r0, #0x24\n\
        b _0807AEFA\n\
    _0807AEE8:\n\
        adds r0, r7, #0\n\
        subs r0, #0x1a\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0xa\n\
        bhi _0807AEF8\n\
        movs r0, #0x29\n\
        b _0807AEFA\n\
    _0807AEF8:\n\
        movs r0, #0x1f\n\
    _0807AEFA:\n\
        strb r0, [r6, #0xc]\n\
    _0807AEFC:\n\
        movs r4, #0\n\
        ldr r3, _0807AF8C  @ gUnknown_03001C48\n\
        movs r2, #0\n\
    _0807AF02:\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        adds r1, r0, r3\n\
        strb r2, [r1]\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        cmp r0, #3\n\
        ble _0807AF02\n\
        mov r2, r8\n\
        asrs r0, r2, #0xf\n\
        mov r1, r9\n\
        adds r1, #1\n\
        adds r6, r0, r1\n\
        ldrb r0, [r6]\n\
        bl GetUnitFromCharId\n\
        adds r5, r0, #0\n\
        cmp r5, #0\n\
        bne _0807AF48\n\
        ldr r4, _0807AF90  @ gBattleActor\n\
        mov r0, sp\n\
        adds r1, r4, #0\n\
        movs r2, #0x80\n\
        bl memcpy\n\
        ldr r0, _0807AF94  @ gUnknown_03001C38\n\
        bl LoadUnits\n\
        adds r0, r4, #0\n\
        mov r1, sp\n\
        movs r2, #0x80\n\
        bl memcpy\n\
    _0807AF48:\n\
        ldrb r0, [r6]\n\
        bl GetUnitFromCharId\n\
        adds r5, r0, #0\n\
        movs r4, #0\n\
        adds r2, r5, #0\n\
        adds r2, #0x28\n\
        movs r3, #0\n\
    _0807AF58:\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        adds r1, r2, r0\n\
        strb r3, [r1]\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        cmp r0, #3\n\
        ble _0807AF58\n\
        ldr r1, _0807AF98  @ gActiveUnit\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #8]\n\
        strb r0, [r5, #8]\n\
        movs r0, #0xff\n\
        strb r0, [r5, #9]\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #8]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        cmp r0, #5\n\
        bgt _0807AF9C\n\
        adds r1, r5, #0\n\
        adds r1, #0x2a\n\
        movs r0, #0x1f\n\
        b _0807AFBE\n\
        .align 2, 0\n\
    _0807AF8C: .4byte gUnknown_03001C48\n\
    _0807AF90: .4byte gBattleActor\n\
    _0807AF94: .4byte gUnknown_03001C38\n\
    _0807AF98: .4byte gActiveUnit\n\
    _0807AF9C:\n\
        cmp r0, #0xa\n\
        bgt _0807AFA8\n\
        adds r1, r5, #0\n\
        adds r1, #0x2a\n\
        movs r0, #0x47\n\
        b _0807AFBE\n\
    _0807AFA8:\n\
        cmp r0, #0xf\n\
        bgt _0807AFB4\n\
        adds r1, r5, #0\n\
        adds r1, #0x2a\n\
        movs r0, #0x79\n\
        b _0807AFBE\n\
    _0807AFB4:\n\
        cmp r0, #0x14\n\
        bgt _0807AFC0\n\
        adds r1, r5, #0\n\
        adds r1, #0x2a\n\
        movs r0, #0xb5\n\
    _0807AFBE:\n\
        strb r0, [r1]\n\
    _0807AFC0:\n\
        add sp, #0x80\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING
