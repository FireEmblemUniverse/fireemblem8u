#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"
#include "hardware.h"
#include "mapanim.h"

EWRAM_DATA int gEkrBg2ScrollFlip = 0;
EWRAM_DATA u16 * gpEkrLvupBg2ScrollOffsetStart = NULL;
EWRAM_DATA u16 * gpEkrLvupBg2ScrollOffset = NULL;
EWRAM_DATA u16 gpEkrLvupBg2ScrollOffsetTable1[160] = {0};
EWRAM_DATA u16 gpEkrLvupBg2ScrollOffsetTable2[160] = {0};

EWRAM_DATA int gEkrBg1ScrollFlip = 0;
EWRAM_DATA u16 * gpEkrLvupBg1ScrollOffsetStart = NULL;
EWRAM_DATA u16 * gpEkrLvupBg1ScrollOffset = NULL;
EWRAM_DATA u16 gpEkrLvupBg1ScrollOffsetTable1[160] = {0};
EWRAM_DATA u16 gpEkrLvupBg1ScrollOffsetTable2[160] = {0};

EWRAM_DATA int gUnknown_02020044 = 0;

CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll[] = {
    PROC_NAME("efxPartsofScroll"),
    PROC_SET_END_CB(EfxPartsofScrollCallBack),
    PROC_REPEAT(EfxPartsofScrollMain),
    PROC_END
};

ProcPtr NewEfxPartsofScroll(void)
{
    struct ProcEfx * proc =
        Proc_Start(ProcScr_EfxPartsofScroll, PROC_TREE_3);

    proc->timer = 0;
    proc->unk2E = 0;
    return proc;
}

void EfxUpdatePartsofScroll(void)
{
    u32 i;

    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpEkrLvupBg2ScrollOffsetTable2
               : gpEkrLvupBg2ScrollOffsetTable1;

    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpEkrLvupBg1ScrollOffsetTable2
               : gpEkrLvupBg1ScrollOffsetTable1;

    for (i = 0; i < 0xA0; i++)
    {
        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            *buf1++ = gEkrLvupScrollPos1;
            *buf2++ = gEkrLvupScrollPos1;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = gEkrLvupScrollPos2;
            *buf2++ = gEkrLvupScrollPos2;
            continue;
        }
    }
}

void EfxPartsofScrollCallBack(ProcPtr proc)
{
    return;
}

void EfxPartsofScrollMain(ProcPtr proc)
{
    EfxUpdatePartsofScroll();
}

CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll2[] = {
    PROC_NAME("efxPartsofScroll2"),
    PROC_SET_END_CB(EfxPartsofScroll2CallBack),
    PROC_REPEAT(EfxPartsofScroll2Main),
    PROC_END
};

ProcPtr NewEfxPartsofScroll2(void)
{
    struct ProcEfx * proc =
        Proc_Start(ProcScr_EfxPartsofScroll2, PROC_TREE_3);

    proc->timer = 0;
    proc->unk2E = 0;
    return proc;
}

void EfxPartsofScroll2CallBack(ProcPtr proc)
{
    return;
}

CONST_DATA s16 gUnknown_0875941C[] = {
    -0x100, -0xEE, -0xDD, -0xCC, -0xBB, -0xAA, -0x99, -0x88,
     -0x77, -0x66, -0x55, -0x44, -0x33, -0x22, -0x22, -0x11,
      0x11,  0x22,  0x22,  0x33,  0x44,  0x55,  0x66,  0x77,
      0x88,  0x99,  0xAA,  0xBB,  0xCC,  0xDD,  0xEE, 0x100
};

