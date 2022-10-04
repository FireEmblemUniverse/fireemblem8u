#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"

/**
 * It's like a popup but for some reason it's not
*/


/* struct definitions */

struct Popup2Proc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4c */ u16 timer;
};


/* function declarations */

void ProcPopup2_Init(struct Popup2Proc *proc);
void ProcPopup2_Loop(struct Popup2Proc *proc);


/* section.data */

extern struct ProcCmd CONST_DATA ProcScr_Popup2[];


/* section.text */

void ProcPopup2_Init(struct Popup2Proc *proc)
{
    proc->timer = 0xF0;
}

void ProcPopup2_Loop(struct Popup2Proc *proc)
{
    int timer = --proc->timer;

    /* todo */
    if ((timer << 0x10 < 0) || ((A_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys))
        Proc_Break(proc);
}

void StartPopup2WithIcon(ProcPtr parent, int IconIndex, char *str)
{
    int len = GetStringTextWidth(str);
    int x, x_tile, y_tile;

    if (IconIndex >= 0)
        len += 0x10;
    
    len += 0x18;

    x_tile = 0xF0 - len;
    if (x_tile < 0)
        x_tile += 0xF;

    x = x_tile >> 4;

    y_tile = len < 0 ? len + 7 : len;

    DrawUiFrame2(x_tile >> 4, 8, y_tile >> 3, 4, 0);

    if (IconIndex >= 0) {
        ResetIconGraphics_();
        LoadIconPalettes(4);
        DrawIcon(
            TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9),
            IconIndex,
            TILEREF(0, 0x4)); /* todo */
        x += 2;
    }

    Font_ResetAllocation();
    DrawTextInline(NULL, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9), TEXT_COLOR_NORMAL, 0, 0x14, str);
    Proc_StartBlocking(ProcScr_Popup2, parent);
}
