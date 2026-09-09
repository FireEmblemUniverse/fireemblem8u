#pragma once

#include "global.h"
#include "proc.h"

struct EkrDragonStatus {

    /* 00 */ u8 type;
    /* 01 */ u8 unk01;
    /* 02 */ u16 attr;
    /* 04 */ ProcPtr proc;
    /* 08 */ u32 unk08;
    /* 0C */ struct Anim *anim;
};

enum dragonstatus_type {
    EKRDRGON_TYPE_NORMAL = 0,
    EKRDRGON_TYPE_DRACO_ZOMBIE,
    EKRDRGON_TYPE_DEMON_KING,
    EKRDRGON_TYPE_MYRRH
};

enum dragonstatue_attr {
    EKRDRGON_ATTR_START = 1 << 0,
    EKRDRGON_ATTR_BANIMFX_PREPARED = 1 << 1,
    EKRDRGON_ATTR_BANIMFINISH = 1 << 2,
    EKRDRGON_ATTR_END = 1 << 3,
    EKRDRGON_ATTR_DEAD = 1 << 12,
    EKRDRGON_ATTR_SKIP = 1 << 13,
};

extern struct EkrDragonStatus gEkrDragonStatusLeft, gEkrDragonStatusRight;

struct ProcEkrDragon {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x2C - 0x29];

    /* 2C */ s16 timer;
    /* 2E */ s16 tcounter;

    /* 30 */ u8 _pad_30[0x50 - 0x30];

    /* 50 */ ProcPtr fxproc;

    /* 54 */ u8 _pad_54[0x5C - 0x54];

    /* 5C */ struct Anim *anim;
};

struct EkrDracoZombiTsaSet {
    /* 00 */ u16 *tsa;
    /* 04 */ u8 time;
    /* 05 */ s8 lox;
    /* 06 */ u8 loy;
    /* 07 */ u8 type;
};

extern struct EkrDracoZombiTsaSet gEkrDracoZombiTsaSetLut[15];

struct ProcEfxDKfx {
    PROC_HEADER;

    /* 29 */ u8 finished;
    /* 2A */ s16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;

    /* 34 */ STRUCT_PAD(0x34, 0x3A);

    /* 3A */ u16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const s16 *frame_lut;
    /* 4C */ u16 **tsa_set;
    /* 50 */ u32 unk50;
    /* 54 */ u32 round_cur;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim *anim;
    /* 60 */ struct Anim *anim2;
};

struct EkrDragonQuakePriv {
    /* 00 */ u8 _pad_00[0x32 - 0x00];
    /* 32 */ u16 unk32;
    /* 34 */ u8 _pad_34[0x3A - 0x34];
    /* 3A */ u16 unk3A;
};

struct ProcEkrDragonQuake {
    PROC_HEADER;

    /* 29 */ s8 unk29;
    /* 2A */ s8 unk2A;
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;

    /* 30 */ u8 _pad_30[0x5C - 0x30];

    /* 5C */ struct EkrDragonQuakePriv * priv;
    /* 60 */ ProcPtr subproc;
};

struct ProcEfxDKBody1 {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ struct ProcEfxDKfx *fxproc;
    /* 50 */ u32 unk50;
    /* 54 */ int timer;
    /* 58 */ u32 xPos;
    /* 5C */ u32 yPos;
    /* 60 */ u32 unk60;
    /* 64 */ s16 unk64;
};

struct ProcEfxDKBody4 {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x44 - 0x29];

    /* 44 */ int round_type;

    /* 48 */ u8 _pad_48[0x5C -0x48];

    /* 5C */ struct Anim *anim;
};

struct ProcEkrDragonTunkFace;

struct ProcEkrDragonTunk {
    PROC_HEADER;
    /* 29 */ u8 finished;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer1;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 timer2;
    /* 32 */ s16 unk32;
    STRUCT_PAD(0x34, 0x3A);
    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
    STRUCT_PAD(0x3E, 0x54);
    /* 54 */ struct EkrDragonQuakePriv *qproc;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim *anim;
    /* 60 */ void *unk60;
    /* 64 */ struct ProcEkrDragonTunkFace *fproc;
};

struct ProcEkrDragonTunkFace {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x32);
    /* 32 */ s16 xPos;
    STRUCT_PAD(0x34, 0x3A);
    /* 3A */ s16 yPos;
    STRUCT_PAD(0x3C, 0x5C);
    /* 5C */ struct Anim *anim;
};

struct ProcEkrWhiteOUT {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    STRUCT_PAD(0x2E, 0x44);
    /* 44 */ int max_time1;
    /* 48 */ int max_time2;
    /* 4C */ int max_time3;
};

