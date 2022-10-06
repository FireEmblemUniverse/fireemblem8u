#ifndef GUARD_BMFX_H
#define GUARD_BMFX_H

#include "global.h"
#include "proc.h"

struct VectorBmfx {
    u8 x;
    u8 y;
    u16 _0;
};

struct ProcBmFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};

void ProcBmFx_CommonEnd(struct ProcBmFx *proc);

void StartPrepUnitSwap(ProcPtr parent, struct Unit *unit, int x_dest, int y_dest);
int PrepUnitSwapProcExits();
void NewPopup2_DropItem(ProcPtr, int);
void NewPopup2_SendItem(ProcPtr, int);
void StartGameOverScreen(ProcPtr parent);
void StartLightRuneAnim(ProcPtr parent, int x, int y);
void StartLightRuneAnim2(ProcPtr parent, int x, int y);
void StartLightRuneAnim3(ProcPtr parent, int x, int y);
void StartDanceringAnim(ProcPtr parent);
void StartEventWarpAnim(ProcPtr parent, int xCamera, int yCamera, s8 xWarp, s8 yWarp);
void StartEventWarpAnim_unused(ProcPtr parent, int xCamera, int yCamera, s8 xWarp);
int EventWarpAnimExists();
void StartEmitStarsAnim(ProcPtr parent, int r1, int r2, int r3, int r4);
void ClearEmitedStars();
void EndEmitStars();
#endif /* GUARD_BMFX_H */
