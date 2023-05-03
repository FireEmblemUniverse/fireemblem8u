#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"
#include "ekrdragon.h"
#include "constants/items.h"

/* Banim hp-bar change effect */

extern struct Anim *gAnims[4];

int sub_80522CC(void)
{
    if (gEkrHPBarCount == 0 && gUnknown_0201772C == 0)
        return true;
    else
        return false;
}

short EkrEfxIsUnitHittedNow(int pos)
{
    return gEkrHitEfxBool[pos];
}

/* During dmage, cause hp bar change value effect */
void NewEfxHPBar(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;
    int ais_id = GetAISSubjectId(anim);

    if (0x400 & GetAnimRoundType((anim->nextRoundId - 1) * 2 + ais_id) || gEkrHPBarCount != 0)
        return;

    gEkrHPBarCount = 1;

    proc = Proc_Start(ProcScr_efxHPBar, PROC_TREE_3);
    proc->anim64 = anim;

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT) {
        proc->anim5C = gAnims[EKR_BATTLE_RIGHT * 2];
        proc->anim60 = gAnims[EKR_BATTLE_LEFT * 2];
    } else {
        proc->anim5C = gAnims[EKR_BATTLE_LEFT * 2];
        proc->anim60 = gAnims[EKR_BATTLE_RIGHT * 2];
    }

    val1 = gEfxPairHpBufOffset[GetAISSubjectId(proc->anim60)];
    val2 = val1 + 1;

    proc->pre = GetEfxHp(val1 * 2 + GetAISSubjectId(proc->anim60));
    proc->post = GetEfxHp(val2 * 2 + GetAISSubjectId(proc->anim60));

    if (proc->pre > proc->post)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->pos = 0;
    proc->max = proc->pre;
    proc->timer = 0;
    proc->init = false;
    gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 1;
}

void EfxHp_BarDeclineWithDeathJudge(struct ProcEfxHPBar *proc)
{
    struct Anim *anim1 = gAnims[GetAISSubjectId(proc->anim60) * 2];
    struct Anim *anim2 = gAnims[GetAISSubjectId(proc->anim60) * 2 + 1];

    if (proc->init == false) {
        if (++proc->pos == 2) {
            proc->pos = 0;
            proc->max += proc->diff;
            gEkrPairHpInitial[GetAISSubjectId(proc->anim60)] += proc->diff;

            if (proc->max == proc->post)
                proc->init = true;
        }
    }

    if (proc->timer == 0x1E && proc->init == true) {
        gEfxPairHpBufOffset[GetAISSubjectId(proc->anim60)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 0;
    
        if (proc->post == 0) {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = EkrCheckSomeDeathMaybe(gEkrPids[GetAISSubjectId(anim1)]);

            if (ret == true)
                NewEfxDeadEvent(anim1, anim2);
            else {
                PlaySound8FForArenaMaybe();
                NewEfxDead(anim1, anim2);
                gEkrPairSideVaild[GetAISSubjectId(proc->anim60)] = false;
            }
        }

        Proc_Break(proc);
        return;
    }

    if (++proc->timer >= 0x1Eu)
        proc->timer = 0x1E;
}

void efxHPBarMain(struct ProcEfxHPBar *proc)
{
    struct Anim *anim;

    if (gUnknown_0201774C == 0 && gUnknown_0201772C == 0) {
        proc->pos = 0;
        proc->max = 1;
        anim = GetCoreAIStruct(proc->anim64);

        if (sub_805A21C(sub_805A2F0(anim)) == 1) {
            switch (gEkrDistanceType) {
            case EKR_DISTANCE_CLOSE:
            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_3:
            case EKR_DISTANCE_PROMOTION:
                proc->max = 16;
                NewEfxFarAttackWithDistance(GetCoreAIStruct(anim), -1);
                break;

            case EKR_DISTANCE_FARFAR:
                proc->max = 20;
                NewEfxFarAttackWithDistance(GetCoreAIStruct(anim), -1);
                break;
            }
        }

        Proc_Break(proc);
    }
}

void efxHPBarWaitForFarFarCamMoveMaybe(struct ProcEfxHPBar *proc)
{
    if (++proc->pos == (proc->max - 4)) {
        GetCoreAIStruct(proc->anim64);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    } else if (proc->pos == proc->max){
        gEkrHPBarCount--;
        Proc_Break(proc);
    }
}

void NewEfxHPBarResire(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;

    if (gEkrHPBarCount != 0)
        return;

    gEkrHPBarCount = 1;

    proc = Proc_Start(ProcScr_efxHPBarResire, PROC_TREE_3);
    proc->anim64 = GetCoreAIStruct(anim);

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT) {
        proc->anim5C = gAnims[EKR_BATTLE_RIGHT * 2];
        proc->anim60 = gAnims[EKR_BATTLE_LEFT * 2];
    } else {
        proc->anim5C = gAnims[EKR_BATTLE_LEFT * 2];
        proc->anim60 = gAnims[EKR_BATTLE_RIGHT * 2];
    }

    val1 = gEfxPairHpBufOffset[GetAISSubjectId(proc->anim60)];
    val2 = val1 + 1;

    proc->pre = GetEfxHp(val1 * 2 + GetAISSubjectId(proc->anim60));
    proc->post = GetEfxHp(val2 * 2 + GetAISSubjectId(proc->anim60));

    if (proc->pre > proc->post)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->death = false;
    proc->pos = 0;
    proc->max = proc->pre;
    proc->timer = 0;
    proc->init = false;
    gUnknown_02017750 = 0;
    gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 1;
}

