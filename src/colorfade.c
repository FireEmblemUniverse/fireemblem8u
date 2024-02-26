#include "global.h"

#include "hardware.h"
#include "colorfade.h"

extern u16 gUnknown_02014EF4[];

//! FE8U = 0x080B24DC
void ColFadeOut_Init(struct ColFadeProc * proc)
{
    int i;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        gUnknown_02014EF4[i] = gPaletteBuffer[i];
    }

    return;
}

//! FE8U = 0x080B2518
void ColFadeIn_Init_Null(void)
{
    return;
}

//! FE8U = 0x080B251C
void ColFadeOut_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        int r, r1, r2;
        int g, g1, g2;
        int b, b1, b2;

        b1 = (gUnknown_02014EF4[i] & BLUE_MASK);
        b2 = (proc->color & BLUE_MASK);
        b2 = b1 - b2;
        b = ((b2 * val / 0x100) + proc->color) & BLUE_MASK;

        g1 = (gUnknown_02014EF4[i] & GREEN_MASK);
        g2 = (proc->color & GREEN_MASK);
        g2 = (g1 - g2);
        g = ((g2 * val / 0x100) + proc->color) & GREEN_MASK;

        r1 = (gUnknown_02014EF4[i] & RED_MASK);
        r2 = (proc->color & RED_MASK);
        r2 = r1 - r2;
        r = ((r2 * val / 0x100) + proc->color) & RED_MASK;

        gPaletteBuffer[i] = b | g | r;
    }

    EnablePaletteSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B2608
void ColFadeIn_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    if (val != 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            int r, r1, r2;
            int g, g1, g2;
            int b, b1, b2;

            b1 = (proc->color & BLUE_MASK);
            b2 = (gUnknown_02014EF4[i] & BLUE_MASK);
            b2 = b1 - b2;
            b = ((b2 * val / 0x100) + gUnknown_02014EF4[i]) & BLUE_MASK;

            g1 = (proc->color & GREEN_MASK);
            g2 = (gUnknown_02014EF4[i] & GREEN_MASK);
            g2 = (g1 - g2);
            g = ((g2 * val / 0x100) + gUnknown_02014EF4[i]) & GREEN_MASK;

            r1 = (proc->color & RED_MASK);
            r2 = (gUnknown_02014EF4[i] & RED_MASK);
            r2 = r1 - r2;
            r = ((r2 * val / 0x100) + gUnknown_02014EF4[i]) & RED_MASK;

            gPaletteBuffer[i] = b | g | r;
        }
    }

    EnablePaletteSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
        }

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ColFadeOut[] =
{
    PROC_NAME("ColFadeOut"),
    PROC_SLEEP(2),

    PROC_CALL(ColFadeOut_Init),
    PROC_YIELD,

    PROC_REPEAT(ColFadeOut_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B272C
void NewColFadeOut(int speed, int kind, int color, ProcPtr parent)
{
    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeOut, parent);

    proc->speed = speed;
    proc->color = color;
    proc->current = 0;

    switch (kind)
    {
        case 0:
            proc->start = 0x80;
            proc->amount = 0x80;

            break;

        case 1:
            proc->start = 0;
            proc->amount = 0x200;

            break;

        case 2:
            proc->start = 0;
            proc->amount = 0x400;

            break;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ColFadeIn[] =
{
    PROC_NAME("ColFadeIn"),
    PROC_SLEEP(2),

    PROC_CALL(ColFadeIn_Init_Null),
    PROC_YIELD,

    PROC_REPEAT(ColFadeIn_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B2780
void NewColFadeIn(int speed, int kind, int color, ProcPtr parent)
{
    int i;

    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeIn, parent);

    proc->speed = speed;
    proc->color = color;

    proc->current = 0;

    switch (kind)
    {
        case 0:
            proc->start = 0x80;
            proc->amount = 0x80;

            break;

        case 1:
            proc->start = 0;
            proc->amount = 0x200;

            break;

        case 2:
            proc->start = 0;
            proc->amount = 0x400;

            break;
    }

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        gUnknown_02014EF4[i] = gPaletteBuffer[i];
        gPaletteBuffer[i] = 0;
    }

    return;
}
