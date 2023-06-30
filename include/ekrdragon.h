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
    EKRDRGON_ATTR_B12 = 1 << 12,
    EKRDRGON_ATTR_B13 = 1 << 13,
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

    /* 44 */ u32 unk44;
    /* 48 */ const s16 *unk48;
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

    /* 5C */ struct EkrDragonQuakePriv *priv;
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

extern u16 Img_EfxDracoZombie[];
extern u16 Tsa_EfxDracoZombieBaseLeft[];
extern u16 Tsa_EfxDracoZombieBaseRight[];
extern u16 Tsa_EfxDracoZombie1[];
extern u16 Tsa_EfxDracoZombie2[];
extern u16 Tsa_EfxDracoZombie3[];
extern u16 Tsa_EfxDracoZombie4[];
extern u16 Tsa_EfxDracoZombie5[];
extern u16 Pal_EfxDracoZombie[];
// extern ??? gUnknown_08791D7C
// extern ??? gUnknown_08791D9C
// extern ??? gUnknown_08792194
// extern ??? gUnknown_08792928
// extern ??? gUnknown_08792958
// extern ??? gUnknown_08792988
// extern ??? gUnknown_087A4EEC
// extern ??? gUnknown_087A5118
// extern ??? gUnknown_087A5390
// extern ??? gUnknown_087A574C
// extern ??? gUnknown_087A5B5C
// extern ??? gUnknown_087A5BA4
// extern ??? gUnknown_087A5E9C
// extern ??? gUnknown_087A61EC
// extern ??? gUnknown_087F3C54
extern u32 BanimScr_087F4184[];
extern u32 BanimScr_087F4314[];
extern struct ProcCmd ProcScr_EkrDK[];
extern struct ProcCmd ProcScr_ekrDragonBaseHide[];
extern struct ProcCmd ProcScr_ekrDragonBaseAppear[];
extern struct ProcCmd ProcScr_ekrDragonBodyAnime[];
extern u16 *TsaSet_DKBody[];
extern struct ProcCmd ProcScr_ekrDragonBodyUnk1[];
extern struct ProcCmd ProcScr_ekrDragonBodyUnk2[];
extern struct ProcCmd ProcScr_ekrDragonBodyUnk3[];
extern struct ProcCmd ProcScr_ekrDragonBodyUnk4[];
extern struct ProcCmd ProcScr_ekrDragonBodvBlack[];
extern struct ProcCmd ProcScr_087F4518[];
extern struct ProcCmd ProcScr_ekrDragonTunkFace[];
extern struct ProcCmd ProcScr_ekrDragonTunk[];
extern struct ProcCmd ProcScr_ekrWhiteOUT[];
extern u16 Tsa_087F45D0[];
extern u16 Img_DemonKingBG[];
extern u16 Tsa_DemonKingBG1[];
extern u16 Tsa_DemonKingBG2[];
extern u16 Tsa_DemonKingBG3[];
extern u16 Pal_DemonKingBG[];
extern u16 Img_087FF488[];
extern u16 Img_0880064C[];
extern u16 Pal_088017E0[];
extern struct ProcCmd ProcScr_08801810[];
extern struct ProcCmd ProcScr_08801840[];
extern u16 gUnknown_08801858[];
extern u16 gUnknown_08801860[];
// extern ??? ProcScr_ekrSelfThunder
// extern ??? ProcScr_ekrSelfThunderBG
// extern ??? gUnknown_088018A0
extern s16 *gUnknown_08801AAC[];
extern u8 *gUnknown_08801AB4[];