void EfxHPBarResire_80526C8(struct ProcEfxHPBar *proc)
{
    GetAISSubjectId(proc->anim60);
    GetAISSubjectId(proc->anim60);

    if (proc->init == false) {
        if (++proc->pos == 2) {
            proc->pos = 0;
            proc->max += proc->diff;
            gEkrPairHpInitial[GetAISSubjectId(proc->anim60)] += proc->diff;

            if (proc->max == proc->post)
                proc->init = true;
        }
    }

    if (proc->timer == 0x54 && proc->init == true) {
        gEfxPairHpBufOffset[GetAISSubjectId(proc->anim60)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 0;

        if (proc->post == 0)
            proc->death = true;

        proc->pos = 0;
        proc->max = 10;
        gUnknown_02017750 = 1;

        Proc_Break(proc);
        return;
    }

    if (++proc->timer >= 0x54u)
        proc->timer = 0x54;
}

void EfxHPBarResire_8052788(struct ProcEfxHPBar *proc)
{
    int val1;
    s16 val2;

    if (++proc->pos <= proc->max)
        return;

    val1 = gEfxPairHpBufOffset[GetAISSubjectId(proc->anim5C)];
    val2 = val1 + 1;

    proc->pre = GetEfxHp(val1 * 2 + GetAISSubjectId(proc->anim5C));
    proc->post = GetEfxHp(val2 * 2 + GetAISSubjectId(proc->anim5C));

    proc->pos = 0;
    proc->max = proc->pre;
    proc->timer = 0;
    proc->init = false;

    if (proc->pre == proc->post)
        proc->init = true;

    if (proc->pre > proc->post)
        proc->diff = -1;
    else
        proc->diff = 1;

    Proc_Break(proc);
    gEkrHitEfxBool[GetAISSubjectId(proc->anim5C)] = 2;
}

void EfxHPBarResire_805282C(struct ProcEfxHPBar *proc)
{
    struct Anim *anim1, *anim2, *anim3, *anim4;

    anim1 = gAnims[GetAISSubjectId(proc->anim5C) * 2];
    anim2 = gAnims[GetAISSubjectId(proc->anim5C) * 2 + 1];
    anim3 = gAnims[GetAISSubjectId(proc->anim60) * 2];
    anim4 = gAnims[GetAISSubjectId(proc->anim60) * 2 + 1];

    if (proc->init == false) {
        if (++proc->pos == 4) {
            proc->pos = 0;
            proc->max += proc->diff;
            gEkrPairHpInitial[GetAISSubjectId(proc->anim5C)] += proc->diff;
            SomePlaySound_8071990(0x75, 0x100);
            M4aPlayWithPostionCtrl(0x75, anim1->xPosition, 1);

            if (proc->max == proc->post)
                proc->init = true;
        }
    }

    if (proc->timer == 30 && proc->init == true) {
        gEfxPairHpBufOffset[GetAISSubjectId(proc->anim5C)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim5C)] = 0;
    
        if (proc->death == true) {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = EkrCheckSomeDeathMaybe(gEkrPids[GetAISSubjectId(anim3)]);

            if (ret == true)
                NewEfxDeadEvent(anim3, anim4);
            else {
                PlaySound8FForArenaMaybe();
                NewEfxDead(anim3, anim4);
                gEkrPairSideVaild[GetAISSubjectId(proc->anim60)] = false;
            }
        }
    
        Proc_Break(proc);
        return;
    }

    if (++proc->timer >= 0x1Eu)
        proc->timer = 0x1E;
}

