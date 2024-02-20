#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "bmudisp.h"
#include "bmfx.h"
#include "bmlib.h"
#include "soundwrapper.h"

/**
 * map effect for when using the warp event codes
 * NOT the effect used by the warp/rescue staves
 */


/* function declarations */

void ProcEventWrapAnim_Init(struct ProcBmFx *proc);
void ProcEventWrapAnim_Loop(struct ProcBmFx *proc);
void ProcEventWrapAnim_End(struct ProcBmFx *proc);



/* section.data */

CONST_DATA struct VectorBmfx Vectors_EventWarp1[17] = {
    {0x00, 0x00, 0},
    {0x04, 0x00, 0},
    {0x08, 0x00, 0},
    {0x0C, 0x00, 0},
    {0x10, 0x00, 0},
    {0x14, 0x00, 0},
    {0x18, 0x00, 0},
    {0x1C, 0x00, 0},

    {0x00, 0x07, 0},
    {0x04, 0x07, 0},
    {0x08, 0x07, 0},
    {0x0C, 0x07, 0},
    {0x10, 0x07, 0},
    {0x14, 0x07, 0},
    {0x18, 0x07, 0},
    {0x1C, 0x07, 0},
    {0xFF, 0xFF, 0}
};

CONST_DATA struct VectorBmfx Vectors_EventWarp2[17] = {
    {0x1C, 0x07, 0},
    {0x18, 0x07, 0},
    {0x14, 0x07, 0},
    {0x10, 0x07, 0},
    {0x0C, 0x07, 0},
    {0x08, 0x07, 0},
    {0x04, 0x07, 0},
    {0x00, 0x07, 0},

    {0x1C, 0x00, 0},
    {0x18, 0x00, 0},
    {0x14, 0x00, 0},
    {0x10, 0x00, 0},
    {0x0C, 0x00, 0},
    {0x08, 0x00, 0},
    {0x04, 0x00, 0},
    {0x00, 0x00, 0},
    {0xFF, 0xFF, 0}
};

struct ProcCmd CONST_DATA ProcScr_EventWrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(ProcEventWrapAnim_Init),
    PROC_REPEAT(ProcEventWrapAnim_Loop),
    PROC_CALL(ProcEventWrapAnim_End),
    PROC_END
};




/* section.text */

void ProcEventWrapAnim_Init(struct ProcBmFx *proc)
{
    int i;

    Decompress(Img_EventWarp, BG_CHR_ADDR(BGCHR_BMFX_IMG));
    ApplyPalette(Pal_EventWarp, BGPAL_EVENTWARP_IMG);
    Decompress(Tsa_EventWarp, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(BGCHR_BMFX_IMG, BGPAL_EVENTWARP_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_BMFX_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    PlaySoundEffect(0x0B4);

    SetBlendConfig(0x1, 0xA, 0xC, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    SetWinEnable(0, 0, 0);

    proc->counter = 0;
}

void ProcEventWrapAnim_Loop(struct ProcBmFx *proc)
{
    int x, y;

    struct VectorBmfx *pVec = (0 == proc->xPos)
                           ? Vectors_EventWarp1
                           : Vectors_EventWarp2;

    if (0 != proc->yPos && A_BUTTON & gKeyStatusPtr->heldKeys)
        proc->counter++;
    
    proc->counter++;

    x = pVec[proc->counter / 2].x;
    y = pVec[proc->counter / 2].y;

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    if (0x8 == proc->counter)
        RefreshUnitSprites();
    
    TileMap_CopyRect(
        TILEMAP_LOCATED(gUiTmScratchA, x, y),
        gBG0TilemapBuffer, 4, 7);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ProcEventWrapAnim_End(struct ProcBmFx *proc)
{
    PlaySoundEffect(0x0B5);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void StartEventWarpAnim(ProcPtr parent, int x, int y, s8 subcmd, s8 flag)
{
    struct ProcBmFx *proc;
    
    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = subcmd;
    proc->yPos = flag;

    x = x * 0x10 - gBmSt.camera.x - 0x08;
    y = y * 0x10 - gBmSt.camera.y - 0x20;
    BG_SetPosition(0, -x, -y);
}

void StartEventWarpAnim_unused(ProcPtr parent, int xCamera, int yCamera, s8 subcmd)
{
    struct ProcBmFx *proc;
    
    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = subcmd;

    BG_SetPosition(0, -xCamera, -yCamera);
    proc->yPos = 1;
}

int EventWarpAnimExists()
{
    return NULL != Proc_Find(ProcScr_EventWrapAnim);
}
