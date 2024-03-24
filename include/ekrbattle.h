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
    /* 44 */ const s16 * vecs;
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

extern u16 gAnimRoundData[];
s16 GetBattleAnimRoundType(int index);
s16 GetBattleAnimRoundTypeFlags(int);

#define GetRoundFlagByAnim(aAnim) (GetBattleAnimRoundTypeFlags((aAnim->nextRoundId - 1) * 2 + GetAnimPosition(aAnim)))

extern u16 gEfxHpLut[];

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
void EfxOverrideBgm(int songid, int volume);
void StopBGM1(void);
void UnregisterEfxSoundSeExist(void);
void RegisterEfxSoundSeExist(void);
int CheckEfxSoundSeExist(void);

/**
 * 00: PID
 * 04: songid
 * size = 08
 */
extern int gBanimBossBGMs[];

enum banim_faction_palette_idx {
    BANIMPAL_BLUE = 0,
    BANIMPAL_RED = 1,
    BANIMPAL_GREEN = 2,
    BANIMPAL_PURPLE = 3,
};

extern int gEkrDebugTimer, gEkrDebugUnk1;

extern u16 gBanimIdx_bak[2];
extern s16 gBanimUniquePal[2];

extern struct BattleUnit *gpEkrBattleUnitLeft;
extern struct BattleUnit *gpEkrBattleUnitRight;
extern struct Font gBanimFont;

extern struct Anim *gAnims[4];
extern void *gUnknown_02000010[2];
extern int gEkrDebugUnk2;
extern int gCtrlC01Blocking;

#define C01_BLOCKING_PRE_BATTLE(anim) (gCtrlC01Blocking == 1)
#define C01_BLOCKING_IN_BATTLE(anim) ((anim)->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE)

extern s16 gEkrXPosReal[2];
extern s16 gEkrYPosReal[2];
extern u16 gEkrXPosBase[2];
extern u16 gEkrYPosBase[2];
extern struct Vec2 gEkrBg0QuakeVec;
extern void *gUnknown_0200003C[2];
extern void *gUnknown_02000044[2];
extern void *gBanimTerrainPaletteMaybe[2];
extern u16 *gpEfxUnitPaletteBackup[2];
extern int *gpBanimModesLeft;
extern int *gpBanimModesRight;
extern struct ProcEkrBattle *gpProcEkrBattle;
extern struct ProcEkrGauge *gpProcEkrGauge;
extern u8 gBanimLeftImgSheetBuf[0x1000];
extern u8 gBanimRightImgSheetBuf[0x1000];
extern u16 gBanimPaletteLeft[0x50];
extern u16 gBanimPaletteRight[0x50];
extern u32 gBanimOaml[0x1600];
extern u32 gBanimOamr2[0x1600];
extern u16 gEfxPal[];
extern u16 gEfxTerrainPalette[];
extern u16 gObjBuf_EkrSideHitDmgCrit[];
extern u8 gUnk_Banim_02016DC8[];
extern u8 gUnk_Banim_02016E48[0x200];
extern u8 gUnk_Banim_02017048[0x200];
extern u8 gUnk_Banim_02017248[0x200];
extern u8 gUnk_Banim_02017448[0x200];
extern struct Text gBanimText[20];
extern u16 gEkrGaugeDecoder[];
extern u32 gEkrBattleEndFlag;

extern int gBanimLinkArenaFlag;
extern int gBattleDeamonActive;
extern struct ProcEkrBattleDeamon * gpProcEkrBattleDeamon;
extern s16 gEkrDebugModeMaybe;
extern s16 gBanimBG;
extern s16 gEkrInitialHitSide;
extern s16 gEkrSnowWeather;
extern s16 gBanimValid[2];
extern s16 gEkrInitialPosition[2];
extern s16 gBanimFactionPal[2];
extern s16 gEkrSpellAnimIndex[2];
extern EWRAM_DATA s16 gBanimFloorfx[2];
extern EWRAM_DATA short gEkrBmLocation[4];

extern s16 gEfxHpLutOff[];
extern s16 gBanimIdx[2];
extern u8 gEkrPids[2];
extern struct Unit *gpEkrTriangleUnits[2];
extern char *gBanimTriAtkPalettes[2];
extern void * gBanimForceUnitChgDebug[2];
extern s16 gEkrGaugeHp[2];
extern s16 gBanimMaxHP[2];
extern s16 gEkrGaugeHpBak[2];
extern s16 gEkrGaugeHit[2];
extern s16 gEkrGaugeDmg[2];
extern s16 gEkrGaugeCrt[2];
extern s16 gBanimExpPrevious[2];
extern s16 gBanimExpGain[2];
extern s16 gBanimTerrain[2];
extern s16 gBanimCon[2];
extern s16 gBanimWtaBonus[2];
extern s16 gBanimEffectiveness[2];
extern s16 gBanimUniquePaletteDisabled[2];

extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];
extern u8 gUnk_Banim_020145C8[];
extern u32 gBanimDoneFlag[];
extern u32 gEkrBgPosition;
extern ProcPtr gpProcEfxAnimeDrv;
extern const void *gpImgSheet[2];
extern struct ProcEfxBGCOL * gpProcEkrTogiColor;
extern int gUnk_Banim_0201FB28;
extern int gEkrBg2ScrollFlip;
extern u16 * gpBg2ScrollOffsetStart;
extern u16 * gpBg2ScrollOffset;
extern u16 gpBg2ScrollOffsetTable1[];
extern u16 gpBg2ScrollOffsetTable2[];
extern int gEkrBg1ScrollFlip;
extern u16 * gpBg1ScrollOffsetStart;
extern u16 * gpBg1ScrollOffset;
extern u16 gpBg1ScrollOffsetList1[];
extern u16 gpBg1ScrollOffsetList2[];
extern int gUnknown_02020044;

extern int gEkrMainBgmPlaying;
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
extern struct ProcCmd ProcScr_efxQuakePure[];
// extern ??? gUnknown_085B9804
extern struct ProcCmd ProcScr_EfxHitQuakePure[];
extern struct ProcCmd ProcScr_efxQuake[];
extern struct ProcCmd ProcScr_EfxHitQuake[];
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
extern const s16 gEfxQuakeVecs[];
// extern ??? gUnknown_080DA526
extern const s16 gEfxQuakeVecs2[];
// extern ??? gUnknown_080DA5BA
// extern ??? gUnknown_080DA604
// extern ??? gUnknown_080DA66E
// extern ??? gUnknown_080DA9F8
// extern ??? gUnknown_080DAA8E
extern const u16 gFrameLut_EfxHPBarColorChange1[];
extern const u16 gFrameLut_EfxHPBarColorChange2[];
extern const u16 gFrameLut_EfxStatusUnit[];
extern const u16 gFrameLut_EfxWeaponIcon[];
extern const u16 gUnknown_080DAE8C[];
extern const u16 gUnknown_080DAE96[];
extern const u16 gUnknown_080DAEA0[];
extern const u16 gUnknown_080DAEAA[];
extern const u16 gUnknown_080DAEB4[];
extern const u16 gUnknown_080DAEBE[];
extern const u16 gUnknown_080DAEC8[];
extern const u16 gUnknown_080DAED2[];
extern const u16 gUnknown_080DAEDC[];
extern const u16 gUnknown_080DAEE6[];
extern const u8 BattleTypeToAnimModeEndOfDodge[5];
extern const u8 BanimTypesPosLeft[5];
extern const u8 BanimTypesPosRight[5];
extern const u16 BanimLeftDefaultPos[5];
// extern ??? gUnknown_080DAF60
extern const u8 Img_080DB034[];
extern const u8 Img_080DB538[];
extern const u8 Img_080DB9C4[];
extern const u8 Img_080DBE1C[];
extern const u8 Img_080DC350[];
extern const u16 Pal_080DC85C[2];
extern const u16 gUnknown_080DCCA6[];
extern const u16 gUnknown_080DCCC0[];
extern const u16 gUnknown_080DCD26[];
extern const u16 gUnknown_080DCD72[];
extern const u16 gUnknown_080DCDE4[];
// extern ??? gFrameConfig_080DD1F4
// extern ??? gUnknown_080DD8C6
// extern ??? gUnknown_080DD8CC
// extern ??? gUnknown_080DD8D2
// extern ??? gUnknown_080DD8D8
// extern ??? gUnknown_080DD8EE
// extern ??? gUnknown_080DD930
// extern ??? gUnknown_080DD972
// extern ??? gUnknown_080DD9A4
// extern ??? gUnknown_080DE5E4
// extern ??? gUnknown_080DE624
// extern ??? gUnknown_080DE8A0
// extern ??? gUnknown_080DE8C0
// extern ??? gUnknown_080DE8DC
// extern ??? gUnknown_080DE900
// extern ??? gUnknown_080DE924
// extern ??? gUnknown_080DEA74
// extern ??? gUnknown_080DEBC8
// extern ??? gUnknown_080DEBF8
// extern ??? gUnknown_080DEC0C
// extern ??? gUnknown_080DEC30
// extern ??? gFrameConfig_GleipnirBg_Sigil
// extern ??? gFrameConfig_GleipnirBg_Nebula
// extern ??? gFrameConfig_GleipnirBg_Fog
// extern ??? gFrameConfig_efxCrimsonEyeBGFinish1
// extern ??? gFrameConfig_efxCrimsonEyeBG
// extern ??? gFrameConfig_efxDarkLongMonsBG01
// extern ??? gFrameConfig_efxDarkLongMonsBG02
// extern ??? gFrameConfig_efxGorgonBGDirt
// extern ??? gFrameConfig_efxGorgonBGTwister
extern const u16 gFrameConfig_efxGorgonBGFinish[];
extern const u16 FrameLut_EfxCriricalEffectBGCOL[];
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

