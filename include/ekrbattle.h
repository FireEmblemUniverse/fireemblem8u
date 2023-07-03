#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"

enum ekr_battle_unit_position {
    EKR_POS_L,
    EKR_POS_R
};

int GetAnimPosition(struct Anim *anim);

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
    /* 5C */ struct Anim *anim;
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
    /* 2A */ u8 unk2A;
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
    EKR_DISTANCE_3,
    EKR_DISTANCE_PROMOTION
};
extern s16 gEkrDistanceType;

struct ProcEfxSpdQuake {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 unk2C;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ struct Vec2 *unk44;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim *anim;
};

void NewEfxspdquake(struct Anim *anim);
void sub_8055A64(struct ProcEfxSpdQuake *proc);
void sub_8055B38(struct ProcEfxSpdQuake *proc);

struct ProcEkrBattleStarting {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x2C - 0x29];

    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ u16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    /* 36 */ u8 _pad_36[0x3A - 0x36];

    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
};

struct ProcEkrChienCHR {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x5C - 0x29];
    /* 5C */ struct Anim *anim;
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

extern u8 gEfxHpLut[];

struct BanimRoundScript {
    u8 frame_front;
    u8 priority_front;
    u8 frame_back;
    u8 priority_back;
};

// extern const struct BanimRoundScript gBanimRoundScripts[ANIM_ROUND_MAX * 4];
extern const u8 gBanimRoundScripts[ANIM_ROUND_MAX * 4];

struct ProcEkrSubAnimeEmulator {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2E);
    /* 2E */ s16 unk2E;
    STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 unk32;
};

struct ProcEkrSubAnimeEmulator *NewEkrsubAnimeEmulator(int x, int y, u16 *buf[], int, int, int, int);
// ??? EkrsubAnimeEmulatorMain(???);

extern int gEkrDebugTimer, gEkrDebugUnk1;

extern u16 gEkrPairBanimID[2];
extern s16 gBattleInitSide[2];

extern struct BattleUnit *gpEkrBattleUnitLeft;
extern struct BattleUnit *gpEkrBattleUnitRight;
extern struct Font gSomeFontStruct;

extern void *gUnknown_02000010[2];
extern int gEkrDebugUnk2;
extern int gEkrDebugUnk3;
extern s16 gEkrXPosBase[2];
extern s16 gEkrYPosBase[2];
extern u16 gUnknown_02000030[];
extern u16 gUnknown_02000034[];
extern struct Vec2 gEkrBg0QuakeVec;
extern void *gUnknown_0200003C[2];
extern void *gUnknown_02000044[2];
extern void *gBanimTerrainPaletteMaybe[2];
extern u16 *gpEfxUnitPaletteBackup[2];
extern int *gpBanimModesLeft;
extern int *gpBanimModesRight;
extern struct ProcEkrBattle *gpProcEkrBattle;
extern struct ProcEkrGauge *gpProcEkrGauge;
extern u8 gUnknown_02000088[];
extern u8 gUnknown_02002088[];

extern int gBanimLinkArenaFlag;
extern int gBattleDeamonActive;
extern struct ProcEkrBattleDeamon *gpProcEkrBattleDeamon;
extern short gEkrDebugModeMaybe;
extern short gEkrPairSomeTile;
extern short gEkrInitialHitSide;
extern short gEkrSnowWeather;
extern short gEkrPairSideVaild[2];
extern short gEkrInitialPosition[2];
extern short gBanimSomeObjPalIndex[2];
extern short gEkrSpellAnimIndex[];
// extern ??? gUnknown_0203E11A
extern EWRAM_DATA s16 gBanimTerrainIndexMaybe[2];
extern EWRAM_DATA short gEkrPairBmLoc[4];
// extern ??? gAnimRoundData
extern short gEfxPairHpBufOffset[];
extern short gEkrPairBanimID2[];
extern u8 gEkrPids[2];
extern struct Unit *gpEkrTriangleUnits[2];
extern char *gBanimCharacterTSAs[2];
extern int gUnknown_0203E1A4[2];
extern short gEkrGaugeHp[2];
extern short gEkrPairMaxHP[2];
extern short gUnknown_0203E1B4[2];
extern short gEkrPairHit[2];
extern short gEkrPairDmgPair[2];
extern short gEkrPairCritPair[2];
extern short gEkrPairExpPrevious[2];
extern short gEkrPairExpGain[2];
extern short gEkrPairTerrainID[2];
extern short gEkrPairBaseCon[2];
extern short gEkrPairWTABonus[2];
extern short gEkrPairEffectiveAgainst[2];
extern short gUnknown_0203E1DC[2];

