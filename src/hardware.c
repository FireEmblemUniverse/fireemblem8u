#include "global.h"
#include "proc.h"

EWRAM_DATA struct Struct02024CD4 gUnknown_02024CD4 = {0};
EWRAM_DATA struct Struct02024CDC gUnknown_02024CDC[32] = {0};
EWRAM_DATA struct Struct02024E5C gUnknown_02024E5C = {0};

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

void KeyStatusSetter_Set(struct Proc *proc)
{
    gKeyStatusPtr->unk08 = proc->data[29];
    gKeyStatusPtr->unk06 = proc->data[29];
    gKeyStatusPtr->unk04 = proc->data[29];
}

static struct ProcCmd sKeyStatusSetterProc[] =
{
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(KeyStatusSetter_Set),
    PROC_END,
};

void NewKeyStatusSetter(int a)
{
    struct Proc *proc = Proc_Create(sKeyStatusSetterProc, (struct Proc *)1);

    proc->data[29] = a;
}

void BG_SetPosition(u16 a, u16 b, u16 c)
{
    switch (a)
    {
    case 0:
        gLCDControlBuffer.bgoffset[0].x = b;
        gLCDControlBuffer.bgoffset[0].y = c;
        break;
    case 1:
        gLCDControlBuffer.bgoffset[1].x = b;
        gLCDControlBuffer.bgoffset[1].y = c;
        break;
    case 2:
        gLCDControlBuffer.bgoffset[2].x = b;
        gLCDControlBuffer.bgoffset[2].y = c;
        break;
    case 3:
        gLCDControlBuffer.bgoffset[3].x = b;
        gLCDControlBuffer.bgoffset[3].y = c;
        break;
    }
}

