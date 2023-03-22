#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmfx.h"

/**
 * Some sparkle effect that's apparenly calling on dance
 */


/* struct definitions */



/* function declarations */

void ProcDanceAnim_Init(struct ProcBmFx *proc);
void ProcDanceAnim_Loop(struct ProcBmFx *proc);
void ProcDanceAnim_ResetTimer(struct ProcBmFx *proc);
void ProcDanceAnim_Loop_Blend(struct ProcBmFx *proc);



/* section.rodata */

const struct VectorBmfx Vectors_DanceringFx[14] = {
    {0x00, 0x00, 0},

    {0x06, 0x00, 0},
    {0x0C, 0x00, 0},
    {0x12, 0x00, 0},
    {0x18, 0x00, 0},

    {0x00, 0x06, 0},
    {0x06, 0x06, 0},
    {0x0C, 0x06, 0},
    {0x12, 0x06, 0},
    {0x18, 0x06, 0},

    {0x00, 0x0C, 0},
    {0x06, 0x0C, 0},
    {0x0C, 0x0C, 0},

    {0xFF, 0xFF, 0},
};


/* section.data */

struct ProcCmd CONST_DATA ProcScr_DanceringAnim[] = {
    PROC_CALL(ProcDanceAnim_Init),
    PROC_REPEAT(ProcDanceAnim_Loop),
    PROC_SLEEP(0X19),
    PROC_CALL(ProcDanceAnim_ResetTimer),
    PROC_REPEAT(ProcDanceAnim_Loop_Blend),
    PROC_CALL(ProcBmFx_CommonEnd),
    PROC_END
};



/* section.text */

void ProcDanceAnim_Init(struct ProcBmFx *proc)
{
    int i;

    CopyDataWithPossibleUncomp(Img_DanceringFx, BG_CHR_ADDR(BGCHR_BMFX_IMG));
    ApplyPalette(Pal_DanceringFx, BGPAL_DANCERING_IMG);
    CopyDataWithPossibleUncomp(Tsa_DanceringFx, gBmFrameTmap0);

    for (i = 0; i < 0x240; i++)
        gBmFrameTmap0[i] += TILEREF(BGCHR_BMFX_IMG, BGPAL_DANCERING_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_BMFX_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetSpecialColorEffectsParameters(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);
    proc->counter = 0;
}

void ProcDanceAnim_Loop(struct ProcBmFx *proc)
{
    struct VectorBmfx buf[14];
    int x, y;

    memcpy(buf, Vectors_DanceringFx, 0x38);
    proc->counter++;

    x = buf[proc->counter / 2].x;
    y = buf[proc->counter / 2].y;

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    TileMap_CopyRect(TILEMAP_LOCATED(gBmFrameTmap0, x, y), gBG0TilemapBuffer, 6, 6);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ProcDanceAnim_ResetTimer(struct ProcBmFx *proc)
{
    proc->counter = 0x10;
}

void ProcDanceAnim_Loop_Blend(struct ProcBmFx *proc)
{
    SetSpecialColorEffectsParameters(1, proc->counter, 0x10, 0);

    proc->counter--;

    if (proc->counter < 0)
        Proc_Break(proc);
}

void StartDanceringAnim(ProcPtr parent)
{
    if (BATTLE_CONFIG_DANCERING & gBattleStats.config) {
        struct Unit *unit = GetUnit(gActionData.targetIndex);
        int x = unit->xPos;
        int y = unit->yPos;
        
        Proc_StartBlocking(ProcScr_DanceringAnim, parent);

        x = x * 0x10 - gBmSt.camera.x - 0x10;
        y = y * 0x10 - gBmSt.camera.y - 0x10;

        BG_SetPosition(BG_0, -x, -y);
    }
}
