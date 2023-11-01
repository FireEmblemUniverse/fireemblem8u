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
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"

// hino.s
void WaitForFade(ProcPtr);

// evtsub.s
void InitPlayerUnitPositionsForPrepScreen();
void sub_801240C();

// code.s
s8 IsCharacterForceDeployed(int);
void SortPlayerUnitsForPrepScreen();
u8 CanPrepScreenSave();
int CalcForceDeployedUnitCounts();
void StartPrepAtMenu(ProcPtr);
void PrepAtMenuExists(ProcPtr);
void StartPrepScreenMenu(ProcPtr);
void SetPrepScreenMenuOnBPress(const void*);
void SetPrepScreenMenuOnStartPress(const void*);
void SetPrepScreenMenuOnEnd(const void*);
void SetPrepScreenMenuItem(int, const void*, int, int, int);
void SetPrepScreenMenuSelectedItem(int);
void DrawPrepScreenMenuFrameAt(int, int);
int PrepScreenMenuExists();
void EnablePrepScreenMenu(ProcPtr);
void PidStatsSubFavval100(u8);
void PidStatsAddDeployAmt(u8);
void sub_80B9FC0();
void Make6C_SaveMenuPostChapter(ProcPtr);
void NewPrepScreenTraineePromotionManager(ProcPtr);
int PrepScreenTraineePromotionManagerExists(ProcPtr);
int CheckInLinkArena();

// asmcs.s
void nullsub_20(ProcPtr);


extern struct Vec2 gActiveUnitMoveOrigin;

extern struct ProcCmd CONST_DATA gProcScr_ADJUSTSFROMXI[];
extern u16 CONST_DATA gUnknown_085A0EA0[]; // ap

static struct ProcCmd CONST_DATA sProcScr_SALLYCURSORHelpPrompt[] = {
    PROC_CALL(sub_8033548),
    PROC_REPEAT(sub_8033574),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SALLYCURSOR[] = {
    PROC_NAME("SALLYCURSOR"),

    PROC_SLEEP(16),
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
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_SLEEP(0),
    PROC_CALL(sub_80338C0),

    PROC_GOTO(50),

PROC_LABEL(51),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(50),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PrepScreenProc_InitMapMenu),
    PROC_CALL(sub_80334CC),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(61),

PROC_LABEL(0),
    PROC_CALL(sub_8033514),
    PROC_WHILE(sub_8013844),
    PROC_CALL(PrepScreenProc_StartMapMenu),

    // fallthrough

PROC_LABEL(61),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_WHILE(PrepScreenMenuExists),
    PROC_CALL(sub_80334E8),
    PROC_WHILE(sub_8013844),

    // fallthrough

PROC_LABEL(9),
    PROC_WHILE(IsSubtitleHelpActive),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_REPEAT(sub_8033940),
    PROC_REPEAT(PrepScreenProc_MapIdle),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PrepScreenProc_MapMovementLoop),

    PROC_GOTO(9),

PROC_LABEL(53),
    PROC_CALL(sub_803348C),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_DeploySupplyUnit),

    PROC_GOTO(52),

PROC_LABEL(54),
    PROC_CALL(sub_803348C),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_RemoveSupplyUnit),

    PROC_GOTO(52),

PROC_LABEL(52),
    PROC_CALL(sub_8033E8C),
    PROC_SLEEP(0),
    PROC_CALL(sub_8033EA4),
    PROC_SLEEP(60),

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
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_REPEAT(sub_8033C90),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(sub_8033E08),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_WHILE(PrepUnitSwapProcExits),
    PROC_CALL(sub_8033E8C),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_SLEEP(0),
    PROC_CALL(sub_8033EA4),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_CALL(sub_8033DD8),
    PROC_SLEEP(0),

    PROC_GOTO(9),

PROC_LABEL(11),

    PROC_GOTO(1),

PROC_LABEL(57),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(sub_8033EC0),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),

    PROC_GOTO(62),

PROC_LABEL(56),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(sub_808E79C),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),

    PROC_GOTO(62),

PROC_LABEL(59),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(sub_803334C),
    PROC_CALL(StartPrepSaveScreen),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),
    PROC_CALL(sub_8034168),

    PROC_GOTO(62),

PROC_LABEL(55),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_8034078),
    PROC_CALL(nullsub_20),
    PROC_SLEEP(0),
    PROC_CALL(sub_801240C),
    PROC_CALL(EndPrepScreen),

    PROC_BLOCK,