void NewEfxAvoid(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;

    if (gEkrHPBarCount != 0)
        return;

    gEkrHPBarCount = 1;

    proc = Proc_Start(ProcScr_EfxAvoid, PROC_TREE_3);
    proc->pos = 0;

    if (GetAISSubjectId(anim) == 0) {
        proc->anim5C = gAnims[2];
        proc->anim60 = gAnims[0];
    } else {
        proc->anim5C = gAnims[0];
        proc->anim60 = gAnims[2];
    }

    NewEfxDamageMojiEffect(proc->anim60, 1);
    proc->anim64 = anim;
    proc->death = false;
    SomePlaySound_8071990(0xD7, 0x100);
    M4aPlayWithPostionCtrl(0xD7, anim->xPosition, 1);
}

void EfxAvoidMain(struct ProcEfxHPBar *proc)
{
    if (++proc->pos == 0x1E)
        Proc_Break(proc);
}

void NewEfxHPBarLive(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;

    if (gEkrHPBarCount != 0)
        return;

    gEkrHPBarCount = 1;

    proc = Proc_Start(ProcScr_efxHPBarLive, PROC_TREE_3);


    if (GetAISSubjectId(anim) == 0) {
        proc->anim5C = gAnims[2];
        proc->anim60 = gAnims[0];
    } else {
        proc->anim5C = gAnims[0];
        proc->anim60 = gAnims[2];
    }

    val1 = gEfxPairHpBufOffset[GetAISSubjectId(proc->anim60)];
    val2 = val1 + 1;

    proc->pre = GetEfxHp(val1 * 2 + GetAISSubjectId(proc->anim60));
    proc->post = GetEfxHp(val2 * 2 + GetAISSubjectId(proc->anim60));

    proc->timer = 0;
    proc->init = false;
    
    if (proc->pre == proc->post)
        proc->init = true;
    else if (proc->pre > proc->post)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->pos = 0;
    proc->max = proc->pre;
    proc->anim64 = anim;
    gEkrHitEfxBool[GetAISSubjectId(proc->anim5C)] = 2;
}

void EfxHPBarLiveMain(struct ProcEfxHPBar *proc)
{
    struct Anim *anim = proc->anim60;

    if (proc->init == false) {
        if (++proc->pos == 4) {
            proc->pos = 0;
            proc->max += proc->diff;
            gEkrPairHpInitial[GetAISSubjectId(anim)] += proc->diff;

            SomePlaySound_8071990(0x75, 0x100);
            M4aPlayWithPostionCtrl(0x75, anim->xPosition, 1);

            if (proc->max == proc->post)
                proc->init = true;
        }
    }

    if (proc->timer == 0x1E && proc->init == true) {
        gEfxPairHpBufOffset[GetAISSubjectId(anim)]++;
        gEkrHitEfxBool[GetAISSubjectId(anim)] = 0;
        Proc_Break(proc);
        return;
    }

    if (++proc->timer >= 0x1Eu)
        proc->timer = 0x1E;
}

void NewEfxNoDmage(struct Anim *anim1, struct Anim *anim2, int death)
{
    struct BattleUnit *bu;
    struct ProcEfxHPBar *proc;
    int ais_id = GetAISSubjectId(anim1);

    if (0x400 & GetAnimRoundType((anim1->nextRoundId - 1) * 2 + ais_id))
        return;

    if (GetAISSubjectId(anim1) == 0)
        bu = gpEkrBattleUnitRight;
    else
        bu = gpEkrBattleUnitLeft;

    if (GetItemIndex(bu->weaponBefore) != ITEM_MONSTER_STONE) {
        gEkrHPBarCount++;
        proc = Proc_Start(ProcScr_efxNoDamage, PROC_TREE_3);
        proc->anim5C = anim1;
        proc->anim60 = anim2;
        proc->pos = 0;
        proc->death = death;
        proc->anim64 = anim1;
        NewEfxDamageMojiEffect(proc->anim5C, 0);
        NewEfxNoDamageYure(proc->anim5C, proc->anim60);
    }
}

