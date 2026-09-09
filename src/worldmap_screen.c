#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

extern u8 gUnk_3[];

extern u8 gUnk_59[];
extern u8 gUnk_60[];
extern u8 gUnk_61;

extern u8 gWorldmapGmap_0[];  // FEB: worldmap_big_image Length:76800
extern u16 gWorldmapGmap_2[]; // FEB: worldmap_big_palette Length:128
extern u16 gWorldmapGmap_3[]; // FEB: worldmap_big_palettemap Length:673

//! FE8U = 0x080BA424
void GMapScreen_OnWorldmapEventUpdate(void)
{
    Sound_StopBgmImmediate();
    MapRoute_0(GM_SCREEN->gmroute);
    GM_SCREEN->gmroute->flags |= 3;
}

//! FE8U = 0x080BA458
u32 GMapScreen_FillBg3TileIndices(void)
{
    int iy;
    int ix;
    u16 unk;
    u16 * bgBuf;

    bgBuf = gBG3TilemapBuffer;
    unk = 0;
    for (iy = 0; iy < 0x20; iy++)
    {
        for (ix = 0; ix < 0x20; ix++)
        {
            *bgBuf = ((unk) | 0x9000);
            unk++;
            bgBuf++;
        }
    }

    // return; BUG?
}

//! FE8U = 0x080BA490
void GMapScreen_LoadTileGfx(struct GmScreenProc * proc)
{
    int i;

    for (i = 0; i < 0x20; i++)
    {
        CpuFastCopy(proc->unk_3c + (i * 0x780), (void*)(0x06008000 + (i * 0x400)), 0x400);
    }

    GMapScreen_FillBg3TileIndices();

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080BA4D0
void GMapScreen_ApplyTilePalettes(struct GmScreenProc * proc)
{
    int x;
    int y;
    u8 * r5;
    u8 * r8;
    int ix;
    int iy;

    u16 * unk_40 = (proc->unk_40);

    u8 * r3 = proc->unk_44;
    r3 += (proc->unk_2e * 0x20) + (proc->unk_2d / 2);

    if ((proc->unk_2d & 1) != 0)
    {
        for (iy = 0; iy < 0x16; r3 = r8, iy++)
        {
            r5 = r3;
            y = (iy + proc->unk_2e) & 0x1f;
            for (ix = 0, r8 = r5 + 0x20; ix < 0x10; ix++)
            {
                x = (ix * 2 + (proc->unk_2d)) & 0x1f;

                *(unk_40 + (y * 0x20) + x) = (*(unk_40 + (y * 0x20) + x) & 0x00000FFF) | ((*(r5)&0xf0) + 0x90) * 0x100;

                r5++;

                *(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) =
                    (*(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) & 0x00000FFF) | (*(r5) + 9) * 0x1000;
            }
        }
    }
    else
    {
        for (iy = 0; iy < 0x16; r3 = r8, iy++)
        {
#ifndef NONMATCHING
            asm("":::"r8");
#endif
            r5 = r3;
            y = (iy + proc->unk_2e) & 0x1f;

            for (ix = 0, r8 = r5 + 0x20; ix < 0x10; ix++)
            {
                x = (ix * 2 + proc->unk_2d) & 0x1f;

                *(unk_40 + (y * 0x20) + x) = (*(unk_40 + (y * 0x20) + x) & 0x00000FFF) | (*r5 + 9) * 0x1000;

                *(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) =
                    (*(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) & 0x00000FFF) | ((*r5 & 0xf0) + 0x90) * 0x100;

                r5++;
            }
        }
    }

    BG_EnableSyncByMask(8);

    return;
}

//! FE8U = 0x080BA61C
void GMScreenVSync_Init(struct GMapScreenVSyncProc * proc)
{
    proc->unk_38 = 0;
    proc->unk_40 = 0;
    return;
}

//! FE8U = 0x080BA628
void GMScreenVSync_Loop(struct GMapScreenVSyncProc * proc)
{
    int i;

    if (proc->unk_38 == 0)
    {
        return;
    }

    for (i = 0; i < proc->unk_38; i++)
    {
        s8 j;

        struct GMapScreenVSyncCopyRequest * ptr = &proc->unk_3c[i];

        int unk_00 = ptr->unk_00 * 8;
        int unk_02 = ptr->unk_02 & 0x1f;
        int size = (ptr->unk_04 * 0x20);

        for (j = 0; j < ptr->unk_05; j++)
        {
            void * vram = (void *)0x06008000 + (unk_02 * 0x20);
            int unk_03 = (ptr->unk_03 + j) & 0x1f;
            int unk_01 = (ptr->unk_01 + j);

            void * src = (proc->unk_2c + (((unk_01 * 0x10) - unk_01)) * 0x80) + (unk_00 * 4);
            void * dst;

            unk_03 = (unk_03 << 9);
            dst = vram + unk_03 + unk_03;

            CpuFastCopy(src, dst, size);
        }
    }

    proc->unk_38 = 0;

    return;
}

//! FE8U = 0x080BA6DC
s8 GMapScreenVSync_AddCopyRequest(struct GMapScreenVSyncProc * proc, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
    struct GMapScreenVSyncCopyRequest * ptr;

    if (proc->unk_38 > 7)
    {
        return 1;
    }

    ptr = &proc->unk_3c[proc->unk_38];

    ptr->unk_00 = arg1;
    ptr->unk_01 = arg2;
    ptr->unk_02 = arg3;
    ptr->unk_03 = arg4;
    ptr->unk_04 = arg5;
    ptr->unk_05 = arg6;

    proc->unk_38++;

    return 0;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GMapScreenVSync[] =
{
    PROC_NAME("GMapScreenVSync"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_CALL(GMScreenVSync_Init),
    PROC_REPEAT(GMScreenVSync_Loop),

    PROC_END,
};

// clang-format on

// Does not appear to be used; FEBuilder labels part of this as free space
u8 CONST_DATA gUnused_WorldmapScreen_0[] =
{
    0x00, 0x00, 0x78, 0x00, 0xF0, 0x00,
    0x2C, 0x01, 0xA4, 0x01, 0x1C, 0x02,
    0x94, 0x02, 0x00, 0x00, 0x00, 0x30,
    0x00, 0x00, 0x00, 0x30, 0x00, 0x00,
    0x00, 0xE0, 0x00, 0x00, 0x00, 0x10,
    0x00, 0x00, 0x00, 0xC6, 0x00, 0x00,
    0x00, 0x98, 0x00, 0x00, 0x00, 0x96,
    0x00, 0x00, 0x00, 0x74, 0x00, 0x00,
    0x00, 0x20, 0x00, 0x00, 0x00, 0xA0,
    0x00, 0x00, 0x00, 0x30, 0x00, 0x00,
    0x00, 0x30, 0x00, 0x00, 0x00, 0xE0,
    0x00, 0x00, 0x00, 0x10, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00,
};

//! FE8U = 0x080BA718
ProcPtr NewMapScreenVSync(u8 * arg0, u16 * arg1, u8 * arg2, void * arg3, void * arg4)
{
    struct GMapScreenVSyncProc * proc;

    proc = Proc_Start(ProcScr_GMapScreenVSync, NULL);
    if (proc == NULL)
    {
        return NULL;
    }

    proc->unk_2c = arg0;
    proc->unk_30 = arg1;
    proc->unk_34 = arg2;
    proc->unk_38 = 0;
    proc->unk_3c = arg3;
    proc->unk_40 = 0;
    proc->unk_44 = arg4;

    return proc;
}

//! FE8U = 0x080BA758
void MapScreen_OnDelete(struct GmScreenProc * proc)
{
    Proc_End(proc->unk_48);
    return;
}

//! FE8U = 0x080BA764
void MapScreen_Init(struct GmScreenProc * proc)
{
    proc->flags_0 = 1;
    proc->unk_2a = 0;
    proc->y = 0;
    proc->x = 0;
    proc->unk_3a = 0;
    proc->unk_38 = 0;

    proc->unk_3c = gWorldmapGmap_0;

    proc->unk_40 = BG_GetMapBuffer(BG_3);

    Decompress(gWorldmapGmap_3, gUnk_3);
    proc->unk_44 = gUnk_3;
    proc->unk_2c = 0;
    proc->unk_2b = 0;
    proc->unk_2e = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;
    proc->unk_2f = 0;
    proc->unk_32 = 0;
    proc->unk_31 = 0;

    ApplyPalettes(gWorldmapGmap_2, 9, 4);
    EnablePaletteSync();

    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_48 =
        NewMapScreenVSync(proc->unk_3c, proc->unk_40, proc->unk_44, gUnk_59, gUnk_60);

    return;
}

//! FE8U = 0x080BA818
void GMapScreenVSync_RequestFullCopy(ProcPtr proc, int a, int b)
{
    int a_ = a % 0x3c;
    int b_ = b % 0x28;

    if (a_ + 0x20 > 0x20)
    {
        int c = 0x20 - a_;
        GMapScreenVSync_AddCopyRequest(proc, a_, b_, a, b, c, 0x16);
        GMapScreenVSync_AddCopyRequest(proc, a_ + c, b_, a + c, b, 0x20 - c, 0x16);
    }
    else
    {
        GMapScreenVSync_AddCopyRequest(proc, a_, b_, a, b, 0x20, 0x16);
    }

    return;
}

//! FE8U = 0x080BA8A0
void GMapScreen_UpdateScroll(struct GmScreenProc * proc)
{
    s16 r4, r5, r6, r9;
    s16 a, iVar6;
    s32 b;

    if (proc->unk_2b != proc->unk_2d)
    {
        GMapScreen_ApplyTilePalettes(proc);

        if (ABS(proc->unk_2d - proc->unk_2b) > 1)
        {
            GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2d > proc->unk_2b)
        {
            r4 = (proc->unk_2d + 0x1e);
            r6 = r4 % 0x3c;
        }
        else
        {
            r6 = proc->unk_2d;
            r4 = r6;
        }

        r5 = (proc->unk_2e % 0x28);

        if (r5 + 0x15 < 0x28)
            r9 = 0x15;
        else
            r9 = 0x28 - r5;

        GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, proc->unk_2e, 1, r9);
        proc->unk_2b = proc->unk_2d;
    }

    if (proc->unk_2c != proc->unk_2e)
    {
        GMapScreen_ApplyTilePalettes(proc);

        if (ABS(proc->unk_2e - proc->unk_2c) > 1)
        {
            GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2e > proc->unk_2c)
        {
            r9 = proc->unk_2e + 0x14;
            r5 = r9 % 0x28;
        }
        else
        {
            r5 = proc->unk_2e;
            r9 = r5;
        }

        b = (proc->unk_2d - (proc->unk_2d / 32) * 32);
        r4 = (s8)b;
        r6 = proc->unk_2d % 0x3c;

        if (r4 < 1)
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, r9, 0x1f, 1);
        else
        {
            s16 tmp;
            iVar6 = (0x20 - r4);
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, r9, iVar6, 1);
            tmp = (0x1f - iVar6);
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6 + iVar6, r5, iVar6 + r4, r9, tmp, 1);
        }
        proc->unk_2c = proc->unk_2e;
    }
}

