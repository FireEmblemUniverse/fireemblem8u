#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"
#include "bmitem.h"

enum ekr_battle_unit_position {
    EKR_POS_L,
    EKR_POS_R
};

int GetAnimPosition(struct Anim * anim);

enum ekr_hit_identifer {
    EKR_HITTED = 0,
    EKR_MISS
};

int CheckRoundMiss(s16);

struct ProcEkrBattleDeamon {
    PROC_HEADER;

    /* 29 */
};

struct ProcEkrBattle {
    PROC_HEADER;

    /* 29 */ u8 speedup;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ s16 timer;
    /* 2E */ s16 end;
    /* 30 */ u8 _pad_30[0x44 - 0x30];
    /* 44 */ int side;
    /* 48 */ int counter;
    /* 4C */ u8 _pad_4C[0x54 - 0x4C];
    /* 54 */ int is_quote;
    /* 58 */ int unk58;
    /* 5C */ struct Anim * anim;
};

struct ProcEkrLvupFan {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x2C - 0x29];
    /* 2C */ s16 timer;
};

struct EkrGaugeStruct1 {
    u8 _pad_00[0x3C - 0x0];
    void *unk3C;
};

struct ProcEkrGauge {
    PROC_HEADER;

    /* 29 */ u8 battle_init;           /* 1 in battle-starting and 0 after battle started */
    /* 2A */ u8 valid;
    /* 2B */ u8 _pad_2B[0x32 - 0x2B];
    /* 32 */ s16 unk32;
    /* 34 */ u8 _pad_34[0x3A - 0x34];
    /* 3A */ s16 unk3A;
    /* 3C */ u8 _pad_3C[0x44 - 0x3C];
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
    /* 54 */
};

enum gEkrDistanceType_index {
    EKR_DISTANCE_CLOSE,
    EKR_DISTANCE_FAR,
    EKR_DISTANCE_FARFAR,
    EKR_DISTANCE_MONOCOMBAT,
    EKR_DISTANCE_PROMOTION
};
extern s16 gEkrDistanceType;

struct ProcEfxSpdQuake {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ struct Vec2 *vecs;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim * anim;
};

void NewEfxspdquake(struct Anim * anim);
void sub_8055A64(struct ProcEfxSpdQuake * proc);
void sub_8055B38(struct ProcEfxSpdQuake * proc);

struct ProcEkrBattleStarting {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    /* 30 */ STRUCT_PAD(0x30, 0x32);

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;

    /* 36 */ STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
};

void NewEkrBattleStarting(void);
void ekrBaStart_InitScreen(struct ProcEkrBattleStarting * proc);
void ekrBaStart_SreenFailIn(struct ProcEkrBattleStarting * proc);
void ekrBaStart_InitBattleScreen(struct ProcEkrBattleStarting * proc);
void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting * proc);
void ekrBaStart_8055FE8(struct ProcEkrBattleStarting * proc);
void ekrBaStart_8056024(struct ProcEkrBattleStarting * proc);
void ekrBaStart_8056078(struct ProcEkrBattleStarting * proc);

struct ProcEkrBattleEnding {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    /* 30 */ STRUCT_PAD(0x30, 0x32);

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;

    /* 36 */ STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
};

