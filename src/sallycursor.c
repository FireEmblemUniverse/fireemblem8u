#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "ap.h"
#include "proc.h"
#include "ev_triggercheck.h"

struct UnknownSALLYCURSORProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad29[0x2B-0x29];

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3C;
    /* 40 */ int unk_40;

    /* 44 */ u8 _pad44[0x49-0x44];

    /* 4A */ s16 unk_4A;
    /* 4C */ short unk_4C;

    /* 4E */ u8 _pad4E[0x53-0x4E];

    /* 54 */ struct APHandle* unk_54;

    /* 58 */ u32 unk_58;
};

extern struct ProcCmd CONST_DATA gUnknown_0859DBBC[];
extern struct ProcCmd CONST_DATA gUnknown_08A2ED88[];
extern u16 CONST_DATA gUnknown_085A0EA0[];

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
void sub_80A87DC(ProcPtr);
void DeletePlayerPhaseInterface6Cs();
const struct UnitDefinition* GetChapterAllyUnitDataPointer();
void DisplayMoveRangeGraphics(int config);
void ArchiveCurrentPalettes();
void WriteFadedPaletteFromArchive(int, int, int, int);
bool8 IsCharacterForceDeployed(int);
void sub_8013800();
void SortPlayerUnitsForPrepScreen();
void InitPlayerUnitPositionsForPrepScreen();

// playerphase.c
int GetUnitSelectionValueThing(struct Unit* unit);
int sub_801C928();

// unitswapfx.c
void sub_801EC10(ProcPtr, struct Unit*, s16, s16);

// ev_triggercheck.c
struct EventCheckBuffer CheckForEvents(struct EventCheckBuffer*);

// code.c
void MakeShopArmory(int, int, ProcPtr);
void MakeShopVendor(int, int, ProcPtr);

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

void sub_8033770(ProcPtr proc) {
    s16 x;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4A = 0;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_2C = 0;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_30 = 0;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_34 = 2;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_38 = 0;

    x = gBmMapSize.x;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4C = (x * 8) - 0x78;

    return;
}

