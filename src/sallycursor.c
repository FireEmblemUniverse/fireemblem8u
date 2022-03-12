#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "proc.h"

struct UnknownSALLYCURSORProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad29[0x2B-0x29];

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38; // 38, 39, 3a, 3b

    /* 3B */ u8 _pad3B[0x49-0x3B];

    /* 4A */ u16 unk_4A;
    /* 4C */ u16 unk_4C;

    /* 4E */ u8 _pad4E[0x57-0x4E];

    /* 58 */ u32 unk_58;
};

void sub_801DB4C(s16, s16);
void sub_8033648(ProcPtr);
bool8 sub_8094FF4();
int sub_809541C();
int sub_8095970();
void sub_8096FAC();
void sub_8096FD0(const void*);
void sub_8096FEC(const void*);
void sub_8097008(const void*);
void sub_8097024(int, const void*, int, int, int);
void sub_80970CC(int);
void sub_8097154(int, int);
void sub_80972B0();
void DeletePlayerPhaseInterface6Cs();
const struct UnitDefinition* GetChapterAllyUnitDataPointer();
void DisplayMoveRangeGraphics(int config);
void ArchiveCurrentPalettes();
void WriteFadedPaletteFromArchive(int, int, int, int);
bool8 IsCharacterForceDeployed(int);
void sub_8013800();

int GetPlayerLeaderUnitId() {
    int i;
    int unitId;
    switch (gRAMChapterData.chapterModeIndex) {
        case 1: // tutorial (chapter 0-8)
        case 2: // Eirika
            unitId = CHARACTER_EIRIKA;
            break;
        case 3: // Ephraim
            unitId = CHARACTER_EPHRAIM;
            break;
        default:
            break;
    }

    if ((u8)gRAMChapterData.chapterIndex == 5) {
        return CHARACTER_EPHRAIM;
    }

    do {
        struct Unit* unit;
        if (GetChapterThing() == 0) {
            return unitId;
        }

        if ((unit = GetUnitFromCharId(unitId))) {
            if (!(unit->state & US_NOT_DEPLOYED)) {
                return unitId;
            }
        }

        for (i = 1; i <= 0x3F; ++i) { // TODO - Is there a constant for number of units?
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit) || (unit->state & US_UNAVAILABLE)) {
                continue;
            }

            return unit->pCharacterData->number;
        }
    } while(0);

    return unitId;
}

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
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 1;
    Proc_Break(proc);
    sub_803334C();
    return;
}

void sub_803336C(ProcPtr proc) {
    s16 x, y;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 2;

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
    if (sub_8095970() == 0) {
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
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 8;
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
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 9;
    Proc_Goto(proc, 0x3b);
    return;
}

void sub_8033468(ProcPtr proc) {
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 0xA;
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

void sub_80334BC(ProcPtr proc) {
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 1;
    sub_8033648(proc);
    return;
}

void sub_80334CC() {
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xc0, 0xc0, 0xc0, 0xFF00FFF0);
    return;
}

void sub_80334E8(int r0) {
    sub_8013800(0xc0, 0xc0, 0xc0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, r0);
    return;
}

void sub_8033514(int r4) {
    ArchiveCurrentPalettes();
    sub_8013800(0x100, 0x100, 0x100, 0xc0, 0xc0, 0xc0, 0xFF00FFF0, 0x40, r4);
    return;
}

void sub_8033548(ProcPtr proc) {
    StartHelpPromptSprite(0xaa, 0x8c, 2, proc);
    CopyDataWithPossibleUncomp(gUnknown_08A199C8, (void *) (OBJ_VRAM1 + 0x3000));
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_58 = 0;
    return;
}

void sub_8033574() {
    PutSprite(4, 0x64, 0x8C, gObject_32x16, 0x0000238B);
    PutSprite(4, 0x84, 0x8C, gObject_32x16, 0x0000238F);
    PutSprite(4, 0xA4, 0x8C, gObject_16x16, 0x00002393);
    PutSprite(4, 0x10, 0x8C, gObject_32x16, 0x00002395);
    PutSprite(4, 0x30, 0x8C, gObject_32x16, 0x00002399);
    PutSprite(4, 0x50, 0x8C, gObject_8x16, 0x0000239D);
}

void sub_8033608() {
    CopyToPaletteBuffer(gUnknown_08A1B154, 0x240, 0x20);
    return;
}

void sub_8033620(ProcPtr proc) {
    Proc_Start(gUnknown_0859DBA4, proc);
}

void sub_8033634() {
    EndHelpPromptSprite();
    Proc_EndEach(gUnknown_0859DBA4);
}

void sub_8033648(ProcPtr proc) {
    u8 r2;
    bool8 r0;

    LoadDialogueBoxGfx(0, -1);
    Font_InitForUIDefault();
    DeletePlayerPhaseInterface6Cs();
    HideMoveRangeGraphics();

    sub_8096FAC(proc);

    sub_8097024(1, *sub_8033358, 0, 0xb2 << 3, 0x000005BB); // finds and initializes a proc of some sort; void return

    if (sub_8095970() == 0) {
        r2 = 1;
    } else {
        r2 = 0;
    }

    sub_8097024(2, *sub_803336C, r2, 0x00000591, 0x000005BC);

    sub_8097024(8, *sub_803341C, 0, 0x00000592, 0x000005BD);

    // TODO - checks if GMapData state bit 0 is set, then subtracts 32 from the chapter id and returns true if >= 0x13?
    if ((sub_8094FF4() << 0x18) != 0) {
        sub_8097024(9, *sub_8033458, 0, 0x00000579, 0x000005BE);
    } else {
        sub_8097024(9, *sub_8033458, 1, 0x00000579, 0x000005BE);
    }

    sub_8033620(proc);
    sub_8096FD0(*sub_80333C4);
    sub_8096FEC(*sub_80333A4);
    sub_8097008(*sub_8033634);
    sub_8097154(0xA, 2);

    sub_80970CC(((struct UnknownSALLYCURSORProc*)(proc))->unk_58);
    BG_EnableSyncByMask(3);
    return;
}

bool8 CanCharacterBePrepMoved(int unitId) {
    if ((IsCharacterForceDeployed(unitId) << 0x18) == 0) {
        if (unitId != 0x100) {
            return 1;
        }
    }

    return 0;
}