void NewEkrbattleending(void);
void ekrBattleEnding_80560F0(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056170(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_80561C8(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056228(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056288(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056310(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056390(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_8056484(struct ProcEkrBattleEnding * proc);

struct ProcEkrBaseKaiten {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ s16 unk36;

    /* 38 */ STRUCT_PAD(0x38, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
    /* 3E */ s16 unk3E;

    /* 40 */ STRUCT_PAD(0x40, 0x44);

    /* 44 */ int type;

    /* 48 */ STRUCT_PAD(0x48, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ const u16 * unk60;
};

void NewEkrBaseKaiten(int identifier);
void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc);

struct ProcUnitKakudai {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ s16 left_pos;
    /* 38 */ s16 right_pos;
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;

    /* 3E */ STRUCT_PAD(0x3E, 0x44);

    /* 44 */ int type;

    /* 48 */ STRUCT_PAD(0x48, 0x4C);

    /* 4C */ u32 valid_l;
    /* 50 */ u32 valid_r;
    /* 54 */ void * pOaml;
    /* 58 */ void * pOamr;
};

void NewEkrUnitKakudai(int identifier);
void UnitKakudaiPrepareAnimScript(struct ProcUnitKakudai * proc);
void UnitKakudaiMain(struct ProcUnitKakudai * proc);
void UnitKakudaiEndNop(struct ProcUnitKakudai * proc);

struct ProcEkrIntroWindow {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 ymax;

    /* 32 */ STRUCT_PAD(0x32, 0x44);

    /* 44 */ int type;
    /* 48 */ int ymax_name;
};

void NewEkrWindowAppear(int identifier, int);
bool CheckEkrWindowAppearUnexist(void);
void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc);
void NewEkrNamewinAppear(int identifier, int duration, int delay);
bool CheckEkrNamewinAppearUnexist(void);
void EkrNamewinAppearDelay(struct ProcEkrIntroWindow * proc);
void EkrNamewinAppearMain(struct ProcEkrIntroWindow * proc);
void NewEkrBaseAppear(int identifier, int duration);
bool CheckEkrBaseAppearUnexist(void);
void EkrBaseAppearMain(struct ProcEkrIntroWindow * proc);

extern struct ProcCmd ProcScr_ekrWindowAppear[];
extern struct ProcCmd ProcScr_ekrNamewinAppear[];
extern struct ProcCmd ProcScr_ekrBaseAppear[];

extern int gEkrWindowAppearExist;
extern int gEkrNamewinAppearExist;
extern int gProcEkrBaseAppearExist;

struct ProcEkrChienCHR {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x5C);

    /* 5C */ struct Anim * anim;
};

enum AnimRoundData_type_identifier {
    ANIM_ROUND_HIT_CLOSE,
    ANIM_ROUND_CRIT_CLOSE,
    ANIM_ROUND_NONCRIT_FAR,
    ANIM_ROUND_CRIT_FAR,
    ANIM_ROUND_TAKING_MISS_CLOSE,
    ANIM_ROUND_TAKING_MISS_FAR,
    ANIM_ROUND_TAKING_HIT_CLOSE,
    ANIM_ROUND_STANDING,
    ANIM_ROUND_TAKING_HIT_FAR,
    ANIM_ROUND_MISS_CLOSE,
    ANIM_ROUND_MAX,

    ANIM_ROUND_INVALID = -1,
};

enum anim_round_type {
    ANIM_ROUND_BIT8 = 0x0100,
    ANIM_ROUND_PIERCE = 0x0200,
    ANIM_ROUND_GREAT_SHIELD = 0x0400,
    ANIM_ROUND_SURE_SHOT = 0x0800,
    ANIM_ROUND_SILENCER = 0x1000,
    ANIM_ROUND_POISON = 0x2000,
    ANIM_ROUND_BIT14 = 0x4000,
    ANIM_ROUND_DEVIL = 0x8000,    
};

extern s16 gAnimRoundData[];
s16 GetBattleAnimRoundType(int index);
s16 GetBattleAnimRoundTypeFlags(int);

#define GetRoundFlagByAnim(aAnim) (GetBattleAnimRoundTypeFlags((aAnim->nextRoundId - 1) * 2 + GetAnimPosition(aAnim)))

extern u8 gEfxHpLut[];

enum banim_mode_index {
    BANIM_MODE_NORMAL_ATK,
    BANIM_MODE_NORMAL_ATK_PRIORITY_L,
    BANIM_MODE_CRIT_ATK,
    BANIM_MODE_CRIT_ATK_PRIORITY_L,
    BANIM_MODE_RANGED_ATK,
    BANIM_MODE_RANGED_CRIT_ATK,
    BANIM_MODE_CLOSE_DODGE,
    BANIM_MODE_RANGED_DODGE,
    BANIM_MODE_STANDING,
    BANIM_MODE_STANDING2,
    BANIM_MODE_RANGED_STANDING,
    BANIM_MODE_MISSED_ATK,

    BANIM_MODE_INVALID = -1,
};

struct BanimRoundScript {
    u8 frame_front;
    u8 priority_front;
    u8 frame_back;
    u8 priority_back;
};

#define SPECIAL_BANIM_WTYPE (0x100 | ITYPE_ITEM)

struct BattleAnimDef {
    u16 wtype;
    u16 index;
};

// extern const struct BanimRoundScript BanimDefaultModeConfig[ANIM_ROUND_MAX * 4];
extern const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4];

struct ProcEkrSubAnimeEmulator {
    PROC_HEADER;

    /* 29 */ u8 type;
    /* 2A */ u8 valid;
    /* 2C */ s16 timer;
    /* 2E */ s16 scr_cur;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;

    STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 * anim_scr;
    /* 48 */ void * sprite;
    /* 4C */ int oam2Base;
    /* 50 */ int oamBase;
};

struct ProcEkrSubAnimeEmulator * NewEkrsubAnimeEmulator(int x, int y, u32 * anim_scr, int type, int oam2Base, int oamBase, ProcPtr parent);
void EkrsubAnimeEmulatorMain(struct ProcEkrSubAnimeEmulator * proc);

struct ProcEfxSoundSE {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int volume;
    /* 48 */ int index;
};

void EfxPlaySE(int songid, int volume);
void Loop6C_efxSoundSE(struct ProcEfxSoundSE * proc);
void DoM4aSongNumStop(int);
// ??? EfxOverrideBgm(???);
// ??? StopBGM1(???);
void UnregisterEfxSoundSeExist(void);
void RegisterEfxSoundSeExist(void);
int CheckEfxSoundSeExist(void);
void M4aPlayWithPostionCtrl(int, int, int);
void EfxPlaySEwithCmdCtrl(struct Anim * anim, int);

extern int gEkrDebugTimer, gEkrDebugUnk1;

extern u16 gEkrPairBanimID[2];
extern s16 gBattleInitSide[2];

extern struct BattleUnit *gpEkrBattleUnitLeft;
extern struct BattleUnit *gpEkrBattleUnitRight;
extern struct Font gSomeFontStruct;

extern struct Anim *gAnims[4];
extern void *gUnknown_02000010[2];
extern int gEkrDebugUnk2;
extern int gEkrDebugUnk3;
extern s16 gEkrXPosReal[2];
extern s16 gEkrYPosReal[2];
extern u16 gEkrXPosBase[];
extern u16 gEkrYPosBase[];
extern struct Vec2 gEkrBg0QuakeVec;
extern void *gUnknown_0200003C[2];
extern void *gUnknown_02000044[2];
extern void *gBanimTerrainPaletteMaybe[2];
extern u16 *gpEfxUnitPaletteBackup[2];
extern int *gpBanimModesLeft;
extern int *gpBanimModesRight;
extern struct ProcEkrBattle *gpProcEkrBattle;
extern struct ProcEkrGauge *gpProcEkrGauge;
extern u8 gBanimLeftImgSheetBuf[];
extern u8 gBanimRightImgSheetBuf[];

extern int gBanimLinkArenaFlag;
extern int gBattleDeamonActive;
extern struct ProcEkrBattleDeamon *gpProcEkrBattleDeamon;
extern s16 gEkrDebugModeMaybe;
extern s16 gEkrPairSomeTile;
extern s16 gEkrInitialHitSide;
extern s16 gEkrSnowWeather;
extern s16 gEkrPairSideVaild[2];
extern s16 gEkrInitialPosition[2];
extern s16 gPalIndexEfxHpBarUnk[2];
extern s16 gEkrSpellAnimIndex[];
// extern ??? gUnknown_0203E11A
extern EWRAM_DATA s16 gBanimTerrainIndexMaybe[2];
extern EWRAM_DATA short gEkrPairBmLoc[4];
// extern ??? gAnimRoundData
extern s16 gEfxPairHpBufOffset[];
extern s16 gEkrPairBanimID2[];
extern u8 gEkrPids[2];
extern struct Unit *gpEkrTriangleUnits[2];
extern char *gBanimCharacterPals[2];
extern void * gUnknown_0203E1A4[2];
extern s16 gEkrGaugeHp[2];
extern s16 gEkrPairMaxHP[2];
extern s16 gBanimSomeHp[2];
extern s16 gEkrPairHit[2];
extern s16 gEkrPairDmgPair[2];
extern s16 gEkrPairCritPair[2];
extern s16 gEkrPairExpPrevious[2];
extern s16 gEkrPairExpGain[2];
extern s16 gEkrPairTerrainID[2];
extern s16 gEkrPairBaseCon[2];
extern s16 gEkrPairWTABonus[2];
extern s16 gEkrPairEffectiveAgainst[2];
extern s16 gUnknown_0203E1DC[2];

extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];
extern u8 gUnknown_020145C8[];
// extern ??? gUnknown_020146F4
// extern ??? gUnknown_02014DC8
// extern ??? gUnknown_02014EF4
extern u32 gBanimDoneFlag[];
extern u32 gEkrBgXOffset;
// extern ??? gpProcEfxAnimeDrv
extern const void *gpImgSheet[2];
// extern ??? gUnknown_0201FB24
// extern ??? gUnknown_0201FB28
extern int gUnknown_0201FB2C;
extern u16 *gUnknown_0201FB30;
extern u16 *gUnknown_0201FB34;
extern u16 gUnknown_0201FB38[];
extern u16 gUnknown_0201FC78[];
extern int gUnknown_0201FDB8;
extern u16 *gUnknown_0201FDBC;
extern u16 *gUnknown_0201FDC0;
extern u16 gUnknown_0201FDC4[];
extern u16 gUnknown_0201FF04[];
// extern ??? gUnknown_02020044

extern int gUnknown_020200A8;
extern int gEfxSoundSeExist;
// extern ??? gpProcEkrClasschg

extern struct ProcCmd gProc_ekrBattleDeamon[];
extern struct ProcCmd gProc_ekrBattle[];
extern struct ProcCmd ProcScr_ekrLvupFan[];
extern struct ProcCmd ProcScr_ekrGauge[];
// extern ??? gUnknown_085B93D0
extern u8 gUnknown_085B940C[];
// extern ??? gUnknown_085B9424
// extern ??? gUnknown_085B949C
// extern ??? gUnknown_085B94F0
// extern ??? gUnknown_085B9544
extern u16 gUnknown_085B955C[];
extern u16 gUnknown_085B9574[];
extern u16 gUnknown_085B958C[];
extern u16 gUnknown_085B95A4[];
extern u16 gUnknown_085B95BC[];
extern u16 gUnknown_085B95D4[];
extern struct ProcCmd gProc_ekrDispUP[];
extern struct ProcCmd ProcScr_efxHPBar[];
extern struct ProcCmd ProcScr_efxHPBarResire[];
extern struct ProcCmd ProcScr_EfxAvoid[];
extern struct ProcCmd ProcScr_efxHPBarLive[];
extern struct ProcCmd ProcScr_efxNoDamage[];
extern struct ProcCmd ProcScr_efxNoDamageYure[];
extern struct ProcCmd ProcScr_efxStatusCHG[];
extern struct ProcCmd ProcScr_efxDeadEvent[];
extern struct ProcCmd ProcScr_efxDead[];
extern struct ProcCmd ProcScr_efxDeadPika[];
extern struct ProcCmd ProcScr_efxDeadAlpha[];
extern struct ProcCmd ProcScr_efxDeadDragonAlpha[];
extern struct ProcCmd gProc_efxFarAttack[];
extern struct ProcCmd gProc_efxQuakePure[];
// extern ??? gUnknown_085B9804
extern struct ProcCmd gProc_efxHitQuakePure[];
extern struct ProcCmd gProc_efxQuake[];
extern struct ProcCmd gProc_efxHitQuake[];
extern struct ProcCmd ProcScr_efxFlashBG[];
extern struct ProcCmd ProcScr_efxWhiteOUT[];
extern struct ProcCmd ProcScr_efxWhiteIN[];
extern struct ProcCmd ProcScr_efxBlackOUT[];
extern struct ProcCmd ProcScr_efxBlackIN[];
extern struct ProcCmd ProcScr_efxFlashHPBar[];
extern struct ProcCmd ProcScr_efxHPBarColorChange[];
extern struct ProcCmd ProcScr_efxFlashUnit[];
extern struct ProcCmd ProcScr_efxFlashUnitEffectEnd[];
extern struct ProcCmd ProcScr_efxStatusUnit[];
extern struct ProcCmd ProcScr_efxWeaponIcon[];
extern struct ProcCmd ProcScr_efxSpellCast[];
extern struct ProcCmd ProcScr_efxSPDQuake[];
extern struct ProcCmd ProcScr_ekrBattleStarting[];
extern struct ProcCmd ProcScr_ekrBattleEnding[];
extern struct ProcCmd ProcScr_EkrBaseKaiten[];
extern const u8 * CONST_DATA Imgs_085B9B84[];
extern const u8 * CONST_DATA Imgs_085B9BA4[];
extern u32 * AnimScrs_085B9BC4[];
extern u32 * AnimScrs_085B9BE4[];
extern u32 * AnimScrs_085B9C04[];
extern u32 * AnimScrs_085B9C24[];
extern u32 * AnimScrs_085B9C44[];
extern u32 * AnimScrs_085B9C64[];
extern const u16 * CONST_DATA gUnknown_085B9C84[];
extern const u16 * CONST_DATA gUnknown_085B9CA4[];
extern const u16 * CONST_DATA gUnknown_085B9CC4[];
extern struct ProcCmd ProcScr_ekrUnitKakudai[];

extern AnimScr BanimScr_DefaultAnim[];
extern void *gUnknown_085B9D6C[];
extern struct ProcCmd gProc_ekrChienCHR[];
extern struct ProcCmd gProc_efxAnimeDrvProc[];
extern struct ProcCmd ProcScr_ekrUnitMainMini[];
extern struct ProcCmd gProc_ekrTogiInit[];
extern struct ProcCmd gProc_ekrTogiEnd[];
extern struct ProcCmd gProc_ekrTogiColor[];

extern const s16 gEfxNoDmgBgShakeOff[];
// extern ??? gUnknown_080DA4BA
extern CONST_DATA struct Vec2 gEfxQuakeVecs[];
// extern ??? gUnknown_080DA526
extern CONST_DATA struct Vec2 gEfxQuakeVecs2[];
// extern ??? gUnknown_080DA5BA
// extern ??? gUnknown_080DA604
// extern ??? gUnknown_080DA66E
// extern ??? gUnknown_080DA9F8
// extern ??? gUnknown_080DAA8E
extern const u16 gFrameLut_EfxHPBarColorChange1[];
extern const u16 gFrameLut_EfxHPBarColorChange2[];
extern const u16 gFrameLut_EfxStatusUnit[];
extern const u16 gFrameLut_EfxWeaponIcon[];
// extern ??? gUnknown_080DAE8C
// extern ??? gUnknown_080DAE96
// extern ??? gUnknown_080DAEA0
// extern ??? gUnknown_080DAEAA
// extern ??? gUnknown_080DAEB4
// extern ??? gUnknown_080DAEBE
// extern ??? gUnknown_080DAEC8
// extern ??? gUnknown_080DAED2
// extern ??? gUnknown_080DAEDC
// extern ??? gUnknown_080DAEE6
extern const u8 BattleTypeToAnimModeEndOfDodge[5];
extern const u8 BanimTypesPosLeft[5];
extern const u8 BanimTypesPosRight[5];
extern const u16 BanimLeftDefaultPos[5];
// extern ??? gUnknown_080DAF60
// extern ??? gUnknown_080DB026
extern const u8 Img_080DB034[];
extern const u8 Img_080DB538[];
extern const u8 Img_080DB9C4[];
extern const u8 Img_080DBE1C[];
extern const u8 Img_080DC350[];
extern const u16 gUnknown_080DC85C[2];
// extern ??? gUnknown_080DC956
// extern ??? gUnknown_080DCA5C
// extern ??? gUnknown_080DCB78
// extern ??? gUnknown_080DCBD4
extern const u16 gUnknown_080DCCA6[];
extern const u16 gUnknown_080DCCC0[];
extern const u16 gUnknown_080DCD26[];
extern const u16 gUnknown_080DCD72[];
extern const u16 gUnknown_080DCDE4[];
// extern ??? gUnknown_080DCE6E
// extern ??? gUnknown_080DCEEC
// extern ??? gUnknown_080DCF7E
// extern ??? gUnknown_080DD024
// extern ??? gUnknown_080DD044
// extern ??? gUnknown_080DD094
// extern ??? gUnknown_080DD0C6
// extern ??? gUnknown_080DD186
// extern ??? gUnknown_080DD1F4
// extern ??? gUnknown_080DD252
// extern ??? gUnknown_080DD288
// extern ??? gUnknown_080DD328
// extern ??? gUnknown_080DD4D4
// extern ??? gUnknown_080DD542
// extern ??? gUnknown_080DD550
// extern ??? gUnknown_080DD5D2
// extern ??? gUnknown_080DD5D8
// extern ??? gUnknown_080DD67A
// extern ??? gUnknown_080DD70C
// extern ??? gUnknown_080DD76A
// extern ??? gUnknown_080DD8C6
// extern ??? gUnknown_080DD8CC
// extern ??? gUnknown_080DD8D2
// extern ??? gUnknown_080DD8D8
// extern ??? gUnknown_080DD8EE
// extern ??? gUnknown_080DD930
// extern ??? gUnknown_080DD972
// extern ??? gUnknown_080DD9A4
// extern ??? gUnknown_080DDA3E
// extern ??? gUnknown_080DDA50
// extern ??? gUnknown_080DDA58
// extern ??? gUnknown_080DDA70
// extern ??? gUnknown_080DDB82
// extern ??? gUnknown_080DDB9A
// extern ??? gUnknown_080DDC8A
// extern ??? gUnknown_080DDCE6
// extern ??? gUnknown_080DDD58
// extern ??? gUnknown_080DDE9E
// extern ??? gUnknown_080DDF3A
// extern ??? gUnknown_080DE03C
// extern ??? gUnknown_080DE050
// extern ??? gUnknown_080DE086
// extern ??? gUnknown_080DE0CE
// extern ??? gUnknown_080DE106
// extern ??? gUnknown_080DE150
// extern ??? gUnknown_080DE1CE
// extern ??? gUnknown_080DE24C
// extern ??? gUnknown_080DE284
// extern ??? gUnknown_080DE2B8
// extern ??? gUnknown_080DE2E2
// extern ??? gUnknown_080DE346
// extern ??? gUnknown_080DE374
// extern ??? gUnknown_080DE3A6
// extern ??? gUnknown_080DE3DA
// extern ??? gUnknown_080DE3F8
// extern ??? gUnknown_080DE47E
// extern ??? gUnknown_080DE4E6
// extern ??? gUnknown_080DE526
// extern ??? gUnknown_080DE552
// extern ??? gUnknown_080DE58E
// extern ??? gUnknown_080DE5E4
// extern ??? gUnknown_080DE624
// extern ??? gUnknown_080DE65C
// extern ??? gUnknown_080DE6F0
// extern ??? gUnknown_080DE710
// extern ??? gUnknown_080DE748
// extern ??? gUnknown_080DE792
// extern ??? gUnknown_080DE8A0
// extern ??? gUnknown_080DE8C0
// extern ??? gUnknown_080DE8DC
// extern ??? gUnknown_080DE900
// extern ??? gUnknown_080DE924
// extern ??? gUnknown_080DE974
// extern ??? gUnknown_080DE9EA
// extern ??? gUnknown_080DEA4A
// extern ??? gUnknown_080DEA74
// extern ??? gUnknown_080DEA96
// extern ??? gUnknown_080DEAAA
// extern ??? gUnknown_080DEAFA
// extern ??? gUnknown_080DEB6A
// extern ??? gUnknown_080DEBC8
// extern ??? gUnknown_080DEBF8
// extern ??? gUnknown_080DEC0C
// extern ??? gUnknown_080DEC30
// extern ??? gUnknown_080DECBA
// extern ??? gUnknown_080DEDBC
// extern ??? gUnknown_080DEDFA
// extern ??? gUnknown_080DEE40
// extern ??? gUnknown_080DEEC2
// extern ??? gUnknown_080DEF20
// extern ??? gUnknown_080DEF78
// extern ??? gUnknown_080DEFD0
// extern ??? gUnknown_080DF042
// extern ??? gUnknown_080DF080
// extern ??? gUnknown_080DF0E0
extern const u16 gUnknown_080DF188[];
extern const u16 gUnknown_080DF1EE[];
extern const u16 gUnknown_080DF26A[];
extern const u16 gUnknown_080DF2DC[];
extern const u16 gUnknown_080DF386[];
extern const u16 gUnknown_080DF39C[];
extern const u16 gUnknown_080DF3A2[];
extern const u16 gUnknown_080DF3C4[];
extern const u16 gUnknown_080DF4F4[];
extern const u16 gUnknown_080DF546[];
extern const u16 gUnknown_080DF568[];

void SetBanimLinkArenaFlag(int unk);
int GetBanimLinkArenaFlag(void);
void NewEkrBattleDeamon(void);
void EndEkrBattleDeamon(void);
int IsBattleDeamonActive(void); // battle?
// ??? ekrBattleDeamon_Destructor(???);
// ??? nullsub_35(???);
void NewEkrBattle(void);
void InBattleMainRoutine(void);
void MainUpdateEkrBattle(void);
// ??? nullsub_36(???);
// ??? ekrBattle_Init(???);
// ??? ekrBattleMain(???);
void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle * proc);
void ekrBattleWaitPreEvent(struct ProcEkrBattle * proc);
void ekrBattle_8050134(struct ProcEkrBattle * proc);
void ekrBattlePrepareDragonIntro(struct ProcEkrBattle * proc);
void ekrBattleExecDragonIntro(struct ProcEkrBattle * proc);
void ekrBattleWaitDragonIntro(struct ProcEkrBattle * proc);
void ekrBattlePostEkrDragonIntro(struct ProcEkrBattle * proc);
void ekrBattle_8050290(struct ProcEkrBattle * proc);
void ekrBattleSetFlashingEffect(struct ProcEkrBattle * proc);
void ekrBattleExecTriangleAtk(struct ProcEkrBattle * proc);
void ekrBattleWaitTriangleIdle(struct ProcEkrBattle * proc);
void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle * proc);
void ekrBattle_80503EC(struct ProcEkrBattle * proc);
void ekrBattle_StartPromotion(struct ProcEkrBattle * proc);
void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle * proc);
void ekrBattleInRoundIdle(struct ProcEkrBattle * proc);
void ekrBattleOnBattkeEnd(struct ProcEkrBattle * proc);
void ekrBattle_8050600(struct ProcEkrBattle * proc);
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle * proc);
void ekrBattleExecExpGain(struct ProcEkrBattle * proc);
void ekrBattle_80508F0(struct ProcEkrBattle * proc);
void ekrBattle_8050940(struct ProcEkrBattle * proc);
void ekrBattleWaitExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattlePostExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattle_8050AB8(struct ProcEkrBattle * proc);
void ekrBattleLvupHanlder(struct ProcEkrBattle * proc);
void ekrBattle_ExecEkrLvup(struct ProcEkrBattle * proc);
void ekrBattle_WaitEkrLvupIdle(struct ProcEkrBattle * proc);
void ekrNewEkrPopup(struct ProcEkrBattle * proc);
void ekrBattle_WaitForPopup(struct ProcEkrBattle * proc);
void ekrBattle_PostPopup(struct ProcEkrBattle * proc);
void ekrBattle_TriggerDragonStatusFinished(struct ProcEkrBattle * proc);
void ekrBattle_WaitEkrDragonEndIdle(struct ProcEkrBattle * proc);
void ekrBattle_PostDragonStatusEffect(struct ProcEkrBattle * proc);
void nullsub_69(struct ProcEkrBattle * proc);
void NewEkrLvlupFan(void);
void EkrLvupFanMain(struct ProcEkrLvupFan * proc);
// ??? sub_8050E40(???);
// ??? ModDec(???);
void NewEkrGauge(void);
void EndEkrGauge(void);
void EkrGauge_Clr4C50(void);
void EkrGauge_Set4C50(void);
void EkrGauge_Set4C(void);
void EkrGauge_Set50(void);
void EkrGauge_Setup44(u16 val);
void EkrGauge_Clr323A(s16 x, s16 y);
void EkrGauge_Setxy323A(s16 x, s16 y);
void EkrGauge_SetInitFlag(void);
void EkrGauge_ClrInitFlag(void);
void EnableEkrGauge(void);
void DisableEkrGauge(void);
void sub_8051238(struct EkrGaugeStruct1 *buf, int a, int b);
void ekrGaugeMain(struct ProcEkrGauge * proc);
void NewEkrDispUP(void);
void EndEkrDispUP(void);
void EkrDispUpClear4C50(void);
void EkrDispUpSet4C(void);
void EkrDispUpSet50(void);
void EkrDispUP_8051B48(u16, u16);
void sub_8051B5C(u16 a, u16 b);
void sub_8051B70(void);
void sub_8051B80(void);
void sub_8051B90(void);
void sub_8051BA0(void);
// ??? ekrDispUPMain(???);
void EfxClearScreenFx(void);
void sub_8051E00(void);
void EfxPrepareScreenFx(void);
int GetBanimInitPosReal(void);
void SetEkrBg2QuakeVec(int a, int b);

