#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

CONST_DATA struct ProcCmd ProcScr_efxWeaponIcon[] = {
    PROC_NAME("efxWeaponIcon"),
    PROC_MARK(0xA),
    PROC_SET_END_CB(sub_8054F78),
    PROC_REPEAT(sub_8054F10),
    PROC_END
};

const u16 gUnknown_080DAD0A[] = {
    0x0, 0x1,
    0x4, 0x2,
    0x7, 0x1,
    0xA, 0x1,
    0xD, 0x1,
    0x10, 0x2,
    0xD, 0x3,
    0xA, 0x3,
    0x7, 0x4,
    0x4, 0x5,
    0x0, 0x9,
    0xFFFE
};

void NewEfxWeaponIcon(s16 effective1, s16 effective2)
{
    struct ProcEfxWeaponIcon *proc;
    proc = Proc_Start(ProcScr_efxWeaponIcon, PROC_TREE_3);

    proc->unk2C = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DAD0A;
    proc->unk4C = 0;
    proc->unk50 = 0;
    proc->unk54 = effective1;
    proc->unk58 = effective2;

    gpProcEfxWeaponIcon = proc;
}

void EndProcEfxWeaponIcon(void)
{
    if (gpProcEfxWeaponIcon != NULL) {
        Proc_End(gpProcEfxWeaponIcon);
        gpProcEfxWeaponIcon = NULL;
    }
}

void EfxWeaponIconSet50(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->unk50 = true;
}

void EfxWeaponIconClear50(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->unk50 = false;
}

void sub_8054F10(struct ProcEfxWeaponIcon *proc)
{
    int ret;

    if (true == proc->unk50)
        return;
    
    ResetIconGraphics_();
    ret = SpellFx_InterpretBgAnimScript(&proc->unk2C, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0)
        proc->unk4C = ret;
    
    if (proc->unk54 != 0) {
        LoadIconPalette(0, 0x1D);
        sub_807132C(PAL_BG(0), 0x1D, 0x1, proc->unk4C);
    }

    if (proc->unk58 != 0) {
        LoadIconPalette(0, 0x1E);
        sub_807132C(PAL_BG(0), 0x1E, 0x1, proc->unk4C);
    }

    EnablePaletteSync();
}

void sub_8054F78(struct ProcEfxWeaponIcon *proc)
{
    ResetIconGraphics_();

    if (proc->unk54 != 0)
        LoadIconPalette(0, 0x1D);
    
    if (proc->unk58 != 0)
        LoadIconPalette(0, 0x1E);
    
    EnablePaletteSync();
}

CONST_DATA struct ProcCmd ProcScr_efxSpellCast[] = {
    PROC_NAME("efxSpellCast"),
    PROC_MARK(0xA),
    PROC_REPEAT(sub_8055038),
    PROC_REPEAT(sub_805509C),
    PROC_REPEAT(sub_80550DC),
    PROC_END
};

void NewEfxSpellCast(void)
{
    struct ProcEfxSpellCast *proc;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
        return;
    
    proc = Proc_Start(ProcScr_efxSpellCast, PROC_TREE_4);
    proc->unk29 = 0;
    proc->unk2C = 0;
    proc->unk2E = 4;

    if (NULL == gpProcEfxSpellCast)
        CpuFastCopy(PAL_BG(0x6), gPalBackupEkrUnitMaybe, 0x140);
    else
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}

void EfxSpellCastSet29(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;
    
    gpProcEfxSpellCast->unk29 = true;
}

void EndEfxSpellCast(void)
{
    ProcPtr proc = gpProcEfxSpellCast;

    if (NULL == proc)
        return;
    
    gpProcEfxSpellCast = NULL;

#if BUGFIX
    Proc_End(proc);
#else
    /* What a horrible bug.... */
    Proc_End(NULL);
#endif
}

void sub_8055038(struct ProcEfxSpellCast *proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x8, proc->unk2C, proc->unk2E);
    
    CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_BG(0x6), 0x140);
    EkrMaybePalFadeWithVal(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->unk2C == (proc->unk2E + 1))
        Proc_Break(proc);
}

void sub_805509C(struct ProcEfxSpellCast *proc)
{
    CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_BG(0x6), 0x140);
    EkrMaybePalFadeWithVal(PAL_BG(0x0), 0x6, 0xA, 0x8);

    if (true == proc->unk29) {
        proc->unk2C = 0;
        Proc_Break(proc);
    }
}

void sub_80550DC(struct ProcEfxSpellCast *proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0x8, 0, proc->unk2C, proc->unk2E);

    CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_BG(0x6), 0x140);
    EkrMaybePalFadeWithVal(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->unk2C == (proc->unk2E + 1)) {
        gpProcEfxSpellCast = NULL;
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_BG(0x6), 0x140);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}
