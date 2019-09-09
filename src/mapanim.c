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

struct MAExpBarProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8    pad29[0x64 - 0x29];
    /* 64 */ short expFrom;
    /* 66 */ short expTo;
    /* 68 */ short actorId;
    /* 6A */ short unk6A;
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
        struct MAExpBarProc* expProc = (struct MAExpBarProc*) Proc_CreateBlockingChild(gUnknown_089A36F8, proc);

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

// ==============================
// NOTE: this may be a file split
// ==============================

#include "rng.h"
#include "bmmap.h"

extern u8 gUnknown_0895F5A4[][2];
extern struct UnitDefinition gUnknown_03001C38;

extern const struct UnitDefinition gUnknown_088D1F54[];
extern struct UnitDefinition gUnknown_03001C50;

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

struct SumProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x3C - 0x29];

    /* 3C */ int unk3C;
    /* 40 */ int unk40;

    /* 44 */ u8 pad44[0x64 - 0x44];

    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

void sub_807AFD0(struct SumProc* proc)
{
    proc->unk64 = 0;
    proc->unk66 = 0;
}

void sub_807AFE0(struct SumProc* proc)
{
    if (proc->unk64 < 8)
        Proc_GotoLabel((struct Proc*) proc, 0); // TODO: this proc's label enum
}

s8 sub_807AFFC(struct SumProc* proc)
{
    s8 count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
        {
            if (count >= 40)
            {
                Proc_GotoLabel((struct Proc*) proc, 1); // TODO: this proc's label enum
                return TRUE;
            }

            count++;
        }
    }

    if (proc->unk64 < 8 && proc->unk66 < 4)
        return FALSE;

    Proc_GotoLabel((struct Proc*) proc, 1); // TODO: this proc's label enum
    return TRUE;
}

void sub_807B054(void)
{
    PlaySoundEffect(0xA0); // TODO: song ids!
}

void sub_807B070(struct SumProc* proc)
{
    proc->unk64++;
    proc->unk66 = 0;

    New6C_SummonGfx(
        (struct Proc*) proc,
        proc->unk3C, proc->unk40);
}

struct SumThing
{
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

s8 sub_807B090(int x, int y, struct SumThing* result)
{
    struct SumThing array[9];
    u8 chosen, count = 0;

    short iy, ix;

    for (iy = y - 1; iy < y + 2; ++iy)
    {
        if (iy < 0 || gBmMapSize.y <= iy)
            continue;

        for (ix = x - 1; ix < x + 2; ++ix)
        {
            if (ix < 0 || gBmMapSize.x <= ix)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue; // there's a unit here!

            if (gUnknown_0202BCF0.chapterVisionRange && gBmMapFog[iy][ix] == 0)
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

void sub_807B1C0(struct SumProc* proc, s8 x, s8 y, short arg3)
{
    struct SumThing thing;

    if (sub_807AFFC(proc))
        return;

    if (sub_807B090(x, y, &thing) == -1 || thing.boolAvailable == -1)
    {
        proc->unk66++;
        Proc_GotoLabel((struct Proc*) proc, arg3);
    }
    else
    {
        proc->unk3C = thing.x;
        proc->unk40 = thing.y;

        EnsureCameraOntoPosition(
            (struct Proc*) proc,
            proc->unk3C, proc->unk40);
    }
}

void sub_807B234(struct SumProc* proc)
{
    sub_807B1C0(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos + 4,
        3); // TODO: proc label enums!
}

void sub_807B254(struct SumProc* proc)
{
    sub_807B1C0(proc,
        gBattleActor.unit.xPos + 4, gBattleActor.unit.yPos,
        4); // TODO: proc label enums!
}

void sub_807B274(struct SumProc* proc)
{
    sub_807B1C0(proc,
        gBattleActor.unit.xPos - 4, gBattleActor.unit.yPos,
        5); // TODO: proc label enums!
}

void sub_807B294(struct SumProc* proc)
{
    sub_807B1C0(proc,
        gBattleActor.unit.xPos, gBattleActor.unit.yPos - 4,
        6); // TODO: proc label enums!
}

void sub_807B2B4(struct SumProc* proc)
{
    u8 num = DivRem(AdvanceGetLCGRNValue(), 11);

    gUnknown_03001C50 = gUnknown_088D1F54[num];

    gUnknown_03001C50.autolevel = TRUE;
    gUnknown_03001C50.allegiance = 2;
    gUnknown_03001C50.level = 5 + num;

    gUnknown_03001C50.xPosition = proc->unk3C;
    gUnknown_03001C50.yPosition = proc->unk40;

    LoadUnits(&gUnknown_03001C50);
}

// ==============================
// NOTE: this may be a file split
// ==============================

#include "ap.h"

enum
{
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

int GetFacingDirection(int xFrom, int yFrom, int xTo, int yTo);
void MapAnim_AdvanceBattleRound(void);
void SetupMapBattleAnim(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit);
void sub_807B4D0(void);
void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit);
int GetSpellAssocCharCount(int item);

extern const u8 gUnknown_08205714[4];

extern const struct ProcCmd gUnknown_089A31F8[];
extern const struct ProcCmd gUnknown_089A3238[];
extern const struct ProcCmd gUnknown_089A3288[];
extern const struct ProcCmd gUnknown_089A32C8[];
extern const struct ProcCmd gUnknown_089A3398[];
extern const struct ProcCmd gUnknown_089A33C0[];
extern const struct ProcCmd gUnknown_089A34B0[];
extern const struct ProcCmd gUnknown_089A3508[];
extern const struct ProcCmd gUnknown_089A3874[];

void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit)
{
    if (!bu)
        return;

    gMapBattle.actor[maActor].unit = unit;
    gMapBattle.actor[maActor].bu   = bu;
    gMapBattle.actor[maActor].mu   = MU_Create(unit);

    gMapBattle.actor[maActor].mu->pAPHandle->frameTimer    = 0;
    gMapBattle.actor[maActor].mu->pAPHandle->frameInterval = 0;

    if (BUNIT_IS_OBSTACLE(bu))
        MU_Hide(gMapBattle.actor[maActor].mu);

    switch (unit->statusIndex)
    {

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        MU_SetPaletteId(gMapBattle.actor[maActor].mu, BM_OBJPAL_UNIT_GRAYED);
        break;

    } // switch (unit->statusIndex)
}

void SetBattleAnimFacing(int maActor, int maOpponent, int facing)
{
    int muFacing;

    switch (facing)
    {

    case MA_FACING_OPPONENT:
        muFacing = GetFacingDirection(
            gMapBattle.actor[maActor].unit->xPos,    gMapBattle.actor[maActor].unit->yPos,
            gMapBattle.actor[maOpponent].unit->xPos, gMapBattle.actor[maOpponent].unit->yPos);

        MU_SetFacing(gMapBattle.actor[maActor].mu, muFacing);

        break;

    case MA_FACING_DEFAULT:
        MU_SetDefaultFacing(gMapBattle.actor[maActor].mu);
        break;

    case MA_FACING_UNK:
        muFacing = GetFacingDirection(
            gMapBattle.actor[maActor].unit->xPos, gMapBattle.actor[maActor].unit->yPos, 0, 0);

        MU_SetFacing(gMapBattle.actor[maActor].mu, muFacing);

        break;

    } // switch (facing)
}

void SetupBattleMOVEUNITs(void)
{
    int maFacing = GetSpellAssocFacing(gMapBattle.actor[0].bu->weaponBefore);

    sub_807B4D0();

    switch (gMapBattle.actorCount_maybe)
    {

    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
        {
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

    switch (gMapBattle.actorCount_maybe)
    {

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

    for (i = 0; i < count-1; ++i)
    {
        for (j = i+1; j < count; ++j)
        {
            int swap = FALSE;

            if (gMapBattle.actor[array[i]].unit->yPos == gMapBattle.actor[array[j]].unit->yPos)
            {
                if (gMapBattle.actor[array[i]].unit->xPos >= gMapBattle.actor[array[j]].unit->xPos)
                    swap = TRUE;
            }
            else if (gMapBattle.actor[array[i]].unit->yPos >= gMapBattle.actor[array[j]].unit->yPos)
                swap = TRUE;

            if (swap)
            {
                u8 tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }

    // Apply

    for (i = 0; i < count; ++i)
        gMapBattle.actor[array[i]].mu->pAPHandle->objLayer = gUnknown_08205714[i];
}

void sub_807B5DC(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.hitIt = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A31F8, ROOT_PROC_3);
}

void sub_807B634(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.hitIt = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A3238, ROOT_PROC_3);
}

void sub_807B68C(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.hitIt = gBattleHitArray;
    MapAnim_AdvanceBattleRound();

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A3288, ROOT_PROC_3);
}

void BeginMapAnimForSteal(void)
{
    gBattleActor.weaponBefore = ITEM_SWORD_IRON;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 1;
    gMapBattle.actorCount_maybe = 2;

    gMapBattle.attackerActorNum = 0;
    gMapBattle.defenderActorNum = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A32C8, ROOT_PROC_3);
}

void BeginMapAnimForSummon(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.attackerActorNum = 0;
    gMapBattle.defenderActorNum = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A3398, ROOT_PROC_3);
}

void BeginMapAnimForSummonDK(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.attackerActorNum = 0;
    gMapBattle.defenderActorNum = 1;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A33C0, ROOT_PROC_3);
}

void sub_807B7F0(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 2;
    gMapBattle.actorCount_maybe = 1;

    gMapBattle.attackerActorNum = 0;
    gMapBattle.defenderActorNum = 0;

    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Create(gUnknown_089A34B0, ROOT_PROC_3);
}

void BeginBattleMapAnims(void)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_DANCERING))
    {
        sub_807B7F0();
        return;
    }

    gMapBattle.u5F = 0;
    gMapBattle.u62 = 0;

    SetupMapAnimSpellData(&gBattleActor, &gBattleTarget, gBattleHitArray);
    SetupMapBattleAnim(&gBattleActor, &gBattleTarget, gBattleHitArray);

    if (!EventEngineExists())
        Proc_Create(gUnknown_089A3508, ROOT_PROC_3);
    else
        Proc_Create(gUnknown_089A3874, ROOT_PROC_3);
}

