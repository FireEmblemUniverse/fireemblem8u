#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"

#include "constants/songs.h"

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A40AC[] =
{
    {
        gUnknown_089B83C0,
        gUnknown_089D23D8,
        gUnknown_089D2AD8,
    },
    {
        gUnknown_089B89C4,
        gUnknown_089D23F8,
        gUnknown_089D2C30,
    },
    {
        gUnknown_089B90D8,
        gUnknown_089D2418,
        gUnknown_089D2DC0,
    },
    {
        gUnknown_089B98DC,
        gUnknown_089D2438,
        gUnknown_089D2F78,
    },
    {
        gUnknown_089BA190,
        gUnknown_089D2458,
        gUnknown_089D3130,
    },
    {
        gUnknown_089BA9D8,
        gUnknown_089D2478,
        gUnknown_089D32D8,
    },
    {
        gUnknown_089BB2C8,
        gUnknown_089D2498,
        gUnknown_089D34A0,
    },
    {
        gUnknown_089BBD68,
        gUnknown_089D24B8,
        gUnknown_089D36B0,
    },
    {
        gUnknown_089BC884,
        gUnknown_089D24D8,
        gUnknown_089D38CC,
    },
    {
        gUnknown_089BD3B4,
        gUnknown_089D24F8,
        gUnknown_089D3AD4,
    },
    {
        gUnknown_089BDEE8,
        gUnknown_089D2518,
        gUnknown_089D3CF8,
    },
    {
        gUnknown_089BEA90,
        gUnknown_089D2538,
        gUnknown_089D3F20,
    },
    {
        gUnknown_089BF5FC,
        gUnknown_089D2558,
        gUnknown_089D4150,
    },
    {
        gUnknown_089BFF64,
        gUnknown_089D2578,
        gUnknown_089D432C,
    },
    {
        gUnknown_089C08C0,
        gUnknown_089D2598,
        gUnknown_089D4500,
    },
    {
        gUnknown_089C1190,
        gUnknown_089D25B8,
        gUnknown_089D46C4,
    },
    {
        gUnknown_089C1BA8,
        gUnknown_089D25D8,
        gUnknown_089D48AC,
    },
    {
        gUnknown_089C247C,
        gUnknown_089D25F8,
        gUnknown_089D4A60,
    },
    {
        gUnknown_089C2BF0,
        gUnknown_089D2618,
        gUnknown_089D4BFC,
    },
    {
        gUnknown_089C32A4,
        gUnknown_089D2638,
        gUnknown_089D4D74,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A419C[] =
{
    {
        gUnknown_089C39A8,
        gUnknown_089D2658,
        gUnknown_089D4ECC,
    },
    {
        gUnknown_089C3EE8,
        gUnknown_089D2678,
        gUnknown_089D4FDC,
    },
    {
        gUnknown_089C447C,
        gUnknown_089D2698,
        gUnknown_089D5100,
    },
    {
        gUnknown_089C4834,
        gUnknown_089D26B8,
        gUnknown_089D5214,
    },
    {
        gUnknown_089C48E0,
        gUnknown_089D26D8,
        gUnknown_089D52D0,
    },
    {
        gUnknown_089C495C,
        gUnknown_089D26F8,
        gUnknown_089D538C,
    },
    {
        gUnknown_089C49CC,
        gUnknown_089D2718,
        gUnknown_089D5440,
    },
    {
        gUnknown_089C4E38,
        gUnknown_089D2738,
        gUnknown_089D5540,
    },
    {
        gUnknown_089C5328,
        gUnknown_089D2758,
        gUnknown_089D5658,
    },
    {
        gUnknown_089C5674,
        gUnknown_089D2778,
        gUnknown_089D5764,
    },
    {
        gUnknown_089C5734,
        gUnknown_089D2798,
        gUnknown_089D5820,
    },
    {
        gUnknown_089C57D8,
        gUnknown_089D27B8,
        gUnknown_089D58E0,
    },
    {
        gUnknown_089C5F70,
        gUnknown_089D27D8,
        gUnknown_089D5A20,
    },
    {
        gUnknown_089C65EC,
        gUnknown_089D27F8,
        gUnknown_089D5B58,
    },
    {
        gUnknown_089C6A58,
        gUnknown_089D2818,
        gUnknown_089D5C90,
    },
    {
        gUnknown_089C6B20,
        gUnknown_089D2838,
        gUnknown_089D5D4C,
    },
    {
        gUnknown_089C727C,
        gUnknown_089D2858,
        gUnknown_089D5E9C,
    },
    {
        gUnknown_089C7A2C,
        gUnknown_089D2878,
        gUnknown_089D5FF0,
    },
    {
        gUnknown_089C8440,
        gUnknown_089D2898,
        gUnknown_089D6170,
    },
    {
        gUnknown_089C8DC4,
        gUnknown_089D28B8,
        gUnknown_089D62F8,
    },
    {
        gUnknown_089C9A44,
        gUnknown_089D28D8,
        gUnknown_089D64EC,
    },
    {
        gUnknown_089CA444,
        gUnknown_089D28F8,
        gUnknown_089D66D0,
    },
    {
        gUnknown_089CAA10,
        gUnknown_089D2918,
        gUnknown_089D67F4,
    },
    {
        gUnknown_089CB7B0,
        gUnknown_089D2938,
        gUnknown_089D6AA4,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A42BC[] =
{
    {
        gUnknown_089CCA28,
        gUnknown_089D2958,
        gUnknown_089D6E1C,
    },
    {
        gUnknown_089CCE8C,
        gUnknown_089D2978,
        gUnknown_089D6F0C,
    },
    {
        gUnknown_089CD650,
        gUnknown_089D2998,
        gUnknown_089D704C,
    },
    {
        gUnknown_089CE038,
        gUnknown_089D29B8,
        gUnknown_089D71DC,
    },
    {
        gUnknown_089CEB94,
        gUnknown_089D29D8,
        gUnknown_089D73B4,
    },
    {
        gUnknown_089CF7C0,
        gUnknown_089D29F8,
        gUnknown_089D75BC,
    },
    {
        gUnknown_089D038C,
        gUnknown_089D2A18,
        gUnknown_089D77CC,
    },
    {
        gUnknown_089D0E08,
        gUnknown_089D2A38,
        gUnknown_089D79B4,
    },
    {
        gUnknown_089D1648,
        gUnknown_089D2A58,
        gUnknown_089D7B78,
    },
    {
        gUnknown_089D1CA4,
        gUnknown_089D2A78,
        gUnknown_089D7D04,
    },
    {
        gUnknown_089D20E0,
        gUnknown_089D2A98,
        gUnknown_089D7E48,
    },
    {
        gUnknown_089D230C,
        gUnknown_089D2AB8,
        gUnknown_089D7F48,
    },
};

CONST_DATA struct ProcCmd ProcScr_089A434C[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_807F89C),
    PROC_REPEAT(sub_807F964),

    PROC_SLEEP(30),

    PROC_REPEAT(sub_807FAA0),
    PROC_REPEAT(sub_807FBCC),
    PROC_REPEAT(sub_807FC58),

    PROC_CALL(sub_807FCA8),

    PROC_END
};

void sub_807F878(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_089A434C, proc);
    else
        Proc_Start(ProcScr_089A434C, PROC_TREE_3);
}

void sub_807F89C(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;
}

// clang-format off

const int gUnknown_08205884[] =
{
    0x80, 0x1E0,
};

const u8 gUnknown_0820588C[] =
{
    4, 5,
};

// clang-format on

void sub_807F964(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_140, proc->xDisplay);
        }
        else if (proc->frame > 19)
        {
            proc->frame = 0;
            proc->timer = 0;
            proc->unk44 = 1;

            SetDispEnable(0, 0, 0, 0, 0);

            Proc_Break(proc);
            return;
        }

        Decompress(
            MapAnimfxConf_089A40AC[proc->frame].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44] * 0x20);

        Decompress(
            MapAnimfxConf_089A40AC[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_089A40AC[proc->frame].pal, gUnknown_0820588C[proc->unk44]);
        EnablePaletteSync();

        proc->frame++;
        proc->timer = 3;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

// clang-format off

const u8 gUnknown_0820588E[] =
{
    4, 5, 6, 7, 7, 7, 4,
    5, 5, 6, 6, 4, 4, 5,
    5, 3, 4, 3, 4, 3, 4,
    2, 2, 2, 0, 0,
};

// clang-format on

void sub_807FAA0(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        Decompress(
            MapAnimfxConf_089A419C[proc->frame].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_089A419C[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_089A419C[proc->frame].pal, gUnknown_0820588C[proc->unk44]);
        EnablePaletteSync();

        if (proc->frame == 0)
        {
            SetDispEnable(0, 0, 1, 0, 0);
        }
        else if (proc->frame > 22)
        {
            Proc_Break(proc);
        }

        proc->timer = gUnknown_0820588E[proc->frame];
        proc->frame++;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

void sub_807FBCC(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        proc->frame = 0;

        CpuFastFill(-1, (void*) VRAM + 0x20 * 0x2FF, 0x20);

        TileMap_FillRect(gBG0TilemapBuffer, 30, 20, TILEREF(0x2FF, 3));
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        PAL_BG_COLOR(3, 15) = 0;
        EnablePaletteSync();

        SetDispEnable(1, 0, 1, 0, 0);

        Proc_Break(proc);
    }
    proc->timer--;
}

void sub_807FC58(struct MAEffectProc * proc)
{
    u16 brightness = proc->frame * 4;

    if (proc->frame < 8)
    {
        PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);
    }
    else
    {
        PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
        Proc_Break(proc);
    }

    EnablePaletteSync();
    proc->frame++;
}

void sub_807FCA8(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_089A4394[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_807FCE4),
    PROC_REPEAT(sub_807FDC8),
    PROC_REPEAT(sub_807FE0C),
    PROC_CALL(sub_807FFF0),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END
};

void sub_807FCC0(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_089A4394, proc);
    else
        Proc_Start(ProcScr_089A4394, PROC_TREE_3);
}

