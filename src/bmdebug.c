//
// Created by laqieer on 2020/3/3.
//
#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmsave.h"
#include "chapterdata.h"
#include "bm.h"
#include "rng.h"
#include "scene.h"
#include "gamecontrol.h"
#include "bmdebug.h"
#include "soundroom.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sio.h"

#include "constants/faces.h"

void PrintDebugBuildDateAndTime(u16 *bg);

u16 CONST_DATA gUnknown_0859A9D8[] = {
    0x0000, 0x0008, 0x000A, 0x0040, 0x0014,
    0x0000, 0x0015, 0x0030, 0x0000, 0x0080,
};

// if current seconds is even, return 2; else return 3
int Return2or3BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    FormatTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) == 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// if current seconds is even, return 3; else return 2
int Return3or2BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    FormatTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) != 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// return 8
int Get8(void)
{
    return MENU_ACT_SND6B;
}

// return 23
int Get23(void)
{
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

// do nothing, return directly
void DummyFunction(void)
{

}

void Loop6C_WaitForSelectPress(struct Proc *proc)
{
    if (gKeyStatusPtr->newKeys & SELECT_BUTTON) {
        Proc_Break(proc);
    }
}

void SetNewKeyStatusWith16(void)
{
    AsnycKeyStatus(DPAD_RIGHT);
}

struct ProcCmd CONST_DATA gProcScr_0859A9EC[] = {
    PROC_REPEAT(Loop6C_WaitForSelectPress),

PROC_LABEL(1),
    PROC_CALL(SetNewKeyStatusWith16),
    PROC_SLEEP(12),
    PROC_CALL(SetNewKeyStatusWith16),
    PROC_SLEEP(12),
    PROC_CALL(SetNewKeyStatusWith16),
    PROC_SLEEP(12),
    PROC_CALL(SetNewKeyStatusWith16),
    PROC_SLEEP(12),
    PROC_CALL(SetNewKeyStatusWith16),
    PROC_SLEEP(12),

    PROC_GOTO(1),

    PROC_END,
};

// do nothing, return directly
void DummyFunction2(void)
{

}

void DebugPrintWithProc(struct DebugPrintProc *proc)
{
    struct Text Textr;

    int x = proc->x;
    int y = proc->y;
    int width = proc->width;
    const char *text = proc->text;
    InitText(&Textr, width);
    Text_DrawString(&Textr, text);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    PutText(&Textr, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 1));
    BG_EnableSyncByMask(3);
}

CONST_DATA struct ProcCmd ProcScr_DebugMonitor[] = {
    PROC_END
};

CONST_DATA struct ProcCmd gProc_DebugPrintWithProc[] = {
    PROC_SLEEP(1),
    PROC_CALL(DebugPrintWithProc),
    PROC_END
};

void DebugPrint(int x, int y, int width, const char *text)
{
    struct DebugPrintProc *proc = Proc_Start(gProc_DebugPrintWithProc, PROC_TREE_3);
    proc->x = x;
    proc->y = y;
    proc->text = text;
    proc->width = width;
}

int StartDebugMenu(struct MenuProc *menuProc)
{
    EndMenu(menuProc);
    ClearBg0Bg1();
    StartOrphanMenu(&gDebugMenuDef);
    SetupDebugFontForBG(2, 0);
    return 1;
}

u8 DebugMenu_MapIdle(struct MenuProc *menuProc, struct MenuItemProc *menuItemProc)
{
    DebugMenuMapIdleCore(menuItemProc, 7, 2);
    return 0;
}

u8 DebugMenu_MapEffect(struct MenuProc *menuProc, struct MenuItemProc *menuItemProc)
{
    EndBMapMain();
    gPlaySt.chapterIndex = Debug_GetChapterId(menuItemProc->itemNumber);
    gPlaySt.chapterModeIndex = gDebugChapterModeIndex;
    ChapterChangeUnitCleanup();
    nullsub_9();
    gPlaySt.save_menu_type = 2;
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801BB98
int sub_801BB98(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int songId;
    int i;

    int totalSongs = CountTotalSoundRoomSongs();

    menuItemProc->itemNumber = 0;

    songId = GetCurrentBgmSong();
    for (i = 0; i < totalSongs; i++) {
        if (songId == i) {
            menuItemProc->itemNumber = i;
            break;
        }
    }

    ClearText(&menuItemProc->text);

    // BUG: Text ID is used without "GetStringFromIndex"
    Text_InsertDrawString(&menuItemProc->text, 0, TEXT_COLOR_SYSTEM_WHITE, (const char *)gSoundRoomTable[menuItemProc->itemNumber].nameTextId);
    PutText(&menuItemProc->text,  gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    // return 0; // BUG
}

//! FE8U = 0x0801BC1C
int sub_801BC1C(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        menuItemProc->itemNumber++;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        menuItemProc->itemNumber--;
    }

    if (menuItemProc->itemNumber < 0) {
        menuItemProc->itemNumber = 0;
    }

    if (gSoundRoomTable[menuItemProc->itemNumber].bgmId < 0) {
        menuItemProc->itemNumber--;
    }

    if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        ClearText(&menuItemProc->text);

        // BUG: Text ID is used without "GetStringFromIndex"
        Text_InsertDrawString(&menuItemProc->text, 0, TEXT_COLOR_SYSTEM_WHITE, (const char *)gSoundRoomTable[menuItemProc->itemNumber].nameTextId);
        PutText(&menuItemProc->text,  gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));
    }

    return 0;
}

