#pragma once

#include "global.h"
#include "anime.h"
#include "proc.h"

struct ProcEfx {
    PROC_HEADER;

    /* 29 */ u8 hitted;
    /* 2A */ u8 type;
    /* 2B */ STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ u32 unk48;
    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
    /* 54 */ s16 *unk54;
    /* 58 */ s16 **unk58;
    /* 5C */ struct Anim *anim;
};

struct ProcEfxBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_config;
    /* 4C */ u16 **unk4C;
    /* 50 */ u16 **unk50;
    /* 54 */ u16 **unk54;
    STRUCT_PAD(0x58, 0x5C);
    /* 5C */ struct Anim *anim;
};

struct ProcEfxBGCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    STRUCT_PAD(0x2E, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_config;
    /* 4C */ void *unk4C;
    STRUCT_PAD(0x50, 0x5C);
    /* 5C */ struct Anim *anim;
};

struct ProcEfxOBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim *anim;
    /* 60 */ struct Anim *anim2;
};

struct ProcEkrDispUP {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
    /* 2B */ u8 _pad_2B[0x32 - 0x2B];
    /* 32 */ u16 unk32;
    /* 34 */ u8 _pad_32[0x3A - 0x34];
    /* 3A */ u16 unk3A;
    /* 3C */ u8 _pad_3C[0x4C - 0x3C];
    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
};

extern struct ProcEkrDispUP *gpProcEkrDispUP;

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

struct Unknown_030053A0 {
    /* 00 */ u8 u00;
    /* 01 */ u8 u01;
    /* 02 */ u16 u02;
    /* 04 */ u16 u04;
    /* 06 */ u16 u06;
    /* 08 */ u16 u08;
    /* 0A */ u16 u0a;
    /* 0C */ u16 u0c;
    /* 0E */ u16 u0e;
    /* 10 */ u16 u10;
    /* 14 */ struct Anim *anim1;
    /* 18 */ struct Anim *anim2;
    /* 1C */ void *u1c;
    /* 20 */ void *u20;
    /* 24 */ void *u24;
    /* 28 */ void *u28;
    /* 2C */ void *_u2c;
    /* 30 */ struct Unknown_030053E0 * u30;
};

extern struct Unknown_030053A0 gUnknown_030053A0;

struct Unknown_0201FADC {
    /* 00 */ u16 things[8];
    /* 10 */ u16 _pad_10;
    /* 14 */ ProcPtr p1;
    /* 18 */ ProcPtr p2;
    /* 1c */ u32 u1c;
    /* 20 */ u8 *u20;
    /* 24 */ u32 _pad_24;
};

extern struct Unknown_0201FADC gUnknown_0201FADC;

struct Struct20200E0_14 {
    /* 00 */ u8 _pad_00[0x4C - 0x0];
    /* 4C */ int unk4C;
};

struct Struct20200E0 {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ u16 unk04;
    /* 06 */ u16 unk06;
    /* 08 */ u16 unk08;
    /* 0A */ u16 unk0A;
    /* 0C */ u16 unk0C;
    /* 0E */ u16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ void *unk14;
    /* 18 */ void *unk18;
    /* 1C */ void *unk1C;
    /* 20 */ void *unk20;
    /* 24 */ void *unk24;
};
extern struct Struct20200E0 gUnknown_020200E0;

struct ProcEfxHPBar {
    PROC_HEADER;

    /* 29 */ u8 death;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ s16 pos;
    /* 2E */ s16 cur;
    /* 30 */ u8 _pad_30[0x48 - 0x30];
    /* 48 */ int diff;
    /* 4C */ int pre;
    /* 50 */ int post;
    /* 54 */ int timer;
    /* 58 */ int finished;
    /* 5C */ struct Anim *anim5C;
    /* 60 */ struct Anim *anim60;
    /* 64 */ struct Anim *anim64;
};

void ekrDispUPMain(struct ProcEkrDispUP *proc);

