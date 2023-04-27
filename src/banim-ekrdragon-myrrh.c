#include "global.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmmap.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"

extern struct Anim *gUnknown_02000000[4];

enum banim_myrrh {
    BANIM_INDEX_MYRRH_C3 = 0xC3,
    BANIM_INDEX_MYRRH_C4 = 0xC4,
    BANIM_INDEX_MYRRH_C5 = 0xC5,
    BANIM_INDEX_MYRRH_C6 = 0xC6,
};

void EfxDoMyrrhIntroAnim(struct Anim *anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon *proc = Proc_Start(ProcScr_EkrMyrrh, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}

void EkrMyr_PrepareBanimfx(struct ProcEkrDragon *proc)
{
    BattleAnim *banim = banim_data;
    struct Anim *anim = proc->anim;
    proc->timer = 0;

    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_C4);
    sub_805A07C(anim, 0);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_C4].pal, gPalBackupEkrUnitMaybe);

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
    Proc_Break(proc);
}

void EkrMyr_WaitForTransform(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;

    if (++proc->timer == 0x1A) {
        SomePlaySound_8071990(0xDC, 0x100);
        sub_8071AB0(0xDC, anim->xPosition, 1);
    }
    
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        SomePlaySound_8071990(0xDE, 0x100);
        sub_8071AB0(0xDE, anim->xPosition, 1);
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_C3);
        Proc_Break(proc);
    }
}

void EkrMyr_TrigerForPrepared(struct ProcEkrDragon *proc)
{
    (void)GetCoreAIStruct(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void EkrMyr_InBattleIdle(struct ProcEkrDragon *proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrMyr_ReturnToLoli(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    BattleAnim *banim = banim_data;

    if (sub_8058A60(2 * gUnknown_0203E152[GetAISSubjectId(anim)] + GetAISSubjectId(anim)) <= 0) {

        /* Transform from dragon to loli */
        proc->timer = 0;
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_C6);
        gEkrSpellAnimIndexLutMaybe[0] = -1;
        Proc_Break(proc);
        return;
    }

    SomePlaySound_8071990(0xDD, 0x100);
    sub_8071AB0(0xDD, anim->xPosition, 1);
    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_C5);
    sub_805A07C(anim, 0);
    Proc_Break(proc);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_C4].pal, gPalBackupEkrUnitMaybe);

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
}

void sub_8070AE4(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_C6);
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);

        if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
            SetEkrDragonStatusType(gUnknown_02000000[0], EKRDRGON_TYPE_NORMAL);
        else
            SetEkrDragonStatusType(gUnknown_02000000[2], EKRDRGON_TYPE_NORMAL);

        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrMyrrh[] = {
    PROC_SLEEP(0x3C),
    PROC_REPEAT(EkrMyr_PrepareBanimfx),
    PROC_REPEAT(EkrMyr_WaitForTransform),

PROC_LABEL(0),
    PROC_REPEAT(EkrMyr_TrigerForPrepared),
    PROC_REPEAT(EkrMyr_InBattleIdle),
    PROC_REPEAT(EkrMyr_ReturnToLoli),
    PROC_REPEAT(sub_8070AE4),
    PROC_END
};
