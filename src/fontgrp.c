#include <stdarg.h>
#include <stdio.h>

#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
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

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};

EWRAM_DATA struct Struct02026E30 gUnknown_02026E30 = {0};
EWRAM_DATA char gUnknown_02028E44[9] = {0};
EWRAM_DATA int gUnknown_02028E50 = 0;
EWRAM_DATA int gUnknown_02028E54 = 0;
EWRAM_DATA struct Font gDefaultFont = {0};
EWRAM_DATA struct Font *gActiveFont = 0;
EWRAM_DATA u8 gLanguageMode = 0;
EWRAM_DATA struct SpecialCharSt sSpecialCharStList[64] = {0};

#include "graphics/debug_font.4bpp.h"

void SetupDebugFontForBG(int bg, int tileDataOffset)
{
    if (tileDataOffset == 0)
        tileDataOffset = 0x5800;

    SetBackgroundTileDataOffset(bg, 0);
    SetBackgroundScreenSize(bg, 0);
    RegisterDataMove(debug_font_4bpp, (void *)(VRAM + (tileDataOffset & 0x1FFFF)), 0x800);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
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
#ifndef NONMATCHING
        register u32 r6 asm("r6");
#else
        u32 r6;
#endif

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

    RegisterDataMove(debug_font_4bpp, (void *)(VRAM + ((a + 0x10000) & 0x1FFFF)), 0x800);

    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 0] = RGB(0, 0, 0);
    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 1] = RGB(0, 0, 31);
    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 2] = RGB(31, 31, 31);

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

int GetLang(void)
{
    return gLanguageMode;
}

void SetLang(int lang)
{
    gLanguageMode = lang;
}

void ResetText(void)
{
    InitTextFont(&gDefaultFont, (void *)(VRAM + 0x1000), 0x80, 0);
    sSpecialCharStList[0].color = -1;
}

void InitTextFont(struct Font *font, void *vramDest, int chr, int palid)
{
    if (font == NULL)
        font = &gDefaultFont;
    font->vramDest = vramDest;
    font->get_draw_dest = GetTextDrawDest;
    font->palid = palid;
    font->tileref = TILEREF(chr, palid);
    font->chr_counter = 0;
    font->lang = GetLang();
    SetTextFont(font);
    InitSystemTextFont();
}

void SetTextFontGlyphs(int glyphset)
{
    if (glyphset == TEXT_GLYPHS_SYSTEM)
        gActiveFont->glyphs = TextGlyphs_System;
    else
        gActiveFont->glyphs = TextGlyphs_Talk;
}

void ResetTextFont(void)
{
    gActiveFont->chr_counter = 0;
    sSpecialCharStList[0].color = -1;
}

void SetTextFont(struct Font * font)
{
    if (font == NULL)
        gActiveFont = &gDefaultFont;
    else
        gActiveFont = font;
}

void InitText(struct Text *text, int tileWidth)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = tileWidth;
    text->db_id = 0;
    text->db_enabled = false;
    text->is_printing = false;
    gActiveFont->chr_counter += tileWidth;
    ClearText(text);
}

void InitTextDb(struct Text *text, int tileWidth)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = tileWidth;
    text->db_id = 0;
    text->db_enabled = true;
    text->is_printing = false;
    gActiveFont->chr_counter += tileWidth * 2;
}

void InitTextInitInfo(const struct TextInitInfo *info)
{
    while (info->text != NULL) {
        InitText(info->text, info->width);
        info++;
    }
}

void ClearText(struct Text *text)
{
    text->x = 0;
    text->colorId = TEXT_COLOR_SYSTEM_WHITE;
    CpuFastFill16(0, gActiveFont->get_draw_dest(text), text->tile_width * 2 * CHR_SIZE);
}

void ClearTextPart(struct Text *text, int tile_off, int tile_width)
{
    void *dest = gActiveFont->vramDest + (text->db_id * text->tile_width + text->chr_position + tile_off) * 2 * CHR_SIZE;
    CpuFastFill16(0, dest, tile_width * 2 * CHR_SIZE);
}

int Text_GetChrOffset(struct Text *text)
{
    return (text->db_id * text->tile_width + text->chr_position) * 2;
}