void sub_805515C(void);
void SpellFx_Begin(void);
void SpellFx_Finish(void);
void SpellFx_ClearBG1Position(void);
void SpellFx_ClearBG1(void);
void SpellFx_SetSomeColorEffect(void);
void SetDefaultColorEffects_(void);
void StartBattleAnimHitEffectsDefault(struct Anim * anim, int type);
void sub_8055288(struct Anim * anim, int type);
void StartBattleAnimHitEffects(struct Anim * anim, int type, int a, int b);
// ??? StartBattleAnimResireHitEffects(???);
// ??? sub_8055518(???);
struct Anim * EfxCreateFrontAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
struct Anim * EfxCreateBackAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
// ??? sub_805560C(???);
void SpellFx_WriteBgMap(struct Anim * anim, const u16 *src1, const u16 *src2);
// ??? SpellFx_WriteBgMapUnused(???);
// ??? SpellFx_WriteBgMapExt(???);
void SpellFx_RegisterObjGfx(const u16 * img, u32 size);
void SpellFx_RegisterObjPal(const u16 * pal, u32 size);
void SpellFx_RegisterBgGfx(const u16 * img, u32 size);
void SpellFx_RegisterBgPal(const u16 * pal, u32 size);
// ??? sub_8055860(???);
// ??? sub_805588C(???);
// ??? sub_80558BC(???);
s16 EfxAdvanceFrameLut(s16 * ptime, s16 * pcount, const s16 lut[]);
// ??? sub_8055980(???);
int EfxGetCamMovDuration(void);
// ??? sub_80559B0(???);
void EfxTmFill(u32 val);
void SetEkrFrontAnimPostion(int type, s16, s16);
int Get0201FAC8(void);
void Set0201FAC8(int);

