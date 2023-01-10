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

#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"

#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"


struct GENSProc {
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

extern const struct ProcCmd gProc_BMapMain[];

extern struct Vec2 gUnknown_0202BD3C;
extern u32 gUnknown_0202BD40;
extern s8 gUnknown_0202BD44[];

extern u16 gUnknown_03007FF8;

extern s8 gUnknown_0859A438[][2];
extern u16 gUnknown_0859A4A6[];
extern u16* gUnknown_0859A4C0[];
extern u16* gUnknown_0859A530[];
extern u16* gUnknown_0859A53C[];
extern struct ProcCmd gUnknown_0859A570[];
extern struct ProcCmd gUnknown_0859A580[];
extern struct ProcCmd gUnknown_0859BDA0[];

extern u8 gUnknown_0859E8E0[];
extern u16 gUnknown_0859ED70[];

extern u16 gUnknown_089FFC30[];

//! FE8U = 0x080152A4
void GeneralVBlankHandler(void) {

    gUnknown_03007FF8 = 1;

    IncrementGameClock();
    m4aSoundVSync();

    Proc_Run(gProcTreeRootArray[0]);

    FlushPrimaryOAM();

    if (gGameState.mainLoopEndedFlag) {
        gGameState.mainLoopEndedFlag = 0;

        FlushLCDControl();
        FlushBackgrounds();
        FlushTiles();
        FlushSecondaryOAM();
    }

    m4aSoundMain();

    return;
}

//! FE8U = 0x080152F4
void SomeUpdateRoutine(void) {

    UpdateKeyStatus(gKeyStatusPtr);

    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetThread2SkipStack() == 0) {
        Proc_Run(gProcTreeRootArray[2]);
    }

    Proc_Run(gProcTreeRootArray[3]);

    Proc_Run(gProcTreeRootArray[5]);
    PushSpriteLayerObjects(0);

    Proc_Run(gProcTreeRootArray[4]);
    PushSpriteLayerObjects(13);

    gGameState.mainLoopEndedFlag = 1;
    gGameState.prevVCount = REG_VCOUNT;

    VBlankIntrWait();

    return;
}

//! FE8U = 0x08015360
void AddSkipThread2(void) {
    gGameState.gameLogicSemaphore++;
    return;
}

//! FE8U = 0x08015370
void SubSkipThread2(void) {
    gGameState.gameLogicSemaphore--;
    return;
}

//! FE8U = 0x08015380
u8 GetThread2SkipStack(void) {
    return gGameState.gameLogicSemaphore;
}

//! FE8U = 0x0801538C
void SwitchPhases(void) {

    switch (gRAMChapterData.faction) {
        case FACTION_BLUE:
            gRAMChapterData.faction = FACTION_RED;

            break;

        case FACTION_RED:
            gRAMChapterData.faction = FACTION_GREEN;

            break;

        case FACTION_GREEN:
            gRAMChapterData.faction = FACTION_BLUE;

            if (gRAMChapterData.chapterTurnNumber < 999) {
                gRAMChapterData.chapterTurnNumber++;
            }

            ProcessTurnSupportExp();
    }

    return;
}

//! FE8U = 0x080153D4
int CallBeginningEvents(void) {
    const struct ChapterEventGroup* pChapterEvents = GetChapterEventDataPointer(gRAMChapterData.chapterIndex);

    if (GetChapterThing() != 2) {
        CallEvent(pChapterEvents->beginningSceneEvents, 1);
    } else {
        CallEvent(gUnknown_089FFC30, 1);
    }

    return 0;
}