//! FE8U = 0x0801BCCC
u8 EndMenuAndClear(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    EndMenu(menuProc);
    EndFaceById(0);
    ClearBg0Bg1();

    return 1;
}

int CONST_DATA gTextIds_OnOff[] = {
    0x0849, // TODO: msgid "ON"
    0x084A, // TODO: msgid "OFF"
};

//! FE8U = 0x0801BCE4
int DebugMapMenu_DisplayInfoDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    struct DebugPrintProc* debugPrintProc = Proc_Find(ProcScr_DebugMonitor);

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(menuItemProc->def->nameMsgId));
    Text_InsertDrawString(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(gTextIds_OnOff[debugPrintProc->unk_66]));
    PutText(&menuItemProc->text,  gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

//! FE8U = 0x0801BD58
u8 DebugMapMenu_DisplayInfoIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    struct DebugPrintProc* debugPrintProc = Proc_Find(ProcScr_DebugMonitor);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT)) {
        debugPrintProc->unk_66 ^= 1;
        DebugMapMenu_DisplayInfoDraw(menuProc, menuItemProc);
        SetupDebugFontForOBJ(-1, 9);
    }
    return 0;
}

//! FE8U = 0x0801BDA0
u8 DebugMapMenu_DisplayInfoEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return 0;
}

//! FE8U = 0x0801BDA4
int DebugMenu_WeatherDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    u16 weatherTextIds[] = {
        0x06B1, // TODO: msgid "Clear"
        0x06B2, // TODO: msgid "Sand"
        0x06B3, // TODO: msgid "Snow"
        0x06B4, // TODO: msgid "Flurry"
        0x06B5, // TODO: msgid "Rain"
        0x06B6, // TODO: msgid "Night"
        0x06B7, // TODO: msgid "Lave" [sic]
    };

    struct DebugPrintProc* debugPrintProc = Proc_Find(ProcScr_DebugMonitor);

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(menuItemProc->def->nameMsgId));
    Text_InsertDrawString(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex((weatherTextIds[debugPrintProc->unk_58 % 7])));
    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

//! FE8U = 0x0801BE28
u8 DebugMenu_WeatherIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    struct DebugPrintProc* debugPrintProc = Proc_Find(ProcScr_DebugMonitor);

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
        debugPrintProc->unk_58--;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        debugPrintProc->unk_58++;
    }

    if (debugPrintProc->unk_58 < 0) {
        debugPrintProc->unk_58 = 6;
    }

    if (debugPrintProc->unk_58 > 6) {
        debugPrintProc->unk_58 = 0;
    }

    DebugMenu_WeatherDraw(menuProc, menuItemProc);

    if (gKeyStatusPtr->newKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        switch (debugPrintProc->unk_58) {
            case 0:
                SetWeather(WEATHER_FINE);
                break;

            case 1:
                SetWeather(WEATHER_SANDSTORM);
                break;

            case 2:
                SetWeather(WEATHER_SNOW);
                break;

            case 3:
                SetWeather(WEATHER_SNOWSTORM);
                break;

            case 4:
                SetWeather(WEATHER_RAIN);
                break;

            case 5:
                SetWeather(WEATHER_NIGHT);
                break;

            case 6:
                SetWeather(WEATHER_FLAMES);
                break;
        }
    }

    return 0;
}

//! FE8U = 0x0801BEFC
u8 DebugMenu_WeatherEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return 0;
}

