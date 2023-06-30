#ifndef GUARD_VARIABLES_H
#define GUARD_VARIABLES_H

#include "gba/types.h"
#include "types.h"
#include "global.h"
#include "proc.h"

// extern ??? gAnims
// extern ??? gUnknown_02000280
// extern ??? gUnknown_02000500
// extern ??? gUnknown_02000504
// extern ??? gUnknown_02000508
extern u16 *gUnknown_0200050C;
// extern ??? gUnknown_020007A0
// extern ??? gUnknown_020007E0
// extern ??? gUnknown_02000920
// extern ??? gUnknown_02000938
// extern ??? gUnknown_02000940
// extern ??? gUnknown_02000944
// extern ??? gUnknown_02000948
// extern ??? gUnknown_02000C60
// extern ??? gUnknown_02000C78
// extern ??? gUnknown_02000F00
// extern ??? gBmMapBuffer
// extern ??? gUnknown_02001088
// extern ??? gUnknown_02001180
// extern ??? gUnknown_02001184
// extern ??? gUnknown_02001188
// extern ??? gConvoyItemCount
// extern ??? gUnknown_02002038
// extern ??? gUnknown_02002088
extern struct Font gUnknown_02002774;
// extern ??? gaBattleForecastTextStructs
// extern ??? gUnknown_02002FF4
// extern ??? gUnknown_0200300C
// extern ??? gUnknown_02003088
// extern ??? gUnknown_0200310C
// extern ??? gUnknown_020038AC
// extern ??? gUnknown_020038C4
// extern ??? gUnknown_020038C8
// extern ??? gUnknown_020039C8
// extern ??? gUnknown_02003A08
// extern ??? gUnknown_02003B08
// extern ??? gUnknown_02003B48
// extern ??? gUnknown_02003B70
// extern ??? gUnknown_02003B88
// extern ??? gUnknown_02003BA8
// extern ??? gUnknown_02003BE8

// extern ??? gStatScreen
extern u16 gBmFrameTmap0[];

extern u16 gUnknown_02003D54[];

// extern ??? gUnknown_02003DF0
extern s16 gUnknown_02003E36[];
// extern ??? gUnknown_02003E70
// extern ??? gUnknown_02003E7C
// extern ??? gUnknown_02003E86
// extern ??? gUnknown_02003F84
extern s16 gUnknown_02003FAC[];
// extern ??? gUnknown_0200400C
extern u16 gUnknown_02004054[];
// extern ??? gUnknown_0200407C
extern u16 gBanimPal1[];
extern u16 gUnknown_020040AE[];
// extern ??? gUnknown_020040B2
extern u16 gBanimPal2[];
extern u32 gBanimOaml[];
extern u16 gUnknown_0200422C[];
extern u16 gUnknown_02004254[];
extern s16 gUnknown_020044AC[];
extern u16 gUnknown_020044D4[];
extern u16 gUnknown_020044EC[];
extern u16 gBmFrameTmap1[];

// extern ??? gChapterStatusText
// extern ??? gUnknown_02004BBC
// extern ??? gUnknown_02004BC4
// extern ??? gMUGfxBuffer
// extern ??? gUnknown_02007838
// extern ??? gUnknown_020078D8
// extern ??? gUnknown_02008000
// extern ??? gUnknown_020087A0
extern u32 gBanimOamr2[];
// extern ??? gUnknown_0200A2D8
// extern ??? gUnknown_0200A300
// extern ??? gUnknown_0200AF00
// extern ??? gUnknown_0200C300
// extern ??? gUnknown_0200CB00
// extern ??? gUnknown_0200D3E0
// extern ??? gUnknown_0200D6E0
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
extern char gStringBufferAlt[];
extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];

extern u8 gUnknown_020145C8[];
// extern ??? gUnknown_020146F4
// extern ??? gUnknown_02014DC8
// extern ??? gUnknown_02014EF4

extern u32 gBanimDoneMaybe[];
extern u32 gEkrBgXOffset;
// extern ??? gpProcEfxAnimeDrv
extern void *gpImgSheet[2];
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
// extern ??? gEkrDragonStatusLeft
// extern ??? gEkrDragonStatusRight
extern u16 gEkrDragonPalBackup[0x40 / sizeof(u16)];

extern u8 gEkrSomePalBuf[0x40];
extern u8 gGenericBuffer[0x1000];
// extern ??? gUnknown_02020208
// extern ??? gUnknown_02020288
// extern ??? gUnknown_02020988
// extern ??? gUnknown_02021188
// extern ??? gUnknown_02022188
extern s8 gUnknown_02022288[];
extern s8 gUnknown_020222A8[];
extern s8 gUnknown_02022308[];
extern u16 gPaletteBuffer[];
// extern ??? gUnknown_020228AA
// extern ??? pPalette1Buffer
extern u16 pPalette2Buffer[];
// extern ??? pPalette3Buffer
// extern ??? pPalette4Buffer
// extern ??? pPalette6Buffer
// extern ??? pPalette7Buffer
// extern ??? pPaletteEBuffer
// extern ??? pPaletteFBuffer
// extern ??? pPalette10Buffer
// extern ??? gUnknown_02022B68
extern u16 gUnknown_02022B88[];
extern u16 gUnknown_02022BA4[];
// extern ??? gUnknown_02022BA8
extern u16 gUnknown_02022BC8[];
// extern ??? gUnknown_02022BE8
extern u16 gUnknown_02022C08[];
extern u16 gUnknown_02022C28[];
extern u16 gUnknown_02022C48[];
// extern ??? gUnknown_02022C68
extern u16 gBG0TilemapBuffer[];
// extern ??? gUnknown_02022CAE
// extern ??? gUnknown_02022CB4
// extern ??? gUnknown_02022CB8
// extern ??? gUnknown_02022CC6
// extern ??? gUnknown_02022CCA
// extern ??? gUnknown_02022CD4
// extern ??? gUnknown_02022D10
// extern ??? gUnknown_02022D86
// extern ??? gUnknown_02022DF2
// extern ??? gUnknown_02022E00
// extern ??? gUnknown_02022E2E
// extern ??? gUnknown_02022E76
// extern ??? gUnknown_02022EEC
// extern ??? gUnknown_02022F06
// extern ??? gUnknown_02022F0A
// extern ??? gUnknown_02022F0E
// extern ??? gUnknown_02022F4E
// extern ??? gUnknown_02022FA8
// extern ??? gUnknown_02022FBE
// extern ??? gUnknown_02022FC6
// extern ??? gUnknown_02022FD4
extern u16 gUnknown_02022FE8[];
// extern ??? gUnknown_02023028
// extern ??? gUnknown_0202306E
// extern ??? gUnknown_02023084
// extern ??? gUnknown_020230A8
// extern ??? gUnknown_020230CA
// extern ??? gUnknown_0202310E
// extern ??? gUnknown_02023114
// extern ??? gUnknown_02023116
// extern ??? gUnknown_02023130
extern u16 gBG1TilemapBuffer[];
// extern ??? gUnknown_020234AC
// extern ??? gUnknown_020234AE
// extern ??? gUnknown_020234BE
// extern ??? gUnknown_020234CA
// extern ??? gUnknown_020234E2
// extern ??? gUnknown_020234E4
// extern ??? gUnknown_020235FC
// extern ??? gUnknown_020235FE
// extern ??? gUnknown_020236E4
// extern ??? gUnknown_0202387E
// extern ??? gUnknown_020238A8
// extern ??? gUnknown_020238CA
// extern ??? gUnknown_0202393E
// extern ??? gUnknown_020239A8
// I'm not sure if this is u8 or u16.
// In text mode, the tilemap entries are 16 bits,
// while in affine mode, they are 8 bits.
extern u16 gBG2TilemapBuffer[];
// extern ??? gUnknown_02023CAA
// extern ??? gUnknown_02023CC6
// extern ??? gUnknown_02023CC8
// extern ??? gUnknown_02023D0C
// extern ??? gUnknown_02023D12
// extern ??? gUnknown_02023D88
// extern ??? gUnknown_02023D9C
// extern ??? gUnknown_02023DAA
// extern ??? gUnknown_02023DBA
// extern ??? gUnknown_02023DE8
// extern ??? gUnknown_02023DEA
// extern ??? gUnknown_02023DEE
// extern ??? gUnknown_02023DF8
// extern ??? gUnknown_02023E88
// extern ??? gUnknown_02023EA8
// extern ??? gUnknown_02023F68
// extern ??? gUnknown_02023FBA
extern u16 gBG3TilemapBuffer[];
extern void *gBGVramTilemapPointers[];
extern void (*gMainCallback)(void);
extern struct Struct02024CD4 gFrameTmRegisterConfig;
extern struct TileDataTransfer gFrameTmRegister[];
// extern ??? gUnknown_02026968
// extern ??? gUnknown_02026A6C
// extern ??? gUnknown_02026A90
// extern ??? gUnknown_02026E10
// extern ??? gUnknown_02028F78
// extern ??? gUnknown_02029D88
extern struct TextBuffer0202A6AC gUnknown_0202A6AC;
//extern u8 gUnknown_0202AC01[];
//extern u8 gUnknown_0202B156[];
extern u8 gUnknown_0202B4AC[];
// extern ??? gUnknown_0202B5AC
extern int gUnknown_0202B6AC;
extern struct BmSt gBmSt;
extern struct PlaySt gPlaySt;
// extern ??? gUnknown_0202BD30
extern u8 gActiveUnitId;
extern struct Vec2 gActiveUnitMoveOrigin;
// extern ??? gUnknown_02030B8C
extern u8 gWorkingMovementScript[];
extern u16 gConvoyItemArray[];
extern struct Unit* sUnitStackBase;
extern struct Unit* sUnitStackTop;
extern u8 sUnitStackSize;
extern struct ActionData gActionData;
// extern ??? gUnknown_0203A95E
// extern ??? gUnknown_0203A974
// extern ??? gUnknown_0203AA7F
// extern ??? gUnknown_0203AA80
// extern ??? gUnknown_0203AA8A
// extern ??? gAiDecision
// extern ??? gUnknown_0203C624
// extern ??? gUnknown_0203CA24
// extern ??? gUnknown_0203DA24
// extern ??? gUnknown_0203DA30
// extern ??? gUnknown_0203DA78
// extern ??? gUnknown_0203DA88
// extern ??? gUnknown_0203DAB0
// extern ??? gUnknown_0203DAC0
// extern ??? gUnknown_0203DAC5
// extern ??? gUnknown_0203DB10
// extern ??? gUnknown_0203DB14
// extern ??? gUnknown_0203DB1C
// extern ??? gUnknown_0203DB64
// extern ??? gUnknown_0203DB7C
// extern ??? gUnknown_0203DC44
// extern ??? gUnknown_0203DC48
// extern ??? gUnknown_0203DD0C
// extern ??? gUnknown_0203DD1C
// extern ??? gUnknown_0203DD24
// extern ??? gUnknown_0203DD28
// extern ??? gUnknown_0203DD2C
// extern ??? gUnknown_0203DD4C
// extern ??? gUnknown_0203DD50
// extern ??? gUnknown_0203DD8C
// extern ??? gUnknown_0203DD90
// extern ??? gUnknown_0203DD94
// extern ??? gUnknown_0203DD95
// extern ??? gUnknown_0203DD9A
// extern ??? gUnknown_0203DD9F
// extern ??? gUnknown_0203DDB4
// extern ??? gUnknown_0203DDDC

