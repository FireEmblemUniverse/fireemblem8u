#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "constants/video-global.h"
#include "bmio.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"

/**
 * Proc Displaying Chapter Title in the middle of the screen
 */

void ChapterIntroTitle_InitBgImg(struct ChapterIntroFXProc *proc)
{
    switch (gRAMChapterData.chapterIndex) {
    case 22:
    case 35:
        Proc_Goto(proc, 0x3E7);
        return;
        break;

    default:
        break;
    }

    SetupBackgroundForWeatherMaybe();

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0x40, 0xF0, 0x60);

    sub_80895B4(8, 1);
    sub_8089624(0x100, sub_808979C(&gRAMChapterData));
    sub_80896D8(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 9), 1);

    EnablePaletteSync();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetDispEnable(1, 0, 0, 0, 0);
    proc->unk_52 = 0;
}

void ChapterIntroTitle_ResetBg(struct ChapterIntroFXProc *proc)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetDispEnable(0, 0, 1, 1, 1);
}

void ChapterIntroTitle_End(struct ChapterIntroFXProc *proc)
{
    u16 x, y;
    int _x, _y;
    SetupBackgrounds(0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    DisableMapPaletteAnimations();
    UnpackChapterMapGraphics(gRAMChapterData.chapterIndex);
    SetupMapSpritesPalettes();
    LoadObjUIGfx();

    x = sub_8015A40(GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialPosX * 0x10);
    _x = (x + 0xF) & 0x1F0;
    gGameState.camera.x = _x;

    y = sub_8015A6C(GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialPosY * 0x10);
    _y = (y + 0xF) & 0x3F0;
    gGameState.camera.y = _y;

    RefreshEntityBmMaps();
    RenderBmMap();
}
