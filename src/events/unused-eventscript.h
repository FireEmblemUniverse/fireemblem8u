#include "gbafe.h"

CONST_DATA EventListScr EventScr_UnkCh3B_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088D0F5C)
    ENUN
    LOAD1(0x1, UnitDef_088D1038)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_089FF474[] = {
    ENDA
};

CONST_DATA EventListScr EventScr_UnkCh3B_EndingScene[] = {
    MNCH(0x3b)
    ENDA
};

CONST_DATA u8 gAutoUdefJids[8] = {
    0x58, 0x5B, 0x5F, 0x61, 0, 0, 0, 0
};

void AutoGenerateUnitdef(u8 idx, int jid, s8 x_from, s8 y_from, s8 x_to, s8 y_to)
{
    struct REDA * reda;

    reda = gUdefREDAs;
    reda[idx].x = x_to;
    reda[idx].y = y_to;
    reda[idx].flags = 0;
    reda[idx].a = 0;
    reda[idx].b = 0xFFFF;
    reda[idx].delayFrames = 30;


    gUdefs[idx].charIndex = CHARACTER_EIRIKA;
    gUdefs[idx].classIndex = jid;
    gUdefs[idx].leaderCharIndex = 0;
    gUdefs[idx].autolevel = false;
    gUdefs[idx].allegiance = FACTION_ID_RED;
    gUdefs[idx].level = 1;
    gUdefs[idx].xPosition = x_from;
    gUdefs[idx].yPosition = y_from;
    gUdefs[idx].genMonster = false;
    gUdefs[idx].itemDrop = true;
    gUdefs[idx].unk_05_7 = false;
    gUdefs[idx].extraData = 0;
    gUdefs[idx].redaCount = 1;
    gUdefs[idx].redas = &reda[idx];

    gUdefs[idx].items[0] = 0;
    gUdefs[idx].items[1] = 0;
    gUdefs[idx].items[2] = 0;
    gUdefs[idx].items[3] = 0;

    gUdefs[idx].ai[0] = 0;
    gUdefs[idx].ai[1] = 0;
    gUdefs[idx].ai[2] = 0;
    gUdefs[idx].ai[3] = 0;
}

void sub_808679C(void)
{
#if NONMATCHING
    AutoGenerateUnitdef(0, gAutoUdefJids[0 + 4 * gUdefCnt], 0, 2, 14, 2);
    AutoGenerateUnitdef(1, gAutoUdefJids[1 + 4 * gUdefCnt], 0, 3, 14, 3);
    AutoGenerateUnitdef(2, gAutoUdefJids[2 + 4 * gUdefCnt], 0, 4, 14, 4);
    AutoGenerateUnitdef(3, gAutoUdefJids[3 + 4 * gUdefCnt], 0, 5, 14, 5);
#else
    int val;
    u8 jid;
    u8 * jid_lut;

    jid = gAutoUdefJids[0 + 4 * gUdefCnt];
    AutoGenerateUnitdef(0, jid, 0, 2, 14, 2);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 1;
    jid = jid_lut[val];
    AutoGenerateUnitdef(1, jid, 0, 3, 14, 3);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 2;
    jid = jid_lut[val];
    AutoGenerateUnitdef(2, jid, 0, 4, 14, 4);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 3;
    jid = jid_lut[val];
    AutoGenerateUnitdef(3, jid, 0, 5, 14, 5);
#endif

    /* Terminator */
    gUdefs[4].charIndex = 0;

    gUdefCnt++;
    if (gAutoUdefJids[4 * gUdefCnt] == 0)
        gUdefCnt = 0;
}