extern int gUnknown_0203E1E0;
// extern ??? gBaArenaFlag
// extern ??? gpProcefxopCur
// extern ??? gUnknown_0203E1EC
// extern ??? gUnknown_0203E1F8
// extern ??? gUnknown_0203E254
// extern ??? gUnknown_0203E754
// extern ??? gUnknown_0203E75C
// extern ??? gUnknown_0203E78C
// extern ??? gUnknown_0203E794
// extern ??? gUnknown_0203E7AC
// extern ??? gUnknown_0203E7C8
// extern ??? gUnknown_0203E7E4
// extern ??? gUnknown_0203E7E8
// extern ??? gUnknown_0203E800
// extern ??? gUnknown_0203E828
// extern ??? gUnknown_0203E82C
extern struct Struct203E87C gUnknown_0203E87C;
// extern ??? gUnknown_0203E884
// extern ??? gExtraMapStatus
// extern ??? gUnknown_0203EF64
// extern ??? gUnknown_0203EFB4
// extern ??? end
// extern ??? gUnknown_03000000
// extern ??? gLCGRNValue

// time.c/hardware.c
// extern ??? gUnknown_0300000C
extern u8 sModifiedBGs;  // BGs that need copying
extern s8 sModifiedPalette;
extern u16 gUnknown_03000010;
// extern ??? gUnknown_03000014
extern u8 gUnknown_03000018;
extern u8 gUnknown_03000019;
extern u8 gUnknown_0300001A;
extern struct OamDataTransfer gUnknown_03000020;
extern struct OamDataTransfer gUnknown_03000030;

// extern ??? sAPArray
// extern ??? gUnknown_03000428
// extern ??? gUnknown_03000430
// extern ??? gUnknown_03000434
// extern ??? gEventCallQueue
// extern ??? gEventSlots
// extern ??? gUnknown_030004E4
// extern ??? gUnknown_030004E6
// extern ??? gUnknown_030004E8
// extern ??? gEventSlotQueue
// extern ??? gEventSlotCounter
// extern ??? gUnknown_03000570
// extern ??? gUnknown_030005B0
// extern ??? gPopupInst
// extern ??? gpPopupUnit
// extern ??? gPopupItem
// extern ??? gPopupNumber
// extern ??? gUnknown_030005FC
// extern ??? gUnknown_03000600
// extern ??? gUnknown_03000700
// extern ??? gUnknown_03000800
// extern ??? gUnknown_03000808
// extern ??? gUnknown_03001788
// extern ??? gDungeonState
// extern ??? gUnknown_030017AC
// extern ??? gUnknown_030017E0
// extern ??? gUnknown_030017E4
// extern ??? gUnknown_030017E8
// extern ??? gUnknown_030017EC
// extern ??? gUnknown_030017F0
// extern ??? gUnknown_030017F2
// extern ??? gUnknown_030017F8
// extern ??? gUnknown_03001800
// extern ??? gUnknown_03001808
// extern ??? gUnknown_0300180C
// extern ??? gUnknown_03001810
// extern ??? gUnknown_03001818
// extern ??? gUnknown_0300182C
// extern ??? gUnknown_03001830
// extern ??? gUnknown_03001834
// extern ??? gUnknown_03001838
// extern ??? gUnknown_03001840
// extern ??? gUnknown_03001850
// extern ??? gUnknown_03001860
// extern ??? gUnknown_03001864
// extern ??? gUnknown_030018F0
// extern ??? gUnknown_03001A30
// extern ??? gUnknown_03001A34
// extern ??? gUnknown_03001C34
// extern ??? gUnknown_03001C35
// extern ??? gUnknown_03001C36
// extern ??? gUnitDef1
// extern ??? gUnknown_03001C48
// extern ??? gUnitDef2
// extern ??? gUnknown_03001C68
// extern ??? gUnknown_03001C74
// extern ??? gUnknown_03001C7C
// extern ??? gActiveEventRegistry
// extern ??? gUnknown_03001CC0
// extern ??? gUnknown_03001CC8
// extern ??? gUnknown_03001CE8
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
extern void* gUnknown_03003070;
extern struct Struct03003080 gLCDControlBuffer;
//extern u16 gUnknown_0300308C[];
// extern ??? gUnknown_03003090
// extern ??? gUnknown_03003094
// extern ??? gUnknown_03003098
// extern ??? gUnknown_030030B4
// extern ??? gUnknown_030030B6
extern u16 gUnknown_030030BC;
// extern ??? gUnknown_030030C8
// extern ??? gUnknown_030030D8
// extern ??? gUnknown_030030F0
// extern ??? gUnknown_03003128
extern u16 gUnknown_0300312C;
// extern ??? gUnknown_03003130
extern void (*sHBlankHandler1)(void);
extern u16 gUnknown_03003140[];
extern u32 gUnknown_03003240[];
// extern ??? gUnknown_03003540
// extern ??? gUnknown_03003740
extern u32 *gUnknown_03003744;
extern void (*sHBlankHandler2)(void);
// extern ??? gUnknown_03003750
// extern ??? gUnknown_03004150
// extern ??? gUnknown_03004154
extern u16* gUnknown_03004158;
// extern ??? gUnknown_03004160
// extern ??? gUnknown_03004960
// extern ??? gUnknown_03004990
// extern ??? gStatGainSimUnit
extern struct Unit* gActiveUnit;
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
extern int gUnknown_03004FAC;
extern int gEkrYQuakeOff;
// extern ??? MADebugInfo
// extern ??? gUnknown_03005090
// extern ??? gUnknown_03005110
// extern ??? gPermanentFlagBits
// extern ??? gChapterFlagBits
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
extern short gSinLookup[]; // gSinTable; needs to be non-const to match?
//extern const s16 gCosLookup[]; // gCosTable
// extern ??? gUnknown_080D77BC
// extern ??? gUnknown_080D77DC
// extern ??? gUnknown_080D77FC
// extern ??? gUnknown_080D78EC
// extern ??? gUnknown_080D7908
// extern ??? gUnknown_080D792C
// extern ??? gUnknown_080D793C
// extern ??? gUnknown_080D793F
// extern ??? gUnknown_080D794E
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
// extern ??? gUnknown_080D7F4C
// extern ??? gUnknown_080D7F58
// extern ??? gUnknown_080D7FD0
// extern ??? gUnknown_080D8018
// extern ??? gUnknown_080D8070
// extern ??? gUnknown_080D80C4
// extern ??? gUnknown_080D80E8
// extern ??? gUnknown_080D8690
// extern ??? gUnknown_080D8714
// extern ??? gUnknown_080D8740
// extern ??? gUnknown_080D9C9E
// extern ??? gUnknown_080D9D34
// extern ??? gUnknown_080D9D4D
// extern ??? gUnknown_080D9D56
// extern ??? gUnknown_080D9D5E
// extern ??? gUnknown_080D9D61
// extern ??? gUnknown_080D9DE4
// extern ??? gUnknown_080D9DF2
// extern ??? gUnknown_080D9E06
// extern ??? gUnknown_080D9E0E
// extern ??? gUnknown_080D9E1C
// extern ??? gUnknown_080D9E44
// extern ??? gUnknown_080D9E50
// extern ??? gUnknown_080D9E9C
// extern ??? gUnknown_080D9EA6
// extern ??? gUnknown_080D9EC0
// extern ??? gUnknown_080D9EC8
// extern ??? gUnknown_080D9EF0
// extern ??? gUnknown_080D9EFC
// extern ??? gUnknown_080D9F18
// extern ??? gUnknown_080D9F20
// extern ??? gUnknown_080D9F28
// extern ??? gUnknown_080D9F38
// extern ??? gUnknown_080D9F48
// extern ??? gUnknown_080D9F98
// extern ??? gUnknown_080D9FA0
// extern ??? gUnknown_080D9FA8
// extern ??? gUnknown_080D9FB0
// extern ??? gUnknown_080D9FB5
// extern ??? gUnknown_080D9FB7
// extern ??? gUnknown_080D9FD6
// extern ??? gUnknown_080D9FE4
// extern ??? gUnknown_080DA09C
// extern ??? gUnknown_080DA0DA
// extern ??? gUnknown_080DA0FA
// extern ??? gUnknown_080DA102
// extern ??? gUnknown_080DA132
// extern ??? gUnknown_080DA17A
// extern ??? gUnknown_080DA18E
// extern ??? gUnknown_080DA1A2
// extern ??? gUnknown_080DA1B6
// extern ??? gUnknown_080DA1CA
// extern ??? gUnknown_080DA20C
// extern ??? gUnknown_080DA21C
// extern ??? gUnknown_080DA22C
// extern ??? gUnknown_080DA25C
// extern ??? gUnknown_080DA26A
// extern ??? gUnknown_080DA27E
// extern ??? gUnknown_080DA2B0
extern const s16 gEfxNoDmgBgShakeOff[];
// extern ??? gUnknown_080DA4BA
extern CONST_DATA struct Vec2 gUnknown_080DA4DC[];
// extern ??? gUnknown_080DA526
extern CONST_DATA struct Vec2 gUnknown_080DA570[];
// extern ??? gUnknown_080DA5BA
// extern ??? gUnknown_080DA604
// extern ??? gUnknown_080DA66E
// extern ??? gUnknown_080DA9F8
// extern ??? gUnknown_080DAA8E
// extern ??? gUnknown_080DAC58
// extern ??? gUnknown_080DAC82
extern const u16 gUnknown_080DACDA[];
extern const u16 gUnknown_080DAD0A[];
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
// extern ??? gUnknown_080DAF18
extern const u8 gUnknown_080DAF1D[];
extern const u8 gUnknown_080DAF22[];
extern u16 gUnknown_080DAF28[];
// extern ??? gUnknown_080DAF60
// extern ??? gUnknown_080DB026
// extern ??? gUnknown_080DC85C
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

// extern ??? gUnknown_080DF644
// extern ??? gUnknown_080DF6A8
// extern ??? gUnknown_080DF6C6
// extern ??? gUnknown_080DF730
// extern ??? gUnknown_080DF748
// extern ??? gUnknown_080DF7CE
// extern ??? gUnknown_080DF866
// extern ??? gUnknown_080DF898
// extern ??? gUnknown_080DF954
// extern ??? gUnknown_080DF9BE
extern u16 gUnknown_080E1164[];
// extern ??? gUnknown_080E1394
// extern ??? gUnknown_080E13A2
// extern ??? gUnknown_080E13B4
// extern ??? gUnknown_080E13D4
// extern ??? gUnknown_080E13F4
// extern ??? gUnknown_080E143A
// extern ??? gUnknown_080E1488
// extern ??? sEfxLvupPartsPos
// extern ??? gUnknown_080E162A
// extern ??? gUnknown_080E1664
// extern ??? gUnknown_080E169A
// extern ??? gUnknown_080E16DC
// extern ??? gUnknown_080E1732
// extern ??? gUnknown_080E1740
// extern ??? gUnknown_080E17C0
// extern ??? gUnknown_080E2164
// extern ??? gUnknown_080E2B54
// extern ??? gUnknown_080E3B78
// extern ??? gUnknown_080E4530
// extern ??? gUnknown_080E4EFC
// extern ??? gUnknown_080E58A4
// extern ??? gUnknown_080E5BC4
// extern ??? gUnknown_080E5F98
// extern ??? gUnknown_080E63CC
// extern ??? gUnknown_080E678C
// extern ??? gUnknown_080E6CC4
// extern ??? gUnknown_080E7400
// extern ??? gUnknown_080E7B8C

