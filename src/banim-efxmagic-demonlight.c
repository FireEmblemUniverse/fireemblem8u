#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

extern struct ProcCmd ProcScr_efxMaohFlash[];

//! FE8U = 0x08066514
void sub_8066514(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxMaohFlash, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

void sub_80666D0(struct Anim *);
void sub_8066914(struct Anim *);
void sub_8066C98(void);
void sub_8066CB8(struct Anim * anim, int terminator, s16 x, s16 y);
void sub_8066DB0(struct Anim * anim, int terminator, s16 x, s16 y);
void sub_8066A0C(struct Anim *);
void sub_80667E0(struct Anim *);
void sub_8066BD4(struct Anim *);
void sub_80671F4(struct Anim *, int);

//! FE8U = 0x08066550
void sub_8066550(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    switch (proc->timer)
    {
        case 0xb:
        {
            SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
            NewEfxALPHA(anim, 0, 0x20, 0, 0x10, 0);

            NewEfxRestWINH_(anim, 0xa6, 1);
            NewEfxTwobaiRST(anim, 0xa6);

            sub_80666D0(anim);
            PlaySFX(0x000003B2, 0x100, anim->xPosition, 1);
            break;
        }

        case 0xb1:
        {
            sub_8066914(anim);
            break;
        }

        case 0xff:
        {
            sub_8066C98();
            sub_8066CB8(anim, 10, 0xad, 0x2c);
            sub_8066DB0(anim, 10, 0x9f, 0x30);
            break;
        }

        case 0x109:
        {
            NewEfxRestWINH_(anim, 0x22, 1);
            NewEfxTwobaiRST(anim, 0x22);
            sub_8066A0C(anim);
            break;
        }

        case 0x12D:
        {
            NewEfxFlashBgWhite(anim, 4);
            NewEfxFarAttackWithDistance(proc->anim, -1);
            break;
        }
    }

    if (proc->timer == duration + 0x00000133)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            StartSpellThing_MagicQuake(anim, 0x78, 10);
            sub_80667E0(anim);
            sub_8066BD4(anim);
            sub_80671F4(anim, 0x4a);
            PlaySFX(0x000003B3, 0x100, anim->xPosition, 1);
        }
        else
        {
            proc->timer = duration + 0x1c4;
        }
    }
    else if (proc->timer == duration + 0x000001C9)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashBG1[];

extern u16 * gUnknown_085D788C[];
extern u16 * gUnknown_085D790C[];
extern u16 * gUnknown_085D798C[];

extern u16 * gUnknown_085D7A0C[];
extern u16 * gUnknown_085D7A8C[];
extern u16 * gUnknown_085D7B0C[];

extern u16 gUnknown_080DE65C[];

