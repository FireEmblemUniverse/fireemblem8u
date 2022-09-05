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
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"

#include "sallycursor.h"

// hino.s
void ArchiveCurrentPalettes();
void WriteFadedPaletteFromArchive(int, int, int, int);
void ContinueUntilSomeTransistion6CExists(ProcPtr);
void sub_8013800();
void sub_8013844(ProcPtr);
void sub_8013D68(ProcPtr);
void sub_8013D80(ProcPtr);
void sub_8013D8C(ProcPtr);
void sub_8013DA4(ProcPtr);

// bmusort.s
void InitUnitStack(u8*); // accepts generic buffer
void PushUnit(struct Unit*);
void LoadPlayerUnitsFromUnitStack2();

// unitswapfx.s
void sub_801EC10(ProcPtr, struct Unit*, s16, s16);
void sub_801EC48(ProcPtr);

// ev_triggercheck.s
const struct UnitDefinition* GetChapterAllyUnitDataPointer();
struct EventCheckBuffer* CheckForEvents(struct EventCheckBuffer*);

// evtsub.s
void InitPlayerUnitPositionsForPrepScreen();
void sub_801240C();

// code.s
bool8 IsCharacterForceDeployed(int);
void SortPlayerUnitsForPrepScreen();
void MakeShopArmory(int, int, ProcPtr);
void MakeShopVendor(int, int, ProcPtr);
bool8 sub_8094FF4();
int sub_809541C();
int sub_8095970();
void sub_8096454(ProcPtr);
void sub_80966B0(ProcPtr);
void sub_8096FAC();
void sub_8096FD0(const void*);
void sub_8096FEC(const void*);
void sub_8097008(const void*);
void sub_8097024(int, const void*, int, int, int);
void sub_80970CC(int);
void sub_8097154(int, int);
void sub_80972B0();
void sub_8097340(ProcPtr);
void sub_8097394(ProcPtr);
void sub_80A48F0(u8);
void sub_80ADDD4(ProcPtr);
void BWL_IncrementDeployCountMaybe(u8);
void sub_80B9FC0();
void Make6C_savemenu2(ProcPtr);
void NewPrepScreenTraineePromotionManager(ProcPtr);
void PrepScreenTraineePromotionManagerExists(ProcPtr);

// code_sio.s
int CheckSomethingSomewhere();

// bb.s
void sub_8035758(ProcPtr);

// asmcs.s
void nullsub_20(ProcPtr);


extern struct Vec2 gActiveUnitMoveOrigin;

extern struct ProcCmd CONST_DATA gProcScr_ADJUSTSFROMXI[];
extern u16 CONST_DATA gUnknown_085A0EA0[]; // ap
extern struct ProcCmd CONST_DATA gUnknown_08A2ED88[];

static struct ProcCmd CONST_DATA sProcScr_SALLYCURSORHelpPrompt[] = {
    PROC_CALL(sub_8033548),
    PROC_REPEAT(sub_8033574),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SALLYCURSOR[] = {
    PROC_NAME("SALLYCURSOR"),

    PROC_SLEEP(0x10),
    PROC_CALL(sub_80341D0),
    PROC_WHILE(PrepScreenProc_AddPostgameUnits),
    PROC_SLEEP(1),
    PROC_CALL(sub_8034200),
    PROC_CALL(InitPrepScreenUnitsAndCamera),
    PROC_SLEEP(1),
    PROC_CALL(sub_8034194),
    PROC_SLEEP(8),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),

PROC_LABEL(2),
    PROC_CALL(sub_8096454),
    PROC_WHILE(sub_80966B0),
    PROC_SLEEP(0),
    PROC_CALL(sub_80338C0),