// extern ??? gMsgHuffmanTable
// extern ??? gMsgHuffmanTableRoot
extern const u8 *const gMsgStringTable[];
extern const u8 gUnknown_08205714[4];
// extern ??? gUnknown_0820579C
// extern ??? gUnknown_08205824
// extern ??? gUnknown_08205833
// extern ??? gUnknown_08205846
// extern ??? gUnknown_08205855
// extern ??? gUnknown_08205884
// extern ??? gUnknown_0820588C
// extern ??? gUnknown_0820588E
// extern ??? gUnknown_082058A8
// extern ??? gUnknown_082058B0
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
// extern ??? gUnknown_08205B94
// extern ??? gUnknown_08205BB0
// extern ??? gUnknown_08205BC0
// extern ??? gLinkArenaBanList
// extern ??? gUnknown_08205C14
// extern ??? Pals_PrepWindow
// extern ??? gUnknown_08205C64
extern const struct FaceVramEntry gFaceConfig_PrepItemUseScreen[4];
// extern ??? gUnknown_08205C90
// extern ??? sSaveMarker
// extern ??? sConvySavePackMask1
// extern ??? sConvySavePackMask2
// extern ??? gInitialMultiArenaRankings
// extern ??? gUnknown_08205D7C
// extern ??? gUnknown_08205D84
// extern ??? gUnknown_08205D87
// extern ??? gUnknown_08205D97
// extern ??? gUnknown_08205DB8
// extern ??? gUnknown_08205E18
// extern ??? gUnknown_08205E28
// extern ??? gUnknown_08205F28
// extern ??? gUnknown_08205F7C
// extern ??? gUnknown_08205FA0
// extern ??? gUnknown_082060B0
// extern ??? gUnknown_08206450
// extern ??? gUnknown_08206498
// extern ??? gUnknown_08206674
// extern ??? gUnknown_08206868
// extern ??? gUnknown_082068F4
// extern ??? gUnknown_082068FC
// extern ??? gUnknown_08206904
extern u8 gWMMonsterSpawnLocations[];
extern u8 gWMMonsterSpawnsSize;
// extern ??? gUnknown_08206954
// extern ??? gUnknown_082069D8
// extern ??? gUnknown_082069E3
// extern ??? gUnknown_082069EE
// extern ??? gUnknown_08206A48
// extern ??? gUnknown_08206A51
// extern ??? gUnknown_08206AAB
// extern ??? gUnknown_08206AF0
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

extern struct KeyStatusBuffer *gKeyStatusPtr;
extern void *gUnknown_08587938[];
extern struct BgCnt *gUnknown_08587948[];
// extern ??? sMusicProc1Script
// extern ??? sMusicProc2Script
// extern ??? gMusicProc3Script
// extern ??? sMusicProc4Script
// extern ??? gProcCmdFuncs
extern u8 debug_font_4bpp[];
extern u16 *gUnknown_08588240[];
// extern ??? gUnknown_08588274
// extern ??? gUnknown_08588284
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
extern struct Glyph *gUnknown_0858C7EC[];
extern struct Glyph *gUnknown_0858F6F4[];
extern struct Glyph *gUnknown_08590B44[];
// extern ??? gUnknown_0859160C
// extern ??? gUnknown_08591624
// extern ??? gUnknown_0859163C
extern const char *gUnknown_08591AA4[][2];
//extern struct {u32 *unk0; u32 *unk4; u32 *unk8;} gUnknown_08591AA4;
// extern ??? gUnknown_08591AB4
// extern ??? gProc_StdEventEngine
// extern ??? gProc_BattleEventEngine
// extern ??? gEventLoCmdTable
// extern ??? gEventHiCmdTable
// extern ??? gUnknown_08591DD8
// extern ??? gUnknown_08591DE8
// extern ??? gUnknown_08591E00
// extern ??? gUnknown_08591E58
// extern ??? gUnknown_08591EB0
// extern ??? gUnknown_08591F08
// extern ??? gUnknown_08591F18
// extern ??? gUnknown_08591F28
// extern ??? gEvent_DisplayBattleQuote
// extern ??? gEvent_TriggerQueuedTileChanges
// extern ??? gEvent_OpenChest
// extern ??? gEvent_MapSupportConversation
// extern ??? gEvent_SupportViewerConversation
// extern ??? gEvent_SkirmishRetreat
// extern ??? gEvent_SuspendPrompt
// extern ??? gEvent_GameOver
// extern ??? gUnknown_08592114
// extern ??? gUnknown_085921AC
// extern ??? sProcScr_Popup
// extern ??? sProcScr_PopupUpdateIcon
// extern ??? gPopup_GotItem
// extern ??? gPopup_ItemWasPilfered
// extern ??? sProcScr_GotItem
// extern ??? gPopup_GotGold
// extern ??? gPopup_GoldWasStole
// extern ??? gPopup_StoleItem
// extern ??? gPopup_ItemStolen
// extern ??? gPopup_WpnBroken
// extern ??? gPopup_WRankUp
// extern ??? gPopup_NewAlly
// extern ??? gUnknown_085924D8
// extern ??? gUnknown_08592530
// extern ??? gUnknown_08592568
// extern ??? gUnknown_08592580
// extern ??? ProcScr_BoomFogFx
// extern ??? gUnknown_085925F0
// extern ??? gUnknown_08592608
// extern ??? gUnknown_08592628
// extern ??? gUnknown_085926F4
// extern ??? gUnknown_085996F4
// extern ??? gUnknown_08599FD4

// extern ??? gUnknown_0859A1E0
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
// extern ??? gUnknown_0859BC64
// extern ??? gUnknown_0859BCA8
// extern ??? gUnknown_0859BCF4
// extern ??? gUnknown_0859BD40
extern struct ProcCmd CONST_DATA gProcScr_UpdateTraps[];
// extern ??? gUnknown_0859CFB0
// extern ??? gUnknown_0859CFD4
// extern ??? gUnknown_0859CFF8
// extern ??? gUnknown_0859D01C
// extern ??? gUnknown_0859D040
// extern ??? gMenuInfo_RepairItems
// extern ??? gUnknown_0859D088
// extern ??? gUnknown_0859D0AC
// extern ??? gUnknown_0859D0D0
// extern ??? gUnknown_0859D0F4
// extern ??? gUnknown_0859D118
// extern ??? gUnknown_0859D13C
// extern ??? gUnknown_0859D160
// extern ??? gUnknown_0859D184
// extern ??? gUnknown_0859D1A8
// extern ??? gUnknown_0859D1CC
// extern ??? gUnknown_0859D1F0
// extern ??? gUnknown_0859D214
// extern ??? gSelectInfo_OffensiveStaff
// extern ??? gSelectInfo_Barrier
// extern ??? gSelectInfo_Restore
// extern ??? gSelectInfo_Heal
// extern ??? gSelectInfo_Dance
// extern ??? gSelectInfo_PutTrap
// extern ??? gSelectInfo_0859D2F8
// extern ??? gSelectInfo_Steal
// extern ??? gSelectInfo_Summon
// extern ??? gSelectInfo_Pick
// extern ??? gSelectInfo_Support
// extern ??? gSelectInfo_Talk
// extern ??? gSelectInfo_Repair
// extern ??? gSelectInfo_Trade
// extern ??? gSelectInfo_0859D3F8
// extern ??? gSelectInfo_Give
// extern ??? gSelectInfo_Take
// extern ??? gSelectInfo_Drop
// extern ??? gSelectInfo_Rescue
// extern ??? gProc_MapTask
// extern ??? gUnknown_0859DBA0
extern u16 gGfx_MiscUiGraphics[];
extern u16 gPal_MiscUiGraphics[];
// extern ??? gUnknown_0859EDB0
// extern ??? gUnknown_0859EDEC
// extern ??? gUnknown_0859EE20
// extern ??? gUnknown_0859EE40
// extern ??? gUnknown_0859EE60
// extern ??? gUnknown_0859EEA0
extern u16 gPal_MapSprite[];
extern u16 gPal_NotMapSprite[];
extern u16 gPal_MapSpriteArena[];
extern u16 gPal_MapSpriteSepia[];
extern u8 Pal_UIFont[];
extern u8 gUnknown_0859EF20[];
// extern ??? gUnknown_0859EF40
// extern ??? gPal_HelpTextBox
// extern ??? gPal_YellowTextBox
extern u16 gUnknown_0859EFC0[];
// extern ??? gUnknown_0859EFE0
// extern ??? gUnknown_0859F000
// extern ??? Img_PhaseChangeUnk
// extern ??? Img_PhaseChangePlayer
extern CONST_DATA u16 Pal_PhaseChangePlayer[];
// extern ??? Img_PhaseChangeEnemy
// extern ??? Pal_PhaseChangeEnemy
// extern ??? Img_PhaseChangeOther
// extern ??? Pal_PhaseChangeOther
extern CONST_DATA u16 Img_PhaseChangeSquares[];
// extern ??? gUnknown_085A0838
// extern ??? gUnknown_085A08F0
// extern ??? gTSA_BattleForecastStandard
// extern ??? gTSA_BattleForecastExtended
// extern ??? gBattleForecast_x2x4Gfx
// extern ??? gBattleForecast_x2x4Pal
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

// extern ??? gUnknown_085A638C
// extern ??? gUnknown_085A643C
extern u8 gUnknown_085A647C[]; // tsa

extern u16 CONST_DATA Img_DanceringFx[];
extern u16 CONST_DATA Tsa_DanceringFx[];
extern u16 CONST_DATA Pal_DanceringFx[];

extern u16 CONST_DATA Img_MineFx[];
extern u16 CONST_DATA SpritAnim_MineFx[];
extern u16 CONST_DATA Pal_MineFx[];

