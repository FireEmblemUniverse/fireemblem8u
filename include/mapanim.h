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

#define SCREEN_TILE_IX(xPos) ((xPos) * 16 - (gBmSt.camera.x))
#define SCREEN_TILE_IY(yPos) ((yPos) * 16 - (gBmSt.camera.y))

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

    STRUCT_PAD(0x38, 0x40);

    /* 40 */ u16 frame;
    /* 42 */ u16 timer;
    /* 44 */ u16 unk44;
    u16 unk46;
    /* 48 */ short unk48;
    /* 4A */ short frame_idx;
    /* 4C */ short unk4C;

    STRUCT_PAD(0x4E, 0x50);

    /* 50 */ const void * img;
    /* 54 */ const void * pal;
    /* 58 */ u16 unk58;

    STRUCT_PAD(0x5A, 0x64);

    /* 64 */ short unk64;
};

struct MAAnotherProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 pad34[0x44 - 0x34];
    /* 44 */ short timer;
    /* 46 */ u8 pad46[0x54 - 0x46];
    /* 54 */ int unk54;
    /* 58 */ int terminator;
    /* 5C */ u8 pad5C[0x64 - 0x5C];
    /* 64 */ short timer2;
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
    /* 2E */ short lo;
    /* 30 */ short hi;

    /* 29 */ u8    pad32[0x36 - 0x32];

    /* 36 */ u16 distance;
    /* 38 */ u16 angle;
    /* 3A */ u16 timer;
    /* 3C */ u16 start;
    /* 3E */ u16 end;
    /* 40 */ u16 terminator;
};

struct MapAnimStarfxConf {
    /* 00 */ u16 distance;
    /* 02 */ u16 angle;
    /* 04 */ int _pad_;
};

struct MapAnimActorState {
    /* 00 */ struct Unit * unit;
    /* 04 */ struct BattleUnit * bu;
    /* 08 */ struct MuProc * mu;
    /* 0C */ u8 hp_max;
    /* 0D */ u8 hp_cur;
    /* 0E */ u16 hp_displayed_q4;
    /* 10 */ u8 hp_info_x;
    /* 11 */ u8 hp_info_y;
    /* 12 */ STRUCT_PAD(0x12, 0x14);
};

enum
{
    MANIM_KIND_DAMAGE = 0,
    MANIM_KIND_STEAL = 1,
    MANIM_KIND_REFRESH = 2,
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
    /* 5E */ u8 actorCount;
    /* 5F */ u8 hp_changing;
    /* 60 */ u8 xtarget;
    /* 61 */ u8 ytarget;
    /* 62 */ u8 mapAnimKind;
};

extern struct MapAnimState gManimSt;

struct MapAnimfxConf
{
    /* 00 */ const void * img;
    /* 04 */ const u16  * pal;
    /* 08 */ const void * tsa;
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

struct Proc8080050
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
};

struct Unk082058B4
{
    u8 unk00, unk01, unk02;
};

struct MapAnimSpellfxConf {
    s8 tsa_idx;
    u8 duration;
    s8 blend;
    u8 _pad_;
};

extern const struct MapAnimSpellfxConf NigtMarefxConf[];

extern u16 gManimScanlineBufA[DISPLAY_HEIGHT * 2 * 2];
extern u16 * gManimScanlineBufs[];
extern u16 * gManimActiveScanlineBuf;

extern struct Unk082058B4 const gMapanimEventcall_5[];

extern CONST_DATA struct MADebugInfo* pMADebugInfoData;
extern CONST_DATA struct Unk089A3798 gMapanimDebug_0[];

