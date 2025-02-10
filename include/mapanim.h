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

extern struct Unk082058B4 const gUnknown_082058B4[];

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
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEnd[];
extern CONST_DATA u16 gUnknown_089A3648[];
extern CONST_DATA int gUnknown_089A3668[];
extern CONST_DATA u8* TsaSet_MapBattleBoxGfx[3][2];
extern CONST_DATA struct ProcCmd ProcScr_MapBattleInfoBox[];
extern CONST_DATA u16 gUnknown_089A36C0[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimExpBar[];
extern CONST_DATA char *MADebugStrings1[];
// extern ??? gUnknown_089A3798
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
extern CONST_DATA struct ProcCmd ProcScr_089A3B84[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffectAnimator[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimWarpFlashy[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimTorch[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBerserk[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimRepair[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimRestore[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSleep[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimMonsterStone[];
extern CONST_DATA void * TsaSet_MonsterStoneMapAnimfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffect_Unk_089A3DB4[];
extern CONST_DATA u8 gUnknown_089A3DFC[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSilencefx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBarrierfx[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimUnlock[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimEffect_Unk_089A3EC4[];
// extern ??? gManimLevelUpLabelInfoList
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpStatGainLabel[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUpLabelColor[];
extern CONST_DATA struct ProcCmd ProcScr_ManimLevelUp[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocResetPal[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimBgShaker[];
extern CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocRotationEffect[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A40AC[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A419C[];
extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_089A42BC[];
extern CONST_DATA struct ProcCmd ProcScr_089A434C[];
extern CONST_DATA struct ProcCmd ProcScr_089A4394[];
extern struct MapAnimfxConf CONST_DATA gUnknown_089A43D4[];
extern struct MapAnimfxConf CONST_DATA gUnknown_089A43D8[];
extern CONST_DATA struct ProcCmd ProcScr_089A4434[];
extern CONST_DATA struct ProcCmd ProcScr_089A448C[];
extern struct MapAnimfxConf CONST_DATA gUnknown_089A44A4[];
extern struct ProcCmd gUnknown_089A45DC[];
extern struct ProcCmd gUnknown_089A4644[];
extern u8 * CONST_DATA gUnknown_089A4664[];
extern struct ProcCmd gUnknown_089A46AC[];
extern struct ProcCmd gUnknown_089A46DC[];
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
extern u16 gUnknown_089A5A6C[];
extern u16 ApConf_MapAnimTorchfx[];
extern u16 ApConf_089A6254[];
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
extern u8 Tsa_ShopWindows[]; // tsa
extern u16 Img_ShopGoldBox[]; // pal
extern u16 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern const u8 Img_GmapSoguSprites[];
extern u16 CONST_DATA Img_PoisonAnim[];
extern u16 CONST_DATA Pal_PoisonAnim[];
extern u16 CONST_DATA Img_LinkArenaWarpFx[];
extern u16 CONST_DATA Pal_LinkArenaWarpFx[];
extern u16 CONST_DATA gUnknown_089AE4A4[];
extern u8 Img_089AE7A4[];
extern u16 Pal_089AE7C4[];
extern u8 CONST_DATA Img_MapAnimAntitoxinPureWater[];
extern u16 CONST_DATA gUnknown_089AF310[];
extern u16 CONST_DATA Pal_MapAnimPureWater[];
extern u16 CONST_DATA Pal_MapAnimAntitoxin[];
extern u8 CONST_DATA gUnknown_089AF950[];
extern u8 CONST_DATA gUnknown_089AFAC4[];
extern u8 CONST_DATA gUnknown_089AFCBC[];
extern u16 CONST_DATA Pal_089AFF78[];
extern u16 CONST_DATA Pal_089AFFB8[];
extern u8 CONST_DATA gUnknown_089AFFF8[];
extern u8 CONST_DATA Img_MapAnimTorchfx[];
extern u16 CONST_DATA Pal_MapAnimTorchfx[];
extern u8 Img_MapAnimUnlockObjfx[];
extern u16 Pal_MapAnimUnlockObjfx[];
extern u8 Img_MapAnimUnlockBgfx[];
extern u16 Pal_MapAnimUnlockObjfx_Unk[];
extern u8 Tsa_MapAnimUnlockBgfx[];
extern u8 Tsa_089B0864[];
extern u8 Img_MapAnimRepairfx[];
extern u8 Tsa_089B17A4[];
extern u16 ApConf_MapAnimSleep[];
extern u8 Img_MapAnimBerserkfx[];
extern u16 Pal_MapAnimBerserkfx[];
extern u16 ApConf_MapAnimBerserkfx[];
extern u8 Img_ManimSilenceObjfx[];
extern u8 Img_ManimSilenceBgfx[];
extern u16 Pal_ManimSilencefx[];
extern u16 ApConf_ManimSilencefx[];
extern u8 Img_ManimBarrierBgfx[];
extern u8 Tsa_089B343C[];
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

extern u16 gUnknown_089B83C0[];
extern u16 gUnknown_089B89C4[];
extern u16 gUnknown_089B90D8[];
extern u16 gUnknown_089B98DC[];
extern u16 gUnknown_089BA190[];
extern u16 gUnknown_089BA9D8[];
extern u16 gUnknown_089BB2C8[];
extern u16 gUnknown_089BBD68[];
extern u16 gUnknown_089BC884[];
extern u16 gUnknown_089BD3B4[];
extern u16 gUnknown_089BDEE8[];
extern u16 gUnknown_089BEA90[];
extern u16 gUnknown_089BF5FC[];
extern u16 gUnknown_089BFF64[];
extern u16 gUnknown_089C08C0[];
extern u16 gUnknown_089C1190[];
extern u16 gUnknown_089C1BA8[];
extern u16 gUnknown_089C247C[];
extern u16 gUnknown_089C2BF0[];
extern u16 gUnknown_089C32A4[];
extern u16 gUnknown_089C39A8[];
extern u16 gUnknown_089C3EE8[];
extern u16 gUnknown_089C447C[];
extern u16 gUnknown_089C4834[];
extern u16 gUnknown_089C48E0[];
extern u16 gUnknown_089C495C[];
extern u16 gUnknown_089C49CC[];
extern u16 gUnknown_089C4E38[];
extern u16 gUnknown_089C5328[];
extern u16 gUnknown_089C5674[];
extern u16 gUnknown_089C5734[];
extern u16 gUnknown_089C57D8[];
extern u16 gUnknown_089C5F70[];
extern u16 gUnknown_089C65EC[];
extern u16 gUnknown_089C6A58[];
extern u16 gUnknown_089C6B20[];
extern u16 gUnknown_089C727C[];
extern u16 gUnknown_089C7A2C[];
extern u16 gUnknown_089C8440[];
extern u16 gUnknown_089C8DC4[];
extern u16 gUnknown_089C9A44[];
extern u16 gUnknown_089CA444[];
extern u16 gUnknown_089CAA10[];
extern u16 gUnknown_089CB7B0[];
extern u16 gUnknown_089CCA28[];
extern u16 gUnknown_089CCE8C[];
extern u16 gUnknown_089CD650[];
extern u16 gUnknown_089CE038[];
extern u16 gUnknown_089CEB94[];
extern u16 gUnknown_089CF7C0[];
extern u16 gUnknown_089D038C[];
extern u16 gUnknown_089D0E08[];
extern u16 gUnknown_089D1648[];
extern u16 gUnknown_089D1CA4[];
extern u16 gUnknown_089D20E0[];
extern u16 gUnknown_089D230C[];
extern u16 gUnknown_089D23D8[];
extern u16 gUnknown_089D23F8[];
extern u16 gUnknown_089D2418[];
extern u16 gUnknown_089D2438[];
extern u16 gUnknown_089D2458[];
extern u16 gUnknown_089D2478[];
extern u16 gUnknown_089D2498[];
extern u16 gUnknown_089D24B8[];
extern u16 gUnknown_089D24D8[];
extern u16 gUnknown_089D24F8[];
extern u16 gUnknown_089D2518[];
extern u16 gUnknown_089D2538[];
extern u16 gUnknown_089D2558[];
extern u16 gUnknown_089D2578[];
extern u16 gUnknown_089D2598[];
extern u16 gUnknown_089D25B8[];
extern u16 gUnknown_089D25D8[];
extern u16 gUnknown_089D25F8[];
extern u16 gUnknown_089D2618[];
extern u16 gUnknown_089D2638[];
extern u16 gUnknown_089D2658[];
extern u16 gUnknown_089D2678[];
extern u16 gUnknown_089D2698[];
extern u16 gUnknown_089D26B8[];
extern u16 gUnknown_089D26D8[];
extern u16 gUnknown_089D26F8[];
extern u16 gUnknown_089D2718[];
extern u16 gUnknown_089D2738[];
extern u16 gUnknown_089D2758[];
extern u16 gUnknown_089D2778[];
extern u16 gUnknown_089D2798[];
extern u16 gUnknown_089D27B8[];
extern u16 gUnknown_089D27D8[];
extern u16 gUnknown_089D27F8[];
extern u16 gUnknown_089D2818[];
extern u16 gUnknown_089D2838[];
extern u16 gUnknown_089D2858[];
extern u16 gUnknown_089D2878[];
extern u16 gUnknown_089D2898[];
extern u16 gUnknown_089D28B8[];
extern u16 gUnknown_089D28D8[];
extern u16 gUnknown_089D28F8[];
extern u16 gUnknown_089D2918[];
extern u16 gUnknown_089D2938[];
extern u16 gUnknown_089D2958[];
extern u16 gUnknown_089D2978[];
extern u16 gUnknown_089D2998[];
extern u16 gUnknown_089D29B8[];
extern u16 gUnknown_089D29D8[];
extern u16 gUnknown_089D29F8[];
extern u16 gUnknown_089D2A18[];
extern u16 gUnknown_089D2A38[];
extern u16 gUnknown_089D2A58[];
extern u16 gUnknown_089D2A78[];
extern u16 gUnknown_089D2A98[];
extern u16 gUnknown_089D2AB8[];
extern u16 gUnknown_089D2AD8[];
extern u16 gUnknown_089D2C30[];
extern u16 gUnknown_089D2DC0[];
extern u16 gUnknown_089D2F78[];
extern u16 gUnknown_089D3130[];
extern u16 gUnknown_089D32D8[];
extern u16 gUnknown_089D34A0[];
extern u16 gUnknown_089D36B0[];
extern u16 gUnknown_089D38CC[];
extern u16 gUnknown_089D3AD4[];
extern u16 gUnknown_089D3CF8[];
extern u16 gUnknown_089D3F20[];
extern u16 gUnknown_089D4150[];
extern u16 gUnknown_089D432C[];
extern u16 gUnknown_089D4500[];
extern u16 gUnknown_089D46C4[];
extern u16 gUnknown_089D48AC[];
extern u16 gUnknown_089D4A60[];
extern u16 gUnknown_089D4BFC[];
extern u16 gUnknown_089D4D74[];
extern u16 gUnknown_089D4ECC[];
extern u16 gUnknown_089D4FDC[];
extern u16 gUnknown_089D5100[];
extern u16 gUnknown_089D5214[];
extern u16 gUnknown_089D52D0[];
extern u16 gUnknown_089D538C[];
extern u16 gUnknown_089D5440[];
extern u16 gUnknown_089D5540[];
extern u16 gUnknown_089D5658[];
extern u16 gUnknown_089D5764[];
extern u16 gUnknown_089D5820[];
extern u16 gUnknown_089D58E0[];
extern u16 gUnknown_089D5A20[];
extern u16 gUnknown_089D5B58[];
extern u16 gUnknown_089D5C90[];
extern u16 gUnknown_089D5D4C[];
extern u16 gUnknown_089D5E9C[];
extern u16 gUnknown_089D5FF0[];
extern u16 gUnknown_089D6170[];
extern u16 gUnknown_089D62F8[];
extern u16 gUnknown_089D64EC[];
extern u16 gUnknown_089D66D0[];
extern u16 gUnknown_089D67F4[];
extern u16 gUnknown_089D6AA4[];
extern u16 gUnknown_089D6E1C[];
extern u16 gUnknown_089D6F0C[];
extern u16 gUnknown_089D704C[];
extern u16 gUnknown_089D71DC[];
extern u16 gUnknown_089D73B4[];
extern u16 gUnknown_089D75BC[];
extern u16 gUnknown_089D77CC[];
extern u16 gUnknown_089D79B4[];
extern u16 gUnknown_089D7B78[];
extern u16 gUnknown_089D7D04[];
extern u16 gUnknown_089D7E48[];
extern u16 gUnknown_089D7F48[];
extern u16 gUnknown_089D8010[];
extern u16 gUnknown_089D8198[];
extern u16 gUnknown_089D84A8[];
extern u16 gUnknown_089D8910[];
extern u16 gUnknown_089D925C[];
extern u16 gUnknown_089DA40C[];
extern u16 gUnknown_089DB1A0[];
extern u16 gUnknown_089DBFE0[];
extern u16 gUnknown_089DCD48[];
extern u16 gUnknown_089DCD68[];
extern u16 gUnknown_089DCD88[];
extern u16 gUnknown_089DCDA8[];
extern u16 gUnknown_089DCDC8[];
extern u16 gUnknown_089DCDE8[];
extern u16 gUnknown_089DCE08[];
extern u16 gUnknown_089DCE28[];
extern u16 gUnknown_089DCE48[];
extern u16 gUnknown_089DCF10[];
extern u16 gUnknown_089DCFFC[];
extern u16 gUnknown_089DD114[];
extern u16 gUnknown_089DD284[];
extern u16 gUnknown_089DD4E8[];
extern u16 gUnknown_089DD790[];
extern u16 gUnknown_089DDA68[];
extern u16 gUnknown_089DDE8C[];
extern u16 gUnknown_089DDF10[];
extern u16 gUnknown_089DDF9C[];
extern u16 gUnknown_089DE030[];
extern u16 gUnknown_089DE0BC[];
extern u16 gUnknown_089DE14C[];
extern u16 gUnknown_089DE1CC[];
extern u16 gUnknown_089DEA30[];
extern u16 gUnknown_089DF470[];
extern u16 gUnknown_089DFF90[];
extern u16 gUnknown_089E0AB8[];
extern u16 gUnknown_089E1480[];
extern u16 gUnknown_089E2154[];
extern u16 gUnknown_089E2C1C[];
extern u16 gUnknown_089E34A8[];
extern u16 gUnknown_089E3B88[];
extern u16 gUnknown_089E4024[];
extern u16 gUnknown_089E4344[];
extern u16 gUnknown_089E44B8[];
extern u16 gUnknown_089E45D0[];
extern u16 gUnknown_089E46E8[];
extern u16 gUnknown_089E47CC[];
extern u16 gUnknown_089E48C0[];
extern u16 gUnknown_089E49D8[];
extern u16 gUnknown_089E4AEC[];
extern u16 gUnknown_089E4BC8[];
extern u16 gUnknown_089E4C7C[];
extern u16 gUnknown_089E4C9C[];
extern u16 gUnknown_089E4CBC[];
extern u16 gUnknown_089E4CDC[];
extern u16 gUnknown_089E4CFC[];
extern u16 gUnknown_089E4D1C[];
extern u16 gUnknown_089E4D3C[];
extern u16 gUnknown_089E4D5C[];
extern u16 gUnknown_089E4D7C[];
extern u16 gUnknown_089E4D9C[];
extern u16 gUnknown_089E4DBC[];
extern u16 gUnknown_089E4DDC[];
extern u16 gUnknown_089E4DFC[];
extern u16 gUnknown_089E4E1C[];
extern u16 gUnknown_089E4E3C[];
extern u16 gUnknown_089E4E5C[];
extern u16 gUnknown_089E4E7C[];
extern u16 gUnknown_089E4E9C[];
extern u16 gUnknown_089E4EBC[];
extern u16 gUnknown_089E4EDC[];
extern u16 gUnknown_089E4EFC[];
extern u16 gUnknown_089E4F1C[];
extern u16 gUnknown_089E4F3C[];
extern u16 gUnknown_089E4F5C[];
extern u16 gUnknown_089E4F7C[];
extern u16 gUnknown_089E4F9C[];
extern u16 gUnknown_089E4FBC[];
extern u16 gUnknown_089E5074[];
extern u16 gUnknown_089E5130[];
extern u16 gUnknown_089E51EC[];
extern u16 gUnknown_089E52AC[];
extern u16 gUnknown_089E5364[];
extern u16 gUnknown_089E541C[];
extern u16 gUnknown_089E5600[];
extern u16 gUnknown_089E5814[];
extern u16 gUnknown_089E5A58[];
extern u16 gUnknown_089E5D08[];
extern u16 gUnknown_089E5FEC[];
extern u16 gUnknown_089E6290[];
extern u16 gUnknown_089E64D0[];
extern u16 gUnknown_089E66A0[];
extern u16 gUnknown_089E6808[];
extern u16 gUnknown_089E6924[];
extern u16 gUnknown_089E6A14[];
extern u16 gUnknown_089E6AE4[];
extern u16 gUnknown_089E6BB0[];
extern u16 gUnknown_089E6C80[];
extern u16 gUnknown_089E6D50[];
extern u16 gUnknown_089E6E1C[];
extern u16 gUnknown_089E6EE8[];
extern u16 gUnknown_089E6FB4[];
extern u16 gUnknown_089E7080[];

extern u8 gUnknown_089E714C[];

extern u8 Tsa_089E7E0C[];
extern u8 Tsa_089E7E2C[];
extern u8 Tsa_089E7E50[];
extern u8 Tsa_089E7E78[];
extern u8 Tsa_089E7EA0[];
extern u8 Tsa_089E7ECC[];
extern u8 Tsa_089E7EFC[];
extern u8 Tsa_089E7F2C[];
extern u8 Tsa_089E7F5C[];
extern u8 Tsa_089E7F8C[];
extern u8 Tsa_089E7FBC[];
extern u8 Tsa_089E7FFC[];
extern u8 Tsa_089E8040[];
extern u8 Tsa_089E8090[];
extern u8 Tsa_089E80EC[];
extern u8 Tsa_089E8148[];
extern u8 Tsa_089E81A4[];
extern u8 Tsa_089E8200[];

extern u16 gUnknown_089E7DEC[];

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
void EndMapAnimInfoWindow(void);
void StartMapAnimInfoWindow(int x, int y, struct Proc* parent);
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
void MapAnim_StartGorgonHatchAnim(struct Unit * unit);
void MapAnim_GorgonHatch_Init(struct MAEffectProc * proc);
void MapAnim_GorgonHatch_Loop(struct MAEffectProc * proc);
void LoadGorgonFromEgg(struct MAEffectProc * proc);
void MapAnim_GorgonHatch_ClearBg2(void);
void MapAnimCallSpellAssocLatonafx(struct Unit * unit);
void MapLatonafx_Init(struct MAEffectProc * proc);
void MapLatonafx_InitGfx(struct MAEffectProc * proc);
void sub_807D2C8(void);
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
void sub_807D7D8(struct Unit * unit);
void sub_807D818(struct MAEffectProc * proc);

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
void StartMapAnimEffect_Unk_089A3DB4(struct Unit * unit);
void MapAnim_Init_807E390(struct MAEffectProc * proc);
void MapAnim_Loop1_807E404(struct MAEffectProc * proc);
void MapAnim_Loop2_807E448(struct MAEffectProc * proc);

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

struct ManimSomethingProc_08067498
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

void StartMapAnimEffect_Unk_089A3EC4(int bg, int x_inc, int y_inc, ProcPtr parent);
void sub_807EA50(void);
void sub_807EA60(struct ManimSomethingProc_08067498 * proc);
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
void sub_8080474(ProcPtr);
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
void StartGlowingCross(ProcPtr, struct Unit *);
void RemoveGlowingCrossDirectly(void);
// ??? sub_8081078(???);
// ??? sub_8081100(???);
// ??? sub_80811AC(???);
void RemoveGlowingCrossDirectlyWithAnim(ProcPtr, int);
// ??? sub_80811EC(???);
// ??? sub_8081208(???);
// ??? nullsub_58(???);
const struct ProcCmd * MapAnim_GetRoundProcScript(void);
void MapAnim_AnimateSubjectIdle(ProcPtr proc);
void MapAnim_SubjectResetAnim(ProcPtr proc);
void sub_80812C0(void);
void sub_8081348(void);
void sub_8081384(void);
void sub_80813C0(void);
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
void sub_8081950(ProcPtr proc);
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
void sub_8081CF8(ProcPtr proc);
void SpellWarpMuHide(ProcPtr proc);
void SpellWarpStartExplosion(ProcPtr proc);
void SpellWarpStartImplosion(ProcPtr proc);
void SpellWarpMuShow(ProcPtr proc);
void SpellWarpSetNewPosition(ProcPtr proc);
void MapAnimStartSpellAssocFade(ProcPtr proc);
void MapAnimSpellAssocResetPal(ProcPtr proc);
void sub_8081E60(ProcPtr proc);

void InitScanline();
void sub_8081EAC(void);
void UpdateMapAnimScanline(int x, int y, int arg3);
void MapAnimResetHBlank(void);
void sub_8081F64(void);
void HBlank_MapAnimEffect_Unk_8081FA8(void);
void sub_8081FFC(void);
void sub_8082050(void);
void sub_8082094(void);
void StartManimFrameGradientScanlineEffect(u16, u16, u16, u16);
void sub_808218C(int x, int y, int a, int b, const u8 * unk);
// ??? PrepareSineWaveScanlineBuf(???);
// ??? sub_8082268(???);
// ??? sub_80822AC(???);
// ??? sub_80822F0(???);
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd);
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 *);
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);
void MapAnimScanlineCore(u16 *, int, int, int);
void PrepareGradientScanlineBuf(u16 *, u16, u16, u16, u16);
// ??? sub_80825B0(???);
// ??? sub_80825B8(???);
// ??? sub_80825E8(???);
// ??? sub_8082644(???);
// ??? sub_8082658(???);
void sub_8082730(int, int, int);
// ??? sub_8082764(???);
void WorldFlushHBlank(void);
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