    PROC_GOTO(0x32),

PROC_LABEL(0x33),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(sub_8096454),
    PROC_WHILE(sub_80966B0),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(0x32),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(SMS_UpdateFromGameData),
    PROC_CALL(sub_80334BC),
    PROC_CALL(sub_80334CC),
    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_GOTO(0x3D),

PROC_LABEL(0),
    PROC_CALL(sub_8033514),
    PROC_WHILE(sub_8013844),
    PROC_CALL(sub_8033648),

    // fallthrough

PROC_LABEL(0x3D),
    PROC_CALL(sub_8097394),
    PROC_WHILE(sub_8097340),
    PROC_CALL(sub_80334E8),
    PROC_WHILE(sub_8013844),

    // fallthrough

PROC_LABEL(9),
    PROC_WHILE(sub_8035758),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(SMS_UpdateFromGameData),
    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_REPEAT(sub_8033940),
    PROC_REPEAT(sub_8033978),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(sub_8033F34),

    PROC_GOTO(9),

PROC_LABEL(0x35),
    PROC_CALL(sub_803348C),
    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_CALL(SALLYCURSOR_DeploySupplyUnit), // add convoy unit?

    PROC_GOTO(0x34),

PROC_LABEL(0x36),
    PROC_CALL(sub_803348C),
    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_CALL(SALLYCURSOR_RemoveSupplyUnit), // remove convoy unit?

    PROC_GOTO(0x34),

PROC_LABEL(0x34),
    PROC_CALL(sub_8033E8C),
    PROC_SLEEP(0),
    PROC_CALL(sub_8033EA4),
    PROC_SLEEP(0x3C),

    PROC_GOTO(0),

PROC_LABEL(5),
    PROC_CALL(RefreshBMapGraphics),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),

    PROC_GOTO(9),

PROC_LABEL(6),
    PROC_CALL(sub_8034090),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(SALLYCURSOR6C_StartUnitSwap),
    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_REPEAT(sub_8033C90),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(sub_8033E08),
    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_WHILE(sub_801EC48),
    PROC_CALL(sub_8033E8C),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(SMS_UpdateFromGameData),
    PROC_SLEEP(0),
    PROC_CALL(sub_8033EA4),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_CALL(sub_8033DD8),
    PROC_SLEEP(0),

    PROC_GOTO(9),

PROC_LABEL(0xB),

    PROC_GOTO(1),

PROC_LABEL(0x39),
    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(sub_8033EC0),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),

    PROC_GOTO(0x3E),

PROC_LABEL(0x38),
    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(sub_808E79C),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),

    PROC_GOTO(0x3E),

PROC_LABEL(0x3B),
    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(sub_803410C),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),
    PROC_CALL(sub_8034168),

    PROC_GOTO(0x3E),

PROC_LABEL(0x37),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(sub_8034078),
    PROC_CALL(nullsub_20),
    PROC_SLEEP(0),
    PROC_CALL(sub_801240C),
    PROC_CALL(sub_8034278),

    PROC_BLOCK,

PROC_LABEL(0x3E),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(SMS_UpdateFromGameData),
    PROC_CALL(sub_8033648),
    PROC_CALL(sub_80334CC),
    PROC_CALL(sub_8013DA4),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_GOTO(0x3D),

PROC_LABEL(0x3C),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(CallCursorShop),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(SMS_UpdateFromGameData),
    PROC_CALL(sub_8034194),
    PROC_CALL(sub_8033608),
    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_GOTO(9),

PROC_LABEL(0x3A),
    PROC_SLEEP(0),
    PROC_CALL(sub_8033648),

    PROC_GOTO(0x3D),

    PROC_END,
};


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
    uDef += sub_809541C(); // TODO - Seems to be count of non-deployable / force-deployed characters

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

void sub_8033358(struct UnknownSALLYCURSORProc* proc) {
    proc->unk_58 = 1;
    Proc_Break(proc);
    sub_803334C();
    return;
}