// extern ??? gUnknown_020200A8
// extern ??? gUnknown_020200AC
// extern ??? gpProcEkrClasshg

extern struct ProcCmd gProc_ekrBattleDeamon[];
extern struct ProcCmd gProc_ekrBattle[];
extern struct ProcCmd ProcScr_ekrLvupFan[];
extern struct ProcCmd gProc_ekrGauge[];
// extern ??? gUnknown_085B93D0
// extern ??? gUnknown_085B940C
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
extern struct ProcCmd gProc_efxFlashBG[];
extern struct ProcCmd gProc_efxWhiteOUT[];
extern struct ProcCmd gProc_efxWhiteIN[];
extern struct ProcCmd gProc_efxBlackOUT[];
extern struct ProcCmd gProc_efxBlackIN[];
extern struct ProcCmd gProc_efxFlashHPBar[];
extern struct ProcCmd ProcScr_efxHPBarColorChange[];
extern struct ProcCmd gProc_efxFlashUnit[];
extern struct ProcCmd gProc_efxFlashUnitEffect[];
extern struct ProcCmd ProcScr_efxStatusUnit[];
extern struct ProcCmd ProcScr_efxWeaponIcon[];
extern struct ProcCmd ProcScr_efxSpellCast[];
extern struct ProcCmd ProcScr_efxSPDQuake[];
extern struct ProcCmd ProcScr_ekrBattleStarting[];
extern struct ProcCmd gProc_ekrbattleendin[];
// extern ??? gProc_EkrBaseKaiten
// extern ??? gUnknown_085B9B84
// extern ??? gUnknown_085B9BA4
// extern ??? gUnknown_085B9BC4
// extern ??? gUnknown_085B9BE4
// extern ??? gUnknown_085B9C04
// extern ??? gUnknown_085B9C24
// extern ??? gUnknown_085B9C44
// extern ??? gUnknown_085B9C64
// extern ??? gUnknown_085B9C84
// extern ??? gUnknown_085B9CA4
// extern ??? gUnknown_085B9CC4
// extern ??? ProcScr_ekrUnitKakudai
extern struct ProcCmd gProc_ekrWindowAppear[];
extern struct ProcCmd gProc_ekrNamewinAppear[];
extern struct ProcCmd ProcScr_ekrBaseAppear[];
extern u32 BanimScr_085B9D5C[4];
extern void *gUnknown_085B9D6C[];
extern struct ProcCmd gProc_ekrChienCHR[];
extern struct ProcCmd gProc_efxAnimeDrvProc[];
extern struct ProcCmd ProcScr_ekrUnitMainMini[];
extern struct ProcCmd gProc_ekrTogiInit[];
extern struct ProcCmd gProc_ekrTogiEnd[];
extern struct ProcCmd gProc_ekrTogiColor[];

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
void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle *proc);
void ekrBattleWaitPreEvent(struct ProcEkrBattle *proc);
void ekrBattle_8050134(struct ProcEkrBattle *proc);
void ekrBattlePrepareDragonIntro(struct ProcEkrBattle *proc);
void ekrBattleExecDragonIntro(struct ProcEkrBattle *proc);
void ekrBattleWaitDragonIntro(struct ProcEkrBattle *proc);
void ekrBattlePostEkrDragonIntro(struct ProcEkrBattle *proc);
void ekrBattle_8050290(struct ProcEkrBattle *proc);
void ekrBattleSetFlashingEffect(struct ProcEkrBattle *proc);
void ekrBattleExecTriangleAtk(struct ProcEkrBattle *proc);
void ekrBattleWaitTriangleIdle(struct ProcEkrBattle *proc);
void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle *proc);
void ekrBattle_80503EC(struct ProcEkrBattle *proc);
void ekrBattle_8050400(struct ProcEkrBattle *proc);
void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle *proc);
void ekrBattleInRoundIdle(struct ProcEkrBattle *proc);
void ekrBattleOnBattkeEnd(struct ProcEkrBattle *proc);
void ekrBattle_8050600(struct ProcEkrBattle *proc);
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc);
void ekrBattleExecExpGain(struct ProcEkrBattle *proc);
void ekrBattle_80508F0(struct ProcEkrBattle *proc);
void ekrBattle_8050940(struct ProcEkrBattle *proc);
void ekrBattleWaitExpBarIdle(struct ProcEkrBattle *proc);
void ekrBattlePostExpBarIdle(struct ProcEkrBattle *proc);
void ekrBattle_8050AB8(struct ProcEkrBattle *proc);
void ekrBattleLvupHanlder(struct ProcEkrBattle *proc);
void ekrBattle_ExecEkrLvup(struct ProcEkrBattle *proc);
void ekrBattle_WaitEkrLvupIdle(struct ProcEkrBattle *proc);
void ekrNewEkrPopup(struct ProcEkrBattle *proc);
void ekrBattle_WaitForPopup(struct ProcEkrBattle *proc);
void ekrBattle_PostPopup(struct ProcEkrBattle *proc);
void ekrBattle_TriggerDragonStatusFinished(struct ProcEkrBattle *proc);
void ekrBattle_WaitEkrDragonEndIdle(struct ProcEkrBattle *proc);
void ekrBattle_PostDragonStatusEffect(struct ProcEkrBattle *proc);
void nullsub_69(struct ProcEkrBattle *proc);
void NewEkrLvlupFan(void);
void EkrLvupFanMain(struct ProcEkrLvupFan *proc);
// ??? sub_8050E40(???);
// ??? ModDec(???);
void NewEkrGauge(void);
void EndEkrGauge(void);
void EkrGauge_Clr4C50(void);
void EkrGauge_Set4C50(void);
void EkrGauge_Set4C(void);
void EkrGauge_Set50(void);
void EkrGauge_Setup44(u16 val);
void EkrGauge_Clr323A(int x, int y);
void EkrGauge_Setxy323A(s16 x, s16 y);
// ??? EkrGauge_SetInitFlag(???);
void EkrGauge_ClrInitFlag(void);
void EkrGauge_Set2A(void);
void EkrGauge_Clr2A(void);
// ??? sub_8051238(???);
void ekrGaugeMain(struct ProcEkrGauge *proc);
void NewEkrDispUP(void);
// ??? EndEkrDispUP(???);
void EkrDispUpClear4C50(void);
// ??? EkrDispUpSet4C50(???);
void EkrDispUpSet4C(void);
void EkrDispUpSet50(void);
void EkrDispUP_8051B48(u32, u32);
void sub_8051B5C(u16 a, u16 b);
// ??? sub_8051B70(???);
void sub_8051B80(void);
void sub_8051B90(void);
void sub_8051BA0(void);
// ??? ekrDispUPMain(???);
void EfxClearScreenFx(void);
void sub_8051E00(void);
void EfxPrepareScreenFx(void);
int GetEkrSomePosMaybe(void);
void sub_8052214(int a, int b);
void EkrEfxStatusClear(void);
int CheckEkrHitDone(void);
short EkrEfxIsUnitHittedNow(int pos);
void NewEfxHPBar(struct Anim *anim);
// ??? EfxHp_BarDeclineWithDeathJudge(???);
// ??? efxHPBarMain(???);
// ??? efxHPBarWaitForFarFarCamMoveMaybe(???);
void NewEfxHPBarResire(struct Anim *anim);
// ??? EfxHPBarResire_80526C8(???);
// ??? EfxHPBarResire_8052788(???);
// ??? EfxHPBarResire_805282C(???);
void NewEfxAvoid(struct Anim *anim);
// ??? EfxAvoidMain(???);
// ??? NewEfxHPBarLive(???);
// ??? EfxHPBarLiveMain(???);
void NewEfxNoDmage(struct Anim *anim1, struct Anim *anim2, int death);
// ??? EfxNoDamageMain(???);
void NewEfxNoDamageYure(struct Anim *anim1, struct Anim *anim2);
// ??? EfxNoDamageYureMain(???);
void NewEfxStatusCHG(struct Anim *anim);
// ??? EfxStatusCHGMain(???);

