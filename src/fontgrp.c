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
