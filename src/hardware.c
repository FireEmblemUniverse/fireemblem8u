#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

s8 EWRAM_DATA gFadeComponentStep[0x20] = { 0 };
s8 EWRAM_DATA gFadeComponents[0x600] = { 0 };
u16 EWRAM_DATA gPaletteBuffer[0x200] = { 0 };
u16 EWRAM_DATA gBG0TilemapBuffer[32 * 32] = { 0 };
u16 EWRAM_DATA gBG1TilemapBuffer[32 * 32] = { 0 };
u16 EWRAM_DATA gBG2TilemapBuffer[32 * 32] = { 0 };
u16 EWRAM_DATA gBG3TilemapBuffer[32 * 32] = { 0 };

void * EWRAM_DATA gBGVramTilemapPointers[4] = { 0 };

void (* EWRAM_DATA gMainCallback)(void) = NULL;

static u32 EWRAM_DATA sPad_Unused_02024CBC = 0;

static struct KeyStatusBuffer EWRAM_DATA sKeyStatusBuffer = { 0 };
struct KeyStatusBuffer * CONST_DATA gKeyStatusPtr = &sKeyStatusBuffer;

struct Struct02024CD4 EWRAM_DATA gFrameTmRegisterConfig = { 0 };
struct TileDataTransfer EWRAM_DATA gFrameTmRegister[32] = { 0 };

struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

void CopyToPaletteBuffer(const void* src, int b, int size)
{
    if (size & 0x1F)  // size is not a multiple of 32
        CpuCopy16(src, gPaletteBuffer + (b >> 1), size);
    else
        CpuFastCopy(src, gPaletteBuffer + (b >> 1), size);
    sModifiedPalette = 1;
}

void sub_8000E14(u16 *a, int b, int size, int d)
{
    u16 *dest = gPaletteBuffer + (b >> 1);
    u16 *src = a;
    int i;

    for (i = 0; i < size; i++)
    {
        *dest++ = ((((*src & RED_MASK) * d) >> 6) & RED_MASK)
                + ((((*src & GREEN_MASK) * d) >> 6) & GREEN_MASK)
                + ((((*src & BLUE_MASK) * d) >> 6) & BLUE_MASK);
        src++;
    }
    sModifiedPalette = 1;
}

void FlushLCDControl(void)
{
    // NOTE: most of these break strict aliasing rules.
    // this function needs to be rewritten to be acceptable for modern compiler.

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
    COPY_REG(u32, WIN0H, &gLCDControlBuffer.win0_right)
    // set both WIN0V and WIN1V with a single 32-bit copy
    COPY_REG(u32, WIN0V, &gLCDControlBuffer.win0_bottom)
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

struct BgCnt *BG_GetControlBuffer(u16 bg)
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
    return BG_GetControlBuffer(bg)->charBaseBlock << 14;
}

int GetTileIndex(int bg, int offset)
{
    offset &= 0xFFFF;
    return (offset - GetBackgroundTileDataOffset(bg)) / 32;
}

int BG_GetTileMapOffset(int bg)
{
    return BG_GetControlBuffer(bg)->screenBaseBlock << 11;
}

void SetBackgroundTileDataOffset(int bg, int offset)
{
    BG_GetControlBuffer(bg)->charBaseBlock = offset >> 14;
}

void SetBackgroundMapDataOffset(int bg, int offset)
{
    struct BgCnt *bgcnt = BG_GetControlBuffer(bg);

    if ((offset & 0x7FF) == 0)  // must be aligned
    {
        bgcnt->screenBaseBlock = offset >> 11;
        gBGVramTilemapPointers[bg] = (void *)(VRAM | offset);
    }
}

void SetBackgroundScreenSize(int bg, int size)
{
    BG_GetControlBuffer(bg)->screenSize = size;
}

void BG_SetColorBpp(int bg, int bitsPerPixel)
{
    BG_GetControlBuffer(bg)->colorMode = (bitsPerPixel == 8) ? 1 : 0;
}

