#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "uiutils.h"
#include "hardware.h"

void sub_8050E40(void *_src, void *_dst)
{
    u16 *src = _src;
    u16 *dst = _dst;
    u32 i, val;

    for (i = 0; i < 11; i++) {
        u32 val = *src == 0xFF ? 0xF : *src;
        CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802904, val, 0), &PAL_BUF_COLOR(dst, i, 0), 0x10 * sizeof(u16));
        src++;
    }

    CpuFastFill(0, &PAL_BUF_COLOR(dst, 0xC, 0), 0x10 * sizeof(u16));
}

/**
 * buf[0] = val % 100
 * buf[1] = (val - [val]) % 10
 * buf[1] = (val - [val]) % 1
 * 
 * example:
 * in 312, out 3, 1, 2
 * 
 * in 458, out 4, 5, 8
 */
void ModDec(s16 val, u16 buf[])
{
    if (val == -1) {
        buf[0] = 11;
        buf[1] = 10;
        buf[2] = 10;
        return;
    }

    buf[0] = Div(val, 100);

    val -= buf[0] * 100;
    buf[1] = Div(val, 10);

    val -= buf[1] * 10;
    buf[2] = val;

    if (buf[0] == -buf[1])
        buf[1] = 11;

    if (buf[0] == 0)
        buf[0] = 11;
}

void NewEkrGauge(void)
{
    u32 i, j;

    gpProcEkrGauge = Proc_Start(gProc_ekrGauge, PROC_TREE_1);

    EkrGauge_Setup44(0);
    EkrGauge_Clr4C50();
    EkrGauge_Clr2A();
    EkrGauge_ClrInitFlag();
    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

    if (gEkrPairHpInitial[0] > 0x50)
        CpuCopy16(gUnknown_08802C84, PAL_OBJ(0xB), 0x10 * sizeof(u16));
    else
        CpuCopy16(gUnknown_08802B04 + gBanimSomeObjPalIndex[0] * 0x10, PAL_OBJ(0xB), 0x10 * sizeof(u16));

    if (gEkrPairHpInitial[1] > 0x50)
        CpuCopy16(gUnknown_08802C84, PAL_OBJ(0xC), 0x10 * sizeof(u16));
    else
        CpuCopy16(gUnknown_08802B04 + gBanimSomeObjPalIndex[1] * 0x10, PAL_OBJ(0xC), 0x10 * sizeof(u16));

    gUnknown_0203E1B4[0] = -1;
    gUnknown_0203E1B4[1] = -1;

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, (void *)0x6013800);
    LZ77UnCompVram(Img_EfxWTAArrow1, (void *)0x6013940);
    LZ77UnCompVram(Img_EfxWTAArrow2, (void *)0x6013D40);

    CpuFastCopy(gUnknown_08802884 + gBanimSomeObjPalIndex[0] * 0x10, PAL_OBJ(0x5), 0x10 * sizeof(u16));
    CpuFastCopy(gUnknown_08802884 + gBanimSomeObjPalIndex[1] * 0x10, PAL_OBJ(0x6), 0x10 * sizeof(u16));

    EnablePaletteSync();

    /* decode value to number for display: 998 --> 9 9 8 */
    ModDec(gEkrPairHit[0], &gDecodedEkrHitDmgCritBuf[0x0]);
    ModDec(gEkrPairDmgPair[0], &gDecodedEkrHitDmgCritBuf[0x3]);
    ModDec(gEkrPairCritPair[0], &gDecodedEkrHitDmgCritBuf[0x6]);

    ModDec(gEkrPairHit[1], &gDecodedEkrHitDmgCritBuf[0x9]);
    ModDec(gEkrPairDmgPair[1], &gDecodedEkrHitDmgCritBuf[0xC]);
    ModDec(gEkrPairCritPair[1], &gDecodedEkrHitDmgCritBuf[0xF]);

    CpuFastFill(0, gObjBuf_EkrSideHitDmgCrit, 0x400);

    /* value of hit & dmg & crit */
    for (i = 0; i < 6; i++) {
        for (j = 0; j < 3; j++) {
            int r4 = i * 0x40 + j * 0x10;

            CpuCopy16(
                gUnknown_088026E4 + gDecodedEkrHitDmgCritBuf[i * 3 + j] * 0x10,
                gObjBuf_EkrSideHitDmgCrit + r4,
                0x10 * sizeof(u16));
        }
    }

    /* left side of hit & dmg & crit */
    RegisterTileGraphics(gObjBuf_EkrSideHitDmgCrit, (void *)0x6013A00, 0xC0 * sizeof(u16));

    /* right side of hit & dmg & crit */
    RegisterTileGraphics(gObjBuf_EkrSideHitDmgCrit + 0xC0, (void *)0x6013E00, 0xC0 * sizeof(u16));

    ResetIconGraphics_();
    LoadIconPalette(0, 0x1D);
    LoadIconPalette(0, 0x1E);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitLeft->weaponBefore), 0x1DC);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitRight->weaponBefore), 0x1DE);
    CopyToPaletteBuffer(gPal_MiscUiGraphics, 0x200, 0x20);
}

void EndEkrGauge(void)
{
    Proc_End(gpProcEkrGauge);
}

void EkrGauge_Clr4C50(void)
{
    gpProcEkrGauge->unk4C = 0;
    gpProcEkrGauge->unk50 = 0;
}

void EkrGauge_Set4C50(void)
{
    gpProcEkrGauge->unk4C = 1;
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Set4C(void)
{
    gpProcEkrGauge->unk4C = 1;
}

void EkrGauge_Set50(void)
{
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Setup44(u16 val)
{
    gpProcEkrGauge->unk44 = val * 0x400;
}

void EkrGauge_Clr323A(int x, int y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_Setxy323A(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_SetInitFlag(void)
{
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_ClrInitFlag(void)
{
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_Set2A(void)
{
    gpProcEkrGauge->unk2A = true;
}

void EkrGauge_Clr2A(void)
{
    gpProcEkrGauge->unk2A = false;
}

void sub_8051238(struct EkrGaugeStruct1 *buf, int a, int b)
{
    if (a > 0) {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gUnknown_085B955C;
                return;
            }
        } else {
            buf->unk3C = gUnknown_085B9574;
            return;
        }

        buf->unk3C = gUnknown_085B958C;
    } else {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gUnknown_085B95A4;
                return;
            }
        } else {
            buf->unk3C = gUnknown_085B95BC;
            return;
        }

        buf->unk3C = gUnknown_085B95D4;
    }
}

CONST_DATA struct ProcCmd gProc_ekrGauge[] = {
    PROC_NAME("ekrGauge"),
    PROC_REPEAT(ekrGaugeMain),
    PROC_END
};
