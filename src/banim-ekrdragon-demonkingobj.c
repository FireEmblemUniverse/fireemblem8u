#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "hardware.h"
#include "bmlib.h"

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
    sub_8077EAC(-gUnknown_03004FA0 + gEkrBgXOffset, -gUnknown_03004FA4);
    EkrDragonBgSetPostion(-gUnknown_03004FA0 + gEkrBgXOffset, -gUnknown_03004FA4);
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
    sub_8070E94(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    sub_8077EAC(gEkrBgXOffset, 0);
    SetBlackPal(0x1);
    EnablePaletteSync();
    CpuFill16(0, (void *)(BG_VRAM + 0x2000), 0x1000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SetSpecialColorEffectsParameters(0x1, 0x0, 0x10, 0x0);
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
    int time, i = 0;
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

void sub_8077F9C(u16 *buf, int a)
{
    u16 *dst = &buf[a >> 2];
    *dst &= ~gUnknown_08801858[a & 3];
    *dst |= gUnknown_08801860[a & 3];
}
