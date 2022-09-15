#include "global.h"

#include "hardware.h"
#include "proc.h"

#include "functions.h"
#include "variables.h"

struct gfx_set {
    const void *gfx;
    const void *tsa;
    const void *pal;
};

extern struct CONST_DATA gfx_set gUnknown_0895DD1C[];
extern struct ProcCmd CONST_DATA gUnknown_08591154[]; // proc: gProcFace
extern u16 CONST_DATA gUnknown_085921AC[];
void sub_80081A8(void);
void sub_80067E8(void);
void sub_8010EE8(int, int, int);

void sub_8010DC0(int index)
{
    sub_8010E50();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    CopyDataWithPossibleUncomp(
        gUnknown_0895DD1C[index].gfx,
        (void*)(GetBackgroundTileDataOffset(3) + BG_VRAM));

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_0895DD1C[index].tsa, 0x8000);
    ApplyPalettes(gUnknown_0895DD1C[index].pal, 0x8, 0x8);
    BG_EnableSyncByMask(0x8);
    gPaletteBuffer[0] = 0;
}

void sub_8010E50(void) // function: MapLevelUp_EndFace
{
    sub_80081A8();
    Proc_EndEach(gUnknown_08591154);
    ResetFaces();
    sub_80067E8();
}

u16 sub_8010E6C(s16 x, s16 y, int counter)
{
    u16 tmp_counter0 = counter;
    s16 x0 = - gUnknown_0202BCB0.camera.x + (s16)(x * 0x10);
    s16 y0 = - gUnknown_0202BCB0.camera.y + (s16)(y * 0x10);

    CallARM_PushToSecondaryOAM(
        (x0 + 0x200) & 0x1FF,
        (y0 + 0x100) & 0xFF,
        gUnknown_085921AC,
        0x2822);

    if (tmp_counter0 <= 0xF) {
        sub_8010EE8(0x10, 0x0, tmp_counter0 / 2);
        return tmp_counter0 + 1;
    } else {
        sub_8010EE8(0x0, 0x10, tmp_counter0 / 2 - 0x8);
        if (++tmp_counter0 > 0x1F)
            tmp_counter0 = 0;
        return tmp_counter0;
    }
}

s16 test(int a)
{
    return a * 0x10;
}