int Text_GetCursor(struct Text *text)
{
    return text->x;
}

void Text_SetCursor(struct Text *text, int x)
{
    text->x = x;
}

void Text_Skip(struct Text *text, int x)
{
    text->x += x;
}

void Text_SetColor(struct Text *text, int colorId)
{
    text->colorId = colorId;
}

int Text_GetColor(struct Text *text)
{
    return text->colorId;
}

void Text_SetParams(struct Text *text, int x, int colorId)
{
    text->x = x;
    text->colorId = colorId;
}

void PutText(struct Text *text, u16 *tm)
{
    int i;
    int tileref = gActiveFont->tileref + (text->db_id * text->tile_width + text->chr_position) * 2;

    for (i = 0; i < text->tile_width; i++) {
        tm[0x00] = tileref++;
        tm[0x20] = tileref++;
        tm++;
    }

    if (text->db_enabled != 0)
        text->db_id ^= 1;
}

void PutBlankText(struct Text *text, u16 *tm)
{
    int i;

    for (i = 0; i < text->tile_width; i++) {
        tm[0x00] = 0;
        tm[0x20] = 0;

        tm++;
    }
}

int GetStringTextLen(const char *str)
{
    int width = 0;
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gActiveFont->lang)
        return GetStringTextLenASCII(str);
    while (*str != 0 && *str != CHAR_NEWLINE) {
        byte1 = *str++;
        if (byte1 >= 0x20) {
            byte2 = *str++;
            glyph = gActiveFont->glyphs[byte2 - 0x40];

            while (glyph != NULL) {
                if (glyph->sjisByte1 == byte1) {
                    width += glyph->width;
                    break;
                }
                glyph = glyph->sjisNext;
            }
        }
    }
    return width;
}

const char *GetCharTextLen(const char *str, u32 *pWidth)
{
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gActiveFont->lang)
        return GetCharTextLenASCII(str, pWidth);

    byte1 = *str++;
    byte2 = *str++;
    glyph = gActiveFont->glyphs[byte2 - 0x40];
    while (glyph != NULL) {
        if (glyph->sjisByte1 == byte1) {
            *pWidth = glyph->width;
            break;
        }
        glyph = glyph->sjisNext;
    }
    return str;
}

int GetStringTextCenteredPos(int x, const char *str)
{
    return (x - GetStringTextLen(str)) / 2;
}

void GetStringTextBox(const char* _str, int *out_width, int *out_height)
{
    char *str;

    *out_width = 0;
    *out_height = 0;

    str = StringInsertSpecialPrefixByCtrl();
    while (*str != 0 && *str != CHAR_NEWLINE) {
        int width = GetStringTextLen(str);

        if (*out_width < width)
            *out_width = width;
        *out_height += 16;

        str = GetStringLineEnd(str);
        if (*str == 0)
            break;
        str++;
    }
}

char *GetStringLineEnd(char *str)
{
    char c = *str;
    while (c > 1) {
        str++;
        c = *str;
    }

    return str;
}

void Text_DrawString(struct Text *text, const char* str)
{
    struct Glyph *glyph;
    char byte1;
    char byte2;

    if (gActiveFont->lang != LANG_JAPANESE) {
        Text_DrawStringASCII(text, str);
        return;
    }

    while (*str != 0 && *str != CHAR_NEWLINE) {
        byte1 = *str++;
        if (byte1 >= 0x20) {
            byte2 = *str++;

        retry_draw:
            glyph = gActiveFont->glyphs[byte2 - 0x40];
            while (glyph != NULL)
            {
                if (glyph->sjisByte1 == byte1)
                {
                    gActiveFont->drawGlyph(text, glyph);
                    break;
                }

                glyph = glyph->sjisNext;
                if (glyph == NULL)
                {
                    byte1 = 0x81;
                    byte2 = 0xA7;
                    goto retry_draw;
                }
            }
        }
    }
}

void Text_DrawNumber(struct Text *text, int n)
{
    if (n == 0) {
        Text_DrawCharacter(text, "0");
        return;
    }

    while (n != 0) {
        u16 c = '0' + n % 10;

        n /= 10;
        Text_DrawCharacter(text, (char *)&c);
        text->x -= 15;
    }
}

