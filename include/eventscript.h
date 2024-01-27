#pragma once

#include "event.h"
#include "eventinfo.h"

enum event_cmd_idx {
    EV_CMD_NOP              = 0x00,
    EV_CMD_END              = 0x01,
    EV_CMD_EVSET            = 0x02,
    EV_CMD_EVCHECK          = 0x03,
    EV_CMD_RANDOMNUMBER     = 0x04,
    EV_CMD_SVAL             = 0x05,
    EV_CMD_SLOT_OPS         = 0x06,
    EV_CMD_QUEUE_OPS        = 0x07,
    EV_CMD_LABEL            = 0x08,
    EV_CMD_GOTO             = 0x09,
    EV_CMD_CALL             = 0x0A,
    EV_CMD_ENQUEUE_CALL     = 0x0B,
    EV_CMD_BRANCH           = 0x0C,
    EV_CMD_ASMC             = 0x0D,
    EV_CMD_STALL            = 0x0E,
    EV_CMD_COUNTER          = 0x0F,
    EV_CMD_EVBITMODIFY      = 0x10,
    EV_CMD_IGNOREKEYS       = 0x11,
    EV_CMD_BGMCHANGE_12     = 0x12,
    EV_CMD_BGMCHANGE_13     = 0x13,
    EV_CMD_BGMOVERWRITE     = 0x14,
    EV_CMD_BGMVOLUMECHANGE  = 0x15,
    EV_CMD_PLAYSE           = 0x16,
    EV_CMD_FADE             = 0x17,
    EV_CMD_COLORFADE        = 0x18,
    EV_CMD_CHECKVARIOUS     = 0x19,
    EV_CMD_SETTEXTTYPE      = 0x1A,
    EV_CMD_DISPLAYTEXT      = 0x1B,
    EV_CMD_CONTINUETEXT     = 0x1C,
    EV_CMD_ENDTEXT          = 0x1D,
    EV_CMD_DISPLAYFACE      = 0x1E,
    EV_CMD_MOVEFACE         = 0x1F,
    EV_CMD_CLEARTEXTBOX     = 0x20,
    EV_CMD_SHOWBG           = 0x21,
    EV_CMD_CLEARSCREEN      = 0x22,
    EV_CMD_23               = 0x23,
    EV_CMD_24               = 0x24,
    EV_CMD_LOMA             = 0x25,
    EV_CMD_CAMERACONTROL    = 0x26,
    EV_CMD_TILE_CHANGE      = 0x27,
    EV_CMD_CHANGEWEATHER    = 0x28,
    EV_CMD_CHANGEFOGVISION  = 0x29,
    EV_CMD_CHANGECHAPTER    = 0x2A,
    EV_CMD_LOAD_PRECONF     = 0x2B,
    EV_CMD_LOADUNIT         = 0x2C,
    EV_CMD_CHANGE_PAL       = 0x2D,
    EV_CMD_GET_PID          = 0x2E,
    EV_CMD_MOVEUNIT         = 0x2F,
    EV_CMD_ENUN             = 0x30,
    EV_CMD_TOGGLERANGE      = 0x31,
    EV_CMD_LOADSINGLEUNIT   = 0x32,
    EV_CMD_CHECKSTATE       = 0x33,
    EV_CMD_CHANGESTATE      = 0x34,
    EV_CMD_CHANGECLASS      = 0x35,
    EV_CMD_CHECKINAREA      = 0x36,
    EV_CMD_GIVEITEM         = 0x37,
    EV_CMD_CHANGEACTIVEUNIT = 0x38,
    EV_CMD_CHANGEAI         = 0x39,
    EV_CMD_DISPLAYPOPUP     = 0x3A,
    EV_CMD_DISPLAYCURSOR    = 0x3B,
    EV_CMD_MOVE_CURSOR      = 0x3C,
    EV_CMD_MENUOVERRIDE     = 0x3D,
    EV_CMD_PREPSCREEN       = 0x3E,
    EV_CMD_SCRIPT_BATTLE    = 0x3F,
    EV_CMD_PROM             = 0x40,
    EV_CMD_WARP             = 0x41,
    EV_CMD_EARTHQUAKE       = 0x42,
    EV_CMD_SUMMONUNIT       = 0x43,
    EV_CMD_BREAKSTONE       = 0x44,
    EV_CMD_GLOWING_CROSS    = 0x45,

    /* WM events */
    EV_CMD_WM_80            = 0x80,
    EV_CMD_WM_81            = 0x81,
    EV_CMD_WM_82            = 0x82,
    EV_CMD_WM_SETCAM        = 0x83,
    EV_CMD_WM_84            = 0x84,
    EV_CMD_WM_CENTERCAMONLORD = 0x85,
    EV_CMD_WM_MOVECAM       = 0x86,
    EV_CMD_WM_MOVECAMTO     = 0x87,
    EV_CMD_WM_88            = 0x88,
    EV_CMD_WM_WAITFORCAM    = 0x89,
    EV_CMD_WM_8A            = 0x8A,
    EV_CMD_WM_8B            = 0x8B,
    EV_CMD_WM_8C            = 0x8C,
    EV_CMD_WM_8D            = 0x8D,
    EV_CMD_WM_8E            = 0x8E,
    EV_CMD_WM_8F            = 0x8F,
    EV_CMD_WM_DRAWPATH      = 0x90,
    EV_CMD_WM_DRAWPATH2     = 0x91,
    EV_CMD_WM_REMOVEPATH    = 0x92,
    EV_CMD_WM_LOADLOCATION2 = 0x93,
    EV_CMD_WM_REMOVELOCATION = 0x94,
    EV_CMD_WM_LOADLOCATION3 = 0x95,
    EV_CMD_DRAWPATH3        = 0x96,
    EV_CMD_WM_CREATENEXTDESTINATION = 0x97,
    EV_CMD_WM_98            = 0x98,
    EV_CMD_WM_WAITFORFX     = 0x99,
    EV_CMD_WM_SETDESTINATION = 0x9A,
    EV_CMD_WM_9B            = 0x9B,
    EV_CMD_WM_9C            = 0x9C,
    EV_CMD_WM_9D            = 0x9D,
    EV_CMD_PUTSPRITE        = 0x9E,
    EV_CMD_WM_9F            = 0x9F,
    EV_CMD_WM_REMSPRITE     = 0xA0,
    EV_CMD_WM_MAKELORDVISIBLE = 0xA1,
    EV_CMD_WM_MAKELORDDISAPPEAR = 0xA2,
    EV_CMD_WM_FADEINSPRITE  = 0xA3,
    EV_CMD_WM_FADEOUTSPRITE = 0xA4,
    EV_CMD_WM_WAITFORSPRITELOAD = 0xA5,
    EV_CMD_WM_A6            = 0xA6,
    EV_CMD_WM_PUTSPRITE     = 0xA7,
    EV_CMD_WM_PUTMOVINGSPRITE = 0xA8,
    EV_CMD_WM_MOVESPRITETO  = 0xA9,
    EV_CMD_WM_AA            = 0xAA,
    EV_CMD_WM_AB            = 0xAB,
    EV_CMD_WM_WAITFORSPRITES = 0xAC,
    EV_CMD_WM_SATURATE_COLORS = 0xAD,
    EV_CMD_WM_AE            = 0xAE,
    EV_CMD_WM_SHOWTEXTWINDOW = 0xAF,
    EV_CMD_WM_B0            = 0xB0,
    EV_CMD_WM_WAITFORTEXT   = 0xB1,
    EV_CMD_WM_FADEOUT       = 0xB2,
    EV_CMD_WM_TEXTDECORATE  = 0xB3, /* ? no this is WaitFade */
    EV_CMD_WM_SHOWDRAWNMAP  = 0xB4,
    EV_CMD_WM_WAITFORFXCLEAR1 = 0xB5,
    EV_CMD_WM_MOVECAM2      = 0xB6,
    EV_CMD_WM_WAITFORFXCLEAR2 = 0xB7,
    EV_CMD_WM_HIGHLIGHT     = 0xB8,
    EV_CMD_WM_HIGHLIGHTCLEAR1 = 0xB9,
    EV_CMD_WM_HIGHLIGHTCLEAR2 = 0xBA,
    EV_CMD_WM_BB            = 0xBB,
    EV_CMD_WM_PLACEDOT      = 0xBC,
    EV_CMD_WM_FXCLEAR1      = 0xBD,
    EV_CMD_WM_FXCLEAR2      = 0xBE,
    EV_CMD_WM_BF            = 0xBF,
    EV_CMD_WM_C0            = 0xC0,
    EV_CMD_WM_SKIPWN        = 0xC1,
    EV_CMD_WM_C2            = 0xC2,
    EV_CMD_WM_SPAWNLORD     = 0xC3,
    EV_CMD_WM_SHOWPORTRAIT  = 0xC4,
    EV_CMD_WM_CLEARPORTRAIT = 0xC5,
    EV_CMD_WM_TEXT          = 0xC6,
    EV_CMD_WM_TEXTSTART     = 0xC7,
    EV_CMD_WM_C8            = 0xC8,
    EV_CMD_WM_REMOVETEXT    = 0xC9,
    EV_CMD_WM_CA            = 0xCA,
    EV_CMD_WM_CB            = 0xCB,
    EV_CMD_WM_CC            = 0xCC,
    EV_CMD_WM_CD            = 0xCD,
    EV_CMD_WM_CE            = 0xCE,
    EV_CMD_WM_CF            = 0xCF,
};

