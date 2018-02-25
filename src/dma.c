#include "global.h"

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

void BG_SetPosition(u16 a, u16 b, u16 c)
{
    switch (a)
    {
    case 0:
        gUnknown_03003080.unk1C[0] = b;
        gUnknown_03003080.unk1C[1] = c;
        break;
    case 1:
        gUnknown_03003080.unk1C[2] = b;
        gUnknown_03003080.unk1C[3] = c;
        break;
    case 2:
        gUnknown_03003080.unk1C[4] = b;
        gUnknown_03003080.unk1C[5] = c;
        break;
    case 3:
        gUnknown_03003080.unk1C[6] = b;
        gUnknown_03003080.unk1C[7] = c;
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

#if 0
void sub_800159C(u32 a, u8 *b, s16 c, s16 d, u16 e)
{
    u16 r4 = b[0] + 1;
    s16 r12 = r4;
    u16 r5 = b[1] + 1;
    u16 sp4 = r5;
    s16 spC;
    s16 sp8;
    u16 r9;
    u16 r3;
    u16 *r2;
    int r1;

    b += 2;
    spC = 0;
    sp8 = 0;
    r9 = c;
    r3 = d;

    if (c + r12 > 32)
        r4 = 32 - c;
    if (c < 0)
    {
        sp8 = -c;
        r4 -= sp8;
        r9 = 0;
    }
    if (r4 <= 0)
        return;
    if (d + r5 > 32)
        r5 = 32 - d;
    if (d < 0)
    {
        spC = -d;
        r5 -= -d;
        r3 = 0;
    }
    if (r5 <= 0)
        return;
    #define r4_ r5
    #define r5_ r4

    b += r5_ * (sp4 - (r4_ + spC));
    r2 = (u16 *)(a + (r3 + r4_ - 1) * 64) + r9;

    //r1 = r4_ - 1;
    //while (r1 >= 0)
    for (r1 = r4_ - 1; r1 >= 0; r1--)
    {
        int j;
        u16 *r3 = (u16 *)(a + sp8 * 2);

        for (j = r4; j >= 0; j--)
            *r2++ = *r3++ + e;
        a += r5_ * 2;
        r2 -= 32;
    }
}
#endif

__attribute__((naked))
void sub_800159C(u32 a, u8 *b, s16 c, s16 d, u16 e)
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
    /*
    gUnknown_03003080.unkC[0] = 0;
    gUnknown_03003080.unkC[2] = 0;
    gUnknown_03003080.unkC[4] = 0;
    gUnknown_03003080.unkC[6] = 0;
    */
    ptr = gUnknown_03003080.unkC;
    ptr[0] = 0;
    ptr[2] = 0;
    ptr[4] = 0;
    ptr[6] = 0;
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
    gUnknown_03003080.unk0_7 = 0;
    gUnknown_03003080.unk0_0 = 0;
    gUnknown_03003080.unk1_5 = 0;
    gUnknown_03003080.unk1_6 = 0;
    gUnknown_03003080.unk1_7 = 0;
    gUnknown_03003080.unk1_0 = 1;
    gUnknown_03003080.unk1_1 = 1;
    gUnknown_03003080.unk1_2 = 1;
    gUnknown_03003080.unk1_3 = 1;
    gUnknown_03003080.unk1_4 = 1;
}

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
        if (gUnknown_0858791C->unk2 == 0x303)
            sub_80D16B0(0);
        else if (gUnknown_0858791C->unk2 == 15)
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
        gUnknown_03003080.unk4_4 = 0;
        REG_IE &= ~INTR_FLAG_HBLANK;
        break;
    case 1:
        gUnknown_03003080.unk4_4 = 1;
        SetIRQHandler(1, gUnknown_03003134);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 2:
        gUnknown_03003080.unk4_4 = 1;
        SetIRQHandler(1, gUnknown_03003748);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 3:
        gUnknown_03003080.unk4_4 = 1;
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
    gUnknown_03003080.unk3C_6 = a;
    gUnknown_03003080.unk44 = b;
    gUnknown_03003080.unk45 = c;
    gUnknown_03003080.unk46 = d;
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
    gUnknown_03003080.unk3C_5 = a;
}

void sub_8001F64(int a)
{
    gUnknown_03003080.unk3D_5 = a;
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

/*
void sub_80021E4(struct UnknownDmaStruct2 *a, int b, int c)
{
    while (a->unk0 != 1 && gUnknown_03003744 < gUnknown_03003240)
    {
        int x = ((a->unk6 + b) & 0x1FF);
        int y = (a->unk8 + c) & 0xFF;
        
        *((u32 *)gUnknown_03003744)++ = a->unk0 | (y << 16) | (x);
        *(u16 *)gUnknown_03003744 = a->unk4;
        gUnknown_03003744 += 4;
        a++;
    }
}
*/