void sub_807FCE4(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
    EnablePaletteSync();

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->unk48 = 119;
}

void sub_807FDC8(struct MAEffectProc * proc)
{
    int brightness = proc->unk48 * 32 / 120;
    PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);

    EnablePaletteSync();

    proc->unk48--;

    if (proc->unk48 < 31)
        Proc_Break(proc);
}

void sub_807FE0C(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame != 0)
        {
            if (proc->frame > 11)
            {
                proc->frame = proc->timer;
                Proc_Break(proc);
                return;
            }
        }
        else
        {
            SetDispEnable(0, 0, 1, 1, 1);
        }

        Decompress(
            MapAnimfxConf_089A42BC[proc->frame].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_089A42BC[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        if (proc->unk48 < 0)
        {
            ApplyPalette(MapAnimfxConf_089A42BC[proc->frame].pal, gUnknown_0820588C[proc->unk44]);
            EnablePaletteSync();
        }

        proc->frame_idx = proc->frame;
        proc->frame++;

        proc->timer = 4;

        proc->unk4C = proc->unk44;
        proc->unk44 ^= 1;
    }

    proc->timer--;

    if (proc->unk48 >= 0)
    {
        int i, addedBrightness = proc->unk48 * 32 / 240;

        const u16 * const in  = MapAnimfxConf_089A42BC[proc->frame_idx].pal;
        u16 *       const out = &gPaletteBuffer[0x10 * gUnknown_0820588C[proc->unk4C]];

        for (i = 1; i < 16; ++i)
        {
            u32 r = RED_VALUE(in[i]);
            u32 g = GREEN_VALUE(in[i]);
            u32 b = BLUE_VALUE(in[i]);

            r = r + addedBrightness > 31 ? 31 : r + addedBrightness;
            g = g + addedBrightness > 31 ? 31 : g + addedBrightness;
            b = b + addedBrightness > 31 ? 31 : b + addedBrightness;

            out[i] = RGB(r, g, b);
        }

        EnablePaletteSync();

        proc->unk48--;
    }
}

