#include "global.h"
#include "bmlib.h"
#include "hardware.h"

#include "cg.h"

u8* CONST_DATA cg_0_tiles[] = {
    cg_0_part_0_tiles,
    cg_0_part_1_tiles,
    cg_0_part_2_tiles,
    cg_0_part_3_tiles,
    cg_0_part_4_tiles,
    cg_0_part_5_tiles,
    cg_0_part_6_tiles,
    cg_0_part_7_tiles,
    cg_0_part_8_tiles,
    cg_0_part_9_tiles,
};

u8* CONST_DATA cg_1_tiles[] = {
    cg_1_part_0_tiles,
    cg_1_part_1_tiles,
    cg_1_part_2_tiles,
    cg_1_part_3_tiles,
    cg_1_part_4_tiles,
    cg_1_part_5_tiles,
    cg_1_part_6_tiles,
    cg_1_part_7_tiles,
    cg_1_part_8_tiles,
    cg_1_part_9_tiles,
};

u8* CONST_DATA cg_2_tiles[] = {
    cg_2_part_0_tiles,
    cg_2_part_1_tiles,
    cg_2_part_2_tiles,
    cg_2_part_3_tiles,
    cg_2_part_4_tiles,
    cg_2_part_5_tiles,
    cg_2_part_6_tiles,
    cg_2_part_7_tiles,
    cg_2_part_8_tiles,
    cg_2_part_9_tiles,
};

u8* CONST_DATA cg_3_tiles[] = {
    cg_3_part_0_tiles,
    cg_3_part_1_tiles,
    cg_3_part_2_tiles,
    cg_3_part_3_tiles,
    cg_3_part_4_tiles,
    cg_3_part_5_tiles,
    cg_3_part_6_tiles,
    cg_3_part_7_tiles,
    cg_3_part_8_tiles,
    cg_3_part_9_tiles,
};

u8* CONST_DATA cg_4_tiles[] = {
    cg_4_part_0_tiles,
    cg_4_part_1_tiles,
    cg_4_part_2_tiles,
    cg_4_part_3_tiles,
    cg_4_part_4_tiles,
    cg_4_part_5_tiles,
    cg_4_part_6_tiles,
    cg_4_part_7_tiles,
    cg_4_part_8_tiles,
    cg_4_part_9_tiles,
};

u8* CONST_DATA cg_5_tiles[] = {
    cg_5_part_0_tiles,
    cg_5_part_1_tiles,
    cg_5_part_2_tiles,
    cg_5_part_3_tiles,
    cg_5_part_4_tiles,
    cg_5_part_5_tiles,
    cg_5_part_6_tiles,
    cg_5_part_7_tiles,
    cg_5_part_8_tiles,
    cg_5_part_9_tiles,
};

u8* CONST_DATA cg_6_tiles[] = {
    cg_6_part_0_tiles,
    cg_6_part_1_tiles,
    cg_6_part_2_tiles,
    cg_6_part_3_tiles,
    cg_6_part_4_tiles,
    cg_6_part_5_tiles,
    cg_6_part_6_tiles,
    cg_6_part_7_tiles,
    cg_6_part_8_tiles,
    cg_6_part_9_tiles,
};

u8* CONST_DATA cg_7_tiles[] = {
    cg_7_part_0_tiles,
    cg_7_part_1_tiles,
    cg_7_part_2_tiles,
    cg_7_part_3_tiles,
    cg_7_part_4_tiles,
    cg_7_part_5_tiles,
    cg_7_part_6_tiles,
    cg_7_part_7_tiles,
    cg_7_part_8_tiles,
    cg_7_part_9_tiles,
};

u8* CONST_DATA cg_8_tiles[] = {
    cg_8_part_0_tiles,
    cg_8_part_1_tiles,
    cg_8_part_2_tiles,
    cg_8_part_3_tiles,
    cg_8_part_4_tiles,
    cg_8_part_5_tiles,
    cg_8_part_6_tiles,
    cg_8_part_7_tiles,
    cg_8_part_8_tiles,
    cg_8_part_9_tiles,
};

u8* CONST_DATA cg_9_tiles[] = {
    cg_9_part_0_tiles,
    cg_9_part_1_tiles,
    cg_9_part_2_tiles,
    cg_9_part_3_tiles,
    cg_9_part_4_tiles,
    cg_9_part_5_tiles,
    cg_9_part_6_tiles,
    cg_9_part_7_tiles,
    cg_9_part_8_tiles,
    cg_9_part_9_tiles,
};

struct CGDataEnt {
    u8** img; // CG images have 10 parts
    u8* tsa;
    u16* pal;
};

extern u8 cg_0_map[];
extern u8 cg_1_map[];
extern u8 cg_2_map[];
extern u8 cg_3_map[];
extern u8 cg_4_map[];
extern u8 cg_5_map[];
extern u8 cg_6_map[];
extern u8 cg_7_map[];
extern u8 cg_8_map[];
extern u8 cg_9_map[];

extern u16 cg_0_palette[];
extern u16 cg_1_palette[];
extern u16 cg_2_palette[];
extern u16 cg_3_palette[];
extern u16 cg_4_palette[];
extern u16 cg_5_palette[];
extern u16 cg_6_palette[];
extern u16 cg_7_palette[];
extern u16 cg_8_palette[];
extern u16 cg_9_palette[];

struct CGDataEnt CONST_DATA gCGDataTable[] = {
    { cg_0_tiles, cg_0_map, cg_0_palette, },
    { cg_1_tiles, cg_1_map, cg_1_palette, },
    { cg_2_tiles, cg_2_map, cg_2_palette, },
    { cg_3_tiles, cg_3_map, cg_3_palette, },
    { cg_4_tiles, cg_4_map, cg_4_palette, },
    { cg_5_tiles, cg_5_map, cg_5_palette, },
    { cg_6_tiles, cg_6_map, cg_6_palette, },
    { cg_7_tiles, cg_7_map, cg_7_palette, },
    { cg_8_tiles, cg_8_map, cg_8_palette, },
    { cg_9_tiles, cg_9_map, cg_9_palette, },
};

//! FE8U = 0x080B65EC
struct CGDataEnt * GetCG(int unused)
{
#if BUGFIX
    return gCGDataTable + unused;
#else
    return gCGDataTable;
#endif
}

//! FE8U = 0x080B65F4
void sub_80B65F4(void) {
    return;
}

void ModifySaveLinkArenaStruct2B(void *buf, int val);

//! FE8U = 0x080B65F8
void DisplayCGfx(u16 * tm, int offset, int palId, int palCount, int idx)
{
    int i;

    struct CGDataEnt* cgEnt = GetCG(idx);

    for (i = 0; i < 10; i++) {
        Decompress(cgEnt->img[i], (void*)(VRAM + offset + i*0x800));
    }

    // TODO: Seems like this should use the "TILEREF" macro, but the order doesn't match
    CallARM_FillTileRect(tm, cgEnt->tsa, (u16)((palId << 12) + ((u32)(offset << 0x11) >> 0x16)));

    ApplyPalettes(cgEnt->pal, palId, palCount);

    if (idx < 0x80) {
        ModifySaveLinkArenaStruct2B(NULL, idx);
    }
}