//! FE8U = 0x0801BF00
int DebugMenu_ClearDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(menuItemProc->def->nameMsgId));
    Text_InsertDrawString(&menuItemProc->text, 72, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(0x6b8)); // TODO: msgid "Clears"
    Text_InsertDrawNumberOrBlank(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetGlobalCompletionCount() + 1);
    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

//! FE8U = 0x0801BF6C
u8 DebugMenu_ClearIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int i;
    struct GlobalSaveInfo info;

    if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        int count = GetGlobalCompletionCount();

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            if (count >= 0) {
                count--;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            if (count < 12) {
                count++;
            }
        }

        ReadGlobalSaveInfo(&info);

        for (i = 0; i < MAX_SAVED_GAME_CLEARS; i++) {
            info.cleared_playthroughs[i] = 0;
        }

        for (i = 0; i < count; i++) {
            RegisterCompletedPlaythrough(&info, i + 1);
        }

        if (count == 0) {
            info.completed = 0;
        } else {
            info.completed = 1;
        }

        WriteGlobalSaveInfo(&info);

        DebugMenu_ClearDraw(menuProc, menuItemProc);
    }

    return 0;
}

//! FE8U = 0x0801C014
u8 DebugMenu_ClearEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C018
u8 DebugMenu_ErasedEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearBg0Bg1();
    StartOrphanMenu(&gDebugClearMenuDef);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

//! FE8U = 0x0801C030
u8 DebugClearMenu_ClearFile(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    SavePlayThroughData();
    gPlaySt.chapterStateBits &= ~(PLAY_FLAG_PREPSCREEN);
    ChapterChangeUnitCleanup();

    WriteGameSave(ReadLastGameSaveId());
    SoftReset(0xff);

    // return 0; // BUG
}

//! FE8U = 0x0801C05C
int DebugMenuInit(void) {
    gDebugChapterModeIndex = gPlaySt.chapterModeIndex;

    PrintDebugStringToBG(gBG0TilemapBuffer + 0x67, GetROMChapterStruct(0)->internalName);
    BG_EnableSyncByMask(1);

    // return; // BUG - Should be void
}

//! FE8U = 0x0801C090
void DEBUGONLY_Startup(void) {
    struct MenuProc* menuProc;

    SetMainUpdateRoutine(OnGameLoopMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    RefreshBMapGraphics();

    SetupDebugFontForBG(2, 0);

    SetTalkUnkStr("mou dame po");

    menuProc = StartOrphanMenu(&gDebugContinueMenuDef);

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;
    StartMuralBackground(menuProc, (void *)0x0600B000, -1);
    gBmSt.gameStateBits &= ~(BM_FLAG_LINKARENA);

    PrintDebugBuildDateAndTime(gBG2TilemapBuffer + 0x20);

    return;
}

//! FE8U = 0x0801C0FC
int DebugContinueMenuInit(struct MenuProc* menuProc) {
    struct SaveBlockInfo block;
    int fid;

    menuProc->menuItems[5]->itemNumber = 0;

    BG_EnableSyncByMask(1);

    if ((ReadSaveBlockInfo(&block, 3) != 1) || ((((block.checksum32 + (block.checksum32 >> 0x10)) & 0xf)) != 0)) {
        StartFace(0, FID_EPHRAIM, 32, 80, (FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(4)));
        StartFace(1, FID_EIRIKA, 208, 80, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4)));
        return 0;
    }

    fid = ((block.checksum32 & 0xff) % 100) + 1;
    StartFace(0, fid, 32, 80, (FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(4)));
    fid = (((block.checksum32 & 0xff00) >> 8) % 100) + 1;
    StartFace(1, fid, 208, 80, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4)));

    return 0;
}

//! FE8U = 0x0801C198
int DebugContinueMenuEnd(struct MenuProc* menuProc) {
    EndFaceById(0);
    EndFaceById(1);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    // return 0; // BUG
}

//! FE8U = 0x0801C1DC
u8 StartupDebugMenu_WorldMapEffect(void) {
    InitRN(GetGameClock());
    InitUnits();
    WriteNewGameSave(0, 0, 0, -1);
    SetTacticianName(GetStringFromIndex(0x26A)); // TODO: msgid "Mark"

    gPlaySt.chapterIndex = 1;

    WriteGameSave(SAVE_ID_GAME0);
    ChapterChangeUnitCleanup();

    nullsub_RestartGameAndGoto7();

    return 2;
}

//! FE8U = 0x0801C224
u8 StartupDebugMenu_ChapterSelectIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    DebugMenuMapIdleCore(menuItemProc, menuProc->rect.x + 2, menuProc->rect.y + 11);
    return 0;
}