static void ApplyColorAddition_ClampMax(int a)
{
    int i;
    u16 *src = gPaletteBuffer;
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

static void ApplyColorAddition_ClampMin(int a)
{
    int i;
    u16 *src = gPaletteBuffer;
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
    if (sModifiedBGs & (1 << 0))
        CpuFastCopy(gBG0TilemapBuffer, gBGVramTilemapPointers[0], 0x800);
    if (sModifiedBGs & (1 << 1))
        CpuFastCopy(gBG1TilemapBuffer, gBGVramTilemapPointers[1], 0x800);
    if (sModifiedBGs & (1 << 2))
        CpuFastCopy(gBG2TilemapBuffer, gBGVramTilemapPointers[2], 0x800);
    if (sModifiedBGs & (1 << 3))
        CpuFastCopy(gBG3TilemapBuffer, gBGVramTilemapPointers[3], 0x800);
    sModifiedBGs = 0;

    if (sModifiedPalette == 1)
    {
        sModifiedPalette = 0;
        if (gLCDControlBuffer.colorAddition == 0)
            CpuFastCopy(gPaletteBuffer, (void *)PLTT, 0x400);
        else if (gLCDControlBuffer.colorAddition > 0)
            ApplyColorAddition_ClampMax(gLCDControlBuffer.colorAddition);
        else
            ApplyColorAddition_ClampMin(gLCDControlBuffer.colorAddition);
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

void SetNextVCount(int a)
{
    u16 dispstat = *(u8 *)&REG_DISPSTAT | (a << 8);
    REG_DISPSTAT = dispstat;
}

void SetLCDVCountSetting(int set)
{
    gLCDControlBuffer.dispstat.vcountCompare = set;
}

void SetMainUpdateRoutine(void (*func)(void))
{
    gMainCallback = func;
}

void ExecMainUpdate(void)
{
    if (gMainCallback != NULL)
        gMainCallback();
}

void _UpdateKeyStatus(struct KeyStatusBuffer *keyStatus, s16 keys)
{
    keyStatus->prevKeys = keyStatus->heldKeys;
    keyStatus->heldKeys = keys;

    // keys that are pressed now, but weren't pressed before
    keyStatus->newKeys = keyStatus->repeatedKeys = keyStatus->heldKeys & ~keyStatus->prevKeys;

    if (keyStatus->newKeys != 0)
        keyStatus->LastPressState = keys;
    keyStatus->ABLRPressed = 0;
    if (keyStatus->heldKeys == 0)
    {
        if (keyStatus->LastPressState != 0 && keyStatus->LastPressState == (keyStatus->prevKeys & (L_BUTTON | R_BUTTON | B_BUTTON | A_BUTTON)))
            keyStatus->ABLRPressed = keyStatus->prevKeys;
    }

    if (keyStatus->heldKeys != 0 && keyStatus->heldKeys == keyStatus->prevKeys)  // keys are being held
    {
        keyStatus->repeatTimer--;
        if (keyStatus->repeatTimer == 0)
        {
            keyStatus->repeatedKeys = keyStatus->heldKeys;
            keyStatus->repeatTimer = keyStatus->repeatInterval;  // reset repeat timer
        }
    }
    else
    {
        // held key combination has changed. reset timer
        keyStatus->repeatTimer = keyStatus->repeatDelay;
    }

    keyStatus->newKeys2 ^= keyStatus->heldKeys;
    keyStatus->newKeys2 &= keyStatus->heldKeys;
    if (keys & (A_BUTTON | B_BUTTON | DPAD_ANY | R_BUTTON | L_BUTTON)) // any button other than start and select
        keyStatus->TimeSinceStartSelect = 0;
    else if (keyStatus->TimeSinceStartSelect < 0xFFFF)
        keyStatus->TimeSinceStartSelect++;
}

void UpdateKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    u16 keys = ~REG_KEYINPUT;

    keys &= KEYS_MASK;
    if ((keys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) != (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON))
        keys &= ~gKeyStatusIgnoredSt;
    _UpdateKeyStatus(keyStatus, keys);
}

// unreferenced
void SnycKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    keyStatus->newKeys = 0;
    keyStatus->repeatedKeys = 0;
    keyStatus->heldKeys = 0;
}

void ResetKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    keyStatus->repeatDelay = 12;
    keyStatus->repeatInterval = 4;
    keyStatus->prevKeys = 0;
    keyStatus->heldKeys = 0;
    keyStatus->newKeys = 0;
    keyStatus->repeatTimer = 0;
    keyStatus->TimeSinceStartSelect = 0;
    gKeyStatusIgnoredSt = 0;
}

