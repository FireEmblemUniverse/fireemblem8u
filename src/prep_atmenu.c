#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

void PrepAtMenu_OnInit(struct ProcAtMenu * proc)
{
    PrepSetLatestCharId(0);
    proc->xDiff = 0;
    *((u16*)&proc->yDiff) = 0;    /* ? */

    if (CheckInLinkArena())
        proc->max_counter = 5;
    else
        proc->max_counter = GetChapterAllyUnitCount();

    proc->unk_30 = 0;
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->state = 0;
    proc->do_help = 0;
    proc->end_prep = 0;
    proc->cur_cmd = 0;
    proc->hand_pos = 0;
}

void ResetPrepMenuDescTexts()
{
    int i = 0;
    for (i = 0; i < 5; i++)
        ClearText(&gPrepMainMenuTexts[i + 5]);

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 0xD, 0x6),
        0xF, 0xA, 0);

    BG_EnableSyncByMask(0x4);
}

void ParsePrepMenuDescTexts(int msg)
{
    struct Text *th = &gPrepMainMenuTexts[5];
    const char *str = GetStringFromIndex(msg);

    while (1) {
        if ('\0' == *str)        /* End for fetext */
            return;

        if ('\1' == *str) {      /* '\n' for fetext */
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }
}

void DrawPrepMenuDescTexts()
{
    int i, base_line;

    base_line = CheckInLinkArena() ? 1 : 0;
    for (i = 0; i < 5; i++) {
        PutText(
            &gPrepMainMenuTexts[i + 5],
            TILEMAP_LOCATED(gBG2TilemapBuffer, 0xD, 2 * i - base_line + 7));
    }

    BG_EnableSyncByMask(0x4);
}

void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc)
{
    proc->unk4C = 0;
    ResetPrepMenuDescTexts();
}

void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc)
{
    ParsePrepMenuDescTexts(proc->msg);
}

void PrepMenuDescOnDraw()
{
    DrawPrepMenuDescTexts();
}

void sub_8095C00(int msg, ProcPtr parent)
{
    struct ProcPrepMenuDesc * proc;

    proc = Proc_Find(ProcScr_PrepMenuDescHandler);
    if (proc)
        Proc_End(proc);
    
    proc = Proc_Start(ProcScr_PrepMenuDescHandler, parent);
    proc->msg = msg;
}

void sub_8095C2C(struct ProcAtMenu * proc)
{
    EndSysBlackBoxs();
    EndPrepSpecialCharEffect();
    EndMuralBackground_();
    proc->cur_cmd = GetActivePrepMenuItemIndex();
    EndPrepScreenMenu();
}

void sub_8095C50(int tile, int pal)
{
    /* "Cahpter 0", "Infomaion" */
    Decompress(gUnknown_08A1AC88, OBJ_VRAM0 + tile);
    ApplyPalette(gPal_SupportScreenBanner, pal + 0x10);
}

void AtMenu_Reinitialize(struct ProcAtMenu* proc)
{
    int i;

    SetupBackgrounds(gBgConfig_ItemUseScreen);
    ResetText();
    LoadUiFrameGraphics();
    LoadHelpBoxGfx(NULL, 0xE);
    SetDispEnable(0, 0, 0, 0, 0);
    LoadObjUIGfx();
    ResetUnitSprites();
    
    MakePrepUnitList();
    PrepAutoCapDeployUnits(proc);
    ReorderPlayerUnitsBasedOnDeployment();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    for (i = 0; i < 5; i++)
        InitText(&gPrepMainMenuTexts[i + 5], 0xE);
    for (i = 0; i < 4; i++)
        InitText(&gPrepMainMenuTexts[i + 1], 0x8);
    InitText(&gPrepMainMenuTexts[0], 0xA);

    /* "Preparations" */
    Decompress(gUnknown_08A1A4C8, (void*)0x6014800);
    /* "Menu", "Start" button */
    Decompress(gUnknown_08A1D510, (void*)0x6016000);
    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);
    
    sub_8095C50(0x7000, 0x6);
    ApplyPalette(gUnknown_08A1D4C8, 0x14);
    EnablePaletteSync();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on  = 0;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    InitPrepScreenMainMenu(proc);
    BG_EnableSyncByMask(0xF);
    SetDefaultColorEffects();

    StartPrepSpecialCharEffect(proc);
    RestartMuralBackground();
    ApplyPalettes(gUiFramePaletteB, 0x2, 3);

    if (CheckInLinkArena()) {
        Decompress(gUnknown_08A1B698, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 5), gGenericBuffer, 0x1000);
    } else {
        Decompress(gUnknown_08A1B658, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x10, 2), gGenericBuffer, 0x1000);
        Decompress(gUnknown_08A1B698, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 6), gGenericBuffer, 0x1000);
    }

    Prep_DrawChapterGoal(0x5800, 0xB);
    NewSysBlackBoxHandler(proc);
    SysBlackBoxSetGfx(0x6800);
    proc->unk_35 = GetActivePrepMenuItemIndex();
    ParsePrepMenuDescTexts(sub_8095024());
    DrawPrepMenuDescTexts();
}

