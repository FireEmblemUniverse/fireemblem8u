#include "global.h"
#include "ap.h"
#include "hardware.h"
#include "m4a.h"
#include "proc.h"
#include "soundwrapper.h"

struct UnknownProc
{
    PROC_HEADER

    u32 unk2C;
    u16 unk30;
    u16 unk32;
    u16 unk34;
    u16 unk36;
    u16 unk38;
};

struct Struct03000700
{
             u32 bf0_00:10;
             u32 bf0_0A:10;
             u32 bf0_14:10;
             u32 filler:2;
    /*0x04*/ u32 bf1_00:10;
             u32 bf1_0A:10;
             u32 bf1_14:10;
};

extern struct Struct03000700 gUnknown_03000700[];

void sub_80126BC(struct UnknownProc *proc)
{
    u8 i;
    struct Struct03000700 *r4;

    proc->unk32 += proc->unk30;
    if (proc->unk32 > 255)
        Proc_ClearNativeCallback((struct Proc *)proc);

    r4 = gUnknown_03000700;
    for (i = 0; i < 32; i++)
    {
        if (proc->unk2C & (1 << i))
        {
            u16 r12 = (r4->bf1_00 * (0x100 - proc->unk32) + (proc->unk32 * proc->unk34)) / 256;
            u16 r5  = (r4->bf1_0A * (0x100 - proc->unk32) + (proc->unk32 * proc->unk36)) / 256;
            u16 r2  = (r4->bf1_14 * (0x100 - proc->unk32) + (proc->unk32 * proc->unk38)) / 256;

            WriteFadedPaletteFromArchive(r12, r5, r2, 1 << i);

            r4->bf0_00 = GetSomethingInPaletteBB_2A();
            r4->bf0_0A = GetSomethingInPaletteBB_5A();
            r4->bf0_14 = GetSomethingInPaletteBB_8A();
        }
        r4++;
    }
}

void sub_80127C4(void)
{
    u8 i;
    struct Struct03000700 *r2;

    ArchiveCurrentPalettes();
    r2 = gUnknown_03000700;
    for (i = 0; i < 32; i++)
    {
        r2->bf0_00 = 0x100;
        r2->bf0_0A = 0x100;
        r2->bf0_14 = 0x100;

        r2++;
    }
}

void sub_8012824(void)
{
    u8 i;
    struct Struct03000700 *r2;

    WriteFadedPaletteFromArchive(0x100, 0x100, 0x100, -1);
    r2 = gUnknown_03000700;
    for (i = 0; i < 32; i++)
    {
        r2->bf0_00 = 0x100;
        r2->bf0_0A = 0x100;
        r2->bf0_14 = 0x100;

        r2++;
    }
}

struct ProcCmd gUnknown_08592568[] =
{
    PROC_YIELD,
    PROC_LOOP_ROUTINE(sub_80126BC),
    PROC_END,
};

void sub_8012890(u16 a, u32 b, u16 c, u16 d, u16 e, struct Proc *parent)
{
    u8 i;
    struct Struct03000700 *r3;
    struct UnknownProc *proc = (struct UnknownProc *)Proc_CreateBlockingChild(gUnknown_08592568, parent);

    if (a == 0)
        proc->unk30 = 0x100;
    else
        proc->unk30 = a;
    proc->unk32 = 0;
    proc->unk2C = b;
    proc->unk34 = c;
    proc->unk36 = d;
    proc->unk38 = e;

    r3 = gUnknown_03000700;
    for (i = 0; i < 32; i++)
    {
        if (b & (1 << i))
        {
            r3->bf1_00 = r3->bf0_00;
            r3->bf1_0A = r3->bf0_0A;
            r3->bf1_14 = r3->bf0_14;
        }
        r3++;
    }
}

void sub_8012950(struct Proc *parent, s16 b, s16 c, s8 d, s8 e)
{
    sub_8021D34(parent, b, c, d, e);
}

s8 sub_8012974(void)
{
    return sub_8021DF8();
}