#define _EventLoCmds                                    \
    [EV_CMD_NOP] = Event00_NULL,                        \
    [EV_CMD_END] = Event01_End,                         \
    [EV_CMD_EVSET] = Event02_EvBitAndIdMod,             \
    [EV_CMD_EVCHECK] = Event03_CheckEvBitOrId,          \
    [EV_CMD_RANDOMNUMBER] = Event04_CheckRandom,        \
    [EV_CMD_SVAL] = Event05_SetSlot,                    \
    [EV_CMD_SLOT_OPS] = Event06_SlotOperation,          \
    [EV_CMD_QUEUE_OPS] = Event07_SlotQueueOperations,   \
    [EV_CMD_LABEL] = Event08_Label,                     \
    [EV_CMD_GOTO] = Event09_Goto,                       \
    [EV_CMD_CALL] = Event0A_Call,                       \
    [EV_CMD_ENQUEUE_CALL] = Event0B_EnqueueCall,        \
    [EV_CMD_BRANCH] = Event0C_Branch,                   \
    [EV_CMD_ASMC] = Event0D_AsmCall,                    \
    [EV_CMD_STALL] = Event0E_STAL,                      \
    [EV_CMD_COUNTER] = Event0F_CounterOps,              \
    [EV_CMD_EVBITMODIFY] = Event10_ModifyEvBit,         \
    [EV_CMD_IGNOREKEYS] = Event11_SetIgnoredKeys,       \
    [EV_CMD_BGMCHANGE_12] = Event12_StartBGM,           \
    [EV_CMD_BGMCHANGE_13] = Event13_BgmFadeIn,          \
    [EV_CMD_BGMOVERWRITE] = Event14_BgmOverideRestore,  \
    [EV_CMD_BGMVOLUMECHANGE] = Event15_BgmVolume,       \
    [EV_CMD_PLAYSE] = Event16_,                         \
    [EV_CMD_FADE] = Event17_Fade,                       \
    [EV_CMD_COLORFADE] = Event18_ColorFade,             \
    [EV_CMD_CHECKVARIOUS] = Event19_Checks,             \
    [EV_CMD_SETTEXTTYPE] = Event1A_TEXTSTART,           \
    [EV_CMD_DISPLAYTEXT] = Event1B_TEXTSHOW,            \
    [EV_CMD_CONTINUETEXT] = Event1C_TEXTCONT,           \
    [EV_CMD_ENDTEXT] = Event1D_TEXTEND,                 \
    [EV_CMD_DISPLAYFACE] = Event1E_,                    \
    [EV_CMD_MOVEFACE] = Event1F_,                       \
    [EV_CMD_CLEARTEXTBOX] = Event20_,                   \
    [EV_CMD_SHOWBG] = Event21_TextBg,                   \
    [EV_CMD_CLEARSCREEN] = Event22_ClearScreen,         \
    [EV_CMD_23] = Event23_DisaleMapDisp,                \
    [EV_CMD_24] = Event24_EnableMapDisp,                \
    [EV_CMD_LOMA] = Event25_ChangeMap,                  \
    [EV_CMD_CAMERACONTROL] = Event26_CameraControl,     \
    [EV_CMD_TILE_CHANGE] = Event27_MapChange,           \
    [EV_CMD_CHANGEWEATHER] = Event28_ChangeWeather,     \
    [EV_CMD_CHANGEFOGVISION] = Event29_SetFogVision,    \
    [EV_CMD_CHANGECHAPTER] = Event2A_MoveToChapter,     \
    [EV_CMD_LOAD_PRECONF] = Event2B_ConfigLoadUnit,     \
    [EV_CMD_LOADUNIT] = Event2C_LoadUnits,              \
    [EV_CMD_CHANGE_PAL] = Event2D_ChangeSpritePal,      \
    [EV_CMD_GET_PID] = Event2E_CheckAt,                 \
    [EV_CMD_MOVEUNIT] = Event2F_MoveUnit,               \
    [EV_CMD_ENUN] = Event30_ENUN,                       \
    [EV_CMD_TOGGLERANGE] = Event31_DisplayEffectRange,  \
    [EV_CMD_LOADSINGLEUNIT] = Event32_SpawnSingleUnit,  \
    [EV_CMD_CHECKSTATE] = Event33_CheckUnitVarious,     \
    [EV_CMD_CHANGESTATE] = Event34_MessWithUnitState,   \
    [EV_CMD_CHANGECLASS] = Event35_UnitClassChanging,   \
    [EV_CMD_CHECKINAREA] = Event36_CheckInArea,         \
    [EV_CMD_GIVEITEM] = Event37_GiveItem,               \
    [EV_CMD_CHANGEACTIVEUNIT] = Event38_ChangeActiveUnit, \
    [EV_CMD_CHANGEAI] = Event39_ChangeAiScript,         \
    [EV_CMD_DISPLAYPOPUP] = Event3A_DisplayPopup,       \
    [EV_CMD_DISPLAYCURSOR] = Event3B_DisplayCursor,     \
    [EV_CMD_MOVE_CURSOR] = Event3C_MoveCursor,          \
    [EV_CMD_MENUOVERRIDE] = Event3D_MenuOverride,       \
    [EV_CMD_PREPSCREEN] = Event3E_PrepScreenCall,       \
    [EV_CMD_SCRIPT_BATTLE] = Event3F_ScriptBattle,      \
    [EV_CMD_PROM] = Event40_PromoteUnit,                \
    [EV_CMD_WARP] = Event41_Warp,                       \
    [EV_CMD_EARTHQUAKE] = Event42_EarthQuake,           \
    [EV_CMD_SUMMONUNIT] = Event43_SummonUnit,           \
    [EV_CMD_BREAKSTONE] = Event44_BreakingSacredStone,  \
    [EV_CMD_GLOWING_CROSS] = Event45_GlowingCross,

