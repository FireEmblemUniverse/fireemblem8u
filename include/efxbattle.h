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
    STRUCT_PAD(0x36, 0x44);
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
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ void * pal;
    STRUCT_PAD(0x50, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEfxRST
{
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x5C);
    /* 5C */ struct Anim * anim;
    STRUCT_PAD(0x60, 0x64);
    /* 64 */ ProcPtr unk64;
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
    STRUCT_PAD(0x4C, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
};

struct ProcEfxALPHA
{
    PROC_HEADER;

    /* 29 */ u8 unk29;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcEfxSCR
{
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
// extern ??? gSoundRoomVolumeGraphBuffer
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
// extern ??? gUnknown_085B9E4C
extern u16 Img_NODAMGEMIS[];
extern u16 Pal_085BA2E0[];
extern u16 Pal_085BA300[];
extern u16 Pal_085BA320[];
// extern ??? gUnknown_085BA340
extern u16 Img_LvupApfx[];
extern u16 Pal_LvupApfx[];
// extern ??? gUnknown_085BC188
// extern ??? gUnknown_085BE7F4
// extern ??? gUnknown_085BEF94
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
// extern ??? gUnknown_085C72AC
// extern ??? gUnknown_085C7338
// extern ??? gUnknown_085C73B8
// extern ??? gUnknown_085C7438
extern u32 AnimScr_NoDamage[];
extern u32 AnimScr_Miss[];
extern u8 Img_EkrLvupNumBig[];
extern AnimScr gUnknown_085C9270[];
extern AnimScr gUnknown_085C92A0[];
extern AnimScr gUnknown_085C92D0[];
extern AnimScr gUnknown_085C92EC[];
extern AnimScr gUnknown_085C9328[];
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
extern u16 Img_SpellJavelinPrgasusKnight[];
extern u16 Pal_SpellJavelinPrgasusKnight[];
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
extern u32 AnimScr_085DC244[];
extern u32 AnimScr_085DC498[];
extern u32 AnimScr_085DC6F8[];
extern u32 AnimScr_085DC958[];
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
extern u16 Pal_085E8108[];
extern u16 gUnknown_085E8308[];
extern u16 gUnknown_085E87A8[];
extern u16 gUnknown_085E8C04[];
extern u16 gUnknown_085E8CC4[];
extern u16 gUnknown_085E8CE4[];
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
extern u16 Img_BoltingSprites[];
extern u16 Pal_BoltingSprites[];
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
extern u32 gUnknown_0860A5D4[]; // script
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
extern u32 gUnknown_0861ACB8[]; // script
extern u8 gUnknown_0861AD24[]; // script
extern u32 gUnknown_0861AD84[]; // script
extern u32 gUnknown_0861AD8C[]; // script
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
extern u32 gUnknown_08625094[];
extern u32 gUnknown_08625148[];
extern u32 gUnknown_086267D8[];
extern u32 gUnknown_0862688C[];
extern u16 Img_08626944[];
extern u16 Img_08627514[];
extern u16 Img_08628224[];
extern u16 Img_08629480[];
extern u16 Img_08629B04[];
extern u16 Img_0862A060[];
extern u16 gUnknown_0862A2D0[];
extern u16 gUnknown_0862A2F0[];
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
extern u32 gUnknown_0862D6A8[];
extern u32 gUnknown_0862D6E0[];
extern u32 gUnknown_0862D82C[];
extern u32 gUnknown_0862DC24[];
extern u32 gUnknown_0862DC58[];
extern u32 gUnknown_0862DCE0[];
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
extern u32 gUnknown_08646510[];
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
extern u32 gUnknown_086517DC[];
extern u32 gUnknown_08651AE4[];
extern u32 gUnknown_08651DE0[];
extern u16 Img_FenrirBg_Sigils[];
extern u16 gUnknown_08652554[];
extern u16 Tsa_FenrirBg_Sigils[];
extern u16 Img_08652948[];
extern u16 Img_08653B60[];
extern u16 Img_08654EB0[];
extern u16 Img_08655D2C[];
extern u16 Pal_FenrirBg[];
extern u16 gUnknown_08656914[];
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
extern u32 gUnknown_0865C77C[];
extern u32 gUnknown_0865C7A8[];
extern u32 gUnknown_0865C7D4[];
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
extern u32 gUnknown_0866F58C[];
extern u16 gUnknown_0866F5E4[];
extern u16 * gUnknown_0866F774[];
extern u16 gUnknown_086700D4[];
extern u16 gUnknown_086702D4[];
extern u16 Pal_FimbulvetrSprites_Snow[];
extern u16 gUnknown_08670548[];
extern u16 * gUnknown_08670D40[];
extern u16 * gUnknown_086716A0[];
extern u16 gUnknown_08672000[];
extern u16 gUnknown_08672220[];
extern u32 gUnknown_08675114[];
extern u32 gUnknown_086751A4[];
extern u32 gUnknown_086766C0[];
extern u32 gUnknown_08676734[];
extern u32 gUnknown_08677CC0[];
extern u32 gUnknown_08677D34[];
extern u16 Tsa_08677E80[];
extern u16 Tsa_08677F8C[];
extern u16 Tsa_0867808C[];
extern u16 Tsa_08678198[];
extern u16 Tsa_086782A4[];
extern u16 gUnknown_08678720[];
extern u16 gUnknown_08678920[];
extern u16 gUnknown_08678B20[];
extern u16 Img_08679B04[];
extern u16 Img_0867A130[];
extern u16 Img_0867A828[];
extern u16 Img_0867AE48[];
extern u16 gUnknown_0867B5A4[];
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
extern u32 gUnknown_0867EE04[];
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
extern u32 gUnknown_08680FFC[];
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
extern u32 gUnknown_08684908[];
extern u16 Img_086849B8[];
extern u16 gUnknown_08684AB8[];
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
extern u32 gUnknown_0868C168[];
extern u32 gUnknown_0868C2E8[];
extern u16 Pal_BerserkBg[];
extern u16 Img_BerserkSprites_A[];
extern u16 Img_BerserkSprites_B[];
extern u16 Pal_BerserkSprites[];
extern u32 gUnknown_0868D2B4[];
extern u32 gUnknown_0868D2C8[];
extern u32 gUnknown_0868D2DC[];
extern u32 gUnknown_0868D2F0[];
extern u32 gUnknown_0868D304[];
extern u32 gUnknown_0868D678[];
extern u32 gUnknown_0868D684[];
extern u32 gUnknown_0868D690[];
extern u32 gUnknown_0868D69C[];
extern u32 gUnknown_0868D6A8[];
extern u16 Img_BarrierBg[];
extern u16 Pal_BarrierBg[];
extern u16 Tsa_0868DF9C[];
extern u16 Tsa_0868E054[];
extern u16 Tsa_0868E118[];
extern u16 Tsa_0868E208[];
extern u16 Tsa_0868E338[];
extern u16 gUnknown_0868E46C[];
extern u32 gUnknown_08692524[];
extern u32 gUnknown_08692674[];
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
extern u16 Img_08723274[];
extern u16 Pal_efxExcaliburBG0[];
extern u16 Tsa_08724444[];
// extern ??? gUnknown_087246D8
// extern ??? gUnknown_08725AD0
// extern ??? gUnknown_08725AF0
// extern ??? gUnknown_08725DAC
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
extern u32 gUnknown_08728C04[];
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
extern u32 gUnknown_0872DFEC[];
extern u32 gUnknown_0872E024[];
extern u32 gUnknown_0872E24C[];
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
extern u32 gUnknown_087312BC[];
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
extern u32 gUnknown_087456E8[];
extern u32 gUnknown_08746508[];
extern u32 gUnknown_0874670C[];
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
extern u16 gUnknown_08751808[];
extern u16 gUnknown_08751DB4[];
extern u32 gUnknown_08752020[];
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