//! FE8U = 0x08015410
int sub_8015410(void) {

    ClearActiveFactionGrayedStates();
    RefreshUnitSprites();
    SwitchPhases();

    if (sub_8083EB8() == 1) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08015434
s8 sub_8015434(void) {
    if (sub_80832D4() == 1) {
        sub_80832D0();
        return 0;
    }

    return 1;
}

//! FE8U = 0x08015450
void MakePhaseController6C(ProcPtr proc) {

    switch (gRAMChapterData.faction) {
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

    return;
}

//! FE8U = 0x080154A4
void NewPlayerPhase6C(ProcPtr proc) {
    Proc_Goto(Proc_StartBlocking(gProcScr_PlayerPhase, proc), 7);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x080154C8
int sub_80154C8(ProcPtr proc) {

    if (gRAMChapterData.faction != FACTION_GREEN) {
        return 1;
    }

    Proc_StartBlocking(gUnknown_0859BDA0, proc);
    DecayTraps();

    return 0;
}

//! FE8U = 0x080154F4
void E_BMAPMAIN_SuspendGame(void) {

    gActionData.suspendPointType = SUSPEND_POINT_PHASECHANGE;
    SaveSuspendedGame(SAVE_BLOCK_SUSPEND);

    return;
}

//! FE8U = 0x0
void sub_801550C(ProcPtr proc) {
    if (gRAMChapterData.chapterIndex == 0x38) {
        return;
    }

    if (gRAMChapterData.chapterIndex == 0x06 && CheckEventId(0x88)) {
        return;
    }

    Proc_StartBlocking(gProcScr_ChapterIntro, proc);

    return;
}

//! FE8U = 0x08015544
void UndeployEveryone(void) {
    int i;

    UnsetEventId(0x84);

    if ((gRAMChapterData.unk4A_1) == 0) {
        for (i = 1; i < FACTION_GREEN; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            unit->state &= ~(US_NOT_DEPLOYED);
        }
    }

    return;
}

//! FE8U = 0x08015588
void GotoChapterWithoutSave(int chapterId) {
    gRAMChapterData.chapterIndex = chapterId;

    Proc_Goto(Proc_Find(gProc_BMapMain), 2);
    Proc_EndEach(gProcScr_PlayerPhase);
    Proc_EndEach(gProcScr_CpPhase);
    Proc_EndEach(gProcScr_BerserkCpPhase);

    return;
}

//! FE8U = 0x080155C4
void sub_80155C4(void) {
    u8 flag;

    if (CheckEventId(3)) {
        RegisterChapterTimeAndTurnCount(&gRAMChapterData);
    }

    ComputeChapterRankings();

    flag = (gRAMChapterData.unk4A_1 & 1);

    ChapterChangeUnitCleanup();
    StartBattleMap(0);

    if (flag) {
        gRAMChapterData.unk4A_1 = 1;
    }

    return;
}

//! FE8U = 0x08015608
void SetupBackgroundForWeatherMaybe(void) {

    if (gRAMChapterData.chapterWeatherId == WEATHER_CLOUDS) {
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
    CopyDataWithPossibleUncomp(gUnknown_0859E8E0, gGenericBuffer);
    CopyTileGfxForObj(gGenericBuffer, (void*)0x06010000, 0x12, 4);

    CopyToPaletteBuffer(gUnknown_0859ED70, 0x200, 0x40);

    return;
}

//! FE8U = 0x080156BC
void sub_80156BC(void) {
    CopyToPaletteBuffer(gUnknown_0859ED70, 0x200, 0x40);
    return;
}

//! FE8U = 0x080156D4
void sub_80156D4(void) {

    Font_InitForUIDefault();
    LoadLegacyUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x080156F4
void LoadGameCoreGfx(void) {

    Font_InitForUIDefault();
    LoadUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x08015714
void HandleCursorMovement(u16 keys) {
    int dir = (keys >> 4) & (0xf0 >> 4);

    struct Vec2 newCursor = {
        gGameState.playerCursor.x + gUnknown_0859A438[dir][0],
        gGameState.playerCursor.y + gUnknown_0859A438[dir][1]
    };

    if (gGameState.gameStateBits & (1 << 1)) {
        if ((gBmMapMovement[gGameState.playerCursor.y][gGameState.playerCursor.x] < MAP_MOVEMENT_MAX)) {
            if (gBmMapMovement[newCursor.y][newCursor.x] >= MAP_MOVEMENT_MAX) {
                if ((keys & 0xf0) != (gKeyStatusPtr->newKeys & 0xf0)) {
                    return;
                }
            }
        }
    }

    if ((newCursor.x >= 0) && (newCursor.x < gBmMapSize.x)) {
        gGameState.unk1C.x += gUnknown_0859A438[dir][0] * 16;

        gGameState.cursorPrevious.x = gGameState.playerCursor.x;
        gGameState.playerCursor.x = newCursor.x;
    }

    if ((newCursor.y >= 0) && (newCursor.y < gBmMapSize.y)) {
        gGameState.unk1C.y += gUnknown_0859A438[dir][1] * 16;

        gGameState.cursorPrevious.y = gGameState.playerCursor.y;
        gGameState.playerCursor.y = newCursor.y;
    }

    if (!(gGameState.gameStateBits & (1 << 2))) {
        if (gGameState.playerCursor.x == gGameState.cursorPrevious.x && gGameState.playerCursor.y == gGameState.cursorPrevious.y) {
            return;
        }

        PlaySoundEffect(0x65);
        gGameState.gameStateBits |= (1 << 2);
    } else {
        gGameState.gameStateBits &= ~(1 << 2);
    }

    return;
}

//! FE8U = 0x08015838
void MoveCameraByStepMaybe(int step) {
    if (gGameState.playerCursorDisplay.x < gGameState.unk1C.x) {
        gGameState.playerCursorDisplay.x += step;
    }

    if (gGameState.playerCursorDisplay.x > gGameState.unk1C.x)
    {
        gGameState.playerCursorDisplay.x -= step;
    }

    if (gGameState.playerCursorDisplay.y < gGameState.unk1C.y) {
        gGameState.playerCursorDisplay.y += step;
    }

    if (gGameState.playerCursorDisplay.y > gGameState.unk1C.y) {
        gGameState.playerCursorDisplay.y -= step;
    }

    return;
}

//! FE8U = 0x0801588C
void sub_801588C(int step) {

    s8 isUpdated = 0;

    int xCursorSprite = gGameState.playerCursorDisplay.x;
    int yCursorSprite = gGameState.playerCursorDisplay.y;

    if (gGameState.camera.x + 0x30 > xCursorSprite) {
        if (xCursorSprite - 0x30 < 0) {
            gGameState.camera.x = 0;
        } else {
            isUpdated = 1;

            gGameState.camera.x -= step;
            gGameState.unk36 = -step;

            gGameState.unk32 = gGameState.camera.x & 0xf;
        }
    }

    if (gGameState.camera.x + 0xb0 < xCursorSprite) {
        if (xCursorSprite - 0xb0 > gGameState.unk28.x) {
            gGameState.camera.x = gGameState.unk28.x;
        } else {
            isUpdated = 1;

            gGameState.camera.x += step;
            gGameState.unk36 = step;

            gGameState.unk32 = gGameState.camera.x & 0xf;
        }
    }

    if (gGameState.camera.y + 0x20 > yCursorSprite) {
        if (yCursorSprite - 0x20 < 0) {
            gGameState.camera.y = 0;
        } else {
            isUpdated = 1;
            gGameState.camera.y -= step;
            gGameState.unk37 = -step;

            gGameState.unk34 = gGameState.camera.y & 0xf;
        }
    }

    if (gGameState.camera.y + 0x70 < yCursorSprite) {
        if (yCursorSprite - 0x70 > gGameState.unk28.y) {
            gGameState.camera.y = gGameState.unk28.y;
        } else {
            isUpdated = 1;

            gGameState.camera.y += step;
            gGameState.unk37 = step;

            gGameState.unk34 = gGameState.camera.y & 0xf;
        }
    }

    if (!isUpdated) {
        if (gGameState.unk32 != 0) {
            gGameState.unk32 = (gGameState.unk32 + gGameState.unk36) & 0xf;
            gGameState.camera.x += gGameState.unk36;
        }

        if (gGameState.unk34 != 0) {
            gGameState.unk34 = (gGameState.unk34 + gGameState.unk37) & 0xf;
            gGameState.camera.y += gGameState.unk37;
        }
    }

    return;
}

//! FE8U = 0x080159B8
u16 GetSomeAdjustedCameraX(int x) {
    int result = gGameState.camera.x;

    if (gGameState.camera.x + 0x30 > x) {
        result = x - 0x30 < 0
            ? 0
            : x - 0x30;
    }

    if (gGameState.camera.x + 0xb0 < x) {
        result = x - 0xb0 > gGameState.unk28.x
            ? gGameState.unk28.x
            : x - 0xb0;
    }

    return result;
}

//! FE8U = 0x080159FC
u16 GetSomeAdjustedCameraY(int y) {
    int result = gGameState.camera.y;

    if (gGameState.camera.y + 0x20 > y) {
        result = y - 0x20 < 0
            ? 0
            : y - 0x20;
    }

    if (gGameState.camera.y + 0x70 < y) {
        result = y - 0x70 > gGameState.unk28.y
            ? gGameState.unk28.y
            : y - 0x70;
    }

    return result;
}

//! FE8U = 0x08015A40
u16 sub_8015A40(int x) {
    int result;

    result = x - DISPLAY_WIDTH / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gGameState.unk28.x) {
        result = gGameState.unk28.x;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A6C
u16 sub_8015A6C(int y) {

    int result  = y - DISPLAY_HEIGHT / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gGameState.unk28.y) {
        result = gGameState.unk28.y;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A98
void DisplayCursor(int x, int y, int kind) {

    int oam2 = 0;

    u16* sprite = NULL;

    int frame = (GetGameClock() / 2) % 16;

    switch (kind) {
        case 0:
        case 1:
            oam2 = 2;
            sprite = gUnknown_0859A4C0[frame];

            break;

        case 2:
            if (GetGameClock() - 1 == gUnknown_0202BD40) {
                x = (x + gUnknown_0202BD3C.x) >> 1;
                y = (y + gUnknown_0202BD3C.y) >> 1;
            }

            oam2 = 0x24;

            sprite = gUnknown_0859A4C0[frame];

            gUnknown_0202BD3C.x = x;
            gUnknown_0202BD3C.y = y;

            gUnknown_0202BD40 = GetGameClock();

            break;

        case 3:
            oam2 = 2;
            sprite = gUnknown_0859A4A6;

            break;

        case 4:
            oam2 = 0x24;
            sprite = gUnknown_0859A4C0[0];

            break;
    }

    x = x - gGameState.camera.x;
    y = y - gGameState.camera.y;

    PutSprite(4, x, y, sprite, oam2);

    return;
}

//! FE8U = 0x08015B88
void sub_8015B88(int x, int y) {
    int frame = (GetGameClock() / 2) % 16;
    u32 oam2 = 2;

    PutSprite(4, x, y, gUnknown_0859A4C0[frame], oam2);
    return;
}

//! FE8U = 0x08015BBC
void SetCursorMapPosition(int x, int y) {

    gGameState.playerCursor.x = x;
    gGameState.playerCursor.y = y;

    gGameState.unk1C.x = x * 16;
    gGameState.unk1C.y = y * 16;

    gGameState.playerCursorDisplay.x = x * 16;
    gGameState.playerCursorDisplay.y = y * 16;

    return;
}

//! FE8U = 0x08015BD4
void UpdateStatArrowSprites(int x, int y, u8 isDown) {
    int frame =  GetGameClock() / 8 % 3;

    PutSprite(4, x, y, isDown ? gUnknown_0859A53C[frame] : gUnknown_0859A530[frame], 0);

    return;
}

//! FE8U = 0x08015C1C
void Init6C_GENS(struct GENSProc* proc) {
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
            gUnknown_0202BD44[i] = dist;
            break;
        }

        dist -= (speed >> 1);
        gUnknown_0202BD44[i] = (speed >> 1);

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
void Loop6C_GENS(struct GENSProc* proc) {

    if (proc->frame == 0) {
        proc->to.x = gGameState.camera.x;
        proc->to.y = gGameState.camera.y;

        Proc_End(proc);

        return;
    }

    proc->distance -= gUnknown_0202BD44[proc->frame--];

    gGameState.camera.x = proc->to.x + (proc->from.x - proc->to.x) * proc->distance / proc->calibration;


    gGameState.camera.y = proc->to.y + (proc->from.y - proc->to.y) * proc->distance / proc->calibration;

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
    struct GENSProc* proc;

    int xTarget;
    int yTarget;

    StoreAdjustedCameraPositions(x, y, &xTarget, &yTarget);

    xTarget = xTarget * 16;
    yTarget = yTarget * 16;

    if ((xTarget == gGameState.camera.x) &&
        (yTarget == gGameState.camera.y)) {
        return 0;
    }

    if (Proc_Find(ProcScr_MaybeMapChangeAnim)) {
        return 0;
    }

    if (parent != 0) {
        proc = Proc_StartBlocking(ProcScr_MaybeMapChangeAnim, parent);
    } else {
        proc = Proc_Start(ProcScr_MaybeMapChangeAnim, PROC_TREE_3);
    }

    proc->from.x = gGameState.camera.x;
    proc->from.y = gGameState.camera.y;

    proc->to.x = xTarget;
    proc->to.y = yTarget;

    proc->watchedCoordinate.x = x;
    proc->watchedCoordinate.y = y;

    return 1;
}

//! FE8U = 0x08015E0C
s8 EnsureCameraOntoPosition(ProcPtr parent, int x, int y) {
    struct GENSProc* proc;

    int xTarget = GetSomeAdjustedCameraX(x * 16);
    int yTarget = GetSomeAdjustedCameraY(y * 16);

    if ((xTarget == gGameState.camera.x) && (yTarget == gGameState.camera.y)) {
        return 0;
    }

    if (Proc_Find(ProcScr_MaybeMapChangeAnim)) {
        return 0;
    }

    if (parent) {
        proc = Proc_StartBlocking(ProcScr_MaybeMapChangeAnim, parent);
    } else {
        proc = Proc_Start(ProcScr_MaybeMapChangeAnim, PROC_TREE_3);
    }

    proc->from.x = gGameState.camera.x;
    proc->from.y = gGameState.camera.y;

    proc->to.x = xTarget;
    proc->to.y = yTarget;

    proc->watchedCoordinate.x = x;
    proc->watchedCoordinate.y = y;

    return 1;
}

//! FE8U = 0x08015E9C
s8 ShouldMoveCameraPosSomething(int x, int y) {
    int xTarget = GetSomeAdjustedCameraX(x * 16);
    int yTarget = GetSomeAdjustedCameraY(y * 16);

    if ((xTarget == gGameState.camera.x) && (yTarget == gGameState.camera.y)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08015EDC
s8 sub_8015EDC(ProcPtr parent) {
    struct GENSProc* proc;

    if (gGameState.camera.y <= gGameState.unk28.y) {
        return 0;
    }

    if (Proc_Find(ProcScr_MaybeMapChangeAnim)) {
        return 0;
    }

    if (parent) {
        proc = Proc_StartBlocking(ProcScr_MaybeMapChangeAnim, parent);
    } else {
        proc = Proc_Start(ProcScr_MaybeMapChangeAnim, PROC_TREE_3);
    }

    proc->from.x = gGameState.camera.x;
    proc->from.y = gGameState.camera.y;

    proc->to.x = gGameState.camera.x;
    proc->to.y = gGameState.unk28.y;

    return 1;
}

//! FE8U = 0x08015F40
void sub_8015F40(struct UnkMapCursorProc* proc) {

    DisplayCursor(
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

    proc = Proc_Start(gUnknown_0859A570, PROC_TREE_3);

    proc->to.x = gGameState.playerCursor.x << 4;
    proc->to.y = gGameState.playerCursor.y << 4;

    proc->from.x = x << 4;
    proc->from.y = y << 4;

    proc->duration = duration;
    proc->clock = duration;

    return;
}

#if NONMATCHING

static inline int CheckAltBgm(u8 base, u8 alt) {
    if (!CheckEventId(4)) {
        return base;
    } else {
        return alt;
    }
}

static inline u8 CheckAltBgm2(int base, int alt) {
    if (!CheckEventId(4)) {
        return base;
    } else {
        return alt;
    }
}

//! FE8U = 0x08015FC8
int GetCurrentMapMusicIndex(void) {
    int aliveUnits;

    u8 blueBgmIdx = CheckAltBgm(MAP_BGM_BLUE, MAP_BGM_BLUE_GREEN_ALT);

    u8 redBgmIdx = CheckAltBgm(MAP_BGM_RED, MAP_BGM_RED_ALT);

    register u8 greenBgmIdx asm ("r4") = CheckAltBgm2(MAP_BGM_GREEN, MAP_BGM_BLUE_GREEN_ALT);

    switch (gRAMChapterData.faction) {
        case FACTION_RED:
            return GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapBgmIds[redBgmIdx];

        case FACTION_GREEN:
            return GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapBgmIds[greenBgmIdx];

        case FACTION_BLUE:

            if (CheckEventId(4)) {
                return GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapBgmIds[blueBgmIdx];
            }

            if ((GetChapterThing() == 2) || ((s8)(GetROMChapterStruct(gRAMChapterData.chapterIndex)->victorySongEnemyThreshold)) != 0) {
                aliveUnits = CountUnitsInState(0x80, 0x0001000C);

                if (GetChapterThing() != 2) {
                    if (aliveUnits <= (s8)(GetROMChapterStruct(gRAMChapterData.chapterIndex)->victorySongEnemyThreshold)) {
                        goto _080160AC;
                    }
                } else if (aliveUnits <= 1) {
                _080160AC:
                    return 0x10;
                }

            }

            return GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapBgmIds[blueBgmIdx];
    }
}

#else // if !NONMATCHING

__attribute__((naked))
int GetCurrentMapMusicIndex(void) {
    asm("\n\
            .syntax unified\n\
            push {r4, r5, r6, r7, lr}\n\
            movs r0, #4\n\
            bl CheckEventId\n\
            lsls r0, r0, #0x18\n\
            movs r1, #6\n\
            cmp r0, #0\n\
            bne _08015FDA\n\
            movs r1, #0\n\
        _08015FDA:\n\
            adds r7, r1, #0\n\
            movs r0, #4\n\
            bl CheckEventId\n\
            lsls r0, r0, #0x18\n\
            movs r1, #7\n\
            cmp r0, #0\n\
            bne _08015FEC\n\
            movs r1, #1\n\
        _08015FEC:\n\
            adds r6, r1, #0\n\
            movs r0, #4\n\
            bl CheckEventId\n\
            adds r1, r0, #0\n\
            lsls r1, r1, #0x18\n\
            cmp r1, #0\n\
            bne _08016000\n\
            movs r4, #2\n\
            b _08016002\n\
        _08016000:\n\
            movs r4, #6\n\
        _08016002:\n\
            ldr r5, _08016014  @ gRAMChapterData\n\
            ldrb r1, [r5, #0xf]\n\
            cmp r1, #0x40\n\
            beq _0801602E\n\
            cmp r1, #0x40\n\
            bgt _08016018\n\
            cmp r1, #0\n\
            beq _08016040\n\
            b _080160C4\n\
            .align 2, 0\n\
        _08016014: .4byte gRAMChapterData\n\
        _08016018:\n\
            cmp r1, #0x80\n\
            bne _080160C4\n\
            movs r0, #0xe\n\
            ldrsb r0, [r5, r0]\n\
            bl GetROMChapterStruct\n\
            lsls r1, r6, #1\n\
            adds r0, #0x16\n\
            adds r0, r0, r1\n\
            ldrh r0, [r0]\n\
            b _080160C4\n\
        _0801602E:\n\
            movs r0, #0xe\n\
            ldrsb r0, [r5, r0]\n\
            bl GetROMChapterStruct\n\
            lsls r1, r4, #1\n\
            adds r0, #0x16\n\
            adds r0, r0, r1\n\
            ldrh r0, [r0]\n\
            b _080160C4\n\
        _08016040:\n\
            movs r0, #4\n\
            bl CheckEventId\n\
            lsls r0, r0, #0x18\n\
            cmp r0, #0\n\
            beq _0801605E\n\
            movs r0, #0xe\n\
            ldrsb r0, [r5, r0]\n\
            bl GetROMChapterStruct\n\
            lsls r1, r7, #1\n\
            adds r0, #0x16\n\
            adds r0, r0, r1\n\
            ldrh r0, [r0]\n\
            b _080160C4\n\
        _0801605E:\n\
            bl GetChapterThing\n\
            cmp r0, #2\n\
            beq _0801607A\n\
            movs r0, #0xe\n\
            ldrsb r0, [r5, r0]\n\
            bl GetROMChapterStruct\n\
            adds r0, #0x86\n\
            ldrb r0, [r0]\n\
            lsls r0, r0, #0x18\n\
            asrs r0, r0, #0x18\n\
            cmp r0, #0\n\
            beq _080160B0\n\
        _0801607A:\n\
            ldr r1, _080160A4  @ 0x0001000C\n\
            movs r0, #0x80\n\
            bl CountUnitsInState\n\
            adds r4, r0, #0\n\
            bl GetChapterThing\n\
            cmp r0, #2\n\
            beq _080160A8\n\
            movs r0, #0xe\n\
            ldrsb r0, [r5, r0]\n\
            bl GetROMChapterStruct\n\
            adds r0, #0x86\n\
            ldrb r0, [r0]\n\
            lsls r0, r0, #0x18\n\
            asrs r0, r0, #0x18\n\
            cmp r4, r0\n\
            ble _080160AC\n\
            b _080160B0\n\
            .align 2, 0\n\
        _080160A4: .4byte 0x0001000C\n\
        _080160A8:\n\
            cmp r4, #1\n\
            bgt _080160B0\n\
        _080160AC:\n\
            movs r0, #0x10\n\
            b _080160C4\n\
        _080160B0:\n\
            ldr r0, _080160CC  @ gRAMChapterData\n\
            ldrb r0, [r0, #0xe]\n\
            lsls r0, r0, #0x18\n\
            asrs r0, r0, #0x18\n\
            bl GetROMChapterStruct\n\
            lsls r1, r7, #1\n\
            adds r0, #0x16\n\
            adds r0, r0, r1\n\
            ldrh r0, [r0]\n\
        _080160C4:\n\
            pop {r4, r5, r6, r7}\n\
            pop {r1}\n\
            bx r1\n\
            .align 2, 0\n\
        _080160CC: .4byte gRAMChapterData\n\
            .syntax divided\n\
        ");
}

#endif // NONMATCHING

//! FE8U = 0x080160D0
void sub_80160D0(void) {
    Sound_PlaySong80024D4(GetCurrentMapMusicIndex(), 0);
    return;
}

//! FE8U = 0x080160E0
void sub_80160E0(struct GENSProc* proc) {
    int x = Interpolate(0, proc->from.x, proc->to.x, proc->frame, proc->distance);
    int y = Interpolate(0, proc->from.y, proc->to.y, proc->frame, proc->distance);

    gGameState.camera.x = x;
    gGameState.camera.y = y;

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
    struct GENSProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(gUnknown_0859A580, parent);
    } else {
        proc = Proc_Start(gUnknown_0859A580, PROC_TREE_3);
    }

    proc->from.x = gGameState.camera.x;
    proc->from.y = gGameState.camera.y;

    proc->to.x = x * 16;
    proc->to.y = y * 16;

    proc->distance = distance;
    proc->frame = 0;

    return;
}
