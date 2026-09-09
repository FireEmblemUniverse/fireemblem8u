#include "global.h"

#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

EWRAM_DATA struct ChapterTitleFxSt gChapterTitleFxSt = { 0 };

void ApplyChapterTitlePal(int config, int palId)
{
    u16 * pal;
    pal = (config & 1)
        ? Pal_ChapterTitleAlt
        : Pal_ChapterTitleMain;

    if ((config & 0x80) == 0)
    {
        if ((config & 8) != 0)
        {
            pal = pal + 0xA0;
        }
        else
        {
            if ((config & 0x10) == 0)
            {
                if ((config & 0x20) != 0)
                    pal = pal + 0x20;
                if ((config & 0x40) != 0)
                    pal = pal + 0x40;
                if ((config & 4) != 0)
                    pal = pal + 0x40;
            }
        }
    }

    if ((config & 2) != 0) {
        pal = pal + 0x10;
    }

    ApplyPalette(pal, palId);
}

void PutChapterTitleGfx(int chr, u32 titleId)
{
    if (titleId > 0x108)
        titleId = 0x54;

    gChapterTitleFxSt.chr_str = chr & 0x3FF;
    Decompress(chap_title_data[titleId].save, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}

void _PutChapterTitleGfx(int chr, int titleId)
{
    PutChapterTitleGfx(chr, titleId);
}

void PutChapterTitleBG(int chr)
{
    gChapterTitleFxSt.chr_bg = chr & 0x3FF;
    Decompress(Img_ChapterTitleBg, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}

extern u8 Img_ChapterTitleBgAlt[];

void PutChapterTitleBGAlt(int chr)
{
    gChapterTitleFxSt.chr_bg = chr & 0x3FF;
    Decompress(Img_ChapterTitleBgAlt, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}

void DrawChapterTitleStr(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapterTitleFxSt.chr_str, pal);
    for (i = 0; i < 0x40; i++)
        *tm++ = tile++;
}

void DrawChapterTitleStrEx(u16 * tm, int pal, int c)
{
    int i;
    int tile = TILEREF(gChapterTitleFxSt.chr_str, pal);
    for (i = 0; i < 0x40; i++)
        *tm++ = tile++;
}

void DrawChapterTitleBG(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapterTitleFxSt.chr_bg, pal);
    for (i = 0; i < 0x80; i++)
        *tm++ = tile++;
}

void DrawChapterTitleBGTsa(u16 * tm, int pal)
{
    CallARM_FillTileRect(tm, Tsa_ChapterTitleBg, (u16)TILEREF(gChapterTitleFxSt.chr_bg, pal));
}

int GetChapterTitleExtra(struct PlaySt * chapterData)
{

    if (chapterData == 0)
        return 0x54; // No Data

    if (chapterData->chapterStateBits & PLAY_FLAG_POSTGAME)
        return 0x57; // Creature Campaign

    if (chapterData->chapterStateBits & PLAY_FLAG_COMPLETE)
        return 0x55; // Epilogue

    return GetROMChapterStruct(chapterData->chapterIndex)->chapTitleId;
}

int GetChapterTitleWM(struct PlaySt * chapterData)
{
    int unk;
    int i;

    if (chapterData == 0) {
        return 0x54; // No Data
    }

    unk = GetPlayChapterId(chapterData->chapterIndex);

    if ((chapterData->chapterStateBits & PLAY_FLAG_POSTGAME) || GetNextUnclearedNode(&gGMData) != unk)
    {
        for (i = 0; i < gWMMonsterSpawnsSize; i++)
        {
            if (unk == gWMMonsterSpawnLocations[i])
                return 0x46 + i;
        }
    }

    return GetROMChapterStruct(chapterData->chapterIndex)->chapTitleId;
}
