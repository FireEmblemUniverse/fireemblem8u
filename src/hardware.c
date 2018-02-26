#include "global.h"
#include "proc.h"

void CopyToPaletteBuffer(void *src, int b, int size)
{
    if (size & 0x1F)  // size is not a multiple of 32
        CpuCopy16(src, gUnknown_020228A8 + (b >> 1), size);
    else
        CpuFastCopy(src, gUnknown_020228A8 + (b >> 1), size);
    gUnknown_0300000E = 1;
}

void sub_8000E14(u16 *a, int b, int size, int d)
{
    u16 *dest = gUnknown_020228A8 + (b >> 1);
    u16 *src = a;
    int i;

    for (i = 0; i < size; i++)
    {
        *dest++ = ((((*src & 0x1F) * d) >> 6) & 0x1F)
                + ((((*src & 0x3E0) * d) >> 6) & 0x3E0)
                + ((((*src & 0x7C00) * d) >> 6) & 0x7C00);
        src++;
    }
    gUnknown_0300000E = 1;
}

void FlushLCDControl(void)
{
    #define COPY_REG(type, reg, src) *(type *)REG_ADDR_##reg = *(type *)src;

    COPY_REG(u16, DISPCNT, &gLCDControlBuffer.dispcnt)
    COPY_REG(u16, DISPSTAT, &gLCDControlBuffer.dispstat)

    COPY_REG(u16, BG0CNT, &gLCDControlBuffer.bg0cnt)
    COPY_REG(u16, BG1CNT, &gLCDControlBuffer.bg1cnt)
    COPY_REG(u16, BG2CNT, &gLCDControlBuffer.bg2cnt)
    COPY_REG(u16, BG3CNT, &gLCDControlBuffer.bg3cnt)

    // set both HOFS and VOFS with a single 32-bit copy
    COPY_REG(u32, BG0HOFS, &gLCDControlBuffer.bgoffset[0])
    COPY_REG(u32, BG1HOFS, &gLCDControlBuffer.bgoffset[1])
    COPY_REG(u32, BG2HOFS, &gLCDControlBuffer.bgoffset[2])
    COPY_REG(u32, BG3HOFS, &gLCDControlBuffer.bgoffset[3])

    // set both WIN0H and WIN1H with a single 32-bit copy
    COPY_REG(u32, WIN0H, &gLCDControlBuffer.win0h)
    // set both WIN0V and WIN1V with a single 32-bit copy
    COPY_REG(u32, WIN0V, &gLCDControlBuffer.win0v)
    // set both WININ and WINOUT with a single 32-bit copy
    COPY_REG(u32, WININ, &gLCDControlBuffer.wincnt)

    COPY_REG(u16, MOSAIC, &gLCDControlBuffer.mosaic)
    COPY_REG(u16, BLDCNT, &gLCDControlBuffer.bldcnt)
    COPY_REG(u16, BLDALPHA, &gLCDControlBuffer.blendCoeffA)
    COPY_REG(u8, BLDY, &gLCDControlBuffer.blendY)

    // set both BG2PA and BG2PB with a single 32-bit copy
    COPY_REG(u32, BG2PA, &gLCDControlBuffer.bg2pa)
    // set both BG2PC and BG2PD with a single 32-bit copy
    COPY_REG(u32, BG2PC, &gLCDControlBuffer.bg2pc)
    COPY_REG(u32, BG2X, &gLCDControlBuffer.bg2x)
    COPY_REG(u32, BG2Y, &gLCDControlBuffer.bg2y)

    // set both BG3PA and BG3PB with a single 32-bit copy
    COPY_REG(u32, BG3PA, &gLCDControlBuffer.bg3pa)
    // set both BG3PC and BG3PD with a single 32-bit copy
    COPY_REG(u32, BG3PC, &gLCDControlBuffer.bg3pc)
    COPY_REG(u32, BG3X, &gLCDControlBuffer.bg3x)
    COPY_REG(u32, BG3Y, &gLCDControlBuffer.bg3y)

    #undef COPY_REG
}