void sub_8033798(ProcPtr proc) {
    s16 y;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_34 = 0;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_38 = 2;

    y = gBmMapSize.y;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337B4(ProcPtr proc) {
    s16 x;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_34 = -2;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_38 = 0;

    x = gBmMapSize.x;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4C = (x * 8) - 0x78;

    return;
}

void sub_80337D4(ProcPtr proc) {
    s16 y;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_34 = 0;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_38 = -2;

    y = gBmMapSize.y;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337F0(ProcPtr proc) {
    s16 unk_4A;

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gKeyStatusPtr->newKeys) {
        ((struct UnknownSALLYCURSORProc*)(proc))->unk_4A = 1;
    }

    unk_4A = ((struct UnknownSALLYCURSORProc*)(proc))->unk_4A;

    if (unk_4A && !(0xF & ((struct UnknownSALLYCURSORProc*)(proc))->unk_2C) &&
            !(0xF & ((struct UnknownSALLYCURSORProc*)(proc))->unk_30)) {
        Proc_Goto(proc, 2);
        return;
    }

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_2C += ((struct UnknownSALLYCURSORProc*)(proc))->unk_34;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_30 +=((struct UnknownSALLYCURSORProc*)(proc))->unk_38;

    gUnknown_0202BCB0.camera.x = ((struct UnknownSALLYCURSORProc*)(proc))->unk_2C;
    gUnknown_0202BCB0.camera.y = ((struct UnknownSALLYCURSORProc*)(proc))->unk_30;

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4C--;

    if (((struct UnknownSALLYCURSORProc*)(proc))->unk_4C <= 0) {
        Proc_Break(proc);
    }

    return;
}

void InitPrepScreenUnitsAndCamera() {
    LoadUnitPrepScreenPositions();

    if (!(CHAPTER_FLAG_PREPSCREEN & gRAMChapterData.chapterStateBits)) {
        SortPlayerUnitsForPrepScreen();
        InitPlayerUnitPositionsForPrepScreen();
        gRAMChapterData.chapterStateBits |= CHAPTER_FLAG_PREPSCREEN;
    }

    gUnknown_0202BCB0.camera.x = sub_8015A40(0);
    gUnknown_0202BCB0.camera.y = sub_8015A6C(0);
    gUnknown_0202BCB0.gameStateBits |= CHAPTER_FLAG_PREPSCREEN;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

void sub_80338C0() {
    const struct UnitDefinition* uDef;
    s8 x;
    s8 y;
    struct Unit* unit = GetUnitFromCharId(GetPlayerLeaderUnitId());

    if (unit && sub_8095970()) {
        SetCursorMapPosition(unit->xPos, unit->yPos);
    } else {
        uDef = GetChapterAllyUnitDataPointer();
        uDef = uDef + sub_809541C();
        GetPreferredPositionForUNIT(uDef, &x, &y, 0);
        SetCursorMapPosition(x, y);
    }

    gUnknown_0202BCB0.camera.x = sub_8015A40(gUnknown_0202BCB0.playerCursor.x * 16);
    gUnknown_0202BCB0.camera.y = sub_8015A6C(gUnknown_0202BCB0.playerCursor.y * 16);

    return;
}

void sub_8033940(ProcPtr proc) {
    if (!DoesBMXFADEExist()) {
        if (((struct UnknownSALLYCURSORProc*)(proc))->unk_58 == 2) {
            sub_80332D0();
        }

        Proc_Break(proc);
    }

    DisplayCursor(gUnknown_0202BCB0.playerCursorDisplay.x,
        gUnknown_0202BCB0.playerCursorDisplay.y, 0);

    return;
}

void sub_8033978(ProcPtr proc) {
    HandlePlayerCursorMovement();
    if (!DoesBMXFADEExist()) {
        if (L_BUTTON & gKeyStatusPtr->newKeys) {
            sub_801DB4C(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
            PlaySoundEffect(0x6B);
            goto showcursor;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            if (gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]) {
                GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);
                if (sub_801C928()) {
                    MU_EndAll();
                    DeletePlayerPhaseInterface6Cs();
                    SetStatScreenConfig(0x1F);
                    StartStatScreen(GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]), proc);
                    Proc_Goto(proc, 5);
                    return;
                }
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            DeletePlayerPhaseInterface6Cs();
            gRAMChapterData.xCursor = gUnknown_0202BCB0.playerCursor.x;
            gRAMChapterData.yCursor = gUnknown_0202BCB0.playerCursor.y;
            Proc_Goto(proc, 0);
            PlaySoundEffect(0x69);
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            struct Unit* unit = GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);
            switch (GetUnitSelectionValueThing(unit)) {
                case 0:
                case 1:
                    DeletePlayerPhaseInterface6Cs();
                    gRAMChapterData.xCursor = gUnknown_0202BCB0.playerCursor.x;
                    gRAMChapterData.yCursor = gUnknown_0202BCB0.playerCursor.y;

                    switch (gBmMapTerrain[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]) {
                        case TERRAIN_VENDOR:
                        case TERRAIN_ARMORY:
                            PlaySoundEffect(0x6A);
                            Proc_Goto(proc, 0x3C);
                            return;
                        default:
                            Proc_Goto(proc, 0);
                            PlaySoundEffect(0x69);
                            return;
                    }
                case 2:
                    UnitBeginAction(unit);
                    gActiveUnit->state &= ~(US_HIDDEN);

                    if (((struct UnknownSALLYCURSORProc*)(proc))->unk_58 == 2) {
                        Proc_Goto(proc, 3);
                        return;
                    }

                    Proc_Goto(proc, 1);
                    return;
                case 4:
                    if (((struct UnknownSALLYCURSORProc*)(proc))->unk_58 == 2) {
                        PlaySoundEffect(0x6C);
                        return;
                    }
                    // fallthrough
                case 3:
                    UnitBeginAction(unit);
                    gActiveUnit->state &= ~(US_HIDDEN);
                    Proc_Goto(proc, 1);
                    return;
            }
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys) {
            DeletePlayerPhaseInterface6Cs();
            sub_80A87DC(proc);
            Proc_Goto(proc, 9);
            return;
        }
    }

    showcursor:
    DisplayCursor(gUnknown_0202BCB0.playerCursorDisplay.x, gUnknown_0202BCB0.playerCursorDisplay.y, 0);

    return;
}

int sub_8033BF8() {
    ProcPtr proc = Proc_Find(gUnknown_0859DBBC);
    Proc_Goto(proc, 0x33);
    return 0x17;
}

