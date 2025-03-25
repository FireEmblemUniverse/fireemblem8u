#pragma once

#include "global.h"
#include "anime.h"
#include "proc.h"

#define EFX_BG_WIDTH 66
#define EFX_TILEMAP_LOC(aMap, aX, aY) (aMap + (aX) + EFX_BG_WIDTH * (aY))

struct ProcEfx {
    PROC_HEADER;

    /* 29 */ u8 hitted;
    /* 2A */ u8 type;
    /* 2B */ STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 step;
    /* 30 */ s16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ u32 unk48;
    /* 4C */ u32 frame;
    /* 50 */ u32 speed;
    /* 54 */ s16 * unk54;
    /* 58 */ s16 ** unk58;
    /* 5C */ struct Anim * anim;
    STRUCT_PAD(0x60, 0x64);
    ProcPtr unk_64;
};

struct ProcEfxBG {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    STRUCT_PAD(0x36, 0x3C);

    /* 3C */ s16 unk3C;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 ** tsal;
    /* 50 */ u16 ** tsar;
    /* 54 */ u16 ** img;
    /* 58 */ u16 ** pal;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxBGCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 timer2;
    /* 30 */ s16 terminator;
    /* 32 */ s16 unk32;

    STRUCT_PAD(0x34, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ void * pal;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 duration;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcEfx * efxproc;
};

struct ProcEfxOBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ u16 unk34;
    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
    /* 68 */ struct Anim * anim4;
};

struct ProcEfxALPHA
{
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;

    STRUCT_PAD(0x32, 0x44);

    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxSCR {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 34 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int unk44;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct ProcEfx * unk5C;
};

struct ProcEkrDispUP {
    PROC_HEADER;

    /* 29 */ u8 sync;
    /* 2A */ u8 asnyc;

    /* 2B */ u8 _pad_2B[0x32 - 0x2B];

    /* 32 */ u16 x; /* unused actually */

    /* 34 */ u8 _pad_32[0x3A - 0x34];

    /* 3A */ u16 y;

    /* 3C */ u8 _pad_3C[0x4C - 0x3C];

    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
};

extern struct ProcEkrDispUP *gpProcEkrDispUP;

struct ProcEfxCircleWIN
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ STRUCT_PAD(0x34, 0x3a);
    /* 3A */ u16 unk_3a;
    /* 3C */ STRUCT_PAD(0x3c, 0x44);
    /* 44 */ int unk_44;
    /* 48 */ STRUCT_PAD(0x48, 0x54);
    /* 54 */ u16 * unk_54;
    /* 58 */ int unk_58;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxMagicQuake
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x5c);
    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr pQuakePureProc;
};

struct Unknown_030053E0 {
    u16 u00;
    u16 u02;
    u16 u04;
    u16 u06;
    u16 u08;
    u16 u0a;
    u16 u0c;
    u16 u0e;
    u16 u10;
    u16 u12;
    u16 *buf;
    u8 *u18;
    u8 *u1c;
    u8 *u20;
    void (*u24)(void);
};
extern struct Unknown_030053E0 gUnknown_030053E0;

extern struct AnimBuffer gUnknown_030053A0;

extern struct BanimUnkStructComm gUnknown_0201FADC;

struct ProcEfxFlashing {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 terminator2;

