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

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(2, 0, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;
    proc->unk44 = 0;
}

void sub_807F964(struct MAEffectProc * proc)
{
    if (proc->unk42 == 0)
    {
        if (proc->unk40 == 0)
        {
            PlaySeSpacial(0x140, proc->xDisplay);
        }
        else if (proc->unk40 > 0x13)
        {
            proc->unk40 = 0;
            proc->unk42 = 0;
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
            MapAnimfxConf_089A40AC[proc->unk40].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44] * 0x20);

        Decompress(
            MapAnimfxConf_089A40AC[proc->unk40].tsa,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_089A40AC[proc->unk40].pal, gUnknown_0820588C[proc->unk44]);
        EnablePaletteSync();

        proc->unk40++;
        proc->unk42 = 3;
        proc->unk44 = proc->unk44 ^ 1;
    }

    proc->unk42--;
}

void sub_807FAA0(struct MAEffectProc * proc)
{
    if (proc->unk42 == 0)
    {
        Decompress(
            MapAnimfxConf_089A419C[proc->unk40].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_089A419C[proc->unk40].tsa,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_089A419C[proc->unk40].pal, gUnknown_0820588C[proc->unk44]);
        EnablePaletteSync();

        if (proc->unk40 == 0)
        {
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 1;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        }
        else if (proc->unk40 > 0x16)
        {
            Proc_Break(proc);
        }

        proc->unk42 = gUnknown_0820588E[proc->unk40];
        proc->unk40++;
        proc->unk44 = proc->unk44 ^ 1;
    }

    proc->unk42--;
}

