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
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ u32 unk48;
    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
    /* 54 */ s16 * unk54;
    /* 58 */ s16 ** unk58;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x44);
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
    STRUCT_PAD(0x2E, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_config;
    /* 4C */ void *unk4C;
    STRUCT_PAD(0x50, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEfxOBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
    STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
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
    /* 14 */ struct Anim * anim1;
    /* 18 */ struct Anim * anim2;
    /* 1C */ void * u1c;
    /* 20 */ void * u20;
    /* 24 */ void * u24;
    /* 28 */ void * u28;
    /* 2C */ void * _u2c;
    /* 30 */ struct Unknown_030053E0 * u30;
};

extern struct Unknown_030053A0 gUnknown_030053A0;

struct Unknown_0201FADC {
    /* 00 */ u16 things[8];
    /* 10 */ u16 _pad_10;
    /* 14 */ ProcPtr p1;
    /* 18 */ ProcPtr p2;
    /* 1c */ u32 u1c;
    /* 20 */ u8 * u20;
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
    /* 14 */ void * unk14;
    /* 18 */ void * unk18;
    /* 1C */ void * unk1C;
    /* 20 */ void * unk20;
    /* 24 */ void * unk24;
};
extern struct Struct20200E0 gUnknown_020200E0;

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

struct ProcEfxHPBarColorChange {
    PROC_HEADER;

    /* 29 */ u8 unk29;

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


extern struct ProcEfxHPBarColorChange * gpProcEfxHPBarColorChange;

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
    /* 5C */ struct Anim * anim5C;
    /* 60 */ struct Anim * anim60;
    /* 64 */ struct Anim * anim64;
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
u32 GettUnitEfxDebuff(struct Anim * anim);
void EfxStatusUnitSomePalModify(struct Anim * anim, int, int, int);
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

void sub_806E8F0(void);
void sub_806E904(void);
void sub_806E920(void);

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

extern u16 gEfxPal[];
// extern ??? gUnknown_02016828
extern u16 gObjBuf_EkrSideHitDmgCrit[];
extern u16 gUnknown_02016DC8[];
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
extern u32 gEkrInitPosReal;
extern u32 gUnknown_02017748;
extern u32 gEfxBgSemaphore;
extern u32 gUnknown_02017750;
extern u32 gUnknown_02017754;
extern u32 gUnknown_02017758;
extern u32 gUnknown_0201775C;
struct Vec2 gEkrBg2QuakeVec;
extern s16 gUnknown_02017764[2];
extern s16 gUnknown_02017768[2];

extern s16 gEkrHitEfxBool[];     /* [0] for left and [1] for right, if in hit routine, 1, otherwise 0 */
extern u8 gEkrBuf1[];
extern u16 gEkrBarfxBuf[];
extern u16 gEkrTsaBuffer[0x1000 / 2];
extern u8 gEkrBuf2[];
// extern ??? gFont_0201AFC0
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
extern u16 gEfxBuf_0201C8D0[0xB58 / sizeof(u16)];
extern u16 gUnknown_0201CDD4[]; // used as a palette buffer in opsubtitle
extern u16 gEfxFrameTmap[0x2520 / 2];
// extern ??? gUnknown_0201D438
extern u16 gUnknown_0201D46A[];
// extern ??? gUnknown_0201DB00
// extern ??? gUnknown_0201DB28
// extern ??? gUnknown_0201F148
// extern ??? gUnknown_0201F160
// extern ??? gUnknown_0201F198
// extern ??? gUnknown_0201F19C
extern u8 gEfxSplitedColorBuf[];
extern u8 gUnknown_0201F978[];
extern u16 gUnknown_0201F9A8[];
extern u8 gUnknown_0201FA08[];
extern u8 gUnknown_0201FA38[];
extern u16 gUnknown_0201FA68[];
extern int gUnknown_0201FAC8;

extern u32 gUnknown_0201FAD8;

// extern ??? ProcScr_efxMaohFlash
// extern ??? ProcScr_efxMaohFlashBG1
// extern ??? gUnknown_085D788C
// extern ??? gUnknown_085D790C
// extern ??? gUnknown_085D798C
// extern ??? gUnknown_085D7A0C
// extern ??? gUnknown_085D7A8C
// extern ??? gUnknown_085D7B0C
// extern ??? ProcScr_efxMaohFlashBG2
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
// extern ??? ProcScr_efxMaohFlashBG4
// extern ??? gUnknown_085D7C70
// extern ??? gUnknown_085D7C90
// extern ??? gUnknown_085D7CB0
// extern ??? gUnknown_085D7CD0
// extern ??? gUnknown_085D7CF0
// extern ??? gUnknown_085D7D10
// extern ??? ProcScr_efxMaohFlashWOUT
// extern ??? ProcScr_efxMaohFlashBGCOL
// extern ??? ProcScr_efxMaohFlashEyeROBJ2
// extern ??? ProcScr_efxMaohFlashEyeLOBJ2
// extern ??? ProcScr_efxMaohFlashEyeOBJ1
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

// extern ??? gUnknown_080DF644
// extern ??? gUnknown_080DF6A8
// extern ??? gUnknown_080DF6C6
// extern ??? gUnknown_080DF730
// extern ??? gUnknown_080DF748
// extern ??? gUnknown_080DF7CE
// extern ??? gUnknown_080DF866
// extern ??? gUnknown_080DF898
// extern ??? gUnknown_080DF954
// extern ??? gUnknown_080DF9BE
extern u16 gUnknown_080E1164[];
extern const u16 gBarfxTileConf1[];
extern const u16 gBarfxTileConf2[];
extern const u16 gBarfxTileConf3[];
extern const s16 gAnimSpriteRotScalePosX[];
extern const s16 gAnimSpriteRotScalePosY[];
extern const u16 FrameLut_080E143A[];
extern const u16 FrameLut_080E1488[];
// extern ??? sEfxLvupPartsPos
// extern ??? gUnknown_080E162A
// extern ??? gUnknown_080E1664
// extern ??? gUnknown_080E169A
// extern ??? gUnknown_080E16DC
extern const s16 FrameLut_EkrTriPegagusBG1[];
extern const s16 FrameLut_EkrTriPegagusBG2[];
extern const u16 gUnknown_080E17C0[];
extern const u16 gUnknown_080E2164[];
extern const u16 gUnknown_080E2B54[];

/* Imgs */
extern const u16 gUnknown_080E3554[];
extern const u16 gUnknown_080E3668[];
extern const u16 gUnknown_080E378C[];
extern const u16 gUnknown_080E3864[];
extern const u16 gUnknown_080E3980[];
extern const u16 gUnknown_080E3AA4[];

extern const u16 gUnknown_080E3B78[];
extern const u16 gUnknown_080E4530[];
extern const u16 gUnknown_080E4EFC[];
extern const u16 gUnknown_080E58A4[];
extern const u16 gUnknown_080E5BC4[];
extern const u16 gUnknown_080E5F98[];
extern const u16 gUnknown_080E63CC[];
extern const u16 gUnknown_080E678C[];
extern const u16 gUnknown_080E6CC4[];
extern const u16 gUnknown_080E7400[];
extern const u16 gUnknown_080E7B8C[];

extern char gNopStr[];
// extern ??? gUnknown_085B9E4C
extern u16 gUnknown_085BA0B8[];
extern u16 Pal_085BA2E0[];
extern u16 Pal_085BA300[];
extern u16 Pal_085BA320[];
// extern ??? gUnknown_085BA340
extern u16 gUnknown_085BB0C8[];
extern u16 gUnknown_085BB2DC[];
// extern ??? gUnknown_085BC188
// extern ??? gUnknown_085BE7F4
// extern ??? gUnknown_085BEF94
// extern ??? gUnknown_085C48AC
// extern ??? gUnknown_085C5994
// extern ??? gUnknown_085C6054
// extern ??? gUnknown_085C60D4
// extern ??? gUnknown_085C6730
// extern ??? gUnknown_085C71E4
// extern ??? gUnknown_085C72AC
// extern ??? gUnknown_085C7338
// extern ??? gUnknown_085C73B8
// extern ??? gUnknown_085C7438
extern u32 AnimScr_085C81A4[];
extern u32 AnimScr_085C8218[];
// extern ??? gUnknown_085C8278
// extern ??? gUnknown_085C9270
// extern ??? gUnknown_085C92A0
// extern ??? gUnknown_085C92D0
// extern ??? gUnknown_085C92EC
// extern ??? gUnknown_085C9328
extern u16 gUnknown_085CFB70[];
extern u16 gUnknown_085D0820[];
extern u16 gUnknown_085D0A20[];
extern u16 gUnknown_085D0CE0[];
extern u16 gUnknown_085D0FD0[];
extern u16 gUnknown_085D1470[];
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

// extern ??? gUnknown_085D99EC
// extern ??? gUnknown_085D9A1C
// extern ??? gUnknown_085D9A2C
// extern ??? gUnknown_085D9A94
// extern ??? gUnknown_085D9AFC
// extern ??? gUnknown_085D9B64
// extern ??? gUnknown_085D9B74
// extern ??? gUnknown_085D9BA4
// extern ??? gUnknown_085D9BB4
// extern ??? gUnknown_085D9C00
// extern ??? gUnknown_085D9C4C
// extern ??? gUnknown_085D9C5C
// extern ??? gUnknown_085DA05C
// extern ??? gUnknown_085DA364
// extern ??? gUnknown_085DA3C0
// extern ??? gUnknown_085DA3E0
// extern ??? gUnknown_085DA6FC
// extern ??? gUnknown_085DA758
// extern ??? gUnknown_085DA778
// extern ??? gUnknown_085DA7AC
// extern ??? gUnknown_085DA854
// extern ??? gUnknown_085DA864
// extern ??? gUnknown_085DA8E0
// extern ??? gUnknown_085DA8F0
// extern ??? gUnknown_085DA900
// extern ??? gUnknown_085DAB30
// extern ??? gUnknown_085DAB50
// extern ??? gUnknown_085DAD6C
// extern ??? gUnknown_085DAD8C
// extern ??? gUnknown_085DAFA4
// extern ??? gUnknown_085DAFC4
// extern ??? gUnknown_085DB1E0
// extern ??? gUnknown_085DB200
// extern ??? gUnknown_085DB42C
// extern ??? gUnknown_085DB44C
// extern ??? gUnknown_085DB694
// extern ??? gUnknown_085DB6B4
// extern ??? gUnknown_085DB8EC
// extern ??? gUnknown_085DB90C
// extern ??? gUnknown_085DBB70
// extern ??? gUnknown_085DBB90
// extern ??? gUnknown_085DBE00
// extern ??? gUnknown_085DBE20
// extern ??? gUnknown_085DC050
// extern ??? gUnknown_085DC244
// extern ??? gUnknown_085DC498
// extern ??? gUnknown_085DC6F8
// extern ??? gUnknown_085DC958
// extern ??? gUnknown_085DCA5C
// extern ??? gUnknown_085DCAF8
extern u16 gUnknown_085DCB10[];
extern u16 gUnknown_085DCC84[];
extern u32 gUnknown_085DD484[];
extern u32 gUnknown_085DD4B4[];
// extern ??? gUnknown_085DDC64
// extern ??? gUnknown_085DE964
extern u16 gUnknown_085DE984[];
extern u16 gUnknown_085DF224[];
extern u16 gUnknown_085DFA08[];
// extern ??? gUnknown_085DFA28
// extern ??? gUnknown_085DFA48
// extern ??? gUnknown_085DFA68
// extern ??? gUnknown_085E067C
// extern ??? gUnknown_085E12DC
extern u32 gUnknown_085E15F4[];
extern u32 gUnknown_085E163C[];
extern u32 gUnknown_085E1960[];
extern u32 gUnknown_085E19A8[];
extern u32 gUnknown_085E1C48[];
extern u32 gUnknown_085E1C58[];
extern u32 gUnknown_085E1EA4[];
extern u32 gUnknown_085E1EB4[];
// extern ??? gUnknown_085E2A24
// extern ??? gUnknown_085E35DC
// extern ??? gUnknown_085E420C
// extern ??? gUnknown_085E4E3C
// extern ??? gUnknown_085E5A78
// extern ??? gUnknown_085E5AE4
extern u16 gUnknown_085E7028[];
extern u16 gUnknown_085E8108[];
extern u16 gUnknown_085E8308[];
extern u16 gUnknown_085E87A8[];
extern u16 gUnknown_085E8C04[];
extern u16 gUnknown_085E8CC4[];
extern u16 gUnknown_085E8CE4[];
extern u16 gUnknown_085E8D88[];
extern u16 gUnknown_085E9150[];
extern u32 gUnknown_085EAB58[];
extern u32 gUnknown_085EAC5C[];
extern u32 gUnknown_085EAC84[];
extern u32 gUnknown_085EBDF8[];
extern u32 gUnknown_085EBEFC[];
extern u32 gUnknown_085EBF24[];
extern u32 gUnknown_085ED0C8[];
extern u32 gUnknown_085ED1CC[];
extern u32 gUnknown_085ED1F4[];
extern u32 gUnknown_085EE398[];
extern u32 gUnknown_085EE49C[];
extern u32 gUnknown_085EE4C4[];
extern u16 gUnknown_085EE4F8[];
extern u16 gUnknown_085EF24C[];
extern u16 gUnknown_085F0190[];
extern u16 gUnknown_085F0E04[];
extern u16 gUnknown_085F11B0[];
extern u16 gUnknown_085F1620[];
extern u16 gUnknown_085F1640[];
extern u16 gUnknown_085F1660[];
extern u32 gUnknown_085F1710[];
extern u32 gUnknown_085F17B4[];
extern u32 gUnknown_085F1858[];
extern u32 gUnknown_085F18FC[];
extern u32 gUnknown_085F19A0[];
extern u32 gUnknown_085F1A44[];
extern u32 gUnknown_085F1BD8[];
extern u32 gUnknown_085F1D6C[];
extern u32 gUnknown_085F1F18[];
extern u32 gUnknown_085F20C4[];
extern u32 gUnknown_085F2270[];
extern u32 gUnknown_085F2418[];
extern u32 gUnknown_085F24F4[];
extern u32 gUnknown_085F25D8[];
extern u32 gUnknown_085F26E0[];
extern u32 gUnknown_085F27E4[];
extern u32 gUnknown_085F29C0[];
extern u32 gUnknown_085F2C3C[];
extern u32 gUnknown_085F2D44[];
extern u32 gUnknown_085F2DAC[];
extern u16 gUnknown_085F2DC0[];
extern u16 gUnknown_085F367C[];
extern u16 gUnknown_085F3AA8[];
extern u16 gUnknown_085F3F40[];
extern u32 gUnknown_085F4A24[];
extern u32 gUnknown_085F5550[];
extern u16 gUnknown_085F5638[];
extern u16 gUnknown_085F6230[];
extern u16 gUnknown_085F7768[];
extern u16 gUnknown_085F7D64[];
extern u32 gUnknown_085F80B4[];
extern u32 gUnknown_085F80E0[];
extern u32 gUnknown_085F843C[];
extern u32 gUnknown_085F8468[];
extern u16 gUnknown_0860108C[];
extern u16 gUnknown_08602B94[];
extern u16 gUnknown_08603B50[];
extern u16 gUnknown_08603D50[];
extern u16 gUnknown_08603F98[];
extern u16 gUnknown_08604210[];
extern u32 gUnknown_08604FD4[];
extern u32 gUnknown_08605DF4[];
// extern ??? gUnknown_08608838
// extern ??? gUnknown_0860A5D4
// extern ??? gUnknown_086101DC
// extern ??? gUnknown_08617F04
// extern ??? gUnknown_08618BBC
// extern ??? gUnknown_0861ACB8
// extern ??? gUnknown_0861AD24
// extern ??? gUnknown_0861AD84
// extern ??? gUnknown_0861AD8C
// extern ??? gUnknown_08621960
// extern ??? gUnknown_08622F2C
// extern ??? gUnknown_086234D8
// extern ??? gUnknown_08623A9C
// extern ??? gUnknown_08625094
// extern ??? gUnknown_08625148
// extern ??? gUnknown_086267D8
// extern ??? gUnknown_0862688C
// extern ??? gUnknown_0862A2D0
// extern ??? gUnknown_0862A2F0
// extern ??? gUnknown_0862C82C
// extern ??? gUnknown_0862CC2C
// extern ??? gUnknown_0862D06C
// extern ??? gUnknown_0862D424
// extern ??? gUnknown_0862D6A8
// extern ??? gUnknown_0862D6E0
// extern ??? gUnknown_0862D82C
// extern ??? gUnknown_0862DC24
// extern ??? gUnknown_0862DC58
// extern ??? gUnknown_0862DCE0
// extern ??? gUnknown_08636640
// extern ??? gUnknown_08641D64
// extern ??? gUnknown_08641D84
// extern ??? gUnknown_08645DD8
// extern ??? gUnknown_08645F44
// extern ??? gUnknown_08646510
// extern ??? gUnknown_0864E790
// extern ??? gUnknown_0864E7B0
// extern ??? gUnknown_086508DC
// extern ??? gUnknown_08650DA8
// extern ??? gUnknown_08651240
// extern ??? gUnknown_0865163C
// extern ??? gUnknown_086517DC
// extern ??? gUnknown_08651AE4
// extern ??? gUnknown_08651DE0
// extern ??? gUnknown_08651DF4
// extern ??? gUnknown_08652554
// extern ??? gUnknown_08652734
// extern ??? gUnknown_086568F4
// extern ??? gUnknown_08656914
// extern ??? gUnknown_0865AF3C
// extern ??? gUnknown_0865BAB8
// extern ??? gUnknown_0865BAD8
// extern ??? gUnknown_0865C77C
// extern ??? gUnknown_0865C7A8
// extern ??? gUnknown_0865C7D4
// extern ??? gUnknown_0866EFF0
// extern ??? gUnknown_0866F2B4
// extern ??? gUnknown_0866F58C
// extern ??? gUnknown_0866F5E4
// extern ??? gUnknown_0866F774
// extern ??? gUnknown_086700D4
// extern ??? gUnknown_086702D4
// extern ??? gUnknown_08670528
// extern ??? gUnknown_08670548
// extern ??? gUnknown_08670D40
// extern ??? gUnknown_086716A0
// extern ??? gUnknown_08672000
// extern ??? gUnknown_08672220
// extern ??? gUnknown_08675114
// extern ??? gUnknown_086751A4
// extern ??? gUnknown_086766C0
// extern ??? gUnknown_08676734
// extern ??? gUnknown_08677CC0
// extern ??? gUnknown_08677D34
// extern ??? gUnknown_08678720
// extern ??? gUnknown_08678920
// extern ??? gUnknown_08678B20
// extern ??? gUnknown_0867B5A4
// extern ??? gUnknown_0867EE04
// extern ??? gUnknown_0867EEB4
// extern ??? gUnknown_086808A0
// extern ??? gUnknown_08680DC0
// extern ??? gUnknown_08680FFC
// extern ??? gUnknown_086810B8
// extern ??? gUnknown_08684908
extern u16 Img_086849B8[];
extern u16 gUnknown_08684AB8[];
// extern ??? gUnknown_086852D8
// extern ??? gUnknown_086861A4
// extern ??? gUnknown_08686F84
// extern ??? gUnknown_0868716C
// extern ??? gUnknown_0868718C
// extern ??? gUnknown_0868C168
// extern ??? gUnknown_0868C2E8
// extern ??? gUnknown_0868C338
// extern ??? gUnknown_0868C358
// extern ??? gUnknown_0868C7F0
// extern ??? gUnknown_0868CC10
// extern ??? gUnknown_0868D2B4
// extern ??? gUnknown_0868D2C8
// extern ??? gUnknown_0868D2DC
// extern ??? gUnknown_0868D2F0
// extern ??? gUnknown_0868D304
// extern ??? gUnknown_0868D678
// extern ??? gUnknown_0868D684
// extern ??? gUnknown_0868D690
// extern ??? gUnknown_0868D69C
// extern ??? gUnknown_0868D6A8
// extern ??? gUnknown_0868D6D0
// extern ??? gUnknown_0868DF5C
// extern ??? gUnknown_0868E46C
// extern ??? gUnknown_08692524
// extern ??? gUnknown_08692674
// extern ??? gUnknown_086926E0
// extern ??? gUnknown_08692B10
// extern ??? gUnknown_086937C0
// extern ??? gUnknown_086945C4
// extern ??? gUnknown_08695B10
// extern ??? gUnknown_08696840
// extern ??? gUnknown_086A06A8
// extern ??? gUnknown_086A1CE0
// extern ??? gUnknown_086A21F4
// extern ??? gUnknown_086A2614
// extern ??? gUnknown_086A2724
// extern ??? gUnknown_086A273C
// extern ??? gUnknown_086A2844
// extern ??? gUnknown_086A285C
// extern ??? gUnknown_086A2874
// extern ??? gUnknown_086A2CE8
// extern ??? gUnknown_086A2DBC
// extern ??? gUnknown_086A2DD0
// extern ??? gUnknown_086A2E98
// extern ??? gUnknown_086A2EAC
// extern ??? gUnknown_086A66D8
// extern ??? gUnknown_086B52CC
// extern ??? gUnknown_086B5580
// extern ??? gUnknown_086B58DC
// extern ??? gUnknown_086B5974
// extern ??? gUnknown_086B5984
// extern ??? gUnknown_086B598C
// extern ??? gUnknown_086B5A2C
// extern ??? gUnknown_086B5A4C
// extern ??? gUnknown_086B5EAC
// extern ??? gUnknown_086BC824
// extern ??? gUnknown_086BD260
// extern ??? gUnknown_086BD76C
// extern ??? gUnknown_086BDA5C
// extern ??? gUnknown_086C790C
// extern ??? gUnknown_086C792C
// extern ??? gUnknown_086C794C
// extern ??? gUnknown_086C90A4
// extern ??? gUnknown_086C93FC
// extern ??? gUnknown_086C95C0
// extern ??? gUnknown_086C978C
// extern ??? gUnknown_086D8A94
// extern ??? gUnknown_086D9C40
// extern ??? gUnknown_086DA33C
// extern ??? gUnknown_086DA920
// extern ??? gUnknown_086E7EB0
// extern ??? gUnknown_086E91B8
// extern ??? gUnknown_086E9D40
// extern ??? gUnknown_086EA3EC
// extern ??? gUnknown_086EAE14
// extern ??? gUnknown_086EAE24
// extern ??? gUnknown_086FDA44
// extern ??? gUnknown_086FE938
// extern ??? gUnknown_086FF3A4
// extern ??? gUnknown_086FF5EC
// extern ??? gUnknown_086FFD3C
// extern ??? gUnknown_087013A0
// extern ??? gUnknown_087197E4
// extern ??? gUnknown_08720D84
// extern ??? gUnknown_08723208
// extern ??? gUnknown_08724424
// extern ??? gUnknown_087246D8
// extern ??? gUnknown_08725AD0
// extern ??? gUnknown_08725AF0
// extern ??? gUnknown_08725DAC
// extern ??? gUnknown_08725DCC
// extern ??? gUnknown_08726FF4
// extern ??? gUnknown_087270B4
// extern ??? gUnknown_08727510
// extern ??? gUnknown_0872796C
// extern ??? gUnknown_08727C48
// extern ??? gUnknown_0872865C
// extern ??? gUnknown_08728920
// extern ??? gUnknown_08728C04
// extern ??? gUnknown_08728C5C
// extern ??? gUnknown_0872972C
// extern ??? gUnknown_0872987C
// extern ??? gUnknown_08729FDC
// extern ??? gUnknown_0872A1BC
// extern ??? gUnknown_0872CE60
// extern ??? gUnknown_0872DA04
// extern ??? gUnknown_0872DE04
// extern ??? gUnknown_0872DFEC
// extern ??? gUnknown_0872E024
// extern ??? gUnknown_0872E24C
// extern ??? gUnknown_0872E25C
// extern ??? gUnknown_0872E64C
// extern ??? gUnknown_0872E7EC
extern u16 gUnknown_0872E998[];
// extern ??? gUnknown_0872FA04
// extern ??? gUnknown_0872FA84
// extern ??? gUnknown_0872FEB8
// extern ??? gUnknown_087302A4
// extern ??? gUnknown_08730324
// extern ??? gUnknown_08730780
// extern ??? gUnknown_087312BC
// extern ??? gUnknown_08731348
// extern ??? gUnknown_087313C8
// extern ??? gUnknown_08732228
// extern ??? gUnknown_08732368
// extern ??? gUnknown_087327C4
// extern ??? gUnknown_0873313C
// extern ??? gUnknown_0874394C
extern u32 gUnknown_087456E8[];
extern u32 gUnknown_08746508[];
extern u32 gUnknown_0874670C[];
// extern ??? gUnknown_08750268
// extern ??? gUnknown_08751808
// extern ??? gUnknown_08751DB4
// extern ??? gUnknown_08752020
// extern ??? gUnknown_08754870
// extern ??? gUnknown_08755FD4
// extern ??? gUnknown_08758134
extern u16 gUnknown_08758218[];
extern u32 gUnknown_087584B8[];
extern u32 gUnknown_087585DC[];
// extern ??? gEkrDracoZombiTsaSetLut
extern struct ProcCmd ProcScr_EkrDracoZombie[];
extern struct ProcCmd ProcScr_ekrDragonQuake[];
extern struct ProcCmd ProcScr_ekrWhiteINOUT[];
// extern ??? gUnknown_08758720
// extern ??? gUnknown_08758740
// extern ??? ProcScr_EkrMyrrh
extern struct ProcCmd ProcScr_EkrMyrrh[];
extern s16 gUnknown_0875879C[];
extern u16 gEfxTileRefPals_08758A1C[];
extern struct ProcCmd ProcScr_ekrsubAnimeEmulator[];
extern struct ProcCmd ProcScr_efxSoundSE[];
// extern ??? gUnknown_08758A60
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
// extern ??? ProcScr_EkrLevelup
// extern ??? ProcScr_EfxPartsofScroll
// extern ??? ProcScr_EfxPartsofScroll2
// extern ??? gUnknown_0875941C
// extern ??? ProcScr_Efxleveluphb
// extern ??? ProcScr_Efxlvupbg
// extern ??? gUnknown_0875949C
// extern ??? gUnknown_087594C8
// extern ??? ProcScr_efxLvupBG2
// extern ??? gUnknown_0875950C
// extern ??? ProcScr_efxLvupOBJ2
// extern ??? ProcScr_efxLvupBGCOL
// extern ??? ProcScr_EkrLvupApfx
// extern ??? ProcScr_eobjLvup

extern u32 BanimScr_08759B34[];
extern u32 BanimScr_08759E68[];
extern u32 gUnknown_08759F00[];
extern u32 gUnknown_08759F90[];
extern u32 gUnknown_0875A020[];
extern u32 gUnknown_0875A0AC[];
extern u32 BanimScr_0875A19C[];
extern u32 BanimScr_0875A314[];
extern u32 BanimScr_0875A468[];
extern u32 BanimScr_0875A730[];
extern u16 *gBattleBGDataTable[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup2[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[];

extern u16 gUnknown_08801C14[];
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
extern u16 gUnknown_08802D24[];

void EkrEfxStatusClear(void);
int CheckEkrHitDone(void);
short EkrEfxIsUnitHittedNow(int pos);
void NewEfxHPBar(struct Anim * anim);
void EfxHp_BarDeclineWithDeathJudge(struct ProcEfxHPBar * proc);
void efxHPBarMain(struct ProcEfxHPBar * proc);
void efxHPBarWaitForFarFarCamMoveMaybe(struct ProcEfxHPBar * proc);
void NewEfxHPBarResire(struct Anim * anim);
void EfxHPBarResire_80526C8(struct ProcEfxHPBar * proc);
void EfxHPBarResire_8052788(struct ProcEfxHPBar * proc);
void EfxHPBarResire_805282C(struct ProcEfxHPBar * proc);
void NewEfxAvoid(struct Anim * anim);
void EfxAvoidMain(struct ProcEfxHPBar * proc);
void NewEfxHPBarLive(struct Anim * anim);
void EfxHPBarLiveMain(struct ProcEfxHPBar * proc);
void NewEfxNoDmage(struct Anim * anim1, struct Anim * anim2, int death);
void EfxNoDamageMain(struct ProcEfxHPBar * proc);
void NewEfxNoDamageYure(struct Anim * anim1, struct Anim * anim2);
void EfxNoDamageYureMain(struct ProcEfxHPBar * proc);
void NewEfxStatusCHG(struct Anim * anim);
void EfxStatusCHGMain(struct ProcEfxHPBar * proc);
void NewEfxFarAttackWithDistance(struct Anim * anim, int arg);
// ??? sub_80534AC(???);
// ??? sub_80534E4(???);
// ??? sub_8053514(???);
// ??? sub_8053584(???);
void sub_8053618();
ProcPtr NewEfxQuakePure(int, int);
// ??? sub_80536B8(???);
// ??? NewEfxHitQuakePure(???);
// ??? nullsub_56(???);
ProcPtr NewEfxQuake(int);
// ??? sub_805382C(???);
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int);
// ??? sub_8053BBC(???);
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
void NewEfxHPBarColorChange(struct Anim * anim);
void EndEfxHPBarColorChange(void);
void EfxHPBarColorChangeSet29(void);
void EfxHPBarColorChangeClear29(void);
void EfxHPBarColorChangeMain(struct ProcEfxHPBarColorChange * proc);
void NewEfxFlashUnit(struct Anim * anim, int a, int b, int c);
void EfxFlashUnitMain(struct ProcEfxFlashing * proc);
void EfxFlashUnitRestorePal(struct ProcEfxFlashing * proc);
void NewEfxFlashUnitEffectEnd(struct Anim * anim, int dura1, int dura2, int c);
void EfxFlashUnitEffectMain(struct ProcEfxFlashing * proc);
void EfxFlashUnitEffectRestorePal(struct ProcEfxFlashing * proc);

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
void NewEfxDamageMojiEffect(struct Anim * anim, int hitted);
// ??? efxDamageMojiEffectMain(???);
void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted);
// ??? efxDamageMojiEffectOBJMain(???);
void NewEfxPierceCritical(struct Anim * anim);
// ??? efxCriricalEffectMain(???);
void NewEfxCriricalEffectBG(struct Anim * anim);
// ??? efxCriricalEffectBGMain(???);
void NewEfxCriricalEffectBGCOL(struct Anim * anim);
// ??? efxCriricalEffectBGCOLMain(???);
void NewEfxNormalEffect(struct Anim * anim);
// ??? efxNormalEffectMain(???);
void NewEfxNormalEffectBG(struct Anim * anim);
// ??? efxNormalEffectBGMain(???);
void NewEfxPierceCriticalEffect(struct Anim * anim);
// ??? efxPierceCriticalEffectMain(???);
void NewEfxPierceCriticalEffectBG(struct Anim * anim);
// ??? efxPierceCriticalEffectBGMain(???);
void NewEfxPierceCriticalEffectBGCOL(struct Anim * anim);
// ??? efxPierceCriticalEffectBGCOLMain(???);
void NewEfxPierceNormalEffect(struct Anim * anim);
// ??? efxPierceNormalEffectMain(???);
void NewEfxPierceNormalEffectBG(struct Anim * anim);
// ??? efxPierceNormalEffectBGMain(???);
void NewEfxYushaSpinShield(struct Anim * anim, int r1);
// ??? EfxYushaSpinShieldMain(???);
void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int r1);
// ??? efxYushaSpinShieldOBJ_806CD14(???);
// ??? efxYushaSpinShieldOBJ_806CD7C(???);
// ??? efxYushaSpinShieldOBJ_806CDA4(???);
// ??? efxYushaSpinShieldOBJ_806CE08(???);
void NewEfxHurtmutEff00(struct Anim * anim);
// ??? EfxHurtmutEff00Main(???);
void NewEfxHurtmutEff00OBJ(struct Anim * anim);
// ??? efxHurtmutEff00OBJ_806CEC4(???);
// ??? efxHurtmutEff00OBJ_806CF10(???);
// ??? efxHurtmutEff00OBJ_806CF5C(???);
void NewEfxHurtmutEff01OBJ(struct Anim * anim);
// ??? efxHurtmutEff01OBJ_806CFC4(???);
// ??? efxHurtmutEff01OBJ_806D010(???);
// ??? efxHurtmutEff01OBJ_806D05C(???);
void NewEfxMagfcast(struct Anim * anim, int type);
// ??? EfxMagfcastMain(???);
void NewEfxMagfcastBG(struct Anim * anim, u32 type);
// ??? EfxMagfcastBGMain(???);
void NewEfxSunakemuri(struct Anim * anim, int type);
// ??? EfxSunakemuriMain(???);
void NewEfxSunakemuriOBJ(struct Anim * anim, int type);
// ??? EfxSunakemuriOBJMain(???);
void NewEfxLokmsuna(struct Anim * anim);
// ??? EfxLokmsunaMain(???);
void NewEfxLokmsunaOBJ(struct Anim * anim);
// ??? EfxLokmsunaIOBJMain(???);
void NewEfxKingPika(struct Anim * anim);
// ??? EfxKingPikaMain(???);
void NewEfxFlashFX(struct Anim * anim);
// ??? EfxFlashFXMain(???);
void NewEfxSongOBJ2(struct Anim * anim);
void EfxSongOBJ2Main(struct ProcEfxOBJ * proc);
void NewEfxDanceOBJ(struct Anim * anim);
void EfxDanceOBJMain(struct ProcEfxOBJ * proc);
void NewEfxSpecalEffect(struct Anim * anim);
void sub_806D980(ProcPtr proc);
void NewEfxSRankWeaponEffect(struct Anim * anim);
void EfxSRankWeaponEffectMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectBG(struct Anim * anim);
// ??? EfxSRankWeaponEffectBGMain(???);
void NewEfxSRankWeaponEffectSCR(void);
// ??? EfxSRankWeaponEffectSCRMain(???);
void NewEfxSRankWeaponEffectSCR2(struct ProcEfx *seff_scr);
// ??? EfxSRankWeaponEffectSCR2Main(???);
void NewEfxMagdhisEffect(struct Anim * anim);
// ??? EfxMagdhisEffectMain(???);
void NewEfxMagdhisEffectBG(struct Anim * anim, int);
// ??? EfxMagdhisEffectBGMain(???);
void NewEfxMantBatabata(struct Anim * anim);
// ??? sub_806DFA4(???);
// ??? sub_806DFD0(???);
void NewEfxChillEffect(struct Anim * anim);
// ??? EfxChillEffectMain(???);
void NewEfxChillEffectBG(struct Anim * anim);
// ??? EfxChillEffectBGMain(???);
void NewEfxChillEffectBGCOL(struct Anim * anim);
// ??? sub_806E158(???);
void NewEfxChillAnime(struct Anim * anim, int arg1);
// ??? sub_806E290(???);
void nullsub_17(struct Anim * anim);

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
