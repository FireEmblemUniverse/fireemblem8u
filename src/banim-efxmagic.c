#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

CONST_DATA SpellAnimFunc gEkrSpellAnimLut[] = {
    StartSpellAnimDummy,
    StartSpellAnimHandAxe,
    StartSpellAnimArrow,
    StartSpellAnimJavelin,
    StartSpellAnimJavelinCavalier,
    StartSpellAnimJavelinSoldier,
    StartSpellAnimJavelinPaladin,
    StartSpellAnimJavelinPrgasusKnight,
    StartSpellAnimJavelinFalcon,
    StartSpellAnimJavelinWyvernRider,
    StartSpellAnimJavelinWyvernLord,
    StartSpellAnimJavelinGenerial,
    StartSpellAnimJavelinUnk,
    StartSpellAnimJavelinPaladinF,
    StartSpellAnimSong,
    StartSpellAnimDance,
    StartSpellAnimBallista,
    StartSpellAnimEckesachsRanged_Null,
    StartSpellAnimBindingBlade,
    StartSpellAnimFireBreath,
    StartSpellAnimIceBreath,
    StartSpellAnimDarkBreath,
    StartSpellAnimFire,
    StartSpellAnimElfire,
    StartSpellAnim_805FE80_Null,
    StartSpellAnimThunder,
    StartSpellAnimBolting,
    StartSpellAnimFimbulvetr,
    StartSpellAnimAircalibur,
    StartSpellAnimFlux,
    StartSpellAnimNosferatu,
    StartSpellAnimLightning,
    StartSpellAnimPurge,
    StartSpellAnim_8060284_Null,
    StartSpellAnimDivine,
    StartSpellAnim_8060288_Null,
    StartSpellAnimEclipse,
    StartSpellAnimFenrir,
    StartSpellAnimHeal,
    StartSpellAnimMend,
    StartSpellAnimRecover,
    StartSpellAnimPhysic,
    StartSpellAnimFortify,
    StartSpellAnimLatona,
    StartSpellAnimRestore,
    StartSpellAnimSilence,
    StartSpellAnimSleep,
    StartSpellAnimHammerne,
    StartSpellAnimBerserk,
    StartSpellAnimBarrier,
    (void *)NULL,
    StartSpellAnimShine,
    StartSpellAnimLuna,
    StartSpellAnimExcalibur,
    StartSpellAnimGespenst_Null,
    StartSpellAnimAura,
    StartSpellAnimLuce_Null,
    StartSpellAnimEreshkigal_Null,
    StartSpellAnimFillasMight,
    StartSpellAnimThorsIre,
    StartSpellAnimNinisGrace,
    StartSpellAnimSetsLitany,
    StartSpellAnimStone,
    StartSpellAnimIvaldi,
    StartSpellAnimDemonLight,
    StartSpellAnimGleipnir,
    StartSpellAnimCrimsonEye,
    StartSpellAnimEvilEye,
    StartSpellAnimShadowshot,
    StartSpellAnimDemonSurge,
    StartSpellAnimNaglfar,
    StartSpellAnimWretchedAir,
    (void *)NULL
};

u32 FramScr_Unk5D4F84[] = {
    0x1, 0x0, 0x0
};

u32 FramScr_Unk5D4F90[] = {
    0x85D4F85, /* (uintptr_t)FramScr_Unk5D4F84 + 1 */
    0x80000000
};

void StartSpellAnimation(struct Anim *anim)
{
    s16 index = gEkrSpellAnimIndex[GetAnimPosition(anim)];

#if BUGFIX
    if (gEkrSpellAnimLut[index](anim) == NULL)
        return;
#endif

    gEkrSpellAnimLut[index](anim);
}

void sub_805B3FC(void)
{
    return;
}

CONST_DATA struct ProcCmd ProcScr_efxRestRST[] = {
    PROC_NAME("efxRestRST"),
    PROC_SET_END_CB(sub_805B444),
    PROC_REPEAT(efxRestRSTMain),
    PROC_END
};

ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxRestRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0,
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk48 = unk48;
    proc->frame = frame;
    proc->speed = speed;

    return proc;
}

void sub_805B444(struct ProcEfx *proc)
{
    gEfxBgSemaphore--;
}

