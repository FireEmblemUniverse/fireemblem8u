#ifndef GUARD_VARIABLES_H
#define GUARD_VARIABLES_H

#include "gba/types.h"
#include "types.h"
#include "global.h"
#include "proc.h"

extern u8 __ewram_start[];
extern u8 gUnk_02000000[];
// extern ??? gAnims
// extern ??? gMinimapWinBuf
// extern ??? gMinimapFrontWinBuf
// extern ??? gMinimapBackWinBuf
// extern ??? gMinimapDisplayedWinBuf
extern u16 *gMinimapObjectFlashPal;
// extern ??? gUnknown_020007A0
// extern ??? gUnknown_020007E0
// extern ??? gUnknown_02000920
// extern ??? gUnknown_02000938
extern u8 gUnknown_02000940[];
extern u8 gUnknown_02000944[];
extern struct PlaySt_OptionBits gUnknown_02000948[];
// extern ??? gUnk_Sio_02000C60
// extern ??? gUnk_Sio_02000C78
// extern ??? gUnk_Sio_02000F00
// extern ??? gBmMapBuffer
extern u8 gEkrKakudaiSomeBufLeft[];
// extern ??? gUnk_Sio_02001180
// extern ??? gUnk_Sio_02001184
// extern ??? gUnk_Sio_02001188
// extern ??? gConvoyItemCount
// extern ??? gUnknown_02002038
// extern ??? gBanimRightImgSheetBuf
extern struct Font gUnknown_02002774;

extern u8 gEkrKakudaiSomeBufRight[];
// extern ??? gUnknown_0200310C
// extern ??? gUnknown_020038AC
// extern ??? gUnknown_020038C4
// extern ??? gUnknown_020038C8
// extern ??? gUnknown_02003B08
// extern ??? gUnknown_02003B48
// extern ??? gUnknown_02003B70
// extern ??? gUnknown_02003B88
// extern ??? gUnknown_02003BA8
// extern ??? gUnknown_02003BE8

extern u16 gUiTmScratchA[];
extern u16 gUiTmScratchB[];
extern u16 gUiTmScratchC[];

// extern ??? gChapterStatusText
// extern ??? gUnknown_02004BBC
// extern ??? gMUGfxBuffer
// extern ??? gUnknown_02007838
// extern ??? gUnknown_020078D8
// extern ??? gUnknown_02008000
// extern ??? gUnknown_020087A0
// extern ??? gUnknown_0200A2D8
// extern ??? gUnknown_0200A300
extern u8 gUnknown_0200AF00[];
// extern ??? gUnknown_0200C300
// extern ??? gUnknown_0200CB00
// extern ??? gSortedUnitsBuf
// extern ??? gSortedUnits
// extern ??? gUnknown_0200D7E0
// extern ??? gUnknown_0200DFE0
// extern ??? gUnknown_0200E060
// extern ??? gUnknown_0200E098
// extern ??? gUnknown_0200E0A0
// extern ??? gUnknown_0200E0A8
// extern ??? gUnknown_0200E140
// extern ??? gUnknown_0200E148
// extern ??? gUnknown_0200E150
// extern ??? gUnknown_0200E158
// extern ??? gUnknown_0200F158
// extern ??? gUnknown_0200F15C
extern u16 gUnk_OpSubtitle_0201CDD4[]; // used as a palette buffer in opsubtitle
// extern ??? gUnk_Opinfo_0201DB00
// extern ??? gUnk_OpInfo_0201DB28
extern char gStringBufferAlt[];

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

extern int gBattleScriptted;
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
// extern ??? gUnknown_03001788
// extern ??? gDungeonState
// extern ??? gUnknown_030017AC

extern u16 gUnknown_030018F0[];
// extern ??? gUnitDef1
// extern ??? gUnknown_03001C48
// extern ??? gUnitDef2
// extern ??? gUnitDefEggHatching
// extern ??? gUnknown_03001C74
extern u8 gUnknown_03001C7C;
// extern ??? gActiveEventRegistry

// extern ??? gUnknown_03001D50
// extern ??? gUnknown_03001DA8
// extern ??? gUnknown_03001DE8
// extern ??? gUnknown_03001E30
// extern ??? gUnknown_03002B88
// extern ??? gUnknown_03002B8C
// extern ??? gUnknown_03002B90
// extern ??? gUnknown_03002B94
// extern ??? gUnknown_03002B98
// extern ??? SoundMainRAM_Buffer
// extern ??? gUnknown_03002C61
extern u8 gUnknown_03003060;
extern void* gOamLoPutIt;
// extern ??? gUnknown_03003128
extern u16 gOamAffinePutId;
// extern ??? gUnknown_03003130
extern void (*sHBlankHandler1)(void);
extern u16 gOam[];
// extern ??? gUnknown_03003740
extern u32 * gOamHiPutIt;
extern void (* sHBlankHandler2)(void);
// extern ??? gUnknown_03003750
// extern ??? gUnknown_03004150
// extern ??? gUnknown_03004154
extern u16 * gOamAffinePutIt;
// extern ??? gUnknown_03004160
// extern ??? gUnknown_03004960
// extern ??? gUnknown_03004990
// extern ??? gStatGainSimUnit
extern struct Unit * gActiveUnit;
// extern ??? gUnknown_03004E70
// extern ??? gUnknown_03004E74
// extern ??? gUnknown_03004E80
// extern ??? gUnknown_03004E86
// extern ??? gUnknown_03004F08
// extern ??? gUnknown_03004F0C
// extern ??? gUnknown_03004F20
extern int gUnknown_03004FA0;
extern int gUnknown_03004FA4;
extern int gEkrXQuakeOff;
extern int gBanimDebugCurrentIndex;
extern int gEkrYQuakeOff;

extern u8 gPermanentFlagBits[];
extern u8 gChapterFlagBits[];
extern struct GMapData gGMData;
// extern ??? gUnknown_03005324
// extern ??? gUnknown_03005349
extern u16 gGmMonsterRnState[];
extern struct Font gFontClassChgMenu;
extern struct Font gFontClassChg;
extern s8 gUnknown_03005398;

