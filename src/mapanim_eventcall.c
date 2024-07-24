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

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A40AC[] = {
    {
        (const u16 *)0x89B83C0,
        (const u16 *)0x89D23D8,
        (const u16 *)0x89D2AD8,
    },
    {
        (const u16 *)0x89B89C4,
        (const u16 *)0x89D23F8,
        (const u16 *)0x89D2C30,
    },
    {
        (const u16 *)0x89B90D8,
        (const u16 *)0x89D2418,
        (const u16 *)0x89D2DC0,
    },
    {
        (const u16 *)0x89B98DC,
        (const u16 *)0x89D2438,
        (const u16 *)0x89D2F78,
    },
    {
        (const u16 *)0x89BA190,
        (const u16 *)0x89D2458,
        (const u16 *)0x89D3130,
    },
    {
        (const u16 *)0x89BA9D8,
        (const u16 *)0x89D2478,
        (const u16 *)0x89D32D8,
    },
    {
        (const u16 *)0x89BB2C8,
        (const u16 *)0x89D2498,
        (const u16 *)0x89D34A0,
    },
    {
        (const u16 *)0x89BBD68,
        (const u16 *)0x89D24B8,
        (const u16 *)0x89D36B0,
    },
    {
        (const u16 *)0x89BC884,
        (const u16 *)0x89D24D8,
        (const u16 *)0x89D38CC,
    },
    {
        (const u16 *)0x89BD3B4,
        (const u16 *)0x89D24F8,
        (const u16 *)0x89D3AD4,
    },
    {
        (const u16 *)0x89BDEE8,
        (const u16 *)0x89D2518,
        (const u16 *)0x89D3CF8,
    },
    {
        (const u16 *)0x89BEA90,
        (const u16 *)0x89D2538,
        (const u16 *)0x89D3F20,
    },
    {
        (const u16 *)0x89BF5FC,
        (const u16 *)0x89D2558,
        (const u16 *)0x89D4150,
    },
    {
        (const u16 *)0x89BFF64,
        (const u16 *)0x89D2578,
        (const u16 *)0x89D432C,
    },
    {
        (const u16 *)0x89C08C0,
        (const u16 *)0x89D2598,
        (const u16 *)0x89D4500,
    },
    {
        (const u16 *)0x89C1190,
        (const u16 *)0x89D25B8,
        (const u16 *)0x89D46C4,
    },
    {
        (const u16 *)0x89C1BA8,
        (const u16 *)0x89D25D8,
        (const u16 *)0x89D48AC,
    },
    {
        (const u16 *)0x89C247C,
        (const u16 *)0x89D25F8,
        (const u16 *)0x89D4A60,
    },
    {
        (const u16 *)0x89C2BF0,
        (const u16 *)0x89D2618,
        (const u16 *)0x89D4BFC,
    },
    {
        (const u16 *)0x89C32A4,
        (const u16 *)0x89D2638,
        (const u16 *)0x89D4D74,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A419C[] = {
    {
        (const u16 *)0x89C39A8,
        (const u16 *)0x89D2658,
        (const u16 *)0x89D4ECC,
    },
    {
        (const u16 *)0x89C3EE8,
        (const u16 *)0x89D2678,
        (const u16 *)0x89D4FDC,
    },
    {
        (const u16 *)0x89C447C,
        (const u16 *)0x89D2698,
        (const u16 *)0x89D5100,
    },
    {
        (const u16 *)0x89C4834,
        (const u16 *)0x89D26B8,
        (const u16 *)0x89D5214,
    },
    {
        (const u16 *)0x89C48E0,
        (const u16 *)0x89D26D8,
        (const u16 *)0x89D52D0,
    },
    {
        (const u16 *)0x89C495C,
        (const u16 *)0x89D26F8,
        (const u16 *)0x89D538C,
    },
    {
        (const u16 *)0x89C49CC,
        (const u16 *)0x89D2718,
        (const u16 *)0x89D5440,
    },
    {
        (const u16 *)0x89C4E38,
        (const u16 *)0x89D2738,
        (const u16 *)0x89D5540,
    },
    {
        (const u16 *)0x89C5328,
        (const u16 *)0x89D2758,
        (const u16 *)0x89D5658,
    },
    {
        (const u16 *)0x89C5674,
        (const u16 *)0x89D2778,
        (const u16 *)0x89D5764,
    },
    {
        (const u16 *)0x89C5734,
        (const u16 *)0x89D2798,
        (const u16 *)0x89D5820,
    },
    {
        (const u16 *)0x89C57D8,
        (const u16 *)0x89D27B8,
        (const u16 *)0x89D58E0,
    },
    {
        (const u16 *)0x89C5F70,
        (const u16 *)0x89D27D8,
        (const u16 *)0x89D5A20,
    },
    {
        (const u16 *)0x89C65EC,
        (const u16 *)0x89D27F8,
        (const u16 *)0x89D5B58,
    },
    {
        (const u16 *)0x89C6A58,
        (const u16 *)0x89D2818,
        (const u16 *)0x89D5C90,
    },
    {
        (const u16 *)0x89C6B20,
        (const u16 *)0x89D2838,
        (const u16 *)0x89D5D4C,
    },
    {
        (const u16 *)0x89C727C,
        (const u16 *)0x89D2858,
        (const u16 *)0x89D5E9C,
    },
    {
        (const u16 *)0x89C7A2C,
        (const u16 *)0x89D2878,
        (const u16 *)0x89D5FF0,
    },
    {
        (const u16 *)0x89C8440,
        (const u16 *)0x89D2898,
        (const u16 *)0x89D6170,
    },
    {
        (const u16 *)0x89C8DC4,
        (const u16 *)0x89D28B8,
        (const u16 *)0x89D62F8,
    },
    {
        (const u16 *)0x89C9A44,
        (const u16 *)0x89D28D8,
        (const u16 *)0x89D64EC,
    },
    {
        (const u16 *)0x89CA444,
        (const u16 *)0x89D28F8,
        (const u16 *)0x89D66D0,
    },
    {
        (const u16 *)0x89CAA10,
        (const u16 *)0x89D2918,
        (const u16 *)0x89D67F4,
    },
    {
        (const u16 *)0x89CB7B0,
        (const u16 *)0x89D2938,
        (const u16 *)0x89D6AA4,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A42BC[] = {
    {
        (const u16 *)0x89CCA28,
        (const u16 *)0x89D2958,
        (const u16 *)0x89D6E1C,
    },
    {
        (const u16 *)0x89CCE8C,
        (const u16 *)0x89D2978,
        (const u16 *)0x89D6F0C,
    },
    {
        (const u16 *)0x89CD650,
        (const u16 *)0x89D2998,
        (const u16 *)0x89D704C,
    },
    {
        (const u16 *)0x89CE038,
        (const u16 *)0x89D29B8,
        (const u16 *)0x89D71DC,
    },
    {
        (const u16 *)0x89CEB94,
        (const u16 *)0x89D29D8,
        (const u16 *)0x89D73B4,
    },
    {
        (const u16 *)0x89CF7C0,
        (const u16 *)0x89D29F8,
        (const u16 *)0x89D75BC,
    },
    {
        (const u16 *)0x89D038C,
        (const u16 *)0x89D2A18,
        (const u16 *)0x89D77CC,
    },
    {
        (const u16 *)0x89D0E08,
        (const u16 *)0x89D2A38,
        (const u16 *)0x89D79B4,
    },
    {
        (const u16 *)0x89D1648,
        (const u16 *)0x89D2A58,
        (const u16 *)0x89D7B78,
    },
    {
        (const u16 *)0x89D1CA4,
        (const u16 *)0x89D2A78,
        (const u16 *)0x89D7D04,
    },
    {
        (const u16 *)0x89D20E0,
        (const u16 *)0x89D2A98,
        (const u16 *)0x89D7E48,
    },
    {
        (const u16 *)0x89D230C,
        (const u16 *)0x89D2AB8,
        (const u16 *)0x89D7F48,
    },
};

CONST_DATA struct ProcCmd ProcScr_089A434C[] = {
    PROC_SLEEP(0x1),
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

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);

    SetBlendConfig(1, 0x10, 0x10, 0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(2, 0, 0);

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
            PlaySeSpacial(0x140, proc->xDisplay);
        }
        else if (proc->frame > 0x13)
        {
            proc->frame = 0;
            proc->timer = 0;
            proc->unk44 = 1;

            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;

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
        proc->unk44 = proc->unk44 ^ 1;
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
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 1;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        }
        else if (proc->frame > 0x16)
        {
            Proc_Break(proc);
        }

        proc->timer = gUnknown_0820588E[proc->frame];
        proc->frame++;
        proc->unk44 = proc->unk44 ^ 1;
    }

    proc->timer--;
}

void sub_807FBCC(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        proc->frame = 0;

        CpuFastFill(-1,
            (void*) VRAM + 0x20 * 0x2FF, 0x20);

        TileMap_FillRect(gBG0TilemapBuffer, 30, 20, TILEREF(0x2FF, 3));
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        gPaletteBuffer[0x3F] = 0;
        EnablePaletteSync();

        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 0;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;

        Proc_Break((struct Proc*) proc);
    }
    proc->timer--;
}

void sub_807FC58(struct MAEffectProc * proc)
{
    u16 brightness = proc->frame * 4;

    if (proc->frame < 8)
    {
        gPaletteBuffer[0x3F] = RGB(brightness, brightness, brightness);
    }
    else
    {
        gPaletteBuffer[0x3F] = RGB(31, 31, 31);
        Proc_Break((struct Proc*) proc);
    }

    EnablePaletteSync();
    proc->frame++;
}

void sub_807FCA8(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_089A4394[] = {
    PROC_SLEEP(0x1),
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

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendConfig(1, 0x10, 0x10, 0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(2, 0, 0);

    gPaletteBuffer[0x3F] = RGB(31, 31, 31);
    EnablePaletteSync();

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->unk48 = 119;
}

void sub_807FDC8(struct MAEffectProc * proc)
{
    int brightness = proc->unk48 * 32 / 120;
    gPaletteBuffer[0x3F] = RGB(brightness, brightness, brightness);

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
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 1;
            gLCDControlBuffer.dispcnt.bg3_on = 1;
            gLCDControlBuffer.dispcnt.obj_on = 1;
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
            unsigned r = (in[i])       & 0x1F;
            unsigned g = (in[i] >> 5)  & 0x1F;
            unsigned b = (in[i] >> 10) & 0x1F;

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

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendConfig(1, 0x10, 0x10, 0);

    BG_SetPosition(2, 0, 0);

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
        .img = (const u16 *)0x089D8010,
        .pal = (const u16 *)0x089DCD48,
        .tsa = (const u16 *)0x089DCE48,
    },
    {
        .img = (const u16 *)0x089D8198,
        .pal = (const u16 *)0x089DCD68,
        .tsa = (const u16 *)0x089DCF10,
    },
    {
        .img = (const u16 *)0x089D84A8,
        .pal = (const u16 *)0x089DCD88,
        .tsa = (const u16 *)0x089DCFFC,
    },
    {
        .img = (const u16 *)0x089D8910,
        .pal = (const u16 *)0x089DCDA8,
        .tsa = (const u16 *)0x089DD114,
    },
    {
        .img = (const u16 *)0x089D925C,
        .pal = (const u16 *)0x089DCDC8,
        .tsa = (const u16 *)0x089DD284,
    },
    {
        .img = (const u16 *)0x089DA40C,
        .pal = (const u16 *)0x089DCDE8,
        .tsa = (const u16 *)0x089DD4E8,
    },
    {
        .img = (const u16 *)0x089DB1A0,
        .pal = (const u16 *)0x089DCE08,
        .tsa = (const u16 *)0x089DD790,
    },
    {
        .img = (const u16 *)0x089DBFE0,
        .pal = (const u16 *)0x089DCE28,
        .tsa = (const u16 *)0x089DDA68,
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
            PlaySeSpacial(0x13F, proc->xDisplay); // TODO: song ids

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
    if (proc->frame < 0x82)
    {
        int bldY = (proc->frame << 4) / 0x82;
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
        .img = (const u8 *)0x089DDE8C,
        .pal = (const u16 *)0x089E4C7C,
        .tsa = (const u8 *)0x089E4FBC,
    },
    {
        .img = (const u8 *)0x089DDF10,
        .pal = (const u16 *)0x089E4C9C,
        .tsa = (const u8 *)0x089E5074,
    },
    {
        .img = (const u8 *)0x089DDF9C,
        .pal = (const u16 *)0x089E4CBC,
        .tsa = (const u8 *)0x089E5130,
    },
    {
        .img = (const u8 *)0x089DE030,
        .pal = (const u16 *)0x089E4CDC,
        .tsa = (const u8 *)0x089E51EC,
    },
    {
        .img = (const u8 *)0x089DE0BC,
        .pal = (const u16 *)0x089E4CFC,
        .tsa = (const u8 *)0x089E52AC,
    },
    {
        .img = (const u8 *)0x089DE14C,
        .pal = (const u16 *)0x089E4D1C,
        .tsa = (const u8 *)0x089E5364,
    },
    {
        .img = (const u8 *)0x089DE1CC,
        .pal = (const u16 *)0x089E4D3C,
        .tsa = (const u8 *)0x089E541C,
    },
    {
        .img = (const u8 *)0x089DEA30,
        .pal = (const u16 *)0x089E4D5C,
        .tsa = (const u8 *)0x089E5600,
    },
    {
        .img = (const u8 *)0x089DF470,
        .pal = (const u16 *)0x089E4D7C,
        .tsa = (const u8 *)0x089E5814,
    },
    {
        .img = (const u8 *)0x089DFF90,
        .pal = (const u16 *)0x089E4D9C,
        .tsa = (const u8 *)0x089E5A58,
    },
    {
        .img = (const u8 *)0x089E0AB8,
        .pal = (const u16 *)0x089E4DBC,
        .tsa = (const u8 *)0x089E5D08,
    },
    {
        .img = (const u8 *)0x089E1480,
        .pal = (const u16 *)0x089E4DDC,
        .tsa = (const u8 *)0x089E5FEC,
    },
    {
        .img = (const u8 *)0x089E2154,
        .pal = (const u16 *)0x089E4DFC,
        .tsa = (const u8 *)0x089E6290,
    },
    {
        .img = (const u8 *)0x089E2C1C,
        .pal = (const u16 *)0x089E4E1C,
        .tsa = (const u8 *)0x089E64D0,
    },
    {
        .img = (const u8 *)0x089E34A8,
        .pal = (const u16 *)0x089E4E3C,
        .tsa = (const u8 *)0x089E66A0,
    },
    {
        .img = (const u8 *)0x089E3B88,
        .pal = (const u16 *)0x089E4E5C,
        .tsa = (const u8 *)0x089E6808,
    },
    {
        .img = (const u8 *)0x089E4024,
        .pal = (const u16 *)0x089E4E7C,
        .tsa = (const u8 *)0x089E6924,
    },
    {
        .img = (const u8 *)0x089E4344,
        .pal = (const u16 *)0x089E4E9C,
        .tsa = (const u8 *)0x089E6A14,
    },
    {
        .img = (const u8 *)0x089E44B8,
        .pal = (const u16 *)0x089E4EBC,
        .tsa = (const u8 *)0x089E6AE4,
    },
    {
        .img = (const u8 *)0x089E45D0,
        .pal = (const u16 *)0x089E4EDC,
        .tsa = (const u8 *)0x089E6BB0,
    },
    {
        .img = (const u8 *)0x089E46E8,
        .pal = (const u16 *)0x089E4EFC,
        .tsa = (const u8 *)0x089E6C80,
    },
    {
        .img = (const u8 *)0x089E47CC,
        .pal = (const u16 *)0x089E4F1C,
        .tsa = (const u8 *)0x089E6D50,
    },
    {
        .img = (const u8 *)0x089E48C0,
        .pal = (const u16 *)0x089E4F3C,
        .tsa = (const u8 *)0x089E6E1C,
    },
    {
        .img = (const u8 *)0x089E49D8,
        .pal = (const u16 *)0x089E4F5C,
        .tsa = (const u8 *)0x089E6EE8,
    },
    {
        .img = (const u8 *)0x089E4AEC,
        .pal = (const u16 *)0x089E4F7C,
        .tsa = (const u8 *)0x089E6FB4,
    },
    {
        .img = (const u8 *)0x089E4BC8,
        .pal = (const u16 *)0x089E4F9C,
        .tsa = (const u8 *)0x089E7080,
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
            PlaySeSpacial(0x141, proc->xDisplay);
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

        if (proc->unk_46 > 0x15)
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

extern u8 gUnknown_089E714C[];
extern u16 gUnknown_089E7DEC[];

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
    (u8 *)0x089E7E0C,
    (u8 *)0x089E7E2C,
    (u8 *)0x089E7E50,
    (u8 *)0x089E7E78,
    (u8 *)0x089E7EA0,
    (u8 *)0x089E7ECC,
    (u8 *)0x089E7EFC,
    (u8 *)0x089E7F2C,
    (u8 *)0x089E7F5C,
    (u8 *)0x089E7F8C,
    (u8 *)0x089E7FBC,
    (u8 *)0x089E7FFC,
    (u8 *)0x089E8040,
    (u8 *)0x089E8090,
    (u8 *)0x089E80EC,
    (u8 *)0x089E8148,
    (u8 *)0x089E81A4,
    (u8 *)0x089E8200,
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
            PlaySeSpacial(0x3BF, proc->xDisplay);
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
            PlaySeSpacial(0x3BF, proc->xDisplay);
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
            PlaySeSpacial(0x3BF, proc->xDisplay);
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
