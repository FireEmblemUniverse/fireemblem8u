#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"

#include "constants/video-banim.h"

/**
 * Debuff unit status flash effect for banim (Unit::statusIndex)
 */

CONST_DATA struct ProcCmd ProcScr_efxStatusUnit[] = {
    PROC_NAME("efxStatusUnit"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),
    PROC_SET_END_CB(EfxStatusUnitEnd),
    PROC_REPEAT(EfxStatusUnitMain),
    PROC_END
};

const u16 gFrameLut_EfxStatusUnit[] = {
    0, 0x14,
    0x4, 0x6,
    0x8, 0x5,
    0xC, 0x6,
    0x10, 0x14,
    0xC, 0x6,
    0x8, 0x5,
    0x4, 0x6,
    0xFFFE
};

void NewEfxStatusUnit(struct Anim *anim)
{
    struct Unit *unit;
    struct ProcEfxStatusUnit *proc;

    if (GetAnimPosition(anim) == EKR_POS_L)
        unit = &gpEkrBattleUnitLeft->unit;
    else
        unit = &gpEkrBattleUnitRight->unit;

    proc = Proc_Start(ProcScr_efxStatusUnit, PROC_TREE_3);

    proc->invalid = 0;
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_lut = gFrameLut_EfxStatusUnit;
    proc->debuff = unit->statusIndex;

    if (gEkrDebugModeMaybe == 1)
        proc->debuff = UNIT_STATUS_NONE;

    proc->debuf_bak = 0;
    proc->blue = 0;
    proc->green = 0;
    proc->red = 0;
    gpProcEfxStatusUnits[GetAnimPosition(anim)] = proc;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_L], &gFadeComponents[0], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_L], &gFadeComponents[0x30], 0x10);
        sub_8071574(&gFadeComponents[0], &gFadeComponents[0x30], (void *)&gFadeComponents[0x180], 0x10, 0x10);
    } else {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_R], &gFadeComponents[0x60], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_R], &gFadeComponents[0x90], 0x10);
        sub_8071574(&gFadeComponents[0x60], &gFadeComponents[0x90], (void *)&gFadeComponents[0x300], 0x10, 0x10);
    }
}

void EndEfxStatusUnits(struct Anim *anim)
{
    if (gpProcEfxStatusUnits[GetAnimPosition(anim)]) {
        Proc_End(gpProcEfxStatusUnits[GetAnimPosition(anim)]);
        gpProcEfxStatusUnits[GetAnimPosition(anim)] = NULL;
    }
}

void DeleteEach6C_efxStatusUnit(void)
{
    Proc_EndEach(ProcScr_efxStatusUnit);
}

void DisableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = true;
}

void EnableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = false;
}

void SetUnitEfxDebuff(struct Anim *anim, int debuff)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->debuff = debuff;

    if (debuff == UNIT_STATUS_NONE)
        EfxStatusUnitFlashing(anim, 0, 0, 0);
}

u32 GetUnitEfxDebuff(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    return procs[GetAnimPosition(anim)]->debuff;
}

void EfxStatusUnitFlashing(struct Anim *anim, int r, int g, int b)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x17, 1, r, g, b);

        if (GetEkrDragonStatusUnk1() != 0)
        {
            BanimSetFrontPaletteForDragon(anim);
            EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x6, 1, r, g, b);
        }
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x19, 1, r, g, b);
    }
}

void EfxStatusUnitMain(struct ProcEfxStatusUnit *proc)
{
    int ret, _ret;

    if (GetUnitEfxDebuff(proc->anim) == UNIT_STATUS_NONE || proc->invalid == true)
        return;

    if (proc->debuff != proc->debuf_bak) {
        proc->timer = 0;
        proc->frame = 0;
        proc->debuf_bak = proc->debuff;
    }

    /* seems like a interpolate-style function ? */
    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, proc->frame_lut);
    if (ret >= 0) {
        switch (proc->debuff) {
        case UNIT_STATUS_POISON:
            proc->red = ret;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_SLEEP:
            proc->red = 0;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_BERSERK:
            proc->red = ret;
            proc->green = 0;
            proc->blue = 0;
            break;

        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            proc->red = 0x10;
            proc->green = 0x10;
            proc->blue = 0x10;
            break;

        case UNIT_STATUS_12:
            proc->red = ret;
            proc->green = ret;

            _ret = ret + 1;
            if (_ret < 0)
                _ret = ret + 4;

            proc->blue = _ret >> 2;
            break;

        default:
            proc->red = ret;
            proc->green = ret;
            proc->blue = ret;
            break;
        }
    }

    switch (proc->debuff) {
    case UNIT_STATUS_POISON:
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_BERSERK:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_12:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            EfxDecodeSplitedPalette(
                PAL_OBJ(OBPAL_EFX_UNIT_L),
                gFadeComponents,
                &gFadeComponents[0x30],
                (s16 *)&gFadeComponents[0x180],
                16, proc->red, 16);
        else
            EfxDecodeSplitedPalette(
                PAL_OBJ(OBPAL_EFX_UNIT_R),
                &gFadeComponents[0x60],
                &gFadeComponents[0x90],
                (s16 *)&gFadeComponents[0x300],
                16, proc->red, 16);

        RefreshEntityBmMaps();
        RefreshUnitSprites();
        EndAllMus();
        break;

    case UNIT_STATUS_SILENCED:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    default:
        break;
    }

    EnablePaletteSync();
}

void EfxStatusUnitEnd(struct ProcEfxStatusUnit *proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
    else
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);

    EnablePaletteSync();
}