void sub_807FBCC(struct MAEffectProc * proc)
{
    if (proc->unk42 == 0)
    {
        proc->unk40 = 0;

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
    proc->unk42--;
}

void sub_807FC58(struct MAEffectProc * proc)
{
    u16 brightness = proc->unk40 * 4;

    if (proc->unk40 < 8)
    {
        gPaletteBuffer[0x3F] = RGB(brightness, brightness, brightness);
    }
    else
    {
        gPaletteBuffer[0x3F] = RGB(31, 31, 31);
        Proc_Break((struct Proc*) proc);
    }

    EnablePaletteSync();
    proc->unk40++;
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
    PROC_CALL(MapLatonafx_End),
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

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(2, 0, 0);

    gPaletteBuffer[0x3F] = RGB(31, 31, 31);
    EnablePaletteSync();

    proc->unk40 = 0;
    proc->unk42 = 0;
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
    if (proc->unk42 == 0)
    {
        if (proc->unk40 != 0)
        {
            if (proc->unk40 > 11)
            {
                proc->unk40 = proc->unk42;
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
            MapAnimfxConf_089A42BC[proc->unk40].img,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_089A42BC[proc->unk40].tsa,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        if (proc->unk48 < 0)
        {
            ApplyPalette(MapAnimfxConf_089A42BC[proc->unk40].pal, gUnknown_0820588C[proc->unk44]);
            EnablePaletteSync();
        }

        proc->unk4A = proc->unk40;
        proc->unk40++;

        proc->unk42 = 4;

        proc->unk4C = proc->unk44;
        proc->unk44 ^= 1;
    }

    proc->unk42--;

    if (proc->unk48 >= 0)
    {
        int i, addedBrightness = proc->unk48 * 32 / 240;

        const u16 * const in  = MapAnimfxConf_089A42BC[proc->unk4A].pal;
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

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    BG_SetPosition(2, 0, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;
    proc->unk44 = 0;

    gUnknown_03001C7C = 0;

    vsync = Proc_Start(ProcScr_089A448C, PROC_TREE_VSYNC);

    vsync->unk29 = 0;
    vsync->unk2A = 0;

    SetSecondaryHBlankHandler(sub_8080408);
}

/* https://decomp.me/scratch/tuNxe */
#if NONMATCHING
void sub_8080138(struct MAEffectProc* proc)
{
    if (proc->unk42 == 0)
    {
        struct Proc8080050* vsync;

        int v0 = gUnknown_082058B4[proc->unk40].unk00;
        register int v1 asm("r8");

        Decompress(
            gUnknown_089A43D4[v0].img,
            (void*) VRAM + gUnknown_082058A8[proc->unk44] * 0x20);

        Decompress(
            gUnknown_089A43D4[v0].tsa,
            gUnknown_02020188);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16*) gUnknown_02020188,
            0, 0,
            gUnknown_082058A8[proc->unk44] | (gUnknown_082058B0[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(
            gUnknown_089A43D8[v0].img,
            gUnknown_082058B0[proc->unk44]);

        EnablePaletteSync();

        vsync = (void*) Proc_Find(gUnknown_089A448C);

        v1 = vsync->unk29 = 1;
        vsync->unk2A = gUnknown_082058B4[proc->unk40].unk02;

        if (proc->unk40 == 0)
            PlaySeSpacial(0x13F, proc->xDisplay); // TODO: song ids

        proc->unk42 = gUnknown_082058B4[proc->unk40].unk01;

        if (proc->unk40 > 6)
        {
            vsync->unk29 = v1;
            vsync->unk2A = 0;

            proc->unk40 = 0;

            Proc_Break(proc);
        }
        else
        {
            proc->unk40++;
            proc->unk44 = proc->unk44 ^ 1;
        }
    }

    proc->unk42--;
}
#else

NAKEDFUNC
void sub_8080138(struct MAEffectProc* proc)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #0xc\n\
    mov r9, r0\n\
    adds r0, #0x42\n\
    str r0, [sp, #4]\n\
    ldrh r1, [r0]\n\
    str r1, [sp, #8]\n\
    cmp r1, #0\n\
    beq _08080154\n\
    b _0808026C\n\
_08080154:\n\
    mov r7, r9\n\
    adds r7, #0x40\n\
    ldrh r0, [r7]\n\
    lsls r0, r0, #2\n\
    ldr r2, _0808023C  @ gUnknown_082058B4\n\
    adds r0, r0, r2\n\
    ldrb r0, [r0]\n\
    ldr r1, _08080240  @ gUnknown_089A43D4\n\
    mov sl, r1\n\
    lsls r4, r0, #1\n\
    adds r4, r4, r0\n\
    lsls r4, r4, #2\n\
    adds r0, r4, r1\n\
    ldr r0, [r0]\n\
    ldr r2, _08080244  @ gUnknown_082058A8\n\
    mov r8, r2\n\
    mov r5, r9\n\
    adds r5, #0x44\n\
    ldrh r1, [r5]\n\
    lsls r1, r1, #2\n\
    add r1, r8\n\
    ldr r1, [r1]\n\
    lsls r1, r1, #5\n\
    movs r2, #0xc0\n\
    lsls r2, r2, #0x13\n\
    adds r1, r1, r2\n\
    bl Decompress\n\
    mov r0, sl\n\
    adds r0, #8\n\
    adds r0, r4, r0\n\
    ldr r0, [r0]\n\
    ldr r6, _08080248  @ gGenericBuffer\n\
    adds r1, r6, #0\n\
    bl Decompress\n\
    ldr r0, _0808024C  @ gBG2TilemapBuffer\n\
    ldrh r3, [r5]\n\
    lsls r1, r3, #2\n\
    add r1, r8\n\
    ldr r2, [r1]\n\
    ldr r1, _08080250  @ gUnknown_082058B0\n\
    mov r8, r1\n\
    add r3, r8\n\
    ldrb r1, [r3]\n\
    lsls r1, r1, #0xc\n\
    orrs r2, r1\n\
    lsls r2, r2, #0x10\n\
    lsrs r2, r2, #0x10\n\
    str r2, [sp]\n\
    adds r1, r6, #0\n\
    movs r2, #0\n\
    movs r3, #0\n\
    bl sub_800159C\n\
    movs r0, #4\n\
    bl BG_EnableSyncByMask\n\
    ldr r2, _08080254  @ gUnknown_089A43D8\n\
    adds r4, r4, r2\n\
    ldr r0, [r4]\n\
    ldrh r1, [r5]\n\
    add r1, r8\n\
    ldrb r1, [r1]\n\
    lsls r1, r1, #5\n\
    movs r2, #0x20\n\
    bl CopyToPaletteBuffer\n\
    bl EnablePaletteSync\n\
    ldr r0, _08080258  @ ProcScr_089A448C\n\
    bl Proc_Find\n\
    adds r6, r0, #0\n\
    adds r6, #0x29\n\
    movs r1, #1\n\
    mov r8, r1\n\
    mov r2, r8\n\
    strb r2, [r6]\n\
    ldrh r1, [r7]\n\
    lsls r1, r1, #2\n\
    ldr r2, _0808023C  @ gUnknown_082058B4\n\
    adds r1, r1, r2\n\
    ldrb r1, [r1, #2]\n\
    adds r4, r0, #0\n\
    adds r4, #0x2a\n\
    strb r1, [r4]\n\
    ldrh r0, [r7]\n\
    cmp r0, #0\n\
    bne _08080212\n\
    ldr r0, _0808025C  @ 0x0000013F\n\
    mov r2, r9\n\
    ldr r1, [r2, #0x30]\n\
    bl PlaySeSpacial\n\
_08080212:\n\
    ldrh r0, [r7]\n\
    lsls r0, r0, #2\n\
    ldr r1, _0808023C  @ gUnknown_082058B4\n\
    adds r0, r0, r1\n\
    ldrb r0, [r0, #1]\n\
    ldr r2, [sp, #4]\n\
    strh r0, [r2]\n\
    ldrh r0, [r7]\n\
    cmp r0, #6\n\
    bls _08080260\n\
    mov r0, r8\n\
    strb r0, [r6]\n\
    movs r0, #0\n\
    strb r0, [r4]\n\
    mov r1, sp\n\
    ldrh r1, [r1, #8]\n\
    strh r1, [r7]\n\
    mov r0, r9\n\
    bl Proc_Break\n\
    b _0808026C\n\
    .align 2, 0\n\
_0808023C: .4byte gUnknown_082058B4\n\
_08080240: .4byte gUnknown_089A43D4\n\
_08080244: .4byte gUnknown_082058A8\n\
_08080248: .4byte gGenericBuffer\n\
_0808024C: .4byte gBG2TilemapBuffer\n\
_08080250: .4byte gUnknown_082058B0\n\
_08080254: .4byte gUnknown_089A43D8\n\
_08080258: .4byte ProcScr_089A448C\n\
_0808025C: .4byte 0x0000013F\n\
_08080260:\n\
    adds r0, #1\n\
    strh r0, [r7]\n\
    ldrh r0, [r5]\n\
    movs r1, #1\n\
    eors r0, r1\n\
    strh r0, [r5]\n\
_0808026C:\n\
    mov r1, r9\n\
    adds r1, #0x42\n\
    ldrh r0, [r1]\n\
    subs r0, #1\n\
    strh r0, [r1]\n\
    add sp, #0xc\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}

#endif
