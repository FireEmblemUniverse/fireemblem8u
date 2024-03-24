#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

struct ProcEfxFarAttack
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
};

extern struct ProcCmd gProc_efxFarAttack[];

//! FE8U = 0x080533D0
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg)
{
    struct ProcEfxFarAttack * proc;
    u32 val;

    switch (gEkrDistanceType)
    {
        case 1:
        case 2:
            proc = Proc_Start(gProc_efxFarAttack, PROC_TREE_3);
            proc->unk_29 = GetAnimPosition(anim);
            proc->unk_2c = 0;

            if (arg != -1)
            {
                proc->unk_2e = arg >> 1;
                proc->unk_30 = arg - (arg >> 1);
            }
            else
            {
                if (gEkrDistanceType == 1)
                {
                    proc->unk_2e = 5;
                    proc->unk_30 = 5;
                }
                else
                {
                    proc->unk_2e = 7;
                    proc->unk_30 = 7;
                }
            }

            if (gEkrDistanceType == 1)
            {
                val = 0x20;
            }
            else
            {
                val = 0xf0;
            }

            if (proc->unk_29 == 0)
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
            gUnknown_02017748 = 1;

            break;

        case 0:
        case 3:
        case 4:
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

    proc->unk_2c = 0;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08053514
void sub_8053514(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_SQUARE, proc->unk_32, proc->unk_34, proc->unk_2c, proc->unk_2e);
    gEkrBgPosition = ret;

    sub_80534AC(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_8053618(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        sub_805B034(gEkrBgPosition);
    }

    proc->unk_2c++;

    if (proc->unk_2c > proc->unk_2e)
    {
        proc->unk_2c = 1;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08053584
void sub_8053584(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_RSQUARE, proc->unk_36, proc->unk_38, proc->unk_2c, proc->unk_30);
    gEkrBgPosition = ret;

    sub_80534AC(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_8053618(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
    {
        sub_805B034(gEkrBgPosition);
    }

    proc->unk_2c++;

    if (proc->unk_2c > proc->unk_30)
    {

        if (!proc->unk_29)
        {
            gEkrInitPosReal = 1;
        }
        else
        {
            gEkrInitPosReal = 0;
        }

        gUnknown_02017748 = 0;

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

    if ((GetBanimDragonStatusType() == 2) || (GetBattleAnimArenaFlag() != 0))
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

struct EfxQuakeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 unk_3c;
    /* 3E */ s16 unk_3e;
    /* 40 */ int unk_40;
    /* 44 */ struct Vec2 * unk_44;
    /* 48 */ int unk_48;
    /* 4C */ STRUCT_PAD(0x4c, 0x5C);
    /* 5C */ struct Anim * unk_5c;
    /* 60 */ struct Anim * unk_60;
    /* 64 */ struct Anim * unk_64;
};

extern uintptr_t gUnknown_085B9804[];
extern struct ProcCmd gProc_efxQuakePure[];

//! FE8U = 0x08053678
ProcPtr NewEfxQuakePure(int index, int kind)
{
    struct EfxQuakeProc * proc = Proc_Start(gProc_efxQuakePure, PROC_TREE_3);

    proc->unk_44 = (struct Vec2 *)gUnknown_085B9804[index * 2];
    proc->unk_29 = (int)gUnknown_085B9804[index * 2 + 1];

    proc->unk_2a = kind;
    proc->unk_2c = 0;

    return proc;
}

//! FE8U = 0x080536B8
void sub_80536B8(struct EfxQuakeProc * proc)
{
    struct Vec2 * vec = proc->unk_44;

    if (vec[proc->unk_2c].x != INT16_MAX)
    {
        SetEkrBg2QuakeVec(vec[proc->unk_2c].x, vec[proc->unk_2c].y);
        proc->unk_2c++;
    }
    else
    {
        switch (proc->unk_2a)
        {
            case 0:
                proc->unk_2c = 0;
                SetEkrBg2QuakeVec(vec->x, vec->y);
                break;

            case 1:
                SetEkrBg2QuakeVec(0, 0);
                break;
        }
    }

    return;
}

extern struct ProcCmd ProcScr_EfxHitQuakePure[];

//! FE8U = 0x08053718
ProcPtr NewEfxHitQuakePure(void)
{
    return Proc_Start(ProcScr_EfxHitQuakePure, PROC_TREE_3);
}

//! FE8U = 0x0805372C
void nullsub_56(void)
{
    return;
}

extern struct ProcCmd gProc_efxQuake[];

extern struct Vec2 gUnknown_080DA4BA[];
extern struct Vec2 gUnknown_080DA5BA[];
extern struct Vec2 gUnknown_080DA526[];
extern struct Vec2 gUnknown_080DA604[];
extern struct Vec2 gUnknown_080DA66E[];

extern struct Vec2 gEfxQuakeVecs[];
extern struct Vec2 gEfxQuakeVecs2[];

//! FE8U = 0x08053678
ProcPtr NewEfxQuake(int kind)
{
    struct EfxQuakeProc * proc;

    if (gUnknown_02017748 == 1)
    {
        return NULL;
    }

    gUnknown_0201773C = 1;
    proc = Proc_Start(gProc_efxQuake, PROC_TREE_3);

    proc->unk_2c = 0;

    proc->unk_5c = gAnims[0];
    proc->unk_60 = gAnims[2];

    switch (kind)
    {
        case 0:
            proc->unk_44 = gUnknown_080DA4BA;
            proc->unk_29 = 0;

            break;

        case 1:
            proc->unk_44 = gEfxQuakeVecs;
            proc->unk_29 = 0;

            break;

        case 2:
            proc->unk_44 = gUnknown_080DA526;
            proc->unk_29 = 0;

            break;

        case 3:
            proc->unk_44 = gEfxQuakeVecs2;
            proc->unk_29 = 0;

            break;

        case 4:
            proc->unk_44 = gUnknown_080DA5BA;
            proc->unk_29 = 0;

            break;

        case 5:
            proc->unk_44 = gUnknown_080DA604;
            proc->unk_29 = 1;

            break;

        case 6:
            proc->unk_44 = gUnknown_080DA66E;
            proc->unk_29 = 1;

            break;

        default:
            proc->unk_44 = gUnknown_080DA4BA;
            proc->unk_29 = 0;

            break;
    }

    proc->unk_34 = 0;
    proc->unk_3c = 0;

    return proc;
}

//! FE8U = 0x0805382C
void sub_805382C(struct EfxQuakeProc * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    struct Vec2 * vec = proc->unk_44;

    if (vec[proc->unk_2c].x == INT16_MAX)
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
            BG_SetPosition(BG_3, proc->unk_34, proc->unk_3c);
            SetEkrBg2QuakeVec(0, 0);
        }

        gUnknown_0201773C = 0;
        Proc_End(proc);
    }
    else
    {
        SetEkrBg2QuakeVec(vec[proc->unk_2c].x, vec[proc->unk_2c].y);
        proc->unk_2c++;

        BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, proc->unk_34 + gEkrBg2QuakeVec.x, proc->unk_3c + gEkrBg2QuakeVec.y);
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
            case 0:
                SetEkrFrontAnimPostion(0, x1, y1);
                SetEkrFrontAnimPostion(1, x2, y2);
                break;

            case 1:
            case 2:
                if (GetAnimPosition(proc->unk_5c) == 0)
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

extern struct Vec2 gUnknown_080DA9F8[];
extern struct Vec2 gUnknown_080DAA8E[];
void sub_805AFA0(int, s16);

//! FE8U = 0x08053718
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind)
{
    s16 x;
    struct EfxQuakeProc * proc;
    struct Anim * anim;

    if (gUnknown_02017740 != 0)
    {
        return;
    }

    gUnknown_02017740 = 1;

    proc = Proc_Start(ProcScr_EfxHitQuake, PROC_TREE_3);

    proc->unk_5c = anim1;
    proc->unk_60 = anim2;
    proc->unk_2c = 0;
    proc->unk_29 = 1;

    if (kind == 0)
    {
        proc->unk_44 = gUnknown_080DA4BA;
    }
    else if (kind == 1)
    {
        proc->unk_44 = gEfxQuakeVecs;
    }
    else if (kind == 2)
    {
        proc->unk_44 = gUnknown_080DA526;
    }
    else if (kind == 3)
    {
        proc->unk_44 = gEfxQuakeVecs2;
    }
    else if (kind == 4)
    {
        proc->unk_44 = gUnknown_080DA9F8;
    }
    else if (kind == 5)
    {
        proc->unk_44 = gUnknown_080DAA8E;
    }
    else
    {
        proc->unk_44 = gUnknown_080DA4BA;
    }

    proc->unk_48 = 1;

    if (GetBanimDragonStatusType() != 0)
    {
        proc->unk_64 = 0;
        return;
    }

    if (GetBattleAnimArenaFlag() != 0)
    {
        proc->unk_64 = 0;
        return;
    }

    if (gEkrDistanceType == 0)
    {
        proc->unk_64 = 0;
        return;
    }

    x = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->unk_5c)];

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

void sub_805AE58(void *);

//! FE8U = 0x08053BBC
void sub_8053BBC(struct EfxQuakeProc * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    struct Vec2 * vec = proc->unk_44;

    if (vec[proc->unk_2c].x == INT16_MAX)
    {
        SetEkrBg2QuakeVec(0, 0);

        switch (gEkrDistanceType)
        {
            case 0:
                BG_SetPosition(BG_2, 0, 0);

                if (GetBanimDragonStatusType() != 0)
                {
                    BG_SetPosition(BG_3, 0, 0);
                }
                break;

            case 1:
            case 2:
                if (GetBanimDragonStatusType() != 0)
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

        gUnknown_02017740 = 0;

        if (proc->unk_29 == 1)
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

        if ((proc->unk_2c == 0) && (proc->unk_64 != NULL))
        {
            FillBGRect(GetAnimPosition(proc->unk_5c) * 15 + gBG2TilemapBuffer + 0x160, 0xf, 5, 0, 0);
        }

        x = vec[proc->unk_2c].x;
        y = vec[proc->unk_2c].y;

        SetEkrBg2QuakeVec(x, y);

        proc->unk_2c++;

        if (proc->unk_64 != NULL)
        {
            s16 hm = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->unk_5c)];

            struct Anim * anim = proc->unk_64;

            anim->xPosition = (proc->unk_36 + gEkrBg2QuakeVec.x) - hm;
            anim->yPosition = proc->unk_3e - gEkrBg2QuakeVec.y;
        }
        else
        {
            BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (proc->unk_29 == 1)
        {
            if (GetBanimDragonStatusType() != 0)
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
            case 0:
                SetEkrFrontAnimPostion(0, x1, y1);
                SetEkrFrontAnimPostion(1, x2, y2);

                break;

            case 1:
            case 2:
                if (GetAnimPosition(proc->unk_5c) == 0)
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
