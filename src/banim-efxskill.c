#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct Anim *gAnims[4];

static inline void EfxSkillSetAnimState(struct Anim *anim)
{
    struct Anim *anim1, *anim2;

    anim1 = gAnims[GetAISSubjectId(anim) * 2];
    anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

    anim->state3 |= 0x20;
    anim->state |= 0x8;

    anim1->state3 |= 0x20;
    anim1->state |= 0x8;

    anim2->state3 |= 0x20;
    anim2->state |= 0x8;
}

static inline void EfxSkillResetAnimState(struct Anim *anim)
{
    struct Anim *anim1, *anim2;

    anim1 = gAnims[GetAISSubjectId(anim) * 2];
    anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

    anim->state3 |= 0x40;
    anim->state &= ~0x8;

    anim1->state3 |= 0x40;
    anim1->state &= ~0x8;

    anim2->state3 |= 0x40;
    anim2->state &= ~0x8;
}

struct ProcCmd ProcScr_efxSkillType01BG[] = {
    PROC_NAME("efxSkillType01BG"),
    PROC_REPEAT(EfxSkillType01BGMain),
    PROC_END
};

const u16 FrameLut_EfxSkill[] = {
    /* FrameIndex   Duration */
    0,              2,
    1,              2,
    2,              2,
    3,              2,
    4,              2,
    5,              2,
    6,              2,
    7,              2,
    8,              2,
    9,              2,
    10,             2,
    11,             2,
    12,             2,
    13,             2,
    14,             2,
    15,             2,
    -1,
};

CONST_DATA u16 *TsaLut_EfxSkill[] = {
    Tsa_EfxSkill1,
    Tsa_EfxSkill2,
    Tsa_EfxSkill3,
    Tsa_EfxSkill4,
    Tsa_EfxSkill5,
    Tsa_EfxSkill6,
    Tsa_EfxSkill7,
    Tsa_EfxSkill8,
    Tsa_EfxSkill9,
    Tsa_EfxSkillA,
    Tsa_EfxSkillB,
    Tsa_EfxSkillC,
    Tsa_EfxSkillD,
    Tsa_EfxSkillE,
    Tsa_EfxSkillF,
    Tsa_EfxSkill10
};

CONST_DATA u16 *ImgLut_EfxSkill[] = {
    Img_EfxSkill1,
    Img_EfxSkill2,
    Img_EfxSkill3,
    Img_EfxSkill4,
    Img_EfxSkill5,
    Img_EfxSkill6,
    Img_EfxSkill7,
    Img_EfxSkill8,
    Img_EfxSkill9,
    Img_EfxSkillA,
    Img_EfxSkillB,
    Img_EfxSkillC,
    Img_EfxSkillD,
    Img_EfxSkillE,
    Img_EfxSkillF,
    Img_EfxSkill10
};

CONST_DATA u16 *PalLut_EfxSkill[] = {
    Pal_EfxSkill1,
    Pal_EfxSkill2,
    Pal_EfxSkill3,
    Pal_EfxSkill4,
    Pal_EfxSkill5,
    Pal_EfxSkill6,
    Pal_EfxSkill7,
    Pal_EfxSkill8,
    Pal_EfxSkill9,
    Pal_EfxSkillA,
    Pal_EfxSkillB,
    Pal_EfxSkillC,
    Pal_EfxSkillD,
    Pal_EfxSkillE,
    Pal_EfxSkillF,
    Pal_EfxSkill10
};

void NewEfxSkillType01BG(struct Anim *anim)
{
    struct ProcEfxSkill *proc;
    proc = Proc_Start(ProcScr_efxSkillType01BG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->time_lut = FrameLut_EfxSkill;
    proc->tsa_lut = TsaLut_EfxSkill;
    proc->tsa_cur = TsaLut_EfxSkill;
    proc->img_lut = ImgLut_EfxSkill;
    proc->pal_lut = PalLut_EfxSkill;

    sub_80551B0();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }

    EfxSkillSetAnimState(proc->anim);
    EfxSkillSetAnimState(GetCoreAIStruct(proc->anim));

    EkrSoundSomeBark(0x3D1, 0x100, proc->anim->xPosition, 1);
}