void SetKeyStatus_IgnoreMask(int a)
{
    gKeyStatusIgnoredSt = a;
}

int GetKeyStatus_IgnoreMask(void)
{
    return gKeyStatusIgnoredSt;
}

void AsnycKeyStatusExt(struct KeyProc * proc)
{
    gKeyStatusPtr->newKeys = proc->unk64;
    gKeyStatusPtr->repeatedKeys = proc->unk64;
    gKeyStatusPtr->heldKeys = proc->unk64;
}

CONST_DATA struct ProcCmd ProcScr_AsnycKeyStatus[] =
{
    PROC_SLEEP(1),
    PROC_CALL(AsnycKeyStatusExt),
    PROC_END,
};

void AsnycKeyStatus(int key)
{
    struct KeyProc * kproc = Proc_Start(ProcScr_AsnycKeyStatus, PROC_TREE_1);
    kproc->unk64 = key;
}

void BG_SetPosition(u16 bg, u16 x, u16 y)
{
    switch (bg) {
    case BG_0:
        gLCDControlBuffer.bgoffset[0].x = x;
        gLCDControlBuffer.bgoffset[0].y = y;
        break;
    case BG_1:
        gLCDControlBuffer.bgoffset[1].x = x;
        gLCDControlBuffer.bgoffset[1].y = y;
        break;
    case BG_2:
        gLCDControlBuffer.bgoffset[2].x = x;
        gLCDControlBuffer.bgoffset[2].y = y;
        break;
    case BG_3:
        gLCDControlBuffer.bgoffset[3].x = x;
        gLCDControlBuffer.bgoffset[3].y = y;
        break;
    }
}

void sub_80014E8(void)
{
    gUnknown_03000018 = gUnknown_03000019 = 0;
    BG_Fill(gBG0TilemapBuffer, 0);
    sModifiedBGs |= 1 << 0;
}

void sub_800151C(u8 a, u8 b)
{
    gUnknown_03000018 = a;
    gUnknown_03000019 = b;
}

void sub_8001530(u16 *a, u16 *b)
{
    int i;

    for (i = 0x27F; i >= 0; i--)
        *a++ = *b++;
}

struct UnknownDmaStruct
{
    u16 unk00;  // u32? Why do these overlap?
    u8 unk02[1];
};

void sub_800154C(void* outTm, void const* inData, u8 base, u8 linebits)
{
    u8 const* it = (u8 const*) inData + 2;
    u8* out;

    u8 xSize = (*(u32 const*) inData);
    u8 ySize = (*(u32 const*) inData) >> 8;

    s8 ix, iy;

    for (iy = ySize; iy >= 0; iy--)
    {
        out = (u8*) outTm + (iy << linebits);

        for (ix = xSize; ix >= 0; ix--)
            *out++ = *it++ + base;
    }
}

