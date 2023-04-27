#include "global.h"
#include "proc.h"
#include "ekrbattle.h"
#include "anime.h"
#include "hardware.h"
#include "efxbattle.h"

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

void sub_8051B5C(u16 a, u16 b)
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

#define gBG0TilemapBuffer2D ((u16 (*)[1])gBG0TilemapBuffer)

void ekrDispUP_Loop(struct ProcEkrDispUP *proc)
{
    int val0, val1, val2, val3, val4, val5;
    int r2 = 15; // for matching

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

    if (gEkrSomeType >= 0)
    {
        if (gEkrSomeType <= 2)
            val4 = 0;
        else
            goto label;
    }
    else
    {
        val4 = 0; // for matching, can be any value
    label:
        val4 = 15;
    }

    FillBGRect(gBG0TilemapBuffer, 30, 7, 0, 128);

    if (val2 > 0) {
        if (proc->unk4C == 0) { 
            sub_8070E94(&gUnknown_0880210C[val3], &gBG0TilemapBuffer2D[val1][val4], 15, val2, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer2D[val1][val4], 15, val2, 2, 128);
        }

        if (proc->unk50 == 0) {

            sub_8070E94(&gUnknown_088021C0[val3], &gBG0TilemapBuffer2D[val1][r2], r2, val2, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer2D[val1][r2], 15, val2, 3, 128);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