struct BgCnt *GetBackgroundControlBuffer(u16 bg)
{
    switch (bg)
    {
    case 0: return &gLCDControlBuffer.bg0cnt;
    case 1: return &gLCDControlBuffer.bg1cnt;
    case 2: return &gLCDControlBuffer.bg2cnt;
    case 3: return &gLCDControlBuffer.bg3cnt;
    }
}

int GetBackgroundTileDataOffset(int bg)
{
    return GetBackgroundControlBuffer(bg)->charBaseBlock << 14;
}

int GetTileIndex(int bg, int b)
{
    b &= 0xFFFF;
    return (b - GetBackgroundTileDataOffset(bg)) / 32;
}

int sub_8000FC4(int bg)
{
    return GetBackgroundControlBuffer(bg)->screenBaseBlock << 11;
}

void SetBackgroundTileDataOffset(int bg, int offset)
{
    GetBackgroundControlBuffer(bg)->charBaseBlock = offset >> 14;
}

void SetBackgroundMapDataOffset(int bg, int offset)
{
    struct BgCnt *bgcnt = GetBackgroundControlBuffer(bg);

    if ((offset & 0x7FF) == 0)  // must be aligned
    {
        bgcnt->screenBaseBlock = offset >> 11;
        gUnknown_02024CA8[bg] = (void *)(VRAM | offset);
    }
}

void SetBackgroundScreenSize(int bg, int size)
{
    GetBackgroundControlBuffer(bg)->screenSize = size;
}

void sub_800106C(int bg, int bitsPerPixel)
{
    GetBackgroundControlBuffer(bg)->colorMode = (bitsPerPixel == 8) ? 1 : 0;
}

