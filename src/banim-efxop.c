#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"

extern ProcPtr gpProcefxopCur;
extern ProcPtr gUnknown_0203E1EC;

//! FE8U = 0x0806E8F0
void sub_806E8F0(void)
{
    gpProcefxopCur = NULL;
    gUnknown_0203E1EC = NULL;

    return;
}

//! FE8U = 0x0806E904
void sub_806E904(void)
{
    if (gpProcefxopCur != NULL)
    {
        Proc_End(gpProcefxopCur);
        gpProcefxopCur = NULL;
    }

    return;
}

//! FE8U = 0x0806E920
void sub_806E920(void)
{
    if (gUnknown_0203E1EC != NULL)
    {
        Proc_End(gUnknown_0203E1EC);
        gUnknown_0203E1EC = NULL;
    }

    return;
}

//! FE8U = 0x0806E93C
void SetGlbProcefxopCur(ProcPtr proc)
{
    gpProcefxopCur = proc;
    return;
}

//! FE8U = 0x0806E948
void sub_806E948(ProcPtr proc)
{
    gUnknown_0203E1EC = proc;
    return;
}

//! FE8U = 0x0806E954
struct AnimMagicFxBuffer * sub_806E954(struct Anim * anim)
{
    return ((struct AnimBuffer *)(anim->pUnk44))->unk_30;
}

//! FE8U = 0x0806E95C
void sub_806E95C(struct Anim * anim, struct AnimMagicFxBuffer * magicFx)
{
    s16 x;
    s16 y;

    if (GetAnimPosition(anim) == 0)
    {
        x = anim->xPosition - BanimTypesPosLeft[0];
    }
    else
    {
        x = BanimTypesPosRight[0] - anim->xPosition;
    }

    y = 88 - anim->yPosition;

    BG_SetPosition(magicFx->bg, x - magicFx->xOffsetBg, y - magicFx->yOffsetBg);

    return;
}

