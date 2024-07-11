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
    PROC_YIELD,
    PROC_CALL(InitPrepScreenCursorPosition),

    PROC_GOTO(50),

PROC_LABEL(51),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(50),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_InitMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

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
    PROC_CALL(PrepScreenProc_StartBrightenMap),
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
    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),
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
    PROC_CALL(PrepScreen_StartUnitSwap),

    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_REPEAT(PrepScreen_UnitSwapIdle),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(PrepScreen_StartUnitSwapAnim),

    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_WHILE(PrepUnitSwapProcExits),

    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_CALL(sub_8033DD8),
    PROC_YIELD,

    PROC_GOTO(9),

PROC_LABEL(11),

    PROC_GOTO(1),

PROC_LABEL(57),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(PrepScreenProc_StartConfigMenu),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(62),

PROC_LABEL(56),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(sub_808E79C),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(62),

PROC_LABEL(59),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(StartPrepSaveScreen),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(sub_8034168),

    PROC_GOTO(62),

PROC_LABEL(55),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PrepScreenProc_Cleanup),

    PROC_CALL(nullsub_20),
    PROC_YIELD,

    PROC_CALL(sub_801240C),
    PROC_CALL(EndPrepScreen),

    PROC_BLOCK,

PROC_LABEL(62),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(61),

PROC_LABEL(60),
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

    PROC_CALL(sub_8034194),
    PROC_CALL(sub_8033608),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(9),

PROC_LABEL(58),
    PROC_YIELD,
    PROC_CALL(PrepScreenProc_StartMapMenu),

    PROC_GOTO(61),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08033258
int GetPlayerLeaderUnitId(void)
{
    int i;
    int unitId;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_COMMON:
        case CHAPTER_MODE_EIRIKA:
            unitId = CHARACTER_EIRIKA;
            break;

        case CHAPTER_MODE_EPHRAIM:
            unitId = CHARACTER_EPHRAIM;
            break;
    }

    if ((u8)gPlaySt.chapterIndex == 5)
    {
        return CHARACTER_EPHRAIM;
    }

    do
    {
        struct Unit * unit;
        if (GetBattleMapKind() == 0)
        {
            return unitId;
        }

        unit = GetUnitFromCharId(unitId);

        if (unit && !(unit->state & US_NOT_DEPLOYED))
        {
            return unitId;
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

    return unitId;
}

//! FE8U = 0x080332D0
void sub_80332D0(void)
{
    s8 xTmp;
    s8 yTmp;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    BmMapFill(gBmMapRange, 0);
    BmMapFill(gBmMapMovement, -1);
    uDef += CalcForceDeployedUnitCounts();

    for (; uDef->charIndex != 0; uDef++)
    {
        GenUnitDefinitionFinalPosition(uDef, &xTmp, &yTmp, 0);
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
    proc->unk_58 = 1;
    Proc_Break(proc);
    EndPrepScreenMenu_();
    return;
}

//! FE8U = 0x0803336C
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor * proc)
{
    s16 x;
    s16 y;

    proc->unk_58 = 2;

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

    Proc_Goto(proc, 55);

    return true;
}

//! FE8U = 0x080333C4
bool PrepMapMenu_OnBPress(ProcPtr proc)
{
    Proc_Goto(proc, 51);
    return true;
}

//! FE8U = 0x080333D4
void SALLYCURSOR_DeploySupplyUnit(void)
{
    struct Unit * unit = GetSupplyUnit();

    if (unit)
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
    proc->unk_58 = 8;
    Proc_Goto(proc, 57);
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
    proc->unk_58 = 9;
    Proc_Goto(proc, 59);
    return;
}

//! FE8U = 0x08033468
void sub_8033468(struct ProcPrepSallyCursor * proc)
{
    proc->unk_58 = 0xA;
    EndPrepScreenMenu_();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, 58);
    return;
}

//! FE8U = 0x0803348C
void sub_803348C(ProcPtr proc)
{
    EnsureCameraOntoPosition(
        proc, GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX,
        GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY);
    return;
}

