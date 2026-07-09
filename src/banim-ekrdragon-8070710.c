#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

struct ProcEkrDragonPalFade {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ u16 * unk34;
    /* 38 */ const u16 * unk38;
    /* 3C */ u8 unk3C;
    /* 3D */ u8 unk3D;
};

void EkrDragon_BlendPalette(u16 * a, u16 * paldst, u16 c, u8 d, u8 e)
{
    int i;

    u16 t1 = (RED_VALUE(c) * d);
    u16 t2 = (GREEN_VALUE(c) * d);
    u16 t3 = (BLUE_VALUE(c) * d);

    for (i = 0; i < 0x10; a++, paldst++, i++)
    {
        u16 r = (RED_VALUE(*a) * e);
        u16 g = (GREEN_VALUE(*a) * e);
        u16 b = (BLUE_VALUE(*a) * e);

        r += t1;
        r /= 16;

        g += t2;
        g /= 16;

        b += t3;
        b /= 16;

        if (r > 31)
        {
            r = 31;
        }

        if (g > 31)
        {
            g = 31;
        }

        if (b > 31)
        {
            b = 31;
        }

        *paldst = RGB(r, g, b);
    }

    return;
}

void EkrDragonPalFade_Init(struct ProcEkrDragonPalFade * proc)
{
    proc->unk2C = 0;
    proc->unk30 = 0;

    proc->unk3C = gLCDControlBuffer.blendCoeffA;
    proc->unk3D = gLCDControlBuffer.blendCoeffB;
    proc->unk34 = GetEkrDragonPalette();

    SetDefaultColorEffects_();
    SpellFx_ClearBG1();

    return;
}

void EkrDragonPalFade_Loop(struct ProcEkrDragonPalFade * proc)
{
    EkrDragon_BlendPalette(proc->unk34,
                gPaletteBuffer + 0x60,
                proc->unk38[proc->unk30],
                proc->unk3C,
                proc->unk3D);

    EkrDragon_BlendPalette(proc->unk34,
                gPaletteBuffer + 0x170,
                proc->unk38[proc->unk30],
                proc->unk3C,
                proc->unk3D);

    EnablePaletteSync();

    proc->unk2C++;
    proc->unk30++;

    if (proc->unk38[proc->unk30] == 0x8000)
        proc->unk30 = 0;
}

void EkrDragonPalFade_End(void)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
    {
        Proc_EndEach(ProcScr_EkrDragon_0);
        SetEkrDragonPaletteFront(POS_L);
        SetEkrDragonPaletteBack(POS_L);
    }
}

void NewEkrDragonPalFade(void)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
    {
        struct ProcEkrDragonPalFade * proc;
        proc = Proc_Start(ProcScr_EkrDragon_0, PROC_TREE_3);
        proc->unk38 = gEkrdragon_0;
    }
}
