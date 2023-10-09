#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

#include "global.h"
#include "proc.h"
#include "fontgrp.h"

enum {
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

#define SCREEN_TILE_X(xPos) ((xPos) - (gBmSt.camera.x >> 4))
#define SCREEN_TILE_Y(yPos) ((yPos) - (gBmSt.camera.y >> 4))

struct MAExpBarProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short expFrom;
    /* 66 */ short expTo;
    /* 68 */ short actorId;
    /* 6A */ short timer;
};

enum summonDK_proc_lables {
    PROC_LABEL_SUMDK_LOAD_START,
    PROC_LABEL_SUMDK_LOAD_TERMINAL,
    PROC_LABEL_SUMDK_LOAD_POS_DOWN,
    PROC_LABEL_SUMDK_LOAD_POS_RIGHT,
    PROC_LABEL_SUMDK_LOAD_POS_LEFT,
    PROC_LABEL_SUMDK_LOAD_POS_UP,
    PROC_LABEL_SUMDK_LOAD_POS_END,
};

struct SumProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x3C - 0x29];

    /* 3C */ int x;
    /* 40 */ int y;

    /* 44 */ u8 pad44[0x64 - 0x44];

    /* 64 */ short counter;
    /* 66 */ short monsters;
};

struct SumThing {
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

struct MAInfoFrameProc {
    PROC_HEADER;

    /* 2A */ short unk2A;
    /* 2C */ u16 unk2C;
    /* 2E */ u8 x;
    /* 2F */ u8 y;
    /* 30 */ struct Proc* maMain;
};

struct MADebugProc {
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

struct MADebugInfoEntry {
    /* 00 */ short data[10];
    /* 14 */ struct Text text[10];
};

struct MADebugInfo {
    /* 00 */ u8 pad00[8];
    /* 08 */ struct MADebugInfoEntry infos[2];
};

struct Unk089A3798
{
    u8 a;
    s8 b, c, d, e;
    u8 f, g;
};

struct MAEffectProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ int xDisplay;
    /* 34 */ int yDisplay;
    /* 38 */ u8 pad38[0x40 - 0x38];
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ u16 unk44;
    /* 44 */ u8 pad46[0x48 - 0x46];
    /* 48 */ short unk48;
    /* 4A */ short unk4A;
    /* 4C */ short unk4C;
    /* 4E */ /* pad */
    /* 50 */ const void * img;
    /* 54 */ const void * pal;
    /* 58 */ u16 unk58;
    /* 5A */ u8 pad5A[0x64 - 0x5A];
    /* 64 */ short unk64;
};

struct MAAnotherProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ u8 pad34[0x44 - 0x34];
    /* 44 */ short unk44;
    /* 46 */ u8 pad46[0x54 - 0x46];
    /* 54 */ int unk54;
    /* 58 */ int unk58;
    /* 5C */ u8 pad5C[0x64 - 0x5C];
    /* 64 */ short unk64;
};

struct MALevelUpProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ short pad2A;
    /* 2C */ short pad2C;
    /* 2E */ short actor;
    /* 30 */ u8 unk30;
    /* 31 */ u8 unk31;
    /* 32 */ short unk32;
};

struct MAFrameShakeProc {
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short timer;
};

struct MAStarProc {
    PROC_HEADER;

    /* 2A */ short xCenter;
    /* 2C */ short yCenter;
    /* 2E */ short unk2E;
    /* 30 */ short unk30;

    /* 29 */ u8    pad32[0x36 - 0x32];

    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
};

struct Unk03005090 {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ int pad04;
};

struct MapAnimActorState {
    /* 00 */ struct Unit * unit;
    /* 04 */ struct BattleUnit * bu;
    /* 08 */ struct MUProc * mu;
    /* 0C */ u8 hp_max;
    /* 0D */ u8 hp_cur;
    /* 0E */ u16 hp_displayed_q4;
    /* 10 */ u8 hp_info_x;
    /* 11 */ u8 hp_info_y;
    /* 12 */ STRUCT_PAD(0x12, 0x14);
};

struct MapAnimState {
    /* 00 */ struct MapAnimActorState actor[4];

