#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"

#include "worldmap.h"

//! FE8U = 0x080C0FB0
void sub_80C0FB0(struct GmapEffectProc * proc)
{
    gLCDControlBuffer.bldcnt = proc->unk_34;
    gLCDControlBuffer.blendCoeffA = proc->unk_3c;
    gLCDControlBuffer.blendCoeffB = proc->unk_3d;
    gLCDControlBuffer.blendY = proc->unk_3e;

    return;
}

//! FE8U = 0x080C0FE8
void sub_80C0FE8(struct GmapEffectProc * proc)
{
    proc->unk_30 = 0;

    proc->unk_2e = 4;
    proc->unk_2c = 4;

    proc->unk_29_0 = 0;

    if (gGMData.state.bits.state_3)
    {
        proc->unk_29_1 = 1;
        proc->unk_2a = -1;
    }
    else
    {
        proc->unk_29_1 = 0;
        proc->unk_2a = 0;
    }

    proc->unk_2b_0 = 0;

    proc->unk_34 = gLCDControlBuffer.bldcnt;
    proc->unk_3c = gLCDControlBuffer.blendCoeffA;
    proc->unk_3d = gLCDControlBuffer.blendCoeffB;
    proc->unk_3e = gLCDControlBuffer.blendY;

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetSpecialColorEffectsParameters(0, 0x10, 0x10, 0);

    return;
}

extern u16 gUnknown_08A97E48[];

//! FE8U = 0x080C10B8
void sub_80C10B8(struct GmapEffectProc * proc)
{
    int i;
    int idx;
    u16 * pal;

    proc->unk_2c--;

    if (proc->unk_2c > 0)
    {
        return;
    }

    pal = &PAL_OBJ_COLOR(6, 0);

    for (i = 0; i < 0x10; i++)
    {
        if ((proc->unk_29_0) != 0)
        {
            idx = (proc->unk_30 + i) & 0x1f;
        }
        else
        {
            int tmp;
            tmp = i + 0x20;
            idx = (tmp - proc->unk_30) & 0x1f;
        }

        pal[i] = idx[gUnknown_08A97E48];
        SetSpecialColorEffectsParameters(0, 0xF - proc->unk_30, 0x10, 0);
    }

    proc->unk_2c = proc->unk_2e;
    EnablePaletteSync();

    proc->unk_30++;

    if (proc->unk_30 > 0xf)
    {
        if ((proc->unk_29_1) == 0)
        {
            proc->unk_2b_0 = 1;
            Proc_Break(proc);
            return;
        }

        if (proc->unk_2a < 0)
        {
            proc->unk_30 = 0;
        }
        else if (proc->unk_2a > 0)
        {
            proc->unk_30 = 0;

            proc->unk_2a--;
            if (proc->unk_2a == 0)
            {
                proc->unk_29_1 = 0;
            }
        }
    }

    return;
}

struct Unknown8A3E9A0
{
    /* 00 */ const u16 * unk_00;
    /* 04 */ u8 unk_04;
    /* 05 */ s8 unk_05;
    /* 06 */ s8 unk_06;
    STRUCT_PAD(0x07, 0x08);
};

extern struct Unknown8A3E9A0 gUnknown_08A3E9A0[];

//! FE8U = 0x080C119C
void sub_80C119C(struct GmapEffectProc * proc)
{
    s16 xOam1;
    s16 yOam0;
    struct Unknown8A3E9A0 * ptr;
    int layer;
    int i;
    s16 x;
    s16 y;

    if (gGMData.state.bits.state_3)
    {
        GetWMDisplayPosition(&x, &y);
    }
    else
    {
        x = gGMData.xCamera;
        y = gGMData.yCamera;
    }

    for (i = 0; i < 4; i++)
    {
        ptr = gUnknown_08A3E9A0 + (u8)proc->unk_2a * 4 + i;

        xOam1 = proc->unk_2c + ptr->unk_05 - x;
        yOam0 = proc->unk_2e + ptr->unk_06 - y;
        if (((xOam1 + 0x21) > 0 && (xOam1 + 0x21) < 0x112) && ((yOam0 + 0x21) > 0 && (yOam0 + 0x21) < 0xc2))
        {
            int oam2Layer;
            if (gGMData.state.bits.state_3)
            {
                layer = 0xc;
                oam2Layer = 0xc00;
            }
            else
            {
                layer = 0xd;
                oam2Layer = 0x800;
            }

            PutSprite(layer, xOam1, yOam0, ptr->unk_00, ptr->unk_04 + 0x6180 + oam2Layer);
        }
    }

    return;
}

// proc.h
int sub_80034FC(const struct ProcCmd * script); // CountProcs

extern struct ProcCmd gUnknown_08A3EA00[];
extern struct ProcCmd gUnknown_08A3EA38[];

//! FE8U = 0x080C128C
void sub_80C128C(void)
{
    if (sub_80034FC(gUnknown_08A3EA38) < 2)
    {
        Proc_EndEach(gUnknown_08A3EA00);
    }

    return;
}

extern u16 gUnknown_08A97E28[];
extern u8 gUnknown_08A97C98[];

//! FE8U = 0x080C12AC
void sub_80C12AC(struct GmapEffectProc * proc)
{
    if (sub_80034FC(gUnknown_08A3EA38) < 2)
    {
        ApplyPalette(gUnknown_08A97E28, 0x16);
        EnablePaletteSync();

        Decompress(gUnknown_08A97C98, gGenericBuffer);
        Copy2dChr(gGenericBuffer, (void *)0x06013000, 6, 4);
    }

    if (Proc_Find(gUnknown_08A3EA00) == NULL)
    {
        Proc_Start(gUnknown_08A3EA00, proc);
    }

    proc->unk_2e = 0;
    proc->unk_2c = 0;
    proc->unk_29_0 = 0;

    return;
}

//! FE8U = 0x080C1324
void sub_80C1324(struct GmapEffectProc * proc)
{
    struct GmapEffectProc * otherProc = Proc_Find(gUnknown_08A3EA00);

    if (otherProc == 0)
    {
        Proc_Break(proc);
    }

    if (otherProc->unk_2b_0)
    {
        Proc_Break(proc);
    }

    if (proc->unk_29_0)
    {
        sub_80C119C(proc);
    }

    return;
}

//! FE8U = 0x080C1370
struct GmapEffectProc * sub_80C1370(ProcPtr parent, int unk)
{
    struct GmapEffectProc * proc;

    if (parent != NULL)
    {
        if (gGMData.state.bits.state_3)
        {
            proc = Proc_StartBlocking(gUnknown_08A3EA38, parent);
        }
        else
        {
            proc = Proc_StartBlocking(gUnknown_08A3EA38, parent);
        }
    }
    else
    {
        if (gGMData.state.bits.state_3)
        {
            proc = Proc_Start(gUnknown_08A3EA38, PROC_TREE_3);
        }
        else
        {
            proc = Proc_StartBlocking(gUnknown_08A3EA38, PROC_TREE_3);
        }
    }

    proc->unk_2a = unk;

    return proc;
}

//! FE8U = 0x080C13CC
void sub_80C13CC(ProcPtr proc)
{
    Proc_End(proc);
    return;
}

//! FE8U = 0x080C13D8
void sub_80C13D8(void)
{
    Proc_EndEach(gUnknown_08A3EA38);
    return;
}