void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit)
{
    gMapBattle.actorCount_maybe = GetSpellAssocCharCount(actor->weaponBefore);
    gMapBattle.hitIt            = hit;
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
        gMapBattle.actor[i].u0D = gMapBattle.actor[i].bu->hpInitial;
        gMapBattle.actor[i].u0C = GetUnitMaxHp(gMapBattle.actor[i].unit);
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

// =============================
// NOTE: Start Map Anim Info box
// =============================

struct MAInfoFrameProc
{
    PROC_HEADER;

    /* 2A */ short unk2A;
    /* 2C */ u16 unk2C;
    /* 2E */ u8 unk2E;
    /* 2F */ u8 unk2F;
    /* 30 */ struct Proc* maMain;
};

void sub_8013168(u16* arg0, u8* arg1, int arg2, int arg3, int arg4);

void sub_807BD54(struct MAInfoFrameProc* proc, int actor);
void sub_807BE1C(struct MAInfoFrameProc* proc, int, int);
void sub_8081E78(void);
void sub_80820D8(u16, u16, u16, u16);

void CallARM_FillTileRect(u16* tilemap, u16* tsa, u16 tileref);
void sub_80143D8(u16* tilemap, int arg1, int arg2, const char* cstring);

void sub_807BF54(struct MAInfoFrameProc* proc);

extern u8 gUnknown_089AD500[];

extern int gUnknown_089A3668[];

extern const struct ProcCmd gUnknown_089A3688[];

extern const u8 gUnknown_089AD868[];

extern const u16 gUnknown_08A1D79C[];

extern u8 gUnknown_089AD78C[];

extern u16 gUnknown_089A3648[];

// Those are palettes
extern u16 gUnknown_089AD648[];
extern u16 gUnknown_089AD668[];
extern u16 gUnknown_089AD688[];
extern u16 gUnknown_089AD6A8[];

extern u8* gUnknown_089A3670[][2];

extern u16 gUnknown_089A36C0[];
extern u8 gUnknown_08802D44[];
extern u8 gUnknown_088030C4[];
extern u8 gUnknown_088033C4[];
extern u16 gUnknown_08803590[];
extern u16 gUnknown_089AD498[];

void sub_807B9F8(int tileNum)
{
    CopyDataWithPossibleUncomp(
        gUnknown_089AD868,
        (u8*)(VRAM) + GetBackgroundTileDataOffset(0) + 0x20*(tileNum & 0x3FF));
}

void sub_807BA28(u16* tilemap, int num, int tileref, int len, u16 blankref, int arg5)
{
    char buf[8];
    int i, j;

    for (i = sizeof(buf)-1; i >= 0; --i)
    {
        buf[i] = '0' + num % 10;
        num = num / 10;

        if (num == 0)
        {
            for (j = i - 1; j >= 0; --j)
                buf[j] = ' ';

            break;
        }
    }

    sub_8013168(tilemap, buf + sizeof(buf)-1, tileref, len, arg5);

    for (i = len - 1; i > 0 && buf[7 - i] == ' '; --i)
        tilemap[-i] = blankref;
}

void sub_807BAE4(const u8* src)
{
    sub_807B9F8(0x20);
    CopyDataWithPossibleUncomp(src, (u8*)(VRAM + 0x20 * 43)); // TODO: named constants
    ApplyPalette(gUnknown_08A1D79C, 5);
}

void sub_807BB10(u16* arg0, int* arg1, int arg2, int arg3, int arg4)
{
    int r1;

    if (*arg1 > arg3)
        r1 = arg3;
    else
        r1 = *arg1;

    *arg0 = TILEREF(arg4 + r1, arg2);
    *arg1 += 1 - arg3;

    if (*arg1 < 0)
        *arg1 = 0;
}

void sub_807BB40(u16* tilemap, int arg1, int arg2, int arg3, u16* arg4)
{
    int unk4, count = 0;
    u16* it;

    for (it = arg4; it[0]; it += 2)
        count -= 1 - it[0];

    count += 1;

    if (arg1 == arg2)
        unk4 = count;
    else
        unk4 = ((count<<8) / arg1 * arg2) >> 8;

    if (unk4 == 0 && arg2 > 0)
        unk4 = 1;

    for (it = arg4; it[0]; ++tilemap, it += 2)
        sub_807BB10(tilemap, &unk4, gUnknown_089A3668[arg3], it[0], it[1]);
}

void DeleteBattleAnimInfoThing(void)
{
    Proc_DeleteAllWithScript(gUnknown_089A3688);
}

void NewMapBattleInfoThing(int arg0, int arg1, struct Proc* parent)
{
    struct MAInfoFrameProc* proc = (struct MAInfoFrameProc*) Proc_Create(gUnknown_089A3688, ROOT_PROC_3);

    proc->unk2E = arg0;
    proc->unk2F = arg1;

    proc->maMain = parent;
}

void sub_807BBF0(void)
{
    SetPrimaryHBlankHandler(NULL);
    ClearBg0Bg1();
}

void sub_807BC00(struct MAInfoFrameProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    CopyDataWithPossibleUncomp(
        gUnknown_089AD500,
        (void*)(VRAM) + GetBackgroundTileDataOffset(1) + BM_BGCHR_BANIM_IFBACK * 0x20); //< TODO: put in macro?

    sub_807BAE4(gUnknown_089AD78C);

    switch (gMapBattle.actorCount_maybe)
    {

    case 1:
        sub_807BE1C(proc, 0, -5);
        break;

    case 2:
        sub_807BE1C(proc, 0, -1);
        sub_807BE1C(proc, 1, -11);
        break;

    } // switch (gMapBattle.actorCount_maybe)

    sub_8081E78();

    sub_80820D8(
        gMapBattle.actor[0].u11*8,
        gMapBattle.actor[0].u11*8 + 0x20,
        gPaletteBuffer[0x11],
        gPaletteBuffer[0x21]);
}

void sub_807BCA8(struct MAInfoFrameProc* proc)
{
    s8 updated = FALSE;
    int i;

    for (i = 0; i < gMapBattle.actorCount_maybe; ++i)
    {
        u16 r4 = gMapBattle.actor[i].u0E;

        if (r4 > gMapBattle.actor[i].u0D*16)
            r4 = r4 - 16;

        if (r4 < gMapBattle.actor[i].u0D*16)
        {
            r4 = r4 + 4;

            if (r4 % 16 == 0)
                PlaySoundEffect(0x75); // TODO: song ids
        }

        if (r4 != gMapBattle.actor[i].u0E)
        {
            gMapBattle.actor[i].u0E = r4;
            sub_807BD54(proc, i);
            updated = TRUE;
        }
    }

    if (!updated && gMapBattle.u5F)
        gMapBattle.u5F = FALSE;
}

void sub_807BD54(struct MAInfoFrameProc* proc, int a)
{
    int dummy = gMapBattle.actor[a].u0E/16;
    int r6 = (dummy >= 100);

    sub_807BA28(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gMapBattle.actor[a].u10 + 3,
            gMapBattle.actor[a].u11 + 3),
        gMapBattle.actor[a].u0E/16,
        TILEREF(32, BM_BGPAL_BANIM_UNK5), 3, 0, r6);

    sub_807BB40(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gMapBattle.actor[a].u10 + 4,
            gMapBattle.actor[a].u11 + 3),
        gMapBattle.actor[a].u0C,
        gMapBattle.actor[a].u0E/16,
        0, gUnknown_089A3648);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