    /* 50 */ struct BattleHit * pCurrentRound;
    /* 54 */ const struct ProcCmd * specialProcScr;
    /* 58 */ u8 subjectActorId;
    /* 59 */ u8 targetActorId;
    /* 5A */ u16 hitAttributes;
    /* 5C */ u8 hitInfo;
    /* 5D */ s8 hitDamage;
    /* 5E */ u8 actorCount_maybe;
    /* 5F */ u8 hp_changing;
    /* 60 */ u8 u60;
    /* 61 */ u8 u61;
    /* 62 */ u8 u62;
};

extern struct MapAnimState gManimSt;

struct Unk089A40AC
{
    /* 00 */ const void * unk00;
    /* 04 */ const u16  * unk04;
    /* 08 */ const void * unk08;
};

struct ManimLevelUpStatGainLabelProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u16 chr;
    /* 2C */ u16 pal;
    /* 2E */ u16 sprite_layer;
};

struct ManimLevelUpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2E);
    /* 2E */ s16 actor_id;
    /* 30 */ u8 next_stat_num;
    /* 31 */ u8 clock;
    /* 32 */ s16 y_scroll_offset;
};

struct ManimLevelUpLabelColorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ s32 clock;
    /* 58 */ STRUCT_PAD(0x58, 0x64);
    /* 64 */ s16 pal;
};

struct ManimLevelUpLabelInfo
{
    /* 00 */ u8 x;
    /* 01 */ u8 y;
    /* 02 */ STRUCT_PAD(0x02, 0x04);
    /* 04 */ int *msg[2];
};

extern struct ManimLevelUpLabelInfo CONST_DATA gManimLevelUpLabelInfoList[];

extern CONST_DATA struct MADebugInfo* pMADebugInfoData;
extern CONST_DATA struct Unk089A3798 gUnknown_089A3798[];

