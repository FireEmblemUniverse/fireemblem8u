#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "ap.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "mapanim.h"
#include "bmlib.h"

void StartManimLevelUp(int actor_id, ProcPtr parent)
{
    struct ManimLevelUpProc * proc;

    proc = Proc_StartBlocking(ProcScr_ManimLevelUp, parent);
    proc->actor_id = actor_id;
}


void InitManimLevelUpWindow(void)
{
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 240, 48);
    SetWin0Layers(0, 0, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);
}

void ClearManimLevelUpWindow(void)
{
    SetWinEnable(0, 0, 0);
}

void ManimLevelUp_InitMainScreen(struct ManimLevelUpProc *proc)
{
    int i;

    ResetTextFont();
    BG_Fill(gBG0TilemapBuffer, 0);
    PutManimLevelUpFrame(proc->actor_id, 1, 1);

    for (i = 0; i < 9; i++)
        PutManimLevelUpStat(proc->actor_id, 1, 1, i, false);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    proc->next_stat_num = 0;
    proc->clock = 0;
    proc->y_scroll_offset = -144;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);

    BG_SetPosition(BG_0, 0, proc->y_scroll_offset);
    BG_SetPosition(BG_1, 0, proc->y_scroll_offset);

    StartFace(0, gManimSt.actor[proc->actor_id].unit->pCharacterData->portraitId,
        184, 32 - proc->y_scroll_offset, 0x1042);

    gFaces[0]->yPos = 32 - proc->y_scroll_offset;

    // TODO: constants
    StartManimLevelUpStatGainLabels(0x200, 3, 1, proc);
}

void ManimLevelUpLabelColor_Init(struct ManimLevelUpLabelColorProc *proc)
{
    proc->clock = 0;
}

void ManimLevelUpLabelColor_Loop(struct ManimLevelUpLabelColorProc *proc)
{
    int new_color_offset;

    u16 *colors = Pal_ManimLevelUpStatGainCycling;

    proc->clock++;

    if ((proc->clock % 4) != 0)
        return;

    new_color_offset = (proc->clock >> 2) & 0xF;

    // TODO: constants
    CopyToPaletteBuffer(colors + new_color_offset + 0x00, (0x10 + proc->pal + 0) * 0x20 + 0x12, 0x20 - 0x12);
    CopyToPaletteBuffer(colors + new_color_offset + 0x20, (0x10 + proc->pal + 1) * 0x20 + 0x12, 0x20 - 0x12);
}

void ManimLevelUp_ScrollIn(struct ManimLevelUpProc *proc)
{
    proc->y_scroll_offset += 8;

    BG_SetPosition(BG_0, 0, proc->y_scroll_offset);
    BG_SetPosition(BG_1, 0, proc->y_scroll_offset);

    // NOTE: this is inconsistent with math in ManimLevelUp_InitMainScreen
    gFaces[0]->yPos = 32 - proc->y_scroll_offset;

    if (proc->y_scroll_offset >= -48)
        Proc_Break(proc);
}

void ManimLevelUp_ScrollOut(struct ManimLevelUpProc *proc)
{
    proc->y_scroll_offset -= 8;

    BG_SetPosition(BG_0, 0, proc->y_scroll_offset);
    BG_SetPosition(BG_1, 0, proc->y_scroll_offset);

    // NOTE: this is inconsistent with math in ManimLevelUp_InitMainScreen
    gFaces[0]->yPos = 32 - proc->y_scroll_offset;

    if (proc->y_scroll_offset <= -144)
        Proc_Break(proc);
}

void ManimLevelUp_PutStatGainLabels(struct ManimLevelUpProc * proc)
{
    int stat_num;

    if (proc->clock != 0) {
        proc->clock--;
        return;
    }

    for (stat_num = proc->next_stat_num; stat_num < 9; stat_num++) {
        if (GetManimLevelUpStatGain(proc->actor_id, stat_num) != 0)
            break;
    }

    if (stat_num >= 9) {
        Proc_Break(proc);
        return;
    }

    PutManimLevelUpStat(proc->actor_id, 1, 1, stat_num, true);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    StartManimLevelUpStatGainLabelAnim(
        gManimLevelUpLabelInfoList[stat_num].x * 8 + 62,
        gManimLevelUpLabelInfoList[stat_num].y * 8 + 23 - proc->y_scroll_offset,
        stat_num, GetManimLevelUpStatGain(proc->actor_id, stat_num));

    if (stat_num == 0) {
        PlaySoundEffect(0x2CD);
    } else {
        PlaySoundEffect(0x76);
    }

    proc->next_stat_num = stat_num + 1;
    proc->clock = 20;
}

void ManimLevelUp_DimBgm(struct ManimLevelUpProc * proc)
{
    StartBgmVolumeChange(0x100, 0x80, 0x10, proc);
}

void ManimLevelUp_StartLevelUpText(struct ManimLevelUpProc * proc)
{
    int ix, iy;
    int x, y;

    Decompress(Img_ManimLevelUpText, OBJ_VRAM0 + 0x1C0 * CHR_SIZE);
    ApplyPalettes(Pal_ManimLevelUp, 0x10 + 3, 3);

    ix = SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2;
    x = ix * 8 + 16;

    iy = SCREEN_TILE_Y(gManimSt.actor[proc->actor_id].unit->yPos) * 2;
    y = iy * 8 - 8;

    if (SCREEN_TILE_Y(gManimSt.actor[proc->actor_id].unit->yPos) * 2 < 4)
        y = y + 32;

    if (SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2 < 4)
        x = 48;

    if (SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2 > 25)
        x = 208;

    APProc_Create(gUnknown_089A5A6C, x, y, OAM2_CHR(0x1C0) + OAM2_PAL(0x3), 0, 2);
    PlaySoundEffect(0x5B);
}

void ManimLevelUp_EndLevelUpText(struct ManimLevelUpProc * proc)
{
    APProc_DeleteAll();
}

void ManimLevelUp_RestoreBgm(struct ManimLevelUpProc * proc)
{
    StartBgmVolumeChange(0x80, 0x100, 0x10, proc);
}

void ManimLevelUp_Clear(struct ManimLevelUpProc * proc)
{
    ResetDialogueScreen();
}

CONST_DATA struct ProcCmd ProcScr_ManimLevelUp[] = {
    PROC_SET_END_CB(ManimLevelUp_Clear),
    PROC_SLEEP(1),
    PROC_CALL(InitManimLevelUpWindow),
    PROC_CALL(ManimLevelUp_DimBgm),
    PROC_YIELD,
    PROC_CALL(ManimLevelUp_StartLevelUpText),
    PROC_SLEEP(70),
    PROC_CALL(ManimLevelUp_EndLevelUpText),
    PROC_SLEEP(1),
    PROC_CALL(ManimLevelUp_RestoreBgm),
    PROC_YIELD,
    PROC_CALL(ManimLevelUp_InitMainScreen),
    PROC_YIELD,
    PROC_REPEAT(ManimLevelUp_ScrollIn),
    PROC_SLEEP(30),
    PROC_REPEAT(ManimLevelUp_PutStatGainLabels),
    PROC_SLEEP(60),
    PROC_CALL(EndManimLevelUpStatGainLabels),
    PROC_SLEEP(1),
    PROC_REPEAT(ManimLevelUp_ScrollOut),
    PROC_CALL(ClearManimLevelUpWindow),
    PROC_CALL(ResetDialogueScreen),
    PROC_SLEEP(4),
    PROC_END,
};