u16* sub_807BDD0(struct Unit* unit)
{
    switch (UNIT_FACTION(unit))
    {

    case FACTION_BLUE:
        return gUnknown_089AD648;

    case FACTION_RED:
        return gUnknown_089AD668;

    case FACTION_GREEN:
        return gUnknown_089AD688;

    case FACTION_PURPLE:
        return gUnknown_089AD6A8;

    } // switch (UNIT_FACTION(unit))

    return NULL;
}

void sub_807BE1C(struct MAInfoFrameProc* proc, int a, int arg2)
{
    gMapBattle.actor[a].u10 = proc->unk2E + arg2;
    gMapBattle.actor[a].u11 = proc->unk2F;

    ApplyPalette(
        sub_807BDD0(gMapBattle.actor[a].unit),
        BM_BGPAL_BANIM_IFBACK + a);

    CopyDataWithPossibleUncomp(
        gUnknown_089A3670[gMapBattle.actorCount_maybe][a], gUnknown_02020188);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer,
            gMapBattle.actor[a].u10,
            gMapBattle.actor[a].u11),
        (u16*) gUnknown_02020188,
        BM_BGCHR_BANIM_IFBACK | TILEREF(0, BM_BGPAL_BANIM_IFBACK + a));

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    sub_80143D8(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            gMapBattle.actor[a].u10 + 2,
            gMapBattle.actor[a].u11 + 1),
        0, 9,
        GetStringFromIndex(UNIT_NAME_ID(gMapBattle.actor[a].unit)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gMapBattle.actor[a].u0E = gMapBattle.actor[a].u0D*16;

    sub_807BD54(proc, a);
}

