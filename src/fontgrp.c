#include <stdarg.h>
#include <stdio.h>

#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"

#include "fontgrp.h"

#define CHAR_NEWLINE 0x01

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

struct Struct02028E78
{
    s8 unk0;
    s8 unk1;
    s16 unk2;
};

EWRAM_DATA struct Struct02026E30 gUnknown_02026E30 = {0};
EWRAM_DATA char gUnknown_02028E44[9] = {0};
EWRAM_DATA int gUnknown_02028E50 = 0;
EWRAM_DATA int gUnknown_02028E54 = 0;
EWRAM_DATA struct Font gDefaultFont = {0};
EWRAM_DATA struct Font *gCurrentFont = 0;
EWRAM_DATA u8 gUnknown_02028E74 = 0;
EWRAM_DATA struct Struct02028E78 gUnknown_02028E78[64] = {0};

#include "graphics/debug_font.4bpp.h"

void SetupDebugFontForBG(int bg, int tileDataOffset)
{
    if (tileDataOffset == 0)
        tileDataOffset = 0x5800;

    SetBackgroundTileDataOffset(bg, 0);
    SetBackgroundScreenSize(bg, 0);
    RegisterTileGraphics(debug_font_4bpp, (void *)(VRAM + (tileDataOffset & 0x1FFFF)), 0x800);

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
    static const char hexDigits[] = "0123456789ABCDEF";
    int i;

    ClearSmallStringBuffer();
    for (i = 7; i >= 0; i--)
    {
        gUnknown_02028E44[i] = hexDigits[(n & 0xF)];
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
        u16* r3 = gBG2TilemapBuffer + i * 0x20;

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

void SetupDebugFontForOBJ(int a, int objPalNum)
{
    int offset;

    if (a < 0)
        a = 0x3000;
    a &= 0xFFFF;

    gUnknown_02028E50 = a / 32;
    gUnknown_02028E54 = (objPalNum & 0xF) << 12;

    RegisterTileGraphics(debug_font_4bpp, (void *)(VRAM + ((a + 0x10000) & 0x1FFFF)), 0x800);

    gPaletteBuffer[(objPalNum + 16) * 16 + 0] = RGB(0, 0, 0);
    gPaletteBuffer[(objPalNum + 16) * 16 + 1] = RGB(0, 0, 31);
    gPaletteBuffer[(objPalNum + 16) * 16 + 2] = RGB(31, 31, 31);

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

        CallARM_PushToSecondaryOAM(a, b, gObject_8x8, c + gUnknown_02028E50 + gUnknown_02028E54);

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
    Font_InitForUI(&gDefaultFont, (void *)(VRAM + 0x1000), 0x80, 0);
    gUnknown_02028E78[0].unk0 = -1;
}

void Font_InitForUI(struct Font *font, void *vramDest, int c, int d)
{
    if (font == NULL)
        font = &gDefaultFont;
    font->vramDest = vramDest;
    font->getVramTileOffset = GetVRAMPointerForTextMaybe;
    font->paletteNum = d;
    font->unk10 = c + (d << 12);
    font->unk12 = 0;
    font->isAscii = GetSomeByte();
    SetFont(font);
    Font_LoadForUI();
}

void SetFontGlyphSet(int a)
{
    if (a == 0)
        gCurrentFont->glyphs = gUnknown_0858C7EC;
    else
        gCurrentFont->glyphs = gUnknown_0858F6F4;
}

void sub_8003D20(void)
{
    gCurrentFont->unk12 = 0;
    gUnknown_02028E78[0].unk0 = -1;
}

void SetFont(struct Font *font)
{
    if (font == NULL)
        gCurrentFont = &gDefaultFont;
    else
        gCurrentFont = font;
}

void Text_Init(struct TextHandle *th, int tileWidth)
{
    th->unk0 = gCurrentFont->unk12;
    th->unk4 = tileWidth;
    th->unk6 = 0;
    th->unk5 = 0;
    th->unk7 = 0;
    gCurrentFont->unk12 += tileWidth;
    Text_Clear(th);
}

void Text_Allocate(struct TextHandle *th, int tileWidth)
{
    th->unk0 = gCurrentFont->unk12;
    th->unk4 = tileWidth;
    th->unk6 = 0;
    th->unk5 = 1;
    th->unk7 = 0;
    gCurrentFont->unk12 += tileWidth * 2;
}

void InitTextBatch(const struct TextBatch *a)
{
    while (a->unk0 != NULL)
    {
        Text_Init(a->unk0, a->unk4);
        a++;
    }
}

void Text_Clear(struct TextHandle *th)
{
    th->x = 0;
    th->colorId = 0;
    CpuFastFill16(0, gCurrentFont->getVramTileOffset(th), th->unk4 * 64);
}

void sub_8003E00(struct TextHandle *th, int b, int c)
{
    void *dest = gCurrentFont->vramDest + (th->unk6 * th->unk4 + th->unk0 + b) * 64;

    CpuFastFill16(0, dest, c * 64);
}

int sub_8003E40(struct TextHandle *th)
{
    return (th->unk6 * th->unk4 + th->unk0) * 2;
}

int Text_GetXCursor(struct TextHandle *th)
{
    return th->x;
}

void Text_SetXCursor(struct TextHandle *th, int x)
{
    th->x = x;
}

void Text_Advance(struct TextHandle *th, int x)
{
    th->x += x;
}

void Text_SetColorId(struct TextHandle *th, int colorId)
{
    th->colorId = colorId;
}

int Text_GetColorId(struct TextHandle *th)
{
    return th->colorId;
}

void Text_SetParameters(struct TextHandle *th, int x, int colorId)
{
    th->x = x;
    th->colorId = colorId;
}

void Text_Draw(struct TextHandle *th, u16 *dest)
{
    int tileEntry = gCurrentFont->unk10 + (th->unk6 * th->unk4 + th->unk0) * 2;
    int i;

    for (i = 0; i < th->unk4; i++)
    {
        dest[0] = tileEntry;
        tileEntry++;
        dest[32] = tileEntry;
        tileEntry++;
        dest++;
    }

    if (th->unk5 != 0)
        th->unk6 ^= 1;
}

void Text_DrawBlank(struct TextHandle *th, u16 *dest)
{
    int i;

    for (i = 0; i < th->unk4; i++)
    {
        dest[0] = 0;
        dest[32] = 0;
        dest++;
    }
}

int GetStringTextWidth(const char *str)
{
    int width = 0;
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gCurrentFont->isAscii)
        return GetStringTextWidthASCII(str);
    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        byte1 = *str++;
        if (byte1 >= 0x20)
        {
            byte2 = *str++;
            glyph = gCurrentFont->glyphs[byte2 - 0x40];
            while (glyph != NULL)
            {
                if (glyph->sjisByte1 == byte1)
                {
                    width += glyph->width;
                    break;
                }
                glyph = glyph->sjisNext;
            }
        }
    }
    return width;
}