#define _EventHiCmds                                                        \
    [EV_CMD_WM_80 - 0x80] = Event80_WmSkip_Unsure,                          \
    [EV_CMD_WM_81 - 0x80] = Event81_WmFadeOut,                              \
    [EV_CMD_WM_82 - 0x80] = Event82_WmEnd,                                  \
    [EV_CMD_WM_SETCAM - 0x80] = Event83_WmSetCamera,                        \
    [EV_CMD_WM_84 - 0x80] = Event84_WmSetCameraOntoNode,                    \
    [EV_CMD_WM_CENTERCAMONLORD - 0x80] = Event85_WmSetCameraOntoUnit,       \
    [EV_CMD_WM_MOVECAM - 0x80] = Event86_WmScrollCamera,                    \
    [EV_CMD_WM_MOVECAMTO - 0x80] = Event87_WmScrollCameraOntoNode,          \
    [EV_CMD_WM_88 - 0x80] = Event88_WmScrollCameraOntoUnit,                 \
    [EV_CMD_WM_WAITFORCAM - 0x80] = Event89_WmScrollWait,                   \
    [EV_CMD_WM_8A - 0x80] = Event8A_WmShowCursor_Unsure,                    \
    [EV_CMD_WM_8B - 0x80] = (EventFuncType)Event8B_WmHideCursor_Unsure,     \
    [EV_CMD_WM_8C - 0x80] = Event8C_WmSetCursor_Unsure,                     \
    [EV_CMD_WM_8D - 0x80] = Event8D_WmNop,                                  \
    [EV_CMD_WM_8E - 0x80] = Event8E_WmNop,                                  \
    [EV_CMD_WM_8F - 0x80] = Event8F_WmNop,                                  \
    [EV_CMD_WM_DRAWPATH - 0x80] = Event90_WmAddPathDisplayed,               \
    [EV_CMD_WM_DRAWPATH2 - 0x80] = Event91_WmAddPath,                       \
    [EV_CMD_WM_REMOVEPATH - 0x80] = Event92_WmRemovePath,                   \
    [EV_CMD_WM_LOADLOCATION2 - 0x80] = Event93_WmEnableNode,                \
    [EV_CMD_WM_REMOVELOCATION - 0x80] = Event94_WmDisableNode,              \
    [EV_CMD_WM_LOADLOCATION3 - 0x80] = Event95_WmEnableNodeDisplayed,       \
    [EV_CMD_DRAWPATH3 - 0x80] = Event96_WmEnablePathTargetDisplayed,        \
    [EV_CMD_WM_CREATENEXTDESTINATION - 0x80] = Event97_WmInitNextStoryNode, \
    [EV_CMD_WM_98 - 0x80] = Event98_WmSetNextStoryNodePath,                 \
    [EV_CMD_WM_WAITFORFX - 0x80] = Event99_GmNodeDisplayWait,               \
    [EV_CMD_WM_SETDESTINATION - 0x80] = Event9A_WmSetStoryNodeSilent,       \
    [EV_CMD_WM_9B - 0x80] = Event9B_WmSetNextStoryNodeSilentNoFlag,         \
    [EV_CMD_WM_9C - 0x80] = Event9C_,                                       \
    [EV_CMD_WM_9D - 0x80] = Event9D_,                                       \
    [EV_CMD_PUTSPRITE - 0x80] = Event9E_WmSetClassUnit,                     \
    [EV_CMD_WM_9F - 0x80] = Event9F_WmSetCharUnit,                          \
    [EV_CMD_WM_REMSPRITE - 0x80] = EventA0_WmRemoveUnit,                    \
    [EV_CMD_WM_MAKELORDVISIBLE - 0x80] = EventA1_WmShowUnit,                \
    [EV_CMD_WM_MAKELORDDISAPPEAR - 0x80] = EventA2_WmHideUnit,              \
    [EV_CMD_WM_FADEINSPRITE - 0x80] = EventA3_WmShowUnitFaded,              \
    [EV_CMD_WM_FADEOUTSPRITE - 0x80] = EventA4_WmHideUnitFaded,             \
    [EV_CMD_WM_WAITFORSPRITELOAD - 0x80] = EventA5_WmUnitFadeWait,          \
    [EV_CMD_WM_A6 - 0x80] = EventA6_WmUnitSetOnNode,                        \
    [EV_CMD_WM_PUTSPRITE - 0x80] = EventA7_WmUnitSetPosition,               \
    [EV_CMD_WM_PUTMOVINGSPRITE - 0x80] = EventA8_WmUnitMoveFree,            \
    [EV_CMD_WM_MOVESPRITETO - 0x80] = EventA9_WmUnitMovePaths,              \
    [EV_CMD_WM_AA - 0x80] = EventAA_WmUnitPauseMove,                        \
    [EV_CMD_WM_AB - 0x80] = EventAB_WmUnitResumeMove,                       \
    [EV_CMD_WM_WAITFORSPRITES - 0x80] = EventAC_WmUnitMoveWait,             \
    [EV_CMD_WM_SATURATE_COLORS - 0x80] = EventAD_WmFadeToDarker,            \
    [EV_CMD_WM_AE - 0x80] = EventAE_WmFadeToDarkerWait,                     \
    [EV_CMD_WM_SHOWTEXTWINDOW - 0x80] = EventAF_WmShowTextBox,              \
    [EV_CMD_WM_B0 - 0x80] = EventB0_WmHideTextBox_Bugged,                   \
    [EV_CMD_WM_WAITFORTEXT - 0x80] = EventB1_WmTextBoxWait,                 \
    [EV_CMD_WM_FADEOUT - 0x80] = EventB2_WmFancyFade,                       \
    [EV_CMD_WM_TEXTDECORATE - 0x80] = EventB3_WmFancyFadeWait,              \
    [EV_CMD_WM_SHOWDRAWNMAP - 0x80] = EventB4_WmDisplayBigMap,              \
    [EV_CMD_WM_WAITFORFXCLEAR1 - 0x80] = EventB5_WmHideBigMap,              \
    [EV_CMD_WM_MOVECAM2 - 0x80] = EventB6_WmMoveBigMap,                     \
    [EV_CMD_WM_WAITFORFXCLEAR2 - 0x80] = EventB7_WmBigMapWait,              \
    [EV_CMD_WM_HIGHLIGHT - 0x80] = EventB8_WmShowBigMapHighlight,           \
    [EV_CMD_WM_HIGHLIGHTCLEAR1 - 0x80] = EventB9_WmRemoveHighlightNationPart1, \
    [EV_CMD_WM_HIGHLIGHTCLEAR2 - 0x80] = EventBA_WmRemoveHighlightNationPart2, \
    [EV_CMD_WM_BB - 0x80] = EventBB_,                                       \
    [EV_CMD_WM_PLACEDOT - 0x80] = EventBC_MarkPoint,                        \
    [EV_CMD_WM_FXCLEAR1 - 0x80] = EventBD_,                                 \
    [EV_CMD_WM_FXCLEAR2 - 0x80] = EventBE_,                                 \
    [EV_CMD_WM_BF - 0x80] = EventBF_,                                       \
    [EV_CMD_WM_C0 - 0x80] = EventC0_,                                       \
    [EV_CMD_WM_SKIPWN - 0x80] = EventC1_SKIPWM,                             \
    [EV_CMD_WM_C2 - 0x80] = EventC2_WmNoFade,                               \
    [EV_CMD_WM_SPAWNLORD - 0x80] = EventC3_SpawnLord,                       \
    [EV_CMD_WM_SHOWPORTRAIT - 0x80] = EventC4_WmShowPortrait,               \
    [EV_CMD_WM_CLEARPORTRAIT - 0x80] = EventC5_WmClearPortrait,             \
    [EV_CMD_WM_TEXT - 0x80] = EventC6_WmDisplayText,                        \
    [EV_CMD_WM_TEXTSTART - 0x80] = EventC7_,                                \
    [EV_CMD_WM_C8 - 0x80] = EventC8_,                                       \
    [EV_CMD_WM_REMOVETEXT - 0x80] = EventC9_RemoveWmText,                   \
    [EV_CMD_WM_CA - 0x80] = EventCA_,                                       \
    [EV_CMD_WM_CB - 0x80] = EventCB_,                                       \
    [EV_CMD_WM_CC - 0x80] = EventCC_,                                       \
    [EV_CMD_WM_CD - 0x80] = EventCD_,                                       \
    [EV_CMD_WM_CE - 0x80] = EventCE_,                                       \
    [EV_CMD_WM_CF - 0x80] = EventCF_,

enum event_sub_cmd_idx {

    /* EV_CMD_END */
    EVSUBCMD_ENDA = 0,
    EVSUBCMD_ENDB = 1,

    /* EV_CMD_EVSET */
    EVSUBCMD_EVBIT_F = 0,
    EVSUBCMD_EVBIT_T = 8,
    EVSUBCMD_ENUF = 1,
    EVSUBCMD_ENUT = 9,

    /* EV_CMD_EVCHECK */
    EVSUBCMD_CHECK_EVBIT = 0,
    EVSUBCMD_CHECK_EVENTID = 1,

    /* EV_CMD_SLOT_OPS */
    EVSUBCMD_SADD = 0,
    EVSUBCMD_SSUB = 1,
    EVSUBCMD_SMUL = 2,
    EVSUBCMD_SDIV = 3,
    EVSUBCMD_SMOD = 4,
    EVSUBCMD_SAND = 5,
    EVSUBCMD_SORR = 6,
    EVSUBCMD_SXOR = 7,
    EVSUBCMD_SLSL = 8,
    EVSUBCMD_SLSR = 9,

    /* EV_CMD_QUEUE_OPS */
    EVSUBCMD_SENQUEUE = 0,
    EVSUBCMD_SENQUEUE_S1 = 1,
    EVSUBCMD_SDEQUEUE = 2,

    /* EV_CMD_ENQUEUE_CALL */
    EVSUBCMD_ENQUEUE_DIRECT = 0,
    EVSUBCMD_ENQUEUE_TRIGGER = 1,

