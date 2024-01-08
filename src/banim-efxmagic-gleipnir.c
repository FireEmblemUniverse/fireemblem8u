#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

extern int gUnknown_0201FB28;

extern struct ProcCmd gUnknown_085D8318[];

//! FE8U = 0x08068B80
void sub_8068B80(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D8318, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08068BB8
void sub_8068BB8(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            sub_8068D78();
        }
    }
    else if (proc->timer == duration + 34)
    {
        sub_80692B0(anim);
        PlaySFX(0x3ac, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 96)
    {
        sub_8069488(anim);
        sub_8069AC4(anim);
    }
    else if (proc->timer == duration + 206)
    {
        sub_8069E88(anim);
    }
    else if (proc->timer == duration + 302)
    {
        NewEfxFlashBgWhite(anim, 10);

        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            sub_8068D9C();
        }

        NewEfxSpellCast();

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 308)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 312)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 9);
        StartSubSpell_efxGespenstBG4(anim, 30);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x3AD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 328)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 8);
    }
    else if (proc->timer == duration + 353)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08068D20
void sub_8068D20(struct ProcEfx * proc)
{
    int ret = Interpolate(INTERPOLATE_SQUARE, 4, 16, proc->timer, 16);

    EfxPalBlackInOut(gPaletteBuffer, 6, 10, ret);
    EnablePaletteSync();

    proc->timer++;

    if (proc->timer == 17)
    {
        proc->timer = 0;
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D8330[];

//! FE8U = 0x08068D78
void sub_8068D78(void)
{
    struct ProcEfx * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D8330, PROC_TREE_3);
    proc->timer = 0;

    return;
}

//! FE8U = 0x08068D9C
void sub_8068D9C(void)
{
    if (gBanimGackgroundIndex == 0)
    {
        EfxChapterMapFadeOUT(4);
    }
    else
    {
        PutBanimBgPAL(gBanimGackgroundIndex - 1);
        EfxPalBlackInOut(gPaletteBuffer, 6, 10, 0);
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x08068DD8
void sub_8068DD8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 0xd);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068E14
void sub_8068E14(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 0xc);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068E50
void sub_8068E50(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 0xb);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068E8C
void sub_8068E8C(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 0xa);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068EC8
void sub_8068EC8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 9);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068F04
void sub_8068F04(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 8);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068F40
void sub_8068F40(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 7);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068F7C
void sub_8068F7C(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 6);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068FB8
void sub_8068FB8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 5);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08068FF4
void sub_8068FF4(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 4);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x08069030
void sub_8069030(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 3);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x0806906C
void sub_806906C(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 2);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x080690A8
void sub_80690A8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnknown_0201FB28;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnknown_0201FB28 - tmp2), 1);

        REG_BG1VOFS = -gUnknown_0201FB28 - result;
    }

    return;
}

//! FE8U = 0x080690E4
void sub_80690E4(void)
{
    u16 vcount = REG_VCOUNT + 1;
    REG_BG1VOFS = -gUnknown_0201FB28;
    return;
}

//! FE8U = 0x08069100
void sub_8069100(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    switch (proc->frame)
    {
        case 1:
            switch (proc->timer)
            {
                case 0:
                    SetPrimaryHBlankHandler(sub_8068E8C);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(sub_8068DD8);
                    break;
            }

            break;

        case 2:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(sub_80690E4);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(sub_8068F40);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(sub_8068F04);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(sub_8068E8C);
                    break;
            }

            break;

        case 3:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(sub_80690E4);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(sub_8068F7C);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(sub_8068F04);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(sub_8068F7C);
                    break;
            }

            break;

        case 4:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(sub_8068FF4);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(sub_80690E4);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(sub_8068FB8);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(sub_8068FF4);
                    break;
            }

            break;

        case 5:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(sub_8069030);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(sub_80690E4);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(sub_8069030);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(sub_806906C);
                    break;
            }

            break;

        default:
            SetPrimaryHBlankHandler(sub_80690E4);
            break;
    }

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        proc->terminator = ret;
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            SetPrimaryHBlankHandler(NULL);
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkGradoBG01[];

extern u16 * gUnknown_085D8348[];
extern u16 * gUnknown_085D8374[];

extern u16 gUnknown_086A66D8[];

extern u16 gUnknown_080DEDBC[];