void sub_807BEF8(struct MAInfoFrameProc* proc)
{
    proc->unk2A = 0;

    sub_807BF54(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void sub_807BF54(struct MAInfoFrameProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = (proc->unk2F+2)*8 - proc->unk2A;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = (proc->unk2F+2)*8 + proc->unk2A;

    proc->unk2A += 2;

    if (proc->unk2A > 0x10)
    {
        SetWinEnable(0, 0, 0);
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

// ============================
// NOTE: Start Map Anim Exp bar
// ============================

void sub_807C1AC(struct MAExpBarProc* proc);
void sub_807F10C(int actor, struct MAExpBarProc* proc);

void sub_807BFC4(int arg0, int arg1, int arg2)
{
    sub_807BA28(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 2,
            arg1 + 1),
        arg2, 0x5225, 2, 0x522F, FALSE);

    sub_807BB40(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 3,
            arg1 + 1),
        99, arg2, 0, gUnknown_089A36C0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void sub_807C02C(struct MAExpBarProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    // TODO: ApplyTileImages macros?
    // TODO: BM_BGCHR_...?

    RegisterTileGraphics(
        gUnknown_08802D44,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 512 * 0x20,
        13 * 0x20);

    RegisterTileGraphics(
        gUnknown_088030C4,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 525 * 0x20,
        24 * 0x20);

    RegisterTileGraphics(
        gUnknown_088033C4,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 549 * 0x20,
        11 * 0x20);

    ApplyPalette(gUnknown_08803590, BM_BGPAL_BANIM_UNK5);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 6, 8),
        gUnknown_089AD498,
        TILEREF(512, BM_BGPAL_BANIM_UNK5));

    sub_807BFC4(6, 8, proc->expFrom);
}

void sub_807C0DC(void)
{
    PlaySoundEffect(0x74); // TODO: song ids
}

void sub_807C0F8(struct MAExpBarProc* proc)
{
    proc->expFrom++;

    if (proc->expFrom >= 100)
        proc->expFrom = 0;

    sub_807BFC4(6, 8, proc->expFrom);

    if (proc->expFrom == proc->expTo % 100)
    {
        Proc_ClearNativeCallback((struct Proc*) proc);
        m4aSongNumStop(0x74); // TODO: song ids
    }
}

void sub_807C14C(struct MAExpBarProc* proc)
{
    proc->unk6A = 0;

    sub_807C1AC(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void sub_807C1AC(struct MAExpBarProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = 76 - proc->unk6A;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = 76 + proc->unk6A;

    proc->unk6A += 2;

    if (proc->unk6A > 12)
    {
        SetWinEnable(0, 0, 0);
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_807C210(struct MAExpBarProc* proc)
{
    if (proc->expTo >= 100)
        sub_807F10C(proc->actorId, proc);
}

// ===================================================
// NOTE: Start Oh fcuk debug stuff I didn't know about
// ===================================================

struct MADebugProc
{
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

struct MADebugInfoEntry
{
    /* 00 */ short data[10];
    /* 14 */ struct TextHandle text[10];
};

struct MADebugInfo
{
    /* 00 */ u8 pad00[8];
    /* 08 */ struct MADebugInfoEntry e[2];
};

struct Unk089A3798
{
    /* 00 */ u8 a; s8 b, c, d, e; u8 f, g;
};

void sub_801443C(u16* tilemap, int color, const char* cstring);

s8 sub_807C8FC(void);

extern struct Unk089A3798 CONST_DATA gUnknown_089A3798[];

extern CONST_DATA struct MADebugInfo* gUnknown_089A3810;

extern CONST_DATA struct ProcCmd gUnknown_089A3814[];

extern char* CONST_DATA gUnknown_089A3770[];
extern char* CONST_DATA gUnknown_089A37E8[];

void sub_807C230(void)
{
    Proc_Create(gUnknown_089A3814, ROOT_PROC_3);
}

void sub_807C244(int num, int arg1, int arg2)
{
    const struct CharacterData* charData = GetCharacterData(gUnknown_089A3810->e[num].data[0]);
    const struct ClassData* classData = GetClassData(gUnknown_089A3810->e[num].data[3]);

    int charId = gUnknown_089A3810->e[num].data[0];
    int classId = gUnknown_089A3810->e[num].data[3];
    int unk = gUnknown_089A3810->e[num].data[4];

    switch (arg1)
    {

    case 0:
        Text_Clear(&gUnknown_089A3810->e[num].text[0]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[0],
            16, arg2, charId);

        DrawTextInline(
            &gUnknown_089A3810->e[num].text[0],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 0),
            arg2, 24, 0, GetStringFromIndex(charData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 1:
        Text_Clear(&gUnknown_089A3810->e[num].text[1]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[1],
            8, arg2, gUnknown_089A3810->e[num].data[1]);

        Text_Draw(
            &gUnknown_089A3810->e[num].text[1],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 7, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 2:
        Text_Clear(&gUnknown_089A3810->e[num].text[2]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[2],
            8, arg2, gUnknown_089A3810->e[num].data[2]);

        Text_Draw(
            &gUnknown_089A3810->e[num].text[2],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 10, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 3:
        Text_Clear(&gUnknown_089A3810->e[num].text[3]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[3],
            16, arg2, classId);

        DrawTextInline(
            &gUnknown_089A3810->e[num].text[3],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 4),
            arg2, 24, 0, GetStringFromIndex(classData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 4:
        Text_Clear(&gUnknown_089A3810->e[num].text[4]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[4],
            16, arg2, unk);

        DrawTextInline(
            &gUnknown_089A3810->e[num].text[4],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 6),
            arg2, 24, 0, GetItemName(gUnknown_089A3810->e[num].data[4]));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 5 ... 9:
        Text_Clear(&gUnknown_089A3810->e[num].text[arg1]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->e[num].text[arg1],
            8, arg2, gUnknown_089A3810->e[num].data[arg1]);

        DrawTextInline(
            &gUnknown_089A3810->e[num].text[arg1],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 - 57, arg1*2),
            arg2, 16, 0,
            gUnknown_089A3770[gUnknown_089A3810->e[num].data[arg1]]);

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    } // switch (arg1)
}

void sub_807C4F0(struct MADebugProc* proc)
{
    Proc_DeleteAllWithScript(gUnknown_0859AA5C);

    proc->unk64 = 0;
    proc->unk66 = 0;

    gUnknown_089A3810->e[0].data[3] = 1;
    gUnknown_089A3810->e[0].data[0] = 1;
    gUnknown_089A3810->e[0].data[4] = 1;
    gUnknown_089A3810->e[0].data[1] = 4;
    gUnknown_089A3810->e[0].data[2] = 8;

    gUnknown_089A3810->e[1].data[3] = 1;
    gUnknown_089A3810->e[1].data[0] = 2;
    gUnknown_089A3810->e[1].data[4] = 2;
    gUnknown_089A3810->e[1].data[1] = 5;
    gUnknown_089A3810->e[1].data[2] = 8;

    gUnknown_089A3810->e[0].data[5] = 1;
    gUnknown_089A3810->e[0].data[6] = 5;
    gUnknown_089A3810->e[0].data[7] = 0;
    gUnknown_089A3810->e[0].data[8] = 0;
    gUnknown_089A3810->e[0].data[9] = 0;

    gUnknown_089A3810->e[1].data[5] = 1;
    gUnknown_089A3810->e[1].data[6] = 0;
    gUnknown_089A3810->e[1].data[7] = 0;
    gUnknown_089A3810->e[1].data[8] = 0;
    gUnknown_089A3810->e[1].data[9] = 0;
}

void sub_807C568(struct MADebugProc* proc)
{
    int i, j;

    MU_EndAll();
    Font_InitForUIDefault();

    SetSpecialColorEffectsParameters(2, 8, 8, 0);

    sub_8001ED0(0, 1, 0, 0, 0);
    sub_8001F0C(0, 0, 1, 1, 1);

    // TODO: SetWinEnable macro?
    gLCDControlBuffer.dispcnt.win0_on   = FALSE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    DrawUiFrame2(0, 0, 29, 19, 1); // TODO: UI_STYLE...

    for (i = 0; gUnknown_089A37E8[i]; ++i)
        sub_801443C(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 1, i*2), 0, gUnknown_089A37E8[i]);

    for (i = 0; i < 10; ++i)
    {
        for (j = 0; j < 2; ++j)
        {
            Text_Allocate(&gUnknown_089A3810->e[j].text[i], gUnknown_089A3798[i].a);

            if (j == proc->unk64 && i == proc->unk66)
                sub_807C244(j, i, TEXT_COLOR_NORMAL);
            else
                sub_807C244(j, i, TEXT_COLOR_GRAY);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void sub_807C680(struct MADebugProc* proc)
{
    int inc;

    int oldActor = proc->unk64;
    int oldField = proc->unk66;

    if (gKeyStatusPtr->newKeys & START_BUTTON)
    {
        if (!sub_807C8FC())
            return;

        Proc_ClearNativeCallback((struct Proc*) proc);
    }

    inc = (gKeyStatusPtr->heldKeys & R_BUTTON) ? 10 : 1;

    if (gKeyStatusPtr->repeatedKeys & A_BUTTON)
    {
        gUnknown_089A3810->e[proc->unk64].data[proc->unk66] += inc;

        if (gUnknown_089A3810->e[proc->unk64].data[proc->unk66] >= gUnknown_089A3798[proc->unk66].g)
        {
            if (inc == 1)
                gUnknown_089A3810->e[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
            else
                gUnknown_089A3810->e[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & B_BUTTON)
    {
        gUnknown_089A3810->e[proc->unk64].data[proc->unk66] -= inc;

        if (gUnknown_089A3810->e[proc->unk64].data[proc->unk66] < gUnknown_089A3798[proc->unk66].f)
        {
            if (inc == 1)
                gUnknown_089A3810->e[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
            else
                gUnknown_089A3810->e[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        if (proc->unk66 != 2)
            proc->unk64 = 1 - proc->unk64;

        proc->unk66 = gUnknown_089A3798[proc->unk66].d;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        if (proc->unk66 != 1)
            proc->unk64 = 1 - proc->unk64;

        proc->unk66 = gUnknown_089A3798[proc->unk66].e;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
        proc->unk66 = gUnknown_089A3798[proc->unk66].b;

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
        proc->unk66 = gUnknown_089A3798[proc->unk66].c;

    if (gKeyStatusPtr->repeatedKeys & DPAD_ANY)
        sub_807C244(oldActor, oldField, TEXT_COLOR_GRAY);

    if (gKeyStatusPtr->repeatedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON))
        sub_807C244(proc->unk64, proc->unk66, TEXT_COLOR_NORMAL);
}

void sub_807C8A0(struct BattleUnit* bu, int dActor)
{
    bu->hpInitial  = 30;
    bu->unit.maxHP = 60;

    bu->unit.pCharacterData = GetCharacterData(gUnknown_089A3810->e[dActor].data[0]);
    bu->unit.pClassData     = GetClassData(gUnknown_089A3810->e[dActor].data[3]);

    bu->unit.xPos = gUnknown_089A3810->e[dActor].data[1];
    bu->unit.yPos = gUnknown_089A3810->e[dActor].data[2];

    bu->weaponBefore = gUnknown_089A3810->e[dActor].data[4];
    bu->expGain = 0;
}

s8 sub_807C8FC(void)
{
    // There's some gross variable reuse going on here

    int hitnum, actnum, unk, i;

    struct BattleHit* hit = gBattleHitArray;

    sub_807C8A0(&gBattleActor, 0);
    sub_807C8A0(&gBattleTarget, 1);

    ClearBattleHits();

    unk = 0;

    for (hitnum = 0; hitnum < 5; ++hitnum)
    {
        for (actnum = 0; actnum < 2; ++actnum)
        {
            if (gUnknown_089A3810->e[actnum].data[5 + hitnum] != 0)
            {
                unk = 1;
                break;
            }
        }

        if (unk)
            break;
    }

    if (hitnum == 5 && actnum == 2)
        return FALSE;

    for (i = hitnum*2+actnum; i < 10; ++i)
    {
        hitnum = i / 2;
        actnum = i & 1;

        hit->info = actnum<<3;

        unk = gUnknown_089A3810->e[actnum].data[5 + hitnum];

        switch (unk)
        {

        case 5 ... 8:
            hit->attributes |= BATTLE_HIT_ATTR_CRIT;
            hit->hpChange = 20;
            break;

        case 1 ... 4:
            hit->hpChange = 10;
            break;

        case 9:
            hit->attributes |= BATTLE_HIT_ATTR_MISS;
            break;

        } // switch (unk)

        switch (unk)
        {

        case 2:
        case 6:
            hit->attributes |= BATTLE_HIT_ATTR_DEVIL;
            break;

        case 3:
        case 7:
            hit->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
            break;

        case 4:
        case 8:
            hit->attributes |= BATTLE_HIT_ATTR_POISON;
            break;

        } // switch (unk)

        if (unk != 0)
            ++hit;
    }

    hit->info |= BATTLE_HIT_INFO_END;
    return TRUE;
}

void sub_807CAA8(void)
{
    BG_Fill(gBG0TilemapBuffer, TILEREF(0, 0));
    BG_Fill(gBG1TilemapBuffer, TILEREF(0, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    BeginBattleMapAnims();
}

// ============================================
// NOTE: We back to your regular map anim stuff
// ============================================

#include "ap.h"
#include "bmtrick.h"

struct MAEffectProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit* unit;
    /* 30 */ int xDisplay;
    /* 34 */ int yDisplay;
    /* 38 */ u8 pad38[0x40 - 0x38];
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ u32 pad44;
    /* 48 */ short unk48;
    /* 4A */ u8 pad4A[0x50 - 0x4A];
    /* 50 */ const void* img;
    /* 54 */ const void* pal;
    /* 58 */ short unk58;
    /* 5A */ u8 pad5A[0x64 - 0x5A];
    /* 64 */ short unk64;
};

struct MAAnotherProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ u8 pad34[0x44 - 0x34];
    /* 44 */ short unk44;
    /* 46 */ u8 pad46[0x54 - 0x46];
    /* 54 */ int unk54;
    /* 58 */ int unk58;
    /* 5C */ u8 pad5C[0x64 - 0x5C];
    /* 64 */ short unk64;
};

void sub_80144CC(const u16* pal, int off, int len, int unk, struct Proc* proc);
void sub_8014560(u16* tilemap, int x, int y, int tileref, int, int);
void sub_80146A0(u16* tilemap, int x, int y, int tileref, int, int, const void*, int);

void NewPaletteAnimator_(const u16* pal, int off, int len, int unk, struct Proc* proc);
void DeleteAllPaletteAnimator(void);

void sub_807CF30(struct MAEffectProc* proc);
void sub_807D328(struct MAEffectProc* proc);
void sub_807D360(int, int, int, int, int, struct Proc* parent);
void sub_807E978(void);

extern u8 CONST_DATA gUnknown_089AC0A4[]; // ma miss img
extern u16 CONST_DATA gUnknown_089AC194[]; // ma miss ap

extern u8 CONST_DATA gUnknown_089AC2FC[]; // ma no damage img
extern u16 CONST_DATA gUnknown_089AC440[]; // ma no damage ap

extern struct ProcCmd CONST_DATA gUnknown_089A3924[]; // ma wall break proc scr

extern u8 CONST_DATA gUnknown_089ADA80[]; // ma wall break img
extern u16 CONST_DATA gUnknown_089ADD0C[]; // ma wall break pal
extern u16 CONST_DATA gUnknown_089A6FD8[]; // ma wall break ap

extern struct ProcCmd CONST_DATA gUnknown_089A3944[]; // ma poison proc scr

extern u8 CONST_DATA gUnknown_089ADEB0[]; // ma poison img
extern u16 CONST_DATA gUnknown_089AE204[]; // ma poison pal
extern u16 CONST_DATA gUnknown_089A6F40[]; // ma poison ap

extern struct ProcCmd CONST_DATA gUnknown_089A3964[]; // ma another poison proc scr?

extern struct ProcCmd CONST_DATA gUnknown_089A398C[];

extern u8 CONST_DATA gUnknown_089B7610[];
extern u16 CONST_DATA gUnknown_089B80C4[];

extern const u8* CONST_DATA gUnknown_089A39C4[];

extern struct UnitDefinition gUnknown_03001C68; // egg hatching unit buf

extern struct ProcCmd CONST_DATA gUnknown_089A39E0[];

extern u8 CONST_DATA gUnknown_089AF950[];

extern u16 CONST_DATA gUnknown_089AFFB8[];
extern u16 CONST_DATA gUnknown_089AFF78[];

extern u8 CONST_DATA gUnknown_089AFFF8[];
extern short CONST_DATA gUnknown_089A3A18[];

extern struct ProcCmd CONST_DATA gUnknown_089A3A40[];

extern struct ProcCmd CONST_DATA gUnknown_089A3A80[];

extern u8 CONST_DATA gUnknown_089B35D0[];
extern u16 CONST_DATA gUnknown_089B4BFC[];

struct Unk0820579C { s8 framenum; u8 duration, alpha; };
extern struct Unk0820579C CONST_DATA gUnknown_0820579C[];

extern CONST_DATA u8* CONST_DATA gUnknown_089A3AB8[];

extern struct ProcCmd CONST_DATA gUnknown_089A3B3C[];

extern u8 CONST_DATA gUnknown_089AF310[]; // this is ?
extern u8 CONST_DATA gUnknown_089A3B6C[]; // this is an actual array of u8s, not arbitrary data

extern struct ProcCmd CONST_DATA gUnknown_089A3B84[];

extern struct ProcCmd CONST_DATA gUnknown_089A3BA4[];

void sub_807CAD0(struct Proc* proc)
{
    if (gMapBattle.hitIt->info & BATTLE_HIT_INFO_END)
    {
        Proc_GotoLabel(proc, 1); // TODO: label definitions
        return;
    }

    MapAnim_AdvanceBattleRound();
    Proc_ClearNativeCallback(proc);
}

void sub_807CB04(void)
{
    MU_AllRestartAnimations();
    sub_8003D20();
    DeleteBattleAnimInfoThing();
    SetupBackgroundForWeatherMaybe();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();
}

void MapAnim_BeginMISSAnim(struct Unit* unit)
{
    CopyDataWithPossibleUncomp(
        gUnknown_089AC0A4,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    APProc_Create(
        gUnknown_089AC194,
        16*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)) + 8,
        16*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)) + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, 0), 0, 2);
}

void MapAnim_BeginNODAMAGEAnim(struct Unit* unit)
{
    CopyDataWithPossibleUncomp(
        gUnknown_089AC2FC,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    APProc_Create(
        gUnknown_089AC440,
        16*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)) + 8,
        16*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)) + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, 0), 0, 2);
}

void MapAnim_BeginWallBreakAnim(struct Unit* unit, int unk)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3924, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 16*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)) + 8;
    proc->yDisplay = 16*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)) - 8;

    proc->unk48 = unk ^ 1;
}

void WallBreakAnim_Init(struct MAEffectProc* proc)
{
    CopyDataWithPossibleUncomp(
        gUnknown_089ADA80,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    ApplyPalette(
        gUnknown_089ADD0C,
        16 + BM_OBJPAL_BANIM_EFFECT1);

    APProc_Create(
        gUnknown_089A6FD8,
        proc->xDisplay, proc->yDisplay + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, BM_OBJPAL_BANIM_EFFECT1),
        proc->unk48, 2);
}

void NewMapPoisonEffect(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3944, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));
}

void MapAnim_BeginPoisonAnim(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0xB7, proc->xDisplay); // TODO: song ids

    CopyDataWithPossibleUncomp(
        gUnknown_089ADEB0,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        gUnknown_089AE204,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        gUnknown_089A6F40,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}

void sub_807CD18(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3964, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));
}