PROC_LABEL(62),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_CALL(sub_80334CC),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(61),

PROC_LABEL(60),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(CallCursorShop),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(sub_8034194),
    PROC_CALL(sub_8033608),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(9),

PROC_LABEL(58),
    PROC_SLEEP(0),
    PROC_CALL(PrepScreenProc_StartMapMenu),

    PROC_GOTO(61),

    PROC_END,
};


int GetPlayerLeaderUnitId() {
    int i;
    int unitId;

    switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_COMMON:
        case CHAPTER_MODE_EIRIKA:
            unitId = CHARACTER_EIRIKA;
            break;

        case CHAPTER_MODE_EPHRAIM:
            unitId = CHARACTER_EPHRAIM;
            break;

        default:
            break;
    }

    if ((u8)gPlaySt.chapterIndex == 5) {
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

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i) {
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
    uDef += CalcForceDeployedUnitCounts();

    if (uDef->charIndex != 0) {
        while (uDef->charIndex) {
            GenUnitDefinitionFinalPosition(uDef, &xTmp, &yTmp, 0);
            gBmMapRange[yTmp][xTmp] = 1;
            uDef++;
        }
    }

    DisplayMoveRangeGraphics(0x10);
    return;
}

void sub_803334C() {
    EndPrepScreenMenu();
    return;
}

void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor* proc) {
    proc->unk_58 = 1;
    Proc_Break(proc);
    sub_803334C();
    return;
}

void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor* proc) {
    s16 x, y;
    proc->unk_58 = 2;

    x = gBmSt.playerCursor.x;
    y = gBmSt.playerCursor.y;

    TrySwitchViewedUnit(x, y);

    x = gBmSt.playerCursorDisplay.x;
    y = gBmSt.playerCursorDisplay.y;
    PutMapCursor(x, y, 0);

    Proc_Break(proc);
    sub_803334C();
}

bool8 PrepMapMenu_OnStartPress(ProcPtr proc) {
    if (PrepGetDeployedUnitAmt() == 0) {
        return 0;
    }
    Proc_Goto(proc, 55);
    return 1;
}

bool8 PrepMapMenu_OnBPress(ProcPtr proc) {
    Proc_Goto(proc, 51);
    return 1;
}

void SALLYCURSOR_DeploySupplyUnit() {
    struct Unit* unit = GetSupplyUnit();
    if (unit) {
        unit->state &= ~US_NOT_DEPLOYED;

        unit->xPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX;
        unit->yPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }
    return;
}

void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor* proc) {
    proc->unk_58 = 8;
    Proc_Goto(proc, 57);
    return;
}

void SALLYCURSOR_RemoveSupplyUnit() {
    struct Unit* unit = GetSupplyUnit();
    if (unit) {
        unit->state |= US_NOT_DEPLOYED;

        unit->xPos = 0xFF;
        unit->yPos = 0xFF;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }
    return;
}

void PrepMapMenu_OnSave(struct ProcPrepSallyCursor* proc) {
    proc->unk_58 = 9;
    Proc_Goto(proc, 59);
    return;
}

void sub_8033468(struct ProcPrepSallyCursor* proc) {
    proc->unk_58 = 0xA;
    sub_803334C();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, 58);
    return;
}

void sub_803348C(ProcPtr proc) {
    EnsureCameraOntoPosition(proc,
        GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX,
            GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY);
    return;
}

void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor* proc) {
    proc->unk_58 = 1;
    PrepScreenProc_StartMapMenu(proc);
    return;
}

void sub_80334CC() {
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xFF00FFF0);
    return;
}

void sub_80334E8(ProcPtr proc) {
    sub_8013800(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, proc);
    return;
}

void sub_8033514(ProcPtr proc) {
    ArchiveCurrentPalettes();
    sub_8013800(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, proc);
    return;
}

void sub_8033548(ProcPtr proc) {
    StartHelpPromptSprite(170, 140, 2, proc);
    Decompress(gUnknown_08A199C8, (void *) (OBJ_VRAM1 + 0x3000));
    ((struct ProcPrepSallyCursor*)(proc))->unk_58 = 0;
    return;
}

void sub_8033574() {
    PutSprite(4, 100, 140, gObject_32x16, 0x0000238B);
    PutSprite(4, 132, 140, gObject_32x16, 0x0000238F);
    PutSprite(4, 164, 140, gObject_16x16, 0x00002393);
    PutSprite(4, 16, 140, gObject_32x16, 0x00002395);
    PutSprite(4, 48, 140, gObject_32x16, 0x00002399);
    PutSprite(4, 80, 140, gObject_8x16, 0x0000239D);
}