void EfxNoDamageMain(struct ProcEfxHPBar *proc)
{
    s32 val;
    struct Anim *anim = GetCoreAIStruct(proc->anim5C);

    ++proc->pos;
    val = proc->pos;
    if (val == 8) {
        gEfxPairHpBufOffset[GetAISSubjectId(proc->anim5C)]++;
    
        if (proc->death == true)
            gEfxPairHpBufOffset[GetAISSubjectId(anim)]++;
    
        Proc_Break(proc);
    }
}

void NewEfxNoDamageYure(struct Anim *anim1, struct Anim *anim2)
{
    struct ProcEfxHPBar *proc = Proc_Start(ProcScr_efxNoDamageYure, PROC_TREE_3);
    proc->anim5C = anim1;
    proc->anim60 = anim2;
    proc->pos = 0;
    proc->max = 0;
}

void EfxNoDamageYureMain(struct ProcEfxHPBar *proc)
{
    s16 val1;
    struct Anim *anim1 = proc->anim5C;
    struct Anim *anim2 = proc->anim60;

    if (gEfxNoDmgBgShakeOff[proc->pos] == -1) {
        if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL) {
            anim1->xPosition = gEkrXPosBase[GetAISSubjectId(proc->anim5C)] - gEkrBgXOffset;
            anim2->xPosition = gEkrXPosBase[GetAISSubjectId(proc->anim60)] - gEkrBgXOffset;
        }

        Proc_Break(proc);
    } else {
        if (GetAISSubjectId(anim1) == 1)
            val1 = -gEfxNoDmgBgShakeOff[proc->pos];
        else
            val1 = gEfxNoDmgBgShakeOff[proc->pos];

        if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL) {
            anim1->xPosition = gEkrXPosBase[GetAISSubjectId(proc->anim5C)] - (s32)gEkrBgXOffset + val1;
            anim2->xPosition = gEkrXPosBase[GetAISSubjectId(proc->anim60)] - (s32)gEkrBgXOffset + val1;
        }
        proc->pos++;
    }
}

void NewEfxStatusCHG(struct Anim *anim)
{
    struct ProcEfxHPBar *proc;

    if (gEkrHPBarCount == 0) {
        gEkrHPBarCount = 1;
        proc = Proc_Start(ProcScr_efxStatusCHG, PROC_TREE_3);
        proc->pos = 0;
        proc->anim64 = anim;
    }
}

void EfxStatusCHGMain(struct ProcEfxHPBar *proc)
{
    if (++proc->pos == 0x11)
        Proc_Break(proc);
}

/**
 * section.data
 */

CONST_DATA struct ProcCmd ProcScr_efxHPBar[] = {
    PROC_NAME("efxHPBar"),
    PROC_REPEAT(EfxHp_BarDeclineWithDeathJudge),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_efxHPBarResire[] = {
    PROC_NAME("efxHPBarResire"),
    PROC_REPEAT(EfxHPBarResire_80526C8),
    PROC_REPEAT(EfxHPBarResire_8052788),
    PROC_REPEAT(EfxHPBarResire_805282C),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EfxAvoid[] = {
    PROC_NAME("efxAvoid"),
    PROC_REPEAT(EfxAvoidMain),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_efxHPBarLive[] = {
    PROC_NAME("efxHPBarLive"),
    PROC_REPEAT(EfxHPBarLiveMain),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_efxNoDamage[] = {
    PROC_NAME("efxNoDamage"),
    PROC_REPEAT(EfxNoDamageMain),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_efxNoDamageYure[] = {
    PROC_NAME("efxNoDamageYure"),
    PROC_REPEAT(EfxNoDamageYureMain),
    PROC_END
};

const s16 gEfxNoDmgBgShakeOff[] = {
    0, 1, 2, 3, 2, 1, 0,
    0, 0, 0, 0, 0, 0, -1
};

CONST_DATA struct ProcCmd ProcScr_efxStatusCHG[] = {
    PROC_NAME("efxStatusCHG"),
    PROC_MARK(0xA),
    PROC_REPEAT(EfxStatusCHGMain),
    PROC_REPEAT(efxHPBarMain),
    PROC_REPEAT(efxHPBarWaitForFarFarCamMoveMaybe),
    PROC_END
};
