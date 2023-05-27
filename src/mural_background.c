#include "global.h"

#include "hardware.h"
#include "bmlib.h"

struct MuralBackgroundProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 offset;
};

//! FE8U = 0x08086B74
void sub_8086B74(struct MuralBackgroundProc* proc) {
    proc->offset = 0;
    return;
}

//! FE8U = 0x08086B7C
void sub_8086B7C(struct MuralBackgroundProc* proc) {
    proc->offset++;
    BG_SetPosition(3, proc->offset / 4, 0);
    REG_BG3HOFS = proc->offset / 4;
    return;
}

struct ProcCmd CONST_DATA ProcScr_SlidingWallBg[] = {
    PROC_CALL(sub_8086B74),
    PROC_REPEAT(sub_8086B7C),

    PROC_END,
};

//! FE8U = 0x08086BB8
ProcPtr sub_8086BB8(ProcPtr parent, void* vram, int pal) {
    int tileref;
    int i;

    u16* tm = gBG3TilemapBuffer;

    if (vram == NULL) {
        vram = ((void*) VRAM) + GetBackgroundTileDataOffset(3);
    }

    if (pal < 0) {
        pal = 0xe;
    }

    if (gBmSt.gameStateBits & BM_FLAG_LINKARENA) {
        CopyToPaletteBuffer(gUnknown_08B1754C, pal * 0x20, 0x40);
    } else {
        CopyToPaletteBuffer(gUnknown_08B1754C, pal * 0x20, 0x40);
    }

    Decompress(Img_CommGameBgScreen, vram);

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + (((pal) & 0xF) << 12);

    for (i = 0; i < 0x280; i++) {
        *tm++ = i + tileref;
    }

    return Proc_Start(ProcScr_SlidingWallBg, parent);
}

//! FE8U = 0x08086C50
ProcPtr sub_8086C50(ProcPtr parent, void* vram, int pal, u8 flag) {
    int tileref;
    int i;
    u16* tm = gBG3TilemapBuffer;

    if (vram == 0) {
        vram = ((void*) VRAM) + GetBackgroundTileDataOffset(3);
    }

    if (pal < 0) {
        pal = 0xe;
    }

    if (flag != 0) {
        CopyToPaletteBuffer(gUnknown_08B1754C, pal * 0x20, 0x40);
    } else {
        CopyToPaletteBuffer(gUnknown_08B1754C, pal * 0x20, 0x40);
    }

    Decompress(Img_CommGameBgScreen, vram);

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + (((pal) & 0xF) << 12);

    for (i = 0; i < 0x280; i++) {
        *tm++ = i + tileref;
    }

    return Proc_Start(ProcScr_SlidingWallBg, parent);
}

//! FE8U = 0x08086CE8
ProcPtr sub_8086CE8(ProcPtr parent, void* vram, int a, int b, int palOffset) {
    int i;
    int tileref;

    u16* tm = gBG3TilemapBuffer;

    if (vram == 0) {
        vram = ((void*) VRAM) + GetBackgroundTileDataOffset(3);
    }

    CopyToPaletteBuffer(gUnknown_08B1754C + palOffset * 0x10, 0x1c0, 0x40);

    Decompress(Img_CommGameBgScreen, vram);

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + 0xe000;

    for (i = 0; i < a * 0x20; i++) {
        *tm++ = i + tileref;
    }

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + 0xf000;

    for (; i < (a + b) * 0x20; i++) {
        *tm++ = i + tileref;
    }

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + 0xe000;

    for (; i < 0x280; i++) {
        *tm++ = i + tileref;
    }

    return Proc_Start(ProcScr_SlidingWallBg, parent);
}

//! FE8U = 0x08086DBC
void EndBG3Slider(void) {
    Proc_EndEach(ProcScr_SlidingWallBg);
    return;
}