void sub_8012984(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F48(0);
    sub_8001F0C(0, 0, 0, 1, 1);
    sub_8001F64(1);

    gLCDControlBuffer.wincnt.win0_blend_on = 1;
    gLCDControlBuffer.wincnt.winout_blend_on = 0;

    gLCDControlBuffer.wincnt.win0_bg0_on = 1;
    gLCDControlBuffer.wincnt.win0_bg1_on = 1;
    gLCDControlBuffer.wincnt.win0_bg2_on = 1;
    gLCDControlBuffer.wincnt.win0_bg3_on = 1;
    gLCDControlBuffer.wincnt.win0_obj_on = 1;

    gLCDControlBuffer.wincnt.winout_bg0_on = 1;
    gLCDControlBuffer.wincnt.winout_bg1_on = 1;
    gLCDControlBuffer.wincnt.winout_bg2_on = 0;
    gLCDControlBuffer.wincnt.winout_bg3_on = 1;
    gLCDControlBuffer.wincnt.winout_obj_on = 1;
}

struct UnknownHinoStruct
{
    u8 filler0[0x10];
    s8 unk10;
    s8 unk11;
};

struct UnknownProc2
{
    PROC_HEADER

             struct UnknownHinoStruct *unk2C;
    /*0x30*/ int someX;
    /*0x34*/ int someY;
             u8 filler38[0x48-0x38];
             s16 unk48;
};

void sub_8012A2C(struct UnknownProc2 *proc)
{
    PlaySpacialSoundMaybe(0x8D, proc->someX);
    CopyDataWithPossibleUncomp(gUnknown_089B06AC, (void *)(VRAM + 0x13800));
    CopyToPaletteBuffer(gUnknown_089B0700, 640, 32);
    proc->unk48 = 1;
}

void sub_8012A64(struct UnknownProc2 *proc)
{
    proc->unk48++;
    if (proc->unk48 >= 30)
    {
        proc->unk48 = 0;
        Proc_ClearNativeCallback((struct Proc *)proc);
        APProc_Create(gUnknown_089A6254, proc->someX, proc->someY, 0x41C0, 0, 2);
        APProc_Create(gUnknown_089A6254, proc->someX, proc->someY, 0x41C0, 1, 2);
    }
}

void sub_8012AC0(struct UnknownProc2 *proc)
{
    proc->unk48++;
    if (proc->unk48 >= 30)
        Proc_ClearNativeCallback((struct Proc *)proc);
}

struct Struct0202BCB0
{
    u8 filler0[0xC];
    s16 unkC;
    s16 unkE;
};

extern struct Struct0202BCB0 gUnknown_0202BCB0;

struct ProcCmd gUnknown_08592580[] =
{
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(sub_8012A2C),
    PROC_LOOP_ROUTINE(sub_8012A64),
    PROC_SLEEP(80),
    PROC_LOOP_ROUTINE(sub_8012AC0),
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(sub_807E79C),
    PROC_SLEEP(4),
    PROC_CALL_ROUTINE(sub_807E7C4),
    PROC_END,
};

void sub_8012AE0(struct UnknownHinoStruct *a)
{
    s16 r4 = a->unk10;
    s16 r5 = a->unk11;
    struct UnknownProc2 *proc = (struct UnknownProc2 *)Proc_Create(gUnknown_08592580, ROOT_PROC_3);

    proc->someX = r4 * 16 - gUnknown_0202BCB0.unkC + 8;
    proc->someY = r5 * 16 - gUnknown_0202BCB0.unkE;
}

int sub_8012B24(void)
{
    return (Proc_Find(gUnknown_08592580) != NULL);
}

struct ProcCmd gUnknown_085925D0[] =
{
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(sub_807CE18),
    PROC_WHILE_ROUTINE(APProc_Exists),
    PROC_END,
};

void sub_8012B3C(struct UnknownHinoStruct *a)
{
    struct UnknownProc2 *proc = (struct UnknownProc2 *)Proc_Create(gUnknown_085925D0, ROOT_PROC_3);

    proc->unk2C = a;
    proc->someX = ((a->unk10 - (gUnknown_0202BCB0.unkC >> 4)) * 2 + 1) * 8;
    proc->someY = ((a->unk11 - (gUnknown_0202BCB0.unkE >> 4)) * 2 + 1) * 8;
}

int sub_8012B84(void)
{
    return (Proc_Find(gUnknown_085925D0) != NULL);
}

struct UnknownProc3
{
    PROC_HEADER

    u8 unk29;
    u8 unk2A;
};