void AddAttr2dBitMap(u16 * _dst, u16 * _src, s16 ix, s16 iy, u16 chr) // TODO: handle type of a1
{
    u16 *dst;
    s16 width, height;
    s16 _width;
    s16 _height;
    s16 _ix, _iy;

    width = ((u8 *)_src)[0] + 1;
    _height = ((u8 *)_src)[1];
    height = _height + 1;
    _width = width;
    _height = height;
    ++_src;
    _iy = 0;
    _ix = 0;

    if (ix + width > 0x20)
        width = 0x20 - ix;

    if (ix < 0)
    {
        _ix = -ix;
        width -= _ix;
        ix = 0;
    }

    if (width > 0)
    {
        int i, j;
        if (iy + height > 0x20)
            height = 0x20 - iy;

        if (iy < 0)
        {
            _iy = -iy;
            height -= _iy;
            iy = 0;
        }

        if (height > 0)
        {
            _src += _width * (_height - (_iy + height));
            dst = _dst + (iy + height - 1) * 0x20 + ix;

            for (i = height - 1; i >= 0; --i)
            {
                const u16 *src = _src + _ix;
                u16 *dst2 = dst;

                for (j = 0; width > j; ++j)
                {
                    *dst2 = *src + chr;
                    ++src;
                    ++dst2;
                }

                _src += _width;
                dst -= 0x20;
            }
        }
    }
}

void sub_80016C4(u16 *a, struct UnknownDmaStruct *b)
{
    int i;
    int j;
    u8 r6 = b->unk00;
    u8 r0 = b->unk00 >> 8;
    int r4 = 0;
    s16 *src = (s16 *)b->unk02;

    for (i = 0; i < r0; i++)
    {
        s16 *dest = a + i * 32;

        for (j = 0; j < r6; j++)
        {
            r4 += *src++;
            *dest++ = r4;
        }
    }
}

void MaybeResetSomePal(void)
{
    int i;

    for (i = 31; i >= 0; i--)
        gFadeComponentStep[i] = 0;
}

void MaybeSmoothChangeSomePal(u16 *src, int b, int c, int d)
{
    int i;
    int j;
    int r3 = (d < 0) ? 32 : 0;
    int destOffset = b * 48;

    for (i = 0; i < c; i++)
    {
        gFadeComponentStep[b + i] = d;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[destOffset++] = RED_VALUE(*src) + r3;
            gFadeComponents[destOffset++] = GREEN_VALUE(*src) + r3;
            gFadeComponents[destOffset++] = BLUE_VALUE(*src) + r3;
            src++;
        }
    }
}

void sub_80017B4(int a, int b, int c, int d)
{
    int i;
    int j;
    int destOffset = PAL_OFFSET(a);
    u16 *src = gPaletteBuffer + destOffset;

    for (i = 0; i < b; i++)
    {
        gFadeComponentStep[a + i] = d;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[destOffset++] = RED_VALUE(*src) + c;
            gFadeComponents[destOffset++] = GREEN_VALUE(*src) + c;
            gFadeComponents[destOffset++] = BLUE_VALUE(*src) + c;
            src++;
        }
    }
}

void sub_800183C(int a, int b, int c)
{
    int i;

    for (i = a; i < a + b; i++)
        gFadeComponentStep[i] = c;
}

void ColorFadeSetupFromColorToBlack(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gFadeComponentStep[i] = a;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[(i * 16 + j) * 3 + 0] = RED_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
        }
    }
}

void ColorFadeSetupFromBlack(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gFadeComponentStep[i] = a;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[(i * 16 + j) * 3 + 0] = RED_VALUE(gPaletteBuffer[i * 16 + j]);
            gFadeComponents[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gPaletteBuffer[i * 16 + j]);
            gFadeComponents[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gPaletteBuffer[i * 16 + j]);
        }
    }
}

// duplicate of ColorFadeSetupFromColorToBlack
void ColorFadeSetupFromColorToWhite(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gFadeComponentStep[i] = a;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[(i * 16 + j) * 3 + 0] = RED_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
        }
    }
}

void ColorFadeSetupFromWhite(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gFadeComponentStep[i] = a;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[(i * 16 + j) * 3 + 0] = RED_VALUE(gPaletteBuffer[i * 16 + j]) + 64;
            gFadeComponents[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gPaletteBuffer[i * 16 + j]) + 64;
            gFadeComponents[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gPaletteBuffer[i * 16 + j]) + 64;
        }
    }
}