void NewEfxFarAttackWithDistance(struct Anim *anim, int arg);
// ??? sub_80534AC(???);
// ??? sub_80534E4(???);
// ??? sub_8053514(???);
// ??? sub_8053584(???);
void sub_8053618();
ProcPtr NewEfxQuakePure(int, int);
// ??? sub_80536B8(???);
// ??? NewEfxHitQuakePure(???);
// ??? nullsub_56(???);
// ??? NewEfxQuake(???);
// ??? sub_805382C(???);
void NewEfxHitQuake(struct Anim *anim1, struct Anim *anim2, int);
// ??? sub_8053BBC(???);
void StartSpellBG_FLASH(struct Anim *anim, int);
// ??? sub_8053F4C(???);
void NewEfxFlashBG(struct Anim *anim, int);
// ??? sub_8053FC4(???);
// ??? sub_8053FE4(???);
// ??? sub_805401C(???);
// ??? sub_8054030(???);
// ??? sub_8054054(???);
// ??? sub_80540B0(???);
// ??? sub_8054120(???);
// ??? sub_8054134(???);
// ??? sub_8054158(???);
// ??? sub_80541B4(???);
// ??? sub_8054224(???);
// ??? sub_8054238(???);
// ??? sub_805425C(???);
// ??? sub_80542B8(???);
// ??? sub_8054328(???);
// ??? sub_805433C(???);
// ??? sub_8054360(???);
// ??? sub_80543BC(???);
// ??? sub_805442C(???);
void NewEfxFlashHPBar(struct Anim *anim, int a, int b);
// ??? sub_8054478(???);
// ??? sub_8054498(???);
// ??? sub_805452C(???);
void NewEfxHPBarColorChange(struct Anim *anim);
void EndEfxHPBarColorChange(void);
void EfxHPBarColorChangeSet29(void);
void EfxHPBarColorChangeClear29(void);
// ??? sub_80546E4(???);
void NewEfxFlashUnit(struct Anim *anim, int a, int b, int c);
// ??? sub_8054818(???);
// ??? sub_8054888(???);
// ??? sub_80548E0(???);
// ??? sub_8054930(???);
// ??? sub_80549BC(???);