CONST_DATA EventListScr EventScr_9FF488[] = {
LABEL(0x0)
    STAL1(65535)
    CLEA
    CLEE
    CLEN
    ASMC(sub_808679C)
    LOAD2(0x1, gUdefs)
    ENUN
    GOTO(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_DebugMap_BeginningScene[] = {
    LOAD1(0x0, UnitDef_088D118C)
    ENUN
    LOAD1(0x1, UnitDef_088D1650)
    ENUN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_DebugMap_EndingScene[] = {
    MNCH(0x3c)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4E4[] = {
    BROWNBOXTEXT(0x2b, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4F4[] = {
    FADI(64)
    CHECK_EVBIT(2)
    BNE(0x8129, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x0)
    FADU(64)
    BROWNBOXTEXT(0x160, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8129)
    CHECK_EVBIT(2)
    BNE(0x812a, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1)
    FADU(64)
    BROWNBOXTEXT(0x161, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812a)
    CHECK_EVBIT(2)
    BNE(0x812b, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x2)
    FADU(64)
    BROWNBOXTEXT(0x162, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812b)
    CHECK_EVBIT(2)
    BNE(0x812c, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3)
    FADU(64)
    BROWNBOXTEXT(0x163, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812c)
    CHECK_EVBIT(2)
    BNE(0x812d, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4)
    FADU(64)
    BROWNBOXTEXT(0x164, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812d)
    CHECK_EVBIT(2)
    BNE(0x812e, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x6)
    FADU(64)
    BROWNBOXTEXT(0x166, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812e)
    CHECK_EVBIT(2)
    BNE(0x812f, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x7)
    FADU(64)
    BROWNBOXTEXT(0x167, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812f)
    CHECK_EVBIT(2)
    BNE(0x8130, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x8)
    FADU(64)
    BROWNBOXTEXT(0x168, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8130)
    CHECK_EVBIT(2)
    BNE(0x8131, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x9)
    FADU(64)
    BROWNBOXTEXT(0x169, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8131)
    CHECK_EVBIT(2)
    BNE(0x8132, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xa)
    FADU(64)
    BROWNBOXTEXT(0x16a, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8132)
    CHECK_EVBIT(2)
    BNE(0x8133, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xb)
    FADU(64)
    BROWNBOXTEXT(0x16b, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8133)
    CHECK_EVBIT(2)
    BNE(0x8134, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xc)
    FADU(64)
    BROWNBOXTEXT(0x16c, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8134)
    CHECK_EVBIT(2)
    BNE(0x8135, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xd)
    FADU(64)
    BROWNBOXTEXT(0x16d, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8135)
    CHECK_EVBIT(2)
    BNE(0x8136, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xe)
    FADU(64)
    BROWNBOXTEXT(0x16e, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8136)
    CHECK_EVBIT(2)
    BNE(0x8137, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xf)
    FADU(64)
    BROWNBOXTEXT(0x16f, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8137)
    CHECK_EVBIT(2)
    BNE(0x8138, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x10)
    FADU(64)
    BROWNBOXTEXT(0x170, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8138)
    CHECK_EVBIT(2)
    BNE(0x8139, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x11)
    FADU(64)
    BROWNBOXTEXT(0x171, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8139)
    CHECK_EVBIT(2)
    BNE(0x813a, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x12)
    FADU(64)
    BROWNBOXTEXT(0x172, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813a)
    CHECK_EVBIT(2)
    BNE(0x813b, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x13)
    FADU(64)
    BROWNBOXTEXT(0x173, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813b)
    CHECK_EVBIT(2)
    BNE(0x813c, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x14)
    FADU(64)
    BROWNBOXTEXT(0x174, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813c)
    CHECK_EVBIT(2)
    BNE(0x813d, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x15)
    FADU(64)
    BROWNBOXTEXT(0x175, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813d)
    CHECK_EVBIT(2)
    BNE(0x813e, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x17)
    FADU(64)
    BROWNBOXTEXT(0x177, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813e)
    CHECK_EVBIT(2)
    BNE(0x813f, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x18)
    FADU(64)
    BROWNBOXTEXT(0x178, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813f)
    CHECK_EVBIT(2)
    BNE(0x8140, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x19)
    FADU(64)
    BROWNBOXTEXT(0x179, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8140)
    CHECK_EVBIT(2)
    BNE(0x8141, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1a)
    FADU(64)
    BROWNBOXTEXT(0x17a, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8141)
    CHECK_EVBIT(2)
    BNE(0x8142, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1b)
    FADU(64)
    BROWNBOXTEXT(0x17b, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8142)
    CHECK_EVBIT(2)
    BNE(0x8143, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1c)
    FADU(64)
    BROWNBOXTEXT(0x17c, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8143)
    CHECK_EVBIT(2)
    BNE(0x8144, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1d)
    FADU(64)
    BROWNBOXTEXT(0x17d, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8144)
    CHECK_EVBIT(2)
    BNE(0x8145, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1e)
    FADU(64)
    BROWNBOXTEXT(0x17e, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8145)
    CHECK_EVBIT(2)
    BNE(0x8146, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1f)
    FADU(64)
    BROWNBOXTEXT(0x17f, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8146)
    CHECK_EVBIT(2)
    BNE(0x8147, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x20)
    FADU(64)
    BROWNBOXTEXT(0x180, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8147)
    CHECK_EVBIT(2)
    BNE(0x8148, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x21)
    FADU(64)
    BROWNBOXTEXT(0x181, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8148)
    CHECK_EVBIT(2)
    BNE(0x8149, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x22)
    FADU(64)
    BROWNBOXTEXT(0x182, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8149)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3c)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFB38[] = {
    BROWNBOXTEXT(0x2c, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFB48[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0x72)
    REMOVEPORTRAITS
LABEL(0x0)
    BACG(0x37)
    FADU(16)
    FACE_SHOW(EVT_SLOT_1, 0xffff)
    TEXTEND
    STAL1(65535)
    REMA
    FADI(16)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_2, EVT_SLOT_1)
    BLT(0x0, EVT_SLOT_2, EVT_SLOT_3)
    CLEAN
    FADU(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFBA8[] = {
    BROWNBOXTEXT(0x2d, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFBB8[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x35)
    REMOVEPORTRAITS
LABEL(0x0)
    BACG(0xffff)
    FADU(16)
    STAL1(65535)
    FADI(16)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_2, EVT_SLOT_1)
    BLT(0x0, EVT_SLOT_2, EVT_SLOT_3)
    CLEAN
    FADU(16)
    EVBIT_T(7)
    ENDA
};
