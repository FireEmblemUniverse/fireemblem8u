#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gUnknown_085D6644[];

//! FE8U = 0x080608A4
void StartSpellAnimFenrir(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D6644, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080608E0
void sub_80608E0(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        sub_8060A9C(anim, 100);
        sub_8060B7C(anim, 100);

        NewefxRestRST(anim, 100, 2, 0x100, 1);
        NewEfxRestWINH_(anim, 105, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 70, 15, 16, 0, 0);

        PlaySFX(0x130, 0x100, 120, 0);

        return;
    }

    if (proc->timer == duration + 40)
    {
        sub_8060C18(anim, 74);
        PlaySFX(0x131, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 110)
    {
        sub_8060CAC(anim);
    }
    else if (proc->timer == duration + 111)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 139)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 153)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 167)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 181)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 195)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 209)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 238)
    {
        NewEfxFlashBgWhite(anim, 10);
        sub_8060E90(anim);

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        PlaySFX(0x133, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 248)
    {
        sub_8060D3C(anim);
        NewEfxALPHA(anim, 18, 8, 16, 0, 0);
    }
    else if ((proc->timer != duration + 290) && (proc->timer == duration + 300))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D665C[];
extern u16 gUnknown_08651DF4[];
extern u16 gUnknown_08652734[];

//! FE8U = 0x08060A9C
void sub_8060A9C(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D665C, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(gUnknown_08651DF4, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(gUnknown_08652734, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(2);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08060B2C
void sub_8060B2C(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08060B48
void sub_8060B48(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;
    gLCDControlBuffer.bgoffset[BG_1].x--;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxFenrirBGCOL[];
extern u16 gUnknown_08652554[];
extern u16 gUnknown_080DD70C[];

//! FE8U = 0x08060B7C
void sub_8060B7C(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD70C;

    proc->pal = gUnknown_08652554;
    SpellFx_RegisterBgPal(gUnknown_08652554, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08060BC4
void sub_8060BC4(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x08060BD4
void sub_8060BD4(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }

    proc->timer2++;

    if (proc->timer2 > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D66A4[];
extern u32 gUnknown_0865C7D4[];
extern u16 gUnknown_0865BAB8[];
extern u16 gUnknown_0865AF3C[];

//! FE8U = 0x08060C18
void sub_8060C18(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D66A4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0865C7D4, gUnknown_0865C7D4, gUnknown_0865C7D4, gUnknown_0865C7D4);

    SpellFx_RegisterObjPal(gUnknown_0865BAB8, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0865AF3C, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060C78
void sub_8060C78(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxFenrirBG2[];

extern u16 * gUnknown_085D67A0[];
extern u16 * gUnknown_085D66D4[];

extern u16 gUnknown_086568F4[];

extern u16 gUnknown_080DD76A[];

//! FE8U = 0x08060CAC
void sub_8060CAC(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD76A;

    proc->tsal = gUnknown_085D67A0;
    proc->tsar = gUnknown_085D67A0;
    proc->img = gUnknown_085D66D4;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_086568F4, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

extern u16 gUnknown_08656914[];

//! FE8U = 0x08060D3C
void sub_8060D3C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DCD72;

    proc->tsal = gUnknown_085D55B4;
    proc->tsar = gUnknown_085D55B4;
    proc->img = gUnknown_085D5560;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_08656914, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

//! FE8U = 0x08060DC4
void sub_8060DC4(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }

            BG_EnableSyncByMask(BG1_SYNC_BIT);
        }
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxFenrirOBJ2[];

extern u16 gUnknown_0865BAD8[];

//! FE8U = 0x08060E90
void sub_8060E90(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 0;

    SpellFx_RegisterObjPal(gUnknown_0865BAD8, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0865AF3C, 0x1000);

    return;
}

//! FE8U = 0x08060ED8
void sub_8060ED8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        proc->timer = 0;

        sub_8060F24(proc->anim, proc->unk44++);

        proc->terminator++;

        if (proc->terminator == 8)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D6884[];

extern int gUnknown_085D689C[];

extern u32 gUnknown_0865C77C[];
extern u32 gUnknown_0865C7A8[];

//! FE8U = 0x08060F24
void sub_8060F24(struct Anim * anim, int idx)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6884, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 30;

    proc->unk44 = gUnknown_085D689C[idx & 7];

    otherAnim = NULL;

    switch (idx & 1)
    {
        case 0:
            otherAnim = AnimCreate(gUnknown_0865C77C, 0x78);
            proc->anim2 = otherAnim;

            break;

        case 1:
            otherAnim = AnimCreate(gUnknown_0865C7A8, 0x78);
            proc->anim2 = otherAnim;

            break;
    }

    otherAnim->oam2Base = 0x2840;
    otherAnim->xPosition = anim->xPosition;
    proc->unk32 = anim->xPosition;
    otherAnim->yPosition = anim->yPosition;
    proc->unk3A = anim->yPosition;

    return;
}

//! FE8U = 0x08060FA4
void sub_8060FA4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 300, proc->timer, proc->terminator);

    int x = (ret * gSinLookup[proc->unk44]) >> 12;
    int y = (ret * gSinLookup[proc->unk44 + 0x40]) >> 12;

    anim->xPosition = x + proc->unk32;
    anim->yPosition = y + proc->unk3A;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}