void sub_807CD60(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0xB7, proc->xDisplay); // TODO: song ids

    CopyDataWithPossibleUncomp(
        gUnknown_089ADEB0,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        gUnknown_089AE204,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        gUnknown_089A6F40,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}

void sub_807CDB8(void)
{
    RefreshEntityBmMaps();
    RenderBmMap();
    SMS_UpdateFromGameData();
    MU_EndAll();
}

void sub_807CDD0(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A398C, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));
}

void sub_807CE18(struct MAEffectProc* proc)
{
    sub_807E978();

    BG_SetPosition(2, 0, 0);

    // TODO: BM_BANIM_BGCHR_...
    CopyDataWithPossibleUncomp(
        gUnknown_089B7610,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + 352 * 0x20);

    ApplyPalette(
        gUnknown_089B80C4,
        BM_BGPAL_BANIM_UNK4);

    SetSpecialColorEffectsParameters(1, 16, 16, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;

    EnablePaletteSync();
}

void sub_807CE78(struct MAEffectProc* proc)
{
    if (proc->unk42 == 0)
    {
        if (proc->unk40 == 0)
            PlaySpacialSoundMaybe(0x3CA, proc->xDisplay); // TODO: song ids

        else if (proc->unk40 == 1)
            sub_807CF30(proc);

        else if (proc->unk40 > 6)
        {
            Proc_ClearNativeCallback((struct Proc*) proc);
            return;
        }

        CopyDataWithPossibleUncomp(
            gUnknown_089A39C4[proc->unk40],
            gUnknown_02020188);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16*) gUnknown_02020188,
            proc->xDisplay/8 - 8,
            proc->yDisplay/8 - 7,
            TILEREF(352, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->unk40++;
        proc->unk42 = 5;
    }

    proc->unk42--;
}

void sub_807CF30(struct MAEffectProc* proc)
{
    int unused = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Trap* trap = GetTrapAt(proc->unit->xPos, proc->unit->yPos);

    int level = trap
        ? (u8) trap->data[TRAP_EXTDATA_EGG_LEVEL]
        : 1;

    u8 i;

    gUnknown_03001C68.charIndex = CHARACTER_MONSTER_BA;
    gUnknown_03001C68.classIndex = CLASS_GORGON;
    gUnknown_03001C68.leaderCharIndex = 0;
    gUnknown_03001C68.autolevel = TRUE;

    if (UNIT_FACTION(proc->unit) == FACTION_BLUE)
        gUnknown_03001C68.allegiance = 0;

    else if (UNIT_FACTION(proc->unit) == FACTION_RED)
        gUnknown_03001C68.allegiance = 2;

    else if (UNIT_FACTION(proc->unit) == FACTION_GREEN)
        gUnknown_03001C68.allegiance = 1;

    gUnknown_03001C68.level = level;

    gUnknown_03001C68.xPosition = proc->unit->xPos;
    gUnknown_03001C68.yPosition = proc->unit->yPos;

    gUnknown_03001C68.redaCount = 0;
    gUnknown_03001C68.redas = NULL;

    gUnknown_03001C68.genMonster = FALSE;
    gUnknown_03001C68.itemDrop = FALSE;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
        gUnknown_03001C68.items[i] = 0;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
        if (proc->unit->items[i+1])
            gUnknown_03001C68.items[i] = proc->unit->items[i+1];

    if (proc->unit->state & US_DROP_ITEM)
        gUnknown_03001C68.itemDrop = TRUE;

    gUnknown_03001C68.ai[0] = proc->unit->ai1;
    gUnknown_03001C68.ai[1] = proc->unit->ai2;
    gUnknown_03001C68.ai[2] = proc->unit->ai1data; // this looks incorrect
    gUnknown_03001C68.ai[3] = proc->unit->ai1data>>8; // this is 0

    LoadUnits(&gUnknown_03001C68);
    GetUnitFromCharId(CHARACTER_MONSTER_BA);

    ClearUnit(GetUnit(proc->unit->index));

    RefreshEntityBmMaps();
    RenderBmMap();
    SMS_UpdateFromGameData();
    MU_EndAll();
}

void sub_807D09C(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void sub_807D0B4(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A39E0, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));
}