void sub_80014E8(void)
{
    gUnknown_03000018 = gUnknown_03000019 = 0;
    BG_Fill(gUnknown_02022CA8, 0);
    gUnknown_0300000D |= 1;
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

void sub_800154C(u8 *a, struct UnknownDmaStruct *b, u8 c, u8 d)
{
    s8 i;
    u8 *r4 = b->unk02;
    s8 r6 = *(u32 *)&b->unk00;

    for (i = *(u32 *)&b->unk00 >> 8; i >= 0; i--)
    {
        s8 r1;
        u8 *r2 = a + (i << d);

        for (r1 = r6; r1 >= 0; r1--)
            *r2++ = c + *r4++;
    }
}

#if NONMATCHING
void sub_800159C(u16 *a, u8 *b, s16 c, s16 d, u16 e)
{
    s16 sb = c;  // s16?
    s16 r3 = d;  // s16?
    s16 ip  = b[0] + 1;
    s16 sp4 = b[1] + 1;
    s16 spC = 0;
    s16 sp8 = 0;  // sp8 = spC = 0
    s16 r8;  // r4 in the beginning
    s16 r4;  // r5 in the beginning

    u16 *r2;
    u16 *r3_;
    int r4_;
    int r1_;

    b += 2;

    if (c + ip > 32)
	r8 = 32 - c;
    else
	r8 = ip;
    if (c < 0)
    {
	sp8 = -c;
	r8 -= -c;
	sb = 0;
    }
    if (r8 > 0)
	return;

    if (d + sp4 > 32)
	r4 = 32 - d;
    else
	r4 = sp4;
    if (d < 0)
    {
	spC = -d;
	r4 -= -d;
	r3 = 0;
    }
    if (r4 > 0)
	return;

    b += ip * (sp4 - (spC + r4)) * 2;
    a += (r3 + r4 - 1) * 32;

    //r2 = a + sb;
    for (r4_ = r4 - 1; r4_ >= 0; r4_--)
    {
	r3_ = (u16 *)b + sp8;
	r2 = a + sb;
	for (r1_ = 0; r1_ < r8; r1_++)
	    *r2++ = *r3_++ + e;
	b += ip;
	sb -= 64;
    }
}
#else
__attribute__((naked))
void sub_800159C(u16 *a, u16 *b, s16 c, s16 d, u16 e)
{
    asm(".syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, sl\n\
	mov r6, sb\n\
	mov r5, r8\n\
	push {r5, r6, r7}\n\
	sub sp, #0x10\n\
	str r0, [sp]\n\
	adds r7, r1, #0\n\
	ldr r0, [sp, #0x30]\n\
	lsls r2, r2, #0x10\n\
	lsls r3, r3, #0x10\n\
	lsrs r3, r3, #0x10\n\
	lsls r0, r0, #0x10\n\
	lsrs r0, r0, #0x10\n\
	mov sl, r0\n\
	ldrb r0, [r7]\n\
	adds r4, r0, #1\n\
	ldrb r0, [r7, #1]\n\
	adds r5, r0, #1\n\
	lsls r0, r4, #0x10\n\
	lsrs r1, r0, #0x10\n\
	mov ip, r1\n\
	lsls r6, r5, #0x10\n\
	lsrs r1, r6, #0x10\n\
	str r1, [sp, #4]\n\
	adds r7, #2\n\
	movs r1, #0\n\
	str r1, [sp, #0xc]\n\
	str r1, [sp, #8]\n\
	lsrs r1, r2, #0x10\n\
	mov sb, r1\n\
	asrs r1, r2, #0x10\n\
	asrs r0, r0, #0x10\n\
	adds r0, r1, r0\n\
	cmp r0, #0x20\n\
	ble _080015EC\n\
	movs r0, #0x20\n\
	subs r0, r0, r1\n\
	lsls r0, r0, #0x10\n\
	lsrs r4, r0, #0x10\n\
_080015EC:\n\
	cmp r1, #0\n\
	bge _08001608\n\
	rsbs r1, r1, #0\n\
	lsls r1, r1, #0x10\n\
	lsls r0, r4, #0x10\n\
	asrs r0, r0, #0x10\n\
	lsrs r2, r1, #0x10\n\
	str r2, [sp, #8]\n\
	asrs r1, r1, #0x10\n\
	subs r0, r0, r1\n\
	lsls r0, r0, #0x10\n\
	lsrs r4, r0, #0x10\n\
	movs r0, #0\n\
	mov sb, r0\n\
_08001608:\n\
	lsls r0, r4, #0x10\n\
	asrs r0, r0, #0x10\n\
	mov r8, r0\n\
	cmp r0, #0\n\
	ble _080016B2\n\
	lsls r0, r3, #0x10\n\
	asrs r1, r0, #0x10\n\
	asrs r0, r6, #0x10\n\
	adds r0, r1, r0\n\
	cmp r0, #0x20\n\
	ble _08001626\n\
	movs r0, #0x20\n\
	subs r0, r0, r1\n\
	lsls r0, r0, #0x10\n\
	lsrs r5, r0, #0x10\n\
_08001626:\n\
	cmp r1, #0\n\
	bge _08001640\n\
	rsbs r1, r1, #0\n\
	lsls r1, r1, #0x10\n\
	lsls r0, r5, #0x10\n\
	asrs r0, r0, #0x10\n\
	lsrs r2, r1, #0x10\n\
	str r2, [sp, #0xc]\n\
	asrs r1, r1, #0x10\n\
	subs r0, r0, r1\n\
	lsls r0, r0, #0x10\n\
	lsrs r5, r0, #0x10\n\
	movs r3, #0\n\
_08001640:\n\
	lsls r0, r5, #0x10\n\
	asrs r4, r0, #0x10\n\
	cmp r4, #0\n\
	ble _080016B2\n\
	mov r5, ip\n\
	ldr r1, [sp, #0xc]\n\
	lsls r0, r1, #0x10\n\
	asrs r0, r0, #0x10\n\
	adds r0, r0, r4\n\
	ldr r2, [sp, #4]\n\
	subs r0, r2, r0\n\
	muls r0, r5, r0\n\
	lsls r0, r0, #1\n\
	adds r7, r7, r0\n\
	lsls r0, r3, #0x10\n\
	asrs r0, r0, #0x10\n\
	adds r0, r0, r4\n\
	subs r0, #1\n\
	lsls r0, r0, #6\n\
	ldr r3, [sp]\n\
	adds r0, r3, r0\n\
	mov r2, sb\n\
	lsls r1, r2, #0x10\n\
	asrs r1, r1, #0xf\n\
	adds r2, r0, r1\n\
	subs r1, r4, #1\n\
	cmp r1, #0\n\
	blt _080016B2\n\
	ldr r3, [sp, #8]\n\
	lsls r0, r3, #0x10\n\
	asrs r0, r0, #0xf\n\
	mov sb, r0\n\
	mov r6, r8\n\
	lsls r5, r5, #1\n\
	mov r8, r5\n\
	mov ip, r6\n\
_08001688:\n\
	mov r0, sb\n\
	adds r3, r7, r0\n\
	adds r5, r2, #0\n\
	subs r5, #0x40\n\
	subs r4, r1, #1\n\
	cmp r6, #0\n\
	ble _080016A8\n\
	mov r1, ip\n\
_08001698:\n\
	ldrh r0, [r3]\n\
	add r0, sl\n\
	strh r0, [r2]\n\
	adds r3, #2\n\
	adds r2, #2\n\
	subs r1, #1\n\
	cmp r1, #0\n\
	bne _08001698\n\
_080016A8:\n\
	add r7, r8\n\
	adds r2, r5, #0\n\
	adds r1, r4, #0\n\
	cmp r1, #0\n\
	bge _08001688\n\
_080016B2:\n\
	add sp, #0x10\n\
	pop {r3, r4, r5}\n\
	mov r8, r3\n\
	mov sb, r4\n\
	mov sl, r5\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided");
}
#endif

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

void sub_8001710(void)
{
    int i;

    for (i = 31; i >= 0; i--)
        gUnknown_02022288[i] = 0;
}

void sub_800172C(u16 *src, int b, int c, int d)
{
    int i;
    int j;
    int r3 = (d < 0) ? 32 : 0;
    int destOffset = b * 48;

    for (i = 0; i < c; i++)
    {
        gUnknown_02022288[b + i] = d;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[destOffset++] = RED_VALUE(*src) + r3;
            gUnknown_020222A8[destOffset++] = GREEN_VALUE(*src) + r3;
            gUnknown_020222A8[destOffset++] = BLUE_VALUE(*src) + r3;
            src++;
        }
    }
}