// extern ??? gUnknown_030053E0
extern u16 gUnknown_03005408[];
// extern ??? gSoundInfo
extern struct MusicPlayerInfo gMPlayInfo_SE4_BMP2;
extern struct MusicPlayerInfo gMPlayInfo_SE5_BMP3;
extern struct MusicPlayerInfo gMPlayInfo_BGM1;
// extern ??? gMPlayJumpTable
// extern ??? gUnknown_03006484
// extern ??? gUnknown_03006508
// extern ??? gUnknown_0300650C
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
// extern ??? gUnknown_080D77BC
// extern ??? gUnknown_080D77DC
// extern ??? gUnknown_080D77FC
// extern ??? gUnknown_080D792C
// extern ??? gUnknown_080D793C
// extern ??? UnitMenuOverrideConf
// extern ??? ItemMenuOverrideConf
extern const char gUnknown_080D7954[];
// extern ??? gUnknown_080D7964
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
// extern ??? gUnknown_080D7C04
// extern ??? gUnknown_080D7C14
// extern ??? gUnknown_080D7C18
// extern ??? gUnknown_080D7C40
// extern ??? gUnknown_080D7C42
// extern ??? JunaItemEffLevelLut
// extern ??? gUnknown_080D7FD0

// extern ??? gMsgHuffmanTable
// extern ??? gMsgHuffmanTableRoot
extern const u8 *const gMsgStringTable[];

extern u16 gPal_StoneShatterAnim[];
extern u8 gImg_StoneShatterAnim[];
extern u8 gTsa_StoneShatter_081C1900[];
extern u8 gTsa_StoneShatter_081C194C[];
extern u8 gTsa_StoneShatter_081C1998[];
extern u8 gTsa_StoneShatter_081C19E4[];
extern u8 gTsa_StoneShatter_081C1A30[];
extern u8 gTsa_StoneShatter_081C1A7C[];
extern u8 gTsa_StoneShatter_081C1AC8[];
extern u8 gTsa_StoneShatter_081C1B14[];
extern u8 gTsa_StoneShatter_081C1B60[];
extern u8 gTsa_StoneShatter_081C1BAC[];
extern u8 gTsa_StoneShatter_081C1BF8[];
extern u8 gTsa_StoneShatter_081C1C44[];
extern u8 gTsa_StoneShatter_081C1C90[];
extern u8 gTsa_StoneShatter_081C1CDC[];

extern const u8 gUnknown_08205714[4];
// extern ??? NigtMarefxConf
extern const u8 gUnknown_08205824[];
extern const u8 gUnknown_08205833[];
extern const u8 gUnknown_08205846[];
extern const u8 gUnknown_08205855[];
extern const int gUnknown_08205884[];
extern const u8 gUnknown_0820588C[];
extern const u8 gUnknown_0820588E[];
extern unsigned const gUnknown_082058A8[];
extern u8 const gUnknown_082058B0[];
// extern ??? gUnknown_082058B4
// extern ??? gUnknown_082058D4
// extern ??? gUnknown_082058DC
// extern ??? gUnknown_082058DE
// extern ??? gUnknown_082058E2
// extern ??? gUnknown_082058E4
// extern ??? gUnknown_082058F0
// extern ??? gUnknown_082058F4
// extern ??? gUnknown_082058F8
// extern ??? gUnknown_08205918
// extern ??? gUnknown_08205938
// extern ??? gUnknown_08205B84
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
// extern ??? gUnknown_08205F28
// extern ??? gUnknown_08205F7C

// extern ??? gUnknown_08206450
// extern ??? gUnknown_08206498

// extern ??? gUnknown_08206868

// extern ??? gUnknown_08206954

// extern ??? gUnknown_08206B70
// extern ??? gUnknown_08206E24
// extern ??? gUnknown_08206FB4
// extern ??? gUnknown_08206FDC
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
extern u16 gUnknown_0858829C[];
extern u16 gUnknown_0858849C[];
extern u16 gUnknown_0858869C[];
extern u16 gUnknown_0858889C[];
extern u16 gUnknown_08588A9C[];
extern u16 gUnknown_08588C9C[];
extern u16 gUnknown_08588E9C[];
extern u16 gUnknown_0858909C[];
extern u16 gUnknown_0858929C[];
extern u16 gUnknown_0858949C[];
extern u16 gUnknown_0858969C[];
extern u16 gUnknown_0858989C[];
extern u16 gUnknown_08589A9C[];
extern struct Glyph *TextGlyphs_System[];
extern struct Glyph *TextGlyphs_Talk[];
extern struct Glyph *TextGlyphs_Special[];
extern struct ProcCmd CONST_DATA gProcScr_TalkPutSpriteText_Unused[];
extern struct ProcCmd CONST_DATA ProcScr_0859160C[];
extern struct ProcCmd CONST_DATA ProcScr_0859163C[];

extern const char *gStrPrefix[][2];
//extern struct {u32 *unk0; u32 *unk4; u32 *unk8;} gStrPrefix;
// extern ??? gUnknown_08591AB4