    /* EV_CMD_BRANCH */
    EVSUBCMD_BEQ = 0,
    EVSUBCMD_BNE = 1,
    EVSUBCMD_BGE = 2,
    EVSUBCMD_BGT = 3,
    EVSUBCMD_BLE = 4,
    EVSUBCMD_BLT = 5,

    /* EV_CMD_STALL */
    EVSUBCMD_STAL = 0,
    EVSUBCMD_STAL1 = 1,
    EVSUBCMD_STAL2 = 2,
    EVSUBCMD_STAL3 = 3,

    /* EV_CMD_COUNTER */
    EVSUBCMD_COUNTER_CHECK = 0,
    EVSUBCMD_COUNTER_SET = 1,
    EVSUBCMD_COUNTER_INC = 2,
    EVSUBCMD_COUNTER_DEC = 3,

    /* EV_CMD_BGMCHANGE_12 */

    /* EV_CMD_BGMCHANGE_13 */
    EVSUBCMD_MUSCFAST = 2,
    EVSUBCMD_MUSCMID = 4,
    EVSUBCMD_MUSCSLOW = 6,
    EVSUBCMD_MUSCSSLOW = 8,

    /* EV_CMD_BGMOVERWRITE */
    EVSUBCMD_MUSS = 0,
    EVSUBCMD_MURE = 1,

    /* EV_CMD_BGMVOLUMECHANGE */
    EVSUBCMD_MUSI = 0,
    EVSUBCMD_MUNO = 1,

    /* EV_CMD_PLAYSE */

    /* EV_CMD_FADE */
    EVSUBCMD_FADU = 0,
    EVSUBCMD_FADI = 1,
    EVSUBCMD_FAWU = 2,
    EVSUBCMD_FAWI = 3,

    /* EV_CMD_COLORFADE */
    EVSUBCMD_STARTFADE = 0,
    EVSUBCMD_ENDFADE = 1,
    EVSUBCMD_FADECOLORS = 2,

    /* EV_CMD_CHECKVARIOUS */
    EVSUBCMD_CHECK_MODE = 0,
    EVSUBCMD_CHECK_CHAPTER_NUMBER = 0x1,
    EVSUBCMD_CHECK_HARD = 0x2,
    EVSUBCMD_CHECK_TURNS = 0x3,
    EVSUBCMD_CHECK_ENEMIES = 0x4,
    EVSUBCMD_CHECK_OTHERS = 0x5,
    EVSUBCMD_CHECK_SKIRMISH = 0x6,
    EVSUBCMD_CHECK_TUTORIAL = 0x7,
    EVSUBCMD_CHECK_MONEY = 0x8,
    EVSUBCMD_19CHECK_EVENTID = 0x9,
    EVSUBCMD_CHECK_POSTGAME = 0xA,

    /* EV_CMD_SETTEXTTYPE */
    EVSUBCMD_TEXTSTART = 0,
    EVSUBCMD_REMOVEPORTRAITS = 1,
    EVSUBCMD_0x1A22 = 2,
    EVSUBCMD_TUTORIALTEXTBOXSTART = 3,
    EVSUBCMD_SOLOTEXTBOXSTART = 4,
    EVSUBCMD_0x1A25 = 5,

    /* EV_CMD_DISPLAYTEXT */
    EVSUBCMD_TEXTSHOW = 0,
    EVSUBCMD_TEXTSHOW2 = 1,
    EVSUBCMD_REMA = 2,

    /* EV_CMD_SHOWBG */
    EVSUBCMD_BACG = 0,
    EVSUBCMD_0x2141 = 1,
    EVSUBCMD_2142 = 2,
    EVSUBCMD_2143 = 3,

    /* EV_CMD_CAMERACONTROL */
    EVSUBCMD_CAMERA_AT = 0,
    EVSUBCMD_CAMERA_CHAR = 1,
    EVSUBCMD_CAMERA2_AT = 8,
    EVSUBCMD_CAMERA2_CHAR = 9,

    /* EV_CMD_TILE_CHANGE */
    EVSUBCMD_TILECHANGE = 0,
    EVSUBCMD_TILEREVERT = 1,

    /* EV_CMD_CHANGECHAPTER */
    EVSUBCMD_MNTS = 0,
    EVSUBCMD_MNCH = 1,
    EVSUBCMD_MNC2 = 2,
    EVSUBCMD_MNC3 = 3,
    EVSUBCMD_MNC4 = 4,

    /* EV_CMD_LOAD_PRECONF */
    EVSUBCMD_LOAD_SETCOUNT = 0,
    EVSUBCMD_LOAD_SETCHANCE = 1,
    EVSUBCMD_LOAD_NOREDA = 2,

    /* EV_CMD_LOADUNIT */
    EVSUBCMD_LOAD1 = 0x0,
    EVSUBCMD_LOAD2 = 0x1,
    EVSUBCMD_LOAD3 = 0x2,
    EVSUBCMD_LOAD4 = 0x3,

    /* EV_CMD_GET_PID */
    EVSUBCMD_CHECK_AT = 0,
    EVSUBCMD_CHECK_ACTIVE = 1,

    /* EV_CMD_MOVEUNIT */
    EVSUBCMD_MOVE = 0,
    EVSUBCMD_MOVEONTO = 1,
    EVSUBCMD_MOVE_1STEP = 2,
    EVSUBCMD_MOVE_DEFINED = 3,
    EVSUBCMD_MOVE_CLOSEST = 8,
    EVSUBCMD_MOVE_NEXTTO = 9,
    EVSUBCMD_MOVE_1STEP_CLOSEST = 10,
    EVSUBCMD_MOVE_DEFINED_CLOSEST = 11,

    /* EV_CMD_CHECKSTATE */
    EVSUBCMD_CHECK_EXISTS = 0,
    EVSUBCMD_CHECK_STATUS = 1,
    EVSUBCMD_CHECK_ALIVE = 2,
    EVSUBCMD_CHECK_DEPLOYED = 3,
    EVSUBCMD_CHECK_ACTIVEID = 4,
    EVSUBCMD_CHECK_ALLEGIANCE = 5,
    EVSUBCMD_CHECK_COORDS = 6,
    EVSUBCMD_CHECK_CLASS = 7,
    EVSUBCMD_CHECK_LUCK = 8,

    /* EV_CMD_TOGGLERANGE */
    EVSUBCMD_SHOW_ATTACK_RANGE = 0,
    EVSUBCMD_HIDE_ATTACK_RANGE = 1,

    /* EV_CMD_CHANGESTATE */
    EVSUBCMD_REMU = 0x0,
    EVSUBCMD_REVEAL = 0x1,
    EVSUBCMD_CUSA = 0x2,
    EVSUBCMD_CUSN = 0x3,
    EVSUBCMD_CUSE = 0x4,
    EVSUBCMD_SET_HP = 0x5,
    EVSUBCMD_SET_ENDTURN = 0x6,
    EVSUBCMD_3427 = 0x7,
    EVSUBCMD_SET_STATE = 0x8,
    EVSUBCMD_3529 = 0x9,
    EVSUBCMD_CLEA = 0xA,
    EVSUBCMD_CLEN = 0xB,
    EVSUBCMD_CLEE = 0xC,
    EVSUBCMD_KILL = 0xD,
    EVSUBCMD_DISA_IF = 0xE,
    EVSUBCMD_DISA = 0xF,

    /* EV_CMD_LOADSINGLEUNIT */
    EVSUBCMD_SPAWN_ALLY = 0,
    EVSUBCMD_SPAWN_NPC = 1,
    EVSUBCMD_SPAWN_ENEMY = 2,
    EVSUBCMD_SPAWN_CUTSCENE_ALLY = 0xF,

    /* EV_CMD_CHECKINAREA */

    /* EV_CMD_GIVEITEM */
    EVSUBCMD_GIVEITEMTO = 0,
    EVSUBCMD_GIVEITEMTOMAIN = 1,
    EVSUBCMD_GIVETOSLOT3 = 2,

    /* EV_CMD_CHANGEAI */
    EVTSUBCMD_CHAI = 0,
    EVTSUBCMD_CHAI_AT = 1,

    /* EV_CMD_DISPLAYPOPUP */
    EVSUBCMD_POPUP = 0,
    EVSUBCMD_BROWNTEXTBOX = 1,

    /* EV_CMD_DISPLAYCURSOR */
    EVSUBCMD_CURSOR_AT = 0x0,
    EVSUBCMD_CURSOR_UNIT = 0x1,
    EVSUBCMD_CURE = 0x2,
    EVSUBCMD_CURSOR_FLASHING_AT = 0x4,
    EVSUBCMD_CURSOR_FLASHING_UNIT = 0x5,