void sub_805515C(void);
void SpellFx_Begin(void);
void SpellFx_Finish(void);
void SpellFx_SpellFx_ClearBG1Position(void);
void SpellFx_ClearBG1(void);
void SpellFx_SetSomeColorEffect(void);
void SetDefaultColorEffects_(void);
void StartBattleAnimHitEffectsDefault(struct Anim *anim, int type);
void sub_8055288(struct Anim *anim, int type);
void StartBattleAnimHitEffects(struct Anim *anim, int type, int a, int b);
// ??? StartBattleAnimResireHitEffects(???);
// ??? sub_8055518(???);
struct Anim *EfxAnimCreate1(struct Anim *anim, const u32 *scr1, const u32 *scr2, const u32 *scr3, const u32 *scr4);
struct Anim *EfxAnimCreate2(struct Anim *anim, const u32 *scr1, const u32 *scr2, const u32 *scr3, const u32 *scr4);
// ??? sub_805560C(???);
void SpellFx_WriteBgMap(struct Anim *anim, const u16 *src1, const u16 *src2);
// ??? sub_80556F0(???);
// ??? sub_805576C(???);
void SpellFx_RegisterObjGfx(const u16 *img, u32 size);
void SpellFx_RegisterObjPal(const u16 *pal, u32 size);
void SpellFx_RegisterBgGfx(const u16 *img, u32 size);
void SpellFx_RegisterBgPal(const u16 *pal, u32 size);
// ??? sub_8055860(???);
// ??? sub_805588C(???);
// ??? sub_80558BC(???);
s16 SpellFx_InterpretBgAnimScript(s16 *ptime, s16 *pcount, const s16 lut[]);
// ??? sub_8055980(???);
int GetAnimationStartFrameMaybe(void);
// ??? sub_80559B0(???);
void sub_80559D0(u32 val);
void SetEkrFrontAnimPostion(int type, s16, s16);
int Get0201FAC8(void);
void Set0201FAC8(int);