void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu * proc)
{
    int i;
    u8 counter;
    struct Unit *unit;

    counter = 0;

    SetDispEnable(0, 0, 0, 0, 0);
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit))
            counter++;
    }

    if (0 == counter) {
        proc->end_prep = TRUE;
        Proc_Goto(proc, 6);
    }
}

void sub_8095F2C(struct ProcAtMenu * proc)
{
    int val = GetActivePrepMenuItemIndex();

    if (proc->unk_35 != val) {
        sub_8095C00(sub_8095024(), proc);
        proc->unk_35 = val;
    }
}

void sub_8095F54(struct ProcAtMenu * proc)
{
    int i, unk2F, tile;

    struct Text *th = &gPrepMainMenuTexts[1];
    int height = sub_80950C4(proc->unk_2F);
    DrawUiFrame2(3, 5, 9, 2 * height + 2, 1);

    i = 0;
    tile = 0x180;
    for (; i < 4; i++) {
        unk2F = proc->unk_2F >> i;

        if (1 & unk2F) {
            ClearText(th);
            PutDrawText(
                th,
                (void*)TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 0) + tile,
                TEXT_COLOR_SYSTEM_WHITE,
                0, 0, GetStringFromIndex(gUnknown_08A196BC[i]));

            th++;
            tile += 0x80;
        }
    }

    BG_EnableSyncByMask(0x3);
}

void CleanupPrepMenuScreen(ProcPtr proc)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 5), 8, 9, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, 5), 8, 9, 0);
    BG_EnableSyncByMask(0x3);
}

void sub_8096004(struct ProcAtMenu * proc)
{
    ShowPrepScreenMenuFrozenHand();
    sub_8095F54(proc);
    ShowSysHandCursor(0x1C, proc->hand_pos * 16 + 0x30, 7, 0x400);
}

void AtMenu_CtrlLoop(struct ProcAtMenu * proc)
{
    const int msg_list[] = {
        0x5B8,
        0x5B9,
        0x5BA,
        0x57F,
    };

    int line_old = proc->hand_pos;

    int xPos = 0x1C;
    int yPos = proc->hand_pos * 16 + 0x30;

    if (proc->do_help) {
        if ((R_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys) {
            CloseHelpBox();
            proc->do_help = 0;
            return;
        }
    } else {
        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            if (2 == sub_8095094(proc->hand_pos, proc->unk_2F))
                CallSomeSoundMaybe(SONG_BONDS, 0x100, 0x100, 0x20, NULL);

            proc->state = 4;
            Proc_Goto(proc, 8);
            return;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            proc->do_help = 1;
           StartHelpBox(xPos, yPos, msg_list[sub_8095094(proc->hand_pos, proc->unk_2F)]);
            return;
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            CleanupPrepMenuScreen(proc);
            Decompress(gUnknown_08A1B658, gGenericBuffer);
            CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x10, 2), gGenericBuffer, 0x1000);
            Decompress(gUnknown_08A1B698, gGenericBuffer);
            CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 6), gGenericBuffer, 0x1000);

            SetPrepScreenMenuPosition(1, 6);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);
            return;
        }
    }

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys) {
        if (proc->hand_pos)
            proc->hand_pos = proc->hand_pos - 1;
        else if (DPAD_UP & gKeyStatusPtr->newKeys) {
            proc->hand_pos = sub_80950C4(proc->unk_2F) - 1;
        }
    }

    if (DPAD_DOWN & gKeyStatusPtr->repeatedKeys) {
        if (proc->hand_pos < (sub_80950C4(proc->unk_2F) - 1))
            proc->hand_pos = proc->hand_pos + 1;
        else if (DPAD_DOWN & gKeyStatusPtr->newKeys)
            proc->hand_pos = 0;
    }

    if (line_old != proc->hand_pos) {
        yPos = proc->hand_pos * 16 + 0x30;

        if (proc->do_help)
            StartHelpBox(xPos, yPos, msg_list[sub_8095094(proc->hand_pos, proc->unk_2F)]);

        ShowSysHandCursor(xPos, yPos, 7, 0x400);
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }
}

void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu * proc)
{
    int i;
    struct Unit *unit;
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!(UNIT_IS_VALID(unit)))
            continue;

        unit->state &= ~US_BIT25;
    }

    proc->end_prep = 1;
}