//! FE8U = 0x080666D0
void sub_80666D0(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG1, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE65C;

    if (gEkrDistanceType != 0)
    {
        proc->tsal = gUnknown_085D7A0C;
        proc->tsar = gUnknown_085D7A0C;
        proc->img = gUnknown_085D7A8C;
        proc->pal = gUnknown_085D7B0C;
    }
    else
    {
        proc->tsal = gUnknown_085D788C;
        proc->tsar = gUnknown_085D788C;
        proc->img = gUnknown_085D790C;
        proc->pal = gUnknown_085D798C;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08066758
void sub_8066758(struct ProcEfxBG * proc)
{
    s16 ret;

    GetAnimAnotherSide(proc->anim);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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

extern struct ProcCmd ProcScr_efxMaohFlashBG2[];

extern u16 * gUnknown_085D7BA4[];
extern u16 * gUnknown_085D7BB0[];
extern u16 * gUnknown_085D7BBC[];

extern u16 gUnknown_080DE6F0[];

//! FE8U = 0x080667E0
void sub_80667E0(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE6F0;

    proc->tsal = gUnknown_085D7BA4;
    proc->tsar = gUnknown_085D7BA4;
    proc->img = gUnknown_085D7BB0;
    proc->pal = gUnknown_085D7BBC;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

void sub_80668DC(void);

//! FE8U = 0x0806683C
void sub_806683C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (gEkrDistanceType == 0)
    {
        BG_SetPosition(1, 0x18, 0);
    }
    else
    {
        BG_SetPosition(1, 0, 0);
    }

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        sub_80668DC();
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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

//! FE8U = 0x080668DC
void sub_80668DC(void)
{
    int ix;
    int iy;

    for (iy = 0; iy < 0x10; iy++)
    {
        for (ix = 0; ix < 3; ix++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(0x1D + ix, iy)] = gBG1TilemapBuffer[TILEMAP_INDEX(0x1C, iy)];
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashBG1BG3[];

extern u16 * gUnknown_085D7BE0[];
extern u16 * gUnknown_085D7BF4[];
extern u16 * gUnknown_085D7C08[];

extern u16 * gUnknown_085D7C1C[];
extern u16 * gUnknown_085D7C30[];
extern u16 * gUnknown_085D7C44[];

extern u16 gUnknown_080DE710[];

//! FE8U = 0x08066914
void sub_8066914(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG1BG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE710;

    if (gEkrDistanceType != 0)
    {
        proc->tsal = gUnknown_085D7C1C;
        proc->tsar = gUnknown_085D7C1C;
        proc->img = gUnknown_085D7C30;
        proc->pal = gUnknown_085D7C44;
    }
    else
    {
        proc->tsal = gUnknown_085D7BE0;
        proc->tsar = gUnknown_085D7BE0;
        proc->img = gUnknown_085D7BF4;
        proc->pal = gUnknown_085D7C08;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806699C
void sub_806699C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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

extern struct ProcCmd ProcScr_efxMaohFlashBG4[];

extern u16 * gUnknown_085D7CD0[];
extern u16 * gUnknown_085D7CF0[];
extern u16 * gUnknown_085D7D10[];

extern u16 * gUnknown_085D7C70[];
extern u16 * gUnknown_085D7C90[];
extern u16 * gUnknown_085D7CB0[];

extern u16 gUnknown_080DE748[];

//! FE8U = 0x08066A0C
void sub_8066A0C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE748;

    if (gEkrDistanceType != 0)
    {
        proc->tsal = gUnknown_085D7CD0;
        proc->tsar = gUnknown_085D7CD0;
        proc->img = gUnknown_085D7CF0;
        proc->pal = gUnknown_085D7D10;
    }
    else
    {
        proc->tsal = gUnknown_085D7C70;
        proc->tsar = gUnknown_085D7C70;
        proc->img = gUnknown_085D7C90;
        proc->pal = gUnknown_085D7CB0;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08066A94
void sub_8066A94(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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

extern struct ProcCmd ProcScr_efxMaohFlashWOUT[];

//! FE8U = 0x08066B14
void sub_8066B14(struct Anim * anim, int unused, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08066B40
void sub_8066B40(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);
    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        NewEfxWhiteIN(proc->anim, 0, 0x20);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08066BBC
void sub_8066BBC(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    Proc_Break(proc);
    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashBGCOL[];

extern u16 gUnknown_087F3C54[];

extern u16 gUnknown_080DE792[];

//! FE8U = 0x08066BD4
void sub_8066BD4(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk32 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE792;

    proc->pal = gUnknown_087F3C54;
    SpellFx_RegisterBgPal(gUnknown_08603B50, 0x20);

    return;
}

//! FE8U = 0x08066C1C
void sub_8066C1C(struct ProcEfxBGCOL * proc)
{
    u16 palBuffer[0x10];

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CopyPalWithFade(gUnknown_087F3C54, palBuffer, ret - 4);
        SpellFx_RegisterBgPal(palBuffer, 0x20);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08066C74
int sub_8066C74(int pos)
{
    int xNew;

    if (gEkrDistanceType == 0)
    {
        xNew = 0x18;
    }
    else
    {
        xNew = 0;
    }

    if (pos == 0)
    {
        xNew = -xNew;
    }

    return xNew;
}

extern u16 gUnknown_087A574C[];
extern u16 gUnknown_087A5390[];

//! FE8U = 0x08066C98
void sub_8066C98(void)
{
    SpellFx_RegisterObjPal(gUnknown_087A574C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A5390, 0x1000);
    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashEyeROBJ2[];

#if NONMATCHING

//! FE8U = 0x08066CB8
void sub_8066CB8(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    u32 * gUnknown_080DE8A0[2] = { (u32 *)0x087A5B74, (u32 *)0x087A5958 };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeROBJ2, PROC_TREE_3);
    proc->anim = (struct Anim *)GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8A0[pos];

    frontAnim = (struct Anim *)EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + 0xf0);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= 0xF3FF;
    frontAnim->oam2Base |= 0x400;

    return;
}

#else

NAKEDFUNC
void sub_8066CB8(struct Anim * anim, int terminator, s16 x, s16 y)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r0, #0\n\
        adds r5, r1, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        ldr r0, _08066D34  @ gUnknown_080DE8A0\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r1, _08066D38  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _08066D3C  @ ProcScr_efxMaohFlashEyeROBJ2\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r6, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r6, #0x5c]\n\
        movs r1, #0\n\
        strh r1, [r6, #0x2c]\n\
        strh r5, [r6, #0x2e]\n\
        lsls r1, r7, #2\n\
        add r1, sp\n\
        adds r1, #4\n\
        ldr r3, [r1]\n\
        str r3, [sp]\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        adds r4, r0, #0\n\
        str r4, [r6, #0x60]\n\
        adds r5, r4, #0\n\
        cmp r7, #0\n\
        beq _08066D40\n\
        adds r0, r7, #0\n\
        bl sub_8066C74\n\
        adds r0, #0xf0\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        subs r0, r0, r1\n\
        b _08066D4E\n\
        .align 2, 0\n\
    _08066D34: .4byte gUnknown_080DE8A0\n\
    _08066D38: .4byte gEfxBgSemaphore\n\
    _08066D3C: .4byte ProcScr_efxMaohFlashEyeROBJ2\n\
    _08066D40:\n\
        movs r0, #0\n\
        bl sub_8066C74\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
    _08066D4E:\n\
        strh r0, [r4, #2]\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x60]\n\
        mov r1, r9\n\
        strh r1, [r4, #4]\n\
        strh r1, [r0, #4]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _08066D78  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08066D78: .4byte 0x0000F3FF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x08066D7C
void sub_8066D7C(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

#if NONMATCHING

extern struct ProcCmd ProcScr_efxMaohFlashEyeLOBJ2[];

//! FE8U = 0x08066DB0
void sub_8066DB0(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    u32 * gUnknown_080DE8C0[2] = { (u32 *)0x087A5B8C, (u32 *)0x087A5970 };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeLOBJ2, PROC_TREE_3);
    proc->anim = (struct Anim *)GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8C0[pos];

    frontAnim = (struct Anim *)EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + 0xf0);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= 0xF3FF;
    frontAnim->oam2Base |= 0x400;

    return;
}

#else

NAKEDFUNC
void sub_8066DB0(struct Anim * anim, int terminator, s16 x, s16 y)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r0, #0\n\
        adds r5, r1, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        ldr r0, _08066E2C  @ gUnknown_080DE8C0\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r1, _08066E30  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _08066E34  @ ProcScr_efxMaohFlashEyeLOBJ2\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r6, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r6, #0x5c]\n\
        movs r1, #0\n\
        strh r1, [r6, #0x2c]\n\
        strh r5, [r6, #0x2e]\n\
        lsls r1, r7, #2\n\
        add r1, sp\n\
        adds r1, #4\n\
        ldr r3, [r1]\n\
        str r3, [sp]\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        adds r4, r0, #0\n\
        str r4, [r6, #0x60]\n\
        adds r5, r4, #0\n\
        cmp r7, #0\n\
        beq _08066E38\n\
        adds r0, r7, #0\n\
        bl sub_8066C74\n\
        adds r0, #0xf0\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        subs r0, r0, r1\n\
        b _08066E46\n\
        .align 2, 0\n\
    _08066E2C: .4byte gUnknown_080DE8C0\n\
    _08066E30: .4byte gEfxBgSemaphore\n\
    _08066E34: .4byte ProcScr_efxMaohFlashEyeLOBJ2\n\
    _08066E38:\n\
        movs r0, #0\n\
        bl sub_8066C74\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
    _08066E46:\n\
        strh r0, [r4, #2]\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x60]\n\
        mov r1, r9\n\
        strh r1, [r4, #4]\n\
        strh r1, [r0, #4]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _08066E70  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08066E70: .4byte 0x0000F3FF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x08066E74
void sub_8066E74(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern u16 gUnknown_087A5118[];
extern u16 gUnknown_087A4EEC[];

//! FE8U = 0x08066EA8
void sub_8066EA8(void)
{
    SpellFx_RegisterObjPal(gUnknown_087A5118, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A4EEC, 0x1000);
    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashEyeOBJ1[];

#if NONMATCHING

//! FE8U = 0x08066EC8
void sub_8066EC8(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    u32 * gUnknown_080DE8DC[2] = { (u32 *)0x087A536C, (u32 *)0x087A5240 };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeOBJ1, PROC_TREE_3);
    proc->anim = (struct Anim *)GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8DC[pos];

    frontAnim = (struct Anim *)EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + 0xf0);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= 0xF3FF;
    frontAnim->oam2Base |= 0x400;

    return;
}

#else

NAKEDFUNC
void sub_8066EC8(struct Anim * anim, int terminator, s16 x, s16 y)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r0, #0\n\
        adds r5, r1, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        ldr r0, _08066F48  @ gUnknown_080DE8DC\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r1, _08066F4C  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _08066F50  @ ProcScr_efxMaohFlashEyeOBJ1\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r6, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r6, #0x5c]\n\
        movs r0, #0\n\
        strh r0, [r6, #0x2c]\n\
        strh r5, [r6, #0x2e]\n\
        lsls r0, r7, #2\n\
        add r0, sp\n\
        adds r0, #4\n\
        ldr r3, [r0]\n\
        str r3, [sp]\n\
        adds r0, r4, #0\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        adds r4, r0, #0\n\
        str r4, [r6, #0x60]\n\
        adds r5, r4, #0\n\
        cmp r7, #0\n\
        beq _08066F54\n\
        adds r0, r7, #0\n\
        bl sub_8066C74\n\
        adds r0, #0xf0\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        subs r0, r0, r1\n\
        b _08066F62\n\
        .align 2, 0\n\
    _08066F48: .4byte gUnknown_080DE8DC\n\
    _08066F4C: .4byte gEfxBgSemaphore\n\
    _08066F50: .4byte ProcScr_efxMaohFlashEyeOBJ1\n\
    _08066F54:\n\
        movs r0, #0\n\
        bl sub_8066C74\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
    _08066F62:\n\
        strh r0, [r4, #2]\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x60]\n\
        mov r1, r9\n\
        strh r1, [r4, #4]\n\
        strh r1, [r0, #4]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _08066F8C  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08066F8C: .4byte 0x0000F3FF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x08066F90
void sub_8066F90(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxMaohFlashBG1EyeFire1OBJ1[];

extern u16 gUnknown_087A61EC[];
extern u16 gUnknown_087A5BA4[];

#if NONMATCHING

//! FE8U = 0x08066FC4
void sub_8066FC4(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    u32 * gUnknown_080DE900[2] = {
        (u32 *)0x087A6AEC,
        (u32 *)0x087A6674,
    };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG1EyeFire1OBJ1, PROC_TREE_3);
    proc->anim = (struct Anim *)GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE900[pos];

    frontAnim = (struct Anim *)EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + 0xf0);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= 0xF3FF;
    frontAnim->oam2Base |= 0x400;

    SpellFx_RegisterObjPal(gUnknown_087A61EC, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A5BA4, 0x1000);

    return;
}

#else

NAKEDFUNC
void sub_8066FC4(struct Anim * anim, int terminator, s16 x, s16 y)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r0, #0\n\
        adds r5, r1, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        ldr r0, _08067044  @ gUnknown_080DE900\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r1, _08067048  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _0806704C  @ ProcScr_efxMaohFlashBG1EyeFire1OBJ1\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r6, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r6, #0x5c]\n\
        movs r0, #0\n\
        strh r0, [r6, #0x2c]\n\
        strh r5, [r6, #0x2e]\n\
        lsls r0, r7, #2\n\
        add r0, sp\n\
        adds r0, #4\n\
        ldr r3, [r0]\n\
        str r3, [sp]\n\
        adds r0, r4, #0\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        adds r4, r0, #0\n\
        str r4, [r6, #0x60]\n\
        adds r5, r4, #0\n\
        cmp r7, #0\n\
        beq _08067050\n\
        adds r0, r7, #0\n\
        bl sub_8066C74\n\
        adds r0, #0xf0\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        subs r0, r0, r1\n\
        b _0806705E\n\
        .align 2, 0\n\
    _08067044: .4byte gUnknown_080DE900\n\
    _08067048: .4byte gEfxBgSemaphore\n\
    _0806704C: .4byte ProcScr_efxMaohFlashBG1EyeFire1OBJ1\n\
    _08067050:\n\
        movs r0, #0\n\
        bl sub_8066C74\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
    _0806705E:\n\
        strh r0, [r4, #2]\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x60]\n\
        mov r1, r9\n\
        strh r1, [r4, #4]\n\
        strh r1, [r0, #4]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _0806709C  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        ldr r0, _080670A0  @ gUnknown_087A61EC\n\
        movs r1, #0x20\n\
        bl SpellFx_RegisterObjPal\n\
        ldr r0, _080670A4  @ gUnknown_087A5BA4\n\
        movs r1, #0x80\n\
        lsls r1, r1, #5\n\
        bl SpellFx_RegisterObjGfx\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0806709C: .4byte 0x0000F3FF\n\
    _080670A0: .4byte gUnknown_087A61EC\n\
    _080670A4: .4byte gUnknown_087A5BA4\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080670A8
void sub_80670A8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D7DD8[];

extern u16 gUnknown_087A61EC[];
extern u16 gUnknown_087A5E9C[];

#if NONMATCHING

//! FE8U = 0x080670DC
void sub_80670DC(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    u32 * gUnknown_080DE924[2] = {
        (u32 *)0x087A73E0,
        (u32 *)0x087A6F64,
    };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7DD8, PROC_TREE_3);
    proc->anim = (struct Anim *)GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE924[pos];

    frontAnim = (struct Anim *)EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + 0xf0);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= 0xF3FF;
    frontAnim->oam2Base |= 0x400;

    SpellFx_RegisterObjPal(gUnknown_087A61EC, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A5E9C, 0x1000);

    return;
}

#else

NAKEDFUNC
void sub_80670DC(struct Anim * anim, int terminator, s16 x, s16 y)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r0, #0\n\
        adds r5, r1, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        ldr r0, _0806715C  @ gUnknown_080DE924\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r7, r0, #0x18\n\
        ldr r1, _08067160  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _08067164  @ gUnknown_085D7DD8\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r6, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r6, #0x5c]\n\
        movs r0, #0\n\
        strh r0, [r6, #0x2c]\n\
        strh r5, [r6, #0x2e]\n\
        lsls r0, r7, #2\n\
        add r0, sp\n\
        adds r0, #4\n\
        ldr r3, [r0]\n\
        str r3, [sp]\n\
        adds r0, r4, #0\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        adds r4, r0, #0\n\
        str r4, [r6, #0x60]\n\
        adds r5, r4, #0\n\
        cmp r7, #0\n\
        beq _08067168\n\
        adds r0, r7, #0\n\
        bl sub_8066C74\n\
        adds r0, #0xf0\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        subs r0, r0, r1\n\
        b _08067176\n\
        .align 2, 0\n\
    _0806715C: .4byte gUnknown_080DE924\n\
    _08067160: .4byte gEfxBgSemaphore\n\
    _08067164: .4byte gUnknown_085D7DD8\n\
    _08067168:\n\
        movs r0, #0\n\
        bl sub_8066C74\n\
        mov r2, r8\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
    _08067176:\n\
        strh r0, [r4, #2]\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x60]\n\
        mov r1, r9\n\
        strh r1, [r4, #4]\n\
        strh r1, [r0, #4]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _080671B4  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        ldr r0, _080671B8  @ gUnknown_087A61EC\n\
        movs r1, #0x20\n\
        bl SpellFx_RegisterObjPal\n\
        ldr r0, _080671BC  @ gUnknown_087A5E9C\n\
        movs r1, #0x80\n\
        lsls r1, r1, #5\n\
        bl SpellFx_RegisterObjGfx\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080671B4: .4byte 0x0000F3FF\n\
    _080671B8: .4byte gUnknown_087A61EC\n\
    _080671BC: .4byte gUnknown_087A5E9C\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080671C0
void sub_80671C0(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D7DF0[];

//! FE8U = 0x080671F4
void sub_80671F4(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7DF0, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterObjPal(gUnknown_087A574C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A5390, 0x1000);

    return;
}

void sub_8067400(struct Anim *, int, s16, s16);

//! FE8U = 0x08067244
void sub_8067244(struct ProcEfxOBJ * proc)
{
    u8 pos = GetAnimPosition(proc->anim);
    s16 xBase = sub_8066C74(pos);

    proc->timer++;

    if (proc->timer == 0)
    {
        if (pos != 0)
        {
            xBase += 0x38;
        }
        else
        {
            xBase += 0xb8;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6e);
    }
    else if (proc->timer == 10)
    {
        if (pos != 0)
        {
            xBase += 0x20;
        }
        else
        {
            xBase += 0xd0;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6c);
    }
    else if (proc->timer == 0xe)
    {
        if (pos != 0)
        {
            xBase += 0xe;
        }
        else
        {
            xBase += 0xe2;
        }
        sub_8067400(proc->anim, 10, xBase, 0x68);
    }
    else if (proc->timer == 0x18)
    {
        if (pos != 0)
        {
            xBase += 0x62;
        }
        else
        {
            xBase += 0x8e;
        }
        sub_8067400(proc->anim, 10, xBase, 0x62);
    }
    else if (proc->timer == 0x22)
    {
        if (pos != 0)
        {
            xBase += 0x30;
        }
        else
        {
            xBase += 0xc0;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6e);
    }
    else if (proc->timer == 0x2c)
    {
        if (pos != 0)
        {
            xBase += 0x18;
        }
        else
        {
            xBase += 0xd8;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6c);
    }
    else if (proc->timer == 0x30)
    {
        if (pos != 0)
        {
            xBase += 6;
        }
        else
        {
            xBase += 0xea;
        }
        sub_8067400(proc->anim, 10, xBase, 0x68);
    }
    else if (proc->timer == 0x34)
    {
        if (pos != 0)
        {
            xBase += 0x6a;
        }
        else
        {
            xBase += 0x86;
        }
        sub_8067400(proc->anim, 10, xBase, 0x62);
    }
    else if (proc->timer == 0x38)
    {
        if (pos != 0)
        {
            xBase += 0x58;
        }
        else
        {
            xBase += 0x98;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6e);
    }
    else if (proc->timer == 0x3c)
    {
        if (pos != 0)
        {
            xBase += 0x10;
        }
        else
        {
            xBase += 0xe0;
        }
        sub_8067400(proc->anim, 10, xBase, 0x6c);
    }
    else if (proc->timer == 0x40)
    {
        if (pos != 0)
        {
            xBase -= 2;
        }
        else
        {
            xBase += 0xf2;
        }
        sub_8067400(proc->anim, 10, xBase, 0x68);
    }
    else if (proc->timer == proc->terminator)
    {
        sub_8066B14(((struct ProcEfx *)(proc->proc_parent))->anim, 0x5a, 0x2d);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D7E08[];
extern u32 gUnknown_087A5B5C[];

//! FE8U = 0x08067400
void sub_8067400(struct Anim * anim, int terminator, s16 x, s16 y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7E08, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_087A5B5C;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;
    proc->anim2->xPosition = x;
    proc->anim2->yPosition = y;

    frontAnim->oam2Base &= 0x0000F3FF;
    frontAnim->oam2Base |= 0x400;

    SpellFx_RegisterObjPal(gUnknown_087A574C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_087A5390, 0x1000);

    return;
}

//! FE8U = 0x080674A0
void sub_80674A0(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