// ??? sub_8055BB4(???);
s8 sub_8055BC4(void);
void BeginAnimsOnBattleAnimations(void);
void EkrMainEndExec(void);
void MainUpdate_8055C68(void);

void EkrPrepareBanimfx(struct Anim * anim, u16);
s16 GetEfxHp(int index);
// ??? GetEfxHpModMaybe(???);
u16 IsItemDisplayedInBattle(u16 item);
u16 IsWeaponLegency(u16 item);
// ??? sub_8058B08(???);
// ??? sub_8058B24(???);
void sub_8058B64(void);
void sub_8058B70(void);
bool sub_8058B7C(void);
// ??? GetEkrHit(???);
// ??? GetEkrDmg(???);
// ??? GetEkrCrit(???);
void BattleAIS_ExecCommands(void);
// ??? _08058BD4(???);
// ??? _080596E0(???);
void AnimScrAdvance(struct Anim * anim);
void NewEkrChienCHR(struct Anim * anim);
// ??? EkrChienCHRMain(???);
void RegisterAISSheetGraphics(struct Anim * anim);
void sub_8059970(u32 *, int);
int GetBanimPalette(int banim_id, enum ekr_battle_unit_position pos);
void UpdateBanimFrame(void);
void InitBothAIS(void);
void InitBattleAnimFrame(int, int);
void InitLeftAnim(int);
void InitRightAnim(int);
void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int);
int GetAISLayerId(struct Anim * anim);