void FlushPalettesAdditive(int a)
{
    int i;
    u16 *src = gUnknown_020228A8;
    u16 *dest = (u16 *)PLTT;

    for (i = 0; i < 0x200; i++)
    {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r > 31)
            r = 31;
        if (g > 31)
            g = 31;
        if (b > 31)
            b = 31;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

void FlushPalettesSubstractive(int a)
{
    int i;
    u16 *src = gUnknown_020228A8;
    u16 *dest = (u16 *)PLTT;

    for (i = 0; i < 0x200; i++)
    {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r < 0)
            r = 0;
        if (g < 0)
            g = 0;
        if (b < 0)
            b = 0;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

void FlushBackgrounds(void)
{
    if (gUnknown_0300000D & (1 << 0))
        CpuFastCopy(gUnknown_02022CA8, gUnknown_02024CA8[0], 0x800);
    if (gUnknown_0300000D & (1 << 1))
        CpuFastCopy(gUnknown_020234A8, gUnknown_02024CA8[1], 0x800);
    if (gUnknown_0300000D & (1 << 2))
        CpuFastCopy(gUnknown_02023CA8, gUnknown_02024CA8[2], 0x800);
    if (gUnknown_0300000D & (1 << 3))
        CpuFastCopy(gUnknown_020244A8, gUnknown_02024CA8[3], 0x800);
    gUnknown_0300000D = 0;

    if (gUnknown_0300000E == 1)
    {
        gUnknown_0300000E = 0;
        if (gLCDControlBuffer.unk68 == 0)
            CpuFastCopy(gUnknown_020228A8, (void *)PLTT, 0x400);
        else if (gLCDControlBuffer.unk68 > 0)
            FlushPalettesAdditive(gLCDControlBuffer.unk68);
        else
            FlushPalettesSubstractive(gLCDControlBuffer.unk68);
    }
}

void BG_Fill(void *dest, int b)
{
    CpuFastFill(b * 0x10001, dest, 0x800);
}

void RegisterBlankTile(int a)
{
    RegisterFillTile(NULL, (void *)(VRAM + a * 32), 32);
}

void SetInterrupt_LCDVBlank(InterruptHandler handler)
{
    if (handler != NULL)
    {
        gLCDControlBuffer.dispstat.vblankIrqEnable = 1;
        SetIRQHandler(0, handler);
        REG_IE |= INTR_FLAG_VBLANK;
    }
    else
    {
        gLCDControlBuffer.dispstat.vblankIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_VBLANK;
    }
}

void SetInterrupt_LCDVCountMatch(InterruptHandler handler)
{
    if (handler != NULL)
    {
        gLCDControlBuffer.dispstat.vcountIrqEnable = 1;
        SetIRQHandler(2, handler);
        REG_IE |= INTR_FLAG_VCOUNT;
    }
    else
    {
        gLCDControlBuffer.dispstat.vcountIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_VCOUNT;
        gLCDControlBuffer.dispstat.vcountCompare = 0;
    }
}

void sub_8001308(int a)
{
    u16 dispstat = *(u8 *)&REG_DISPSTAT | (a << 8);
    REG_DISPSTAT = dispstat;
}

void SetLCDVCountSetting(int a)
{
    gLCDControlBuffer.dispstat.vcountCompare = a;
}

void SetMainUpdateRoutine(void (*func)(void))
{
    gUnknown_02024CB8 = func;
}

void ExecMainUpdate(void)
{
    if (gUnknown_02024CB8 != NULL)
        gUnknown_02024CB8();
}

void _UpdateKeyStatus(struct KeyStatus *keyStatus, s16 b)
{
    keyStatus->unk0A = keyStatus->unk04;
    keyStatus->unk04 = b;
    keyStatus->unk06 = keyStatus->unk04 & ~keyStatus->unk0A;
    keyStatus->unk08 = keyStatus->unk06;
    if (keyStatus->unk08 != 0)
        keyStatus->unk0C = b;
    keyStatus->unk0E = 0;
    if (keyStatus->unk04 == 0)
    {
        if (keyStatus->unk0C != 0 && keyStatus->unk0C == (keyStatus->unk0A & 0x303))
            keyStatus->unk0E = keyStatus->unk0A;
    }
    if (keyStatus->unk04 != 0 && keyStatus->unk04 == keyStatus->unk0A)
    {
        keyStatus->unk02--;
        if (keyStatus->unk02 == 0)
        {
            keyStatus->unk06 = keyStatus->unk04;
            keyStatus->unk02 = keyStatus->unk01;
        }
    }
    else
    {
        keyStatus->unk02 = keyStatus->unk00;
    }
    keyStatus->unk10 ^= keyStatus->unk04;
    keyStatus->unk10 &= keyStatus->unk04;
    if (b & 0x3F3)
        keyStatus->unk12 = 0;
    else if (keyStatus->unk12 < 0xFFFF)
        keyStatus->unk12++;
}

void UpdateKeyStatus(struct KeyStatus *keyStatus)
{
    u16 keys = ~REG_KEYINPUT;

    keys &= KEYS_MASK;
    if ((keys & 0xF) != 0xF)
        keys &= ~gUnknown_03000010;
    _UpdateKeyStatus(keyStatus, keys);
}

// unreferenced
void sub_8001414(struct KeyStatus *keyStatus)
{
    keyStatus->unk08 = 0;
    keyStatus->unk06 = 0;
    keyStatus->unk04 = 0;
}

void ResetKeyStatus(struct KeyStatus *keyStatus)
{
    keyStatus->unk00 = 12;
    keyStatus->unk01 = 4;
    keyStatus->unk0A = 0;
    keyStatus->unk04 = 0;
    keyStatus->unk08 = 0;
    keyStatus->unk02 = 0;
    keyStatus->unk12 = 0;
    gUnknown_03000010 = 0;
}

void SetKeyStatus_IgnoreMask(int a)
{
    gUnknown_03000010 = a;
}

int GetKeyStatus_IgnoreMask(void)
{
    return gUnknown_03000010;
}

// unreferenced
void KeyStatusSetter_Set(struct Proc *proc)
{
    gUnknown_0858791C->unk08 = proc->data[29];
    gUnknown_0858791C->unk06 = proc->data[29];
    gUnknown_0858791C->unk04 = proc->data[29];
}

void NewKeyStatusSetter(int a)
{
    struct Proc *proc = Proc_Create(gUnknown_08587920, (struct Proc *)1);

    proc->data[29] = a;
}