void Text_DrawNumberOrSpace(struct Text *text, int n)
{
    int length;
    int r0;
    int i;

    if (n == 0) {
        Text_DrawCharacter(text, "0");
        text->x += 8;
        return;
    }

    length = 1;
    r0 = n / 10;
    while (r0 != 0) {
        length++;
        r0 /= 10;
    }

    text->x += (length - 1) * 8;

    for (i = 0; i < length; i++) {
        u16 c = '0' + n % 10;

        n /= 10;
        Text_DrawCharacter(text, (char *)&c);
        text->x -= 15;
    }

    text->x += length * 8 + 8;
}

void Text_DrawNumberOrBlank(struct Text *th, int n)
{
    if (n == 255 || n == -1) {
        Text_Skip(th, -8);
        Text_DrawString(th, GetStringFromIndex(0x535));
        return;
    }

    Text_DrawNumber(th, n);
}

char const * Text_DrawCharacter(struct Text * text, char const * str)
{
    struct Glyph *glyph;
    char byte2, byte1;

    if (gActiveFont->lang != LANG_JAPANESE)
        return Text_DrawCharacterAscii(text, str);

    byte1 = *str++;
    byte2 = *str++;

retry_draw:
    glyph = gActiveFont->glyphs[byte2 - 0x40];

    while (glyph) {
        if (glyph->sjisByte1 == byte1) {
            gActiveFont->drawGlyph(text, glyph);
            break;
        }

        glyph = glyph->sjisNext;
    }

    if (glyph == NULL) {
        byte1 = 0x81;
        byte2 = 0xA7;

        goto retry_draw;
    }

    return str;
}

void *GetTextDrawDest(struct Text *th)
{
    int chrNumber = (th->db_id * th->tile_width + th->chr_position + th->x / 8);

    return gActiveFont->vramDest + chrNumber * 2 * CHR_SIZE;
}

u16 *s2bppTo4bppLutTable[] =
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

u16 *GetColorLut(int color)
{
    return s2bppTo4bppLutTable[color];
}

void DrawTextGlyph(struct Text *text, struct Glyph *glyph)
{
    void *draw_dest = gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 *bitmap = glyph->bitmap;

    DrawGlyphRam(GetColorLut(text->colorId), draw_dest, bitmap, subx);
    text->x += glyph->width;
}

void DrawTextGlyphNoClear(struct Text * text, struct Glyph *glyph)
{
    int i;

    u32 * dst = (u32 *) gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 const * bitmap = glyph->bitmap;

    u64 bitmapRow;

    u16 const * maskLut = GetColorLut(TEXT_COLOR_MASK);
    u16 const * colorLut = GetColorLut(text->colorId);

    int unused;

    for (i = 0; i < 16; ++i) {
        // read one row of 32 bits from the bitmap
        bitmapRow = (u64) *bitmap << subx * 2;

        dst[0x00] &= maskLut[bitmapRow & 0xFF] | (maskLut[(bitmapRow >> 8) & 0xFF] << 16);
        dst[0x00] |= colorLut[bitmapRow & 0xFF] | (colorLut[(bitmapRow >> 8) & 0xFF] << 16);

        dst[0x10] &= maskLut[(bitmapRow >> 16) & 0xFF] | (maskLut[(bitmapRow >> 24) & 0xFF] << 16);
        dst[0x10] |= colorLut[(bitmapRow >> 16) & 0xFF] | (colorLut[(bitmapRow >> 24) & 0xFF] << 16);

        dst[0x20] &= maskLut[(bitmapRow >> 32) & 0xFF] | (maskLut[(bitmapRow >> 40) & 0xFF] << 16);
        dst[0x20] |= colorLut[(bitmapRow >> 32) & 0xFF] | (colorLut[(bitmapRow >> 40) & 0xFF] << 16);

        dst++;
        bitmap++;
    }

    text->x += glyph->width;
}

