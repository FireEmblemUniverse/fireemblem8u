#ifndef GUARD_VARIABLES_H
#define GUARD_VARIABLES_H

#include "gba/types.h"
#include "types.h"
#include "prelude.h"
#include "proc.h"

extern u8 __ewram_start[];
// extern ??? gSavedraw_0
// extern ??? gSaveMenuSubBoxFont
// extern ??? gSaveMenuSubBoxText
extern u8 gPlayStChapterBits[];
extern u8 gPlayStChapterMode[];
extern struct PlaySt_OptionBits gPlayStOptionBits[];

extern u8 gEkrKakudaiSomeBufLeft[];
extern u16 gBmMapBuffer[];

// extern ??? gConvoyItemCount
// extern ??? gUnk_0
// extern ??? gBanimRightImgSheetBuf
extern struct Font gItemSelectMenuFont;

extern u8 gEkrKakudaiSomeBufRight[];

/* bmdifficulty.h */

extern u16 gUiTmScratchA[];
extern u16 gUiTmScratchB[];
extern u16 gUiTmScratchC[];

// extern ??? gChapterStatusText
// extern ??? gStatusScreenSt
// extern ??? gMUGfxBuffer
// extern ??? gUnk_1
// extern ??? gUnk_2
// extern ??? sGameStartSaveBuf
// extern ??? gUnk_3
// extern ??? gUnk_4
// extern ??? gUnk_5
extern u8 gUnk_6[];
// extern ??? gUnk_7
// extern ??? gUnk_8

/* unitlistscreen */

extern u16 gUnk_OpSubtitle_0[]; // used as a palette buffer in opsubtitle
// extern ??? gUnk_Opinfo_0
// extern ??? gUnk_OpInfo_0
extern char gBufPrep[];

// TODO: define this in hardware.c?
extern u8 gGenericBuffer[0x2000];

extern struct BmSt gBmSt;
extern struct PlaySt gPlaySt;
extern u8 gActiveUnitId;
extern struct Vec2 gActiveUnitMoveOrigin;
extern u8 gWorkingMovementScript[0x40];
extern u16 gConvoyItemArray[];
extern struct Unit* sUnitStackBase;
extern struct Unit* sUnitStackTop;
extern u8 sUnitStackSize;

extern int gBattleScripted;
extern int gBaArenaFlag;
// extern ??? gpActiveClassReelSpellProc
// extern ??? gpActiveCRSpellBgColorProc
// extern ??? gManimScanlineBufA
// extern ??? gManimScanlineBufs
// extern ??? gManimActiveScanlineBuf

// extern ??? gExtraMapStatus
// extern ??? gSaveMenuRTextData

// extern ??? gUnknown_03000000
// extern ??? gLCGRNValue

// extern ??? sAPArray

// extern ??? gPopupInst
// extern ??? gpPopupUnit
// extern ??? gPopupItem
// extern ??? gPopupNumber
// extern ??? sEventFadeSt
// extern ??? gUnknown_03000800
// extern ??? gUnknown_03000808
// extern ??? gUnk_39
// extern ??? gDungeonState
// extern ??? gUnk_40

extern u16 gUnk_51[];
// extern ??? gUnitDef1
// extern ??? gUnk_55
// extern ??? gUnitDef2
// extern ??? gUnitDefEggHatching
// extern ??? gUnk_56
extern s8 gUnk_57;
// extern ??? gActiveEventRegistry

// extern ??? gUnk_58
// extern ??? gUnk_59
// extern ??? gUnk_60
// extern ??? gUnk_61
// extern ??? gUnknown_03002B88
// extern ??? gUnknown_03002B8C
// extern ??? gUnknown_03002B90
// extern ??? gUnknown_03002B94
// extern ??? gUnknown_03002B98
// extern ??? SoundMainRAM_Buffer
// extern ??? gUnk_62
extern u8 gUnk_63;
extern void* gOamLoPutIt;
// extern ??? gUnk_65
extern u16 gOamAffinePutId;
// extern ??? gUnk_66
extern void (*sHBlankHandler1)(void);
extern u16 gOam[];
// extern ??? gUnk_67
extern u32 * gOamHiPutIt;
extern void (* sHBlankHandler2)(void);
// extern ??? gUnk_68
extern void (*gpARM_HuffmanTextDecomp)(const char *, char *);
// extern ??? gUnk_69
extern u16 * gOamAffinePutIt;
// extern ??? gUnknown_03004160
// extern ??? gUnk_70
// extern ??? gpBgVerticalScrollSt
// extern ??? gStatGainSimUnit
extern struct Unit * gActiveUnit;
// extern ??? gUnk_71
// extern ??? gUnk_72
// extern ??? gUnk_73
// extern ??? gUnk_74
// extern ??? gUnknown_03004F08
// extern ??? gUnknown_03004F0C
// extern ??? gUnk_75
extern int gUnk_76;
extern int gUnk_77;
extern int gEkrXQuakeOff;
extern int gBanimDebugCurrentIndex;
extern int gEkrYQuakeOff;

extern u8 gPermanentFlagBits[];
extern u8 gChapterFlagBits[];
extern struct GMapData gGMData;
// extern ??? gUnk_78
// extern ??? gUnk_79
extern u16 gGmMonsterRnState[];
extern struct Font gFontClassChgMenu;
extern struct Font gFontClassChg;
extern s8 gUnk_80;

// extern ??? gUnk_82
extern u16 gUnk_83[];
// extern ??? gSoundInfo
extern struct MusicPlayerInfo gMPlayInfo_SE4_BMP2;
extern struct MusicPlayerInfo gMPlayInfo_SE5_BMP3;
extern struct MusicPlayerInfo gMPlayInfo_BGM1;
// extern ??? gMPlayJumpTable
// extern ??? gUnk_84
// extern ??? gUnk_85
// extern ??? gUnk_86
// extern ??? gCgbChans
extern struct MusicPlayerInfo gMPlayInfo_SE6_BMP4;
extern struct MusicPlayerInfo gMPlayInfo_BGM2;
extern struct MusicPlayerInfo gMPlayInfo_SE1_SYS1;
extern struct MusicPlayerInfo gMPlayInfo_SE3_BMP1;
// extern ??? gMPlayMemAccArea
extern struct MusicPlayerInfo gMPlayInfo_SE7_EVT;
extern struct MusicPlayerInfo gMPlayInfo_SE2_SYS2;

// const data
// extern ??? gUnknown_08000540
extern const char gBuildDateTime[]; // "2005/02/04(FRI) 16:55:40...."
extern const char gYearProjectCreated[]; // "_2003..."
// extern ??? gUnknown_080D74F4
extern const u16 gUnknown_080D7504[];
// extern ??? sGenericChibiImgLut
// extern ??? sGenericChibiPalLut
// extern ??? gFace_0
// extern ??? gUnknown_080D792C
// extern ??? gUnknown_080D793C
// extern ??? UnitMenuOverrideConf
// extern ??? ItemMenuOverrideConf
extern const char gUnknown_080D7954[];
// extern ??? gBmlib_0
// extern ??? gUnknown_080D79D8
// extern ??? gUnknown_080D79E0
// extern ??? gUnknown_080D7A10
// extern ??? gUnknown_080D7A30
// extern ??? gUnknown_080D7A38
// extern ??? gUnknown_080D7A64
// extern ??? Vectors_LightRune
// extern ??? Vectors_LightRune2
// extern ??? Vectors_LightRune3
// extern ??? Vectors_DanceringFx
// extern ??? gBmdifficulty_6

// extern ??? gMsgHuffmanTable
// extern ??? gMsgHuffmanTableRoot
extern const u8 *const gMsgTable[];

extern u16 gPal_StoneShatterAnim[];
extern u8 gImg_StoneShatterAnim[];
extern u8 gTsa_StoneShatter_0[];
extern u8 gTsa_StoneShatter_1[];
extern u8 gTsa_StoneShatter_2[];
extern u8 gTsa_StoneShatter_3[];
extern u8 gTsa_StoneShatter_4[];
extern u8 gTsa_StoneShatter_5[];
extern u8 gTsa_StoneShatter_6[];
extern u8 gTsa_StoneShatter_7[];
extern u8 gTsa_StoneShatter_8[];
extern u8 gTsa_StoneShatter_9[];
extern u8 gTsa_StoneShatter_10[];
extern u8 gTsa_StoneShatter_11[];
extern u8 gTsa_StoneShatter_12[];
extern u8 gTsa_StoneShatter_13[];

