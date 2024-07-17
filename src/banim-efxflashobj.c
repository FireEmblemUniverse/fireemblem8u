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
    PROC_MARK(PROC_MARK_EFX_BGCOL),
    PROC_SET_END_CB(sub_8054F78),
    PROC_REPEAT(sub_8054F10),
    PROC_END
};

const u16 gFrameLut_EfxWeaponIcon[] = {
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

    proc->timer = 0;
    proc->frame = 0;
    proc->frame_lut = gFrameLut_EfxWeaponIcon;
    proc->unk4C = 0;
    proc->invalid = false;
    proc->eff1 = effective1;
    proc->eff2 = effective2;

    gpProcEfxWeaponIcon = proc;
}

void EndProcEfxWeaponIcon(void)
{
    if (gpProcEfxWeaponIcon != NULL) {
        Proc_End(gpProcEfxWeaponIcon);
        gpProcEfxWeaponIcon = NULL;
    }
}

void DisableEfxWeaponIcon(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->invalid = true;
}

void EnableEfxWeaponIcon(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->invalid = false;
}

void sub_8054F10(struct ProcEfxWeaponIcon *proc)
{
    int ret;

    if (true == proc->invalid)
        return;
    
    ResetIconGraphics_();
    ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_lut);
    if (ret >= 0)
        proc->unk4C = ret;

    if (proc->eff1 != 0) {
        LoadIconPalette(0, 0x1D);
        EfxPalWhiteInOut(PAL_BG(0), 0x1D, 0x1, proc->unk4C);
    }

    if (proc->eff2 != 0) {
        LoadIconPalette(0, 0x1E);
        EfxPalWhiteInOut(PAL_BG(0), 0x1E, 0x1, proc->unk4C);
    }

    EnablePaletteSync();
}

void sub_8054F78(struct ProcEfxWeaponIcon *proc)
{
    ResetIconGraphics_();

    if (proc->eff1 != 0)
        LoadIconPalette(0, 0x1D);
    
    if (proc->eff2 != 0)
        LoadIconPalette(0, 0x1E);
    
    EnablePaletteSync();
}

CONST_DATA struct ProcCmd ProcScr_efxSpellCast[] = {
    PROC_NAME("efxSpellCast"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),
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
    proc->done = 0;
    proc->timer = 0;
    proc->terminator = 4;

    if (NULL == gpProcEfxSpellCast)
        CpuFastCopy(PAL_BG(0x6), gPal_Banim, 0x140);
    else
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}

void RegisterEfxSpellCastEnd(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;
    
    gpProcEfxSpellCast->done = true;
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
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x8, proc->timer, proc->terminator);
    
    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void sub_805509C(struct ProcEfxSpellCast *proc)
{
    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, 0x8);

    if (true == proc->done) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void sub_80550DC(struct ProcEfxSpellCast *proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0x8, 0, proc->timer, proc->terminator);

    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1)) {
        gpProcEfxSpellCast = NULL;
        CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}