void sub_8012B9C(struct UnknownProc3 *proc)
{
    if (sub_8000D28() & 1)
    {
        switch (proc->unk29)
        {
        case 0:
            switch (proc->unk2A)
            {
            case 0:
                gUnknown_0202BCB0.unkC ^= 2;
                break;
            case 1:
                gUnknown_0202BCB0.unkE ^= 2;
                break;
            }
            UpdateGameTilesGraphics();
            break;
        case 1:
            switch (proc->unk2A)
            {
            case 0:
                BG_SetPosition(3, sub_8000D28() & 2, 0);
                break;
            case 1:
                BG_SetPosition(3, 0, sub_8000D28() & 2);
                break;
            }
        }
    }
}

struct ProcCmd gUnknown_085925F0[] =
{
    PROC_YIELD,
    PROC_LOOP_ROUTINE(sub_8012B9C),
    PROC_END,
};

void sub_8012C34(u8 a, u8 b, u8 c)
{
    struct UnknownProc3 *proc = (struct UnknownProc3 *)Proc_Find(gUnknown_085925F0);

    if (proc == NULL)
    {
        if (c == 1 && !gUnknown_0202BCF0.unk41_2)
            m4aSongNumStart(0x26A);
        proc = (struct UnknownProc3 *)Proc_Create(gUnknown_085925F0, ROOT_PROC_3);
    }
    proc->unk29 = a;
    proc->unk2A = b;
}

void sub_8012C88(void)
{
    struct UnknownProc3 *proc = (struct UnknownProc3 *)Proc_Find(gUnknown_085925F0);

    if (proc != NULL)
    {
        switch (proc->unk29)
        {
        case 0:
            (u16)gUnknown_0202BCB0.unkC &= 0xFFFC;
            (u16)gUnknown_0202BCB0.unkE &= 0xFFFC;
            break;
        case 1:
            BG_SetPosition(3, 0, 0);
            break;
        }
        Proc_DeleteAllWithScript(gUnknown_085925F0);
        SoundStuff_80023E0(4);
    }
}

void sub_8012CE4(void)
{
    SetSpecialColorEffectsParameters(0, 0, 16, 0);
    SetupBackgroundForWeatherMaybe();
}

extern struct ProcCmd gUnknown_08592608[];

extern u8 gUnknown_08592628[];

void sub_8012CFC(struct UnknownHinoStruct *a, struct Proc *parent)
{
    int r2;
    int r3;
    register struct Proc *proc asm("r6") = parent;

    asm(""::"r"(proc));
    proc = Proc_CreateBlockingChild(gUnknown_08592608, parent);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetSpecialColorEffectsParameters(1, 16, 16, 0);

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 1);

    r2 = (a->unk10 * 16) - (u16)gUnknown_0202BCB0.unkC - 16;
    r3 = (a->unk11 * 16) - (u16)gUnknown_0202BCB0.unkE - 24;
    sub_80AE7C4(gUnknown_08592628, 2, r2, r3, 0, 0x2000, 15, 0, proc);

    if (!gUnknown_0202BCF0.unk41_2)
        m4aSongNumStart(0x2D6);
}

