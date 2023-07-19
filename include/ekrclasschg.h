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
extern CONST_DATA u16 * TsaLut_08759000[];
extern CONST_DATA u16 * ImgLut_08759094[];
extern CONST_DATA u16 * PalLut_08759128[];
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

extern CONST_DATA u16 Img_87929B8[];
extern CONST_DATA u16 Pal_87932CC[];
extern CONST_DATA u16 Tsa_87932EC[];
extern CONST_DATA u16 Tsa_8793384[];
extern CONST_DATA u16 Tsa_8793494[];
extern CONST_DATA u16 Tsa_87935B0[];
extern CONST_DATA u16 Tsa_87936C0[];
extern CONST_DATA u16 Tsa_87937D0[];
extern CONST_DATA u16 Tsa_87938EC[];
extern CONST_DATA u16 Img_87939FC[];
extern CONST_DATA u16 Img_8794628[];
extern CONST_DATA u16 Img_87951D8[];
extern CONST_DATA u16 Img_8795DF4[];
extern CONST_DATA u16 Img_87969F4[];
extern CONST_DATA u16 Img_87970DC[];
extern CONST_DATA u16 Img_8797AC4[];
extern CONST_DATA u16 Img_8798394[];
extern CONST_DATA u16 Img_8798B6C[];
extern CONST_DATA u16 Img_8799228[];
extern CONST_DATA u16 Pal_87997F8[];
extern CONST_DATA u16 Tsa_8799818[];
extern CONST_DATA u16 Tsa_8799ABC[];
extern CONST_DATA u16 Tsa_8799D64[];
extern CONST_DATA u16 Tsa_879A008[];
extern CONST_DATA u16 Tsa_879A2A8[];
extern CONST_DATA u16 Tsa_879A444[];
extern CONST_DATA u16 Tsa_879A6A0[];
extern CONST_DATA u16 Tsa_879A87C[];
extern CONST_DATA u16 Tsa_879A9E8[];
extern CONST_DATA u16 Tsa_879AB10[];
extern CONST_DATA u16 Img_879AC08[];
extern CONST_DATA u16 Img_879B168[];
extern CONST_DATA u16 Img_879B8F4[];
extern CONST_DATA u16 Img_879C1E4[];
extern CONST_DATA u16 Img_879CAB4[];
extern CONST_DATA u16 Img_879D1F8[];
extern CONST_DATA u16 Img_879DC10[];
extern CONST_DATA u16 Img_879E5DC[];
extern CONST_DATA u16 Img_879EED0[];
extern CONST_DATA u16 Img_879F698[];
extern CONST_DATA u16 Img_879FD3C[];
extern CONST_DATA u16 Img_87A0338[];
extern CONST_DATA u16 Img_87A090C[];
extern CONST_DATA u16 Img_87A0E78[];
extern CONST_DATA u16 Img_87A13C0[];
extern CONST_DATA u16 Pal_87A18D0[];
extern CONST_DATA u16 Tsa_87A18F0[];
extern CONST_DATA u16 Tsa_87A19EC[];
extern CONST_DATA u16 Tsa_87A1B68[];
extern CONST_DATA u16 Tsa_87A1D74[];
extern CONST_DATA u16 Tsa_87A1F9C[];
extern CONST_DATA u16 Tsa_87A2134[];
extern CONST_DATA u16 Tsa_87A2384[];
extern CONST_DATA u16 Tsa_87A2584[];
extern CONST_DATA u16 Tsa_87A2748[];
extern CONST_DATA u16 Tsa_87A28A8[];
extern CONST_DATA u16 Tsa_87A29DC[];
extern CONST_DATA u16 Tsa_87A2AE8[];
extern CONST_DATA u16 Tsa_87A2BE4[];
extern CONST_DATA u16 Tsa_87A2CCC[];
extern CONST_DATA u16 Tsa_87A2DB8[];
extern CONST_DATA u16 Img_87A2EA0[];
extern CONST_DATA u16 Img_87A3400[];
extern CONST_DATA u16 Img_87A39A0[];
extern CONST_DATA u16 Img_87A3F38[];
extern CONST_DATA u16 Img_87A44D8[];
extern CONST_DATA u16 Pal_87A4A68[];
extern CONST_DATA u16 Tsa_87A4A88[];
extern CONST_DATA u16 Tsa_87A4B68[];
extern CONST_DATA u16 Tsa_87A4C44[];
extern CONST_DATA u16 Tsa_87A4D2C[];
extern CONST_DATA u16 Tsa_87A4E0C[];

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