void sub_807FFF0(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG2_SYNC_BIT);
}

void sub_8080014(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_089A4434, proc);
    else
        Proc_Start(ProcScr_089A4434, PROC_TREE_3);
}

void sub_8080038(void)
{
    SetSecondaryHBlankHandler(NULL);
    Proc_EndEach(ProcScr_089A448C);
}

void sub_8080050(struct MAEffectProc * proc)
{
    struct Proc8080050 * vsync;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    gUnknown_03001C7C = 0;

    vsync = Proc_Start(ProcScr_089A448C, PROC_TREE_VSYNC);

    vsync->unk29 = 0;
    vsync->unk2A = 0;

    SetSecondaryHBlankHandler(sub_8080408);
}

// clang-format off

struct MapAnimfxConf CONST_DATA gUnknown_089A43D4[] =
{
    {
        .img = gUnknown_089D8010,
        .pal = gUnknown_089DCD48,
        .tsa = gUnknown_089DCE48,
    },
    {
        .img = gUnknown_089D8198,
        .pal = gUnknown_089DCD68,
        .tsa = gUnknown_089DCF10,
    },
    {
        .img = gUnknown_089D84A8,
        .pal = gUnknown_089DCD88,
        .tsa = gUnknown_089DCFFC,
    },
    {
        .img = gUnknown_089D8910,
        .pal = gUnknown_089DCDA8,
        .tsa = gUnknown_089DD114,
    },
    {
        .img = gUnknown_089D925C,
        .pal = gUnknown_089DCDC8,
        .tsa = gUnknown_089DD284,
    },
    {
        .img = gUnknown_089DA40C,
        .pal = gUnknown_089DCDE8,
        .tsa = gUnknown_089DD4E8,
    },
    {
        .img = gUnknown_089DB1A0,
        .pal = gUnknown_089DCE08,
        .tsa = gUnknown_089DD790,
    },
    {
        .img = gUnknown_089DBFE0,
        .pal = gUnknown_089DCE28,
        .tsa = gUnknown_089DDA68,
    },
};

const u32 gUnknown_082058A8[] =
{
    0x160, 0x260,
};

const u8 gUnknown_082058B0[] =
{
    4, 5,
};

const struct Unk082058B4 gUnknown_082058B4[] =
{
    { 0, 5, 0, },
    { 1, 4, 0, },
    { 2, 4, 0, },
    { 3, 3, 0, },
    { 4, 3, 0, },
    { 5, 2, 1, },
    { 6, 2, 1, },
    { 7, 1, 0, },
};

// clang-format on

