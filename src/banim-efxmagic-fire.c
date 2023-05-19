#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

void StartSpellAnimFire(struct Anim *anim)
{
    struct ProcEfxMagic *proc;
    SetSomethingSpellFxToTrue();
    NewEfxSpellCast();
    ClearBG1Setup();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2A = 0;
    proc->hitted = EkrCheckHitOrMiss(GetSomeAISRelatedIndexMaybe(anim));
}

void StartSpellAnimElfire(struct Anim *anim)
{
    struct ProcEfxMagic *proc;
    SetSomethingSpellFxToTrue();
    NewEfxSpellCast();
    ClearBG1Setup();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2A = 1;
    proc->hitted = EkrCheckHitOrMiss(GetSomeAISRelatedIndexMaybe(anim));
}

void Loop6C_efxFire(struct ProcEfxMagic *proc)
{
    int r5, r7, r8, r9, time;
    struct Anim *animc = GetCoreAIStruct(proc->anim);

    if (0 == gEkrDistanceType) {
        r5 = 0x20;
        r7 = 0x34;
        r8 = 0x36;
        r9 = 0x55;
    } else {
        r5 = 0x28;
        r7 = 0x3C;
        r8 = 0x41;
        r9 = 0x60;
    }

    if (++proc->timer == 1) {
        NewEfxFireBG(proc->anim);
        NewEfxFireOBJ(proc->anim);
        EkrSoundSomeBark(0xF1, 0x100, proc->anim->xPosition, 1);
    }

    time = proc->timer;
    if (time == r5) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (time == r7) {
        animc->state3 |= 0x9;
        DoEkrOffensiveAtkHit(animc, proc->hitted);

        if (proc->hitted != EKR_HITTED)
            return;

        if (proc->unk2A == 0) {
            EkrSoundSomeBark(0xF7, 0x100, animc->xPosition, 1);
            StartSubSpell_efxFireHITBG(animc);
        } else {
            EkrSoundSomeBark(0xF8, 0x100, animc->xPosition, 1);
            StartSubSpell_efxElfireBG(animc);
            StartSubSpell_efxElfireBGCOL(animc);
            StartSubSpell_efxElfireOBJ(animc);
        }
        sub_8072450(animc);
        return;
    }

    if (time == r8)
        return;

    if (time == r9) {
        SetSomethingSpellFxToFalse();
        EfxSpellCastSet29();
        Proc_Break(proc);
    }
}

void NewEfxFireBG(struct Anim *anim)
{
    struct ProcEfxMagicBG *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxFireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DCD26;
    proc->unk4C = gUnknown_085D54D0;
    proc->unk50 = gUnknown_085D5500;

    SomePaletteStoringRoutine_SpellAnim2(gUnknown_085F6230, 0x20);
    SomeImageStoringRoutine_SpellAnim2(gUnknown_085F5638, 0x2000);
    sub_80551B0();
}

void Loop6C_efxFireBG(struct ProcEfxMagicBG *proc)
{
    int ret;
    ret = sub_80558F4((s16 *)&proc->timer, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0) {
        u16 **buf1 = proc->unk4C;
        u16 **buf2 = proc->unk50;
        sub_8055670(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        ClearBG1();
        gUnknown_0201774C--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxFireOBJ(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxMagicOBJ *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxFireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxAnimCreate(anim, gUnknown_085F843C, gUnknown_085F80B4, gUnknown_085F8468, gUnknown_085F80E0);
    proc->anim2 = anim2;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->xPosition = anim->xPosition - 0x8;
    else
        anim2->xPosition = anim->xPosition + 0x8;
    
    anim2->yPosition = anim->yPosition + 0x8;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085F7D64, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085F7768, 0x1000);
}

void sub_805DDA8(struct ProcEfxMagicOBJ *proc)
{
    int time = ++proc->timer;
    if (time == 0x25) {
        EkrSoundSomeBark(0xF2, 0x100, proc->anim->xPosition, 0x1);
        return;
    }

    if (time > 0x32) {
        AnimDelete(proc->anim2);
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxFireHITBG(struct Anim *anim)
{
    struct ProcEfxMagicBG *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxFireHITBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DCD72;
    proc->unk4C = gUnknown_085D55B4;
    proc->unk50 = gUnknown_085D55B4;
    proc->unk54 = gUnknown_085D5560;

    SomePaletteStoringRoutine_SpellAnim2(gUnknown_0860108C, 0x20);
    sub_80551B0();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAISSubjectId(proc->anim) == EKR_POS_L)
        BG_SetPosition(BG_1, 0x18, 0x0);
    else
        BG_SetPosition(BG_1, 0xE8, 0x0);
}

void sub_805DE74(struct ProcEfxMagicBG *proc)
{
    int ret;
    ret = sub_80558F4((s16 *)&proc->timer, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0) {
        u16 **buf1 = proc->unk4C;
        u16 **buf2 = proc->unk50;
        SomeImageStoringRoutine_SpellAnim2(proc->unk54[ret], 0x2000);
        sub_8055670(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        ClearBG1();
        gUnknown_0201774C--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }
}

void StartSubSpell_efxElfireBG(struct Anim *anim)
{
    struct ProcEfxMagicBG *proc;

    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxElfireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SomeImageStoringRoutine_SpellAnim2(gUnknown_08602B94, 0x2000);
    sub_8055670(proc->anim, gUnknown_08603D50, gUnknown_08603D50);
    ClearBG1Setup();
    sub_80551B0();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAISSubjectId(proc->anim) == EKR_POS_L)
        BG_SetPosition(BG_1, 0x18, 0x0);
    else
        BG_SetPosition(BG_1, 0xE8, 0x0);
    
    sub_8070DBC(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x1E, 0x0), 2, 0x14, 0x1, 0x100);
}

void sub_805DF70(struct ProcEfxMagicBG *proc)
{
    if (++proc->timer == 0x28) {
        ClearBG1();
        SetDefaultColorEffects_();
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxElfireBGCOL(struct Anim *anim)
{
    struct ProcEfxMagicBGCOL *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxElfireBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DCDE4;
    proc->unk4C = gUnknown_08603B50;
    SomePaletteStoringRoutine_SpellAnim2(gUnknown_08603B50, 0x20);
}

void sub_805DFE8(struct ProcEfxMagicBGCOL *proc)
{
    int ret;
    ret = sub_80558F4((s16 *)&proc->timer, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0) {
        u16 *buf = proc->unk4C;
        SomePaletteStoringRoutine_SpellAnim2(&PAL_BUF_COLOR(buf, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxElfireOBJ(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxMagicOBJ *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxElfireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxAnimCreate(anim, gUnknown_08605DF4, gUnknown_08604FD4, gUnknown_08605DF4, gUnknown_08604FD4);
    proc->anim2 = anim2;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->xPosition = anim2->xPosition - 0x8;
    else
        anim2->xPosition = anim2->xPosition + 0x8;
    
    anim2->oamBase = anim2->oamBase | 0x400;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_08604210, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_08603F98, 0x800);
}

void sub_805E0B4(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer > 0x28) {
        AnimDelete(proc->anim2);
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}
