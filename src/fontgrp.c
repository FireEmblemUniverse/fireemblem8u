#include <stdarg.h>
#include <stdio.h>

#include "global.h"

struct Struct02026E30
{
    u32 tileDataOffset;
    s16 bg;
    u16 tileIndex;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    char unk14[256][32];
};

extern struct Struct02026E30 gUnknown_02026E30;

void SetupDebugFontForBG(int bg, int tileDataOffset)
{
    if (tileDataOffset == 0)
        tileDataOffset = 0x5800;

    SetBackgroundTileDataOffset(bg, 0);
    SetBackgroundScreenSize(bg, 0);
    RegisterTileGraphics(gUnknown_08587A40, (void *)(VRAM + (tileDataOffset & 0x1FFFF)), 0x800);

    gPaletteBuffer[0] = 0;
    gPaletteBuffer[2] = RGB(31, 31, 31);
    EnablePaletteSync();

    BG_Fill(BG_GetMapBuffer(bg), 0);

    gUnknown_02026E30.bg = bg;
    gUnknown_02026E30.tileDataOffset = tileDataOffset;
    gUnknown_02026E30.tileIndex = GetTileIndex(bg, tileDataOffset);
}

void PrintDebugStringToBG(u16 *dest, const char *str)
{
    int i;

    while (*str != 0)
    {
        int tileIndex;
        register u32 r6 asm("r6");

        if (*str > 0x60)
            tileIndex = gUnknown_02026E30.tileIndex + (u16)-0x40;
        else
            tileIndex = gUnknown_02026E30.tileIndex - 0x20;

        r6 = *str;
        tileIndex += r6;
        *dest++ = tileIndex;
        str++;
    }

    BG_EnableSync(gUnknown_02026E30.bg);
}

void sub_800384C(u16 *dest, const char *fmt, ...)
{
    va_list args;
    char buffer[256];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);

    PrintDebugStringToBG(dest, buffer);
}

void sub_8003870(void)
{
    int i;

    for (i = 0; i < 256; i++)
        gUnknown_02026E30.unk14[i & 0xFF][0] = 0;

    gUnknown_02026E30.unk8 = 0;
    gUnknown_02026E30.unkC = 0;

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(1 << 2);
}

void sub_80038B4(const char *fmt, ...)
{
    char buffer[256];

    // print an empty buffer? uh... okay.
    PrintStringToDBG(buffer);
}

void ClearSmallStringBuffer(void)
{
    u32 *ptr = (u32 *)gUnknown_02028E44;
    const u32 fourSpaces = 0x20202020;

    *ptr++ = fourSpaces;
    *ptr++ = fourSpaces;
    gUnknown_02028E44[8] = 0;
}

void StoreNumberStringToSmallBuffer(int n)
{
    int i;

    ClearSmallStringBuffer();
    for (i = 7; i >= 0; i--)
    {
        gUnknown_02028E44[i] = '0' + n % 10;
        n /= 10;
        if (n == 0)
            break;
    }
}

void StoreNumberStringOrDashesToSmallBuffer(int n)
{
    ClearSmallStringBuffer();
    if (n == 255 || n == -1)
    {
        gUnknown_02028E44[7] = ':';
        gUnknown_02028E44[6] = ':';
    }
    else
    {
        StoreNumberStringToSmallBuffer(n);
    }
}

void sub_800394C(int n, int length)
{
    StoreNumberStringToSmallBuffer(n);
    PrintStringToDBG(gUnknown_02028E44 + 8 - length);
}

void StoreNumberHexStringToSmallBuffer(int n)
{
    int i;

    ClearSmallStringBuffer();
    for (i = 7; i >= 0; i--)
    {
        gUnknown_02028E44[i] = gUnknown_080D779C[(n & 0xF)];
        n >>= 4;
        if (n == 0)
            break;
    }
}

void sub_80039B4(int n, int length)
{
    StoreNumberHexStringToSmallBuffer(n);
    PrintStringToDBG(gUnknown_02028E44 + 8 - length);
}