    /* EV_CMD_MENUOVERRIDE */
    EVSUBCMD_DISABLEOPTIONS = 0,
    EVSUBCMD_DISABLEWEAPONS = 1,

    /* EV_CMD_MOVE_CURSOR */
    EVSUBCMD_CHECK_CURSOR = 0,
    EVSUBCMD_SET_CURSOR = 1,

    /* EV_CMD_SCRIPT_BATTLE */
    EVSUBCMD_FIGHT = 0,
    EVSUBCMD_FIGHT_MAP = 1,
    EVSUBCMD_FIGHT_SCRIPT = 2,

    /* EV_CMD_WARP */
    EVSUBCMD_WARP_OUT = 0,
    EVSUBCMD_WARP_IN = 1,
    EVSUBCMD_WARP_STAL = 0xF,

    /* EV_CMD_EARTHQUAKE */
    EVSUBCMD_EARTHQUAKE_START = 0,
    EVSUBCMD_EARTHQUAKE_END = 0xF,

    /* EV_CMD_GLOWING_CROSS */
    EVSUBCMD_GLOWINGCROSS = 0,
    EVSUBCMD_GLOWINGCROSS_END = 0xF,
};

#define _EvtSubParam16u8(u8a, u8b) \
    (((u8a) & 0xFF) + ((u8b & 0xFF) << 8))
#define _EvtSubParam16u4(u4a, u4b, u4c, u4d) \
    (((u4a) & 0xF) + ((u4b & 0xF) << 4) + ((u4c & 0xF) << 8) + ((u4d & 0xF) << 12))

#define _EvtParams2(x, y) ((((y) & 0xFFFF) << 16) + ((x) & 0xFFFF))
#define _EvtParams4(a, b, c, d) ((((d) & 0xFF) << 24) + (((c) & 0xFF) << 16) + (((b) & 0xFF) << 8) + ((a) & 0xFF))
#define _EvtCmd(cmd, len, sub) \
( \
    (((cmd) & 0xFF) << 8) + \
    (((len) & 0x0F) << 4) + \
    (((sub) & 0x0F)) \
)
#define _EvtArg0(cmd, len, sub, arg0) _EvtParams2(_EvtCmd(cmd, len, sub), arg0)
#define _EvtAutoCmdLen2(cmd) _EvtArg0(cmd, 2, 0, 0)
#define _EvtAutoCmdLen4(cmd) _EvtArg0(cmd, 4, 0, 0)