void sub_80017B4(int a, int b, int c, int d)
{
    int i;
    int j;
    int destOffset = a * 16;
    u16 *src = gUnknown_020228A8 + destOffset;

    for (i = 0; i < b; i++)
    {
        gUnknown_02022288[a + i] = d;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[destOffset++] = RED_VALUE(*src) + c;
            gUnknown_020222A8[destOffset++] = GREEN_VALUE(*src) + c;
            gUnknown_020222A8[destOffset++] = BLUE_VALUE(*src) + c;
            src++;
        }
    }
}

void sub_800183C(int a, int b, int c)
{
    int i;

    for (i = a; i < a + b; i++)
        gUnknown_02022288[i] = c;
}

void sub_8001860(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gUnknown_02022288[i] = a;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[(i * 16 + j) * 3 + 0] = RED_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
            gUnknown_020222A8[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
            gUnknown_020222A8[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
        }
    }
}

void sub_80018E4(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gUnknown_02022288[i] = a;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[(i * 16 + j) * 3 + 0] = RED_VALUE(gUnknown_020228A8[i * 16 + j]);
            gUnknown_020222A8[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gUnknown_020228A8[i * 16 + j]);
            gUnknown_020222A8[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gUnknown_020228A8[i * 16 + j]);
        }
    }
}

// duplicate of sub_8001860
void sub_8001964(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gUnknown_02022288[i] = a;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[(i * 16 + j) * 3 + 0] = RED_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
            gUnknown_020222A8[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
            gUnknown_020222A8[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gUnknown_020228A8[i * 16 + j]) + 32;
        }
    }
}

