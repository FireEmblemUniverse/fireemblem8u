#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct Anim *gAnims[4];

struct ProcEfxSkill {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;

    /* 30 */ STRUCT_PAD(0x30, 0x44);

    /* 44 */ u32 unk44;
    /* 48 */ const u16 *time_lut;
    /* 4C */ u16 **tsa_lut;
    /* 50 */ u16 **tsa_cur;
    /* 54 */ u16 **img_lut;
    /* 58 */ u16 **pal_lut;
    /* 5C */ struct Anim *anim;
};

extern const u16 gUnknown_080DF5D6[];

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

void NewEfxSkillType01BG(struct Anim *anim)
{
    struct ProcEfxSkill *proc;
    proc = Proc_Start(ProcScr_efxSkillType01BG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->time_lut = gUnknown_080DF5D6;
    proc->tsa_lut = TsaLut_EfxSkillType01BG;
    proc->tsa_cur = TsaLut_EfxSkillType01BG;
    proc->img_lut = ImgLut_EfxSkillType01BG;
    proc->pal_lut = PalLut_EfxSkillType01BG;

    sub_80551B0();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(proc->anim) == EKR_BATTLE_LEFT)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }

    EfxSkillSetAnimState(proc->anim);
    EfxSkillSetAnimState(GetCoreAIStruct(proc->anim));

    EkrSoundSomeBark(0x3D1, 0x100, proc->anim->xPosition, 1);
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

void EfxSkillType01BGMain(struct ProcEfxSkill *proc)
{
    u8 i;
    int ret;

    ret = sub_80558F4(&proc->timer, &proc->unk44, proc->time_lut);

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
