#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

// clang-format off

struct ProcCmd CONST_DATA gProc_efxFarAttack[] =
{
    PROC_NAME("efxFarAttack"),

    PROC_REPEAT(sub_80534E4),
    PROC_REPEAT(sub_8053514),
    PROC_REPEAT(sub_8053584),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080533D0
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg)
{
    struct ProcEfxFarAttack * proc;
    u32 val;

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            proc = Proc_Start(gProc_efxFarAttack, PROC_TREE_3);
            proc->pos = GetAnimPosition(anim);
            proc->timer = 0;

            if (arg != -1)
            {
                proc->unk_2e = arg >> 1;
                proc->terminator = arg - (arg >> 1);
            }
            else
            {
                if (gEkrDistanceType == EKR_DISTANCE_FAR)
                {
                    proc->unk_2e = 5;
                    proc->terminator = 5;
                }
                else
                {
                    proc->unk_2e = 7;
                    proc->terminator = 7;
                }
            }

            if (gEkrDistanceType == EKR_DISTANCE_FAR)
            {
                val = 0x20;
            }
            else
            {
                val = 0xf0;
            }

            if (proc->pos == POS_L)
            {
                proc->unk_32 = -val;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = 0;
            }
            else
            {
                proc->unk_32 = 0;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = -val;
            }

            gEkrBgPosition = proc->unk_32;
            gEfxFarAttackExist = 1;

            break;

        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_MONOCOMBAT:
        case EKR_DISTANCE_PROMOTION:
            break;
    }

    return;
}

//! FE8U = 0x080534AC
void sub_80534AC(struct ProcEfxFarAttack * unused, int x)
{
    struct Anim * anim = gAnims[0];
    x = -x;

    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[1];
    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[2];
    anim->xPosition = x + gEkrXPosReal[1];

    anim = gAnims[3];
    anim->xPosition = x + gEkrXPosReal[1];

    return;
}

