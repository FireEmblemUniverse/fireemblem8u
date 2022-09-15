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
extern u16 CONST_DATA gUnknown_085A7EE8[];
void sub_80081A8(void);
void sub_80067E8(void);
void sub_8010EE8(int, int, int);
void sub_807132C(void* ptr, int, int, int);

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
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    gPaletteBuffer[0] = 0;
}

void sub_8010E50(void) // function: MapLevelUp_EndFace
{
    sub_80081A8();
    Proc_EndEach(gUnknown_08591154);
    ResetFaces();
    sub_80067E8();
}

u16 sub_8010E6C(s16 x, s16 y, s16 counter)
{
    /**
     * I think there maybe a better compile method to handle (x << 0x14) >> 0x10.
     * For now, (x * 0x10) outputs (x << 0x10) >> 0x0C in trouble.
     */
    u16 tmp_counter0 = counter;
    s16 tmp_x = - gUnknown_0202BCB0.camera.x + ((x << 0x14)>>0x10);
    s16 tmp_y = - gUnknown_0202BCB0.camera.y + ((y << 0x14)>>0x10);

    CallARM_PushToSecondaryOAM(
        (tmp_x + 0x200) & 0x1FF,
        (tmp_y + 0x100) & 0xFF,
        gUnknown_085921AC,
        0x2822);

    if (tmp_counter0 <= 0xF) {
        sub_8010EE8(0x10, 0x0, tmp_counter0 / 2);
        tmp_counter0++;
    }
    else {
        sub_8010EE8(0x0, 0x10, tmp_counter0 / 2 - 0x8);
        tmp_counter0++;

        if (tmp_counter0 > 0x1F)
            tmp_counter0 = 0;
    }

    return tmp_counter0;
}

void sub_8010EE8(int val0, int val1, int val2)
{
    int var = sub_8012DCC(1, val0, val1, val2, 8);
    CpuFastCopy(gUnknown_085A7EE8, &gPaletteBuffer[0x12 * 0x10], 0x20);
    sub_807132C(gPaletteBuffer, 0x12, 1, var);
    EnablePaletteSync();
}