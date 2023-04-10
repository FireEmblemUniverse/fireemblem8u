#include "global.h"

#include "hardware.h"

struct CGDataEnt {
    void** img; // 10 parts
    void* tsa;
    void* pal;
};

extern struct CGDataEnt gCGDataTable[];

//! FE8U = 0x080B65EC
struct CGDataEnt* sub_80B65EC(int unused) {
    return gCGDataTable;
}

//! FE8U = 0x080B65F4
void sub_80B65F4(void) {
    return;
}

void sub_80A4064(void *buf, int val);

//! FE8U = 0x080B65F8
void sub_80B65F8(u16* tm, int offset, int palId, int palCount, int idx) {
    int i;

    struct CGDataEnt* cgEnt = sub_80B65EC(idx);

    for (i = 0; i < 10; i++) {
        Decompress(cgEnt->img[i], (void*)(VRAM + offset + i*0x800));
    }

    // TODO: Seems like this should use the "TILEREF" macro, but the order doesn't match
    CallARM_FillTileRect(tm, cgEnt->tsa, (u16)((palId << 12) + ((u32)(offset << 0x11) >> 0x16)));

    CopyToPaletteBuffer(cgEnt->pal, palId * 0x20, palCount * 0x20);

    if (idx < 0x80) {
        sub_80A4064(NULL, idx);
    }

    return;
}