struct Proc08801800 {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);
    /* 58 */ int timer;
};

struct Proc08801810 {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);
    int timer1;
    int timer2;
};

struct Proc08801840 {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);
    int timer;
    STRUCT_PAD(0x5C, 0x64);
    s16 ref;
};

struct ProcSelfThunderBG {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x2C);
    s16 timer;
    STRUCT_PAD(0x2E, 0x44);
    int frame;
    STRUCT_PAD(0x48, 0x5C);
    struct Anim *anim;
};

struct EfxSelfThunderBGFrame {
    int duration;
    u16 * img;
    u16 * tsa1;
    u16 * tsa2;
    u16 * pal;
};

extern CONST_DATA struct EfxSelfThunderBGFrame gEfxSelfThunderBGFrames[];

// extern ??? gEkrDragonStatusLeft
// extern ??? gEkrDragonStatusRight
extern u16 gEkrDragonPalBackup[0x40 / sizeof(u16)];
extern u16 gEkrBgPaletteBackup[0x20];

extern u16 Img_EfxDracoZombie[];
extern u16 Tsa_EfxDracoZombieBaseLeft[];
extern u16 Tsa_EfxDracoZombieBaseRight[];
extern u16 Tsa_EfxDracoZombie1[];
extern u16 Tsa_EfxDracoZombie2[];
extern u16 Tsa_EfxDracoZombie3[];
extern u16 Tsa_EfxDracoZombie4[];
extern u16 Tsa_EfxDracoZombie5[];
extern u16 Pal_EfxDracoZombie[];
extern u16 Pal_Ekrdragonfx_0[];
extern u16 Img_Ekrdragonfx[];
extern u16 Pal_Ekrdragonfx_1[];
extern u32 BanimScr_Ekrdragonfx_0[];
extern u32 BanimScr_Ekrdragonfx_1[];
extern u32 BanimScr_Ekrdragonfx_2[];
extern u16 Img_DemonLightSprites_EyeFlash[];
extern u16 Pal_DemonLightSprites_EyeFlash[];
extern u32 gEkrdragonfx_0[];
extern u32 gEkrdragonfx_1[];
extern u16 Img_DemonLightSprites[];
extern u16 Pal_DemonLightSprites[];
extern u32 gEkrdragonfx_2[];
extern u32 gEkrdragonfx_3[];
extern u32 gEkrdragonfx_4[];
extern u32 gEkrdragonfx_5[];
extern u32 gEkrdragonfx_6[];
extern u32 gEkrdragonfx_7[];
extern u16 Img_DemonLightSprites_efxMaohFlashEyeFire1OBJ[];
extern u16 Img_DemonLightSprites_efxMaohFlashEyeFire2OBJ[];
extern u16 Pal_DemonLightSprites_efxMaohFlashEyeFire[];
extern u32 gEkrdragonfx_8[];
extern u32 gEkrdragonfx_9[];
extern u32 gEkrdragonfx_10[];
extern u32 gEkrdragonfx_11[];
extern u16 CONST_DATA Img_DemonLightBg_Close_1[];
extern u16 CONST_DATA Img_DemonLightBg_Close_2[];
extern u16 CONST_DATA Img_DemonLightBg_Close_3[];
extern u16 CONST_DATA Img_DemonLightBg_Close_4[];
extern u16 CONST_DATA Img_DemonLightBg_Close_5[];
extern u16 CONST_DATA Img_DemonLightBg_Close_6[];
extern u16 CONST_DATA Img_DemonLightBg_Close_7[];
extern u16 CONST_DATA Img_DemonLightBg_Close_8[];
extern u16 CONST_DATA Img_DemonLightBg_Close_9[];
extern u16 CONST_DATA Img_DemonLightBg_Close_10[];
extern u16 CONST_DATA Img_DemonLightBg_Close_11[];
extern u16 CONST_DATA Img_DemonLightBg_Close_12[];
extern u16 CONST_DATA Img_DemonLightBg_Close_13[];
extern u16 CONST_DATA Img_DemonLightBg_Close_14[];
extern u16 CONST_DATA Img_DemonLightBg_Close_15[];
extern u16 CONST_DATA Img_DemonLightBg_Close_16[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_1[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_2[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_3[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_4[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_5[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_6[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_7[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_8[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_9[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_10[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_11[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_12[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_13[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_14[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_15[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_16[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_1[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_2[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_3[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_4[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_5[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_6[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_7[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_8[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_9[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_10[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_11[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_12[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_13[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_14[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_15[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_16[];
extern u16 CONST_DATA Img_DemonLightBg_Close_17[];
extern u16 CONST_DATA Img_DemonLightBg_Close_18[];
extern u16 CONST_DATA Img_DemonLightBg_Close_19[];
extern u16 CONST_DATA Img_DemonLightBg_Close_20[];
extern u16 CONST_DATA Img_DemonLightBg_Close_21[];
extern u16 CONST_DATA Img_DemonLightBg_Close_22[];
extern u16 CONST_DATA Img_DemonLightBg_Close_23[];
extern u16 CONST_DATA Img_DemonLightBg_Close_24[];
extern u16 CONST_DATA Img_DemonLightBg_Close_25[];
extern u16 CONST_DATA Img_DemonLightBg_Close_26[];
extern u16 CONST_DATA Img_DemonLightBg_Close_27[];
extern u16 CONST_DATA Img_DemonLightBg_Close_28[];
extern u16 CONST_DATA Img_DemonLightBg_Close_29[];
extern u16 CONST_DATA Img_DemonLightBg_Close_30[];
extern u16 CONST_DATA Img_DemonLightBg_Close_31[];
extern u16 CONST_DATA Img_DemonLightBg_Close_32[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_17[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_18[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_19[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_20[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_21[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_22[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_23[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_24[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_25[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_26[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_27[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_28[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_29[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_30[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_31[];
extern u16 CONST_DATA Pal_DemonLightBg_Close_32[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_17[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_18[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_19[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_20[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_21[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_22[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_23[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_24[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_25[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_26[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_27[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_28[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_29[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_30[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_31[];
extern u16 CONST_DATA Tsa_DemonLightBg_Close_32[];
extern u16 Img_DemonLightBg_0[];
extern u16 Img_DemonLightBg4_Close_0[];
extern u16 Img_DemonLightBg4_Close_1[];
extern u16 Img_DemonLightBg4_Close_2[];
extern u16 Img_DemonLightBg4_Close_3[];
extern u16 Img_DemonLightBg4_Close_4[];
extern u16 Img_DemonLightBg4_Close_5[];
extern u16 Img_DemonLightBg4_Close_6[];
extern u16 Pal_DemonLightBg4_Close_0[];
extern u16 Pal_DemonLightBg4_Close_1[];
extern u16 Pal_DemonLightBg4_Close_2[];
extern u16 Pal_DemonLightBg4_Close_3[];
extern u16 Pal_DemonLightBg4_Close_4[];
extern u16 Pal_DemonLightBg4_Close_5[];
extern u16 Pal_DemonLightBg4_Close_6[];
extern u16 Pal_DemonLightBg4_Close_7[];
extern u16 Tsa_DemonLightBg4_Close_0[];
extern u16 Tsa_DemonLightBg4_Close_1[];
extern u16 Tsa_DemonLightBg4_Close_2[];
extern u16 Tsa_DemonLightBg4_Close_3[];
extern u16 Tsa_DemonLightBg4_Close_4[];
extern u16 Tsa_DemonLightBg4_Close_5[];
extern u16 Tsa_DemonLightBg4_Close_6[];
extern u16 Tsa_DemonLightBg4_Close_7[];
extern u16 Img_DemonLightBg3_Close_0[];
extern u16 Img_DemonLightBg3_Close_1[];
extern u16 Img_DemonLightBg3_Close_2[];
extern u16 Img_DemonLightBg3_Close_3[];
extern u16 Img_DemonLightBg3_Close_4[];
extern u16 Pal_DemonLightBg3_Close_0[];
extern u16 Pal_DemonLightBg3_Close_1[];
extern u16 Pal_DemonLightBg3_Close_2[];
extern u16 Pal_DemonLightBg3_Close_3[];
extern u16 Pal_DemonLightBg3_Close_4[];
extern u16 Tsa_DemonLightBg3_Close_0[];
extern u16 Tsa_DemonLightBg3_Close_1[];
extern u16 Tsa_DemonLightBg3_Close_2[];
extern u16 Tsa_DemonLightBg3_Close_3[];
extern u16 Tsa_DemonLightBg3_Close_4[];
extern u16 CONST_DATA Img_DemonLightBg_Far_1[];
extern u16 CONST_DATA Img_DemonLightBg_Far_2[];
extern u16 CONST_DATA Img_DemonLightBg_Far_3[];
extern u16 CONST_DATA Img_DemonLightBg_Far_4[];
extern u16 CONST_DATA Img_DemonLightBg_Far_5[];
extern u16 CONST_DATA Img_DemonLightBg_Far_6[];
extern u16 CONST_DATA Img_DemonLightBg_Far_7[];
extern u16 CONST_DATA Img_DemonLightBg_Far_8[];
extern u16 CONST_DATA Img_DemonLightBg_Far_9[];
extern u16 CONST_DATA Img_DemonLightBg_Far_10[];
extern u16 CONST_DATA Img_DemonLightBg_Far_11[];
extern u16 CONST_DATA Img_DemonLightBg_Far_12[];
extern u16 CONST_DATA Img_DemonLightBg_Far_13[];
extern u16 CONST_DATA Img_DemonLightBg_Far_14[];
extern u16 CONST_DATA Img_DemonLightBg_Far_15[];
extern u16 CONST_DATA Img_DemonLightBg_Far_16[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_1[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_2[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_3[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_4[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_5[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_6[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_7[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_8[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_9[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_10[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_11[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_12[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_13[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_14[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_15[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_16[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_1[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_2[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_3[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_4[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_5[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_6[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_7[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_8[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_9[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_10[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_11[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_12[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_13[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_14[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_15[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_16[];
extern u16 CONST_DATA Img_DemonLightBg_Far_17[];
extern u16 CONST_DATA Img_DemonLightBg_Far_18[];
extern u16 CONST_DATA Img_DemonLightBg_Far_19[];
extern u16 CONST_DATA Img_DemonLightBg_Far_20[];
extern u16 CONST_DATA Img_DemonLightBg_Far_21[];
extern u16 CONST_DATA Img_DemonLightBg_Far_22[];
extern u16 CONST_DATA Img_DemonLightBg_Far_23[];
extern u16 CONST_DATA Img_DemonLightBg_Far_24[];
extern u16 CONST_DATA Img_DemonLightBg_Far_25[];
extern u16 CONST_DATA Img_DemonLightBg_Far_26[];
extern u16 CONST_DATA Img_DemonLightBg_Far_27[];
extern u16 CONST_DATA Img_DemonLightBg_Far_28[];
extern u16 CONST_DATA Img_DemonLightBg_Far_29[];
extern u16 CONST_DATA Img_DemonLightBg_Far_30[];
extern u16 CONST_DATA Img_DemonLightBg_Far_31[];
extern u16 CONST_DATA Img_DemonLightBg_Far_32[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_17[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_18[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_19[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_20[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_21[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_22[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_23[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_24[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_25[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_26[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_27[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_28[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_29[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_30[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_31[];
extern u16 CONST_DATA Pal_DemonLightBg_Far_32[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_17[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_18[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_19[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_20[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_21[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_22[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_23[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_24[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_25[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_26[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_27[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_28[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_29[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_30[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_31[];
extern u16 CONST_DATA Tsa_DemonLightBg_Far_32[];
extern u16 Img_DemonLightBg_1[];
extern u16 Img_DemonLightBg4_Far_0[];
extern u16 Img_DemonLightBg4_Far_1[];
extern u16 Img_DemonLightBg4_Far_2[];
extern u16 Img_DemonLightBg4_Far_3[];
extern u16 Img_DemonLightBg4_Far_4[];
extern u16 Img_DemonLightBg4_Far_5[];
extern u16 Img_DemonLightBg4_Far_6[];
extern u16 Pal_DemonLightBg4_Far_0[];
extern u16 Pal_DemonLightBg4_Far_1[];
extern u16 Pal_DemonLightBg4_Far_2[];
extern u16 Pal_DemonLightBg4_Far_3[];
extern u16 Pal_DemonLightBg4_Far_4[];
extern u16 Pal_DemonLightBg4_Far_5[];
extern u16 Pal_DemonLightBg4_Far_6[];
extern u16 Pal_DemonLightBg4_Far_7[];
extern u16 Tsa_DemonLightBg4_Far_0[];
extern u16 Tsa_DemonLightBg4_Far_1[];
extern u16 Tsa_DemonLightBg4_Far_2[];
extern u16 Tsa_DemonLightBg4_Far_3[];
extern u16 Tsa_DemonLightBg4_Far_4[];
extern u16 Tsa_DemonLightBg4_Far_5[];
extern u16 Tsa_DemonLightBg4_Far_6[];
extern u16 Tsa_DemonLightBg4_Far_7[];
extern u16 Img_DemonLightBg3_Far_0[];
extern u16 Img_DemonLightBg3_Far_1[];
extern u16 Img_DemonLightBg3_Far_2[];
extern u16 Img_DemonLightBg3_Far_3[];
extern u16 Img_DemonLightBg3_Far_4[];
extern u16 Pal_DemonLightBg3_Far_0[];
extern u16 Pal_DemonLightBg3_Far_1[];
extern u16 Pal_DemonLightBg3_Far_2[];
extern u16 Pal_DemonLightBg3_Far_3[];
extern u16 Pal_DemonLightBg3_Far_4[];
extern u16 Tsa_DemonLightBg3_Far_0[];
extern u16 Tsa_DemonLightBg3_Far_1[];
extern u16 Tsa_DemonLightBg3_Far_2[];
extern u16 Tsa_DemonLightBg3_Far_3[];
extern u16 Tsa_DemonLightBg3_Far_4[];
extern u16 Img_DemonLightBg_2[];
extern u16 Img_DemonLightBg_3[];
extern u16 Img_DemonLightBg_4[];
extern u16 Pal_DemonLightBg_0[];
extern u16 Pal_DemonLightBg_1[];
extern u16 Pal_Ekrdragonfx_2[];
extern u16 Tsa_DemonLightBg_0[];
extern u16 Tsa_DemonLightBg_1[];
extern u16 Tsa_DemonLightBg_2[];
extern u32 BanimScr_DemoKingTunkFace[];
extern u32 BanimScr_Ekrdragonfx_3[];
extern struct ProcCmd ProcScr_EkrDK[];
extern struct ProcCmd ProcScr_ekrDragonBaseHide[];
extern struct ProcCmd ProcScr_ekrDragonBaseAppear[];
extern struct ProcCmd ProcScr_ekrDragonBodyAnime[];
extern u16 *TsaSet_DKBody[];
extern struct ProcCmd ProcScr_EkrDemoKingAtkRavagerCritical[];
extern struct ProcCmd ProcScr_EkrDemoKingAtkRavagerNormal[];
extern struct ProcCmd ProcScr_EkrDemoKingBodyShake[];
extern struct ProcCmd ProcScr_EkrDemoKingAtk[];
extern struct ProcCmd ProcScr_ekrDragonBodvBlack[];
extern struct ProcCmd ProcScr_EkrdragonDemonking_0[];
extern struct ProcCmd ProcScr_ekrDragonTunkFace[];
extern struct ProcCmd ProcScr_ekrDragonTunk[];
extern struct ProcCmd ProcScr_ekrWhiteOUT[];
extern u16 Tsa_Ekrdk_0[];
extern u16 Img_DemonKingBG[];
extern u16 Tsa_DemonKingBG1[];
extern u16 Tsa_DemonKingBG2[];
extern u16 Tsa_DemonKingBG3[];
extern u16 Pal_DemonKingBG[];
extern u16 Img_EfxSelfThunderBG1[];
extern u16 Img_EfxSelfThunderBG2[];
extern u16 Img_EfxSelfThunderBG3[];
extern u16 Img_EfxSelfThunderBG4[];
extern u16 Img_EfxSelfThunderBG5[];
extern u16 Img_EfxSelfThunderBG6[];
extern u16 Img_EfxSelfThunderBG7[];
extern u16 Img_EfxSelfThunderBG8[];
extern u16 Img_EfxSelfThunderBG9[];
extern u16 Img_EfxSelfThunderBG10[];
extern u16 Img_EfxSelfThunderBG11[];
extern u16 Img_EfxSelfThunderBG12[];
extern u16 Img_EfxSelfThunderBG13[];
extern u16 Img_EfxSelfThunderBG14[];
extern u16 Img_EfxSelfThunderBG15[];
extern u16 Img_EfxSelfThunderBG16[];
extern u16 TSA1_EfxSelfThunderBG1[];
extern u16 TSA1_EfxSelfThunderBG2[];
extern u16 TSA1_EfxSelfThunderBG3[];
extern u16 TSA1_EfxSelfThunderBG4[];
extern u16 TSA1_EfxSelfThunderBG5[];
extern u16 TSA1_EfxSelfThunderBG6[];
extern u16 TSA1_EfxSelfThunderBG7[];
extern u16 TSA1_EfxSelfThunderBG8[];
extern u16 TSA1_EfxSelfThunderBG9[];
extern u16 TSA1_EfxSelfThunderBG10[];
extern u16 TSA1_EfxSelfThunderBG11[];
extern u16 TSA1_EfxSelfThunderBG12[];
extern u16 TSA1_EfxSelfThunderBG13[];
extern u16 TSA1_EfxSelfThunderBG14[];
extern u16 TSA1_EfxSelfThunderBG15[];
extern u16 TSA1_EfxSelfThunderBG16[];
extern u16 TSA2_EfxSelfThunderBG1[];
extern u16 TSA2_EfxSelfThunderBG2[];
extern u16 TSA2_EfxSelfThunderBG3[];
extern u16 TSA2_EfxSelfThunderBG4[];
extern u16 TSA2_EfxSelfThunderBG5[];
extern u16 TSA2_EfxSelfThunderBG6[];
extern u16 TSA2_EfxSelfThunderBG7[];
extern u16 TSA2_EfxSelfThunderBG8[];
extern u16 TSA2_EfxSelfThunderBG9[];
extern u16 TSA2_EfxSelfThunderBG10[];
extern u16 TSA2_EfxSelfThunderBG11[];
extern u16 TSA2_EfxSelfThunderBG12[];
extern u16 TSA2_EfxSelfThunderBG13[];
extern u16 TSA2_EfxSelfThunderBG14[];
extern u16 TSA2_EfxSelfThunderBG15[];
extern u16 TSA2_EfxSelfThunderBG16[];
extern u16 Pal1_EfxSelfThunderBG[];
extern u16 Pal2_EfxSelfThunderBG[];
extern u16 Img_DemoKingTunkFace[];
extern u16 Img_DemoKingTunkFace2[];
extern u16 Pal_DemoKingTunkFace[];
extern struct ProcCmd ProcScr_EkrdragonDemonkingobj_1[];
extern struct ProcCmd ProcScr_EkrdragonDemonkingobj_2[];
extern u16 gEkrdragonDemonkingobj_0[];
extern u16 gEkrdragonDemonkingobj_1[];
extern struct ProcCmd ProcScr_ekrSelfThunder[];
extern struct ProcCmd ProcScr_ekrSelfThunderBG[];
extern CONST_DATA s16 gEkrdragonDemonkingobj_array1[];
extern CONST_DATA s16 gEkrdragonDemonkingobj_array2[];
extern s16 * gEkrdragonDemonkingobj_2[];
extern u8 * gEkrdragonDemonkingobj_3[];
extern CONST_DATA u8 gEkrdragonDemonkingobj_array1_1[];
extern CONST_DATA u8 gEkrdragonDemonkingobj_array2_1[];
extern CONST_DATA u8 gEkrdragonDemonkingobj_array3[];
extern CONST_DATA u8 gEkrdragonDemonkingobj_array4[];
extern CONST_DATA u8 gEkrdragonDemonkingobj_array5[];

extern const s16 gUnknown_080E8318[];
extern const s16 BnaimFrames_DkDemonLightNormal[];
extern const s16 BnaimFrames_DkDemonLightCritical[];
extern const s16 BnaimFrames_DkRavagerNormal[];
extern const s16 BnaimFrames_DkRavagerCritical[];
extern const s16 gUnknown_080E838E[];

struct EkrDragonStatus *GetEkrDragonStatus(struct Anim *anim);
u16 GetEkrDragonStatusAttr(struct Anim *anim); /* 1 << 2 seems to be the end of the battle */
void AddEkrDragonStatusAttr(struct Anim *anim, u16 attr_bitfile);
u32 GetEkrDragonStatusType(struct Anim *anim);
// ??? GetEkrDragonStatusType_(???);
void SetEkrDragonStatusType(struct Anim *anim, u8 type);
int GetEkrDragonStatusUnk1(void);
void SetEkrDragonStatusUnk1(int);
void ResetEkrDragonStatus(void);
u32 GetBanimDragonStatusType(void);
// ??? EkrDragonTmCpyHFlip(???);
void EkrDragonTmCpyExt(int, int);
void EkrDragonTmCpyWithDistance(void);
bool CheckEfrDragonStatusAttrPrepared(struct Anim *anim);
bool CheckEfrDragonStatusAttrEnd(struct Anim *anim);
// ??? Fill16_EkrTsaBuffer(???);
// ??? EkrDZ_CustomBgFadeIn(???);
void EfxDracoZombiePrepareTSA(int x, int y, s8 pos);
// ??? EfxDracoZombiePrepareImg(???);
// ??? EkrDZ_MonsterFlyIntoScreen(???);
// ??? EkrDZ_PrepareBanimfx(???);
// ??? EkrDZ_TriggerPreparedFlag(???);
// ??? EkrDZ_IdleInBattle(???);
// ??? EkrDZ_ReloadCustomBg(???);
// ??? EkrDZ_ReloadCustomBgAndFadeOut(???);
// ??? EkrDZ_SetDragonStatAttrEndBit(???);
void NewEkrDragonDracoZombie(struct Anim *anim);
void SetEkrDragonExit(struct Anim *anim);
void SetEkrDragonDead(struct Anim *anim);
void SetEkrDragonSkipTransfer(struct Anim *anim);
bool CheckEkrDragonDead(struct Anim *anim);
bool CheckEkrDragonSkipTransfer(struct Anim *anim);
void InitEkrDragonStatus(void);
void EfxBgFlashingForDragon(struct Anim *anim);
u16 * GetEkrDragonPalette(void);
void SetEkrDragonPaletteBack(int pos);
void SetEkrDragonPaletteFront(int pos);
void BanimSetFrontPaletteForDragon(struct Anim *anim);
void NewEkrDragonQuakeTree3(struct EkrDragonQuakePriv *priv, int, int);
void NewEkrDragonQuake(struct EkrDragonQuakePriv *priv, int, int, ProcPtr);
void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc);

struct ProcEkrDragonScreenFlashing {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int dura1, dura2, dura3;
};

void NewEkrWhiteINOUT(int dura1, int dura2, int dura3);
void EkrWhiteINOUT_Loop1(struct ProcEkrDragonScreenFlashing * proc);
void EkrWhiteINOUT_Loop2(struct ProcEkrDragonScreenFlashing * proc);
void EkrWhiteINOUT_Loop3(struct ProcEkrDragonScreenFlashing * proc);
void EkrWhiteINOUT_RefrainPalette(struct ProcEkrDragonScreenFlashing * proc);

// ??? EkrDragon_BlendPalette(???);
// ??? EkrDragonPalFade_Init(???);
// ??? EkrDragonPalFade_Loop(???);
void EkrDragonPalFade_End(void);
void NewEkrDragonPalFade(void);
void NewEkrDragonManakete(struct Anim *anim);
void EkrMyr_PrepareBanimfx(struct ProcEkrDragon * proc);
void EkrMyr_WaitForTransform(struct ProcEkrDragon * proc);
void EkrMyr_TrigerForPrepared(struct ProcEkrDragon * proc);
void EkrMyr_InBattleIdle(struct ProcEkrDragon * proc);
void EkrMyr_ReturnToLoli(struct ProcEkrDragon * proc);
void EkrMyr_WaitForReturnEnd(struct ProcEkrDragon * proc);
void RegisterEkrDragonStatusType(void);
// ??? EkrDragonDemonKing_Null(???);
int CheckEkrWpnDemonLight(struct Anim *anim);
void EkrDKStartBaseHide(struct ProcEkrDragon * proc);
void EkrDK_CustomBgFadeIn(struct ProcEkrDragon * proc);
void Fill16_EkrTsaBuffer_(u32 val);
void EkrDK_BgMovement(struct ProcEkrDragon * proc);
void EkrDK_PrepareBanimfx(struct ProcEkrDragon * proc);
void PrepareDemonKingBGFx(struct ProcEkrDragon * proc);
void EkrDK_IdleInBattle(struct ProcEkrDragon * proc);
void EkrDK_WaitForFadeOut(struct ProcEkrDragon * proc);
void EkrDK_ReloadTerrainEtc(struct ProcEkrDragon * proc);
void EkrDK_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc);
void EkrDK_SetDragonStatusBit3(struct ProcEkrDragon * proc);
ProcPtr NewEkrDragonBaseHide(struct Anim *anim);
ProcPtr NewEkrDragonBaseHide(struct Anim *anim);
void EkrDragonBaseHideMain(struct ProcEfxDKfx * proc);
void EkrDragonBaseHide_Nop(struct ProcEfxDKfx * proc);
ProcPtr NewEkrDragonBaseAppear(struct Anim *anim);
void EkrDragonBaseAppearMain(struct ProcEfxDKfx * proc);
void EkrDragonBaseAppear_Nop(struct ProcEfxDKfx * proc);
void EkrDKHandler_NewDragonAnime(struct ProcEkrDragon * proc);
ProcPtr NewEkrDragonBodyAnime(struct Anim *anim);
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc);
void EkrDemoKingAtkRavager_Init(struct ProcEfxDKBody1 * proc);
void EkrDemoKingAtkRavager_OnEnd(struct ProcEfxDKBody1 * proc);
void EkrDemoKingAtkRavager_Lunge(struct ProcEfxDKBody1 * proc);
void EkrDemoKingAtkRavager_Recoil(struct ProcEfxDKBody1 * proc);
void EkrDemoKingAtkRavager_WaitHit(struct ProcEfxDKBody1 * proc);
void EkrDemoKingAtkRavager_Settle(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyHold(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyShake_Init(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyShake_OnEnd(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyShake_Out(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyShake_Hold(struct ProcEfxDKBody1 * proc);
void EkrDemoKingBodyShake_Back(struct ProcEfxDKBody1 * proc);
void EkrDragonBodyAnimeSet54(struct Anim *anim);
void EkrDragonBodyAnimeMain(struct ProcEfxDKfx * proc);
void NewEkrDemoKingAtk(struct Anim *anim, int round_type);
void EkrDemoKingAtkMain(struct ProcEfxDKBody4 * proc);
ProcPtr NewEkrDragonBodvBlack(struct Anim *anim);
void EkrDragonBodyBlack_FadePalStep(int val);
void EkrDragonBodyBlackMain(struct ProcEfxDKfx * proc);
void nop_3(void);
void EkrDragonTunk_WhiteOutSfx(void);
void EkrdragonDemonking_Init(struct ProcEfxDKfx * proc);
void EkrdragonDemonking_Loop(struct ProcEfxDKfx * proc);
void EkrdragonDemonking_OnEnd(struct ProcEfxDKfx * proc);
void EkrDemoKing_DecompressBgTsaHFlip(int arg1, int arg2);
void EkrDemoKing_BG3TmSetPosition(int arg1, int arg2);
ProcPtr NewProc087F4518(struct Anim *anim);
ProcPtr NewEkrDragonTunkFace(struct Anim *anim);
void EkrDragonTunkFaceRegisterAnim(struct ProcEfxDKfx * proc);
void EkrDragonTunkFaceIdle(struct ProcEfxDKfx * proc);
void EkrDragonTunkFaceRegisterAnim2(struct ProcEfxDKfx * proc);
void EkrDragonTunkFaceIdle2(struct ProcEfxDKfx * proc);
void EkrDragonTunkFace_OnEnd(struct ProcEfxDKfx * proc);
void EkrDragonTunkFaceUpdatePos4(struct ProcEfxDKfx * proc);
void EkrDragonTunkFaceHoldPos(struct ProcEfxDKfx * proc);
void EfxTmDecompress(int arg1, int arg2, const u16 *tsa);
void EfxBG3TmSetPosition(int arg1, int arg2);
ProcPtr NewEkrDragonTunk(struct Anim *anim);
void DemonKingDeadWhiteOut(struct ProcEkrDragonTunk * proc);
void EkrDragonTunkMain(struct ProcEkrDragonTunk * proc);
void EkrDragonTunk_Nop(void);
void NewEkrWhiteOUT(int, int, int);
void EkrWhiteOutFadeIn(struct ProcEkrWhiteOUT * proc);
void EkrWhiteOutDelay(struct ProcEkrWhiteOUT * proc);
void EkrWhiteOutFadeOut(struct ProcEkrWhiteOUT * proc);
void EkrWhiteOutOnEnd(struct ProcEkrWhiteOUT * proc);
void EkrDragonSetBgAndFrontPos(s16, s16);
void EkrDemonkingObj_Init(struct Proc08801800 * proc);
void EkrDemonkingObj_UpdateBgPosLoop(struct Proc08801800 * proc);
void EkrDemonkingObj_GetShakeOffset(s16 *buf1, s16 *buf2, int val1, int val2);
void EkrDemonkingObj_SetBgOffset(int, int);
void EkrDemonkingObj_RevealInit(void);
void EkrDemonkingObj_RevealTimerInit(struct Proc08801810 * proc);
void EkrDemonkingObj_RevealLoop(struct Proc08801810 * proc);
void EkrDemonkingObj_RevealOnEnd(void);
void EkrDemonkingObj_SetBgPosition(int arg1, int arg2);
void EkrDemonkingObj_StartDissolveProc(int, ProcPtr parent);
void EkrDemonkingObj_DissolveInit(struct Proc08801840 * proc);
void EkrDemonkingObj_DissolveLoop(struct Proc08801840 * proc);
void EkrDemonkingObj_SetTilePixel(u16 *buf, int);
void CopyPalWithFade(const u16 *src, u16 *dst, int ref);
void NewEkrSelfThunder(struct Anim *anim);
void EkrSelfThunderMain(struct ProcEfxDKfx * proc);
void EfxSelfThunderBGUpdateAnimTSA(struct Anim *anim, const u16 *tsa_close, const u16 *tsa_far);
void NewEkrSelfThunderBG(struct Anim *anim);
void EfxSelfThunderBGUpdateAnim(struct ProcSelfThunderBG * proc, u16 *img, u16 *tsa_close, u16 *tsa_far, u16 *pal);
void EfxSelfThunderBGOnInit(struct ProcSelfThunderBG * proc);
void EfxSelfThunderBGMain(struct ProcSelfThunderBG * proc);
