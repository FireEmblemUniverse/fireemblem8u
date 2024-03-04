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
