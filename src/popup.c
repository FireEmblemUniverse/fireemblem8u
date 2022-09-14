#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "functions.h"

struct gfx_set {
    const void *gfx;
    const void *tsa;
    const void *pal;
};

extern struct CONST_DATA gfx_set gUnknown_0895DD1C[];
extern struct ProcCmd CONST_DATA gUnknown_08591154[]; // proc: gProcFace
void sub_80081A8(void);
void sub_80067E8(void);

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

