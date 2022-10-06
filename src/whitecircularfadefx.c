#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmfx.h"

/**
 * Some white circular fade effect proc. Seems unused
 */


struct ProcWhiteCircleFx {
    PROC_HEADER;

    /* 2C */ int xPos;
    /* 30 */ int yPos;

    /* 34 */ u8 _pad_34[0x4C - 0x34];

    /* 4C */ s16 counter;
};

/* function declarations */

void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx *proc);
void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx *proc);



/* section.data */

struct ProcCmd CONST_DATA ProcScr_WhiteCircleFx[] = {
    PROC_REPEAT(ProcWhiteCircleFx_Loop),
    PROC_CALL(ProcWhiteCircleFx_End),
    PROC_END
};



/* section.text */

void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx *proc)
{
    u16 _sqrt;
    int x, y, xTile, yTile, wight;
    int val = 0x40 - proc->counter * 5;

    for (y = 0; y < 0x14; y++) {
        for (x = 0; x < 0x1E; x++) {
            xTile = ABS(proc->xPos - x * 8);
            yTile = ABS(proc->yPos - y * 8);

            _sqrt = Sqrt(xTile * xTile + yTile * yTile);
            wight = _sqrt + val;

            if (wight < 0)
                wight += 3;

            wight = 0xF - (wight >> 2);

            LIMIT_AREA(wight, 0, 0xF);
            
            gBG0TilemapBuffer[TILEMAP_INDEX(x, y)] =
                TILEREF(BGCHR_BMFX_IMG + wight, BGPAL_WHILTECIRCLE_FADE);
        }
    }

    BG_EnableSyncByMask(1);

    proc->counter++;

    if (proc->counter > 0x46)
        Proc_Break(proc);
}

void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx *proc)
{
    SetSpecialColorEffectsParameters(2, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    ClearBg0Bg1();
}

void StartCircularFadeAnim(ProcPtr parent, int x, int y)
{
    int i, j;
    u32 r, b, g;
    struct ProcWhiteCircleFx *proc;
    u32 *cur = BG_CHR_ADDR(BGCHR_BMFX_IMG);
    int val = 0;

    for (i = 0; i < 0x20; i++) {
        for (j = 0; j < 0x8; j++)
            *(cur++) = val;
        val += 0x11111111;
    }

    
    for (i = 0; i < 0x10; i++) {
        r = RGB(i * 2, 0, 0);
        b = RGB(0, 0, i * 2);
        g = RGB(0, i * 2, 0);
        b += g;
        b += r;
        PAL_BG_COLOR(BGPAL_WHILTECIRCLE_FADE, i) = b;
    }

    EnablePaletteSync();
    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);
    BG_SetPosition(0, 0, 0);
    ClearBg0Bg1();
    SetBackgroundTileDataOffset(0, 0);

    proc = Proc_Start(ProcScr_WhiteCircleFx, parent);
    proc->xPos = x;
    proc->yPos = y;
    proc->counter = 0;
}