//! FE8U = 0x080334BC
void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor * proc)
{
    proc->unk_58 = 1;
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
    sub_8013800(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, proc);
    return;
}

//! FE8U = 0x08033514
void sub_8033514(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    sub_8013800(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, proc);
    return;
}

//! FE8U = 0x08033548
void PrepHelpPrompt_Init(struct ProcPrepSallyCursor * proc)
{
    StartHelpPromptSprite(170, 140, 2, proc);
    Decompress(Img_PrepHelpButtonSprites, (void *)(OBJ_VRAM1 + 0x3000));
    proc->unk_58 = 0;
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
void sub_8033608(void)
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

    SetPrepScreenMenuItem(1, PrepMapMenu_OnViewMap, TEXT_COLOR_SYSTEM_WHITE, 0x590, 0x5BB);

    SetPrepScreenMenuItem(
        2, PrepMapMenu_OnFormation, (PrepGetDeployedUnitAmt() ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY),
        0x591, 0x5BC);

    SetPrepScreenMenuItem(8, PrepMapMenu_OnOptions, TEXT_COLOR_SYSTEM_WHITE, 0x592, 0x5BD);

    if (CanPrepScreenSave())
    {
        SetPrepScreenMenuItem(9, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_WHITE, 0x579, 0x5BE);
    }
    else
    {
        SetPrepScreenMenuItem(9, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_GRAY, 0x579, 0x5BE);
    }

    StartPrepHelpPrompt(proc);
    SetPrepScreenMenuOnBPress(PrepMapMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepMapMenu_OnStartPress);
    SetPrepScreenMenuOnEnd(PrepMapMenu_OnEnd);
    DrawPrepScreenMenuFrameAt(10, 2);

    SetPrepScreenMenuSelectedItem(proc->unk_58);
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
void sub_8033770(struct ProcPrepSallyCursor * proc)
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
void sub_8033798(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = 2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;

    return;
}

//! FE8U = 0x080337B4
void sub_80337B4(struct ProcPrepSallyCursor * proc)
{
    s16 x;

    proc->unk_34 = -2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - DISPLAY_WIDTH / 2;

    return;
}

//! FE8U = 0x080337D4
void sub_80337D4(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = -2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;

    return;
}

//! FE8U = 0x080337F0
void sub_80337F0(struct ProcPrepSallyCursor * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        proc->unk_4A = 1;
    }

    if (proc->unk_4A && !(proc->unk_2C & 0xF) && !(proc->unk_30 & 0xF))
    {
        Proc_Goto(proc, 2);
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

    if (!(PLAY_FLAG_PREPSCREEN & gPlaySt.chapterStateBits))
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

    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderUnitId());

    if (unit && PrepGetDeployedUnitAmt())
    {
        SetCursorMapPosition(unit->xPos, unit->yPos);
    }
    else
    {
        uDef = GetChapterAllyUnitDataPointer();
        uDef = uDef + CalcForceDeployedUnitCounts();
        GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);
        SetCursorMapPosition(x, y);
    }

    gBmSt.camera.x = GetCameraCenteredX(gBmSt.playerCursor.x * 16);
    gBmSt.camera.y = GetCameraCenteredY(gBmSt.playerCursor.y * 16);

    return;
}