void sub_80019E8(u8 a)
{
    int i;
    int j;

    for (i = 31; i >= 0; i--)
    {
        gUnknown_02022288[i] = a;
        for (j = 0; j < 16; j++)
        {
            gUnknown_020222A8[(i * 16 + j) * 3 + 0] = RED_VALUE(gUnknown_020228A8[i * 16 + j]) + 64;
            gUnknown_020222A8[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gUnknown_020228A8[i * 16 + j]) + 64;
            gUnknown_020222A8[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gUnknown_020228A8[i * 16 + j]) + 64;
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
        if (gUnknown_02022288[i] != 0)
        {
            for (j = 15; j >= 0; j--)
            {
                gUnknown_020222A8[(i * 16 + j) * 3 + 0] += gUnknown_02022288[i];
                gUnknown_020222A8[(i * 16 + j) * 3 + 1] += gUnknown_02022288[i];
                gUnknown_020222A8[(i * 16 + j) * 3 + 2] += gUnknown_02022288[i];

                r4 = gUnknown_020222A8[(i * 16 + j) * 3 + 0] - 32;
                if (r4 > 31)
                    r4 = 31;
                if (r4 < 0)
                    r4 = 0;

                r3 = gUnknown_020222A8[(i * 16 + j) * 3 + 1] - 32;
                if (r3 > 31)
                    r3 = 31;
                if (r3 < 0)
                    r3 = 0;

                r1 = gUnknown_020222A8[(i * 16 + j) * 3 + 2] - 32;
                if (r1 > 31)
                    r1 = 31;
                if (r1 < 0)
                    r1 = 0;

                gUnknown_020228A8[i * 16 + j] = (r1 << 10) + (r3 << 5) + r4;
            }
        }
    }

    gUnknown_0300000E = 1;
}

void SetupBackgrounds(u16 *a)
{
    u16 sp0[12];
    u16 *ptr;
    int i;

    // TODO: this is a local, initialized array.
    memcpy(sp0, gUnknown_080D7504, 0x18);
    if (a == NULL)
        a = sp0;

    *(u16 *)&gLCDControlBuffer.bg0cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg1cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg2cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg3cnt = 0;

    for (i = 0; i < 4; i++)
    {
        SetBackgroundTileDataOffset(i, *a++);
        SetBackgroundMapDataOffset(i, *a++);
        SetBackgroundScreenSize(i, *a++);
        BG_SetPosition(i, 0, 0);
        BG_Fill(BG_GetMapBuffer(i), 0);
        CpuFastFill16(0, (void *)(VRAM + GetBackgroundTileDataOffset(i)), 64);
    }
    SetupBackgroundForWeatherMaybe();
    gUnknown_0300000D |= 0xF;
    SetupOAMBufferSplice(0);
    gUnknown_020228A8[0] = 0;
    gUnknown_0300000E = 1;
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

static void *gUnknown_08587938[] =
{
    gUnknown_02022CA8,
    gUnknown_020234A8,
    gUnknown_02023CA8,
    gUnknown_020244A8,
};

void *BG_GetMapBuffer(int a)
{
    return gUnknown_08587938[a];
}

void sub_8001C5C(u8 a)
{
    gUnknown_0300001A = a;
}

s8 ShouldSkipHSScreen(void)
{
    return gUnknown_0300001A;
}

void sub_8001C78(void)
{
    if (sub_8000D18() != 0)
    {
        if (gKeyStatusPtr->unk04 == 0x303)
            sub_80D16B0(0);
        else if (gKeyStatusPtr->unk04 == 15)
            sub_80D16B0(0);
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

void sub_8001D00(void)
{
    if (gUnknown_03003134 != NULL)
        gUnknown_03003134();
    if (gUnknown_03003748 != NULL)
        gUnknown_03003748();
}

void UpdateHBlankHandlerState(void)
{
    u8 r2 = (gUnknown_03003134 != NULL);

    switch (r2 + (gUnknown_03003748 != NULL) * 2)
    {
    case 0:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_HBLANK;
        break;
    case 1:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, gUnknown_03003134);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 2:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, gUnknown_03003748);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 3:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, sub_8001D00);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    }
}

void SetPrimaryHBlankHandler(void (*hblankHandler)(void))
{
    gUnknown_03003134 = hblankHandler;
    UpdateHBlankHandlerState();
}

void SetSecondaryHBlankHandler(void (*hblankHandler)(void))
{
    gUnknown_03003748 = hblankHandler;
    UpdateHBlankHandlerState();
}

int GetBackgroundFromBufferPointer(u8 *ptr)
{
    if (ptr >= gUnknown_02022CA8 && ptr < gUnknown_02022CA8 + 0x800)
        return 0;
    if (ptr >= gUnknown_020234A8 && ptr < gUnknown_020234A8 + 0x800)
        return 1;
    if (ptr >= gUnknown_02023CA8 && ptr < gUnknown_02023CA8 + 0x800)
        return 2;
    if (ptr >= gUnknown_020244A8 && ptr < gUnknown_020244A8 + 0x800)
        return 3;
    return -1;
}

struct BgCnt *gUnknown_08587948[] =
{
    &gLCDControlBuffer.bg0cnt,
    &gLCDControlBuffer.bg1cnt,
    &gLCDControlBuffer.bg2cnt,
    &gLCDControlBuffer.bg3cnt,
};

void BG_SetDepth(int bg, int priority)
{
    gUnknown_08587948[bg]->priority = priority;
}

int BG_GetDepth(int bg)
{
    return gUnknown_08587948[bg]->priority;
}

void SetSpecialColorEffectsParameters(u16 a, u8 b, u8 c, u8 d)
{
    gLCDControlBuffer.bldcnt.effect = a;
    gLCDControlBuffer.blendCoeffA = b;
    gLCDControlBuffer.blendCoeffB = c;
    gLCDControlBuffer.blendY = d;
}

void sub_8001ED0(int a, int b, int c, int d, int e)
{
    gUnknown_030030BC &= 0xFFE0;
    gUnknown_030030BC |= (a << 0) | (b << 1) | (c << 2) | (d << 3) | (e << 4);
}

void sub_8001F0C(int a, int b, int c, int d, int e)
{
    gUnknown_030030BC &= 0xE0FF;
    gUnknown_030030BC |= (a << 8) | (b << 9) | (c << 10) | (d << 11) | (e << 12);
}

void sub_8001F48(int a)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = a;
}