//! FE8U = 0x0801C248
u8 StartupDebugMenu_ChapterSelectEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    InitRN(GetGameClock());
    InitUnits();

    if (gKeyStatusPtr->heldKeys & L_BUTTON) {
        WriteNewGameSave(0, 1, 0, -1);
    } else {
        WriteNewGameSave(0, 0, 0, -1);
    }

    SetTacticianName(GetStringFromIndex(0x26A)); // TODO: msgid "Mark"

    gPlaySt.chapterIndex = Debug_GetChapterId(menuItemProc->itemNumber);
    gPlaySt.chapterModeIndex = gDebugChapterModeIndex;

    WriteGameSave(SAVE_ID_GAME0);

    ChapterChangeUnitCleanup();
    nullsub_9();

    return 2;
}

//! FE8U = 0x0801C2D0
u8 sub_801C2D0(void) {
    StartOrphanMenu(&gDebugChuudanMenuDef);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C2E4
u8 sub_801C2E4(void) {
    StartOrphanMenu(&gDebugChargeMenuDef);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C2F8
u8 sub_801C2F8(void) {
    Make6C_SaveMenuPostChapter(PROC_TREE_3);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C308
u8 DebugChuudanMenu_IsManualSaveAvailable(const struct MenuItemDef* def, int number) {
    return MENU_DISABLED;
}

//! FE8U = 0x0801C30C
u8 DebugChuudanMenu_ManualSave(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    WriteSuspendSave(SAVE_ID_SUSPEND_ALT);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C328
u8 DebugContinueMenu_IsManualContinueAvailable(const struct MenuItemDef* def, int number) {
    return (IsValidSuspendSave(SAVE_ID_SUSPEND_ALT))
        ? MENU_ENABLED
        : MENU_DISABLED;
}

//! FE8U = 0x0801C340
u8 DebugContinueMenu_ManualContinue(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {

    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    if (Proc_Find(gProc_BMapMain)) {
        EndBMapMain();
    }

    ReadSuspendSave(SAVE_ID_SUSPEND_ALT);
    RestartGameAndGoto8();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C370
u8 DebugContinueMenu_InitializeFile(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    if (Proc_Find(gProc_BMapMain)) {
        EndBMapMain();
    }

    RestartGameAndGoto12();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C39C
u8 DebugContinueMenu_IsContinueChapterAvailable(const struct MenuItemDef* def, int number) {
    return IsValidSuspendSave(SAVE_ID_SUSPEND)
        ? MENU_ENABLED
        : MENU_DISABLED;
}

//! FE8U = 0x0801C3B4
u8 DebugContinueMenu_ContinueChapter(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    ReadSuspendSave(SAVE_ID_SUSPEND);
    RestartGameAndGoto8();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C3D4
int DebugMenu_FogDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(menuItemProc->def->nameMsgId));
    Text_InsertDrawString(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(gTextIds_OnOff[(gPlaySt.chapterVisionRange != 0)]));
    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));
    return 0;
}

//! FE8U = 0x0801C448
u8 DebugMenu_FogIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (DoesBMXFADEExist()) {
        return 0;
    }

    if (!(gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_LEFT | DPAD_RIGHT))) {
        return 0;
    }

    if (gPlaySt.chapterVisionRange == 0) {
        if (GetBattleMapKind() == 2) {
            UpdateMapViewWithFog(3);
        } else {
            UpdateMapViewWithFog(GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel);
        }
    } else {
        UpdateMapViewWithFog(0);
    }

    DebugMenu_FogDraw(menuProc, menuItemProc);
    return 0;
}

//! FE8U = 0x0801C4B0
u8 DebugMenu_FogEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return 0;
}

//! FE8U = 0x0801C4B4
u8 DebugContinueMenu_ReleaseEntry(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    StartGame();
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

//! FE8U = 0x0801C4C0
u8 DebugMenu_GNightEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    sub_8001CB0(0x300);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C4D0
int DebugChargeMenu_Draw(struct MenuProc* param_1, struct MenuItemProc* menuItemProc) {
    int state;
    u16 factionTextIds[2] = {
        0x6A5, // TODO: msgid "2nd"
        0x6A6, // TODO: msgid "3rd"
    };
    u16 controlTypeTextIds[3] = {
        0x6A7, // TODO: msgid "CPU"
        0x6A8, // TODO: msgid "Human"
        0x6A9, // TODO: msgid "Blocked"
    };

    if (menuItemProc->itemNumber != 0) {
        state = gPlaySt.config.debugControlGreen;
    } else {
        state = gPlaySt.config.debugControlRed;
    }

    ClearText(&menuItemProc->text);

    Text_InsertDrawString(&menuItemProc->text, 4, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(factionTextIds[menuItemProc->itemNumber]));
    Text_InsertDrawString(&menuItemProc->text, 30, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(controlTypeTextIds[state]));

    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

//! FE8U = 0x0801C588
u8 DebugChargeMenu_Idle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int state;

    if (!(gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_LEFT | DPAD_RIGHT))) {
        return 0;
    }

    if (menuItemProc->itemNumber != 0) {
        state = gPlaySt.config.debugControlGreen;
    } else {
        state = gPlaySt.config.debugControlRed;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        state--;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_RIGHT)) {
        state++;
    }

    if (state > 2) {
        state = 2;
    }

    if (state < 0) {
        state = 0;
    }

    if (menuItemProc->itemNumber != 0) {
        gPlaySt.config.debugControlGreen = state;
    } else {
        gPlaySt.config.debugControlRed = state;
    }

    DebugChargeMenu_Draw(menuProc, menuItemProc);

    return 0;
}

