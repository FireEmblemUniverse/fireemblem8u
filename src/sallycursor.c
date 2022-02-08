#include "global.h"

#include "types.h"
#include "functions.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "proc.h"

struct SALLYCURSORProc {
    /* 00 */ PROC_HEADER;

    u8 _pad[0x58-0x29];

    /* 58 */ u32 menuItemType; // checked when on map to decide on whether swapping units is allowed
};

struct PrepScreenMenuProc { // 8A186EC
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 isHelpTextShowing; // is R-Help text showing
    /* 2A */ u8 activeMenuItemIndex;
    /* 2B */ u8 menuItemCount;

    u8 _pad[0x34-0x2C];

    /* 34 */ short originTileX;
    /* 36 */ short originTileY;

    /* 38 */ u32 itemDummyProc[8]; // dummy proc pointer array

    /* 58 */ u32 onBPress; // B-press callback
    /* 5C */ u32 onStartPress; // Start-press callback

    /* 60 */ u32 onEnd; // on-end callback
};

void sub_801DB4C(s16, s16);
int sub_809541C();
int sub_8095970(ProcPtr);
void sub_80972B0();
const struct UnitDefinition* GetChapterAllyUnitDataPointer();
void DisplayMoveRangeGraphics(int config);

#if NONMATCHING

int GetPlayerLeaderUnitId() {
    int i;
    int unitId;
    struct Unit* unit;
    const struct CharacterData* data;
    switch (gRAMChapterData.chapterModeIndex) {
        case 1: // tutorial (chapter 0-8)
        case 2: // Eirika
            unitId = CHARACTER_EIRIKA; // #1
            break;
        case 3: // Ephraim
            unitId = CHARACTER_EPHRAIM; // #0xF
            break;
        default:
            break;
    }

    if ((u8)gRAMChapterData.chapterIndex == 5) {
        return CHARACTER_EPHRAIM; // #0xF
    }

    if (GetChapterThing() == 0) {
        return unitId;
    }

    unit = GetUnitFromCharId(unitId);
    if (unit != 0 ) {
        if ((unit->state & US_NOT_DEPLOYED) != 0) {
            return unitId;
        }
    }

    for (i = 1; i <= 0x3F; ++i) { // TODO - Is there a constant for number of units?
        unit = GetUnit(i);
        if (unit != 0) {
            data = unit->pCharacterData;
            if (data != 0) {
                if (!(unit->state & US_UNAVAILABLE)) {
                    return (int)data->number;
                }
            }
        }
    }
}

#else // if !NONMATCHING