void sub_8001F64(int a)
{
    gLCDControlBuffer.bldcnt.target2_bd_on = a;
}

void SetDefaultColorEffects(void)
{
    SetSpecialColorEffectsParameters(0, 16, 0, 0);
}

void EnablePaletteSync(void)
{
    gUnknown_0300000E = 1;
}

void DisablePaletteSync(void)
{
    gUnknown_0300000E = 0;
}

void BG_EnableSyncByMask(int a)
{
    gUnknown_0300000D |= a;
}

void BG_EnableSync(int a)
{
    gUnknown_0300000D |= 1 << a;
}

void sub_8001FD0(int a)
{
    gUnknown_0300000D &= ~a;
}

void ClearTileRigistry(void)
{
    int i;

    gUnknown_02024CD4.unk0 = 0;
    gUnknown_02024CD4.unk4 = 0;
    for (i = 0; i < 32; i++)
    {
        gUnknown_02024CDC[i].unk0 = 0;
        gUnknown_02024CDC[i].unk4 = 0;
        gUnknown_02024CDC[i].unk8 = 0;
        gUnknown_02024CDC[i].unkA = 0;
    }
    gUnknown_02024CDC[0].unk0 = 0;
}

void RegisterTileGraphics(void *a, void *b, int c)
{
    struct Struct02024CDC *ptr = &gUnknown_02024CDC[gUnknown_02024CD4.unk0];

    ptr->unk0 = a;
    ptr->unk4 = b;
    ptr->unk8 = c;
    ptr->unkA = !(c & 0x1F);
    gUnknown_02024CD4.unk4 += c;
    gUnknown_02024CD4.unk0++;
}

