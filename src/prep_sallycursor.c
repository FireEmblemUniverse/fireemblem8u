#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
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
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "helpbox.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bmsave.h"
#include "bmlib.h"
#include "eventcall.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/terrains.h"
#include "constants/songs.h"

// TODO: Implicit declaration?
int CanShowUnitStatScreen(struct Unit * unit);
int CheckInLinkArena(void);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_PrepHelpPrompt[] =
{
    PROC_CALL(PrepHelpPrompt_Init),
    PROC_REPEAT(PrepHelpPrompt_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SALLYCURSOR[] =
{
    PROC_NAME("SALLYCURSOR"),
    PROC_SLEEP(16),

    PROC_CALL(PrepScreenProc_LockGame),
    PROC_WHILE(PrepScreenProc_AddPostgameUnits),
    PROC_SLEEP(1),

    PROC_CALL(PrepScreenProc_HideEverythingAndUnlockGame),
    PROC_CALL(InitPrepScreenUnitsAndCamera),
    PROC_SLEEP(1),

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_SLEEP(8),

    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),

PROC_LABEL(PL_SALLYCURSOR_START_ATMENU),
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_YIELD,
    PROC_CALL(InitPrepScreenCursorPosition),

    PROC_GOTO(PL_SALLYCURSOR_ENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_RETURN_TO_ATMENU),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_ENTER_MAP),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_InitMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_OPEN_MAP_MENU),
    PROC_CALL(PrepScreenProc_StartDimMap),
    PROC_WHILE(MapPaletteBrightnessFadeExists),
    PROC_CALL(PrepScreenProc_StartMapMenu),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_MAP_MENU),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_WHILE(PrepScreenMenuExists),
    PROC_CALL(PrepScreenProc_StartBrightenMap),
    PROC_WHILE(MapPaletteBrightnessFadeExists),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_MAP_IDLE),
    PROC_WHILE(IsSubtitleHelpActive),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_REPEAT(PrepScreenProc_SetupMapIdle),
    PROC_REPEAT(PrepScreenProc_MapIdle),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_UNIT_SELECTED),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PrepScreenProc_MapMovementLoop),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_SUPPLY_DEPLOY),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_DeploySupplyUnit),

    PROC_GOTO(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),

PROC_LABEL(PL_SALLYCURSOR_SUPPLY_REMOVE),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_RemoveSupplyUnit),

    PROC_GOTO(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),

PROC_LABEL(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),
    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),
    PROC_SLEEP(60),

    PROC_GOTO(PL_SALLYCURSOR_OPEN_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_POST_STATSCREEN_IDLE),
    PROC_CALL(RefreshBMapGraphics),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_POST_STATSCREEN_MOVE),
    PROC_CALL(PrepScreenProc_RefreshAfterStatScreen),

    PROC_GOTO(PL_SALLYCURSOR_UNIT_SELECTED),

PROC_LABEL(PL_SALLYCURSOR_UNIT_SWAP),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(PrepScreen_StartUnitSwap),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_REPEAT(PrepScreen_UnitSwapIdle),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(PrepScreen_StartUnitSwapAnim),

    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_WHILE(PrepUnitSwapProcExits),

    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_CANCEL_SWAP),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(PrepScreenProc_RecenterOnActiveUnit),
    PROC_YIELD,

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_0B),

    PROC_GOTO(PL_SALLYCURSOR_UNIT_SELECTED),

PROC_LABEL(PL_SALLYCURSOR_OPTIONS),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(PrepScreenProc_StartConfigMenu),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_CHAPTER_STATUS),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(StartChapterStatusScreen_FromPrep),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_SAVE),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(StartPrepSaveScreen),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(PrepScreenProc_RestoreBgmAfterSave),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_END_PREP),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PrepScreenProc_Cleanup),

    PROC_CALL(Nop_Eventcall_0),
    PROC_YIELD,

    PROC_CALL(SyncUnitDeploymentState),
    PROC_CALL(EndPrepScreen),

    PROC_BLOCK,

PROC_LABEL(PL_SALLYCURSOR_REENTER_MAP),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_SHOP),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(PrepScreenProc_StartShopScreen),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepScreenProc_ApplyBrownBoxPalette),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_POST_DEBUG_MENU),
    PROC_YIELD,
    PROC_CALL(PrepScreenProc_StartMapMenu),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08033258