void AtMenu_ResetScreenEffect(struct ProcAtMenu * proc)
{
    EndMuralBackground_();
    EndPrepSpecialCharEffect();
    SetupBackgrounds(0);
    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    if (proc->end_prep)
        nullsub_20(proc);
}

void AtMenu_ResetBmUiEffect(struct ProcAtMenu * proc)
{
    ReorderPlayerUnitsBasedOnDeployment();

    if (proc->end_prep)
        EndPrepScreen();
    else if (CheckInLinkArena())
        sub_8042EA8();

    sub_801240C();
    ResetUnitSprites();
    RefreshEntityBmMaps();
    RefreshUnitSprites();
}

void AtMenu_StartSubmenu(struct ProcAtMenu * proc)
{
    sub_8095C2C(proc);

    switch (proc->state) {
    case 5:
        StartChapterStatusScreen_FromPrep(proc);
        break;

    case 2: /* Items */
        StartPrepItemScreen(proc);
        break;

    case 1: /* Pick Units */
        Proc_StartBlocking(ProcScr_PrepUnitScreen, proc);
        break;

    case 4: /* Support */
        StartFortuneSubMenu(2, proc);
        break;

    case 3: /* Save */
        StartPrepSaveScreen(proc);
        break;

    default:
        break;
    }

    Proc_Break(proc);
}

void AtMenu_OnSubmenuEnd(struct ProcAtMenu * proc)
{
    if (3 == proc->state)
        StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);

    switch (proc->state) {
    case 4:
        Proc_Goto(proc, 9);
        break;

    case 3:
        Proc_Goto(proc, 7);
        break;

    case 1:
    case 2:
    case 5:
        Proc_Goto(proc, 9);
        break;
    }

    proc->state = 0;
}

void sub_8096404()
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void AtMenu_LockGame()
{
    if (!CheckInLinkArena()) {
        LockGame();
        BMapDispSuspend();
    }
}

void AtMenu_UnlockGame()
{
    if (!CheckInLinkArena()) {
        BMapDispResume();
        UnlockGame();
    }
}

void StartPrepAtMenu()
{
    Proc_Start(ProcScr_AtMenu, PROC_TREE_3);
}

void StartPrepAtMenuWithConfig()
{
    Proc_Start(ProcScr_AtMenu, PROC_TREE_3);
    RemoveSomeUnitItems();
    ResetSioPidPool();
}


/* section.data */

CONST_DATA struct ProcCmd ProcScr_PrepMenuDescHandler[] = {
    PROC_CALL(PrepMenuDescOnInit),
    PROC_SLEEP(0x1),
    PROC_CALL(PrepMenuDescOnParse),
    PROC_YIELD,
    PROC_CALL(PrepMenuDescOnDraw),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_AtMenu[] = {
    PROC_NAME("AtMenu"),
    PROC_CALL(AtMenu_LockGame),
    PROC_CALL(EndPrepAtMenuIfNoUnitAvailable),
    PROC_CALL(PrepAtMenu_OnInit),
    PROC_SLEEP(0x2),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_SLEEP(0x2),
    PROC_CALL_ARG(NewFadeIn, 0x8),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),

PROC_LABEL(0x1),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_REPEAT(sub_8095F2C),
    PROC_GOTO(0x4),

PROC_LABEL(0xC),
    PROC_CALL(sub_8096004),
    PROC_REPEAT(AtMenu_CtrlLoop),
    PROC_GOTO(0x1),

PROC_LABEL(0xD),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL(sub_8096004),
    PROC_CALL_ARG(NewFadeIn, 0x8),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_REPEAT(AtMenu_CtrlLoop),
    PROC_GOTO(0x1),

PROC_LABEL(0x2),
    PROC_REPEAT(AtMenu_StartSubmenu),
    PROC_REPEAT(AtMenu_OnSubmenuEnd),
    PROC_BLOCK,

PROC_LABEL(0xA),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(0x2),

PROC_LABEL(0x9),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(0x1),

PROC_LABEL(0x8),
    PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(0x2),

PROC_LABEL(0x7),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL_ARG(NewFadeIn, 0x8),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(0x1),

PROC_LABEL(0xB),
    PROC_CALL(AtMenuSetUnitStateAndEndFlag),
    PROC_GOTO(0x5),

PROC_LABEL(0x4),
    PROC_CALL(AtMenuSetUnitStateAndEndFlag),
    PROC_SLEEP(0xA),

PROC_LABEL(0x5),
    PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(0x1),

PROC_LABEL(0x6),
    PROC_CALL(AtMenu_ResetScreenEffect),
    PROC_YIELD,
    PROC_CALL(AtMenu_ResetBmUiEffect),
    PROC_YIELD,
    PROC_CALL(EndAllMus),
    PROC_CALL(AtMenu_UnlockGame),
    PROC_CALL(EndAllProcChildren),
    PROC_END
};