int CheckRound1(s16);
int CheckRound2(s16);
int CheckRoundCrit(struct Anim * anim);
struct Anim *GetAnimAnotherSide(struct Anim * anim);
// ??? GetAnimRoundType(???);
s16 GetAnimNextRoundType(struct Anim * anim);
s16 GetAnimRoundTypeAnotherSide(struct Anim * anim);
s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim);
void SetAnimStateHidden(int ais_id);
void SetAnimStateUnHidden(int ais_id);
// ??? sub_805A3DC(???);
// ??? sub_805A580(???);
// ??? sub_805A5A8(???);
// ??? sub_805A60C(???);
// ??? sub_805A7B4(???);
// ??? sub_805A930(???);
void sub_805A940(void*, u16, u16);
// ??? sub_805A95C(???);
// ??? sub_805A96C(???);
// ??? sub_805A990(???);
// ??? sub_805A9A4(???);
void NewEfxAnimeDrvProc(void);
void EndEfxAnimeDrvProc(void);
// ??? ExecAllAIS(???);
void NewEkrUnitMainMini(void *);
void sub_805AA28(void*);
// ??? EkrUnitMainMiniMain(???);
// void sub_805AA68(void *);
// void sub_805AE14(void *);
// void sub_805AE40(void *, s16, s16, s16, s16);
// ??? sub_805AE58(???);
// ??? sub_805AFA0(???);
void SetBanimArenaFlag(int);
int GetBattleAnimArenaFlag(void);
// ??? sub_805B034(???);
void PlaySound8FForArenaMaybe(void);
void sub_805B094(void);
void BeginAnimsOnBattle_Arena(void);
void ExecBattleAnimArenaExit(void);
void sub_8070D04(u16 * tm, u16 width, u16 height, int pal, int chr);
void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr);
void sub_8070DBC(u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmModifyPal(u16 * tm, u16 width, u16 height);
void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr);
void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmCpyExt(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void sub_8071068(u16 * tm, int arg1, int arg2);
void EkrModifyBarfx(u16 * tm, int);
bool EkrPalModifyUnused(u16 * src1, u16 * src2, u16 * dst, u16 a, u16 b, u16 c);
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref);
void EfxSomePalFlash(u16 * pal_buf, int line, int length, int r0, int g0, int b0);
void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length);
void EfxSplitColor(u16 * src, u8 * dst, u32 length);
void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length);
void sub_8071574(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref);
void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk);
void EfxChapterMapFadeOUT(int);
int sub_80716B0(int a);
int GetAnimSpriteRotScaleX(u32 header);
int GetAnimSpriteRotScaleY(u32 header);
void BanimUpdateSpriteRotScale(void * src, struct AnimSpriteData * out, s16 x, s16 y, int unused);