void sub_803336C(struct UnknownSALLYCURSORProc* proc) {
    s16 x, y;
    proc->unk_58 = 2;

    x = gUnknown_0202BCB0.playerCursor.x;
    y = gUnknown_0202BCB0.playerCursor.y;

    TrySwitchViewedUnit(x, y);

    x = gUnknown_0202BCB0.playerCursorDisplay.x;
    y = gUnknown_0202BCB0.playerCursorDisplay.y;
    DisplayCursor(x, y, 0);

    Proc_Break(proc);
    sub_803334C();
}

bool8 sub_80333A4(ProcPtr proc) {
    if (sub_8095970() == 0) {
        return 0;
    }
    Proc_Goto(proc, 55);
    return 1;
}

bool8 sub_80333C4(ProcPtr proc) {
    Proc_Goto(proc, 51);
    return 1;
}

void SALLYCURSOR_DeploySupplyUnit() {
    struct Unit* unit = GetSupplyUnit();
    if (unit) {
        unit->state &= ~US_NOT_DEPLOYED;

        unit->xPos = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[1];
        unit->yPos = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[3];

        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
    }
    return;
}

void sub_803341C(struct UnknownSALLYCURSORProc* proc) {
    proc->unk_58 = 8;
    Proc_Goto(proc, 0x39);
    return;
}

void SALLYCURSOR_RemoveSupplyUnit() {
    struct Unit* unit = GetSupplyUnit();
    if (unit) {
        unit->state |= US_NOT_DEPLOYED;

        unit->xPos = 0xFF;
        unit->yPos = 0xFF;

        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
    }
    return;
}

void sub_8033458(struct UnknownSALLYCURSORProc* proc) {
    proc->unk_58 = 9;
    Proc_Goto(proc, 0x3B);
    return;
}

void sub_8033468(struct UnknownSALLYCURSORProc* proc) {
    proc->unk_58 = 0xA;
    sub_803334C();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, 0x3A);
    return;
}

void sub_803348C(ProcPtr proc) {
    EnsureCameraOntoPosition(proc,
        GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[1],
            GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk81[3]);
    return;
}

void sub_80334BC(struct UnknownSALLYCURSORProc* proc) {
    proc->unk_58 = 1;
    sub_8033648(proc);
    return;
}

void sub_80334CC() {
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xFF00FFF0);
    return;
}

void sub_80334E8(int r0) {
    sub_8013800(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, r0);
    return;
}

void sub_8033514(int r4) {
    ArchiveCurrentPalettes();
    sub_8013800(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, r4);
    return;
}

void sub_8033548(ProcPtr proc) {
    StartHelpPromptSprite(0xAA, 0x8C, 2, proc);
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
    Proc_Start(sProcScr_SALLYCURSORHelpPrompt, proc);
}

void sub_8033634() {
    EndHelpPromptSprite();
    Proc_EndEach(sProcScr_SALLYCURSORHelpPrompt);
}