void sub_8001A6C(void)
{
    int i;
    int j;
    s16 r4;
    s16 r3;
    s16 r1;

    for (i = 31; i >= 0; i--)
    {
        if (gFadeComponentStep[i] != 0)
        {
            for (j = 15; j >= 0; j--)
            {
                gFadeComponents[(i * 16 + j) * 3 + 0] += gFadeComponentStep[i];
                gFadeComponents[(i * 16 + j) * 3 + 1] += gFadeComponentStep[i];
                gFadeComponents[(i * 16 + j) * 3 + 2] += gFadeComponentStep[i];

                r4 = gFadeComponents[(i * 16 + j) * 3 + 0] - 32;
                if (r4 > 31)
                    r4 = 31;
                if (r4 < 0)
                    r4 = 0;

                r3 = gFadeComponents[(i * 16 + j) * 3 + 1] - 32;
                if (r3 > 31)
                    r3 = 31;
                if (r3 < 0)
                    r3 = 0;

                r1 = gFadeComponents[(i * 16 + j) * 3 + 2] - 32;
                if (r1 > 31)
                    r1 = 31;
                if (r1 < 0)
                    r1 = 0;

                gPaletteBuffer[i * 16 + j] = (r1 << 10) + (r3 << 5) + r4;
            }
        }
    }

    sModifiedPalette = 1;
}

void SetupBackgrounds(u16 *bgConfig)
{
    u16 defaultBgConfig[12] =
    {
        // tile offset  map offset  screen size
        0x0000,         0x6000,     0,          // BG 0
        0x0000,         0x6800,     0,          // BG 1
        0x0000,         0x7000,     0,          // BG 2
        0x8000,         0x7800,     0,          // BG 3
    };
    int bg;

    if (bgConfig == NULL)
        bgConfig = defaultBgConfig;

    *(u16 *)&gLCDControlBuffer.bg0cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg1cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg2cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg3cnt = 0;

    for (bg = 0; bg <= 3; bg++)
    {
        SetBackgroundTileDataOffset(bg, *bgConfig++);
        SetBackgroundMapDataOffset(bg, *bgConfig++);
        SetBackgroundScreenSize(bg, *bgConfig++);
        BG_SetPosition(bg, 0, 0);
        BG_Fill(BG_GetMapBuffer(bg), 0);
        CpuFastFill16(0, (void *)(VRAM + GetBackgroundTileDataOffset(bg)), 64);
    }
    InitBmBgLayers();
    sModifiedBGs |= 0xF;

    InitOam(0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    sModifiedPalette = 1;

    gLCDControlBuffer.dispcnt.forcedBlank = 0;
    gLCDControlBuffer.dispcnt.mode = 0;
    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;
}

static u16* sBgTilemapBuffers[] =
{
    gBG0TilemapBuffer,
    gBG1TilemapBuffer,
    gBG2TilemapBuffer,
    gBG3TilemapBuffer,
};

u16* BG_GetMapBuffer(int bg)
{
    return sBgTilemapBuffers[bg];
}

void SetSoftwareResetFlag(u8 a)
{
    gSoftwareResetFlag = a;
}

int IsSoftwareReset(void)
{
    return gSoftwareResetFlag;
}

void SoftResetIfKeyComboPressed(void)
{
    if ((u8)CheckCanKeyComboReset() != 0)
    {
        if (gKeyStatusPtr->heldKeys == (L_BUTTON | R_BUTTON | A_BUTTON | B_BUTTON))
            SoftReset(0);
        else if (gKeyStatusPtr->heldKeys == (A_BUTTON | B_BUTTON | SELECT_BUTTON | START_BUTTON))
            SoftReset(0);
    }
}

void sub_8001CB0(int a)
{
    u16 savedIE = REG_IE;

    REG_KEYCNT = a - 0x4000;
    REG_IE &= ~(INTR_FLAG_SERIAL | INTR_FLAG_GAMEPAK);
    REG_IE |= INTR_FLAG_KEYPAD;
    REG_DISPCNT |= DISPCNT_FORCED_BLANK;
    SoundBiasReset();
    asm("swi 3");  // enter sleep mode
    SoundBiasSet();
    REG_IE = savedIE;
}

void ExecBothHBlankHandlers(void)
{
    if (sHBlankHandler1 != NULL)
        sHBlankHandler1();
    if (sHBlankHandler2 != NULL)
        sHBlankHandler2();
}

void UpdateHBlankHandlerState(void)
{
    u8 r2 = (sHBlankHandler1 != NULL);

    switch (r2 + (sHBlankHandler2 != NULL) * 2)
    {
    case 0:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_HBLANK;
        break;
    case 1:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, sHBlankHandler1);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 2:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, sHBlankHandler2);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 3:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, ExecBothHBlankHandlers);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    }
}