// extern ??? gUnknown_085A7EE8
// extern ??? gProcScr_CpPhase
// extern ??? gProcScr_BerserkCpPhase
// extern ??? gProcScr_CpDecide
// extern ??? gUnknown_085A92DC
// extern ??? gUnknown_085A92DE
// extern ??? gUnknown_085A92E0
// extern ??? gUnknown_085A92E4
// extern ??? gUnknown_085A9304
// extern ??? ProcScr_SIOCON
// extern ??? ProcScr_SIOVSYNC
// extern ??? ProcScr_SIOMAIN
// extern ??? gUnknown_085A93A0
// extern ??? ProcScr_HOLD
// extern ??? gUnknown_085A93E0
// extern ??? gUnknown_085A93F0
// extern ??? gUnknown_085A94A0
// extern ??? gUnknown_085A94AC
// extern ??? gUnknown_085A9614
// extern ??? gUnknown_085A96D4
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
// extern ??? gUnknown_085AA6BC
// extern ??? gUnknown_085AA75C
// extern ??? gUnknown_085AA7B4
// extern ??? gUnknown_085AA7EC
// extern ??? gUnknown_085AA824
// extern ??? gUnknown_085AA83C
// extern ??? gUnknown_085AA854
// extern ??? gUnknown_085AA86C
// extern ??? ProcScr_SIOWARPFX
// extern ??? gUnknown_085AA914
// extern ??? gUnknown_085AA954
// extern ??? gUnknown_085AA96C
// extern ??? gUnknown_085AA980
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
// extern ??? gUnknown_085AAAC4
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
// extern ??? gUnknown_085ABD68
// extern ??? gUnknown_085AC604
// extern ??? gUnknown_085AC9DC
// extern ??? gUnknown_085ACD20
// extern ??? gUnknown_085ACEFC
// extern ??? gUnknown_085AD0CC
// extern ??? gUnknown_085AD80C
// extern ??? gUnknown_085AD9CC
// extern ??? gUnknown_085ADA38
// extern ??? gUnknown_085ADBE8
// extern ??? gUnknown_085ADC48
// extern ??? gUnknown_085ADCC8
// extern ??? gUnknown_085ADDA8
// extern ??? gUnknown_085ADDC8
// extern ??? gUnknown_085ADDE8
// extern ??? gUnknown_085ADE08
// extern ??? gUnknown_085ADE28
// extern ??? gUnknown_085ADE48
// extern ??? gUnknown_085ADE68
// extern ??? gUnknown_085ADE88
// extern ??? gUnknown_085ADF40
// extern ??? gUnknown_085AE190
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
// extern ??? gUnknown_085B92C4
extern char gNopStr[];
// extern ??? gUnknown_085B9E4C
extern u16 gUnknown_085BA0B8[];
// extern ??? gUnknown_085BA2E0
// extern ??? gUnknown_085BA300
// extern ??? gUnknown_085BA320
extern u16 gUnknown_085BB0C8[];
extern u16 gUnknown_085BB2DC[];
// extern ??? gUnknown_085BC188
// extern ??? gUnknown_085BE7F4
// extern ??? gUnknown_085BEF94
// extern ??? gUnknown_085C48AC
// extern ??? gUnknown_085C5994
// extern ??? gUnknown_085C6054
// extern ??? gUnknown_085C60D4
// extern ??? gUnknown_085C6730
// extern ??? gUnknown_085C71E4
// extern ??? gUnknown_085C72AC
// extern ??? gUnknown_085C7338
// extern ??? gUnknown_085C73B8
// extern ??? gUnknown_085C7438
extern u16 *gUnknown_085C81A4[];
extern u16 *gUnknown_085C8218[];
// extern ??? gUnknown_085C8278
// extern ??? gUnknown_085C9270
// extern ??? gUnknown_085C92A0
// extern ??? gUnknown_085C92D0
// extern ??? gUnknown_085C92EC
// extern ??? gUnknown_085C9328
extern u16 gUnknown_085CFB70[];
extern u16 gUnknown_085D0820[];
extern u16 gUnknown_085D0A20[];
extern u16 gUnknown_085D0CE0[];
extern u16 gUnknown_085D0FD0[];
extern u16 gUnknown_085D1470[];