void EfxPartsofScroll2Main(ProcPtr proc)
{
    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpEkrLvupBg2ScrollOffsetTable2
               : gpEkrLvupBg2ScrollOffsetTable1;

    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpEkrLvupBg1ScrollOffsetTable2
               : gpEkrLvupBg1ScrollOffsetTable1;

    u32 i = 0;

    for (; i < 0xA0; i++)
    {
        s16 * src = gUnknown_0875941C;
        src = src - 0x28;

        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            s16 val2 = (src[i] * gEkrLvupScrollPos1) >> 0xC;

            if (i + val2 < 0x2F)
                val2 = -0x20;
            else if (i + val2 >= 0x52)
                val2 = -0x20;

            *buf1++ = val2;
            *buf2++ = val2;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_Efxleveluphb[] = {
    PROC_NAME("efxLevelupHB"),
    PROC_SET_END_CB(EfxleveluphbCallBack),
    PROC_REPEAT(EfxleveluphbNop),
    PROC_REPEAT(EfxleveluphbMain),
    PROC_END
};

ProcPtr NewEfxleveluphb(void)
{
    u32 i;
    struct ProcEfx * proc;
    u16 * buf;
    struct ProcCmd * v;

    gEfxBgSemaphore++;

    buf = gpEkrLvupBg2ScrollOffsetTable1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpEkrLvupBg2ScrollOffsetTable2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpEkrLvupBg1ScrollOffsetTable1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpEkrLvupBg1ScrollOffsetTable2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    gEkrBg2ScrollFlip = 0;
    v = ProcScr_Efxleveluphb; // by permuter

    gEkrBg1ScrollFlip = 0;
#ifndef NONMATCHING
    asm("":::"v7"); // by me
#endif
    buf = gpEkrLvupBg2ScrollOffsetTable1;
    gpEkrLvupBg2ScrollOffsetStart = buf;
    buf = gpEkrLvupBg1ScrollOffsetTable1;
    gpEkrLvupBg1ScrollOffsetStart = buf;
    buf = gpEkrLvupBg2ScrollOffsetStart;
    gpEkrLvupBg2ScrollOffset = buf;
    buf = gpEkrLvupBg1ScrollOffsetStart;
    gpEkrLvupBg1ScrollOffset = buf;

    proc = Proc_Start(v, PROC_TREE_VSYNC);
    proc->timer = 0;
    return proc;
}

void EfxleveluphbCallBack(ProcPtr proc)
{
    SetPrimaryHBlankHandler(NULL);
}

void EfxleveluphbNop(ProcPtr proc)
{
    Proc_Break(proc);
}

void EfxleveluphbMain(ProcPtr proc)
{
    if (gBmSt.sync_hardware != false)
    {
        if (gEkrBg2ScrollFlip == 1)
        {
            gEkrBg2ScrollFlip = 0;
            gpEkrLvupBg2ScrollOffsetStart = gpEkrLvupBg2ScrollOffsetTable1;
        }
        else
        {
            gEkrBg2ScrollFlip = 1;
            gpEkrLvupBg2ScrollOffsetStart = gpEkrLvupBg2ScrollOffsetTable2;
        }
    
        if (gEkrBg1ScrollFlip == 1)
        {
            gEkrBg1ScrollFlip = 0;
            gpEkrLvupBg1ScrollOffsetStart = gpEkrLvupBg1ScrollOffsetTable1;
        }
        else
        {
            gEkrBg1ScrollFlip = 1;
            gpEkrLvupBg1ScrollOffsetStart = gpEkrLvupBg1ScrollOffsetTable2;
        }
    }
    gpEkrLvupBg2ScrollOffset = gpEkrLvupBg2ScrollOffsetStart;
    gpEkrLvupBg1ScrollOffset = gpEkrLvupBg1ScrollOffsetStart;
}

void EkrLvupHBlank(void)
{
    /* line 160..226 */
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2HOFS = *gpEkrLvupBg2ScrollOffset++;
    REG_BG1HOFS = *gpEkrLvupBg1ScrollOffset++;
}

void EfxPartsofScroll2HBlank(void)
{
    /* line 160..226 */
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2VOFS = gLCDControlBuffer.bgoffset[2].y + *gpEkrLvupBg2ScrollOffset++;
    REG_BG1VOFS = gLCDControlBuffer.bgoffset[1].y + *gpEkrLvupBg1ScrollOffset++;
}

CONST_DATA struct ProcCmd ProcScr_Efxlvupbg[] = {
    PROC_NAME("efxLvupBG"),
    PROC_REPEAT(EfxlvupbgMain),
    PROC_END
};

const u16 FrameConfig_EfxLvupBG[] = {
    0, 1,
    1, 1,
    2, 1,
    3, 1,
    4, 1,
    5, 1,
    6, 1,
    7, 1,
    8, 1,
    9, 1,
    10, 1,
    -1
};

CONST_DATA u16 * TsaLut_EfxLvupBG[] = {
    Tsa1_EfxLvupBG,
    Tsa2_EfxLvupBG,
    Tsa3_EfxLvupBG,
    Tsa4_EfxLvupBG,
    Tsa5_EfxLvupBG,
    Tsa6_EfxLvupBG,
    Tsa7_EfxLvupBG,
    Tsa8_EfxLvupBG,
    Tsa9_EfxLvupBG,
    Tsa10_EfxLvupBG,
    Tsa11_EfxLvupBG
};

CONST_DATA u16 * ImgLut_EfxLvupBG[] = {
    Img1_EfxLvupBG,
    Img1_EfxLvupBG,
    Img2_EfxLvupBG,
    Img2_EfxLvupBG,
    Img3_EfxLvupBG,
    Img4_EfxLvupBG,
    Img5_EfxLvupBG,
    Img6_EfxLvupBG,
    Img7_EfxLvupBG,
    Img7_EfxLvupBG,
    Img7_EfxLvupBG
};

void NewEfxlvupbg(struct Anim * anim)
{
    struct ProcEfxBG * proc =
        Proc_Start(ProcScr_Efxlvupbg, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_EfxLvupBG;
    proc->tsal = TsaLut_EfxLvupBG;
    proc->tsar = TsaLut_EfxLvupBG;
    proc->img = ImgLut_EfxLvupBG;

    SpellFx_RegisterBgPal(Pal_EfxLvupBG, 0x20);
    SpellFx_SetSomeColorEffect();
}

void EfxlvupbgMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxLvupBG2[] = {
    PROC_NAME("efxLvupBG2"),
    PROC_REPEAT(EfxLvupBg2Main),
    PROC_END
};

CONST_DATA u16 * TsaLut_EfxLvupBG2[] = {
    Tsa1_EfxLvupBG2,
    Tsa2_EfxLvupBG2,
    Tsa3_EfxLvupBG2,
    Tsa4_EfxLvupBG2,
    Tsa5_EfxLvupBG2,
    Tsa6_EfxLvupBG2
};

const u16 FrameConfig_EfxLvupBG2[] = {
    0, 1,
    1, 1,
    2, 1,
    3, 1,
    4, 1,
    5, 0x1C,
    -1
};

void NewEfxLvupBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc =
        Proc_Start(ProcScr_efxLvupBG2, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_EfxLvupBG2;
    proc->tsal = TsaLut_EfxLvupBG2;
    proc->tsar = TsaLut_EfxLvupBG2;

    SpellFx_RegisterBgGfx(Img_EfxLvupBG2, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxLvupBG2, 0x20);
}

void EfxLvupBg2Main(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        return;
    }

    if (ret == -1)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxLvupOBJ2[] = {
    PROC_NAME("efxLvupOBJ2"),
    PROC_SET_END_CB(EfxLvupOBJ2CallBack),
    PROC_SLEEP(0x18),
    PROC_END
};

void NewEfxLvupOBJ2(struct Anim * anim, int x, int y)
{
    struct Anim * anim3;
    struct ProcEfxOBJ * proc =
        Proc_Start(ProcScr_efxLvupOBJ2, PROC_TREE_3);

    proc->anim = anim;
    anim3 = EfxCreateFrontAnim(anim, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2);
    proc->anim3 = anim3;
    anim3->xPosition = x;
    anim3->yPosition = y;

    SpellFx_RegisterObjGfx(Img_EfxLvupOBJ2, 0x1000);
    SpellFx_RegisterObjPal(Pal_EfxLvupBG2, 0x20);
}

void EfxLvupOBJ2CallBack(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim3);
}

CONST_DATA struct ProcCmd ProcScr_efxLvupBGCOL[] = {
    PROC_NAME("efxLvupBGCOL"),
    PROC_REPEAT(Loop6C1_EfxLvupBGCOL),
    PROC_REPEAT(Loop6C2_EfxLvupBGCOL),
    PROC_END
};

const u16 FrameLut_EfxLvupBGCOL[] = {
    0, 2,
    1, 2,
    2, 2,
    3, 2,
    4, 2,
    5, 2,
    6, 2,
    7, 2,
    8, 2,
    9, 2,
    10, 2,
    11, 2,
    12, 2,
    13, 2,
    14, 2,
    15, 2,
    -2
};

void NewEfxLvupBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc =
        Proc_Start(ProcScr_efxLvupBGCOL, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = 0x19;
    proc->frame = 0;
    proc->frame_config = FrameLut_EfxLvupBGCOL;
    proc->pal = Pal_EfxLvupBGCOL;
}

const u16 FrameLut2_EfxLvupBGCOL[] = {
    0, 2,
    1, 2,
    2, 2,
    3, 2,
    -1
};

void Loop6C1_EfxLvupBGCOL(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0)
        sub_805588C(proc->pal, gPaletteBuffer + 1, ret, 0xF, 8);

    if (++proc->timer2 > proc->terminator)
    {
        proc->timer = 0;
        proc->timer2 = 0;
        proc->frame = 0;
        proc->frame_config = FrameLut2_EfxLvupBGCOL;
        proc->pal = Pal_EfxLvupBG2;
        Proc_Break(proc);
    }
}

void Loop6C2_EfxLvupBGCOL(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1)
        Proc_Break(proc);
}

void EkrLvupApfxInit(struct ProcEkrLvupApfx * proc)
{
    proc->clock = 0;
}

void EkrLvupApfxMain(struct ProcEkrLvupApfx * proc)
{
    int new_color_offset;
    u16 * colors = Pal_ManimLevelUpStatGainCycling;

    ++proc->clock;

    if (proc->clock & 3)
        return;

    new_color_offset = (proc->clock >> 2) & 0xF;

    // TODO: constants
    CopyToPaletteBuffer(colors + new_color_offset + 0x00, (0x10 + proc->pal + 0) * 0x20 + 0x12, 0x20 - 0x12);
    CopyToPaletteBuffer(colors + new_color_offset + 0x20, (0x10 + proc->pal + 1) * 0x20 + 0x12, 0x20 - 0x12);
}

CONST_DATA struct ProcCmd ProcScr_EkrLvupApfx[] = {
    PROC_CALL(EkrLvupApfxInit),
    PROC_REPEAT(EkrLvupApfxMain),
    PROC_END
};

const char aeobjLvup[] = "eobjLvup";
