#pragma once

#include "global.h"
#include "proc.h"

struct ProcEkrTriangle {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ struct Anim *anim;
};

struct ProcEkrTriPegasusKnight {
    PROC_HEADER;

    /* 2E */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ int ekr1;
    /* 48 */ int ekr2;
    /* 4C */ int banim1;
    /* 50 */ int banim2;
    /* 54 */ STRUCT_PAD(0x54, 0x5C);
    /* 5C */ struct Anim *anim;
};

extern CONST_DATA struct ProcCmd ProcScr_ekrTriangle[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnight[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnightBG[];
// extern ??? gUnknown_087595EC
extern CONST_DATA struct ProcCmd ProcScr_EkrTriPegasusKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnight[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ2[];
extern CONST_DATA struct ProcCmd ProcScr_EfxTriangleQUAKE[];

bool CheckEkrTriangleInvalid(void);
void nullsub_18(void);
void NewEkrTriangle(struct Anim *anim);
// ??? EkrTriangleMain(???);
ProcPtr NewEkrTriPegasusKnight(struct Anim *anim, int ekr1, int ekr2, int banim1, int banim2);
// ??? sub_80751BC(???);
// ??? NewEkrTriPegasusKnightBG(???);
// ??? sub_8075308(???);
// ??? sub_8075350(???);
// ??? sub_80753FC(???);
void NewEkrTriArmorKnight(struct Anim *anim, int ekr1, int ekr2, int banim1, int banim2);
// ??? sub_807545C(???);
// ??? sub_8075538(???);
// ??? sub_80756BC(???);
// ??? sub_8075718(???);
// ??? sub_8075828(???);
// ??? sub_8075874(???);
// ??? sub_807589C(???);
// ??? EfxTriangleQUAKEMain(???);