void SetPrimaryHBlankHandler(void (*hblankHandler)(void))
{
    sHBlankHandler1 = hblankHandler;
    UpdateHBlankHandlerState();
}

void SetSecondaryHBlankHandler(void (*hblankHandler)(void))
{
    sHBlankHandler2 = hblankHandler;
    UpdateHBlankHandlerState();
}

int GetBackgroundFromBufferPointer(u16 *ptr)
{
    if (ptr >= gBG0TilemapBuffer && ptr < gBG0TilemapBuffer + 0x400)
        return 0;
    if (ptr >= gBG1TilemapBuffer && ptr < gBG1TilemapBuffer + 0x400)
        return 1;
    if (ptr >= gBG2TilemapBuffer && ptr < gBG2TilemapBuffer + 0x400)
        return 2;
    if (ptr >= gBG3TilemapBuffer && ptr < gBG3TilemapBuffer + 0x400)
        return 3;
    return -1;
}

struct BgCnt *sBGControlStructPtrs[] =
{
    &gLCDControlBuffer.bg0cnt,
    &gLCDControlBuffer.bg1cnt,
    &gLCDControlBuffer.bg2cnt,
    &gLCDControlBuffer.bg3cnt,
};

void BG_SetPriority(int bg, int priority)
{
    sBGControlStructPtrs[bg]->priority = priority;
}

int BG_GetPriority(int bg)
{
    return sBGControlStructPtrs[bg]->priority;
}

void SetBlendConfig(u16 effect, u8 coeffA, u8 coeffB, u8 blendY)
{
    gLCDControlBuffer.bldcnt.effect = effect;
    gLCDControlBuffer.blendCoeffA = coeffA;
    gLCDControlBuffer.blendCoeffB = coeffB;
    gLCDControlBuffer.blendY = blendY;
}

void SetBlendTargetA(int bg0, int bg1, int bg2, int bg3, int obj)
{
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~BLDCNT_TARGETA(1, 1, 1, 1, 1);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TARGETA(bg0, bg1, bg2, bg3, obj);
}

void SetBlendTargetB(int bg0, int bg1, int bg2, int bg3, int obj)
{
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~BLDCNT_TARGETB(1, 1, 1, 1, 1);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TARGETB(bg0, bg1, bg2, bg3, obj);
}

void SetBlendBackdropA(int a)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = a;
}

void SetBlendBackdropB(int a)
{
    gLCDControlBuffer.bldcnt.target2_bd_on = a;
}

void SetDefaultColorEffects(void)
{
    SetBlendNone();
}

void EnablePaletteSync(void)
{
    sModifiedPalette = 1;
}

void DisablePaletteSync(void)
{
    sModifiedPalette = 0;
}

void BG_EnableSyncByMask(int bg)
{
    sModifiedBGs |= bg;
}

void BG_EnableSync(int bg)
{
    sModifiedBGs |= 1 << bg;
}

void sub_8001FD0(int a)
{
    sModifiedBGs &= ~a;
}

/* The functions below were likely part of a a file called dma.c in the original code,
 * even though they do not use DMA at all. */