int GetPlayerLeaderPid(void)
{
    int i;
    int pid;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_COMMON:
        case CHAPTER_MODE_EIRIKA:
            pid = CHARACTER_EIRIKA;
            break;

        case CHAPTER_MODE_EPHRAIM:
            pid = CHARACTER_EPHRAIM;
            break;
    }

    if ((u8)gPlaySt.chapterIndex == CHAPTER_L_5X)
    {
        return CHARACTER_EPHRAIM;
    }

    do
    {
        struct Unit * unit;

        if (GetBattleMapKind() == BATTLEMAP_KIND_STORY)
        {
            return pid;
        }

        unit = GetUnitFromCharId(pid);

        if (unit != NULL && !(unit->state & US_NOT_DEPLOYED))
        {
            return pid;
        }

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
        {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (unit->state & US_UNAVAILABLE)
            {
                continue;
            }

            return unit->pCharacterData->number;
        }
    } while (0);

    return pid;
}

//! FE8U = 0x080332D0
void Prep_ShowDeployableTiles(void)
{
    s8 xTmp;
    s8 yTmp;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    BmMapFill(gBmMapRange, 0);
    BmMapFill(gBmMapMovement, -1);

    uDef += CalcForceDeployedUnitCounts();

    for (; uDef->charIndex != 0; uDef++)
    {
        GenUnitDefinitionFinalPosition(uDef, &xTmp, &yTmp, false);
        gBmMapRange[yTmp][xTmp] = 1;
    }

    DisplayMoveRangeGraphics(0x10);

    return;
}

//! FE8U = 0x0803334C
void EndPrepScreenMenu_(void)
{
    EndPrepScreenMenu();
    return;
}

//! FE8U = 0x08033358
void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_VIEW_MAP;
    Proc_Break(proc);
    EndPrepScreenMenu_();
    return;
}

//! FE8U = 0x0803336C
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor * proc)
{
    s16 x;
    s16 y;

    proc->lastCmd = PREP_MAPMENU_FORMATION;

    x = gBmSt.playerCursor.x;
    y = gBmSt.playerCursor.y;

    TrySwitchViewedUnit(x, y);

    x = gBmSt.playerCursorDisplay.x;
    y = gBmSt.playerCursorDisplay.y;

    PutMapCursor(x, y, 0);

    Proc_Break(proc);
    EndPrepScreenMenu_();

    return;
}

//! FE8U = 0x080333A4
bool PrepMapMenu_OnStartPress(ProcPtr proc)
{
    if (PrepGetDeployedUnitAmt() == 0)
    {
        return false;
    }

    Proc_Goto(proc, PL_SALLYCURSOR_END_PREP);

    return true;
}

//! FE8U = 0x080333C4
bool PrepMapMenu_OnBPress(ProcPtr proc)
{
    Proc_Goto(proc, PL_SALLYCURSOR_RETURN_TO_ATMENU);
    return true;
}

//! FE8U = 0x080333D4
void SALLYCURSOR_DeploySupplyUnit(void)
{
    struct Unit * unit = GetSupplyUnit();

    if (unit != NULL)
    {
        unit->state &= ~US_NOT_DEPLOYED;

        unit->xPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX;
        unit->yPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    return;
}

//! FE8U = 0x0803341C
void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_OPTIONS;
    Proc_Goto(proc, PL_SALLYCURSOR_OPTIONS);
    return;
}

//! FE8U = 0x0803342C
void SALLYCURSOR_RemoveSupplyUnit(void)
{
    struct Unit * unit = GetSupplyUnit();

    if (unit)
    {
        unit->state |= US_NOT_DEPLOYED;

        unit->xPos = 0xFF;
        unit->yPos = 0xFF;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    return;
}

//! FE8U = 0x08033458
void PrepMapMenu_OnSave(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_SAVE;
    Proc_Goto(proc, PL_SALLYCURSOR_SAVE);
    return;
}

//! FE8U = 0x08033468
void PrepMapMenu_OnDebug_Unused(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_DEBUG;
    EndPrepScreenMenu_();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, PL_SALLYCURSOR_POST_DEBUG_MENU);
    return;
}

//! FE8U = 0x0803348C
void PrepScreenProc_SetCameraOnSupply(ProcPtr proc)
{
    EnsureCameraOntoPosition(
        proc, GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX,
        GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY);
    return;
}

//! FE8U = 0x080334BC
void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_VIEW_MAP;
    PrepScreenProc_StartMapMenu(proc);
    return;
}