struct ProcEfxDead {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim *anim1;
    /* 60 */ struct Anim *anim2;
};

void NewEfxDeadEvent(struct Anim *anim1, struct Anim *anim2);
void sub_8052DFC(struct ProcEfxDead *proc);
void sub_8052E7C(struct ProcEfxDead *proc);
void sub_8052EAC(struct ProcEfxDead *proc);
void sub_8052F24(struct ProcEfxDead *proc);
void sub_8052F84(struct ProcEfxDead *proc);
void NewEfxDead(struct Anim *anim1, struct Anim *anim2);
void sub_8052FEC(struct ProcEfxDead *proc);
void sub_8053080(struct ProcEfxDead *proc);
void NewEfxDeadPika(struct Anim *anim1, struct Anim *anim2);
void EfxDeadPikaMain(struct ProcEfxDead *proc);
void NewEfxDeadAlpha(struct Anim *anim1, struct Anim *anim2);
void EfxDeadAlphaMain(struct ProcEfxDead *proc);
void NewEfxDeadDragonAlpha(struct Anim *anim1, struct Anim *anim2);
void EfxDeadDragonAlphaMain(struct ProcEfxDead *proc);

struct ProcEfxStatusUnit {
    PROC_HEADER;
    /* 29 */ u8 invalid;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ u16 unk2C;
    /* 2E */ u8 _pad_2D[0x32 - 0x2E];
    /* 32 */ s16 red;
    /* 34 */ s16 green;
    /* 36 */ s16 blue;
    /* 38 */ u8 _pad_38[0x44 - 0x38];
    /* 44 */ u32 unk44;
    /* 48 */ const u16 *unk48;
    /* 4C */ u32 debuff;
    /* 50 */ u32 unk50;

    /* 54 */ u8 _pad_54[0x5C - 0x54];
    /* 5C */ struct Anim *anim;
};

extern struct ProcEfxStatusUnit *gpProcEfxStatusUnits[2];

void NewEfxStatusUnit(struct Anim *anim);
// ??? EndEfxStatusUnits(???);
// ??? DeleteEach6C_efxStatusUnit(???);
void DisableEfxStatusUnits(struct Anim *anim);
void EnableEfxStatusUnits(struct Anim *anim);
void SetUnitEfxDebuff(struct Anim *anim, int debuff);
u32 GettUnitEfxDebuff(struct Anim *anim);
void EfxStatusUnitSomePalModify(struct Anim *anim, int, int, int);
void EfxStatusUnitMain(struct ProcEfxStatusUnit *proc);
void EfxStatusUnitEnd(struct ProcEfxStatusUnit *proc);

struct ProcEfxWeaponIcon {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 unk2C;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ const u16 *unk48;
    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
    /* 54 */ int unk54;
    /* 58 */ int unk58;
};

extern struct ProcEfxWeaponIcon *gpProcEfxWeaponIcon;

void NewEfxWeaponIcon(s16 a, s16 b);
void EndProcEfxWeaponIcon(void);
void EfxWeaponIconSet50(void);
void EfxWeaponIconClear50(void);
void sub_8054F10(struct ProcEfxWeaponIcon *proc);
void sub_8054F78(struct ProcEfxWeaponIcon *proc);

struct ProcEfxSpellCast {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
};

extern struct ProcEfxSpellCast *gpProcEfxSpellCast;

void NewEfxSpellCast(void);
void EfxSpellCastSet29(void);
void EndEfxSpellCast(void);
void sub_8055038(struct ProcEfxSpellCast *proc);
void sub_805509C(struct ProcEfxSpellCast *proc);
void sub_80550DC(struct ProcEfxSpellCast *proc);

struct ProcEfxSkill {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;

    /* 30 */ STRUCT_PAD(0x30, 0x3A);

    /* 3A */ s16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x44);

    /* 44 */ u32 unk44;
    /* 48 */ const u16 *time_lut;
    /* 4C */ u16 **tsa_lut;
    /* 50 */ u16 **tsa_cur;
    /* 54 */ u16 **img_lut;
    /* 58 */ u16 **pal_lut;
    /* 5C */ struct Anim *anim;
};