void InitSystemTextFont(void)
{
    ApplyPalette(Pal_Text, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;
    gActiveFont->drawGlyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
}

void InitTalkTextFont(void)
{
    ApplyPalette(Pal_Text + 0x10, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;

    gActiveFont->drawGlyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
}

void SetTextDrawNoClear(void)
{
    gActiveFont->drawGlyph = DrawTextGlyphNoClear;
}

void PutDrawText(struct Text * text, u16 * tm, int color, int x, int tile_width, char const * str)
{
    struct Text tmpText;

    if (text == NULL) {
        text = &tmpText;
        InitText(text, tile_width);
    }

    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);
}

void Text_InsertDrawString(struct Text *text, int x, int colorId, const char *str)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, colorId);
    Text_DrawString(text, str);
}

void Text_InsertDrawNumberOrBlank(struct Text *text, int x, int colorId, int n)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, colorId);
    Text_DrawNumberOrBlank(text, n);
}

void Text_DrawStringASCII(struct Text *text, const char *str)
{
    while (*str != 0 && *str != CHAR_NEWLINE) {
        struct Glyph *glyph = gActiveFont->glyphs[*str++];

        if (glyph == NULL)
            glyph = gActiveFont->glyphs['?'];

        gActiveFont->drawGlyph(text, glyph);
    }
}

const char *Text_DrawCharacterAscii(struct Text *th, const char *str)
{
    struct Glyph *glyph = gActiveFont->glyphs[*str++];

    if (glyph == NULL)
        glyph = gActiveFont->glyphs['?'];

    gActiveFont->drawGlyph(th, glyph);
    return str;
}

const char *GetCharTextLenASCII(const char *str, u32 *width)
{
    struct Glyph *glyph = gActiveFont->glyphs[*str++];

    if (glyph == NULL)
        glyph = gActiveFont->glyphs['?'];

    *width = glyph->width;
    return str;
}

int GetStringTextLenASCII(const char *str)
{
    int width = 0;

    while (*str != 0 && *str != CHAR_NEWLINE)
    {
        struct Glyph *glyph = gActiveFont->glyphs[*str++];

        width += glyph->width;
    }
    return width;
}

void nop_8004598(void)
{
    return;
}

void InitSpriteTextFont(struct Font *font, void *vramDest, int c)
{
    font->vramDest = (void *)vramDest;
    font->get_draw_dest = GetSpriteTextDrawDest;
    font->palid = (c & 0xF) + 16;
    font->tileref = ((uintptr_t)vramDest & 0x1FFFF) >> 5;
    font->chr_counter = 0;
    font->lang = GetLang();
    SetTextFont(font);
    font->drawGlyph = DrawSpriteTextGlyph;
}

void InitSpriteText(struct Text *th)
{
    th->chr_position = gActiveFont->chr_counter;
    th->tile_width = 32;
    th->db_id = 0;
    th->db_enabled = 0;
    th->is_printing = 0;
    gActiveFont->chr_counter += 64;
    th->x = 0;
    th->colorId = 0;
}

void SpriteText_DrawBackground(struct Text *th)
{
    if (th->tile_width != 0)
    {
        th->x = 0;
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(th), 0x360);
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(th) + 0x400, 0x360);
    }
}

void SpriteText_Clear(struct Text *th)
{
    if (th->tile_width != 0) {
        th->x = 0;
        CpuFastFill(0, gActiveFont->get_draw_dest(th), 0x360);
        CpuFastFill(0, gActiveFont->get_draw_dest(th) + 0x400, 0x360);
    }
}

void SpriteText_DrawBackgroundExt(struct Text *text, u32 b)
{
    text->x = 0;
    CpuFastFill(b, gActiveFont->get_draw_dest(text), 0x800);
}

void *GetSpriteTextDrawDest(struct Text *text)
{
    int r1 = (text->db_id * text->tile_width + text->chr_position + text->x / 8);
    return gActiveFont->vramDest + r1 * 32;
}