void efxRestRSTMain(struct ProcEfx *proc)
{
    u8 val1;
    int val2;
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    val1 = proc->step;
    proc->step += proc->speed;

    for (i = 0; i < 0x78; buf++, i++) {
        val1 += proc->unk48;
        *buf = (((gUnknown_0875879C[val1] * proc->frame) << 8) >> 0x10) + gLCDControlBuffer.bgoffset[1].x;
    }

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxTwobaiRST[] = {
    PROC_NAME("efxTwobaiRST"),
    PROC_REPEAT(EfxTwobaiRSTMain),
    PROC_END
};

void NewEfxTwobaiRST(struct Anim *anim, int unk44)
{
    u32 i, j;
    u16 *buf;
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxTwobaiRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;

    for (i = 0; i < 0x78; i++)
        gpBg1ScrollOffsetList1[i] = -(i / 2);

    buf = gpBg1ScrollOffsetList2;
    for (j = 0; j < 0x78; buf++, j++)
        *buf = -(j / 2);
}

void EfxTwobaiRSTMain(struct ProcEfx *proc)
{
    if (++proc->timer == proc->unk44)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_DummvRST[] = {
    PROC_NAME("efxDummyRST"),
    PROC_SET_END_CB(sub_805B584),
    PROC_REPEAT(DummvRSTMain),
    PROC_END
};

void NewDummvRST(struct Anim *anim, int unk44)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_DummvRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
}

void sub_805B584(void)
{
    gEfxBgSemaphore--;
}

void DummvRSTMain(struct ProcEfx *proc)
{
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    for (i = 0; i < 0x78; i++)
        buf[i] = gLCDControlBuffer.bgoffset[1].x;

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

CONST_DATA struct ProcCmd ProcScr_EfxRestWIN[] = {
    PROC_NAME("efxRestWIN"),
    PROC_REPEAT(EfxRestWINMain),
    PROC_END
};

void NewEfxRestWIN(struct Anim *anim, int unk44, void *unk54, void *unk58)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_EfxRestWIN, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk54 = unk54;
    proc->unk58 = unk58;

    if (GetAnimPosition(GetAnimAnotherSide(anim)) == EKR_POS_L)
        proc->unk32 = 0xFFB8;
    else
        proc->unk32 = 0xFFF8;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L)
            proc->unk32 += 0x18;
        else
            proc->unk32 -= 0x18;
    }
}

void EfxRestWINMain(struct ProcEfx *proc)
{
    u32 i;
    u16 val2;
    u16 *buf;
    s16 *buf2, *base;

    if (gEkrBg2ScrollFlip == 0)
        buf = gpBg2ScrollOffsetTable2;
    else
        buf = gpBg2ScrollOffsetTable1;

    base = proc->unk54;
    val2 = base[proc->step];
    buf2 = proc->unk58[val2];

    if (val2 != 0xFFFF) {
        proc->step++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++) {
            if (buf2[0] == 0x7FFF)
                buf[0] = 0;
            else {
                s16 tmp3 = buf2[0] + proc->unk32;
                s16 tmp4 = buf2[1] + proc->unk32;
                buf[0] = (tmp3 * 0x100) | tmp4;
            }
        }
    } else {
        for (i = 0; i < 0x78; i++)
            *buf++ = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void EfxMagicHBlank_805B724(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1HOFS = *gpBg1ScrollOffset++;
}

void EfxMagicHBlank_805B750(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1VOFS = *gpBg1ScrollOffset++;
}

void EfxMagicHBlank_805B77C(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1HOFS = *gpBg1ScrollOffset++;
    }
}

void EfxMagicHBlank_805B7BC(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1VOFS = *gpBg1ScrollOffset++;
    }
}

void EfxMagicHBlank_805B7FC(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
    }
}

CONST_DATA struct ProcCmd ProcScr_EfxRestWINH[] = {
    PROC_NAME("efxRestWINH"),
    PROC_REPEAT(sub_805B94C),
    PROC_REPEAT(sub_805B958),
    PROC_END
};

void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c)
{
    u32 i;
    u16 *buf;
    struct ProcEfx *proc;

    gEfxBgSemaphore++;

    if (c == 2) {
        buf = gpBg2ScrollOffsetTable1;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        buf = gpBg2ScrollOffsetTable2;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        gEkrBg2ScrollFlip = 0;
        gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        gpBg2ScrollOffset = gpBg2ScrollOffsetTable1;
    }

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    gEkrBg1ScrollFlip = 0;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;

    switch (c) {
    case 0:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B724);
        break;

    case 1:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B750);
        break;

    case 2:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B750);
        break;
    }

    proc = Proc_Start(ProcScr_EfxRestWINH, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = a;
    proc->unk48 = c;
}

void NewEfxRestWINH_(struct Anim *anim, int a, int b)
{
    NewEfxRestWINH(anim, a, 0, b);
}

void sub_805B94C(ProcPtr proc)
{
    Proc_Break(proc);
}