    STRUCT_PAD(0x32, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxHpBarColorChange {
    PROC_HEADER;

    /* 29 */ u8 disabled;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer1;
    /* 2E */ s16 timer2;
    /* 30 */ s16 terminator2;

    STRUCT_PAD(0x32, 0x44);

    /* 44 */ u32 frame1;
    /* 48 */ const u16 * frame_lut1;
    /* 4C */ u32 frame2;
    /* 50 */ const u16 * frame_lut2;
    /* 54 */ u32 unk54;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim * anim;
};


extern struct ProcEfxHpBarColorChange * gpProcEfxHpBarColorChange;

struct ProcEfxHpBar {
    PROC_HEADER;

    /* 29 */ u8 death;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ s16 timer;
    /* 2E */ s16 cur;
    /* 30 */ u8 _pad_30[0x48 - 0x30];
    /* 48 */ int diff;
    /* 4C */ int this;
    /* 50 */ int next;
    /* 54 */ int timer2;
    /* 58 */ int finished;
    /* 5C */ struct Anim * anim_main_other;
    /* 60 */ struct Anim * anim_main_this;
    /* 64 */ struct Anim * anim_this;
};

void ekrDispUPMain(struct ProcEkrDispUP * proc);

struct ProcEfxDead {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim1;
    /* 60 */ struct Anim * anim2;
};

void NewEfxDeadEvent(struct Anim * anim1, struct Anim * anim2);
void sub_8052DFC(struct ProcEfxDead * proc);
void sub_8052E7C(struct ProcEfxDead * proc);
void sub_8052EAC(struct ProcEfxDead * proc);
void sub_8052F24(struct ProcEfxDead * proc);
void sub_8052F84(struct ProcEfxDead * proc);
void NewEfxDead(struct Anim * anim1, struct Anim * anim2);
void sub_8052FEC(struct ProcEfxDead * proc);
void sub_8053080(struct ProcEfxDead * proc);
void NewEfxDeadPika(struct Anim * anim1, struct Anim * anim2);
void EfxDeadPikaMain(struct ProcEfxDead * proc);
void NewEfxDeadAlpha(struct Anim * anim1, struct Anim * anim2);
void EfxDeadAlphaMain(struct ProcEfxDead * proc);
void NewEfxDeadDragonAlpha(struct Anim * anim1, struct Anim * anim2);
void EfxDeadDragonAlphaMain(struct ProcEfxDead * proc);

struct ProcEfxStatusUnit {
    PROC_HEADER;
    /* 29 */ u8 invalid;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ u16 timer;
    /* 2E */ u8 _pad_2D[0x32 - 0x2E];
    /* 32 */ s16 red;
    /* 34 */ s16 green;
    /* 36 */ s16 blue;
    /* 38 */ u8 _pad_38[0x44 - 0x38];
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_lut;
    /* 4C */ u32 debuff;
    /* 50 */ u32 debuf_bak;

    /* 54 */ u8 _pad_54[0x5C - 0x54];
    /* 5C */ struct Anim * anim;
};

extern struct ProcEfxStatusUnit *gpProcEfxStatusUnits[2];

void NewEfxStatusUnit(struct Anim * anim);
void EndEfxStatusUnits(struct Anim *anim);
void DeleteEach6C_efxStatusUnit(void);
void DisableEfxStatusUnits(struct Anim * anim);
void EnableEfxStatusUnits(struct Anim * anim);
void SetUnitEfxDebuff(struct Anim * anim, int debuff);
u32 GetUnitEfxDebuff(struct Anim * anim);
void EfxStatusUnitFlashing(struct Anim * anim, int, int, int);
void EfxStatusUnitMain(struct ProcEfxStatusUnit * proc);
void EfxStatusUnitEnd(struct ProcEfxStatusUnit * proc);

struct ProcEfxWeaponIcon {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_lut;
    /* 4C */ u32 unk4C;
    /* 50 */ u32 invalid;
    /* 54 */ int eff1;
    /* 58 */ int eff2;
};

extern struct ProcEfxWeaponIcon *gpProcEfxWeaponIcon;

void NewEfxWeaponIcon(s16 a, s16 b);
void EndProcEfxWeaponIcon(void);
void DisableEfxWeaponIcon(void);
void EnableEfxWeaponIcon(void);
void sub_8054F10(struct ProcEfxWeaponIcon * proc);
void sub_8054F78(struct ProcEfxWeaponIcon * proc);

struct ProcEfxSpellCast {
    PROC_HEADER;

    /* 29 */ u8 done;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
};

extern struct ProcEfxSpellCast * gpProcEfxSpellCast;

void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
void EndEfxSpellCast(void);
void sub_8055038(struct ProcEfxSpellCast * proc);
void sub_805509C(struct ProcEfxSpellCast * proc);
void sub_80550DC(struct ProcEfxSpellCast * proc);

struct ProcEfxSkill {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    /* 2E */ STRUCT_PAD(0x2E, 0x3A);

    /* 3A */ s16 caught_debuff;

    /* 3C */ STRUCT_PAD(0x3C, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * time_lut;
    /* 4C */ u16 ** tsa_lut;
    /* 50 */ u16 ** tsa_cur;
    /* 54 */ u16 ** img_lut;
    /* 58 */ u16 ** pal_lut;
    /* 5C */ struct Anim * anim;
};

void NewEfxSkillType01BG(struct Anim * anim);
void EfxSkillType01BGMain(struct ProcEfxSkill * proc);
void NewEfxSkillCommonBG(struct Anim * anim, u8 val);
void sub_806E610(struct ProcEfxSkill * proc);
void sub_806E638(struct ProcEfxSkill * proc);
void sub_806E6E0(struct ProcEfxSkill * proc);
void sub_806E79C(struct ProcEfxSkill * proc);
void sub_806E868(struct ProcEfxSkill * proc);
void sub_806E8A4(struct ProcEfxSkill * proc);

extern CONST_DATA u16 Img_EfxSkill1[];
extern CONST_DATA u16 Img_EfxSkill2[];
extern CONST_DATA u16 Img_EfxSkill3[];
extern CONST_DATA u16 Img_EfxSkill4[];
extern CONST_DATA u16 Img_EfxSkill5[];
extern CONST_DATA u16 Img_EfxSkill6[];
extern CONST_DATA u16 Img_EfxSkill7[];
extern CONST_DATA u16 Img_EfxSkill8[];
extern CONST_DATA u16 Img_EfxSkill9[];
extern CONST_DATA u16 Img_EfxSkillA[];
extern CONST_DATA u16 Img_EfxSkillB[];
extern CONST_DATA u16 Img_EfxSkillC[];
extern CONST_DATA u16 Img_EfxSkillD[];
extern CONST_DATA u16 Img_EfxSkillE[];
extern CONST_DATA u16 Img_EfxSkillF[];
extern CONST_DATA u16 Img_EfxSkill10[];

extern CONST_DATA u16 Pal_EfxSkill1[];
extern CONST_DATA u16 Pal_EfxSkill2[];
extern CONST_DATA u16 Pal_EfxSkill3[];
extern CONST_DATA u16 Pal_EfxSkill4[];
extern CONST_DATA u16 Pal_EfxSkill5[];
extern CONST_DATA u16 Pal_EfxSkill6[];
extern CONST_DATA u16 Pal_EfxSkill7[];
extern CONST_DATA u16 Pal_EfxSkill8[];
extern CONST_DATA u16 Pal_EfxSkill9[];
extern CONST_DATA u16 Pal_EfxSkillA[];
extern CONST_DATA u16 Pal_EfxSkillB[];
extern CONST_DATA u16 Pal_EfxSkillC[];
extern CONST_DATA u16 Pal_EfxSkillD[];
extern CONST_DATA u16 Pal_EfxSkillE[];
extern CONST_DATA u16 Pal_EfxSkillF[];
extern CONST_DATA u16 Pal_EfxSkill10[];

extern CONST_DATA u16 Tsa_EfxSkill1[];
extern CONST_DATA u16 Tsa_EfxSkill2[];
extern CONST_DATA u16 Tsa_EfxSkill3[];
extern CONST_DATA u16 Tsa_EfxSkill4[];
extern CONST_DATA u16 Tsa_EfxSkill5[];
extern CONST_DATA u16 Tsa_EfxSkill6[];
extern CONST_DATA u16 Tsa_EfxSkill7[];
extern CONST_DATA u16 Tsa_EfxSkill8[];
extern CONST_DATA u16 Tsa_EfxSkill9[];
extern CONST_DATA u16 Tsa_EfxSkillA[];
extern CONST_DATA u16 Tsa_EfxSkillB[];
extern CONST_DATA u16 Tsa_EfxSkillC[];
extern CONST_DATA u16 Tsa_EfxSkillD[];
extern CONST_DATA u16 Tsa_EfxSkillE[];
extern CONST_DATA u16 Tsa_EfxSkillF[];
extern CONST_DATA u16 Tsa_EfxSkill10[];

extern const u16 FrameLut_EfxSkill[];

struct ProcEfxDamageMojiEffectOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct ProcEkrSubAnimeEmulator *sub_proc;
};

struct ProcEfxSRankSCR2 {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x44);
    /* 44 */ u32 unk44;
    STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct ProcEfx *seff_scr1;
};

struct ProcEkrHensei {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
};

extern u32 gEkrHpBarCount;
extern u32 gEfxSpellAnimExists;
extern u32 gUnknown_02017730;
extern u32 gEkrDeadExist;
extern u32 gEkrDeadEventExist;
extern u32 gEfxQuakeExist;
extern u32 gEfxHitQuakeExist;
extern u32 gEkrInitPosReal;
extern u32 gEfxFarAttackExist;
extern u32 gEfxBgSemaphore;
extern u32 gEfxHpBarResireFlag;
extern u32 gUnknown_02017754;
extern u32 gEfxTeonoState;
extern u32 gUnknown_0201775C;
extern struct Vec2 gEkrBg2QuakeVec;
extern s16 gUnknown_02017764[2];
extern s16 gEfxSpecalEffectExist[2];

extern s16 gEkrHitNow[];     /* [0] for left and [1] for right, if in hit routine, 1, otherwise 0 */
extern u8 gSpellAnimBgfx[];
extern u16 gEkrBarfxBuf[];
extern u16 gEkrTsaBuffer[0x1000 / 2];
extern u8 gBuf_Banim[];
extern u16 gPal_Banim[0x140 / sizeof(u16)];
extern u16 gTmA_Banim[0xB58 / sizeof(u16)];
extern u16 gTmB_Banim[0x2520 / 2];
extern u8 gEfxSplitedColorBufA[];
extern u8 gEfxSplitedColorBufB[];
extern s16 gEfxSplitedColorBufC[];
extern u8 gEfxSplitedColorBufD[];
extern u8 gEfxSplitedColorBufE[];
extern s16 gEfxSplitedColorBufF[];
extern int gUnknown_0201FAC8;

extern u32 gUnknown_0201FAD8;

// extern ??? ProcScr_efxMaohFlash
// extern ??? ProcScr_efxMaohFlashBG1
// extern ??? TsaArray_DemonLightBg1_Close
// extern ??? ImgArray_DemonLightBg1_Close
// extern ??? PalArray_DemonLightBg1_Close
// extern ??? TsaArray_DemonLightBg1_Far
// extern ??? ImgArray_DemonLightBg1_Far
// extern ??? PalArray_DemonLightBg1_Far
// extern ??? ProcScr_efxMaohFlashBG2
// extern ??? TsaArray_DemonLightBg2
// extern ??? ImgArray_DemonLightBg2
// extern ??? PalArray_DemonLightBg2
// extern ??? ProcScr_efxMaohFlashBG3
// extern ??? TsaArray_DemonLightBg3_Close
// extern ??? ImgArray_DemonLightBg3_Close
// extern ??? PalArray_DemonLightBg3_Close
// extern ??? TsaArray_DemonLightBg3_Far
// extern ??? ImgArray_DemonLightBg3_Far
// extern ??? PalArray_DemonLightBg3_Far
// extern ??? ProcScr_efxMaohFlashBG4
// extern ??? TsaArray_DemonLightBg4_Close
// extern ??? ImgArray_DemonLightBg4_Close
// extern ??? PalArray_DemonLightBg4_Close
// extern ??? TsaArray_DemonLightBg4_Far
// extern ??? ImgArray_DemonLightBg4_Far
// extern ??? PalArray_DemonLightBg4_Far
// extern ??? ProcScr_efxMaohFlashWOUT
// extern ??? ProcScr_efxMaohFlashBGCOL
// extern ??? ProcScr_efxMaohFlashEyeROBJ2
// extern ??? ProcScr_efxMaohFlashEyeLOBJ2
// extern ??? ProcScr_efxMaohFlashEyeOBJ1
// extern ??? ProcScr_efxMaohFlashEyeFire1OBJ1
// extern ??? ProcScr_efxMaohFlashEyeFire2OBJ1
// extern ??? ProcScr_efxMaohFlashThunderOBJ
// extern ??? ProcScr_efxMaohFlashThunderOBJ2
// extern ??? ProcScr_efxStone
// extern ??? ProcScr_efxStoneBG
// extern ??? ImgArray_StoneBg
// extern ??? TsaArray_StoneBg
// extern ??? ProcScr_efxStoneOBJ
// extern ??? ProcScr_efxEvilEye
// extern ??? ProcScr_efxEvilEyeBG
// extern ??? ImgArray_EvilEyeBg1
// extern ??? TsaArray_EvilEyeBg1
// extern ??? PalArray_EvilEyeBg1
// extern ??? ProcScr_efxEvilEyeBG2
// extern ??? ImgArray_EvilEyeBg2
// extern ??? TsaArray_EvilEyeBg2_Close
// extern ??? TsaArray_EvilEyeBg2_Far
// extern ??? PalArray_EvilEyeBg2
// extern ??? ProcScr_efxEvilEyeOBJ
// extern ??? ProcScr_efxNaglfar
// extern ??? ProcScr_efxNaglfarBG
// extern ??? ImgArray_NaglfarBg1
// extern ??? TsaArray_NaglfarBg1
// extern ??? ProcScr_efxNaglfarBG2
// extern ??? ImgArray_NaglfarBg2
// extern ??? TsaArray_NaglfarBg2
// extern ??? PalArray_NaglfarBg2
// extern ??? ProcScr_efxNaglfarBG3
// extern ??? ImgArray_NaglfarBg3
// extern ??? TsaArray_NaglfarBg3
// extern ??? ProcScr_efxNaglfarBG4
// extern ??? ImgArray_NaglfarBg4
// extern ??? TsaArray_NaglfarBg4
// extern ??? ProcScr_efxNaglfarOBJ
// extern ??? ProcScr_efxNaglfarOBJ2
// extern ??? ProcScr_efxNaglfarOBJRockGyre
// extern ??? ProcScr_efxNaglfarBlack
// extern ??? ProcScr_efxDrzDrakbreath
// extern ??? ProcScr_efxDrzDrakbreathOBJ
// extern ??? ProcScr_efxDrzDrakbreathBG
// extern ??? ProcScr_efxDrzDrakbreathBGCOL
// extern ??? ProcScr_efxDarkGrado
// extern ??? ProcScr_efxDarkGradoMapFadeOut
// extern ??? TsaArray_GleipnirBg_Sigil
// extern ??? ImgArray_GleipnirBg_Sigil
// extern ??? ProcScr_efxDarkGradoBG01
// extern ??? TsaArray_GleipnirBg_Nebula
// extern ??? ImgArray_GleipnirBg_Nebula
// extern ??? PalArray_GleipnirBg_Nebula
// extern ??? TsaArray_GleipnirBg_Fog
// extern ??? ImgArray_GleipnirBg_Fog
// extern ??? ProcScr_efxDarkGradoBG02
// extern ??? ProcScr_085D84B4
// extern ??? gUnknown_085D84D4
// extern ??? gUnknown_085D8524
// extern ??? gUnknown_085D8574
// extern ??? gUnknown_085D85C4
// extern ??? gUnknown_085D8614
// extern ??? gUnknown_085D8664
// extern ??? gUnknown_085D86B4
// extern ??? ProcScr_efxDarkGradoOBJ01piece
// extern ??? ProcScr_efxDarkGradoOBJ01
// extern ??? ProcScr_efxDarkGradoOBJ02piece
// extern ??? ProcScr_efxDarkGradoOBJ02
// extern ??? ProcScr_efxCrimsonEye
// extern ??? TsaArray_efxCrimsonEyeBGFinish1
// extern ??? ImgArray_efxCrimsonEyeBGFinish1
// extern ??? ProcScr_efxCrimsonEyeBGFinish1
// extern ??? ProcScr_efxCrimsonEyeOBJFinishPiece
// extern ??? gUnknown_085D87DC
// extern ??? ProcScr_efxCrimsonEyeOBJFinish
// extern ??? TsaArray_efxCrimsonEyeBG
// extern ??? ProcScr_efxCrimsonEyeBG
// extern ??? gUnknown_085D88AC
// extern ??? ProcScr_efxCrimsonEyeOBJ
// extern ??? ProcScr_efxDarkLongMons
// extern ??? TsaArray_efxDarkLongMonsBG01
// extern ??? ImgArray_efxDarkLongMonsBG01
// extern ??? PalArray_efxDarkLongMonsBG01
// extern ??? ProcScr_efxDarkLongMonsBG01
// extern ??? TsaArray_efxDarkLongMonsBG02
// extern ??? ProcScr_efxDarkLongMonsBG02
// extern ??? ProcScr_efxDarkLongMonsOBJ
// extern ??? ProcScr_085D8AEC
// extern ??? ProcScr_efxGorgon
// extern ??? ProcScr_085D8B24
// extern ??? TsaArray_efxGorgonBGDirt
// extern ??? ImgArray_efxGorgonBGDirt
// extern ??? PalArray_efxGorgonBGDirt
// extern ??? ProcScr_efxGorgonBGDirt
// extern ??? TsaArray_efxGorgonBGTwister
// extern ??? ImgArray_efxGorgonBGTwister
// extern ??? PalArray_efxGorgonBGTwister
// extern ??? ProcScr_efxGorgonBGTwister
// extern ??? ProcScr_085D8C24
// extern ??? ProcScr_efxGorgonOBJTwisterPiece
// extern ??? ProcScr_efxGorgonOBJTwister
extern u16 * TsaArray_efxGorgonBGFinish[];
extern u16 * ImgArray_efxGorgonBGFinish[];
extern struct ProcCmd ProcScr_efxGorgonBGFinish[];
// extern ??? ProcScr_085D8CE4
// extern ??? ProcScr_085D8D14
extern struct ProcCmd ProcScr_efxDamageMojiEffect[];
extern struct ProcCmd ProcScr_efxDamageMojiEffectOBJ[];
extern struct ProcCmd ProcScr_efxCriricalEffect[];
extern struct ProcCmd ProcScr_efxCriricalEffectBG[];
extern struct ProcCmd ProcScr_efxCriricalEffectBGCOL[];
extern struct ProcCmd ProcScr_efxNormalEffect[];
extern struct ProcCmd ProcScr_efxNormalEffectBG[];
extern u16 * TSAs_EfxNormalEffectBG[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffect[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffectBG[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffectBGCOL[];
extern struct ProcCmd ProcScr_efxPierceNormalEffect[];
extern struct ProcCmd ProcScr_efxPierceNormalEffectBG[];
extern u16 *TSAs_EfxPierceNormalEffectBG[];
extern struct ProcCmd ProcScr_efxYushaSpinShield[];
extern struct ProcCmd ProcScr_efxYushaSpinShieldOBJ[];
extern struct ProcCmd ProcScr_efxHurtmutEff00[];
extern struct ProcCmd ProcScr_efxHurtmutEff00OBJ[];
extern struct ProcCmd ProcScr_efxHurtmutEff01OBJ[];
extern struct ProcCmd ProcScr_efxMagfcast[];
extern struct ProcCmd ProcScr_efxMagfcastBG[];
extern u16 * TsaLut1_EfxMagfcastBG[];
extern u16 * TsaLut2_EfxMagfcastBG[];
extern struct ProcCmd ProcScr_efxSunakemuri[];
extern struct ProcCmd ProcScr_efxSunakemuriOBJ[];
extern struct ProcCmd ProcScr_efxLokmsuna[];
extern struct ProcCmd ProcScr_efxLokmsunaOBJ[];
extern struct ProcCmd ProcScr_efxKingPika[];
extern struct ProcCmd ProcScr_efxFlashFX[];
extern struct ProcCmd ProcScr_efxSongOBJ2[];
extern struct ProcCmd ProcScr_efxDanceOBJ[];
extern struct ProcCmd ProcScr_efxSpecalEffect[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffect[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffectBG[];
extern struct ProcCmd efxSRankWeaponEffectSCR[];
extern struct ProcCmd efxSRankWeaponEffectSCR2[];
extern s16 gUnknown_085D9154[];
extern struct ProcCmd ProcScr_efxMagdhisEffect[];
extern struct ProcCmd ProcScr_efxMagdhisEffectBG[];
extern u16 *TsaLut_EfxMagdhisEffectBG[];
extern struct ProcCmd ProcScr_efxMantBatabata[];
extern struct ProcCmd ProcScr_efxChillEffect[];
extern struct ProcCmd ProcScr_efxChillEffectBG[];
extern u16 *TsaLut_EfxChillEffectBG[];
extern struct ProcCmd ProcScr_efxChillEffectBGCOL[];
extern struct ProcCmd ProcScr_efxChillAnime[];
extern struct ProcCmd ProcScr_efxSkillType01BG[];
extern u16 *TsaLut_EfxSkill[];
extern u16 *ImgLut_EfxSkill[];
extern u16 *PalLut_EfxSkill[];
extern struct ProcCmd ProcScr_efxSkillCommonBG[];
// extern ??? gClassReelSpellAnimFuncLut
// extern ??? ProcScr_efxopFire
// extern ??? ProcScr_efxopFireBG
// extern ??? TsaArray_Fire_ClassReel
// extern ??? ProcScr_efxopFireOBJ
// extern ??? ProcScr_efxopThunder
// extern ??? ProcScr_efxopThunderBG
// extern ??? TsaArray_Thunder_ClassReel
// extern ??? ProcScr_efxopThunderBGCOL
// extern ??? ProcScr_efxopThunderOBJ
// extern ??? ProcScr_efxopLive
// extern ??? ProcScr_efxopLiveBG
// extern ??? gUnknown_085D959C
// extern ??? ProcScr_efxopLiveBGCOL
// extern ??? ProcScr_efxopLiveALPHA
// extern ??? ProcScr_efxopLiveOBJ
// extern ??? ProcScr_efxopLightning
// extern ??? ProcScr_efxopLightningBG
// extern ??? ImgArray_Light_ClassReel
// extern ??? PalArray_Light_ClassReel
// extern ??? TsaArray_Light_ClassReel
// extern ??? ProcScr_efxopMistyrainBG
// extern ??? TsaArray_Flux_ClassReel
// extern ??? ImgArray_Flux_ClassReel
// extern ??? ProcScr_efxopMistyrainOBJ
// extern ??? ProcScr_efxopMistyrainOBJ2
// extern ??? ProcScr_efxopMistyrain
// extern ??? ProcScr_efxopMyrrh

extern u16 Pal_080E1164[];
extern const u16 gBarfxTileConf1[];
extern const u16 gBarfxTileConf2[];
extern const u16 gBarfxTileConf3[];
extern const s16 gAnimSpriteRotScalePosX[];
extern const s16 gAnimSpriteRotScalePosY[];
extern const u16 FrameLut_080E143A[];
extern const u16 FrameLut_080E1488[];
extern const u16 sEfxLvupPartsPos[];
extern const u16 FrameConfig_EfxLvupBG[];
extern const u16 FrameConfig_EfxLvupBG2[];
extern const u16 FrameLut_EfxLvupBGCOL[];
extern const u16 FrameLut2_EfxLvupBGCOL[];
extern const s16 FrameLut_EkrTriPegagusBGLeft[];
extern const s16 FrameLut_EkrTriPegagusBGRight[];
extern const u16 Img_TriPegasusKnightBG[];
extern const u16 Img_TriFalconKnightLanceBG[];
extern const u16 Img_TriFalconKnightSwordBG[];

/* Imgs */
extern const u16 Tsa_EkrTriPegagusRightBG1[];
extern const u16 Tsa_EkrTriPegagusRightBG2[];
extern const u16 Tsa_EkrTriPegagusRightBG3[];
extern const u16 Tsa_EkrTriPegagusLeftBG1[];
extern const u16 Tsa_EkrTriPegagusLeftBG2[];
extern const u16 Tsa_EkrTriPegagusLeftBG3[];

extern const u16 Img_TriPegasusKnightOBJ[];
extern const u16 Img_TriFalconKnightLanceOBJ[];
extern const u16 Img_TriFalconKnightSwordOBJ[];
extern const u16 Img_TriKnightOBJ[];
extern const u16 Img_TriGenerialLanceOBJ[];
extern const u16 Img_TriGenerialAxeOBJ[];
extern const u16 Img_TriGenerialHandAxeOBJ[];
extern const u16 Img_TriKnightAtkOBJ[];
extern const u16 Img_TriGenerialLanceAtkOBJ[];
extern const u16 Img_TriGenerialAxeAtkOBJ[];
extern const u16 Img_TriGenerialHandAxeAtkOBJ[];

extern char gNopStr[];
// extern ??? PalArray_ArenaBattleBg
extern u16 TsaConf_BanimTmA1[];
extern u16 TsaConf_BanimTmA2[];
extern u16 TsaConf_BanimTmA3[];
extern u16 TsaConf_BanimTmA4[];
extern u16 Img_NODAMGEMIS[];
extern u16 Pal_085BA2E0[];
extern u16 Pal_085BA300[];
extern u16 Pal_085BA320[];
// extern ??? Img_BanimSnipperFBallistaIntro
extern u16 Img_LvupApfx[];
extern u16 Pal_LvupApfx[];
extern u8 Img_ArenaBattleBg[];
extern u8 Tsa_ArenaBattleBg[];
extern u16 Pal_ArenaBattleBg_A[];
extern u16 Pal_ArenaBattleBg_B[];
extern u16 Pal_ArenaBattleBg_C[];
extern u16 Img1_EfxLvupBG[];
extern u16 Img2_EfxLvupBG[];
extern u16 Img3_EfxLvupBG[];
extern u16 Img4_EfxLvupBG[];
extern u16 Img5_EfxLvupBG[];
extern u16 Img6_EfxLvupBG[];
extern u16 Img7_EfxLvupBG[];
extern u16 Pal_EfxLvupBG[];
extern u16 Tsa1_EfxLvupBG[];
extern u16 Tsa1_EfxLvupBG[];
extern u16 Tsa2_EfxLvupBG[];
extern u16 Tsa3_EfxLvupBG[];
extern u16 Tsa4_EfxLvupBG[];
extern u16 Tsa5_EfxLvupBG[];
extern u16 Tsa6_EfxLvupBG[];
extern u16 Tsa7_EfxLvupBG[];
extern u16 Tsa8_EfxLvupBG[];
extern u16 Tsa9_EfxLvupBG[];
extern u16 Tsa10_EfxLvupBG[];
extern u16 Tsa11_EfxLvupBG[];
extern u16 Img_EfxLvupBG2[];
extern u16 Pal_EfxLvupBG2[];
extern u16 Pal_EfxLvupBGCOL[];
extern u16 Tsa1_EfxLvupBG2[];
extern u16 Tsa2_EfxLvupBG2[];
extern u16 Tsa3_EfxLvupBG2[];
extern u16 Tsa4_EfxLvupBG2[];
extern u16 Tsa5_EfxLvupBG2[];
extern u16 Tsa6_EfxLvupBG2[];
extern u16 Img_EfxLvupOBJ2[];
extern AnimScr AnimScr_EfxLvupOBJ2[];
extern u32 AnimScr_EkrMainMini_L_Far[];
extern u32 AnimScr_EkrMainMini_L_Close[];
extern u32 AnimScr_EkrMainMini_R_Far[];
extern u32 AnimScr_EkrMainMini_R_Close[];
extern u32 AnimScr_NoDamage[];
extern u32 AnimScr_Miss[];
extern u8 Img_EkrLvupNumBig[];
extern AnimScr AnimScr_LvupStatupfx1[];
extern AnimScr AnimScr_LvupStatupfx2[];
extern AnimScr AnimScr_LvupStatupfx3[];
extern AnimScr AnimScr_LvupStatupfx5[];
extern AnimScr AnimScr_LvupStatupObj[];
extern u16 Img_EfxPierceCriticalEffectBG[];
extern u16 Pal_EfxPierceCriticalEffectBG[];
extern u16 TsaL_EfxPierceCriticalEffectBG[];
extern u16 TsaR_EfxPierceCriticalEffectBG[];
extern u16 Img_EfxPierceNormalEffectBG[];
extern u16 Pal_EfxPierceNormalEffectBG[];
extern u16 Tsa1_EfxPierceNormalEffectBG[];
extern u16 Tsa2_EfxPierceNormalEffectBG[];
extern u16 Tsa3_EfxPierceNormalEffectBG[];
extern u16 Tsa4_EfxPierceNormalEffectBG[];
extern u16 Tsa5_EfxPierceNormalEffectBG[];
extern u16 Tsa6_EfxPierceNormalEffectBG[];
extern u16 Tsa7_EfxPierceNormalEffectBG[];
extern u16 Tsa8_EfxPierceNormalEffectBG[];
extern u16 Tsa9_EfxPierceNormalEffectBG[];
extern u16 TsaA_EfxPierceNormalEffectBG[];
extern u32 AnimScr_EkrBaseKaiten1[];
extern u32 AnimScr_EkrBaseKaiten3[];
extern u32 AnimScr_EkrBaseKaiten4[];
extern u32 AnimScr_EkrBaseKaiten5[];
extern u32 AnimScr_EkrBaseKaiten9[];
extern u32 AnimScr_EkrBaseKaiten10[];
extern u32 AnimScr_EkrBaseKaiten11[];
extern u32 AnimScr_EkrBaseKaiten12[];
extern u32 AnimScr_EkrBaseKaiten13[];
extern u32 AnimScr_EkrBaseKaiten14[];
extern u32 AnimScr_EkrBaseKaiten15[];
extern u32 AnimScr_EkrBaseKaiten16[];
extern u32 AnimScr_EkrBaseKaiten17[];
extern u32 AnimScr_EkrBaseKaiten18[];
extern u32 AnimScr_EkrBaseKaiten19[];
extern u32 AnimScr_EkrBaseKaiten20[];
extern u32 AnimScr_EkrBaseKaiten21[];
extern u32 AnimScr_EkrBaseKaiten22[];
extern u32 AnimScr_EkrBaseKaiten23[];
extern u32 AnimScr_EkrBaseKaiten24[];
extern u32 AnimScr_EkrBaseKaiten8[];
extern u32 AnimScr_EkrBaseKaiten7[];
extern u32 AnimScr_EkrBaseKaiten6[];
extern u32 AnimScr_EkrBaseKaiten2[];

// extern ??? ProcScr_efxopEvilEye
// extern ??? ProcScr_efxopEvilEyeBG
// extern ??? ImgArray_EvilEye_ClassReel
// extern ??? TsaArray_EvilEye_ClassReel
// extern ??? PalArray_EvilEye_ClassReel
// extern ??? ProcScr_efxopEvilEyeOBJ
// extern ??? ProcScr_efxopStone
// extern ??? ProcScr_efxopStoneBG
// extern ??? ImgArray_Stone_ClassReel
// extern ??? TsaArray_Stone_ClassReel
// extern ??? ProcScr_efxopStoneOBJ
extern u16 Img_TeonoOBJ[];
extern u16 Pal_TeonoOBJ[];
extern u32 AnimScr_TeonoObjCloseRight[];
extern u32 AnimScr_TeonoObjFarRight[];
extern u32 AnimScr_TeonoObj2Right[];
extern u32 AnimScr_TeonoObjCloseLeft[];
extern u32 AnimScr_TeonoObjFarLeft[];
extern u32 AnimScr_TeonoObj2Left[];
extern u16 Img_EfxArrowOBJ[];
extern u32 AnimScr_ArrowCloseRight[];
extern u32 AnimScr_ArrowFarRight[];
extern u32 AnimScr_ArrowCloseLeft[];
extern u32 AnimScr_ArrowFarLeft[];
extern u16 Img_SpellJavelin[];
extern u16 Pal_SpellJavelin[];
extern u16 Img_SpellJavelinCavalier[];
extern u16 Pal_SpellJavelinCavalier[];
extern u16 Img_SpellJavelinSoldier[];
extern u16 Pal_SpellJavelinSoldier[];
extern u16 Img_SpellJavelinPaladin[];
extern u16 Pal_SpellJavelinPaladin[];
extern u16 Img_SpellJavelinPegasusKnight[];
extern u16 Pal_SpellJavelinPegasusKnight[];
extern u16 Img_SpellJavelinFalcon[];
extern u16 Pal_SpellJavelinFalcon[];
extern u16 Img_SpellJavelinWyvernRider[];
extern u16 Pal_SpellJavelinWyvernRider[];
extern u16 Img_SpellJavelinWyvernLord[];
extern u16 Pal_SpellJavelinWyvernLord[];
extern u16 Img_SpellJavelinGenerial[];
extern u16 Pal_SpellJavelinGenerial[];
extern u16 Img_SpellJavelinUnk[];
extern u16 Pal_SpellJavelinUnk[];
extern u32 AnimScr_EfxTeyariObjType0Right[];
extern u32 AnimScr_EfxTeyariObjType0Left[];
extern u32 AnimScr_EfxTeyariObjType1Right[];
extern u32 AnimScr_EfxTeyariObjType1Left[];
extern u32 AnimScr_085DCA5C[];
extern u32 AnimScr_085DCAF8[];
extern u16 Img_EfxDanceObj[];
extern u16 Pal_EfxDanceObj[];
extern u32 AnimScr_EfxDanceObj[];
extern u32 AnimScr_EfxSongObj2[];
extern u16 Img_BreathSprites[];
extern u16 Pal_FireBreathSprites[];
extern u16 Img_EfxHurtmutEff00OBJ1[];
extern u16 Img_EfxHurtmutEff00OBJ2[];
extern u16 Pal_EfxHurtmutEff00OBJ[];
extern u16 Pal_IceBreathSprites[];
extern u16 Pal_DarkBreathSprites[];
extern u16 Pal_WretchedAirSprites[];
extern u32 AnimScr_EfxBindingBlade_Left[];
extern u32 AnimScr_EfxBindingBlade_Right[];
extern u32 AnimScr_HurtmutEff00OBJ1_Right[];
extern u32 AnimScr_HurtmutEff01OBJ1_Right[];
extern u32 AnimScr_HurtmutEff00OBJ1_Left[];
extern u32 AnimScr_HurtmutEff01OBJ1_Left[];
extern u32 AnimScr_HurtmutEff00OBJ2_Right[];
extern u32 AnimScr_HurtmutEff01OBJ2_Right[];
extern u32 AnimScr_HurtmutEff00OBJ2_Left[];
extern u32 AnimScr_HurtmutEff01OBJ2_Left[];
extern u32 AnimScr_FirebreathOBJ_Left[];
extern u32 AnimScr_FirebreathOBJ_Right[];
extern u32 AnimScr_IcebreathOBJ_Right[];
extern u32 AnimScr_IcebreathOBJ_Left[];
extern u32 AnimScr_DarkBreath_Close[];
extern u16 Img_DarkBreathBg[];
extern u16 Tsa_085E64D8[];
extern u16 Tsa_085E65C0[];
extern u16 Tsa_085E667C[];
extern u16 Tsa_085E6778[];
extern u16 Tsa_085E6860[];
extern u16 Tsa_085E6948[];
extern u16 Tsa_085E6A44[];
extern u16 Tsa_085E6B70[];
extern u16 Tsa_085E6CA4[];
extern u16 Tsa_085E6D68[];
extern u16 Tsa_085E6E94[];
extern u16 Tsa_085E6F90[];
extern u16 Img_EfxCriricalEffectBG[];
extern u16 Pal_EfxCriricalEffectBG[];
extern u16 Tsa_EfxCriricalEffectBG_L[];
extern u16 Tsa_EfxCriricalEffectBG_R[];
extern u16 Img_EfxSRankWeaponEffectBG[];
extern u16 Pal_EfxSRankWeaponEffectBG[];
extern u16 Tsa_EfxSRankWeaponEffectBG[];
extern u16 Img_EfxNormalEffectBG[];
extern u16 Pal_EfxNormalEffectBG[];
extern u16 Tsa1_EfxNormalEffectBG[];
extern u16 Tsa2_EfxNormalEffectBG[];
extern u16 Tsa3_EfxNormalEffectBG[];
extern u16 Tsa4_EfxNormalEffectBG[];
extern u16 Tsa5_EfxNormalEffectBG[];
extern u16 Tsa6_EfxNormalEffectBG[];
extern u16 Tsa7_EfxNormalEffectBG[];
extern u16 Tsa8_EfxNormalEffectBG[];
extern u16 Tsa9_EfxNormalEffectBG[];
extern u16 TsaA_EfxNormalEffectBG[];
extern u32 AnimScr_YushaSpinShieldOBJ_LeftTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ2_RightTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ3_RightTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ_RightTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ2_LeftTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ3_LeftTypeA[];
extern u32 AnimScr_YushaSpinShieldOBJ_LeftTypeB[];
extern u32 AnimScr_YushaSpinShieldOBJ2_RightTypeB[];
extern u32 AnimScr_YushaSpinShieldOBJ3_RightTypeB[];
extern u32 AnimScr_YushaSpinShieldOBJ_RightTypeB[];
extern u32 AnimScr_YushaSpinShieldOBJ2_LeftTypeB[];
extern u32 AnimScr_YushaSpinShieldOBJ3_LeftTypeB[];
extern u16 Img_EfxMagfcastBG[];
extern u16 Pal_EfxMagfcastBG[];
extern u16 Tsa1_EfxMagfcastBG[];
extern u16 Tsa2_EfxMagfcastBG[];
extern u16 Tsa3_EfxMagfcastBG[];
extern u16 Tsa4_EfxMagfcastBG[];
extern u16 Tsa5_EfxMagfcastBG[];
extern u16 Tsa6_EfxMagfcastBG[];
extern u16 Tsa7_EfxMagfcastBG[];
extern u16 Tsa8_EfxMagfcastBG[];
extern u16 Tsa9_EfxMagfcastBG[];
extern u16 Tsa10_EfxMagfcastBG[];
extern u16 Tsa11_EfxMagfcastBG[];
extern u16 Tsa12_EfxMagfcastBG[];
extern u16 Tsa13_EfxMagfcastBG[];
extern u16 Tsa14_EfxMagfcastBG[];
extern u16 Tsa15_EfxMagfcastBG[];
extern u16 Tsa16_EfxMagfcastBG[];
extern u16 Tsa17_EfxMagfcastBG[];
extern u16 Tsa18_EfxMagfcastBG[];
extern u16 Tsa19_EfxMagfcastBG[];
extern u16 Tsa20_EfxMagfcastBG[];
extern u16 Tsa21_EfxMagfcastBG[];
extern u16 Tsa22_EfxMagfcastBG[];
extern u16 Img_EfxMagdhisEffectBG[];
extern u16 Pal_EfxMagdhisEffectBG[];
extern u16 Tsa1_EfxMagdhisEffectBG[];
extern u16 Tsa2_EfxMagdhisEffectBG[];
extern u16 Tsa3_EfxMagdhisEffectBG[];
extern u16 Tsa4_EfxMagdhisEffectBG[];
extern u16 Img_EfxSunakemuriOBJ[];
extern u16 Pal_EfxSunakemuriOBJ1[];
extern u16 Pal_EfxSunakemuriOBJ2[];
extern u16 Pal_EfxSunakemuriOBJ3[];
extern u32 AnimScr_EfxSunakemuriOBJ1_R[];
extern u32 AnimScr_EfxSunakemuriOBJ1_L[];
extern u32 AnimScr_EfxSunakemuriOBJ2_R[];
extern u32 AnimScr_EfxSunakemuriOBJ2_L[];
extern u32 AnimScr_EfxSunakemuriOBJ3_R[];
extern u32 AnimScr_EfxSunakemuriOBJ3_L[];
extern u32 AnimScr_EfxMantBatabata1_R[];
extern u32 AnimScr_EfxMantBatabata1_L[];
extern u32 AnimScr_EfxMantBatabata2_R[];
extern u32 AnimScr_EfxMantBatabata2_L[];
extern u32 AnimScr_EfxMantBatabata3_R[];
extern u32 AnimScr_EfxMantBatabata3_L[];
extern u32 AnimScr_EfxMantBatabata4_R[];
extern u32 AnimScr_EfxMantBatabata4_L[];
extern u32 AnimScr_EfxMantBatabata5_R[];
extern u32 AnimScr_EfxMantBatabata5_L[];
extern u32 AnimScr_EfxMantBatabata6_R[];
extern u32 AnimScr_EfxMantBatabata6_L[];
extern u32 AnimScr_EfxMantBatabata7_R[];
extern u32 AnimScr_EfxMantBatabata7_L[];
extern u16 Img_ThunderSpellBg[];
extern u16 Pal_ThunderSpellBg[];
extern u16 Img_BoltingSprites[];
extern u16 Pal_BoltingSprites[];
extern u16 Tsa_EfxThuderBg1[];
extern u16 Tsa_EfxThuderBg2[];
extern u32 AnimScr_EfxThunderOBJ_R[];
extern u32 AnimScr_EfxThunderOBJ_L[];
extern u16 Img_FireSpellBg[];
extern u16 Pal_FireSpellBg[];
extern u16 Tsa_085F6250[];
extern u16 Tsa_085F62F8[];
extern u16 Tsa_085F63A0[];
extern u16 Tsa_085F6458[];
extern u16 Tsa_085F6520[];
extern u16 Tsa_085F65F0[];
extern u16 Tsa_085F66F0[];
extern u16 Tsa_085F67F8[];
extern u16 Tsa_085F690C[];
extern u16 Tsa_085F6A44[];
extern u16 Tsa_085F6B48[];
extern u16 Tsa_085F6C1C[];
extern u16 Tsa_085F6CDC[];
extern u16 Tsa_085F6D84[];
extern u16 Tsa_085F6E2C[];
extern u16 Tsa_085F6EE4[];
extern u16 Tsa_085F6FAC[];
extern u16 Tsa_085F707C[];
extern u16 Tsa_085F717C[];
extern u16 Tsa_085F7284[];
extern u16 Tsa_085F7398[];
extern u16 Tsa_085F74D0[];
extern u16 Tsa_085F75D4[];
extern u16 Tsa_085F76A8[];
extern u16 Img_FireSpellSprites[];
extern u16 Pal_FireSpellSprites[];
extern u32 AnimScr_EfxFireOBJ_L_Front[];
extern u32 AnimScr_EfxFireOBJ_L_Back[];
extern u32 AnimScr_EfxFireOBJ_R_Front[];
extern u32 AnimScr_EfxFireOBJ_R_Back[];
extern u16 Img_085F8494[];
extern u16 Img_085F91D0[];
extern u16 Img_085F9EAC[];
extern u16 Img_085FACD4[];
extern u16 Img_085FBCC8[];
extern u16 Img_085FCF64[];
extern u16 Img_085FDB30[];
extern u16 Img_085FE728[];
extern u16 Img_085FF280[];
extern u16 Img_085FFD7C[];
extern u16 Img_08600784[];
extern u16 Pal_EfxFireHitBG[];
extern u16 Tsa_086010AC[];
extern u16 Tsa_08601158[];
extern u16 Tsa_08601210[];
extern u16 Tsa_086012DC[];
extern u16 Tsa_086013BC[];
extern u16 Tsa_086014B0[];
extern u16 Tsa_086015C8[];
extern u16 Tsa_086016F4[];
extern u16 Tsa_0860182C[];
extern u16 Tsa_08601970[];
extern u16 Tsa_08601AC4[];
extern u16 Tsa_08601C1C[];
extern u16 Tsa_08601D84[];
extern u16 Tsa_08601EF0[];
extern u16 Tsa_0860206C[];
extern u16 Tsa_08602200[];
extern u16 Tsa_086023A0[];
extern u16 Tsa_08602540[];
extern u16 Tsa_086026E0[];
extern u16 Tsa_08602880[];
extern u16 Tsa_08602A10[];
extern u16 Img_EkrElfireBG[];
extern u16 Pal_EkrElfireBG[];
extern u16 Tsa_EkrElfireBG[];
extern u16 Img_EfxElfireOBJ[];
extern u16 Pal_EfxElfireOBJ[];
extern u32 AnimScr_EfxElfireObjRight[];
extern u32 AnimScr_EfxElfireObjLeft[];
extern u16 Img_BoltingBg_A[];
extern u16 Img_BoltingBg_B[];
extern u16 Img_BoltingBg_C[];
extern u16 Pal_BoltingBg[];
extern u16 Tsa_BoltingBg_A[];
extern u16 Tsa_BoltingBg_B[];
extern u16 Tsa_BoltingBg_C[];
extern u16 Tsa_BoltingBg_D[];
extern u16 Tsa_BoltingBg_E[];
extern u16 Tsa_BoltingBg_F[];
extern u16 Tsa_BoltingBg_G[];
extern u16 Tsa_BoltingBg_H[];
extern u16 Tsa_BoltingBg_I[];
extern u16 Tsa_BoltingBg_J[];
extern u16 Tsa_BoltingBg_K[];
extern u32 AnimScr_EfxThunderstormOBJ[]; // script
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_A[];
extern u16 Img_FimbulvetrBg_B[];
extern u16 Img_FimbulvetrBg_B[];
extern u16 Img_FimbulvetrBg_C[];
extern u16 Img_FimbulvetrBg_D[];
extern u16 Img_FimbulvetrBg_D[];
extern u16 Pal_FimbulvetrBg[];
extern u16 Tsa_FimbulvetrBg_A[];
extern u16 Tsa_FimbulvetrBg_B[];
extern u16 Tsa_FimbulvetrBg_C[];
extern u16 Tsa_FimbulvetrBg_D[];
extern u16 Tsa_FimbulvetrBg_E[];
extern u16 Tsa_FimbulvetrBg_F[];
extern u16 Tsa_FimbulvetrBg_G[];
extern u16 Tsa_FimbulvetrBg_H[];
extern u16 Tsa_FimbulvetrBg_I[];
extern u16 Tsa_FimbulvetrBg_J[];
extern u16 Tsa_FimbulvetrBg_K[];
extern u16 Img_FimbulvetrBg_Tornado_A[];
extern u16 Img_FimbulvetrBg_Tornado_B[];
extern u16 Img_FimbulvetrBg_Tornado_C[];
extern u16 Img_FimbulvetrBg_Tornado_D[];
extern u16 Img_FimbulvetrBg_Tornado_E[];
extern u16 Img_FimbulvetrBg_Tornado_F[];
extern u16 Pal_FimbulvetrBg_Tornado[];
extern u16 Tsa_FimbulvetrBg_Tornado_A[];
extern u16 Tsa_FimbulvetrBg_Tornado_B[];
extern u16 Tsa_FimbulvetrBg_Tornado_C[];
extern u16 Tsa_FimbulvetrBg_Tornado_D[];
extern u16 Tsa_FimbulvetrBg_Tornado_E[];
extern u16 Tsa_FimbulvetrBg_Tornado_F[];
extern u16 Img_FimbulvetrSprites_Snow[];
extern u32 AnimScr_FimbulvetrOBJ1[]; // script
extern u8 AnimScr_FimbulvetrOBJ2[]; // script
extern u32 AnimScr_FimbulvetrOBJ2Fall_TypeA[]; // script
extern u32 AnimScr_FimbulvetrOBJ2Fall_TypeB[]; // script
extern u16 Img_0861AD94[];
extern u16 Img_0861B65C[];
extern u16 Img_0861BDAC[];
extern u16 Img_0861C770[];
extern u16 Img_0861D2C4[];
extern u16 Img_0861DDCC[];
extern u16 Img_0861E0E4[];
extern u16 Img_0861ED94[];
extern u16 Pal_0861F7B4[];
extern u16 Pal_0861F7D4[];
extern u16 Tsa_0861F7F4[];
extern u16 Tsa_0861F918[];
extern u16 Tsa_0861FA38[];
extern u16 Tsa_0861FB44[];
extern u16 Tsa_0861FC40[];
extern u16 Tsa_0861FD28[];
extern u16 Tsa_0861FE0C[];
extern u16 Tsa_0861FEF0[];
extern u16 Tsa_0861FFCC[];
extern u16 Tsa_086200AC[];
extern u16 Tsa_086201A0[];
extern u16 Tsa_08620294[];
extern u16 Tsa_08620398[];
extern u16 Tsa_086204A0[];
extern u16 Tsa_086205B8[];
extern u16 Tsa_086206DC[];
extern u16 Tsa_086207F0[];
extern u16 Tsa_086208A0[];
extern u16 Tsa_086209A8[];
extern u16 Tsa_08620AE4[];
extern u16 Tsa_08620C58[];
extern u16 Tsa_08620DF0[];
extern u16 Tsa_08620F64[];
extern u16 Tsa_08621070[];
extern u16 Tsa_08621144[];
extern u16 Tsa_086211E4[];
extern u16 Tsa_08621304[];
extern u16 Tsa_08621420[];
extern u16 Tsa_08621534[];
extern u16 Tsa_0862162C[];
extern u16 Tsa_08621714[];
extern u16 Tsa_086217E4[];
extern u16 Tsa_086218A8[];
extern u16 Img_AircaliburBg[];
extern u16 Pal_AircaliburBg[];
extern u16 Tsa_AircaliburBg_A[];
extern u16 Tsa_AircaliburBg_B[];
extern u16 Img_AircaliburSprites[];
extern u16 Pal_AircaliburSprites[];
extern u32 AnimScr_EfxAlacaliburOBJ_RightFront[];
extern u32 AnimScr_EfxAlacaliburOBJ_RightBack[];
extern u32 AnimScr_EfxAlacaliburOBJ_LeftFront[];
extern u32 AnimScr_EfxAlacaliburOBJ_LeftBack[];
extern u16 Img_08626944[];
extern u16 Img_08627514[];
extern u16 Img_08628224[];
extern u16 Img_08629480[];
extern u16 Img_08629B04[];
extern u16 Img_0862A060[];
extern u16 Pal_0862A2D0[];
extern u16 Pal_0862A2F0[];
extern u16 Tsa_0862A310[];
extern u16 Tsa_0862A40C[];
extern u16 Tsa_0862A50C[];
extern u16 Tsa_0862A610[];
extern u16 Tsa_0862A708[];
extern u16 Tsa_0862A814[];
extern u16 Tsa_0862A920[];
extern u16 Tsa_0862AA40[];
extern u16 Tsa_0862AB64[];
extern u16 Tsa_0862AC4C[];
extern u16 Tsa_0862AD28[];
extern u16 Tsa_0862ADE8[];
extern u16 Tsa_0862AEA0[];
extern u16 Tsa_0862AF48[];
extern u16 Tsa_0862B004[];
extern u16 Tsa_0862B0DC[];
extern u16 Tsa_0862B1BC[];
extern u16 Tsa_0862B2AC[];
extern u16 Tsa_0862B3A8[];
extern u16 Tsa_0862B49C[];
extern u16 Tsa_0862B594[];
extern u16 Tsa_0862B680[];
extern u16 Tsa_0862B764[];
extern u16 Tsa_0862B83C[];
extern u16 Tsa_0862B90C[];
extern u16 Tsa_0862B9D8[];
extern u16 Tsa_0862BAA0[];
extern u16 Tsa_0862BB54[];
extern u16 Tsa_0862BC08[];
extern u16 Tsa_0862BCA8[];
extern u16 Tsa_0862BD5C[];
extern u16 Tsa_0862BE18[];
extern u16 Tsa_0862BEF4[];
extern u16 Tsa_0862BFDC[];
extern u16 Tsa_0862C100[];
extern u16 Tsa_0862C220[];
extern u16 Tsa_0862C32C[];
extern u16 Tsa_0862C438[];
extern u16 Tsa_0862C534[];
extern u16 Tsa_0862C634[];
extern u16 Tsa_0862C730[];
extern u16 Img_FluxAnimSprites_Orb[];
extern u16 Img_FluxAnimSprites_Tendrils[];
extern u16 Img_FluxAnimSprites_SigilVoid[];
extern u16 Pal_FluxAnimSprites[];
extern u32 AnimScr_EfxMistyRainObj1[];
extern u32 AnimScr_EfxHazymoonOBJ3RND[];
extern u32 AnimScr_EfxMistyRainObj2[];
extern u32 AnimScr_EfxMistyRainObj4[];
extern u32 AnimScr_EfxMistyRainObj5[];
extern u32 AnimScr_EfxMistyRainObj3[];
extern u16 Img_NosferatuBg_A[];
extern u16 Img_NosferatuBg_B[];
extern u16 Img_NosferatuBg_C[];
extern u16 Img_NosferatuBg_D[];
extern u16 Img_NosferatuBg_E[];
extern u16 Img_NosferatuBg_F[];
extern u16 Img_NosferatuBg_G[];
extern u16 Img_NosferatuBg_H[];
extern u16 Img_NosferatuBg_I[];
extern u16 Img_NosferatuBg_J[];
extern u16 Img_NosferatuBg_K[];
extern u16 Img_NosferatuBg_L[];
extern u16 Img_NosferatuBg_M[];
extern u16 Pal_NosferatuBg[];
extern u16 Tsa_08636660[];
extern u16 Tsa_08636790[];
extern u16 Tsa_0863683C[];
extern u16 Tsa_086368EC[];
extern u16 Tsa_086369A4[];
extern u16 Tsa_08636A64[];
extern u16 Tsa_08636B30[];
extern u16 Tsa_08636C10[];
extern u16 Tsa_08636CF8[];
extern u16 Tsa_08636E00[];
extern u16 Tsa_08636F1C[];
extern u16 Tsa_08637058[];
extern u16 Tsa_086371A8[];
extern u16 Tsa_08637300[];
extern u16 Tsa_08637458[];
extern u16 Tsa_086375AC[];
extern u16 Tsa_086376FC[];
extern u16 Tsa_0863784C[];
extern u16 Tsa_08637984[];
extern u16 Tsa_08637AB0[];
extern u16 Tsa_08637BCC[];
extern u16 Tsa_08637CD8[];
extern u16 Tsa_08637DD0[];
extern u16 Tsa_08637EBC[];
extern u16 Tsa_08637F8C[];
extern u16 Tsa_08638048[];
extern u16 Tsa_086380FC[];
extern u16 Tsa_086381AC[];
extern u16 Tsa_08638258[];
extern u16 Tsa_08638300[];
extern u16 Tsa_086383B4[];
extern u16 Tsa_08638474[];
extern u16 Tsa_08638540[];
extern u16 Tsa_08638608[];
extern u16 Tsa_086386D0[];
extern u16 Tsa_086387A4[];
extern u16 Tsa_08638880[];
extern u16 Tsa_08638968[];
extern u16 Tsa_08638A5C[];
extern u16 Tsa_08638B64[];
extern u16 Tsa_08638C6C[];
extern u16 Tsa_08638D90[];
extern u16 Tsa_08638EB0[];
extern u16 Tsa_08638FCC[];
extern u16 Tsa_086390DC[];
extern u16 Tsa_086391E8[];
extern u16 Tsa_086392E8[];
extern u16 Tsa_086393D8[];
extern u16 Tsa_086394B4[];
extern u16 Tsa_08639580[];
extern u16 Tsa_08639638[];
extern u16 Img_086396E4[];
extern u16 Img_08639C98[];
extern u16 Img_0863A360[];
extern u16 Img_0863A9A0[];
extern u16 Img_0863AFA8[];
extern u16 Img_0863B608[];
extern u16 Img_0863BC78[];
extern u16 Img_0863C2B4[];
extern u16 Img_0863C8FC[];
extern u16 Img_0863D000[];
extern u16 Img_0863D7B8[];
extern u16 Img_0863DFAC[];
extern u16 Img_0863E784[];
extern u16 Img_0863EFA0[];
extern u16 Img_0863F720[];
extern u16 Img_0863FEB4[];
extern u16 Img_086405E8[];
extern u16 Img_08641094[];
extern u16 Img_086415F4[];
extern u16 Pal_DivineBg3[];
extern u16 Pal_DivineBg[];
extern u16 Tsa_08641DA4[];
extern u16 Tsa_08641F38[];
extern u16 Tsa_0864213C[];
extern u16 Tsa_0864240C[];
extern u16 Tsa_086426DC[];
extern u16 Tsa_0864298C[];
extern u16 Tsa_08642C40[];
extern u16 Tsa_08642ECC[];
extern u16 Tsa_08643150[];
extern u16 Tsa_086433C4[];
extern u16 Tsa_08643658[];
extern u16 Tsa_086438E0[];
extern u16 Tsa_08643B7C[];
extern u16 Tsa_08643E04[];
extern u16 Tsa_08644080[];
extern u16 Tsa_086442B0[];
extern u16 Tsa_08644500[];
extern u16 Tsa_08644730[];
extern u16 Tsa_08644928[];
extern u16 Tsa_08644B0C[];
extern u16 Tsa_08644CA8[];
extern u16 Tsa_08644DD0[];
extern u16 Tsa_08644E70[];
extern u16 Tsa_08644F18[];
extern u16 Tsa_08644FC0[];
extern u16 Tsa_08645070[];
extern u16 Tsa_08645128[];
extern u16 Tsa_086451F4[];
extern u16 Tsa_086452C0[];
extern u16 Tsa_08645394[];
extern u16 Tsa_0864546C[];
extern u16 Tsa_08645548[];
extern u16 Tsa_08645624[];
extern u16 Tsa_08645708[];
extern u16 Tsa_086457BC[];
extern u16 Tsa_08645858[];
extern u16 Tsa_086458F4[];
extern u16 Tsa_08645990[];
extern u16 Tsa_08645A2C[];
extern u16 Tsa_08645AC8[];
extern u16 Tsa_08645B64[];
extern u16 Tsa_08645C00[];
extern u16 Tsa_08645C9C[];
extern u16 Tsa_08645D38[];
extern u16 Img_DivineSprites[];
extern u16 Pal_DivineSprites[];
extern u32 AnimScr_EfxDevineOBJ[];
extern u16 Img_EclipseBg_A[];
extern u16 Img_EclipseBg_B[];
extern u16 Img_EclipseBg_C[];
extern u16 Img_EclipseBg_D[];
extern u16 Img_EclipseBg_E[];
extern u16 Img_EclipseBg_F[];
extern u16 Img_EclipseBg_G[];
extern u16 Img_EclipseBg_H[];
extern u16 Img_EclipseBg_I[];
extern u16 Img_EclipseBg_J[];
extern u16 Img_EclipseBg_K[];
extern u16 Img_EclipseBg_L[];
extern u16 Img_EclipseBg_M[];
extern u16 Pal_EclipseBg_B[];
extern u16 Pal_EclipseBg_C[];
extern u16 Tsa_EclipseBg_A[];
extern u16 Tsa_EclipseBg_B[];
extern u16 Tsa_EclipseBg_C[];
extern u16 Tsa_EclipseBg_D[];
extern u16 Tsa_EclipseBg_E[];
extern u16 Tsa_EclipseBg_F[];
extern u16 Tsa_EclipseBg_G[];
extern u16 Tsa_EclipseBg_H[];
extern u16 Tsa_EclipseBg_I[];
extern u16 Tsa_EclipseBg_J[];
extern u16 Tsa_EclipseBg_K[];
extern u16 Tsa_EclipseBg_L[];
extern u16 Tsa_EclipseBg_M[];
extern u16 Tsa_EclipseBg_N[];
extern u16 Tsa_EclipseBg_O[];
extern u16 Tsa_EclipseBg_P[];
extern u16 Tsa_EclipseBg_Q[];
extern u16 Tsa_EclipseBg_R[];
extern u16 Tsa_EclipseBg_S[];
extern u16 Tsa_EclipseBg_T[];
extern u16 Tsa_EclipseBg_U[];
extern u16 Tsa_EclipseBg_V[];
extern u16 Tsa_EclipseBg_W[];
extern u16 Tsa_EclipseBg_X[];
extern u16 Tsa_EclipseBg_Y[];
extern u16 Tsa_EclipseBg_Z[];
extern u16 Tsa_EclipseBg_AA[];
extern u16 Img_EclipseSprites_Swirl[];
extern u16 Img_EclipseSprites_08650DA8[];
extern u16 Img_EclipseSprites_08651240[];
extern u16 Pal_EclipseSprites[];
extern u32 AnimScr_EfxHazymoonOBJ2_1[];
extern u32 AnimScr_EfxHazymoonOBJ2_2[];
extern u32 AnimScr_EfxHazymoonOBJ2_3[];
extern u16 Img_FenrirBg_Sigils[];
extern u16 Pal_EfxFenrirBGCOL[];
extern u16 Tsa_FenrirBg_Sigils[];
extern u16 Img_08652948[];
extern u16 Img_08653B60[];
extern u16 Img_08654EB0[];
extern u16 Img_08655D2C[];
extern u16 Pal_FenrirBg[];
extern u16 Pal_EfxFenrirBG2_B[];
extern u16 Tsa_08656934[];
extern u16 Tsa_086569F0[];
extern u16 Tsa_08656AAC[];
extern u16 Tsa_08656B68[];
extern u16 Tsa_08656C24[];
extern u16 Tsa_08656CE0[];
extern u16 Tsa_08656D9C[];
extern u16 Tsa_08656EA0[];
extern u16 Tsa_08656FA4[];
extern u16 Tsa_086570A8[];
extern u16 Tsa_086571AC[];
extern u16 Tsa_086572B0[];
extern u16 Tsa_086573B4[];
extern u16 Tsa_086574F4[];
extern u16 Tsa_08657638[];
extern u16 Tsa_0865777C[];
extern u16 Tsa_086578C0[];
extern u16 Tsa_08657A04[];
extern u16 Tsa_08657B48[];
extern u16 Tsa_08657CC8[];
extern u16 Tsa_08657E4C[];
extern u16 Tsa_08657FD0[];
extern u16 Tsa_08658130[];
extern u16 Tsa_08658290[];
extern u16 Tsa_086583F0[];
extern u16 Tsa_08658594[];
extern u16 Tsa_08658738[];
extern u16 Tsa_086588DC[];
extern u16 Tsa_08658A4C[];
extern u16 Tsa_08658BBC[];
extern u16 Tsa_08658D2C[];
extern u16 Tsa_08658ED0[];
extern u16 Tsa_08659074[];
extern u16 Tsa_08659218[];
extern u16 Tsa_0865938C[];
extern u16 Tsa_08659500[];
extern u16 Tsa_08659674[];
extern u16 Tsa_08659824[];
extern u16 Tsa_086599D4[];
extern u16 Tsa_08659B84[];
extern u16 Tsa_08659CF8[];
extern u16 Tsa_08659E6C[];
extern u16 Tsa_08659FE0[];
extern u16 Tsa_0865A194[];
extern u16 Tsa_0865A348[];
extern u16 Tsa_0865A4FC[];
extern u16 Tsa_0865A674[];
extern u16 Tsa_0865A7EC[];
extern u16 Tsa_0865A964[];
extern u16 Tsa_0865ABBC[];
extern u16 Tsa_0865ADC4[];
extern u16 Img_FenrirSprites[];
extern u16 Pal_FenrirSprites_A[];
extern u16 Pal_FenrirSprites_B[];
extern u32 AnimScr_EfxFenrir1[];
extern u32 AnimScr_EfxFenrir2[];
extern u32 AnimScr_EfxFenrir3[];
extern u16 Img_0865C8C0[];
extern u16 Img_0865CE1C[];
extern u16 Img_0865D498[];
extern u16 Img_0865DAE4[];
extern u16 Img_0865E298[];
extern u16 Img_0865E9A0[];
extern u16 Img_0865EEBC[];
extern u16 Img_0865F7BC[];
extern u16 Img_08660170[];
extern u16 Img_08660AE4[];
extern u16 Img_086614B8[];
extern u16 Img_086624BC[];
extern u16 Img_0866330C[];
extern u16 Img_08663DF0[];
extern u16 Img_08664998[];
extern u16 Img_08665534[];
extern u16 Img_08665FF4[];
extern u16 Img_08666A6C[];
extern u16 Pal_08667D70[];
extern u16 Pal_08667D90[];
extern u16 Tsa_08667DB0[];
extern u16 Tsa_08667ED4[];
extern u16 Tsa_08667FF4[];
extern u16 Tsa_08668100[];
extern u16 Tsa_086681FC[];
extern u16 Tsa_086682E4[];
extern u16 Tsa_086683CC[];
extern u16 Tsa_086684AC[];
extern u16 Tsa_08668588[];
extern u16 Tsa_08668668[];
extern u16 Tsa_0866875C[];
extern u16 Tsa_08668850[];
extern u16 Tsa_08668954[];
extern u16 Tsa_08668A5C[];
extern u16 Tsa_08668B74[];
extern u16 Tsa_08668C98[];
extern u16 Tsa_08668DAC[];
extern u16 Tsa_08668ED0[];
extern u16 Tsa_08668FF4[];
extern u16 Tsa_08669104[];
extern u16 Tsa_08669204[];
extern u16 Tsa_086692EC[];
extern u16 Tsa_086693CC[];
extern u16 Tsa_086694A8[];
extern u16 Tsa_08669584[];
extern u16 Tsa_08669668[];
extern u16 Tsa_0866975C[];
extern u16 Tsa_0866984C[];
extern u16 Tsa_08669950[];
extern u16 Tsa_08669A58[];
extern u16 Tsa_08669B6C[];
extern u16 Tsa_08669C90[];
extern u16 Tsa_08669DA4[];
extern u16 Tsa_08669EC8[];
extern u16 Tsa_08669FE8[];
extern u16 Tsa_0866A0F4[];
extern u16 Tsa_0866A1F0[];
extern u16 Tsa_0866A2D8[];
extern u16 Tsa_0866A3C0[];
extern u16 Tsa_0866A4A0[];
extern u16 Tsa_0866A57C[];
extern u16 Tsa_0866A65C[];
extern u16 Tsa_0866A750[];
extern u16 Tsa_0866A844[];
extern u16 Tsa_0866A948[];
extern u16 Tsa_0866AA50[];
extern u16 Tsa_0866AB68[];
extern u16 Tsa_0866AC8C[];
extern u16 Tsa_0866AD9C[];
extern u16 Tsa_0866AFB0[];
extern u16 Tsa_0866B16C[];
extern u16 Tsa_0866B348[];
extern u16 Tsa_0866B54C[];
extern u16 Tsa_0866B754[];
extern u16 Tsa_0866B968[];
extern u16 Tsa_0866BBC8[];
extern u16 Tsa_0866BDFC[];
extern u16 Tsa_0866C070[];
extern u16 Tsa_0866C2B8[];
extern u16 Tsa_0866C618[];
extern u16 Tsa_0866C96C[];
extern u16 Tsa_0866CC7C[];
extern u16 Tsa_0866CF60[];
extern u16 Tsa_0866D230[];
extern u16 Tsa_0866D4C8[];
extern u16 Tsa_0866D760[];
extern u16 Tsa_0866D98C[];
extern u16 Tsa_0866DC40[];
extern u16 Tsa_0866DF00[];
extern u16 Tsa_0866E230[];
extern u16 Tsa_0866E580[];
extern u16 Tsa_0866E8F8[];
extern u16 Tsa_0866EC80[];
extern u16 Img_PurgeSprites[];
extern u16 Pal_PurgeSprites[];
extern u32 AnimScr_EfxPurge[];
extern u16 Img_HealSpellBg[];
extern u16 * Tsa_HealSpellBg[];
extern u16 Pal_HealSpellBg[];
extern u16 Img_HealSprites_Sparkles[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_EfxLiveBG_B[];
extern u16 * Tsa_EfxLiveBG_B_L[];
extern u16 * Tsa_EfxLiveBG_B_R[];
extern u16 Pal_08672000[];
extern u16 Pal_08672220[];
extern u32 AnimScr_EfxLiveOBJ1[];
extern u32 AnimScr_EfxLiveOBJ2[];
extern u32 AnimScr_EfxReblowOBJ_Right1[];
extern u32 AnimScr_EfxReblowOBJ_Right2[];
extern u32 AnimScr_EfxReblowOBJ_Left1[];
extern u32 AnimScr_EfxReblowOBJ_Left2[];
extern u16 Tsa_08677E80[];
extern u16 Tsa_08677F8C[];
extern u16 Tsa_0867808C[];
extern u16 Tsa_08678198[];
extern u16 Tsa_086782A4[];
extern u16 Pal_08678720[];
extern u16 Pal_08678920[];
extern u16 Pal_08678B20[];
extern u16 Img_08679B04[];
extern u16 Img_0867A130[];
extern u16 Img_0867A828[];
extern u16 Img_0867AE48[];
extern u16 Pal_MapAnimRestore[];
extern u16 Tsa_0867B5C4[];
extern u16 Tsa_0867B670[];
extern u16 Tsa_0867B724[];
extern u16 Tsa_0867B7E4[];
extern u16 Tsa_0867B8AC[];
extern u16 Tsa_0867B988[];
extern u16 Tsa_0867BA68[];
extern u16 Tsa_0867BB50[];
extern u16 Tsa_0867BC40[];
extern u16 Tsa_0867BD40[];
extern u16 Tsa_0867BE4C[];
extern u16 Tsa_0867BF6C[];
extern u16 Tsa_0867C09C[];
extern u32 AnimScr_EfxRestOBJ[];
extern u16 Img_SilenceBg[];
extern u16 Tsa_0867F97C[];
extern u16 Tsa_0867FA78[];
extern u16 Tsa_0867FB60[];
extern u16 Tsa_0867FC48[];
extern u16 Tsa_0867FD30[];
extern u16 Tsa_0867FE2C[];
extern u16 Tsa_0867FF14[];
extern u16 Tsa_0867FFAC[];
extern u16 Tsa_08680094[];
extern u16 Tsa_0868012C[];
extern u16 Tsa_08680214[];
extern u16 Tsa_08680310[];
extern u16 Tsa_086803A8[];
extern u16 Tsa_08680490[];
extern u16 Tsa_08680528[];
extern u16 Tsa_08680624[];
extern u16 Tsa_086806BC[];
extern u16 Tsa_086807CC[];
extern u16 Img_SilenceSprites[];
extern u16 Pal_Silence[];
extern u32 AnimScr_EfxSilenceOBJ[];
extern u16 Pal_HammerneBg[];
extern u16 Tsa_086810D8[];
extern u16 Tsa_08681184[];
extern u16 Tsa_08681234[];
extern u16 Tsa_086812F4[];
extern u16 Tsa_086813BC[];
extern u16 Tsa_08681494[];
extern u16 Tsa_08681570[];
extern u16 Tsa_08681658[];
extern u16 Tsa_08681748[];
extern u16 Tsa_08681848[];
extern u16 Tsa_08681954[];
extern u16 Tsa_08681A74[];
extern u16 Tsa_08681BA4[];
extern u32 AnimScr_EfxHammarneOBJ[];
extern u16 Img_086849B8[];
extern u16 Tsa_08684AB8[];
extern u16 Img_SleepBg[];
extern u16 Pal_SleepBg[];
extern u16 Tsa_086861C4[];
extern u16 Tsa_086862A0[];
extern u16 Tsa_0868637C[];
extern u16 Tsa_08686458[];
extern u16 Tsa_08686534[];
extern u16 Tsa_08686610[];
extern u16 Tsa_086866EC[];
extern u16 Tsa_086867C8[];
extern u16 Tsa_086868A4[];
extern u16 Tsa_08686980[];
extern u16 Tsa_08686A5C[];
extern u16 Tsa_08686B38[];
extern u16 Tsa_08686C14[];
extern u16 Tsa_08686CF0[];
extern u16 Tsa_08686DCC[];
extern u16 Tsa_08686EA8[];
extern u16 Img_SleepSprites[];
extern u16 Pal_SleepSprites[];
extern u16 Pal_HammerneSprites[];
extern u32 AnimScr_EfxSleepOBJ2[];
extern u32 AnimScr_EfxSleepOBJ1[];
extern u16 Pal_BerserkBg[];
extern u16 Img_BerserkSprites_A[];
extern u16 Img_BerserkSprites_B[];
extern u16 Pal_BerserkSprites[];
extern u32 AnimScr_EfxBerserk1[];
extern u32 AnimScr_EfxBerserk2[];
extern u32 AnimScr_EfxBerserk3[];
extern u32 AnimScr_EfxBerserk4[];
extern u32 AnimScr_EfxBerserk5[];
extern u32 AnimScr_EfxBerserk6[];
extern u32 AnimScr_EfxBerserk7[];
extern u32 AnimScr_EfxBerserk8[];
extern u32 AnimScr_EfxBerserk9[];
extern u32 AnimScr_EfxBerserk10[];
extern u16 Img_BarrierBg[];
extern u16 Pal_BarrierBg[];
extern u16 Tsa_0868DF9C[];
extern u16 Tsa_0868E054[];
extern u16 Tsa_0868E118[];
extern u16 Tsa_0868E208[];
extern u16 Tsa_0868E338[];
extern u16 Img_EfxMshield[];
extern u32 AnimScr_EfxMshield1[];
extern u32 AnimScr_EfxMshield2[];
extern u16 Pal_IvaldiSprites[];
extern u16 Img_IvaldiSprites[];
extern u32 AnimScr_EfxIvald_R1[];
extern u32 AnimScr_EfxIvald_R2[];
extern u32 AnimScr_EfxIvald_R3[];
extern u32 AnimScr_EfxIvald_R4[];
extern u32 AnimScr_EfxIvald2_L[];
extern u32 AnimScr_EfxIvald2_R[];
extern u32 AnimScr_EfxIvald_L1[];
extern u32 AnimScr_EfxIvald_L2[];
extern u32 AnimScr_EfxIvald_L3[];
extern u32 AnimScr_EfxIvald_L4[];
extern u16 Img_IvaldiBg1[];
extern u16 Pal_IvaldiBg1[];
extern u16 Tsa_086945E4[];
extern u16 Tsa_086946A0[];
extern u16 Tsa_086947C4[];
extern u16 Tsa_0869495C[];
extern u16 Tsa_08694B58[];
extern u16 Tsa_08694DD0[];
extern u16 Tsa_08695048[];
extern u16 Tsa_086952C0[];
extern u16 Tsa_08695530[];
extern u16 Tsa_08695744[];
extern u16 Tsa_086958F0[];
extern u16 Tsa_08695A34[];
extern u16 Img_IvaldiBg2[];
extern u16 Pal_IvaldiBg2[];
extern u16 Tsa_08696860[];
extern u16 Tsa_086968F8[];
extern u16 Tsa_08696A8C[];
extern u16 Tsa_08696C28[];
extern u16 Tsa_08696DC4[];
extern u16 Img_08696F64[];
extern u16 Img_08697610[];
extern u16 Img_08697D18[];
extern u16 Img_08698584[];
extern u16 Img_08698F78[];
extern u16 Img_08699AEC[];
extern u16 Img_0869A70C[];
extern u16 Img_0869B470[];
extern u16 Img_0869C130[];
extern u16 Img_0869CE1C[];
extern u16 Img_0869DB90[];
extern u16 Pal_0869E810[];
extern u16 Pal_0869E830[];
extern u16 Pal_0869E850[];
extern u16 Pal_0869E870[];
extern u16 Pal_0869E890[];
extern u16 Pal_0869E8B0[];
extern u16 Pal_0869E8D0[];
extern u16 Pal_0869E8F0[];
extern u16 Pal_0869E910[];
extern u16 Pal_0869E930[];
extern u16 Pal_0869E950[];
extern u16 Tsa_0869E970[];
extern u16 Tsa_0869EBB4[];
extern u16 Tsa_0869EE2C[];
extern u16 Tsa_0869F090[];
extern u16 Tsa_0869F304[];
extern u16 Tsa_0869F5C0[];
extern u16 Tsa_0869F888[];
extern u16 Tsa_0869FB4C[];
extern u16 Tsa_0869FDFC[];
extern u16 Tsa_086A00B0[];
extern u16 Tsa_086A0388[];
extern u16 Img_IvaldiBg4[];
extern u16 Pal_IvaldiBg4[];
extern u16 Tsa_086A1D00[];
extern u16 Img_GleipnirSprites_Rocks[];
extern u16 Pal_GleipnirSprites_Rocks[];
extern u32 AnimScr_EfxDarkGradoOBJ01piece1[];
extern u32 AnimScr_EfxDarkGradoOBJ01piece2[];
extern u32 AnimScr_EfxDarkGradoOBJ01piece3[];
extern u32 AnimScr_EfxDarkGradoOBJ01piece4[];
extern u16 Img_GleipnirSprites_Comet[];
extern u16 Pal_GleipnirSprites_Comet[];
extern u32 AnimScr_EfxDarkGradoOBJ02piece1_R[];
extern u32 AnimScr_EfxDarkGradoOBJ02piece2_R[];
extern u32 AnimScr_EfxDarkGradoOBJ02piece1_L[];
extern u32 AnimScr_EfxDarkGradoOBJ02piece2_L[];
extern u16 Img_086A2EC0[];
extern u16 Img_086A34D0[];
extern u16 Img_086A3BA0[];
extern u16 Img_086A4270[];
extern u16 Img_086A48D8[];
extern u16 Img_086A4E9C[];
extern u16 Img_086A538C[];
extern u16 Img_086A576C[];
extern u16 Img_086A5B4C[];
extern u16 Img_086A5F2C[];
extern u16 Img_086A6304[];
extern u16 Pal_GleipnirBg_Sigil[];
extern u16 Tsa_086A66F8[];
extern u16 Tsa_086A68A0[];
extern u16 Tsa_086A6A14[];
extern u16 Tsa_086A6B88[];
extern u16 Tsa_086A6CD0[];
extern u16 Tsa_086A6DDC[];
extern u16 Tsa_086A6EBC[];
extern u16 Tsa_086A6F94[];
extern u16 Tsa_086A7058[];
extern u16 Tsa_086A7114[];
extern u16 Tsa_086A71B8[];
extern u16 Img_086A7258[];
extern u16 Img_086A76C0[];
extern u16 Img_086A7BC4[];
extern u16 Img_086A817C[];
extern u16 Img_086A87EC[];
extern u16 Img_086A8F48[];
extern u16 Img_086A97A8[];
extern u16 Img_086AA13C[];
extern u16 Img_086AABE0[];
extern u16 Img_086AB790[];
extern u16 Img_086AC4B0[];
extern u16 Img_086AD2B8[];
extern u16 Img_086AE220[];
extern u16 Img_086AF26C[];
extern u16 Img_086B0398[];
extern u16 Img_086B15C4[];
extern u16 Pal_086B2878[];
extern u16 Pal_086B2898[];
extern u16 Pal_086B28B8[];
extern u16 Pal_086B28D8[];
extern u16 Pal_086B28F8[];
extern u16 Pal_086B2918[];
extern u16 Pal_086B2938[];
extern u16 Pal_086B2958[];
extern u16 Pal_086B2978[];
extern u16 Pal_086B2998[];
extern u16 Pal_086B29B8[];
extern u16 Pal_086B29D8[];
extern u16 Pal_086B29F8[];
extern u16 Pal_086B2A18[];
extern u16 Pal_086B2A38[];
extern u16 Pal_086B2A58[];
extern u16 Tsa_086B2A78[];
extern u16 Tsa_086B2B30[];
extern u16 Tsa_086B2BF4[];
extern u16 Tsa_086B2CCC[];
extern u16 Tsa_086B2DB8[];
extern u16 Tsa_086B2EBC[];
extern u16 Tsa_086B2FD8[];
extern u16 Tsa_086B3114[];
extern u16 Tsa_086B326C[];
extern u16 Tsa_086B33E0[];
extern u16 Tsa_086B3578[];
extern u16 Tsa_086B3734[];
extern u16 Tsa_086B38FC[];
extern u16 Tsa_086B3AEC[];
extern u16 Tsa_086B3CE8[];
extern u16 Tsa_086B3F00[];
extern u16 Img_GleipnirBg_Fog[];
extern u16 Pal_GleipnirBg_Fog[];
extern u16 Tsa_GleipnirBg_Fog[];
extern u16 Img_CrimsonEyeSprites[];
extern u16 Pal_CrimsonEyeSprites[];
extern u32 AnimScr_EfxCrimsonEyeOBJ[];
extern u32 AnimScr_EfxCrimsonEyeOBJFinishPiece1[];
extern u32 AnimScr_EfxCrimsonEyeOBJFinishPiece2[];
extern u16 Pal_efxGorgonBGFinish[];
extern u16 Img_efxCrimsonEyeBG[];
extern u16 Pal_efxCrimsonEyeBG[];
extern u16 Tsa_086B5ECC[];
extern u16 Tsa_086B5F78[];
extern u16 Tsa_086B603C[];
extern u16 Tsa_086B6100[];
extern u16 Tsa_086B61C4[];
extern u16 Tsa_086B6288[];
extern u16 Tsa_086B634C[];
extern u16 Tsa_086B6410[];
extern u16 Img_086B64BC[];
extern u16 Img_086B7DA8[];
extern u16 Img_086B9620[];
extern u16 Img_086BAF14[];
extern u16 Pal_efxCrimsonEyeBGFinish1[];
extern u16 Tsa_086BC884[];
extern u16 Tsa_086BCAF8[];
extern u16 Tsa_086BCD70[];
extern u16 Tsa_086BCFE8[];
extern u16 Img_StoneSprites[];
extern u16 Pal_StoneSprites[];
extern u32 AnimScr_EfxStone[];
extern u16 Img_086BDB7C[];
extern u16 Img_086BE0CC[];
extern u16 Img_086BE668[];
extern u16 Img_086BEC5C[];
extern u16 Img_086BF2F4[];
extern u16 Img_086BF9B0[];
extern u16 Img_086C0110[];
extern u16 Img_086C0924[];
extern u16 Img_086C119C[];
extern u16 Img_086C1AD0[];
extern u16 Img_086C2438[];
extern u16 Img_086C2DA8[];
extern u16 Img_086C375C[];
extern u16 Img_086C40F4[];
extern u16 Img_086C4AB4[];
extern u16 Img_086C53CC[];
extern u16 Img_086C5D20[];
extern u16 Img_086C669C[];
extern u16 Img_086C7010[];
extern u16 Tsa_086C796C[];
extern u16 Tsa_086C7A2C[];
extern u16 Tsa_086C7AF8[];
extern u16 Tsa_086C7BD0[];
extern u16 Tsa_086C7CBC[];
extern u16 Tsa_086C7DC0[];
extern u16 Tsa_086C7ED4[];
extern u16 Tsa_086C7FFC[];
extern u16 Tsa_086C8138[];
extern u16 Tsa_086C828C[];
extern u16 Tsa_086C8404[];
extern u16 Tsa_086C8570[];
extern u16 Tsa_086C86E4[];
extern u16 Tsa_086C8860[];
extern u16 Tsa_086C89EC[];
extern u16 Tsa_086C8B30[];
extern u16 Tsa_086C8C84[];
extern u16 Tsa_086C8DE8[];
extern u16 Tsa_086C8F4C[];
extern u16 Pal_StoneBg[];
extern u16 Pal_StoneBg_086C792C[];
extern u16 Pal_StoneBg_086C794C[];
extern u16 Img_086C90A4[];
extern u16 Pal_086C93FC[];
extern u32 AnimScr_086C95C0[];
extern u32 AnimScr_086C978C[];
extern u16 Img_086C97B4[];
extern u16 Img_086C9DAC[];
extern u16 Img_086CA3C4[];
extern u16 Img_086CAA94[];
extern u16 Img_086CB1C4[];
extern u16 Img_086CB8F0[];
extern u16 Img_086CC0E4[];
extern u16 Img_086CC8A0[];
extern u16 Img_086CD098[];
extern u16 Img_086CD988[];
extern u16 Img_086CE15C[];
extern u16 Img_086CE9FC[];
extern u16 Img_086CF244[];
extern u16 Img_086CF9D8[];
extern u16 Img_086D0268[];
extern u16 Img_086D0B24[];
extern u16 Img_086D134C[];
extern u16 Img_086D1B6C[];
extern u16 Img_086D2400[];
extern u16 Img_086D2BE4[];
extern u16 Pal_086D3454[];
extern u16 Pal_086D3474[];
extern u16 Pal_086D3494[];
extern u16 Pal_086D34B4[];
extern u16 Pal_086D34D4[];
extern u16 Pal_086D34F4[];
extern u16 Pal_086D3514[];
extern u16 Pal_086D3534[];
extern u16 Pal_086D3554[];
extern u16 Pal_086D3574[];
extern u16 Pal_086D3594[];
extern u16 Pal_086D35B4[];
extern u16 Pal_086D35D4[];
extern u16 Pal_086D35F4[];
extern u16 Pal_086D3614[];
extern u16 Pal_086D3634[];
extern u16 Pal_086D3654[];
extern u16 Pal_086D3674[];
extern u16 Pal_086D3694[];
extern u16 Pal_086D36B4[];
extern u16 Tsa_086D36D4[];
extern u16 Tsa_086D37B4[];
extern u16 Tsa_086D3890[];
extern u16 Tsa_086D3978[];
extern u16 Tsa_086D3A7C[];
extern u16 Tsa_086D3B78[];
extern u16 Tsa_086D3C84[];
extern u16 Tsa_086D3D8C[];
extern u16 Tsa_086D3E94[];
extern u16 Tsa_086D3FBC[];
extern u16 Tsa_086D40CC[];
extern u16 Tsa_086D41F4[];
extern u16 Tsa_086D4318[];
extern u16 Tsa_086D4428[];
extern u16 Tsa_086D454C[];
extern u16 Tsa_086D466C[];
extern u16 Tsa_086D4788[];
extern u16 Tsa_086D489C[];
extern u16 Tsa_086D49D0[];
extern u16 Tsa_086D4ADC[];
extern u16 Img_086D4C08[];
extern u16 Img_086D5418[];
extern u16 Img_086D5E44[];
extern u16 Img_086D68AC[];
extern u16 Img_086D73A4[];
extern u16 Img_086D7F20[];
extern u16 Pal_EvilEyeBg2_A[];
extern u16 Pal_086D8AB4[];
extern u16 Pal_086D8AD4[];
extern u16 Pal_086D8AF4[];
extern u16 Pal_086D8B14[];
extern u16 Pal_086D8B34[];
extern u16 Tsa_086D8B54[];
extern u16 Tsa_086D8C64[];
extern u16 Tsa_086D8DEC[];
extern u16 Tsa_086D8FA4[];
extern u16 Tsa_086D9170[];
extern u16 Tsa_086D9354[];
extern u16 Tsa_086D953C[];
extern u16 Tsa_086D96F0[];
extern u16 Tsa_086D98A8[];
extern u16 Tsa_086D9A74[];
extern u16 Img_086D9C40[];
extern u16 Pal_086DA33C[];
extern u32 AnimScr_086DA920[];
extern u16 Img_086DAF34[];
extern u16 Img_086DB760[];
extern u16 Img_086DC064[];
extern u16 Img_086DCA64[];
extern u16 Img_086DD598[];
extern u16 Img_086DE168[];
extern u16 Img_086DED90[];
extern u16 Img_086DF9F8[];
extern u16 Img_086E05F0[];
extern u16 Img_086E1294[];
extern u16 Img_086E1F54[];
extern u16 Img_086E2BE8[];
extern u16 Img_086E3828[];
extern u16 Img_086E4420[];
extern u16 Img_086E4F90[];
extern u16 Img_086E5A30[];
extern u16 Pal_086E6440[];
extern u16 Pal_086E6460[];
extern u16 Pal_086E6480[];
extern u16 Pal_086E64A0[];
extern u16 Pal_086E64C0[];
extern u16 Tsa_086E64E0[];
extern u16 Tsa_086E65EC[];
extern u16 Tsa_086E671C[];
extern u16 Tsa_086E6860[];
extern u16 Tsa_086E69C8[];
extern u16 Tsa_086E6B38[];
extern u16 Tsa_086E6CC4[];
extern u16 Tsa_086E6E60[];
extern u16 Tsa_086E700C[];
extern u16 Tsa_086E71BC[];
extern u16 Tsa_086E7380[];
extern u16 Tsa_086E7550[];
extern u16 Tsa_086E7730[];
extern u16 Tsa_086E7914[];
extern u16 Tsa_086E7AFC[];
extern u16 Tsa_086E7CD8[];
extern u16 Img_086E7EB0[];
extern u16 Pal_086E91B8[];
extern u16 Tsa_086E91D8[];
extern u16 Tsa_086E927C[];
extern u16 Tsa_086E9358[];
extern u16 Tsa_086E9474[];
extern u16 Tsa_086E95D4[];
extern u16 Tsa_086E9758[];
extern u16 Tsa_086E98E4[];
extern u16 Tsa_086E9A64[];
extern u16 Tsa_086E9BD4[];
extern u16 Img_086E9D40[];
extern u16 Pal_086EA3EC[];
extern u32 AnimScr_086EAE14[];
extern u32 AnimScr_086EAE24[];
extern u32 AnimScr_086EB868[]; // unused
extern u32 AnimScr_086EB878[]; // unused
extern u16 Img_086EB8B4[];
extern u16 Img_086EBD44[];
extern u16 Img_086EC264[];
extern u16 Img_086EC7D4[];
extern u16 Img_086ECDD8[];
extern u16 Img_086ED424[];
extern u16 Img_086EDAF8[];
extern u16 Img_086EE25C[];
extern u16 Img_086EE9F8[];
extern u16 Img_086EF1DC[];
extern u16 Img_086EF9C8[];
extern u16 Pal_086F01E4[];
extern u16 Pal_086F0204[];
extern u16 Pal_086F0224[];
extern u16 Pal_086F0244[];
extern u16 Pal_086F0264[];
extern u16 Pal_086F0284[];
extern u16 Pal_086F02A4[];
extern u16 Pal_086F02C4[];
extern u16 Pal_086F02E4[];
extern u16 Pal_086F0304[];
extern u16 Pal_086F0324[];
extern u16 Tsa_086F0344[];
extern u16 Tsa_086F03EC[];
extern u16 Tsa_086F04B8[];
extern u16 Tsa_086F05A0[];
extern u16 Tsa_086F069C[];
extern u16 Tsa_086F079C[];
extern u16 Tsa_086F08B8[];
extern u16 Tsa_086F09E0[];
extern u16 Tsa_086F0B2C[];
extern u16 Tsa_086F0C88[];
extern u16 Tsa_086F0DF8[];
extern u16 Img_086F0F6C[];
extern u16 Img_086F24C8[];
extern u16 Img_086F3830[];
extern u16 Pal_086F4A38[];
extern u16 Pal_086F4A58[];
extern u16 Pal_086F4A78[];
extern u16 Tsa_086F4A98[];
extern u16 Tsa_086F4CCC[];
extern u16 Tsa_086F4ED8[];
extern u16 Img_086F50D4[];
extern u16 Img_086F6264[];
extern u16 Img_086F7150[];
extern u16 Img_086F80B8[];
extern u16 Img_086F915C[];
extern u16 Img_086FA350[];
extern u16 Img_086FB07C[];
extern u16 Img_086FBCE8[];
extern u16 Img_086FCD58[];
extern u16 Pal_086FDA44[];
extern u16 Tsa_086FDA64[];
extern u16 Tsa_086FDB08[];
extern u16 Tsa_086FDCE0[];
extern u16 Tsa_086FDEC4[];
extern u16 Tsa_086FE0D4[];
extern u16 Tsa_086FE320[];
extern u16 Tsa_086FE4E0[];
extern u16 Tsa_086FE680[];
extern u16 Tsa_086FE81C[];
extern u16 Img_NaglfarSprites_A[];
extern u16 Pal_NaglfarSprites_A[];
extern u32 AnimScr_086FF4A8[];
extern u32 AnimScr_086FF4B0[];
extern u32 AnimScr_086FF4B8[];
extern u32 AnimScr_086FF4C0[];
extern u32 AnimScr_086FF4C8[];
extern u32 AnimScr_086FF4D0[];
extern u32 AnimScr_086FF5BC[];
extern u32 AnimScr_086FF5C4[];
extern u32 AnimScr_086FF5CC[];
extern u32 AnimScr_086FF5D4[];
extern u32 AnimScr_086FF5DC[];
extern u32 AnimScr_086FF5E4[];
extern u16 Img_NaglfarSprites_B[];
extern u16 Pal_NaglfarSprites_B[];
extern u32 AnimScr_08700098[];
extern u32 AnimScr_087000A4[];
extern u32 AnimScr_087003EC[];
extern u32 AnimScr_087003F8[];
extern u16 Img_NaglfarBg1_A[];
extern u16 Pal_NaglfarBg1_A[];
extern u16 Tsa_NaglfarBg1_A[];
extern u16 Img_08701660[];
extern u16 Img_087020CC[];
extern u16 Img_08702D98[];
extern u16 Img_08703BCC[];
extern u16 Img_08704E90[];
extern u16 Img_08706388[];
extern u16 Img_087079EC[];
extern u16 Img_08708DA0[];
extern u16 Img_08709FA8[];
extern u16 Img_0870B060[];
extern u16 Img_0870C014[];
extern u16 Img_0870CDF0[];
extern u16 Img_0870DBCC[];
extern u16 Img_0870E894[];
extern u16 Img_0870F524[];
extern u16 Img_08710218[];
extern u16 Pal_08710DB8[];
extern u16 Pal_08710DD8[];
extern u16 Pal_08710DF8[];
extern u16 Pal_08710E18[];
extern u16 Pal_08710E38[];
extern u16 Pal_08710E58[];
extern u16 Pal_08710E78[];
extern u16 Pal_08710E98[];
extern u16 Pal_08710EB8[];
extern u16 Pal_08710ED8[];
extern u16 Pal_08710EF8[];
extern u16 Pal_08710F18[];
extern u16 Pal_08710F38[];
extern u16 Pal_08710F58[];
extern u16 Pal_08710F78[];
extern u16 Pal_08710F98[];
extern u16 Tsa_08710FB8[];
extern u16 Tsa_087111E0[];
extern u16 Tsa_08711438[];
extern u16 Tsa_087116A4[];
extern u16 Tsa_087118FC[];
extern u16 Tsa_08711B6C[];
extern u16 Tsa_08711DD8[];
extern u16 Tsa_0871203C[];
extern u16 Tsa_087122A4[];
extern u16 Tsa_0871250C[];
extern u16 Tsa_0871276C[];
extern u16 Tsa_087129C0[];
extern u16 Tsa_08712C14[];
extern u16 Tsa_08712E6C[];
extern u16 Tsa_087130B4[];
extern u16 Tsa_08713310[];
extern u16 Img_08713558[];
extern u16 Img_08714E64[];
extern u16 Img_08716710[];
extern u16 Img_08717E78[];
extern u16 Pal_NaglfarBg3[];
extern u16 Tsa_08719804[];
extern u16 Tsa_08719CA4[];
extern u16 Tsa_0871A134[];
extern u16 Tsa_0871A5D0[];
extern u16 Img_0871AA78[];
extern u16 Img_0871BF64[];
extern u16 Img_0871D310[];
extern u16 Img_0871E6C0[];
extern u16 Img_0871F9DC[];
extern u16 Pal_NaglfarBg4[];
extern u16 Tsa_08720DA4[];
extern u16 Tsa_0872101C[];
extern u16 Tsa_08721294[];
extern u16 Tsa_0872150C[];
extern u16 Tsa_08721784[];
extern u32 AnimScr_DarkBreath_Far[];
extern u16 Img_08723274[];
extern u16 Pal_efxExcaliburBG0[];
extern u16 Tsa_08724444[];
extern u16 Img_FireBreathBg[];
extern u16 Pal_FireBreathBg[];
extern u16 Tsa_FireBreathBg[];
extern u16 Pal_08725DAC[];
extern u16 Img_ShineBg1[];
extern u16 Pal_ShineBg_08726FF4[];
extern u16 Tsa_ShineBg1_Left[];
extern u16 Tsa_ShineBg1_Right[];
extern u16 Img_ShineBg2[];
extern u16 Pal_ShineBg2[];
extern u16 Tsa_ShineBg2_A[];
extern u16 Tsa_ShineBg2_B[];
extern u16 Tsa_ShineBg2_C[];
extern u16 Tsa_ShineBg2_D[];
extern u16 Tsa_ShineBg2_E[];
extern u16 Tsa_ShineBg2_F[];
extern u16 Tsa_ShineBg2_G[];
extern u16 Tsa_ShineBg2_H[];
extern u16 Tsa_ShineBg2_I[];
extern u16 Img_ShineSprites[];
extern u16 Pal_ShineSprites[];
extern u32 AnimScr_EfxShine[];
extern u16 Img_LunaBg1[];
extern u16 Pal_LunaBg1[];
extern u16 Tsa_LunaBg1_A[];
extern u16 Img_LunaBg2[];
extern u16 Pal_LunaBg2[];
extern u16 Tsa_LunaBg2[];
extern u16 Img_LunaBg3_A[];
extern u16 Img_LunaBg3_B[];
extern u16 Img_LunaBg3_C[];
extern u16 Pal_LunaBg3[];
extern u16 Tsa_LunaBg3_A[];
extern u16 Tsa_LunaBg3_B[];
extern u16 Tsa_LunaBg3_C[];
extern u16 Tsa_LunaBg3_D[];
extern u16 Tsa_LunaBg3_E[];
extern u16 Tsa_LunaBg3_F[];
extern u16 Tsa_LunaBg3_G[];
extern u16 Tsa_LunaBg3_H[];
extern u16 Tsa_LunaBg3_I[];
extern u16 Tsa_LunaBg3_J[];
extern u16 Tsa_LunaBg3_K[];
extern u16 Tsa_LunaBg3_L[];
extern u16 Img_LunaSprites[];
extern u16 Pal_LunaSprites[];
extern u32 AnimScr_EfxLuna1[];
extern u32 AnimScr_EfxLuna2[];
extern u32 AnimScr_EfxLuna4[];
extern u16 Img_ExcaliburBg1[];
extern u16 Pal_ExcaliburBg1[];
extern u16 Tsa_ExcaliburBg1[];
extern u16 Img_ExcaliburBg2[];
extern u16 Pal_ExcaliburBg2[];
extern u16 Tsa_ExcaliburBg2_Left[];
extern u16 Tsa_ExcaliburBg2_Right[];
extern u16 Pal_ExcaliburBg3[];
extern u16 Img_ExcaliburSprites[];
extern u16 Pal_ExcaliburSprites[];
extern u32 AnimScr_EfxExcalibur[];
extern u16 Pal_08731348[];
extern u16 Img_GespenstBg4[];
extern u16 Pal_GespenstBg4[];
extern u16 Tsa_GespenstBg4[];
extern u16 Img_AuraBg1[];
extern u16 Pal_AuraBg1[];
extern u16 Tsa_0873315C[];
extern u16 Tsa_087331FC[];
extern u16 Tsa_087332A4[];
extern u16 Tsa_0873334C[];
extern u16 Tsa_087333F8[];
extern u16 Tsa_087334B0[];
extern u16 Tsa_08733568[];
extern u16 Tsa_08733618[];
extern u16 Tsa_087336C4[];
extern u16 Tsa_0873376C[];
extern u16 Tsa_0873380C[];
extern u16 Tsa_087338A8[];
extern u16 Tsa_08733940[];
extern u16 Tsa_08733A58[];
extern u16 Tsa_08733B94[];
extern u16 Tsa_08733CE4[];
extern u16 Tsa_08733E20[];
extern u16 Tsa_08733F24[];
extern u16 Tsa_08733FC8[];
extern u16 Tsa_08734064[];
extern u16 Tsa_08734100[];
extern u16 Tsa_0873419C[];
extern u16 Tsa_08734238[];
extern u16 Tsa_087342D4[];
extern u16 Tsa_08734390[];
extern u16 Tsa_08734480[];
extern u16 Tsa_08734584[];
extern u16 Tsa_08734688[];
extern u16 Img_0873478C[];
extern u16 Img_08735BA0[];
extern u16 Img_087370CC[];
extern u16 Img_08738648[];
extern u16 Img_08739BD0[];
extern u16 Img_0873AFC0[];
extern u16 Img_0873C2CC[];
extern u16 Img_0873D640[];
extern u16 Img_0873EB2C[];
extern u16 Img_0873FED8[];
extern u16 Img_08741288[];
extern u16 Img_087425A4[];
extern u16 Pal_AuraBg3[];
extern u16 Tsa_0874396C[];
extern u16 Tsa_08743BE4[];
extern u16 Tsa_08743E5C[];
extern u16 Tsa_087440D4[];
extern u16 Tsa_0874434C[];
extern u16 Tsa_087445BC[];
extern u16 Tsa_08744818[];
extern u16 Tsa_08744A90[];
extern u16 Tsa_08744D08[];
extern u16 Tsa_08744F80[];
extern u16 Tsa_087451F8[];
extern u16 Tsa_08745470[];
extern u16 Pal_EfxChillEffectBG[];
extern u16 Tsa1_EfxChillEffectBG[];
extern u16 Tsa2_EfxChillEffectBG[];
extern u16 Tsa3_EfxChillEffectBG[];
extern u32 AnimScr_EfxChill_R[];
extern u32 AnimScr_EfxChill_L[];
extern u16 Img_08746760[];
extern u16 Img_08746F70[];
extern u16 Img_08747C7C[];
extern u16 Img_08748E9C[];
extern u16 Img_08749DA8[];
extern u16 Img_0874AE90[];
extern u16 Img_0874BFA8[];
extern u16 Img_0874CE98[];
extern u16 Img_0874E110[];
extern u16 Img_0874F474[];
extern u16 Pal_EreshkigalBg3[];
extern u16 Tsa_08750288[];
extern u16 Tsa_087503E4[];
extern u16 Tsa_087505C4[];
extern u16 Tsa_08750810[];
extern u16 Tsa_08750A38[];
extern u16 Tsa_08750C88[];
extern u16 Tsa_08750EFC[];
extern u16 Tsa_08751128[];
extern u16 Tsa_0875136C[];
extern u16 Tsa_087515C4[];
extern u16 Img_08751808[];
extern u16 Pal_08751DB4[];
extern u32 AnimScr_08752020[];
extern u16 Img_08752044[];
extern u16 Img_08752C10[];
extern u16 Img_0875384C[];
extern u16 Img_0875431C[];
extern u16 Pal_SongSprites[];
extern u16 Tsa_08754910[];
extern u16 Tsa_087549B8[];
extern u16 Tsa_08754A64[];
extern u16 Tsa_08754B14[];
extern u16 Tsa_08754BD8[];
extern u16 Tsa_08754CA4[];
extern u16 Tsa_08754D7C[];
extern u16 Tsa_08754E5C[];
extern u16 Tsa_08754F3C[];
extern u16 Tsa_08755028[];
extern u16 Tsa_0875511C[];
extern u16 Tsa_08755218[];
extern u16 Tsa_08755310[];
extern u16 Tsa_08755410[];
extern u16 Tsa_08755510[];
extern u16 Tsa_08755610[];
extern u16 Tsa_08755714[];
extern u16 Tsa_08755804[];
extern u16 Tsa_087558EC[];
extern u16 Tsa_087559D0[];
extern u16 Tsa_08755AB8[];
extern u16 Tsa_08755B94[];
extern u16 Tsa_08755C64[];
extern u16 Tsa_08755D20[];
extern u16 Tsa_08755DE0[];
extern u16 Tsa_08755E94[];
extern u16 Tsa_08755F3C[];
extern u16 Img_SongSprites[];
extern u32 AnimScr_EfxSong[];
extern u16 Img_EfxLokmsunaObj[];
extern u32 AnimScr_EfxLokmsunaObjLeft[];
extern u32 AnimScr_EfxLokmsunaObjRight[];
// extern ??? gEkrDracoZombiTsaSetLut
extern struct ProcCmd ProcScr_EkrDracoZombie[];
extern struct ProcCmd ProcScr_ekrDragonQuake[];
extern struct ProcCmd ProcScr_ekrWhiteINOUT[];
extern struct ProcCmd ProcScr_EkrDragon_08758720[];
extern u16 gUnknown_08758740[];
// extern ??? ProcScr_EkrMyrrh
extern struct ProcCmd ProcScr_EkrMyrrh[];
extern s16 gUnknown_0875879C[];
extern u16 gEfxTileRefPals_08758A1C[];
extern struct ProcCmd ProcScr_ekrsubAnimeEmulator[];
extern struct ProcCmd ProcScr_efxSoundSE[];
extern u16 * gBanimSongTable1[];
extern u16 * gBanimSongTable2[];
extern u16 * gBanimSongTable3[];
extern u16 * gBanimSongTable4[];
extern u16 * gBanimSongTable5[];
extern u16 * gBanimSongTable6[];
extern u16 * gBanimSongTable7[];
extern u16 * gBanimSongTable8[];

extern struct FaceVramEntry gUnknown_087592CC[4];
// extern ??? EkrLvupMsgsStr
// extern ??? EkrLvupMsgsMag
extern CONST_DATA struct ProcCmd ProcScr_EkrLevelup[];
extern CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll[];
extern CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll2[];
extern s16 gUnknown_0875941C[];
extern CONST_DATA struct ProcCmd ProcScr_Efxleveluphb[];
extern CONST_DATA struct ProcCmd ProcScr_Efxlvupbg[];
extern u16 * TsaLut_EfxLvupBG[];
extern u16 * ImgLut_EfxLvupBG[];
extern CONST_DATA struct ProcCmd ProcScr_efxLvupBG2[];
extern u16 * TsaLut_EfxLvupBG2[];
extern CONST_DATA struct ProcCmd ProcScr_efxLvupOBJ2[];
extern CONST_DATA struct ProcCmd ProcScr_efxLvupBGCOL[];
extern CONST_DATA struct ProcCmd ProcScr_EkrLvupApfx[];
extern CONST_DATA struct ProcCmd ProcScr_eobjLvup[];

extern u32 AnimScr_TriAtkLeft[];
extern u32 AnimScr_TriAtkRight[];
extern u32 AnimScr_TriKnightOBJ[];
extern u32 AnimScr_TriGenerialLanceOBJ[];
extern u32 AnimScr_TriGenerialAxeOBJ[];
extern u32 AnimScr_TriGenerialHandAxeOBJ[];
extern u32 AnimScr_TriKnightAtkOBJ[];
extern u32 AnimScr_TriGenerialLanceAtkOBJ[];
extern u32 AnimScr_TriGenerialAxeAtkOBJ[];
extern u32 AnimScr_TriGenerialHandAxeAtkOBJ[];
extern u16 *gBattleBGDataTable[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup2[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[];

extern u16 Img_08801C14[];
extern u16 Img_EfxLeftNameBox[];
extern u16 Img_EfxLeftItemBox[];
extern u16 Img_EfxRightNameBox[];
extern u16 Img_EfxRightItemBox[];
extern u8 gUnknown_0880210C[];
extern u8 gUnknown_088021C0[];
extern u8 gUnknown_08802274[];
extern u8 gUnknown_08802348[];
extern u8 gUnknown_08802428[];
extern u8 gUnknown_08802508[];
extern u16 gUnknown_08802558[];
extern u16 Img_EfxSideHitDmgCrit[];
extern u16 Img_EfxWTAArrow1[];
extern u16 Img_EfxWTAArrow2[];
extern u16 gUnknown_088026E4[];
extern u16 gUnknown_08802884[];
extern u16 gUnknown_08802904[];
extern u16 gUnknown_08802B04[];
extern u16 gPalEfxHpBarGreen[];
extern u16 gUnknown_08802BC4[];
extern u16 gPalEfxHpBarPurple[];
extern u16 Pal_BanimUnitFlashing[];

void EkrEfxStatusClear(void);
int CheckEkrHitDone(void);
short CheckEkrHitNow(int pos);
void NewEfxHpBar(struct Anim * anim);
void EfxHpBar_DeclineToDeath(struct ProcEfxHpBar * proc);
void EfxHpBar_MoveCameraOnEnd(struct ProcEfxHpBar * proc);
void EfxHpBar_WaitCameraMove(struct ProcEfxHpBar * proc);
void NewEfxHpBarResire(struct Anim * anim);
void EfxHpBarResire_WaitOnCurrentSide(struct ProcEfxHpBar * proc);
void EfxHpBarResire_SetAnotherSide(struct ProcEfxHpBar * proc);
void EfxHpBarResire_DeclineToDeath(struct ProcEfxHpBar * proc);
void NewEfxAvoid(struct Anim * anim);
void EfxAvoidMain(struct ProcEfxHpBar * proc);
void NewEfxHpBarLive(struct Anim * anim);
void EfxHPBarLiveMain(struct ProcEfxHpBar * proc);
void NewEfxNoDamage(struct Anim * anim1, struct Anim * anim2, int death);
void EfxNoDamageMain(struct ProcEfxHpBar * proc);
void NewEfxNoDamageYure(struct Anim * anim1, struct Anim * anim2);
void EfxNoDamageYureMain(struct ProcEfxHpBar * proc);
void NewEfxStatusCHG(struct Anim * anim);
void EfxStatusCHGMain(struct ProcEfxHpBar * proc);

/* banim-efxfarattack.h */

struct ProcEfxFarAttack
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pos;
    /* 2A */ u16 unk_2a;
    /* 2C */ s16 timer;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 terminator;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
};

void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void sub_80534AC(struct ProcEfxFarAttack * unused, int x);
void sub_80534E4(struct ProcEfxFarAttack * proc);
void sub_8053514(struct ProcEfxFarAttack * proc);
void sub_8053584(struct ProcEfxFarAttack * proc);
void sub_8053618(int);

/* banim-efxquake.h */

struct ProcEfxQuake
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 quake_ui;
    /* 2A */ u8 kind;
    /* 2C */ s16 timer;
    /* 30 */ int unk_30;
    /* 34 */ s16 ix;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 iy;
    /* 3E */ s16 unk_3e;
    /* 40 */ int unk_40;
    /* 44 */ const s16 * vec;
    /* 48 */ int unk_48;
    /* 4C */ STRUCT_PAD(0x4C, 0x5C);
    /* 5C */ struct Anim * anim_l;
    /* 60 */ struct Anim * anim_r;
    /* 64 */ struct Anim * unk_64;
};

ProcPtr NewEfxQuakePure(int, int);
void efxQuakePure_Loop(struct ProcEfxQuake * proc);
ProcPtr NewEfxHitQuakePure(void);
void efxHitQuakePure_Loop_Null(void);
ProcPtr NewEfxQuake(int);
void efxQuake_Loop(struct ProcEfxQuake * proc);
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind);
void efxHitQuake_Loop(struct ProcEfxQuake * proc);

void NewEfxFlashBgWhite(struct Anim * anim, int duartion);
void NewEfxFlashBgRed(struct Anim * anim, int duartion);
void NewEfxFlashBgBlack(struct Anim * anim, int duartion);
void NewEfxFlashBgDirectly(struct Anim * anim, int duartion);
void EfxFlashBgMain(struct ProcEfxFlashing * proc);
void EfxFlashRestorePalSync(struct ProcEfxFlashing * proc);
void NewEfxWhiteOUT(struct Anim * anim, int duartion, int duartion2);
void EfxWhiteOutMain1(struct ProcEfxFlashing * proc);
void EfxWhiteOutMain2(struct ProcEfxFlashing * proc);
void EfxWhiteOutRestorePalSync(struct ProcEfxFlashing * proc);
void NewEfxWhiteIN(struct Anim * anim, int duartion, int duartion2);
void EfxWhiteInMain1(struct ProcEfxFlashing * proc);
void EfxWhiteInMain2(struct ProcEfxFlashing * proc);
void EfxWhiteInRestorePalSync(struct ProcEfxFlashing * proc);
void NewEfxBlackOUT(struct Anim * anim, int duartion, int duartion2);
void EfxBlackOutMain1(struct ProcEfxFlashing * proc);
void EfxBlackOutMain2(struct ProcEfxFlashing * proc);
void EfxBlackOutRestorePalSync(struct ProcEfxFlashing * proc);
void NewEfxBlackIN(struct Anim * anim, int duartion, int duartion2);
void EfxBlackInMain1(struct ProcEfxFlashing * proc);
void EfxBlackInMain2(struct ProcEfxFlashing * proc);
void EfxBlackInRestorePalSync(struct ProcEfxFlashing * proc);
void NewEfxFlashHPBar(struct Anim * anim, int duartion, int duartion2);
void EfxFlashHPBarDelay(struct ProcEfxFlashing * proc);
void EfxFlashHPBarMain1(struct ProcEfxFlashing * proc);
void EfxFlashHPBarRestorePal(struct ProcEfxFlashing * proc);
void NewEfxHpBarColorChange(struct Anim * anim);
void EndEfxHPBarColorChange(void);
void DisableEfxHpBarColorChange(void);
void EnableEfxHpBarColorChange(void);
void EfxHPBarColorChangeMain(struct ProcEfxHpBarColorChange * proc);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
void EfxFlashUnitMain(struct ProcEfxFlashing * proc);
void EfxFlashUnitRestorePal(struct ProcEfxFlashing * proc);
void NewEfxFlashUnitEffectEnd(struct Anim * anim, int dura1, int dura2, int c);
void EfxFlashUnitEffectMain(struct ProcEfxFlashing * proc);
void EfxFlashUnitEffectRestorePal(struct ProcEfxFlashing * proc);

void NewEfxDamageMojiEffect(struct Anim * anim, int hitted);
void efxDamageMojiEffectMain(struct ProcEfx * proc);
void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted);
void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ * proc);
void NewEfxPierceCritical(struct Anim * anim);
void efxCriricalEffectMain(struct ProcEfx * proc);
void NewEfxCriricalEffectBG(struct Anim * anim);
void efxCriricalEffectBGMain(struct ProcEfxBG * proc);
void NewEfxCriricalEffectBGCOL(struct Anim * anim);
void efxCriricalEffectBGCOLMain(struct ProcEfxBGCOL * proc);
void NewEfxNormalEffect(struct Anim * anim);
void efxNormalEffectMain(struct ProcEfx * proc);
void NewEfxNormalEffectBG(struct Anim * anim);
void efxNormalEffectBGMain(struct ProcEfxBG * proc);
void NewEfxPierceCriticalEffect(struct Anim * anim);
void efxPierceCriticalEffectMain(struct ProcEfxBG * proc);
void NewEfxPierceCriticalEffectBG(struct Anim * anim);
void efxPierceCriticalEffectBGMain(struct ProcEfxBG * proc);
void NewEfxPierceCriticalEffectBGCOL(struct Anim * anim);
void efxPierceCriticalEffectBGCOLMain(struct ProcEfxBGCOL * proc);
void NewEfxPierceNormalEffect(struct Anim * anim);
void efxPierceNormalEffectMain(struct ProcEfx * proc);
void NewEfxPierceNormalEffectBG(struct Anim * anim);
void efxPierceNormalEffectBGMain(struct ProcEfxBG * proc);
void NewEfxYushaSpinShield(struct Anim * anim, int r1);
void EfxYushaSpinShieldMain(struct ProcEfx * proc);
void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int r1);
void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff00(struct Anim * anim);
void EfxHurtmutEff00Main(struct ProcEfx * proc);
void NewEfxHurtmutEff00OBJ(struct Anim * anim);
void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff01OBJ(struct Anim * anim);
void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc);
void NewEfxMagfcast(struct Anim * anim, int type);
void EfxMagfcastMain(struct ProcEfx * proc);
void NewEfxMagfcastBG(struct Anim * anim, u32 type);
void EfxMagfcastBGMain(struct ProcEfxBG * proc);
void NewEfxSunakemuri(struct Anim * anim, int type);
void EfxSunakemuriMain(struct ProcEfx * proc);
void NewEfxSunakemuriOBJ(struct Anim * anim, int type);
void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc);
void NewEfxLokmsuna(struct Anim * anim);
void EfxLokmsunaMain(struct ProcEfx * proc);
void NewEfxLokmsunaOBJ(struct Anim * anim);
void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc);
void NewEfxKingPika(struct Anim * anim);
void EfxKingPikaMain(struct ProcEfx * proc);
void NewEfxFlashFX(struct Anim * anim);
void EfxFlashFXMain(struct ProcEfx * proc);
void NewEfxSongOBJ2(struct Anim * anim);
void EfxSongOBJ2Main(struct ProcEfxOBJ * proc);
void NewEfxDanceOBJ(struct Anim * anim);
void EfxDanceOBJMain(struct ProcEfxOBJ * proc);
void NewEfxSpecalEffect(struct Anim * anim);
void EfxSpecalEffectMain(ProcPtr proc);
void NewEfxSRankWeaponEffect(struct Anim * anim);
void EfxSRankWeaponEffectMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectBG(struct Anim * anim);
void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc);
void NewEfxSRankWeaponEffectSCR(void);
 void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectSCR2(struct ProcEfx *seff_scr);
void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc);
void NewEfxMagdhisEffect(struct Anim * anim);
void EfxMagdhisEffectMain(struct ProcEfx * proc);
void NewEfxMagdhisEffectBG(struct Anim * anim, int);
void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc);
void NewEfxMantBatabata(struct Anim * anim);
void EfxMantBatabata_Loop1(struct ProcEfxOBJ * proc);
void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc);
void NewEfxChillEffect(struct Anim * anim);
void EfxChillEffectMain(struct ProcEfx * proc);
void NewEfxChillEffectBG(struct Anim * anim);
void EfxChillEffectBGMain(struct ProcEfxBG * proc);
void NewEfxChillEffectBGCOL(struct Anim * anim);
void EfxChillEffectBGCOL_Loop(struct ProcEfxBGCOL * proc);
void NewEfxChillAnime(struct Anim * anim, int arg1);
void EfxChillAnime_Loop(struct ProcEfxOBJ * proc);
void nullsub_17(struct Anim * anim);

struct AnimMagicFxBuffer
{
    /* 00 */ u16 magicFuncIdx;
    /* 02 */ s16 xOffsetBg;
    /* 04 */ s16 yOffsetBg;
    /* 06 */ u16 xOffsetObj;
    /* 08 */ u16 yOffsetObj;
    /* 0A */ u16 bgChr;
    /* 0C */ u16 bgPalId;
    /* 0E */ u16 objChr;
    /* 10 */ u16 objPalId;
    /* 12 */ u16 bg;
    /* 14 */ u16 * bgTmBuf;
    /* 18 */ void * bgImgBuf; // Used for decompression
    /* 1C */ void * bgTsaBuf; // Used for decompression
    /* 20 */ void * objImgBuf; // Used for decompression
    /* 24 */ void (*resetCallback)(void);
};

void ResetClassReelSpell(void);
void EndActiveClassReelSpell(void);
void EndActiveClassReelBgColorProc(void);
void SetActiveClassReelSpell(ProcPtr proc);
void SetActiveCRSpellBgColorProc(ProcPtr proc);
struct AnimMagicFxBuffer * GetMagicEffectBufferFor(struct Anim * anim);
void SetCRSpellBgPosition(struct Anim * anim, struct AnimMagicFxBuffer * magicFx);
void ClearCRSpellBgTmBuf(struct Anim * anim);
struct Anim * CRSpellCreateFrontAnim(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB);
void CRSpell_WriteBgMap(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed);
void CRSpell_RegisterBgGfx(struct Anim * anim, void * src);
void CRSpell_RegisterBgPal(struct Anim * anim, u16 * src);
void CRSpell_RegisterObjGfx(struct Anim * anim, void * src);
void CRSpell_RegisterObjPal(struct Anim * anim, u16 * src);

void StartClassReelSpellAnim(struct Anim * anim);
void StartClassReelSpellAnimDummy(struct Anim * anim);
void StartClassReelSpellAnimFire(struct Anim * anim);
void efxopFire_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent);
void efxopFireBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent);
void efxopFireOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimThunder(struct Anim * anim);
void efxopThunder_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimHeal(struct Anim * anim);
void efxopLive_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused);
void efxopLiveALPHA_Loop_A(struct ProcEfxALPHA * proc);
void efxopLiveALPHA_Loop_B(struct ProcEfxALPHA * proc);
void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimLight(struct Anim * anim);
void efxopLightning_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopLightningBG(struct Anim * anim, struct ProcEfx * parent);
void efxopLightningBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopMistyrainBG(struct Anim * anim, struct ProcEfx * parent);
void StartCRSubSpell_efxopMistyrainBG_2(struct Anim * anim, struct ProcEfx * parent);
void efxopMistyrainBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopMistyrainOBJ(struct Anim * anim, struct ProcEfx * parent);
struct ProcEfxOBJ * StartCRSubSpell_efxopMistyrainOBJ2(struct Anim * anim, struct ProcEfx * parent);
void efxopMistyrainOBJ_OnEnd(struct ProcEfxOBJ * proc);
void efxopMistyrainOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxopMistyrainOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxopMistyrainOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxopMistyrainOBJ2_Loop_A(struct ProcEfxOBJ * proc);
void efxopMistyrainOBJ2_Loop_B(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimFlux(struct Anim * anim);
void efxopMistyrain_Loop_Main(struct ProcEfx * proc);
void StartClassReelSpellAnimMyrrh(struct Anim * anim);
void efxopMyrrh_Loop_Main(ProcPtr proc);
void StartClassReelSpellAnimEvilEye(struct Anim * anim);
void efxopEvilEye_Loop_A(struct ProcEfx * proc);
void efxopEvilEye_Loop_B(struct ProcEfx * proc);
void StartCRSubSpell_efxopEvilEyeBG(struct Anim * anim, struct ProcEfx * parent);
void efxopEvilEyeBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopEvilEyeOBJ(struct Anim * anim, struct ProcEfx * parent);
void efxopEvilEyeOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimStone(struct Anim * anim);
void efxopStone_Loop_A(struct ProcEfx * proc);
void efxopStone_Loop_B(struct ProcEfx * proc);
void StartCRSubSpell_efxopStoneBG(struct Anim * anim, struct ProcEfx * parent);
void efxopStoneBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopStoneOBJ(struct Anim * anim, struct ProcEfx * parent);
void efxopStoneOBJ_Loop(struct ProcEfxOBJ * proc);