extern struct ProcCmd CONST_DATA ProcScr_EventFadefx[];
extern struct ProcCmd CONST_DATA ProcScr_ShinningStonefx[];
extern struct ProcCmd CONST_DATA ProcScr_BoomFogFx[];
extern struct ProcCmd CONST_DATA ProcScr_EventEarthQuake[];
extern struct ProcCmd CONST_DATA gProcScr_StoneShatterEvent[];
// extern ??? BmBgxConf_StoneShatter
// extern ??? gUnknown_085926F4
// extern ??? gUnknown_085996F4
// extern ??? gUnknown_08599FD4

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
extern u16 CONST_DATA obj_0859AEC8[];
// extern ??? gProcScr_PhaseIntroText
// extern ??? gProcScr_PhaseIntroSquares
// extern ??? gProcScr_PhaseIntroBlendBox
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
extern u16 gPal_NotMapSprite[];
extern u16 gPal_MapSpriteArena[];
extern u16 gPal_MapSpriteSepia[];
extern u8 Pal_Text[];
extern u8 gUnknown_0859EF20[];
extern u16 Pal_HelpBox[]; // pal
extern u16 gPal_HelpTextBox[];
extern u16 gPal_YellowTextBox[];
extern u16 Pal_GreenTextColors[];
extern u16 Pal_Text_Inverted[];
extern u16 Pal_TalkBubble_Inverted[];
// extern ??? Img_PhaseChangeUnk
// extern ??? Img_PhaseChangePlayer
extern CONST_DATA u16 Pal_PhaseChangePlayer[];
// extern ??? Img_PhaseChangeEnemy
// extern ??? Pal_PhaseChangeEnemy
// extern ??? Img_PhaseChangeOther
// extern ??? Pal_PhaseChangeOther
extern CONST_DATA u16 Img_PhaseChangeSquares[];
extern u8 gUnknown_085A0838[]; // tsa
extern u8 gUnknown_085A08F0[]; // tsa

// extern ??? gUnknown_085A0D4C
extern u16 CONST_DATA gUnknown_085A0EA0[]; // ap
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
extern const u8  gUnknown_085A3964[]; // sandstorm particle 4bpp image (compressed)
extern const u8  gUnknown_085A39EC[]; // snowstorm particle 4bpp image (compressed)
extern const u8  gUnknown_085A3A84[]; // flames particle 4bpp image (compressed)
extern const u16 gUnknown_085A3AC0[]; // flames particle palette
extern const u8  gUnknown_085A3B00[]; // clouds 4bpp image (compressed)
extern const u16 gUnknown_085A401C[]; // clouds palette

extern u16 CONST_DATA Img_LightRune[];
extern u16 CONST_DATA Pal_LightRune[];
extern u16 CONST_DATA Tsa_LightRune[];

extern u16 CONST_DATA Img_EventWarp[];
extern u16 CONST_DATA Pal_EventWarp[];
extern u16 CONST_DATA Tsa_EventWarp[];

extern u8 gUnknown_085A638C[];
extern u16 gUnknown_085A643C[];
extern u8 gUnknown_085A647C[]; // tsa

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
// extern ??? gUnknown_085A92DC
// extern ??? gUnknown_085A92DE
// extern ??? gUnknown_085A92E0
// extern ??? gUnknown_085A92E4
// extern ??? gUnknown_085A9304

/* sio.h */

