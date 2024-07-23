#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"

#include "bm.h"

enum {
    CAMERA_MARGIN_LEFT   = 16 * 3,
    CAMERA_MARGIN_RIGHT  = 16 * 11,
    CAMERA_MARGIN_TOP    = 16 * 2,
    CAMERA_MARGIN_BOTTOM = 16 * 7,
};

struct CamMoveProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ struct Vec2 watchedCoordinate;
    /* 38 */ s16 calibration;
    /* 3A */ s16 distance;
    /* 3C */ int frame;
    /* 40 */ s8 xCalibrated;
};

struct UnkMapCursorProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ int clock;
    /* 38 */ int duration;
};

struct PalFadeSt EWRAM_DATA sPalFadeSt[0x20] = { 0 };
struct BmSt EWRAM_DATA gBmSt = {};
struct PlaySt EWRAM_DATA gPlaySt = {};
struct Vec2 EWRAM_DATA sLastCoordMapCursorDrawn = {};
u32 EWRAM_DATA sLastTimeMapCursorDrawn = 0;
s8 EWRAM_DATA sCameraAnimTable[0x100] = { 0 };

// TODO: Move elsewhere
extern struct ProcCmd gProcScr_ResetCursorPosition[];
extern struct ProcCmd ProcScr_PhaseIntro[];
extern struct ProcCmd gProcScr_ChapterIntroTitleOnly[];

void BmMain_StartIntroFx(ProcPtr proc);
int CallBeginningEvents(void);
void UndeployEveryone(void);
int BmMain_ChangePhase(void);
void BmMain_SuspendBeforePhase(void);
s8 sub_8015434(void);
void BmMain_StartPhase(ProcPtr proc);
int BmMain_UpdateTraps(ProcPtr proc);
void sub_80155C4(void);
void BmMain_ResumePlayerPhase(ProcPtr proc);

struct ProcCmd CONST_DATA gProc_BMapMain[] = {
    PROC_SLEEP(0),

    PROC_NAME("E_BMAPMAIN"),
    PROC_15,
    PROC_MARK(PROC_MARK_MAIN),

    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(0),
    PROC_CALL(BmMain_StartIntroFx),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(SetEventId_0x84),
    PROC_CALL(UpdatePrevDeployStates),
    PROC_CALL_2(CallBeginningEvents),
    PROC_CALL(UndeployEveryone),

    // fallthrough

PROC_LABEL(11),
    PROC_CALL(UnsetEventId_0x84),

    // fallthrough

PROC_LABEL(3),
    PROC_CALL_2(BmMain_ChangePhase),
    PROC_CALL(BmMain_SuspendBeforePhase),

    // fallthrough

PROC_LABEL(9),
    PROC_START_CHILD(gProcScr_ResetCursorPosition),
    PROC_START_CHILD_BLOCKING(ProcScr_PhaseIntro),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL(TickActiveFactionTurn),

    PROC_START_CHILD_BLOCKING(gProcScr_StatusDecayDisplay),
    PROC_START_CHILD_BLOCKING(gProcScr_TerrainHealDisplay),
    PROC_START_CHILD_BLOCKING(gProcScr_PoisonDamageDisplay),
    PROC_START_CHILD_BLOCKING(gProcScr_GorgonEggHatchDisplay),

    PROC_START_CHILD_BLOCKING(gProcScr_ResetCursorPosition),

    PROC_CALL_2(sub_8015434),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(BmMain_StartPhase),
    PROC_START_CHILD_BLOCKING(gProcScr_BerserkCpPhase),

    PROC_CALL_2(BmMain_UpdateTraps),