extern CONST_DATA struct BattleAnimDef AnimConf_088AEFD8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AEFE4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AEFF0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AEFFC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF008[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF018[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF028[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF038[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF048[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF054[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF060[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF080[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0A0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0AC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0B8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0C4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0D0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF0EC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF108[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF114[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF120[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF12C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF138[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF144[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF150[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF168[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF180[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF198[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1B0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1C0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1D0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1DC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1E8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF1F8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF208[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF214[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF220[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF234[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF248[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF260[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF278[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF290[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF2A8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF2C0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF2D8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF2EC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF300[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF318[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF330[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF348[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF360[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF36C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF38C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3AC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3B8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3D0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3E4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3F0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF3FC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF408[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF420[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF434[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF44C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF468[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF480[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF498[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4B0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4C4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4D0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4DC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4E8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF4F8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF504[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF510[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF528[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF53C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF548[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF560[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF56C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF578[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF588[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF594[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5A4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5B0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5BC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5C8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5E0[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5EC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF5F8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF610[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF62C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF640[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF654[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF668[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF674[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF680[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF68C[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF6A4[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF6BC[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF6C8[];
extern CONST_DATA struct BattleAnimDef AnimConf_088AF6E0[];

extern struct BattleAnimDef * gUnitSpecificBanimConfigs[];

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
void EkrDispUP_SetPositionUnsync(u16, u16);
void EkrDispUP_SetPositionSync(u16 a, u16 b);
void SyncEkrDispUP(void);
void UnsyncEkrDispUP(void);
void AsyncEkrDispUP(void);
void UnAsyncEkrDispUP(void);
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
void StartBattleAnimResireHitEffects(struct Anim * anim, int type);
void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type);
struct Anim * EfxCreateFrontAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
struct Anim * EfxCreateBackAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
void sub_805560C(struct Anim * anim, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMapUnused(u8 pos, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height);
void SpellFx_RegisterObjGfx(const u16 * img, u32 size);
void SpellFx_RegisterObjPal(const u16 * pal, u32 size);
void SpellFx_RegisterBgGfx(const u16 * img, u32 size);
void SpellFx_RegisterBgPal(const u16 * pal, u32 size);
void sub_8055860(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst);
void sub_805588C(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst);
void sub_80558BC(const u16 *src, u16 *dst, u32 a, u32 b, u32 c);
s16 EfxAdvanceFrameLut(s16 * ptime, s16 * pcount, const s16 lut[]);
void sub_8055980(void);
int EfxGetCamMovDuration(void);
void sub_80559B0(u32 val);
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
s16 EkrCheckWeaponSieglindeSiegmund(u16 item);
bool EkrCheckAttackRound(u16 round);
void SetBattleScriptted(void);
void SetBattleUnscriptted(void);
bool CheckBattleScriptted(void);
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
void ApplyBanimUniquePalette(u32 *, int);
int GetBanimPalette(int banim_id, enum ekr_battle_unit_position pos);
void UpdateBanimFrame(void);
void InitMainAnims(void);
void InitBattleAnimFrame(int round_type_left, int round_type_right);
void InitLeftAnim(int);
void InitRightAnim(int);
void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int);
int GetAISLayerId(struct Anim * anim);

int CheckRound1(s16);
int CheckRound2(s16);
int CheckRoundCrit(struct Anim * anim);
struct Anim * GetAnimAnotherSide(struct Anim * anim);
s16 GetAnimRoundType(struct Anim * anim);
s16 GetAnimNextRoundType(struct Anim * anim);
s16 GetAnimRoundTypeAnotherSide(struct Anim * anim);
s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim);
void SetAnimStateHidden(int ais_id);
void SetAnimStateUnHidden(int ais_id);

struct BanimUnkStructComm
{
    /* 00 */ s16 unk00; // terrain L
    /* 02 */ s16 unk02; // pal ID L
    /* 04 */ s16 unk04; // chr L
    /* 06 */ s16 unk06; // terrain R
    /* 08 */ s16 unk08; // pal ID R
    /* 0A */ s16 unk0A; // chr R
    /* 0C */ s16 unk0C;
    /* 0E */ s16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ ProcPtr proc14; // sub emulator proc a
    /* 18 */ ProcPtr proc18; // sub emulator proc b
    /* 1C */ void * unk1C;
    /* 20 */ void * unk20;
    /* 24 */ void * unk24;
};

struct AnimBuffer
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 genericPalId;
    /* 02 */ u16 xPos;
    /* 04 */ u16 yPos;
    /* 06 */ s16 animId;
    /* 08 */ s16 charPalId;
    /* 0A */ u16 roundType;
    /* 0C */ u16 state2;
    /* 0E */ u16 oam2Tile;
    /* 10 */ u16 oam2Pal;
    /* 14 */ struct Anim * anim1;
    /* 18 */ struct Anim * anim2;
    /* 1C */ void * pImgSheetBuf;
    /* 20 */ void * unk_20; // pal
    /* 24 */ void * unk_24; // rtlOam
    /* 28 */ void * unk_28; // frameData
    /* 2C */ const void * unk_2C; // sheetPointer
    /* 30 */ void * unk_30; // magicEffects
    /* 34 */ void * unk_34; // ProcPtr; Procs_ekrUnitMainMini
};

void sub_805A3DC(struct AnimBuffer * pAnimBuf, struct Anim * anim);
void sub_805A580(struct Anim *);
void sub_805A5A8(struct Anim *);
void sub_805A60C(struct AnimBuffer * pAnimBuf);
void sub_805A7B4(struct AnimBuffer * pAnimBuf);
void sub_805A930(struct AnimBuffer * pAnimBuf, int animId, int charPalId);
void sub_805A940(struct AnimBuffer * pAnimBuf, u16 x, u16 y);
void sub_805A95C(struct AnimBuffer * pAnimBuf, u16 layer);
bool sub_805A96C(struct AnimBuffer * pAnimBuf);
void sub_805A990(struct AnimBuffer * pAnimBuf);
bool sub_805A9A4(struct AnimBuffer * pAnimBuf);
void NewEfxAnimeDrvProc(void);
void EndEfxAnimeDrvProc(void);
void ExecAllAIS(void);
void NewEkrUnitMainMini(struct AnimBuffer * pAnimBuf);
void sub_805AA28(struct AnimBuffer * pAnimBuf);
// ??? EkrUnitMainMiniMain(???);
// void sub_805AA68(void *);
// void sub_805AE14(void *);
// void sub_805AE40(void *, s16, s16, s16, s16);
void sub_805AE58(void *);
void sub_805AFA0(int, s16);

struct ProcEkrTogi
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
};

struct ProcEfxBGCOL;

void SetBanimArenaFlag(int flag);
int GetBattleAnimArenaFlag(void);
void sub_805B034(int x);
void PlaySound8FForArenaMaybe(void);
void sub_805B094(void);
void BeginAnimsOnBattle_Arena(void);
void ExecBattleAnimArenaExit(void);
void NewEkrTogiInitPROC(void);
void ekrTogiInit_Init(ProcPtr proc);
void ekrTogiInit_LoadGfx(struct ProcEkrTogi * proc);
void ekrTogiInit_Loop(struct ProcEkrTogi * proc);
void ekrTogiInit_End(ProcPtr proc);
void NewEkrTogiEndPROC(void);
void ekrTogiEnd_Init(struct ProcEkrTogi * proc);
void ekrTogiEnd_Loop(struct ProcEkrTogi * proc);
void ekrTogiEnd_End(ProcPtr proc);
void NewEkrTogiColor(void);
void EndEkrTogiColor(void);
void ekrTogiColor_Loop(struct ProcEfxBGCOL * proc);

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
void EfxPalFlashingInOut(u16 * pal_buf, int line, int length, int r0, int g0, int b0);
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

void M4aPlayWithPostionCtrl(int, int, int);
void EfxPlaySEwithCmdCtrl(struct Anim * anim, int);
u16 GetEfxSoundType1FromTerrain(u16 terrain);
int IsAnimSoundInPositionMaybe(struct Anim * anim);
u16 GetEfxSoundType2FromBaseCon(u16 basecon);

enum efx_hp_change_type {
    EFX_HPT_CHANGED = 0,
    EFX_HPT_DEFEATED = 1,
    EFX_HPT_NOT_CHANGE = 2
};

s16 GetEfxHpChangeType(struct Anim * anim);
void EfxPlayHittedSFX(struct Anim * anim);
void EfxPlayCriticalHittedSFX(struct Anim * anim);
int EfxCheckRetaliation(int is_retaliation);
int EfxCheckStaffType(int weapon);
void EkrPlayMainBGM(void);
void EkrRestoreBGM(void);
int GetBanimBossBGM(struct Unit * unit);
int GetProperAnimSoundLocation(struct Anim * anim);
void PlaySFX(int, int, int, int);
void PlaySfxAutomatically(int songid, int volume, struct Anim * anim);

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