void EfxSkillType01BGMain(struct ProcEfxSkill *proc)
{
    u8 i;
    int ret;

    ret = EfxGetNextFrameIndex((void *)&proc->timer, (void *)&proc->unk44, proc->time_lut);

    if (ret >= 0) {
        u16 **tsa = proc->tsa_lut;
        u16 **tsa_ = proc->tsa_cur;
        u16 **img = proc->img_lut;
        u16 **pal = proc->pal_lut;

        sub_8055670(proc->anim, tsa[ret], tsa_[ret]);
        SomeImageStoringRoutine_SpellAnim2(img[ret], 0x2000);
        SomePaletteStoringRoutine_SpellAnim2(pal[ret], 0x20);

        for (i = 0; i < 0x14; i++) {
            gBG1TilemapBuffer[0x20 * i + 0x1E] = gBG1TilemapBuffer[0];
            gBG1TilemapBuffer[0x20 * i + 0x1F] = gBG1TilemapBuffer[0];
        }

        sub_80551B0();
        return;
    }

    if (ret != -1)
        return;

    ClearBG1();
    SetDefaultColorEffects_();

    EfxSkillResetAnimState(proc->anim);
    EfxSkillResetAnimState(GetCoreAIStruct(proc->anim));

    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxSkillCommonBG[] = {
    PROC_NAME("efxSkillCommonBG"),
    PROC_REPEAT(sub_806E6E0),
    PROC_REPEAT(sub_806E868),
    PROC_REPEAT(sub_806E610),
    PROC_REPEAT(sub_806E638),
    PROC_REPEAT(sub_806E8A4),
    PROC_REPEAT(sub_806E79C),
    PROC_END
};

void NewEfxSkillCommonBG(struct Anim *anim, u8 val)
{
    struct ProcEfxSkill *proc;
    proc = Proc_Start(ProcScr_efxSkillCommonBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk3A = val;

    proc->time_lut = FrameLut_EfxSkill;
    proc->tsa_lut = TsaLut_EfxSkill;
    proc->tsa_cur = TsaLut_EfxSkill;
    proc->img_lut = ImgLut_EfxSkill;
    proc->pal_lut = PalLut_EfxSkill;

    sub_80551B0();

    anim = GetCoreAIStruct(proc->anim);
    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void sub_806E610(struct ProcEfxSkill *proc)
{
    EkrSoundSomeBark(0x3D1, 0x100, proc->anim->xPosition, 1);
    Proc_Break(proc);
}

void sub_806E638(struct ProcEfxSkill *proc)
{
    u8 i;
    int ret;
    struct Anim *anim = GetCoreAIStruct(proc->anim);
    ret = EfxGetNextFrameIndex((void *)&proc->timer, (void *)&proc->unk44, proc->time_lut);

    if (ret >= 0) {
        u16 **tsa = proc->tsa_lut;
        u16 **tsa_ = proc->tsa_cur;
        u16 **img = proc->img_lut;
        u16 **pal = proc->pal_lut;

        sub_8055670(anim, tsa[ret], tsa_[ret]);
        SomeImageStoringRoutine_SpellAnim2(img[ret], 0x2000);
        SomePaletteStoringRoutine_SpellAnim2(pal[ret], 0x20);

        for (i = 0; i < 0x14; i++) {
            gBG1TilemapBuffer[0x20 * i + 0x1E] = gBG1TilemapBuffer[0];
            gBG1TilemapBuffer[0x20 * i + 0x1F] = gBG1TilemapBuffer[0];
        }

        return;
    }

    if (ret != -1)
        return;

    if (proc->unk3A == 1)
        SetUnitEfxDebuff(anim, UNIT_STATUS_12);

    ClearBG1();
    SetDefaultColorEffects_();
    Proc_Break(proc);
}

void sub_806E6E0(struct ProcEfxSkill *proc)
{
    EfxSkillSetAnimState(proc->anim);
    EfxSkillSetAnimState(GetCoreAIStruct(proc->anim));
    Proc_Break(proc);
}

void sub_806E79C(struct ProcEfxSkill *proc)
{
    EfxSkillResetAnimState(proc->anim);
    EfxSkillResetAnimState(GetCoreAIStruct(proc->anim));
    Proc_Break(proc);
}

void sub_806E868(struct ProcEfxSkill *proc)
{
    int val = GetAnimationStartFrameMaybe();

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (proc->timer == (val + 0xA))
        Proc_Break(proc);
}

void sub_806E8A4(struct ProcEfxSkill *proc)
{
    struct Anim *anim = GetCoreAIStruct(proc->anim);
    int val = GetAnimationStartFrameMaybe();

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(anim, -1);
        return;
    }

    if (proc->timer == (val + 0xA)) {
        anim->state3 |= 0x40;
        Proc_Break(proc);
    }
}