void PrintStringToDBG(const char *str)
{
    while (*str != 0)
    {
        int c = *str;

        if (gUnknown_02026E30.unk8 == 0x30)
            c = 0;
        else
            str++;
        if (c == '\n')
            c = 0;

        gUnknown_02026E30.unk14[gUnknown_02026E30.unkC & 0xFF][gUnknown_02026E30.unk8] = c;
        gUnknown_02026E30.unk8++;
        if (c == 0)
        {
            gUnknown_02026E30.unk8 = 0;
            gUnknown_02026E30.unkC++;
        }
    }
    if (gUnknown_02026E30.unkC > gUnknown_02026E30.unk10 + 20)
        gUnknown_02026E30.unk10 = gUnknown_02026E30.unkC - 20;
}

void FlushDBGToBG2(void)
{
    int i;

    BG_Fill(gBG2TilemapBuffer, 0);
    for (i = 0; i < 20; i++)
    {
        u16 *r3 = (u16 *)(gBG2TilemapBuffer + i * 64);

        if (gUnknown_02026E30.unk14[(i + gUnknown_02026E30.unk10) & 0xFF][0] != 0)
        {
            int j = 0;

            while (gUnknown_02026E30.unk14[(i + gUnknown_02026E30.unk10) & 0xFF][j] != 0)
            {
                u16 r2 = gUnknown_02026E30.unk14[(i + gUnknown_02026E30.unk10) & 0xFF][j];

                if (r2 > 0x60)
                    r2 -= 0x40;
                else
                    r2 -= 0x20;
                *r3++ = gUnknown_02026E30.tileIndex + r2;

                j++;
            }
        }
    }

    BG_EnableSyncByMask(1 << 2);
}

int sub_8003ABC(u16 a, u16 b)
{
    int r1;
    int r2;

    if (b & 2)
        return 0;

    FlushDBGToBG2();
    r1 = gUnknown_02026E30.unkC - 256;
    if (r1 < 0)
        r1 = 0;
    r2 = gUnknown_02026E30.unkC - 20;
    if (r2 < 0)
        r2 = 0;

    if ((a & 0x40) && r1 < gUnknown_02026E30.unk10)
        gUnknown_02026E30.unk10--;
    if ((a & 0x80) && r2 > gUnknown_02026E30.unk10)
        gUnknown_02026E30.unk10++;

    return 1;
}

void SetupDebugFontForOBJ(int a, int b)
{
    int offset;

    if (a < 0)
        a = 0x3000;
    a &= 0xFFFF;

    gUnknown_02028E50 = a / 32;
    gUnknown_02028E54 = (b & 0xF) << 12;

    RegisterTileGraphics(gUnknown_08587A40, (void *)(VRAM + ((a + 0x10000) & 0x1FFFF)), 0x800);

    gPaletteBuffer[(b + 16) * 16 + 0] = 0;
    gPaletteBuffer[(b + 16) * 16 + 1] = 0x7C00;
    gPaletteBuffer[(b + 16) * 16 + 2] = RGB(31, 31, 31);

    EnablePaletteSync();
}

void PrintDebugStringAsOBJ(int a, int b, const char *str)
{
    while (*str != 0)
    {
        char c;

        if (*str > 0x60)
            c = *str - 0x40;
        else
            c = *str - 0x20;

        CallARM_PushToSecondaryOAM(a, b, gUnknown_08590F44, c + gUnknown_02028E50 + gUnknown_02028E54);

        a += 8;
        str++;
    }
}

void sub_8003BFC(int a, int b, int c, int length)
{
    StoreNumberStringToSmallBuffer(c);
    PrintDebugStringAsOBJ(a, b, gUnknown_02028E44 + 8 - length);
}

void sub_8003C20(int a, int b, int c, int length)
{
    StoreNumberHexStringToSmallBuffer(c);
    PrintDebugStringAsOBJ(a, b, gUnknown_02028E44 + 8 - length);
}

void sub_8003C44(s16 a, s16 b, const char *fmt, ...)
{
    va_list args;
    char buffer[256];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);

    PrintDebugStringAsOBJ(a, b, buffer);
}

int GetSomeByte(void)
{
    return gUnknown_02028E74;
}

void SetSomeByte(int a)
{
    gUnknown_02028E74 = a;
}

void Font_InitForUIDefault(void)
{
    Font_InitForUI(&gUnknown_02028E58, (void *)(VRAM + 0x1000), 0x80, 0);
    gUnknown_02028E78 = 0xFF;
}

