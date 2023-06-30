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

/* https://decomp.me/scratch/40fgO */
#if NONMATCHING

void sub_8077F10(struct Proc08801840 *proc)
{
    int time, i = 0;
    u32 *src = gUnknown_08801AB4;
    for (i = 0; i < 6; i++) {
        u16 *buf = (void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20;
        *(u32 *)0x6002000 = *(src++);
        sub_8077F9C(buf, *((u8 *)0x6002000 + proc->timer));
    }

    time = proc->timer;
    if (time <= 0x3E) {
        proc->timer = time + 1;

        for (i = 0; i < 6; i++) {
            u16 *buf = (void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20;
            *(u32 *)0x6002000 = *(src++);
            sub_8077F9C(buf, *((u8 *)0x6002000 + proc->timer));
        }

        time = proc->timer;
        if (time <= 0x3E) {
            proc->timer = time + 1;
            return;
        }
    }

    Proc_Break(proc);
}
#else

__attribute__((naked))
void sub_8077F10(struct Proc08801840 *proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r5, r0, #0\n\
        movs r4, #0\n\
        adds r7, r5, #0\n\
        adds r7, #0x64\n\
        ldr r6, _08077F84  @ gUnknown_08801AB4\n\
    _08077F1C:\n\
        adds r0, r5, #0\n\
        adds r0, #0x64\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        lsls r1, r4, #4\n\
        adds r0, r0, r1\n\
        ldr r1, _08077F88  @ 0x000003FF\n\
        ands r0, r1\n\
        lsls r0, r0, #5\n\
        ldr r1, _08077F8C  @ 0x06002000\n\
        adds r0, r0, r1\n\
        ldm r6!, {r1}\n\
        ldr r2, [r5, #0x58]\n\
        adds r1, r1, r2\n\
        ldrb r1, [r1]\n\
        bl sub_8077F9C\n\
        adds r4, #1\n\
        cmp r4, #5\n\
        ble _08077F1C\n\
        ldr r0, [r5, #0x58]\n\
        cmp r0, #0x3e\n\
        bgt _08077F7C\n\
        adds r0, #1\n\
        str r0, [r5, #0x58]\n\
        movs r4, #0\n\
        ldr r6, _08077F84  @ gUnknown_08801AB4\n\
    _08077F52:\n\
        movs r1, #0\n\
        ldrsh r0, [r7, r1]\n\
        lsls r1, r4, #4\n\
        adds r0, r0, r1\n\
        ldr r1, _08077F88  @ 0x000003FF\n\
        ands r0, r1\n\
        lsls r0, r0, #5\n\
        ldr r1, _08077F8C  @ 0x06002000\n\
        adds r0, r0, r1\n\
        ldm r6!, {r1}\n\
        ldr r2, [r5, #0x58]\n\
        adds r1, r1, r2\n\
        ldrb r1, [r1]\n\
        bl sub_8077F9C\n\
        adds r4, #1\n\
        cmp r4, #5\n\
        ble _08077F52\n\
        ldr r0, [r5, #0x58]\n\
        cmp r0, #0x3e\n\
        ble _08077F90\n\
    _08077F7C:\n\
        adds r0, r5, #0\n\
        bl Proc_Break\n\
        b _08077F94\n\
        .align 2, 0\n\
    _08077F84: .4byte gUnknown_08801AB4\n\
    _08077F88: .4byte 0x000003FF\n\
    _08077F8C: .4byte 0x06002000\n\
    _08077F90:\n\
        adds r0, #1\n\
        str r0, [r5, #0x58]\n\
    _08077F94:\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif

#if 0
void sub_8077F9C(u16 *buf, int a)
{
    int _a = a >> 2;
    int _b = (_a << 1) % 4;
    buf[_a] &= gUnknown_08801858[_b];
    buf[_a] |= gUnknown_08801860[_b];
}
#endif