//! FE8U = 0x080334CC
void PrepScreenProc_DimMapImmediate(void)
{
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xFF00FFF0);
    return;
}

//! FE8U = 0x080334E8
void PrepScreenProc_StartBrightenMap(ProcPtr proc)
{
    StartMapPaletteBrightnessFade(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, proc);
    return;
}

//! FE8U = 0x08033514
void PrepScreenProc_StartDimMap(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    StartMapPaletteBrightnessFade(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, proc);
    return;
}

//! FE8U = 0x08033548
void PrepHelpPrompt_Init(struct ProcPrepSallyCursor * proc)
{
    StartHelpPromptSprite(170, 140, 2, proc);
    Decompress(Img_PrepHelpButtonSprites, OBJ_CHR_ADDR(0x380));
    proc->lastCmd = PREP_MAPMENU_NONE;
    return;
}

//! FE8U = 0x08033574
void PrepHelpPrompt_Loop(void)
{
    PutSprite(4, 100, 140, gObject_32x16, OAM2_CHR(0x38B) + OAM2_PAL(2));
    PutSprite(4, 132, 140, gObject_32x16, OAM2_CHR(0x38F) + OAM2_PAL(2));
    PutSprite(4, 164, 140, gObject_16x16, OAM2_CHR(0x393) + OAM2_PAL(2));
    PutSprite(4, 16, 140, gObject_32x16, OAM2_CHR(0x395) + OAM2_PAL(2));
    PutSprite(4, 48, 140, gObject_32x16, OAM2_CHR(0x399) + OAM2_PAL(2));
    PutSprite(4, 80, 140, gObject_8x16, OAM2_CHR(0x39D) + OAM2_PAL(2));
}

//! FE8U = 0x08033608
void PrepScreenProc_ApplyBrownBoxPalette(void)
{
    ApplyPalette(Pal_SysBrownBox, 0x12);
    return;
}

//! FE8U = 0x08033620
void StartPrepHelpPrompt(ProcPtr proc)
{
    Proc_Start(gProcScr_PrepHelpPrompt, proc);
}

//! FE8U = 0x08033634
void PrepMapMenu_OnEnd(void)
{
    EndHelpPromptSprite();
    Proc_EndEach(gProcScr_PrepHelpPrompt);
}