#define EvtNop _EvtAutoCmdLen2(EV_CMD_NOP),
#define EvtReturn _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDA, 0),
#define EvtEndAll _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDB, 0),
#define EvtClearEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_F, (flag)),
#define EvtSetEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_T, (flag)),
#define EvtClearFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUF, (flag)),
#define EvtClearFlagAtSlot2 EvtClearFlag(-1)
#define EvtSetFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUT, (flag)),
#define EventCheckEvbit(index) _EvtArg0(EV_CMD_EVCHECK, 2, EVSUBCMD_CHECK_EVBIT, (index)),
#define EventCheckFlag(flag) _EvtArg0(EV_CMD_EVCHECK, 2, EVSUBCMD_CHECK_EVENTID, (flag)),
#define EvtGetRandom(max) _EvtArg0(EV_CMD_RANDOMNUMBER, 2, 0, (max)),
#define EvtSetSlot(slot, value) _EvtArg0(EV_CMD_SVAL, 4, 0, (slot)), (EventListScr)(value),
#define EvtSlotADD(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SADD, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotSUB(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SSUB, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotMUL(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SMUL, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotDIV(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SDIV, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotMOD(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SMOD, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotAND(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SAND, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotORR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SORR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotXOR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SXOR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotLSL(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SLSL, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotLSR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SLSR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtEnqueueFormSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE, (slot)),
#define EvtEnqueueFormSlot1 _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE_S1, 0),
#define EvtDequeueToSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SDEQUEUE, (slot)),
#define EvtLabel(label) _EvtArg0(EV_CMD_LABEL, 2, 0, (label)),
#define EvtGoto(label) _EvtArg0(EV_CMD_GOTO, 2, 0, (label)),
#define EvtCall(scr) _EvtAutoCmdLen4(EV_CMD_CALL), (EventListScr)(scr),
#define EvtEnqueueCallDirectly(scr) _EvtArg0(EV_CMD_ENQUEUE_CALL, 4, EVSUBCMD_ENQUEUE_DIRECT, 0), (EventListScr)(scr),
#define EvtEnqueueConditionalTutCall(scr, exec_type) _EvtArg0(EV_CMD_ENQUEUE_CALL, 4, EVSUBCMD_ENQUEUE_TRIGGER, (exec_type)), (EventListScr)(scr),
#define EvtBEQ(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BEQ, (label)), _EvtParams2((s1), (s2)),
#define EvtBNE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BNE, (label)), _EvtParams2((s1), (s2)),
#define EvtBGE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BGE, (label)), _EvtParams2((s1), (s2)),
#define EvtBGT(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BGT, (label)), _EvtParams2((s1), (s2)),
#define EvtBLE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BLE, (label)), _EvtParams2((s1), (s2)),
#define EvtBLT(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BLT, (label)), _EvtParams2((s1), (s2)),
#define EvtAsmCall(func) _EvtAutoCmdLen4(EV_CMD_ASMC), (EventListScr)(func),
#define EvtAsmCallEnableSkip(func) _EvtArg0(EV_CMD_ASMC, 4, 1, 0), (EventListScr)(func), /* If skipping, not exec */
#define EvtSleep(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL, (time)),
#define EvtSleepWithCancel(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL1, (time)),
#define EvtSleepWithGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL2, (time)),
#define EvtSleepWithCancelGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL3, (time)),
#define EvtModifyEvBit(type) _EvtArg0(EV_CMD_EVBITMODIFY, 2, 0, (type)),
#define EvtSetKeyIgnore(mask) _EvtArg0(EV_CMD_IGNOREKEYS, 2, 0, (mask)),
#define EvtGetCounter(idx) _EvtArg0(EV_CMD_COUNTER, 2, EVSUBCMD_COUNTER_CHECK, _EvtSubParam16u8((idx), 0)),
#define EvtSetCounter(idx, val) _EvtArg0(EV_CMD_COUNTER, 2, EVSUBCMD_COUNTER_SET, _EvtSubParam16u8((idx), (val))),
#define EvtIncCounter(idx) _EvtArg0(EV_CMD_COUNTER, 2, EVSUBCMD_COUNTER_INC, _EvtSubParam16u8((idx), 0)),
#define EvtDecCounter(idx) _EvtArg0(EV_CMD_COUNTER, 2, EVSUBCMD_COUNTER_DEC, _EvtSubParam16u8((idx), 0)),
#define EvtStartBgm(bgm) _EvtArg0(EV_CMD_BGMCHANGE_12, 2, 0, (bgm)),
#define EvtBgmFadeIn(bgm, speed) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, (speed), (bgm)),
#define EvtOverrideBgm(bgm) _EvtArg0(EV_CMD_BGMOVERWRITE, 2, EVSUBCMD_MUSS, (bgm)),
#define EvtRestoreBgm(speed) _EvtArg0(EV_CMD_BGMOVERWRITE, 2, EVSUBCMD_MURE, (speed)),
#define EvtSetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUSI, 0),
#define EvtUnsetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUNO, 0),
#define EvtPlaySong(songid) _EvtArg0(EV_CMD_PLAYSE, 2, 0, (songid)),
#define EvtFadeOutBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADU, (speed)),
#define EvtFadeInBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADI, (speed)),
#define EvtFadeOutWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWU, (speed)),
#define EvtFadeInWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWI, (speed)),
#define EvtColorFadeStart _EvtArg0(EV_CMD_COLORFADE, 6, EVSUBCMD_STARTFADE, 0), 0, 0,
#define EvtColorFadeEnd _EvtArg0(EV_CMD_COLORFADE, 6, EVSUBCMD_ENDFADE, 0), 0, 0,
#define EvtColorFadeSetup(form, to, speed, r, g, b) _EvtArg0(EV_CMD_COLORFADE, 6, EVSUBCMD_FADECOLORS, _EvtSubParam16u8(form, to)), _EvtParams2(speed, r), _EvtParams2(g, b), // todo
#define EvtGetMode _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_MODE, 0),
#define EvtGetChapterIndex _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_CHAPTER_NUMBER, 0),
#define EvtGetIsHard _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_HARD, 0),
#define EvtGetCurrentTurn _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TURNS, 0),
#define EvtGetEnemyAmount _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_ENEMIES, 0),
#define EvtGetNpcAmount _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_OTHERS, 0),
#define EvtGetSkirmishType _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_SKIRMISH, 0),
#define EvtGetIsTutorial _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TUTORIAL, 0),
#define EvtGetMoney _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_MONEY, 0),
#define EvtGetTriggeredEid _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_19CHECK_EVENTID, 0),
#define EvtGetIsGameCompleted _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_POSTGAME, 0),
#define EvtTextStart _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_TEXTSTART, 0),
#define EvtTextStartType1 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_REMOVEPORTRAITS, 0),
#define EvtTextStartType2 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_0x1A22, 0),
#define EvtTextStartType3 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_TUTORIALTEXTBOXSTART, 0),
#define EvtTextStartType4 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_SOLOTEXTBOXSTART, 0),
#define EvtTextStartType5 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_0x1A25, 0),
#define EvtTextTuorialStart EvtTextStartType3
#define EvtTextShow(msg) _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_TEXTSHOW, (msg)),
#define EvtTextShow2(msg) _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_TEXTSHOW2, (msg)),
#define EvtTextRemoveAll _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_REMA, 0),
#define EvtContinueText _EvtAutoCmdLen2(EV_CMD_CONTINUETEXT),
#define EvtTextEnd _EvtAutoCmdLen2(EV_CMD_ENDTEXT),
#define EvtDisplayFace(slot, fid) _EvtArg0(EV_CMD_DISPLAYFACE, 2, (slot), (fid)),
#define EvtDisplayTextBg(bg) _EvtArg0(EV_CMD_SHOWBG, 4, EVSUBCMD_BACG, (bg)), 0,
#define EvtBgTransion(bg, type, speed) _EvtArg0(EV_CMD_SHOWBG, 4, EVSUBCMD_0x2141, (bg)), _EvtParams2(type, speed),
#define EvtBgFadeIn(bg, color, speed) _EvtArg0(EV_CMD_SHOWBG, 4, EVSUBCMD_2142, (bg)), _EvtParams2(color, speed),
#define EvtBgFadeOut(color, speed) _EvtArg0(EV_CMD_SHOWBG, 4, EVSUBCMD_2142, 0), _EvtParams2(color, speed), /* not sure, to do to confirm */
#define EvtClearScreen _EvtAutoCmdLen2(EV_CMD_CLEARSCREEN),
#define EvtLoadMap(chapter) _EvtArg0(EV_CMD_LOMA, 2, 0, (chapter)),
#define EvtMoveCameraTo(x, y) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA_AT, _EvtSubParam16u8((x), (y))),
#define EvtMoveCameraToChar(pid) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA_CHAR, (pid)),
#define EvtMoveCameraToCenter(x, y) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA2_AT, _EvtSubParam16u8((x), (y))),
#define EvtMoveCameraToCharCenter(pid) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA2_CHAR, (pid)),
#define EvtTriggerMapChange(id) _EvtArg0(EV_CMD_TILE_CHANGE, 2, EVSUBCMD_TILECHANGE, (id)),
#define EvtRevertMapChange(id) _EvtArg0(EV_CMD_TILE_CHANGE, 2, EVSUBCMD_TILEREVERT, (id)),
#define EvtChangeFogVision(doDisplay, vision) _EvtArg0(EV_CMD_CHANGEFOGVISION, 2, (doDisplay), (vision)),
#define EvtBackToTitle(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNTS, (chapter)),
#define EvtChangeChapterWM(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNCH, (chapter)),
#define EvtChangeChapterBM(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC2, (chapter)),
#define EvtChangeChapterNoSave(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC3, (chapter)),
#define EvtMoveToGameEnding _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC4, 0),
#define EvtSetLoadUnitCount(cnt) _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_SETCOUNT, (cnt)),
#define EvtSetLoadUnitChance(chance) _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_SETCHANCE, (chance)),
#define EvtSetLoadUnitNoREDA _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_NOREDA, 0),
#define EvtLoadUnit1(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD1, (restriction)), (EventListScr)(units),
#define EvtLoadUnit2(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD2, (restriction)), (EventListScr)(units),
#define EvtLoadUnit3(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD3, (restriction)), (EventListScr)(units),
#define EvtLoadUnit4(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD4, (restriction)), (EventListScr)(units),
#define EvtChangePalSMS(pal) _EvtArg0(EV_CMD_CHANGE_PAL, 2, 0, (pal)),
#define EvtGetPidAt(x, y) _EvtArg0(EV_CMD_GET_PID, 2, EVSUBCMD_CHECK_AT, _EvtSubParam16u8((x), (y))),
#define EvrGetActiveUnitPid _EvtArg0(EV_CMD_GET_PID, 2, EVSUBCMD_CHECK_ACTIVE, 0),
#define EvtMoveUnit(modify, speed, pid, x, y) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE | (modify) << 3), (speed)), _EvtParams2((pid), _EvtSubParam16u8((x), (y))),
#define EvtMoveUnitToTarget(modify, speed, pid, pid_target) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVEONTO | (modify) << 3), (speed)), _EvtParams2((pid), (pid_target)),
#define EvtMoveUnitOneStep(modify, speed, pid, direction) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE_1STEP | (modify) << 3), (speed)), _EvtParams2((pid), (direction)),
#define EvtMoveUnitByQueue(modify, pid) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE_DEFINED | (modify) << 3), 0), _EvtParams2((pid), 0),
#define EvtCheckUnitExists(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_EXISTS, (pid)),
#define EvtGetUnitVisitGroup(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_STATUS, (pid)),
#define EvtCheckUnitNotDead(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ALIVE, (pid)),
#define EvtCheckUnitDeployed(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_DEPLOYED, (pid)),
#define EvtCheckUnitActive(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ACTIVEID, (pid)),
#define EvtGetUnitFaction(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ALLEGIANCE, (pid)),
#define EvtGetUnitPosition(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_COORDS, (pid)),
#define EvtGetUnitJid(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_CLASS, (pid)),
#define EvtGetUnitLuck(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_LUCK, (pid)),
#define EvtWaitUnitMoving _EvtAutoCmdLen2(EV_CMD_ENUN),
#define EvtShowAttackRange(pid) _EvtArg0(EV_CMD_TOGGLERANGE, 2, EVSUBCMD_SHOW_ATTACK_RANGE, (pid)),
#define EvtHideAttackRange _EvtArg0(EV_CMD_TOGGLERANGE, 2, EVSUBCMD_HIDE_ATTACK_RANGE, 0),
#define EvtSetUnitHidden(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_REMU, (pid)),
#define EvtSetUnitUnhidden(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_REVEAL, (pid)),
#define EvtChangeFaction(pid, faction) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CUSA + (faction), (pid)),
#define EvtSetUnitHpFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_HP, (pid)),
#define EvtSetUnitUnselectable(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_ENDTURN, (pid)),
#define EvtSetUnitHasMoved(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_3427, (pid)),
#define EvtSetUnitStateFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_STATE, (pid)),
#define EvtHideAllAlliess _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEA, 0),
#define EvtRemoveAllNpcs _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEN, 0),
#define EvtRemoveAllEimies _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEE, 0),
#define EvtKillUnit(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_KILL, (pid)),
#define EvtWaitUnitDeathFade(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_DISA_IF, (pid)),
#define EvtLoadSingleUnit(faction, pid, x, y) _EvtArg0(EV_CMD_LOADSINGLEUNIT, 4, (faction), (pid)), _EvtParams4((x), (y), 0, 0),
#define EvtRemoveUnit(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_DISA, (pid)),
#define EvtCheckInArea(pid, x, y, w, h) _EvtArg0(EV_CMD_CHECKINAREA, 4, 0, (pid)), _EvtParams4(x, y, w, h),
#define EvtGiveItemAtSlot3(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVEITEMTO, (pid)),
#define EvtGiveMoneymAtSlot3(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVEITEMTOMAIN, (pid)),
#define EvtGiveMoneymAtSlot3NoPopup(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVETOSLOT3, (pid)),
#define EvtSetActiveUnit(pid) _EvtArg0(EV_CMD_CHANGEACTIVEUNIT, 2, 0, (pid)),
#define EvtChangeAI(pid) _EvtArg0(EV_CMD_CHANGEAI, 2, EVTSUBCMD_CHAI, (pid)),
#define EvtChangeAIat(x, y) _EvtArg0(EV_CMD_CHANGEAI, 2, EVTSUBCMD_CHAI_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayPopup(msg, songid) _EvtArg0(EV_CMD_DISPLAYPOPUP, 4, EVSUBCMD_POPUP, (msg)), _EvtParams2((songid), 0),
#define EvtDisplayPopupSilently(msg, x, y) _EvtArg0(EV_CMD_DISPLAYPOPUP, 4, EVSUBCMD_BROWNTEXTBOX, (msg)), _EvtParams2((x), (y)),
#define EvtDisplayCursorAt(x, y) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_UNIT, (pid)),
#define EvtEndCursor _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURE, 0),
#define EvtDisplayFlashingCursorAt(x, y) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayFlashingCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_UNIT, (pid)),
#define EvtOverrideUnitMenu(bitfile) _EvtArg0(EV_CMD_MENUOVERRIDE, 2, EVSUBCMD_DISABLEOPTIONS, (bitfile)),
#define EvtOverrideWeaponMenu(bitfile) _EvtArg0(EV_CMD_MENUOVERRIDE, 2, EVSUBCMD_DISABLEWEAPONS, (bitfile)),
#define EvtGetCursorPosition _EvtArg0(EV_CMD_MOVE_CURSOR, 2, EVSUBCMD_CHECK_CURSOR, 0),
#define EvtSetCursorPosition(x, y) _EvtArg0(EV_CMD_MOVE_CURSOR, 2, EVSUBCMD_SET_CURSOR, _EvtSubParam16u8((x), (y))),
#define EvtCallPrepScreen _EvtAutoCmdLen2(EV_CMD_PREPSCREEN),
#define EvtStartEventBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT, (actor)), _EvtParams2((target), _EvtSubParam16u8((weapon), (ballista))),
#define EvtStartEventMapBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_MAP, (actor)), _EvtParams2((target), _EvtSubParam16u8((weapon), (ballista))),
#define EvtSetScriptedBattle _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_SCRIPT, 0), (EventListScr)0,
#define EvtPromoteUnit(pid, jid, item) _EvtArg0(EV_CMD_PROM, 4, 0, (pid)), _EvtParams2(jid, item),
#define EvtWarpOUT(x, y)  _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_OUT, _EvtSubParam16u8(x, y)),
#define EvtWarpIN(x, y) _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_IN, _EvtSubParam16u8(x, y)),
#define EvtWarpSTAL _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_STAL, 0),
#define EvtStartEarthQuake(direction, playse) _EvtArg0(EV_CMD_EARTHQUAKE, 2, EVSUBCMD_EARTHQUAKE_START, _EvtSubParam16u8(direction, playse)),
#define EvtEndEarthQuake _EvtArg0(EV_CMD_EARTHQUAKE, 2, EVSUBCMD_EARTHQUAKE_END, 0),
#define EvtSummonUnit(pid) _EvtArg0(EV_CMD_SUMMONUNIT, 2, 0, (pid)),
#define EvtBreakStone(pid) _EvtArg0(EV_CMD_BREAKSTONE, 2, 0, (pid)),
#define EvtShowGlowingCross(pid) _EvtArg0(EV_CMD_GLOWING_CROSS, 2, EVSUBCMD_GLOWINGCROSS, (pid)),
#define EvtRemoveGlowingCross _EvtArg0(EV_CMD_GLOWING_CROSS, 2, EVSUBCMD_GLOWINGCROSS_END, 0),