extern const u8 gMapanimApi_0[4];
// extern ??? NigtMarefxConf
extern const u8 gUnknown_08205824[];
extern const u8 gUnknown_08205833[];
extern const u8 gUnknown_08205846[];
extern const u8 gUnknown_08205855[];
extern const int gMapanimEventcall_0[];
extern const u8 gMapanimEventcall_1[];
extern const u8 gMapanimEventcall_2[];
//extern unsigned const gMapanimEventcall_3[];
extern u8 const gMapanimEventcall_4[];
// extern ??? gMapanimEventcall_5
// extern ??? gMapanimEventcall_6
// extern ??? gMapanimEventcall_7
// extern ??? gMapanimEventcall_8
// extern ??? gMapanimEventcall_9
// extern ??? gMapanimEventcall_10
// extern ??? gMapanimEventcall_11
// extern ??? gMapanimEventcall_12
// extern ??? gMapanimEventcall_13
// extern ??? gMapanimEventcall_14
// extern ??? gMapanimEventcall_15
// extern ??? sUnitListPageArrowYOffsetLut
// extern ??? gUnknown_08205BC0
// extern ??? gLinkArenaBanList
// extern ??? gUnknown_08205C14
// extern ??? Pals_PrepWindow
// extern ??? gUnknown_08205C64
extern const struct FaceVramEntry gFaceConfig_PrepItemUseScreen[4];
// extern ??? sSaveMarker
// extern ??? sConvySavePackMask1
// extern ??? sConvySavePackMask2
// extern ??? gInitialMultiArenaRankings
// extern ??? gUnknown_08205D7C
// extern ??? Objs1_SysBrownBox
// extern ??? Objs2_SysBrownBox
// extern ??? sWMFaceCtrlLoopFrameCycle
// extern ??? gWorldmapGmapunit_0

// extern ??? gWorldmapScreen2_0
// extern ??? gWorldmapCursor_0

// extern ??? gWorldmapPath_20

// extern ??? gUnknown_08206954

// extern ??? gWorldmapRadar_0
// extern ??? gEndingCredits_0
// extern ??? gUnknown_08206FB4
// extern ??? gEndingCredits_1
// extern ??? gOpSubtitleGfxLut
// extern ??? gUnknown_08207044
// extern ??? gUnknown_0820707C
// extern ??? gUnknown_08207088
// extern ??? gUnknown_08207094
// extern ??? gUnknown_082070A0
// extern ??? gUnknown_082070AC
// extern ??? gMPlayJumpTableTemplate
// extern ??? gScaleTable
// extern ??? gFreqTable
// extern ??? gPcmSamplesPerVBlankTable
// extern ??? gCgbScaleTable
// extern ??? gCgbFreqTable
// extern ??? gNoiseTable
// extern ??? gUnknown_082073F4
// extern ??? gClockTable
// extern ??? gXcmdTable
// extern ??? gMPlayTable
// extern ??? gSongTable
// extern ??? gUnknown_08587700
// extern ??? gUnknown_08587710
// extern ??? gUnknown_08587720
// extern ??? gUnknown_08587724
// extern ??? gUnknown_08587728
// extern ??? gUnknown_0858773C
// extern ??? gUnknown_08587744
// extern ??? gUnknown_08587758
// extern ??? gUnknown_08587774
// extern ??? gUnknown_08587778
// extern ??? LC0
// extern ??? LC2
// extern ??? LC4
// extern ??? gUnknown_08587794
// extern ??? gUnknown_085877C4
// extern ??? gUnknown_085877CC
// extern ??? p05_27
// extern ??? __mprec_tens
// extern ??? __mprec_bigtens
// extern ??? gUnknown_085878F4
// extern ??? gUnknown_085878F8

// .data variables
// Everything below this point must not be declared as const.

extern void *gUnknown_08587938[];
extern struct BgCnt *gUnknown_08587948[];
// extern ??? sMusicProc1Script
// extern ??? sMusicProc2Script
// extern ??? gMusicProc3Script
// extern ??? sMusicProc4Script
// extern ??? gProcCmdFuncs
extern u8 debug_font_4bpp[];
extern u16 *s2bppTo4bppLutTable[];
// extern ??? ProcScr_TextPrint
// extern ??? ProcScr_GreenTextColor
extern u16 gFontgrp_3[];
extern u16 gFontgrp_4[];
extern u16 gFontgrp_5[];
extern u16 gFontgrp_6[];
extern u16 gFontgrp_7[];
extern u16 gFontgrp_8[];
extern u16 gFontgrp_9[];
extern u16 gFontgrp_10[];
extern u16 gFontgrp_11[];
extern u16 gFontgrp_12[];
extern u16 gFontgrp_13[];
extern u16 gFontgrp_14[];
extern u16 gFontgrp_15[];
extern struct Glyph *TextGlyphs_System[];
extern struct Glyph *TextGlyphs_Talk[];
extern struct Glyph *TextGlyphs_Special[];
extern struct ProcCmd CONST_DATA gProcScr_TalkPutSpriteText_Unused[];
extern struct ProcCmd CONST_DATA ProcScr_Scene_0[];
extern struct ProcCmd CONST_DATA ProcScr_ScreenFlashing[];

extern const char *gStrPrefix[][2];
//extern struct {u32 *unk0; u32 *unk4; u32 *unk8;} gStrPrefix;
// extern ??? gSpline_0

extern struct ProcCmd CONST_DATA ProcScr_EventFadefx[];
extern struct ProcCmd CONST_DATA ProcScr_ShinningStonefx[];
extern struct ProcCmd CONST_DATA ProcScr_BoomFogFx[];
extern struct ProcCmd CONST_DATA ProcScr_EventEarthQuake[];
extern struct ProcCmd CONST_DATA gProcScr_StoneShatterEvent[];
// extern ??? BmBgxConf_StoneShatter
// extern ??? gUnknown_085926F4
// extern ??? gUnknown_085996F4
// extern ??? gBmlib_1

// extern ??? ProcScr_PartialGameLock
// extern ??? gStatusNameTextIdLookup
// extern ??? gUnitLookup
// extern ??? gTilesetTerrainLookup
// extern ??? gBmMapBaseTiles
extern struct ProcCmd CONST_DATA sProcScr_KOIDO[];
extern struct ProcCmd CONST_DATA sProcScr_KOIDOAMM[];
// extern ??? sProcScr_BMXFADE
extern struct ProcCmd CONST_DATA gProcScr_ADJUSTSFROMXI[];
extern struct ProcCmd CONST_DATA gProcCmd_ConvoyMenu[];
// extern ??? gProcCmd_MenuItemPanel
// extern ??? sProcScr_PrepUnitSwap
extern u16 CONST_DATA obj_Phasechangefx_0[];

// extern ??? ProcScr_GasTrapAnim
// extern ??? ProcScr_FireTrapAnim
// extern ??? ProcScr_UnkTrapAnim
// extern ??? ProcScr_ArrowTrapAnim
// extern ??? ProcScr_ShowMapChangeAnim
// extern ??? ProcScr_PikeTrapAnim
// extern ??? ProcScr_Popup2
 extern struct ProcCmd gProcScr_ChapterIntro[];
// extern ??? ProcScr_GameOverScreen
// extern ??? ProcScr_LightRuneAnim
// extern ??? ProcScr_LightRuneAnim2
// extern ??? ProcScr_LightRuneAnim3
// extern ??? ProcScr_DanceringAnim
// extern ??? Vectors_EventWarp1
// extern ??? Vectors_EventWarp2
// extern ??? ProcScr_EventWrapAnim
// extern ??? ProcScr_WhiteCircleFx
// extern ??? ProcScr_EmitSingleStar
// extern ??? ProcScr_EmitStars
// extern ??? Img_EmitedStar
// extern ??? ProcScr_MineFx
// extern ??? gProcScr_SquareSelectWarp
// extern ??? gProcScr_SquareSelectTorch
// extern ??? EventScr_TradeTutStart
// extern ??? EventScr_TradeTut_SelectItem
// extern ??? EventScr_TradeTut_PressAtoGetItem
// extern ??? EventScr_TradeTutDone
extern struct ProcCmd CONST_DATA gProcScr_UpdateTraps[];
// extern ??? gProc_MapTask
extern u16 gGfx_MiscUiGraphics[];
extern u16 gPal_MiscUiGraphics[];
extern u8 gImg_UiCursorHandTop[];
extern u8 gImg_UiCursorHandBottom[];
// extern ??? gUnknown_0859EE20
// extern ??? gUnknown_0859EE40
// extern ??? gUnknown_0859EE60
// extern ??? gUnknown_0859EEA0
extern u16 gPal_MapSprite[];
extern u16 gPal_LightRune[];
extern u16 gPal_MapSpriteArena[];
extern u16 gPal_MapSpriteSepia[];
extern u16 Pal_Text[];
extern u8 Pal_TalkText[];
extern u16 Pal_HelpBox[]; // pal
extern u16 gPal_HelpTextBox[];
extern u16 gPal_YellowTextBox[];
extern u16 Pal_GreenTextColors[];
extern u16 Pal_Text_Inverted[];
extern u16 Pal_TalkBubble_Inverted[];

extern u8 gBattleForecast_0[]; // tsa
extern u8 gBattleForecast_1[]; // tsa

// extern ??? gBattleForecast_2
extern u16 CONST_DATA gWarpPrepUnitSwapCursorAp[]; // ap
// extern ??? SpriteAnim_GasTrapVertical
// extern ??? SpriteAnim_GasTrapHorizontal
// extern ??? Img_GasTrapVertical
// extern ??? Img_GasTrapHorizontal
// extern ??? Pal_GasTrap
// extern ??? Pal_ArrowTrap
// extern ??? Img_ArrowTrap
// extern ??? SpriteAnim_ArrowTrap
// extern ??? Img_FireTrap
// extern ??? Pal_FireTrap
// extern ??? SpriteAnim_FireTrap
// extern ??? Pal_FireTrap2
// extern ??? Img_PikeTrap
// extern ??? SpriteAnim_PikeTrap
// extern ??? Pal_PikeTrap

