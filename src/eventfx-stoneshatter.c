#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bm.h"
#include "sysutil.h"

//! FE8U = 0x08012CE4
void StoneShatterEvent_OnEnd(void)
{
    SetBlendConfig(0, 0, 0x10, 0);
    InitBmBgLayers();
}

struct ProcCmd CONST_DATA gProcScr_StoneShatterEvent[] =
{
    PROC_YIELD,
    PROC_SET_END_CB(StoneShatterEvent_OnEnd),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_END,
};

struct BmBgxConf CONST_DATA BmBgxConf_StoneShatter[] =
{
    { BMFX_CONFT_PAL,  gPal_StoneShatterAnim,           1, 0 },
    { BMFX_CONFT_ZIMG, gImg_StoneShatterAnim,      0x1000, 1 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1900,      0, 1 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C194C,      0, 1 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1998,      0, 1 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C19E4,      0, 2 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1A30,      0, 3 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1A7C,      0, 3 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1AC8,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1B14,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1B60,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1BAC,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1BF8,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1C44,      0, 4 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1C90,      0, 2 },
    { BMFX_CONFT_TSA,  gTsa_StoneShatter_081C1CDC,      0, 2 },
    { BMFX_CONFT_END,  NULL,                            0, 0 },
};

// clang-format on

//! FE8U = 0x08012CFC
void StartStoneShatterAnim(struct Unit * unit, ProcPtr proc)
{
    s16 x;
    s16 y;

    ProcPtr child = Proc_StartBlocking(gProcScr_StoneShatterEvent, proc);

    do
    {
        proc = child;
    } while (0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendAlpha(0x10, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    x = (unit->xPos * 16 - gBmSt.camera.x - 16);
    y = (unit->yPos * 16 - gBmSt.camera.y - 24);
    StartBmBgfx(BmBgxConf_StoneShatter, BG_2, x, y, 0, 0x2000, 0xf, NULL, proc);

    PlaySoundEffect(0x2D6);
}
