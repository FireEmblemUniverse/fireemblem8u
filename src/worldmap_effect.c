#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"

#include "worldmap.h"

// clang-format off

u16 CONST_DATA gSprite_08A3E940[] =
{
    1,
    OAM0_SHAPE_8x8 + OAM0_BLEND, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA gSprite_08A3E948[] =
{
    1,
    OAM0_SHAPE_8x8 + OAM0_BLEND, OAM1_SIZE_8x8 + OAM1_HFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E950[] =
{
    1,
    OAM0_SHAPE_8x8 + OAM0_BLEND, OAM1_SIZE_8x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E958[] =
{
    1,
    OAM0_SHAPE_8x8 + OAM0_BLEND, OAM1_SIZE_8x8 + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E960[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA gSprite_08A3E968[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_HFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E970[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E978[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E980[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32, 0,
};

u16 CONST_DATA gSprite_08A3E988[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_HFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E990[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gSprite_08A3E998[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_HFLIP + OAM1_VFLIP, 0,
};

// clang-format on

//! FE8U = 0x080C0FB0
void GmapEffectPal_OnEnd(struct GmapEffectProc * proc)
{
    gLCDControlBuffer.bldcnt = proc->blendControl;
    gLCDControlBuffer.blendCoeffA = proc->blendCoeffA;
    gLCDControlBuffer.blendCoeffB = proc->blendCoeffB;
    gLCDControlBuffer.blendY = proc->blendY;

    return;
}

//! FE8U = 0x080C0FE8
void GmapEffectPal_Init(struct GmapEffectProc * proc)
{
    proc->unk_30 = 0;

    proc->unk_2e = 4;
    proc->unk_2c = 4;

    proc->flags_0 = 0;

    if (gGMData.state.bits.state_3)
    {
        proc->flags_1 = 1;
        proc->unk_2a = -1;
    }
    else
    {
        proc->flags_1 = 0;
        proc->unk_2a = 0;
    }

    proc->unk_2b_0 = 0;

    proc->blendControl = gLCDControlBuffer.bldcnt;
    proc->blendCoeffA = gLCDControlBuffer.blendCoeffA;
    proc->blendCoeffB = gLCDControlBuffer.blendCoeffB;
    proc->blendY = gLCDControlBuffer.blendY;

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendConfig(BLEND_EFFECT_NONE, 16, 16, 0);

    return;
}

//! FE8U = 0x080C10B8
void GmapEffectPal_Loop(struct GmapEffectProc * proc)
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

    for (i = 0; i < 16; i++)
    {
        if (proc->flags_0)
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
        SetBlendConfig(BLEND_EFFECT_NONE, 15 - proc->unk_30, 16, 0);
    }

    proc->unk_2c = proc->unk_2e;
    EnablePaletteSync();

    proc->unk_30++;

    if (proc->unk_30 > 15)
    {
        if (!(proc->flags_1))
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
                proc->flags_1 = 0;
            }
        }
    }

    return;
}

struct Unknown8A3E9A0
{
    /* 00 */ u16 * sprite;
    /* 04 */ u8 oam2;
    /* 05 */ s8 xOam1;
    /* 06 */ s8 yOam0;
    STRUCT_PAD(0x07, 0x08);
};

// clang-format off

struct Unknown8A3E9A0 CONST_DATA gUnknown_08A3E9A0[] =
{
    {
        .sprite = gSprite_08A3E940,
        .oam2 = 68,
        .xOam1 = -8,
        .yOam0 = -8,
    },
    {
        .sprite = gSprite_08A3E948,
        .oam2 = 68,
        .xOam1 = 0,
        .yOam0 = -8,
    },
    {
        .sprite = gSprite_08A3E950,
        .oam2 = 68,
        .xOam1 = -8,
        .yOam0 = 0,
    },
    {
        .sprite = gSprite_08A3E958,
        .oam2 = 68,
        .xOam1 = 0,
        .yOam0 = 0,
    },
    {
        .sprite = gSprite_08A3E960,
        .oam2 = 4,
        .xOam1 = -16,
        .yOam0 = -16,
    },
    {
        .sprite = gSprite_08A3E968,
        .oam2 = 4,
        .xOam1 = 0,
        .yOam0 = -16,
    },
    {
        .sprite = gSprite_08A3E970,
        .oam2 = 4,
        .xOam1 = -16,
        .yOam0 = 0,
    },
    {
        .sprite = gSprite_08A3E978,
        .oam2 = 4,
        .xOam1 = 0,
        .yOam0 = 0,
    },
    {
        .sprite = gSprite_08A3E980,
        .oam2 = 0,
        .xOam1 = -32,
        .yOam0 = -32,
    },
    {
        .sprite = gSprite_08A3E988,
        .oam2 = 0,
        .xOam1 = 0,
        .yOam0 = -32,
    },
    {
        .sprite = gSprite_08A3E990,
        .oam2 = 0,
        .xOam1 = -32,
        .yOam0 = 0,
    },
    {
        .sprite = gSprite_08A3E998,
        .oam2 = 0,
        .xOam1 = 0,
        .yOam0 = 0,
    },
};

// clang-format on

//! FE8U = 0x080C119C
void GmapEffect_80C119C(struct GmapEffectProc * proc)
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
        GmapRm_GetPosition(&x, &y);
    }
    else
    {
        x = gGMData.xCamera;
        y = gGMData.yCamera;
    }

    for (i = 0; i < 4; i++)
    {
        ptr = gUnknown_08A3E9A0 + (u8)proc->unk_2a * 4 + i;

        xOam1 = proc->unk_2c + ptr->xOam1 - x;
        yOam0 = proc->unk_2e + ptr->yOam0 - y;
        if (((xOam1 + 0x21) > 0 && (xOam1 + 0x21) < 0x112) && ((yOam0 + 0x21) > 0 && (yOam0 + 0x21) < 0xc2))
        {
            int oam2Layer;
            if (gGMData.state.bits.state_3)
            {
                layer = 0xc;
                oam2Layer = OAM2_LAYER(3);
            }
            else
            {
                layer = 0xd;
                oam2Layer = OAM2_LAYER(2);
            }

            PutSprite(layer, xOam1, yOam0, ptr->sprite, ptr->oam2 + OAM2_CHR(0x180) + OAM2_PAL(6) + oam2Layer);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapEffectPal[] =
{
    PROC_NAME("Gmap Effect Pa"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmapEffectPal_OnEnd),

    PROC_CALL(GmapEffectPal_Init),

    PROC_REPEAT(GmapEffectPal_Loop),
    PROC_BLOCK,

    PROC_END,
};

// clang-format on

extern struct ProcCmd gProcScr_GmapEffect[];

//! FE8U = 0x080C128C
void GmapEffect_OnEnd(void)
{
    if (CountProcs(gProcScr_GmapEffect) < 2)
    {
        Proc_EndEach(gProcScr_GmapEffectPal);
    }

    return;
}

//! FE8U = 0x080C12AC
void GmapEffect_Init(struct GmapEffectProc * proc)
{
    if (CountProcs(gProcScr_GmapEffect) < 2)
    {
        ApplyPalette(gPal_WorldmapNodeRevealEffect, 0x16);
        EnablePaletteSync();

        Decompress(gImg_WorldmapNodeRevealEffect, gGenericBuffer);
        Copy2dChr(gGenericBuffer, (void *)0x06013000, 6, 4);
    }

    if (Proc_Find(gProcScr_GmapEffectPal) == NULL)
    {
        Proc_Start(gProcScr_GmapEffectPal, proc);
    }

    proc->unk_2e = 0;
    proc->unk_2c = 0;
    proc->flags_0 = 0;

    return;
}

//! FE8U = 0x080C1324
void GmapEffect_Loop(struct GmapEffectProc * proc)
{
    struct GmapEffectProc * otherProc = Proc_Find(gProcScr_GmapEffectPal);

    if (otherProc == NULL)
    {
        Proc_Break(proc);
    }

    if (otherProc->unk_2b_0)
    {
        Proc_Break(proc);
    }

    if (proc->flags_0)
    {
        GmapEffect_80C119C(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapEffect[] =
{
    PROC_NAME("Gmap Effect"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmapEffect_OnEnd),

    PROC_CALL(GmapEffect_Init),
    PROC_YIELD,

    PROC_REPEAT(GmapEffect_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C1370
struct GmapEffectProc * StartGmapEffect(ProcPtr parent, int unk)
{
    struct GmapEffectProc * proc;

    if (parent != NULL)
    {
        if (gGMData.state.bits.state_3)
        {
            // TODO: Was this intended to be non-blocking?
            proc = Proc_StartBlocking(gProcScr_GmapEffect, parent);
        }
        else
        {
            proc = Proc_StartBlocking(gProcScr_GmapEffect, parent);
        }
    }
    else
    {
        if (gGMData.state.bits.state_3)
        {
            proc = Proc_Start(gProcScr_GmapEffect, PROC_TREE_3);
        }
        else
        {
            proc = Proc_StartBlocking(gProcScr_GmapEffect, PROC_TREE_3);
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
void EndGmapEffect(void)
{
    Proc_EndEach(gProcScr_GmapEffect);
    return;
}