//! FE8U = 0x080692B0
void sub_80692B0(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    gUnknown_0201FB28 = 0x10;

    proc = Proc_Start(ProcScr_efxDarkGradoBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DEDBC;

    proc->tsal = gUnknown_085D8348;
    proc->tsar = gUnknown_085D8348;
    proc->img = gUnknown_085D8374;

    SpellFx_RegisterBgPal(gUnknown_086A66D8, 0x20);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 0x18, -16);
        }
        else
        {
            BG_SetPosition(1, -0x18, -16);
        }
    }
    else
    {
        BG_SetPosition(1, 0, -16);
    }

    SpellFx_SetSomeColorEffect();

    return;
}

void sub_80696F0(void);

//! FE8U = 0x0806935C
void sub_806935C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 0x14);
    }
    else
    {
        if (ret == -6)
        {
            sub_80696F0();
            proc->frame++;
        }
        else if (ret == -1)
        {
            Proc_Break(proc);
        }
    }

    return;
}

extern u16 * gUnknown_085D8478[];
extern u16 * gUnknown_085D847C[];

extern u16 gUnknown_086B52CC[];

extern u16 gUnknown_080DEE40[];

//! FE8U = 0x080693CC
void sub_80693CC(struct ProcEfxBG * proc)
{
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DEE40;

    proc->tsal = gUnknown_085D8478;
    proc->img = gUnknown_085D847C;

    SpellFx_RegisterBgPal(gUnknown_086B52CC, 0x20);

    return;
}

//! FE8U = 0x08069400
void sub_8069400(struct ProcEfxBG * proc)
{
    s16 ret;

    int x = proc->terminator >> 1;

    if (GetAnimPosition(proc->anim) != 0)
    {
        x = -x;
    }

    BG_SetPosition(1, x, 0);

    proc->terminator++;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 0x14);
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

extern struct ProcCmd ProcScr_efxDarkGradoBG02[];

extern u16 * gUnknown_085D83B8[];
extern u16 * gUnknown_085D83F8[];
extern u16 * gUnknown_085D8438[];

extern u16 gUnknown_080DEDFA[];

//! FE8U = 0x08069488
void sub_8069488(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DEDFA;

    proc->tsal = gUnknown_085D83B8;
    proc->img = gUnknown_085D83F8;
    proc->pal = gUnknown_085D8438;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(1, 0x28, 0);
        }
        else
        {
            BG_SetPosition(1, -0x18, 0);
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(1, 0x10, 0);
        }
        else
        {
            BG_SetPosition(1, 0, 0);
        }
    }

    SpellFx_SetSomeColorEffect();
    SetBlendBackdropB(0);

    return;
}

struct Proc085D84B4
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);
    u16 unk4C;
};

//! FE8U = 0x08069528
void sub_8069528(struct Proc085D84B4 * proc)
{
    proc->unk4C = 0;
    return;
}

#if NONMATCHING

#define RGB_(r, g, b) (((b) << 10) | ((g) << 5) | (r))

//! FE8U = 0x08069530
void sub_8069530(struct Proc085D84B4 * param_1)
{
    int r6;
    int sp_0c;

    u16 * r9 = gPaletteBuffer;
    u16 * r8 = gEfxPal;

    if (param_1->unk4C >= 0x29)
    {
        r6 = Interpolate(0, 0x10, 0, param_1->unk4C - 0x28, 0x18);
    }
    else if (param_1->unk4C > 0x18)
    {
        r6 = 0x10;
    }
    else
    {
        r6 = Interpolate(0, 0, 0x10, param_1->unk4C, 0x18);
    }

    *r9 = *r8;

    for (sp_0c = 0; sp_0c < 0x20; sp_0c++)
    {
        u32 r1;
        int a;
        int sp_10;
        volatile int sp_14;
        int sp_18;

        switch (sp_0c)
        {
            case 1:
            case 2:
            case 3:
            case 16:
            case 21:
            case 27:
            case 28:
            case 29:
            case 30:
                // _08069624
                r1 = 0x00007C1F;
                break;

            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 17:
            case 18:
            case 19:
            case 20:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
                // _0806962C
                r1 = 0;
                break;
        }

        r9++;
        r8++;

        a = r1;
        sp_10 = r1 >> 5;
        sp_14 = r1 >> 10;

        for (sp_18 = 0; sp_18 <= 0x10; sp_18++)
        {
            int r, g, b;

            r = (((*r9 & 0x1f) * (0x10 - r6) + ((a & 0x1f) * r6)) >> 4);
            g = ((((*r9 >> 5) & 0x1f) * (0x10 - r6) + ((sp_10 & 0x1f) * r6) * 0) >> 4);
            b = (((((*r9 >> 10) & 0x1f) * (0x10 - r6)) + ((sp_14 & 0x1f) * r6)) >> 4);

            *r8 = RGB_(r & 0x1f, g & 0x1f, b & 0x1f);
            r8++;
            r9++;
        }
    }

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);
    DisablePaletteSync();

    if (param_1->unk4C == 0x40)
    {
        Proc_Break(param_1);
    }

    param_1->unk4C++;

    return;
}