#if NONMATCHING
int sub_8012DCC(int a, int b, int c, int d, int e)
{
    int var1;
    int var2;

    if (e == 0)
        return c;
    switch (a)
    {
    case 0:
        var1 = d * (c - b);
        var2 = e;
        return b + Div(var1, var2);
    case 1:
        var1 = d * d * (c - b);
        var2 = e * e;
        return b + Div(var1, var2);
    case 2:
        var1 = d * d * d * (c - b);
        var2 = e * e * e;
        return b + Div(var1, var2);
    case 3:
        var1 = d * d * d * d * (c - b);
        var2 = e * e * e * e;
        return b + Div(var1, var2);
    case 4:
        var1 = (e - d) * (e - d) * (c - b);
        var2 = e * e;
        return b + (c - b) - Div(var1, var2);
    case 5:
        var1 = (e - d) * (e - d) * (e - d) * (c - b);
        var2 = e * e * e;
        return b + (c - b) - Div(var1, var2);
    }
    return 0;
}
#else
__attribute__((naked))
int sub_8012DCC(int a, int b, int c, int d, int e)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, lr}\n\
        adds r6, r1, #0\n\
        ldr r5, [sp, #0x10]\n\
        cmp r5, #0\n\
        bne _08012DDA\n\
        adds r0, r2, #0\n\
        b _08012E8E\n\
_08012DDA:\n\
        cmp r0, #5\n\
        bhi _08012E8C\n\
        lsls r0, r0, #2\n\
        ldr r1, _08012DE8  @ _08012DEC\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
_08012DE8: .4byte _08012DEC\n\
_08012DEC: @ jump table\n\
        .4byte _08012E04 @ case 0\n\
        .4byte _08012E10 @ case 1\n\
        .4byte _08012E20 @ case 2\n\
        .4byte _08012E34 @ case 3\n\
        .4byte _08012E58 @ case 4\n\
        .4byte _08012E6A @ case 5\n\
_08012E04:\n\
        subs r0, r2, r6\n\
        adds r2, r0, #0\n\
        muls r2, r3, r2\n\
        adds r0, r2, #0\n\
        adds r1, r5, #0\n\
        b _08012E50\n\
_08012E10:\n\
        adds r0, r3, #0\n\
        muls r0, r3, r0\n\
        subs r1, r2, r6\n\
        adds r2, r0, #0\n\
        muls r2, r1, r2\n\
        adds r1, r5, #0\n\
        muls r1, r5, r1\n\
        b _08012E4E\n\
_08012E20:\n\
        adds r0, r3, #0\n\
        muls r0, r3, r0\n\
        adds r1, r0, #0\n\
        muls r1, r3, r1\n\
        subs r0, r2, r6\n\
        adds r2, r1, #0\n\
        muls r2, r0, r2\n\
        adds r0, r5, #0\n\
        muls r0, r5, r0\n\
        b _08012E4A\n\
_08012E34:\n\
        adds r0, r3, #0\n\
        muls r0, r3, r0\n\
        muls r0, r3, r0\n\
        adds r1, r0, #0\n\
        muls r1, r3, r1\n\
        subs r0, r2, r6\n\
        adds r2, r1, #0\n\
        muls r2, r0, r2\n\
        adds r0, r5, #0\n\
        muls r0, r5, r0\n\
        muls r0, r5, r0\n\
_08012E4A:\n\
        adds r1, r0, #0\n\
        muls r1, r5, r1\n\
_08012E4E:\n\
        adds r0, r2, #0\n\
_08012E50:\n\
        bl Div\n\
        adds r0, r6, r0\n\
        b _08012E8E\n\
_08012E58:\n\
        subs r1, r5, r3\n\
        adds r0, r1, #0\n\
        muls r0, r1, r0\n\
        subs r4, r2, r6\n\
        adds r2, r0, #0\n\
        muls r2, r4, r2\n\
        adds r1, r5, #0\n\
        muls r1, r5, r1\n\
        b _08012E80\n\
_08012E6A:\n\
        subs r1, r5, r3\n\
        adds r0, r1, #0\n\
        muls r0, r1, r0\n\
        muls r0, r1, r0\n\
        subs r4, r2, r6\n\
        adds r2, r0, #0\n\
        muls r2, r4, r2\n\
        adds r0, r5, #0\n\
        muls r0, r5, r0\n\
        adds r1, r0, #0\n\
        muls r1, r5, r1\n\
_08012E80:\n\
        adds r0, r2, #0\n\
        bl Div\n\
        adds r4, r6, r4\n\
        subs r0, r4, r0\n\
        b _08012E8E\n\
_08012E8C:\n\
        movs r0, #0\n\
_08012E8E:\n\
        pop {r4, r5, r6}\n\
        pop {r1}\n\
        bx r1\n\
    .syntax divided");
}
#endif

void sub_8012E94(void)
{
}

int sub_8012E98(u8 *a, u8 *b)
{
    while ((*a | *b) != 0)
    {
        if (*a++ != *b++)
            return 0;
    }
    return 1;
}

void CopyString(char *dest, char *src)
{
    while (*src != 0)
        *dest++ = *src++;
    *dest = *src;
}

void CopyDirect(u32 *src, u32 *dest)
{
    int var2 = FilterR0ForRawCopy(src) - 4;

    if (var2 & 0x1F)
        CpuCopy16(src + 1, dest, var2);
    else
        CpuFastCopy(src + 1, dest, var2);
}