void Font_InitForUI(struct Font *a, void *b, int c, int d)
{
    if (a == NULL)
        a = &gUnknown_02028E58;
    a->unk0 = b;
    a->unkC = GetVRAMPointerForTextMaybe;
    a->unk14 = d;
    a->unk10 = c + (d << 12);
    a->unk12 = 0;
    a->unk16 = GetSomeByte();
    SetFont(a);
    Font_LoadForUI();
}

void SetFontGlyphSet(int a)
{
    if (a == 0)
        gUnknown_02028E70->unk4 = gUnknown_0858C7EC;
    else
        gUnknown_02028E70->unk4 = gUnknown_0858F6F4;
}

void sub_8003D20(void)
{
    gUnknown_02028E70->unk12 = 0;
    gUnknown_02028E78 = 0xFF;
}

void SetFont(struct Font *a)
{
    if (a == NULL)
        gUnknown_02028E70 = &gUnknown_02028E58;
    else
        gUnknown_02028E70 = a;
}

void Text_Init(struct Text *a, int b)
{
    a->unk0 = gUnknown_02028E70->unk12;
    a->unk4 = b;
    a->unk6 = 0;
    a->unk5 = 0;
    a->unk7 = 0;
    gUnknown_02028E70->unk12 += b;
    Text_Clear(a);
}

void Text_Allocate(struct Text *a, int b)
{
    a->unk0 = gUnknown_02028E70->unk12;
    a->unk4 = b;
    a->unk6 = 0;
    a->unk5 = 1;
    a->unk7 = 0;
    gUnknown_02028E70->unk12 += b * 2;
}

void InitTextBatch(struct UnknownTextStruct2 *a)
{
    while (a->unk0 != NULL)
    {
        Text_Init(a->unk0, a->unk4);
        a++;
    }
}

void Text_Clear(struct Text *a)
{
    a->unk2 = 0;
    a->unk3 = 0;
    CpuFastFill16(0, gUnknown_02028E70->unkC(a), a->unk4 * 64);
}

void sub_8003E00(struct Text *a, int b, int c)
{
    void *dest = gUnknown_02028E70->unk0 + (a->unk6 * a->unk4 + a->unk0 + b) * 64;

    CpuFastFill16(0, dest, c * 64);
}

int sub_8003E40(struct Text *a)
{
    return (a->unk6 * a->unk4 + a->unk0) * 2;
}

int Text_GetXCursor(struct Text *a)
{
    return a->unk2;
}

void Text_SetXCursor(struct Text *a, int x)
{
    a->unk2 = x;
}

void Text_Advance(struct Text *a, int x)
{
    a->unk2 += x;
}

void Text_SetColorId(struct Text *a, int colorId)
{
    a->unk3 = colorId;
}

int Text_GetColorId(struct Text *a)
{
    return a->unk3;
}

void Text_SetParameters(struct Text *a, int x, int colorId)
{
    a->unk2 = x;
    a->unk3 = colorId;
}

void Text_Draw(struct Text *a, u16 *dest)
{
    int tileEntry = gUnknown_02028E70->unk10 + (a->unk6 * a->unk4 + a->unk0) * 2;
    int columns = a->unk4;
    int i;

    for (i = 0; i < columns; i++)
    {
        dest[0] = tileEntry;
        tileEntry++;
        dest[32] = tileEntry;
        tileEntry++;
        dest++;
    }

    if (a->unk5 != 0)
        a->unk6 ^= 1;
}

void Text_DrawBlank(struct Text *a, u16 *dest)
{
    int columns = a->unk4;
    int i;

    for (i = 0; i < columns; i++)
    {
        dest[0] = 0;
        dest[32] = 0;
        dest++;
    }
}

// some sort of linked list node
struct UnknownTextStruct3
{
    struct UnknownTextStruct3 *next;
    u8 unk4;
    u8 unk5;
};

int GetStringTextWidth(const char *str)
{
    int r4 = 0;
    struct UnknownTextStruct3 *r1;
    char c;
    char r0;

    if (gUnknown_02028E70->unk16 != 0)
        return GetStringTextWidthSimple(str);
    while (*str > 1)
    {
        c = *str++;
        if (c >= 0x20)
        {
            r0 = *str++;
            r1 = gUnknown_02028E70->unk4[r0 - 0x40];
            while (r1 != NULL)
            {
                if (r1->unk4 == c)
                {
                    r4 += r1->unk5;
                    break;
                }
                r1 = r1->next;
            }
        }
    }
    return r4;
}