//! FE8U = 0x0806E9B4
void sub_806E9B4(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastFill(0, magicFx->bgTmBuf, 0x800);
    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806E9E4
struct Anim * sub_806E9E4(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB)
{
    struct Anim * newAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    if (scrIdx == 0)
    {
        newAnim = AnimCreate(scrA, 120);
    }
    else
    {
        newAnim = AnimCreate(scrB, 120);
    }

    newAnim->oam2Base = (magicFx->objPalId << 12) | magicFx->objChr | OAM2_LAYER(2);
    newAnim->xPosition = anim->xPosition;
    newAnim->yPosition = anim->yPosition;

    return newAnim;
}

//! FE8U = 0x0806EA38
void sub_806EA38(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed)
{
    void * buf;
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    if (isCompressed == 1)
    {
        LZ77UnCompWram(src, magicFx->bgTsaBuf);
    }

    buf = src;

    if (isCompressed == 1)
    {
        buf = magicFx->bgTsaBuf;
    }

    if (notFlipped == 0)
    {
        EfxTmCpyBgHFlip(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }
    else
    {
        EfxTmCpyBG(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }

    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806EAA4
void sub_806EAA4(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    void * dst = (void *)(0x6000000 + magicFx->bgChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->bgImgBuf);
    RegisterDataMove(magicFx->bgImgBuf, dst, 0x2000);

    return;
}

//! FE8U = 0x0806EAD4
void sub_806EAD4(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastCopy(src, gPaletteBuffer + (magicFx->bgPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x0806EAFC
void sub_806EAFC(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    void * dst = (void *)(0x6010000 + magicFx->objChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->objImgBuf);
    RegisterDataMove(magicFx->objImgBuf, dst, 0x1000);

    return;
}

//! FE8U = 0x0806EB2C
void sub_806EB2C(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastCopy(src, gPaletteBuffer + 0x100 + (magicFx->objPalId * 0x10), 0x20);
    EnablePaletteSync();

    return;
}

typedef void (*SpellAnimFunc)(struct Anim * anim);
extern SpellAnimFunc gpEfxopFuncLut[];

//! FE8U = 0x0806EB54
void ExecEfxop(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    gpEfxopFuncLut[magicFx->magicFuncIdx](anim);

    return;
}

//! FE8U = 0x0806EB78
void nullsub_73(void)
{
    return;
}

extern struct ProcCmd ProcScr_efxopFire[];

//! FE8U = 0x0806EB7C
void NewEfxopFire(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopFire, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806EB9C
void sub_806EB9C(struct ProcEfx * proc)
{
    NewEfxopFireBG(proc->anim, proc);
    NewEfxopFireOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}

extern struct ProcCmd ProcScr_efxopFireBG[];

extern u16 gUnknown_080DF644[];
extern u16 * gUnknown_085D9494[];

//! FE8U = 0x0806EBBC
void NewEfxopFireBG(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopFireBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF644;
    proc->tsal = gUnknown_085D9494;

    sub_806EAD4(anim, gUnknown_085F6230);
    sub_806EAA4(proc->anim, gUnknown_085F5638);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EC1C
void sub_806EC1C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxopFireOBJ[];

extern u32 gUnknown_085F843C[];
extern u32 gUnknown_085F80B4[];
extern u16 gUnknown_085F7D64[];
extern u16 gUnknown_085F7768[];

//! FE8U = 0x0806EC68
void NewEfxopFireOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopFireOBJ, parent);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_085F843C, gUnknown_085F80B4);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition - 8;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition + 8;
    }

    frontAnim->yPosition = anim->yPosition + 8;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, gUnknown_085F7D64);
    sub_806EAFC(proc->anim, gUnknown_085F7768);

    return;
}

//! FE8U = 0x0806ECE8
void sub_806ECE8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxopThunder[];

//! FE8U = 0x0806ED0C
void NewEfxopThunder(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopThunder, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806ED2C
void sub_806ED2C(struct ProcEfx * proc)
{
    sub_806ED54(proc->anim, proc);
    sub_806EE34(proc->anim, proc);
    sub_806EEA8(proc->anim, proc);

    Proc_Break(proc);

    return;
}

extern struct ProcCmd ProcScr_efxopThunderBG[];

extern u16 gUnknown_080DF6A8[];

extern u16 * gUnknown_085D951C[];

//! FE8U = 0x0806ED54
void sub_806ED54(struct Anim * anim, struct ProcEfx * unused)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopThunderBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF6A8;

    proc->tsal = gUnknown_085D951C;

    sub_806EAD4(anim, gUnknown_085F367C);
    sub_806EAA4(proc->anim, gUnknown_085F2DC0);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EDB0
void sub_806EDB0(struct ProcEfxBG * proc)
{
    u16 chr = 0;
    struct AnimMagicFxBuffer * magicFx = (void *)sub_806E954(proc->anim);

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 0, *(tsaL + ret), 1);

        if (ret == 0)
        {
            chr = magicFx->bgChr + 31;
        }

        if (ret == 1)
        {
            chr = magicFx->bgChr + 80;
        }

        FillBGRect(magicFx->bgTmBuf + 0x1E, 2, 20, magicFx->bgPalId, chr);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxopThunderBGCOL[];

extern u16 gUnknown_080DF6C6[];

extern u16 gUnknown_085F367C[];

//! FE8U = 0x0806EE34
void sub_806EE34(struct Anim * anim, struct ProcEfx * unused)
{
    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopThunderBGCOL, PROC_TREE_3);

    sub_806E948(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF6C6;

    proc->pal = gUnknown_085F367C;

    return;
}

//! FE8U = 0x0806EE68
void sub_806EE68(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        sub_806EAD4(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E920();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxopThunderOBJ[];

extern u32 gUnknown_085F5550[];
extern u32 gUnknown_085F4A24[];

//! FE8U = 0x0806EEA8
void sub_806EEA8(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopThunderOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_085F5550, gUnknown_085F4A24);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition + 56;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition - 56;
    }

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, Pal_BoltingSprites);
    sub_806EAFC(proc->anim, Img_BoltingSprites);

    return;
}

//! FE8U = 0x0806EF24
void sub_806EF24(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxopLive[];

//! FE8U = 0x0806EF48
void NewEfxopLive(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLive, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806EF64
void sub_806EF64(struct ProcEfx * proc)
{
    sub_806F184(proc->anim, proc);
    sub_806EFB8(proc->anim, proc);
    sub_806F058(proc->anim, proc);

    SetBlendAlpha(0, 16);

    sub_806F0CC(proc->anim, 1, 12, 0, proc);
    sub_806F0CC(proc->anim, 35, 25, 1, proc);

    Proc_Break(proc);

    return;
}

extern struct ProcCmd ProcScr_efxopLiveBG[];

extern u16 gUnknown_080DF730[];

extern u16 * gUnknown_085D959C[];

extern u16 gUnknown_0866F5E4[];

//! FE8U = 0x0806EFB8
void sub_806EFB8(struct Anim * anim, struct ProcEfx * unused)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLiveBG, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF730;

    proc->tsal = gUnknown_085D959C;

    sub_806EAA4(anim, gUnknown_0866F5E4);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F00C
void sub_806F00C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 1, *(tsaL + ret), 0);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxopLiveBGCOL[];

extern u16 gUnknown_080DF748[];
extern u16 gUnknown_086700D4[];

//! FE8U = 0x0806F058
void sub_806F058(struct Anim * anim, struct ProcEfx * unused)
{
    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopLiveBGCOL, PROC_TREE_3);
    sub_806E948(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF748;

    proc->pal = gUnknown_086700D4;

    return;
}

//! FE8U = 0x0806F08C
void sub_806F08C(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        sub_806EAD4(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E920();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxopLiveALPHA[];

//! FE8U = 0x0806F0CC
void sub_806F0CC(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused)
{
    struct ProcEfxALPHA * proc = Proc_Start(ProcScr_efxopLiveALPHA, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = timer;
    proc->unk2E = c;

    proc->unk29 = d;

    return;
}

//! FE8U = 0x0806F0FC
void sub_806F0FC(struct ProcEfxALPHA * proc)
{
    if (--proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806F118
void sub_806F118(struct ProcEfxALPHA * proc)
{
    int bldA;

    if (proc->timer > proc->unk2E)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->unk29 == 0)
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
    }
    else
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
    }

    SetBlendAlpha(bldA, 16);

    proc->timer++;

    return;
}

extern struct ProcCmd ProcScr_efxopLiveOBJ[];

//! FE8U = 0x0806F184
void sub_806F184(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopLiveOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    scr = gUnknown_08675114;
    frontAnim = sub_806E9E4(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, Pal_FimbulvetrSprites_Snow);
    sub_806EAFC(proc->anim, gUnknown_086702D4);

    return;
}

//! FE8U = 0x0806F1E8
void sub_806F1E8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxopLightning[];

//! FE8U = 0x0806F210
void NewEfxopLightning(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLightning, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F230
void sub_806F230(struct ProcEfx * proc)
{
    sub_806F248(proc->anim, proc);
    Proc_Break(proc);
    return;
}

extern struct ProcCmd ProcScr_efxopLightningBG[];

extern u16 * gUnknown_085D9638[];
extern u16 * gUnknown_085D96BC[];
extern u16 * gUnknown_085D9740[];

extern u16 gUnknown_080DF7CE[];

//! FE8U = 0x0806F248
void sub_806F248(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLightningBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF7CE;

    proc->tsal = gUnknown_085D9740;
    proc->tsar = gUnknown_085D9740;

    proc->img = gUnknown_085D9638;
    proc->pal = gUnknown_085D96BC;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F2A0
void sub_806F2A0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EAD4(proc->anim, *(pal + ret));
        sub_806EA38(proc->anim, 0, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D97C4[];

extern u16 gUnknown_080DF866[];

extern u16 * gUnknown_085D97DC[];
extern u16 * gUnknown_085D9880[];

//! FE8U = 0x0806F304
void sub_806F304(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D97C4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF866;

    proc->tsal = gUnknown_085D97DC;
    proc->tsar = gUnknown_085D97DC;
    proc->img = gUnknown_085D9880;

    proc->terminator = 0;

    sub_806EAD4(anim, gUnknown_0862A2D0);

    if (GetAnimPosition(proc->anim) == 0)
    {
        gLCDControlBuffer.bgoffset[BG_1].x += 4;
    }
    else
    {
        gLCDControlBuffer.bgoffset[BG_1].x -= 4;
    }

    gLCDControlBuffer.bgoffset[BG_1].y += 8;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

extern struct ProcCmd gUnknown_085D97C4[];

extern u16 gUnknown_080DF898[];

//! FE8U = 0x0806F38C
void sub_806F38C(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D97C4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF898;

    proc->tsal = gUnknown_085D97DC;
    proc->tsar = gUnknown_085D97DC;
    proc->img = gUnknown_085D9880;

    proc->terminator = 1;

    sub_806EAD4(anim, gUnknown_0862A2F0);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    SetBlendAlpha(10, 7);

    return;
}

//! FE8U = 0x0806F3F8
void sub_806F3F8(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EA38(proc->anim, proc->terminator, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D9924[];
extern u32 FramScr_Unk5D4F90[];

//! FE8U = 0x0806F450
void sub_806F450(struct Anim * anim, struct ProcEfx * parent)
{
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9924, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    proc->anim2 = sub_806E9E4(anim, 1, scr, scr);

    return;
}

extern struct ProcCmd gUnknown_085D996C[];

//! FE8U = 0x0806F47C
struct ProcEfxOBJ * sub_806F47C(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D996C, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    frontAnim = sub_806E9E4(anim, 0, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition -= 4;

    return proc;
}

void sub_806F4B4(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806F4C0
void sub_806F4C0(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862D6A8;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_Orb);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F4F8
void sub_806F4F8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862D82C;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_Tendrils);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F530
void sub_806F530(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862DCE0;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_SigilVoid);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F568
void sub_806F568(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862DC24;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;
    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F594
void sub_806F594(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        u32 * scr = gUnknown_0862DC58;

        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}

extern struct ProcCmd ProcScr_efxopMistyrain[];

//! FE8U = 0x0806F5BC
void NewEfxopMistyrain(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMistyrain, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806F5E0
void sub_806F5E0(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        sub_806F304(proc->anim, proc);
    }

    if (proc->timer == 16)
    {
        sub_806F450(proc->anim, proc);
    }

    if (proc->timer == 75)
    {
        proc->unk_64 = sub_806F47C(proc->anim, proc);
    }

    if (proc->timer == 94)
    {
        sub_806F38C(proc->anim, proc);
    }

    if (proc->timer == 114)
    {
        Proc_End(proc->unk_64);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxopMyrrh[];

//! FE8U = 0x0806F648
void NewEfxopMyrrh(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMyrrh, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F668
void sub_806F668(ProcPtr proc)
{
    struct BattleAnim * banim = banim_data;
    LZ77UnCompWram(banim[197 - 1].pal, gPalBackupEkrUnitMaybe);

    CpuFastCopy(gPalBackupEkrUnitMaybe + 0x10, gPaletteBuffer + 0x120, 0x20);
    CpuFastCopy(gPalBackupEkrUnitMaybe + 0x10, gPaletteBuffer + 0x130, 0x20);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

extern struct ProcCmd gUnknown_085D99EC[];

//! FE8U = 0x0806F6B4
void sub_806F6B4(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D99EC, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F6D4
void sub_806F6D4(struct ProcEfx * proc)
{
    sub_806F7C0(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F6EC
void sub_806F6EC(struct ProcEfx * proc)
{
    sub_806F704(proc->anim, proc);
    Proc_Break(proc);
    return;
}

extern struct ProcCmd gUnknown_085D9A1C[];

extern u16 gUnknown_080DF954[];
extern u16 * gUnknown_085D9A2C[];
extern u16 * gUnknown_085D9A94[];
extern u16 * gUnknown_085D9AFC[];

//! FE8U = 0x0806F704
void sub_806F704(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D9A1C, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF954;

    proc->tsal = gUnknown_085D9A94;
    proc->img = gUnknown_085D9A2C;
    proc->pal = gUnknown_085D9AFC;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F75C
void sub_806F75C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EAD4(proc->anim, *(pal + ret));
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D9B64[];

//! FE8U = 0x0806F7C0
void sub_806F7C0(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * unused = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9B64, parent);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_086C978C, gUnknown_086C95C0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 24;

    sub_806EB2C(proc->anim, gUnknown_086C93FC);
    sub_806EAFC(proc->anim, gUnknown_086C90A4);

    return;
}

//! FE8U = 0x0806F820
void sub_806F820(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 60)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D9B74[];

//! FE8U = 0x0806F844
void sub_806F844(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D9B74, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F864
void sub_806F864(struct ProcEfx * proc)
{
    sub_806F968(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F87C
void sub_806F87C(struct ProcEfx * proc)
{
    sub_806F894(proc->anim, proc);
    Proc_Break(proc);
    return;
}

extern struct ProcCmd gUnknown_085D9BA4[];

extern u16 gUnknown_080DF9BE[];

extern u16 * gUnknown_085D9BB4[];
extern u16 * gUnknown_085D9C00[];

//! FE8U = 0x0806F894
void sub_806F894(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D9BA4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF9BE;

    proc->tsal = gUnknown_085D9C00;
    proc->img = gUnknown_085D9BB4;

    sub_806EAD4(anim, Pal_StoneBg);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F8F0
void sub_806F8F0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
        sub_806EAA4(proc->anim, *(img + ret));

        if (ret == 17)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_086C792C, PLTT_SIZE_4BPP);
        }

        if (ret == 18)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_086C794C, PLTT_SIZE_4BPP);
        }
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D9C4C[];

//! FE8U = 0x0806F968
void sub_806F968(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * unused = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9C4C, parent);

    proc->anim = anim;
    proc->timer = 0;

    scr = gUnknown_086BDA5C;
    frontAnim = sub_806E9E4(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 12;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);

    AnimSort();

    sub_806EB2C(proc->anim, Pal_StoneSprites);
    sub_806EAFC(proc->anim, Img_StoneSprites);

    return;
}

//! FE8U = 0x0806F9D8
void sub_806F9D8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 200)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
