#include "global.h"

#include "hardware.h"

extern u16 gUnknown_02014EF4[];

struct ColFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4E);

    /* 4E */ u16 unk_4e;

    /* 50 */ STRUCT_PAD(0x50, 0x58);

    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
    /* 60 */ int unk_60;
    /* 64 */ u16 unk_64;
};

//! FE8U = 0x080B24DC
void sub_80B24DC(struct ColFadeProc * proc)
{
    int i;

    for (i = proc->unk_5c; i < proc->unk_5c + proc->unk_60; i++)
    {
        gUnknown_02014EF4[i] = gPaletteBuffer[i];
    }

    return;
}

//! FE8U = 0x080B2518
void nullsub_67(void)
{
    return;
}

//! FE8U = 0x080B251C
void sub_80B251C(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->unk_4e;

    for (i = proc->unk_5c; i < proc->unk_5c + proc->unk_60; i++)
    {
        int r, r1, r2;
        int g, g1, g2;
        int b, b1, b2;

        b1 = (gUnknown_02014EF4[i] & 0x7c00);
        b2 = (proc->unk_58 & 0x7c00);
        b2 = b1 - b2;
        b = ((b2 * val / 0x100) + proc->unk_58) & 0x7c00;

        g1 = (gUnknown_02014EF4[i] & 0x3e0);
        g2 = (proc->unk_58 & 0x3e0);
        g2 = (g1 - g2);
        g = ((g2 * val / 0x100) + proc->unk_58) & 0x3e0;

        r1 = (gUnknown_02014EF4[i] & 0x1f);
        r2 = (proc->unk_58 & 0x1f);
        r2 = r1 - r2;
        r = ((r2 * val / 0x100) + proc->unk_58) & 0x1f;

        gPaletteBuffer[i] = b | g | r;
    }

    EnablePaletteSync();

    proc->unk_4e += proc->unk_64;

    if (val == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B2608
void sub_80B2608(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->unk_4e;

    if (val != 0)
    {
        for (i = proc->unk_5c; i < proc->unk_5c + proc->unk_60; i++)
        {
            int r, r1, r2;
            int g, g1, g2;
            int b, b1, b2;

            b1 = (proc->unk_58 & 0x7c00);
            b2 = (gUnknown_02014EF4[i] & 0x7c00);
            b2 = b1 - b2;
            b = ((b2 * val / 0x100) + gUnknown_02014EF4[i]) & 0x7c00;

            g1 = (proc->unk_58 & 0x3e0);
            g2 = (gUnknown_02014EF4[i] & 0x3e0);
            g2 = (g1 - g2);
            g = ((g2 * val / 0x100) + gUnknown_02014EF4[i]) & 0x3e0;

            r1 = (proc->unk_58 & 0x1f);
            r2 = (gUnknown_02014EF4[i] & 0x1f);
            r2 = r1 - r2;
            r = ((r2 * val / 0x100) + gUnknown_02014EF4[i]) & 0x1f;

            gPaletteBuffer[i] = b | g | r;
        }
    }

    EnablePaletteSync();

    proc->unk_4e += proc->unk_64;

    if (val == 0)
    {
        for (i = proc->unk_5c; i < proc->unk_5c + proc->unk_60; i++)
        {
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
            gPaletteBuffer[i] = gUnknown_02014EF4[i];
        }

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_ColFadeOut[];

//! FE8U = 0x080B272C
void NewColFadeOut(int speed, int kind, int color, ProcPtr parent)
{
    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeOut, parent);

    proc->unk_64 = speed;
    proc->unk_58 = color;
    proc->unk_4e = 0;

    switch (kind)
    {
        case 0:
            proc->unk_5c = 0x80;
            proc->unk_60 = 0x80;

            break;

        case 1:
            proc->unk_5c = 0;
            proc->unk_60 = 0x200;

            break;

        case 2:
            proc->unk_5c = 0;
            proc->unk_60 = 0x400;

            break;
    }

    return;
}

extern struct ProcCmd ProcScr_ColFadeIn[];

//! FE8U = 0x080B2780
void NewColFadeIn(int speed, int kind, int color, ProcPtr parent)
{
    int i;

    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeIn, parent);

    proc->unk_64 = speed;
    proc->unk_58 = color;

    proc->unk_4e = 0;

    switch (kind)
    {
        case 0:
            proc->unk_5c = 0x80;
            proc->unk_60 = 0x80;

            break;

        case 1:
            proc->unk_5c = 0;
            proc->unk_60 = 0x200;

            break;

        case 2:
            proc->unk_5c = 0;
            proc->unk_60 = 0x400;

            break;
    }

    for (i = proc->unk_5c; i < proc->unk_5c + proc->unk_60; i++)
    {
        gUnknown_02014EF4[i] = gPaletteBuffer[i];
        gPaletteBuffer[i] = 0;
    }

    return;
}