// Weather graphics
extern const u8  gParticlesFx_0[]; // sandstorm particle 4bpp image (compressed)
extern const u8  gParticlesFx_1[]; // snowstorm particle 4bpp image (compressed)
extern const u8  gParticlesFx_2[]; // flames particle 4bpp image (compressed)
extern const u16 gParticlesFx_3[]; // flames particle palette
extern const u8  gParticlesFx_4[]; // clouds 4bpp image (compressed)
extern const u16 gParticlesFx_5[]; // clouds palette

extern u16 CONST_DATA Img_LightRune[];
extern u16 CONST_DATA Pal_LightRune[];
extern u16 CONST_DATA Tsa_LightRune[];

extern u16 CONST_DATA Img_EventWarp[];
extern u16 CONST_DATA Pal_EventWarp[];
extern u16 CONST_DATA Tsa_EventWarp[];

extern u8 gParticlesFx_6[];
extern u16 gParticlesFx_7[];
extern u8 Tsa_PlayerRankFog[]; // tsa

extern u16 CONST_DATA Img_DanceringFx[];
extern u16 CONST_DATA Tsa_DanceringFx[];
extern u16 CONST_DATA Pal_DanceringFx[];

extern u16 CONST_DATA Img_MineFx[];
extern u16 CONST_DATA SpritAnim_MineFx[];
extern u16 CONST_DATA Pal_MineFx[];

extern u16 CONST_DATA Pal_EventCursorShinning[];
// extern ??? gProcScr_CpPhase
// extern ??? gProcScr_BerserkCpPhase
// extern ??? gProcScr_CpDecide
// extern ??? gAiDoorTerrainList
// extern ??? gAiChestTerrainList
// extern ??? gUnknown_085A92E0
// extern ??? gUnknown_085A92E4
// extern ??? gUnknown_085A9304

/* sio.h */

// extern ??? gProcScr_TargetSelection
// extern ??? gNearTargetLinkOrder
extern const u8  gUiFrameImage[];
extern const u16 gUiFramePaletteA[];
extern const u16 gUiFramePaletteB[];
extern const u16 gUiFramePaletteC[];
extern const u16 gUiFramePaletteD[];
extern const u8  gLegacyUiFrameAImage[];
extern const u16 gLegacyUiFrameAPalette[];
extern const u16 gUiBarPaletteA[];
extern const u8  gLegacyUiFrameBImage[];
extern const u16 gLegacyUiFrameBPalette[];
extern const u16 gUiBarPaletteB[];
extern const u8  gLegacyUiFrameCImage[];
extern const u16 gLegacyUiFrameCPalette[];
extern const u16 gUiBarPaletteC[];
extern const u8  gLegacyUiFrameDImage[];
extern const u16 gLegacyUiFrameDPalette[];
extern const u16 gUiBarPaletteD[];
extern const u8  gUnkUiFrameImage[];
extern const u16 gUnkUiFramePalettes[];
extern u8 Img_SysGrayBox[];

extern u8 Img_EkrExpBar[];
extern u16 Img_EkrExpBarChange[];
extern u16 Img_BarNumfx[];
extern u16 Tsa_EkrExpBar[];
extern u16 Pal_ExpBar[];
extern u16 Img_LevelUpBoxFrame[];
extern u16 Tsa_LevelUpBoxFrame[];
extern u16 Pal_LevelUpBoxFrame[];
extern u16 Img_EkrPopup[];
extern u16 gBanimmisc_12[];
extern u16 Pal_EkrPopup[];
extern u16 Tsa_EkrPopup[];
// extern ??? gCharacterData