void sub_8012F20(void *src, void *dest)
{
    LZ77UnCompWram(src, gUnknown_02020188);
    CpuFastCopy(gUnknown_02020188, dest, FilterR0ForRawCopy(src));
}

extern void (*gUnknown_08599FB4[])();

void CopyDataWithPossibleUncomp(void *src, void *dest)
{
    int r5;

    if ((uintptr_t)dest - VRAM < VRAM_SIZE)
        r5 = 0;
    else
        r5 = 1;
    gUnknown_08599FB4[r5 + ((*(u8 *)src & 0xF0) >> 3)](src, dest);
}

struct UnknownHinoStruct2
{
    u8 *unk0;
    int unk4;
};

int FilterR0ForRawCopy(u32 *a)
{
    return *a >> 8;
}

void sub_8012F98(u32 *a, int b, int c)
{
    a[0] = c;
    b = (b & 0xFFE0) >> 5;
    c = (c & 0xFFE0) >> 5;
    a[1] = c - b;
}

int sub_8012FB0(struct UnknownHinoStruct2 *a, u32 *b)
{
    int var1;
    int var2;

    CopyDataWithPossibleUncomp(b, (void *)a->unk0);
    var1 = FilterR0ForRawCopy(b);
    a->unk0 += var1;
    var2 = a->unk4;
    a->unk4 += var1 / 32;
    return var2;
}

int sub_8012FE0(struct UnknownHinoStruct2 *a, int b)
{
    int var;

    a->unk0 += b * 32;
    var = a->unk4;
    a->unk4 += b;
    return var;
}

void RegisterObjectTileGraphics(const u8* src, u8* dest, int width, int height)
{
    int i;
    int srcRowSize = width * 32;

    for (i = 0; i < height; i++)
    {
        RegisterTileGraphics(src, dest, srcRowSize);
        src += srcRowSize;
        dest += 0x400;
    }
}

void CopyTileGfxForObj(u8 *src, u8 *dest, int width, int height)
{
    int i;
    int srcRowSize = width * 32;

    for (i = 0; i < height; i++)
    {
        CpuFastCopy(src, dest, srcRowSize);
        src += srcRowSize;
        dest += 0x400;
    }
}

void sub_8013058(u8 *src, u8 *dest, int width, int height)
{
    int i;

    for (i = 0; i < height; i++)
    {
        sub_8013094(src, dest, width);
        src += width * 64;
        dest += width * 32;
    }
}

void sub_8013094(u8 *src, u8 *dest, int width)
{
    int i;

    for (i = 0; i < width; i++)
    {
        sub_80130BC(src, dest, width);
        src += 8;
        dest += 32;
    }
}

void sub_80130BC(u8 *src, u8 *dest, int width)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        u32 val = src[7];
        val = (val << 4) | src[6];
        val = (val << 4) | src[5];
        val = (val << 4) | src[4];
        val = (val << 4) | src[3];
        val = (val << 4) | src[2];
        val = (val << 4) | src[1];
        val = (val << 4) | src[0];

        *(u32 *)dest = val;
        dest += 4;
        src += width * 8;
    }
}

void sub_8013104(u16 *dest, int tileNum, int width, int height)
{
    int x;
    int y;

    for (y = 0; y < height; y++)
    {
        for (x = 0; x < width; x++)
        {
            dest[y * 32 + x] = tileNum;
            tileNum++;
        }
    }
}

void sub_8013138(u16 *dest, u8 *b, int c, int size)
{
    int i;

    for (i = 0; i < size; i++)
        dest[-i] = 0;
    while (*b != 0x20)
    {
        *dest = *b + c - 0x30;
        dest--;
        b--;
    }
}

/*
void sub_8013138(u16 *dest, u8 *b, int c, int size)
{
    int i;
    u16 *ptr = dest;

    for (i = 0; i < size; i++)
        *ptr-- = 0;
    while (*b != 0x20)
    {
        *dest = *b + c - 0x30;
        dest--;
        b--;
    }
}
*/

void sub_8013168(u16 *dest, u8 *b, int c, int size, int e)
{
    int i;

    for (i = 0; i < size; i++)
        dest[-i] = 0;
    if (e != 0)
    {
        *dest-- = c + 10;
        *dest-- = c + 10;
    }
    else
    {
        while (*b != 0x20)
        {
            *dest = *b + c - 0x30;
            dest--;
            b--;
        }
    }
}