#else

NAKEDFUNC
void sub_8069530(struct Proc085D84B4 * param_1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x1c\n\
        str r0, [sp, #4]\n\
        ldr r0, _08069564  @ gPaletteBuffer\n\
        mov r9, r0\n\
        ldr r1, _08069568  @ gEfxPal\n\
        mov r8, r1\n\
        ldr r0, [sp, #4]\n\
        adds r0, #0x4c\n\
        movs r2, #0\n\
        ldrsh r1, [r0, r2]\n\
        cmp r1, #0x28\n\
        ble _0806956C\n\
        adds r3, r1, #0\n\
        subs r3, #0x28\n\
        movs r0, #0x18\n\
        str r0, [sp]\n\
        movs r0, #0\n\
        movs r1, #0x10\n\
        movs r2, #0\n\
        b _08069582\n\
        .align 2, 0\n\
    _08069564: .4byte gPaletteBuffer\n\
    _08069568: .4byte gEfxPal\n\
    _0806956C:\n\
        cmp r1, #0x18\n\
        ble _08069574\n\
        movs r6, #0x10\n\
        b _08069588\n\
    _08069574:\n\
        movs r1, #0\n\
        ldrsh r3, [r0, r1]\n\
        movs r0, #0x18\n\
        str r0, [sp]\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #0x10\n\
    _08069582:\n\
        bl Interpolate\n\
        adds r6, r0, #0\n\
    _08069588:\n\
        mov r2, r9\n\
        ldrh r0, [r2]\n\
        mov r7, r8\n\
        strh r0, [r7]\n\
        movs r2, #0\n\
        ldr r0, [sp, #4]\n\
        adds r0, #0x4c\n\
        str r0, [sp, #8]\n\
    _08069598:\n\
        subs r0, r2, #1\n\
        cmp r0, #0x1d\n\
        bhi _0806962C\n\
        lsls r0, r0, #2\n\
        ldr r1, _080695A8  @ _080695AC\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _080695A8: .4byte _080695AC\n\
    _080695AC: @ jump table\n\
        .4byte _08069624 @ case 0\n\
        .4byte _08069624 @ case 1\n\
        .4byte _08069624 @ case 2\n\
        .4byte _0806962C @ case 3\n\
        .4byte _0806962C @ case 4\n\
        .4byte _0806962C @ case 5\n\
        .4byte _0806962C @ case 6\n\
        .4byte _0806962C @ case 7\n\
        .4byte _0806962C @ case 8\n\
        .4byte _0806962C @ case 9\n\
        .4byte _0806962C @ case 10\n\
        .4byte _0806962C @ case 11\n\
        .4byte _0806962C @ case 12\n\
        .4byte _0806962C @ case 13\n\
        .4byte _0806962C @ case 14\n\
        .4byte _08069624 @ case 15\n\
        .4byte _0806962C @ case 16\n\
        .4byte _0806962C @ case 17\n\
        .4byte _0806962C @ case 18\n\
        .4byte _0806962C @ case 19\n\
        .4byte _08069624 @ case 20\n\
        .4byte _08069624 @ case 21\n\
        .4byte _0806962C @ case 22\n\
        .4byte _0806962C @ case 23\n\
        .4byte _0806962C @ case 24\n\
        .4byte _0806962C @ case 25\n\
        .4byte _08069624 @ case 26\n\
        .4byte _08069624 @ case 27\n\
        .4byte _08069624 @ case 28\n\
        .4byte _08069624 @ case 29\n\
    _08069624:\n\
        ldr r1, _08069628  @ 0x00007C1F\n\
        b _0806962E\n\
        .align 2, 0\n\
    _08069628: .4byte 0x00007C1F\n\
    _0806962C:\n\
        movs r1, #0\n\
    _0806962E:\n\
        movs r7, #2\n\
        add r9, r7\n\
        movs r0, #2\n\
        add r8, r0\n\
        lsrs r7, r1, #5\n\
        str r7, [sp, #0x10]\n\
        lsrs r0, r1, #0xa\n\
        str r0, [sp, #0x14]\n\
        adds r2, #1\n\
        str r2, [sp, #0xc]\n\
        movs r2, #0x1f\n\
        mov ip, r2\n\
        movs r5, #0x1f\n\
        movs r0, #0x10\n\
        subs r4, r0, r6\n\
        movs r7, #0xe\n\
        str r7, [sp, #0x18]\n\
        ands r1, r5\n\
        adds r0, r1, #0\n\
        muls r0, r6, r0\n\
        mov sl, r0\n\
    _08069658:\n\
        mov r2, r9\n\
        ldrh r1, [r2]\n\
        adds r0, r5, #0\n\
        ands r0, r1\n\
        adds r3, r0, #0\n\
        muls r3, r4, r3\n\
        add r3, sl\n\
        asrs r3, r3, #4\n\
        lsls r1, r1, #0x10\n\
        lsrs r0, r1, #0x15\n\
        mov r7, ip\n\
        ands r0, r7\n\
        adds r2, r0, #0\n\
        muls r2, r4, r2\n\
        asrs r2, r2, #4\n\
        lsrs r1, r1, #0x1a\n\
        mov r0, ip\n\
        ands r1, r0\n\
        muls r1, r4, r1\n\
        ldr r0, [sp, #0x14]\n\
        ands r0, r7\n\
        muls r0, r6, r0\n\
        adds r1, r1, r0\n\
        asrs r1, r1, #4\n\
        ands r1, r5\n\
        lsls r1, r1, #0xa\n\
        ands r2, r5\n\
        lsls r2, r2, #5\n\
        orrs r1, r2\n\
        ands r3, r5\n\
        orrs r3, r1\n\
        mov r0, r8\n\
        strh r3, [r0]\n\
        movs r1, #2\n\
        add r9, r1\n\
        add r8, r1\n\
        ldr r2, [sp, #0x18]\n\
        subs r2, #1\n\
        str r2, [sp, #0x18]\n\
        cmp r2, #0\n\
        bge _08069658\n\
        ldr r2, [sp, #0xc]\n\
        cmp r2, #0x1f\n\
        bgt _080696B2\n\
        b _08069598\n\
    _080696B2:\n\
        movs r1, #0xa0\n\
        lsls r1, r1, #0x13\n\
        movs r2, #0x80\n\
        lsls r2, r2, #1\n\
        ldr r0, _080696EC  @ gEfxPal\n\
        bl CpuFastSet\n\
        bl DisablePaletteSync\n\
        ldr r7, [sp, #8]\n\
        movs r1, #0\n\
        ldrsh r0, [r7, r1]\n\
        cmp r0, #0x40\n\
        bne _080696D4\n\
        ldr r0, [sp, #4]\n\
        bl Proc_Break\n\
    _080696D4:\n\
        ldr r2, [sp, #8]\n\
        ldrh r0, [r2]\n\
        adds r0, #1\n\
        strh r0, [r2]\n\
        add sp, #0x1c\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080696EC: .4byte gEfxPal\n\
        .syntax divided\n\
    ");
}

#endif

extern struct ProcCmd gUnknown_085D84B4[];

//! FE8U = 0x080696F0
void sub_80696F0(void)
{
    Proc_Start(gUnknown_085D84B4, PROC_TREE_VSYNC);
    return;
}

extern s16 gUnknown_085D84D4[];
extern s16 gUnknown_085D8524[];
extern s16 gUnknown_085D8574[];
extern s16 gUnknown_085D85C4[];
extern s16 gUnknown_085D8614[];
extern s16 gUnknown_085D8664[];
extern s16 gUnknown_085D86B4[];

//! FE8U = 0x08069704
int sub_8069704(int a, int b, int c)
{
    s16 * ptr;

    switch (b)
    {
        case 0:
            ptr = gUnknown_085D84D4;
            break;

        case 1:
            ptr = gUnknown_085D8524;
            break;

        case 2:
            ptr = gUnknown_085D8574;
            break;

        case 3:
            ptr = gUnknown_085D85C4;
            break;

        case 4:
            ptr = gUnknown_085D8614;
            break;

        case 5:
            ptr = gUnknown_085D8664;
            break;

        default:
            ptr = gUnknown_085D86B4;
            break;
    }

    return (ptr[a * 2] * c) >> 8;
}

//! FE8U = 0x0806977C
int sub_806977C(int a, int b, int c)
{
    s16 * ptr;

    switch (b)
    {
        case 0:
            ptr = gUnknown_085D84D4;
            break;

        case 1:
            ptr = gUnknown_085D8524;
            break;

        case 2:
            ptr = gUnknown_085D8574;
            break;

        case 3:
            ptr = gUnknown_085D85C4;
            break;

        case 4:
            ptr = gUnknown_085D8614;
            break;

        case 5:
            ptr = gUnknown_085D8664;
            break;

        default:
            ptr = gUnknown_085D86B4;
            break;
    }

    return (ptr[a * 2 + 1] * c) >> 8;
}

//! FE8U = 0x080697F4
void sub_80697F4(struct ProcEfxOBJ * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 + sub_8069704(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        proc->anim2->xPosition = proc->unk32 - sub_8069704(proc->timer, proc->unk44, proc->unk48);
    }

    proc->anim2->yPosition = proc->unk3A + sub_806977C(proc->timer, proc->unk44, proc->unk48);

    proc->timer++;

    if ((proc->timer == proc->terminator) || (proc->timer == proc->unk4C))
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D8704[];

extern u32 gUnknown_086A2724[];
extern u32 gUnknown_086A2844[];
extern u32 gUnknown_086A273C[];
extern u32 gUnknown_086A285C[];

//! FE8U = 0x08069878
void sub_8069878(struct Anim * anim, s16 b, s16 c, s16 d, u16 e)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D8704, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x14;

    switch (b)
    {
        case 0:
            scr = gUnknown_086A2724;
            break;

        case 1:
            scr = gUnknown_086A2844;
            break;

        case 2:
            scr = gUnknown_086A273C;
            break;

        default:
            scr = gUnknown_086A285C;
            break;
    }

    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;

    frontAnim = (struct Anim *)EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->unk32 = 0x58;
    }
    else
    {
        proc->unk32 = 0x98;
    }

    proc->unk3A = 0x50;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk32 -= 0x18;
        }
        else
        {
            proc->unk32 += 0x18;
        }
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = proc->unk32 + sub_8069704(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        frontAnim->xPosition = proc->unk32 - sub_8069704(proc->timer, proc->unk44, proc->unk48);
    }

    frontAnim->yPosition = proc->unk3A + sub_806977C(proc->timer, proc->unk44, proc->unk48);

    return;
}

//! FE8U = 0x080699A8
void sub_80699A8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (DivRem(proc->timer, 0xc) == 0)
    {
        if ((proc->terminator & 1) == 0)
        {
            sub_8069878(proc->anim, (proc->terminator >> 1) & 3, 0, 0x100, 0x62 - proc->timer);
            sub_8069878(proc->anim, ((proc->terminator >> 1) + 2) & 3, 1, 0x100, 0x62 - proc->timer);
            sub_8069878(proc->anim, ((proc->terminator >> 1) + 1) & 3, 2, 0x100, 0x62 - proc->timer);
        }
        else
        {
            sub_8069878(proc->anim, (proc->terminator >> 1) & 3, 3, 0x100, 0x62 - proc->timer);
            sub_8069878(proc->anim, ((proc->terminator >> 1) + 2) & 3, 4, 0x100, 0x62 - proc->timer);
            sub_8069878(proc->anim, ((proc->terminator >> 1) + 1) & 3, 5, 0x100, 0x62 - proc->timer);
            sub_8069878(proc->anim, ((proc->terminator >> 1) + 3) & 3, 6, 0x100, 0x62 - proc->timer);
        }

        proc->terminator++;
    }

    if (proc->timer == 0x61)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkGradoOBJ01[];

extern u16 gUnknown_086A2614[];
extern u16 gUnknown_086A21F4[];

//! FE8U = 0x08069AC4
void sub_8069AC4(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    SpellFx_RegisterObjPal(gUnknown_086A2614, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086A21F4, 0x1000);

    return;
}

//! FE8U = 0x08069AFC
void sub_8069AFC(struct ProcEfxOBJ * proc)
{
    proc->unk48 += proc->unk44;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 - (proc->unk48 >> 8);
    }
    else
    {
        proc->anim2->xPosition = (proc->unk48 >> 8) + proc->unk32;
    }

    proc->anim2->yPosition = (proc->unk48 >> 8) + proc->unk3A;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkGradoOBJ02piece[];

extern u32 gUnknown_086A2E98[];
extern u32 gUnknown_086A2DBC[];

//! FE8U = 0x08069B68
void sub_8069B68(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->unk44 = unk;
    proc->unk48 = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_086A2E98, gUnknown_086A2DBC, gUnknown_086A2E98, gUnknown_086A2DBC);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = 0x68;
    frontAnim->yPosition = yPosition;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition -= xOffset;
    }
    else
    {
        frontAnim->xPosition += xOffset;
    }

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 0x18;
        }
        else
        {
            frontAnim->xPosition += 0x18;
        }
    }

    proc->unk32 = frontAnim->xPosition;
    proc->unk3A = frontAnim->yPosition;

    return;
}

extern u32 gUnknown_086A2EAC[];
extern u32 gUnknown_086A2DD0[];

//! FE8U = 0x08069C18
void sub_8069C18(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->unk44 = unk;
    proc->unk48 = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_086A2EAC, gUnknown_086A2DD0, gUnknown_086A2EAC, gUnknown_086A2DD0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = 0x78;
    frontAnim->yPosition = yPosition;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition -= xOffset;
    }
    else
    {
        frontAnim->xPosition += xOffset;
    }

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 0x18;
        }
        else
        {
            frontAnim->xPosition += 0x18;
        }
    }

    proc->unk32 = frontAnim->xPosition;
    proc->unk3A = frontAnim->yPosition;

    frontAnim->drawLayerPriority = 0x14;
    frontAnim->oam2Base |= 0xc00;
    AnimSort();

    return;
}

//! FE8U = 0x08069CDC
void sub_8069CDC(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer < 0x58)
    {
        if ((proc->timer - 3 > 0) && (DivRem(proc->timer - 3, 6) == 0))
        {
            switch (proc->unk44)
            {
                case 0:
                    sub_8069B68(proc->anim, -0x40, -0x10, 0xa80, 0x62 - proc->timer);
                    break;

                case 1:
                    sub_8069B68(proc->anim, -0x80, -0x10, 0x780, 0x62 - proc->timer);
                    break;

                case 2:
                    sub_8069B68(proc->anim, 0, -0x10, 0x900, 0x62 - proc->timer);
                    break;

                case 3:
                    sub_8069B68(proc->anim, -0x40, -0x10, 0x900, 0x62 - proc->timer);
                    break;

                case 4:
                    sub_8069B68(proc->anim, -0x80, -0x10, 0xa80, 0x62 - proc->timer);
                    break;

                case 5:
                    sub_8069B68(proc->anim, 0, -0x10, 0x780, 0x62 - proc->timer);
                    break;
            }

            proc->unk44++;

            if (proc->unk44 == 6)
            {
                proc->unk44 = 0;
            }
        }

        if ((proc->timer - 1 > 0) && (DivRem(proc->timer - 1, 6) == 0))
        {
            switch (proc->unk48)
            {
                case 0:
                    sub_8069C18(proc->anim, -0x18, 0, 0x540, 0x62 - proc->timer);
                    break;

                case 1:
                    sub_8069C18(proc->anim, -0x38, 0, 0x3c0, 0x62 - proc->timer);
                    break;

                case 2:
                    sub_8069C18(proc->anim, -0x58, 0, 0x480, 0x62 - proc->timer);
                    break;

                case 3:
                    sub_8069C18(proc->anim, -0x18, 0, 0x480, 0x62 - proc->timer);
                    break;

                case 4:
                    sub_8069C18(proc->anim, -0x38, 0, 0x540, 0x62 - proc->timer);
                    break;

                case 5:
                    sub_8069C18(proc->anim, -0x58, 0, 0x3c0, 0x62 - proc->timer);
                    break;
            }

            proc->unk48++;

            if (proc->unk48 == 6)
            {
                proc->unk48 = 0;
            }
        }
    }

    if (proc->timer == 0x60)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkGradoOBJ02[];

extern u16 gUnknown_086A2874[];
extern u16 gUnknown_086A2CE8[];

//! FE8U = 0x08069E88
void sub_8069E88(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk44 = 0;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(gUnknown_086A2CE8, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086A2874, 0x1000);

    return;
}