void sub_8033608() {
    ApplyPalette(gUnknown_08A1B154, 0x12);
    return;
}

void sub_8033620(ProcPtr proc) {
    Proc_Start(sProcScr_SALLYCURSORHelpPrompt, proc);
}

void PrepMapMenu_OnEnd() {
    EndHelpPromptSprite();
    Proc_EndEach(sProcScr_SALLYCURSORHelpPrompt);
}

void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor* proc) {
    LoadHelpBoxGfx(0, -1);
    ResetText();
    EndPlayerPhaseSideWindows();
    HideMoveRangeGraphics();

    StartPrepScreenMenu(proc);

    SetPrepScreenMenuItem(1, *PrepMapMenu_OnViewMap, 0, 0x590, 0x5BB);

    SetPrepScreenMenuItem(2, *PrepMapMenu_OnFormation, (PrepGetDeployedUnitAmt() ? 0 : 1), 0x591, 0x5BC);

    SetPrepScreenMenuItem(8, *PrepMapMenu_OnOptions, 0, 0x592, 0x5BD);

    if (CanPrepScreenSave() != 0) {
        SetPrepScreenMenuItem(9, *PrepMapMenu_OnSave, 0, 0x579, 0x5BE);
    } else {
        SetPrepScreenMenuItem(9, *PrepMapMenu_OnSave, 1, 0x579, 0x5BE);
    }

    sub_8033620(proc);
    SetPrepScreenMenuOnBPress(*PrepMapMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(*PrepMapMenu_OnStartPress);
    SetPrepScreenMenuOnEnd(*PrepMapMenu_OnEnd);
    DrawPrepScreenMenuFrameAt(10, 2);

    SetPrepScreenMenuSelectedItem(proc->unk_58);
    BG_EnableSyncByMask(3);
    return;
}

bool8 CanCharacterBePrepMoved(int unitId) {
    if (!IsCharacterForceDeployed(unitId)) {
        if (unitId != 0x100) {
            return 1;
        }
    }

    return 0;
}

void sub_8033770(struct ProcPrepSallyCursor* proc) {
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

void sub_8033798(struct ProcPrepSallyCursor* proc) {
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = 2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337B4(struct ProcPrepSallyCursor* proc) {
    s16 x;

    proc->unk_34 = -2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - 0x78;

    return;
}

void sub_80337D4(struct ProcPrepSallyCursor* proc) {
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = -2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - 0x50;

    return;
}

void sub_80337F0(struct ProcPrepSallyCursor* proc) {
    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gKeyStatusPtr->newKeys) {
        proc->unk_4A = 1;
    }

    if (proc->unk_4A && !(0xF & proc->unk_2C) && !(0xF & proc->unk_30)) {
        Proc_Goto(proc, 2);
        return;
    }

    proc->unk_2C += proc->unk_34;

    proc->unk_30 += proc->unk_38;

    gBmSt.camera.x = proc->unk_2C;
    gBmSt.camera.y = proc->unk_30;

    proc->unk_4C--;

    if (proc->unk_4C <= 0) {
        Proc_Break(proc);
    }

    return;
}

void InitPrepScreenUnitsAndCamera() {
    LoadUnitPrepScreenPositions();

    if (!(PLAY_FLAG_PREPSCREEN & gPlaySt.chapterStateBits)) {
        SortPlayerUnitsForPrepScreen();
        InitPlayerUnitPositionsForPrepScreen();
        gPlaySt.chapterStateBits |= PLAY_FLAG_PREPSCREEN;
    }

    gBmSt.camera.x = GetCameraCenteredX(0);
    gBmSt.camera.y = GetCameraCenteredY(0);
    gBmSt.gameStateBits |= BM_FLAG_4;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

void sub_80338C0() {
    const struct UnitDefinition* uDef;
    s8 x;
    s8 y;
    struct Unit* unit = GetUnitFromCharId(GetPlayerLeaderUnitId());

    if (unit && PrepGetDeployedUnitAmt()) {
        SetCursorMapPosition(unit->xPos, unit->yPos);
    } else {
        uDef = GetChapterAllyUnitDataPointer();
        uDef = uDef + CalcForceDeployedUnitCounts();
        GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);
        SetCursorMapPosition(x, y);
    }

    gBmSt.camera.x = GetCameraCenteredX(gBmSt.playerCursor.x * 16);
    gBmSt.camera.y = GetCameraCenteredY(gBmSt.playerCursor.y * 16);

    return;
}

void sub_8033940(struct ProcPrepSallyCursor* proc) {
    if (!DoesBMXFADEExist()) {
        if (proc->unk_58 == 2) {
            sub_80332D0();
        }

        Proc_Break(proc);
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x,
        gBmSt.playerCursorDisplay.y, 0);

    return;
}

void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor* proc) {
    HandlePlayerCursorMovement();
    if (!DoesBMXFADEExist()) {
        if (L_BUTTON & gKeyStatusPtr->newKeys) {
            TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
            PlaySoundEffect(0x6B);
            goto showcursor;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            if (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]) {
                if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]))) {
                    MU_EndAll();
                    EndPlayerPhaseSideWindows();
                    SetStatScreenConfig(0x1F);
                    StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);
                    Proc_Goto(proc, 5);
                    return;
                }
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            EndPlayerPhaseSideWindows();
            gPlaySt.xCursor = gBmSt.playerCursor.x;
            gPlaySt.yCursor = gBmSt.playerCursor.y;
            Proc_Goto(proc, 0);
            PlaySoundEffect(0x69);
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            struct Unit* unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
            switch (GetUnitSelectionValueThing(unit)) {
                case 0:
                case 1:
                    EndPlayerPhaseSideWindows();
                    gPlaySt.xCursor = gBmSt.playerCursor.x;
                    gPlaySt.yCursor = gBmSt.playerCursor.y;

                    switch (gBmMapTerrain[gBmSt.playerCursor.y][gBmSt.playerCursor.x]) {
                        case TERRAIN_VENDOR:
                        case TERRAIN_ARMORY:
                            PlaySoundEffect(0x6A);
                            Proc_Goto(proc, 60);
                            return;
                        default:
                            Proc_Goto(proc, 0);
                            PlaySoundEffect(0x69);
                            return;
                    }
                case 2:
                    UnitBeginAction(unit);
                    gActiveUnit->state &= ~(US_HIDDEN);

                    if (proc->unk_58 == 2) {
                        Proc_Goto(proc, 3);
                        return;
                    }

                    Proc_Goto(proc, 1);
                    return;
                case 4:
                    if (proc->unk_58 == 2) {
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
    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 0);

    return;
}