void DrawSpriteTextGlyph(struct Text *text, struct Glyph *glyph)
{
    u64 bmpRow;
    int i;
    u32 *dest = gActiveFont->get_draw_dest(text);
    int xoffset = text->x & 7;
    u32 *bitmap = glyph->bitmap;
    u16 *r8 = GetColorLut(text->colorId);

    for (i = 0; i < 8; i++) {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    dest = gActiveFont->get_draw_dest(text) + 0x400;

    for (i = 0; i < 8; i++) {
        // read one row of 32 bits from the bitmap
        bmpRow = (u64)*bitmap << xoffset * 2;
        bitmap++;

        dest[0] |= r8[bmpRow & 0xFF] | (r8[(bmpRow >> 8) & 0xFF] << 16);
        dest[8] |= r8[(bmpRow >> 16) & 0xFF] | (r8[(bmpRow >> 24) & 0xFF] << 16);
        dest[16] |= r8[(bmpRow >> 32) & 0xFF] | (r8[(bmpRow >> 40) & 0xFF] << 16);

        dest++;
    }

    text->x += glyph->width;
}

void TextPrint_OnLoop(struct TextPrintProc * proc)
{
    int i;

    proc->clock--;
    if (proc->clock > 0)
        return;

    proc->clock = proc->interval;

    for (i = 0; i < proc->char_per_tick; ++i) {
        switch (*proc->str) {
        case 0: // end
            // fallthrough

        case 1: // newline
            proc->text->is_printing = false;
            Proc_Break(proc);

            return;

        case 4: // space?
            proc->str++;
            Text_Skip(proc->text, 6);

            break;

        default:
            proc->str = Text_DrawCharacter(proc->text, proc->str);

        }
    }
}

struct ProcCmd ProcScr_TextPrint[] =
{
    PROC_REPEAT(TextPrint_OnLoop),
    PROC_END,
};

char *StartTextPrint(struct Text *text, char * str, int interval, int char_per_tick)
{
    struct TextPrintProc * proc;

    if (interval == 0)
        Text_DrawString(text, str);

    if (char_per_tick == 0)
        char_per_tick = 1;

    proc = Proc_Start(ProcScr_TextPrint, PROC_TREE_3);

    proc->text = text;
    proc->str = str;

    proc->char_per_tick = char_per_tick;
    proc->interval = interval;
    proc->clock = 0;

    text->is_printing = TRUE;

    return GetStringLineEnd(str);
}

bool IsTextPrinting(struct Text *text)
{
    return text->is_printing;
}

void EndTextPrinting(void)
{
    Proc_EndEach(ProcScr_TextPrint);
}

void GreenText_OnLoop(void)
{
    u32 index = (GetGameClock() / 4) % 16;
    PAL_BG_COLOR(BGPAL_TEXT_DEFAULT, 14) = *(Pal_GreenTextColors + index);
    EnablePaletteSync();
}

struct ProcCmd ProcScr_GreenTextColor[] =
{
	PROC_END_IF_DUPLICATE,
	PROC_REPEAT(GreenText_OnLoop),
	PROC_END,
};

void StartGreenText(ProcPtr parent)
{
    if (parent != NULL)
        Proc_Start(ProcScr_GreenTextColor, parent);
    else
        Proc_Start(ProcScr_GreenTextColor, PROC_TREE_3);
}

void EndGreenText(void)
{
    Proc_EndEach(ProcScr_GreenTextColor);
}

void DrawSpecialCharGlyph_old(struct Text *th, u16 *b, int c)
{
    int r1 = gActiveFont->tileref + (th->db_id * th->tile_width + th->chr_position) * 2;
    int i;

    for (i = 0; i < th->tile_width && i < c; i++)
    {
        b[0] = r1;
        r1++;

        b[32] = r1;
        r1++;

        b++;
    }

    if (th->db_enabled != 0)
        th->db_id ^= 1;
}

void DrawSpecialCharGlyph(int a, int b, struct Glyph *glyph)
{
    int i;
    u32 *r8 = (u32 *)(gActiveFont->vramDest + a * 64);
    u32 *r7 = glyph->bitmap;
    u16 *r2 = GetColorLut(b);

    for (i = 0; i < 16; i++)
    {
        u32 r0 = *r7++;
#ifndef NONMATCHING
        register u32 r4 asm("r4") = r2[r0 & 0xFF];
        register u32 r5 asm("r5") = r2[(r0 >> 8) & 0xFF];
        register u32 var asm("r0") = (r5 << 16);
#else
        u32 r4 = r2[r0 & 0xFF];
        u32 r5 = r2[(r0 >> 8) & 0xFF];
        u32 var = (r5 << 16);
#endif
        u32 var2 = var + r4;

        *r8++ = var2;
    }
}

int AddSpecialChar(struct SpecialCharSt *st, int color, int id)
{
    st->color = color;
    st->id = id;
    st->chr_position = gActiveFont->chr_counter++;

    (st + 1)->color = -1;

    DrawSpecialCharGlyph(st->chr_position, color, TextGlyphs_Special[id]);

    return st->chr_position;
}

int GetSpecialCharChr(int color, int id)
{
    struct SpecialCharSt *it = sSpecialCharStList;

    while (1) {
        if (it->color < 0)
            return AddSpecialChar(it, color, id);

        if (it->color == color && it->id == id)
            return it->chr_position;

        it++;
    }
}
void PutSpecialChar(u16 * tm, int color, int id)
{
    int chr;

    if (id == TEXT_SPECIAL_NOTHING) {
        tm[0x00] = 0;
        tm[0x20] = 0;

        return;
    }

    chr = GetSpecialCharChr(color, id) * 2 + gActiveFont->tileref;

    tm[0x00] = chr;
    tm[0x20] = chr + 1;
}

void PutNumberExt(u16 *tm, int color, int number, int id_zero)
{
    if (number == 0) {
        PutSpecialChar(tm, color, id_zero);
        return;
    }

    while (number != 0) {
        PutSpecialChar(tm, color, number % 10 + id_zero);
        number /= 10;

        tm--;
    }
}

void PutNumber(u16 *tm, int color, int number)
{
    PutNumberExt(tm, color, number, TEXT_SPECIAL_BIGNUM_0);
}

void PutNumberOrBlank(u16 *tm, int color, int number)
{
    if (number < 0 || number == 0xFF)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    else
        PutNumber(tm, color, number);
}

void PutNumberTwoChr(u16 *tm, int color, int number)
{
    if (number == 100)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_100_A, TEXT_SPECIAL_100_B);
    else if (number < 0 || number == 255)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    else
        PutNumber(tm, color, number);
}

