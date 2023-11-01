#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bm.h"

extern u8 gUnknown_08592628[];

void sub_80AE7C4(void *, int, s16, s16, int, int, int, int, ProcPtr);

//! FE8U = 0x08012CE4
void sub_8012CE4(void)
{
    SetSpecialColorEffectsParameters(0, 0, 0x10, 0);
    InitBmBgLayers();
    return;
}

extern struct ProcCmd gUnknown_08592608[];

//! FE8U = 0x08012CFC
void sub_8012CFC(struct Unit * unit, ProcPtr proc)
{
    s16 x;
    s16 y;
    ProcPtr child = Proc_StartBlocking(gUnknown_08592608, proc);

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

    x = (unit->xPos * 0x10 - gBmSt.camera.x - 0x10);
    y = (unit->yPos * 0x10 - gBmSt.camera.y - 0x18);
    sub_80AE7C4(gUnknown_08592628, 2, x, y, 0, 0x2000, 0xf, 0, proc);

    PlaySoundEffect(0x2D6);

    return;
}