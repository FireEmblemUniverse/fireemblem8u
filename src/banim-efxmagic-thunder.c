#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

void StartSpellAnimThunder(struct Anim *anim)
{
    struct ProcEfxMagic *proc;
    SetSomethingSpellFxToTrue();
    NewEfxSpellCast();
    ClearBG1Setup();

    proc = Proc_Start(ProcScr_efxThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = EkrCheckHitOrMiss(GetSomeAISRelatedIndexMaybe(anim));
}

void Loop6C_efxThunder(struct ProcEfxMagic *proc)
{
    struct Anim *animc = GetCoreAIStruct(proc->anim);
    int cur, frame = GetAnimationStartFrameMaybe();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);
    
    cur = proc->timer;
    if (cur == (frame + 1)) {
        NewEfxThunderBG(animc);
        NewEfxThunderBGCOL(animc);
        NewEfxThunderOBJ(animc);
        return;
    }

    if (cur == (frame + 4)) {
        animc->state3 |= 0x9;
        DoEkrOffensiveAtkHit(animc, proc->hitted);
        EkrSoundSomeBark(0xF5, 0x100, animc->xPosition, 1);

        if (proc->hitted == EKR_HITTED)
            sub_8072450(animc);
        
        return;
    }

    if (cur == (frame + 0x50))
        return;
    
    if (cur == (frame + 0x60)) {
        SetSomethingSpellFxToFalse();
        EfxSpellCastSet29();
        Proc_Break(proc);
    }
}

void NewEfxThunderBG(struct Anim *anim)
{
    struct ProcEfxMagicBG *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxThunderBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DCCA6;
    proc->unk4C = gUnknown_085D5458;
    proc->unk50 = gUnknown_085D5460;

    SomeImageStoringRoutine_SpellAnim2(gUnknown_085F2DC0, 0x10C0);
    sub_80551B0();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}

void EfxThunderBGMain(struct ProcEfxMagicBG *proc)
{
    int val, ret;

    val = 0;
    ret = sub_80558F4((s16 *)&proc->timer, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0) {
        u16 **buf1 = proc->unk4C;
        u16 **buf2 = proc->unk50;
        sub_8055670(proc->anim, buf1[ret], buf2[ret]);

        if (ret == 0)
            val = 0x11F;
        
        if (ret == 1)
            val = 0x150;
        
        FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x1E, 0x0), 0x2, 0x14, 0x1, val);
        return;
    }

    if (ret == -1) {
        ClearBG1();
        gUnknown_0201774C--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxThunderBGCOL(struct Anim *anim)
{
    struct ProcEfxMagicBGCOL *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxThunderBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk48 = gUnknown_080DCCC0;
    proc->unk4C = gUnknown_085F367C;
}

void sub_805D9F8(struct ProcEfxMagicBGCOL *proc)
{
    int ret;
    ret = sub_80558F4((s16 *)&proc->timer, (s16 *)&proc->unk44, proc->unk48);
    if (ret >= 0) {
        u16 *buf = proc->unk4C;
        SomePaletteStoringRoutine_SpellAnim2(&PAL_BUF_COLOR(buf, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        SetDefaultColorEffects_();
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}

void NewEfxThunderOBJ(struct Anim *anim)
{
    struct ProcEfxMagicOBJ *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxThunderOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxAnimCreate(anim, gUnknown_085F5550, gUnknown_085F4A24, gUnknown_085F5550, gUnknown_085F4A24);

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085F3F40, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085F3AA8, 0x1000);
}

void EfxThunderOBJMain(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer > 0x32) {
        AnimDelete(proc->anim2);
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}
