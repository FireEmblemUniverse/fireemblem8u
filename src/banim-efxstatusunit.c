#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"

/**
 * Debuff unit status flash effect for banim (Unit::statusIndex)
 */

void NewEfxStatusUnit(struct Anim *anim)
{
    struct Unit *unit;
    struct ProcEfxStatusUnit *proc;

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
        unit = &gpEkrBattleUnitLeft->unit;
    else
        unit = &gpEkrBattleUnitRight->unit;

    proc = Proc_Start(gProc_efxStatusUnit, PROC_TREE_3);

    proc->invalid = 0;
    proc->anim = anim;
    proc->unk2C = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DACDA;
    proc->debuff = unit->statusIndex;

    if (gEkrDebugModeMaybe == 1)
        proc->debuff = UNIT_STATUS_NONE;

    proc->unk50 = 0;
    proc->blue = 0;
    proc->green = 0;
    proc->red = 0;
    gpProcEfxStatusUnits[GetAISSubjectId(anim)] = proc;

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT) {
        sub_80714DC(gpEfxUnitPaletteBackup[EKR_BATTLE_LEFT], &gUnknown_020222A8[0], 0x10);
        sub_807151C(gpEfxUnitPaletteBackup[EKR_BATTLE_LEFT], &gUnknown_020222A8[0x30], 0x10);
        sub_8071574(&gUnknown_020222A8[0], &gUnknown_020222A8[0x30], (void *)&gUnknown_020222A8[0x180], 0x10, 0x10);
    } else {
        sub_80714DC(gpEfxUnitPaletteBackup[EKR_BATTLE_RIGHT], &gUnknown_02022308[0], 0x10);
        sub_807151C(gpEfxUnitPaletteBackup[EKR_BATTLE_RIGHT], &gUnknown_02022308[0x30], 0x10);
        sub_8071574(&gUnknown_02022308[0], &gUnknown_02022308[0x30], (void *)&gUnknown_02022308[0x2A0], 0x10, 0x10);
    }
}

void EndEfxStatusUnits(struct Anim *anim)
{
    if (gpProcEfxStatusUnits[GetAISSubjectId(anim)]) {
        Proc_End(gpProcEfxStatusUnits[GetAISSubjectId(anim)]);
        gpProcEfxStatusUnits[GetAISSubjectId(anim)] = NULL;
    }
}

void DeleteEach6C_efxStatusUnit(void)
{
    Proc_EndEach(gProc_efxStatusUnit);
}

void DisableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAISSubjectId(anim)]->invalid = true;
}

void EnableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAISSubjectId(anim)]->invalid = false;
}

void SetUnitEfxDebuff(struct Anim *anim, int debuff)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAISSubjectId(anim)]->debuff = debuff;

    if (debuff == UNIT_STATUS_NONE)
        EfxStatusUnitSomePalModify(anim, 0, 0, 0);
}

u32 GettUnitEfxDebuff(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    return procs[GetAISSubjectId(anim)]->debuff;
}

void EfxStatusUnitSomePalModify(struct Anim *anim, int r, int g, int b)
{
    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT) {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_BATTLE_LEFT], &PAL_COLOR(0x17, 0), 0x20);
        EfxSomePalFlash(&PAL_COLOR(0, 0), 0x17, 1, r, g, b);

        if (GetEkrDragonStatusUnk1() != 0) {
            sub_807035C(anim);
            EfxSomePalFlash(&PAL_COLOR(0, 0), 0x6, 1, r, g, b);
        }
    } else {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_BATTLE_RIGHT], &PAL_COLOR(0x19, 0), 0x20);
        EfxSomePalFlash(&PAL_COLOR(0, 0), 0x19, 1, r, g, b);
    }
}

void EfxStatusUnitMain(struct ProcEfxStatusUnit *proc)
{
    int ret, _ret;

    if (GettUnitEfxDebuff(proc->anim) == UNIT_STATUS_NONE || proc->invalid == true)
        return;

    if (proc->debuff != proc->unk50) {
        proc->unk2C = 0;
        proc->unk44 = 0;
        proc->unk50 = proc->debuff;
    }

    /* seems like a interpolate-style function ? */
    ret = sub_80558F4(&proc->unk2C, &proc->unk44, proc->unk48);
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
        EfxStatusUnitSomePalModify(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_12:
        EfxStatusUnitSomePalModify(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        if (GetAISSubjectId(proc->anim) == EKR_BATTLE_LEFT)
            sub_80715F4(gUnknown_02022B88, gUnknown_020222A8, &gUnknown_020222A8[0x30],
                        &gUnknown_020222A8[0x180], 16, proc->red, 16);
        else
            sub_80715F4(gUnknown_02022BC8, gUnknown_02022308, &gUnknown_02022308[0x30],
                        &gUnknown_02022308[0x2A0], 16, proc->red, 16);

        RefreshEntityBmMaps();
        RefreshUnitSprites();
        MU_EndAll();
        break;

    case UNIT_STATUS_SILENCED:
        EfxStatusUnitSomePalModify(proc->anim, proc->red, proc->green, proc->blue);
        break;

    default:
        break;
    }

    EnablePaletteSync();
}

void EfxStatusUnitEnd(struct ProcEfxStatusUnit *proc)
{
    if (GetAISSubjectId(proc->anim) == EKR_BATTLE_LEFT)
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_BATTLE_LEFT], &PAL_COLOR(0x17, 0), 0x20);
    else
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_BATTLE_RIGHT], &PAL_COLOR(0x19, 0), 0x20);

    EnablePaletteSync();
}