extern CONST_DATA struct ProcCmd ProcScr_MapAnimPoisonDmg[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEggDmg[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimCritAtk[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSteal[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSummon[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSumDK[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimDance[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBattle[];
extern CONST_DATA struct ProcCmd gProc_MapAnimEnd[];
extern CONST_DATA u16 gUnknown_089A3648[];
extern CONST_DATA int gUnknown_089A3668[];
extern CONST_DATA u8* TsaSet_MapBattleBoxGfx[3][2];
extern CONST_DATA struct ProcCmd ProcScr_MapBattleInfoBox[];
extern CONST_DATA u16 gUnknown_089A36C0[];
extern CONST_DATA struct ProcCmd gProc_MapAnimExpBar[];
extern CONST_DATA char *MADebugStrings1[];
// extern ??? gUnknown_089A3798
extern CONST_DATA char* MADebugStrings2[];
// extern ??? pMADebugInfoData
extern CONST_DATA struct ProcCmd ProcScr_MADebug[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEventBattle[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimWallBreak[];
extern CONST_DATA struct ProcCmd ProcScr_PoisonAnimHandler[];
extern CONST_DATA struct ProcCmd ProcScr_PoisonAnim2[];
extern CONST_DATA struct ProcCmd ProcScr_089A398C[];
extern CONST_DATA u16 * ImgLut_089A39C4[];
// extern ??? gUnknown_089A39E0
// extern ??? gUnknown_089A3A18
// extern ??? gUnknown_089A3A40
// extern ??? gUnknown_089A3A80
// extern ??? gUnknown_089A3AB8
// extern ??? gUnknown_089A3B3C
// extern ??? gUnknown_089A3B6C
// extern ??? gUnknown_089A3B84
// extern ??? gUnknown_089A3BA4
// extern ??? gUnknown_089A3BDC
// extern ??? gUnknown_089A3C0C
// extern ??? gUnknown_089A3C24
// extern ??? gUnknown_089A3C6C
// extern ??? gUnknown_089A3C94
// extern ??? gUnknown_089A3CD4
// extern ??? gUnknown_089A3D14
// extern ??? gUnknown_089A3D54
// extern ??? gUnknown_089A3D8C
// extern ??? gUnknown_089A3DB4
// extern ??? gUnknown_089A3DFC
// extern ??? gUnknown_089A3E04
// extern ??? gUnknown_089A3E44
// extern ??? gUnknown_089A3E6C
// extern ??? gUnknown_089A3EC4
// extern ??? gManimLevelUpLabelInfoList
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpStatGainLabel[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpLabelColor[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUp[];
extern CONST_DATA struct ProcCmd gUnknown_089A4034[];
extern CONST_DATA struct ProcCmd gUnknown_089A404C[];
extern CONST_DATA struct ProcCmd gUnknown_089A4064[];
extern CONST_DATA struct ProcCmd gUnknown_089A407C[];
extern struct Unk089A40AC CONST_DATA gUnknown_089A40AC[];
extern struct Unk089A40AC CONST_DATA gUnknown_089A419C[];
extern struct Unk089A40AC CONST_DATA gUnknown_089A42BC[];
extern CONST_DATA struct ProcCmd gUnknown_089A434C[];
extern CONST_DATA struct ProcCmd gUnknown_089A4394[];
// extern ??? gUnknown_089A43D4
// extern ??? gUnknown_089A43D8
extern CONST_DATA struct ProcCmd gUnknown_089A4434[];
extern CONST_DATA struct ProcCmd gUnknown_089A448C[];
// extern ??? gUnknown_089A44A4
// extern ??? gUnknown_089A45DC
// extern ??? gUnknown_089A4644
// extern ??? gUnknown_089A4664
// extern ??? gUnknown_089A46AC
// extern ??? gUnknown_089A46DC
// extern ??? gUnknown_089A470C
// extern ??? gUnknown_089A4734
extern CONST_DATA struct ProcCmd ProcScr_MapAnimDefaultItemEffect[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocNightMare[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocLatona[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocAntitoxin[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocPureWater[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocElixir[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocVulenrary[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocHeal[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocMend[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocRecover[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocPhysic[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocTorch[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocUnlock[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocBerserk[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocSleep[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocMonsterStone[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocSilence[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocRestore[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocRepair[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocUnused[];
extern CONST_DATA struct ProcCmd ProcScr_PoisonDmgMapEffect[];
extern CONST_DATA struct ProcCmd ProcScr_EggDmgMapEffect1[];
extern CONST_DATA struct ProcCmd ProcScr_EggDmgMapEffect2[];
extern CONST_DATA struct ProcCmd ProcScr_CritAtkMapEffect[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocBarrier[];
extern CONST_DATA struct ProcCmd ProcScr_SpellAssocWarp[];
// extern ??? gUnknown_089A52FC
extern u16 SpriteAnim_ManimStatGain[];
extern u16 gUnknown_089A5A6C[];
// extern ??? gUnknown_089A61F8
// extern ??? gUnknown_089A6254
extern u16 CONST_DATA Obj_PoisonAnim[];
extern u16 CONST_DATA Obj_WallBreakAnim[];
extern const u16 gUnknown_089A8EF8[];
extern const u16 gUnknown_089A8F74[];
extern u8 gGfx_ArenaBuildingFront[];
extern u8 gTsa_ArenaBuildingFront[];
extern u16 gPal_ArenaBuildingFront[];
extern u8 Img_MapAnimMISS[];
extern u16 Obj_MapAnimMISS[];
extern u8 Img_MapAnimNODAMAGE[];
extern u16 obj_MapAnimNODAMAGE[];
extern u16 Pal_ManimLevelUpStatGainCycling[];
extern u16 Img_ManimLevelUpText[];
extern u16 Pal_ManimLevelUp[];
extern u16 Img_ManimLevelUpStatGain[];
extern u8 Img_ManimLevelUpStatGainDigits[];
extern u16 gUnknown_089AD498[];
extern u8 Img_MapBattleInfoBox[];
extern u16 Pal_MapBattleInfoBlue[];
extern u16 Pal_MapBattleInfoRed[];
extern u16 Pal_MapBattleInfoGreen[];
extern u16 Pal_MapBattleInfoPurple[];
extern CONST_DATA u8 Tsa_MapBattleBoxGfx1[];
extern CONST_DATA u8 Tsa_MapBattleBoxGfx2[];
extern CONST_DATA u8 Tsa_MapBattleBoxGfx3[];
extern u8 Img_MapBattleInfoHpBar[];
extern u16 Img_MapBattleInfoNum[]; // gfx
extern u8 gUnknown_089AD934[]; // tsa
extern u16 gUnknown_089AD9F8[]; // pal
extern u16 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern const u8 gUnknown_089ADD4C[];
extern u16 CONST_DATA Img_PoisonAnim[];
extern u16 CONST_DATA Pal_PoisonAnim[];
// extern ??? gUnknown_089AE224
// extern ??? gUnknown_089AE484
// extern ??? gUnknown_089AE4A4
extern u8 Img_089AE7A4[];
extern u16 Pal_089AE7C4[];
extern u8 CONST_DATA gUnknown_089AE804[];
// extern ??? gUnknown_089AF310
extern u8 CONST_DATA gUnknown_089AF910[];
extern u8 CONST_DATA gUnknown_089AF930[];
extern u8 CONST_DATA gUnknown_089AF950[];
extern u8 CONST_DATA gUnknown_089AFAC4[];
extern u8 CONST_DATA gUnknown_089AFCBC[];
extern u8 CONST_DATA gUnknown_089AFF78[];
// extern ??? gUnknown_089AFFB8
// extern ??? gUnknown_089AFFF8
// extern ??? gUnknown_089B03D4
// extern ??? gUnknown_089B068C
// extern ??? gUnknown_089B06AC
// extern ??? gUnknown_089B0700
// extern ??? gUnknown_089B0720
// extern ??? gUnknown_089B0820
// extern ??? gUnknown_089B0840
// extern ??? gUnknown_089B0864
// extern ??? gUnknown_089B0AD0
// extern ??? gUnknown_089B17A4
// extern ??? gUnknown_089B1A10
// extern ??? gUnknown_089B1E10
// extern ??? gUnknown_089B20E8
// extern ??? gUnknown_089B2108
// extern ??? gUnknown_089B21D8
// extern ??? gUnknown_089B2618
// extern ??? gUnknown_089B2728
// extern ??? gUnknown_089B2748
// extern ??? gUnknown_089B2880
// extern ??? gUnknown_089B343C
// extern ??? gUnknown_089B35D0
// extern ??? gUnknown_089B4BFC
// extern ??? gUnknown_089B6AA0
// extern ??? gUnknown_089B73D4
extern u16 Img_089B7610[];
extern u16 Pal_089B80C4[];
extern u16 Img_089B80E4[];
extern u16 Img_089B8140[];
extern u16 Img_089B81A4[];
extern u16 Img_089B8214[];
extern u16 Img_089B828C[];
extern u16 Img_089B82F0[];
extern u16 Img_089B835C[];
// extern ??? gUnknown_089E714C
// extern ??? gUnknown_089E7DEC

void MapAnimProc_DisplayItemStealingPopup(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);
void _InitFontForUIDefault();
void MapAnim_Cleanup(void);
void MapAnim_AdvanceBattleRound(void);
void MapAnim_PrepareNextBattleRound(ProcPtr p);
void MapAnim_DisplayRoundAnim(ProcPtr p);
void MapAnim_ShowPoisonEffectIfAny(ProcPtr p);
void MapAnim_MoveCameraOntoSubject(ProcPtr p);
void MapAnim_MoveCameraOntoTarget(ProcPtr p);
void MapAnimProc_DisplayDeahQuote(void);
void MapAnmiProc_DisplayDeathFade(void);
void MapAnimProc_DisplayExpBar(struct Proc* proc);
void MapAnim_InitInfoBox(ProcPtr proc);
void MapAnim_CallBattleQuoteEvents(void);
// ??? SetBattleMuPaletteByIndex(???);
void SetBattleMuPalette(void);
// ??? PlaySoundIdA0(???);
// ??? sub_807ACEC(???);
// ??? New6C_SummonGfx_FromActionPos(???);
// ??? GenerateSummonUnitDef(???);
// ??? ProcSummonDK_InitCounters(???);
// ??? ProcSummonDK_CheckIsEnough(???);
// ??? CheckCanSummon(???);
// ??? sub_807B054(???);
// ??? ProcSummonDK_ResetCounter(???);
// ??? SelectSummonPos(???);
// ??? SelSumPosAndMoveCamera(???);
// ??? ProcSummonDK_SelectDownPos(???);
// ??? ProcSummonDK_SelectRightPos(???);
// ??? ProcSummonDK_SelectLeftPos(???);
// ??? ProcSummonDK_SelectUpPos(???);
// ??? LoadSumMonsterFromDK(???);
void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit);
void SetBattleAnimFacing(int actorId1, int actorId2, int facing);
// ??? SetupBattleMOVEUNITs(???);
void sub_807B4D0(void);
// ??? BeginMapAnimForPoisonDmg(???);
// ??? BeginMapAnimForEggDmg(???);
// ??? BeginMapAnimForCritAtk(???);
void BeginMapAnimForSteal(void);
void BeginMapAnimForSummon(void);
void BeginMapAnimForSummonDK(void);
// ??? BeginMapAnimForDance(???);
void BeginBattleMapAnims(void);
void SetupMapAnimSpellData(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit);
void SetupMapBattleAnim(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hit);
int GetFacingDirection(int xPos, int yPos, int xLook, int yLook);
void UncompMapBattleBoxNumGfx(int tileNum);
void sub_807BA28(u16* tilemap, int num, int tileref, int len, u16 blankref, int arg5);
// ??? PrepareMapBattleBoxNumGfx(???);
void sub_807BB10(u16* arg0, int* arg1, int arg2, int arg3, int arg4);
void sub_807BB40(u16* tilemap, int arg1, int arg2, int arg3, u16* arg4);
void DeleteBattleAnimInfoThing(void);
void NewMapBattleInfoThing(int x, int y, struct Proc* parent);
void ProcMapInfoBox_OnEnd(void);
void ProcMapInfoBox_OnDraw(struct MAInfoFrameProc* proc);
// ??? sub_807BCA8(???);
void sub_807BD54(struct MAInfoFrameProc* proc, int actor);
// ??? GetBattleInfoPalByFaction(???);
void DisplayBattleInfoBox(struct MAInfoFrameProc* proc, int, int);
// ??? MapInfoBox_PrepareForShake(???);
void MapInfoBoxShake(struct MAInfoFrameProc* proc);
// ??? DrawMAExpBar(???);
void ProcMAExpBar_OnDraw(struct MAExpBarProc* proc);
// ??? ProcMAExpBar_PlaySound74(???);
// ??? ProcMAExpBar_OnIncrement(???);
// ??? ProcMAExpBar_InitDisplay(???);
void ProcMAExpBar_FrameAdvance(struct MAExpBarProc* proc);
// ??? ProcMAExpBar_LevelUpIfPossible(???);
// ??? StartMADebug6C(???);
void MADebug_FormatPrint(int num, int arg1, int arg2);
// ??? InitDebugMapAnim(???);
// ??? MADebug_InitScreen(???);
// ??? MADebug_MainLoop(???);
// ??? SetupMADebugBattleUnit(???);
s8 SetupMADebugBattle(void);
// ??? MADebug_DoBattleAnim(???);
// ??? MapEventBattle_SetUpHitData(???);
// ??? MapEventBattle_OnEnd(???);
void MapAnim_BeginMISSAnim(struct Unit * unit);
void MapAnim_BeginNODAMAGEAnim(struct Unit * unit);
void MapAnim_BeginWallBreakAnim(struct Unit * unit, int unk);
void WallBreakAnim_Init(struct MAEffectProc * proc);
void NewMapPoisonEffect(struct Unit * unit);
void MapAnim_BeginPoisonAnim(struct MAEffectProc * proc);
void NewMapAnimPoisonAnim2(struct Unit * unit);
void MapAnim_BeginPoisonAnim2(struct MAEffectProc * proc);
void MapAnim_Poison2ResetMap(void);
void sub_807CDD0(struct Unit * unit);
void sub_807CE18(struct MAEffectProc * proc);
void sub_807CE78(struct MAEffectProc * proc);
void sub_807CF30(struct MAEffectProc * proc);
void sub_807D09C(void);
void MapAnimCallSpellAssocLatonafx(struct Unit * unit);
// ??? sub_807D0FC(???);
// ??? sub_807D1B4(???);
// ??? sub_807D2C8(???);
// ??? sub_807D2E0(???);
// ??? sub_807D328(???);
// ??? sub_807D360(???);
// ??? sub_807D39C(???);
// ??? sub_807D3B4(???);
// ??? sub_807D3CC(???);
// ??? sub_807D40C(???);
// ??? sub_807D440(???);
// ??? sub_807D464(???);
void sub_807D4D4(struct Unit * unit);
// ??? sub_807D51C(???);
// ??? sub_807D57C(???);
// ??? sub_807D670(???);
void sub_807D688(struct Unit * unit, u8 * unk1, u8 * unk2);
// ??? sub_807D6D8(???);
// ??? sub_807D760(???);
// ??? sub_807D7D8(???);
// ??? sub_807D818(???);
void NewMapAnimEffectAnimator(struct Unit * unit, u8 * unk1, u8 * unk2, int unk3);
// ??? sub_807D860(???);
// ??? sub_807D944(???);
// ??? sub_807D9B8(???);
void sub_807DA2C(void);
// ??? sub_807DA68(???);
void New6C_SomethingFlashy(struct Unit * unit, int x, int y);
// ??? sub_807DAE8(???);
// ??? sub_807DB30(???);
void sub_807DBA8(struct Unit * unit);
// ??? sub_807DBE4(???);
// ??? sub_807DCA8(???);
// ??? sub_807DD0C(???);
// ??? sub_807DD74(???);
void sub_807DD80(struct Unit * unit);
// ??? sub_807DDC8(???);
void sub_807DE30(struct Unit * unit);
// ??? sub_807DE70(???);
// ??? sub_807DE80(???);
// ??? sub_807DEDC(???);
// ??? sub_807DF5C(???);
// ??? sub_807DFAC(???);
void sub_807DFF4(struct Unit * unit);
// ??? sub_807E038(???);
// ??? sub_807E054(???);
void sub_807E0D4(struct Unit * unit);
// ??? sub_807E118(???);
// ??? sub_807E17C(???);
// ??? sub_807E1B0(???);
void sub_807E1E4(struct Unit * unit);
// ??? sub_807E22C(???);
// ??? sub_807E28C(???);
// ??? sub_807E334(???);
// ??? sub_807E34C(???);
// ??? sub_807E390(???);
// ??? sub_807E404(???);
// ??? sub_807E448(???);
void sub_807E48C(struct Unit * unit);
// ??? sub_807E4D0(???);
// ??? sub_807E584(???);
// ??? sub_807E5F0(???);
void sub_807E638(struct Unit * unit);
// ??? sub_807E67C(???);
// ??? sub_807E6E0(???);
void sub_807E760(int, int);
// ??? sub_807E79C(???);
// ??? sub_807E7C4(???);
// ??? sub_807E7E0(???);
// ??? sub_807E8B0(???);
// ??? sub_807E934(???);
void sub_807E978(void);
// ??? sub_807EA20(???);
// ??? sub_807EA50(???);
// ??? sub_807EA60(???);
void PutManimLevelUpFrame(int actor_id, int x, int y);
void PutManimLevelUpStat(int actor_id, int x, int y, int stat_num, bool after_gain);
int GetManimLevelUpStatGain(int actor_id, int stat_num);
int GetManimLevelUpBaseStat(int actor_id, int stat_num);
// ??? ManimLevelUpStatGainLabel_Finish(???);
void StartManimLevelUpStatGainLabels(int chr, int pal, int sprite_layer, ProcPtr parent);
void EndManimLevelUpStatGainLabels(void);
void StartManimLevelUpStatGainLabelAnim(int x, int y, int stat_num, int stat_gain);
void StartPrepItemBoostStatGainLabelAnim(int x, int y, int stat_gain);
void StartManimLevelUp(int actor, ProcPtr parent);
void InitManimLevelUpWindow(void);
void ClearManimLevelUpWindow(void);
void ManimLevelUp_InitMainScreen(struct ManimLevelUpProc *proc);
void ManimLevelUpLabelColor_Init(struct ManimLevelUpLabelColorProc *proc);
void ManimLevelUpLabelColor_Loop(struct ManimLevelUpLabelColorProc *proc);
void ManimLevelUp_ScrollIn(struct ManimLevelUpProc *proc);
void ManimLevelUp_ScrollOut(struct ManimLevelUpProc *proc);
void ManimLevelUp_PutStatGainLabels(struct ManimLevelUpProc * proc);
void ManimLevelUp_DimBgm(struct ManimLevelUpProc * proc);
void ManimLevelUp_StartLevelUpText(struct ManimLevelUpProc * proc);
void ManimLevelUp_EndLevelUpText(struct ManimLevelUpProc * proc);
void ManimLevelUp_RestoreBgm(struct ManimLevelUpProc * proc);
void ManimLevelUp_Clear(struct ManimLevelUpProc * proc);
void sub_807F568(ProcPtr proc);
void sub_807F58C(ProcPtr proc);
void sub_807F5C8(ProcPtr proc);
void sub_807F5EC(ProcPtr proc);
void NewBG0Shaker(void);
void BG0Shaker_Init(struct MAFrameShakeProc * proc);
void BG0Shaker_Loop(struct MAFrameShakeProc * proc);
void LoadSparkGfx(void);
void PutSparkGfx(int x, int y);
void sub_807F724(int xCenter, int yCenter, int distance, int angle);
void sub_807F758(struct MAStarProc * proc);
void sub_807F788(struct MAStarProc * proc);
void StartStarRotationEffect(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);
void StartStarExplosionEffect(int ix, int iy);
void StartStarImplosionEffect(int ix, int iy);
void sub_807F878(ProcPtr proc);
void sub_807F89C(struct MAEffectProc * proc);
void sub_807F964(struct MAEffectProc * proc);
void sub_807FAA0(struct MAEffectProc * proc);
void sub_807FBCC(struct MAEffectProc * proc);
void sub_807FC58(struct MAEffectProc * proc);
void sub_807FCA8(void);
void sub_807FCC0(ProcPtr proc);
void sub_807FCE4(struct MAEffectProc * proc);
void sub_807FDC8(struct MAEffectProc * proc);
void sub_807FE0C(struct MAEffectProc * proc);
void sub_807FFF0(void);
void sub_8080014(ProcPtr proc);
void sub_8080038(void);
// ??? sub_8080050(???);
// ??? sub_8080138(???);
// ??? sub_8080288(???);
// ??? sub_808038C(???);
// ??? sub_80803D8(???);
void sub_8080408(void);
// ??? sub_808044C(???);
// ??? sub_8080474(???);
// ??? sub_8080498(???);
// ??? sub_8080530(???);
// ??? sub_80805AC(???);
// ??? sub_8080654(???);
// ??? sub_8080660(???);
// ??? sub_8080730(???);
// ??? sub_80807C8(???);
// ??? sub_8080890(???);
// ??? sub_8080900(???);
// ??? sub_80809D8(???);
// ??? sub_8080B18(???);
// ??? sub_8080B84(???);
// ??? sub_8080BA8(???);
// ??? sub_8080BD8(???);
void New6C_SummonGfx(ProcPtr parent, int xMap, int yMap);
// ??? sub_8080D6C(???);
// ??? sub_8080DCC(???);
// ??? sub_8080E84(???);
void sub_8080E9C(ProcPtr, struct Unit *);
// ??? sub_8080EE4(???);
// ??? sub_8080F44(???);
// ??? sub_8081008(???);
void sub_8081020(ProcPtr, struct Unit *);
void sub_8081068(void);
// ??? sub_8081078(???);
// ??? sub_8081100(???);
// ??? sub_80811AC(???);
void sub_80811D0(ProcPtr, int);
// ??? sub_80811EC(???);
// ??? sub_8081208(???);
// ??? nullsub_58(???);
const struct ProcCmd * GetItemAnim6CCode(void);
void MapAnim_AnimateSubjectIdle(ProcPtr proc);
void MapAnim_SubjectResetAnim(ProcPtr proc);
void sub_80812C0(void);
void sub_8081348(void);
void sub_8081384(void);
void sub_80813C0(void);
void MapAnim_BeginSubjectFastAnim(void);
void MapAnimMoveUnitTowardsTargetExt(struct MUProc * mu1, struct MUProc * mu2);
void MapAnimMoveUnitAwayFromTargetExt(struct MUProc * mu1, struct MUProc * mu2);
void MapAnim_MoveSubjectsTowardsTarget(void);
void MapAnim_MoveSubjectsAwayFromTarget(void);
void MapAnim_MoveCameraOnSubject(ProcPtr proc);
void MapAnim_MoveCameraOnTarget(ProcPtr proc);
void sub_80815EC(ProcPtr proc);
void MapAnim_BeginRoundSpecificAnims(ProcPtr proc);
void RegisterMapHpChangeAnim(int mapst_id, int damage);
void MapAnim_WaitForHPToEndChangingMaybe(ProcPtr proc);
void MapAnim_PoisonEffectOnTarget(ProcPtr proc);
void sub_8081950(ProcPtr proc);
void sub_8081970(ProcPtr proc);
void MapAnimCallSpellAssocSilence(ProcPtr proc);
void MapAnimCallSpellAssocBarrier(ProcPtr proc);
void MapAnimCallSpellAssocLatona(ProcPtr proc);
void sub_8081A08(ProcPtr proc);
void MapAnimCallSpellAssocAntitoxin(ProcPtr proc);
void MapAnimCallSpellAssocPureWater(ProcPtr proc);
void MapAnimCallSpellAssocElixir(ProcPtr proc);
void MapAnimCallSpellAssocHeal(ProcPtr proc);
void MapAnimCallSpellAssocMend(ProcPtr proc);
void MapAnimCallSpellAssocRecover(ProcPtr proc);
void MapAnimCallSpellAssocVulenrary(ProcPtr proc);
void sub_8081B70(ProcPtr proc);
void sub_8081BCC(ProcPtr proc);
void MapAnimCallSpellAssocTorch(ProcPtr proc);
void MapAnimCallSpellAssocUnlock(ProcPtr proc);
void MapAnimCallSpellAssocBerserk(ProcPtr proc);
void MapAnimCallSpellAssocRestore(ProcPtr proc);
void MapAnimCallSpellAssocSleep(ProcPtr proc);
void MapAnimCallSpellAssocMonsterStone(ProcPtr proc);
void MapAnimCallSpellAssocRepair(ProcPtr proc);
void sub_8081CD4(ProcPtr proc);
void sub_8081CF8(ProcPtr proc);
void sub_8081D1C(ProcPtr proc);
void sub_8081D40(ProcPtr proc);
void sub_8081D84(ProcPtr proc);
void sub_8081DE0(ProcPtr proc);
void sub_8081E04(ProcPtr proc);
void sub_8081E48(ProcPtr proc);
void sub_8081E54(ProcPtr proc);
void sub_8081E60(ProcPtr proc);

void sub_8081E78();
// ??? sub_8081EAC(???);
// ??? sub_8081F24(???);
// ??? sub_8081F58(???);
void sub_8081F64(void);
// ??? sub_8081FA8(???);
// ??? sub_8081FFC(???);
// ??? sub_8082050(???);
// ??? sub_8082094(???);
void StartManimFrameGradientScanlineEffect(u16, u16, u16, u16);
// ??? sub_808218C(???);
// ??? PrepareSineWaveScanlineBuf(???);
// ??? sub_8082268(???);
// ??? sub_80822AC(???);
// ??? sub_80822F0(???);
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd);
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 *);
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);
void sub_80823FC(u16 *, int, int, int);
void PrepareGradientScanlineBuf(u16 *, u16, u16, u16, u16);
// ??? sub_80825B0(???);
// ??? sub_80825B8(???);
// ??? sub_80825E8(???);
// ??? sub_8082644(???);
// ??? sub_8082658(???);
void sub_8082730(int, int, int);
// ??? sub_8082764(???);
void sub_808285C(void);
// ??? sub_80828A8(???);
// ??? sub_80828EC(???);
// ??? sub_808291C(???);
// ??? sub_808294C(???);
// ??? sub_80829A4(???);
// ??? sub_8082A24(???);
// ??? sub_8082A7C(???);
// ??? sub_8082AD4(???);
// ??? sub_8082B2C(???);
// ??? sub_8082B84(???);
// ??? sub_8082BEC(???);
// ??? sub_8082C50(???);
// ??? sub_8082E40(???);

#endif  // GUARD_MAPANIM_H
