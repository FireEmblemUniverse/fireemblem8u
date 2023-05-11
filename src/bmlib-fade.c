#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "bmlib.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "bmlib.h"

struct ProcSpacialSeTest {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

void SpacialSeTest_OnInit(struct ProcSpacialSeTest *proc)
{
    proc->unk64 = 0;
    proc->unk66 = 90;
}

void SpacialSeTest_OnLoop(struct ProcSpacialSeTest * proc)
{
    int location = 0;

    if (gKeyStatusPtr->newKeys & A_BUTTON)
        proc->unk66++;

    if (((proc->unk64++) & 0x0F) == 0)
    {
        if (gKeyStatusPtr->heldKeys & DPAD_LEFT)
            location = -proc->unk66;

        if (gKeyStatusPtr->heldKeys & DPAD_RIGHT)
            location = +proc->unk66;

        PlaySeSpacial(0x9A, location);
    }
}

struct ProcCmd CONST_DATA ProcScr_SpacialSeTest[] = {
    PROC_CALL(LockGame),

    PROC_CALL(SpacialSeTest_OnInit),
    PROC_REPEAT(SpacialSeTest_OnLoop),
};

void StartSpacialSeTest(void)
{
    Proc_Start(ProcScr_SpacialSeTest, PROC_TREE_3);
}

void sub_80138EC(void)
{
    return;
}

void StartPalFadeToBlack(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllBlack, palid, duration, parent);
}

void StartPalFadeToWhite(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllWhite, palid, duration, parent);
}

struct PalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct PalFadeSt * st;
};

void PalFade_OnLoop(struct PalFadeProc *proc);

struct ProcCmd CONST_DATA ProcScr_PalFade[] =
{
    PROC_MARK(0xA),
    PROC_REPEAT(PalFade_OnLoop),

    PROC_END,
};

struct PalFadeSt *StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent)
{
    struct PalFadeSt * st = sPalFadeSt + pal;
    struct PalFadeProc * proc = Proc_Start(ProcScr_PalFade, parent);

    CpuCopy16(gPaletteBuffer + pal * 0x10, st->from_colors, sizeof(st->from_colors));

    st->pal = gPaletteBuffer + pal * 0x10;
    st->to_colors = colors;
    st->clock = 0;
    st->clock_end = duration;
    st->clock_stop = duration + 1;

    proc->st = st;
    return st;
}

void EndPalFade(void)
{
    Proc_EndEach(ProcScr_PalFade);
}

void SetPalFadeStop(struct PalFadeSt * st, int val)
{
    st->clock_stop = val;
}

void PalFade_OnLoop(struct PalFadeProc * proc)
{
    int i;

    u16 const * from_colors = proc->st->from_colors;
    u16 const * to_colors = proc->st->to_colors;

    u16 * pal = proc->st->pal;

    if (proc->st->clock == proc->st->clock_stop || proc->st->clock > proc->st->clock_end)
    {
        Proc_End(proc);
        return;
    }

    for (i = 0; i < 0x10; ++i)
    {
        int red_a   = from_colors[i] & 0x001F;
        int green_a = from_colors[i] & 0x03E0;
        int blue_a  = from_colors[i] & 0x7C00;

        int red_b   = to_colors[i] & 0x001F;
        int green_b = to_colors[i] & 0x03E0;
        int blue_b  = to_colors[i] & 0x7C00;

        int red   = Interpolate(INTERPOLATE_LINEAR, red_a,   red_b,   proc->st->clock, proc->st->clock_end);
        int green = Interpolate(INTERPOLATE_LINEAR, green_a, green_b, proc->st->clock, proc->st->clock_end);
        int blue  = Interpolate(INTERPOLATE_LINEAR, blue_a,  blue_b,  proc->st->clock, proc->st->clock_end);

        pal[i] = (blue & 0x7C00) | (green & 0x03E0) | (red & 0x001F);
    }

    EnablePaletteSync();
    proc->st->clock++;
}

void SetBlackPal(int palid)
{
    CpuCopy16(Pal_AllBlack, gPaletteBuffer + palid * 0x10, 0x20);
}

void SetWhitePal(int palid)
{
    CpuCopy16(Pal_AllWhite, gPaletteBuffer + palid * 0x10, 0x20);
}

void SetAllBlackPals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}

void SetAllWhitePals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}