void sub_807D0FC(struct MAEffectProc* proc)
{
    sub_807E978();

    BG_SetPosition(2, 0, 0);

    // TODO: BM_BANIM_BGCHR_...
    CopyDataWithPossibleUncomp(
        gUnknown_089AF950,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + 352 * 0x20);

    SetSpecialColorEffectsParameters(1, 16, 16, 0);

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F48(0);

    sub_8001F0C(0, 0, 0, 1, 1);
    sub_8001F64(1);

    proc->unk40 = 0;
    proc->unk42 = 0;

    if (GetItemIndex(gMapBattle.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
        sub_80144CC(gUnknown_089AFFB8, 0x80, 0x20, 2, (struct Proc*) proc);
    else
        sub_80144CC(gUnknown_089AFF78, 0x80, 0x20, 2, (struct Proc*) proc);
}

void sub_807D1B4(struct MAEffectProc* proc)
{
    if (proc->unk42 > 2)
    {
        DeleteAllPaletteAnimator();
        NewPaletteAnimator_(gUnknown_089AFF78, 0x80, 0x20, 4, (struct Proc*) proc);

        if (GetItemIndex(gMapBattle.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
            NewPaletteAnimator_(gUnknown_089AFFB8, 0x80, 0x20, 4, (struct Proc*) proc);
        else
            NewPaletteAnimator_(gUnknown_089AFF78, 0x80, 0x20, 4, (struct Proc*) proc);

        CopyDataWithPossibleUncomp(
            gUnknown_089AFFF8,
            (void*)(VRAM) + GetBackgroundTileDataOffset(2) + 352 * 0x20);

        sub_807D360(
            proc->xDisplay/8 - 4,
            proc->yDisplay/8 - 4,
            8, 60, 0, (struct Proc*) proc);

        Proc_ClearNativeCallback((struct Proc*) proc);

        PlaySpacialSoundMaybe(0x8C, proc->xDisplay); // TODO: song ids
    }
    else
    {
        int xOff = gUnknown_089A3A18[proc->unk42*2+0];
        int yOff = gUnknown_089A3A18[proc->unk42*2+1];

        sub_807D360(
            proc->xDisplay/8 + xOff - 3,
            proc->yDisplay/8 + yOff - 3,
            6, 10, 8, (struct Proc*) proc);

        PlaySpacialSoundMaybe(0x89, proc->xDisplay); // TODO: song ids

        proc->unk42++;
    }
}

void sub_807D2C8(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void sub_807D2E0(struct MAEffectProc* proc)
{
    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    sub_8001ED0(1, 1, 1, 1, 1);
    sub_8001F48(1);

    proc->unk64 = 0x40;

    sub_807D328(proc);
}

void sub_807D328(struct MAEffectProc* proc)
{
    SetSpecialColorEffectsParameters(2, 0, 0, (proc->unk64--) >> 2);

    if (proc->unk64 == 0)
    {
        SetDefaultColorEffects();
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_807D360(int a, int b, int c, int d, int e, struct Proc* parent)
{
    struct MAAnotherProc* proc =
        (struct MAAnotherProc*) Proc_CreateBlockingChild(gUnknown_089A3A40, parent);

    proc->unk2C = a;
    proc->unk30 = b;
    proc->unk54 = c;
    proc->unk58 = e;
    proc->unk44 = d;
}

void sub_807D39C(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void sub_807D3B4(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void sub_807D3CC(struct MAAnotherProc* proc)
{
    sub_8014560(
        gBG2TilemapBuffer,
        proc->unk2C, proc->unk30,
        TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4),
        proc->unk54, proc->unk54);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    proc->unk64 = 0;
}

void sub_807D40C(struct MAAnotherProc* proc)
{
    proc->unk64 += 2;

    SetSpecialColorEffectsParameters(1, proc->unk64, 0x10, 0);

    if (proc->unk64 > 7)
    {
        proc->unk64 = 0;
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_807D440(struct MAAnotherProc* proc)
{
    proc->unk44--;

    if (proc->unk44 == -1)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_807D464(struct MAAnotherProc* proc)
{
    if (proc->unk58 == 0)
    {
        Proc_ClearNativeCallback((struct Proc*) proc);
        return;
    }

    SetSpecialColorEffectsParameters(1, sub_8012DCC(0, 8, 0, proc->unk64++, proc->unk58), 0x10, 0);

    if (proc->unk64 >= proc->unk58)
    {
        proc->unk64 = 0;

        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_807D4D4(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3A80, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));
}

void sub_807D51C(struct MAEffectProc* proc)
{
    sub_807E978();

    BG_SetPosition(2, 0, 0);

    CopyDataWithPossibleUncomp(
        gUnknown_089B35D0,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        gUnknown_089B4BFC,
        BM_BGPAL_BANIM_UNK4);

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;

    EnablePaletteSync();
}

void sub_807D57C(struct MAEffectProc* proc)
{
    if (proc->unk42 == 0)
    {
        if (proc->unk40 == 0)
            PlaySpacialSoundMaybe(0x384, proc->xDisplay); // TODO: song ids

        else if (proc->unk40 > 33)
        {
            Proc_ClearNativeCallback((struct Proc*) proc);
            return;
        }

        if (gUnknown_0820579C[proc->unk40].framenum < 0)
        {
            BG_Fill(gBG2TilemapBuffer, 0);
            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }
        else
        {
            CopyDataWithPossibleUncomp(
                gUnknown_089A3AB8[gUnknown_0820579C[proc->unk40].framenum],
                gUnknown_02020188);

            sub_800159C(
                gBG2TilemapBuffer,
                (u16*) gUnknown_02020188,
                proc->xDisplay/8 - 9,
                proc->yDisplay/8 - 9,
                TILEREF(352, BM_BGPAL_BANIM_UNK4));

            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }

        SetSpecialColorEffectsParameters(1, gUnknown_0820579C[proc->unk40].alpha, 0x10, 0);

        proc->unk42 = gUnknown_0820579C[proc->unk40].duration;
        proc->unk40++;
    }

    proc->unk42--;
}

void sub_807D670(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void sub_807D688(struct Unit* unit, const void* img, const void* pal)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3B3C, ROOT_PROC_3);

    proc->unit = unit;

    proc->xDisplay = 8*(1+2*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)));
    proc->yDisplay = 8*(1+2*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)));

    proc->img = img;
    proc->pal = pal;
}

void sub_807D6D8(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0xB6, proc->xDisplay); // TODO: song ids!

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    BG_SetPosition(2, 0, 0);

    CopyDataWithPossibleUncomp(
        proc->img,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        proc->pal,
        BM_BGPAL_BANIM_UNK4);

    sub_807E978();

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    proc->unk40 = 0;
}

void sub_807D760(struct MAEffectProc* proc)
{
    sub_80146A0(
        gBG2TilemapBuffer,
        proc->xDisplay/8 - 3, proc->yDisplay/8 - 3,
        TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4),
        6, 6,
        gUnknown_089AF310,
        gUnknown_089A3B6C[proc->unk40/2]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->unk40++;

    if (gUnknown_089A3B6C[proc->unk40/2] == 0xFF)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_807D7D8(struct Unit* unit)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3B84, ROOT_PROC_3);

    proc->xDisplay = 16*(unit->xPos - (gUnknown_0202BCB0.camera.x>>4)) + 8;
    proc->yDisplay = 16*(unit->yPos - (gUnknown_0202BCB0.camera.y>>4)) + 8;
}

void sub_807D818(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0x10F, proc->xDisplay); // TODO: song ids!
}

void NewMapAnimEffectAnimator(struct Unit* unit, int b, int c, u16 d)
{
    struct MAEffectProc* proc =
        (struct MAEffectProc*) Proc_Create(gUnknown_089A3BA4, ROOT_PROC_3);

    proc->unit = unit;

    proc->img = (void*) b;
    proc->pal = (void*) c;

    proc->unk58 = d;
}
