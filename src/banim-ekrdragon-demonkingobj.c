#include "gbafe.h"

CONST_DATA struct ProcCmd ProcScr_08801800[] = {
    PROC_CALL(sub_8077D30),
    PROC_REPEAT(sub_8077D38),
};

void sub_8077D30(struct Proc08801800 *proc)
{
    proc->timer = 0;
}

/* This function is unusable */
void sub_8077D38(struct Proc08801800 *proc)
{
    sub_8077EAC(-gUnknown_03004FA0 + gEkrBgPosition, -gUnknown_03004FA4);
    EkrDragonTmCpyExt(-gUnknown_03004FA0 + gEkrBgPosition, -gUnknown_03004FA4);
    proc->timer++;
}

void sub_8077D80(s16 *out1, s16 *out2, int val1, int val2)
{
    s16 *ref = gUnknown_08801AAC[val2];
    int ret = (val1 % ref[0]) * 2 + 1;
    *out1 = ref[ret];
    *out2 = ref[ret + 1];
}

void sub_8077DB4(int a, int b)
{
    gUnknown_03004FA0 = a;
    gUnknown_03004FA4 = b;
}

CONST_DATA struct ProcCmd ProcScr_08801810[] = {
    PROC_SET_END_CB(sub_8077E9C),
    PROC_CALL(sub_8077DC8),
    PROC_CALL(sub_8077E64),
    PROC_REPEAT(sub_8077E6C),
    PROC_WHILE_EXISTS(ProcScr_08801840),
    PROC_END
};

