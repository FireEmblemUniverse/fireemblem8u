#pragma once

#include "global.h"
#include "anime.h"
#include "proc.h"
#include "efxbattle.h"

struct ProcEkrClasschg {
    PROC_HEADER;
    /* 29 */ u8 done;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    
    STRUCT_PAD(0x2E, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxClasschgInOutUnit {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ s16 start;
    /* 34 */ s16 end;

    STRUCT_PAD(0x36, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcSubEkrClasschgRST {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);
    int unk4C;
};

struct ProcEkrClasschgRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int start;
    /* 48 */ int end;

    STRUCT_PAD(0x4C, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcSubEkrClasschgRST * subproc;
};

extern struct ProcEkrClasschg * gpProcEkrClasschg;

extern CONST_DATA struct ProcCmd ProcScr_ekrClasschg[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgBG[];
extern CONST_DATA u16 * TsaLut_Ekrclasschg_0[];
extern CONST_DATA u16 * ImgLut_Ekrclasschg_0[];
extern CONST_DATA u16 * PalLut_Ekrclasschg_0[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE00[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE01[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJGain[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJDrop[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJDiffusion[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgFIN[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgCLONE[];
extern CONST_DATA struct ProcCmd ProcScr_efxBlackInOutUnit[];
extern CONST_DATA struct ProcCmd ProcScr_efxWhiteInOutUnit[];
extern CONST_DATA struct ProcCmd ProcScr_efxClasschgRST[];

extern CONST_DATA u16 Img_Ekrdragonfx_0[];
extern CONST_DATA u16 Pal_Ekrdragonfx_3[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_0[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_1[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_2[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_3[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_4[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_5[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_6[];
extern CONST_DATA u16 Img_Ekrdragonfx_1[];
extern CONST_DATA u16 Img_Ekrdragonfx_2[];
extern CONST_DATA u16 Img_Ekrdragonfx_3[];
extern CONST_DATA u16 Img_Ekrdragonfx_4[];
extern CONST_DATA u16 Img_Ekrdragonfx_5[];
extern CONST_DATA u16 Img_Ekrdragonfx_6[];
extern CONST_DATA u16 Img_Ekrdragonfx_7[];
extern CONST_DATA u16 Img_Ekrdragonfx_8[];
extern CONST_DATA u16 Img_Ekrdragonfx_9[];
extern CONST_DATA u16 Img_Ekrdragonfx_10[];
extern CONST_DATA u16 Pal_Ekrdragonfx_4[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_7[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_8[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_9[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_10[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_11[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_12[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_13[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_14[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_15[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_16[];
extern CONST_DATA u16 Img_Ekrdragonfx_11[];
extern CONST_DATA u16 Img_Ekrdragonfx_12[];
extern CONST_DATA u16 Img_Ekrdragonfx_13[];
extern CONST_DATA u16 Img_Ekrdragonfx_14[];
extern CONST_DATA u16 Img_Ekrdragonfx_15[];
extern CONST_DATA u16 Img_Ekrdragonfx_16[];
extern CONST_DATA u16 Img_Ekrdragonfx_17[];
extern CONST_DATA u16 Img_Ekrdragonfx_18[];
extern CONST_DATA u16 Img_Ekrdragonfx_19[];
extern CONST_DATA u16 Img_Ekrdragonfx_20[];
extern CONST_DATA u16 Img_Ekrdragonfx_21[];
extern CONST_DATA u16 Img_Ekrdragonfx_22[];
extern CONST_DATA u16 Img_Ekrdragonfx_23[];
extern CONST_DATA u16 Img_Ekrdragonfx_24[];
extern CONST_DATA u16 Img_Ekrdragonfx_25[];
extern CONST_DATA u16 Pal_Ekrdragonfx_5[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_17[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_18[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_19[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_20[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_21[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_22[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_23[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_24[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_25[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_26[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_27[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_28[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_29[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_30[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_31[];
extern CONST_DATA u16 Img_Ekrdragonfx_26[];
extern CONST_DATA u16 Img_Ekrdragonfx_27[];
extern CONST_DATA u16 Img_Ekrdragonfx_28[];
extern CONST_DATA u16 Img_Ekrdragonfx_29[];
extern CONST_DATA u16 Img_Ekrdragonfx_30[];
extern CONST_DATA u16 Pal_Ekrdragonfx_6[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_32[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_33[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_34[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_35[];
extern CONST_DATA u16 Tsa_Ekrdragonfx_36[];

bool EkrClasschgFinished(void);
void EndEkrClasschg(void);
void NewEkrClassChg(struct Anim * anim);
void EkrClasschgMain(struct ProcEkrClasschg * proc);
void EkrClasschgRegisterDone(struct ProcEkrClasschg * proc);
void EndEfxStatusUnit(void);
void NewEkrClasschgBG1(struct Anim * anim);
void NewEkrClasschgBG2(struct Anim * anim);
void EfxClasschgBgMain(struct ProcEfxBG * proc);
void NewEfxClasschgBGSE00(struct Anim * anim);
void EfxClasschgBGSE00Main(struct ProcEfxBG * proc);
void NewEfxClasschgBGSE01(struct Anim * anim);
void EfxClasschgBGSE01Main(struct ProcEfxBG * proc);
void NewEfxClasschgOBJGain(struct Anim * anim);
void EfxClasschgOBJGainMain(struct ProcEfxOBJ * proc);
void NewEfxClasschgOBJDrop(struct Anim * anim);
void EfxClasschgOBJDropMain(struct ProcEfxOBJ * proc);
void NewEfxClasschgOBJDiffusion(struct Anim * anim, u8 pos);
void EfxClasschgOBJDiffusionMain(struct ProcEfxOBJ * proc);
void NewEfxClasschgFIN(struct Anim * anim, int duration);
void EfxClasschgFinMain(struct ProcEfxBG * proc);
void NewEfxClasschgCLONE(struct Anim * anim, int duration);
void EfxClasschgCloneMain(struct ProcEfxBG * proc);
void EfxClasschgCloneCallBack(void);
void NewEfxBlackInOutUnit(struct Anim * anim, int duration, int arg);
void EfxBlackInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc);
void NewEfxWhiteInOutUnit(struct Anim * anim, int duration, int arg);
void EfxWhiteInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc);
void NewEfxClasschgRST(struct Anim * anim, struct ProcSubEkrClasschgRST * subproc, int duration, int start, int end);
void EfxClasschgRSTMain(struct ProcEkrClasschgRST * proc);
