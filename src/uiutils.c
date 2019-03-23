#include "global.h"

#include "hardware.h"

extern const u16* gUnknown_085B6440[];
extern const u16* gUnknown_085B6450[];
extern const void* gUnknown_085B6460[];
extern const void* gUnknown_085B6470[];
extern const u16* gUnknown_085B6480[];
extern const u16* gUnknown_085B6430[];

extern int FilterR0ForRawCopy(const void* data);

void LoadOldUIPal(int palId)
{
    if (palId < 0)
        palId = 1; // TODO: CONSTANTS

    CopyToPaletteBuffer(gUnknown_085B6440[gUnknown_0202BCF0.unk41_3], palId * 0x20, 0x20);
}

void LoadNewUIPal(int palId)
{
    if (palId < 0)
        palId = 1; // TODO: CONSTANTS

    CopyToPaletteBuffer(gUnknown_085B6450[gUnknown_0202BCF0.unk41_3], palId * 0x20, 0x20);
}

void LoadOldUIImage(void* dest)
{
    if (dest == NULL)
        dest = (void*) BG_VRAM; // TODO: BETTER CONSTANT TYPING

    CopyDataWithPossibleUncomp(gUnknown_085B6460[gUnknown_0202BCF0.unk41_3], dest);
}

void LoadNewUIImage(void* dest)
{
    if (dest == NULL)
        dest = (void*) BG_VRAM; // TODO: BETTER CONSTANT TYPING

    CopyDataWithPossibleUncomp(gUnknown_085B6470[gUnknown_0202BCF0.unk41_3], dest);
}

void sub_804E138(int palId)
{
    if (palId < 0)
        palId = 6; // TODO: CONSTANTS

    CopyToPaletteBuffer(gUnknown_085B6480[gUnknown_0202BCF0.unk41_3], palId * 0x20, 0x20);
}

void sub_804E168(int id)
{
    int bufSize;
    s8* bufAddr;

    if (id < 0)
        id = gUnknown_0202BCF0.unk41_3;

    bufSize = FilterR0ForRawCopy(gUnknown_085B6470[id]);
    bufAddr = gUnknown_02022288 - bufSize;

    CopyDataWithPossibleUncomp(gUnknown_085B6470[id], bufAddr);
    RegisterTileGraphics(bufAddr, (void*) BG_VRAM, bufSize);

    LoadNewUIPal(-1);
}

void WriteUIWindowTileMap(u16* tilemap, int x, int y, int width, int height, int tilebase, int style)
{
    const u16* model = gUnknown_085B6430[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    for (iy = y + 1; iy < yMax; iy += 2)
    {
        for (ix = x + 1; ix < xMax; ix += 2)
        {
            u16 tilemapOffset = ix + iy*0x20;

            *TILEMAP_LOCATED(tilemap + tilemapOffset, 0, 0) = model[6]  + tilebase; // center tile
            *TILEMAP_LOCATED(tilemap + tilemapOffset, 1, 0) = model[6]  + tilebase; // center tile
            *TILEMAP_LOCATED(tilemap + tilemapOffset, 0, 1) = model[9]  + tilebase; // bottom center tile (0, 0)
            *TILEMAP_LOCATED(tilemap + tilemapOffset, 1, 1) = model[10] + tilebase; // bottom center tile (1, 0)
        }

        *TILEMAP_LOCATED(tilemap, x,    iy+0) = model[8]  + tilebase; // left center tile
        *TILEMAP_LOCATED(tilemap, xMax, iy+0) = model[7]  + tilebase; // right center tile 0
        *TILEMAP_LOCATED(tilemap, x,    iy+1) = model[8]  + tilebase; // left center tile
        *TILEMAP_LOCATED(tilemap, xMax, iy+1) = model[11] + tilebase; // right center tile 1
    }

    for (ix = x + 1; ix < xMax; ix += 2)
    {
        *TILEMAP_LOCATED(tilemap, ix+0, y)    = model[2]  + tilebase; // top center tile
        *TILEMAP_LOCATED(tilemap, ix+1, y)    = model[2]  + tilebase; // top centertile
        *TILEMAP_LOCATED(tilemap, ix+0, yMax) = model[13] + tilebase; // bottom center tile (0, 1)
        *TILEMAP_LOCATED(tilemap, ix+1, yMax) = model[14] + tilebase; // bottom center tile (1, 1)
    }

    *TILEMAP_LOCATED(tilemap, x+0, y+0) = model[0] + tilebase; // top left tile (0, 0)
    *TILEMAP_LOCATED(tilemap, x+1, y+0) = model[1] + tilebase; // top left tile (1, 0)
    *TILEMAP_LOCATED(tilemap, x+0, y+1) = model[4] + tilebase; // top left tile (0, 1)
    *TILEMAP_LOCATED(tilemap, x+1, y+1) = model[5] + tilebase; // top left tile (1, 1)

    *TILEMAP_LOCATED(tilemap, xMax, y) = model[3] + tilebase; // top right tile

    *TILEMAP_LOCATED(tilemap, x, yMax) = model[12] + tilebase; // bottom left tile

    *TILEMAP_LOCATED(tilemap, xMax, yMax) = model[15] + tilebase; // bottom right tile
}

#ifdef NONMATCHING

void ClearTileMapRect(u16* tilemap, int x, int y, int width, int height)
{
    int i;

    width *= 2;
    tilemap += y*0x20 + x;

    for (i = 0; i < height; ++i)
    {
        CpuFill16(0, tilemap + i*0x20, width);
    }
}

#else // NONMATCHING

__attribute__((naked))
void ClearTileMapRect(u16* tilemap, int x, int y, int width, int height)
{
    // Can't get the "adds r5, r0, #0" (mov r5, r0) to de done before "ldr r0, [sp, #0x20]" (it loads in r4 instead)
    // :/

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #4\n\
        adds r5, r0, #0\n\
        ldr r0, [sp, #0x20]\n\
        lsls r3, r3, #1\n\
        lsls r2, r2, #5\n\
        adds r2, r2, r1\n\
        lsls r2, r2, #1\n\
        adds r5, r5, r2\n\
        cmp r0, #0\n\
        ble _0804E35A\n\
        mov r7, sp\n\
        adds r4, r0, #0\n\
        movs r0, #0\n\
        mov r9, r0\n\
        lsls r0, r3, #0xa\n\
        lsrs r6, r0, #0xb\n\
        movs r0, #0x80\n\
        lsls r0, r0, #0x11\n\
        mov r8, r0\n\
    _0804E342:\n\
        mov r0, r9\n\
        strh r0, [r7]\n\
        mov r0, sp\n\
        adds r1, r5, #0\n\
        mov r2, r8\n\
        orrs r2, r6\n\
        bl CpuSet\n\
        adds r5, #0x40\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bne _0804E342\n\
    _0804E35A:\n\
        add sp, #4\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING
