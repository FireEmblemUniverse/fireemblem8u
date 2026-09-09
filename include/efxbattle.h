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

struct EfxopMagicDesc {
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
extern struct EfxopMagicDesc gUnk_82;

extern struct AnimBuffer gUnk_81;

extern struct BanimUnkStructComm gEkrbattle_9;

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
void efxDeadEvent_Loop_A(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_B(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_C(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_D(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_E(struct ProcEfxDead * proc);
void NewEfxDead(struct Anim * anim1, struct Anim * anim2);
void efxDead_Loop_A(struct ProcEfxDead * proc);
void efxDead_Loop_B(struct ProcEfxDead * proc);
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
void efxWeaponIcon_Loop(struct ProcEfxWeaponIcon * proc);
void efxWeaponIcon_OnEnd(struct ProcEfxWeaponIcon * proc);

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
void efxSpellCast_Loop_A(struct ProcEfxSpellCast * proc);
void efxSpellCast_Loop_B(struct ProcEfxSpellCast * proc);
void efxSpellCast_Loop_C(struct ProcEfxSpellCast * proc);

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
void EfxSkillCommonBG_PlaySfx(struct ProcEfxSkill * proc);
void EfxSkillCommonBGMain(struct ProcEfxSkill * proc);
void EfxSkillCommonBG_FreezeAnims(struct ProcEfxSkill * proc);
void EfxSkillCommonBG_UnfreezeAnims(struct ProcEfxSkill * proc);
void EfxSkillCommonBG_MoveCamToSelf(struct ProcEfxSkill * proc);
void EfxSkillCommonBG_MoveCamToOther(struct ProcEfxSkill * proc);

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
extern u32 gEkrbattle_3;
extern u32 gEkrDeadExist;
extern u32 gEkrDeadEventExist;
extern u32 gEfxQuakeExist;
extern u32 gEfxHitQuakeExist;
extern u32 gEkrInitPosReal;
extern u32 gEfxFarAttackExist;
extern u32 gEfxBgSemaphore;
extern u32 gEfxHpBarResireFlag;
extern u32 gEkrbattle_4;
extern u32 gEfxTeonoState;
extern u32 gEkrbattle_5;
extern struct Vec2 gEkrBg2QuakeVec;
extern s16 gEkrbattle_6[2];
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
extern int gEkrbattle_7;

extern u32 gEkrbattle_8;

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
// extern ??? ProcScr_EfxmagicGleipnir_0
// extern ??? gEfxmagicGleipnir_0
// extern ??? gEfxmagicGleipnir_1
// extern ??? gEfxmagicGleipnir_2
// extern ??? gEfxmagicGleipnir_3
// extern ??? gEfxmagicGleipnir_4
// extern ??? gEfxmagicGleipnir_5
// extern ??? gEfxmagicGleipnir_6
// extern ??? ProcScr_efxDarkGradoOBJ01piece
// extern ??? ProcScr_efxDarkGradoOBJ01
// extern ??? ProcScr_efxDarkGradoOBJ02piece
// extern ??? ProcScr_efxDarkGradoOBJ02
// extern ??? ProcScr_efxCrimsonEye
// extern ??? TsaArray_efxCrimsonEyeBGFinish1
// extern ??? ImgArray_efxCrimsonEyeBGFinish1
// extern ??? ProcScr_efxCrimsonEyeBGFinish1
// extern ??? ProcScr_efxCrimsonEyeOBJFinishPiece
// extern ??? gEfxmagicCrimsoneye_0
// extern ??? ProcScr_efxCrimsonEyeOBJFinish
// extern ??? TsaArray_efxCrimsonEyeBG
// extern ??? ProcScr_efxCrimsonEyeBG
// extern ??? gEfxmagicCrimsoneye_1
// extern ??? ProcScr_efxCrimsonEyeOBJ
// extern ??? ProcScr_efxDarkLongMons
// extern ??? TsaArray_efxDarkLongMonsBG01
// extern ??? ImgArray_efxDarkLongMonsBG01
// extern ??? PalArray_efxDarkLongMonsBG01
// extern ??? ProcScr_efxDarkLongMonsBG01
// extern ??? TsaArray_efxDarkLongMonsBG02
// extern ??? ProcScr_efxDarkLongMonsBG02
// extern ??? ProcScr_efxDarkLongMonsOBJ
// extern ??? ProcScr_EfxmagicShadowshot_0
// extern ??? ProcScr_efxGorgon
// extern ??? ProcScr_EfxmagicDemonsurge_0
// extern ??? TsaArray_efxGorgonBGDirt
// extern ??? ImgArray_efxGorgonBGDirt
// extern ??? PalArray_efxGorgonBGDirt
// extern ??? ProcScr_efxGorgonBGDirt
// extern ??? TsaArray_efxGorgonBGTwister
// extern ??? ImgArray_efxGorgonBGTwister
// extern ??? PalArray_efxGorgonBGTwister
// extern ??? ProcScr_efxGorgonBGTwister
// extern ??? ProcScr_EfxmagicDemonsurge_1
// extern ??? ProcScr_efxGorgonOBJTwisterPiece
// extern ??? ProcScr_efxGorgonOBJTwister
extern u16 * TsaArray_efxGorgonBGFinish[];
extern u16 * ImgArray_efxGorgonBGFinish[];
extern struct ProcCmd ProcScr_efxGorgonBGFinish[];
// extern ??? ProcScr_EfxmagicDemonsurge_2
// extern ??? ProcScr_EfxmagicDemonsurge_3
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
extern s16 gEfxmisc_0[];
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
// extern ??? gEfxop_0
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

extern u16 Pal_ConstDataBanimekrdk_0[];
extern const u16 gBarfxTileConf1[];
extern const u16 gBarfxTileConf2[];
extern const u16 gBarfxTileConf3[];
extern const s16 gAnimSpriteRotScalePosX[];
extern const s16 gAnimSpriteRotScalePosY[];
extern const u16 FrameLut_Ekrclasschg_0[];
extern const u16 FrameLut_Ekrclasschg_1[];
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
extern u16 Pal_Efxbattle_0[];
extern u16 Pal_Efxbattle_1[];
extern u16 Pal_Efxbattle_2[];
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
extern u32 AnimScr_efxShooterOBJ_0[];
extern u32 AnimScr_efxShooterOBJ_1[];
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
extern u16 Tsa_DarkBreathBg_0[];
extern u16 Tsa_DarkBreathBg_1[];
extern u16 Tsa_DarkBreathBg_2[];
extern u16 Tsa_DarkBreathBg_3[];
extern u16 Tsa_DarkBreathBg_4[];
extern u16 Tsa_DarkBreathBg_5[];
extern u16 Tsa_DarkBreathBg_6[];
extern u16 Tsa_DarkBreathBg_7[];
extern u16 Tsa_DarkBreathBg_8[];
extern u16 Tsa_DarkBreathBg_9[];
extern u16 Tsa_DarkBreathBg_10[];
extern u16 Tsa_DarkBreathBg_11[];
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
extern u16 Tsa_Banim_0[];
extern u16 Tsa_Banim_1[];
extern u16 Tsa_Banim_2[];
extern u16 Tsa_Banim_3[];
extern u16 Tsa_Banim_4[];
extern u16 Tsa_Banim_5[];
extern u16 Tsa_Banim_6[];
extern u16 Tsa_Banim_7[];
extern u16 Tsa_Banim_8[];
extern u16 Tsa_Banim_9[];
extern u16 Tsa_Banim_10[];
extern u16 Tsa_Banim_11[];
extern u16 Tsa_efxFireBG_0[];
extern u16 Tsa_efxFireBG_1[];
extern u16 Tsa_efxFireBG_2[];
extern u16 Tsa_efxFireBG_3[];
extern u16 Tsa_efxFireBG_4[];
extern u16 Tsa_efxFireBG_5[];
extern u16 Tsa_efxFireBG_6[];
extern u16 Tsa_efxFireBG_7[];
extern u16 Tsa_efxFireBG_8[];
extern u16 Tsa_efxFireBG_9[];
extern u16 Tsa_efxFireBG_10[];
extern u16 Tsa_efxFireBG_11[];
extern u16 Img_FireSpellSprites[];
extern u16 Pal_FireSpellSprites[];
extern u32 AnimScr_EfxFireOBJ_L_Front[];
extern u32 AnimScr_EfxFireOBJ_L_Back[];
extern u32 AnimScr_EfxFireOBJ_R_Front[];
extern u32 AnimScr_EfxFireOBJ_R_Back[];
extern u16 Img_Banim_0[];
extern u16 Img_AnimaHitBG_0[];
extern u16 Img_AnimaHitBG_1[];
extern u16 Img_AnimaHitBG_2[];
extern u16 Img_AnimaHitBG_3[];
extern u16 Img_AnimaHitBG_4[];
extern u16 Img_AnimaHitBG_5[];
extern u16 Img_AnimaHitBG_6[];
extern u16 Img_AnimaHitBG_7[];
extern u16 Img_AnimaHitBG_8[];
extern u16 Img_AnimaHitBG_9[];
extern u16 Pal_EfxFireHitBG[];
extern u16 Tsa_Banim_12[];
extern u16 Tsa_AnimaHitBG_0[];
extern u16 Tsa_AnimaHitBG_1[];
extern u16 Tsa_AnimaHitBG_2[];
extern u16 Tsa_AnimaHitBG_3[];
extern u16 Tsa_AnimaHitBG_4[];
extern u16 Tsa_AnimaHitBG_5[];
extern u16 Tsa_AnimaHitBG_6[];
extern u16 Tsa_AnimaHitBG_7[];
extern u16 Tsa_AnimaHitBG_8[];
extern u16 Tsa_AnimaHitBG_9[];
extern u16 Tsa_AnimaHitBG_10[];
extern u16 Tsa_AnimaHitBG_11[];
extern u16 Tsa_AnimaHitBG_12[];
extern u16 Tsa_AnimaHitBG_13[];
extern u16 Tsa_AnimaHitBG_14[];
extern u16 Tsa_AnimaHitBG_15[];
extern u16 Tsa_AnimaHitBG_16[];
extern u16 Tsa_AnimaHitBG_17[];
extern u16 Tsa_AnimaHitBG_18[];
extern u16 Tsa_AnimaHitBG_19[];
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
extern u16 Img_Banim_1[];
extern u16 Img_Banim_2[];
extern u16 Img_Banim_3[];
extern u16 Img_Banim_4[];
extern u16 Img_Banim_5[];
extern u16 Img_Light_0[];
extern u16 Img_Light_1[];
extern u16 Img_Light_2[];
extern u16 Pal_Banim_0[];
extern u16 Pal_Light[];
extern u16 Tsa_Light_0[];
extern u16 Tsa_Light_1[];
extern u16 Tsa_Light_2[];
extern u16 Tsa_Light_3[];
extern u16 Tsa_Light_4[];
extern u16 Tsa_Light_5[];
extern u16 Tsa_Light_6[];
extern u16 Tsa_Light_7[];
extern u16 Tsa_Light_8[];
extern u16 Tsa_Light_9[];
extern u16 Tsa_Light_10[];
extern u16 Tsa_Light_11[];
extern u16 Tsa_Light_12[];
extern u16 Tsa_Light_13[];
extern u16 Tsa_Light_14[];
extern u16 Tsa_Light_15[];
extern u16 Tsa_Light_16[];
extern u16 Tsa_Light_17[];
extern u16 Tsa_Light_18[];
extern u16 Tsa_Light_19[];
extern u16 Tsa_Light_20[];
extern u16 Tsa_Light_21[];
extern u16 Tsa_Light_22[];
extern u16 Tsa_Light_23[];
extern u16 Tsa_Light_24[];
extern u16 Tsa_Light_25[];
extern u16 Tsa_Light_26[];
extern u16 Tsa_Light_27[];
extern u16 Tsa_Light_28[];
extern u16 Tsa_Light_29[];
extern u16 Tsa_Light_30[];
extern u16 Tsa_Light_31[];
extern u16 Tsa_Light_32[];
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
extern u16 Img_Banim_6[];
extern u16 Img_Flux_ClassReel_0[];
extern u16 Img_Flux_ClassReel_1[];
extern u16 Img_Flux_ClassReel_2[];
extern u16 Img_Flux_ClassReel_3[];
extern u16 Img_Flux_ClassReel_4[];
extern u16 Pal_Banim_1[];
extern u16 Pal_Banim_2[];
extern u16 Tsa_Flux_ClassReel_0[];
extern u16 Tsa_Flux_ClassReel_1[];
extern u16 Tsa_Flux_ClassReel_2[];
extern u16 Tsa_Flux_ClassReel_3[];
extern u16 Tsa_Flux_ClassReel_4[];
extern u16 Tsa_Flux_ClassReel_5[];
extern u16 Tsa_Flux_ClassReel_6[];
extern u16 Tsa_Flux_ClassReel_7[];
extern u16 Tsa_Flux_ClassReel_8[];
extern u16 Tsa_Flux_ClassReel_9[];
extern u16 Tsa_Flux_ClassReel_10[];
extern u16 Tsa_Flux_ClassReel_11[];
extern u16 Tsa_Flux_ClassReel_12[];
extern u16 Tsa_Flux_ClassReel_13[];
extern u16 Tsa_Flux_ClassReel_14[];
extern u16 Tsa_Flux_ClassReel_15[];
extern u16 Tsa_Flux_ClassReel_16[];
extern u16 Tsa_Flux_ClassReel_17[];
extern u16 Tsa_Flux_ClassReel_18[];
extern u16 Tsa_Flux_ClassReel_19[];
extern u16 Tsa_Flux_ClassReel_20[];
extern u16 Tsa_Flux_ClassReel_21[];
extern u16 Tsa_Flux_ClassReel_22[];
extern u16 Tsa_Flux_ClassReel_23[];
extern u16 Tsa_Flux_ClassReel_24[];
extern u16 Tsa_Flux_ClassReel_25[];
extern u16 Tsa_Flux_ClassReel_26[];
extern u16 Tsa_Flux_ClassReel_27[];
extern u16 Tsa_Flux_ClassReel_28[];
extern u16 Tsa_Flux_ClassReel_29[];
extern u16 Tsa_Flux_ClassReel_30[];
extern u16 Tsa_Flux_ClassReel_31[];
extern u16 Tsa_Flux_ClassReel_32[];
extern u16 Tsa_Flux_ClassReel_33[];
extern u16 Tsa_Flux_ClassReel_34[];
extern u16 Tsa_Flux_ClassReel_35[];
extern u16 Tsa_Flux_ClassReel_36[];
extern u16 Tsa_Flux_ClassReel_37[];
extern u16 Tsa_Flux_ClassReel_38[];
extern u16 Tsa_Flux_ClassReel_39[];
extern u16 Tsa_Flux_ClassReel_40[];
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
extern u16 Tsa_NosferatuBg_0[];
extern u16 Tsa_NosferatuBg_1[];
extern u16 Tsa_NosferatuBg_2[];
extern u16 Tsa_NosferatuBg_3[];
extern u16 Tsa_NosferatuBg_4[];
extern u16 Tsa_NosferatuBg_5[];
extern u16 Tsa_NosferatuBg_6[];
extern u16 Tsa_NosferatuBg_7[];
extern u16 Tsa_NosferatuBg_8[];
extern u16 Tsa_NosferatuBg_9[];
extern u16 Tsa_NosferatuBg_10[];
extern u16 Tsa_NosferatuBg_11[];
extern u16 Tsa_NosferatuBg_12[];
extern u16 Tsa_NosferatuBg_13[];
extern u16 Tsa_NosferatuBg_14[];
extern u16 Tsa_NosferatuBg_15[];
extern u16 Tsa_NosferatuBg_16[];
extern u16 Tsa_NosferatuBg_17[];
extern u16 Tsa_NosferatuBg_18[];
extern u16 Tsa_NosferatuBg_19[];
extern u16 Tsa_NosferatuBg_20[];
extern u16 Tsa_NosferatuBg_21[];
extern u16 Tsa_NosferatuBg_22[];
extern u16 Tsa_NosferatuBg_23[];
extern u16 Tsa_NosferatuBg_24[];
extern u16 Tsa_NosferatuBg_25[];
extern u16 Tsa_NosferatuBg_26[];
extern u16 Tsa_NosferatuBg_27[];
extern u16 Tsa_NosferatuBg_28[];
extern u16 Tsa_NosferatuBg_29[];
extern u16 Tsa_NosferatuBg_30[];
extern u16 Tsa_NosferatuBg_31[];
extern u16 Tsa_NosferatuBg_32[];
extern u16 Tsa_NosferatuBg_33[];
extern u16 Tsa_NosferatuBg_34[];
extern u16 Tsa_NosferatuBg_35[];
extern u16 Tsa_NosferatuBg_36[];
extern u16 Tsa_NosferatuBg_37[];
extern u16 Tsa_NosferatuBg_38[];
extern u16 Tsa_NosferatuBg_39[];
extern u16 Tsa_NosferatuBg_40[];
extern u16 Tsa_NosferatuBg_41[];
extern u16 Tsa_NosferatuBg_42[];
extern u16 Tsa_NosferatuBg_43[];
extern u16 Tsa_NosferatuBg_44[];
extern u16 Tsa_NosferatuBg_45[];
extern u16 Tsa_NosferatuBg_46[];
extern u16 Tsa_NosferatuBg_47[];
extern u16 Tsa_NosferatuBg_48[];
extern u16 Tsa_NosferatuBg_49[];
extern u16 Tsa_NosferatuBg_50[];
extern u16 Img_DivineBg3_0[];
extern u16 Img_DivineBg3_1[];
extern u16 Img_DivineBg3_2[];
extern u16 Img_DivineBg3_3[];
extern u16 Img_DivineBg3_4[];
extern u16 Img_DivineBg3_5[];
extern u16 Img_DivineBg3_6[];
extern u16 Img_DivineBg3_7[];
extern u16 Img_DivineBg3_8[];
extern u16 Img_DivineBg3_9[];
extern u16 Img_DivineBg3_10[];
extern u16 Img_DivineBg3_11[];
extern u16 Img_DivineBg3_12[];
extern u16 Img_DivineBg3_13[];
extern u16 Img_DivineBg3_14[];
extern u16 Img_DivineBg3_15[];
extern u16 Img_DivineBg3_16[];
extern u16 Img_DivineBg3_17[];
extern u16 Img_DivineBg[];
extern u16 Pal_DivineBg3[];
extern u16 Pal_DivineBg[];
extern u16 Tsa_DivineBg_0[];
extern u16 Tsa_DivineBg3_0[];
extern u16 Tsa_DivineBg3_1[];
extern u16 Tsa_DivineBg3_2[];
extern u16 Tsa_DivineBg3_3[];
extern u16 Tsa_DivineBg3_4[];
extern u16 Tsa_DivineBg3_5[];
extern u16 Tsa_DivineBg3_6[];
extern u16 Tsa_DivineBg3_7[];
extern u16 Tsa_DivineBg3_8[];
extern u16 Tsa_DivineBg3_9[];
extern u16 Tsa_DivineBg3_10[];
extern u16 Tsa_DivineBg3_11[];
extern u16 Tsa_DivineBg3_12[];
extern u16 Tsa_DivineBg3_13[];
extern u16 Tsa_DivineBg3_14[];
extern u16 Tsa_DivineBg3_15[];
extern u16 Tsa_DivineBg3_16[];
extern u16 Tsa_DivineBg3_17[];
extern u16 Tsa_DivineBg3_18[];
extern u16 Tsa_DivineBg3_19[];
extern u16 Tsa_DivineBg_1[];
extern u16 Tsa_DivineBg_2[];
extern u16 Tsa_DivineBg_3[];
extern u16 Tsa_DivineBg_4[];
extern u16 Tsa_DivineBg_5[];
extern u16 Tsa_DivineBg_6[];
extern u16 Tsa_DivineBg_7[];
extern u16 Tsa_DivineBg_8[];
extern u16 Tsa_DivineBg_9[];
extern u16 Tsa_DivineBg_10[];
extern u16 Tsa_DivineBg_11[];
extern u16 Tsa_DivineBg_12[];
extern u16 Tsa_DivineBg_13[];
extern u16 Tsa_DivineBg_14[];
extern u16 Tsa_DivineBg_15[];
extern u16 Tsa_DivineBg_16[];
extern u16 Tsa_DivineBg_17[];
extern u16 Tsa_DivineBg_18[];
extern u16 Tsa_DivineBg_19[];
extern u16 Tsa_DivineBg_20[];
extern u16 Tsa_DivineBg2_0[];
extern u16 Tsa_DivineBg2_1[];
extern u16 Tsa_DivineBg2_2[];
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
extern u16 Img_EclipseSprites_0[];
extern u16 Img_EclipseSprites_efxHazymoonOBJ[];
extern u16 Pal_EclipseSprites[];
extern u32 AnimScr_EfxHazymoonOBJ2_1[];
extern u32 AnimScr_EfxHazymoonOBJ2_2[];
extern u32 AnimScr_EfxHazymoonOBJ2_3[];
extern u16 Img_FenrirBg_Sigils[];
extern u16 Pal_EfxFenrirBGCOL[];
extern u16 Tsa_FenrirBg_Sigils[];
extern u16 Img_FenrirBg_0[];
extern u16 Img_FenrirBg_1[];
extern u16 Img_FenrirBg_2[];
extern u16 Img_FenrirBg_3[];
extern u16 Pal_FenrirBg[];
extern u16 Pal_EfxFenrirBG2_B[];
extern u16 Tsa_Banim_13[];
extern u16 Tsa_FenrirBg_0[];
extern u16 Tsa_FenrirBg_1[];
extern u16 Tsa_FenrirBg_2[];
extern u16 Tsa_FenrirBg_3[];
extern u16 Tsa_FenrirBg_4[];
extern u16 Tsa_FenrirBg_5[];
extern u16 Tsa_FenrirBg_6[];
extern u16 Tsa_FenrirBg_7[];
extern u16 Tsa_FenrirBg_8[];
extern u16 Tsa_FenrirBg_9[];
extern u16 Tsa_FenrirBg_10[];
extern u16 Tsa_FenrirBg_11[];
extern u16 Tsa_FenrirBg_12[];
extern u16 Tsa_FenrirBg_13[];
extern u16 Tsa_FenrirBg_14[];
extern u16 Tsa_FenrirBg_15[];
extern u16 Tsa_FenrirBg_16[];
extern u16 Tsa_FenrirBg_17[];
extern u16 Tsa_FenrirBg_18[];
extern u16 Tsa_FenrirBg_19[];
extern u16 Tsa_FenrirBg_20[];
extern u16 Tsa_FenrirBg_21[];
extern u16 Tsa_FenrirBg_22[];
extern u16 Tsa_FenrirBg_23[];
extern u16 Tsa_FenrirBg_24[];
extern u16 Tsa_FenrirBg_25[];
extern u16 Tsa_FenrirBg_26[];
extern u16 Tsa_FenrirBg_27[];
extern u16 Tsa_FenrirBg_28[];
extern u16 Tsa_FenrirBg_29[];
extern u16 Tsa_FenrirBg_30[];
extern u16 Tsa_FenrirBg_31[];
extern u16 Tsa_FenrirBg_32[];
extern u16 Tsa_FenrirBg_33[];
extern u16 Tsa_FenrirBg_34[];
extern u16 Tsa_FenrirBg_35[];
extern u16 Tsa_FenrirBg_36[];
extern u16 Tsa_FenrirBg_37[];
extern u16 Tsa_FenrirBg_38[];
extern u16 Tsa_FenrirBg_39[];
extern u16 Tsa_FenrirBg_40[];
extern u16 Tsa_FenrirBg_41[];
extern u16 Tsa_FenrirBg_42[];
extern u16 Tsa_FenrirBg_43[];
extern u16 Tsa_FenrirBg_44[];
extern u16 Tsa_FenrirBg_45[];
extern u16 Tsa_FenrirBg_46[];
extern u16 Tsa_FenrirBg_47[];
extern u16 Tsa_FenrirBg_48[];
extern u16 Tsa_FenrirBg_49[];
extern u16 Img_FenrirSprites[];
extern u16 Pal_FenrirSprites_A[];
extern u16 Pal_FenrirSprites_B[];
extern u32 AnimScr_EfxFenrir1[];
extern u32 AnimScr_EfxFenrir2[];
extern u32 AnimScr_EfxFenrir3[];
extern u16 Img_Banim_7[];
extern u16 Img_PurgeBg_0[];
extern u16 Img_PurgeBg_1[];
extern u16 Img_PurgeBg_2[];
extern u16 Img_PurgeBg_3[];
extern u16 Img_PurgeBg_4[];
extern u16 Img_PurgeBg_5[];
extern u16 Img_PurgeBg_6[];
extern u16 Img_PurgeBg_7[];
extern u16 Img_PurgeBg_8[];
extern u16 Img_PurgeBg_9[];
extern u16 Img_PurgeBg_10[];
extern u16 Img_PurgeBg_11[];
extern u16 Img_PurgeBg_12[];
extern u16 Img_PurgeBg_13[];
extern u16 Img_PurgeBg_14[];
extern u16 Img_PurgeBg_15[];
extern u16 Img_PurgeBg_16[];
extern u16 Pal_Banim_3[];
extern u16 Pal_PurgeBg[];
extern u16 Tsa_PurgeBg_0[];
extern u16 Tsa_PurgeBg_1[];
extern u16 Tsa_PurgeBg_2[];
extern u16 Tsa_PurgeBg_3[];
extern u16 Tsa_PurgeBg_4[];
extern u16 Tsa_PurgeBg_5[];
extern u16 Tsa_PurgeBg_6[];
extern u16 Tsa_PurgeBg_7[];
extern u16 Tsa_PurgeBg_8[];
extern u16 Tsa_PurgeBg_9[];
extern u16 Tsa_PurgeBg_10[];
extern u16 Tsa_PurgeBg_11[];
extern u16 Tsa_PurgeBg_12[];
extern u16 Tsa_PurgeBg_13[];
extern u16 Tsa_PurgeBg_14[];
extern u16 Tsa_PurgeBg_15[];
extern u16 Tsa_PurgeBg_16[];
extern u16 Tsa_PurgeBg_17[];
extern u16 Tsa_PurgeBg_18[];
extern u16 Tsa_PurgeBg_19[];
extern u16 Tsa_PurgeBg_20[];
extern u16 Tsa_PurgeBg_21[];
extern u16 Tsa_PurgeBg_22[];
extern u16 Tsa_PurgeBg_23[];
extern u16 Tsa_PurgeBg_24[];
extern u16 Tsa_PurgeBg_25[];
extern u16 Tsa_PurgeBg_26[];
extern u16 Tsa_PurgeBg_27[];
extern u16 Tsa_PurgeBg_28[];
extern u16 Tsa_PurgeBg_29[];
extern u16 Tsa_PurgeBg_30[];
extern u16 Tsa_PurgeBg_31[];
extern u16 Tsa_PurgeBg_32[];
extern u16 Tsa_PurgeBg_33[];
extern u16 Tsa_PurgeBg_34[];
extern u16 Tsa_PurgeBg_35[];
extern u16 Tsa_PurgeBg_36[];
extern u16 Tsa_PurgeBg_37[];
extern u16 Tsa_PurgeBg_38[];
extern u16 Tsa_PurgeBg_39[];
extern u16 Tsa_PurgeBg_40[];
extern u16 Tsa_PurgeBg_41[];
extern u16 Tsa_PurgeBg_42[];
extern u16 Tsa_PurgeBg_43[];
extern u16 Tsa_PurgeBg_44[];
extern u16 Tsa_PurgeBg_45[];
extern u16 Tsa_PurgeBg_46[];
extern u16 Tsa_PurgeBg_47[];
extern u16 Tsa_PurgeBg_48[];
extern u16 Tsa_PurgeBg_49[];
extern u16 Tsa_PurgeBg_50[];
extern u16 Tsa_PurgeBg_51[];
extern u16 Tsa_PurgeBg_52[];
extern u16 Tsa_PurgeBg_53[];
extern u16 Tsa_PurgeBg_54[];
extern u16 Tsa_PurgeBg_55[];
extern u16 Tsa_PurgeBg_56[];
extern u16 Tsa_PurgeBg_57[];
extern u16 Tsa_PurgeBg_58[];
extern u16 Tsa_PurgeBg_59[];
extern u16 Tsa_PurgeBg_60[];
extern u16 Tsa_PurgeBg_61[];
extern u16 Tsa_PurgeBg_62[];
extern u16 Tsa_PurgeBg_63[];
extern u16 Tsa_PurgeBg_64[];
extern u16 Tsa_PurgeBg_65[];
extern u16 Tsa_PurgeBg_66[];
extern u16 Tsa_PurgeBg_67[];
extern u16 Tsa_PurgeBg_68[];
extern u16 Tsa_PurgeBg_69[];
extern u16 Tsa_PurgeBg_70[];
extern u16 Tsa_PurgeBg_71[];
extern u16 Tsa_PurgeBg_72[];
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
extern u16 Pal_Banim_4[];
extern u16 Pal_efxLiveBGCOL[];
extern u32 AnimScr_EfxLiveOBJ1[];
extern u32 AnimScr_EfxLiveOBJ2[];
extern u32 AnimScr_EfxReblowOBJ_Right1[];
extern u32 AnimScr_EfxReblowOBJ_Right2[];
extern u32 AnimScr_EfxReblowOBJ_Left1[];
extern u32 AnimScr_EfxReblowOBJ_Left2[];
extern u16 Tsa_Banim_14[];
extern u16 Tsa_Fortify_0[];
extern u16 Tsa_Fortify_1[];
extern u16 Tsa_Fortify_2[];
extern u16 Tsa_FortifyBg2[];
extern u16 Pal_Banim_5[];
extern u16 Pal_efxReserveBGCOL_0[];
extern u16 Pal_efxReserveBGCOL_1[];
extern u16 Img_Banim_8[];
extern u16 Img_Banim_9[];
extern u16 Img_Banim_10[];
extern u16 Img_Banim_11[];
extern u16 Pal_MapAnimRestore[];
extern u16 Tsa_Banim_15[];
extern u16 Tsa_RestoreBg_0[];
extern u16 Tsa_RestoreBg_1[];
extern u16 Tsa_RestoreBg_2[];
extern u16 Tsa_RestoreBg_3[];
extern u16 Tsa_RestoreBg_4[];
extern u16 Tsa_RestoreBg_5[];
extern u16 Tsa_RestoreBg_6[];
extern u16 Tsa_RestoreBg_7[];
extern u16 Tsa_RestoreBg_8[];
extern u16 Tsa_RestoreBg_9[];
extern u16 Tsa_RestoreBg_10[];
extern u16 Tsa_RestoreBg_11[];
extern u32 AnimScr_EfxRestOBJ[];
extern u16 Img_SilenceBg[];
extern u16 Tsa_SilenceBg_0[];
extern u16 Tsa_SilenceBg_1[];
extern u16 Tsa_SilenceBg_2[];
extern u16 Tsa_SilenceBg_3[];
extern u16 Tsa_SilenceBg_4[];
extern u16 Tsa_SilenceBg_5[];
extern u16 Tsa_SilenceBg_6[];
extern u16 Tsa_SilenceBg_7[];
extern u16 Tsa_SilenceBg_8[];
extern u16 Tsa_SilenceBg_9[];
extern u16 Tsa_SilenceBg_10[];
extern u16 Tsa_SilenceBg_11[];
extern u16 Tsa_SilenceBg_12[];
extern u16 Tsa_SilenceBg_13[];
extern u16 Tsa_SilenceBg_14[];
extern u16 Tsa_SilenceBg_15[];
extern u16 Tsa_SilenceBg_16[];
extern u16 Tsa_SilenceBg_17[];
extern u16 Img_SilenceSprites[];
extern u16 Pal_Silence[];
extern u32 AnimScr_EfxSilenceOBJ[];
extern u16 Pal_HammerneBg[];
extern u16 Tsa_HammerneBg_0[];
extern u16 Tsa_HammerneBg_1[];
extern u16 Tsa_HammerneBg_2[];
extern u16 Tsa_HammerneBg_3[];
extern u16 Tsa_HammerneBg_4[];
extern u16 Tsa_HammerneBg_5[];
extern u16 Tsa_HammerneBg_6[];
extern u16 Tsa_HammerneBg_7[];
extern u16 Tsa_HammerneBg_8[];
extern u16 Tsa_HammerneBg_9[];
extern u16 Tsa_HammerneBg_10[];
extern u16 Tsa_HammerneBg_11[];
extern u16 Tsa_HammerneBg_12[];
extern u32 AnimScr_EfxHammarneOBJ[];
extern u16 Img_Banim_12[];
extern u16 Tsa_Banim_16[];
extern u16 Img_SleepBg[];
extern u16 Pal_SleepBg[];
extern u16 Tsa_SleepBg_0[];
extern u16 Tsa_SleepBg_1[];
extern u16 Tsa_SleepBg_2[];
extern u16 Tsa_SleepBg_3[];
extern u16 Tsa_SleepBg_4[];
extern u16 Tsa_SleepBg_5[];
extern u16 Tsa_SleepBg_6[];
extern u16 Tsa_SleepBg_7[];
extern u16 Tsa_SleepBg_8[];
extern u16 Tsa_SleepBg_9[];
extern u16 Tsa_SleepBg_10[];
extern u16 Tsa_SleepBg_11[];
extern u16 Tsa_SleepBg_12[];
extern u16 Tsa_SleepBg_13[];
extern u16 Tsa_SleepBg_14[];
extern u16 Tsa_SleepBg_15[];
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
extern u16 Tsa_BarrierBg_0[];
extern u16 Tsa_BarrierBg_1[];
extern u16 Tsa_BarrierBg_2[];
extern u16 Tsa_BarrierBg_3[];
extern u16 Tsa_BarrierBg_4[];
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
extern u16 Tsa_IvaldiBg1_0[];
extern u16 Tsa_IvaldiBg1_1[];
extern u16 Tsa_IvaldiBg1_2[];
extern u16 Tsa_IvaldiBg1_3[];
extern u16 Tsa_IvaldiBg1_4[];
extern u16 Tsa_IvaldiBg1_5[];
extern u16 Tsa_IvaldiBg1_6[];
extern u16 Tsa_IvaldiBg1_7[];
extern u16 Tsa_IvaldiBg1_8[];
extern u16 Tsa_IvaldiBg1_9[];
extern u16 Tsa_IvaldiBg1_10[];
extern u16 Tsa_IvaldiBg1_11[];
extern u16 Img_IvaldiBg2[];
extern u16 Pal_IvaldiBg2[];
extern u16 Tsa_IvaldiBg2_0[];
extern u16 Tsa_IvaldiBg2_1[];
extern u16 Tsa_IvaldiBg2_2[];
extern u16 Tsa_IvaldiBg2_3[];
extern u16 Tsa_IvaldiBg2_4[];
extern u16 Img_IvaldiBg3_0[];
extern u16 Img_IvaldiBg3_1[];
extern u16 Img_IvaldiBg3_2[];
extern u16 Img_IvaldiBg3_3[];
extern u16 Img_IvaldiBg3_4[];
extern u16 Img_IvaldiBg3_5[];
extern u16 Img_IvaldiBg3_6[];
extern u16 Img_IvaldiBg3_7[];
extern u16 Img_IvaldiBg3_8[];
extern u16 Img_IvaldiBg3_9[];
extern u16 Img_IvaldiBg3_10[];
extern u16 Pal_IvaldiBg3_0[];
extern u16 Pal_IvaldiBg3_1[];
extern u16 Pal_IvaldiBg3_2[];
extern u16 Pal_IvaldiBg3_3[];
extern u16 Pal_IvaldiBg3_4[];
extern u16 Pal_IvaldiBg3_5[];
extern u16 Pal_IvaldiBg3_6[];
extern u16 Pal_IvaldiBg3_7[];
extern u16 Pal_IvaldiBg3_8[];
extern u16 Pal_IvaldiBg3_9[];
extern u16 Pal_IvaldiBg3_10[];
extern u16 Tsa_IvaldiBg3_0[];
extern u16 Tsa_IvaldiBg3_1[];
extern u16 Tsa_IvaldiBg3_2[];
extern u16 Tsa_IvaldiBg3_3[];
extern u16 Tsa_IvaldiBg3_4[];
extern u16 Tsa_IvaldiBg3_5[];
extern u16 Tsa_IvaldiBg3_6[];
extern u16 Tsa_IvaldiBg3_7[];
extern u16 Tsa_IvaldiBg3_8[];
extern u16 Tsa_IvaldiBg3_9[];
extern u16 Tsa_IvaldiBg3_10[];
extern u16 Img_IvaldiBg4[];
extern u16 Pal_IvaldiBg4[];
extern u16 Tsa_IvaldiBg4[];
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
extern u16 Img_Banim_13[];
extern u16 Img_GleipnirBg_Sigil_0[];
extern u16 Img_GleipnirBg_Sigil_1[];
extern u16 Img_GleipnirBg_Sigil_2[];
extern u16 Img_GleipnirBg_Sigil_3[];
extern u16 Img_GleipnirBg_Sigil_4[];
extern u16 Img_GleipnirBg_Sigil_5[];
extern u16 Img_GleipnirBg_Sigil_6[];
extern u16 Img_GleipnirBg_Sigil_7[];
extern u16 Img_GleipnirBg_Sigil_8[];
extern u16 Img_GleipnirBg_Sigil_9[];
extern u16 Pal_GleipnirBg_Sigil[];
extern u16 Tsa_GleipnirBg_Sigil_0[];
extern u16 Tsa_GleipnirBg_Sigil_1[];
extern u16 Tsa_GleipnirBg_Sigil_2[];
extern u16 Tsa_GleipnirBg_Sigil_3[];
extern u16 Tsa_GleipnirBg_Sigil_4[];
extern u16 Tsa_GleipnirBg_Sigil_5[];
extern u16 Tsa_GleipnirBg_Sigil_6[];
extern u16 Tsa_GleipnirBg_Sigil_7[];
extern u16 Tsa_GleipnirBg_Sigil_8[];
extern u16 Tsa_GleipnirBg_Sigil_9[];
extern u16 Tsa_GleipnirBg_Sigil_10[];
extern u16 Img_GleipnirBg_Nebula_0[];
extern u16 Img_GleipnirBg_Nebula_1[];
extern u16 Img_GleipnirBg_Nebula_2[];
extern u16 Img_GleipnirBg_Nebula_3[];
extern u16 Img_GleipnirBg_Nebula_4[];
extern u16 Img_GleipnirBg_Nebula_5[];
extern u16 Img_GleipnirBg_Nebula_6[];
extern u16 Img_GleipnirBg_Nebula_7[];
extern u16 Img_GleipnirBg_Nebula_8[];
extern u16 Img_GleipnirBg_Nebula_9[];
extern u16 Img_GleipnirBg_Nebula_10[];
extern u16 Img_GleipnirBg_Nebula_11[];
extern u16 Img_GleipnirBg_Nebula_12[];
extern u16 Img_GleipnirBg_Nebula_13[];
extern u16 Img_GleipnirBg_Nebula_14[];
extern u16 Img_GleipnirBg_Nebula_15[];
extern u16 Pal_GleipnirBg_Nebula_0[];
extern u16 Pal_GleipnirBg_Nebula_1[];
extern u16 Pal_GleipnirBg_Nebula_2[];
extern u16 Pal_GleipnirBg_Nebula_3[];
extern u16 Pal_GleipnirBg_Nebula_4[];
extern u16 Pal_GleipnirBg_Nebula_5[];
extern u16 Pal_GleipnirBg_Nebula_6[];
extern u16 Pal_GleipnirBg_Nebula_7[];
extern u16 Pal_GleipnirBg_Nebula_8[];
extern u16 Pal_GleipnirBg_Nebula_9[];
extern u16 Pal_GleipnirBg_Nebula_10[];
extern u16 Pal_GleipnirBg_Nebula_11[];
extern u16 Pal_GleipnirBg_Nebula_12[];
extern u16 Pal_GleipnirBg_Nebula_13[];
extern u16 Pal_GleipnirBg_Nebula_14[];
extern u16 Pal_GleipnirBg_Nebula_15[];
extern u16 Tsa_GleipnirBg_Nebula_0[];
extern u16 Tsa_GleipnirBg_Nebula_1[];
extern u16 Tsa_GleipnirBg_Nebula_2[];
extern u16 Tsa_GleipnirBg_Nebula_3[];
extern u16 Tsa_GleipnirBg_Nebula_4[];
extern u16 Tsa_GleipnirBg_Nebula_5[];
extern u16 Tsa_GleipnirBg_Nebula_6[];
extern u16 Tsa_GleipnirBg_Nebula_7[];
extern u16 Tsa_GleipnirBg_Nebula_8[];
extern u16 Tsa_GleipnirBg_Nebula_9[];
extern u16 Tsa_GleipnirBg_Nebula_10[];
extern u16 Tsa_GleipnirBg_Nebula_11[];
extern u16 Tsa_GleipnirBg_Nebula_12[];
extern u16 Tsa_GleipnirBg_Nebula_13[];
extern u16 Tsa_GleipnirBg_Nebula_14[];
extern u16 Tsa_GleipnirBg_Nebula_15[];
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
extern u16 Tsa_efxCrimsonEyeBG_0[];
extern u16 Tsa_efxCrimsonEyeBG_1[];
extern u16 Tsa_efxCrimsonEyeBG_2[];
extern u16 Tsa_efxCrimsonEyeBG_3[];
extern u16 Tsa_efxCrimsonEyeBG_4[];
extern u16 Tsa_efxCrimsonEyeBG_5[];
extern u16 Tsa_efxCrimsonEyeBG_6[];
extern u16 Tsa_efxCrimsonEyeBG_7[];
extern u16 Img_efxCrimsonEyeBGFinish1_0[];
extern u16 Img_efxCrimsonEyeBGFinish1_1[];
extern u16 Img_efxCrimsonEyeBGFinish1_2[];
extern u16 Img_efxCrimsonEyeBGFinish1_3[];
extern u16 Pal_efxCrimsonEyeBGFinish1[];
extern u16 Tsa_efxCrimsonEyeBGFinish1_0[];
extern u16 Tsa_efxCrimsonEyeBGFinish1_1[];
extern u16 Tsa_efxCrimsonEyeBGFinish1_2[];
extern u16 Tsa_efxCrimsonEyeBGFinish1_3[];
extern u16 Img_StoneSprites[];
extern u16 Pal_StoneSprites[];
extern u32 AnimScr_EfxStone[];
extern u16 Img_Banim_14[];
extern u16 Img_Stone_0[];
extern u16 Img_Stone_1[];
extern u16 Img_Stone_2[];
extern u16 Img_Stone_3[];
extern u16 Img_Stone_4[];
extern u16 Img_Stone_5[];
extern u16 Img_Stone_6[];
extern u16 Img_Stone_7[];
extern u16 Img_Stone_8[];
extern u16 Img_Stone_9[];
extern u16 Img_Stone_10[];
extern u16 Img_Stone_11[];
extern u16 Img_Stone_12[];
extern u16 Img_Stone_13[];
extern u16 Img_Stone_14[];
extern u16 Img_Stone_15[];
extern u16 Img_Stone_16[];
extern u16 Img_Stone_17[];
extern u16 Tsa_Stone_0[];
extern u16 Tsa_Stone_1[];
extern u16 Tsa_Stone_2[];
extern u16 Tsa_Stone_3[];
extern u16 Tsa_Stone_4[];
extern u16 Tsa_Stone_5[];
extern u16 Tsa_Stone_6[];
extern u16 Tsa_Stone_7[];
extern u16 Tsa_Stone_8[];
extern u16 Tsa_Stone_9[];
extern u16 Tsa_Stone_10[];
extern u16 Tsa_Stone_11[];
extern u16 Tsa_Stone_12[];
extern u16 Tsa_Stone_13[];
extern u16 Tsa_Stone_14[];
extern u16 Tsa_Stone_15[];
extern u16 Tsa_Stone_16[];
extern u16 Tsa_Stone_17[];
extern u16 Tsa_Stone_18[];
extern u16 Pal_StoneBg[];
extern u16 Pal_StoneBg_0[];
extern u16 Pal_StoneBg_1[];
extern u16 Img_Banim_15[];
extern u16 Pal_Banim_6[];
extern u32 AnimScr_Banim_0[];
extern u32 AnimScr_Banim_1[];
extern u16 Img_EvilEye_0[];
extern u16 Img_EvilEye_1[];
extern u16 Img_EvilEye_2[];
extern u16 Img_EvilEye_3[];
extern u16 Img_EvilEye_4[];
extern u16 Img_EvilEye_5[];
extern u16 Img_EvilEye_6[];
extern u16 Img_EvilEye_7[];
extern u16 Img_EvilEye_8[];
extern u16 Img_EvilEye_9[];
extern u16 Img_EvilEye_10[];
extern u16 Img_EvilEye_11[];
extern u16 Img_EvilEye_12[];
extern u16 Img_EvilEye_13[];
extern u16 Img_EvilEye_14[];
extern u16 Img_EvilEye_15[];
extern u16 Img_EvilEye_16[];
extern u16 Img_EvilEye_17[];
extern u16 Img_EvilEye_18[];
extern u16 Img_EvilEye_19[];
extern u16 Pal_EvilEye_0[];
extern u16 Pal_EvilEye_1[];
extern u16 Pal_EvilEye_2[];
extern u16 Pal_EvilEye_3[];
extern u16 Pal_EvilEye_4[];
extern u16 Pal_EvilEye_5[];
extern u16 Pal_EvilEye_6[];
extern u16 Pal_EvilEye_7[];
extern u16 Pal_EvilEye_8[];
extern u16 Pal_EvilEye_9[];
extern u16 Pal_EvilEye_10[];
extern u16 Pal_EvilEye_11[];
extern u16 Pal_EvilEye_12[];
extern u16 Pal_EvilEye_13[];
extern u16 Pal_EvilEye_14[];
extern u16 Pal_EvilEye_15[];
extern u16 Pal_EvilEye_16[];
extern u16 Pal_EvilEye_17[];
extern u16 Pal_EvilEye_18[];
extern u16 Pal_EvilEye_19[];
extern u16 Tsa_EvilEye_0[];
extern u16 Tsa_EvilEye_1[];
extern u16 Tsa_EvilEye_2[];
extern u16 Tsa_EvilEye_3[];
extern u16 Tsa_EvilEye_4[];
extern u16 Tsa_EvilEye_5[];
extern u16 Tsa_EvilEye_6[];
extern u16 Tsa_EvilEye_7[];
extern u16 Tsa_EvilEye_8[];
extern u16 Tsa_EvilEye_9[];
extern u16 Tsa_EvilEye_10[];
extern u16 Tsa_EvilEye_11[];
extern u16 Tsa_EvilEye_12[];
extern u16 Tsa_EvilEye_13[];
extern u16 Tsa_EvilEye_14[];
extern u16 Tsa_EvilEye_15[];
extern u16 Tsa_EvilEye_16[];
extern u16 Tsa_EvilEye_17[];
extern u16 Tsa_EvilEye_18[];
extern u16 Tsa_EvilEye_19[];
extern u16 Img_EvilEye_20[];
extern u16 Img_EvilEye_21[];
extern u16 Img_EvilEye_22[];
extern u16 Img_EvilEye_23[];
extern u16 Img_EvilEye_24[];
extern u16 Img_EvilEye_25[];
extern u16 Pal_EvilEyeBg2_A[];
extern u16 Pal_EvilEye_20[];
extern u16 Pal_EvilEye_21[];
extern u16 Pal_EvilEye_22[];
extern u16 Pal_EvilEye_23[];
extern u16 Pal_EvilEye_24[];
extern u16 Tsa_EvilEye_20[];
extern u16 Tsa_EvilEye_21[];
extern u16 Tsa_EvilEye_22[];
extern u16 Tsa_EvilEye_23[];
extern u16 Tsa_EvilEye_24[];
extern u16 Tsa_EvilEye_25[];
extern u16 Tsa_EvilEyeBg2_Far_0[];
extern u16 Tsa_EvilEyeBg2_Far_1[];
extern u16 Tsa_EvilEyeBg2_Far_2[];
extern u16 Tsa_EvilEyeBg2_Far_3[];
extern u16 Img_Banim_16[];
extern u16 Pal_efxDarkLongMonsOBJ[];
extern u32 AnimScr_efxDarkLongMonsOBJ[];
extern u16 Img_efxDarkLongMonsBG01_0[];
extern u16 Img_efxDarkLongMonsBG01_1[];
extern u16 Img_efxDarkLongMonsBG01_2[];
extern u16 Img_efxDarkLongMonsBG01_3[];
extern u16 Img_efxDarkLongMonsBG01_4[];
extern u16 Img_efxDarkLongMonsBG01_5[];
extern u16 Img_efxDarkLongMonsBG01_6[];
extern u16 Img_efxDarkLongMonsBG01_7[];
extern u16 Img_efxDarkLongMonsBG01_8[];
extern u16 Img_efxDarkLongMonsBG01_9[];
extern u16 Img_efxDarkLongMonsBG01_10[];
extern u16 Img_efxDarkLongMonsBG01_11[];
extern u16 Img_efxDarkLongMonsBG01_12[];
extern u16 Img_efxDarkLongMonsBG01_13[];
extern u16 Img_efxDarkLongMonsBG01_14[];
extern u16 Img_efxDarkLongMonsBG01_15[];
extern u16 Pal_efxDarkLongMonsBG01_0[];
extern u16 Pal_efxDarkLongMonsBG01_1[];
extern u16 Pal_efxDarkLongMonsBG01_2[];
extern u16 Pal_efxDarkLongMonsBG01_3[];
extern u16 Pal_efxDarkLongMonsBG01_4[];
extern u16 Tsa_efxDarkLongMonsBG01_0[];
extern u16 Tsa_efxDarkLongMonsBG01_1[];
extern u16 Tsa_efxDarkLongMonsBG01_2[];
extern u16 Tsa_efxDarkLongMonsBG01_3[];
extern u16 Tsa_efxDarkLongMonsBG01_4[];
extern u16 Tsa_efxDarkLongMonsBG01_5[];
extern u16 Tsa_efxDarkLongMonsBG01_6[];
extern u16 Tsa_efxDarkLongMonsBG01_7[];
extern u16 Tsa_efxDarkLongMonsBG01_8[];
extern u16 Tsa_efxDarkLongMonsBG01_9[];
extern u16 Tsa_efxDarkLongMonsBG01_10[];
extern u16 Tsa_efxDarkLongMonsBG01_11[];
extern u16 Tsa_efxDarkLongMonsBG01_12[];
extern u16 Tsa_efxDarkLongMonsBG01_13[];
extern u16 Tsa_efxDarkLongMonsBG01_14[];
extern u16 Tsa_efxDarkLongMonsBG01_15[];
extern u16 Img_efxDarkLongMonsBG[];
extern u16 Pal_efxDarkLongMonsBG[];
extern u16 Tsa_efxDarkLongMonsBG02_0[];
extern u16 Tsa_efxDarkLongMonsBG02_1[];
extern u16 Tsa_efxDarkLongMonsBG02_2[];
extern u16 Tsa_efxDarkLongMonsBG02_3[];
extern u16 Tsa_efxDarkLongMonsBG02_4[];
extern u16 Tsa_efxDarkLongMonsBG02_5[];
extern u16 Tsa_efxDarkLongMonsBG02_6[];
extern u16 Tsa_efxDarkLongMonsBG02_7[];
extern u16 Tsa_efxDarkLongMonsBG02_8[];
extern u16 Img_efxGorgon[];
extern u16 Pal_efxGorgon[];
extern u32 AnimScr_Banim_6[];
extern u32 AnimScr_efxGorgon[];
extern u32 AnimScr_Banim_7[]; // unused
extern u32 AnimScr_Banim_8[]; // unused
extern u16 Img_efxGorgonBGDirt_0[];
extern u16 Img_efxGorgonBGDirt_1[];
extern u16 Img_efxGorgonBGDirt_2[];
extern u16 Img_efxGorgonBGDirt_3[];
extern u16 Img_efxGorgonBGDirt_4[];
extern u16 Img_efxGorgonBGDirt_5[];
extern u16 Img_efxGorgonBGDirt_6[];
extern u16 Img_efxGorgonBGDirt_7[];
extern u16 Img_efxGorgonBGDirt_8[];
extern u16 Img_efxGorgonBGDirt_9[];
extern u16 Img_efxGorgonBGDirt_10[];
extern u16 Pal_efxGorgonBGDirt_0[];
extern u16 Pal_efxGorgonBGDirt_1[];
extern u16 Pal_efxGorgonBGDirt_2[];
extern u16 Pal_efxGorgonBGDirt_3[];
extern u16 Pal_efxGorgonBGDirt_4[];
extern u16 Pal_efxGorgonBGDirt_5[];
extern u16 Pal_efxGorgonBGDirt_6[];
extern u16 Pal_efxGorgonBGDirt_7[];
extern u16 Pal_efxGorgonBGDirt_8[];
extern u16 Pal_efxGorgonBGDirt_9[];
extern u16 Pal_efxGorgonBGDirt_10[];
extern u16 Tsa_efxGorgonBGDirt_0[];
extern u16 Tsa_efxGorgonBGDirt_1[];
extern u16 Tsa_efxGorgonBGDirt_2[];
extern u16 Tsa_efxGorgonBGDirt_3[];
extern u16 Tsa_efxGorgonBGDirt_4[];
extern u16 Tsa_efxGorgonBGDirt_5[];
extern u16 Tsa_efxGorgonBGDirt_6[];
extern u16 Tsa_efxGorgonBGDirt_7[];
extern u16 Tsa_efxGorgonBGDirt_8[];
extern u16 Tsa_efxGorgonBGDirt_9[];
extern u16 Tsa_efxGorgonBGDirt_10[];
extern u16 Img_efxGorgonBGTwister_0[];
extern u16 Img_efxGorgonBGTwister_1[];
extern u16 Img_efxGorgonBGTwister_2[];
extern u16 Pal_efxGorgonBGTwister_0[];
extern u16 Pal_efxGorgonBGTwister_1[];
extern u16 Pal_efxGorgonBGTwister_2[];
extern u16 Tsa_efxGorgonBGTwister_0[];
extern u16 Tsa_efxGorgonBGTwister_1[];
extern u16 Tsa_efxGorgonBGTwister_2[];
extern u16 Img_efxGorgonBGFinish_0[];
extern u16 Img_efxGorgonBGFinish_1[];
extern u16 Img_efxGorgonBGFinish_2[];
extern u16 Img_efxGorgonBGFinish_3[];
extern u16 Img_efxGorgonBGFinish_4[];
extern u16 Img_efxGorgonBGFinish_5[];
extern u16 Img_efxGorgonBGFinish_6[];
extern u16 Img_efxGorgonBGFinish_7[];
extern u16 Img_efxGorgonBGFinish_8[];
extern u16 Pal_efxGorgonBGFinish_1[];
extern u16 Tsa_efxGorgonBGFinish_0[];
extern u16 Tsa_efxGorgonBGFinish_1[];
extern u16 Tsa_efxGorgonBGFinish_2[];
extern u16 Tsa_efxGorgonBGFinish_3[];
extern u16 Tsa_efxGorgonBGFinish_4[];
extern u16 Tsa_efxGorgonBGFinish_5[];
extern u16 Tsa_efxGorgonBGFinish_6[];
extern u16 Tsa_efxGorgonBGFinish_7[];
extern u16 Tsa_efxGorgonBGFinish_8[];
extern u16 Img_NaglfarSprites_A[];
extern u16 Pal_NaglfarSprites_A[];
extern u32 AnimScr_efxNaglfarOBJ_0[];
extern u32 AnimScr_efxNaglfarOBJ_1[];
extern u32 AnimScr_efxNaglfarOBJ_2[];
extern u32 AnimScr_efxNaglfarOBJ_3[];
extern u32 AnimScr_efxNaglfarOBJ_4[];
extern u32 AnimScr_efxNaglfarOBJ_5[];
extern u32 AnimScr_efxNaglfarOBJ_6[];
extern u32 AnimScr_efxNaglfarOBJ_7[];
extern u32 AnimScr_efxNaglfarOBJ_8[];
extern u32 AnimScr_efxNaglfarOBJ_9[];
extern u32 AnimScr_efxNaglfarOBJ_10[];
extern u32 AnimScr_efxNaglfarOBJ_11[];
extern u16 Img_NaglfarSprites_B[];
extern u16 Pal_NaglfarSprites_B[];
extern u32 AnimScr_efxNaglfarOBJ2_0[];
extern u32 AnimScr_efxNaglfarOBJ2_1[];
extern u32 AnimScr_efxNaglfarOBJ2_2[];
extern u32 AnimScr_efxNaglfarOBJ2_3[];
extern u16 Img_NaglfarBg1_A[];
extern u16 Pal_NaglfarBg1_A[];
extern u16 Tsa_NaglfarBg1_A[];
extern u16 Img_NaglfarBg[];
extern u16 Img_NaglfarBg2_0[];
extern u16 Img_NaglfarBg2_1[];
extern u16 Img_NaglfarBg2_2[];
extern u16 Img_NaglfarBg2_3[];
extern u16 Img_NaglfarBg2_4[];
extern u16 Img_NaglfarBg2_5[];
extern u16 Img_NaglfarBg2_6[];
extern u16 Img_NaglfarBg2_7[];
extern u16 Img_NaglfarBg2_8[];
extern u16 Img_NaglfarBg2_9[];
extern u16 Img_NaglfarBg2_10[];
extern u16 Img_NaglfarBg2_11[];
extern u16 Img_NaglfarBg2_12[];
extern u16 Img_NaglfarBg2_13[];
extern u16 Img_NaglfarBg2_14[];
extern u16 Pal_NaglfarBg2_0[];
extern u16 Pal_NaglfarBg2_1[];
extern u16 Pal_NaglfarBg2_2[];
extern u16 Pal_NaglfarBg2_3[];
extern u16 Pal_NaglfarBg2_4[];
extern u16 Pal_NaglfarBg2_5[];
extern u16 Pal_NaglfarBg2_6[];
extern u16 Pal_NaglfarBg2_7[];
extern u16 Pal_NaglfarBg2_8[];
extern u16 Pal_NaglfarBg2_9[];
extern u16 Pal_NaglfarBg2_10[];
extern u16 Pal_NaglfarBg2_11[];
extern u16 Pal_NaglfarBg2_12[];
extern u16 Pal_NaglfarBg2_13[];
extern u16 Pal_NaglfarBg2_14[];
extern u16 Pal_NaglfarBg2_15[];
extern u16 Tsa_NaglfarBg2_0[];
extern u16 Tsa_NaglfarBg2_1[];
extern u16 Tsa_NaglfarBg2_2[];
extern u16 Tsa_NaglfarBg2_3[];
extern u16 Tsa_NaglfarBg2_4[];
extern u16 Tsa_NaglfarBg2_5[];
extern u16 Tsa_NaglfarBg2_6[];
extern u16 Tsa_NaglfarBg2_7[];
extern u16 Tsa_NaglfarBg2_8[];
extern u16 Tsa_NaglfarBg2_9[];
extern u16 Tsa_NaglfarBg2_10[];
extern u16 Tsa_NaglfarBg2_11[];
extern u16 Tsa_NaglfarBg2_12[];
extern u16 Tsa_NaglfarBg2_13[];
extern u16 Tsa_NaglfarBg2_14[];
extern u16 Tsa_NaglfarBg2_15[];
extern u16 Img_NaglfarBg3_0[];
extern u16 Img_NaglfarBg3_1[];
extern u16 Img_NaglfarBg3_2[];
extern u16 Img_NaglfarBg3_3[];
extern u16 Pal_NaglfarBg3[];
extern u16 Tsa_NaglfarBg3_0[];
extern u16 Tsa_NaglfarBg3_1[];
extern u16 Tsa_NaglfarBg3_2[];
extern u16 Tsa_NaglfarBg3_3[];
extern u16 Img_NaglfarBg4_0[];
extern u16 Img_NaglfarBg4_1[];
extern u16 Img_NaglfarBg4_2[];
extern u16 Img_NaglfarBg4_3[];
extern u16 Img_NaglfarBg4_4[];
extern u16 Pal_NaglfarBg4[];
extern u16 Tsa_NaglfarBg4_0[];
extern u16 Tsa_NaglfarBg4_1[];
extern u16 Tsa_NaglfarBg4_2[];
extern u16 Tsa_NaglfarBg4_3[];
extern u16 Tsa_NaglfarBg4_4[];
extern u32 AnimScr_DarkBreath_Far[];
extern u16 Img_efxExcaliburBG0[];
extern u16 Pal_efxExcaliburBG0[];
extern u16 Tsa_efxExcaliburBG0[];
extern u16 Img_FireBreathBg[];
extern u16 Pal_FireBreathBg[];
extern u16 Tsa_FireBreathBg[];
extern u16 Pal_Banim_7[];
extern u16 Img_ShineBg1[];
extern u16 Pal_ShineBg_0[];
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
extern u16 Pal_Banim_8[];
extern u16 Img_GespenstBg4[];
extern u16 Pal_GespenstBg4[];
extern u16 Tsa_GespenstBg4[];
extern u16 Img_AuraBg1[];
extern u16 Pal_AuraBg1[];
extern u16 Tsa_AuraBg1_0[];
extern u16 Tsa_AuraBg1_1[];
extern u16 Tsa_AuraBg1_2[];
extern u16 Tsa_AuraBg1_3[];
extern u16 Tsa_AuraBg1_4[];
extern u16 Tsa_AuraBg1_5[];
extern u16 Tsa_AuraBg1_6[];
extern u16 Tsa_AuraBg1_7[];
extern u16 Tsa_AuraBg1_8[];
extern u16 Tsa_AuraBg1_9[];
extern u16 Tsa_AuraBg1_10[];
extern u16 Tsa_AuraBg1_11[];
extern u16 Tsa_AuraBg1_12[];
extern u16 Tsa_AuraBg1_13[];
extern u16 Tsa_AuraBg1_14[];
extern u16 Tsa_AuraBg1_15[];
extern u16 Tsa_AuraBg1_16[];
extern u16 Tsa_AuraBg1_17[];
extern u16 Tsa_AuraBg1_18[];
extern u16 Tsa_AuraBg1_19[];
extern u16 Tsa_AuraBg1_20[];
extern u16 Tsa_AuraBg1_21[];
extern u16 Tsa_AuraBg1_22[];
extern u16 Tsa_AuraBg1_23[];
extern u16 Tsa_AuraBg1_24[];
extern u16 Tsa_AuraBg1_25[];
extern u16 Tsa_AuraBg1_26[];
extern u16 Tsa_AuraBg1_27[];
extern u16 Img_AuraBg3_0[];
extern u16 Img_AuraBg3_1[];
extern u16 Img_AuraBg3_2[];
extern u16 Img_AuraBg3_3[];
extern u16 Img_AuraBg3_4[];
extern u16 Img_AuraBg3_5[];
extern u16 Img_AuraBg3_6[];
extern u16 Img_AuraBg3_7[];
extern u16 Img_AuraBg3_8[];
extern u16 Img_AuraBg3_9[];
extern u16 Img_AuraBg3_10[];
extern u16 Img_AuraBg3_11[];
extern u16 Pal_AuraBg3[];
extern u16 Tsa_AuraBg3_0[];
extern u16 Tsa_AuraBg3_1[];
extern u16 Tsa_AuraBg3_2[];
extern u16 Tsa_AuraBg3_3[];
extern u16 Tsa_AuraBg3_4[];
extern u16 Tsa_AuraBg3_5[];
extern u16 Tsa_AuraBg3_6[];
extern u16 Tsa_AuraBg3_7[];
extern u16 Tsa_AuraBg3_8[];
extern u16 Tsa_AuraBg3_9[];
extern u16 Tsa_AuraBg3_10[];
extern u16 Tsa_AuraBg3_11[];
extern u16 Pal_EfxChillEffectBG[];
extern u16 Tsa1_EfxChillEffectBG[];
extern u16 Tsa2_EfxChillEffectBG[];
extern u16 Tsa3_EfxChillEffectBG[];
extern u32 AnimScr_EfxChill_R[];
extern u32 AnimScr_EfxChill_L[];
extern u16 Img_Banim_17[];
extern u16 Img_EreshkigalBg3_0[];
extern u16 Img_EreshkigalBg3_1[];
extern u16 Img_EreshkigalBg3_2[];
extern u16 Img_EreshkigalBg3_3[];
extern u16 Img_EreshkigalBg3_4[];
extern u16 Img_EreshkigalBg3_5[];
extern u16 Img_EreshkigalBg3_6[];
extern u16 Img_EreshkigalBg3_7[];
extern u16 Img_EreshkigalBg3_8[];
extern u16 Pal_EreshkigalBg3[];
extern u16 Tsa_EreshkigalBg3_0[];
extern u16 Tsa_EreshkigalBg3_1[];
extern u16 Tsa_EreshkigalBg3_2[];
extern u16 Tsa_EreshkigalBg3_3[];
extern u16 Tsa_EreshkigalBg3_4[];
extern u16 Tsa_EreshkigalBg3_5[];
extern u16 Tsa_EreshkigalBg3_6[];
extern u16 Tsa_EreshkigalBg3_7[];
extern u16 Tsa_EreshkigalBg3_8[];
extern u16 Tsa_EreshkigalBg3_9[];
extern u16 Img_Banim_18[];
extern u16 Pal_efxSuperdruidOBJ[];
extern u32 AnimScr_efxSuperdruidOBJ[];
extern u16 Img_SongBg_0[];
extern u16 Img_SongBg_1[];
extern u16 Img_SongBg_2[];
extern u16 Img_SongBg_3[];
extern u16 Pal_SongSprites[];
extern u16 Tsa_Song[];
extern u16 Tsa_SongBg_0[];
extern u16 Tsa_SongBg_1[];
extern u16 Tsa_SongBg_2[];
extern u16 Tsa_SongBg_3[];
extern u16 Tsa_SongBg_4[];
extern u16 Tsa_SongBg_5[];
extern u16 Tsa_SongBg_6[];
extern u16 Tsa_SongBg_7[];
extern u16 Tsa_SongBg_8[];
extern u16 Tsa_SongBg_9[];
extern u16 Tsa_SongBg_10[];
extern u16 Tsa_SongBg_11[];
extern u16 Tsa_SongBg_12[];
extern u16 Tsa_SongBg_13[];
extern u16 Tsa_SongBg_14[];
extern u16 Tsa_SongBg_15[];
extern u16 Tsa_SongBg_16[];
extern u16 Tsa_SongBg_17[];
extern u16 Tsa_SongBg_18[];
extern u16 Tsa_SongBg_19[];
extern u16 Tsa_SongBg_20[];
extern u16 Tsa_SongBg_21[];
extern u16 Tsa_SongBg_22[];
extern u16 Tsa_SongBg_23[];
extern u16 Tsa_SongBg_24[];
extern u16 Tsa_SongBg_25[];
extern u16 Img_SongSprites[];
extern u32 AnimScr_EfxSong[];
extern u16 Img_EfxLokmsunaObj[];
extern u32 AnimScr_EfxLokmsunaObjLeft[];
extern u32 AnimScr_EfxLokmsunaObjRight[];
// extern ??? gEkrDracoZombiTsaSetLut
extern struct ProcCmd ProcScr_EkrDracoZombie[];
extern struct ProcCmd ProcScr_ekrDragonQuake[];
extern struct ProcCmd ProcScr_ekrWhiteINOUT[];
extern struct ProcCmd ProcScr_EkrDragon_0[];
extern u16 gEkrdragon_0[];
// extern ??? ProcScr_EkrMyrrh
extern struct ProcCmd ProcScr_EkrMyrrh[];
extern s16 gEfxutils_0[];
extern u16 gEfxTileRefPals_Efxutils_0[];
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

extern struct FaceVramEntry gEkrlvup_2[4];
// extern ??? EkrLvupMsgsStr
// extern ??? EkrLvupMsgsMag
extern CONST_DATA struct ProcCmd ProcScr_EkrLevelup[];
extern CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll[];
extern CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll2[];
extern s16 gEfxlvup_1[];
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

extern u16 Img_Banimmisc_0[];
extern u16 Img_EfxLeftNameBox[];
extern u16 Img_EfxLeftItemBox[];
extern u16 Img_EfxRightNameBox[];
extern u16 Img_EfxRightItemBox[];
extern u8 gBanimmisc_0[];
extern u8 gBanimmisc_1[];
extern u8 gBanimmisc_2[];
extern u8 gBanimmisc_3[];
extern u8 gBanimmisc_4[];
extern u8 gBanimmisc_5[];
extern u16 gBanimmisc_6[];
extern u16 Img_EfxSideHitDmgCrit[];
extern u16 Img_EfxWTAArrow1[];
extern u16 Img_EfxWTAArrow2[];
extern u16 gBanimmisc_7[];
extern u16 gBanimmisc_8[];
extern u16 gBanimmisc_9[];
extern u16 gBanimmisc_10[];
extern u16 gPalEfxHpBarGreen[];
extern u16 gBanimmisc_11[];
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
void EfxFarAttack_SetAnimXPositions(struct ProcEfxFarAttack * unused, int x);
void efxFarAttack_Init(struct ProcEfxFarAttack * proc);
void efxFarAttack_ScrollIn(struct ProcEfxFarAttack * proc);
void efxFarAttack_ScrollOut(struct ProcEfxFarAttack * proc);
void EfxUpdateBg2Scroll(int);

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
void efxYushaSpinShieldOBJ_0(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_1(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_2(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_3(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff00(struct Anim * anim);
void EfxHurtmutEff00Main(struct ProcEfx * proc);
void NewEfxHurtmutEff00OBJ(struct Anim * anim);
void efxHurtmutEff00OBJ_0(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_1(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_2(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff01OBJ(struct Anim * anim);
void efxHurtmutEff01OBJ_0(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_1(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_2(struct ProcEfxOBJ * proc);
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
void Nop_BanimEfxmisc_0(struct Anim * anim);

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