extern const s16 gUnknown_080E8318[];
extern const s16 gUnknown_080E831E[];
extern const s16 gUnknown_080E8334[];
extern const s16 gUnknown_080E834E[];
extern const s16 gUnknown_080E836C[];
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
// ??? sub_806FAD8(???);
void EkrDragonBgSetPostion(int, int);
void sub_806FBB8(void);
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
void SetEkrDragonStatusAttrFinished(struct Anim *anim);
void SetEkrDragonStatusAttrBit12(struct Anim *anim);
void SetEkrDragonStatusAttrBit13(struct Anim *anim);
bool CheckEkrDragonDeadEffectMaybe(struct Anim *anim);
bool CheckEkrDragonStatusAttrBit13(struct Anim *anim);
void SetAnimStateHiddenForDragon(void);
// ??? sub_807027C(???);
u16 *sub_80702D0(void);
// ??? sub_80702FC(???);
// ??? sub_807032C(???);
void sub_807035C(struct Anim *anim);
void NewEkrDragonQuakeTree3(struct EkrDragonQuakePriv *priv, int, int);
void NewEkrDragonQuake(struct EkrDragonQuakePriv *priv, int, int, ProcPtr);
// ??? EkrDragonQuakeMain(???);
// ??? NewEkrWhiteINOUT(???);
// ??? sub_80705A8(???);
// ??? sub_8070618(???);
// ??? sub_8070670(???);
// ??? sub_80706E0(???);
// ??? sub_8070710(???);
// ??? sub_80707C0(???);
// ??? sub_80707FC(???);
// ??? sub_8070874(???);
// ??? sub_80708A0(???);
void NewEkrDragonManakete(struct Anim *anim);
void EkrMyr_PrepareBanimfx(struct ProcEkrDragon *proc);
void EkrMyr_WaitForTransform(struct ProcEkrDragon *proc);
void EkrMyr_TrigerForPrepared(struct ProcEkrDragon *proc);
void EkrMyr_InBattleIdle(struct ProcEkrDragon *proc);
void EkrMyr_ReturnToLoli(struct ProcEkrDragon *proc);
void sub_8070AE4(struct ProcEkrDragon *proc);
void sub_8070B3C(void);
// ??? sub_8076598(???);
int CheckEkrWpnDemonLight(struct Anim *anim);
void EkrDKStartBaseHide(struct ProcEkrDragon *proc);
void EkrDK_CustomBgFadeIn(struct ProcEkrDragon *proc);
void Fill16_EkrTsaBuffer_(u32 val);
void EkrDK_BgMovement(struct ProcEkrDragon *proc);
void EkrDK_PrepareBanimfx(struct ProcEkrDragon *proc);
void PrepareDemonKingBGFx(struct ProcEkrDragon *proc);
void EkrDK_IdleInBattle(struct ProcEkrDragon *proc);
void EkrDK_WaitForFadeOut(struct ProcEkrDragon *proc);
void EkrDK_ReloadTerrainEtc(struct ProcEkrDragon *proc);
void EkrDK_ReloadCustomBgAndFadeOut(struct ProcEkrDragon *proc);
void EkrDK_SetDragonStatusBit3(struct ProcEkrDragon *proc);
ProcPtr NewEkrDragonBaseHide(struct Anim *anim);
ProcPtr NewEkrDragonBaseHide(struct Anim *anim);
void EkrDragonBaseHideMain(struct ProcEfxDKfx *proc);
void EkrDragonBaseHide_Nop(struct ProcEfxDKfx *proc);
ProcPtr NewEkrDragonBaseAppear(struct Anim *anim);
void EkrDragonBaseAppearMain(struct ProcEfxDKfx *proc);
void EkrDragonBaseAppear_Nop(struct ProcEfxDKfx *proc);
void EkrDKHandler_NewDragonAnime(struct ProcEkrDragon *proc);
ProcPtr NewEkrDragonBodyAnime(struct Anim *anim);
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx *proc);
void sub_8076C10(struct ProcEfxDKBody1 *proc);
void sub_8076C34(struct ProcEfxDKBody1 *proc);
void sub_8076C54(struct ProcEfxDKBody1 *proc);
void sub_8076D60(struct ProcEfxDKBody1 *proc);
void sub_8076DE8(struct ProcEfxDKBody1 *proc);
void sub_8076E00(struct ProcEfxDKBody1 *proc);
void sub_8076E84(struct ProcEfxDKBody1 *proc);
void sub_8076F08(struct ProcEfxDKBody1 *proc);
void sub_8076F28(struct ProcEfxDKBody1 *proc);
void sub_8076F48(struct ProcEfxDKBody1 *proc);
void sub_8076FD0(struct ProcEfxDKBody1 *proc);
void sub_8076FD4(struct ProcEfxDKBody1 *proc);
void EkrDragonBodyAnimeSet54(struct Anim *anim);
void EkrDragonBodyAnimeMain(struct ProcEfxDKfx *proc);
void NewEkrDragonBodyUnk4(struct Anim *anim, int round_type);
void EkrDragonBodyUnk4Main(struct ProcEfxDKBody4 *proc);
ProcPtr NewEkrDragonBodvBlack(struct Anim *anim);
void sub_80772E4(int val);
void EkrDragonBodyBlackMain(struct ProcEfxDKfx *proc);
void nop_8077394(void);
void sub_8077398(void);
void sub_80773BC(struct ProcEfxDKfx *proc);
void sub_80773E4(struct ProcEfxDKfx *proc);
void sub_8077460(struct ProcEfxDKfx *proc);
void sub_8077474(int arg1, int arg2);
void sub_807750C(int arg1, int arg2);
ProcPtr NewProc087F4518(struct Anim *anim);
ProcPtr NewEkrDragonTunkFace(struct Anim *anim);
void sub_807759C(struct ProcEfxDKfx *proc);
void sub_80775E8(struct ProcEfxDKfx *proc);
void sub_8077620(struct ProcEfxDKfx *proc);
void sub_807766C(struct ProcEfxDKfx *proc);
void sub_8077678(struct ProcEfxDKfx *proc);
void sub_8077684(struct ProcEfxDKfx *proc);
void sub_80776B0(struct ProcEfxDKfx *proc);
void sub_80776D8(int arg1, int arg2, const u16 *tsa);
void sub_807773C(int arg1, int arg2);
ProcPtr NewEkrDragonTunk(struct Anim *anim);
void sub_80777E0(struct ProcEkrDragonTunk *proc);
void sub_807789C(struct ProcEkrDragonTunk *proc);
void sub_8077AA8(void);
void NewEkrWhiteOUT(int, int, int);
void EkrWhiteOutFadeIn(struct ProcEkrWhiteOUT *proc);
void EkrWhiteOutDelay(struct ProcEkrWhiteOUT *proc);
void EkrWhiteOutFadeOut(struct ProcEkrWhiteOUT *proc);
void EkrWhiteOutOnEnd(struct ProcEkrWhiteOUT *proc);
void sub_8077C54(s16, s16);
void sub_8077D30(struct Proc08801800 *proc);
void sub_8077D38(struct Proc08801800 *proc);
void sub_8077D80(s16 *buf1, s16 *buf2, int val1, int val2);
void sub_8077DB4(int, int);
void sub_8077DC8(void);
void sub_8077E64(struct Proc08801810 *proc);
void sub_8077E6C(struct Proc08801810 *proc);
void sub_8077E9C(void);
void sub_8077EAC(int arg1, int arg2);
void sub_8077EEC(int, ProcPtr parent);
// ??? sub_8077F04(???);
// ??? sub_8077F10(???);
void sub_8077F9C(u16 *buf, int);
// ??? sub_8077FC8(???);
void NewEkrSelfThunder(struct Anim *anim);
// ??? sub_8078078(???);
// ??? sub_80780A4(???);
// ??? NewEkrSelfThunderBG(???);
// ??? sub_8078140(???);
// ??? sub_8078174(???);
// ??? sub_807819C(???);
