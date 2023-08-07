#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

extern u8 gUnknown_020087A0[];

extern u8 gUnknown_03001DA8[];
extern u8 gUnknown_03001DE8[];
extern u8 gUnknown_03001E30;

extern u8 gUnknown_08A83364[];  // FEB: worldmap_big_image Length:76800
extern u16 gUnknown_08A95FE4[]; // FEB: worldmap_big_palette Length:128
extern u16 gUnknown_08A96064[]; // FEB: worldmap_big_palettemap Length:673

//! FE8U = 0x080BA424
void sub_80BA424(void)
{
    sub_8002AC8();

    MapRoute_80BC2DC(((struct WorldMapMainProc *)(Proc_Find(gProcScr_WorldMapMain)))->unk_44->unk_4c);

    ((struct WorldMapMainProc *)(Proc_Find(gProcScr_WorldMapMain)))->unk_44->unk_4c->flags |= 3;

    return;
}

//! FE8U = 0x080BA458
u32 sub_80BA458(void)
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
void sub_80BA490(struct GMapScreenVSyncProc * proc)
{
    int i;

    for (i = 0; i < 0x20; i++)
    {
        CpuFastCopy(proc->unk_3c + (i * 0xf0), (void *)(0x06008000 + (i * 0x400)), 0x400);
    }

    sub_80BA458();

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/7LGW6 */

//! FE8U = 0x080BA4D0
void sub_80BA4D0(struct GmScreenProc * proc)
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

#else

__attribute__((naked))
void sub_80BA4D0(struct GmScreenProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #8\n\
        ldr r1, [r0, #0x40]\n\
        str r1, [sp]\n\
        ldr r3, [r0, #0x44]\n\
        adds r5, r0, #0\n\
        adds r5, #0x2e\n\
        movs r2, #0\n\
        ldrsb r2, [r5, r2]\n\
        lsls r2, r2, #5\n\
        adds r4, r0, #0\n\
        adds r4, #0x2d\n\
        movs r0, #0\n\
        ldrsb r0, [r4, r0]\n\
        lsrs r1, r0, #0x1f\n\
        adds r0, r0, r1\n\
        asrs r0, r0, #1\n\
        adds r2, r2, r0\n\
        adds r3, r3, r2\n\
        ldrb r1, [r4]\n\
        movs r0, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080BA588\n\
        movs r1, #0\n\
        str r5, [sp, #4]\n\
        mov sl, r4\n\
        movs r2, #0x1f\n\
        mov r9, r2\n\
    _080BA512:\n\
        adds r5, r3, #0\n\
        ldr r2, [sp, #4]\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        adds r0, r1, r0\n\
        mov r2, r9\n\
        ands r0, r2\n\
        movs r6, #0\n\
        movs r2, #0x20\n\
        adds r2, r2, r5\n\
        mov r8, r2\n\
        adds r1, #1\n\
        mov ip, r1\n\
        lsls r0, r0, #6\n\
        ldr r1, [sp]\n\
        adds r7, r0, r1\n\
    _080BA532:\n\
        lsls r1, r6, #1\n\
        mov r2, sl\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        adds r4, r1, r0\n\
        mov r0, r9\n\
        ands r4, r0\n\
        lsls r3, r4, #1\n\
        adds r3, r3, r7\n\
        ldrh r0, [r3]\n\
        ldr r1, _080BA584  @ 0x00000FFF\n\
        ands r1, r0\n\
        ldrb r2, [r5]\n\
        movs r0, #0xf0\n\
        ands r0, r2\n\
        adds r0, #0x90\n\
        lsls r0, r0, #8\n\
        orrs r1, r0\n\
        strh r1, [r3]\n\
        adds r5, #1\n\
        adds r2, r4, #1\n\
        mov r1, r9\n\
        ands r2, r1\n\
        lsls r2, r2, #1\n\
        adds r2, r2, r7\n\
        ldrh r0, [r2]\n\
        ldr r1, _080BA584  @ 0x00000FFF\n\
        ands r1, r0\n\
        ldrb r0, [r5]\n\
        adds r0, #9\n\
        lsls r0, r0, #0xc\n\
        orrs r1, r0\n\
        strh r1, [r2]\n\
        adds r6, #1\n\
        cmp r6, #0xf\n\
        ble _080BA532\n\
        mov r3, r8\n\
        mov r1, ip\n\
        cmp r1, #0x15\n\
        ble _080BA512\n\
        b _080BA602\n\
        .align 2, 0\n\
    _080BA584: .4byte 0x00000FFF\n\
    _080BA588:\n\
        movs r1, #0\n\
        str r5, [sp, #4]\n\
        mov sl, r4\n\
        movs r2, #0x1f\n\
        mov r9, r2\n\
    _080BA592:\n\
        adds r5, r3, #0\n\
        ldr r2, [sp, #4]\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        adds r0, r1, r0\n\
        mov r2, r9\n\
        ands r0, r2\n\
        movs r6, #0\n\
        movs r2, #0x20\n\
        adds r2, r2, r5\n\
        mov r8, r2\n\
        adds r1, #1\n\
        mov ip, r1\n\
        lsls r0, r0, #6\n\
        ldr r1, [sp]\n\
        adds r7, r0, r1\n\
    _080BA5B2:\n\
        lsls r1, r6, #1\n\
        mov r2, sl\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        adds r4, r1, r0\n\
        mov r0, r9\n\
        ands r4, r0\n\
        lsls r2, r4, #1\n\
        adds r2, r2, r7\n\
        ldrh r0, [r2]\n\
        ldr r1, _080BA618  @ 0x00000FFF\n\
        ands r1, r0\n\
        ldrb r0, [r5]\n\
        adds r0, #9\n\
        lsls r0, r0, #0xc\n\
        orrs r1, r0\n\
        strh r1, [r2]\n\
        adds r2, r4, #1\n\
        mov r1, r9\n\
        ands r2, r1\n\
        lsls r2, r2, #1\n\
        adds r2, r2, r7\n\
        ldrh r0, [r2]\n\
        ldr r1, _080BA618  @ 0x00000FFF\n\
        ands r1, r0\n\
        ldrb r3, [r5]\n\
        movs r0, #0xf0\n\
        ands r0, r3\n\
        adds r0, #0x90\n\
        lsls r0, r0, #8\n\
        orrs r1, r0\n\
        strh r1, [r2]\n\
        adds r5, #1\n\
        adds r6, #1\n\
        cmp r6, #0xf\n\
        ble _080BA5B2\n\
        mov r3, r8\n\
        mov r1, ip\n\
        cmp r1, #0x15\n\
        ble _080BA592\n\
    _080BA602:\n\
        movs r0, #8\n\
        bl BG_EnableSyncByMask\n\
        add sp, #8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080BA618: .4byte 0x00000FFF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080BA61C
void sub_80BA61C(struct GMapScreenVSyncProc * proc)
{
    proc->unk_38 = 0;
    proc->unk_40 = 0;
    return;
}

//! FE8U = 0x080BA628
void sub_80BA628(struct GMapScreenVSyncProc * proc)
{
    int i;

    if (proc->unk_38 == 0)
    {
        return;
    }

    for (i = 0; i < proc->unk_38; i++)
    {
        s8 j;

        struct Unknown_3001DA8 * ptr = &proc->unk_3c[i];

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
s8 sub_80BA6DC(
    struct GMapScreenVSyncProc * proc, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
    struct Unknown_3001DA8 * ptr;

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

extern struct ProcCmd gUnknown_08A3DDF4[];

//! FE8U = 0x080BA718
ProcPtr NewMapScreenVSynce(u8 * arg0, u16 * arg1, u8 * arg2, void * arg3, void * arg4)
{
    struct GMapScreenVSyncProc * proc;

    proc = Proc_Start(gUnknown_08A3DDF4, NULL);
    if (proc == 0)
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
    proc->unk_29_0 = 1;
    proc->unk_2a = 0;
    proc->unk_36 = 0;
    proc->unk_34 = 0;
    proc->unk_3a = 0;
    proc->unk_38 = 0;

    proc->unk_3c = gUnknown_08A83364;

    proc->unk_40 = BG_GetMapBuffer(BG_3);

    Decompress(gUnknown_08A96064, gUnknown_020087A0);
    proc->unk_44 = gUnknown_020087A0;
    proc->unk_2c = 0;
    proc->unk_2b = 0;
    proc->unk_2e = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;
    proc->unk_2f = 0;
    proc->unk_32 = 0;
    proc->unk_31 = 0;

    ApplyPalettes(gUnknown_08A95FE4, 9, 4);
    EnablePaletteSync();

    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_48 =
        NewMapScreenVSynce(proc->unk_3c, proc->unk_40, proc->unk_44, gUnknown_03001DA8, gUnknown_03001DE8);

    return;
}

//! FE8U = 0x080BA818
void sub_80BA818(ProcPtr proc, int a, int b)
{
    int a_ = a % 0x3c;
    int b_ = b % 0x28;

    if (a_ + 0x20 > 0x20)
    {
        int c = 0x20 - a_;
        sub_80BA6DC(proc, a_, b_, a, b, c, 0x16);
        sub_80BA6DC(proc, a_ + c, b_, a + c, b, 0x20 - c, 0x16);
    }
    else
    {
        sub_80BA6DC(proc, a_, b_, a, b, 0x20, 0x16);
    }

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/kdWSC */

//! FE8U = 0x080BA8A0
void sub_80BA8A0(struct GmScreenProc * proc)
{
    if (proc->unk_2b != proc->unk_2d)
    {
        s16 x1, y1;
        s16 x2, y2;
        s16 r9;
        sub_80BA4D0(proc);

        if (ABS(proc->unk_2d - proc->unk_2b) > 1)
        {
            sub_80BA818(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2d > proc->unk_2b)
        {
            x1 = (proc->unk_2d + 0x1e);
            x2 = x1 % 0x3c;
        }
        else
        {
            x1 = proc->unk_2b;
            x2 = x1;
        }

        y1 = (proc->unk_2e % 0x28);

        if (y1 + 0x15 < 0x28)
        {
            r9 = 0x15;
        }
        else
        {
            r9 = 0x28 - y1;
        }

        sub_80BA6DC(proc->unk_48, x1, y1, x2, proc->unk_2e, 1, r9);
        proc->unk_2b = proc->unk_2d;
    }

    if (proc->unk_2c != proc->unk_2e)
    {
        s16 x1, y1;
        s16 x2, y2;
        s16 a;
        s8 b;
        s16 iVar6;
        sub_80BA4D0(proc);

        if (ABS(proc->unk_2e - proc->unk_2c) > 1)
        {
            sub_80BA818(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2e > proc->unk_2c)
        {
            x1 = proc->unk_2e + 0x14;
            x2 = x1 % 0x28;
        }
        else
        {
            x1 = proc->unk_2e;
            x2 = x1;
        }

        b = (proc->unk_2d - (proc->unk_2d / 32) * 32);
        y1 = b;
        y2 = proc->unk_2d % 0x3c;

        if (y1 < 1)
        {
            sub_80BA6DC(proc->unk_48, y2, x1, y1, x2, 0x1f, 1);
        }
        else
        {
            s16 tmp;
            iVar6 = (0x20 - y1);
            sub_80BA6DC(proc->unk_48, y2, x1, y1, x2, iVar6, 1);
            tmp = (0x1f - iVar6);
            sub_80BA6DC(proc->unk_48, y2 + iVar6, x1, iVar6 + y1, x2, tmp, 1);
        }
        proc->unk_2c = proc->unk_2e;
    }
}

#else

__attribute__((naked))
void sub_80BA8A0(struct GmScreenProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x14\n\
        adds r7, r0, #0\n\
        adds r5, r7, #0\n\
        adds r5, #0x2b\n\
        adds r4, r7, #0\n\
        adds r4, #0x2d\n\
        movs r1, #0\n\
        ldrsb r1, [r5, r1]\n\
        movs r0, #0\n\
        ldrsb r0, [r4, r0]\n\
        cmp r1, r0\n\
        beq _080BA9A6\n\
        adds r0, r7, #0\n\
        bl sub_80BA4D0\n\
        movs r2, #0\n\
        ldrsb r2, [r4, r2]\n\
        movs r0, #0\n\
        ldrsb r0, [r5, r0]\n\
        subs r1, r2, r0\n\
        cmp r1, #0\n\
        blt _080BA8DC\n\
        cmp r1, #1\n\
        bgt _080BA8E2\n\
        b _080BA90A\n\
    _080BA8DC:\n\
        subs r0, r0, r2\n\
        cmp r0, #1\n\
        ble _080BA90A\n\
    _080BA8E2:\n\
        ldr r0, [r7, #0x48]\n\
        adds r4, r7, #0\n\
        adds r4, #0x2d\n\
        movs r1, #0\n\
        ldrsb r1, [r4, r1]\n\
        adds r5, r7, #0\n\
        adds r5, #0x2e\n\
        movs r2, #0\n\
        ldrsb r2, [r5, r2]\n\
        bl sub_80BA818\n\
        ldrb r0, [r4]\n\
        adds r1, r7, #0\n\
        adds r1, #0x2b\n\
        strb r0, [r1]\n\
        ldrb r1, [r5]\n\
        adds r0, r7, #0\n\
        adds r0, #0x2c\n\
        strb r1, [r0]\n\
        b _080BAAEE\n\
    _080BA90A:\n\
        adds r2, r7, #0\n\
        adds r2, #0x2d\n\
        adds r0, r7, #0\n\
        adds r0, #0x2b\n\
        movs r3, #0\n\
        ldrsb r3, [r2, r3]\n\
        movs r1, #0\n\
        ldrsb r1, [r0, r1]\n\
        mov sl, r0\n\
        mov r8, r2\n\
        cmp r3, r1\n\
        ble _080BA938\n\
        adds r0, r3, #0\n\
        adds r0, #0x1e\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        movs r1, #0x3c\n\
        bl __modsi3\n\
        lsls r0, r0, #0x10\n\
        lsrs r6, r0, #0x10\n\
        b _080BA944\n\
    _080BA938:\n\
        mov r1, r8\n\
        movs r0, #0\n\
        ldrsb r0, [r1, r0]\n\
        lsls r0, r0, #0x10\n\
        lsrs r6, r0, #0x10\n\
        adds r4, r6, #0\n\
    _080BA944:\n\
        adds r0, r7, #0\n\
        adds r0, #0x2e\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        movs r1, #0x28\n\
        bl __modsi3\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #8\n\
        lsrs r5, r0, #0x10\n\
        asrs r1, r0, #0x10\n\
        adds r0, r1, #0\n\
        adds r0, #0x15\n\
        cmp r0, #0x27\n\
        bgt _080BA96A\n\
        movs r2, #0x15\n\
        mov r9, r2\n\
        b _080BA974\n\
    _080BA96A:\n\
        movs r0, #0x28\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r9, r0\n\
    _080BA974:\n\
        ldr r0, [r7, #0x48]\n\
        lsls r1, r6, #0x10\n\
        asrs r1, r1, #0x10\n\
        lsls r2, r5, #0x10\n\
        asrs r2, r2, #0x10\n\
        lsls r3, r4, #0x10\n\
        asrs r3, r3, #0x10\n\
        adds r4, r7, #0\n\
        adds r4, #0x2e\n\
        ldrb r4, [r4]\n\
        lsls r4, r4, #0x18\n\
        asrs r4, r4, #0x18\n\
        str r4, [sp]\n\
        movs r4, #1\n\
        str r4, [sp, #4]\n\
        mov r5, r9\n\
        lsls r4, r5, #0x10\n\
        asrs r4, r4, #0x10\n\
        str r4, [sp, #8]\n\
        bl sub_80BA6DC\n\
        mov r1, r8\n\
        ldrb r0, [r1]\n\
        mov r2, sl\n\
        strb r0, [r2]\n\
    _080BA9A6:\n\
        adds r2, r7, #0\n\
        adds r2, #0x2c\n\
        adds r0, r7, #0\n\
        adds r0, #0x2e\n\
        movs r3, #0\n\
        ldrsb r3, [r2, r3]\n\
        movs r1, #0\n\
        ldrsb r1, [r0, r1]\n\
        str r0, [sp, #0x10]\n\
        str r2, [sp, #0xc]\n\
        cmp r3, r1\n\
        bne _080BA9C0\n\
        b _080BAAEE\n\
    _080BA9C0:\n\
        adds r0, r7, #0\n\
        bl sub_80BA4D0\n\
        ldr r3, [sp, #0x10]\n\
        movs r2, #0\n\
        ldrsb r2, [r3, r2]\n\
        ldr r4, [sp, #0xc]\n\
        movs r0, #0\n\
        ldrsb r0, [r4, r0]\n\
        subs r1, r2, r0\n\
        cmp r1, #0\n\
        blt _080BA9DE\n\
        cmp r1, #1\n\
        bgt _080BA9E4\n\
        b _080BAA08\n\
    _080BA9DE:\n\
        subs r0, r0, r2\n\
        cmp r0, #1\n\
        ble _080BAA08\n\
    _080BA9E4:\n\
        ldr r0, [r7, #0x48]\n\
        adds r4, r7, #0\n\
        adds r4, #0x2d\n\
        movs r1, #0\n\
        ldrsb r1, [r4, r1]\n\
        ldr r5, [sp, #0x10]\n\
        movs r2, #0\n\
        ldrsb r2, [r5, r2]\n\
        bl sub_80BA818\n\
        ldrb r1, [r4]\n\
        adds r0, r7, #0\n\
        adds r0, #0x2b\n\
        strb r1, [r0]\n\
        ldrb r0, [r5]\n\
        ldr r1, [sp, #0xc]\n\
        strb r0, [r1]\n\
        b _080BAAEE\n\
    _080BAA08:\n\
        ldr r2, [sp, #0x10]\n\
        movs r1, #0\n\
        ldrsb r1, [r2, r1]\n\
        ldr r3, [sp, #0xc]\n\
        movs r0, #0\n\
        ldrsb r0, [r3, r0]\n\
        cmp r1, r0\n\
        ble _080BAA30\n\
        adds r0, r1, #0\n\
        adds r0, #0x14\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        mov r9, r4\n\
        asrs r0, r0, #0x10\n\
        movs r1, #0x28\n\
        bl __modsi3\n\
        lsls r0, r0, #0x10\n\
        lsrs r5, r0, #0x10\n\
        b _080BAA3C\n\
    _080BAA30:\n\
        ldr r5, [sp, #0x10]\n\
        movs r0, #0\n\
        ldrsb r0, [r5, r0]\n\
        lsls r0, r0, #0x10\n\
        lsrs r5, r0, #0x10\n\
        mov r9, r5\n\
    _080BAA3C:\n\
        adds r0, r7, #0\n\
        adds r0, #0x2d\n\
        movs r1, #0\n\
        ldrsb r1, [r0, r1]\n\
        adds r0, r1, #0\n\
        cmp r1, #0\n\
        bge _080BAA4C\n\
        adds r0, #0x1f\n\
    _080BAA4C:\n\
        asrs r0, r0, #5\n\
        lsls r0, r0, #5\n\
        subs r0, r1, r0\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #8\n\
        lsrs r4, r0, #0x10\n\
        adds r0, r1, #0\n\
        movs r1, #0x3c\n\
        bl __modsi3\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #8\n\
        lsrs r6, r0, #0x10\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        mov sl, r0\n\
        cmp r0, #0\n\
        bgt _080BAA92\n\
        ldr r0, [r7, #0x48]\n\
        lsls r1, r6, #0x10\n\
        asrs r1, r1, #0x10\n\
        lsls r2, r5, #0x10\n\
        asrs r2, r2, #0x10\n\
        mov r4, r9\n\
        lsls r3, r4, #0x10\n\
        asrs r3, r3, #0x10\n\
        str r3, [sp]\n\
        movs r3, #0x1f\n\
        str r3, [sp, #4]\n\
        movs r3, #1\n\
        str r3, [sp, #8]\n\
        mov r3, sl\n\
        bl sub_80BA6DC\n\
        b _080BAAE6\n\
    _080BAA92:\n\
        movs r4, #0x20\n\
        mov r0, sl\n\
        subs r4, r4, r0\n\
        ldr r0, [r7, #0x48]\n\
        lsls r6, r6, #0x10\n\
        asrs r6, r6, #0x10\n\
        lsls r5, r5, #0x10\n\
        mov r8, r5\n\
        mov r1, r8\n\
        asrs r1, r1, #0x10\n\
        mov r8, r1\n\
        mov r2, r9\n\
        lsls r5, r2, #0x10\n\
        asrs r5, r5, #0x10\n\
        str r5, [sp]\n\
        lsls r4, r4, #0x10\n\
        asrs r4, r4, #0x10\n\
        str r4, [sp, #4]\n\
        movs r3, #1\n\
        mov r9, r3\n\
        str r3, [sp, #8]\n\
        adds r1, r6, #0\n\
        mov r2, r8\n\
        mov r3, sl\n\
        bl sub_80BA6DC\n\
        movs r1, #0x1f\n\
        subs r1, r1, r4\n\
        ldr r0, [r7, #0x48]\n\
        adds r6, r6, r4\n\
        add r4, sl\n\
        str r5, [sp]\n\
        lsls r1, r1, #0x10\n\
        asrs r1, r1, #0x10\n\
        str r1, [sp, #4]\n\
        mov r5, r9\n\
        str r5, [sp, #8]\n\
        adds r1, r6, #0\n\
        mov r2, r8\n\
        adds r3, r4, #0\n\
        bl sub_80BA6DC\n\
    _080BAAE6:\n\
        ldr r1, [sp, #0x10]\n\
        ldrb r0, [r1]\n\
        ldr r2, [sp, #0xc]\n\
        strb r0, [r2]\n\
    _080BAAEE:\n\
        add sp, #0x14\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080BAB00
void sub_80BAB00(void)
{
    gUnknown_03001E30 = 0;
    return;
}

//! FE8U = 0x080BAB0C
void sub_80BAB0C(struct GmScreenProc * proc)
{
    if ((proc->unk_29_0) == 0)
    {
        return;
    }

    proc->unk_34 = gGMData.xCamera;
    proc->unk_36 = gGMData.yCamera;

    if (gGMData.xCamera < 0)
    {
        proc->unk_34 = 0;
    }
    else if (gGMData.xCamera > 0xf0)
    {
        proc->unk_34 = 0xf0;
    }

    if (proc->unk_36 < 0)
    {
        proc->unk_36 = 0;
    }

    proc->unk_2d = proc->unk_34 / 8;
    proc->unk_2e = proc->unk_36 / 8;

    if (proc->unk_2a & 4)
    {
        ApplyPalettes(gUnknown_08A95FE4, 9, 4);
        proc->unk_2a &= ~4;
    }

    if (proc->unk_2a & 2)
    {
        sub_80BA818(proc->unk_48, proc->unk_2d, proc->unk_2e);
        proc->unk_2a &= ~2;
    }

    if (proc->unk_2a & 1)
    {
        sub_80BA458();
        sub_80BA4D0(proc);
        proc->unk_2a &= ~1;
    }

    sub_80BA8A0(proc);
    BG_SetPosition(BG_3, proc->unk_34, proc->unk_36);

    proc->unk_38 = proc->unk_34;
    proc->unk_3a = proc->unk_36;

    return;
}

// TODO: gGMData.openPaths
extern struct OpenPaths gUnknown_03005324;

extern struct ProcCmd gUnknown_08A3DE84[];

//! FE8U = 0x080BABF0
ProcPtr NewMapScreen(ProcPtr parent)
{
    struct GmScreenProc * proc = Proc_Start(gUnknown_08A3DE84, parent);
    proc->unk_4c = StartGMapRoute(proc, &gUnknown_03005324, 0x5000, 0xe);
    return proc;
}