extern CONST_DATA s8 TerrainTable_MovCost_CommonT2Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT1Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_ArmorNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_FighterNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_BerserkerNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_BrigandNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_PirateNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_ThiefNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_MagicNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_CivilianNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT1Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT2Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_FlyNormal[];
extern CONST_DATA s8 TerrainTable_MovCost_DemonKing[];
extern CONST_DATA s8 TerrainMoveCost_Ballista[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT2Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT1Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_ArmorRain[];
extern CONST_DATA s8 TerrainTable_MovCost_FighterRain[];
extern CONST_DATA s8 TerrainTable_MovCost_BerserkerRain[];
extern CONST_DATA s8 TerrainTable_MovCost_BrigandRain[];
extern CONST_DATA s8 TerrainTable_MovCost_PirateRain[];
extern CONST_DATA s8 TerrainTable_MovCost_ThiefRain[];
extern CONST_DATA s8 TerrainTable_MovCost_MagicRain[];
extern CONST_DATA s8 TerrainTable_MovCost_CivilianRain[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT1Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT2Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_FlyRain[];
extern CONST_DATA s8 Unk_TerrainTable_1[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT2Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT1Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_ArmorSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_FighterSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_BerserkerSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_BrigandSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_PirateSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_ThiefSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_MagicSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_CivilianSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT1Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_AnimalT2Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_FlySnow[];
extern CONST_DATA s8 Unk_TerrainTable_2[];
extern CONST_DATA s8 TerrainTable_Avo_Common[];
extern CONST_DATA s8 TerrainTable_Def_Common[];
extern CONST_DATA s8 TerrainTable_Res_Common[];
extern CONST_DATA s8 TerrainTable_Avo_Fly[];
extern CONST_DATA s8 TerrainTable_Def_Fly[];
extern CONST_DATA s8 TerrainTable_Res_Fly[];
extern CONST_DATA s8 Unk_TerrainTable_3[];
extern CONST_DATA s8 Unk_TerrainTable_4[];
extern CONST_DATA s8 Unk_TerrainTable_5[];
extern CONST_DATA s8 Unk_TerrainTable_6[];
extern CONST_DATA s8 Unk_TerrainTable_7[];
extern CONST_DATA s8 TerrainTable_HealAmount[];
extern CONST_DATA s8 TerrainTable_HealsStatus[];
extern CONST_DATA s8 BanimTerrainGroundDefault[];
extern CONST_DATA s8 BanimTerrainGround_Tileset01[];
extern CONST_DATA s8 BanimTerrainGround_Tileset02[];
extern CONST_DATA s8 BanimTerrainGround_Tileset03[];
extern CONST_DATA s8 BanimTerrainGround_Tileset04[];
extern CONST_DATA s8 BanimTerrainGround_Tileset05[];
extern CONST_DATA s8 BanimTerrainGround_Tileset06[];
extern CONST_DATA s8 BanimTerrainGround_Tileset07[];
extern CONST_DATA s8 BanimTerrainGround_Tileset08[];
extern CONST_DATA s8 BanimTerrainGround_Tileset09[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0A[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0B[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0C[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0D[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0E[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0F[];
extern CONST_DATA s8 BanimTerrainGround_Tileset10[];
extern CONST_DATA s8 BanimTerrainGround_Tileset11[];
extern CONST_DATA s8 BanimTerrainGround_Tileset12[];
extern CONST_DATA s8 BanimTerrainGround_Tileset13[];
extern CONST_DATA s8 BanimTerrainGround_Tileset14[];
extern CONST_DATA s8 gBanimBGLutDefault[];
extern CONST_DATA s8 gBanimBGLut01[];
extern CONST_DATA s8 gBanimBGLut02[];
extern CONST_DATA s8 gBanimBGLut03[];
extern CONST_DATA s8 gBanimBGLut04[];
extern CONST_DATA s8 gBanimBGLut05[];
extern CONST_DATA s8 gBanimBGLut06[];
extern CONST_DATA s8 gBanimBGLut07[];
extern CONST_DATA s8 gBanimBGLut08[];
extern CONST_DATA s8 gBanimBGLut09[];
extern CONST_DATA s8 gBanimBGLut0A[];
extern CONST_DATA s8 gBanimBGLut0B[];
extern CONST_DATA s8 gBanimBGLut0C[];
extern CONST_DATA s8 gBanimBGLut0D[];
extern CONST_DATA s8 gBanimBGLut0E[];
extern CONST_DATA s8 gBanimBGLut0F[];
extern CONST_DATA s8 gBanimBGLut10[];
extern CONST_DATA s8 gBanimBGLut11[];
extern CONST_DATA s8 gBanimBGLut12[];
extern CONST_DATA s8 gBanimBGLut13[];
extern CONST_DATA s8 gBanimBGLut14[];

extern u16 CONST_DATA gTerrains_0[]; // terrainid-to-textid lookup
// extern ??? gUnknown_088ACBC4
extern CONST_DATA u8 ItemEffectiveness_Itemuse_0[];
extern CONST_DATA u8 ItemEffectiveness_Armor[];
extern CONST_DATA u8 ItemEffectiveness_ArmorAndHorse[];
extern CONST_DATA u8 ItemEffectiveness_Swordsman[];
extern CONST_DATA u8 ItemEffectiveness_Horse[];
extern CONST_DATA u8 ItemEffectiveness_FlierAndMonsters[];
extern CONST_DATA u8 ItemEffectiveness_Dragon[];
extern CONST_DATA u8 ItemEffectiveness_Itemuse_1[];
extern CONST_DATA u8 ItemEffectiveness_Flier[];
extern CONST_DATA u8 ItemEffectiveness_Monsters[];
extern CONST_DATA u8 JidLutUnk_Tier0[];
extern CONST_DATA u8 gItemUseJidList_HeroCrest[];
extern CONST_DATA u8 gItemUseJidList_KnightCrest[];
extern CONST_DATA u8 gItemUseJidList_OrionsBolt[];
extern CONST_DATA u8 gItemUseJidList_ElysianWhip[];
extern CONST_DATA u8 gItemUseJidList_GuidRing[];
extern CONST_DATA u8 Unk_Itemuse_0[];
extern CONST_DATA u8 gItemUseJidList_MasterSeal[];
extern CONST_DATA u8 gItemUseJidList_HeavenSeal[];
extern CONST_DATA u8 Unk_Itemuse_1[];
extern CONST_DATA u8 Unk_Itemuse_2[];
extern CONST_DATA u8 Unk_Itemuse_3[];
extern CONST_DATA u8 gItemUseJidList_OceanSeal[];
extern CONST_DATA u8 Unk_Itemuse_4[];
extern CONST_DATA u8 gItemUseJidList_C1[];
extern CONST_DATA u8 gItemUseJidList_LunarBrace[];
extern CONST_DATA u8 gItemUseJidList_SolarBrace[];
extern CONST_DATA u8 Unk_Itemuse_5[];
extern CONST_DATA u8 Unk_Itemuse_6[];
extern CONST_DATA u8 Unk_Itemuse_7[];
extern CONST_DATA u8 Unk_Itemuse_8[];
// extern ??? gSupportData
// extern ??? ItemBonus_Excalibur
// extern ??? gUnknown_088AF880
// extern ??? gUnknown_088AFB5A
// extern ??? gSpellAssocData
// extern ??? Events_WM_Beginning
// extern ??? Events_WM_ChapterIntro
// extern ??? gUnknown_088D2058
extern struct gfx_set CONST_DATA gConvoBackgroundData[];
extern u8 CONST_DATA gPromoJidLut[][2];
extern u8 gAnimCharaPalConfig[0x100][7];
extern u8 gAnimCharaPalIt[0x100][7];
extern u8 gSummonConfig[4][2];
// extern ??? gUnknown_0895F5A5
extern u16 Img_EventMapAnimMaskfx_Frame0[];
extern u16 Img_99E1A4[];
extern u16 Img_99ED44[];
extern u16 Img_99F7D4[];
extern u16 Img_9A0154[];
extern u16 Img_9A0864[];
extern u16 TileSet_9A0E84[];
extern u16 TileSet_9A1050[];
extern u16 TileSet_9A1228[];
extern u16 TileSet_9A13EC[];
extern u16 TileSet_9A15B4[];
extern u16 TileSet_9A174C[];
extern u16 CONST_DATA Pal_EventMapAnimMaskfx[];      /* a palatte */
extern u16 CONST_DATA Img_Congratulations[];      /* a image */
extern u16 CONST_DATA Img_MapClear[];      /* a image */
extern u16 CONST_DATA Pal_Congratulations[];      /* a palatte */
extern u16 CONST_DATA Pal_MapClear[];      /* a palatte */
extern u8 gImg_CombatRecordTitle[]; // "combat record" img
extern u8 gTsa_CombatRecordTitle[]; // "combat record" tsa
extern u16 gPal_CombatRecordTitle[]; // "combat record" pal

// extern ??? Img_TalkBubble
extern u16 Pal_TalkBubble[];
// extern ??? gUidebug_0
// extern ??? gUidebug_1
// extern ??? gUidebug_2
extern struct ProcCmd ProcScr_BmGameOver[];
extern struct ProcCmd ProcScr_ForceAsyncButtonB[];
extern struct ProcCmd ProcScr_EventHorizontalQuakefx[];
extern struct ProcCmd ProcScr_EventVerticalQuakefx[];
extern struct ProcCmd ProcScr_EventQuakefx[];
extern struct ProcCmd ProcScr_UnitTornOut[];
extern struct ProcCmd ProcScr_WorldFlush[];
extern u16 CONST_DATA Obj_EventsScriptUtils_0[];
extern u16 CONST_DATA *ImgLut_EventMapAnimMaskfx[];    /* images */
extern u16 CONST_DATA *TsaLut_EventMapAnimMaskfx[];    /* images */
extern struct ProcCmd ProcScr_EventMapAnim[];
extern struct ProcCmd gEventsScriptUtils_0[];
// extern ??? gAutoUdefJids
// extern ??? EventScr_SkirmishCommonBeginning
// extern ??? EventScr_Ruin_83
// extern ??? EventScr_Ruin_84
// extern ??? EventScr_EirikaModeGameEnd
// extern ??? EventScr_EphraimModeGameEnd
extern struct ProcCmd ProcScr_SlidingWallBg[];
// extern ??? gProcScr_SSPageSlide
// extern ??? gProcScr_SSGlowyBlendCtrl
// extern ??? gProcScr_SSUnitSlide
// extern ??? gProcScr_StatScreen
// extern ??? gProcScr_HelpBox
// extern ??? gProcScr_HelpBoxMoveCtrl
// extern ??? gProcScr_HelpBoxLock
// extern ??? gProcScr_HelpPromptSpr
// extern ??? gHelpInfo_Ss0Pow
// extern ??? gHelpInfo_Ss1CharName
// extern ??? gHelpInfo_Ss1Item0
// extern ??? gHelpInfo_Ss2Rank0
// extern ??? gHelpInfo_MbpHp
// extern ??? gHelpInfo_CbpHp
extern unsigned CONST_DATA gMid_Lv;
extern unsigned CONST_DATA gMid_Exp;
extern unsigned CONST_DATA gMid_Hp;
extern unsigned CONST_DATA gMid_Str;
extern unsigned CONST_DATA gMid_Mag;
extern unsigned CONST_DATA gMid_Skl;
extern unsigned CONST_DATA gMid_Spd;
extern unsigned CONST_DATA gMid_Def;
extern unsigned CONST_DATA gMid_Res;
extern unsigned CONST_DATA gMid_Lck;
extern unsigned CONST_DATA gMid_Con;
extern unsigned CONST_DATA gMid_Aid;
extern unsigned CONST_DATA gMid_Mov;
extern unsigned CONST_DATA gMid_Trv;
extern unsigned CONST_DATA gMid_Affin;
extern unsigned CONST_DATA gMid_Rng;
extern unsigned CONST_DATA gMid_Atk;
extern unsigned CONST_DATA gMid_Hit;
extern unsigned CONST_DATA gMid_Crt;
extern unsigned CONST_DATA gMid_Avo;
extern unsigned CONST_DATA gMid_Cnd;
extern unsigned CONST_DATA gMid_Mt;
extern unsigned CONST_DATA gMid_Wt;
extern unsigned CONST_DATA gMid_RangeMpOn2;
extern unsigned CONST_DATA gMid_Range1To1;
extern unsigned CONST_DATA gMid_Range1To2;
extern unsigned CONST_DATA gMid_Range1To3;
extern unsigned CONST_DATA gMid_Range2To2;
extern unsigned CONST_DATA gMid_Range2To3;
extern unsigned CONST_DATA gMid_Range3To10;
extern unsigned CONST_DATA gMid_Range3To15;
extern unsigned CONST_DATA gMid_Unk08A011D4;
extern unsigned CONST_DATA gMid_Poison;
extern unsigned CONST_DATA gMid_Sleep;
extern unsigned CONST_DATA gMid_Silence;
extern unsigned CONST_DATA gMid_Berserk;
extern unsigned CONST_DATA gMid_Sword;
extern unsigned CONST_DATA gMid_Lance;
extern unsigned CONST_DATA gMid_Axe;
extern unsigned CONST_DATA gMid_Bow;
extern unsigned CONST_DATA gMid_Staff;
extern unsigned CONST_DATA gMid_Anima;
extern unsigned CONST_DATA gMid_Light;
extern unsigned CONST_DATA gMid_Dark;
// extern ??? gUnknown_08A01208
// extern ??? gProcScr_HelpBoxTextScroll
// extern ??? ProcScr_HelpBoxIntro
// extern ??? ProcScr_Helpbox_bug_0
// extern ??? gHelpbox_0
// extern ??? gHelpbox_1
// extern ??? gHelpbox_2
extern struct ProcCmd gProcScr_BoxDialogue[];
// extern ??? ProcScr_MergeBoxDialogue
// extern ??? ProcScr_BoxDialogueDrawTextExt
// extern ??? gHelpbox_3
// extern ??? ProcScr_TalkBoxIdle
extern u16 CONST_DATA Pal_FaceDisplayPortrait[]; // some face-related palette (if portrait)
extern u16 CONST_DATA Pal_FaceDisplayGenericCard[]; // some face-related palette (if card)
extern u8  CONST_DATA gUnkData_32[]; // img?
extern u8  CONST_DATA Img_StatscreenEquipmentText[]; // img?
extern u16 CONST_DATA Pal_StatscreenEquipmentText[]; // pal
extern u8  CONST_DATA Tsa_StatscreenEquipmentBG[]; // tsa
extern u8  CONST_DATA Tsa_StatscreenEquipedWeaponHighlight[]; // tsa
extern u8  CONST_DATA Img_StatscreenObjs[]; // img objects
extern u16 CONST_DATA gPal_StatscreenPageNameAnim[][0x10]; // color animation for each page
extern u8 gGfx_HelpTextBox[];
extern u8 gGfx_HelpTextBox2[];
extern u8 gGfx_HelpTextBox3[];
extern u8 gGfx_HelpTextBox4[];
extern u8 gGfx_HelpTextBox5[];
extern u8 gGfx_YellowTextBox[];
extern u8 gGfx_YellowTextBox2[];
extern u8 gGfx_YellowTextBox3[];
extern u8 gGfx_YellowTextBox4[];
extern u8 gGfx_YellowTextBox5[];
extern u8 CONST_DATA Img_LimitViewSquares[]; // 6 uniform 4-tile move-limit-view frames
// extern ??? Pal_LimitViewBlue
// extern ??? Pal_LimitViewRed
// extern ??? Pal_LimitViewGreen
extern u8 CONST_DATA gImg_PathArrow[];
extern u8 CONST_DATA gPal_PathArrow[];
// extern ??? Img_StatusHealEffectBg
// extern ??? Pal_StatusHealEffectBg
// extern ??? Tsa_StatusHealEffectBg
extern u8  CONST_DATA Img_StatscreenBG[]; // stat screen background img
extern u8  CONST_DATA Tsa_StatscreenBG[]; // stat screen background tsa
extern u16 CONST_DATA Pal_StatscreenBG[]; // stat screen background pal
extern u8  CONST_DATA Img_StatscreenHalo[]; // halo img
extern u8  CONST_DATA Tsa_StatscreenHalo[]; // halo tsa
extern u16 CONST_DATA Pal_StatscreenHalo[]; // halo pal
extern u8 Img_ConfigUiSprites[]; // gfx
extern u8 Img_ConfigUiIcons[]; // gfx
extern u8 Tsa_ConfigUiFrame[]; // tsa
extern u16 Pal_ConfigUiSprites[]; // pal
extern u16 Pal_ChapterTitleAlt[]; // pal
// extern ??? gPal_SaveSlotHardSelectedBlendA
// extern ??? gPal_SaveSlotHardUnselectedBlendA
// extern ??? gPal_SaveSlotHardSelectedBlendB
// extern ??? gPal_SaveSlotHardUnselectedBlendB
extern u16 Pal_ChapterTitleMain[]; // pal
extern u16 CONST_DATA Img_ChapterIntroFog[];
extern u16 Pal_PlayerRankFog[]; // pal
extern u8 Img_ChapterTitleBg[]; // gfx
// extern ??? Img_ChapterTitleBgAlt
extern u8 Tsa_ChapterTitleBg[]; // tsa
extern u16 CONST_DATA Img_GameOverText[];
extern u16 CONST_DATA Pal_GameOverText2[];
extern u16 CONST_DATA Pal_GameOverText1[];
extern u16 CONST_DATA Tsa_GameOverFx[];
extern u8 gGfx_PlayerInterfaceFontTiles[];
extern u8 gGfx_PlayerInterfaceNumbers[];
extern u8 gGfx_StatusText[];
extern u16 gPal_PlayerInterface_Blue[];
extern u16 gPal_PlayerInterface_Red[];
extern u16 gPal_PlayerInterface_Green[];
extern u16 gTSA_UnitInfoWindow[];
extern u16 gTSA_TerrainBox[];
extern u16 gTSA_MinimugBox[];
extern u16 gTsa_UnitBurstMapUiTopFlat[];
extern u16 gTsa_UnitBurstMapUiTopLeftTail[];
extern u16 gTsa_UnitBurstMapUiTopCenterTail[];
extern u16 gTsa_UnitBurstMapUiTopRightTail[];
extern u16 gTsa_UnitBurstMapUiMiddle[];
extern u16 gTsa_UnitBurstMapUiBottomLeftTail[];
extern u16 gTsa_UnitBurstMapUiBottomCenterTail[];
extern u16 gTsa_UnitBurstMapUiBottomRightTail[];
extern u16 gTsa_UnitBurstMapUiBottomFlat[];
extern u16 Tsa_TerrainMapUi_Labels[];
extern u16 gTSA_TerrainBox_Ballistae[];
extern u16 Tsa_TerrainMapUi_ObstacleLabels[];
extern u16 Tsa_TerrainMapUi_ObstacleFullHp[];
extern u16 gTSA_GoalBox_TwoLines[];
extern u16 gTSA_GoalBox_OneLine[];

extern u8 CONST_DATA gUnitlistscreen_10[];
extern u8 CONST_DATA gUnitlistscreen_11[];
extern u16 CONST_DATA Sprite_Unitlistscreen_0[];
extern u16 CONST_DATA Sprite_Unitlistscreen_1[];
extern u16 CONST_DATA Sprite_Unitlistscreen_2[];
extern u16 * CONST_DATA gSpriteArray_Unitlistscreen_0[];
extern u8 gUnitlistscreen_11[];
extern u16 * gSpriteArray_Unitlistscreen_0[];
extern u16 Sprite_Unitlistscreen_3[];
extern u16 Sprite_Unitlistscreen_4[];
extern u16 * gSpriteArray_Unitlistscreen_1[];
// extern ??? gUnitListScreenFields

// extern ??? gSram
// extern ??? sSupportUnkLut
// extern ??? sArenaCpTeamNameLut
// extern ??? gpSramExtraData

struct DifficultyMenuCursorPosition
{
    s8 a;
    s8 b;
};

extern struct DifficultyMenuCursorPosition gDifficultymenu_0[];
extern u16 CONST_DATA gTextIds_DifficultyDescription[];
extern struct ProcCmd CONST_DATA ProcScr_NewGameDifficultySelect[];
extern u16 CONST_DATA gSprite_Difficultymenu_0[];
extern u16 CONST_DATA gSprite_DifficultyMenuSelectModeText[];
extern u16 CONST_DATA gSprite_Difficultymenu_1[];
extern u16 CONST_DATA gSprite_Difficultymenu_2[];
extern u16 CONST_DATA gSprite_Difficultymenu_3[];
extern u16 CONST_DATA gSprite_Difficultymenu_4[];
extern u16 * CONST_DATA gSpriteArray_Difficultymenu_0[];
extern u8 CONST_DATA gDifficultymenu_1[];
extern struct ProcCmd CONST_DATA gProcScr_DrawDifficultyMenuSprites[];
// extern ??? gSprite_UiCursorHand_0
// extern ??? gSprite_UiCursorHand_1
// extern ??? gProcScr_UiCursorHand
// extern ??? gSprite_UiSpinningArrows_Horizontal
// extern ??? gSprite_UiSpinningArrows_Vertical
// extern ??? gProcScr_UiSpinningArrows

// extern ??? ProcScr_MixPalette
// extern ??? gProcScr_BonusClaimHelpBox
// extern ??? gSoundRoomTable
// extern ??? gSoundroom_0
// extern ??? gSoundroom_1
// extern ??? gSoundroom_2
// extern ??? gSoundRoomShuffleBuffer
// extern ??? gProcScr_SoundRoomSongChange
// extern ??? gpSoundInfo
// extern ??? gProcScr_VolumeGraphBuffer
// extern ??? gProcScr_SoundRoomUi
// extern ??? gSprite_SoundRoom_AButtonPlay
// extern ??? gSprite_SoundRoom_StartButtonStop
// extern ??? gSprite_SoundRoom_SelectButtonRandom
// extern ??? gSprite_RandomModeBanner
// extern ??? gSprite_MusicPlayer_SeekBar
// extern ??? gSprite_MusicPlayer_SeekBarIndicator
// extern ??? gSprite_MusicPlayer_Time
// extern ??? gSprite_MusicPlayer_Colon
// extern ??? gSpriteArray_MusicPlayer_TimeNumbers
// extern ??? gProcScr_SoundRoom_DrawSprites
// extern ??? gExtramenuUnk_0
// extern ??? gExtramenuUnk_1
extern u8 Img_SaveMenuBG[]; // gfx, "records" background
extern u16 Pal_SaveMenuBG[]; // pal, "records" background
extern u8 Tsa_SaveMenuBG[]; // tsa, "records" background
extern u8 Img_MainMenuBgFog[]; // gfx, fog overlay
extern u16 Pal_MainMenuBgFog[]; // pal, fog overlay
extern u8 Tsa_MainMenuBgFog[]; // tsa, fog overlay
extern u8 Img_SaveScreenSprits[]; // gfx
extern u16 Pal_SaveScreenSprits[]; // pal
extern u16 Pal_MenuSaveMainBg_0[];
extern u16 gSaveScreen_0[]; // ap
extern u8 Img_GameMainMenuObjs[];
// extern ??? Img_DifficultyMenuObjs
// extern ??? Pal_DifficultyMenuObjs
// extern ??? gUnknown_08A2949A
// extern ??? gUnknown_08A294BA
extern u8 Tsa_DifficultyMenuObjs[]; // difficulty-select screen BG tilemap
extern u16 Pal_MenuMainObjs_0[]; // pal
extern u8 Tsa_CommGameBgScreenInShop[]; // tsa
// extern ??? gMenuMainObjs_2
// extern ??? gMenuMainObjs_3
// extern ??? gMenuMainObjs_4
extern u16 gMenuMainObjs_5[];
// extern ??? gMenuSoundroom_0
// extern ??? gMenuSoundroom_1
// extern ??? gMenuSoundroom_2
extern u8 Img_SoundRoomVolumeGraph[];
extern u16 Pal_SoundRoomVolumeGraph[];
// extern ??? gMenuSoundroom_3
// extern ??? gMenuSoundroom_4
// extern ??? Img_SoundRoomUiElements
// extern ??? Pal_SoundRoomUiElements
extern u8 Img_PlayStatusSprites[]; // Gfx
extern u16 Pal_PlayStatusSprites[]; // Pal
extern u8 Img_ChapterStatusSelectorSprite[]; // Gfx
extern u8 Img_StatusScreenLabelSprites[]; // Gfx
extern u16 Pal_StatusScreenLabelSprites[]; // Pal
extern u8 Tsa_ChapterStatusUi[]; // TSA
extern u8 Img_MenuStatus_0[]; // Gfx
extern u16 Pal_MenuStatus_0[]; // Pal
extern u8 Img_SysBlackBox[]; // Gfx

extern u8 gImg_ClassIntroNameSprites[]; // gfx?
extern u16 gPal_ClassIntroNameSprites[]; // pal
extern u8 Img_ClassChangeSelectUi[]; // gfx
extern u16 Tsa_ClassChangeSelectUi[]; // tsa
extern u8 gImg_ClassReelInfoBg[]; // gfx
extern u8 gTsa_ClassReelInfoBg[]; // tsa
extern u16 gPal_ClassReelInfoBg[]; // pal
extern u8 gImg_ClassIntroBg1[]; // gfx?
extern u8 gTsa_ClassIntroBg1[]; // tsa?
extern u16 gPal_ClassIntroBg1[]; // pal
extern u8 gImg_ClassIntroBg0[]; // gfx?
extern u8 gTsa_ClassIntroBg0[]; // tsa?
extern u8 Img_ClassReelFont[]; // gfx
extern u8 Pal_ClassReelFont[]; // pal
extern u16 gPal_ClassIntroLetterFont[]; // pal
// class-reel glyph font (was hidden after gPal_ClassIntroLetterFont's palette), one symbol per glyph
extern u8 gOpinfoLetter_00[];
extern u8 gOpinfoLetter_01[];
extern u8 gOpinfoLetter_02[];
extern u8 gOpinfoLetter_03[];
extern u8 gOpinfoLetter_04[];
extern u8 gOpinfoLetter_05[];
extern u8 gOpinfoLetter_06[];
extern u8 gOpinfoLetter_07[];
extern u8 gOpinfoLetter_08[];
extern u8 gOpinfoLetter_09[];
extern u8 gOpinfoLetter_10[];
extern u8 gOpinfoLetter_11[];
extern u8 gOpinfoLetter_12[];
extern u8 gOpinfoLetter_13[];
extern u8 gOpinfoLetter_14[];
extern u8 gOpinfoLetter_15[];
extern u8 gOpinfoLetter_16[];
extern u8 gOpinfoLetter_17[];
extern u8 gOpinfoLetter_18[];
extern u8 gOpinfoLetter_19[];
extern u8 gOpinfoLetter_20[];
extern u8 gOpinfoLetter_21[];
extern u8 gOpinfoLetter_22[];
extern u8 gOpinfoLetter_23[];
extern u8 gOpinfoLetter_24[];
extern u8 gOpinfoLetter_25[];
extern u8 gOpinfoLetter_26[];
extern u8 gOpinfoLetter_27[];
extern u8 gOpinfoLetter_28[];
extern u8 gOpinfoLetter_29[];
extern u8 gOpinfoLetter_30[];
extern u8 gOpinfoLetter_31[];
extern u8 gOpinfoLetter_32[];
extern u8 gOpinfoLetter_33[];
extern u8 gOpinfoLetter_34[];
extern u8 gOpinfoLetter_35[];
extern u8 gOpinfoLetter_36[];
extern u8 gOpinfoLetter_37[];
extern u8 gOpinfoLetter_38[];
extern u8 gOpinfoLetter_39[];
extern u8 gOpinfoLetter_40[];
extern u8 gOpinfoLetter_41[];
extern u8 gOpinfoLetter_42[];
extern u8 gOpinfoLetter_43[];
extern u8 gOpinfoLetter_44[];
extern u8 gOpinfoLetter_45[];
extern u8 gOpinfoLetter_46[];
extern u8 gOpinfoLetter_47[];
extern u8 gOpinfoLetter_48[];
extern u8 gOpinfoLetter_49[];
extern u8 gOpinfoLetter_50[];
extern u8 gOpinfoLetter_51[];
extern u8 gOpinfoLetter_52[];
extern u8 gOpinfoLetter_53[];
extern u8 gOpinfoLetter_54[];
extern u8 gOpinfoLetter_55[];
extern u8 gOpinfoLetter_56[];
extern u8 gOpinfoLetter_57[];
extern u8 gOpinfoLetter_58[];
extern u8 gOpinfoLetter_59[];
extern u8 gOpinfoLetter_60[];
extern u8 gOpinfoLetter_61[];
extern u8 gOpinfoLetter_62[];
extern u8 gOpinfoLetter_63[];
// extern ??? gOverallRankWeightLookup
// extern ??? gOverallRankLookup
// extern ??? gGamerankings_0
// extern ??? gGamerankings_1
// extern ??? gGamerankings_2
// extern ??? gGamerankings_3
// extern ??? gCGDataTable

extern u16 Pal_CharacterEndingMenu[];
extern u8 Img_CharacterEndingMenu[];
extern u8 Tsa_CharacterEnding_TopBorder[]; // tsa
extern u8 Tsa_CharacterEnding_BottomBorder[]; // tsa
extern u8 gTsa_SoloEndingNameplate[];
extern u8 gTsa_SoloEndingWindow[];
extern u8 gTsa_PairedEndingNameplates[];
extern u8 gTsa_PairedEndingWindow[];
extern u16 Pal_FinScreen[];
extern u8 Img_FinScreen[];
extern u8 Tsa_FinScreen[];
extern u16 Pal_FinScreen_1[]; // pal
extern u8 Tsa_EndingFin[]; // tsa
extern u16 Pal_StaffReelEnt_EndingFin[];
extern u8 Img_StaffReelEnt_0[];
extern u8 Img_StaffReelEnt_1[];
extern u8 Img_StaffReelEnt_2[];
extern u8 Img_StaffReelEnt_3[];
extern u8 Img_StaffReelEnt_4[];
extern u8 Img_StaffReelEnt_5[];
extern u8 Img_StaffReelEnt_6[];
extern u8 Img_StaffReelEnt_7[];
extern u8 Img_StaffReelEnt_8[];
extern u8 Img_StaffReelEnt_9[];
extern u8 Img_StaffReelEnt_10[];
extern u8 Img_StaffReelEnt_11[];
extern u8 Img_StaffReelEnt_12[];
extern u8 Tsa_StaffReelEnt_0[];
extern u8 Tsa_StaffReelEnt_1[];
extern u8 Tsa_StaffReelEnt_2[];
extern u8 Tsa_StaffReelEnt_3[];
extern u8 Tsa_StaffReelEnt_4[];
extern u8 Tsa_StaffReelEnt_5[];
extern u8 Tsa_StaffReelEnt_6[];
extern u8 Tsa_StaffReelEnt_7[];
extern u8 Tsa_StaffReelEnt_8[];
extern u8 Tsa_StaffReelEnt_9[];
extern u8 Tsa_StaffReelEnt_10[];
extern u8 Tsa_StaffReelEnt_11[];
extern u8 Tsa_StaffReelEnt_12[];
extern u8 gGfx_BrownTextBox[];
extern u16 gPal_BrownTextBox[];
// extern ??? gWorldmapGmap_0
// extern ??? gWorldmapGmap_1
// extern ??? gWorldmapGmap_2
// extern ??? gWorldmapGmap_3
extern u8 Img_GmapNodes[]; // gfx -> world map tiles
extern u8 Img_GmapCastleNodes[]; // tsa
extern u16 gWorldmapGmap_4[]; // pal
extern u16 gPal_GMapPI_ShopIcons[];
extern u8 gGfx_GMapPI_ShopIcons[];
extern u16 gPal_WorldmapGmap_0[];
extern u16 Sprite_0[]; // ap
extern u8 gImg_WorldmapNodeRevealEffect[];
extern u16 gPal_WorldmapNodeRevealEffect[];
extern u16 gWorldmapSprite_0[]; // pal
extern u8 Img_GmapPath[]; // gfx
extern u16 gWorldmapSprite_1[]; // pal
extern u8 gWorldmapMinimap_0[]; // tsa
extern u8 gWorldmapMinimap_1[]; // gfx
extern u8 gWorldmapMinimap_2[]; // tsa
extern u8 gWorldmapMinimap_3[]; // tsa
extern u8 gWorldmapMinimap_4[]; // tsa
extern u8 gWorldmapMinimap_5[]; // tsa
extern u8 gWorldmapMinimap_6[]; // tsa
extern u16 gWorldmapMinimap_7[]; // pal
// extern ??? gWorldmapMinimap_8
// extern ??? gWorldmapMinimap_9
// extern ??? gWorldmapMinimap_10
// extern ??? gWorldmapMinimap_11
extern u8 gWorldmapMinimap_12[]; // tsa
extern u8 gWorldmapMinimap_13[]; // tsa
extern u8 gGfx_GMapPI_LevelNums[];
extern u16 gPal_GMapPI_LevelNums[];
extern u8 Img_EventGmap[];
extern u8 Tsa_EventGmap[];
extern u16 Pal_EventGmap[];
extern u8 gGfx_GMapPI_LevelNums[];
extern u8 gImg_WorldmapMinimap_0[];
extern u16 gPal_WorldmapMinimap_0[];
extern u8 gTsa_WorldmapMinimap_0[];
extern u16 Pal_WmHighLightNationMap[];
extern u16 Img_WmHightLightMapFrecia[];
extern u16 Ap_WmHightLightMapFrecia[];
extern u16 Img_WmHightLightMap2[];
extern u16 Ap_WmHightLightMap2[];
extern u16 Img_WmHightLightMap3[];
extern u16 Ap_WmHightLightMap3[];
extern u16 Img_WmHightLightMap4[];
extern u16 Ap_WmHightLightMap4[];
extern u16 Img_WmHightLightMap5[];
extern u16 Ap_WmHightLightMap5[];
extern u16 Img_WmHightLightMap6[];
extern u16 Ap_WmHightLightMap6[];
extern u16 Img_WmHightLightMap7[];
extern u16 Ap_WmHightLightMap7[];
extern u16 Img_WmHightLightMap8[];
extern u16 Ap_WmHightLightMap8[];
extern u8 Img_WorldMapPlaceDot[];
extern u16 Pal_WmPlaceDot_Highlight[];
extern u16 Pal_WmPlaceDot_Standard[];
extern u8 gWorldmapSkirmish_0[]; // tsa?
extern u8 Img_WorldmapMinimap[];
extern u16 Pal_WorldmapMinimap[];
extern u8 gWorldmapSkirmish_1[];
// extern ??? gWorldmapSkirmish_2
// extern ??? gWorldmapSkirmish_3
extern u8 gImg_WorldmapSkirmish[]; // gfx
extern u8 SpriteAnim_WorldmapSkirmish[]; // ap proc data
// extern ??? ProcScr_EndingCredits_BlendCGMaybe
// extern ??? ProcScr_EndingCredits
// extern ??? gBgConfig_OpSubtitle
// extern ??? gOpsubtitle_0
// extern ??? gProcScr_OpSubtitle
extern u16 CONST_DATA gPal_OpSubtitle[]; // pal
extern u8 CONST_DATA gGfx_OpSubtitle_00[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_01[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_02[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_03[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_04[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_05[]; // gfx
extern u8 CONST_DATA gGfx_OpSubtitle_06[]; // gfx
extern u8 CONST_DATA gTsa_OpSubtitle_00[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_01[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_02[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_03[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_04[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_05[]; // tsa
extern u8 CONST_DATA gTsa_OpSubtitle_06[]; // tsa

extern u8 gGfx_TitleMainBackground_1[];
extern u8 gGfx_TitleMainBackground_2[];
extern u8 gTsa_TitleMainBackground[];
extern u16 gPal_TitleMainBackground[];
extern u8 gGfx_TitleDragonForeground[];
extern u8 gTsa_TitleDragonForeground[];
extern u16 gPal_TitleDragonForeground[];
extern u8 gGfx_FireEmblemLogo[];
extern u8 gGfx_SubtitlePressStart[];
extern u16 gPal_PressStart[];
extern u16 gPal_Titlescreen_0[];
extern u8 gGfx_Titlescreen_0[];
extern u8 gTsa_Titlescreen_0[];
extern u16 gPal_Titlescreen_1[];
extern u8 gGfx_Titlescreen_1[];
extern u8 gTsa_Titlescreen_1[];
extern u16 gPal_Titlescreen_2[];
extern u8 gGfx_Titlescreen_2[];
extern u8 gTsa_Titlescreen_2[];
extern u16 gPal_Titlescreen_3[];
extern u8 gGfx_Titlescreen_3[];
extern u8 gTsa_Titlescreen_3[];
extern u16 gPal_Titlescreen_4[];
extern u8 gGfx_TitleDemonKing[];
extern u8 gTsa_TitleDemonKing[];
extern u16 gPal_TitleDemonKing[];
extern u8 gGfx_TitleLargeGlowingOrb[];
extern u16 gPal_TitleLargeGlowingOrb[];
extern u8 gGfx_TitleSmallLightBubbles[];
extern u16 gPal_TitleSmallLightBubbles[];
extern u8 Img_OpAnimWorldMap[];
extern u8 Tsa_OpAnimWorldMap[];
extern u16 Pal_OpAnimWorldMap[];
extern u8 Img_OpAnimWorldMapFog[];
extern u8 Tsa_OpAnimWorldMapFog[];
extern u16 Pal_OpAnimWorldMapFog[];
extern u8 Img_OpAnimCharacterBG[];
extern u8 Tsa_OpAnimCharacterBG[];
extern u16 Pal_OpAnimCharacterBG[];
// extern ??? Img_OpAnimGenericCharacterBG
// extern ??? Tsa_OpAnimGenericCharacterBG
extern u8 Img_OpAnimEphraim[];
extern u8 Tsa_OpAnimEphraim[];
extern u8 Img_OpAnimEphraimBlur1[];
extern u8 Tsa_OpAnimEphraimBlur1[];
extern u8 Img_OpAnimEphraimBlur2[];
extern u8 Tsa_OpAnimEphraimBlur2[];
extern u8 Img_OpAnimEphraimBlur3[];
extern u8 Tsa_OpAnimEphraimBlur3[];
extern u8 Img_OpAnimEphraimClose1[];
extern u8 Img_OpAnimEphraimClose2[];
extern u8 Tsa_OpAnimEphraimClose1[];
extern u8 Tsa_OpAnimEphraimClose2[];
extern u16 Pal_OpAnimEphraimBlur[];
extern u8 Img_OpAnimEirika[];
extern u8 Tsa_OpAnimEirika[];
extern u8 Img_OpAnimEirikaBlur1[];
extern u8 Tsa_OpAnimEirikaBlur1[];
extern u8 Img_OpAnimEirikaBlur2[];
extern u8 Tsa_OpAnimEirikaBlur2[];
extern u8 Img_OpAnimEirikaBlur3[];
extern u8 Tsa_OpAnimEirikaBlur3[];
extern u8 Img_OpAnimEirikaClose1[];
extern u8 Img_OpAnimEirikaClose2[];
extern u8 Tsa_OpAnimEirikaClose1[];
extern u8 Tsa_OpAnimEirikaClose2[];
extern u16 Pal_OpAnimEirikaBlur[];
extern u8 Img_OpAnimJoshua[];
extern u8 Img_OpAnimJoshua2[];
extern u8 Tsa_OpAnimJoshua[];
// extern ??? Tsa_OpAnimJoshua2
extern u16 Pal_OpAnimJoshua[];
extern u8 Img_OpAnimLArachel[];
extern u8 Img_OpAnimLArachel2[];
extern u8 Tsa_OpAnimLArachel[];
extern u8 Tsa_OpAnimLArachel2[];
extern u16 Pal_OpAnimLArachel[];
extern u8 Img_OpAnimSeth[];
extern u8 Img_OpAnimSeth2[];
extern u8 Tsa_OpAnimSeth[];
extern u8 Tsa_OpAnimSeth2[];
extern u16 Pal_OpAnimSeth[];
extern u8 Img_OpAnimMyrrh[];
extern u8 Img_OpAnimMyrrh2[];
extern u8 Tsa_OpAnimMyrrh[];
extern u8 Tsa_OpAnimMyrrh2[];
extern u16 Pal_OpAnimMyrrh[];
extern u8 Img_OpAnimSaleh[];
extern u8 Img_OpAnimSaleh2[];
extern u8 Tsa_OpAnimSaleh[];
extern u8 Tsa_OpAnimSaleh2[];
extern u16 Pal_OpAnimSaleh[];
// extern ??? Img_OpAnimTethys
// extern ??? Img_OpAnimTethys2
// extern ??? Tsa_OpAnimTethys
// extern ??? Tsa_OpAnimTethys2
// extern ??? Pal_OpAnimTethys
// extern ??? Pal_OpanimGfx_0
// extern ??? Img_OpAnimFaceRennac
// extern ??? Img_OpAnimFaceRennacShadow
// extern ??? Pal_OpAnimFaceRennac
// extern ??? Img_OpAnimFaceLArachel
// extern ??? Img_OpAnimFaceLArachelShadow
// extern ??? Pal_OpAnimFaceLArachel
// extern ??? Img_OpAnimFaceDozla
// extern ??? Img_OpAnimFaceDozlaShadow
// extern ??? Pal_OpAnimFaceDozla
// extern ??? Img_OpAnimFaceEwan
// extern ??? Img_OpAnimFaceEwanShadow
// extern ??? Pal_OpAnimFaceEwan
// extern ??? Img_OpAnimFaceGerik
// extern ??? Img_OpAnimFaceGerikShadow
// extern ??? Pal_OpAnimFaceGerik
// extern ??? Img_OpAnimFaceTethys
// extern ??? Img_OpAnimFaceTethysShadow
// extern ??? Pal_OpAnimFaceTethys
// extern ??? Img_OpAnimFaceMarisa
// extern ??? Img_OpAnimFaceMarisaShadow
// extern ??? Pal_OpAnimFaceMarisa
// extern ??? Img_OpAnimFaceGarcia
// extern ??? Img_OpAnimFaceGarciaShadow
// extern ??? Pal_OpAnimFaceGarcia
// extern ??? Img_OpAnimFaceRoss
// extern ??? Img_OpAnimFaceRossShadow
// extern ??? Pal_OpAnimFaceRoss
// extern ??? Img_OpAnimFaceVanessa
// extern ??? Img_OpAnimFaceVanessaShadow
// extern ??? Pal_OpAnimFaceVanessa
// extern ??? Img_OpAnimFaceTana
// extern ??? Img_OpAnimFaceTanaShadow
// extern ??? Pal_OpAnimFaceTana
// extern ??? Img_OpAnimFaceSyrene
// extern ??? Img_OpAnimFaceSyreneShadow
// extern ??? Pal_OpAnimFaceSyrene
// extern ??? Img_OpAnimFaceGilliam
// extern ??? Img_OpAnimFaceGilliamShadow
// extern ??? Pal_OpAnimFaceGilliam
// extern ??? Img_OpAnimFaceInnes
// extern ??? Img_OpAnimFaceInnesShadow
// extern ??? Pal_OpAnimFaceInnes
// extern ??? Img_OpAnimFaceMoulder
// extern ??? Img_OpAnimFaceMoulderShadow
// extern ??? Pal_OpAnimFaceMoulder
// extern ??? Img_OpAnimFaceColm
// extern ??? Img_OpAnimFaceColmShadow
// extern ??? Pal_OpAnimFaceColm
// extern ??? Img_OpAnimFaceNeimi
// extern ??? Img_OpAnimFaceNeimiShadow
// extern ??? Pal_OpAnimFaceNeimi
// extern ??? Img_OpAnimFaceKnoll
// extern ??? Img_OpAnimFaceKnollShadow
// extern ??? Pal_OpAnimFaceKnoll
// extern ??? Img_OpAnimFaceCormag
// extern ??? Img_OpAnimFaceCormagShadow
// extern ??? Pal_OpAnimFaceCormag
// extern ??? Img_OpAnimFaceAmelia
// extern ??? Img_OpAnimFaceAmeliaShadow
// extern ??? Pal_OpAnimFaceAmelia
// extern ??? Img_OpAnimFaceNatasha
// extern ??? Img_OpAnimFaceNatashaShadow
// extern ??? Pal_OpAnimFaceNatasha
// extern ??? Img_OpAnimFaceLute
// extern ??? Img_OpAnimFaceLuteShadow
// extern ??? Pal_OpAnimFaceLute
// extern ??? Img_OpAnimFaceArtur
// extern ??? Img_OpAnimFaceArturShadow
// extern ??? Pal_OpAnimFaceArtur
// extern ??? Img_OpAnimFaceKyle
// extern ??? Img_OpAnimFaceKyleShadow
// extern ??? Pal_OpAnimFaceKyle
// extern ??? Img_OpAnimFaceFranz
// extern ??? Img_OpAnimFaceFranzShadow
// extern ??? Pal_OpAnimFaceFranz
// extern ??? Img_OpAnimFaceForde
// extern ??? Img_OpAnimFaceFordeShadow
// extern ??? Pal_OpAnimFaceForde
// extern ??? Img_OpAnimFaceSeth
// extern ??? Img_OpAnimFaceSethShadow
// extern ??? Pal_OpAnimFaceSeth
// extern ??? Img_OpAnimFaceDuessel
// extern ??? Img_OpAnimFaceDuesselShadow
// extern ??? Pal_OpAnimFaceDuessel
// extern ??? Img_OpAnimFaceSelena
// extern ??? Img_OpAnimFaceSelenaShadow
// extern ??? Pal_OpAnimFaceSelena
// extern ??? Img_OpAnimFaceGlen
// extern ??? Img_OpAnimFaceGlenShadow
// extern ??? Pal_OpAnimFaceGlen
// extern ??? Img_OpAnimFaceValter
// extern ??? Img_OpAnimFaceValterShadow
// extern ??? Pal_OpAnimFaceValter
// extern ??? Img_OpAnimFaceRiev
// extern ??? Img_OpAnimFaceRievShadow
// extern ??? Pal_OpAnimFaceRiev
// extern ??? Img_OpAnimFaceCaellach
// extern ??? Img_OpAnimFaceCaellachShadow
// extern ??? Pal_OpAnimFaceCaellach
// extern ??? Img_OpAnimFaceLyon
// extern ??? Img_OpAnimFaceLyonShadow
// extern ??? Pal_OpAnimFaceLyon
// extern ??? Img_OpAnimFaceVigarde
// extern ??? Img_OpAnimFaceVigardeShadow
// extern ??? Pal_OpAnimFaceVigarde
extern u8 Img_OpAnimSplitLine[];
extern u16 Pal_OpAnimSplitLine[];
extern u8 Img_opanim_unk1[];
extern u16 Pal_opanim_unk1[];
extern u8 Img_OpAnimEphEirikaName[];
extern u16 Pal_OpAnimEphEirikaName[];
extern u8 Img_OpAnimDivlEye[];
extern u16 Pal_OpAnimDivlEye[];
// extern ??? Img_OpAnimShiningRing
// extern ??? Tsa_OpAnimShiningRing
// extern ??? Tsa_OpAnimShiningRingBlinking

extern u8 Tsa_GameIntroNintendo[];
extern u8 Img_GameIntroNintendo[];
extern u16 Pal_GameIntroNintendo[];
extern u8 Tsa_IntelligentSystems[];
extern u8 Img_IntelligentSystems[];
extern u16 Pal_IntelligentSystems[];
extern u8 Tsa_OpAnimHealthSafetyScreenBG1[];
extern u8 Tsa_OpAnimHealthSafetyScreenBG0[];
extern u8 Img_OpAnimHealthSafetyScreen[];
extern u16 Pal_OpAnimHealthSafetyScreen[];
/* #include classchg.h */
// extern ??? gGuideSt
// extern ??? gSprite_GuideBannerText
// extern ??? gSprite_SelectButtonSort
// extern ??? gSprite_BButtonBack
// extern ??? gTextIds_GuideCategoriesChapter
// extern ??? gTextIds_GuideCategoriesTopic
// extern ??? gProcScr_Guide_DrawSprites
// extern ??? gProcScr_GuideCategoryRedraw
// extern ??? gProcScr_GuideEntryListRedraw_Initial
// extern ??? gProcScr_GuideEntryListRedraw_Up
// extern ??? gProcScr_GuideEntryListRedraw_Down
// extern ??? gProcScr_GuideDetailsRedraw
extern struct ProcCmd CONST_DATA ProcScr_E_Guide1[];
extern struct ProcCmd CONST_DATA ProcScr_E_Guide2[];
extern u8 Img_CommGameBgScreen[];  // gfx
extern u16 Pal_CommGameBgScreenInShop[]; // pal
extern u16 Pal_OpSubtitleScrollText[]; // pal, used in opsubtitle
// extern ??? Tsa_GuideScreenBg
// extern ??? Img_GuideScreenPanels
// extern ??? Img_GuideScreenBg
// extern ??? Pal_GuideScreenBg
extern u8 Img_ChapterIntro_LensFlare[]; // gfx?
extern u8 Tsa_ChapterIntroLensFlare[];
extern u16 Pal_ChapterIntro_LensFlare[]; // pal
// extern ??? Img_ChapterIntro_Fog
// extern ??? Tsa_ChapterIntro_Fog
// extern ??? Pal_ChapterIntro_Fog
// extern ??? Img_ChapterIntro_Sprites
// extern ??? Pal_ChapterIntro_Sprites
// extern ??? gGuideTable
// extern ??? _impure_ptr
// extern ??? gUnknown_08B1FA24
// extern ??? gUnknown_08B1FA38
// extern ??? gUnknown_08B1FA40
// extern ??? gUnknown_08B1FE40
// extern ??? gUnknown_08B1FE44
// extern ??? gUnknown_08B1FE48
// extern ??? gUnknown_08B1FE4C
// extern ??? gUnknown_08B1FE50
// extern ??? gUnknown_08B1FE54
// extern ??? gUnknown_08C00008
// extern ??? gUnknown_08EE0008
// extern ??? gUnknown_08EF8008

#endif  // GUARD_VARIABLES_H