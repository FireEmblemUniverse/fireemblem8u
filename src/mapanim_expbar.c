#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "m4a.h"

#include "mapanim.h"

void DrawMAExpBar(int arg0, int arg1, int arg2)
{
    sub_807BA28(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 2,
            arg1 + 1),
        arg2, 0x5225, 2, 0x522F, FALSE);

    sub_807BB40(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 3,
            arg1 + 1),
        99, arg2, 0, gUnknown_089A36C0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ProcMAExpBar_OnDraw(struct MAExpBarProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    // TODO: ApplyTileImages macros?
    // TODO: BM_BGCHR_...?

    RegisterTileGraphics(
        gUnknown_08802D44,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 512 * 0x20,
        13 * 0x20);

    RegisterTileGraphics(
        gUnknown_088030C4,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 525 * 0x20,
        24 * 0x20);

    RegisterTileGraphics(
        gUnknown_088033C4,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 549 * 0x20,
        11 * 0x20);

    ApplyPalette(gUnknown_08803590, BM_BGPAL_BANIM_UNK5);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 6, 8),
        gUnknown_089AD498,
        TILEREF(512, BM_BGPAL_BANIM_UNK5));

    DrawMAExpBar(6, 8, proc->expFrom);
}

void ProcMAExpBar_PlaySound74(void)
{
    PlaySoundEffect(0x74); // TODO: song ids
}

void ProcMAExpBar_OnIncrement(struct MAExpBarProc* proc)
{
    proc->expFrom++;

    if (proc->expFrom >= 100)
        proc->expFrom = 0;

    DrawMAExpBar(6, 8, proc->expFrom);

    if (proc->expFrom == proc->expTo % 100) {
        Proc_Break(proc);
        m4aSongNumStop(0x74); // TODO: song ids
    }
}

void ProcMAExpBar_InitDisplay(struct MAExpBarProc* proc)
{
    proc->timer = 0;

    ProcMAExpBar_FrameAdvance(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void ProcMAExpBar_FrameAdvance(struct MAExpBarProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = 76 - proc->timer;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = 76 + proc->timer;

    proc->timer += 2;

    if (proc->timer > 12) {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}

void ProcMAExpBar_LevelUpIfPossible(struct MAExpBarProc* proc)
{
    if (proc->expTo >= 100)
        DoMapAnimLevelUp(proc->actorId, (struct Proc*) proc);
}

CONST_DATA u16 gUnknown_089A36C0[] = {
    0x006, 0x20D, 0x009, 0x214,
    0x009, 0x214, 0x009, 0x214,
    0x009, 0x214, 0x009, 0x214,
    0x009, 0x214, 0x009, 0x214,
    0x009, 0x214, 0x009, 0x214,
    0x009, 0x214, 0x009, 0x214,
    0x006, 0x21E, 0x000, 0x000
};

CONST_DATA struct ProcCmd gProc_MapAnimExpBar[] = {
    PROC_SET_END_CB(ProcMapInfoBox_OnEnd),
    PROC_SLEEP(0x1),
    PROC_CALL(ProcMAExpBar_OnDraw),
    PROC_CALL(ProcMAExpBar_InitDisplay),
    PROC_REPEAT(ProcMAExpBar_FrameAdvance),
    PROC_SLEEP(0x14),
    PROC_CALL(ProcMAExpBar_PlaySound74),
    PROC_SLEEP(0x2),
    PROC_REPEAT(ProcMAExpBar_OnIncrement),
    PROC_SLEEP(0x14),
    PROC_CALL(ProcMapInfoBox_OnEnd),
    PROC_SLEEP(0x8),
    PROC_CALL(ProcMAExpBar_LevelUpIfPossible),
    PROC_SLEEP(0x1),
    PROC_END
};
