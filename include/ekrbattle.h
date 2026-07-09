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
    EKR_DISTANCE_PROMOTION,

    EKR_DISTANCE_MAX
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
void efxSPDQuake_Loop(struct ProcEfxSpdQuake * proc);
void efxSPDQuake_Loop2(struct ProcEfxSpdQuake * proc);

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
void ekrBaStart_0(struct ProcEkrBattleStarting * proc);
void ekrBaStart_1(struct ProcEkrBattleStarting * proc);
void ekrBaStart_2(struct ProcEkrBattleStarting * proc);

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
void ekrBattleEnding_0(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_1(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_2(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_3(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_4(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_5(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_6(struct ProcEkrBattleEnding * proc);
void ekrBattleEnding_7(struct ProcEkrBattleEnding * proc);

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
extern void *gEkrbattle_0[2];
extern int gEkrDebugUnk2;
extern int gCtrlC01Blocking;

#define C01_BLOCKING_PRE_BATTLE(anim) (gCtrlC01Blocking == 1)
#define C01_BLOCKING_IN_BATTLE(anim) ((anim)->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE)

extern s16 gEkrXPosReal[2];
extern s16 gEkrYPosReal[2];
extern u16 gEkrXPosBase[2];
extern u16 gEkrYPosBase[2];
extern struct Vec2 gEkrBg0QuakeVec;
extern void *gEkrbattle_1[2];
extern void *gEkrbattle_2[2];
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
extern u8 gUnk_Banim_Ekrbattle_1[];
extern u8 gUnk_Banim_Ekrbattle_2[0x200];
extern u8 gUnk_Banim_Ekrbattle_3[0x200];
extern u8 gUnk_Banim_Ekrbattle_4[0x200];
extern u8 gUnk_Banim_Ekrbattle_5[0x200];
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
extern s16 gBanimPositionIsEnemy[2];
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
extern u8 gUnk_Banim_Ekrbattle_0[];
extern u32 gBanimDoneFlag[];
extern u32 gEkrBgPosition;
extern ProcPtr gpProcEfxAnimeDrv;
extern const void *gpImgSheet[2];
extern struct ProcEfxBGCOL * gpProcEkrTogiColor;
extern int gUnk_Banim_Ekrbattle_10;
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
extern int gEfxlvup_0;

extern int gEkrMainBgmPlaying;
extern int gEfxSoundSeExist;
// extern ??? gpProcEkrClasschg

extern struct ProcCmd gProc_ekrBattleDeamon[];
extern struct ProcCmd gProc_ekrBattle[];
extern struct ProcCmd ProcScr_ekrLvupFan[];
extern struct ProcCmd ProcScr_ekrGauge[];
extern u8 gEkrgauge_0[];
extern u8 gEkrgauge_1[];
extern u8 gEkrgauge_2[];
extern u8 gEkrgauge_3[];
extern u8 gEkrgauge_4[];
extern u8 gEkrgauge_5[];
extern u16 gEkrgauge_6[];
extern u16 gEkrgauge_7[];
extern u16 gEkrgauge_8[];
extern u16 gEkrgauge_9[];
extern u16 gEkrgauge_10[];
extern u16 gEkrgauge_11[];
extern struct ProcCmd gProc_ekrDispUP[];
extern struct ProcCmd ProcScr_efxHPBar[];
extern struct ProcCmd ProcScr_EfxHpBarResire[];
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
// extern ??? EfxQuakePureVecs
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
extern const u8 * CONST_DATA Imgs_Ekrbattleintro_0[];
extern const u8 * CONST_DATA Imgs_Ekrbattleintro_1[];
extern u32 * AnimScrs_Ekrbattleintro_0[];
extern u32 * AnimScrs_Ekrbattleintro_1[];
extern u32 * AnimScrs_Ekrbattleintro_2[];
extern u32 * AnimScrs_Ekrbattleintro_3[];
extern u32 * AnimScrs_Ekrbattleintro_4[];
extern u32 * AnimScrs_Ekrbattleintro_5[];
extern const u16 * CONST_DATA gEkrbattleintro_1[];
extern const u16 * CONST_DATA gEkrbattleintro_2[];
extern const u16 * CONST_DATA gEkrbattleintro_3[];
extern struct ProcCmd ProcScr_ekrUnitKakudai[];

extern AnimScr BanimScr_DefaultAnim[];
extern void *TsaConfs_BanimTmA[];
extern struct ProcCmd gProc_ekrChienCHR[];
extern struct ProcCmd gProc_efxAnimeDrvProc[];
extern struct ProcCmd ProcScr_ekrUnitMainMini[];
extern struct ProcCmd gProc_ekrTogiInit[];
extern struct ProcCmd gProc_ekrTogiEnd[];
extern struct ProcCmd gProc_ekrTogiColor[];

extern const s16 gEfxNoDmgBgShakeOff[];
// extern ??? gEfxbattle_0
extern const s16 gEfxQuakeVecs[];
// extern ??? gEfxbattle_1
extern const s16 gEfxQuakeVecs2[];
// extern ??? gEfxbattle_2
// extern ??? gEfxbattle_3
// extern ??? gEfxbattle_4
// extern ??? gEfxbattle_5
// extern ??? gEfxbattle_6
extern const u16 gFrameLut_EfxHPBarColorChange1[];
extern const u16 gFrameLut_EfxHPBarColorChange2[];
extern const u16 gFrameLut_EfxStatusUnit[];
extern const u16 gFrameLut_EfxWeaponIcon[];
extern const u16 gBattleparse_0[];
extern const u16 gBattleparse_1[];
extern const u16 gBattleparse_2[];
extern const u16 gBattleparse_3[];
extern const u16 gBattleparse_4[];
extern const u16 gBattleparse_5[];
extern const u16 gBattleparse_6[];
extern const u16 gBattleparse_7[];
extern const u16 gBattleparse_8[];
extern const u16 gBattleparse_9[];
extern const u8 BanimDefaultStandingTypes[5];
extern const u8 BanimTypesPosLeft[5];
extern const u8 BanimTypesPosRight[5];
extern const u16 BanimLeftDefaultPos[5];
extern u16 gBanimTerrainBlankTm[];
extern const u8 Img_ConstDataDB034_0[];
extern const u8 Img_ConstDataDB034_1[];
extern const u8 Img_ConstDataDB034_2[];
extern const u8 Img_ConstDataDB034_3[];
extern const u8 Img_ConstDataDB034_4[];
extern const u16 Pal_NewEkrBaseKaiten[2];
extern const u16 FrameConfig_AnimaHitBG[];
// extern ??? gFrameConfig_EfxmagicNosferatu_0
// extern ??? gEfxmagicHealstaves_0
// extern ??? gEfxmagicHealstaves_1
// extern ??? gEfxmagicHealstaves_2
// extern ??? gEfxmagicHealstaves_3
// extern ??? gEfxmagicHealstaves_4
// extern ??? gEfxmagicHealstaves_5
// extern ??? gEfxmagicHealstaves_6
// extern ??? gEfxmagicHealstaves_7
// extern ??? sIvaldiObj1AnimScrLut
// extern ??? gEfxmagicIvaldi_0
// extern ??? sMaohFlashEyeRObj2AnimScrLut
// extern ??? sMaohFlashEyeLObj2AnimScrLut
// extern ??? sMaohFlashEyeObj1AnimScrLut
// extern ??? sMaohFlashEyeFire1Obj1AnimScrLut
// extern ??? sMaohFlashEyeFire2Obj1AnimScrLut
// extern ??? sEvilEyeObjAnimScrLut
// extern ??? gUnknown_080DEBC8
// extern ??? sNaglfarObjSide0PositionOffsets
// extern ??? sNaglfarObjSide1PositionOffsets
// extern ??? sNaglfarObj2AnimScrLut
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
extern const u16 FrameConfig_EfxMagFcastBg1[];
extern const u16 FrameConfig_EfxMagFcastBg2[];
extern const u16 FrameConfig_EfxMagFcastBg3[];
extern const u16 FrameConfig_EfxMagFcastBg4[];
extern const u16 FrameConf_EfxMagdhisEffectBG[];
extern const u16 FrameConf_EfxChillEffectBG[];
extern const u16 FrameConf_EfxChillEffectBGCOL[];

extern CONST_DATA struct BattleAnimDef AnimConf_0[];
extern CONST_DATA struct BattleAnimDef AnimConf_1[];
extern CONST_DATA struct BattleAnimDef AnimConf_2[];
extern CONST_DATA struct BattleAnimDef AnimConf_3[];
extern CONST_DATA struct BattleAnimDef AnimConf_4[];
extern CONST_DATA struct BattleAnimDef AnimConf_5[];
extern CONST_DATA struct BattleAnimDef AnimConf_6[];
extern CONST_DATA struct BattleAnimDef AnimConf_7[];
extern CONST_DATA struct BattleAnimDef AnimConf_8[];
extern CONST_DATA struct BattleAnimDef AnimConf_9[];
extern CONST_DATA struct BattleAnimDef AnimConf_10[];
extern CONST_DATA struct BattleAnimDef AnimConf_11[];
extern CONST_DATA struct BattleAnimDef AnimConf_12[];
extern CONST_DATA struct BattleAnimDef AnimConf_13[];
extern CONST_DATA struct BattleAnimDef AnimConf_14[];
extern CONST_DATA struct BattleAnimDef AnimConf_15[];
extern CONST_DATA struct BattleAnimDef AnimConf_16[];
extern CONST_DATA struct BattleAnimDef AnimConf_17[];
extern CONST_DATA struct BattleAnimDef AnimConf_18[];
extern CONST_DATA struct BattleAnimDef AnimConf_19[];
extern CONST_DATA struct BattleAnimDef AnimConf_20[];
extern CONST_DATA struct BattleAnimDef AnimConf_21[];
extern CONST_DATA struct BattleAnimDef AnimConf_22[];
extern CONST_DATA struct BattleAnimDef AnimConf_23[];
extern CONST_DATA struct BattleAnimDef AnimConf_24[];
extern CONST_DATA struct BattleAnimDef AnimConf_25[];
extern CONST_DATA struct BattleAnimDef AnimConf_26[];
extern CONST_DATA struct BattleAnimDef AnimConf_27[];
extern CONST_DATA struct BattleAnimDef AnimConf_28[];
extern CONST_DATA struct BattleAnimDef AnimConf_29[];
extern CONST_DATA struct BattleAnimDef AnimConf_30[];
extern CONST_DATA struct BattleAnimDef AnimConf_31[];
extern CONST_DATA struct BattleAnimDef AnimConf_32[];
extern CONST_DATA struct BattleAnimDef AnimConf_33[];
extern CONST_DATA struct BattleAnimDef AnimConf_34[];
extern CONST_DATA struct BattleAnimDef AnimConf_35[];
extern CONST_DATA struct BattleAnimDef AnimConf_36[];
extern CONST_DATA struct BattleAnimDef AnimConf_37[];
extern CONST_DATA struct BattleAnimDef AnimConf_38[];
extern CONST_DATA struct BattleAnimDef AnimConf_39[];
extern CONST_DATA struct BattleAnimDef AnimConf_40[];
extern CONST_DATA struct BattleAnimDef AnimConf_41[];
extern CONST_DATA struct BattleAnimDef AnimConf_42[];
extern CONST_DATA struct BattleAnimDef AnimConf_43[];
extern CONST_DATA struct BattleAnimDef AnimConf_44[];
extern CONST_DATA struct BattleAnimDef AnimConf_45[];
extern CONST_DATA struct BattleAnimDef AnimConf_46[];
extern CONST_DATA struct BattleAnimDef AnimConf_47[];
extern CONST_DATA struct BattleAnimDef AnimConf_48[];
extern CONST_DATA struct BattleAnimDef AnimConf_49[];
extern CONST_DATA struct BattleAnimDef AnimConf_50[];
extern CONST_DATA struct BattleAnimDef AnimConf_51[];
extern CONST_DATA struct BattleAnimDef AnimConf_52[];
extern CONST_DATA struct BattleAnimDef AnimConf_53[];
extern CONST_DATA struct BattleAnimDef AnimConf_54[];
extern CONST_DATA struct BattleAnimDef AnimConf_55[];
extern CONST_DATA struct BattleAnimDef AnimConf_56[];
extern CONST_DATA struct BattleAnimDef AnimConf_57[];
extern CONST_DATA struct BattleAnimDef AnimConf_58[];
extern CONST_DATA struct BattleAnimDef AnimConf_59[];
extern CONST_DATA struct BattleAnimDef AnimConf_60[];
extern CONST_DATA struct BattleAnimDef AnimConf_61[];
extern CONST_DATA struct BattleAnimDef AnimConf_62[];
extern CONST_DATA struct BattleAnimDef AnimConf_63[];
extern CONST_DATA struct BattleAnimDef AnimConf_64[];
extern CONST_DATA struct BattleAnimDef AnimConf_65[];
extern CONST_DATA struct BattleAnimDef AnimConf_66[];
extern CONST_DATA struct BattleAnimDef AnimConf_67[];
extern CONST_DATA struct BattleAnimDef AnimConf_68[];
extern CONST_DATA struct BattleAnimDef AnimConf_69[];
extern CONST_DATA struct BattleAnimDef AnimConf_70[];
extern CONST_DATA struct BattleAnimDef AnimConf_71[];
extern CONST_DATA struct BattleAnimDef AnimConf_72[];
extern CONST_DATA struct BattleAnimDef AnimConf_73[];
extern CONST_DATA struct BattleAnimDef AnimConf_74[];
extern CONST_DATA struct BattleAnimDef AnimConf_75[];
extern CONST_DATA struct BattleAnimDef AnimConf_76[];
extern CONST_DATA struct BattleAnimDef AnimConf_77[];
extern CONST_DATA struct BattleAnimDef AnimConf_78[];
extern CONST_DATA struct BattleAnimDef AnimConf_79[];
extern CONST_DATA struct BattleAnimDef AnimConf_80[];
extern CONST_DATA struct BattleAnimDef AnimConf_81[];
extern CONST_DATA struct BattleAnimDef AnimConf_82[];
extern CONST_DATA struct BattleAnimDef AnimConf_83[];
extern CONST_DATA struct BattleAnimDef AnimConf_84[];
extern CONST_DATA struct BattleAnimDef AnimConf_85[];
extern CONST_DATA struct BattleAnimDef AnimConf_86[];
extern CONST_DATA struct BattleAnimDef AnimConf_87[];
extern CONST_DATA struct BattleAnimDef AnimConf_88[];
extern CONST_DATA struct BattleAnimDef AnimConf_89[];
extern CONST_DATA struct BattleAnimDef AnimConf_90[];
extern CONST_DATA struct BattleAnimDef AnimConf_91[];
extern CONST_DATA struct BattleAnimDef AnimConf_92[];
extern CONST_DATA struct BattleAnimDef AnimConf_93[];
extern CONST_DATA struct BattleAnimDef AnimConf_94[];
extern CONST_DATA struct BattleAnimDef AnimConf_95[];
extern CONST_DATA struct BattleAnimDef AnimConf_96[];
extern CONST_DATA struct BattleAnimDef AnimConf_97[];
extern CONST_DATA struct BattleAnimDef AnimConf_98[];
extern CONST_DATA struct BattleAnimDef AnimConf_99[];
extern CONST_DATA struct BattleAnimDef AnimConf_100[];

extern struct BattleAnimDef * gUnitSpecificBanimConfigs[];

void SetBanimLinkArenaFlag(int unk);
int GetBanimLinkArenaFlag(void);
void NewEkrBattleDeamon(void);
void EndEkrBattleDeamon(void);
int IsBattleDeamonActive(void); // battle?
// ??? ekrBattleDeamon_Destructor(???);
// ??? Nop_BanimEkrbattle_0(???);
void NewEkrBattle(void);
void InBattleMainRoutine(void);
void MainUpdateEkrBattle(void);
// ??? Nop_BanimEkrbattle_1(???);
// ??? ekrBattle_Init(???);
// ??? ekrBattleMain(???);
void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle * proc);
void ekrBattleWaitPreEvent(struct ProcEkrBattle * proc);
void ekrBattle_0(struct ProcEkrBattle * proc);
void ekrBattlePrepareDragonIntro(struct ProcEkrBattle * proc);
void ekrBattleExecDragonIntro(struct ProcEkrBattle * proc);
void ekrBattleWaitDragonIntro(struct ProcEkrBattle * proc);
void ekrBattlePostEkrDragonIntro(struct ProcEkrBattle * proc);
void ekrBattle_1(struct ProcEkrBattle * proc);
void ekrBattleSetFlashingEffect(struct ProcEkrBattle * proc);
void ekrBattleExecTriangleAtk(struct ProcEkrBattle * proc);
void ekrBattleWaitTriangleIdle(struct ProcEkrBattle * proc);
void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle * proc);
void ekrBattle_2(struct ProcEkrBattle * proc);
void ekrBattle_StartPromotion(struct ProcEkrBattle * proc);
void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle * proc);
void ekrBattleInRoundIdle(struct ProcEkrBattle * proc);
void ekrBattleOnBattleEnd(struct ProcEkrBattle * proc);
void ekrBattle_3(struct ProcEkrBattle * proc);
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle * proc);
void ekrBattleExecExpGain(struct ProcEkrBattle * proc);
void ekrBattle_4(struct ProcEkrBattle * proc);
void ekrBattle_5(struct ProcEkrBattle * proc);
void ekrBattleWaitExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattlePostExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattle_6(struct ProcEkrBattle * proc);
void ekrBattleLvupHanlder(struct ProcEkrBattle * proc);
void ekrBattle_ExecEkrLvup(struct ProcEkrBattle * proc);
void ekrBattle_WaitEkrLvupIdle(struct ProcEkrBattle * proc);
void ekrNewEkrPopup(struct ProcEkrBattle * proc);
void ekrBattle_WaitForPopup(struct ProcEkrBattle * proc);
void ekrBattle_PostPopup(struct ProcEkrBattle * proc);
void ekrBattle_TriggerDragonStatusFinished(struct ProcEkrBattle * proc);
void ekrBattle_WaitEkrDragonEndIdle(struct ProcEkrBattle * proc);
void ekrBattle_PostDragonStatusEffect(struct ProcEkrBattle * proc);
void Nop_BanimEkrbattle_2(struct ProcEkrBattle * proc);
void NewEkrLvlupFan(void);
void EkrLvupFanMain(struct ProcEkrLvupFan * proc);
// ??? EkrGauge_BuildHpBarGfx(???);
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
void EkrGauge_SetWtaArrowSprite(struct EkrGaugeStruct1 *buf, int a, int b);
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
void EfxInitTerrainBg(void);
void EfxPrepareScreenFx(void);
int GetBanimInitPosReal(void);
void SetEkrBg2QuakeVec(int a, int b);

void SpellFx_Nop(void);
void SpellFx_Begin(void);
void SpellFx_Finish(void);
void SpellFx_ClearBG1Position(void);
void SpellFx_ClearBG1(void);
void SpellFx_SetSomeColorEffect(void);
void SetDefaultColorEffects_(void);
void StartBattleAnimHitEffectsDefault(struct Anim * anim, int type);
void StartBattleAnimHitEffectsStrong(struct Anim * anim, int type);
void StartBattleAnimHitEffects(struct Anim * anim, int type, int a, int b);
void StartBattleAnimResireHitEffects(struct Anim * anim, int type);
void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type);
struct Anim * EfxCreateFrontAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
struct Anim * EfxCreateBackAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4);
void SpellFx_WriteBgMapRaw(struct Anim * anim, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMapUnused(u8 pos, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height);
void SpellFx_RegisterObjGfx(const u16 * img, u32 size);
void SpellFx_RegisterObjPal(const u16 * pal, u32 size);
void SpellFx_RegisterBgGfx(const u16 * img, u32 size);
void SpellFx_RegisterBgPal(const u16 * pal, u32 size);
void EfxCyclePaletteRaw(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst);
void EfxCyclePalette(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst);
void EfxCyclePaletteHi(const u16 *src, u16 *dst, u32 a, u32 b, u32 c);
s16 EfxAdvanceFrameLut(s16 * ptime, s16 * pcount, const s16 lut[]);
void SetEkrMiniAnimLayerFlag(void);
int EfxGetCamMovDuration(void);
void EfxTmFillA(u32 val);
void EfxTmFill(u32 val);
void SetEkrFrontAnimPostion(int type, s16, s16);
int Get0201FAC8(void);
void Set0201FAC8(int);

bool EkrBattleStarting_IsBattleAnimEnabled(void);
s8 EkrBattleStarting_CheckBattleAnimEnabled(void);
void BeginAnimsOnBattleAnimations(void);
void EkrMainEndExec(void);
void MainUpdate_0(void);

void EkrPrepareBanimfx(struct Anim * anim, u16);
s16 GetEfxHp(int index);
// ??? GetEfxHpModMaybe(???);
u16 IsItemDisplayedInBattle(u16 item);
u16 IsWeaponLegency(u16 item);
s16 EkrCheckWeaponSieglindeSiegmund(u16 item);
bool EkrCheckAttackRound(u16 round);
void SetBattleScripted(void);
void SetBattleUnscripted(void);
bool CheckBattleScripted(void);
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
    /* 00 */ s16 terrain_l; // terrain L
    /* 02 */ s16 pal_l; // pal ID L
    /* 04 */ s16 chr_l; // chr L
    /* 06 */ s16 terrain_r;
    /* 08 */ s16 pal_r;
    /* 0A */ s16 chr_r; // chr R
    /* 0C */ s16 distance;
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

void EkrUnitMainMini_UpdateAnim(struct AnimBuffer * pAnimBuf, struct Anim * anim);
void EkrMainMini_AnimMarkRoundEnd(struct Anim *);
void EkrMainMini_AnimUpdateFrameGfx(struct Anim *);
void InitMainMiniAnim(struct AnimBuffer * pAnimBuf);
void RestartMainMiniAnim(struct AnimBuffer * pAnimBuf);
void SetMainMiniAnimId(struct AnimBuffer * pAnimBuf, int animId, int charPalId);
void SetMainMiniAnimPos(struct AnimBuffer * pAnimBuf, u16 x, u16 y);
void SetMainMiniAnimLayer(struct AnimBuffer * pAnimBuf, u16 layer);
bool IsMainMiniAnimRoundEnd(struct AnimBuffer * pAnimBuf);
void ApplyMainMiniAnimHitEffect(struct AnimBuffer * pAnimBuf);
bool IsMainMiniAnimEnd(struct AnimBuffer * pAnimBuf);
void NewEfxAnimeDrvProc(void);
void EndEfxAnimeDrvProc(void);
void ExecAllAIS(void);
void NewEkrUnitMainMini(struct AnimBuffer * pAnimBuf);
void EndEkrUnitMainMini(struct AnimBuffer * pAnimBuf);
// ??? EkrUnitMainMiniMain(???);
// void InitBanimTerrain(void *);
// void EndBanimTerrain(void *);
// void SetBanimTerrainPos(void *, s16, s16, s16, s16);
void RegisterBanimTerrainTm(struct BanimUnkStructComm *);
void RegisterBanimTerrainTmByPos(s16, s16);

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
void EkrArenaBgScroll(int x);
void PlayDeathSoundForArena(void);
void StopArenaBattleMusic(void);
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

void EfxTmReplacePal(u16 * tm, u16 width, u16 height, int pal, int chr);
void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmAddPal(u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmModifyPal(u16 * tm, u16 width, u16 height);
void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr);
void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmCpyExt(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void EkrBuildGaugeBarTiles(u16 * tm, int arg1, int arg2);
void EkrModifyBarfx(u16 * tm, int);
bool EkrPalModifyUnused(u16 * src1, u16 * src2, u16 * dst, u16 a, u16 b, u16 c);
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalFlashingInOut(u16 * pal_buf, int line, int length, int r0, int g0, int b0);
void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length);
void EfxSplitColor(u16 * src, u8 * dst, u32 length);
void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length);
void EfxCalcSplitedColorStep(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref);
void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk);
void EfxChapterMapFadeOUT(int);
int LCGRand_N(int a);
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
// ??? EkrHenseiInit_Init(???);
// ??? EkrHenseiInit_SetupFade(???);
// ??? EkrHenseiInit_FadeInLoop(???);
// ??? EkrHenseiInit_End(???);
void NewEkrHenseiEnd(void);
// ??? EkrHenseiEnd_Init(???);
// ??? EkrHenseiEnd_FadeOutLoop(???);
// ??? EkrHenseiEnd_End(???);
void NewEkrDragonDemonKing(struct Anim * anim);

#define gBG0TilemapBuffer2D ((u16 (*)[1])gBG0TilemapBuffer)
