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

static struct Unk03005090 gUnknown_03005090[0x10];
static u16 gUnknown_03005110[0xA0];

void sub_807F568(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(gUnknown_089A4034, proc);
    else
        Proc_Start(gUnknown_089A4034, PROC_TREE_3);
}

void sub_807F58C(ProcPtr proc)
{
    int i;

    CpuFastCopy(PAL_BG(0x6), gUnknown_03005110, 0x140);

    for (i = 0; i < 10; i++)
        SetPalFadeStop(StartPalFade(Pal_AllBlack, i + 6, 0x3C, proc), 15);
}

void sub_807F5C8(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(gUnknown_089A404C, proc);
    else
        Proc_Start(gUnknown_089A404C, PROC_TREE_3);
}

void sub_807F5EC(ProcPtr proc)
{
    int i;
    for (i = 0; i < 10; i++)
        StartPalFade(gUnknown_03005110 + 0x10 * i, i + 6, 15, proc);
}

void NewBG0Shaker(void)
{
    Proc_Start(gUnknown_089A4064, PROC_TREE_3);
}

void BG0Shaker_Init(struct MAFrameShakeProc * proc)
{
    proc->timer = 0;
}

void BG0Shaker_Loop(struct MAFrameShakeProc * proc)
{
    BG_SetPosition(0,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    BG_SetPosition(1,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    if (proc->timer++ > 15)
    {
        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);

        Proc_Break(proc);
    }
}

void LoadSparkGfx(void)
{
    Decompress(
        Img_089AE7A4,
        OBJ_VRAM0 + BM_OBJCHR_BANIM_EFFECT2 * 0x20);

    ApplyPalette(Pal_089AE7C4, 0x10 + BM_OBJPAL_BANIM_EFFECT2);
}

void PutSparkGfx(int x, int y)
{
    if (x < -4)
        return;

    if (x > 235)
        return;

    if (y < -4)
        return;

    if (y > 155)
        return;

    CallARM_PushToSecondaryOAM(
        (x - 4) & 0x1FF,
        (y - 4) & 0xFF,
        gObject_8x8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2));
}

void sub_807F724(int xCenter, int yCenter, int distance, int angle)
{
    PutSparkGfx(
        xCenter + ((SIN(angle) * distance) >> 12),
        yCenter + ((COS(angle) * distance) >> 12));
}

void sub_807F758(struct MAStarProc * proc)
{
    int i;

    LoadSparkGfx();

    for (i = 0; i < 16; ++i)
    {
        gUnknown_03005090[i].unk00 = 0x10;
        gUnknown_03005090[i].unk02 = i << 8;
    }

    proc->unk36 = 0;
    proc->unk38 = 0;
    proc->unk3A = proc->unk3C;
}

void sub_807F788(struct MAStarProc * proc)
{
    int i, unk = Interpolate(5, proc->unk2E, proc->unk30, proc->unk3A, proc->unk3E) * 16;

    proc->unk36 = unk;
    proc->unk38 = unk >> 1;

    for (i = 0; i < 16; ++i)
    {
        sub_807F724(
            proc->xCenter, proc->yCenter,
            (proc->unk36 + gUnknown_03005090[i].unk00) >> 4,
            (proc->unk38 + gUnknown_03005090[i].unk02) >> 4);
    }

    proc->unk3A++;

    if (proc->unk3A > proc->unk40)
        Proc_Break(proc);
}

void StartStarRotationEffect(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
    struct MAStarProc * proc =
        Proc_Start(gUnknown_089A407C, PROC_TREE_3);

    proc->xCenter = arg0;
    proc->yCenter = arg1;
    proc->unk2E = arg2;
    proc->unk30 = arg3;
    proc->unk3C = arg4;
    proc->unk3E = arg5;
    proc->unk40 = arg6;
}

void StartStarExplosionEffect(int x, int y)
{
    StartStarRotationEffect(x, y, 1, 0xC8, 0, 0x50, 0x28);
}

void StartStarImplosionEffect(int x, int y)
{
    StartStarRotationEffect(x, y, 0xC8, 1, 0, 0x3C, 0x37);
}

void sub_807F878(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(gUnknown_089A434C, proc);
    else
        Proc_Start(gUnknown_089A434C, PROC_TREE_3);
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
            gUnknown_089A40AC[proc->unk40].unk00,
            (void*) VRAM + gUnknown_08205884[proc->unk44] * 0x20);

        Decompress(
            gUnknown_089A40AC[proc->unk40].unk08,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(gUnknown_089A40AC[proc->unk40].unk04, gUnknown_0820588C[proc->unk44]);
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
            gUnknown_089A419C[proc->unk40].unk00,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            gUnknown_089A419C[proc->unk40].unk08,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(gUnknown_089A419C[proc->unk40].unk04, gUnknown_0820588C[proc->unk44]);
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

void sub_807FCC0(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(gUnknown_089A4394, proc);
    else
        Proc_Start(gUnknown_089A4394, PROC_TREE_3);
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
            gUnknown_089A42BC[proc->unk40].unk00,
            (void*) VRAM + gUnknown_08205884[proc->unk44]*0x20);

        Decompress(
            gUnknown_089A42BC[proc->unk40].unk08,
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gUnknown_08205884[proc->unk44] | (gUnknown_0820588C[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        if (proc->unk48 < 0)
        {
            ApplyPalette(gUnknown_089A42BC[proc->unk40].unk04, gUnknown_0820588C[proc->unk44]);
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

        const u16 * const in  = gUnknown_089A42BC[proc->unk4A].unk04;
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
        Proc_StartBlocking(gUnknown_089A4434, proc);
    else
        Proc_Start(gUnknown_089A4434, PROC_TREE_3);
}

void sub_8080038(void)
{
    SetSecondaryHBlankHandler(NULL);
    Proc_EndEach(gUnknown_089A448C);
}