// extern ??? gUnknown_085D99EC
// extern ??? gUnknown_085D9A1C
// extern ??? gUnknown_085D9A2C
// extern ??? gUnknown_085D9A94
// extern ??? gUnknown_085D9AFC
// extern ??? gUnknown_085D9B64
// extern ??? gUnknown_085D9B74
// extern ??? gUnknown_085D9BA4
// extern ??? gUnknown_085D9BB4
// extern ??? gUnknown_085D9C00
// extern ??? gUnknown_085D9C4C
// extern ??? gUnknown_085D9C5C
// extern ??? gUnknown_085DA05C
// extern ??? gUnknown_085DA364
// extern ??? gUnknown_085DA3C0
// extern ??? gUnknown_085DA3E0
// extern ??? gUnknown_085DA6FC
// extern ??? gUnknown_085DA758
// extern ??? gUnknown_085DA778
// extern ??? gUnknown_085DA7AC
// extern ??? gUnknown_085DA854
// extern ??? gUnknown_085DA864
// extern ??? gUnknown_085DA8E0
// extern ??? gUnknown_085DA8F0
// extern ??? gUnknown_085DA900
// extern ??? gUnknown_085DAB30
// extern ??? gUnknown_085DAB50
// extern ??? gUnknown_085DAD6C
// extern ??? gUnknown_085DAD8C
// extern ??? gUnknown_085DAFA4
// extern ??? gUnknown_085DAFC4
// extern ??? gUnknown_085DB1E0
// extern ??? gUnknown_085DB200
// extern ??? gUnknown_085DB42C
// extern ??? gUnknown_085DB44C
// extern ??? gUnknown_085DB694
// extern ??? gUnknown_085DB6B4
// extern ??? gUnknown_085DB8EC
// extern ??? gUnknown_085DB90C
// extern ??? gUnknown_085DBB70
// extern ??? gUnknown_085DBB90
// extern ??? gUnknown_085DBE00
// extern ??? gUnknown_085DBE20
// extern ??? gUnknown_085DC050
// extern ??? gUnknown_085DC244
// extern ??? gUnknown_085DC498
// extern ??? gUnknown_085DC6F8
// extern ??? gUnknown_085DC958
// extern ??? gUnknown_085DCA5C
// extern ??? gUnknown_085DCAF8
extern u16 gUnknown_085DCB10[];
extern u16 gUnknown_085DCC84[];
extern u32 gUnknown_085DD484[];
extern u32 gUnknown_085DD4B4[];
// extern ??? gUnknown_085DDC64
// extern ??? gUnknown_085DE964
extern u16 gUnknown_085DE984[];
extern u16 gUnknown_085DF224[];
extern u16 gUnknown_085DFA08[];
// extern ??? gUnknown_085DFA28
// extern ??? gUnknown_085DFA48
// extern ??? gUnknown_085DFA68
// extern ??? gUnknown_085E067C
// extern ??? gUnknown_085E12DC
extern u32 gUnknown_085E15F4[];
extern u32 gUnknown_085E163C[];
extern u32 gUnknown_085E1960[];
extern u32 gUnknown_085E19A8[];
extern u32 gUnknown_085E1C48[];
extern u32 gUnknown_085E1C58[];
extern u32 gUnknown_085E1EA4[];
extern u32 gUnknown_085E1EB4[];
// extern ??? gUnknown_085E2A24
// extern ??? gUnknown_085E35DC
// extern ??? gUnknown_085E420C
// extern ??? gUnknown_085E4E3C
// extern ??? gUnknown_085E5A78
// extern ??? gUnknown_085E5AE4
extern u16 gUnknown_085E7028[];
extern u16 gUnknown_085E8108[];
extern u16 gUnknown_085E8308[];
extern u16 gUnknown_085E87A8[];
extern u16 gUnknown_085E8C04[];
extern u16 gUnknown_085E8CC4[];
extern u16 gUnknown_085E8CE4[];
extern u16 gUnknown_085E8D88[];
extern u16 gUnknown_085E9150[];
extern u32 gUnknown_085EAB58[];
extern u32 gUnknown_085EAC5C[];
extern u32 gUnknown_085EAC84[];
extern u32 gUnknown_085EBDF8[];
extern u32 gUnknown_085EBEFC[];
extern u32 gUnknown_085EBF24[];
extern u32 gUnknown_085ED0C8[];
extern u32 gUnknown_085ED1CC[];
extern u32 gUnknown_085ED1F4[];
extern u32 gUnknown_085EE398[];
extern u32 gUnknown_085EE49C[];
extern u32 gUnknown_085EE4C4[];
extern u16 gUnknown_085EE4F8[];
extern u16 gUnknown_085EF24C[];
extern u16 gUnknown_085F0190[];
extern u16 gUnknown_085F0E04[];
extern u16 gUnknown_085F11B0[];
extern u16 gUnknown_085F1620[];
extern u16 gUnknown_085F1640[];
extern u16 gUnknown_085F1660[];
extern u32 gUnknown_085F1710[];
extern u32 gUnknown_085F17B4[];
extern u32 gUnknown_085F1858[];
extern u32 gUnknown_085F18FC[];
extern u32 gUnknown_085F19A0[];
extern u32 gUnknown_085F1A44[];
extern u32 gUnknown_085F1BD8[];
extern u32 gUnknown_085F1D6C[];
extern u32 gUnknown_085F1F18[];
extern u32 gUnknown_085F20C4[];
extern u32 gUnknown_085F2270[];
extern u32 gUnknown_085F2418[];
extern u32 gUnknown_085F24F4[];
extern u32 gUnknown_085F25D8[];
extern u32 gUnknown_085F26E0[];
extern u32 gUnknown_085F27E4[];
extern u32 gUnknown_085F29C0[];
extern u32 gUnknown_085F2C3C[];
extern u32 gUnknown_085F2D44[];
extern u32 gUnknown_085F2DAC[];
extern u16 gUnknown_085F2DC0[];
extern u16 gUnknown_085F367C[];
extern u16 gUnknown_085F3AA8[];
extern u16 gUnknown_085F3F40[];
extern u32 gUnknown_085F4A24[];
extern u32 gUnknown_085F5550[];
extern u16 gUnknown_085F5638[];
extern u16 gUnknown_085F6230[];
extern u16 gUnknown_085F7768[];
extern u16 gUnknown_085F7D64[];
extern u32 gUnknown_085F80B4[];
extern u32 gUnknown_085F80E0[];
extern u32 gUnknown_085F843C[];
extern u32 gUnknown_085F8468[];
extern u16 gUnknown_0860108C[];
extern u16 gUnknown_08602B94[];
extern u16 gUnknown_08603B50[];
extern u16 gUnknown_08603D50[];
extern u16 gUnknown_08603F98[];
extern u16 gUnknown_08604210[];
extern u32 gUnknown_08604FD4[];
extern u32 gUnknown_08605DF4[];
// extern ??? gUnknown_08608838
// extern ??? gUnknown_0860A5D4
// extern ??? gUnknown_086101DC
// extern ??? gUnknown_08617F04
// extern ??? gUnknown_08618BBC
// extern ??? gUnknown_0861ACB8
// extern ??? gUnknown_0861AD24
// extern ??? gUnknown_0861AD84
// extern ??? gUnknown_0861AD8C
// extern ??? gUnknown_08621960
// extern ??? gUnknown_08622F2C
// extern ??? gUnknown_086234D8
// extern ??? gUnknown_08623A9C
// extern ??? gUnknown_08625094
// extern ??? gUnknown_08625148
// extern ??? gUnknown_086267D8
// extern ??? gUnknown_0862688C
// extern ??? gUnknown_0862A2D0
// extern ??? gUnknown_0862A2F0
// extern ??? gUnknown_0862C82C
// extern ??? gUnknown_0862CC2C
// extern ??? gUnknown_0862D06C
// extern ??? gUnknown_0862D424
// extern ??? gUnknown_0862D6A8
// extern ??? gUnknown_0862D6E0
// extern ??? gUnknown_0862D82C
// extern ??? gUnknown_0862DC24
// extern ??? gUnknown_0862DC58
// extern ??? gUnknown_0862DCE0
// extern ??? gUnknown_08636640
// extern ??? gUnknown_08641D64
// extern ??? gUnknown_08641D84
// extern ??? gUnknown_08645DD8
// extern ??? gUnknown_08645F44
// extern ??? gUnknown_08646510
// extern ??? gUnknown_0864E790
// extern ??? gUnknown_0864E7B0
// extern ??? gUnknown_086508DC
// extern ??? gUnknown_08650DA8
// extern ??? gUnknown_08651240
// extern ??? gUnknown_0865163C
// extern ??? gUnknown_086517DC
// extern ??? gUnknown_08651AE4
// extern ??? gUnknown_08651DE0
// extern ??? gUnknown_08651DF4
// extern ??? gUnknown_08652554
// extern ??? gUnknown_08652734
// extern ??? gUnknown_086568F4
// extern ??? gUnknown_08656914
// extern ??? gUnknown_0865AF3C
// extern ??? gUnknown_0865BAB8
// extern ??? gUnknown_0865BAD8
// extern ??? gUnknown_0865C77C
// extern ??? gUnknown_0865C7A8
// extern ??? gUnknown_0865C7D4
// extern ??? gUnknown_0866EFF0
// extern ??? gUnknown_0866F2B4
// extern ??? gUnknown_0866F58C
// extern ??? gUnknown_0866F5E4
// extern ??? gUnknown_0866F774
// extern ??? gUnknown_086700D4
// extern ??? gUnknown_086702D4
// extern ??? gUnknown_08670528
// extern ??? gUnknown_08670548
// extern ??? gUnknown_08670D40
// extern ??? gUnknown_086716A0
// extern ??? gUnknown_08672000
// extern ??? gUnknown_08672220
// extern ??? gUnknown_08675114
// extern ??? gUnknown_086751A4
// extern ??? gUnknown_086766C0
// extern ??? gUnknown_08676734
// extern ??? gUnknown_08677CC0
// extern ??? gUnknown_08677D34
// extern ??? gUnknown_08678720
// extern ??? gUnknown_08678920
// extern ??? gUnknown_08678B20
// extern ??? gUnknown_0867B5A4
// extern ??? gUnknown_0867EE04
// extern ??? gUnknown_0867EEB4
// extern ??? gUnknown_086808A0
// extern ??? gUnknown_08680DC0
// extern ??? gUnknown_08680FFC
// extern ??? gUnknown_086810B8
// extern ??? gUnknown_08684908
// extern ??? gUnknown_086849B8
// extern ??? gUnknown_08684AB8
// extern ??? gUnknown_086852D8
// extern ??? gUnknown_086861A4
// extern ??? gUnknown_08686F84
// extern ??? gUnknown_0868716C
// extern ??? gUnknown_0868718C
// extern ??? gUnknown_0868C168
// extern ??? gUnknown_0868C2E8
// extern ??? gUnknown_0868C338
// extern ??? gUnknown_0868C358
// extern ??? gUnknown_0868C7F0
// extern ??? gUnknown_0868CC10
// extern ??? gUnknown_0868D2B4
// extern ??? gUnknown_0868D2C8
// extern ??? gUnknown_0868D2DC
// extern ??? gUnknown_0868D2F0
// extern ??? gUnknown_0868D304
// extern ??? gUnknown_0868D678
// extern ??? gUnknown_0868D684
// extern ??? gUnknown_0868D690
// extern ??? gUnknown_0868D69C
// extern ??? gUnknown_0868D6A8
// extern ??? gUnknown_0868D6D0
// extern ??? gUnknown_0868DF5C
// extern ??? gUnknown_0868E46C
// extern ??? gUnknown_08692524
// extern ??? gUnknown_08692674
// extern ??? gUnknown_086926E0
// extern ??? gUnknown_08692B10
// extern ??? gUnknown_086937C0
// extern ??? gUnknown_086945C4
// extern ??? gUnknown_08695B10
// extern ??? gUnknown_08696840
// extern ??? gUnknown_086A06A8
// extern ??? gUnknown_086A1CE0
// extern ??? gUnknown_086A21F4
// extern ??? gUnknown_086A2614
// extern ??? gUnknown_086A2724
// extern ??? gUnknown_086A273C
// extern ??? gUnknown_086A2844
// extern ??? gUnknown_086A285C
// extern ??? gUnknown_086A2874
// extern ??? gUnknown_086A2CE8
// extern ??? gUnknown_086A2DBC
// extern ??? gUnknown_086A2DD0
// extern ??? gUnknown_086A2E98
// extern ??? gUnknown_086A2EAC
// extern ??? gUnknown_086A66D8
// extern ??? gUnknown_086B52CC
// extern ??? gUnknown_086B5580
// extern ??? gUnknown_086B58DC
// extern ??? gUnknown_086B5974
// extern ??? gUnknown_086B5984
// extern ??? gUnknown_086B598C
// extern ??? gUnknown_086B5A2C
// extern ??? gUnknown_086B5A4C
// extern ??? gUnknown_086B5EAC
// extern ??? gUnknown_086BC824
// extern ??? gUnknown_086BD260
// extern ??? gUnknown_086BD76C
// extern ??? gUnknown_086BDA5C
// extern ??? gUnknown_086C790C
// extern ??? gUnknown_086C792C
// extern ??? gUnknown_086C794C
// extern ??? gUnknown_086C90A4
// extern ??? gUnknown_086C93FC
// extern ??? gUnknown_086C95C0
// extern ??? gUnknown_086C978C
// extern ??? gUnknown_086D8A94
// extern ??? gUnknown_086D9C40
// extern ??? gUnknown_086DA33C
// extern ??? gUnknown_086DA920
// extern ??? gUnknown_086E7EB0
// extern ??? gUnknown_086E91B8
// extern ??? gUnknown_086E9D40
// extern ??? gUnknown_086EA3EC
// extern ??? gUnknown_086EAE14
// extern ??? gUnknown_086EAE24
// extern ??? gUnknown_086FDA44
// extern ??? gUnknown_086FE938
// extern ??? gUnknown_086FF3A4
// extern ??? gUnknown_086FF5EC
// extern ??? gUnknown_086FFD3C
// extern ??? gUnknown_087013A0
// extern ??? gUnknown_087197E4
// extern ??? gUnknown_08720D84
// extern ??? gUnknown_08723208
// extern ??? gUnknown_08724424
// extern ??? gUnknown_087246D8
// extern ??? gUnknown_08725AD0
// extern ??? gUnknown_08725AF0
// extern ??? gUnknown_08725DAC
// extern ??? gUnknown_08725DCC
// extern ??? gUnknown_08726FF4
// extern ??? gUnknown_087270B4
// extern ??? gUnknown_08727510
// extern ??? gUnknown_0872796C
// extern ??? gUnknown_08727C48
// extern ??? gUnknown_0872865C
// extern ??? gUnknown_08728920
// extern ??? gUnknown_08728C04
// extern ??? gUnknown_08728C5C
// extern ??? gUnknown_0872972C
// extern ??? gUnknown_0872987C
// extern ??? gUnknown_08729FDC
// extern ??? gUnknown_0872A1BC
// extern ??? gUnknown_0872CE60
// extern ??? gUnknown_0872DA04
// extern ??? gUnknown_0872DE04
// extern ??? gUnknown_0872DFEC
// extern ??? gUnknown_0872E024
// extern ??? gUnknown_0872E24C
// extern ??? gUnknown_0872E25C
// extern ??? gUnknown_0872E64C
// extern ??? gUnknown_0872E7EC
extern u16 gUnknown_0872E998[];
// extern ??? gUnknown_0872FA04
// extern ??? gUnknown_0872FA84
// extern ??? gUnknown_0872FEB8
// extern ??? gUnknown_087302A4
// extern ??? gUnknown_08730324
// extern ??? gUnknown_08730780
// extern ??? gUnknown_087312BC
// extern ??? gUnknown_08731348
// extern ??? gUnknown_087313C8
// extern ??? gUnknown_08732228
// extern ??? gUnknown_08732368
// extern ??? gUnknown_087327C4
// extern ??? gUnknown_0873313C
// extern ??? gUnknown_0874394C
extern u32 gUnknown_087456E8[];
extern u32 gUnknown_08746508[];
extern u32 gUnknown_0874670C[];
// extern ??? gUnknown_08750268
// extern ??? gUnknown_08751808
// extern ??? gUnknown_08751DB4
// extern ??? gUnknown_08752020
// extern ??? gUnknown_08754870
// extern ??? gUnknown_08755FD4
// extern ??? gUnknown_08758134
extern u16 gUnknown_08758218[];
extern u32 gUnknown_087584B8[];
extern u32 gUnknown_087585DC[];
// extern ??? gEkrDracoZombiTsaSetLut
extern struct ProcCmd ProcScr_EkrDracoZombie[];
extern struct ProcCmd ProcScr_ekrDragonQuake[];
extern struct ProcCmd ProcScr_ekrWhiteINOUT[];
// extern ??? gUnknown_08758720
// extern ??? gUnknown_08758740
// extern ??? ProcScr_EkrMyrrh
extern struct ProcCmd ProcScr_EkrMyrrh[];
extern short gUnknown_0875879C[];
// extern ??? gUnknown_08758A1C
extern struct ProcCmd ProcScr_ekrsubAnimeEmulator[];
extern struct ProcCmd ProcScr_efxSoundSE[];
// extern ??? gUnknown_08758A60
// extern ??? gUnknown_08758D20
// extern ??? gUnknown_08758D3C
// extern ??? gUnknown_08758D58
// extern ??? gUnknown_08758D74
// extern ??? gUnknown_08758E00
// extern ??? gUnknown_08758E8C
// extern ??? gUnknown_08758F18
// extern ??? gUnknown_08758FA4
// extern ??? ProcScr_efxClasschg
// extern ??? ProcScr_efxClasschgBG
// extern ??? gUnknown_08759000
// extern ??? gUnknown_08759094
// extern ??? gUnknown_08759128
// extern ??? ProcScr_efxClasschgBGSE00
// extern ??? ProcScr_efxClasschgBGSE01
// extern ??? ProcScr_efxClasschgOBJGain
// extern ??? ProcScr_efxClasschgOBJDrop
// extern ??? ProcScr_efxClasschgOBJDiffusion
// extern ??? ProcScr_efxClasschgFIN
// extern ??? ProcScr_efxClasschgCLONE
// extern ??? ProcScr_efxBlackInOutUnit
// extern ??? ProcScr_efxWhiteInOutUnit
// extern ??? ProcScr_efxClasschgRST
extern struct FaceVramEntry gUnknown_087592CC[4];
// extern ??? EkrLvupMsgsStr
// extern ??? EkrLvupMsgsMag
// extern ??? ProcScr_EkrLevelup
// extern ??? ProcScr_EfxPartsofScroll
// extern ??? ProcScr_EfxPartsofScroll2
// extern ??? gUnknown_0875941C
// extern ??? ProcScr_Efxleveluphb
// extern ??? ProcScr_Efxlvupbg
// extern ??? gUnknown_0875949C
// extern ??? gUnknown_087594C8
// extern ??? ProcScr_efxLvupBG2
// extern ??? gUnknown_0875950C
// extern ??? ProcScr_efxLvupOBJ2
// extern ??? ProcScr_efxLvupBGCOL
// extern ??? ProcScr_EkrLvupApfx
// extern ??? ProcScr_eobjLvup

