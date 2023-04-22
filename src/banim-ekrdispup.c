#include "global.h"
#include "proc.h"
#include "ekrbattle.h"
#include "anime.h"
#include "hardware.h"
#include "ekrefxbattle.h"

CONST_DATA struct ProcCmd gProc_ekrDispUP[] = {
    PROC_NAME("ekrDispUP"),
    PROC_REPEAT(ekrDispUP_Loop),
    PROC_END
};

void NewEkrDispUP(void)
{
    gpProcEkrDispUP = Proc_Start(gProc_ekrDispUP, PROC_TREE_5);
    EkrDispUP_8051B48(0, 0);
    EkrDispUpClear4C50();
    sub_8051BA0();
    sub_8051B80();
}

void EndEkrDispUP(void)
{
    Proc_End(gpProcEkrDispUP);
}

void EkrDispUpClear4C50(void)
{
    gpProcEkrDispUP->unk4C = 0;
    gpProcEkrDispUP->unk50 = 0;
}

void EkrDispUpSet4C50(void)
{
    gpProcEkrDispUP->unk4C = 1;
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUpSet4C(void)
{
    gpProcEkrDispUP->unk4C = 1;
}

void EkrDispUpSet50(void)
{
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUP_8051B48(u32 a, u32 b)
{
    gpProcEkrDispUP->unk32 = a;
    gpProcEkrDispUP->unk3A = b;
    gpProcEkrDispUP->unk29 = 0;
}

void sub_8051B5C(u32 a, u32 b)
{
    gpProcEkrDispUP->unk32 = a;
    gpProcEkrDispUP->unk3A = b;
    gpProcEkrDispUP->unk29 = 1;
}

void sub_8051B70(void)
{
    gpProcEkrDispUP->unk29 = 1;
}

void sub_8051B80(void)
{
    gpProcEkrDispUP->unk29 = 0;
}

void sub_8051B90(void)
{
    gpProcEkrDispUP->unk2A = 1;
}

void sub_8051BA0(void)
{
    gpProcEkrDispUP->unk2A = 0;
}

/* https://decomp.me/scratch/NfVLP */
#if NONMATCHING

void ekrDispUP_Loop(struct ProcEkrDispUP *proc)
{
    int val0, val1, val2, val3, val4, val5;

    if (proc->unk2A == 1)
        return;

    if (proc->unk29 != 0)
        return;

    val0 = (proc->unk3A << 0x10) >> 0x13;
    val1 = val0 << 5;
    if (val1 < 0)
        val1 = 0;

    val2 = val0 + 7;
    if (val2 > 6)
        val2 = 6;

    val3 = 30 * (6 - val2);

    if (gUnknown_0203E120 < 0)
        val4 = 15;
    else if (gUnknown_0203E120 > 2)
        val4 = 15;
    else
        val4 = 0;

    FillBGRect(gBG0TilemapBuffer, 30, 7, 0, 128);

    if (val2 > 0) {
        if (proc->unk4C == 0) { 
            sub_8070E94(&gUnknown_0880210C[val3], &gBG0TilemapBuffer[val4 + val1], 15, val2, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer[val4 + val1], 15, val2, 2, 128);
        }

        if (proc->unk50 == 0) {
            sub_8070E94(&gUnknown_088021C0[val3], &gBG0TilemapBuffer[0xF + val1], 15, val2, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer[0xF + val1], 15, val2, 3, 128);
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

#else

__attribute__((naked))
void ekrDispUP_Loop(struct ProcEkrDispUP *proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0xc\n\
        adds r7, r0, #0\n\
        adds r0, #0x2a\n\
        ldrb r0, [r0]\n\
        cmp r0, #1\n\
        beq _08051CA6\n\
        adds r0, r7, #0\n\
        adds r0, #0x29\n\
        ldrb r0, [r0]\n\
        cmp r0, #0\n\
        bne _08051CA6\n\
        ldrh r0, [r7, #0x3a]\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x13\n\
        lsls r1, r0, #5\n\
        mov r8, r1\n\
        cmp r1, #0\n\
        bge _08051BE2\n\
        movs r2, #0\n\
        mov r8, r2\n\
    _08051BE2:\n\
        adds r6, r0, #7\n\
        cmp r6, #6\n\
        ble _08051BEA\n\
        movs r6, #6\n\
    _08051BEA:\n\
        movs r0, #6\n\
        subs r0, r0, r6\n\
        lsls r1, r0, #4\n\
        subs r1, r1, r0\n\
        lsls r1, r1, #1\n\
        str r1, [sp, #8]\n\
        ldr r0, _08051C08  @ gUnknown_0203E120\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        cmp r0, #0\n\
        blt _08051C0C\n\
        cmp r0, #2\n\
        bgt _08051C0C\n\
        movs r4, #0\n\
        b _08051C0E\n\
        .align 2, 0\n\
    _08051C08: .4byte gUnknown_0203E120\n\
    _08051C0C:\n\
        movs r4, #0xf\n\
    _08051C0E:\n\
        ldr r2, _08051CB8  @ gBG0TilemapBuffer\n\
        mov r9, r2\n\
        movs r0, #0x80\n\
        mov sl, r0\n\
        str r0, [sp]\n\
        mov r0, r9\n\
        movs r1, #0x1e\n\
        movs r2, #7\n\
        movs r3, #0\n\
        bl FillBGRect\n\
        cmp r6, #0\n\
        ble _08051CA0\n\
        ldr r0, [r7, #0x4c]\n\
        cmp r0, #0\n\
        bne _08051C64\n\
        ldr r0, _08051CBC  @ gUnknown_0880210C\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        mov r2, r8\n\
        lsls r5, r2, #1\n\
        lsls r1, r4, #1\n\
        add r1, r9\n\
        adds r5, r5, r1\n\
        lsls r4, r6, #0x10\n\
        lsrs r4, r4, #0x10\n\
        movs r1, #1\n\
        negs r1, r1\n\
        str r1, [sp]\n\
        str r1, [sp, #4]\n\
        adds r1, r5, #0\n\
        movs r2, #0xf\n\
        adds r3, r4, #0\n\
        bl sub_8070E94\n\
        mov r0, sl\n\
        str r0, [sp]\n\
        adds r0, r5, #0\n\
        movs r1, #0xf\n\
        adds r2, r4, #0\n\
        movs r3, #2\n\
        bl sub_8070D04\n\
    _08051C64:\n\
        ldr r0, [r7, #0x50]\n\
        cmp r0, #0\n\
        bne _08051CA0\n\
        ldr r0, _08051CC0  @ gUnknown_088021C0\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        mov r2, r8\n\
        lsls r5, r2, #1\n\
        movs r2, #0xf\n\
        lsls r1, r2, #1\n\
        add r1, r9\n\
        adds r5, r5, r1\n\
        lsls r4, r6, #0x10\n\
        lsrs r4, r4, #0x10\n\
        movs r1, #1\n\
        negs r1, r1\n\
        str r1, [sp]\n\
        str r1, [sp, #4]\n\
        adds r1, r5, #0\n\
        adds r3, r4, #0\n\
        bl sub_8070E94\n\
        mov r0, sl\n\
        str r0, [sp]\n\
        adds r0, r5, #0\n\
        movs r1, #0xf\n\
        adds r2, r4, #0\n\
        movs r3, #3\n\
        bl sub_8070D04\n\
    _08051CA0:\n\
        movs r0, #1\n\
        bl BG_EnableSyncByMask\n\
    _08051CA6:\n\
        add sp, #0xc\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08051CB8: .4byte gBG0TilemapBuffer\n\
    _08051CBC: .4byte gUnknown_0880210C\n\
    _08051CC0: .4byte gUnknown_088021C0\n\
        .syntax divided\n\
    ");
}

#endif