char *GetCharTextWidth(char *str, u32 *pWidth)
{
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gCurrentFont->isAscii)
        return GetCharTextWidthASCII(str, pWidth);

    byte1 = *str++;
    byte2 = *str++;
    glyph = gCurrentFont->glyphs[byte2 - 0x40];
    while (glyph != NULL)
    {
        if (glyph->sjisByte1 == byte1)
        {
            *pWidth = glyph->width;
            break;
        }
        glyph = glyph->sjisNext;
    }
    return str;
}

int GetStringTextCenteredPos(int x, const char* str)
{
    return (x - GetStringTextWidth(str)) / 2;
}

void sub_8003FAC(const char* unused, int *b, int *c)
{
    char *str;

    *b = 0;
    *c = 0;

    str = sub_800A2A4();
    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        int width = GetStringTextWidth(str);

        if (*b < width)
            *b = width;
        *c += 16;

        str = String_GetEnd(str);
        if (*str == 0)
            break;
        str++;
    }
}

char* String_GetEnd(char* str)
{
    char c = *str;

    while (c > 1) {
        str++;
        c = *str;
    }

    return str;
}

void Text_AppendString(struct TextHandle *th, const char* str)
{
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gCurrentFont->isAscii)
    {
        Text_AppendStringASCII(th, str);
        return;
    }

    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        byte1 = *str++;
        if (byte1 >= 0x20)
        {
            byte2 = *str++;

        label:
            glyph = gCurrentFont->glyphs[byte2 - 0x40];
            while (glyph != NULL)
            {
                if (glyph->sjisByte1 == byte1)
                {
                    gCurrentFont->drawGlyph(th, glyph);
                    break;
                }

                glyph = glyph->sjisNext;
                if (glyph == NULL)
                {
                    byte1 = 0x81;
                    byte2 = 0xA7;
                    goto label;
                }
            }
        }
    }
}