// extern ??? gUnknown_08759B34
// extern ??? gUnknown_08759E68
// extern ??? gUnknown_08759F00
// extern ??? gUnknown_08759F90
// extern ??? gUnknown_0875A020
// extern ??? gUnknown_0875A0AC
// extern ??? gUnknown_0875A19C
// extern ??? gUnknown_0875A314
// extern ??? gUnknown_0875A468
// extern ??? gUnknown_0875A730
extern u16 *gBattleBGDataTable[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup2[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[];

extern u16 gUnknown_08801C14[];
extern u16 Img_EfxLeftNameBox[];
extern u16 Img_EfxLeftItemBox[];
extern u16 Img_EfxRightNameBox[];
extern u16 Img_EfxRightItemBox[];
extern u8 gUnknown_0880210C[];
extern u8 gUnknown_088021C0[];
extern u8 gUnknown_08802274[];
extern u8 gUnknown_08802348[];
extern u8 gUnknown_08802428[];
extern u8 gUnknown_08802508[];
extern u16 gUnknown_08802558[];
extern u16 Img_EfxSideHitDmgCrit[];
extern u16 Img_EfxWTAArrow1[];
extern u16 Img_EfxWTAArrow2[];
extern u16 gUnknown_088026E4[];
extern u16 gUnknown_08802884[];
extern u16 gUnknown_08802904[];
extern u16 gUnknown_08802B04[];
// extern ??? gUnknown_08802B84
// extern ??? gUnknown_08802BC4
extern u16 gUnknown_08802C84[];
extern u16 gUnknown_08802D24[];
extern u8 gUnknown_08802D44[];
extern u16 gUnknown_088030C4[];
extern u16 gUnknown_088033C4[];
extern u16 gUnknown_08803524[];
extern u16 gUnknown_08803590[];
extern u16 Img_LevelUpBoxFrame[];
extern u16 Tsa_LevelUpBoxFrame[];
extern u16 Pal_LevelUpBoxFrame[];
extern u16 gUnknown_08803B30[];
extern u16 gUnknown_08803BD0[];
extern u16 gUnknown_08803CB0[];
extern u16 gUnknown_08803CD0[];
// extern ??? gCharacterData
extern const s8 gUnknown_0880B90C[]; // terrainId to ? lookup
extern const s8 gUnknown_0880BB96[]; // Unit drop movement cost table
extern const s8 gUnknown_0880BC18[]; // Ballista mov cost table
extern const s8 gUnknown_0880C479[]; // terrainId to ? lookup
extern const s8 gUnknown_0880C4BA[]; // terrainId to ? lookup
extern const s8 gUnknown_0880C744[]; // terrainid-to-healamount lookup
extern const s8 gUnknown_0880C785[]; // terrainid-to-something lookup
// extern ??? gUnknown_0880C7C6
// extern ??? gUnknown_0880C807
// extern ??? gUnknown_0880C848
// extern ??? gUnknown_0880C889
// extern ??? gUnknown_0880C8CA
// extern ??? gUnknown_0880C90B
// extern ??? gUnknown_0880C94C
// extern ??? gUnknown_0880C98D
// extern ??? gUnknown_0880C9CE
// extern ??? gUnknown_0880CA0F
// extern ??? gUnknown_0880CA50
// extern ??? gUnknown_0880CA91
// extern ??? gUnknown_0880CAD2
// extern ??? gUnknown_0880CB13
// extern ??? gUnknown_0880CB54
// extern ??? gUnknown_0880CB95
// extern ??? gUnknown_0880CBD6
// extern ??? gUnknown_0880CC17
// extern ??? gUnknown_0880CC58
// extern ??? gUnknown_0880CC99
// extern ??? gUnknown_0880CCDA
// extern ??? gUnknown_0880CD1B
// extern ??? gUnknown_0880CD5C
// extern ??? gUnknown_0880CD9D
// extern ??? gUnknown_0880CDDE
// extern ??? gUnknown_0880CE1F
// extern ??? gUnknown_0880CE60
// extern ??? gUnknown_0880CEA1
// extern ??? gUnknown_0880CEE2
// extern ??? gUnknown_0880CF23
// extern ??? gUnknown_0880CF64
// extern ??? gUnknown_0880CFA5
// extern ??? gUnknown_0880CFE6
// extern ??? gUnknown_0880D027
// extern ??? gUnknown_0880D068
// extern ??? gUnknown_0880D0A9
// extern ??? gUnknown_0880D0EA
// extern ??? gUnknown_0880D12B
// extern ??? gUnknown_0880D16C
// extern ??? gUnknown_0880D1AD
// extern ??? gUnknown_0880D1EE
// extern ??? gUnknown_0880D22F
extern u16 CONST_DATA gUnknown_0880D374[]; // terrainid-to-textid lookup
// extern ??? gUnknown_088ACBC4
extern u8 CONST_DATA gUnknown_088ADEF1[]; // Some bow effectiveness list
extern u8 CONST_DATA gUnknown_088ADF2A[]; // Some bow effectiveness list
extern u8 CONST_DATA gUnknown_088ADF39[]; // Slayer effectiveness list
extern u8 CONST_DATA gItemUseJidList_HeroCrest[]; // Hero Crest class list
extern u8 CONST_DATA gItemUseJidList_KnightCrest[]; // Knight Crest class list
extern u8 CONST_DATA gItemUseJidList_OrionsBlot[]; // Orion's Bolt class list
extern u8 CONST_DATA gItemUseJidList_ElysianWhip[]; // Elysian Whip class list
extern u8 CONST_DATA gItemUseJidList_GuidRing[]; // Guiding ring class list
extern u8 CONST_DATA gItemUseJidList_MasterSeal[]; // Master seal class list
extern u8 CONST_DATA gItemUseJidList_HeavenSeal[]; // Heaven seal class list
extern u8 CONST_DATA gItemUseJidList_OceanSeal[]; // Ocean seal class list
extern u8 CONST_DATA gItemUseJidList_C1[]; // Unk (C1) class list
extern u8 CONST_DATA gItemUseJidList_LunarBrace[]; // Lunar Brace class list
extern u8 CONST_DATA gItemUseJidList_SolarBrace[]; // Solar Brace class list
// extern ??? gSupportData
// extern ??? gUnknown_088AEEC4
// extern ??? gUnknown_088AF834
// extern ??? gUnknown_088AF880
// extern ??? gUnknown_088AFB5A
// extern ??? gSpellAssocData
// extern ??? gUnknown_088B39EC
// extern ??? gUnknown_088B3AD8
// extern ??? gUnknown_088D2058
// extern ??? gConvoBackgroundData
extern u8 CONST_DATA gPromoJidLut[][2];
extern u8 gUnknown_0895E0A4[];
extern u8 gUnknown_0895EEA4[];
extern u8 gUnknown_0895F5A4[4][2];
// extern ??? gUnknown_0895F5A5
extern u16 CONST_DATA gUnknown_089A18D4[];      /* a palatte */
extern u16 CONST_DATA gUnknown_089A18F4[];      /* a image */
extern u16 CONST_DATA gUnknown_089A1E70[];      /* a image */
extern u16 CONST_DATA gUnknown_089A230C[];      /* a palatte */
extern u16 CONST_DATA gUnknown_089A232C[];      /* a palatte */
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
// extern ??? gUnknown_089A2DB0
#define gMMSDataTable unit_icon_move_table
extern CONST_DATA struct MMSData gMMSDataTable[]; // Moving Map Sprite Table
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
extern CONST_DATA struct ProcCmd gUnknown_089A398C[];
// extern ??? gUnknown_089A39C4
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
// extern ??? gUnknown_089A4034
// extern ??? gUnknown_089A404C
// extern ??? gUnknown_089A4064
// extern ??? gUnknown_089A407C
// extern ??? gUnknown_089A40AC
// extern ??? gUnknown_089A40B0
// extern ??? gUnknown_089A419C
// extern ??? gUnknown_089A42BC
// extern ??? gUnknown_089A434C
// extern ??? gUnknown_089A4394
// extern ??? gUnknown_089A43D4
// extern ??? gUnknown_089A43D8
// extern ??? gUnknown_089A4434
// extern ??? gUnknown_089A448C
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
extern CONST_DATA struct ProcCmd gUnknown_089A5054[];
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
// extern ??? gUnknown_089AE7A4
// extern ??? gUnknown_089AE7C4
// extern ??? gUnknown_089AE804
// extern ??? gUnknown_089AF310
// extern ??? gUnknown_089AF910
// extern ??? gUnknown_089AF930
// extern ??? gUnknown_089AF950
// extern ??? gUnknown_089AFAC4
// extern ??? gUnknown_089AFCBC
// extern ??? gUnknown_089AFF78
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
// extern ??? gUnknown_089B7610
// extern ??? gUnknown_089B80C4
// extern ??? gUnknown_089E714C
// extern ??? gUnknown_089E7DEC
// extern ??? gUnknown_089E8238
// extern ??? gUnknown_089E84D4
// extern ??? gUnknown_089ED67C
// extern ??? gUnknown_089ED694
// extern ??? gUnknown_089ED6AC
extern struct ProcCmd gUnknown_089EDF78[];
extern struct ProcCmd gUnknown_089EDFD8[];
extern struct ProcCmd gUnknown_089EE000[];
extern struct ProcCmd gUnknown_089EE030[];
extern struct ProcCmd gUnknown_089EE048[];
extern struct ProcCmd gUnknown_089EE068[];
extern struct ProcCmd gUnknown_089EE088[];
extern const u16 gUnknown_089EE99C[];
extern u16 CONST_DATA *gUnknown_089EE9B0[];    /* images */
extern u16 CONST_DATA *gUnknown_089EE9C8[];    /* images */
extern struct ProcCmd gUnknown_089EE9E0[];
extern struct ProcCmd gUnknown_089EEA28[];
extern const struct MenuDef gUnknown_089F36A0;
// extern ??? gUnknown_089FF480
// extern ??? gEvent_SkirmishCommonBeginning
extern u16 gEvent_SkirmishCommonEnd[];
// extern ??? gEvent_8A0035C
// extern ??? gEvent_8A00364
// extern ??? gEvent_EirikaModeGameEnd
// extern ??? gEvent_EphraimModeGameEnd
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
// extern ??? gUnknown_08A01650
// extern ??? gUnknown_08A01678
// extern ??? gUnknown_08A01698
// extern ??? gUnknown_08A016C8
// extern ??? gUnknown_08A016D8
// extern ??? gProcScr_BoxDialogue
// extern ??? gUnknown_08A01740
// extern ??? gProcScr_BoxDialogueInterpreter
// extern ??? gUnknown_08A01800
// extern ??? gUnknown_08A01818
// extern ??? gUnknown_08A01D88
// extern ??? gUnknown_08A01DAE
// extern ??? gUnknown_08A01DBC
// extern ??? gUnknown_08A01E54
// extern ??? gUnknown_08A01E5C
// extern ??? gUnknown_08A01E64
// extern ??? gUnknown_08A01EC4
extern u16 CONST_DATA gUnknown_08A01EE4[]; // some face-related palette (if portrait)
extern u16 CONST_DATA gUnknown_08A01F04[]; // some face-related palette (if card)
extern u8  CONST_DATA gUnknown_08A01F24[]; // img?
extern u8  CONST_DATA gUnknown_08A020F0[]; // img?
extern u16 CONST_DATA gUnknown_08A021E4[]; // pal
extern u8  CONST_DATA gUnknown_08A02204[]; // tsa
extern u8  CONST_DATA gUnknown_08A02250[]; // tsa
extern u8  CONST_DATA gUnknown_08A02274[]; // img objects
extern u16 CONST_DATA gUnknown_08A027FC[][0x10]; // color animation for each page
// extern ??? gGfx_HelpTextBox
// extern ??? gGfx_HelpTextBox2
// extern ??? gGfx_HelpTextBox3
// extern ??? gGfx_HelpTextBox4
// extern ??? gGfx_HelpTextBox5
// extern ??? gGfx_YellowTextBox
// extern ??? gGfx_YellowTextBox2
// extern ??? gGfx_YellowTextBox3
// extern ??? gGfx_YellowTextBox4
// extern ??? gGfx_YellowTextBox5
extern u8 CONST_DATA gUnknown_08A02C34[];
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
// extern ??? gUnknown_08A177A0
// extern ??? gUnknown_08A178C0
// extern ??? gUnknown_08A17990
// extern ??? gUnknown_08A17A30
// extern ??? gUnknown_08A17B08
// extern ??? gUnknown_08A17B30
// extern ??? gUnknown_08A17B36
// extern ??? gUnknown_08A17B58
// extern ??? gUnknown_08A17B64
// extern ??? gUnknown_08A17B6C
// extern ??? gUnknown_08A17C20
// extern ??? gUnknown_08A17C48
// extern ??? gUnknown_08A17C4C

// extern ??? gSram
// extern ??? sSupportUnkLut
// extern ??? sArenaCpTeamNameLut
// extern ??? gpSramExtraData
// extern ??? gBgConfig_SaveMenu
// extern ??? gProcScr_08A20068
// extern ??? gProcScr_08A20098
// extern ??? ProcScr_SaveMenu
// extern ??? gProcScr_SaveMenu2
// extern ??? gUnknown_08A204B8
// extern ??? gUnknown_08A204BC
// extern ??? gUnknown_08A2051C
// extern ??? gUnknown_08A20536
// extern ??? gUnknown_08A20570
// extern ??? gUnknown_08A20578
// extern ??? gUnknown_08A20580
// extern ??? gUnknown_08A20588
// extern ??? gUnknown_08A20590
// extern ??? gUnknown_08A20650
// extern ??? gUnknown_08A2067C
// extern ??? ProcScr_savedraw
// extern ??? gProcScr_SaveDrawCursor
// extern ??? gProcScr_08A206F8
// extern ??? gUnknown_08A20720
// extern ??? gProcScr_SqMask
// extern ??? gProcScr_SaveBgUp
// extern ??? gUnknown_08A2099C
// extern ??? gUnknown_08A209B8
extern u16* gUnknown_08A209E4[];
extern u16* gUnknown_08A209F0[];
// extern ??? gUnknown_08A209FC
// extern ??? gUnknown_08A20A08
// extern ??? ProcScr_NewGameDiffilcultySelect
// extern ??? gUnknown_08A20A98
// extern ??? gUnknown_08A20AA0
// extern ??? gUnknown_08A20AAE
// extern ??? gUnknown_08A20AC2
// extern ??? gUnknown_08A20B08
// extern ??? gUnknown_08A20B14
// extern ??? gUnknown_08A20B1C
// extern ??? gUnknown_08A20B3C
// extern ??? gUnknown_08A20B44
// extern ??? gUnknown_08A20B4C
// extern ??? gUnknown_08A20B7C
// extern ??? gUnknown_08A20B8A
// extern ??? gUnknown_08A20B94
// extern ??? ProcScr_ParallelFiniteLoop
// extern ??? gUnknown_08A20BD4
// extern ??? ProcScr_ParallelWorker
// extern ??? ProcScr_SysHandCtrlMaybe
// extern ??? gUnknown_08A20C4C
// extern ??? gUnknown_08A20D6C
// extern ??? gUnknown_08A20D8C
extern struct ProcCmd CONST_DATA gUnknown_08A20DA4[];
extern struct ProcCmd CONST_DATA gUnknown_08A20DCC[];
// extern ??? gUnknown_08A20DFC
// extern ??? gUnknown_08A20E24
// extern ??? gUnknown_08A20E44
// extern ??? gSoundRoomTable
// extern ??? gUnknown_08A212D4
// extern ??? gUnknown_08A212D8
// extern ??? gUnknown_08A212DC
// extern ??? gUnknown_08A212E0
// extern ??? gUnknown_08A212E4
// extern ??? gUnknown_08A21304
// extern ??? gUnknown_08A21308
// extern ??? gProcScr_SoundRoomUi
// extern ??? gUnknown_08A21440
// extern ??? gUnknown_08A2144E
// extern ??? gUnknown_08A2145C
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
// extern ??? gUnknown_08A28088
// extern ??? gUnknown_08A280A8
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
// extern ??? gUnknown_08A2C23C
// extern ??? gUnknown_08A2C4C8
// extern ??? gUnknown_08A2C5A8
// extern ??? gUnknown_08A2C7A4
// extern ??? gUnknown_08A2C838
// extern ??? gUnknown_08A2C8A8
// extern ??? gUnknown_08A2C908
// extern ??? gUnknown_08A2C92C
// extern ??? gUnknown_08A2CABC
// extern ??? gUnknown_08A2D2CC
extern u8 gUnknown_08A2D32C[]; // Gfx
extern u16 gUnknown_08A2E1B8[]; // Pal
extern u8 gUnknown_08A2E1F8[]; // Gfx
extern u8 gUnknown_08A2E214[]; // Gfx
extern u16 gUnknown_08A2E4A4[]; // Pal
extern u8 gUnknown_08A2E4C4[]; // TSA
extern u8 gUnknown_08A2E5EC[]; // Gfx
extern u16 gUnknown_08A2E8F0[]; // Pal
// extern ??? gUnknown_08A2E950
// extern ??? gUnknown_08A2EE90
// extern ??? gUnknown_08A2EEC0
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
// extern ??? gProcScr_WorldMapFaceHolder
// extern ??? gProcScr_WorldMapFaceCtrl
// extern ??? gUnknown_08A3D728
// extern ??? gUnknown_08A3D748
// extern ??? gUnknown_08A3DD08
// extern ??? gUnknown_08A3DD20
// extern ??? gUnknown_08A3DD38
// extern ??? gUnknown_08A3DD88
// extern ??? gUnknown_08A3DDF4
// extern ??? gUnknown_08A3DE84
// extern ??? gUnknown_08A3DECC
// extern ??? gUnknown_08A3DEFC
// extern ??? gUnknown_08A3DF2C
// extern ??? gUnknown_08A3DF64
// extern ??? gUnknown_08A3DF94
// extern ??? gUnknown_08A3DFC4
// extern ??? gUnknown_08A3E124
// extern ??? gUnknown_08A3E148
// extern ??? gUnknown_08A3E200
// extern ??? gUnknown_08A3E224
// extern ??? gUnknown_08A3E228
// extern ??? gUnknown_08A3E22C
// extern ??? gUnknown_08A3E23C
// extern ??? gUnknown_08A3E248
// extern ??? gUnknown_08A3E2C0
// extern ??? gUnknown_08A3E2F0
// extern ??? gUnknown_08A3E2F8
// extern ??? gUnknown_08A3E31C
// extern ??? gUnknown_08A3E360
// extern ??? gUnknown_08A3E38E
// extern ??? gUnknown_08A3E3BA
// extern ??? gUnknown_08A3E412
// extern ??? gUnknown_08A3E448
// extern ??? gUnknown_08A3E458
// extern ??? gUnknown_08A3E45B
// extern ??? gUnknown_08A3E45E
// extern ??? gUnknown_08A3E461
// extern ??? gUnknown_08A3E464
// extern ??? gUnknown_08A3E4D4
// extern ??? gUnknown_08A3E4F4
// extern ??? gUnknown_08A3E52C
// extern ??? gUnknown_08A3E55C
// extern ??? gUnknown_08A3E594
// extern ??? gUnknown_08A3E5E4
// extern ??? gUnknown_08A3E624
// extern ??? gUnknown_08A3E6AC
// extern ??? gUnknown_08A3E6E4
// extern ??? gUnknown_08A3E78C
// extern ??? gUnknown_08A3E888
// extern ??? gUnknown_08A3E8B8
// extern ??? gUnknown_08A3E9A0
// extern ??? gUnknown_08A3EA00
// extern ??? gUnknown_08A3EA38
// extern ??? gUnknown_08A3EA70
// extern ??? gUnknown_08A3EAA8
// extern ??? gUnknown_08A3EAF0
// extern ??? gUnknown_08A3EB10
// extern ??? gUnknown_08A3EB50
// extern ??? gUnknown_08A3EBE8
// extern ??? gUnknown_08A3EC48
// extern ??? gUnknown_08A3ECB0
// extern ??? gUnknown_08A3ED10
// extern ??? gUnknown_08A3ED18
// extern ??? gUnknown_08A3ED60
// extern ??? gUnknown_08A3EE28
// extern ??? gUnknown_08A3EE44
// extern ??? gUnknown_08A3EE6C
// extern ??? gUnknown_08A3EE70
// extern ??? gUnknown_08A3EE74
// extern ??? gUnknown_08A3EED4
// extern ??? gUnknown_08A3EEEC
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
// extern ??? gUnknown_08A40FC8
// extern ??? gUnknown_08A4CF2C
// extern ??? gUnknown_08A4D0CC
// extern ??? gUnknown_08A83364
// extern ??? gUnknown_08A95F64
// extern ??? gUnknown_08A95FE4
// extern ??? gUnknown_08A96064
// extern ??? gUnknown_08A96308
// extern ??? gUnknown_08A97410
// extern ??? gUnknown_08A97A40
// extern ??? gUnknown_08A97A60
// extern ??? gUnknown_08A97A80
// extern ??? gUnknown_08A97ACC
// extern ??? gUnknown_08A97AEC
// extern ??? gUnknown_08A97C98
// extern ??? gUnknown_08A97E28
// extern ??? gUnknown_08A97E48
// extern ??? gUnknown_08A97ED8
// extern ??? gUnknown_08A97FA4
// extern ??? gUnknown_08A986C0
// extern ??? gUnknown_08A98BF8
// extern ??? gUnknown_08A98CFC
// extern ??? gUnknown_08A98D58
// extern ??? gUnknown_08A98D88
// extern ??? gUnknown_08A98DA0
// extern ??? gUnknown_08A98DB8
// extern ??? gUnknown_08A98DCC
// extern ??? gUnknown_08A98E2C
// extern ??? gUnknown_08A98E4C
// extern ??? gUnknown_08A98E6C
// extern ??? gUnknown_08A98E8C
// extern ??? gUnknown_08A98EAC
// extern ??? gUnknown_08A98F30
// extern ??? gUnknown_08A9901C
// extern ??? gUnknown_08A99120
// extern ??? gUnknown_08A99140
// extern ??? gUnknown_08A9DF74
// extern ??? gUnknown_08A9E4C4
// extern ??? gUnknown_08A9E544
// extern ??? gUnknown_08A9E5BC
// extern ??? gUnknown_08A9E5DC
// extern ??? gUnknown_08A9E688
// extern ??? gUnknown_08AA114C
// extern ??? gUnknown_08AA1190
// extern ??? gUnknown_08AA11B0
// extern ??? gUnknown_08AA11D0
// extern ??? gUnknown_08AA1280
// extern ??? gUnknown_08AA188C
// extern ??? gUnknown_08AA18AC
// extern ??? gUnknown_08AA1930
// extern ??? gUnknown_08AA1950
// extern ??? gUnknown_08AA1970
// extern ??? gUnknown_08AA1C70
// extern ??? gUnknown_08AA2044
// extern ??? gUnknown_08AA2084
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
// extern ??? gUnknown_08AA6BFA
// extern ??? gUnknown_08AA6C0E
// extern ??? gUnknown_08AA6C22
// extern ??? gUnknown_08AA6C36
// extern ??? gUnknown_08AA6C4A
// extern ??? gUnknown_08AA6C58
// extern ??? gUnknown_08AA6C66
// extern ??? gUnknown_08AA6C74
// extern ??? gUnknown_08AA6C82
// extern ??? gUnknown_08AA6C8A
// extern ??? gUnknown_08AA6C92
// extern ??? gUnknown_08AA6C9A
// extern ??? gUnknown_08AA6CA4
// extern ??? gUnknown_08AA6CBC
// extern ??? gUnknown_08AA6CDC
// extern ??? gUnknown_08AA6D04
// extern ??? gUnknown_08AA6D14
// extern ??? gUnknown_08AA6EA4
// extern ??? gUnknown_08AA7034
// extern ??? gUnknown_08AA705C
// extern ??? gUnknown_08AA707C
// extern ??? gUnknown_08AA709C
// extern ??? gUnknown_08AA70BC
// extern ??? gUnknown_08AA70DC
// extern ??? gUnknown_08AA70EA
// extern ??? gUnknown_08AA7116
// extern ??? gUnknown_08AA712A
// extern ??? gUnknown_08AA715C
// extern ??? gUnknown_08AA7194
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
// extern ??? gUnknown_08AB21D8
// extern ??? gUnknown_08AB5D90
// extern ??? gUnknown_08AB630C
// extern ??? gUnknown_08AB632C
// extern ??? gUnknown_08AB7AC0
// extern ??? gUnknown_08AB7DB0
// extern ??? gUnknown_08AB7DD0
// extern ??? gUnknown_08AB87E0
// extern ??? gUnknown_08AB8CAC
// extern ??? gUnknown_08AB8CCC
// extern ??? gUnknown_08AB942C
// extern ??? gUnknown_08ABB14C
// extern ??? gUnknown_08ABC074
// extern ??? gUnknown_08ABC22C
// extern ??? gUnknown_08ABD174
// extern ??? gUnknown_08ABD348
// extern ??? gUnknown_08ABE120
// extern ??? gUnknown_08ABE304
// extern ??? gUnknown_08ABEF70
// extern ??? gUnknown_08ABF168
// extern ??? gUnknown_08AC0BD8
// extern ??? gUnknown_08AC1878
// extern ??? gUnknown_08AC1B98
// extern ??? gUnknown_08AC1C8C
// extern ??? gUnknown_08AC1DEC
// extern ??? gUnknown_08AC2B24
// extern ??? gUnknown_08AC2CB4
// extern ??? gUnknown_08AC3A2C
// extern ??? gUnknown_08AC3BC8
// extern ??? gUnknown_08AC4760
// extern ??? gUnknown_08AC4928
// extern ??? gUnknown_08AC5420
// extern ??? gUnknown_08AC5614
// extern ??? gUnknown_08AC7374
// extern ??? gUnknown_08AC8DDC
// extern ??? gUnknown_08AC91F8
// extern ??? gUnknown_08AC933C
// extern ??? gUnknown_08AC949C
// extern ??? gUnknown_08ACAF70
// extern ??? gUnknown_08ACBF58
// extern ??? gUnknown_08ACC340
// extern ??? gUnknown_08ACC3E0
// extern ??? gUnknown_08ACC540
// extern ??? gUnknown_08ACE0B8
// extern ??? gUnknown_08ACEED0
// extern ??? gUnknown_08ACF200
// extern ??? gUnknown_08ACF314
// extern ??? gUnknown_08ACF474
// extern ??? gUnknown_08AD1048
// extern ??? gUnknown_08AD206C
// extern ??? gUnknown_08AD236C
// extern ??? gUnknown_08AD24B4
// extern ??? gUnknown_08AD2614
// extern ??? gUnknown_08AD423C
// extern ??? gUnknown_08AD5094
// extern ??? gUnknown_08AD543C
// extern ??? gUnknown_08AD54DC
// extern ??? gUnknown_08AD563C
// extern ??? gUnknown_08AD72FC
// extern ??? gUnknown_08AD8518
// extern ??? gUnknown_08AD88D4
// extern ??? gUnknown_08AD89A8
// extern ??? gUnknown_08AD8B08
// extern ??? gUnknown_08ADA31C
// extern ??? gUnknown_08ADB804
// extern ??? gUnknown_08ADBC0C
// extern ??? gUnknown_08ADBD18
// extern ??? gUnknown_08ADBE78
// extern ??? gUnknown_08ADBE98
// extern ??? gUnknown_08ADC3C0
// extern ??? gUnknown_08ADC708
// extern ??? gUnknown_08ADC728
// extern ??? gUnknown_08ADCCB8
// extern ??? gUnknown_08ADD050
// extern ??? gUnknown_08ADD070
// extern ??? gUnknown_08ADD6EC
// extern ??? gUnknown_08ADDA54
// extern ??? gUnknown_08ADDA74
// extern ??? gUnknown_08ADE080
// extern ??? gUnknown_08ADE47C
// extern ??? gUnknown_08ADE49C
// extern ??? gUnknown_08ADEB1C
// extern ??? gUnknown_08ADEED4
// extern ??? gUnknown_08ADEEF4
// extern ??? gUnknown_08ADF58C
// extern ??? gUnknown_08ADFA08
// extern ??? gUnknown_08ADFA28
// extern ??? gUnknown_08AE00E4
// extern ??? gUnknown_08AE04D4
// extern ??? gUnknown_08AE04F4
// extern ??? gUnknown_08AE0A48
// extern ??? gUnknown_08AE0D74
// extern ??? gUnknown_08AE0D94
// extern ??? gUnknown_08AE12BC
// extern ??? gUnknown_08AE1634
// extern ??? gUnknown_08AE1654
// extern ??? gUnknown_08AE1D00
// extern ??? gUnknown_08AE20C4
// extern ??? gUnknown_08AE20E4
// extern ??? gUnknown_08AE281C
// extern ??? gUnknown_08AE2BF4
// extern ??? gUnknown_08AE2C14
// extern ??? gUnknown_08AE33D4
// extern ??? gUnknown_08AE3734
// extern ??? gUnknown_08AE3754
// extern ??? gUnknown_08AE3E54
// extern ??? gUnknown_08AE41E4
// extern ??? gUnknown_08AE4204
// extern ??? gUnknown_08AE4940
// extern ??? gUnknown_08AE4CE8
// extern ??? gUnknown_08AE4D08
// extern ??? gUnknown_08AE53C8
// extern ??? gUnknown_08AE5730
// extern ??? gUnknown_08AE5750
// extern ??? gUnknown_08AE5D54
// extern ??? gUnknown_08AE60B0
// extern ??? gUnknown_08AE60D0
// extern ??? gUnknown_08AE6648
// extern ??? gUnknown_08AE69EC
// extern ??? gUnknown_08AE6A0C
// extern ??? gUnknown_08AE6FA8
// extern ??? gUnknown_08AE72C8
// extern ??? gUnknown_08AE72E8
// extern ??? gUnknown_08AE78B0
// extern ??? gUnknown_08AE7C2C
// extern ??? gUnknown_08AE7C4C
// extern ??? gUnknown_08AE819C
// extern ??? gUnknown_08AE84BC
// extern ??? gUnknown_08AE84DC
// extern ??? gUnknown_08AE8AB8
// extern ??? gUnknown_08AE8D84
// extern ??? gUnknown_08AE8DA4
// extern ??? gUnknown_08AE9364
// extern ??? gUnknown_08AE9720
// extern ??? gUnknown_08AE9740
// extern ??? gUnknown_08AE9CA4
// extern ??? gUnknown_08AEA02C
// extern ??? gUnknown_08AEA04C
// extern ??? gUnknown_08AEA7A8
// extern ??? gUnknown_08AEAB50
// extern ??? gUnknown_08AEAB70
// extern ??? gUnknown_08AEB1B8
// extern ??? gUnknown_08AEB56C
// extern ??? gUnknown_08AEB58C
// extern ??? gUnknown_08AEBCEC
// extern ??? gUnknown_08AEC048
// extern ??? gUnknown_08AEC068
// extern ??? gUnknown_08AEC724
// extern ??? gUnknown_08AECAC0
// extern ??? gUnknown_08AECAE0
// extern ??? gUnknown_08AED0A4
// extern ??? gUnknown_08AED3E8
// extern ??? gUnknown_08AED408
// extern ??? gUnknown_08AED95C
// extern ??? gUnknown_08AEDC80
// extern ??? gUnknown_08AEDCA0
// extern ??? gUnknown_08AEE218
// extern ??? gUnknown_08AEE564
// extern ??? gUnknown_08AEE584
// extern ??? gUnknown_08AEEBB0
// extern ??? gUnknown_08AEEECC
// extern ??? gUnknown_08AEEEEC
// extern ??? gUnknown_08AEF580
// extern ??? gUnknown_08AEF880
// extern ??? gUnknown_08AEF8A0
// extern ??? gUnknown_08AEFDC8
// extern ??? gUnknown_08AF0130
// extern ??? gUnknown_08AF0150
// extern ??? gUnknown_08AF09E4
// extern ??? gUnknown_08AF0DE8
// extern ??? gUnknown_08AF0E08
// extern ??? gUnknown_08AF16CC
// extern ??? gUnknown_08AF1AC8
// extern ??? gUnknown_08AF1AE8
// extern ??? gUnknown_08AF1B18
// extern ??? gUnknown_08AF1B38
// extern ??? gUnknown_08AF1FB0
// extern ??? gUnknown_08AF1FD0
// extern ??? gUnknown_08AF2634
// extern ??? gUnknown_08AF2654
// extern ??? gUnknown_08AF310C
// extern ??? gUnknown_08AF312C
// extern ??? gUnknown_08AF404C
// extern ??? gUnknown_08AF4330
// extern ??? gUnknown_08AF47F0
// extern ??? gUnknown_08B103D8
// extern ??? gUnknown_08B104D8
// extern ??? gUnknown_08B10630
// extern ??? gUnknown_08B10ABC
// extern ??? gUnknown_08B10ADC
// extern ??? gUnknown_08B10CA4
// extern ??? gUnknown_08B11864
// extern ??? gUnknown_08B118C4
// extern ??? gUnknown_08B11C0C
// extern ??? gUnknown_08B11D0C
// extern ??? gUnknown_08B125F4
/* #include classchg.h */
// extern ??? gpBuf
// extern ??? gUnknown_08B12AA8
// extern ??? gUnknown_08B12AC2
// extern ??? gUnknown_08B12AD0
// extern ??? gUnknown_08B12AE0
// extern ??? gUnknown_08B12B04
// extern ??? gUnknown_08B12B1C
// extern ??? gUnknown_08B12B3C
// extern ??? gUnknown_08B12B9C
// extern ??? gUnknown_08B12BEC
// extern ??? gUnknown_08B12C14
// extern ??? gUnknown_08B12C3C
extern struct ProcCmd CONST_DATA ProcScr_E_Guide1[];
// extern ??? ProcScr_E_Guide2
extern u8 Img_CommGameBgScreen[];  // gfx
extern u16 gUnknown_08B1754C[]; // pal
extern u16 gUnknown_08B1756C[]; // pal, used in opsubtitle
// extern ??? gUnknown_08B176CC
// extern ??? gUnknown_08B177C0
// extern ??? gUnknown_08B17864
// extern ??? gUnknown_08B17B44
extern u8 gUnknown_08B17B64[]; // gfx?
extern u8 gUnknown_08B18D68[];
extern u16 gUnknown_08B18ED4[]; // pal
// extern ??? gUnknown_08B18F34
// extern ??? gUnknown_08B196D8
// extern ??? gUnknown_08B19854
// extern ??? gUnknown_08B19874
// extern ??? gUnknown_08B19DEC
// extern ??? gUnknown_08B19E0C
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