char *GetCharTextWidth(char *a, u32 *b)
{
    struct UnknownTextStruct3 *r1;
    char c;
    char r0;

    if (gUnknown_02028E70->unk16 != 0)
        return GetCharTextWidthSimple(a, b);

    c = *a++;
    r0 = *a++;
    r1 = gUnknown_02028E70->unk4[r0 - 0x40];
    while (r1 != NULL)
    {
        if (r1->unk4 == c)
        {
            *b = r1->unk5;
            break;
        }
        r1 = r1->next;
    }
    return a;
}

int GetStringTextCenteredPos(int x, char *str)
{
    return (x - GetStringTextWidth(str)) / 2;
}

void sub_8003FAC(int unused, int *b, int *c)
{
    char *r4;

    *b = 0;
    *c = 0;

    r4 = sub_800A2A4();
    while (*r4 > 1)
    {
        int width = GetStringTextWidth(r4);

        if (*b < width)
            *b = width;
        *c += 16;

        r4 = String_GetEnd(r4);
        if (*r4 == 0)
            break;
        r4++;
    }
}

char *String_GetEnd(char *str)
{
    register char c asm("r1");
    while ((c = *str) > 1)
        str++;
    return str;
}

void Text_AppendString(struct Text *a, char *b)
{
    struct UnknownTextStruct3 *r1;
    char r3;
    char r2;

    if (gUnknown_02028E70->unk16 != 0)
    {
        Text_AppendStringSimple(a, b);
        return;
    }

    while (*b > 1)
    {
        r3 = *b++;
        if (r3 >= 0x20)
        {
            r2 = *b++;

        label:
            r1 = gUnknown_02028E70->unk4[r2 - 0x40];
            while (r1 != NULL)
            {
                if (r1->unk4 == r3)
                {
                    gUnknown_02028E70->unk8(a, r1);
                    break;
                }

                r1 = r1->next;
                if (r1 == NULL)
                {
                    r3 = 0x81;
                    r2 = 0xA7;
                    goto label;
                }
            }
        }
    }
}

void Text_AppendDecNumber(struct Text *a, int n)
{
    if (n == 0)
    {
        Text_AppendChar(a, gUnknown_080D77B0);
        return;
    }

    while (n != 0)
    {
        u16 sp0 = '0' + n % 10;

        n /= 10;
        Text_AppendChar(a, (char *)&sp0);
        a->unk2 -= 15;
    }
}

void sub_80040C0(struct Text *a, int n)
{
    u16 sp0;
    int r6;
    int r0;
    int i;

    if (n == 0)
    {
        Text_AppendChar(a, gUnknown_080D77B0);
        a->unk2 += 8;
        return;
    }

    r6 = 1;
    r0 = n / 10;
    while (r0 != 0)
    {
        r6++;
        r0 /= 10;
    }

    a->unk2 += (r6 - 1) * 8;

    for (i = 0; i < r6; i++)
    {
        sp0 = '0' + n % 10;
        n /= 10;
        Text_AppendChar(a, (char *)&sp0);
        a->unk2 -= 15;
    }

    a->unk2 += r6 * 8 + 8;
}

void Text_AppendNumberOr2Dashes(struct Text *a, int b)
{
    if (b == 255 || b == -1)
    {
        Text_Advance(a, -8);
        Text_AppendString(a, GetStringFromIndex(0x535));
    }
    else
    {
        Text_AppendDecNumber(a, b);
    }
}

