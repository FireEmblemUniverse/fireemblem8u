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

extern struct ProcCmd gUnknown_08592568[];

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

extern struct ProcCmd gUnknown_08592580[];

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

extern struct ProcCmd gUnknown_085925D0[];

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

extern struct ProcCmd gUnknown_085925F0[];

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

/*
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
*/