//! FE8U = 0x08033648
void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor * proc)
{
    LoadHelpBoxGfx(0, -1);
    ResetText();
    EndPlayerPhaseSideWindows();
    HideMoveRangeGraphics();

    StartPrepScreenMenu(proc);

    SetPrepScreenMenuItem(PREP_MAPMENU_VIEW_MAP, PrepMapMenu_OnViewMap, TEXT_COLOR_SYSTEM_WHITE, MSG_590, MSG_5BB);

    SetPrepScreenMenuItem(
        PREP_MAPMENU_FORMATION, PrepMapMenu_OnFormation,
        (PrepGetDeployedUnitAmt() != 0 ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY), MSG_591, MSG_5BC);

    SetPrepScreenMenuItem(PREP_MAPMENU_OPTIONS, PrepMapMenu_OnOptions, TEXT_COLOR_SYSTEM_WHITE, MSG_592, MSG_5BD);

    if (CanPrepScreenSave())
    {
        SetPrepScreenMenuItem(PREP_MAPMENU_SAVE, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_WHITE, MSG_579, MSG_5BE);
    }
    else
    {
        SetPrepScreenMenuItem(PREP_MAPMENU_SAVE, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_GRAY, MSG_579, MSG_5BE);
    }

    StartPrepHelpPrompt(proc);

    SetPrepScreenMenuOnBPress(PrepMapMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepMapMenu_OnStartPress);
    SetPrepScreenMenuOnEnd(PrepMapMenu_OnEnd);

    DrawPrepScreenMenuFrameAt(10, 2);

    SetPrepScreenMenuSelectedItem(proc->lastCmd);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x0803374C
bool CanCharacterBePrepMoved(int unitId)
{
    if (IsCharacterForceDeployed(unitId))
    {
        return false;
    }

    if (unitId == 0x100)
    {
        return false;
    }

    return true;
}

//! FE8U = 0x08033770
void PrepCameraPan_Init(struct ProcPrepSallyCursor * proc)
{
    s16 x;

    proc->unk_4A = 0;

    proc->unk_2C = 0;
    proc->unk_30 = 0;
    proc->unk_34 = 2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - DISPLAY_WIDTH / 2;

    return;
}

//! FE8U = 0x08033798
void PrepCameraPan_TurnDown(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = 2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;

    return;
}

//! FE8U = 0x080337B4
void PrepCameraPan_TurnLeft(struct ProcPrepSallyCursor * proc)
{
    s16 x;

    proc->unk_34 = -2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - DISPLAY_WIDTH / 2;

    return;
}

//! FE8U = 0x080337D4
void PrepCameraPan_TurnUp(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = -2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;

    return;
}

//! FE8U = 0x080337F0
void PrepCameraPan_Loop(struct ProcPrepSallyCursor * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        proc->unk_4A = 1;
    }

    if (proc->unk_4A && !(proc->unk_2C & 15) && !(proc->unk_30 & 15))
    {
        Proc_Goto(proc, PL_SALLYCURSOR_START_ATMENU);
        return;
    }

    proc->unk_2C += proc->unk_34;
    proc->unk_30 += proc->unk_38;

    gBmSt.camera.x = proc->unk_2C;
    gBmSt.camera.y = proc->unk_30;

    proc->unk_4C--;

    if (proc->unk_4C <= 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08033870
void InitPrepScreenUnitsAndCamera(void)
{
    LoadUnitPrepScreenPositions();

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN))
    {
        SortPlayerUnitsForPrepScreen();
        InitPlayerUnitPositionsForPrepScreen();
        gPlaySt.chapterStateBits |= PLAY_FLAG_PREPSCREEN;
    }

    gBmSt.camera.x = GetCameraCenteredX(0);
    gBmSt.camera.y = GetCameraCenteredY(0);
    gBmSt.gameStateBits |= BM_FLAG_PREPSCREEN;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

//! FE8U = 0x080338C0
void InitPrepScreenCursorPosition(void)
{
    const struct UnitDefinition * uDef;
    s8 x;
    s8 y;

    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderPid());

    if (unit != NULL && PrepGetDeployedUnitAmt() != 0)
    {
        SetCursorMapPosition(unit->xPos, unit->yPos);
    }
    else
    {
        uDef = GetChapterAllyUnitDataPointer();
        uDef = uDef + CalcForceDeployedUnitCounts();
        GenUnitDefinitionFinalPosition(uDef, &x, &y, false);
        SetCursorMapPosition(x, y);
    }

    gBmSt.camera.x = GetCameraCenteredX(gBmSt.playerCursor.x * 16);
    gBmSt.camera.y = GetCameraCenteredY(gBmSt.playerCursor.y * 16);

    return;
}

//! FE8U = 0x08033940
void PrepScreenProc_SetupMapIdle(struct ProcPrepSallyCursor * proc)
{
    if (!DoesBMXFADEExist())
    {
        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
        {
            Prep_ShowDeployableTiles();
        }

        Proc_Break(proc);
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 0);

    return;
}

//! FE8U = 0x08033978
void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor * proc)
{
    HandlePlayerCursorMovement();
    if (!DoesBMXFADEExist())
    {
        if (gKeyStatusPtr->newKeys & L_BUTTON)
        {
            TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
        else
        {
            if (gKeyStatusPtr->newKeys & R_BUTTON)
            {
                if (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])
                {
                    if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])))
                    {
                        EndAllMus();
                        EndPlayerPhaseSideWindows();
                        SetStatScreenConfig(
                            STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                            STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                        StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);
                        Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_IDLE);
                        return;
                    }
                }
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                gPlaySt.xCursor = gBmSt.playerCursor.x;
                gPlaySt.yCursor = gBmSt.playerCursor.y;
                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                PlaySoundEffect(SONG_69);
                return;
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON)
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

                switch (GetPlayerSelectKind(unit))
                {
                    case PLAYER_SELECT_NOUNIT:
                    case PLAYER_SELECT_TURNENDED:
                        EndPlayerPhaseSideWindows();
                        gPlaySt.xCursor = gBmSt.playerCursor.x;
                        gPlaySt.yCursor = gBmSt.playerCursor.y;

                        switch (gBmMapTerrain[gBmSt.playerCursor.y][gBmSt.playerCursor.x])
                        {
                            case TERRAIN_VENDOR:
                            case TERRAIN_ARMORY:
                                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                                Proc_Goto(proc, PL_SALLYCURSOR_SHOP);
                                return;
                            default:
                                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                                PlaySoundEffect(SONG_69);
                                return;
                        }

                    case PLAYER_SELECT_CONTROL:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~(US_HIDDEN);

                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SWAP);
                            return;
                        }

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);

                        return;

                    case PLAYER_SELECT_4:
                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            PlaySoundEffect(SONG_6C);
                            return;
                        }

                        // fallthrough

                    case PLAYER_SELECT_NOCONTROL:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~(US_HIDDEN);

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);

                        return;
                }
            }

            if (gKeyStatusPtr->newKeys & START_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                StartMinimapPrepPhase(proc);
                Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
                return;
            }
        }
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 0);

    return;
}

