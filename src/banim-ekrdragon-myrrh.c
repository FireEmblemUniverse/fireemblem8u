#include "global.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmmap.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"

extern struct Anim *gAnims[4];

enum banim_myrrh {
    BANIM_INDEX_MYRRH_MAIN = 0xC4,
    BANIM_INDEX_MYRRH_INTRO = 0xC5,
    BANIM_INDEX_MYRRH_EXIT = 0xC6,
    BANIM_INDEX_MYRRH_NOWPN = 0xC7,
};

void NewEkrDragonManakete(struct Anim *anim)
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

    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_INTRO - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPalBackupEkrUnitMaybe);

    if (GetAnimPosition(anim) == EKR_POS_L)
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
        EfxPlaySE(0xDC, 0x100);
        M4aPlayWithPostionCtrl(0xDC, anim->xPosition, 1);
    }

    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EfxPlaySE(0xDE, 0x100);
        M4aPlayWithPostionCtrl(0xDE, anim->xPosition, 1);
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_MAIN - 1);
        Proc_Break(proc);
    }
}

void EkrMyr_TrigerForPrepared(struct ProcEkrDragon *proc)
{
    (void)GetAnimAnotherSide(proc->anim);
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

    if (GetEfxHp(2 * gEfxPairHpBufOffset[GetAnimPosition(anim)] + GetAnimPosition(anim)) <= 0) {

        /* Transform from dragon to loli */
        proc->timer = 0;
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        gEkrSpellAnimIndex[0] = -1;
        Proc_Break(proc);
        return;
    }

    EfxPlaySE(0xDD, 0x100);
    M4aPlayWithPostionCtrl(0xDD, anim->xPosition, 1);
    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_EXIT - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    Proc_Break(proc);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPalBackupEkrUnitMaybe);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
}

void sub_8070AE4(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);

        if (GetAnimPosition(anim) == EKR_POS_L)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        else
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);

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