u16 sub_8072258(u16 terrain);
int sub_80723A4(struct Anim * anim);
u16 sub_80723D4(u16 basecon);
s16 sub_8072400(struct Anim * anim);
void sub_8072450(struct Anim * anim);
void sub_8072504(struct Anim * anim);
// ??? sub_8072548(???);
// ??? sub_8072570(???);
void sub_80726AC(void);
void sub_807289C(void);
// ??? sub_80728D0(???);
int sub_807290C(struct Anim * anim);
void PlaySFX(int, int, int, int);
// ??? sub_80729C0(???);

ProcPtr NewEfxPartsofScroll(void);
void sub_8074598(void);
// ??? nullsub_62(???);
// ??? sub_8074610(???);
ProcPtr NewEfxPartsofScroll2(void);
// ??? sub_8074634(???);
// ??? sub_8074638(???);
ProcPtr NewEfxleveluphb(void);
// ??? sub_807478C(???);
// ??? sub_8074798(???);
// ??? sub_80747A4(???);
void EkrLvupHBlank(void);
void EfxPartsofScroll2HBlank(void);
void NewEfxlvupbg(void * ais_main);
// ??? sub_807490C(???);
void NewEfxLvupBG2(void * ais_main);
// ??? sub_80749B0(???);
void NewEfxLvupOBJ2(void * ais_main, int, int);
// ??? sub_8074A54(???);
void NewEfxLvupBGCOL(void * ais_main);
// ??? sub_8074A94(???);
// ??? sub_8074AFC(???);
// ??? sub_8074B38(???);
// ??? sub_8074B40(???);
void NewEkrLvupApfx(int index, int pal);
void EkrLvupApfxEndEach(void);
// ??? sub_8074C10(???);
// ??? sub_8074C78(???);
void BanimDrawStatupAp(int, int, int, int, int, int);
// ??? sub_8074E6C(???);
// ??? sub_8074EDC(???);
// ??? sub_8074F14(???);

// ??? PutBanimBgIMG(???);
// ??? PutBanimBgTSA(???);
void PutBanimBgPAL(int);
void PutBanimBG(int);

int CheckBanimHensei(void);
void BeginAnimsOnBattle_Hensei(void);
void ExecEkrHenseiEnd(void);
void NewEkrHenseiInitPROC(void);
// ??? sub_8076380(???);
// ??? sub_80763E0(???);
// ??? sub_8076400(???);
// ??? sub_8076464(???);
void NewEkrHenseiEnd(void);
// ??? sub_8076484(???);
// ??? sub_80764B0(???);
// ??? sub_8076514(???);
void NewEkrDragonDemonKing(struct Anim * anim);