//! FE8U = 0x08033BF8
int PrepMapMenu_ReturnToAtMenu(void)
{
    ProcPtr proc = Proc_Find(gProcScr_SALLYCURSOR);
    Proc_Goto(proc, PL_SALLYCURSOR_RETURN_TO_ATMENU);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x08033C10
void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor * proc)
{
    struct APHandle * ap = AP_Create(gWarpPrepUnitSwapCursorAp, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    proc->ap = ap;
    proc->unk_4A = 2;
    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    StartSubtitleHelp(proc, GetStringFromIndex(MSG_872)); // "Reorder your units.[.]"

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(SONG_69);

    return;
}

//! FE8U = 0x08033C90
void PrepScreen_UnitSwapIdle(struct ProcPrepSallyCursor * proc)
{
    s8 r7 = gMapRangeSigned[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
    u32 xLoc;
    u32 yLoc;

    if (GetPlayerSelectKind(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])) == PLAYER_SELECT_4)
    {
        r7 = 0;
    }

    HandlePlayerCursorMovement();

    xLoc = (proc->xCursor * 16) - gBmSt.camera.x;
    yLoc = (proc->yCursor * 16) - gBmSt.camera.y;

    if (((xLoc + 16) <= DISPLAY_WIDTH + 16) && ((yLoc + 32) <= DISPLAY_HEIGHT + 32))
    {
        PutSprite(4, xLoc, yLoc - 12, gObject_16x16, OAM2_CHR(0x6));
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (r7)
        {
            AP_Delete(proc->ap);
            Proc_Break(proc);
            EndSubtitleHelp();

            return;
        }

        PlaySoundEffect(SONG_6C);

        return;
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        AP_Delete(proc->ap);
        Proc_Goto(proc, PL_SALLYCURSOR_CANCEL_SWAP);
        EndSubtitleHelp();
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        return;
    }

    if (r7 != proc->unk_4A)
    {
        AP_SwitchAnimation(proc->ap, r7 == 0 ? 1 : 0);
    }

    AP_Update(proc->ap, gBmSt.playerCursorDisplay.x - gBmSt.camera.x, gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

    proc->unk_4A = r7;

    return;
}

//! FE8U = 0x08033DD8
void PrepScreenProc_RecenterOnActiveUnit(ProcPtr proc)
{
    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);
    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    return;
}

//! FE8U = 0x08033E08
void PrepScreen_StartUnitSwapAnim(ProcPtr proc)
{
    struct Unit * activeUnit = gActiveUnit;
    struct Unit * targetUnit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
    if (targetUnit == NULL)
    {
        StartPrepUnitSwap(proc, activeUnit, gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    }
    else
    {
        StartPrepUnitSwap(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        StartPrepUnitSwap(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(SONG_61);
    return;
}

//! FE8U = 0x08033E8C
void InitMapChangeGraphicsIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderBmMapOnBg2();
    }

    return;
}

//! FE8U = 0x08033EA4
void DisplayMapChangeIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderBmMap();
        NewBMXFADE(0);
    }

    return;
}

//! FE8U = 0x08033EC0
void PrepScreenProc_StartConfigMenu(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_Config_PrepMapMenu, proc);
    return;
}

//! FE8U = 0x08033ED4
void PrepScreenProc_StartShopScreen(ProcPtr proc)
{
    struct EventInfo info;
    const struct ChapterEventGroup * evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    info.listScript = evGroup->locationBasedEvents;
    info.xPos = gBmSt.playerCursor.x;
    info.yPos = gBmSt.playerCursor.y;

    if (!SearchAvailableEvent(&info))
    {
        return;
    }

    switch (info.commandId)
    {
        case TILE_COMMAND_ARMORY:
            StartArmoryScreen(NULL, (u16 *)info.script, proc);
            break;

        case TILE_COMMAND_VENDOR:
            StartVendorScreen(NULL, (u16 *)info.script, proc);
            break;
    }

    return;
}

