#include "global.h"
#include "bmfx.h"
#include "ap.h"
#include "proc.h"
#include "bmlib.h"
#include "bmunit.h"
#include "mapanim.h"
#include "hardware.h"

/**
 * a shinning stone anime effect
 * seems unused
 */

void Eventfx_SetScreenConfig(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
}

void ShinningStonefx_InitGfx(struct ProcShinningStonefx * proc)
{
    PlaySeSpacial(0x8D, proc->x);
    Decompress(Img_MapAnimUnlockObjfx, OBJ_VRAM0 + 0x3800);
    ApplyPalette(Pal_MapAnimUnlockObjfx, 0x14);
    proc->timer = 1;
}

void ShinningStonefx_CreateSpriteAnim(struct ProcShinningStonefx * proc)
{
    if (++proc->timer > 0x1D)
    {
        proc->timer = 0;
        Proc_Break(proc);

        APProc_Create(ApConf_089A6254, proc->x, proc->y, 0x41C0, 0, 2);
        APProc_Create(ApConf_089A6254, proc->x, proc->y, 0x41C0, 1, 2);
    }
}

void ShinningStonefx_Delay(struct ProcShinningStonefx * proc)
{
    if (++proc->timer > 0x1D)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_ShinningStonefx[] = {
    PROC_SLEEP(1),
    PROC_CALL(ShinningStonefx_InitGfx),
    PROC_REPEAT(ShinningStonefx_CreateSpriteAnim),
    PROC_SLEEP(80),
    PROC_REPEAT(ShinningStonefx_Delay),
    PROC_SLEEP(1),
    PROC_CALL(HideUnitUnlockDoor),
    PROC_SLEEP(4),
    PROC_CALL(UnhideUnit),
    PROC_END,
};

void NewShinningStonefx(struct Unit * unit)
{
    s16 x = (u16)unit->xPos;
    s16 y = (u16)unit->yPos;
    struct ProcShinningStonefx * proc;

    proc = Proc_Start(ProcScr_ShinningStonefx, PROC_TREE_3);

    proc->x = SCREEN_TILE_IX(x) + 8;
    proc->y = SCREEN_TILE_IY(y);
}

bool CheckShinningStonefxExists(void)
{
    return Proc_Find(ProcScr_ShinningStonefx) ? 1 : 0;
}
