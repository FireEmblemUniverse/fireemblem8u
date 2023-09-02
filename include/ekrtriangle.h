#pragma once

#include "global.h"
#include "proc.h"
#include "efxbattle.h"

enum ekrtriangle_types {
    EKR_TRI_JTYPE_DEFAULT = 0,
    EKR_TRI_JTYPE_PROMOTED,

    EKR_TRI_WTYPE_DEFAULT = 0,
    EKR_TRI_WTYPE_ALTERNATIVE,
    EKR_TRI_WTYPE_ALTERNATIVE2,
};

struct ProcEkrTriangle {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriClass {
    PROC_HEADER;

    /* 2E */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ int etype1;
    /* 48 */ int etype2;
    /* 4C */ int ewtype1;
    /* 50 */ int ewtype2;
    /* 54 */ STRUCT_PAD(0x54, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriPegasusKnightBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_config;
    /* 4C */ const u16 **tsalut_left;
    /* 50 */ const u16 **tsalut_right;
    STRUCT_PAD(0x54, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriArmorKnightOBJ2 {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
    STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    STRUCT_PAD(0x36, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
};

struct ProcEfxTriagnleQUAKE {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr qproc;
};

extern CONST_DATA struct ProcCmd ProcScr_ekrTriangle[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnight[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnightBG[];
extern CONST_DATA const u16 * TsaLut_EkrTriPegagusBG[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriPegasusKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnight[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ2[];
extern CONST_DATA struct ProcCmd ProcScr_EfxTriangleQUAKE[];

bool CheckEkrTriangleInvalid(void);
void nullsub_18(void);
void NewEkrTriangle(struct Anim * anim);
void EkrTriangleMain(struct ProcEkrTriangle * proc);
ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2);
void EkrTriPegasusKnightMain(struct ProcEkrTriClass * proc);
void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void EkrTriPegasusKnightBgMain(struct ProcEkrTriPegasusKnightBG * proc);
void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void EkrTriPegasusKnightObjMain(struct ProcEfxOBJ * proc);
ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2);
void EkrTriArmorKnightMain(struct ProcEkrTriClass * proc);
void NewEkrTriArmorKnightOBJ(struct Anim * anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2);
void EkrTriArmorKnightObjMain(struct ProcEfxOBJ * proc);
void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void EkrTriArmorKnightObj2Main1(struct ProcEkrTriArmorKnightOBJ2 * proc);
void EkrTriArmorKnightObj2Main2(struct ProcEkrTriArmorKnightOBJ2 * proc);
void NewEfxTriangleQUAKE(struct Anim * anim, int duration);
void EfxTriangleQUAKEMain(struct ProcEfxTriagnleQUAKE * proc);