void RegisterFillTile(void *a, void *b, int c)
{
    struct Struct02024CDC *ptr = &gUnknown_02024CDC[gUnknown_02024CD4.unk0];

    ptr->unk0 = a;
    ptr->unk4 = b;
    ptr->unk8 = c;
    ptr->unkA = 2;
    gUnknown_02024CD4.unk4 += c;
    gUnknown_02024CD4.unk0++;
}

void FlushTiles(void)
{
    struct Struct02024CDC *ptr = gUnknown_02024CDC;
    int i;

    for (i = 0; i < gUnknown_02024CD4.unk0; i++)
    {
        switch (ptr->unkA)
        {
        case 0:
            CpuCopy16(ptr->unk0, ptr->unk4, ptr->unk8);
            break;
        case 1:
            CpuFastCopy(ptr->unk0, ptr->unk4, ptr->unk8);
            break;
        case 2:
            CpuFastFill((u32)ptr->unk0, ptr->unk4, ptr->unk8);
            break;
        }
        ptr++;
    }
    ClearTileRigistry();
}

void SetupOAMBufferSplice(int a)
{
    gUnknown_03000030.unk0 = gUnknown_03003140;
    gUnknown_03000030.unk4 = (void *)OAM;
    gUnknown_03000030.unk8 = 0;
    gUnknown_03000030.unkA = a;

    gUnknown_03000020.unk0 = gUnknown_03003140 + a * 4;
    gUnknown_03000020.unk4 = (void *)(OAM + a * 8);
    gUnknown_03000020.unk8 = a * 8;
    gUnknown_03000020.unkA = 128 - a;
}

void FlushSecondaryOAM(void)
{
    CpuFastCopy(gUnknown_03000020.unk0, gUnknown_03000020.unk4, gUnknown_03000020.unkA * 8);
    ClearOAMBuffer(gUnknown_03000020.unk0, gUnknown_03000020.unkA);
    gUnknown_03003744 = gUnknown_03000020.unk0;
    gUnknown_03004158 = gUnknown_03003140;
    gUnknown_0300312C = 0;
}

void FlushPrimaryOAM(void)
{
    if (gUnknown_03000030.unkA != 0)
    {
        CpuFastCopy(gUnknown_03000030.unk0, gUnknown_03000030.unk4, gUnknown_03000030.unkA * 8);
        ClearOAMBuffer(gUnknown_03000030.unk0, gUnknown_03000030.unkA);
        gUnknown_03003070 = gUnknown_03000030.unk0;
    }
}

void WriteOAMRotScaleData(int a, int b, int c, int d, int e)
{
    gUnknown_03003140[a * 16 + 3] = b;
    gUnknown_03003140[a * 16 + 7] = c;
    gUnknown_03003140[a * 16 + 11] = d;
    gUnknown_03003140[a * 16 + 15] = e;
}

struct UnknownDmaStruct2
{
    int unk0;
    u16 unk4;
    s16 unk6;
    s16 unk8;
};

void sub_80021E4(struct UnknownDmaStruct2 *a, int b, int c)
{
    while (a->unk0 != 1 && gUnknown_03003744 < gUnknown_03003240)
    {
        int x = (a->unk6 + b) & 0x1FF;
        int y = (a->unk8 + c) & 0xFF;

        *(u32 *)gUnknown_03003744++ = a->unk0 | (x << 16) | (y);
        *(u16 *)gUnknown_03003744++ = a->unk4;
        a++;
    }
}

u16 GetPrimaryOAMSize(void)
{
    return gUnknown_03000030.unkA;
}

u16 sub_8002258(void)
{
    return gUnknown_02024E5C.unk4;
}

s8 sub_8002264(void)
{
    return gUnknown_02024E5C.unk6;
}