void NewEfxSkillType01BG(struct Anim *anim);
void EfxSkillType01BGMain(struct ProcEfxSkill *proc);
void NewEfxSkillCommonBG(struct Anim *anim, u8 val);
void sub_806E610(struct ProcEfxSkill *proc);
void sub_806E638(struct ProcEfxSkill *proc);
void sub_806E6E0(struct ProcEfxSkill *proc);
void sub_806E79C(struct ProcEfxSkill *proc);
void sub_806E868(struct ProcEfxSkill *proc);
void sub_806E8A4(struct ProcEfxSkill *proc);

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

void sub_806E8F0(void);
void sub_806E904(void);
void sub_806E920(void);

extern const u16 FrameLut_EfxSkill[];

struct ProcEfxDamageMojiEffectOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim *anim;
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

extern u16 gEkrBgPalBackupMaybe[];
// extern ??? gUnknown_02016828
extern u16 gObjBuf_EkrSideHitDmgCrit[];
// extern ??? gUnknown_02016DC8
// extern ??? gUnknown_02016E48
// extern ??? gUnknown_02017048
// extern ??? gUnknown_02017248
// extern ??? gUnknown_02017448
// extern ??? gUnknown_020176F0
extern u16 gDecodedEkrHitDmgCritBuf[];
extern u32 gEkrBattleEndFlag;
extern u32 gEkrHPBarCount;
extern u32 gEfxSpellAnimExists;
extern u32 gUnknown_02017730;
extern u32 gUnknown_02017734;
extern u32 gEkrDeadEventExist;
extern u32 gUnknown_0201773C;
extern u32 gUnknown_02017740;
extern u32 gEkrPos2Maybe;
extern u32 gUnknown_02017748;
extern u32 gEfxBgSemaphore;
extern u32 gUnknown_02017750;
extern u32 gUnknown_02017754;
extern u32 gUnknown_02017758;
extern u32 gUnknown_0201775C;
struct Vec2 gEkrBg2QuakeVec;
extern short gUnknown_02017764[2];
extern short gUnknown_02017768[2];

extern u32 gpProcEfxHPBarColorChange;
extern short gEkrHitEfxBool[];     /* [0] for left and [1] for right, if in hit routine, 1, otherwise 0 */
extern u8 gEkrImgBuffer[];
extern u16 gUnknown_02019490[];
extern u16 gEkrTsaBuffer[0x1000 / 2];
extern u8 gUnknown_0201A790[];
// extern ??? gUnknown_0201AF90
// extern ??? gUnknown_0201AFC0
// extern ??? gUnknown_0201AFF0
// extern ??? gUnknown_0201B0D8
// extern ??? gUnknown_0201B100
// extern ??? gUnknown_0201B104
// extern ??? gUnknown_0201B1E4
// extern ??? gUnknown_0201B3A4
// extern ??? gUnknown_0201B430
// extern ??? gUnknown_0201B458
// extern ??? gUnknown_0201B718
// extern ??? gUnknown_0201B71C
// extern ??? gUnknown_0201B758
// extern ??? gUnknown_0201B7DA
// extern ??? gUnknown_0201B864
// extern ??? gUnknown_0201B930
// extern ??? gUnknown_0201B958
// extern ??? gUnknown_0201BBD8
// extern ??? gUnknown_0201BE30
// extern ??? gUnknown_0201BE32
// extern ??? gUnknown_0201C5B4
// extern ??? gUnknown_0201C5C0
// extern ??? gUnknown_0201C5CC
// extern ??? gUnknown_0201C5CF
// extern ??? gUnknown_0201C5D0
// extern ??? gUnknown_0201C5D1
// extern ??? gUnknown_0201C5D4
extern u16 gPalBackupEkrUnitMaybe[0x40 / sizeof(u16)];
extern u16 gUnknown_0201C8D0[];
// extern ??? gUnknown_0201C912
extern u16 gUnknown_0201CDD4[]; // used as a palette buffer in opsubtitle
// extern ??? gUnknown_0201CF84
extern u16 gUnknown_0201D428[];
// extern ??? gUnknown_0201D438
extern u16 gUnknown_0201D46A[];
// extern ??? gUnknown_0201DB00
// extern ??? gUnknown_0201DB28
// extern ??? gUnknown_0201F148
// extern ??? gUnknown_0201F160
// extern ??? gUnknown_0201F198
// extern ??? gUnknown_0201F19C
// extern ??? gUnknown_0201F948
// extern ??? gUnknown_0201F978
// extern ??? gUnknown_0201F9A8
// extern ??? gUnknown_0201FA08
// extern ??? gUnknown_0201FA38
// extern ??? gUnknown_0201FA68
extern int gUnknown_0201FAC8;
// extern ??? gEkrWindowAppearExist
// extern ??? gEkrNamewinAppearExist
// extern ??? gProcEkrBaseAppearExist
extern u32 gUnknown_0201FAD8;