#define WmEvtSetCameraOnto(wm_uid) _EvtArg0(EV_CMD_WM_CENTERCAMONLORD, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtGmScroll(x1, y1, x2, y2, speed, delay) _EvtArg0(EV_CMD_WM_MOVECAM, 8, 0, 0), _EvtParams2(x1, y1), _EvtParams2(x2, y2), _EvtParams2(speed, delay),
#define WmEvtWaitGmScroll _EvtAutoCmdLen2(EV_CMD_WM_WAITFORCAM),
#define WmEvtDrawPath(path) _EvtArg0(EV_CMD_WM_DRAWPATH, 4, 0, 0), (EventScr)(path),
#define WmEvtDrawNodeNextChapter _EvtAutoCmdLen2(EV_CMD_WM_CREATENEXTDESTINATION),
#define WmEvtWaitNodeDisplay _EvtAutoCmdLen2(EV_CMD_WM_WAITFORFX),
#define WmEvtShowMU(wm_uid, jid, faction, node) _EvtArg0(EV_CMD_PUTSPRITE, 6, 0, 0), _EvtParams2(wm_uid, jid), _EvtParams2(faction, node),
#define WmEvtRemoveMU(wm_uid) _EvtArg0(EV_CMD_WM_REMSPRITE, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtShowUnit(wm_uid) _EvtArg0(EV_CMD_WM_MAKELORDVISIBLE, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtFadeMU(wm_uid, delay) _EvtArg0(EV_CMD_WM_FADEINSPRITE, 4, 0, 0), _EvtParams2(wm_uid, delay),
#define WmEvtWaitMuFade _EvtAutoCmdLen2(EV_CMD_WM_WAITFORSPRITELOAD),
#define WmEvtSetUnitPosition(wm_uid, x, y) _EvtArg0(EV_CMD_WM_PUTSPRITE, 6, 0, 0), _EvtParams2(wm_uid, 0), _EvtParams2(x, y),
#define WmEvtMoveUnit(wm_uid, acc, x1, y1, x2, y2, time, flag, delay) _EvtArg0(EV_CMD_WM_PUTMOVINGSPRITE, 12, 0, 0), _EvtParams2(wm_uid, acc), _EvtParams2(x1, y1), _EvtParams2(x2, y2), _EvtParams2(time, flag), _EvtParams2(delay, 0),
#define WmEvtWaitMU(wm_uid) _EvtArg0(EV_CMD_WM_WAITFORSPRITES, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtDisplayTextWindow(speed, blend) _EvtArg0(EV_CMD_WM_SHOWTEXTWINDOW, 4, 0, 0), _EvtParams2(speed, blend),
#define WmEvtTextBoxWait _EvtAutoCmdLen2(EV_CMD_WM_WAITFORTEXT),
#define WmEvtFadeOut(speed) _EvtArg0(EV_CMD_WM_FADEOUT, 4, 0, 0), (EventScr)(speed),
#define WmEvtWaitFade _EvtAutoCmdLen2(EV_CMD_WM_TEXTDECORATE),
#define WmEvtShowBigMap(x, y, map) _EvtArg0(EV_CMD_WM_SHOWDRAWNMAP, 6, 0, 0), _EvtParams2(x, y), (EventScr)(map),
#define WmEvtCamMov2(x1, y1, x2, y2, speed, delay) _EvtArg0(EV_CMD_WM_MOVECAM2, 8, 0, 0), _EvtParams2(x1, y1), _EvtParams2(x2, y2), _EvtParams2(speed, delay),
#define WmEvtHighlightNation(nation) _EvtArg0(EV_CMD_WM_HIGHLIGHT, 4, 0, 0), (EventScr)nation,
#define WmEvtHighlightNationClear1(nation) _EvtArg0(EV_CMD_WM_HIGHLIGHTCLEAR1, 4, 0, 0), (EventScr)nation,
#define WmEvtHighlightNationClear2(nation) _EvtArg0(EV_CMD_WM_HIGHLIGHTCLEAR2, 4, 0, 0), (EventScr)nation,
#define WmEvtMarkPoint(a, pal, node, eff) _EvtArg0(EV_CMD_WM_PLACEDOT, 6, 0, 0), _EvtParams2(a, pal), _EvtParams2(node, eff),
#define WmEvtRemoveMarkPoint1(a) _EvtArg0(EV_CMD_WM_FXCLEAR1, 4, 0, 0), (EventScr)(a),
#define WmEvtRemoveMarkPoint2(a) _EvtArg0(EV_CMD_WM_FXCLEAR2, 4, 0, 0), (EventScr)(a),
#define WmEvtSkipWmEvents _EvtAutoCmdLen2(EV_CMD_WM_SKIPWN),
#define WmEvtNoFade _EvtAutoCmdLen2(EV_CMD_WM_C2),
#define WmEvtLoadUnit(wm_uid, pid, node) _EvtArg0(EV_CMD_WM_SPAWNLORD, 6, 0, 0), _EvtParams2(wm_uid, pid), (EventListScr)node,
#define WmEvtShowPortrait(face_slot, face, config, delay) _EvtArg0(EV_CMD_WM_SHOWPORTRAIT, 6, 0, 0), _EvtParams2(face_slot, face), _EvtParams2(config, delay),
#define WmEvtClearPortrait(face_slot, config, delay) _EvtArg0(EV_CMD_WM_CLEARPORTRAIT, 4, 0, face_slot), _EvtParams2(config, delay),
#define WmEvtShowText(text, unk) _EvtArg0(EV_CMD_WM_TEXT, 4, 0, 0), _EvtParams2(text, unk),
#define WmEvtTextStart _EvtAutoCmdLen2(EV_CMD_WM_TEXTSTART),
#define WmEvtRemoveText _EvtAutoCmdLen2(EV_CMD_WM_REMOVETEXT),
#define WmEvtRemoveBigMap _EvtAutoCmdLen2(EV_CMD_WM_WAITFORFXCLEAR1),
#define WmEvtWaitBigMapRemove _EvtAutoCmdLen2(EV_CMD_WM_WAITFORFXCLEAR2),
#define WmEvtMoveUnitInPath(wm_uid, conf,  node1, node2, speed, delay) _EvtArg0(EV_CMD_WM_MOVESPRITETO, 8, 0, 0), _EvtParams2(wm_uid, conf), _EvtParams2(node1, node2), _EvtParams2(speed, delay),
#define WmEvtHideUnit(wm_uid) _EvtArg0(EV_CMD_WM_MAKELORDDISAPPEAR, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtUnitFadeOut(wm_uid, speed) _EvtArg0(EV_CMD_WM_FADEOUTSPRITE, 4, 0, 0), _EvtParams2(wm_uid, speed),
#define WmEvtSetCamToNode(node) _EvtArg0(EV_CMD_WM_84, 4, 0, 0), (EventScr)(node),
#define WmEvtSetUnitOnNode(wm_uid, node) _EvtArg0(EV_CMD_WM_A6, 4, 0, 0), _EvtParams2(wm_uid, node),
#define WmEvtSetNextStoryNode(node) _EvtArg0(EV_CMD_WM_9B, 4, 0, 0), (EventScr)(node),
#define WmEvtSetNextStoryNodeSilent(node) _EvtArg0(EV_CMD_WM_SETDESTINATION, 4, 0, 0), (EventScr)(node),
#define WmEvtRemoveNode(node) _EvtArg0(EV_CMD_WM_REMOVELOCATION, 4, 0, 0), (EventScr)(node),
#define WmEvtRemovePath(path) _EvtArg0(EV_CMD_WM_REMOVEPATH, 4, 0, 0), (EventScr)(path),
#define WmEvtDisplayPath(path) _EvtArg0(EV_CMD_DRAWPATH3, 4, 0, 0), (EventScr)(path),
#define WmEvtAddPath(path) _EvtArg0(EV_CMD_WM_DRAWPATH2, 4, 0, 0), (EventScr)(path),
#define WmEvtEnableNode(node) _EvtArg0(EV_CMD_WM_LOADLOCATION2, 4, 0, 0), (EventScr)(node),
#define WmEvtDisplayNode(node) _EvtArg0(EV_CMD_WM_LOADLOCATION3, 4, 0, 0), (EventScr)(node),
#define WmEvtMoveCamToUnit(x, y, wm_uid, speed, delay) _EvtArg0(EV_CMD_WM_88, 8, 0, 0), _EvtParams2(x, y), _EvtParams2(wm_uid, speed), _EvtParams2(delay, 0),
#define WmEvtPasueMove(wm_uid) _EvtArg0(EV_CMD_WM_AA, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtResumeMove(wm_uid) _EvtArg0(EV_CMD_WM_AB, 4, 0, 0), (EventScr)(wm_uid),
#define WmEvtSetCameraAt(x, y) _EvtArg0(EV_CMD_WM_SETCAM, 4, 0, 0), _EvtParams2(x, y),
#define WmEvtMoveCamToNode(x, y, node, speed, delay) _EvtArg0(EV_CMD_WM_MOVECAMTO, 8, 0, 0), _EvtParams2(x, y), _EvtParams2(node, speed), _EvtParams2(delay, 0),
#define WmEvtSetNodeStateNot2(node) _EvtArg0(EV_CMD_WM_9D, 4, 0, 0), (EventScr)(node),
#define WmEvtFadeInDark(speed) _EvtArg0(EV_CMD_WM_SATURATE_COLORS, 4, 0, 0), (EventScr)(speed),
#define WmEvtWaitFadeInDark _EvtAutoCmdLen2(EV_CMD_WM_AE),