void sub_8077DC8(void)
{
    Decompress(Tsa_087F45D0, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    sub_8077EAC(gEkrBgPosition, 0);
    SetBlackPal(0x1);
    EnablePaletteSync();
    CpuFill16(0, (void *)(BG_VRAM + 0x2000), 0x1000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SetBlendConfig(0x1, 0x0, 0x10, 0x0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 1);
}

void sub_8077E64(struct Proc08801810 *proc)
{
    proc->timer1 = 0;
    proc->timer2 = 0;
}

void sub_8077E6C(struct Proc08801810 *proc)
{
    if (++proc->timer1 == 0x18) {
        sub_8077EEC(proc->timer2, proc);
        proc->timer1 = 0;
        
        if (++proc->timer2 > 0xF)
            Proc_Break(proc);
    }
}

void sub_8077E9C(void)
{
    SpellFx_ClearBG1();
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void sub_8077EAC(int x, int y)
{
    int type = gEkrDistanceType;
    switch (type) {
    case EKR_DISTANCE_CLOSE:
        x += 0x8;
        break;
    
    case EKR_DISTANCE_FAR:
        x += 0x20;
        break;

    case EKR_DISTANCE_FARFAR:
        x += 0x20;
        break;
    }

    BG_SetPosition(BG_1, x, y);
}

CONST_DATA struct ProcCmd ProcScr_08801840[] = {
    PROC_CALL(sub_8077F04),
    PROC_REPEAT(sub_8077F10),
    PROC_END
};

void sub_8077EEC(int ref, ProcPtr parent)
{
    struct Proc08801840 *proc;
    proc = Proc_Start(ProcScr_08801840, parent);
    proc->ref = ref;
}

void sub_8077F04(struct Proc08801840 *proc)
{
    proc->ref = 0;
    proc->timer = 0;
}

void sub_8077F10(struct Proc08801840 *proc)
{
    int i = 0;
    for (i = 0; i < 6; i++)
        sub_8077F9C((void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20, gUnknown_08801AB4[i][proc->timer]);

    if (proc->timer > 0x3E)
        Proc_Break(proc);
    else {
        proc->timer++;

        for (i = 0; i < 6; i++)
            sub_8077F9C((void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20, gUnknown_08801AB4[i][proc->timer]);

        if (proc->timer > 0x3E)
            Proc_Break(proc);
        else
            proc->timer++;
    }
}

CONST_DATA u16 gUnknown_08801858[] = {
    0x000F, 0x00F0, 0x0F00, 0xF000
};
CONST_DATA u16 gUnknown_08801860[] = {
    0x0001, 0x0010, 0x0100, 0x1000
};

void sub_8077F9C(u16 *buf, int a)
{
    u16 *dst = &buf[a >> 2];
    *dst &= ~gUnknown_08801858[a & 3];
    *dst |= gUnknown_08801860[a & 3];
}

void CopyPalWithFade(const u16 *src, u16 *dst, int ref)
{
    int i;
    int r, g, b;
    for (i = 0; i < 0x10; i++) {
        if (src[i] == 0) {
            dst[i] = 0;
            continue;
        }

        r = RED_VALUE_(src[i]);
        g = (0x3E0 & src[i]) >> 5;
        b = (0x7C00 & src[i]) >> 10;

        r += ref;
        g += ref;
        b += ref;

        if (r < 0) r = 0;
        if (g < 0) g = 0;
        if (b < 0) b = 0;

        if (r > 0x1F) r = 0x1F;
        if (g > 0x1F) g = 0x1F;
        if (b > 0x1F) b = 0x1F;

        dst[i] = (b << 10) + (g << 5) + r;
    }
}

CONST_DATA struct ProcCmd ProcScr_ekrSelfThunder[] = {
    PROC_NAME("efxSelfThunder"),
    PROC_REPEAT(EkrSelfThunderMain),
    PROC_END
};

void NewEkrSelfThunder(struct Anim *anim)
{
    struct ProcEfxDKfx *proc;
    PlaySFX(0x37E, 0x100,0x78, 0x0);
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_ekrSelfThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EkrSelfThunderMain(struct ProcEfxDKfx *proc)
{
    int time = ++proc->timer;
    if (time == 0x1) {
        NewEkrSelfThunderBG(proc->anim);
        return;
    }

    if (time == 0x15)
        return;

    if (time == 0x46) {
        Proc_Break(proc);
        return;
    }
}

void EfxSelfThunderBGUpdateAnimTSA(struct Anim *anim, const u16 *tsa_close, const u16 *tsa_far)
{
    u16 *buffer;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(tsa_close, gEkrTsaBuffer);
    else
        LZ77UnCompWram(tsa_far, gEkrTsaBuffer);

    buffer = gEkrTsaBuffer;
    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBG(buffer, gBG1TilemapBuffer, 32, 20, 1, 256);
    else
        EfxTmCpyBgHFlip(buffer, gBG1TilemapBuffer, 32, 20, 1, 256);
    
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_ekrSelfThunderBG[] = {
    PROC_NAME("efxSelfThunderBG"),
    PROC_CALL(EfxSelfThunderBGOnInit),
    PROC_REPEAT(EfxSelfThunderBGMain),
    PROC_END
};

void NewEkrSelfThunderBG(struct Anim *anim)
{
    struct ProcSelfThunderBG *proc;
    proc = Proc_Start(ProcScr_ekrSelfThunderBG, PROC_TREE_3);
    proc->anim = anim;
    SpellFx_SetSomeColorEffect();
}

void EfxSelfThunderBGUpdateAnim(struct ProcSelfThunderBG *proc, u16 *img, u16 *tsa_close, u16 *tsa_far, u16 *pal)
{
    SpellFx_RegisterBgGfx(img, 0x0C00);
    SpellFx_RegisterBgPal(pal, 0x20);
    EfxSelfThunderBGUpdateAnimTSA(proc->anim, tsa_close, tsa_far);
}

void EfxSelfThunderBGOnInit(struct ProcSelfThunderBG *proc)
{
    proc->frame = 0;
    proc->timer = gEfxSelfThunderBGFrames[0].duration;
    EfxSelfThunderBGUpdateAnim(proc, gEfxSelfThunderBGFrames[0].img, gEfxSelfThunderBGFrames[0].tsa1, gEfxSelfThunderBGFrames[0].tsa2, gEfxSelfThunderBGFrames[0].pal);
}

void EfxSelfThunderBGMain(struct ProcSelfThunderBG *proc)
{
    int frame;

    if (proc->timer == 0) {
        frame = ++proc->frame;
        proc->timer = gEfxSelfThunderBGFrames[frame].duration;

        if (proc->timer == -1) {
            SpellFx_ClearBG1();
            SetDefaultColorEffects_();
            Proc_Break(proc);
            return;
        }

        EfxSelfThunderBGUpdateAnim(proc, gEfxSelfThunderBGFrames[frame].img, gEfxSelfThunderBGFrames[frame].tsa1, gEfxSelfThunderBGFrames[frame].tsa2, gEfxSelfThunderBGFrames[frame].pal);
    }

    proc->timer--;
}