// extern ??? gUnknown_085A96E4
// extern ??? gUnknown_085A96F4
// extern ??? gUnknown_085A9774
// extern ??? gUnknown_085A9864
// extern ??? gUnknown_085A9884
// extern ??? gUnknown_085A9D98
// extern ??? gUnknown_085A9E48
// extern ??? gUnknown_085A9E68
// extern ??? gUnknown_085A9E88
// extern ??? gUnknown_085A9F48
// extern ??? gUnknown_085A9F98
// extern ??? gUnknown_085AA06C
// extern ??? gUnknown_085AA084
// extern ??? gUnknown_085AA0A4
// extern ??? gUnknown_085AA0CA
// extern ??? gUnknown_085AA0F0
// extern ??? gUnknown_085AA130
// extern ??? gUnknown_085AA158
// extern ??? gUnknown_085AA15C
// extern ??? gUnknown_085AA1AC
// extern ??? gUnknown_085AA1FC
// extern ??? gUnknown_085AA21C
// extern ??? gUnknown_085AA22C
// extern ??? gUnknown_085AA24C
// extern ??? gUnknown_085AA2B4
// extern ??? gUnknown_085AA2D8
// extern ??? gUnknown_085AA2FC
// extern ??? gUnknown_085AA4CC
// extern ??? gUnknown_085AA5BC
// extern ??? ProcScr_SIOMAIN
// extern ??? gUnknown_085AA75C
// extern ??? gUnknown_085AA7B4
// extern ??? gUnknown_085AA7EC
// extern ??? gUnknown_085AA824
// extern ??? gUnknown_085AA83C
// extern ??? gUnknown_085AA854
// extern ??? ProcScr_SIOWARP
// extern ??? ProcScr_SIOWARPFX
// extern ??? gUnknown_085AA914
// extern ??? gUnknown_085AA954
// extern ??? gUnknown_085AA96C
// extern ??? ProcScr_085AA980
// extern ??? gUnknown_085AA9A0
// extern ??? gUnknown_085AA9B4
// extern ??? gUnknown_085AA9C0
// extern ??? gUnknown_085AA9D8
// extern ??? gUnknown_085AAA0E
// extern ??? gUnknown_085AAA48
// extern ??? gUnknown_085AAA50
// extern ??? gUnknown_085AAA5E
// extern ??? gUnknown_085AAA78
// extern ??? gUnknown_085AAA90
// extern ??? gUnknown_085AAAA8
// extern ??? gUnknown_085AAAB0
// extern ??? Proc_085AAAC4
// extern ??? gUnknown_085AAADC
// extern ??? gUnknown_085AAAE8
// extern ??? gUnknown_085AAB00
// extern ??? gUnknown_085AAB18
// extern ??? gUnknown_085AAB30
// extern ??? gUnknown_085AAB38
// extern ??? gUnknown_085AAB40
// extern ??? gUnknown_085AAB48
// extern ??? gUnknown_085AABB8
// extern ??? gUnknown_085AABC8
// extern ??? gUnknown_085AABD8
// extern ??? gUnknown_085AADA0
// extern ??? gUnknown_085AAE0C
// extern ??? gUnknown_085AB358
extern u8 Img_TacticianSelObj[];
// extern ??? gUnknown_085AC604
// extern ??? gUnknown_085AC9DC
// extern ??? gUnknown_085ACD20
// extern ??? gUnknown_085ACEFC
// extern ??? gUnknown_085AD0CC
// extern ??? gUnknown_085AD80C
// extern ??? gUnknown_085AD9CC
// extern ??? gUnknown_085ADA38
// extern ??? gUnknown_085ADBE8
extern u16 Pal_TacticianSelObj[];
// extern ??? gUnknown_085ADCC8
// extern ??? gUnknown_085ADDA8
// extern ??? gUnknown_085ADDC8
// extern ??? gUnknown_085ADDE8
// extern ??? gUnknown_085ADE08
// extern ??? gUnknown_085ADE28
// extern ??? gUnknown_085ADE48
extern u16 Pal_085ADE68[];
// extern ??? gUnknown_085ADE88
// extern ??? gUnknown_085ADF40
extern u16 Tsa_085AE190[];
// extern ??? gUnknown_085AE464
// extern ??? gUnknown_085AE778
// extern ??? gUnknown_085AE7EC
// extern ??? gUnknown_085AF170
// extern ??? gUnknown_085B081C
// extern ??? gUnknown_085B089C
// extern ??? gUnknown_085B0DE8
// extern ??? gUnknown_085B0F2C
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
extern u16 gUnknown_08803BD0[];
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
extern CONST_DATA s8 Unk_TerrainTable_0880BA51[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Normal[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Normal[];
extern CONST_DATA s8 Unk_TerrainTable_0880BB14[];
extern CONST_DATA s8 Unk_TerrainTable_0880BB55[];
extern CONST_DATA s8 TerrainTable_MovCost_FlyNormal[];
extern CONST_DATA s8 Unk_TerrainTable_0880BBD7[];
extern CONST_DATA s8 Unk_TerrainTable_0880BC18[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT2Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT1Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_ArmorRain[];
extern CONST_DATA s8 TerrainTable_MovCost_FighterRain[];
extern CONST_DATA s8 TerrainTable_MovCost_BerserkerRain[];
extern CONST_DATA s8 TerrainTable_MovCost_BrigandRain[];
extern CONST_DATA s8 TerrainTable_MovCost_PirateRain[];
extern CONST_DATA s8 TerrainTable_MovCost_ThiefRain[];
extern CONST_DATA s8 TerrainTable_MovCost_MagicRain[];
extern CONST_DATA s8 Unk_TerrainTable_0880BEA2[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Rain[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Rain[];
extern CONST_DATA s8 Unk_TerrainTable_0880BF65[];
extern CONST_DATA s8 Unk_TerrainTable_0880BFA6[];
extern CONST_DATA s8 TerrainTable_MovCost_FlyRain[];
extern CONST_DATA s8 Unk_TerrainTable_0880C028[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT2Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_CommonT1Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_ArmorSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_FighterSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_BerserkerSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_BrigandSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_PirateSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_ThiefSnow[];
extern CONST_DATA s8 TerrainTable_MovCost_MagicSnow[];
extern CONST_DATA s8 Unk_TerrainTable_0880C2B2[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT1Snow[];
extern CONST_DATA s8 TerrainTable_MovCost_HorseT2Snow[];
extern CONST_DATA s8 Unk_TerrainTable_0880C375[];
extern CONST_DATA s8 Unk_TerrainTable_0880C3B6[];
extern CONST_DATA s8 TerrainTable_MovCost_FlySnow[];
extern CONST_DATA s8 Unk_TerrainTable_0880C438[];
extern CONST_DATA s8 TerrainTable_Avo_Common[];
extern CONST_DATA s8 TerrainTable_Def_Common[];
extern CONST_DATA s8 TerrainTable_Res_Common[];
extern CONST_DATA s8 TerrainTable_Avo_Fly[];
extern CONST_DATA s8 TerrainTable_Def_Fly[];
extern CONST_DATA s8 TerrainTable_Res_Fly[];
extern CONST_DATA s8 Unk_TerrainTable_0880C5FF[];
extern CONST_DATA s8 Unk_TerrainTable_0880C640[];
extern CONST_DATA s8 Unk_TerrainTable_0880C681[];
extern CONST_DATA s8 Unk_TerrainTable_0880C6C2[];
extern CONST_DATA s8 Unk_TerrainTable_0880C703[];
extern CONST_DATA s8 Unk_TerrainTable_0880C744[];
extern CONST_DATA s8 Unk_TerrainTable_0880C785[];
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

extern u16 CONST_DATA gUnknown_0880D374[]; // terrainid-to-textid lookup
// extern ??? gUnknown_088ACBC4
extern CONST_DATA u8 ItemEffectiveness_088ADEB0[];
extern CONST_DATA u8 ItemEffectiveness_Armor[];
extern CONST_DATA u8 ItemEffectiveness_088ADEC2[];
extern CONST_DATA u8 ItemEffectiveness_088ADED7[];
extern CONST_DATA u8 ItemEffectiveness_088ADEE0[];
extern CONST_DATA u8 ItemEffectiveness_088ADEF1[];
extern CONST_DATA u8 ItemEffectiveness_Dragon[];
extern CONST_DATA u8 ItemEffectiveness_088ADF1F[];
extern CONST_DATA u8 ItemEffectiveness_088ADF2A[];
extern CONST_DATA u8 ItemEffectiveness_Monsters[];
extern CONST_DATA u8 JidLutUnk_Tier0[];
extern CONST_DATA u8 gItemUseJidList_HeroCrest[];
extern CONST_DATA u8 gItemUseJidList_KnightCrest[];
extern CONST_DATA u8 gItemUseJidList_OrionsBolt[];
extern CONST_DATA u8 gItemUseJidList_ElysianWhip[];
extern CONST_DATA u8 gItemUseJidList_GuidRing[];
extern CONST_DATA u8 Unk_088ADF75[];
extern CONST_DATA u8 gItemUseJidList_MasterSeal[];
extern CONST_DATA u8 gItemUseJidList_HeavenSeal[];
extern CONST_DATA u8 Unk_088ADF99[];
extern CONST_DATA u8 Unk_088ADF9A[];
extern CONST_DATA u8 Unk_088ADF9B[];
extern CONST_DATA u8 gItemUseJidList_OceanSeal[];
extern CONST_DATA u8 Unk_088ADFA2[];
extern CONST_DATA u8 gItemUseJidList_C1[];
extern CONST_DATA u8 gItemUseJidList_LunarBrace[];
extern CONST_DATA u8 gItemUseJidList_SolarBrace[];
extern CONST_DATA u8 Unk_088ADFA8[];
extern CONST_DATA u8 Unk_088ADFA9[];
extern CONST_DATA u8 Unk_088ADFAA[];
extern CONST_DATA u8 Unk_088ADFAB[];
// extern ??? gSupportData
// extern ??? ItemBonus_Excalibur
// extern ??? gUnknown_088AF880
// extern ??? gUnknown_088AFB5A
// extern ??? gSpellAssocData
// extern ??? Events_WM_Beginning
// extern ??? Events_WM_ChapterIntro
// extern ??? gUnknown_088D2058
extern struct CONST_DATA gfx_set gConvoBackgroundData[];
extern u8 CONST_DATA gPromoJidLut[][2];
extern u8 gAnimCharaPalConfig[0x100][7];
extern u8 gAnimCharaPalIt[0x100][7];
extern u8 gSummonConfig[4][2];
// extern ??? gUnknown_0895F5A5
extern u16 CONST_DATA Pal_EventMapAnimMaskfx[];      /* a palatte */
extern u16 CONST_DATA Img_Congratulations[];      /* a image */
extern u16 CONST_DATA Img_MapClear[];      /* a image */
extern u16 CONST_DATA Pal_Congratulations[];      /* a palatte */
extern u16 CONST_DATA Pal_MapClear[];      /* a palatte */
extern u8 gUnknown_089A234C[]; // "combat record" img
extern u8 gUnknown_089A27B4[]; // "combat record" tsa
extern u16 gUnknown_089A28E0[]; // "combat record" pal
// extern ??? gUnknown_089A2920
// extern ??? gUnknown_089A2938
// extern ??? gUnknown_089A2968
// extern ??? gUnknown_089A2988
// extern ??? gMUSfxDef_Foot
// extern ??? gMUSfxDef_Heavy
// extern ??? gMUSfxDef_Mounted
// extern ??? gMUSfxDef_Wyvern
// extern ??? gMUSfxDef_Pegasus
// extern ??? gMUSfxDef_Zombie
// extern ??? gMUSfxDef_Skeleton
// extern ??? gMUSfxDef_Mogall
// extern ??? gMUSfxDef_Spider
// extern ??? gMUSfxDef_Dog
// extern ??? gMUSfxDef_Gorgon
// extern ??? gMUSfxDef_Boat
// extern ??? gMUSfxDef_Myrrh
// extern ??? gUnknown_089A2C28
// extern ??? gProcScr_MoveUnit
// extern ??? gUnknown_089A2C68
// extern ??? gUnknown_089A2C70
// extern ??? gUnknown_089A2C78
// extern ??? gUnknown_089A2C7A
extern CONST_DATA struct ProcCmd gProcScr_MUDeathFade[];
extern CONST_DATA struct ProcCmd gProcScr_MUBlinkEffect[];
// extern ??? gUnknown_089A2CA8
// extern ??? gUnknown_089A2CE8
extern CONST_DATA struct ProcCmd gProcScr_MU_89A2CF8[];
// extern ??? gUnknown_089A2D10
// extern ??? gUnknown_089A2D98
#define gMMSDataTable unit_icon_move_table
extern CONST_DATA struct MMSData gMMSDataTable[]; // Moving Map Sprite Table

// extern ??? Img_TalkBubble
extern u16 Pal_TalkBubble[];
// extern ??? gUnknown_089ED67C
// extern ??? gUnknown_089ED694
// extern ??? gUnknown_089ED6AC
extern struct ProcCmd ProcScr_BmGameOver[];
extern struct ProcCmd ProcScr_ForceAsyncButtonB[];
extern struct ProcCmd gUnknown_089EE000[];
extern struct ProcCmd ProcScr_089EE030[];
extern struct ProcCmd ProcScr_089EE048[];
extern struct ProcCmd ProcScr_089EE068[];
extern struct ProcCmd ProcScr_WorldFlush[];
extern const u16 Obj_089EE99C[];
extern u16 CONST_DATA *ImgLut_EventMapAnimMaskfx[];    /* images */
extern u16 CONST_DATA *gUnknown_089EE9C8[];    /* images */
extern struct ProcCmd ProcScr_EventMapAnim[];
extern struct ProcCmd gUnknown_089EEA28[];
// extern ??? gAutoUdefJids
// extern ??? EventScr_SkirmishCommonBeginning
// extern ??? EventScr_8A0035C
// extern ??? EventScr_8A00364
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
// extern ??? ProcScr_Helpbox_bug_08A01678
// extern ??? gUnknown_08A01698
// extern ??? gUnknown_08A016C8
// extern ??? gUnknown_08A016D8
extern struct ProcCmd gProcScr_BoxDialogue[];
// extern ??? gUnknown_08A01740
// extern ??? gProcScr_BoxDialogueInterpreter
// extern ??? gUnknown_08A01800
// extern ??? gUnknown_08A01818
extern u16 CONST_DATA gUnknown_08A01EE4[]; // some face-related palette (if portrait)
extern u16 CONST_DATA gUnknown_08A01F04[]; // some face-related palette (if card)
extern u8  CONST_DATA gUnknown_08A01F24[]; // img?
extern u8  CONST_DATA gUnknown_08A020F0[]; // img?
extern u16 CONST_DATA gUnknown_08A021E4[]; // pal
extern u8  CONST_DATA gUnknown_08A02204[]; // tsa
extern u8  CONST_DATA gUnknown_08A02250[]; // tsa
extern u8  CONST_DATA gUnknown_08A02274[]; // img objects
extern u16 CONST_DATA gUnknown_08A027FC[][0x10]; // color animation for each page
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
extern u8 CONST_DATA Img_LimitViewSquares[];
// extern ??? gUnknown_08A02EB4
// extern ??? gUnknown_08A02F34
// extern ??? gUnknown_08A02F94
// extern ??? gUnknown_08A02FF4
extern u8 CONST_DATA gUnknown_08A03054[];
extern u8 CONST_DATA gUnknown_08A0328C[];
// extern ??? gUnknown_08A032AC
// extern ??? gUnknown_08A03334
// extern ??? gUnknown_08A03354
extern u8  CONST_DATA gUnknown_08A03368[]; // stat screen background img
extern u8  CONST_DATA gUnknown_08A05F10[]; // stat screen background tsa
extern u16 CONST_DATA gUnknown_08A06460[]; // stat screen background pal
extern u8  CONST_DATA gUnknown_08A064E0[]; // halo img
extern u8  CONST_DATA gUnknown_08A071FC[]; // halo tsa
extern u16 CONST_DATA gUnknown_08A0731C[]; // halo pal
// extern ??? gUnknown_08A0733C
// extern ??? gUnknown_08A0754C
// extern ??? gUnknown_08A079B4
// extern ??? gUnknown_08A07A98
extern u16 gPal_08A07AD8[]; // pal
// extern ??? gUnknown_08A07AEA
// extern ??? gUnknown_08A07B0A
// extern ??? gUnknown_08A07BEA
// extern ??? gUnknown_08A07C0A
extern u16 gPal_08A07C58[]; // pal
extern u16 CONST_DATA Img_ChapterIntroFog[];
extern u16 gUnknown_08A09A5C[]; // pal
extern u8 gGfx_08A09E4C[]; // gfx
// extern ??? gUnknown_08A0A4E8
extern u8 gTsa_08A0A9F8[]; // tsa
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
// extern ??? gUnknown_08A173EC
// extern ??? gUnknown_08A1740C
extern u16 gTSA_TerrainBox[];
extern u16 gTSA_MinimugBox[];
extern u16 gUnknown_08A175B4[];
extern u16 gUnknown_08A175C8[];
extern u16 gUnknown_08A175DC[];
extern u16 gUnknown_08A175F0[];
extern u16 gUnknown_08A17604[];
extern u16 gUnknown_08A1763C[];
extern u16 gUnknown_08A17650[];
extern u16 gUnknown_08A17664[];
extern u16 gUnknown_08A17678[];
extern u16 gTSA_TerrainBox_Something[];
extern u16 gTSA_TerrainBox_Ballistae[];
extern u16 gTSA_TerrainBox_Destructable[];
extern u16 gUnknown_08A176B4[];
extern u16 gTSA_GoalBox_TwoLines[];
extern u16 gTSA_GoalBox_OneLine[];
// extern ??? ProcScr_UnitListScreen_Field
// extern ??? ProcScr_UnitListScreen_PrepMenu
// extern ??? ProcScr_UnitListScreen_SoloAnim
// extern ??? ProcScr_UnitListScreen_WorldMap
// extern ??? ProcScr_bmview
// extern ??? gUnknown_08A17B30
// extern ??? gUnknown_08A17B36
// extern ??? gSpriteArray_08A17B58
// extern ??? Sprite_08A17B64
// extern ??? Sprite_08A17B6C
// extern ??? gSpriteArray_08A17C20
// extern ??? gUnitListScreenFields
// extern ??? gUnknown_08A17C4C

// extern ??? gSram
// extern ??? sSupportUnkLut
// extern ??? sArenaCpTeamNameLut
// extern ??? gpSramExtraData

struct Unknown_08A209FC
{
    s8 a;
    s8 b;
};

extern struct Unknown_08A209FC gUnknown_08A209FC[];
extern u16 CONST_DATA gTextIds_DifficultyDescription[];
extern struct ProcCmd CONST_DATA ProcScr_NewGameDifficultySelect[];
extern u16 CONST_DATA gSprite_08A20A98[];
extern u16 CONST_DATA gSprite_DifficultyMenuSelectModeText[];
extern u16 CONST_DATA gSprite_08A20AC2[];
extern u16 CONST_DATA gSprite_08A20AD0[];
extern u16 CONST_DATA gSprite_08A20AE4[];
extern u16 CONST_DATA gSprite_08A20AF2[];
extern u16 * CONST_DATA gSpriteArray_08A20B08[];
extern u8 CONST_DATA gUnknown_08A20B14[];
extern struct ProcCmd CONST_DATA gProcScr_DrawDifficultyMenuSprites[];
// extern ??? gSprite_UiCursorHand_08A20B3C
// extern ??? gSprite_UiCursorHand_08A20B44
// extern ??? gProcScr_UiCursorHand
// extern ??? gSprite_UiSpinningArrows_Horizontal
// extern ??? gSprite_UiSpinningArrows_Vertical
// extern ??? gProcScr_UiSpinningArrows

// extern ??? gProcScr_08A20E24
// extern ??? gProcScr_BonusClaimHelpBox
// extern ??? gSoundRoomTable
// extern ??? gUnknown_08A212D4
// extern ??? gUnknown_08A212D8
// extern ??? gUnknown_08A212DC
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
// extern ??? gUnknown_08A21550
// extern ??? gUnknown_08A21568
extern u8 gUnknown_08A21658[]; // gfx, "records" background
extern u16 gUnknown_08A25DCC[]; // pal, "records" background
extern u8 gUnknown_08A25ECC[]; // tsa, "records" background
extern u8 gUnknown_08A26380[]; // gfx, fog overlay
extern u16 gUnknown_08A268D8[]; // pal, fog overlay
extern u8 gUnknown_08A268F8[]; // tsa, fog overlay
extern u8 Img_SaveScreenSprits[]; // gfx
extern u16 Pal_SaveScreenSprits[]; // pal
extern u16 Pal_08A28088[];
extern u16 gUnknown_08A280A8[]; // ap
extern u8 Img_GameMainMenuObjs[];
// extern ??? Img_DifficultyMenuObjs
// extern ??? Pal_DifficultyMenuObjs
// extern ??? gUnknown_08A2949A
// extern ??? gUnknown_08A294BA
// extern ??? gUnknown_08A29558
extern u16 gUnknown_08A295B4[]; // pal
extern u8 gUnknown_08A295D4[]; // tsa
// extern ??? gUnknown_08A29A88
// extern ??? gUnknown_08A2B1E4
// extern ??? gUnknown_08A2C11C
extern u16 gUnknown_08A2C23C[];
// extern ??? gUnknown_08A2C4C8
// extern ??? gUnknown_08A2C5A8
// extern ??? gUnknown_08A2C7A4
extern u8 Img_SoundRoomVolumeGraph[];
extern u16 Pal_SoundRoomVolumeGraph[];
// extern ??? gUnknown_08A2C908
// extern ??? gUnknown_08A2C92C
// extern ??? Img_SoundRoomUiElements
// extern ??? Pal_SoundRoomUiElements
extern u8 gUnknown_08A2D32C[]; // Gfx
extern u16 gUnknown_08A2E1B8[]; // Pal
extern u8 gUnknown_08A2E1F8[]; // Gfx
extern u8 gUnknown_08A2E214[]; // Gfx
extern u16 gUnknown_08A2E4A4[]; // Pal
extern u8 gUnknown_08A2E4C4[]; // TSA
extern u8 gUnknown_08A2E5EC[]; // Gfx
extern u16 gUnknown_08A2E8F0[]; // Pal
extern u8 Img_SysBlackBox[]; // Gfx

extern u8 gUnknown_08A301B0[]; // gfx?
extern u16 gUnknown_08A30780[]; // pal
extern u8 gUnknown_08A30800[]; // gfx
extern u16 gUnknown_08A30978[]; // tsa
extern u8 gUnknown_08A30E2C[]; // gfx
extern u8 gUnknown_08A35488[]; // tsa
extern u16 gUnknown_08A3593C[]; // pal
extern u8 gUnknown_08A35A3C[]; // gfx?
extern u8 gUnknown_08A35FD0[]; // tsa?
extern u16 gUnknown_08A360C8[]; // pal
extern u8 gUnknown_08A360E8[]; // gfx?
extern u8 gUnknown_08A36284[]; // tsa?
extern u8 gUnknown_08A36338[]; // gfx
extern u8 gUnknown_08A372C0[]; // pal
extern u16 gUnknown_08A37300[]; // pal
// extern ??? gOverallRankWeightLookup
// extern ??? gOverallRankLookup
// extern ??? gUnknown_08A3CB2A
// extern ??? gUnknown_08A3CB3A
// extern ??? gUnknown_08A3CB46
// extern ??? gUnknown_08A3CB50
// extern ??? gCGDataTable

extern u16 gPal_CharacterEndingMenu[];
extern u8 gGfx_CharacterEndingMenu[];
extern u8 gUnknown_08A3FFEC[]; // tsa
extern u8 gUnknown_08A40068[]; // tsa
extern u8 gTsa_SoloEndingNameplate[];
extern u8 gTsa_SoloEndingWindow[];
extern u8 gTsa_PairedEndingNameplates[];
extern u8 gTsa_PairedEndingWindow[];
extern u16 gPal_FinScreen[];
extern u8 gGfx_FinScreen[];
extern u8 gTsa_FinScreen[];
extern u16 gUnknown_08A40AD4[]; // pal
extern u8 gUnknown_08A40B14[]; // tsa
extern u16 Pal_StaffReelEnt_08A40FC8[];
extern u8 Img_StaffReelEnt_08A40FE8[];
extern u8 Img_StaffReelEnt_08A41B30[];
extern u8 Img_StaffReelEnt_08A42748[];
extern u8 Img_StaffReelEnt_08A432C0[];
extern u8 Img_StaffReelEnt_08A43CBC[];
extern u8 Img_StaffReelEnt_08A45150[];
extern u8 Img_StaffReelEnt_08A4561C[];
extern u8 Img_StaffReelEnt_08A45F58[];
extern u8 Img_StaffReelEnt_08A46988[];
extern u8 Img_StaffReelEnt_08A472B0[];
extern u8 Img_StaffReelEnt_08A48744[];
extern u8 Img_StaffReelEnt_08A497A8[];
extern u8 Img_StaffReelEnt_08A4A9D4[];
extern u8 Tsa_StaffReelEnt_08A4AE08[];
extern u8 Tsa_StaffReelEnt_08A4B090[];
extern u8 Tsa_StaffReelEnt_08A4B2F4[];
extern u8 Tsa_StaffReelEnt_08A4B558[];
extern u8 Tsa_StaffReelEnt_08A4B788[];
extern u8 Tsa_StaffReelEnt_08A4BB50[];
extern u8 Tsa_StaffReelEnt_08A4BCC4[];
extern u8 Tsa_StaffReelEnt_08A4BEC0[];
extern u8 Tsa_StaffReelEnt_08A4C0E4[];
extern u8 Tsa_StaffReelEnt_08A4C308[];
extern u8 Tsa_StaffReelEnt_08A4C6EC[];
extern u8 Tsa_StaffReelEnt_08A4C9F0[];
extern u8 Tsa_StaffReelEnt_08A4CD40[];
extern u8 gGfx_BrownTextBox[];
extern u16 gPal_BrownTextBox[];
// extern ??? gUnknown_08A83364
// extern ??? gUnknown_08A95F64
// extern ??? gUnknown_08A95FE4
// extern ??? gUnknown_08A96064
extern u8 Img_GmapNodes[]; // gfx -> world map tiles
extern u8 Img_GmapCastleNodes[]; // tsa
extern u16 gUnknown_08A97A40[]; // pal
extern u16 gPal_GMapPI_ShopIcons[];
extern u8 gGfx_GMapPI_ShopIcons[];
extern u16 gPal_08A97ACC[];
extern u16 Sprite_08A97AEC[]; // ap
extern u8 gImg_WorldmapNodeRevealEffect[];
extern u16 gPal_WorldmapNodeRevealEffect[];
extern u16 gUnknown_08A97E48[]; // pal
extern u8 Img_GmapPath[]; // gfx
extern u16 gUnknown_08A97FA4[]; // pal
extern u8 gUnknown_08A986C0[]; // tsa
extern u8 gUnknown_08A98BF8[]; // gfx
extern u8 gUnknown_08A98CFC[]; // tsa
extern u8 gUnknown_08A98D58[]; // tsa
extern u8 gUnknown_08A98D88[]; // tsa
extern u8 gUnknown_08A98DA0[]; // tsa
extern u8 gUnknown_08A98DB8[]; // tsa
extern u16 gUnknown_08A98DCC[]; // pal
// extern ??? gUnknown_08A98E2C
// extern ??? gUnknown_08A98E4C
// extern ??? gUnknown_08A98E6C
// extern ??? gUnknown_08A98E8C
extern u8 gUnknown_08A98EAC[]; // tsa
extern u8 gUnknown_08A98F30[]; // tsa
extern u8 gGfx_GMapPI_LevelNums[];
extern u16 gPal_GMapPI_LevelNums[];
extern u8 Img_EventGmap[];
extern u8 Tsa_EventGmap[];
extern u16 Pal_EventGmap[];
extern u8 gGfx_GMapPI_LevelNums[];
extern u8 gImg_08A9E544[];
extern u16 gPal_08A9E5BC[];
extern u8 gTsa_08A9E5DC[];
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
extern u8 gUnknown_08AA11D0[]; // tsa?
extern u8 Img_WorldmapMinimap[];
extern u16 Pal_WorldmapMinimap[];
extern u8 gUnknown_08AA18AC[];
// extern ??? gUnknown_08AA1930
// extern ??? gUnknown_08AA1950
extern u8 gImg_WorldmapSkirmish[]; // gfx
extern u8 SpriteAnim_WorldmapSkirmish[]; // ap proc data
// extern ??? ProcScr_EndingCredits_BlendCGMaybe
// extern ??? ProcScr_EndingCredits
// extern ??? gBgConfig_OpSubtitle
// extern ??? gUnknown_08AA21A4
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
extern u16 gPal_08AADBE8[];
extern u8 gGfx_08AADC08[];
extern u8 gTsa_08AAE61C[];
extern u16 gPal_08AAE8CC[];
extern u8 gGfx_08AAE8EC[];
extern u8 gTsa_08AAF928[];
extern u16 gPal_08AAFCF4[];
extern u8 gGfx_08AAFD14[];
extern u8 gTsa_08AAFF10[];
extern u16 gPal_08AB0114[];
extern u8 gGfx_08AB0134[];
extern u8 gTsa_08AB0A20[];
extern u16 gPal_08AB0B24[];
extern u8 gGfx_TitleDemonKing[];
extern u8 gTsa_TitleDemonKing[];
extern u16 gPal_TitleDemonKing[];
extern u8 gGfx_TitleLargeGlowingOrb[];
extern u16 gPal_TitleLargeGlowingOrb[];
extern u8 gGfx_TitleSmallLightBubbles[];
extern u16 gPal_TitleSmallLightBubbles[];
extern u8 Img_OpAnimWorldMap[];
extern u8 Tsa_OpAnimWorldMap[];
extern u16 pal_08AB630C[];
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
extern u8 Tsa_OpAnimEphraimClose[];
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
extern u8 Tsa_OpAnimEirikaClose[];
extern u8 Tsa_OpAnimEirikaClose2[];
extern u16 Pal_OpAnimEirikaBlur[];
extern u8 Img_OpAnimJoshua[];
extern u8 Img_OpAnimJoshua2[];
extern u8 Tsa_OpAnimJoshua2[];
// extern ??? gUnknown_08ACC340
extern u16 Pal_OpAnimJoshua[];
extern u8 Img_OpAnimLArachel[];
extern u8 Img_OpAnimLArachel2[];
extern u8 Tsa_OpAnimLArachel[];
extern u8 Tsa_OpAnimLArachelLeft[];
extern u16 Pal_OpAnimLArachel[];
extern u8 Img_OpAnimCharacterSeth[];
extern u8 Img_OpAnimCharacterSeth2[];
extern u8 Tsa_OpAnimCharacterSeth[];
extern u8 gUnknown_08AD236C[];
extern u16 Pal_OpAnimCharacterSeth[];
extern u8 Img_OpAnimMyrrh[];
extern u8 Img_OpAnimMyrrh2[];
extern u8 Tsa_OpAnimMyrrh2[];
extern u8 gUnknown_08AD543C[];
extern u16 Pal_OpAnimMyrrh2[];
extern u8 Img_OpAnimSaleh[];
extern u8 Img_OpAnimSaleh2[];
extern u8 Tsa_OpAnimSaleh2[];
extern u8 gUnknown_08AD88D4[];
extern u16 Pal_OpAnimSaleh2[];
// extern ??? Img_OpAnimTethys
// extern ??? Img_OpAnimTethys2
// extern ??? Tsa_OpAnimTethys
// extern ??? gUnknown_08ADBC0C
// extern ??? Pal_OpAnimTethys
// extern ??? gUnknown_08ADBE78
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
extern u8 Tsa_OpAnimHleathSafetyScreenBG1[];
extern u8 Tsa_OpAnimHleathSafetyScreenBG0[];
extern u8 Img_OpAnimHleathSafetyScreen[];
extern u16 Pal_OpAnimHleathSafetyScreen[];
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
extern u16 gUnknown_08B1754C[]; // pal
extern u16 gUnknown_08B1756C[]; // pal, used in opsubtitle
// extern ??? Tsa_08B176CC
// extern ??? Img_08B177C0
// extern ??? Img_08B17864
// extern ??? Pal_08B17B44
extern u8 gUnknown_08B17B64[]; // gfx?
extern u8 gUnknown_08B18D68[];
extern u16 gUnknown_08B18ED4[]; // pal
// extern ??? gUnknown_08B18F34
// extern ??? gUnknown_08B196D8
// extern ??? gUnknown_08B19854
// extern ??? gUnknown_08B19874
// extern ??? gUnknown_08B19DEC
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