enum event_trigger_types {
    EVT_LIST_CMD_END,
    EVT_LIST_CMD_FLAG,
    EVT_LIST_CMD_TURN,
    EVT_LIST_CMD_CHAR,
    EVT_LIST_CMD_CHARASM,
    EVT_LIST_CMD_LOCA,
    EVT_LIST_CMD_VILL,
    EVT_LIST_CMD_CHES,
    EVT_LIST_CMD_DOOR,
    EVT_LIST_CMD_DRAWBRIDGE,
    EVT_LIST_CMD_SHOP,
    EVT_LIST_CMD_AREA,
    EVT_LIST_CMD_NEVER_C,
    EVT_LIST_CMD_NEVER_D,
    EVT_LIST_CMD_E,
    EVT_LIST_CMD_F,
    EVT_LIST_CMD_10,
};

#define EvtListEnd \
    _EvtParams2(EVT_LIST_CMD_END, 0),

#define EvtListFlag(ent_flag, scr, flag) \
    _EvtParams2(EVT_LIST_CMD_FLAG, (ent_flag)), \
    (EventListScr) (scr), (flag),

#define EvtListTurn(ent_flag, scr, turn, turn_max, faction) \
    _EvtParams2(EVT_LIST_CMD_TURN, (ent_flag)), \
    (EventListScr) (scr), \
    _EvtParams4((turn), (turn_max), (faction), 0),

#define EvtListTalk(ent_flag, ent_script, pid_a, pid_b) \
    _EvtParams2(EVT_LIST_CMD_CHAR, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((pid_a), (pid_b), 0, 0), \
    (EventListScr) 0,

#define EvtListConditionalTalk(ent_flag, ent_script, pid_a, pid_b, trigg_eid) \
    _EvtParams2(EVT_LIST_CMD_CHAR, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((pid_a), (pid_b), 0, 0), \
    _EvtParams2((trigg_eid), 3),

#define EvtListTile(ent_flag, ent_script, x, y, tile_command) \
    _EvtParams2(EVT_LIST_CMD_LOCA, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((x), (y), (tile_command), 0),

#define EvtListArea(ent_flag, ent_script, x1, y1, x2, y2) \
    _EvtParams2(EVT_LIST_CMD_AREA, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((x1), (y1), (x2), (y2)),

/* MISC */
enum event3D_menu1override_bitfiles {
    EVENT_MENUOVERRIDE_ATTACK  = 1 << 0x0,
    EVENT_MENUOVERRIDE_STAFF   = 1 << 0x1,
    EVENT_MENUOVERRIDE_WAIT    = 1 << 0x2,
    EVENT_MENUOVERRIDE_RESCUE  = 1 << 0x3,
    EVENT_MENUOVERRIDE_DROP    = 1 << 0x4,
    EVENT_MENUOVERRIDE_VISIT   = 1 << 0x5,
    EVENT_MENUOVERRIDE_TALK    = 1 << 0x6,
    EVENT_MENUOVERRIDE_ITEM    = 1 << 0x7,
    EVENT_MENUOVERRIDE_DISCARD = 1 << 0x8,
    EVENT_MENUOVERRIDE_TRADE   = 1 << 0x9,
    EVENT_MENUOVERRIDE_SUPPLY  = 1 << 0xA,
    EVENT_MENUOVERRIDE_SUPPORT = 1 << 0xB,
    EVENT_MENUOVERRIDE_ARMORY  = 1 << 0xC,
    EVENT_MENUOVERRIDE_OPTIONS = 1 << 0xD,
    EVENT_MENUOVERRIDE_END     = 1 << 0xE,
};

enum event3D_menu2override_bitfiles {
    EVENT_MENUOVERRIDE_WEAPON1 = 1 << 0,
    EVENT_MENUOVERRIDE_WEAPON2 = 1 << 1,
    EVENT_MENUOVERRIDE_WEAPON3 = 1 << 2,
    EVENT_MENUOVERRIDE_WEAPON4 = 1 << 3,
    EVENT_MENUOVERRIDE_WEAPON5 = 1 << 4,
};