int sub_8033BF8() {
    ProcPtr proc = Proc_Find(gProcScr_SALLYCURSOR);
    Proc_Goto(proc, 51);
    return 0x17;
}

void SALLYCURSOR6C_StartUnitSwap(struct ProcPrepSallyCursor* proc) {
    struct APHandle* ap = AP_Create(gUnknown_085A0EA0, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    proc->unk_54 = ap;
    proc->unk_4A = 2;
    proc->unk_3C = gBmSt.playerCursor.x;
    proc->unk_40 = gBmSt.playerCursor.y;

    StartSubtitleHelp(proc, GetStringFromIndex(0x872)); // TODO: msgid "Reorder your units.[.]"

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(0x69);

    return;
}

void sub_8033C90(struct ProcPrepSallyCursor* proc) {
    s8 r7 = ((s8**) gBmMapRange)[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
    u32 xLoc, yLoc;

    if (GetUnitSelectionValueThing(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])) == 4) {
        r7 = 0;
    }

    HandlePlayerCursorMovement();
    xLoc = (proc->unk_3C * 16) - gBmSt.camera.x;
    yLoc = (proc->unk_40 * 16) - gBmSt.camera.y;
    if (((xLoc + 0x10) <= 256) && ((yLoc + 0x20) <= 192)) {
        PutSprite(4, xLoc, yLoc - 12, gObject_16x16, 6);
    }

    if (A_BUTTON & gKeyStatusPtr->newKeys) {
        if (r7) {
            AP_Delete(proc->unk_54);
            Proc_Break(proc);
            EndSubtitleHelp();
            return;
        }
        PlaySoundEffect(0x6C);
        return;
    } else if (B_BUTTON & gKeyStatusPtr->newKeys) {
        AP_Delete(proc->unk_54);
        Proc_Goto(proc, 4);
        EndSubtitleHelp();
        PlaySoundEffect(0x6B);
        return;
    }

    if (r7 != proc->unk_4A) {
        AP_SwitchAnimation(proc->unk_54, r7 == 0 ? 1 : 0);
    }

    AP_Update(proc->unk_54,
        gBmSt.playerCursorDisplay.x - gBmSt.camera.x,
            gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

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
    struct Unit* targetUnit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
    if (!targetUnit) {
        StartPrepUnitSwap(proc, activeUnit, gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    } else {
        StartPrepUnitSwap(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        StartPrepUnitSwap(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(0x61);
    return;
}

void sub_8033E8C() {
    if (gPlaySt.chapterVisionRange != 0) {
        RenderBmMapOnBg2();
    }
    return;
}

void sub_8033EA4() {
    if (gPlaySt.chapterVisionRange != 0) {
        RenderBmMap();
        NewBMXFADE(0);
    }
    return;
}

void sub_8033EC0(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_Config2, proc);
    return;
}

void CallCursorShop(ProcPtr proc) {
    struct EventInfo info;
    const struct ChapterEventGroup *evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);
    struct EventInfo *pInfo;

    info.listScript = evGroup->locationBasedEvents;
    info.xPos = gBmSt.playerCursor.x;
    info.yPos = gBmSt.playerCursor.y;

    pInfo = SearchAvailableEvent(&info);
    if (!pInfo) {
        return;
    }

    switch (info.commandId) {
        case TILE_COMMAND_ARMORY:
            StartArmoryScreen(NULL, (u16*) info.script, proc);
            break;

        case TILE_COMMAND_VENDOR:
            StartVendorScreen(NULL, (u16*) info.script, proc);
            break;
    }

    return;
}

void PrepScreenProc_MapMovementLoop(ProcPtr proc) {
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        MU_EndAll();
        gActiveUnit->state &= ~US_HIDDEN;
        gBmSt.gameStateBits &= ~BM_FLAG_3;

        HideMoveRangeGraphics();
        RefreshEntityBmMaps();
        RefreshUnitSprites();

        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 9);
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        u8 uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

        if (gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x && gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y) {
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

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}

void sub_8034078(ProcPtr proc) {
    SetupBackgrounds(0);
    EndAllProcChildren(proc);
    return;
}

void sub_8034090(ProcPtr proc) {
    if (gActiveUnit == NULL) {
        RefreshBMapGraphics();
        Proc_Goto(proc, 12);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    Proc_Goto(proc, 11);

    return;
}

void StartPrepSaveScreen(ProcPtr proc) {
    gPlaySt.unk4A_2 = 2;

    if (!(PLAY_FLAG_COMPLETE & gPlaySt.chapterStateBits) && ((GetChapterThing() - 1) <= 1)) {
        gPlaySt.unk4A_2 = 4;
    }

    StartBgmVolumeChange(0x100, 0x80, 0x20, 0);
    sub_801240C();
    Make6C_SaveMenuPostChapter(proc);

    return;
}

void sub_8034168() {
    StartBgmVolumeChange(0x80, 0x100, 0x20, 0);
    gPlaySt.unk4A_2 = 2;
    return;
}

void sub_8034194() {
    if (CheckInLinkArena()) {
        return;
    }

    if (gGMData.state.bits.state_0) {
        sub_80B9FC0();
        return;
    }

    CallSomeSoundMaybe(0x34, 0x100, 0x100, 0x18, 0);

    return;
}

void sub_80341D0() {
    LockGame();
    BMapDispSuspend();

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    return;
}

void sub_8034200() {
    UnlockGame();
    BMapDispResume();

    sub_80141B0(); // disables layers

    return;
}

void ShrinkPlayerUnits() {
    int i;

    if (!(PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits)) {
        return;
    }

    if (BM_FLAG_LINKARENA & gBmSt.gameStateBits) {
        return;
    }

    InitUnitStack(gGenericBuffer);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (!(unit->state & US_UNAVAILABLE)) {
            PushUnit(unit);
        }
    }

    LoadPlayerUnitsFromUnitStack2();

    return;
}

void EndPrepScreen() {
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        unit->state &= ~(US_UNSELECTABLE);

        if (unit->state & (US_DEAD | US_BIT16 | US_BIT25)) {
            continue;
        }

        if (unit->state & US_NOT_DEPLOYED) {
            PidStatsSubFavval100(unit->pCharacterData->number);
        } else {
            PidStatsAddDeployAmt(unit->pCharacterData->number);
        }
    }

    ShrinkPlayerUnits();
    Proc_EndEach(gProcScr_SALLYCURSOR);
    gBmSt.gameStateBits &= ~BM_FLAG_4;
    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
    gPlaySt.unk4A_1 = 1;
    return;
}

bool8 sub_80342FC() {
    return Proc_Find(gProcScr_SALLYCURSOR) ? 1 : 0;
}