void sub_8080138(struct MAEffectProc* proc)
{
    if (proc->timer == 0)
    {
        struct Proc8080050* vsync;
        u8 v0 = gUnknown_082058B4[proc->frame].unk00;

        Decompress(
            gUnknown_089A43D4[v0].img,
            (void*) VRAM + gUnknown_082058A8[proc->unk44] * 0x20);

        Decompress(
            gUnknown_089A43D4[v0].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gUnknown_082058A8[proc->unk44] | (gUnknown_082058B0[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(
            gUnknown_089A43D4[v0].pal,
            gUnknown_082058B0[proc->unk44]);

        EnablePaletteSync();

        vsync = (void*) Proc_Find(ProcScr_089A448C);

        vsync->unk29 = 1;
        vsync->unk2A = gUnknown_082058B4[proc->frame].unk02;

        if (proc->frame == 0)
            PlaySeSpacial(SONG_13F, proc->xDisplay); // TODO: song ids

        proc->timer = gUnknown_082058B4[proc->frame].unk01;

        if (proc->frame > 6)
        {
            vsync->unk29 = 1;
            vsync->unk2A = 0;

            proc->frame = 0;

            Proc_Break(proc);
        }
        else
        {
            proc->frame++;
            proc->unk44 ^= 1;
        }
    }

    proc->timer--;
}

//! FE8U = 0x08080288
void sub_8080288(struct MAEffectProc * proc)
{
    int i;

    if (proc->timer == 0)
    {
        u16 amount = proc->frame * 4;

        if (proc->frame <= 7)
        {
            for (i = 1; i < 16; i++)
            {
                u16 r;
                u16 g;
                u16 b;
                u16 color = PAL_BG_COLOR(gUnknown_082058B0[proc->unk44], i);

                r = amount + RED_VALUE(color);

                if (r > 31)
                {
                    r = 31;
                }

                g = amount + GREEN_VALUE(color);

                if (g > 31)
                {
                    g = 31;
                }

                b = amount + BLUE_VALUE(color);

                if (b > 31)
                {
                    b = 31;
                }

                PAL_BG_COLOR(gUnknown_082058B0[proc->unk44], i) = RGB(r, g, b);
            }
        }
        else
        {
            SetBlendTargetA(0, 0, 0, 1, 1);
            SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 16);
            SetDispEnable(0, 0, 0, 1, 1);

            proc->frame = 0;
            Proc_Break(proc);

            return;
        }

        EnablePaletteSync();
        proc->frame++;
    }
    else
    {
        proc->timer--;
    }

    return;
}

//! FE8U = 0x0808038C
void sub_808038C(struct MAEffectProc * proc)
{
    if (proc->frame < 130)
    {
        int bldY = (proc->frame * 16) / 130;
        SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 16 - bldY);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 0);
        Proc_Break(proc);
    }

    proc->frame++;

    return;
}