struct ProcCmd CONST_DATA gProcScr_DebugStartNameEntry[] = {
    PROC_CALL(sub_8048260),
    PROC_SLEEP(0),

    PROC_END,
};

//! FE8U = 0x0801C63C
u8 sub_801C63C(void) {
    Proc_Start(gProcScr_DebugStartNameEntry, PROC_TREE_3);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

// TODO: Chapter IDs!
u8 CONST_DATA gChapterIdOrderedList[] = {
    // CHAPTER_MODE_COMMON
    0x00, 0x01, 0x02, 0x03, 0x04, 0x06, 0x05, 0x07, 0x08, 0x09,

    // CHAPTER_MODE_EIRIKA
    0x0A, 0x0B, 0x3D, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16,

    // CHAPTER_MODE_EPHRAIM
    0x17, 0x18, 0x3E, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23,

    0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33,
    0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3B, 0x3C,
};

//! FE8U = 0x0801C650
u8 Debug_GetChapterId(int menuItemNumber) {
    return gChapterIdOrderedList[menuItemNumber];
}

//! FE8U = 0x0801C65C
void DebugMenuMapIdleCore(struct MenuItemProc* menuItemProc, int x, int y) {
    int chapterId;
    const char* internalNameStr;
    const char* modeStr;

    const char* strings[4] = {
        "-------",
        "Tuto",
        "Eirik",
        "Ephraim"
    };

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        menuItemProc->itemNumber++;
        if ((u8)menuItemProc->itemNumber > 0x3b) {
            menuItemProc->itemNumber = 0;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        menuItemProc->itemNumber--;
        if (menuItemProc->itemNumber < 0) {
            menuItemProc->itemNumber = 0x3b;
        }
    }

    chapterId = Debug_GetChapterId(menuItemProc->itemNumber);

    switch (chapterId) {
        case 0x00:
        case 0x01:
        case 0x02:
        case 0x03:
        case 0x04:
        case 0x06:
        case 0x05:
        case 0x07:
        case 0x08:
        case 0x09:
            gDebugChapterModeIndex = CHAPTER_MODE_COMMON;
            break;

        case 0x17:
        case 0x18:
        case 0x3E:
        case 0x19:
        case 0x1A:
        case 0x1B:
        case 0x1C:
        case 0x1D:
        case 0x1E:
        case 0x1F:
        case 0x20:
        case 0x21:
        case 0x22:
        case 0x23:
            gDebugChapterModeIndex = CHAPTER_MODE_EPHRAIM;
            break;

        default:
            if (!(gKeyStatusPtr->heldKeys & (R_BUTTON))) {
                gDebugChapterModeIndex = CHAPTER_MODE_EIRIKA;
            } else {
                gDebugChapterModeIndex = CHAPTER_MODE_EPHRAIM;
            }
            break;

        case 0x0A:
        case 0x0B:
        case 0x3D:
        case 0x0C:
        case 0x0D:
        case 0x0E:
        case 0x0F:
        case 0x10:
        case 0x11:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x16:
            gDebugChapterModeIndex = CHAPTER_MODE_EIRIKA;
            break;
    }

    internalNameStr = GetROMChapterStruct(chapterId)->internalName;
    modeStr = strings[gDebugChapterModeIndex];

    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y),     "                    ");
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y + 1), "                    ");
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y),     internalNameStr);
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y + 1), modeStr);

    BG_EnableSyncByMask(1);

    EnablePaletteSync();

    return;
}