// extern ??? ProcScr_efxMaohFlash
// extern ??? ProcScr_efxMaohFlashBG1
// extern ??? gUnknown_085D788C
// extern ??? gUnknown_085D790C
// extern ??? gUnknown_085D798C
// extern ??? gUnknown_085D7A0C
// extern ??? gUnknown_085D7A8C
// extern ??? gUnknown_085D7B0C
// extern ??? gUnknown_085D7B8C
// extern ??? gUnknown_085D7BA4
// extern ??? gUnknown_085D7BB0
// extern ??? gUnknown_085D7BBC
// extern ??? ProcScr_efxMaohFlashBG1BG3
// extern ??? gUnknown_085D7BE0
// extern ??? gUnknown_085D7BF4
// extern ??? gUnknown_085D7C08
// extern ??? gUnknown_085D7C1C
// extern ??? gUnknown_085D7C30
// extern ??? gUnknown_085D7C44
// extern ??? gUnknown_085D7C58
// extern ??? gUnknown_085D7C70
// extern ??? gUnknown_085D7C90
// extern ??? gUnknown_085D7CB0
// extern ??? gUnknown_085D7CD0
// extern ??? gUnknown_085D7CF0
// extern ??? gUnknown_085D7D10
// extern ??? gUnknown_085D7D30
// extern ??? gUnknown_085D7D58
// extern ??? gUnknown_085D7D78
// extern ??? gUnknown_085D7D90
// extern ??? gUnknown_085D7DA8
// extern ??? ProcScr_efxMaohFlashBG1EyeFire1OBJ1
// extern ??? gUnknown_085D7DD8
// extern ??? gUnknown_085D7DF0
// extern ??? gUnknown_085D7E08
// extern ??? gUnknown_085D7E20
// extern ??? ProcScr_efxStoneBG
// extern ??? gUnknown_085D7E50
// extern ??? gUnknown_085D7E9C
// extern ??? gUnknown_085D7EE8
// extern ??? gUnknown_085D7F00
// extern ??? gUnknown_085D7F18
// extern ??? gUnknown_085D7F30
// extern ??? gUnknown_085D7F80
// extern ??? gUnknown_085D7FD0
// extern ??? ProcScr_efxEvilEyeBG2
// extern ??? gUnknown_085D8038
// extern ??? gUnknown_085D8050
// extern ??? gUnknown_085D8068
// extern ??? gUnknown_085D8080
// extern ??? gUnknown_085D8098
// extern ??? gUnknown_085D80B0
// extern ??? gUnknown_085D80C8
// extern ??? gUnknown_085D80E0
// extern ??? gUnknown_085D80E4
// extern ??? ProcScr_efxNaglfarBG2
// extern ??? gUnknown_085D8100
// extern ??? gUnknown_085D8140
// extern ??? gUnknown_085D8180
// extern ??? gUnknown_085D81C0
// extern ??? gUnknown_085D81D8
// extern ??? gUnknown_085D81E8
// extern ??? gUnknown_085D81F8
// extern ??? gUnknown_085D8210
// extern ??? gUnknown_085D8224
// extern ??? ProcScr_efxNaglfarOBJ
// extern ??? gUnknown_085D8250
// extern ??? ProcScr_efxNaglfarOBJRockGyre
// extern ??? gUnknown_085D8280
// extern ??? ProcScr_efxDrzDrakbreath
// extern ??? gUnknown_085D82C8
// extern ??? gUnknown_085D82E0
// extern ??? ProcScr_efxDrzDrakbreathBGCOL
// extern ??? gUnknown_085D8318
// extern ??? gUnknown_085D8330
// extern ??? gUnknown_085D8348
// extern ??? gUnknown_085D8374
// extern ??? ProcScr_efxDarkGradoBG01
// extern ??? gUnknown_085D83B8
// extern ??? gUnknown_085D83F8
// extern ??? gUnknown_085D8438
// extern ??? gUnknown_085D8478
// extern ??? gUnknown_085D847C
// extern ??? ProcScr_efxDarkGradoBG02
// extern ??? gUnknown_085D84B4
// extern ??? gUnknown_085D84D4
// extern ??? gUnknown_085D8524
// extern ??? gUnknown_085D8574
// extern ??? gUnknown_085D85C4
// extern ??? gUnknown_085D8614
// extern ??? gUnknown_085D8664
// extern ??? gUnknown_085D86B4
// extern ??? gUnknown_085D8704
// extern ??? ProcScr_efxDarkGradoOBJ01
// extern ??? ProcScr_efxDarkGradoOBJ02piece
// extern ??? ProcScr_efxDarkGradoOBJ02
// extern ??? ProcScr_efxCrimsonEye
// extern ??? gUnknown_085D877C
// extern ??? gUnknown_085D878C
// extern ??? ProcScr_efxCrimsonEyeBGFinish1
// extern ??? ProcScr_efxCrimsonEyeOBJFinishPiece
// extern ??? gUnknown_085D87DC
// extern ??? ProcScr_efxCrimsonEyeOBJFinish
// extern ??? gUnknown_085D8874
// extern ??? ProcScr_efxCrimsonEyeBG
// extern ??? gUnknown_085D88AC
// extern ??? ProcScr_efxCrimsonEyeOBJ
// extern ??? ProcScr_efxDarkLongMons
// extern ??? gUnknown_085D89B8
// extern ??? gUnknown_085D89F8
// extern ??? gUnknown_085D8A38
// extern ??? ProcScr_efxDarkLongMonsBG01
// extern ??? gUnknown_085D8A98
// extern ??? ProcScr_efxDarkLongMonsBG02
// extern ??? ProcScr_efxDarkLongMonsOBJ
// extern ??? gUnknown_085D8AEC
// extern ??? ProcScr_efxGorgon
// extern ??? gUnknown_085D8B24
// extern ??? gUnknown_085D8B4C
// extern ??? gUnknown_085D8B78
// extern ??? gUnknown_085D8BA4
// extern ??? ProcScr_efxGorgonBGDirt
// extern ??? gUnknown_085D8BE8
// extern ??? gUnknown_085D8BF4
// extern ??? gUnknown_085D8C00
// extern ??? ProcScr_efxGorgonBGTwister
// extern ??? gUnknown_085D8C24
// extern ??? ProcScr_efxGorgonOBJTwisterPiece
// extern ??? ProcScr_efxGorgonOBJTwister
// extern ??? gUnknown_085D8C7C
// extern ??? gUnknown_085D8CA0
// extern ??? ProcScr_efxGorgonBGFinish
// extern ??? gUnknown_085D8CE4
// extern ??? gUnknown_085D8D14
extern struct ProcCmd ProcScr_efxDamageMojiEffect[];
extern struct ProcCmd ProcScr_efxDamageMojiEffectOBJ[];
extern struct ProcCmd ProcScr_efxCriricalEffect[];
extern struct ProcCmd ProcScr_efxCriricalEffectBG[];
extern struct ProcCmd ProcScr_efxCriricalEffectBGCOL[];
extern struct ProcCmd ProcScr_efxNormalEffect[];
extern struct ProcCmd ProcScr_efxNormalEffectBG[];
extern u16 *gUnknown_085D8DF4[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffect[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffectBG[];
extern struct ProcCmd ProcScr_efxPierceCriticalEffectBGCOL[];
extern struct ProcCmd ProcScr_efxPierceNormalEffect[];
extern struct ProcCmd ProcScr_efxPierceNormalEffectBG[];
extern u16 *gUnknown_085D8E9C[];
extern struct ProcCmd ProcScr_efxYushaSpinShield[];
extern struct ProcCmd ProcScr_efxYushaSpinShieldOBJ[];
extern struct ProcCmd ProcScr_efxHurtmutEff00[];
extern struct ProcCmd ProcScr_efxHurtmutEff00OBJ[];
extern struct ProcCmd ProcScr_efxHurtmutEff01OBJ[];
extern struct ProcCmd ProcScr_efxMagfcast[];
extern struct ProcCmd ProcScr_efxMagfcastBG[];
extern u16 *gUnknown_085D8FC4[];
extern u16 *gUnknown_085D8FDC[];
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
extern u16 *gUnknown_085D9274[];
extern struct ProcCmd ProcScr_efxMantBatabata[];
extern struct ProcCmd ProcScr_efxChillEffect[];
extern struct ProcCmd ProcScr_efxChillEffectBG[];
extern u16 *gUnknown_085D92D4[];
extern struct ProcCmd ProcScr_efxChillEffectBGCOL[];
extern struct ProcCmd ProcScr_efxChillAnime[];
extern struct ProcCmd ProcScr_efxSkillType01BG[];
extern u16 *TsaLut_EfxSkill[];
extern u16 *ImgLut_EfxSkill[];
extern u16 *PalLut_EfxSkill[];
extern struct ProcCmd ProcScr_efxSkillCommonBG[];
// extern ??? gpEfxopFuncLut
// extern ??? ProcScr_efxopFire
// extern ??? ProcScr_efxopFireBG
// extern ??? gUnknown_085D9494
// extern ??? ProcScr_efxopFireOBJ
// extern ??? ProcScr_efxopThunder
// extern ??? ProcScr_efxopThunderBG
// extern ??? gUnknown_085D951C
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
// extern ??? gUnknown_085D9638
// extern ??? gUnknown_085D96BC
// extern ??? gUnknown_085D9740
// extern ??? gUnknown_085D97C4
// extern ??? gUnknown_085D97DC
// extern ??? gUnknown_085D9880
// extern ??? gUnknown_085D9924
// extern ??? gUnknown_085D996C
// extern ??? ProcScr_efxopMistyrain
// extern ??? ProcScr_efxopMyrrh

// ??? sub_806B534(???);
// ??? sub_806B64C(???);
// ??? sub_806B664(???);
// ??? sub_806B680(???);
// ??? sub_806B73C(???);
// ??? sub_806B7A8(???);
// ??? sub_806B830(???);
// ??? sub_806B89C(???);
// ??? sub_806B938(???);
// ??? sub_806B940(???);
// ??? sub_806BACC(???);
// ??? sub_806BBDC(???);
// ??? sub_806BBF0(???);
// ??? sub_806BC98(???);
// ??? sub_806BD94(???);
// ??? sub_806BEEC(???);
// ??? sub_806C050(???);
// ??? sub_806C0B8(???);
// ??? sub_806C14C(???);
// ??? sub_806C154(???);
// ??? sub_806C1B8(???);
// ??? sub_806C2D4(???);
// ??? sub_806C464(???);
// ??? sub_806C478(???);
// ??? sub_806C608(???);
void NewEfxDamageMojiEffect(struct Anim *anim, int hitted);
// ??? efxDamageMojiEffectMain(???);
void NewEfxDamageMojiEffectOBJ(struct Anim *anim, int hitted);
// ??? efxDamageMojiEffectOBJMain(???);
// ??? NewEfxPierceCritical(???);
// ??? efxCriricalEffectMain(???);
void NewEfxCriricalEffectBG(struct Anim *anim);
// ??? efxCriricalEffectBGMain(???);
void NewEfxCriricalEffectBGCOL(struct Anim *anim);
// ??? efxCriricalEffectBGCOLMain(???);
// ??? NewEfxNormalEffect(???);
// ??? efxNormalEffectMain(???);
void NewEfxNormalEffectBG(struct Anim *anim);
// ??? efxNormalEffectBGMain(???);
void NewEfxPierceCriticalEffect(struct Anim *anim);
// ??? efxPierceCriticalEffectMain(???);
void NewEfxPierceCriticalEffectBG(struct Anim *anim);
// ??? efxPierceCriticalEffectBGMain(???);
void NewEfxPierceCriticalEffectBGCOL(struct Anim *anim);
// ??? efxPierceCriticalEffectBGCOLMain(???);
void NewEfxPierceNormalEffect(struct Anim *anim);
// ??? efxPierceNormalEffectMain(???);
void NewEfxPierceNormalEffectBG(struct Anim *anim);
// ??? efxPierceNormalEffectBGMain(???);
void NewEfxYushaSpinShield(struct Anim *anim, int r1);
// ??? EfxYushaSpinShieldMain(???);
void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1);
// ??? efxYushaSpinShieldOBJ_806CD14(???);
// ??? efxYushaSpinShieldOBJ_806CD7C(???);
// ??? efxYushaSpinShieldOBJ_806CDA4(???);
// ??? efxYushaSpinShieldOBJ_806CE08(???);
void NewEfxHurtmutEff00(struct Anim *anim);
// ??? EfxHurtmutEff00Main(???);
void NewEfxHurtmutEff00OBJ(struct Anim *anim);
// ??? efxHurtmutEff00OBJ_806CEC4(???);
// ??? efxHurtmutEff00OBJ_806CF10(???);
// ??? efxHurtmutEff00OBJ_806CF5C(???);
void NewEfxHurtmutEff01OBJ(struct Anim *anim);
// ??? efxHurtmutEff01OBJ_806CFC4(???);
// ??? efxHurtmutEff01OBJ_806D010(???);
// ??? efxHurtmutEff01OBJ_806D05C(???);
void NewEfxMagfcast(struct Anim *anim, int type);
// ??? EfxMagfcastMain(???);
void NewEfxMagfcastBG(struct Anim *anim, u32 type);
// ??? EfxMagfcastBGMain(???);
void NewEfxSunakemuri(struct Anim *anim, int type);
// ??? EfxSunakemuriMain(???);
void NewEfxSunakemuriOBJ(struct Anim *anim, int type);
// ??? EfxSunakemuriOBJMain(???);
void NewEfxLokmsuna(struct Anim *anim);
// ??? EfxLokmsunaMain(???);
void NewEfxLokmsunaOBJ(struct Anim *anim);
// ??? EfxLokmsunaIOBJMain(???);
// ??? NewEfxKingPika(???);
// ??? EfxKingPikaMain(???);
// ??? NewEfxFlashFX(???);
// ??? EfxFlashFXMain(???);
// ??? NewEfxSongOBJ2(???);
// ??? EfxSongOBJ2Main(???);
// ??? NewEfxDanceOBJ(???);
// ??? EfxDanceOBJMain(???);
void NewEfxSpecalEffect(struct Anim *anim);
// ??? sub_806D980(???);
void NewEfxSRankWeaponEffect(struct Anim *anim);
// ??? EfxSRankWeaponEffectMain(???);
void NewEfxSRankWeaponEffectBG(struct Anim *anim);
// ??? EfxSRankWeaponEffectBGMain(???);
void NewEfxSRankWeaponEffectSCR(void);
// ??? EfxSRankWeaponEffectSCRMain(???);
void NewEfxSRankWeaponEffectSCR2(struct ProcEfx *seff_scr);
// ??? EfxSRankWeaponEffectSCR2Main(???);
void NewEfxMagdhisEffect(struct Anim *anim);
// ??? EfxMagdhisEffectMain(???);
void NewEfxMagdhisEffectBG(struct Anim *anim, int);
// ??? EfxMagdhisEffectBGMain(???);
void NewEfxMantBatabata(struct Anim *anim);
// ??? sub_806DFA4(???);
// ??? sub_806DFD0(???);
void NewEfxChillEffect(struct Anim *anim);
// ??? EfxChillEffectMain(???);
void NewEfxChillEffectBG(struct Anim *anim);
// ??? EfxChillEffectBGMain(???);
void NewEfxChillEffectBGCOL(struct Anim *anim);
// ??? sub_806E158(???);
// ??? NewEfxChillAnime(???);
// ??? sub_806E290(???);
// ??? nullsub_17(???);

// ??? SetGlbProcefxopCur(???);
// ??? sub_806E948(???);
// ??? sub_806E954(???);
// ??? sub_806E95C(???);
// ??? sub_806E9B4(???);
// ??? sub_806E9E4(???);
// ??? sub_806EA38(???);
// ??? sub_806EAA4(???);
// ??? sub_806EAD4(???);
// ??? sub_806EAFC(???);
// ??? sub_806EB2C(???);
// ??? ExecEfxop(???);
// ??? nullsub_73(???);
// ??? NewEfxopFire(???);
// ??? sub_806EB9C(???);
// ??? NewEfxopFireBG(???);
// ??? sub_806EC1C(???);
// ??? NewEfxopFireOBJ(???);
// ??? sub_806ECE8(???);
// ??? NewEfxopThunder(???);
// ??? sub_806ED2C(???);
// ??? sub_806ED54(???);
// ??? sub_806EDB0(???);
// ??? sub_806EE34(???);
// ??? sub_806EE68(???);
// ??? sub_806EEA8(???);
// ??? sub_806EF24(???);
// ??? NewEfxopLive(???);
// ??? sub_806EF64(???);
// ??? sub_806EFB8(???);
// ??? sub_806F00C(???);
// ??? sub_806F058(???);
// ??? sub_806F08C(???);
// ??? sub_806F0CC(???);
// ??? sub_806F0FC(???);
// ??? sub_806F118(???);
// ??? sub_806F184(???);
// ??? sub_806F1E8(???);
// ??? NewEfxopLightning(???);
// ??? sub_806F230(???);
// ??? sub_806F248(???);
// ??? sub_806F2A0(???);
// ??? sub_806F304(???);
// ??? sub_806F38C(???);
// ??? sub_806F3F8(???);
// ??? sub_806F450(???);
// ??? sub_806F47C(???);
// ??? sub_806F4B4(???);
// ??? sub_806F4C0(???);
// ??? sub_806F4F8(???);
// ??? sub_806F530(???);
// ??? sub_806F568(???);
// ??? sub_806F594(???);
// ??? NewEfxopMistyrain(???);
// ??? sub_806F5E0(???);
// ??? NewEfxopMyrrh(???);
// ??? sub_806F668(???);
// ??? sub_806F6B4(???);
// ??? sub_806F6D4(???);
// ??? sub_806F6EC(???);
// ??? sub_806F704(???);
// ??? sub_806F75C(???);
// ??? sub_806F7C0(???);
// ??? sub_806F820(???);
// ??? sub_806F844(???);
// ??? sub_806F864(???);
// ??? sub_806F87C(???);
// ??? sub_806F894(???);
// ??? sub_806F8F0(???);
// ??? sub_806F968(???);
// ??? sub_806F9D8(???);
