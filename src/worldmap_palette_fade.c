#include "global.h"

#include "hardware.h"

#include "worldmap.h"

struct GmapPalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 38 */ u16 * unk_38;
    /* 3C */ u16 * unk_3c;
    /* 40 */ u16 * unk_40;
};

struct GmPalFadeInput
{
    /* 00 */ u16 * unk_00;
    /* 04 */ u16 * unk_04;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0C */ int unk_0c;
};

extern u16 gUnknown_08A95FE4[];
extern u16 gUnknown_08A95F64[];

//! FE8U = 0x080BF5C0
void GmPalFade_OnEnd_Null(void)
{
    return;
}

//! FE8U = 0x080BF5C4
void GmPalFade_Init(struct GmapPalFadeProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_40 = gPaletteBuffer + proc->unk_35;
    return;
}

//! FE8U = 0x080BF5DC
void GmPalFade_Loop(struct GmapPalFadeProc * proc)
{
    int i;

    proc->unk_30++;

    if (proc->unk_30 < proc->unk_2c)
    {
        int scale = proc->unk_30 * 0x40 / proc->unk_2c;
        u16 red, green, blue;
        s32 v38, v3c;

        for (i = 0; i < proc->unk_34; i++)
        {
            v38 = RED_VALUE(proc->unk_38[i]);
            v3c = RED_VALUE(proc->unk_3c[i]);
            red = v38 + ((v3c - v38) * scale / 0x40);
            v38 = GREEN_VALUE(proc->unk_38[i]);
            v3c = GREEN_VALUE(proc->unk_3c[i]);
            green = v38 + ((v3c - v38) * scale / 0x40);
            v38 = BLUE_VALUE(proc->unk_38[i]);
            v3c = BLUE_VALUE(proc->unk_3c[i]);
            blue = v38 + ((v3c - v38) * scale / 0x40);

            proc->unk_40[i] = (blue << 10) + (green << 5) + red;
        }
    }
    else
    {
        CpuCopy16(proc->unk_3c, proc->unk_40, proc->unk_34 * 2);
        Proc_Break(proc);
    }

    EnablePaletteSync();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapPalFade[] =
{
    PROC_NAME("Gmap Pal Fade"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmPalFade_OnEnd_Null),
    PROC_YIELD,

    PROC_CALL(GmPalFade_Init),
    PROC_REPEAT(GmPalFade_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BF6C0
ProcPtr StartGmPalFade(ProcPtr parent, struct GmPalFadeInput * input)
{
    if (input->unk_0c >= 1)
    {
        struct GmapPalFadeProc * proc;
        if (parent)
        {
            proc = Proc_StartBlocking(gProcScr_GmapPalFade, parent);
        }
        else
        {
            proc = Proc_Start(gProcScr_GmapPalFade, PROC_TREE_3);
        }

        proc->unk_2c = input->unk_0c;
        proc->unk_34 = input->unk_08;
        proc->unk_35 = input->unk_09;
        proc->unk_38 = input->unk_00;
        proc->unk_3c = input->unk_04;

        return proc;
    }

    CpuCopy16(input->unk_04, gPaletteBuffer + input->unk_09, input->unk_08 * 2);
    EnablePaletteSync();

    return NULL;
}

//! FE8U = 0x080BF730
s8 IsGmPalFadeActive(void)
{
    return (Proc_Find(gProcScr_GmapPalFade)) ? 1 : 0;
}

//! FE8U = 0x080BF748
void EndGmPalFade(void)
{
    struct GmapPalFadeProc * proc = Proc_Find(gProcScr_GmapPalFade);
    if (proc)
    {
        CpuCopy16(proc->unk_3c, gPaletteBuffer + proc->unk_35, proc->unk_34 * 2);

        EnablePaletteSync();

        Proc_EndEach(gProcScr_GmapPalFade);
    }

    return;
}

//! FE8U = 0x080BF788
ProcPtr StartGmPalFade_(ProcPtr parent, int unk)
{
    struct GmPalFadeInput input;

    input.unk_00 = gUnknown_08A95FE4;
    input.unk_04 = gUnknown_08A95F64;
    input.unk_09 = 144;
    input.unk_08 = 64;
    input.unk_0c = unk;

    return StartGmPalFade(parent, &input);
}