__attribute__((naked))
int GetPlayerLeaderUnitId() {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        ldr r0, _0803326C  @ gRAMChapterData\n\
        ldrb r1, [r0, #0x1b]\n\
        cmp r1, #1\n\
        blt _08033276\n\
        cmp r1, #2\n\
        ble _08033270\n\
        cmp r1, #3\n\
        beq _08033274\n\
        b _08033276\n\
        .align 2, 0\n\
    _0803326C: .4byte gRAMChapterData\n\
    _08033270:\n\
        movs r5, #1\n\
        b _08033276\n\
        _08033274:\n\
        movs r5, #0xf\n\
    _08033276:\n\
        ldrb r0, [r0, #0xe]\n\
        cmp r0, #5\n\
        bne _08033284\n\
        movs r0, #0xf\n\
        b _080332C4\n\
    _08033280:\n\
        ldrb r0, [r2, #4]\n\
        b _080332C4\n\
    _08033284:\n\
        bl GetChapterThing\n\
        cmp r0, #0\n\
        beq _080332C2\n\
        adds r0, r5, #0\n\
        bl GetUnitFromCharId\n\
        cmp r0, #0\n\
        beq _080332A0 @\n\
        ldr r0, [r0, #0xc]\n\
        movs r1, #8\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080332C2\n\
    _080332A0:\n\
        movs r4, #1\n\
    _080332A2:\n\
        adds r0, r4, #0\n\
        bl GetUnit\n\
        cmp r0, #0\n\
        beq _080332BC\n\
        ldr r2, [r0]\n\
        cmp r2, #0\n\
        beq _080332BC\n\
        ldr r0, [r0, #0xc]\n\
        ldr r1, _080332CC  @ 0x0001000C\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08033280\n\
    _080332BC:\n\
        adds r4, #1\n\
        cmp r4, #0x3f\n\
        ble _080332A2\n\
        _080332C2:\n\
        adds r0, r5, #0\n\
    _080332C4:\n\
        pop {r4, r5}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080332CC: .4byte 0x0001000C\n\
        .syntax divided\n\
    ");

}
   
#endif // NONMATCHING



void sub_80332D0() {
    s8 xTmp, yTmp;
    const struct UnitDefinition* uDef = GetChapterAllyUnitDataPointer();
    BmMapFill(gBmMapRange, 0);
    BmMapFill(gBmMapMovement, -1);
    uDef = uDef + sub_809541C(); // TODO - Seems to be count of non-deployable / force-deployed characters

    if (uDef->charIndex != 0) {
        while (uDef->charIndex) {
            GetPreferredPositionForUNIT(uDef, &xTmp, &yTmp, 0);
            gBmMapRange[yTmp][xTmp] = 1;
            uDef++;
        }
    }

    DisplayMoveRangeGraphics(0x10);
    return;
}

void sub_803334C() {
    sub_80972B0();
    return;
}

void sub_8033358(ProcPtr proc) {
    ((struct SALLYCURSORProc*)(proc))->menuItemType = 1;
    Proc_Break(proc);
    sub_803334C();
    return;
}

void sub_803336C(ProcPtr proc) {
    s16 x, y;
    ((struct SALLYCURSORProc*)(proc))->menuItemType = 2;

    x = gUnknown_0202BCB0.playerCursor.x;
    y = gUnknown_0202BCB0.playerCursor.y;

    sub_801DB4C(x, y);

    x = gUnknown_0202BCB0.playerCursorDisplay.x;
    y = gUnknown_0202BCB0.playerCursorDisplay.y;
    DisplayCursor(x, y, 0);

    Proc_Break(proc);
    sub_803334C();
}

bool8 sub_80333A4(ProcPtr proc) {
    if (sub_8095970(proc) == 0) {
        // _080333BC
        return 0;
    }
    Proc_Goto(proc, 55);
    return 1;
}

bool8 sub_80333C4(ProcPtr proc) {
    Proc_Goto(proc, 51);
    return 1;
}

// TODO - Seems to be related to setting up the convoy unit, but is unused in FE8
// sub_8031688 is in bmcontainer and gets the unit with the supply flag set
void sub_80333D4() {
    struct Unit* unit = sub_8031688();
    if (unit != 0) {
        unit->state = unit->state &~ US_NOT_DEPLOYED;

        unit->xPos = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[1];
        unit->yPos = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[3];

        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
    }
    return;
}

void sub_803341C(ProcPtr proc) {
    ((struct PrepScreenMenuProc*)(proc))->onBPress = 8; // b-press callback int (*) (struct Proc* menuParent);
    Proc_Goto(proc, 0x39);
    return;
}

// TODO - Remove convoy unit?
void sub_803342C() {
    struct Unit* unit = sub_8031688();
    if (unit != 0) {
        unit->state = unit->state | US_NOT_DEPLOYED;

        unit->xPos = 0xFF;
        unit->yPos = 0xFF;

        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
    }
    return;
}

void sub_8033458(ProcPtr proc) {
    ((struct PrepScreenMenuProc*)(proc))->onBPress = 9;
    Proc_Goto(proc, 0x3b);
    return;
}

void sub_8033468(ProcPtr proc) {
    ((struct PrepScreenMenuProc*)(proc))->onBPress = 0xA;
    sub_803334C();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, 0x3a);
    return;
}

#if NONMATCHING

// TODO - Annoyingly could not get this to match... loads a signed byte from the unknown array instead of just byte, but if I change the function declaration in functions.h it breaks elsewhere.
void sub_803348C(ProcPtr proc) {
    EnsureCameraOntoPosition(proc,
        GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[1],
            GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[3]);
    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_803348C(ProcPtr proc) {
    asm(
        "\n\
            .syntax unified\n\
            push {r4, r5, r6, lr}\n\
            adds r6, r0, #0\n\
            ldr r4, _080334B8  @ gRAMChapterData\n\
            movs r0, #0xe\n\
            ldrsb r0, [r4, r0]\n\
            bl GetROMChapterStruct\n\
            adds r0, #0x82\n\
            ldrb r5, [r0]\n\
            movs r0, #0xe\n\
            ldrsb r0, [r4, r0]\n\
            bl GetROMChapterStruct\n\
            adds r0, #0x84\n\
            ldrb r2, [r0]\n\
            adds r0, r6, #0\n\
            adds r1, r5, #0\n\
            bl EnsureCameraOntoPosition\n\
            pop {r4, r5, r6}\n\
            pop {r0}\n\
            bx r0\n\
            .align 2, 0\n\
        _080334B8: .4byte gRAMChapterData\n\
            .syntax divided\n\
    ");
}

#endif // NONMATCHING