#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "constants/video-global.h"
#include "bmfx.h"
#include "ap.h"
#include "soundwrapper.h"
#include "bmlib.h"

/**
 * Map effect happening when a mine is being set
 */

struct ProcMineFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x41 - 0x29];

    /* 41 */ s16 counter;
};

void ProcMineFxFunc(struct ProcMineFx *proc);

struct ProcCmd CONST_DATA ProcScr_MineFx[] = {
    PROC_SLEEP(0x18),
    PROC_CALL(ProcMineFxFunc),
    PROC_END
};


void ProcMineFxFunc(struct ProcMineFx *proc)
{
    PlaySoundEffect(0x2F9);
}

void StartMineAnim(ProcPtr parent, int x, int y)
{
    x = x * 0x10 - gBmSt.camera.x + 8;
    y = y * 0x10 - gBmSt.camera.y + 4;

    StartTemporaryLock(parent, 0x20);
    Decompress(Img_MineFx, OBJ_CHR_ADDR(OBJCHR_MINEFX));
    ApplyPalette(Pal_MineFx, OBJPAL_MINEFX);
    APProc_Create(SpritAnim_MineFx, x, y, 0x5180, 0, 0);
    Proc_Start(ProcScr_MineFx, parent);
}