#if NONMATCHING
const char *Text_AppendChar(struct Text *a, const char *b)
{
    struct UnknownTextStruct3 *r1 = NULL;
    char r3;
    char r2;

    if (gUnknown_02028E70->unk16 != 0)
        return Text_AppendCharSimple(a, b);

    r3 = *b++;
    r2 = *b++;

    while (1)
    {
        r1 = gUnknown_02028E70->unk4[r2 - 0x40];
        goto _080041BE;
      _080041BC:
        r1 = r1->next;
      _080041BE:
        if (r1 == NULL)
        {
            r3 = 0x81;
            r2 = 0xA7;
        }
        else
        {
            if (r1->unk4 == r3)
            {
                gUnknown_02028E70->unk8(a, r1);
                break;
            }
            goto _080041BC;
        }
    }
    return b;
}
#else
__attribute__((naked))
const char *Text_AppendChar(struct Text *a, const char *b)
{
    asm(".syntax unified\n\
	push {r4, r5, r6, lr}\n\
	adds r5, r0, #0\n\
	adds r4, r1, #0\n\
	ldr r0, _0800419C  @ gUnknown_02028E70\n\
	ldr r1, [r0]\n\
	ldrb r1, [r1, #0x16]\n\
	adds r6, r0, #0\n\
	cmp r1, #0\n\
	beq _080041A0\n\
	adds r0, r5, #0\n\
	adds r1, r4, #0\n\
	bl Text_AppendCharSimple\n\
	b _080041E2\n\
	.align 2, 0\n\
_0800419C: .4byte gUnknown_02028E70\n\
_080041A0:\n\
	ldrb r3, [r4]\n\
	adds r4, #1\n\
	ldrb r2, [r4]\n\
	adds r4, #1\n\
_080041A8:\n\
	ldr r0, [r6]\n\
	ldr r1, [r0, #4]\n\
	lsls r0, r2, #2\n\
	adds r0, r0, r1\n\
	ldr r1, _080041B8  @ 0xFFFFFF00\n\
	adds r0, r0, r1\n\
	ldr r1, [r0]\n\
	b _080041BE\n\
	.align 2, 0\n\
_080041B8: .4byte 0xFFFFFF00\n\
_080041BC:\n\
	ldr r1, [r1]\n\
_080041BE:\n\
	cmp r1, #0\n\
	bne _080041D0\n\
	movs r3, #0x81\n\
	movs r2, #0xa7\n\
	ldr r6, _080041CC  @ gUnknown_02028E70\n\
	b _080041A8\n\
	.align 2, 0\n\
_080041CC: .4byte gUnknown_02028E70\n\
_080041D0:\n\
	ldrb r0, [r1, #4]\n\
	cmp r0, r3\n\
	bne _080041BC\n\
	ldr r0, [r6]\n\
	ldr r2, [r0, #8]\n\
	adds r0, r5, #0\n\
	bl _call_via_r2\n\
	adds r0, r4, #0\n\
_080041E2:\n\
	pop {r4, r5, r6}\n\
	pop {r1}\n\
	bx r1\n\
    .syntax divided");
}
#endif

void *GetVRAMPointerForTextMaybe(struct Text *a)
{
    int r1 = (a->unk6 * a->unk4 + a->unk0 + a->unk2 / 8);

    return gUnknown_02028E70->unk0 + r1 * 64;
}

void *GetSomeTextDrawingRelatedTablePointer(int a)
{
    return gUnknown_08588240[a];
}

void Font_StandardGlyphDrawer(struct Text *a, struct UnknownTextStruct4 *b)
{
    void *r8 = gUnknown_02028E70->unkC(a);
    int r4 = a->unk2 & 7;
    u32 *r6 = b->unk8;
    void *r0 = GetSomeTextDrawingRelatedTablePointer(a->unk3);

    CallARM_Func3(r0, r8, r6, r4);
    a->unk2 += b->unk5;
}

void Font_SpecializedGlyphDrawer(struct Text *a, struct UnknownTextStruct4 *b)
{
    int i;
    u32 *spC = gUnknown_02028E70->unkC(a);
    int sp10 = a->unk2 & 7;
    u32 *sp14 = b->unk8;
    u16 *table1 = GetSomeTextDrawingRelatedTablePointer(9);
    u16 *table2 = GetSomeTextDrawingRelatedTablePointer(a->unk3);

    for (i = 0; i < 16; i++)
    {
        u64 value64 = *sp14++;

        value64 <<= sp10 * 2;

        spC[0] &= table1[value64 & 0xFF] | (table1[(value64 >> 8) & 0xFF] << 16);
        spC[0] |= table2[value64 & 0xFF] | (table2[(value64 >> 8) & 0xFF] << 16);

        spC[0x10] &= table1[(value64 >> 16) & 0xFF] | (table1[(value64 >> 24) & 0xFF] << 16);
        spC[0x10] |= table2[(value64 >> 16) & 0xFF] | (table2[(value64 >> 24) & 0xFF] << 16);

        spC[0x20] &= table1[(value64 >> 32) & 0xFF] | (table1[(value64 >> 40) & 0xFF] << 16);
        spC[0x20] |= table2[(value64 >> 32) & 0xFF] | (table2[(value64 >> 40) & 0xFF] << 16);

        spC++;
    }

    a->unk2 += b->unk5;
}