void PutNumberSmall(u16 *tm, int color, int number)
{
    PutNumberExt(tm, color, number, TEXT_SPECIAL_SMALLNUM_0);
}

void PutNumberBonus(int number, u16 *tm)
{
    if (number == 0)
        return;

    PutSpecialChar(tm, TEXT_COLOR_SYSTEM_GREEN, TEXT_SPECIAL_PLUS);
    PutNumberSmall(tm + ((number >= 10) ? 2 : 1), TEXT_COLOR_SYSTEM_GREEN, number);
}

void SpecialCharTest(void)
{
    int ix, iy;

    int cnt = GetGameClock();

    for (iy = 0; iy < 10; ++iy)
        for (ix = 0; ix < 30; ++ix)
            PutSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy * 2), TEXT_COLOR_SYSTEM_WHITE, (cnt++) & 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

inline void PutNumber2DigitExt(u16 *tm, int color, int number, int id_zero);

inline void PutNumber2DigitExt(u16 *tm, int color, int number, int id_zero)
{
    PutSpecialChar(tm, color, number % 10 + id_zero);
    PutSpecialChar(tm - 1, color, (number / 10) % 10 + id_zero);
}

inline void PutNumber2Digit(u16 *tm, int color, int number)
{
    PutNumber2DigitExt(tm, color, number, TEXT_SPECIAL_BIGNUM_0);
}

inline void PutNumber2DigitSmall(u16 *tm, int color, int number)
{
    PutNumber2DigitExt(tm, color, number, TEXT_SPECIAL_SMALLNUM_0);
}

void PutTime(u16 * tm, int color, int time, bool always_display_punctuation)
{
    u16 hours, minutes, seconds;
    s8 hs = FormatTime(time, &hours, &minutes, &seconds);

    PutNumber(tm + 2, color, hours);
    PutNumber2Digit(tm + 5, color, minutes);
    PutNumber2DigitSmall(tm + 8, color, seconds);

    if (hs == FALSE || always_display_punctuation)
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_COLON);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_COLON);
    }
    else
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_NOTHING);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_NOTHING);
    }
}

void PutTwoSpecialChar(u16 *tm, int color, int id_a, int id_b)
{
    PutSpecialChar(tm++, color, id_a);
    PutSpecialChar(tm,   color, id_b);
}
