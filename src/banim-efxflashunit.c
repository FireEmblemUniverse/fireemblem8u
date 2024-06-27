#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "hardware.h"
#include "bmlib.h"

#include "constants/video-banim.h"

// TODO: move elsewhere
CONST_DATA struct ProcCmd ProcScr_efxFlashHPBar[] = {
    PROC_NAME("efxFlashHPBar"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(EfxFlashHPBarDelay),
    PROC_REPEAT(EfxFlashHPBarMain1),
    PROC_REPEAT(EfxFlashHPBarRestorePal),
    PROC_END
};

void NewEfxFlashHPBar(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    u16 _duartion = duartion;
    u16 _duartion2 = duartion2;

    proc = Proc_Start(ProcScr_efxFlashHPBar, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = _duartion;
    proc->terminator2 = _duartion2;

    /* ? */
    if (_duartion == 0)
        Proc_Break(proc);
}

void EfxFlashHPBarDelay(struct ProcEfxFlashing * proc)
{
    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashHPBarMain1(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(gPalEfxHpBarGreen, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(gPalEfxHpBarGreen, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
    }

    EnablePaletteSync();

    if (++proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashHPBarRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(gUnknown_08802B04, gBanimFactionPal[EKR_POS_L], 0),
                      PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20); /* Why right? */
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(gUnknown_08802B04, gBanimFactionPal[EKR_POS_R], 0),
                      PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
    }

    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxHPBarColorChange[] = {
    PROC_NAME("efxHPBarColorChange"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(EfxHPBarColorChangeMain),
    PROC_END
};

const u16 gFrameLut_EfxHPBarColorChange1[] = {
    0x01, 0x02,
    0x02, 0x02,
    0x03, 0x02,
    0x04, 0x02,
    0x05, 0x0A,
    0x04, 0x02,
    0x03, 0x02,
    0x02, 0x02,
    0x01, 0x02,
    0x00, 0x0A,
    -2
};

const u16 gFrameLut_EfxHPBarColorChange2[] = {
    0x00, 0x0A,
    0x01, 0x0A,
    0x02, 0x0A,
    0x03, 0x0A,
    0x04, 0x0A,
    0x03, 0x0A,
    0x02, 0x0A,
    0x01, 0x0A,
    -2
};

void NewEfxHpBarColorChange(struct Anim * anim)
{
    struct ProcEfxHpBarColorChange * proc;
    gpProcEfxHpBarColorChange = proc = Proc_Start(ProcScr_efxHPBarColorChange, PROC_TREE_3);
    proc->anim = anim;
    proc->timer1 = 0;
    proc->frame1 = 0;
    proc->frame_lut1 = gFrameLut_EfxHPBarColorChange1;
    proc->unk54 = 0;
    proc->timer2 = 0;
    proc->frame2 = 0;
    proc->frame_lut2 = gFrameLut_EfxHPBarColorChange2;
    proc->unk58 = 0;
    proc->disabled = false;

    EfxSplitColor(
        gUnknown_08802B04 + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufA,
        0x10);

    EfxSplitColor(
        gUnknown_08802BC4 + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufB,
        0x10);

    sub_8071574(
        gEfxSplitedColorBufA,
        gEfxSplitedColorBufB,
        gEfxSplitedColorBufC,
        0x10, 5);

    EfxSplitColor(
        gUnknown_08802B04 + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufD,
        0x10);

    EfxSplitColor(
        gUnknown_08802BC4 + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufE,
        0x10);

    sub_8071574(
        gEfxSplitedColorBufD,
        gEfxSplitedColorBufE,
        gEfxSplitedColorBufF,
        0x10, 5);
}

void EndEfxHPBarColorChange(void)
{
    Proc_End(gpProcEfxHpBarColorChange);
}

void DisableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = true;
}

void EnableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = false;
}

void EfxHPBarColorChangeMain(struct ProcEfxHpBarColorChange * proc)
{
    int ret;
    u8 *buf1, *buf2;
    u16 *buf3;

    if (proc->disabled == true)
        return;

    ret = EfxAdvanceFrameLut(&proc->timer1, (s16 *)&proc->frame1, proc->frame_lut1);
    if (ret >= 0)
        proc->unk54 = ret;

    ret = EfxAdvanceFrameLut(&proc->timer2, (s16 *)&proc->frame2, proc->frame_lut2);
    if (ret >= 0)
        proc->unk58 = ret;

    if (gEkrGaugeHp[EKR_POS_L] <= 80)
    {
        buf1 = gEfxSplitedColorBufA;
        buf2 = gEfxSplitedColorBufB;
        buf3 = gEfxSplitedColorBufC;

        EfxDecodeSplitedPalette(
            PAL_OBJ(OBPAL_EFXHPBAR_L),
            (s8 *)gEfxSplitedColorBufA,
            (s8 *)gEfxSplitedColorBufB,
            (s16 *)gEfxSplitedColorBufC,
            0x10,
            proc->unk54,
            5);
    }
    else
        CpuFastCopy(gPalEfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);

    if (gEkrGaugeHp[EKR_POS_R] <= 80)
    {
        buf1 = gEfxSplitedColorBufD;
        buf2 = gEfxSplitedColorBufE;
        buf3 = gEfxSplitedColorBufF;

        EfxDecodeSplitedPalette(
            PAL_OBJ(OBPAL_EFXHPBAR_R),
            (s8 *)buf1,
            (s8 *)buf2,
            (s16 *)buf3,
            0x10, proc->unk54,
            5);
    }
    else
        CpuFastCopy(gPalEfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);

    EnablePaletteSync();
}

CONST_DATA struct ProcCmd ProcScr_efxFlashUnit[] = {
    PROC_NAME("efxFlashUnit"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(EfxFlashUnitMain),
    PROC_REPEAT(EfxFlashUnitRestorePal),
    PROC_END
};

void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c)
{
    struct ProcEfxFlashing * proc = Proc_Start(ProcScr_efxFlashUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = dura1;
    proc->terminator2 = dura2;
    proc->unk29 = c;
}

void EfxFlashUnitMain(struct ProcEfxFlashing * proc)
{
    if (++proc->timer < proc->terminator)
        return;

    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }

    EnablePaletteSync();

    if (proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashUnitRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }

    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxFlashUnitEffectEnd[] = {
    PROC_NAME("efxFlashUnitEffectEnd"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(EfxFlashUnitEffectMain),
    PROC_REPEAT(EfxFlashUnitEffectRestorePal),
    PROC_END
};

void NewEfxFlashUnitEffectEnd(struct Anim * anim, int dura1, int dura2, int c)
{
    struct ProcEfxFlashing * proc;
    u16 duartion1 = dura1;
    u16 duartion2 = dura2;
    proc = Proc_Start(ProcScr_efxFlashUnitEffectEnd, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion1;
    proc->terminator2 = duartion2;
    proc->unk29 = c;

    anim->state3 |= ANIM_BIT3_BLOCKING;
    anim->state  |= ANIM_BIT_FROZEN;
    anim->timer   = 0x2;
}

void EfxFlashUnitEffectMain(struct ProcEfxFlashing * proc)
{
    if (++proc->timer < proc->terminator)
        return;

    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }

    EnablePaletteSync();

    if (proc->timer >= proc->terminator2)
    {
        struct Anim * anim = proc->anim;
        anim->state3 |= ANIM_BIT3_BLOCKEND;
        anim->state  &= ~ANIM_BIT_FROZEN;
        anim->timer   = 0;
        Proc_Break(proc);
    }
}

void EfxFlashUnitEffectRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }

    EnablePaletteSync();
    Proc_Break(proc);
    proc->anim->state3 |= ANIM_BIT3_BLOCKEND;
}