void ClearTileRigistry(void)
{
    int i;

    gFrameTmRegisterConfig.count = 0;
    gFrameTmRegisterConfig.size = 0;
    for (i = 0; i < 32; i++)
    {
        gFrameTmRegister[i].src = 0;
        gFrameTmRegister[i].dest = 0;
        gFrameTmRegister[i].size = 0;
        gFrameTmRegister[i].mode = 0;
    }
    gFrameTmRegister[0].src = 0;
}

void RegisterDataMove(const void *src, void *dst, int size)
{
    struct TileDataTransfer *ptr = &gFrameTmRegister[gFrameTmRegisterConfig.count];

    ptr->src = src;
    ptr->dest = dst;
    ptr->size = size;
    ptr->mode = (size & 0x1F) ? 0 : 1;
    gFrameTmRegisterConfig.size += size;
    gFrameTmRegisterConfig.count++;
}

void RegisterFillTile(const void *src, void *dst, int size)
{
    struct TileDataTransfer *ptr = &gFrameTmRegister[gFrameTmRegisterConfig.count];

    ptr->src = src;
    ptr->dest = dst;
    ptr->size = size;
    ptr->mode = 2;
    gFrameTmRegisterConfig.size += size;
    gFrameTmRegisterConfig.count++;
}

void FlushTiles(void)
{
    struct TileDataTransfer *ptr = gFrameTmRegister;
    int i;

    for (i = 0; i < gFrameTmRegisterConfig.count; i++)
    {
        switch (ptr->mode)
        {
        case 0:
            CpuCopy16(ptr->src, ptr->dest, ptr->size);
            break;
        case 1:
            CpuFastCopy(ptr->src, ptr->dest, ptr->size);
            break;
        case 2:
            CpuFastFill((u32)ptr->src, ptr->dest, ptr->size);
            break;
        }
        ptr++;
    }
    ClearTileRigistry();
}

void InitOam(int loSz)
{
    sOamLo.buf = gOam;
    sOamLo.oam = (void *) OAM;
    sOamLo.offset = 0;
    sOamLo.count = loSz;

    sOamHi.buf = gOam + loSz * 4;
    sOamHi.oam = (void *) OAM + loSz * 8;
    sOamHi.offset = loSz * 8;
    sOamHi.count = 0x80 - loSz;
}

void SyncHiOam(void)
{
    CpuFastCopy(sOamHi.buf, sOamHi.oam, sOamHi.count * 8);
    ClearOAMBuffer(sOamHi.buf, sOamHi.count);
    gOamHiPutIt = (u32 *)sOamHi.buf;
    gOamAffinePutIt = gOam;
    gOamAffinePutId = 0;
}

void SyncLoOam(void)
{
    if (sOamLo.count != 0)
    {
        CpuFastCopy(sOamLo.buf, sOamLo.oam, sOamLo.count * 8);
        ClearOAMBuffer(sOamLo.buf, sOamLo.count);
        gOamLoPutIt = sOamLo.buf;
    }
}

void SetObjAffine(int index, s16 pa, s16 pb, s16 pc, s16 pd)
{
    gOam[index * 16 + 3] = pa;
    gOam[index * 16 + 7] = pb;
    gOam[index * 16 + 11] = pc;
    gOam[index * 16 + 15] = pd;
}

struct UnknownDmaStruct2
{
    int attr01;
    u16 attr2;
    s16 x;
    s16 y;
};

void sub_80021E4(struct UnknownDmaStruct2 *a, int _x, int _y)
{
    while (a->attr01 != 1 && gOamHiPutIt < (u32 *)(gOam + 0x80))
    {
        int x = OBJ_X(a->x + _x);
        int y = OBJ_Y(a->y + _y);

        *(u32 *)gOamHiPutIt++ = a->attr01 | (x << 16) | (y);
        *(u16 *)gOamHiPutIt++ = a->attr2;
        a++;
    }
}

int GetPrimaryOAMSize(void)
{
    return sOamLo.count;
}