//! FE8U = 0x080534E4
void sub_80534E4(struct ProcEfxFarAttack * proc)
{
    sub_80534AC(proc, proc->unk_32);
    EkrDragonTmCpyExt(proc->unk_32, 0);
    sub_8053618(proc->unk_32);

    proc->timer = 0;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08053514
void sub_8053514(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_SQUARE, proc->unk_32, proc->unk_34, proc->timer, proc->unk_2e);
    gEkrBgPosition = ret;

    sub_80534AC(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_8053618(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        sub_805B034(gEkrBgPosition);
    }

    proc->timer++;

    if (proc->timer > proc->unk_2e)
    {
        proc->timer = 1;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08053584
void sub_8053584(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_RSQUARE, proc->unk_36, proc->unk_38, proc->timer, proc->terminator);
    gEkrBgPosition = ret;

    sub_80534AC(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_8053618(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        sub_805B034(gEkrBgPosition);
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (proc->pos == POS_L)
            gEkrInitPosReal = POS_R;
        else
            gEkrInitPosReal = POS_L;

        gEfxFarAttackExist = false;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08053618
void sub_8053618(int xPos)
{
    u16 * p;
    int a;
    int x;

    if ((GetBanimDragonStatusType() == EKRDRGON_TYPE_DEMON_KING) || (GetBattleAnimArenaFlag() != 0))
    {
        return;
    }

    a = (xPos >> 3);
    x = xPos & 7;
    BG_SetPosition(BG_2, x, 0);

    p = gTmA_Banim + 33 + a;
    EfxTmCpyExt(p + 132, 66, gBG2TilemapBuffer, 32, 32, 20, -1, -1);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

// clang-format off

const s16 gUnknown_080DA4BA[] =
{
    +0, -1,
    +0, +0, 
    +0, +1, 
    +0, +0, 
    +0, -1, 
    +0, +0, 
    +1, +1, 
    +0, -1,
    INT16_MAX,
};

const s16 gEfxQuakeVecs[] =
{
    +1, +1,
    +0, +0,
    +0, +0,
    +0, +0,
    -1, -1,
    +0, +0,
    +0, +0,
    +1, +1,
    +0, +0,
    +0, +0,
    -1, -1,
    +0, +0,
    +1, +1,
    +0, +0,
    -1, -1,
    +0, +0,
    +1, +1,
    -1, -1,
    INT16_MAX,
};

const s16 gUnknown_080DA526[] =
{
    +2, +2,
    +0, +0,
    +0, +0,
    +0, +0,
    -2, -2,
    +0, +0,
    +0, +0,
    +2, +2,
    +0, +0,
    +0, +0,
    -2, -2,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    +2, +2,
    -2, -2,
    INT16_MAX,
};

const s16 gEfxQuakeVecs2[] =
{
    +3, +3,
    +0, +0,
    +0, +0,
    +0, +0,
    -3, -3,
    +0, +0,
    +0, +0,
    +3, +3,
    +0, +0,
    +0, +0,
    -3, -3,
    +0, +0,
    +3, +3,
    +0, +0,
    -3, -3,
    +0, +0,
    +3, +3,
    -3, -3,
    INT16_MAX,
};

const s16 gUnknown_080DA5BA[] =
{
    +6, +6,
    +0, +0,
    +0, +0,
    +0, +0,
    -6, -6,
    +0, +0,
    +0, +0,
    +6, +6,
    +0, +0,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    -6, -6,
    INT16_MAX,
};

const s16 gUnknown_080DA604[] =
{
    +9, +9,
    +0, +0,
    +0, +0,
    +0, +0,
    -9, -9,
    +0, +0,
    +0, +0,
    +9, +9,
    +0, +0,
    +0, +0,
    -9, -9,
    +0, +0,
    +9, +9,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    +6, +6,
    -6, -6,
    +3, +3,
    -3, -3,
    INT16_MAX,
};

const s16 gUnknown_080DA66E[] =
{
    +9, +9,
    +0, +0,
    +0, +0,
    +0, +0,
    -9, -9,
    +0, +0,
    +0, +0,
    +9, +9,
    +0, +0,
    +0, +0,
    -9, -9,
    +0, +0,
    +9, +9,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    +6, +6,
    -6, -6,
    +0, +0,
    +3, +3,
    +0, +0,
    -3, -3,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    +1, +1,
    +0, +0,
    -1, -1,
    +0, +0,
    +1, +1,
    +0, +0,
    -1, -1,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA720[] =
{
    +3, +3,
    +0, +0,
    -3, -3,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA732[] =
{
    +8, +8,
    +0, +0,
    -8, -8,
    +0, +0,
    +7, +7,
    +0, +0,
    -7, -7,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA754[] =
{
    +1, +1,
    +0, +0,
    -1, -1,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA766[] =
{
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA778[] =
{
    +3, +3,
    +0, +0,
    -3, -3,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA78A[] =
{
    +0, +3,
    +0, +0,
    +0, -3,
    +0, +0,
    +0, +5,
    +0, +0,
    +0, -5,
    +0, +0,
    +0, +2,
    +0, +0,
    +0, -2,
    +0, +0,
    +0, +4,
    +0, +0,
    +0, -4,
    +0, +0,
    +0, +3,
    +0, +0,
    +0, -3,
    +0, +0,
    +0, +5,
    +0, +0,
    +0, -5,
    +0, +0,
    +0, +2,
    +0, +0,
    +0, -2,
    +0, +0,
    +0, +4,
    +0, +0,
    +0, -4,
    +0, +0,
    +0, +3,
    +0, +0,
    +0, -3,
    +0, +0,
    +0, +2,
    +0, +0,
    +0, -2,
    +0, +0,
    +0, +1,
    +0, +0,
    +0, -1,
    +0, +0,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA840[] =
{
    -1, -1,
    +0, +0,
    +1, +1,
    +0, +0,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA852[] =
{
    +2, +2,
    -1, -1,
    +1, +1,
    -2, -2,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA864[] =
{
    +2, +2,
    -1, -1,
    +1, +1,
    -2, -2,
    INT16_MAX,
};

const s16 gQuakeVecs_080DA876[] =
{
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +4,
    +0, +4,
    +0, -4,
    +0, -4,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +3,
    +0, +3,
    +0, -3,
    +0, -3,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +2,
    +0, +2,
    +0, -2,
    +0, -2,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    +0, +1,
    +0, +1,
    +0, -1,
    +0, -1,
    INT16_MAX,
};

const s16 gUnknown_080DA9F8[] =
{
    +6, +6,
    +0, +0,
    +0, +0,
    +0, +0,
    -6, -6,
    +0, +0,
    +0, +0,
    +6, +6,
    +0, +0,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    -4, -4,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +0, +0,
    +1, +1,
    +0, +0,
    -1, -1,
    INT16_MAX,
};

const s16 gUnknown_080DAA8E[] =
{
    +10, +10,
    +0, +0,
    +0, +0,
    +0, +0,
    -10, -10,
    +0, +0,
    +0, +0,
    +0, +0,
    +10, +10,
    +0, +0,
    +0, +0,
    +0, +0,
    -10, -10,
    +0, +0,
    +0, +0,
    +0, +0,
    +8, +8,
    +0, +0,
    +0, +0,
    -8, -8,
    +0, +0,
    +8, +8,
    +0, +0,
    -8, -8,
    +0, +0,
    +8, +8,
    +0, +0,
    +0, +0,
    -8, -8,
    +0, +0,
    +8, +8,
    +0, +0,
    -8, -8,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +6, +6,
    +0, +0,
    -6, -6,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +4, +4,
    +0, +0,
    -4, -4,
    +0, +0,
    +2, +2,
    +0, +0,
    -2, -2,
    +2, +2,
    +0, +0,
    -2, -2,
    INT16_MAX,
};

struct ProcCmd CONST_DATA ProcScr_efxQuakePure[] =
{
    PROC_NAME("efxQuakePure"),
    PROC_REPEAT(efxQuakePure_Loop),
    PROC_END,
};

const void * CONST_DATA EfxQuakePureVecs[] =
{
    gUnknown_080DA4BA, 0,
    gEfxQuakeVecs, 0,
    gUnknown_080DA526, 0,
    gEfxQuakeVecs2, 0,
    gUnknown_080DA5BA, 0,
    gUnknown_080DA604, 0,
    gQuakeVecs_080DA720, 0,
    gQuakeVecs_080DA732, 0,
    gQuakeVecs_080DA754, 0,
    gQuakeVecs_080DA766, 0,
    gQuakeVecs_080DA778, 0,
    gQuakeVecs_080DA78A, 0,
    gQuakeVecs_080DA840, 0,
    gQuakeVecs_080DA852, 0,
    gQuakeVecs_080DA864, 0,
    gQuakeVecs_080DA876, 0,
};

ProcPtr NewEfxQuakePure(int index, int kind)
{
    struct ProcEfxQuake * proc = Proc_Start(ProcScr_efxQuakePure, PROC_TREE_3);

    proc->vec = (s16 *)EfxQuakePureVecs[index * 2];
    proc->quake_ui = (int)EfxQuakePureVecs[index * 2 + 1];

    proc->kind = kind;
    proc->timer = 0;

    return proc;
}

void efxQuakePure_Loop(struct ProcEfxQuake * proc)
{
    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] != INT16_MAX)
    {
        SetEkrBg2QuakeVec(vec[proc->timer * 2 + 0], vec[proc->timer * 2 + 1]);
        proc->timer++;
    }
    else
    {
        switch (proc->kind) {
        case 0:
            proc->timer = 0;
            SetEkrBg2QuakeVec(vec[0], vec[1]);
            break;

        case 1:
            SetEkrBg2QuakeVec(0, 0);
            break;
        }
    }
}

struct ProcCmd CONST_DATA ProcScr_EfxHitQuakePure[] =
{
    PROC_NAME("efxHitQuakePure"),
    PROC_REPEAT(efxHitQuakePure_Loop_Null),
    PROC_END,
};

ProcPtr NewEfxHitQuakePure(void)
{
    return Proc_Start(ProcScr_EfxHitQuakePure, PROC_TREE_3);
}

void efxHitQuakePure_Loop_Null(void)
{
    return;
}

struct ProcCmd CONST_DATA ProcScr_efxQuake[] =
{
    PROC_NAME("efxQuake"),
    PROC_REPEAT(efxQuake_Loop),
    PROC_END,
};

ProcPtr NewEfxQuake(int kind)
{
    struct ProcEfxQuake * proc;

    if (gEfxFarAttackExist == 1)
    {
        return NULL;
    }

    gEfxQuakeExist = 1;
    proc = Proc_Start(ProcScr_efxQuake, PROC_TREE_3);

    proc->timer = 0;

    proc->anim_l = gAnims[0];
    proc->anim_r = gAnims[2];

    switch (kind) {
    case 0:
        proc->vec = gUnknown_080DA4BA;
        proc->quake_ui = 0;

        break;

    case 1:
        proc->vec = gEfxQuakeVecs;
        proc->quake_ui = 0;

        break;

    case 2:
        proc->vec = gUnknown_080DA526;
        proc->quake_ui = 0;

        break;

    case 3:
        proc->vec = gEfxQuakeVecs2;
        proc->quake_ui = 0;

        break;

    case 4:
        proc->vec = gUnknown_080DA5BA;
        proc->quake_ui = 0;

        break;

    case 5:
        proc->vec = gUnknown_080DA604;
        proc->quake_ui = 1;

        break;

    case 6:
        proc->vec = gUnknown_080DA66E;
        proc->quake_ui = 1;

        break;

    default:
        proc->vec = gUnknown_080DA4BA;
        proc->quake_ui = 0;

        break;
    }

    proc->ix = 0;
    proc->iy = 0;

    return proc;
}

//! FE8U = 0x0805382C
void efxQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        BG_SetPosition(BG_2, 0, 0);

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, proc->ix, proc->iy);
            SetEkrBg2QuakeVec(0, 0);
        }

        gEfxQuakeExist = 0;
        Proc_End(proc);
    }
    else
    {
        SetEkrBg2QuakeVec(vec[proc->timer * 2 + 0], vec[proc->timer * 2 + 1]);
        proc->timer++;

        BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, proc->ix + gEkrBg2QuakeVec.x, proc->iy + gEkrBg2QuakeVec.y);
        }

        if (GetBanimDragonStatusType() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            SetEkrFrontAnimPostion(0, x1, y1);
            SetEkrFrontAnimPostion(1, x2, y2);
            break;

        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            if (GetAnimPosition(proc->anim_l) == 0)
                SetEkrFrontAnimPostion(0, x1, y1);
            else
                SetEkrFrontAnimPostion(1, x2, y2);

            break;
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EfxHitQuake[] =
{
    PROC_NAME("efxHitQuake"),
    PROC_REPEAT(efxHitQuake_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08053718
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind)
{
    s16 x;
    struct ProcEfxQuake * proc;
    struct Anim * anim;

    if (gEfxHitQuakeExist != 0)
    {
        return;
    }

    gEfxHitQuakeExist = 1;

    proc = Proc_Start(ProcScr_EfxHitQuake, PROC_TREE_3);

    proc->anim_l = anim1;
    proc->anim_r = anim2;
    proc->timer = 0;
    proc->quake_ui = 1;

    if (kind == 0)
    {
        proc->vec = gUnknown_080DA4BA;
    }
    else if (kind == 1)
    {
        proc->vec = gEfxQuakeVecs;
    }
    else if (kind == 2)
    {
        proc->vec = gUnknown_080DA526;
    }
    else if (kind == 3)
    {
        proc->vec = gEfxQuakeVecs2;
    }
    else if (kind == 4)
    {
        proc->vec = gUnknown_080DA9F8;
    }
    else if (kind == 5)
    {
        proc->vec = gUnknown_080DAA8E;
    }
    else
    {
        proc->vec = gUnknown_080DA4BA;
    }

    proc->unk_48 = 1;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (GetBattleAnimArenaFlag() != 0)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->unk_64 = NULL;
        return;
    }

    x = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)];

    if (GetAnimPosition(anim1) == 0)
    {
        proc->unk_36 = 64;
        proc->unk_3e = 104;
        anim = AnimCreate(gUnknown_085C7338, 5);
    }
    else
    {
        proc->unk_36 = 176;
        proc->unk_3e = 104;
        anim = AnimCreate(gUnknown_085C72AC, 5);
    }

    anim->xPosition = proc->unk_36 - x;
    anim->yPosition = proc->unk_3e;

    if (gUnknown_0201775C == 1)
    {
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(1) + OAM2_PAL(3);
    }
    else
    {
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(3) + OAM2_PAL(3);
    }

    proc->unk_64 = anim;

    RegisterDataMove(gUnknown_0200003C[GetAnimPosition(anim1)], (void *)0x06011800, 0x800);

    if (gEkrSpellAnimIndex[GetAnimPosition(anim2)] == 0x39)
    {
        CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim2)], gEfxTerrainPalette, PLTT_SIZE_4BPP);
    }

    CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim1)], gPaletteBuffer + 0x130, PLTT_SIZE_4BPP);
    EnablePaletteSync();

    sub_805AFA0(gEkrDistanceType, GetAnimPosition(anim1));
    sub_8053618(gEkrBgPosition);

    return;
}

//! FE8U = 0x08053BBC
void efxHitQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        SetEkrBg2QuakeVec(0, 0);

        switch (gEkrDistanceType)
        {
            case EKR_DISTANCE_CLOSE:
                BG_SetPosition(BG_2, 0, 0);

                if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
                {
                    BG_SetPosition(BG_3, 0, 0);
                }
                break;

            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_FARFAR:
                if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
                {
                    BG_SetPosition(BG_3, 0, 0);
                }

                sub_8053618(gEkrBgPosition);

                break;
        }

        if (proc->unk_64 != NULL)
        {
            AnimDelete(proc->unk_64);
            sub_805AE58(&gUnknown_0201FADC);
        }

        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        gEfxHitQuakeExist = 0;

        if (proc->quake_ui == 1)
        {
            if (GetBanimDragonStatusType() != 0)
            {
                BG_SetPosition(BG_3, 0, 0);
            }

            BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
            EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
            EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        }

        Proc_End(proc);
    }
    else
    {
        int x;
        int y;

        if ((proc->timer == 0) && (proc->unk_64 != NULL))
        {
            FillBGRect(GetAnimPosition(proc->anim_l) * 15 + gBG2TilemapBuffer + 0x160, 0xf, 5, 0, 0);
        }

        x = vec[proc->timer * 2 + 0];
        y = vec[proc->timer * 2 + 1];

        SetEkrBg2QuakeVec(x, y);

        proc->timer++;

        if (proc->unk_64 != NULL)
        {
            s16 hm = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)];

            struct Anim * anim = proc->unk_64;

            anim->xPosition = (proc->unk_36 + gEkrBg2QuakeVec.x) - hm;
            anim->yPosition = proc->unk_3e - gEkrBg2QuakeVec.y;
        }
        else
        {
            BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (proc->quake_ui == 1)
        {
            if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
            {
                BG_SetPosition(BG_3, -x, y);
            }

            BG_SetPosition(BG_0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
            EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
            EkrDispUP_SetPositionSync(
                -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
        }

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (GetBanimDragonStatusType() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType)
        {
            case EKR_DISTANCE_CLOSE:
                SetEkrFrontAnimPostion(0, x1, y1);
                SetEkrFrontAnimPostion(1, x2, y2);

                break;

            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_FARFAR:
                if (GetAnimPosition(proc->anim_l) == 0)
                {
                    SetEkrFrontAnimPostion(0, x1, y1);
                }
                else
                {
                    SetEkrFrontAnimPostion(1, x2, y2);
                }
                break;
        }
    }

    return;
}