void SALLYCURSOR6C_StartUnitSwap(ProcPtr proc) {
    struct APHandle* ap = AP_Create(gUnknown_085A0EA0, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    ((struct UnknownSALLYCURSORProc*)(proc))->unk_54 = ap;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_4A = 2;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_3C = gUnknown_0202BCB0.playerCursor.x;
    ((struct UnknownSALLYCURSORProc*)(proc))->unk_40 = gUnknown_0202BCB0.playerCursor.y;

    NewBottomHelpText(proc, GetStringFromIndex(0x872));

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(0x69);

    return;
}

void sub_8033C90(struct UnknownSALLYCURSORProc* proc) {
    s8 r7 = ((s8**) gBmMapRange)[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];
    u32 xLoc, yLoc;

    if (GetUnitSelectionValueThing(GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x])) == 4) {
        r7 = 0;
    }

    HandlePlayerCursorMovement();
    xLoc = (proc->unk_3C * 16) - gUnknown_0202BCB0.camera.x;
    yLoc = (proc->unk_40 * 16) - gUnknown_0202BCB0.camera.y;
    if (((xLoc + 0x10) <= 256) && ((yLoc + 0x20) <= 192)) {
        PutSprite(4, xLoc, yLoc - 12, gObject_16x16, 6);
    }

    if (A_BUTTON & gKeyStatusPtr->newKeys) {
        if (r7) {
            AP_Delete(proc->unk_54);
            Proc_Break(proc);
            DeleteEach6CBB();
            return;
        }
        PlaySoundEffect(0x6C);
        return;
    } else if (B_BUTTON & gKeyStatusPtr->newKeys) {
        AP_Delete(proc->unk_54);
        Proc_Goto(proc, 4);
        DeleteEach6CBB();
        PlaySoundEffect(0x6B);
        return;
    }

    if (r7 != proc->unk_4A) {
        AP_SwitchAnimation(proc->unk_54, r7 == 0 ? 1 : 0);
    }

    AP_Update(proc->unk_54,
        gUnknown_0202BCB0.playerCursorDisplay.x - gUnknown_0202BCB0.camera.x,
            gUnknown_0202BCB0.playerCursorDisplay.y - gUnknown_0202BCB0.camera.y);

    proc->unk_4A = r7;

    return;
}

void sub_8033DD8(ProcPtr proc) {
    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);
    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    return;
}

void sub_8033E08(ProcPtr proc) {
    struct Unit* activeUnit = gActiveUnit;
    struct Unit* targetUnit = GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);
    if (!targetUnit) {
        sub_801EC10(proc, activeUnit, gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
    } else {
        sub_801EC10(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        sub_801EC10(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(0x61);
    return;
}

void sub_8033E8C() {
    if (gRAMChapterData.chapterVisionRange != 0) {
        RenderBmMapOnBg2();
    }
    return;
}

void sub_8033EA4() {
    if (gRAMChapterData.chapterVisionRange != 0) {
        RenderBmMap();
        NewBMXFADE(0);
    }
    return;
}

void sub_8033EC0(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08A2ED88, proc);
    return;
}

#if NONMATCHING

void CallCursorShop(ProcPtr proc) {
    struct EventCheckBuffer r0;
    struct EventCheckBuffer* buf = GetChapterEventDataPointer(gRAMChapterData.chapterIndex)->unk_08;

    buf->xPos = gUnknown_0202BCB0.playerCursor.x;
    buf->yPos = gUnknown_0202BCB0.playerCursor.y;
    r0 = CheckForEvents(buf);
    if (!&(r0)) {
        return;
    }

    switch (r0.commandId) {
        case 0x16:
            MakeShopArmory(0, r0.eventCode, proc);
            break;
        case 0x17:
            MakeShopVendor(0, r0.eventCode, proc);
            break;
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void CallCursorShop(ProcPtr proc) {
    asm(
        "\n\
            .syntax unified\n\
            push {r4, lr}\n\
            sub sp, #0x1c\n\
            adds r4, r0, #0\n\
            ldr r0, _08033F0C  @ gRAMChapterData\n\
            ldrb r0, [r0, #0xe]\n\
            lsls r0, r0, #0x18\n\
            asrs r0, r0, #0x18\n\
            bl GetChapterEventDataPointer\n\
            ldr r0, [r0, #8]\n\
            str r0, [sp]\n\
            mov r1, sp\n\
            ldr r2, _08033F10  @ gUnknown_0202BCB0\n\
            ldrh r0, [r2, #0x14]\n\
            strb r0, [r1, #0x18]\n\
            ldrh r0, [r2, #0x16]\n\
            strb r0, [r1, #0x19]\n\
            mov r0, sp\n\
            bl CheckForEvents\n\
            cmp r0, #0\n\
            beq _08033F2A\n\
            ldr r0, [sp, #0xc]\n\
            cmp r0, #0x16\n\
            beq _08033F14\n\
            cmp r0, #0x17\n\
            beq _08033F20\n\
            b _08033F2A\n\
            .align 2, 0\n\
        _08033F0C: .4byte gRAMChapterData\n\
        _08033F10: .4byte gUnknown_0202BCB0\n\
        _08033F14:\n\
            ldr r1, [sp, #4]\n\
            movs r0, #0\n\
            adds r2, r4, #0\n\
            bl MakeShopArmory\n\
            b _08033F2A\n\
        _08033F20:\n\
            ldr r1, [sp, #4]\n\
            movs r0, #0\n\
            adds r2, r4, #0\n\
            bl MakeShopVendor\n\
        _08033F2A:\n\
            add sp, #0x1c\n\
            pop {r4}\n\
            pop {r0}\n\
            bx r0\n\
            .syntax divided\n\
    ");
}

#endif // NONMATCHING