void sub_805B958(struct ProcEfx *proc)
{
    if (gBmSt.sync_hardware != false) {
        if (proc->unk48 == 0x2) {
            if (gEkrBg2ScrollFlip == 1) {
                gEkrBg2ScrollFlip = 0;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
            } else {
                gEkrBg2ScrollFlip = 1;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
            }
        }

        if (gEkrBg1ScrollFlip == 1) {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        } else {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        }
    }

    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;

    if (++proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
    }
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxALPHA[] =
{
    PROC_NAME("efxALPHA"),
    PROC_REPEAT(EfxALPHAMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805BA1C
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxALPHA, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = a;
    proc->unk30 = a + b;
    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;
}

//! FE8U = 0x0805BA64
void EfxALPHAMain(struct ProcEfxALPHA * proc)
{
    int bldA;
    int bldB;

    proc->timer++;

    if (proc->timer < proc->unk2E)
    {
        return;
    }

    bldA = Interpolate(INTERPOLATE_LINEAR, proc->unk44, proc->unk48, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));

    switch (proc->unk4C)
    {
        case 0:
            SetBlendAlpha(bldA, 16);
            break;

        case 1:
            SetBlendBrighten(bldA);
            break;

        case 2:
            bldB = Interpolate(INTERPOLATE_LINEAR, 8, 16, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));
            SetBlendAlpha(bldA, bldB);
            break;
    }

    if (proc->timer >= proc->unk30)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxCircleWIN[] =
{
    PROC_NAME("efxCircleWIN"),
    PROC_REPEAT(EfxCircleWINMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805BB24
void sub_805BB24(struct Anim * anim, int terminator, u16 * c, u16 d, u16 e)
{
    struct ProcEfxCircleWIN * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCircleWIN, PROC_TREE_3);

    proc->anim = anim;

    proc->timer = 0;
    proc->unk_2e = 0;

    proc->unk_44 = terminator;
    proc->unk_54 = c;

    GetAnimAnotherSide(anim);

    proc->unk_32 = d;
    proc->unk_3a = e;

    return;
}

//! FE8U = 0x0805BB84
void EfxCircleWINMain(struct ProcEfxCircleWIN * proc)
{
    u16 * unk_54;
    struct Vec2 * vec;
    s16 a;
    s16 b;
    s16 x;
    s16 y;
    u16 var;
    u32 i;

    u16 * buf = (gEkrBg2ScrollFlip == 0) ? gpBg2ScrollOffsetTable2 : gpBg2ScrollOffsetTable1;

    unk_54 = proc->unk_54;
    var = unk_54[proc->unk_2e];

    vec = sub_8013278(var);

    if (unk_54[proc->unk_2e + 1] != 0xFFFF)
    {
        proc->unk_2e++;
    }

    a = proc->unk_3a - var;

    if (a < 0)
    {
        a = 0;
    }

    b = var + proc->unk_3a;

    if (b > DISPLAY_HEIGHT)
    {
        b = DISPLAY_HEIGHT;
    }

    for (i = 0; i < DISPLAY_HEIGHT; buf++, i++)
    {
        if ((a > i) || (b < i))
        {
            *buf = 0;
        }
        else
        {
            x = vec->x + proc->unk_32;

            if (x < 0)
            {
                x = 0;
            }

            y = vec->y + proc->unk_32;

            if (y > DISPLAY_WIDTH)
            {
                y = DISPLAY_WIDTH;
            }

            *buf = y | (x << 8);
            vec++;
        }
    }

    proc->timer++;

    if (proc->timer == proc->unk_44)
    {
        gEfxBgSemaphore--;
        SetDefaultColorEffects();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMagicQUAKE[] =
{
    PROC_NAME("efxMagicQUAKE"),
    PROC_REPEAT(Loop6C_efxMagicQUAKE),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805BC80
void StartSpellThing_MagicQuake(struct Anim * anim, int terminator, int c)
{
    struct ProcEfxMagicQuake * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagicQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->pQuakePureProc = NewEfxQuakePure(c, 0);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x0805BCC4
void Loop6C_efxMagicQUAKE(struct ProcEfxMagicQuake * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    BG_SetPosition(2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    EkrDispUP_SetPositionSync(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    }

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }
    else
    {
        x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }

    x2 = ((gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition);
    y2 = (gEkrYPosReal[1] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(0, x1, y1);
    SetEkrFrontAnimPostion(1, x2, y2);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;

        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
        {
            BG_SetPosition(BG_3, 0, 0);
        }

        x1 = (gEkrXPosReal[0] - gEkrBgPosition);
        y1 = gEkrYPosReal[0];

        x2 = (gEkrXPosReal[1] - gEkrBgPosition);
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        Proc_End(proc->pQuakePureProc);

        Proc_Break(proc);
    }

    return;
}
