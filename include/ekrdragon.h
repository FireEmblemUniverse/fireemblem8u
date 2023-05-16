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

    /* 30 */ u8 _pad_30[0x44 - 0x30];

    /* 44 */ u32 unk44;
    /* 48 */ void *unk48;
    /* 4C */ u16 **tsa_set;
    /* 50 */ u32 unk50;
    /* 54 */ u32 round_cur;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim *anim;
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
// ??? CheckEkrWpnDemonLight(???);
// ??? EkrDKStartBaseHide(???);
// ??? EkrDK_CustomBgFadeIn(???);
// ??? Fill16_EkrTsaBuffer_(???);
// ??? EkrDK_BgMovement(???);
// ??? EkrDK_PrepareBanimfx(???);
// ??? PrepareDemonKingBGFx(???);
// ??? EkrDK_IdleInBattle(???);
// ??? EkrDK_WaitForFadeOut(???);
// ??? EkrDK_ReloadTerrainEtc(???);
// ??? EkrDK_ReloadCustomBgAndFadeOut(???);
// ??? EkrDK_SetDragonStatusBit3(???);
ProcPtr NewEkrDragonBaseHide(struct Anim *anim);
// ??? EkrDragonBaseHideMain(???);
// ??? EkrDragonBaseHide_Nop(???);
ProcPtr NewEkrDragonBaseAppear(struct Anim *anim);
// ??? EkrDragonBaseAppearMain(???);
// ??? EkrDragonBaseAppear_Nop(???);
// ??? EkrDKHandler_NewDragonAnime(???);
ProcPtr NewEkrDragonBodyAnime(struct Anim *anim);
// ??? EfxDKUpdateFrontAnimPostion(???);
// ??? sub_8076C10(???);
// ??? sub_8076C34(???);
// ??? sub_8076C54(???);
// ??? sub_8076D60(???);
// ??? sub_8076DE8(???);
// ??? sub_8076E00(???);
// ??? sub_8076E84(???);
// ??? sub_8076F08(???);
// ??? sub_8076F28(???);
// ??? sub_8076F48(???);
// ??? sub_8076FD0(???);
// ??? sub_8076FD4(???);
void EkrDragonBodyAnimeSet54(struct Anim *anim);
// ??? EkrDragonBodyAnimeMain(???);
void NewEkrDragonBodyUnk4(struct Anim *anim, int round_type);
// ??? EkrDragonBodyUnk4Main(???);
ProcPtr NewEkrDragonBodvBlack(struct Anim *anim);
// ??? sub_80772E4(???);
// ??? sub_8077310(???);
// ??? sub_8077394(???);
// ??? sub_8077398(???);
// ??? sub_80773BC(???);
// ??? sub_80773E4(???);
// ??? sub_8077460(???);
// ??? sub_8077474(???);
// ??? sub_807750C(???);
// ??? sub_8077560(???);
// ??? sub_8077584(???);
// ??? sub_807759C(???);
// ??? sub_80775E8(???);
// ??? sub_8077620(???);
// ??? sub_807766C(???);
// ??? sub_8077678(???);
// ??? sub_8077684(???);
// ??? sub_80776B0(???);
// ??? sub_80776D8(???);
// ??? sub_807773C(???);
ProcPtr NewEkrDragonTunk(struct Anim *anim);