//! FE8U = 0x080803D8
void sub_80803D8(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_089A4434[] =
{
    PROC_SET_END_CB(sub_8080038),
    PROC_SLEEP(1),

    PROC_CALL(sub_8080050),
    PROC_REPEAT(sub_8080138),
    PROC_REPEAT(sub_8080288),

    PROC_SLEEP(30),

    PROC_REPEAT(sub_808038C),
    PROC_CALL(sub_80803D8),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080408
void sub_8080408(void)
{
    u16 vcount;

    if (gUnknown_03001C7C == 0)
    {
        return;
    }

    vcount = REG_VCOUNT + 1;

    if (vcount == 228)
    {
        vcount = 0;
    }

    if (vcount < DISPLAY_HEIGHT)
    {
        REG_BG2VOFS = ((vcount >> 1) - vcount) & 0x1FF;
    }

    return;
}

struct Proc89A448C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
};

//! FE8U = 0x0808044C
void sub_808044C(struct Proc89A448C * proc)
{
    if (proc->unk_29 != 0)
    {
        gUnknown_03001C7C = proc->unk_2a;
        proc->unk_29 = 0;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_089A448C[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_808044C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080474
void sub_8080474(ProcPtr parent)
{

    if (parent != NULL)
    {
        Proc_StartBlocking(gUnknown_089A45DC, parent);
    }
    else
    {
        Proc_Start(gUnknown_089A45DC, PROC_TREE_3);
    }

    return;
}

// clang-format off

struct MapAnimfxConf CONST_DATA gUnknown_089A44A4[] =
{
    {
        .img = gUnknown_089DDE8C,
        .pal = gUnknown_089E4C7C,
        .tsa = gUnknown_089E4FBC,
    },
    {
        .img = gUnknown_089DDF10,
        .pal = gUnknown_089E4C9C,
        .tsa = gUnknown_089E5074,
    },
    {
        .img = gUnknown_089DDF9C,
        .pal = gUnknown_089E4CBC,
        .tsa = gUnknown_089E5130,
    },
    {
        .img = gUnknown_089DE030,
        .pal = gUnknown_089E4CDC,
        .tsa = gUnknown_089E51EC,
    },
    {
        .img = gUnknown_089DE0BC,
        .pal = gUnknown_089E4CFC,
        .tsa = gUnknown_089E52AC,
    },
    {
        .img = gUnknown_089DE14C,
        .pal = gUnknown_089E4D1C,
        .tsa = gUnknown_089E5364,
    },
    {
        .img = gUnknown_089DE1CC,
        .pal = gUnknown_089E4D3C,
        .tsa = gUnknown_089E541C,
    },
    {
        .img = gUnknown_089DEA30,
        .pal = gUnknown_089E4D5C,
        .tsa = gUnknown_089E5600,
    },
    {
        .img = gUnknown_089DF470,
        .pal = gUnknown_089E4D7C,
        .tsa = gUnknown_089E5814,
    },
    {
        .img = gUnknown_089DFF90,
        .pal = gUnknown_089E4D9C,
        .tsa = gUnknown_089E5A58,
    },
    {
        .img = gUnknown_089E0AB8,
        .pal = gUnknown_089E4DBC,
        .tsa = gUnknown_089E5D08,
    },
    {
        .img = gUnknown_089E1480,
        .pal = gUnknown_089E4DDC,
        .tsa = gUnknown_089E5FEC,
    },
    {
        .img = gUnknown_089E2154,
        .pal = gUnknown_089E4DFC,
        .tsa = gUnknown_089E6290,
    },
    {
        .img = gUnknown_089E2C1C,
        .pal = gUnknown_089E4E1C,
        .tsa = gUnknown_089E64D0,
    },
    {
        .img = gUnknown_089E34A8,
        .pal = gUnknown_089E4E3C,
        .tsa = gUnknown_089E66A0,
    },
    {
        .img = gUnknown_089E3B88,
        .pal = gUnknown_089E4E5C,
        .tsa = gUnknown_089E6808,
    },
    {
        .img = gUnknown_089E4024,
        .pal = gUnknown_089E4E7C,
        .tsa = gUnknown_089E6924,
    },
    {
        .img = gUnknown_089E4344,
        .pal = gUnknown_089E4E9C,
        .tsa = gUnknown_089E6A14,
    },
    {
        .img = gUnknown_089E44B8,
        .pal = gUnknown_089E4EBC,
        .tsa = gUnknown_089E6AE4,
    },
    {
        .img = gUnknown_089E45D0,
        .pal = gUnknown_089E4EDC,
        .tsa = gUnknown_089E6BB0,
    },
    {
        .img = gUnknown_089E46E8,
        .pal = gUnknown_089E4EFC,
        .tsa = gUnknown_089E6C80,
    },
    {
        .img = gUnknown_089E47CC,
        .pal = gUnknown_089E4F1C,
        .tsa = gUnknown_089E6D50,
    },
    {
        .img = gUnknown_089E48C0,
        .pal = gUnknown_089E4F3C,
        .tsa = gUnknown_089E6E1C,
    },
    {
        .img = gUnknown_089E49D8,
        .pal = gUnknown_089E4F5C,
        .tsa = gUnknown_089E6EE8,
    },
    {
        .img = gUnknown_089E4AEC,
        .pal = gUnknown_089E4F7C,
        .tsa = gUnknown_089E6FB4,
    },
    {
        .img = gUnknown_089E4BC8,
        .pal = gUnknown_089E4F9C,
        .tsa = gUnknown_089E7080,
    },
};

const int gUnknown_082058D4[] =
{
    0x160, 0x260,
};

const u8 gUnknown_082058DC[] =
{
    4, 5,
};

// clang-format on

//! FE8U = 0x08080498
void sub_8080498(int frame, int unk44)
{
    Decompress(gUnknown_089A44A4[frame].img, (void *)(0x6000000 + gUnknown_082058D4[unk44] * 0x20));
    Decompress(gUnknown_089A44A4[frame].tsa, gGenericBuffer);
    AddAttr2dBitMap(
        gBG2TilemapBuffer, (u16 *)gGenericBuffer, 0, 0, gUnknown_082058D4[unk44] | gUnknown_082058DC[unk44] << 12);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ApplyPalette(gUnknown_089A44A4[frame].pal, gUnknown_082058DC[unk44]);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x08080530
void sub_8080530(int frame, int unk44)
{
    Decompress(gUnknown_089A44A4[frame].img, (void *)(0x6000000 + gUnknown_082058D4[unk44] * 0x20));
    Decompress(gUnknown_089A44A4[frame].tsa, gGenericBuffer);
    AddAttr2dBitMap(
        gBG2TilemapBuffer, (u16 *)gGenericBuffer, 0, 0, gUnknown_082058D4[unk44] | gUnknown_082058DC[unk44] << 12);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080805AC
void sub_80805AC(int idxA, int idxB, int val)
{
    s32 i;

    const u16 * src = gUnknown_089A44A4[idxA].pal;
    u16 * dst = PAL_BG(gUnknown_082058DC[idxB]);

    for (i = 0; i < 16; i++)
    {
        u16 r;
        u16 g;
        u16 b;
        u16 color = src[i];

        r = RED_VALUE(color);
        r += (31 - r) * val / 32;

        g = GREEN_VALUE(color);
        g += (31 - g) * val / 32;

        b = BLUE_VALUE(color);
        b += (31 - b) * val / 32;

        dst[i] = RGB(r, g, b);
    }

    EnablePaletteSync();

    return;
}

struct MAEffectSummonProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ u8 unk_38;
    /* 3A */ STRUCT_PAD(0x3a, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 unk_4a;
    /* 4C */ STRUCT_PAD(0x4c, 0x50);
    /* 50 */ struct MAEffectSummonProc * unk_50;
};

//! FE8U = 0x08080654
void sub_8080654(struct MAEffectProc * proc)
{
    Proc_End((void *)proc->img);
    return;
}

//! FE8U = 0x08080660
void sub_8080660(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_2, 8, 8);

    proc->img = Proc_Start(gUnknown_089A4644, proc);
    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk46 = 0;

    return;
}

// clang-format off

const u8 gUnknown_082058DE[] =
{
    0, 1, 2, 3,
};

// clang-format on

//! FE8U = 0x08080730
void sub_8080730(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        sub_8080498(gUnknown_082058DE[proc->frame], proc->unk44);

        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_141, proc->xDisplay);
        }

        proc->frame++;
        proc->timer = 5;

        if (proc->frame > 3)
        {
            proc->frame = 0;
            proc->unk46 = 0;

            proc->unk48 = 0;
            proc->frame_idx = 0;

            proc->xDisplay = gBmSt.camera.x;
            proc->yDisplay = gBmSt.camera.y;

            Proc_Break(proc);
        }

        proc->unk44 ^= 1;
    }

    proc->timer--;

    return;
}

// clang-format off

const u8 gUnknown_082058E2[] =
{
    4, 5,
};

// clang-format on

//! FE8U = 0x080807C8
void sub_80807C8(struct MAEffectSummonProc * proc)
{
    if (proc->unk_46 == 5)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 2;
    }
    else if (proc->unk_46 == 8)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 0xb)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 2;

        proc->unk_50->unk_34 = 4;
    }

    if (proc->unk_42 == 0)
    {
        sub_8080498(gUnknown_082058E2[proc->unk_40], proc->unk_44);

        proc->unk_40++;
        proc->unk_42 = 4;

        if (proc->unk_46 > 21)
        {
            if (proc->unk_40 > 1)
            {
                proc->unk_40 = 0;
                proc->unk_46 = 0;
                Proc_Break(proc);
            }
        }
        else if (proc->unk_40 > 1)
        {
            proc->unk_40 = 0;
            proc->unk_46++;
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

// clang-format off

const u8 gUnknown_082058E4[] =
{
     6,  7,  8,  9,
    10, 11, 12, 13,
    14, 15, 16, 17,
};

// clang-format on

//! FE8U = 0x08080890
void sub_8080890(struct MAEffectSummonProc * proc)
{
    if (proc->unk_42 == 0)
    {
        sub_8080498(gUnknown_082058E4[proc->unk_40], proc->unk_44);

        proc->unk_42 = 3;

        if (proc->unk_40 > 10)
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;

            proc->unk_42--;

            Proc_Break(proc);

            return;
        }

        proc->unk_40++;
        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

//! FE8U = 0x08080900
void sub_8080900(struct MAEffectSummonProc * proc)
{
    int i;

    if (proc->unk_42 == 0)
    {
        u16 amount = proc->unk_40 << 2;

        if (proc->unk_40 < 8)
        {
            for (i = 1; i < 16; i++)
            {
                u16 r;
                u16 g;
                u16 b;

                u16 color = PAL_BG_COLOR(gUnknown_082058DC[proc->unk_44], i);

                r = amount + RED_VALUE(color);

                if (r > 31)
                {
                    r = 31;
                }

                g = amount + GREEN_VALUE(color);

                if (g > 31)
                {
                    g = 31;
                }

                b = amount + BLUE_VALUE(color);

                if (b > 31)
                {
                    b = 31;
                }

                PAL_BG_COLOR(gUnknown_082058DC[proc->unk_44], i) = RGB(r, g, b);
            }

            EnablePaletteSync();

            proc->unk_40++;
        }
        else
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;
            proc->unk_48 = 0;
            proc->unk_4a = -1;

            Proc_Break(proc);

            return;
        }
    }
    else
    {
        proc->unk_42--;
    }

    return;
}

// clang-format off

const u8 gUnknown_082058F0[] =
{
    18, 19, 20, 21,
};

// clang-format on

//! FE8U = 0x080809D8
void sub_80809D8(struct MAEffectSummonProc * proc)
{
    s16 tmp = 0x95;

    if (proc->unk_46 == 2)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 3)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 4;
    }
    else if (proc->unk_46 == 4)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 5)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 4;
    }
    else if (proc->unk_46 == 6)
    {
        proc->unk_50->unk_29 = 0;
        proc->unk_50->unk_2a = 0;
    }

    if (proc->unk_42 == 0)
    {
        sub_8080530(gUnknown_082058F0[proc->unk_40], proc->unk_44);

        proc->unk_4a = proc->unk_40;
        proc->unk_40++;

        proc->unk_42 = 4;

        if (proc->unk_46 >= 11)
        {
            if (proc->unk_40 > 3)
            {
                proc->unk_40 = 0;
                proc->unk_46 = 0;

                Proc_Break(proc);
            }
        }
        else if (proc->unk_40 > 3)
        {
            proc->unk_40 = 0;
            proc->unk_46++;
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    if (proc->unk_48 <= tmp)
    {
        proc->unk_48++;
    }

    if (proc->unk_4a >= 0)
    {
        sub_80805AC(gUnknown_082058F0[proc->unk_4a], proc->unk_44, 0x20 - ((proc->unk_48 * 0x20) / 0x96));
    }

    return;
}

const u8 gUnknown_082058F4[] =
{
    22, 23, 24, 25,
};

//! FE8U = 0x08080B18
void sub_8080B18(struct MAEffectSummonProc * proc)
{
    if (proc->unk_42 == 0)
    {
        sub_8080498(gUnknown_082058F4[proc->unk_40], proc->unk_44);

        proc->unk_40++;
        proc->unk_42 = 5;

        if (proc->unk_40 > 3)
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;
            Proc_Break(proc);
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

//! FE8U = 0x08080B84
void sub_8080B84(void)
{
    BG_SetPosition(BG_2, 0, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_089A45DC[] =
{
    PROC_SET_END_CB(sub_8080654),
    PROC_SLEEP(1),

    PROC_CALL(sub_8080660),
    PROC_REPEAT(sub_8080730),
    PROC_REPEAT(sub_80807C8),
    PROC_REPEAT(sub_8080890),
    PROC_REPEAT(sub_8080900),
    PROC_REPEAT(sub_80809D8),
    PROC_REPEAT(sub_8080B18),
    PROC_CALL(sub_8080B84),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080BA8
void sub_8080BA8(struct MAEffectSummonProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_2a = 0;

    proc->unk_2c = gBmSt.camera.x;
    proc->unk_2e = gBmSt.camera.y;

    proc->unk_30 = 0;
    proc->unk_32 = 0;

    proc->unk_34 = 4;
    proc->unk_36 = 0;

    proc->unk_38 = 0;

    return;
}

// clang-format off

struct Pair
{
    s8 x;
    s8 y;
};

const struct Pair gUnknown_082058F8[] =
{
    { -1, +0, },
    { +0, +0, },
    { +1, +0, },
    { +0, +0, },
    { +0, -1, },
    { +0, +0, },
    { +0, +1, },
    { +0, +0, },
};

const struct Pair gUnknown_08205918[] =
{
    { -1, +0, },
    { +1, +0, },
    { +0, -1, },
    { +0, +1, },
    { -1, +0, },
    { +1, +0, },
    { +0, -1, },
    { +0, +1, },
};

const struct Pair gUnknown_08205938[] =
{
    { -2, +0, },
    { +1, +0, },
    { +0, -2, },
    { +0, +1, },
    { -1, +0, },
    { +2, +0, },
    { +0, -1, },
    { +0, +2, },
};

// clang-format on

//! FE8U = 0x08080BD8
void sub_8080BD8(struct MAEffectSummonProc * proc)
{
    int tmp = 8;

    if (proc->unk_29 == 0)
    {
        gBmSt.camera.x = proc->unk_2c;
        gBmSt.camera.y = proc->unk_2e;

        BG_SetPosition(BG_2, 8, 8);

        return;
    }

    if (proc->unk_36 > 0)
    {
        proc->unk_36--;
        return;
    }

    proc->unk_36 = proc->unk_34;

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_30 = gUnknown_082058F8[proc->unk_38].x;
            proc->unk_32 = gUnknown_082058F8[proc->unk_38].y;

            break;

        case 1:
            proc->unk_30 = gUnknown_08205918[proc->unk_38].x;
            proc->unk_32 = gUnknown_08205918[proc->unk_38].y;

            break;

        case 2:
            proc->unk_30 = gUnknown_08205938[proc->unk_38].x;
            proc->unk_32 = gUnknown_08205938[proc->unk_38].y;

            break;

        default:
            proc->unk_30 = proc->unk_2a * gUnknown_08205918[proc->unk_38].x;
            proc->unk_32 = proc->unk_2a * gUnknown_08205918[proc->unk_38].y;

            break;
    }

    gBmSt.camera.x = proc->unk_2c + proc->unk_30;
    gBmSt.camera.y = proc->unk_2e + proc->unk_32;

    BG_SetPosition(BG_2, proc->unk_30 + 8, proc->unk_32 + 8);

    proc->unk_38++;

    if (proc->unk_38 >= tmp)
    {
        proc->unk_38 = 0;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_089A4644[] =
{
    PROC_CALL(sub_8080BA8),
    PROC_YIELD,

    PROC_REPEAT(sub_8080BD8),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0807AD08
void New6C_SummonGfx(ProcPtr parent, int xBase, int yBase)
{
    struct MAEffectProc * proc = Proc_StartBlocking(gUnknown_089A46AC, parent);

    proc->xDisplay = ((xBase - (gBmSt.camera.x >> 4)) * 2 + 1) * 8;
    proc->yDisplay = ((yBase - (gBmSt.camera.y >> 4)) * 2 + 1) * 8;

    return;
}

//! FE8U = 0x08080D6C
void sub_8080D6C(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gUnknown_089E714C, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gUnknown_089E7DEC, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

// clang-format off

u8 * CONST_DATA gUnknown_089A4664[] =
{
    Tsa_089E7E0C,
    Tsa_089E7E2C,
    Tsa_089E7E50,
    Tsa_089E7E78,
    Tsa_089E7EA0,
    Tsa_089E7ECC,
    Tsa_089E7EFC,
    Tsa_089E7F2C,
    Tsa_089E7F5C,
    Tsa_089E7F8C,
    Tsa_089E7FBC,
    Tsa_089E7FFC,
    Tsa_089E8040,
    Tsa_089E8090,
    Tsa_089E80EC,
    Tsa_089E8148,
    Tsa_089E81A4,
    Tsa_089E8200,
};

// clang-format on

//! FE8U = 0x08080DCC
void sub_8080DCC(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = 0;
        }
        else if (proc->frame == 12)
        {
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            exit = 0;
        }
        else if (proc->frame > 17)
        {
            Proc_Break(proc);
            exit = 1;
        }
        else
        {
            exit = 0;
        }

        if (exit)
        {
            return;
        }

        Decompress(gUnknown_089A4664[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x08080E84
void sub_8080E84(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_089A46AC[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_8080D6C),
    PROC_REPEAT(sub_8080DCC),
    PROC_CALL(sub_8080E84),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080E9C
void sub_8080E9C(ProcPtr parent, struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_StartBlocking(gUnknown_089A46DC, parent);

    proc->unit = unit;
    proc->xDisplay = (((unit->xPos - (gBmSt.camera.x >> 4)) * 2) + 1) * 8;
    proc->yDisplay = (((unit->yPos - (gBmSt.camera.y >> 4)) * 2) + 1) * 8;

    return;
}

//! FE8U = 0x08080EE4
void sub_8080EE4(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gUnknown_089E714C, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gUnknown_089E7DEC, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

//! FE8U = 0x08080F44
void sub_8080F44(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = 0;
        }
        else if (proc->frame == 12)
        {
            proc->unit->state &= ~US_HIDDEN;
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            exit = 0;
        }
        else if (proc->frame > 17)
        {
            Proc_Break(proc);
            exit = 1;
        }
        else
        {
            exit = 0;
        }

        if (exit)
        {
            return;
        }

        Decompress(gUnknown_089A4664[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x08081008
void sub_8081008(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_089A46DC[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_8080EE4),
    PROC_REPEAT(sub_8080F44),
    PROC_CALL(sub_8081008),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08081020
void StartGlowingCross(ProcPtr parent, struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_GlowingCross, parent);

    proc->unit = unit;
    proc->xDisplay = (((unit->xPos - (gBmSt.camera.x >> 4)) * 2) + 1) * 8;
    proc->yDisplay = (((unit->yPos - (gBmSt.camera.y >> 4)) * 2) + 1) * 8;

    return;
}

//! FE8U = 0x08081068
void RemoveGlowingCrossDirectly(void)
{
    Proc_EndEach(ProcScr_GlowingCross);
    return;
}

//! FE8U = 0x08081078
void sub_8081078(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gUnknown_089E714C, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gUnknown_089E7DEC, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

//! FE8U = 0x08081100
void sub_8081100(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = FALSE;
        }
        else if (proc->frame > 9)
        {
            Proc_Break(proc);
            exit = TRUE;
        }
        else
        {
            exit = FALSE;
        }

        if (exit)
        {
            return;
        }

        Decompress(gUnknown_089A4664[proc->frame], gGenericBuffer);
        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x080811AC
void sub_80811AC(void)
{
    DeleteAllPaletteAnimator();
    SetWinEnable(0, 0, 0);
    return;
}


// clang-format off

struct ProcCmd CONST_DATA ProcScr_GlowingCross[] =
{
    PROC_SLEEP(1),
    PROC_SET_END_CB(sub_80811AC),

    PROC_CALL(sub_8081078),
    PROC_REPEAT(sub_8081100),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080811D0
void RemoveGlowingCrossDirectlyWithAnim(ProcPtr parent, int timer)
{
    struct MAEffectProc * proc = Proc_StartBlocking(ProcScr_GlowCrossExit, parent);
    proc->timer = timer;
    return;
}

//! FE8U = 0x080811EC
void sub_80811EC(struct MAEffectProc * proc)
{
    SetBlendAlpha(16, 16);
    proc->frame = 0;
    return;
}

//! FE8U = 0x08081208
void sub_8081208(struct MAEffectProc * proc)
{
    proc->frame++;

    if (proc->frame < proc->timer)
    {
        SetBlendAlpha(16 - (proc->frame * 16) / proc->timer, 16);
    }
    else
    {
        SetBlendAlpha(0, 16);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808125C
void nullsub_58(void)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GlowCrossExit[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_80811EC),
    PROC_REPEAT(sub_8081208),
    PROC_CALL(nullsub_58),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

const u8 gUnused_08205958[] =
{
    0, 0, 0, 0,
    0x50, 0, 0, 0,
    0x8A, 0, 0, 0,
};

// clang-format on