extern CONST_DATA struct ProcCmd ProcScr_MapAnimPoisonDmg[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEggDmg[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimCritAtk[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSteal[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSummon[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSumDK[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimDance[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBattle[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEnd[];
extern CONST_DATA u16 gMapanimInfobox_0[];
extern CONST_DATA int gMapanimInfobox_1[];
extern CONST_DATA u8* TsaSet_MapBattleBoxGfx[3][2];
extern CONST_DATA struct ProcCmd ProcScr_MapBattleInfoBox[];
extern CONST_DATA u16 gMapanimExpbar_0[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimExpBar[];
extern CONST_DATA char *MADebugStrings1[];
// extern ??? gMapanimDebug_0
extern CONST_DATA char* MADebugStrings2[];
// extern ??? pMADebugInfoData
extern CONST_DATA struct ProcCmd ProcScr_MADebug[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEventBattle[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimWallBreak[];
extern CONST_DATA struct ProcCmd ProcScr_PoisonAnimHandler[];
extern CONST_DATA struct ProcCmd ProcScr_PoisonAnim2[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimGorgonHatch[];
extern CONST_DATA u16 * TsaLut_GorgonHatchCloud[];
extern CONST_DATA struct ProcCmd ProcScr_MapLatonafx[];
extern CONST_DATA s16 MapLatonafxLocation[];
extern CONST_DATA struct ProcCmd ProcScr_MapLatonaBlinkingfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapLatonaShiningfx[];
extern CONST_DATA struct ProcCmd ProcScr_NightMarefx[];
extern CONST_DATA void * TsaSet_NightMareMapAnimfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimAntitoxinPureWaterfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapanimStaffeffect_0[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffectAnimator[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimWarpFlashy[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimTorch[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBerserk[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimRepair[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimRestore[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSleep[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimMonsterStone[];
extern CONST_DATA void * TsaSet_MonsterStoneMapAnimfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffect_SineWaveWindow[];
extern CONST_DATA u8 gMapanimStaffeffect_0[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSilencefx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBarrierfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimUnlock[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffect_BgScroll[];
// extern ??? gManimLevelUpLabelInfoList
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpStatGainLabel[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpLabelColor[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUp[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocResetPal[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBgShaker[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocRotationEffect[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_0[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_1[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_2[];
extern CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_0[];
extern CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_1[];
extern struct MapAnimfxConf CONST_DATA gMapanimEventcall_16[];
extern struct MapAnimfxConf CONST_DATA gUnknown_089A43D8[];
extern CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_2[];
extern CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_3[];
extern struct MapAnimfxConf CONST_DATA gMapanimEventcall_17[];
extern struct ProcCmd gMapanimEventcall_18[];
extern struct ProcCmd gMapanimEventcall_19[];
extern u8 * CONST_DATA gMapanimEventcall_20[];
extern struct ProcCmd gMapanimEventcall_21[];
extern struct ProcCmd gMapanimEventcall_22[];
extern struct ProcCmd ProcScr_GlowingCross[];
extern struct ProcCmd ProcScr_GlowCrossExit[];
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
extern CONST_DATA struct ProcCmd ProcScr_ManimShiftingSineWaveScanlineBuf[];
extern u16 SpriteAnim_ManimStatGain[];
extern u16 gMapanimTorchfx_0[];
extern u16 ApConf_MapAnimTorchfx[];
extern u16 ApConf_MapanimTorchAnim_0[];
extern u16 CONST_DATA Obj_PoisonAnim[];
extern u16 CONST_DATA Obj_WallBreakAnim[];
extern const u16 ApHandle_GmapSoguSprites[];
extern const u16 Pal_MapAnimManaketeMu[];
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
extern u16 gMapanimLevelup_0[];
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
extern u8 Tsa_ShopWindows[]; // tsa
extern u16 Img_ShopGoldBox[]; // pal
extern u16 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern const u8 Img_GmapSoguSprites[];
extern u16 CONST_DATA Img_PoisonAnim[];
extern u16 CONST_DATA Pal_PoisonAnim[];
extern u16 CONST_DATA Img_LinkArenaWarpFx[];
extern u16 CONST_DATA Pal_LinkArenaWarpFx[];
extern u16 CONST_DATA gMapanimBattleinfo_0[];
extern u8 Img_MapAnimBerserkfx_1[];
extern u16 Pal_MapAnimBerserkfx_0[];
extern u8 CONST_DATA Img_MapAnimAntitoxinPureWater[];
extern u16 CONST_DATA gMapanimBattleinfo_1[];
extern u16 CONST_DATA Pal_MapAnimPureWater[];
extern u16 CONST_DATA Pal_MapAnimAntitoxin[];
extern u8 CONST_DATA gMapanimBattleinfo_2[];
extern u8 CONST_DATA gMapanimBattleinfo_3[];
extern u8 CONST_DATA gMapanimBattleinfo_4[];
extern u16 CONST_DATA Pal_MapAnimBerserkfx_1[];
extern u16 CONST_DATA Pal_MapAnimBerserkfx_2[];
extern u8 CONST_DATA gMapanimBattleinfo_5[];
extern u8 CONST_DATA Img_MapAnimTorchfx[];
extern u16 CONST_DATA Pal_MapAnimTorchfx[];
extern u8 Img_MapAnimUnlockObjfx[];
extern u16 Pal_MapAnimUnlockObjfx[];
extern u8 Img_MapAnimUnlockBgfx[];
extern u16 Pal_MapAnimUnlockObjfx_Unk[];
extern u8 Tsa_MapAnimUnlockBgfx[];
extern u8 Tsa_MapAnim_0[];
extern u8 Img_MapAnimRepairfx[];
extern u8 Tsa_MapAnim_1[];
extern u16 ApConf_MapAnimSleep[];
extern u8 Img_MapAnimBerserkfx[];
extern u16 Pal_MapAnimBerserkfx[];
extern u16 ApConf_MapAnimBerserkfx[];
extern u8 Img_ManimSilenceObjfx[];
extern u8 Img_ManimSilenceBgfx[];
extern u16 Pal_ManimSilencefx[];
extern u16 ApConf_ManimSilencefx[];
extern u8 Img_ManimBarrierBgfx[];
extern u8 Tsa_Mapnightmare[];
extern u16 Img_NightMareMapAnimfx[];
extern u16 Pal_NightMareMapAnimfx[];
extern u8 Tsa_NightMareMapAnimfx1[];
extern u8 Tsa_NightMareMapAnimfx2[];
extern u8 Tsa_NightMareMapAnimfx3[];
extern u8 Tsa_NightMareMapAnimfx4[];
extern u8 Tsa_NightMareMapAnimfx5[];
extern u8 Tsa_NightMareMapAnimfx6[];
extern u8 Tsa_NightMareMapAnimfx7[];
extern u8 Tsa_NightMareMapAnimfx8[];
extern u8 Tsa_NightMareMapAnimfx9[];
extern u8 Tsa_NightMareMapAnimfx10[];
extern u8 Tsa_NightMareMapAnimfx11[];
extern u8 Tsa_NightMareMapAnimfx12[];
extern u8 Tsa_NightMareMapAnimfx13[];
extern u8 Tsa_NightMareMapAnimfx14[];
extern u8 Tsa_NightMareMapAnimfx15[];
extern u8 Tsa_NightMareMapAnimfx16[];
extern u8 Tsa_NightMareMapAnimfx17[];
extern u8 Tsa_NightMareMapAnimfx18[];
extern u8 Tsa_NightMareMapAnimfx19[];
extern u8 Tsa_NightMareMapAnimfx20[];
extern u8 Tsa_NightMareMapAnimfx21[];
extern u8 Tsa_NightMareMapAnimfx22[];
extern u8 Tsa_NightMareMapAnimfx23[];
extern u8 Tsa_NightMareMapAnimfx24[];
extern u8 Tsa_NightMareMapAnimfx25[];
extern u8 Tsa_NightMareMapAnimfx26[];
extern u8 Tsa_NightMareMapAnimfx27[];
extern u8 Tsa_NightMareMapAnimfx28[];
extern u8 Tsa_NightMareMapAnimfx29[];
extern u8 Tsa_NightMareMapAnimfx30[];
extern u8 Tsa_NightMareMapAnimfx31[];
extern u8 Tsa_NightMareMapAnimfx32[];
extern u8 Tsa_NightMareMapAnimfx33[];
extern u8 Img_MonsterStoneMapAnimfx[];
extern u16 Pal_MonsterStoneMapAnimfx[];
extern u8 Tsa1_MonsterStoneMapAnimfx[];
extern u8 Tsa2_MonsterStoneMapAnimfx[];
extern u8 Tsa3_MonsterStoneMapAnimfx[];
extern u8 Tsa4_MonsterStoneMapAnimfx[];
extern u8 Tsa5_MonsterStoneMapAnimfx[];
extern u8 Tsa6_MonsterStoneMapAnimfx[];
extern u8 Tsa7_MonsterStoneMapAnimfx[];
extern u8 Tsa8_MonsterStoneMapAnimfx[];
extern u8 Tsa9_MonsterStoneMapAnimfx[];
extern u8 Tsa10_MonsterStoneMapAnimfx[];
extern u16 Img_GorgonHatchCloud[];
extern u16 Pal_GorgonHatchCloud[];
extern u16 Tsa_GorgonHatchCloud_A[];
extern u16 Tsa_GorgonHatchCloud_B[];
extern u16 Tsa_GorgonHatchCloud_C[];
extern u16 Tsa_GorgonHatchCloud_D[];
extern u16 Tsa_GorgonHatchCloud_E[];
extern u16 Tsa_GorgonHatchCloud_F[];
extern u16 Tsa_GorgonHatchCloud_G[];

extern u16 gMapanimEventcall_23[];
extern u16 gMapanimEventcall_24[];
extern u16 gMapanimEventcall_25[];
extern u16 gMapanimEventcall_26[];
extern u16 gMapanimEventcall_27[];
extern u16 gMapanimEventcall_28[];
extern u16 gMapanimEventcall_29[];
extern u16 gMapanimEventcall_30[];
extern u16 gMapanimEventcall_31[];
extern u16 gMapanimEventcall_32[];
extern u16 gMapanimEventcall_33[];
extern u16 gMapanimEventcall_34[];
extern u16 gMapanimEventcall_35[];
extern u16 gMapanimEventcall_36[];
extern u16 gMapanimEventcall_37[];
extern u16 gMapanimEventcall_38[];
extern u16 gMapanimEventcall_39[];
extern u16 gMapanimEventcall_40[];
extern u16 gMapanimEventcall_41[];
extern u16 gMapanimEventcall_42[];
extern u16 gMapanimEventcall_43[];
extern u16 gMapanimEventcall_44[];
extern u16 gMapanimEventcall_45[];
extern u16 gMapanimEventcall_46[];
extern u16 gMapanimEventcall_47[];
extern u16 gMapanimEventcall_48[];
extern u16 gMapanimEventcall_49[];
extern u16 gMapanimEventcall_50[];
extern u16 gMapanimEventcall_51[];
extern u16 gMapanimEventcall_52[];
extern u16 gMapanimEventcall_53[];
extern u16 gMapanimEventcall_54[];
extern u16 gMapanimEventcall_55[];
extern u16 gMapanimEventcall_56[];
extern u16 gMapanimEventcall_57[];
extern u16 gMapanimEventcall_58[];
extern u16 gMapanimEventcall_59[];
extern u16 gMapanimEventcall_60[];
extern u16 gMapanimEventcall_61[];
extern u16 gMapanimEventcall_62[];
extern u16 gMapanimEventcall_63[];
extern u16 gMapanimEventcall_64[];
extern u16 gMapanimEventcall_65[];
extern u16 gMapanimEventcall_66[];
extern u16 gMapanimEventcall_67[];
extern u16 gMapanimEventcall_68[];
extern u16 gMapanimEventcall_69[];
extern u16 gMapanimEventcall_70[];
extern u16 gMapanimEventcall_71[];
extern u16 gMapanimEventcall_72[];
extern u16 gMapanimEventcall_73[];
extern u16 gMapanimEventcall_74[];
extern u16 gMapanimEventcall_75[];
extern u16 gMapanimEventcall_76[];
extern u16 gMapanimEventcall_77[];
extern u16 gMapanimEventcall_78[];
extern u16 gMapanimEventcall_79[];
extern u16 gMapanimEventcall_80[];
extern u16 gMapanimEventcall_81[];
extern u16 gMapanimEventcall_82[];
extern u16 gMapanimEventcall_83[];
extern u16 gMapanimEventcall_84[];
extern u16 gMapanimEventcall_85[];
extern u16 gMapanimEventcall_86[];
extern u16 gMapanimEventcall_87[];
extern u16 gMapanimEventcall_88[];
extern u16 gMapanimEventcall_89[];
extern u16 gMapanimEventcall_90[];
extern u16 gMapanimEventcall_91[];
extern u16 gMapanimEventcall_92[];
extern u16 gMapanimEventcall_93[];
extern u16 gMapanimEventcall_94[];
extern u16 gMapanimEventcall_95[];
extern u16 gMapanimEventcall_96[];
extern u16 gMapanimEventcall_97[];
extern u16 gMapanimEventcall_98[];
extern u16 gMapanimEventcall_99[];
extern u16 gMapanimEventcall_100[];
extern u16 gMapanimEventcall_101[];
extern u16 gMapanimEventcall_102[];
extern u16 gMapanimEventcall_103[];
extern u16 gMapanimEventcall_104[];
extern u16 gMapanimEventcall_105[];
extern u16 gMapanimEventcall_106[];
extern u16 gMapanimEventcall_107[];
extern u16 gMapanimEventcall_108[];
extern u16 gMapanimEventcall_109[];
extern u16 gMapanimEventcall_110[];
extern u16 gMapanimEventcall_111[];
extern u16 gMapanimEventcall_112[];
extern u16 gMapanimEventcall_113[];
extern u16 gMapanimEventcall_114[];
extern u16 gMapanimEventcall_115[];
extern u16 gMapanimEventcall_116[];
extern u16 gMapanimEventcall_117[];
extern u16 gMapanimEventcall_118[];
extern u16 gMapanimEventcall_119[];
extern u16 gMapanimEventcall_120[];
extern u16 gMapanimEventcall_121[];
extern u16 gMapanimEventcall_122[];
extern u16 gMapanimEventcall_123[];
extern u16 gMapanimEventcall_124[];
extern u16 gMapanimEventcall_125[];
extern u16 gMapanimEventcall_126[];
extern u16 gMapanimEventcall_127[];
extern u16 gMapanimEventcall_128[];
extern u16 gMapanimEventcall_129[];
extern u16 gMapanimEventcall_130[];
extern u16 gMapanimEventcall_131[];
extern u16 gMapanimEventcall_132[];
extern u16 gMapanimEventcall_133[];
extern u16 gMapanimEventcall_134[];
extern u16 gMapanimEventcall_135[];
extern u16 gMapanimEventcall_136[];
extern u16 gMapanimEventcall_137[];
extern u16 gMapanimEventcall_138[];
extern u16 gMapanimEventcall_139[];
extern u16 gMapanimEventcall_140[];
extern u16 gMapanimEventcall_141[];
extern u16 gMapanimEventcall_142[];
extern u16 gMapanimEventcall_143[];
extern u16 gMapanimEventcall_144[];
extern u16 gMapanimEventcall_145[];
extern u16 gMapanimEventcall_146[];
extern u16 gMapanimEventcall_147[];
extern u16 gMapanimEventcall_148[];
extern u16 gMapanimEventcall_149[];
extern u16 gMapanimEventcall_150[];
extern u16 gMapanimEventcall_151[];
extern u16 gMapanimEventcall_152[];
extern u16 gMapanimEventcall_153[];
extern u16 gMapanimEventcall_154[];
extern u16 gMapanimEventcall_155[];
extern u16 gMapanimEventcall_156[];
extern u16 gMapanimEventcall_157[];
extern u16 gMapanimEventcall_158[];
extern u16 gMapanimEventcall_159[];
extern u16 gMapanimEventcall_160[];
extern u16 gMapanimEventcall_161[];
extern u16 gMapanimEventcall_162[];
extern u16 gMapanimEventcall_163[];
extern u16 gMapanimEventcall_164[];
extern u16 gMapanimEventcall_165[];
extern u16 gMapanimEventcall_166[];
extern u16 gMapanimEventcall_167[];
extern u16 gMapanimEventcall_168[];
extern u16 gMapanimEventcall_169[];
extern u16 gMapanimEventcall_170[];
extern u16 gMapanimEventcall_171[];
extern u16 gMapanimEventcall_172[];
extern u16 gMapanimEventcall_173[];
extern u16 gMapanimEventcall_174[];
extern u16 gMapanimEventcall_175[];
extern u16 gMapanimEventcall_176[];
extern u16 gMapanimEventcall_177[];
extern u16 gMapanimEventcall_178[];
extern u16 gMapanimEventcall_179[];
extern u16 gMapanimEventcall_180[];
extern u16 gMapanimEventcall_181[];
extern u16 gMapanimEventcall_182[];
extern u16 gMapanimEventcall_183[];
extern u16 gMapanimEventcall_184[];
extern u16 gMapanimEventcall_185[];
extern u16 gMapanimEventcall_186[];
extern u16 gMapanimEventcall_187[];
extern u16 gMapanimEventcall_188[];
extern u16 gMapanimEventcall_189[];
extern u16 gMapanimEventcall_190[];
extern u16 gMapanimEventcall_191[];
extern u16 gMapanimEventcall_192[];
extern u16 gMapanimEventcall_193[];
extern u16 gMapanimEventcall_194[];
extern u16 gMapanimEventcall_195[];
extern u16 gMapanimEventcall_196[];
extern u16 gMapanimEventcall_197[];
extern u16 gMapanimEventcall_198[];
extern u16 gMapanimEventcall_199[];
extern u16 gMapanimEventcall_200[];
extern u16 gMapanimEventcall_201[];
extern u16 gMapanimEventcall_202[];
extern u16 gMapanimEventcall_203[];
extern u16 gMapanimEventcall_204[];
extern u16 gMapanimEventcall_205[];
extern u16 gMapanimEventcall_206[];
extern u16 gMapanimEventcall_207[];
extern u16 gMapanimEventcall_208[];
extern u16 gMapanimEventcall_209[];
extern u16 gMapanimEventcall_210[];
extern u16 gMapanimEventcall_211[];
extern u16 gMapanimEventcall_212[];
extern u16 gMapanimEventcall_213[];
extern u16 gMapanimEventcall_214[];
extern u16 gMapanimEventcall_215[];
extern u16 gMapanimEventcall_216[];
extern u16 gMapanimEventcall_217[];
extern u16 gMapanimEventcall_218[];
extern u16 gMapanimEventcall_219[];
extern u16 gMapanimEventcall_220[];
extern u16 gMapanimEventcall_221[];
extern u16 gMapanimEventcall_222[];
extern u16 gMapanimEventcall_223[];
extern u16 gMapanimEventcall_224[];
extern u16 gMapanimEventcall_225[];
extern u16 gMapanimEventcall_226[];
extern u16 gMapanimEventcall_227[];
extern u16 gMapanimEventcall_228[];
extern u16 gMapanimEventcall_229[];
extern u16 gMapanimEventcall_230[];
extern u16 gMapanimEventcall_231[];
extern u16 gMapanimEventcall_232[];
extern u16 gMapanimEventcall_233[];
extern u16 gMapanimEventcall_234[];
extern u16 gMapanimEventcall_235[];
extern u16 gMapanimEventcall_236[];
extern u16 gMapanimEventcall_237[];
extern u16 gMapanimEventcall_238[];
extern u16 gMapanimEventcall_239[];
extern u16 gMapanimEventcall_240[];
extern u16 gMapanimEventcall_241[];
extern u16 gMapanimEventcall_242[];
extern u16 gMapanimEventcall_243[];
extern u16 gMapanimEventcall_244[];
extern u16 gMapanimEventcall_245[];
extern u16 gMapanimEventcall_246[];
extern u16 gMapanimEventcall_247[];
extern u16 gMapanimEventcall_248[];
extern u16 gMapanimEventcall_249[];
extern u16 gMapanimEventcall_250[];
extern u16 gMapanimEventcall_251[];
extern u16 gMapanimEventcall_252[];
extern u16 gMapanimEventcall_253[];
extern u16 gMapanimEventcall_254[];
extern u16 gMapanimEventcall_255[];
extern u16 gMapanimEventcall_256[];
extern u16 gMapanimEventcall_257[];
extern u16 gMapanimEventcall_258[];
extern u16 gMapanimEventcall_259[];
extern u16 gMapanimEventcall_260[];
extern u16 gMapanimEventcall_261[];
extern u16 gMapanimEventcall_262[];
extern u16 gMapanimEventcall_263[];
extern u16 gMapanimEventcall_264[];
extern u16 gMapanimEventcall_265[];
extern u16 gMapanimEventcall_266[];
extern u16 gMapanimEventcall_267[];
extern u16 gMapanimEventcall_268[];
extern u16 gMapanimEventcall_269[];
extern u16 gMapanimEventcall_270[];
extern u16 gMapanimEventcall_271[];
extern u16 gMapanimEventcall_272[];
extern u16 gMapanimEventcall_273[];
extern u16 gMapanimEventcall_274[];
extern u16 gMapanimEventcall_275[];
extern u16 gMapanimEventcall_276[];
extern u16 gMapanimEventcall_277[];
extern u16 gMapanimEventcall_278[];
extern u16 gMapanimEventcall_279[];
extern u16 gMapanimEventcall_280[];
extern u16 gMapanimEventcall_281[];
extern u16 gMapanimEventcall_282[];
extern u16 gMapanimEventcall_283[];
extern u16 gMapanimEventcall_284[];
extern u16 gMapanimEventcall_285[];
extern u16 gMapanimEventcall_286[];
extern u16 gMapanimEventcall_287[];
extern u16 gMapanimEventcall_288[];
extern u16 gMapanimEventcall_289[];
extern u16 gMapanimEventcall_290[];
extern u16 gMapanimEventcall_291[];
extern u16 gMapanimEventcall_292[];

extern u8 gMapanimEventcall_293[];

extern u8 Tsa_Mapeventcall_0[];
extern u8 Tsa_Mapeventcall_1[];
extern u8 Tsa_Mapeventcall_2[];
extern u8 Tsa_Mapeventcall_3[];
extern u8 Tsa_Mapeventcall_4[];
extern u8 Tsa_Mapeventcall_5[];
extern u8 Tsa_Mapeventcall_6[];
extern u8 Tsa_Mapeventcall_7[];
extern u8 Tsa_Mapeventcall_8[];
extern u8 Tsa_Mapeventcall_9[];
extern u8 Tsa_Mapeventcall_10[];
extern u8 Tsa_Mapeventcall_11[];
extern u8 Tsa_Mapeventcall_12[];
extern u8 Tsa_Mapeventcall_13[];
extern u8 Tsa_Mapeventcall_14[];
extern u8 Tsa_Mapeventcall_15[];
extern u8 Tsa_Mapeventcall_16[];
extern u8 Tsa_Mapeventcall_17[];

extern u16 gMapanimEventcall_294[];

void MapAnim_StoleItemPopup(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit * bu);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit * bu);
void MapAnim_PrepareBattleTalk(void);
void MapAnim_Cleanup(void);
void MapAnim_AdvanceBattleRound(void);
void MapAnim_PrepareNextBattleRound(ProcPtr proc);
void MapAnim_DisplayRoundAnim(ProcPtr proc);
void MapAnim_ShowPoisonEffectIfAny(ProcPtr proc);
void MapAnim_MoveCameraOntoSubject(ProcPtr proc);
void MapAnim_MoveCameraOntoTarget(ProcPtr proc);
void MapAnim_DisplayDeathQuote(void);
void MapAnim_DisplayDeathFade(void);
void MapAnim_DisplayExpBar(ProcPtr proc);
void MapAnim_InitInfoBox(ProcPtr proc);
void MapAnim_CallBattleQuoteEvents(void);
// ??? SetBattleMuPaletteByIndex(???);
void SetBattleMuPalette(void);
// ??? MapAnim_PlayStealSe(???);
// ??? MapAnim_PlayStealSe_Unused(???);
// ??? New6C_SummonGfx_FromActionPos(???);
// ??? GenerateSummonUnitDef(???);
// ??? ProcSummonDK_InitCounters(???);
// ??? ProcSummonDK_CheckIsEnough(???);
// ??? CheckCanSummon(???);
// ??? MapAnimSummon_PlaySound(???);
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
void SortMapAnimActorObjLayers(void);
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
void MapAnim_DrawNumber(u16* tilemap, int num, int tileref, int len, u16 blankref, int arg5);
// ??? PrepareMapBattleBoxNumGfx(???);
void MapAnim_DrawBarSegment(u16* arg0, int* arg1, int arg2, int arg3, int arg4);
void MapAnim_DrawBar(u16* tilemap, int arg1, int arg2, int arg3, u16* arg4);
void EndMapAnimInfoWindow(void);
void StartMapAnimInfoWindow(int x, int y, struct Proc* parent);
void ProcMapInfoBox_OnEnd(void);
void ProcMapInfoBox_OnDraw(struct MAInfoFrameProc* proc);
// ??? ProcMapInfoBox_AnimateHp(???);
void MapInfoBox_DrawHp(struct MAInfoFrameProc* proc, int actor);
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
void MapAnim_StartGorgonHatchAnim(struct Unit * unit);
void MapAnim_GorgonHatch_Init(struct MAEffectProc * proc);
void MapAnim_GorgonHatch_Loop(struct MAEffectProc * proc);
void LoadGorgonFromEgg(struct MAEffectProc * proc);
void MapAnim_GorgonHatch_ClearBg2(void);
void MapAnimCallSpellAssocLatonafx(struct Unit * unit);
void MapLatonafx_Init(struct MAEffectProc * proc);
void MapLatonafx_InitGfx(struct MAEffectProc * proc);
void MapLatonafx_ClearBg2(void);
void MapLatonaBlinkingfx_Init(struct MAEffectProc * proc);
void MapLatonaBlinkingfx_Main(struct MAEffectProc * proc);
void NewMapLatonaShiningfx(int, int, int, int, int, ProcPtr parent);
void MapLatonaShiningfx_End(void);
void MapLatonaShiningfx_Init(void);
void MapLatonaShiningfx_Start(struct MAAnotherProc * proc);
void MapLatonaShiningfx_Loop1(struct MAAnotherProc * proc);
void MapLatonaShiningfx_Loop2(struct MAAnotherProc * proc);
void MapLatonaShiningfx_Loop3(struct MAAnotherProc * proc);
void MapAnimCallSpellAssocNightMarefx(struct Unit * unit);
void NightMarefx_Init(struct MAEffectProc * proc);
void NightMarefx_Loop(struct MAEffectProc * proc);
void NightMarefx_End(struct MAEffectProc * proc);
void MapAnimCallSpellAssocAntitoxinPureWaterfx(struct Unit * unit, u8 * img, u16 * pal);
void AntitoxinPureWaterfx_Init(struct MAEffectProc * proc);
void AntitoxinPureWaterfx_Loop(struct MAEffectProc * proc);

/* Unused mapanim effect? */
void StartMapAnimEffect_SoundOnly(struct Unit * unit);
void MapAnimEffect_SoundOnly_PlaySe(struct MAEffectProc * proc);

/* This is just the same as MAEffectProc */
struct ProcMapAnimator {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ u8 pad_30[0x40 - 0x30];
    /* 40 */ u16 ca;
    /* 42 */ u16 cb;
    /* 44 */ u8 pad_44[0x50 - 0x44];
    /* 50 */ void const * img;
    /* 54 */ void const * pal;
    /* 58 */ u16 song;
};

void NewMapAnimEffectAnimator(struct Unit * unit, void const * img, void const * pal, u16 song);
void MapAnimEffectAnimator_Init(struct ProcMapAnimator * proc);
void MapAnimEffectAnimator_Loop1(struct ProcMapAnimator * proc);
void MapAnimEffectAnimator_Loop2(struct ProcMapAnimator * proc);
void MapSpellAnim_CommonEnd(ProcPtr proc);
void MapSpellAnim_EndWithHBlank(ProcPtr proc);
void StartWarpFlashy(struct Unit * unit, int x, int y);
void WarpFlashy_Init(struct MAEffectProc * proc);
void WarpFlashy_Loop(struct MAEffectProc * proc);
void MapAnimTorchEffect(struct Unit * unit);
void MapAnimTorch_Init(struct MAEffectProc * proc);
void MapAnimTorch_Loop1(struct MAEffectProc * proc);
void MapAnimTorch_Loop2(struct MAEffectProc * proc);
void MapAnimTorch_ResetHBlank(struct MAEffectProc * proc);
void MapAnimBerserkEffect(struct Unit * unit);
void MapAnimBerserk_Loop(struct MAEffectProc * proc);
void MapAnimRepairEffect(struct Unit * unit);
void MapAnimRepair_Init(struct MAEffectProc * proc);
void MapAnimRepair_Init0(struct MAEffectProc * proc);
void MapAnimRepair_Loop1(struct MAEffectProc * proc);
void MapAnimRepair_Loop2(struct MAEffectProc * proc);
void MapAnimRepair_Loop3(struct MAEffectProc * proc);
void MapAnimRestoreEffect(struct Unit * unit);
void MapAnimRestore_Init(struct MAEffectProc * proc);
void MapAnimRestore_Loop(struct MAEffectProc * proc);
void MapAnimSleepEffect(struct Unit * unit);
void MapAnimSleep_Init(struct MAEffectProc * proc);
void MapAnimSleep_Anim1(struct MAEffectProc * proc);
void MapAnimSleep_Anim2(struct MAEffectProc * proc);
void MapAnimMonsterStoneEffect(struct Unit * unit);
void MapAnimMonsterStone_Init(struct MAEffectProc * proc);
void MapAnimMonsterStone_Loop1(struct MAEffectProc * proc);
void MapAnimMonsterStone_Resetfx(struct MAEffectProc * proc);

/* Unused mapanim effect? */
void StartMapAnimEffect_SineWaveWindow(struct Unit * unit);
void MapAnim_Init_0(struct MAEffectProc * proc);
void MapAnim_Loop1_0(struct MAEffectProc * proc);
void MapAnim_Loop2_0(struct MAEffectProc * proc);

void MapAnimCallSpellAssocSilencefx(struct Unit * unit);
void MapAnimSilence_InitGfx(struct MAEffectProc * proc);
void MapAnimSilence_InitScreenConf(struct MAEffectProc * proc);
void MapAnimSilence_Loop(struct MAEffectProc * proc);
void MapAnimCallSpellAssocBarrierfx(struct Unit * unit);
void MapAnimBarrierfx_Init(struct MAEffectProc * proc);
void MapAnimBarrierfx_Loop(struct MAEffectProc * proc);
void MapAnimUnlockEffect(int, int);
void HideUnitUnlockDoor(void);
void UnhideUnit(void);
void MapAnimUnlock_Init(struct MAEffectProc * proc);
void MapAnimUnlock_Loop1(struct MAEffectProc * proc);
void MapAnimUnlock_Loop2(struct MAEffectProc * proc);
void SetDefaultMapAnimScreenConf(void);

struct ProcMapAnimBgScroll
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int bg;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 x;
    /* 66 */ s16 x_inc;
    /* 68 */ s16 y;
    /* 6A */ s16 y_inc;
};

void StartMapAnimEffect_BgScroll(int bg, int x_inc, int y_inc, ProcPtr parent);
void EndMapAnimEffect_BgScroll(void);
void MapAnimEffect_BgScroll_Loop(struct ProcMapAnimBgScroll * proc);
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
void MapAnimStartSpellAssocFadeExt(ProcPtr proc);
void SpellAssocFadeMain(ProcPtr proc);
void MapAnimSpellAssocResetPalExt(ProcPtr proc);
void SpellAssocResetPalMain(ProcPtr proc);
void NewBG0Shaker(void);
void BG0Shaker_Init(struct MAFrameShakeProc * proc);
void BG0Shaker_Loop(struct MAFrameShakeProc * proc);
void LoadSparkGfx(void);
void PutSparkGfx(int x, int y);
void PutSparkGfxRotation(int xCenter, int yCenter, int distance, int angle);
void MapAnimRotation_Init(struct MAStarProc * proc);
void MapAnimRotation_Main(struct MAStarProc * proc);
void StartStarRotationEffect(int xCenter, int yCenter, int lo, int hi, int start, int end, int terminator);
void StartStarExplosionEffect(int ix, int iy);
void StartStarImplosionEffect(int ix, int iy);
void StartMapEventcallFx0(ProcPtr proc);
void MapEventcallFx0_Init(struct MAEffectProc * proc);
void MapEventcallFx0_PlayIntroAnim(struct MAEffectProc * proc);
void MapEventcallFx0_PlayMainAnim(struct MAEffectProc * proc);
void MapEventcallFx0_FillWhiteTile(struct MAEffectProc * proc);
void MapEventcallFx0_RampToWhite(struct MAEffectProc * proc);
void MapEventcallFx0_ClearBg2(void);
void StartMapEventcallFx1(ProcPtr proc);
void MapEventcallFx1_Init(struct MAEffectProc * proc);
void MapEventcallFx1_FadeWhiteDown(struct MAEffectProc * proc);
void MapEventcallFx1_PlayFadeAnim(struct MAEffectProc * proc);
void MapEventcallFx1_ClearBgs(void);
void StartMapEventcallFx2(ProcPtr proc);
void MapEventcallFx2_OnEnd(void);
// ??? MapEventcallFx2_Init(???);
// ??? MapEventcallFx2_PlayAnim(???);
// ??? MapEventcallFx2_RampToWhite(???);
// ??? MapEventcallFx2_FadeOutBlend(???);
// ??? MapEventcallFx2_ClearBgs(???);
void MapEventcallFx2_HBlankWobble(void);
// ??? MapanimEventcall_VsyncWaveLoop(???);
void StartDemonKingSummonAnim(ProcPtr);
// ??? MapanimEventcall_SummonLoadFrameAndPal(???);
// ??? MapanimEventcall_SummonLoadFrame(???);
// ??? MapanimEventcall_SummonFadeFramePal(???);
// ??? DemonKingSummonAnim_OnEnd(???);
// ??? DemonKingSummonAnim_Init(???);
// ??? DemonKingSummonAnim_PhaseIntro(???);
// ??? DemonKingSummonAnim_PhaseShakeRamp(???);
// ??? DemonKingSummonAnim_PhaseBurst(???);
// ??? DemonKingSummonAnim_PhaseFlashWhite(???);
// ??? DemonKingSummonAnim_PhaseDissolve(???);
// ??? DemonKingSummonAnim_PhaseOutro(???);
// ??? DemonKingSummonAnim_Cleanup(???);
// ??? DemonKingSummonShake_Init(???);
// ??? DemonKingSummonShake_Loop(???);
void New6C_SummonGfx(ProcPtr parent, int xMap, int yMap);
// ??? SummonGfxAnim_Init(???);
// ??? SummonGfxAnim_Loop(???);
// ??? SummonGfxAnim_Cleanup(???);
void StartSummonUnitRevealAnim(ProcPtr, struct Unit *);
// ??? SummonUnitGfx_Init(???);
// ??? SummonUnitGfx_Loop(???);
// ??? SummonUnitGfx_End(???);
void StartGlowingCross(ProcPtr, struct Unit *);
void RemoveGlowingCrossDirectly(void);
// ??? GlowingCross_Init(???);
// ??? GlowingCross_Loop(???);
// ??? GlowingCross_OnEnd(???);
void RemoveGlowingCrossDirectlyWithAnim(ProcPtr, int);
// ??? GlowCrossExit_Init(???);
// ??? GlowCrossExit_Loop(???);
// ??? Nop_MapanimEventcall_0(???);
const struct ProcCmd * MapAnim_GetRoundProcScript(void);
void MapAnim_AnimateSubjectIdle(ProcPtr proc);
void MapAnim_SubjectResetAnim(ProcPtr proc);
void MapAnim_StartSubjectDanceAnim(void);
void MapAnim_PlayDancerSe(void);
void MapAnim_PlayNonDancerSe(void);
void MapAnim_FreezeSubjectAnim(void);
void MapAnim_BeginSubjectFastAnim(void);
void MapAnimMoveUnitTowardsTargetExt(struct MuProc * mu1, struct MuProc * mu2);
void MapAnimMoveUnitAwayFromTargetExt(struct MuProc * mu1, struct MuProc * mu2);
void MapAnim_MoveSubjectsTowardsTarget(void);
void MapAnim_MoveSubjectsAwayFromTarget(void);
void MapAnim_MoveCameraOnSubject(ProcPtr proc);
void MapAnim_MoveCameraOnTarget(ProcPtr proc);
void SpellWarpMoveCamera(ProcPtr proc);
void MapAnim_BeginRoundSpecificAnims(ProcPtr proc);
void RegisterMapHpChangeAnim(int mapst_id, int damage);
void MapAnim_WaitForHPToEndChangingMaybe(ProcPtr proc);
void MapAnim_PoisonEffectOnTarget(ProcPtr proc);
void MapAnim_PoisonEffectOnTarget2(ProcPtr proc);
void MapAnim_StartGorgonHatchConditional(ProcPtr proc);
void MapAnimCallSpellAssocSilence(ProcPtr proc);
void MapAnimCallSpellAssocBarrier(ProcPtr proc);
void MapAnimCallSpellAssocLatona(ProcPtr proc);
void MapAnimCallSpellAssocNightMare(ProcPtr proc);
void MapAnimCallSpellAssocAntitoxin(ProcPtr proc);
void MapAnimCallSpellAssocPureWater(ProcPtr proc);
void MapAnimCallSpellAssocElixir(ProcPtr proc);
void MapAnimCallSpellAssocHeal(ProcPtr proc);
void MapAnimCallSpellAssocMend(ProcPtr proc);
void MapAnimCallSpellAssocRecover(ProcPtr proc);
void MapAnimCallSpellAssocVulenrary(ProcPtr proc);
void SpellWarpStartFlashy(ProcPtr proc);
void SpellWarpStartFlashyAtNewPos(ProcPtr proc);
void MapAnimCallSpellAssocTorch(ProcPtr proc);
void MapAnimCallSpellAssocUnlock(ProcPtr proc);
void MapAnimCallSpellAssocBerserk(ProcPtr proc);
void MapAnimCallSpellAssocRestore(ProcPtr proc);
void MapAnimCallSpellAssocSleep(ProcPtr proc);
void MapAnimCallSpellAssocMonsterStone(ProcPtr proc);
void MapAnimCallSpellAssocRepair(ProcPtr proc);
void SpellWarpStartFlashFade(ProcPtr proc);
void SpellWarpEndFlashFade(ProcPtr proc);
void SpellWarpMuHide(ProcPtr proc);
void SpellWarpStartExplosion(ProcPtr proc);
void SpellWarpStartImplosion(ProcPtr proc);
void SpellWarpMuShow(ProcPtr proc);
void SpellWarpSetNewPosition(ProcPtr proc);
void MapAnimStartSpellAssocFade(ProcPtr proc);
void MapAnimSpellAssocResetPal(ProcPtr proc);
void MapAnim_RefreshMapAndEndMus(ProcPtr proc);

void InitScanline();
void SetupMapAnimScanlineWindow(void);
void UpdateMapAnimScanline(int x, int y, int arg3);
void MapAnimResetHBlank(void);
void HBlank_MapAnimWin0H(void);
void HBlank_MapAnimEffect_SineWaveWindow(void);
void HBlank_MapAnimGradientColor(void);
void HBlank_MapAnimBldAlpha(void);
void HBlank_MapAnimBldY(void);
void StartManimFrameGradientScanlineEffect(u16, u16, u16, u16);
void PrepareProfileScanlineWindow(int x, int y, int a, int b, const u8 * unk);
// ??? PrepareSineWaveScanlineBuf(???);
// ??? PrepareSineWaveScanlineBufOffset(???);
// ??? PrepareSineWaveScanlineBufInterleaved(???);
// ??? PrepareSineWaveScanlineBufInterleavedOffset(???);
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd);
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 *);
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);
void MapAnimScanlineCore(u16 *, int, int, int);
void PrepareGradientScanlineBuf(u16 *, u16, u16, u16, u16);
// ??? ManimShiftingSineWaveScanlineBuf_Init(???);
// ??? ManimShiftingSineWaveScanlineBuf_Loop(???);
// ??? PrepareHorizontalBandScanlineBuf(???);
// ??? GetScanlineBufEntry(???);
// ??? MapAnimDitheredCircleScanlineCore(???);
void UpdateMapAnimDitheredCircleScanline(int, int, int);
// ??? PrepareFeatheredBandScanlineBuf(???);
void WorldFlushHBlank(void);
// ??? HBlank_MapAnimBldAlphaWorld(???);
// ??? HBlank_MapAnimBg2VOfs(???);
// ??? PrepareInterlaceDitherScanlineBuf(???);
// ??? HBlank_MapAnimBg1OfsInterlaced(???);
// ??? PrepareDistanceScaledSineWaveScanlineBuf(???);
// ??? HBlank_ScrollBG0(???);
// ??? HBlank_ScrollBG1(???);
// ??? HBlank_ScrollBG2(???);
// ??? HBlank_ScrollBG3(???);
// ??? HBlank_ScrollBG2WithBaseOffset(???);
// ??? HBlank_ScrollBG1AndBG2(???);
// ??? MapAnimEllipseScanlineCore(???);
// ??? UpdateMapAnimEllipseScanline(???);

#endif  // GUARD_MAPANIM_H