void Text_AppendDecNumber(struct TextHandle *th, int n)
{
    if (n == 0)
    {
        Text_AppendChar(th, "0");
        return;
    }

    while (n != 0)
    {
        u16 c = '0' + n % 10;

        n /= 10;
        Text_AppendChar(th, (char *)&c);
        th->x -= 15;
    }
}

void sub_80040C0(struct TextHandle *th, int n)
{
    int length;
    int r0;
    int i;

    if (n == 0)
    {
        Text_AppendChar(th, "0");
        th->x += 8;
        return;
    }

    length = 1;
    r0 = n / 10;
    while (r0 != 0)
    {
        length++;
        r0 /= 10;
    }

    th->x += (length - 1) * 8;

    for (i = 0; i < length; i++)
    {
        u16 c = '0' + n % 10;

        n /= 10;
        Text_AppendChar(th, (char *)&c);
        th->x -= 15;
    }

    th->x += length * 8 + 8;
}

void Text_AppendNumberOr2Dashes(struct TextHandle *th, int n)
{
    if (n == 255 || n == -1)
    {
        Text_Advance(th, -8);
        Text_AppendString(th, GetStringFromIndex(0x535));
    }
    else
    {
        Text_AppendDecNumber(th, n);
    }
}

#if NONMATCHING
const char *Text_AppendChar(struct TextHandle *th, const char *b)
{
    struct Glyph *r1 = NULL;
    char r3;
    char r2;

    if (gCurrentFont->isAscii)
        return Text_AppendCharASCII(th, b);

    r3 = *b++;
    r2 = *b++;

    while (1)
    {
        r1 = gCurrentFont->sjisByte1[r2 - 0x40];
        goto _080041BE;
      _080041BC:
        r1 = r1->sjisNext;
      _080041BE:
        if (r1 == NULL)
        {
            r3 = 0x81;
            r2 = 0xA7;
        }
        else
        {
            if (r1->sjisByte1 == r3)
            {
                gCurrentFont->drawGlyph(th, r1);
                break;
            }
            goto _080041BC;
        }
    }
    return b;
}
#else
__attribute__((naked))
const char *Text_AppendChar(struct TextHandle *th, const char *b)
{
    asm(".syntax unified\n\
	push {r4, r5, r6, lr}\n\
	adds r5, r0, #0\n\
	adds r4, r1, #0\n\
	ldr r0, _0800419C  @ gCurrentFont\n\
	ldr r1, [r0]\n\
	ldrb r1, [r1, #0x16]\n\
	adds r6, r0, #0\n\
	cmp r1, #0\n\
	beq _080041A0\n\
	adds r0, r5, #0\n\
	adds r1, r4, #0\n\
	bl Text_AppendCharASCII\n\
	b _080041E2\n\
	.align 2, 0\n\
_0800419C: .4byte gCurrentFont\n\
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
	ldr r6, _080041CC  @ gCurrentFont\n\
	b _080041A8\n\
	.align 2, 0\n\
_080041CC: .4byte gCurrentFont\n\
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

void *GetVRAMPointerForTextMaybe(struct TextHandle *th)
{
    int r1 = (th->unk6 * th->unk4 + th->unk0 + th->x / 8);

    return gCurrentFont->vramDest + r1 * 64;
}

u16 *gUnknown_08588240[] =
{
    gUnknown_0858829C,
    gUnknown_0858849C,
    gUnknown_0858869C,
    gUnknown_0858889C,
    gUnknown_08588A9C,
    gUnknown_08588C9C,
    gUnknown_08588E9C,
    gUnknown_0858909C,
    gUnknown_0858929C,
    gUnknown_0858949C,
    gUnknown_0858969C,
    gUnknown_0858989C,
    gUnknown_08589A9C,
};

u16 *GetGlyphColorLUT(int a)
{
    return gUnknown_08588240[a];
}

void Font_StandardGlyphDrawer(struct TextHandle *th, struct Glyph *glyph)
{
    void *r8 = gCurrentFont->getVramTileOffset(th);
    int r4 = th->x & 7;
    u32 *bitmap = glyph->bitmap;
    void *r0 = GetGlyphColorLUT(th->colorId);

    CallARM_Func3(r0, r8, bitmap, r4);
    th->x += glyph->width;
}

void Font_SpecializedGlyphDrawer(struct TextHandle *th, struct Glyph *glyph)
{
    u64 bmpRow;
    int i;
    u32 *dest = gCurrentFont->getVramTileOffset(th);
    int xoffset = th->x & 7;
    u32 *bitmap = glyph->bitmap;
    u16 *table1 = GetGlyphColorLUT(9);
    u16 *table2 = GetGlyphColorLUT(th->colorId);

    for (i = 0; i < 16; i++)
    {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] &= table1[bmpRow & 0xFF] | (table1[(bmpRow >> 8) & 0xFF] << 16);
        dest[0] |= table2[bmpRow & 0xFF] | (table2[(bmpRow >> 8) & 0xFF] << 16);

        dest[16] &= table1[(bmpRow >> 16) & 0xFF] | (table1[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= table2[(bmpRow >> 16) & 0xFF] | (table2[(bmpRow >> 24) & 0xFF] << 16);

        dest[32] &= table1[(bmpRow >> 32) & 0xFF] | (table1[(bmpRow >> 40) & 0xFF] << 16);
        dest[32] |= table2[(bmpRow >> 32) & 0xFF] | (table2[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    th->x += glyph->width;
}

void Font_LoadForUI(void)
{
    CopyToPaletteBuffer(gUnknown_0859EF00, gCurrentFont->paletteNum * 32, 32);
    gPaletteBuffer[gCurrentFont->paletteNum * 16] = 0;
    gCurrentFont->drawGlyph = Font_StandardGlyphDrawer;
    SetFontGlyphSet(0);
}

void Font_LoadForDialogue(void)
{
    CopyToPaletteBuffer(gUnknown_0859EF20, gCurrentFont->paletteNum * 32, 32);
    gPaletteBuffer[gCurrentFont->paletteNum * 16] = 0;
    gCurrentFont->drawGlyph = Font_StandardGlyphDrawer;
    SetFontGlyphSet(1);
}

void Font_SetSomeSpecialDrawingRoutine(void)
{
    gCurrentFont->drawGlyph = Font_SpecializedGlyphDrawer;
}

void DrawTextInline(struct TextHandle *th, u16 *dest, int colorId, int x, int e, const char *f)
{
    struct TextHandle tempTextHandle;

    if (th == NULL)
    {
        th = &tempTextHandle;
        Text_Init(th, e);
    }
    Text_SetXCursor(th, x);
    Text_SetColorId(th, colorId);
    Text_AppendString(th, f);
    Text_Draw(th, dest);
}

void Text_InsertString(struct TextHandle *th, int x, int colorId, const char *str)
{
    Text_SetXCursor(th, x);
    Text_SetColorId(th, colorId);
    Text_AppendString(th, str);
}

void Text_InsertNumberOr2Dashes(struct TextHandle *th, int x, int colorId, int n)
{
    Text_SetXCursor(th, x);
    Text_SetColorId(th, colorId);
    Text_AppendNumberOr2Dashes(th, n);
}

void Text_AppendStringASCII(struct TextHandle *th, const char* str)
{
    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        struct Glyph *glyph = gCurrentFont->glyphs[*str++];

        if (glyph == NULL)
            glyph = gCurrentFont->glyphs[63];
        gCurrentFont->drawGlyph(th, glyph);
    }
}

const char *Text_AppendCharASCII(struct TextHandle *th, const char *str)
{
    struct Glyph *glyph = gCurrentFont->glyphs[*str++];

    if (glyph == NULL)
        glyph = gCurrentFont->glyphs[63];
    gCurrentFont->drawGlyph(th, glyph);
    return str;
}

char *GetCharTextWidthASCII(char *str, u32 *width)
{
    struct Glyph *glyph = gCurrentFont->glyphs[*str++];

    if (glyph == NULL)
        glyph = gCurrentFont->glyphs[63];
    *width = glyph->width;
    return str;
}

int GetStringTextWidthASCII(const char *str)
{
    int width = 0;

    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        struct Glyph *glyph = gCurrentFont->glyphs[*str++];

        width += glyph->width;
    }
    return width;
}

void sub_8004598(void)
{
}

void InitSomeOtherGraphicsRelatedStruct(struct Font *font, void *vramDest, int c)
{
    font->vramDest = (void *)vramDest;
    font->getVramTileOffset = sub_80046E0;
    font->paletteNum = (c & 0xF) + 16;
    font->unk10 = ((uintptr_t)vramDest & 0x1FFFF) >> 5;
    font->unk12 = 0;
    font->isAscii = GetSomeByte();
    SetFont(font);
    font->drawGlyph = sub_8004700;
}

void Text_Init3(struct TextHandle *th)
{
    th->unk0 = gCurrentFont->unk12;
    th->unk4 = 32;
    th->unk6 = 0;
    th->unk5 = 0;
    th->unk7 = 0;
    gCurrentFont->unk12 += 64;
    th->x = 0;
    th->colorId = 0;
}

void sub_80045FC(struct TextHandle *th)
{
    if (th->unk4 != 0)
    {
        th->x = 0;
        CpuFastFill(0x44444444, gCurrentFont->getVramTileOffset(th), 0x360);
        CpuFastFill(0x44444444, gCurrentFont->getVramTileOffset(th) + 0x400, 0x360);
    }
}

void sub_800465C(struct TextHandle *th)
{
    if (th->unk4 != 0)
    {
        th->x = 0;
        CpuFastFill(0, gCurrentFont->getVramTileOffset(th), 0x360);
        CpuFastFill(0, gCurrentFont->getVramTileOffset(th) + 0x400, 0x360);
    }
}

void Text_80046B4(struct TextHandle *th, u32 b)
{
    th->x = 0;
    CpuFastFill(b, gCurrentFont->getVramTileOffset(th), 0x800);
}

void *sub_80046E0(struct TextHandle *th)
{
    int r1 = (th->unk6 * th->unk4 + th->unk0 + th->x / 8);

    return gCurrentFont->vramDest + r1 * 32;
}

void sub_8004700(struct TextHandle *th, struct Glyph *glyph)
{
    u64 bmpRow;
    int i;
    u32 *dest = gCurrentFont->getVramTileOffset(th);
    int xoffset = th->x & 7;
    u32 *bitmap = glyph->bitmap;
    u16 *r8 = GetGlyphColorLUT(th->colorId);

    for (i = 0; i < 8; i++)
    {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    dest = gCurrentFont->getVramTileOffset(th) + 0x400;

    for (i = 0; i < 8; i++)
    {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    th->x += glyph->width;
}

struct SomeTextRelatedProc
{
    PROC_HEADER

    struct TextHandle *unk2C;
    const char *unk30;
    s8 unk34;
    s8 unk35;
    s8 unk36;
};

void sub_80048B0(struct SomeTextRelatedProc *proc)
{
    int i;

    proc->unk35--;
    if (proc->unk35 <= 0)
    {
        proc->unk35 = proc->unk34;
        for (i = 0; i < proc->unk36; i++)
        {
            switch (*proc->unk30)
            {
            case 0:
            case 1:
                proc->unk2C->unk7 = 0;
                Proc_Break((struct Proc *)proc);
                return;
            case 4:
                proc->unk30++;
                Text_Advance(proc->unk2C, 6);
                break;
            default:
                proc->unk30 = Text_AppendChar(proc->unk2C, proc->unk30);
                break;
            }
        }
    }
}

struct ProcCmd gUnknown_08588274[] =
{
    PROC_REPEAT(sub_80048B0),
    PROC_END,
};

char *sub_8004924(struct TextHandle *th, char *b, int c, int d)
{
    struct SomeTextRelatedProc *proc;

    if (c == 0)
        Text_AppendString(th, b);
    if (d == 0)
        d = 1;
    proc = Proc_Start(gUnknown_08588274, PROC_TREE_3);
    proc->unk2C = th;
    proc->unk30 = b;
    proc->unk36 = d;
    proc->unk34 = c;
    proc->unk35 = 0;
    th->unk7 = 1;
    return String_GetEnd(b);
}

// not sure if this is Text or not
s8 sub_800496C(struct TextHandle *th)
{
    return th->unk7;
}

void sub_8004974(void)
{
    Proc_EndEach(gUnknown_08588274);
}

void sub_8004984(void)
{
    u32 index = (GetGameClock() / 4) % 16;

    //gPaletteBuffer[14] = gUnknown_0859EFC0[index];
    gPaletteBuffer[14] = index[gUnknown_0859EFC0];
    EnablePaletteSync();
}

struct ProcCmd gUnknown_08588284[] =
{
	PROC_END_IF_DUPLICATE,
	PROC_REPEAT(sub_8004984),
	PROC_END,
};

void NewGreenTextColorManager(struct Proc *parent)
{
    if (parent != NULL)
        Proc_Start(gUnknown_08588284, parent);
    else
        Proc_Start(gUnknown_08588284, PROC_TREE_3);
}

void EndGreenTextColorManager(void)
{
    Proc_EndEach(gUnknown_08588284);
}

void sub_80049E0(struct TextHandle *th, u16 *b, int c)
{
    int r1 = gCurrentFont->unk10 + (th->unk6 * th->unk4 + th->unk0) * 2;
    int i;

    for (i = 0; i < th->unk4 && i < c; i++)
    {
        b[0] = r1;
        r1++;

        b[32] = r1;
        r1++;

        b++;
    }

    if (th->unk5 != 0)
        th->unk6 ^= 1;
}

static inline u32 func(u16 *table, u32 b)
{
    return table[b & 0xFF] + (table[(b >> 8) & 0xFF] << 16);
}

void sub_8004A34(int a, int b, struct Glyph *glyph)
{
    int i;
    u32 *r8 = (u32 *)(gCurrentFont->vramDest + a * 64);
    u32 *r7 = glyph->bitmap;
    u16 *r2 = GetGlyphColorLUT(b);

    for (i = 0; i < 16; i++)
    {
        u32 r0 = *r7++;
        register u32 r4 asm("r4") = r2[r0 & 0xFF];
        register u32 r5 asm("r5") = r2[(r0 >> 8) & 0xFF];
        register u32 var asm("r0") = (r5 << 16);
        u32 var2 = var + r4;

        *r8++ = var2;
    }
}

int sub_8004A90(struct Struct02028E78 *a, int b, int c)
{
    a->unk0 = b;
    a->unk1 = c;
    a->unk2 = gCurrentFont->unk12++;
    (a + 1)->unk0 = -1;
    sub_8004A34(a->unk2, b, gUnknown_08590B44[c]);
    return a->unk2;
}

int sub_8004ACC(int a, int b)
{
    struct Struct02028E78 *r1 = gUnknown_02028E78;

    while (1)
    {
        if (r1->unk0 < 0)
            return sub_8004A90(r1, a, b);
        if (r1->unk0 == a && r1->unk1 == b)
            return r1->unk2;
        r1++;
    }
}

void sub_8004B0C(u16 *a, int b, int c)
{
    if (c == 0xFF)
    {
        a[0] = 0;
        a[32] = 0;
    }
    else
    {
        int var = sub_8004ACC(b, c) * 2 + gCurrentFont->unk10;

        a[0] = var;
        a[32] = var + 1;
    }
}

void sub_8004B48(u16 *a, int b, int c, int d)
{
    if (c == 0)
    {
        sub_8004B0C(a, b, d);
        return;
    }

    while (c != 0)
    {
        sub_8004B0C(a, b, c % 10 + d);
        c /= 10;
        a--;
    }
}

void sub_8004B88(u16 *a, int b, int c)
{
    sub_8004B48(a, b, c, 0);
}

void DrawDecNumber(u16 *a, int b, int c)
{
    if (c < 0 || c == 255)
        sub_8004D5C(a - 1, b, 20, 20);
    else
        sub_8004B88(a, b, c);
}

void sub_8004BB4(u16 *a, int b, int c)
{
    if (c == 100)
        sub_8004D5C(a - 1, b, 40, 41);
    else if (c < 0 || c == 255)
        sub_8004D5C(a - 1, b, 20, 20);
    else
        sub_8004B88(a, b, c);
}

void sub_8004BE4(u16 *a, int b, int c)
{
    sub_8004B48(a, b, c, 10);
}

void sub_8004BF0(int a, u16 *b)
{
    if (a != 0)
    {
        sub_8004B0C(b, 4, 21);
        sub_8004BE4(b + ((a >= 10) ? 2 : 1), 4, a);
    }
}

void sub_8004C1C(void)
{
    int r5 = GetGameClock();
    int i;
    int j;

    for (i = 0; i < 10; i++)
    {
        for (j = 0; j < 30; j++)
        {
            int index = i * 64 + j;
            sub_8004B0C((u16 *)gBG0TilemapBuffer + index, 0, r5++ & 1);
        }
    }
    BG_EnableSyncByMask(1 << 0);
}

void sub_8004C68(u16 *a, int b, int c, u8 d)
{
    u16 sp0;
    u16 sp2;
    u16 sp4;
    int var1;
    int var2;

    u8 r9 = ComputeDisplayTime(c, &sp0, &sp2, &sp4);

    sub_8004B88(a + 2, b, sp0);

    var1 = sp2;
    sub_8004B0C(a + 5, b, var1 % 10);
    sub_8004B0C(a + 4, b, (var1 / 10) % 10);

    var2 = sp4;
    sub_8004B0C(a + 8, b, var2 % 10 + 10);
    sub_8004B0C(a + 7, b, (var2 / 10) % 10 + 10);

    if (r9 == 0 || d != 0)
    {
        sub_8004B0C(a + 3, b, 32);
        sub_8004B0C(a + 6, b, 32);
    }
    else
    {
        sub_8004B0C(a + 3, b, 0xFF);
        sub_8004B0C(a + 6, b, 0xFF);
    }
}

void sub_8004D5C(u16 *a, int b, int c, int d)
{
    sub_8004B0C(a++, b, c);
    sub_8004B0C(a++, b, d);
}

void sub_8004D7C(u16 *a, int b, int c)
{
    sub_8004B0C(a, b, c % 10);
    sub_8004B0C(a - 1, b, (c / 10) % 10);
}

void sub_8004DB8(u16 *a, int b, int c)
{
    sub_8004B0C(a, b, c % 10 + 10);
    sub_8004B0C(a - 1, b, (c / 10) % 10 + 10);
}

void sub_8004DF8(u16 *a, int b, int c, int d)
{
    sub_8004B0C(a, b, c % 10 + d);
    sub_8004B0C(a - 1, b, (c / 10) % 10 + d);
}

#include "data/fonts/color_lookup_tables.h"
#include "data/fonts/glyphs_1.h"
#include "data/fonts/glyphs_2.h"
#include "data/fonts/glyphs_3.h"