//! FE8U = 0x08033940
void sub_8033940(struct ProcPrepSallyCursor * proc)
{
    if (!DoesBMXFADEExist())
    {
        if (proc->unk_58 == 2)
        {
            sub_80332D0();
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
            PlaySoundEffect(0x6B);
            goto showcursor;
        }

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
                    Proc_Goto(proc, 5);
                    return;
                }
            }
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            EndPlayerPhaseSideWindows();
            gPlaySt.xCursor = gBmSt.playerCursor.x;
            gPlaySt.yCursor = gBmSt.playerCursor.y;
            Proc_Goto(proc, 0);
            PlaySoundEffect(0x69);
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
                            PlaySoundEffect(0x6A);
                            Proc_Goto(proc, 60);
                            return;
                        default:
                            Proc_Goto(proc, 0);
                            PlaySoundEffect(0x69);
                            return;
                    }

                case PLAYER_SELECT_CONTROL:
                    UnitBeginAction(unit);
                    gActiveUnit->state &= ~(US_HIDDEN);

                    if (proc->unk_58 == 2)
                    {
                        Proc_Goto(proc, 3);
                        return;
                    }

                    Proc_Goto(proc, 1);

                    return;

                case PLAYER_SELECT_4:
                    if (proc->unk_58 == 2)
                    {
                        PlaySoundEffect(0x6C);
                        return;
                    }

                    // fallthrough

                case PLAYER_SELECT_NOCONTROL:
                    UnitBeginAction(unit);
                    gActiveUnit->state &= ~(US_HIDDEN);

                    Proc_Goto(proc, 1);

                    return;
            }
        }

        if (gKeyStatusPtr->newKeys & START_BUTTON)
        {
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

//! FE8U = 0x08033BF8
int sub_8033BF8(void)
{
    ProcPtr proc = Proc_Find(gProcScr_SALLYCURSOR);
    Proc_Goto(proc, 51);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x08033C10
void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor * proc)
{
    struct APHandle * ap = AP_Create(gUnknown_085A0EA0, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    proc->ap = ap;
    proc->unk_4A = 2;
    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    StartSubtitleHelp(proc, GetStringFromIndex(0x872)); // TODO: msgid "Reorder your units.[.]"

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(0x69);

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

    if (((xLoc + 16) <= 256) && ((yLoc + 32) <= 192))
    {
        PutSprite(4, xLoc, yLoc - 12, gObject_16x16, 6);
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

        PlaySoundEffect(0x6C);

        return;
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        AP_Delete(proc->ap);
        Proc_Goto(proc, 4);
        EndSubtitleHelp();
        PlaySoundEffect(0x6B);

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
void sub_8033DD8(ProcPtr proc)
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
    if (!targetUnit)
    {
        StartPrepUnitSwap(proc, activeUnit, gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    }
    else
    {
        StartPrepUnitSwap(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        StartPrepUnitSwap(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(0x61);
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
    Proc_StartBlocking(gProcScr_Config2, proc);
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

        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 9);
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        u8 uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

        if (gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x && gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y)
        {
            uid = gActiveUnit->index;
        }

        if (uid)
        {
            struct Unit * unit = GetUnit(uid);
            if (CanShowUnitStatScreen(unit))
            {
                EndAllMus();
                SetStatScreenConfig(
                    STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                StartStatScreen(GetUnit(uid), proc);
                Proc_Goto(proc, 6);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        if (gActiveUnit)
        {
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(0x6B);
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
void sub_8034090(ProcPtr proc)
{
    if (gActiveUnit == NULL)
    {
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

//! FE8U = 0x0803410C
void StartPrepSaveScreen(ProcPtr proc)
{
    gPlaySt.save_menu_type = 2;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE))
    {
        if ((GetBattleMapKind() - 1) <= 1)
        {
            gPlaySt.save_menu_type = 4;
        }
    }

    StartBgmVolumeChange(0x100, 0x80, 0x20, NULL);
    sub_801240C();
    Make6C_SaveMenuPostChapter(proc);

    return;
}

//! FE8U = 0x08034168
void sub_8034168(void)
{
    StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);
    gPlaySt.save_menu_type = 2;
    return;
}

//! FE8U = 0x08034194
void sub_8034194(void)
{
    if (CheckInLinkArena())
    {
        return;
    }

    if (gGMData.state.bits.state_0)
    {
        sub_80B9FC0();
        return;
    }

    CallSomeSoundMaybe(0x34, 0x100, 0x100, 0x18, NULL);

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

    sub_80141B0(); // disables layers

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
bool sub_80342FC(void)
{
    return Proc_Find(gProcScr_SALLYCURSOR) ? true : false;
}