void sub_8033648(struct UnknownSALLYCURSORProc* proc) {
    LoadDialogueBoxGfx(0, -1);
    Font_InitForUIDefault();
    EndPlayerPhaseSideWindows();
    HideMoveRangeGraphics();

    sub_8096FAC(proc);

    sub_8097024(1, *sub_8033358, 0, 0x590, 0x5BB);

    sub_8097024(2, *sub_803336C, (sub_8095970() ? 0 : 1), 0x591, 0x5BC);

    sub_8097024(8, *sub_803341C, 0, 0x592, 0x5BD);

    if ((sub_8094FF4() << 0x18) != 0) {
        sub_8097024(9, *sub_8033458, 0, 0x579, 0x5BE);
    } else {
        sub_8097024(9, *sub_8033458, 1, 0x579, 0x5BE);
    }

    sub_8033620(proc);
    sub_8096FD0(*sub_80333C4);
    sub_8096FEC(*sub_80333A4);
    sub_8097008(*sub_8033634);
    sub_8097154(0xA, 2);

    sub_80970CC(proc->unk_58);
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

void sub_8033770(struct UnknownSALLYCURSORProc* proc) {
    s16 x;

    proc->unk_4A = 0;

    proc->unk_2C = 0;
    proc->unk_30 = 0;
    proc->unk_34 = 2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - 0x78;

    return;
}

void sub_8033798(struct UnknownSALLYCURSORProc* proc) {
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = 2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337B4(struct UnknownSALLYCURSORProc* proc) {
    s16 x;

    proc->unk_34 = -2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - 0x78;

    return;
}

void sub_80337D4(struct UnknownSALLYCURSORProc* proc) {
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = -2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337F0(struct UnknownSALLYCURSORProc* proc) {
    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gKeyStatusPtr->newKeys) {
        proc->unk_4A = 1;
    }

    if (proc->unk_4A && !(0xF & proc->unk_2C) && !(0xF & proc->unk_30)) {
        Proc_Goto(proc, 2);
        return;
    }

    proc->unk_2C += proc->unk_34;

    proc->unk_30 += proc->unk_38;

    gUnknown_0202BCB0.camera.x = proc->unk_2C;
    gUnknown_0202BCB0.camera.y = proc->unk_30;

    proc->unk_4C--;

    if (proc->unk_4C <= 0) {
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

void sub_8033940(struct UnknownSALLYCURSORProc* proc) {
    if (!DoesBMXFADEExist()) {
        if (proc->unk_58 == 2) {
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
            TrySwitchViewedUnit(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
            PlaySoundEffect(0x6B);
            goto showcursor;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            if (gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]) {
                if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]))) {
                    MU_EndAll();
                    EndPlayerPhaseSideWindows();
                    SetStatScreenConfig(0x1F);
                    StartStatScreen(GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]), proc);
                    Proc_Goto(proc, 5);
                    return;
                }
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            EndPlayerPhaseSideWindows();
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
                    EndPlayerPhaseSideWindows();
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
            EndPlayerPhaseSideWindows();
            StartMinimapPrepPhase(proc);
            Proc_Goto(proc, 9);
            return;
        }
    }

    showcursor:
    DisplayCursor(gUnknown_0202BCB0.playerCursorDisplay.x, gUnknown_0202BCB0.playerCursorDisplay.y, 0);

    return;
}

int sub_8033BF8() {
    ProcPtr proc = Proc_Find(gProcScr_SALLYCURSOR);
    Proc_Goto(proc, 0x33);
    return 0x17;
}