//! FE8U = 0x080BAB00
void GMapScreen_ResetState(void)
{
    gUnk_61 = 0;
    return;
}

//! FE8U = 0x080BAB0C
void GMapScreen_Loop(struct GmScreenProc * proc)
{
    if (!(proc->flags_0))
    {
        return;
    }

    proc->x = gGMData.xCamera;
    proc->y = gGMData.yCamera;

    if (gGMData.xCamera < 0)
    {
        proc->x = 0;
    }
    else if (gGMData.xCamera > 0xf0)
    {
        proc->x = 0xf0;
    }

    if (proc->y < 0)
    {
        proc->y = 0;
    }

    proc->unk_2d = proc->x / 8;
    proc->unk_2e = proc->y / 8;

    if (proc->unk_2a & 4)
    {
        ApplyPalettes(gWorldmapGmap_2, 9, 4);
        proc->unk_2a &= ~4;
    }

    if (proc->unk_2a & 2)
    {
        GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
        proc->unk_2a &= ~2;
    }

    if (proc->unk_2a & 1)
    {
        GMapScreen_FillBg3TileIndices();
        GMapScreen_ApplyTilePalettes(proc);
        proc->unk_2a &= ~1;
    }

    GMapScreen_UpdateScroll(proc);
    BG_SetPosition(BG_3, proc->x, proc->y);

    proc->unk_38 = proc->x;
    proc->unk_3a = proc->y;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GMapScreen[] =
{
    PROC_NAME("GmapScreen"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(MapScreen_OnDelete),

    PROC_CALL(MapScreen_Init),
    PROC_CALL(GMapScreen_LoadTileGfx),
    PROC_CALL(GMapScreen_ApplyTilePalettes),
    PROC_CALL(GMapScreen_ResetState),

    PROC_REPEAT(GMapScreen_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BABF0
ProcPtr NewMapScreen(ProcPtr parent)
{
    struct GmScreenProc * proc = Proc_Start(ProcScr_GMapScreen, parent);
    proc->gmroute = StartGMapRoute(proc, &gGMData.openPaths, 0x5000, 0xe);
    return proc;
}