    PROC_GOTO(3),

PROC_LABEL(2),
    PROC_CALL(sub_80155C4),
    PROC_SLEEP(0),
    PROC_START_CHILD_BLOCKING(gProcScr_ChapterIntroTitleOnly),
    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_CALL(RenderBmMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(5),

PROC_LABEL(6),
    PROC_CALL(RenderBmMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_REPEAT(BmMain_ResumePlayerPhase),

    PROC_START_CHILD_BLOCKING(gProcScr_BerserkCpPhase),

    PROC_GOTO(3),

PROC_LABEL(10),
    PROC_SLEEP(0),

    PROC_REPEAT(BmMain_ResumePlayerPhase),
    PROC_START_CHILD_BLOCKING(gProcScr_BerserkCpPhase),

    PROC_GOTO(3),

PROC_LABEL(8),
    PROC_CALL(RenderBmMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(9),

PROC_LABEL(7),
    PROC_CALL(RenderBmMap),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_START_CHILD_BLOCKING(gProcScr_BerserkCpPhase),

    PROC_GOTO(3),

    PROC_END,
};

s8 CONST_DATA sDirKeysToOffsetLut[][2] = {
    {  0,  0, }, // 0000 none
    { +1,  0, }, // 0001 right
    { -1,  0, }, // 0010 left
    {  0,  0, }, // 0011 right + left
    {  0, -1, }, // 0100 up
    { +1, -1, }, // 0101 up + right
    { -1, -1, }, // 0110 up + left
    {  0,  0, }, // 0111 up + right + left
    {  0, +1, }, // 1000 down
    { +1, +1, }, // 1001 down + right
    { -1, +1, }, // 1010 down + left
    {  0,  0, }, // 1011 down + right + left
    {  0,  0, }, // 1100 down + up
    {  0,  0, }, // 1101 down + up + right
    {  0,  0, }, // 1110 down + up + left
    {  0,  0, }, // 1111 down + up + right + left
};

u16 CONST_DATA sSprite_MapCursorA[] = {
    4,
    0x00FC, 0x01FE, 0x0000,
    0x00FC, 0x100A, 0x0000,
    0x0009, 0x21FE, 0x0000,
    0x0009, 0x300A, 0x0000,
};

u16 CONST_DATA sSprite_MapCursorB[] = {
    4,
    0x00FD, 0x01FF, 0x0000,
    0x00FD, 0x1009, 0x0000,
    0x0008, 0x21FF, 0x0000,
    0x0008, 0x3009, 0x0000,
};

u16 CONST_DATA sSprite_MapCursorC[] = {
    4,
    0x00FE, 0x0000, 0x0000,
    0x00FE, 0x1008, 0x0000,
    0x0007, 0x2000, 0x0000,
    0x0007, 0x3008, 0x0000,
};

u16 CONST_DATA sSprite_MapCursorStretched[] = {
    4,
    0x00F8, 0x01FC, 0x0000,
    0x00F8, 0x100C, 0x0000,
    0x000A, 0x21FC, 0x0000,
    0x000A, 0x300C, 0x0000,
};

u16* CONST_DATA sMapCursorSpriteLut[] = {
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,

    sSprite_MapCursorB,

    sSprite_MapCursorC,
    sSprite_MapCursorC,
    sSprite_MapCursorC,
    sSprite_MapCursorC,

    sSprite_MapCursorB,
};

u16 CONST_DATA sSprite_SysUpArrowA[] = {
    1,
    0x8000, 0x0000, 0x004C,
};

u16 CONST_DATA sSprite_SysUpArrowB[] = {
    1,
    0x8000, 0x0000, 0x004D,
};

u16 CONST_DATA sSprite_SysUpArrowC[] = {
    1,
    0x80FF, 0x0000, 0x004D,
};

u16 CONST_DATA sSprite_SysDownArrowA[] = {
    1,
    0x8000, 0x0000, 0x004E,
};

u16 CONST_DATA sSprite_SysDownArrowB[] = {
    1,
    0x8000, 0x0000, 0x004F,
};

u16 CONST_DATA sSprite_SysDownArrowC[] = {
    1,
    0x8001, 0x0000, 0x004F,
};

u16* CONST_DATA gUnknown_0859A530[] = {
    sSprite_SysUpArrowA,
    sSprite_SysUpArrowB,
    sSprite_SysUpArrowC,
};

u16* CONST_DATA gUnknown_0859A53C[] = {
    sSprite_SysDownArrowA,
    sSprite_SysDownArrowB,
    sSprite_SysDownArrowC,
};

void CamMove_OnInit(struct CamMoveProc* proc);
void CamMove_OnLoop(struct CamMoveProc* proc);

struct ProcCmd CONST_DATA gProcScr_CamMove[] = {
    PROC_NAME("GENS"),
    PROC_SLEEP(0),

    PROC_CALL(CamMove_OnInit),
    PROC_REPEAT(CamMove_OnLoop),

    PROC_END,
};

void UnkMapCursor_OnLoop(struct UnkMapCursorProc* proc);

struct ProcCmd CONST_DATA gProcScr_UnkMapCursor[] = {
    PROC_REPEAT(UnkMapCursor_OnLoop),
    PROC_END,
};

void sub_801613C(void);
void sub_80160E0(struct CamMoveProc* proc);

struct ProcCmd CONST_DATA gProcScr_0859A580[] = {
    PROC_SET_END_CB(sub_801613C),
    PROC_REPEAT(sub_80160E0),
    PROC_END,
};

//! FE8U = 0x080152A4
void OnVBlank(void) {

    INTR_CHECK = INTR_FLAG_VBLANK;

    IncrementGameClock();
    m4aSoundVSync();

    Proc_Run(gProcTreeRootArray[0]);

    SyncLoOam();

    if (gBmSt.sync_hardware) {
        gBmSt.sync_hardware = 0;

        FlushLCDControl();
        FlushBackgrounds();
        FlushTiles();
        SyncHiOam();
    }

    m4aSoundMain();

    return;
}

//! FE8U = 0x080152F4
void OnGameLoopMain(void) {

    UpdateKeyStatus(gKeyStatusPtr);

    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetGameLock() == 0) {
        Proc_Run(gProcTreeRootArray[2]);
    }

    Proc_Run(gProcTreeRootArray[3]);

    Proc_Run(gProcTreeRootArray[5]);
    PushSpriteLayerObjects(0);

    Proc_Run(gProcTreeRootArray[4]);
    PushSpriteLayerObjects(13);

    gBmSt.sync_hardware = 1;
    gBmSt.prevVCount = REG_VCOUNT;

    VBlankIntrWait();

    return;
}

//! FE8U = 0x08015360
void LockGame(void) {
    gBmSt.gameLogicSemaphore++;
    return;
}

//! FE8U = 0x08015370
void UnlockGame(void) {
    gBmSt.gameLogicSemaphore--;
    return;
}

//! FE8U = 0x08015380
u8 GetGameLock(void) {
    return gBmSt.gameLogicSemaphore;
}

//! FE8U = 0x0801538C
void SwitchPhases(void)
{
    switch (gPlaySt.faction) {
    case FACTION_BLUE:
        gPlaySt.faction = FACTION_RED;

        break;

    case FACTION_RED:
        gPlaySt.faction = FACTION_GREEN;

        break;

    case FACTION_GREEN:
        gPlaySt.faction = FACTION_BLUE;

        if (gPlaySt.chapterTurnNumber < 999)
            gPlaySt.chapterTurnNumber++;

        ProcessTurnSupportExp();
    }
}

//! FE8U = 0x080153D4
int CallBeginningEvents(void)
{
    const struct ChapterEventGroup* pChapterEvents = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetBattleMapKind() != 2)
        CallEvent(pChapterEvents->beginningSceneEvents, 1);
    else
        CallEvent((u16 *)EventScr_SkirmishCommonBeginning, 1);

    return 0;
}

//! FE8U = 0x08015410
int BmMain_ChangePhase(void)
{

    ClearActiveFactionGrayedStates();
    RefreshUnitSprites();
    SwitchPhases();

    if (RunPhaseSwitchEvents() == 1)
        return 0;

    return 1;
}

//! FE8U = 0x08015434
bool sub_8015434(void)
{
    if (sub_80832D4() == 1)
    {
        sub_80832D0();
        return false;
    }

    return true;
}

//! FE8U = 0x08015450
void BmMain_StartPhase(ProcPtr proc)
{
    switch (gPlaySt.faction) {
    case FACTION_BLUE:
        Proc_StartBlocking(gProcScr_PlayerPhase, proc);
        break;

    case FACTION_RED:
        Proc_StartBlocking(gProcScr_CpPhase, proc);
        break;

    case FACTION_GREEN:
        Proc_StartBlocking(gProcScr_CpPhase, proc);
        break;
    }

    Proc_Break(proc);
}

//! FE8U = 0x080154A4
void BmMain_ResumePlayerPhase(ProcPtr proc)
{
    Proc_Goto(Proc_StartBlocking(gProcScr_PlayerPhase, proc), 7);
    Proc_Break(proc);
}

//! FE8U = 0x080154C8
int BmMain_UpdateTraps(ProcPtr proc)
{
    if (gPlaySt.faction != FACTION_GREEN)
        return 1;

    Proc_StartBlocking(gProcScr_UpdateTraps, proc);
    DecayTraps();

    return 0;
}

//! FE8U = 0x080154F4
void BmMain_SuspendBeforePhase(void)
{
    gActionData.suspendPointType = SUSPEND_POINT_PHASECHANGE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
}

//! FE8U = 0x0801550C
void BmMain_StartIntroFx(ProcPtr proc)
{
    if (gPlaySt.chapterIndex == 0x38)
        return;

    if (gPlaySt.chapterIndex == 0x06 && CheckFlag(0x88))
        return;

    Proc_StartBlocking(gProcScr_ChapterIntro, proc);
}

//! FE8U = 0x08015544
void UndeployEveryone(void)
{
    int i;

    ClearFlag(0x84);

    if ((gPlaySt.unk4A_1) == 0)
    {
        for (i = 1; i < FACTION_GREEN; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            unit->state &= ~(US_NOT_DEPLOYED);
        }
    }
}

//! FE8U = 0x08015588
void GotoChapterWithoutSave(u16 chapterId)
{
    gPlaySt.chapterIndex = chapterId;

    Proc_Goto(Proc_Find(gProc_BMapMain), 2);
    Proc_EndEach(gProcScr_PlayerPhase);
    Proc_EndEach(gProcScr_CpPhase);
    Proc_EndEach(gProcScr_BerserkCpPhase);

    return;
}

//! FE8U = 0x080155C4
void sub_80155C4(void) {
    u8 flag;

    if (CheckFlag(3)) {
        RegisterChapterTimeAndTurnCount(&gPlaySt);
    }

    ComputeChapterRankings();

    flag = (gPlaySt.unk4A_1 & 1);

    ChapterChangeUnitCleanup();
    StartBattleMap(0);

    if (flag) {
        gPlaySt.unk4A_1 = 1;
    }

    return;
}

//! FE8U = 0x08015608
void InitBmBgLayers(void) {

    if (gPlaySt.chapterWeatherId == WEATHER_CLOUDS) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 2;
    } else {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    return;
}

//! FE8U = 0x08015680
void LoadObjUIGfx(void) {
    Decompress(gGfx_MiscUiGraphics, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void*)0x06010000, 0x12, 4);

    ApplyPalettes(gPal_MiscUiGraphics, 0x10, 2);

    return;
}

//! FE8U = 0x080156BC
void sub_80156BC(void) {
    ApplyPalettes(gPal_MiscUiGraphics, 0x10, 2);
    return;
}

//! FE8U = 0x080156D4
void sub_80156D4(void) {

    ResetText();
    LoadLegacyUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x080156F4
void ReadGameSaveCoreGfx(void) {

    ResetText();
    LoadUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x08015714
void HandleMapCursorInput(u16 keys) {
    int dir = (keys >> 4) & (DPAD_ANY >> 4);

    struct Vec2 newCursor = {
        gBmSt.playerCursor.x + sDirKeysToOffsetLut[dir][0],
        gBmSt.playerCursor.y + sDirKeysToOffsetLut[dir][1]
    };

    if (gBmSt.gameStateBits & (1 << 1)) {
        if ((gBmMapMovement[gBmSt.playerCursor.y][gBmSt.playerCursor.x] < MAP_MOVEMENT_MAX)) {
            if (gBmMapMovement[newCursor.y][newCursor.x] >= MAP_MOVEMENT_MAX) {
                if ((keys & DPAD_ANY) != (gKeyStatusPtr->newKeys & DPAD_ANY)) {
                    return;
                }
            }
        }
    }

    if ((newCursor.x >= 0) && (newCursor.x < gBmMapSize.x)) {
        gBmSt.cursorTarget.x += sDirKeysToOffsetLut[dir][0] * 16;

        gBmSt.cursorPrevious.x = gBmSt.playerCursor.x;
        gBmSt.playerCursor.x = newCursor.x;
    }

    if ((newCursor.y >= 0) && (newCursor.y < gBmMapSize.y)) {
        gBmSt.cursorTarget.y += sDirKeysToOffsetLut[dir][1] * 16;

        gBmSt.cursorPrevious.y = gBmSt.playerCursor.y;
        gBmSt.playerCursor.y = newCursor.y;
    }

    if (!(gBmSt.gameStateBits & (1 << 2))) {
        if (gBmSt.playerCursor.x == gBmSt.cursorPrevious.x && gBmSt.playerCursor.y == gBmSt.cursorPrevious.y) {
            return;
        }

        PlaySoundEffect(0x65);
        gBmSt.gameStateBits |= (1 << 2);
    } else {
        gBmSt.gameStateBits &= ~(1 << 2);
    }

    return;
}

//! FE8U = 0x08015838
void HandleMoveMapCursor(int step) {
    if (gBmSt.playerCursorDisplay.x < gBmSt.cursorTarget.x) {
        gBmSt.playerCursorDisplay.x += step;
    }

    if (gBmSt.playerCursorDisplay.x > gBmSt.cursorTarget.x)
    {
        gBmSt.playerCursorDisplay.x -= step;
    }

    if (gBmSt.playerCursorDisplay.y < gBmSt.cursorTarget.y) {
        gBmSt.playerCursorDisplay.y += step;
    }

    if (gBmSt.playerCursorDisplay.y > gBmSt.cursorTarget.y) {
        gBmSt.playerCursorDisplay.y -= step;
    }

    return;
}

//! FE8U = 0x0801588C
void HandleMoveCameraWithMapCursor(int step) {

    s8 isUpdated = 0;

    int xCursorSprite = gBmSt.playerCursorDisplay.x;
    int yCursorSprite = gBmSt.playerCursorDisplay.y;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > xCursorSprite) {
        if (xCursorSprite - CAMERA_MARGIN_LEFT < 0) {
            gBmSt.camera.x = 0;
        } else {
            isUpdated = 1;

            gBmSt.camera.x -= step;
            gBmSt.unk36 = -step;

            gBmSt.unk32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < xCursorSprite) {
        if (xCursorSprite - CAMERA_MARGIN_RIGHT > gBmSt.cameraMax.x) {
            gBmSt.camera.x = gBmSt.cameraMax.x;
        } else {
            isUpdated = 1;

            gBmSt.camera.x += step;
            gBmSt.unk36 = step;

            gBmSt.unk32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > yCursorSprite) {
        if (yCursorSprite - CAMERA_MARGIN_TOP < 0) {
            gBmSt.camera.y = 0;
        } else {
            isUpdated = 1;
            gBmSt.camera.y -= step;
            gBmSt.unk37 = -step;

            gBmSt.unk34 = gBmSt.camera.y & 0xf;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < yCursorSprite) {
        if (yCursorSprite - CAMERA_MARGIN_BOTTOM > gBmSt.cameraMax.y) {
            gBmSt.camera.y = gBmSt.cameraMax.y;
        } else {
            isUpdated = 1;

            gBmSt.camera.y += step;
            gBmSt.unk37 = step;

            gBmSt.unk34 = gBmSt.camera.y & 0xf;
        }
    }

    if (!isUpdated) {
        if (gBmSt.unk32 != 0) {
            gBmSt.unk32 = (gBmSt.unk32 + gBmSt.unk36) & 0xf;
            gBmSt.camera.x += gBmSt.unk36;
        }

        if (gBmSt.unk34 != 0) {
            gBmSt.unk34 = (gBmSt.unk34 + gBmSt.unk37) & 0xf;
            gBmSt.camera.y += gBmSt.unk37;
        }
    }

    return;
}

//! FE8U = 0x080159B8
u16 GetCameraAdjustedX(int x) {
    int result = gBmSt.camera.x;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > x) {
        result = x - CAMERA_MARGIN_LEFT < 0
            ? 0
            : x - CAMERA_MARGIN_LEFT;
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < x) {
        result = x - CAMERA_MARGIN_RIGHT > gBmSt.cameraMax.x
            ? gBmSt.cameraMax.x
            : x - CAMERA_MARGIN_RIGHT;
    }

    return result;
}

//! FE8U = 0x080159FC
u16 GetCameraAdjustedY(int y) {
    int result = gBmSt.camera.y;

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > y) {
        result = y - CAMERA_MARGIN_TOP < 0
            ? 0
            : y - CAMERA_MARGIN_TOP;
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < y) {
        result = y - CAMERA_MARGIN_BOTTOM > gBmSt.cameraMax.y
            ? gBmSt.cameraMax.y
            : y - CAMERA_MARGIN_BOTTOM;
    }

    return result;
}

//! FE8U = 0x08015A40
u16 GetCameraCenteredX(int x) {

    int result = x - DISPLAY_WIDTH / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gBmSt.cameraMax.x) {
        result = gBmSt.cameraMax.x;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A6C
u16 GetCameraCenteredY(int y) {

    int result  = y - DISPLAY_HEIGHT / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gBmSt.cameraMax.y) {
        result = gBmSt.cameraMax.y;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A98
void PutMapCursor(int x, int y, int kind) {

    int oam2 = 0;

    u16* sprite = NULL;

    int frame = (GetGameClock() / 2) % 16;

    switch (kind) {
        case 0:
        case 1:
            oam2 = 2;
            sprite = sMapCursorSpriteLut[frame];

            break;

        case 2:
            if (GetGameClock() - 1 == sLastTimeMapCursorDrawn) {
                x = (x + sLastCoordMapCursorDrawn.x) >> 1;
                y = (y + sLastCoordMapCursorDrawn.y) >> 1;
            }

            oam2 = 0x24;

            sprite = sMapCursorSpriteLut[frame];

            sLastCoordMapCursorDrawn.x = x;
            sLastCoordMapCursorDrawn.y = y;

            sLastTimeMapCursorDrawn = GetGameClock();

            break;

        case 3:
            oam2 = 2;
            sprite = sSprite_MapCursorStretched;

            break;

        case 4:
            oam2 = 0x24;
            sprite = sMapCursorSpriteLut[0];

            break;
    }

    x = x - gBmSt.camera.x;
    y = y - gBmSt.camera.y;

    PutSprite(4, x, y, sprite, oam2);

    return;
}

//! FE8U = 0x08015B88
void DisplayBmTextShadow(int x, int y)
{
    int frame = (GetGameClock() / 2) % 16;
    u32 oam2 = 2;

    PutSprite(4, x, y, sMapCursorSpriteLut[frame], oam2);
    return;
}

//! FE8U = 0x08015BBC
void SetCursorMapPosition(int x, int y) {

    gBmSt.playerCursor.x = x;
    gBmSt.playerCursor.y = y;

    gBmSt.cursorTarget.x = x * 16;
    gBmSt.cursorTarget.y = y * 16;

    gBmSt.playerCursorDisplay.x = x * 16;
    gBmSt.playerCursorDisplay.y = y * 16;

    return;
}

//! FE8U = 0x08015BD4
void UpdateStatArrowSprites(int x, int y, u8 isDown) {
    int frame =  GetGameClock() / 8 % 3;

    PutSprite(4, x, y, isDown ? gUnknown_0859A53C[frame] : gUnknown_0859A530[frame], 0);

    return;
}

//! FE8U = 0x08015C1C
void CamMove_OnInit(struct CamMoveProc* proc) {
    int i;
    int dist;

    s8 speed = 1;

    int xDiff = ABS(proc->to.x - proc->from.x);
    int yDiff = ABS(proc->to.y - proc->from.y);

    if (xDiff > yDiff) {
        proc->xCalibrated = 1;
        proc->calibration = xDiff;
    } else {
        proc->xCalibrated = 0;
        proc->calibration = (short)yDiff;
    }


    dist = proc->calibration;
    i = 0;

    while (1) {
        if (dist - (speed >> 1) < 0) {
            sCameraAnimTable[i] = dist;
            break;
        }

        dist -= (speed >> 1);
        sCameraAnimTable[i] = (speed >> 1);

        if (speed < 16) {
            speed++;
        }

        i++;
    }

    proc->frame = i;
    proc->distance = proc->calibration;

    return;
}

//! FE8U = 0x08015CB0
void CamMove_OnLoop(struct CamMoveProc* proc) {

    if (proc->frame == 0) {
        proc->to.x = gBmSt.camera.x;
        proc->to.y = gBmSt.camera.y;

        Proc_End(proc);

        return;
    }

    proc->distance -= sCameraAnimTable[proc->frame--];

    gBmSt.camera.x = proc->to.x + (proc->from.x - proc->to.x) * proc->distance / proc->calibration;


    gBmSt.camera.y = proc->to.y + (proc->from.y - proc->to.y) * proc->distance / proc->calibration;

    return;
}

//! FE8U = 0x08015D30
void StoreAdjustedCameraPositions(int xIn, int yIn, int* xOut, int* yOut) {

    *xOut = xIn - 7;
    *yOut = yIn - 5;

    if (*xOut < 0) {
        *xOut = 0;
    }

    if (*yOut < 0) {
        *yOut = 0;
    }

    if (*xOut + 8 > gBmMapSize.x - 1) {
        *xOut = gBmMapSize.x - 0xf;
    }

    if (*yOut + 4 > gBmMapSize.y - 1) {
        *yOut = gBmMapSize.y - 10;
    }

    return;
}

//! FE8U = 0x08015D84
s8 sub_8015D84(ProcPtr parent, int x, int y) {
    struct CamMoveProc* proc;

    int xTarget;
    int yTarget;

    StoreAdjustedCameraPositions(x, y, &xTarget, &yTarget);

    xTarget = xTarget * 16;
    yTarget = yTarget * 16;

    if ((xTarget == gBmSt.camera.x) &&
        (yTarget == gBmSt.camera.y)) {
        return 0;
    }

    if (Proc_Find(gProcScr_CamMove)) {
        return 0;
    }

    if (parent != 0) {
        proc = Proc_StartBlocking(gProcScr_CamMove, parent);
    } else {
        proc = Proc_Start(gProcScr_CamMove, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = xTarget;
    proc->to.y = yTarget;

    proc->watchedCoordinate.x = x;
    proc->watchedCoordinate.y = y;

    return 1;
}

//! FE8U = 0x08015E0C
s8 EnsureCameraOntoPosition(ProcPtr parent, int x, int y) {
    struct CamMoveProc* proc;

    int xTarget = GetCameraAdjustedX(x * 16);
    int yTarget = GetCameraAdjustedY(y * 16);

    if ((xTarget == gBmSt.camera.x) && (yTarget == gBmSt.camera.y)) {
        return 0;
    }

    if (Proc_Find(gProcScr_CamMove)) {
        return 0;
    }

    if (parent) {
        proc = Proc_StartBlocking(gProcScr_CamMove, parent);
    } else {
        proc = Proc_Start(gProcScr_CamMove, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = xTarget;
    proc->to.y = yTarget;

    proc->watchedCoordinate.x = x;
    proc->watchedCoordinate.y = y;

    return 1;
}

//! FE8U = 0x08015E9C
s8 IsCameraNotWatchingPosition(int x, int y) {
    int xTarget = GetCameraAdjustedX(x * 16);
    int yTarget = GetCameraAdjustedY(y * 16);

    if ((xTarget == gBmSt.camera.x) && (yTarget == gBmSt.camera.y)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08015EDC
s8 CameraMove_8015EDC(ProcPtr parent) {
    struct CamMoveProc* proc;

    if (gBmSt.camera.y <= gBmSt.cameraMax.y) {
        return 0;
    }

    if (Proc_Find(gProcScr_CamMove)) {
        return 0;
    }

    if (parent) {
        proc = Proc_StartBlocking(gProcScr_CamMove, parent);
    } else {
        proc = Proc_Start(gProcScr_CamMove, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = gBmSt.camera.x;
    proc->to.y = gBmSt.cameraMax.y;

    return 1;
}

//! FE8U = 0x08015F40
void UnkMapCursor_OnLoop(struct UnkMapCursorProc* proc) {

    PutMapCursor(
        ((proc->to.x - proc->from.x) * proc->clock) / proc->duration,
        ((proc->to.y - proc->from.y) * proc->clock) / proc->duration,
        0
    );

    proc->clock--;

    if (proc->clock < 0) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08015F90
void sub_8015F90(int x, int y, int duration) {
    struct UnkMapCursorProc* proc;

    proc = Proc_Start(gProcScr_UnkMapCursor, PROC_TREE_3);

    proc->to.x = gBmSt.playerCursor.x << 4;
    proc->to.y = gBmSt.playerCursor.y << 4;

    proc->from.x = x << 4;
    proc->from.y = y << 4;

    proc->duration = duration;
    proc->clock = duration;

    return;
}

static inline int CheckAltBgm(u8 base, u8 alt) {
    if (!CheckFlag(4)) {
        return base;
    } else {
        return alt;
    }
}

//! FE8U = 0x08015FC8
int GetCurrentMapMusicIndex(void) {
    int aliveUnits;
    u32 thing;

    u8 blueBgmIdx = CheckAltBgm(MAP_BGM_BLUE, MAP_BGM_BLUE_GREEN_ALT);
    u8 redBgmIdx = CheckAltBgm(MAP_BGM_RED, MAP_BGM_RED_ALT);
    u8 greenBgmIdx;

    if (!CheckFlag(4)) {
        greenBgmIdx = MAP_BGM_GREEN;
        greenBgmIdx++; greenBgmIdx--;
    } else {
        greenBgmIdx = MAP_BGM_BLUE_GREEN_ALT;
    }

    switch (gPlaySt.faction) {
        case FACTION_RED:
            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[redBgmIdx];

        case FACTION_GREEN:
            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[greenBgmIdx];

        case FACTION_BLUE:

            if (CheckFlag(4)) {
                return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[blueBgmIdx];
            }

            if ((GetBattleMapKind() == 2) || GetROMChapterStruct(gPlaySt.chapterIndex)->victorySongEnemyThreshold != 0) {
                aliveUnits = CountUnitsInState(0x80, 0x0001000C);
                thing = GetBattleMapKind();

                if ((thing != 2 && aliveUnits <= (GetROMChapterStruct(gPlaySt.chapterIndex)->victorySongEnemyThreshold))
                    || (thing == 2 && aliveUnits <= 1))
                    return 0x10;
            }

            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[blueBgmIdx];
    }
}

//! FE8U = 0x080160D0
void StartMapSongBgm(void) {
    StartBgm(GetCurrentMapMusicIndex(), 0);
    return;
}

//! FE8U = 0x080160E0
void sub_80160E0(struct CamMoveProc* proc) {
    int x = Interpolate(0, proc->from.x, proc->to.x, proc->frame, proc->distance);
    int y = Interpolate(0, proc->from.y, proc->to.y, proc->frame, proc->distance);

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    proc->frame++;

    if (proc->frame >= proc->distance) {
        Proc_End(proc);
    }

    return;
}

//! FE8U = 0x0801613C
void sub_801613C(void) {
    return;
}

//! FE8U = 0x08016140
void sub_8016140(ProcPtr parent, int x, int y, int distance) {
    struct CamMoveProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(gProcScr_0859A580, parent);
    } else {
        proc = Proc_Start(gProcScr_0859A580, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = x * 16;
    proc->to.y = y * 16;

    proc->distance = distance;
    proc->frame = 0;

    return;
}