void SALLYCURSOR6C_StartUnitSwap(struct UnknownSALLYCURSORProc* proc) {
    struct APHandle* ap = AP_Create(gUnknown_085A0EA0, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    proc->unk_54 = ap;
    proc->unk_4A = 2;
    proc->unk_3C = gUnknown_0202BCB0.playerCursor.x;
    proc->unk_40 = gUnknown_0202BCB0.playerCursor.y;

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

void CallCursorShop(ProcPtr proc) {
    struct EventCheckBuffer r0;
    const struct ChapterEventInfo *einfo = GetChapterEventDataPointer(gRAMChapterData.chapterIndex);
    struct EventCheckBuffer *buf;
    r0.eventDef = einfo->unk_08;

    r0.xPos = gUnknown_0202BCB0.playerCursor.x;
    r0.yPos = gUnknown_0202BCB0.playerCursor.y;
    buf = CheckForEvents(&r0);
    if (!buf) {
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

void sub_8033F34(ProcPtr proc) {
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        MU_EndAll();
        gActiveUnit->state &= ~US_HIDDEN;
        gUnknown_0202BCB0.gameStateBits &= 0xF7;

        HideMoveRangeGraphics();
        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();

        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 9);
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        u8 uid = gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];

        if (gActiveUnitMoveOrigin.x == gUnknown_0202BCB0.playerCursor.x && gActiveUnitMoveOrigin.y == gUnknown_0202BCB0.playerCursor.y) {
            uid = gActiveUnit->index;
        }

        if (uid) {
            struct Unit* unit = GetUnit(uid);
            if (CanShowUnitStatScreen(unit)) {
                MU_EndAll();
                SetStatScreenConfig(0x1F);
                StartStatScreen(GetUnit(uid), proc);
                Proc_Goto(proc, 6);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & L_BUTTON) {
        if (gActiveUnit) {
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(0x6B);
        }
    }

    DisplayCursor(gUnknown_0202BCB0.playerCursorDisplay.x, gUnknown_0202BCB0.playerCursorDisplay.y, 1);

    return;
}

void sub_8034078(ProcPtr proc) {
    SetupBackgrounds(0);
    sub_80ADDD4(proc);
    return;
}

void sub_8034090(ProcPtr proc) {
    if (gActiveUnit == NULL) {
        RefreshBMapGraphics();
        Proc_Goto(proc, 0xC);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    Proc_Goto(proc, 0xB);

    return;
}

void sub_803410C(ProcPtr proc) {
    gRAMChapterData.unk4A_2 = 2;

    if (!(0x20 & gRAMChapterData.chapterStateBits) && ((GetChapterThing() - 1) <= 1)) {
        gRAMChapterData.unk4A_2 = 4;
    }

    ISuspectThisToBeMusicRelated_8002730(0x100, 0x80, 0x20, 0);
    sub_801240C();
    Make6C_savemenu2(proc);

    return;
}

void sub_8034168() {
    ISuspectThisToBeMusicRelated_8002730(0x80, 0x100, 0x20, 0);
    gRAMChapterData.unk4A_2 = 2;
    return;
}

void sub_8034194() {
    if (CheckSomethingSomewhere()) {
        return;
    }

    if (GMAP_STATE_BIT0 & gUnknown_03005280.state) {
        sub_80B9FC0();
        return;
    }

    sub_80029E8(0x34, 0x100, 0x100, 0x18, 0);

    return;
}

void sub_80341D0() {
    AddSkipThread2();
    BMapDispSuspend();

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    return;
}

void sub_8034200() {
    SubSkipThread2();
    BMapDispResume();

    sub_80141B0(); // disables layers

    return;
}

void ShrinkPlayerUnits() {
    int uid;

    if (!(0x80 & gRAMChapterData.chapterStateBits)) {
        return;
    }

    if ((0x40 & gUnknown_0202BCB0.gameStateBits)) {
        return;
    }

    InitUnitStack(gUnknown_02020188);
    for (uid = 1; uid <= 0x3F; ++uid) {
        struct Unit* unit = GetUnit(uid);
        if (UNIT_IS_VALID(unit)) {
            if (!(unit->state & US_UNAVAILABLE)) {
                PushUnit(unit);
            }
        }
    }
    LoadPlayerUnitsFromUnitStack2();
    return;
}

void sub_8034278() {
    int uid;
    for (uid = 1; uid <= 0x3F; ++uid) {
        struct Unit* unit = GetUnit(uid);

        if (!unit) {
            continue;
        }

        if (!unit->pCharacterData) {
            continue;
        }

        unit->state &= ~(US_UNSELECTABLE);

        if (unit->state & (US_DEAD | US_BIT16 | US_BIT25)) {
            continue;
        }

        if (unit->state & US_NOT_DEPLOYED) {
            sub_80A48F0(unit->pCharacterData->number);
        } else {
            BWL_IncrementDeployCountMaybe(unit->pCharacterData->number);
        }
    }

    ShrinkPlayerUnits();
    Proc_EndEach(gProcScr_SALLYCURSOR);
    gUnknown_0202BCB0.gameStateBits &= 0xEF;
    gRAMChapterData.chapterStateBits &= 0xEF;
    gRAMChapterData.unk4A_1 = 1;
    return;
}

bool8 sub_80342FC() {
    return Proc_Find(gProcScr_SALLYCURSOR) ? 1 : 0;
}