// ??? sub_8055BB4(???);
s8 sub_8055BC4(void);
void BeginAnimsOnBattleAnimations(void);
void EkrMainEndExec(void);
void MainUpdate_8055C68(void);
void NewEkrBattleStarting(void);
// ??? ekrBaStart_InitScreen(???);
// ??? ekrBaStart_SreenFailIn(???);
// ??? ekrBaStart_InitBattleScreen(???);
// ??? ekrBaStart_ExecEkrBattle6C(???);
// ??? ekrBaStart_8055FE8(???);
// ??? ekrBaStart_8056024(???);
// ??? ekrBaStart_8056078(???);
void NewEkrbattleending(void);
// ??? ekrBattleEnding_80560F0(???);
// ??? ekrBattleEnding_8056170(???);
// ??? ekrBattleEnding_80561C8(???);
// ??? ekrBattleEnding_8056228(???);
// ??? ekrBattleEnding_8056288(???);
// ??? ekrBattleEnding_8056310(???);
// ??? ekrBattleEnding_8056390(???);
// ??? ekrBattleEnding_8056484(???);
void NewEkrBaseKaiten(struct Anim *anim);
// ??? sub_8056864(???);
void NewEkrUnitKakudai(struct Anim *anim);
// ??? UnitKakudai1(???);
// ??? UnitKakudai2(???);
// ??? sub_8056D18(???);
void NewEkrWindowAppear(int, int);
bool DoesEkrWindowAppearExist(void);
// ??? sub_8056D90(???);
void NewEkrNamewinAppear(int, int, int);
bool CheckEkrNamewinAppearUnexist(void);
// ??? sub_8056E7C(???);
// ??? sub_8056EA4(???);
void NewEkrBaseAppear(int, int);
// ??? CheckEkrBaseAppearExist(???);
// ??? EndEkrBaseAppear(???);

void EkrPrepareBanimfx(struct Anim *anim, u16);
s16 GetEfxHp(int index);
// ??? GetEfxHpModMaybe(???);
// ??? IsItemDisplayedInBattle(???);
u16 IsWeaponLegency(u16 item);
// ??? sub_8058B08(???);
// ??? sub_8058B24(???);
// ??? sub_8058B64(???);
void sub_8058B70(void);
bool sub_8058B7C(void);
// ??? GetEkrHit(???);
// ??? GetEkrDmg(???);
// ??? GetEkrCrit(???);
void BattleAIS_ExecCommands(void);
// ??? _08058BD4(???);
// ??? _080596E0(???);
void sub_80598CC(struct Anim *anim);
void NewEkrChienCHR(struct Anim *anim);
// ??? EkrChienCHRMain(???);
void RegisterAISSheetGraphics(struct Anim *anim);
void sub_8059970(u32 *, int);
int GetBanimPalette(int banim_id, enum ekr_battle_unit_position pos);
void UpdateBanimFrame(void);
void InitBothAIS(void);
void BattleAnimationAISInit(int, int);
void InitLeftAnim(int);
void InitRightAnim(int);
void SwitchAISFrameDataFromBARoundType(struct Anim *anim, int);
int GetAISLayerId(struct Anim *anim);