//! FE8U = 0x08033F34
void PrepScreenProc_MapMovementLoop(ProcPtr proc)
{
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
    {
        EndAllMus();
        gActiveUnit->state &= ~US_HIDDEN;
        gBmSt.gameStateBits &= ~BM_FLAG_3;

        HideMoveRangeGraphics();
        RefreshEntityBmMaps();
        RefreshUnitSprites();

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        u8 uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

        if (gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x && gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y)
        {
            uid = gActiveUnit->index;
        }

        if (uid != 0)
        {
            struct Unit * unit = GetUnit(uid);
            if (CanShowUnitStatScreen(unit))
            {
                EndAllMus();
                SetStatScreenConfig(
                    STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                StartStatScreen(GetUnit(uid), proc);
                Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_MOVE);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        if (gActiveUnit)
        {
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}

//! FE8U = 0x08034078
void PrepScreenProc_Cleanup(ProcPtr proc)
{
    SetupBackgrounds(NULL);
    EndAllProcChildren(proc);
    return;
}

//! FE8U = 0x08034090
void PrepScreenProc_RefreshAfterStatScreen(ProcPtr proc)
{
    if (gActiveUnit == NULL)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, PL_SALLYCURSOR_0C); // NOTE: Label does not exist
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    Proc_Goto(proc, PL_SALLYCURSOR_0B);

    return;
}

//! FE8U = 0x0803410C
void StartPrepSaveScreen(ProcPtr proc)
{
    gPlaySt.save_menu_type = 2;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE))
    {
        u32 mapKind = GetBattleMapKind();
        if (mapKind == BATTLEMAP_KIND_DUNGEON || mapKind == BATTLEMAP_KIND_SKIRMISH)
        {
            gPlaySt.save_menu_type = 4;
        }
    }

    StartBgmVolumeChange(0x100, 0x80, 0x20, NULL);
    SyncUnitDeploymentState();
    Make6C_SaveMenuPostChapter(proc);

    return;
}

//! FE8U = 0x08034168
void PrepScreenProc_RestoreBgmAfterSave(void)
{
    StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);
    gPlaySt.save_menu_type = 2;
    return;
}

//! FE8U = 0x08034194
void PrepScreenProc_UpdateBgm(void)
{
    if (CheckInLinkArena())
    {
        return;
    }

    if (gGMData.state.bits.state_0)
    {
        UpdateWorldMapBgm();
        return;
    }

    ChangeBgm(SONG_COMBAT_PREPARATION, 0x100, 0x100, 0x18, NULL);

    return;
}

//! FE8U = 0x080341D0
void PrepScreenProc_LockGame(void)
{
    LockGame();
    BMapDispSuspend();

    SetDispEnable(TRUE, TRUE, FALSE, FALSE, FALSE);

    return;
}

//! FE8U = 0x08034200
void PrepScreenProc_HideEverythingAndUnlockGame(void)
{
    UnlockGame();
    BMapDispResume();

    ForceScreenToBlack(); // disables layers

    return;
}

//! FE8U = 0x08034214
void ShrinkPlayerUnits(void)
{
    int i;

    if (!(PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits))
    {
        return;
    }

    if (BM_FLAG_LINKARENA & gBmSt.gameStateBits)
    {
        return;
    }

    InitUnitStack(gGenericBuffer);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(unit->state & US_UNAVAILABLE))
        {
            PushUnit(unit);
        }
    }

    LoadPlayerUnitsFromUnitStack2();

    return;
}

//! FE8U = 0x08034278
void EndPrepScreen(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        unit->state &= ~(US_UNSELECTABLE);

        if (unit->state & (US_DEAD | US_BIT16 | US_BIT25))
        {
            continue;
        }

        if (unit->state & US_NOT_DEPLOYED)
        {
            PidStatsSubFavval100(unit->pCharacterData->number);
        }
        else
        {
            PidStatsAddDeployAmt(unit->pCharacterData->number);
        }
    }

    ShrinkPlayerUnits();
    Proc_EndEach(gProcScr_SALLYCURSOR);
    gBmSt.gameStateBits &= ~BM_FLAG_PREPSCREEN;
    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
    gPlaySt.unk4A_1 = 1;

    return;
}

//! FE8U = 0x080342FC
bool IsPrepMapActive(void)
{
    return Proc_Find(gProcScr_SALLYCURSOR) ? true : false;
}