int CheckRound1(s16);
int CheckRound2(s16);
int CheckRoundCrit(struct Anim *anim);
struct Anim *GetAnimAnotherSide(struct Anim *anim);
// ??? GetAnimRoundType(???);
s16 GetAnimNextRoundType(struct Anim *anim);
s16 GetAnimRoundTypeAnotherSide(struct Anim *anim);
s16 GetAnimNextRoundTypeAnotherSide(struct Anim *anim);
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
void sub_8070D04(void *ptr, u16 a, u16 b, int r3, int r4);
void FillBGRect(void *ptr, u16 a, u16 b, int r3, int r4);
void sub_8070DBC(void *tm, int a, int b, int c, int d);
// ??? sub_8070E24(???);
void sub_8070E94(const void *ptr1, void *ptr2, u16 a, u16 b, int r4, int r5);
void sub_8070EC4(const u16 *tsa, u16 *tm, u16, u16, int, int);
void sub_8070EF4(void *, int, void *, int, int, int, int, int);
void sub_8070FA4(void *, int, void *, int, int, int, int, int);
// ??? sub_8071068(???);
void sub_8071140(void *ptr, int);
// ??? sub_80711C0(???);
void EkrMaybePalFadeWithVal(void *pal_buf, int line, int length, int ref);
void sub_807132C(void *ptr, int, int, int);
void EfxSomePalFlash(u16 *pal, int, int, int r, int g, int b);
void sub_8071468(u16 *pal, u16 *, int);
void sub_80714DC(u16 *, u8 *, int);
void sub_807151C(u16 *, u8 *, int);
void sub_8071574(s8 *, s8 *, u16 *, int, int);
void sub_80715F4(void *, void *, void *, void *, int, int, int);
void EkrUpdateSomePalMaybe(int);
// ??? sub_80716B0(???);

// ??? sub_80717D4(???);
// ??? sub_80717F0(???);
// ??? EkrEfxHandleUnitHittedEffect(???);
void EfxPlaySE(int, int);
// ??? Loop6C_efxSoundSE(???);
void DoM4aSongNumStop(int);
// ??? sub_8071A54(???);
// ??? StopBGM1(???);
void sub_8071A8C(void);
// ??? sub_8071A98(???);
// ??? sub_8071AA4(???);
void M4aPlayWithPostionCtrl(int, int, int);
void EfxPlaySEwithCmdCtrl(struct Anim *anim, int);
// ??? sub_8072258(???);
int sub_80723A4(struct Anim *anim);
// ??? sub_80723D4(???);
// ??? sub_8072400(???);
void sub_8072450(struct Anim *anim);
// ??? sub_8072504(???);
// ??? sub_8072548(???);
// ??? sub_8072570(???);
void sub_80726AC(void);
void sub_807289C(void);
// ??? sub_80728D0(???);
// ??? sub_807290C(???);
void EkrSoundSomeBark(int, int, int, int);
// ??? sub_80729C0(???);
bool EkrClasschgFinished(void);
void EndEkrClasschg(void);
void NewEkrClassChg(struct Anim *anim);
// ??? sub_8072A44(???);
// ??? sub_8072DC0(???);
// ??? EndEfxStatusUnit(???);
// ??? sub_8072DD8(???);
// ??? sub_8072E1C(???);
// ??? sub_8072E60(???);
// ??? NewEfxClasschgBGSE00(???);
// ??? sub_8072EF4(???);
// ??? NewEfxClasschgBGSE01(???);
// ??? sub_8072F74(???);
// ??? NewEfxClasschgOBJGain(???);
// ??? sub_8072FD0(???);
// ??? NewEfxClasschgOBJDrop(???);
// ??? sub_8073034(???);
// ??? NewEfxClasschgOBJDiffusion(???);
// ??? sub_80730AC(???);
// ??? NewEfxClasschgFIN(???);
// ??? sub_80731C8(???);
// ??? NewEfxClasschgCLONE(???);
// ??? sub_8073240(???);
// ??? sub_80732A4(???);
// ??? NewEfxBlackInOutUnit(???);
// ??? sub_80732E0(???);
// ??? NewEfxWhiteInOutUnit(???);
// ??? sub_80733C0(???);
// ??? NewEfxClasschgRST(???);
// ??? sub_80734AC(???);
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
void NewEfxlvupbg(void *ais_main);
// ??? sub_807490C(???);
void NewEfxLvupBG2(void *ais_main);
// ??? sub_80749B0(???);
void NewEfxLvupOBJ2(void *ais_main, int, int);
// ??? sub_8074A54(???);
void NewEfxLvupBGCOL(void *ais_main);
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
void NewEkrDragonDemonKing(struct Anim *anim);
