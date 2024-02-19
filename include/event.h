#ifndef GUARD_EVENT_H
#define GUARD_EVENT_H

#include "global.h"
#include "bmunit.h"

typedef uintptr_t EventListScr;
typedef uintptr_t EventScr;

struct EventEngineProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ void (*pCallback)(struct EventEngineProc*);

    /* 30 */ const u16* pEventStart;
    /* 34 */ const u16* pEventIdk;
    /* 38 */ const u16* pEventCurrent;

    /* 3C */ u16 evStateBits;
    /* 3E */ u16 evStallTimer;

    /* 40 */ s8 overwrittenTextSpeed;
    /* 41 */ u8 execType;
    /* 42 */ u8 activeTextType;
    /* 43 */ u8 chapterIndex;

    /* 44 */ u16 mapSpritePalIdOverride;

    /* 46 */ STRUCT_PAD(0x46, 0x48);

    /* 48 */ const struct UnitDefinition* pUnitLoadData;
    /* 4C */ s16 unitLoadCount;
    
    /* 4E */ u8  chance;

    /* 4F */ u8 unitLoadParameter : 7;
    /* 4F */ u8 diable_REDA : 1;

    /* 50 */ STRUCT_PAD(0x50, 0x54);
    /* 54 */ struct Unit *unit;
};

enum EventExecType {
    EV_EXEC_WORLDMAP  = 0, // for world map events
    EV_EXEC_CUTSCENE  = 1, // for overall chapter cutscene events?
    EV_EXEC_GAMEPLAY  = 2, // for gameplay-triggered events? (battle quotes, villages tile changes, chests, game over)
    EV_EXEC_QUIET     = 3, // for events that should just execute events? (no fade, no clearing stuff, etc)
    EV_EXEC_UNK4      = 4, // not used?
    EV_EXEC_UNK5      = 5  // not used?
};

enum EventStateFlags {
    EV_STATE_NONE      = 0,

    EV_STATE_ABORT     = (1 << 0x0), // queued event engine calls will wait
    EV_STATE_0002      = (1 << 0x1), // prevents "ENDA events" to play. Needs further investigation
    EV_STATE_SKIPPING  = (1 << 0x2), // currently skipping events (trigger with start)
    EV_STATE_0008      = (1 << 0x3), // ??? seems to be dialogue related
    EV_STATE_NOSKIP    = (1 << 0x4), // prevents skipping with start, set by EVBIT_MODIFY
    EV_STATE_0020      = (1 << 0x5), // set by EVBIT_MODIFY
    EV_STATE_0040      = (1 << 0x6), // set by EVBIT_MODIFY
    EV_STATE_NOFADE    = (1 << 0x7), // don't fade at end of events
    EV_STATE_FADEDIN   = (1 << 0x8), // faded into white/back
    EV_STATE_UNITCAM   = (1 << 0x9), // camera follows unit movement
    EV_STATE_CHANGECH  = (1 << 0xA), // moving to another chapter (?)
    EV_STATE_CHANGEGM  = (1 << 0xB), // changing "game mode" (GAMECTRL field 0x29 was changed?)
    EV_STATE_GFXLOCKED = (1 << 0xC)  // set when the game graphics have been locked through events (codes 0x23/0x24)

    // I don't think there's more, but I could be wrong
};

enum EventCommandReturnCode
{
    EVC_ADVANCE_CONTINUE = 0,
    EVC_STOP_CONTINUE    = 1,

    EVC_ADVANCE_YIELD    = 2,
    EVC_STOP_YIELD       = 3,
    
    EVC_UNK4             = 4,
    EVC_END              = 5,
    EVC_ERROR            = 6
};

enum EventSlotIdx
{
    EVT_SLOT_0 = 0,
    EVT_SLOT_1,
    EVT_SLOT_2,
    EVT_SLOT_3,
    EVT_SLOT_4,
    EVT_SLOT_5,
    EVT_SLOT_6,
    EVT_SLOT_7,
    EVT_SLOT_8,
    EVT_SLOT_9,
    EVT_SLOT_A,
    EVT_SLOT_B,
    EVT_SLOT_C,
    EVT_SLOT_D,
};

// This will probably be used in evtcmd_gmap/evtscr for defining the event code handler arrays or something
typedef u8(*EventFuncType)(struct EventEngineProc*);

/**
 * event slot values
 * 
 * Null (0)
 * Vars (1-A)
 * Position (B)
 * Check (C)
 * QP (D)
 */
#define EVENT_SLOT_COUNT 0xE
extern u32 gEventSlots[EVENT_SLOT_COUNT];

struct EnqueuedEventCall {
    const u16* events;
    u8 execType;
    s8 isUsed;
};

extern struct EnqueuedEventCall gEventCallQueue[];

struct Struct03000570 {
    const u16 * evt1;
    const u16 * evt2;
};

extern struct Struct03000570 gEventActiveQueue[];

#define EVT_SUB_CMD(scr) (*((const u8 *)(scr)) & 0xF)
#define EVT_SUB_CMD_LO(scr) (*((const u16 *)(scr)) & 0x7)
#define EVT_SUB_CMD_HI(scr) ((*((const u16 *)(scr)) & 0xF) >> 0x3)

#define EVT_CMD_LEN(scr) ((*((const u16 *)(scr)) >> 0x4) & 0xF)
#define EVT_CMD_ARGV(scr) ((const s16 *)(scr) + 1)
#define EVT_CMD_ARG32_BE(scr) ((u16)EVT_CMD_ARGV(scr)[1] | ((u16)EVT_CMD_ARGV(scr)[2] << 0x10))
#define EVT_CMD_ARG32_LE(scr) (*((u32 *)(EVT_CMD_ARGV(scr) + 1)))

struct ConvoBackgroundFadeProc
{
    PROC_HEADER;

    /* 29 */ u8 fadeType;
    /* 2A */ u8 unkType;

    /* 2C */ u16 bgIndex;
    /* 2E */ u16 fadeSpeed;
    /* 30 */ u16 fadeTimer;

    /* 34 */ struct EventEngineProc * pEventEngine;
};

struct Struct03000428
{
    char str[4];
    u8 unk04;
    u8 unk05;
};

struct ScriptedBattleProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * evtproc;
    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 lock;
};

struct Proc8591C68
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 faceSlot;
};

extern struct Struct03000428 gUnknown_03000428;
extern char gUnknown_03000430[4];
extern struct Unit * gLoadedUnitBuffer;
extern u32 gEventSlotQueue[]; // event slot queue (just an array)
extern u32 gEventSlotCounter;
extern struct ProcCmd gGenericProc[4];
extern struct UnitDefinition gLoadUnitBuffer[];

extern struct ProcCmd ProcScr_StdEventEngine[]; // map event engine proc
extern struct ProcCmd ProcScr_BattleEventEngine[]; // battle (?) event engine proc
extern EventFuncType gEventLoCmdTable[]; // regular event functions
extern EventFuncType gEventHiCmdTable[]; // gmap event functions
extern struct ProcCmd ProcScr_EventEngineDeamon[]; // map event engine "witness lock" (alive while map event engine is)

extern struct ProcCmd gUnknown_08591DE8[]; // "face witness"
extern struct ProcCmd gUnknown_08591E00[];
extern struct ProcCmd gUnknown_08591E58[];
extern struct ProcCmd gUnknown_08591EB0[];
extern struct ProcCmd CONST_DATA ProcScr_EventDisplayCursor[];
extern struct ProcCmd CONST_DATA ProcScr_ScriptBattleDeamon[];
extern struct ProcCmd CONST_DATA ProcScr_EventPromoteUnit[];

extern EventListScr EventScr_Nop[];
extern EventScr EventScr_RemoveBGIfNeeded[];
extern EventScr EventScr_08591F64[];
extern EventScr EventScr_DisplayBattleQuote[];
extern EventScr EventScr_TriggerQueuedTileChanges[];
extern EventScr EventScr_OpenChest[];
extern EventListScr EventScr_08591FD8[];
extern EventScr EventScr_MapSupportConversation[];
extern EventScr EventScr_SupportViewerConversation[];
extern EventScr EventScr_SkirmishRetreat[];
extern EventScr EventScr_SuspendPrompt[];
extern EventScr EventScr_GameOver[];
extern EventScr EventScr_08592114[];
extern EventScr EventScr_08592140[];
extern EventScr EventScr_08592170[];
extern u16 CONST_DATA Obj_EventShinningCursor[];

void _FreezeMenu(void);
void EventEngine_OnUpdate(struct EventEngineProc* proc);
void EventEngine_OnEnd(struct EventEngineProc* proc);
void EnqueueEventCall(const u16* events, u8 execType);
void CallNextQueuedEvent(void);
void CallEvent(const u16* events, u8 execType);
struct EventEngineProc* EventEngine_Create(const u16* events, u8 idk);
void EventEngine_CreateBattle(const u16* events);
s8 EventEngineExists(void);
int BattleEventEngineExists(void);
void DeleteEventEngines(void);
void BlockProcForEventEngine(ProcPtr proc);
void SetEventSlotC(unsigned value);
void sub_800D204(void);
int sub_800D208(void);
void CallBattleQuoteEvent(u16 textIndex);
void CallBattleQuoteEventInBattle(u16 textIndex);
void CallTileChangeEvent(u16 tileChangeIndex);
void CallChestOpeningEvent(u16 tileChangeIndex, u16 idr);
void CallMapSupportEvent(u16 musicIndex, u16 textIndex);
void CallSupportViewerEvent(u16);
void CallRetreatPromptEvent(void);
void CallSuspendPromptEvent(void);
void CallGameOverEvent(void);
bool8 EventEngine_CanStartSkip(struct EventEngineProc* proc);
void SetDialogueSkipEvBit(void);
void EventEngine_StartSkip(struct EventEngineProc * proc);
void sub_800D488(struct EventEngineProc * unused);
void SetEventTriggerState(u16 triggerId, bool8 value);
s8 GetEventTriggerState(u16 triggerId);
ProcPtr MergeGenericProc(ProcPtr parent, ProcFunc init, ProcFunc loop, ProcFunc dest);
void sub_800D524(void);
void SlotQueuePush(unsigned value);
unsigned SlotQueuePop(void);
void SetEventSlotCounter(unsigned value);
unsigned GetEventSlotCounter(void);

void CopyBgImage(u8 bg1, u8 bg2, u8 nbgs);
void CopyBgTiles(u8 src, u8 dst, u8 nbgs);
void CopyBgPalette(u8 src, u8 dst, u8 npals);
// void BgChangeChr(u8 bg, u8 b);
void sub_800BA04(u8, u8);
void sub_800BA34(void);
void SetSomeRealCamPos(int x, int y, s8 unk);
void EventSetFogVisionExt(s16, s8, ProcPtr);
void TriggerMapChanges(u16 mapChangeId, s8 displayFlag, ProcPtr parent);
void UntriggerMapChange(u16 mapChangeId, s8 displayFlag, ProcPtr parent);
void ResetBkselPalette(void);
void ResetBkselPalette(void);
s8 GetAllyUnitCount(u16 pid);
u16 GetNpcUnitCount(void);
void HideAllUnits(void);
struct Unit * GetUnitStructFromEventParameter(s16 pid);
void ChangeUnitSpritePalette(u16); // battle related
u8 Event80_WmSkip_Unsure(struct EventEngineProc * proc);
u8 Event81_WmFadeOut(struct EventEngineProc * proc);
u8 Event82_WmEnd(struct EventEngineProc * proc);
u8 Event83_WmSetCamera(struct EventEngineProc * proc);
u8 Event84_WmSetCameraOntoNode(struct EventEngineProc * proc);
u8 Event85_WmSetCameraOntoUnit(struct EventEngineProc * proc);
u8 Event86_WmScrollCamera(struct EventEngineProc * proc);
u8 Event87_WmScrollCameraOntoNode(struct EventEngineProc * proc);
u8 Event88_WmScrollCameraOntoUnit(struct EventEngineProc * proc);
u8 Event89_WmScrollWait(struct EventEngineProc * proc);
u8 Event8A_WmShowCursor_Unsure(struct EventEngineProc * proc);
void Event8B_WmHideCursor_Unsure(void);
u8 Event8C_WmSetCursor_Unsure(struct EventEngineProc * proc);
u8 Event8D_WmNop(struct EventEngineProc * proc);
u8 Event8E_WmNop(struct EventEngineProc * proc);
u8 Event8F_WmNop(struct EventEngineProc * proc);
u8 Event90_WmAddPathDisplayed(struct EventEngineProc * proc);
u8 Event91_WmAddPath(struct EventEngineProc * proc);
u8 Event92_WmRemovePath(struct EventEngineProc * proc);
u8 Event93_WmEnableNode(struct EventEngineProc * proc);
u8 Event94_WmDisableNode(struct EventEngineProc * proc);
u8 Event95_WmEnableNodeDisplayed(struct EventEngineProc * proc);
u8 Event96_WmEnablePathTargetDisplayed(struct EventEngineProc * proc);
u8 Event97_WmInitNextStoryNode(struct EventEngineProc * proc);
u8 Event98_WmSetNextStoryNodePath(struct EventEngineProc * proc);
u8 Event99_GmNodeDisplayWait(struct EventEngineProc * proc);
u8 Event9A_WmSetStoryNodeSilent(struct EventEngineProc * proc);
u8 Event9B_WmSetNextStoryNodeSilentNoFlag(struct EventEngineProc * proc);
u8 Event9C_(struct EventEngineProc * proc);
u8 Event9D_(struct EventEngineProc * proc);
u8 Event9E_WmSetClassUnit(struct EventEngineProc * proc);
u8 Event9F_WmSetCharUnit(struct EventEngineProc * proc);
u8 EventA0_WmRemoveUnit(struct EventEngineProc * proc);
u8 EventA1_WmShowUnit(struct EventEngineProc * proc);
u8 EventA2_WmHideUnit(struct EventEngineProc * proc);
u8 EventA3_WmShowUnitFaded(struct EventEngineProc * proc);
u8 EventA4_WmHideUnitFaded(struct EventEngineProc * proc);
u8 EventA5_WmUnitFadeWait(struct EventEngineProc * proc);
u8 EventA6_WmUnitSetOnNode(struct EventEngineProc * proc);
u8 EventA7_WmUnitSetPosition(struct EventEngineProc * proc);
u8 EventA8_WmUnitMoveFree(struct EventEngineProc * proc);
u8 EventA9_WmUnitMovePaths(struct EventEngineProc * proc);
u8 EventAA_WmUnitPauseMove(struct EventEngineProc * proc);
u8 EventAB_WmUnitResumeMove(struct EventEngineProc * proc);
u8 EventAC_WmUnitMoveWait(struct EventEngineProc * proc);
u8 EventAD_WmFadeToDarker(struct EventEngineProc * proc);
u8 EventAE_WmFadeToDarkerWait(struct EventEngineProc * proc);
u8 EventAF_WmShowTextBox(struct EventEngineProc * proc);
u8 EventB0_WmHideTextBox_Bugged(struct EventEngineProc * proc);
u8 EventB1_WmTextBoxWait(struct EventEngineProc * proc);
u8 EventB2_WmFancyFade(struct EventEngineProc * proc);
u8 EventB3_WmFancyFadeWait(struct EventEngineProc * proc);
u8 EventB4_WmDisplayBigMap(struct EventEngineProc * proc);
u8 EventB5_WmHideBigMap(struct EventEngineProc * proc);
u8 EventB6_WmMoveBigMap(struct EventEngineProc * proc);
u8 EventB7_WmBigMapWait(struct EventEngineProc * proc);
u8 EventB8_WmShowBigMapHighlight(struct EventEngineProc * proc);
u8 EventB9_WmRemoveHighlightNationPart1(struct EventEngineProc * proc);
u8 EventBA_WmRemoveHighlightNationPart2(struct EventEngineProc * proc);
u8 EventBB_(struct EventEngineProc * proc);
u8 EventBC_MarkPoint(struct EventEngineProc * proc);
u8 EventBD_(struct EventEngineProc * proc);
u8 EventBE_(struct EventEngineProc * proc);
u8 EventBF_(struct EventEngineProc * proc);
u8 EventC0_(struct EventEngineProc * proc);
u8 EventC1_SKIPWM(struct EventEngineProc * proc);
u8 EventC2_WmNoFade(struct EventEngineProc * proc);
u8 EventC3_SpawnLord(struct EventEngineProc * proc);
u8 EventCE_(struct EventEngineProc * proc);
u8 EventCF_(struct EventEngineProc * proc);
u8 EventC4_WmShowPortrait(struct EventEngineProc * proc);
void nop_800CCE8(void);
void nullsub_32(void);
u8 EventC5_WmClearPortrait(struct EventEngineProc * proc);
void nop_800CD38(struct Proc8591C68 * proc);
void nullsub_34(struct Proc8591C68 * proc);
void EventFaceDeamonDelete(struct Proc8591C68 * proc);
u8 EventC6_WmDisplayText(struct EventEngineProc * proc);
u8 EventC7_(struct EventEngineProc * proc);
u8 EventC8_(struct EventEngineProc * proc);
u8 EventC9_RemoveWmText(struct EventEngineProc * proc);
u8 EventCA_(struct EventEngineProc * proc);
u8 EventCB_(struct EventEngineProc * proc);
u8 EventCC_(struct EventEngineProc * proc);
u8 EventCD_(struct EventEngineProc * proc);
u8 Event00_NULL(struct EventEngineProc * proc);
u8 Event01_End(struct EventEngineProc * proc);
u8 Event02_EvBitAndIdMod(struct EventEngineProc * proc);
u8 Event03_CheckEvBitOrId(struct EventEngineProc * proc);
u8 Event04_CheckRandom(struct EventEngineProc * proc);
u8 Event05_SetSlot(struct EventEngineProc * proc);
u8 Event06_SlotOperation(struct EventEngineProc * proc);
u8 Event07_SlotQueueOperations(struct EventEngineProc * proc);
u8 Event08_Label(struct EventEngineProc * proc);
u8 Event09_Goto(struct EventEngineProc * proc);
u8 Event0A_Call(struct EventEngineProc * proc);
u8 Event0B_EnqueueCall(struct EventEngineProc * proc);
u8 Event0C_Branch(struct EventEngineProc * proc);
u8 Event0D_AsmCall(struct EventEngineProc * proc);
u8 Event0E_STAL(struct EventEngineProc * proc);
u8 Event0F_CounterOps(struct EventEngineProc * proc);
u8 Event10_ModifyEvBit(struct EventEngineProc * proc);
u8 Event11_SetIgnoredKeys(struct EventEngineProc * proc);
u8 Event12_StartBGM(struct EventEngineProc * proc);
u8 Event13_BgmFadeIn(struct EventEngineProc * proc);
u8 Event14_BgmOverideRestore(struct EventEngineProc * proc);
u8 Event15_BgmVolume(struct EventEngineProc * proc);
u8 Event16_(struct EventEngineProc * proc);
u8 Event17_Fade(struct EventEngineProc * proc);
u8 Event18_ColorFade(struct EventEngineProc * proc);
u8 Event19_Checks(struct EventEngineProc * proc);
u8 Event1A_TEXTSTART(struct EventEngineProc * proc);
// ??? sub_800E210(???);
// ??? sub_800E290(???);
// ??? sub_800E31C(???);
u8 Event1B_TEXTSHOW(struct EventEngineProc * proc);
u8 Event1C_TEXTCONT(struct EventEngineProc * proc);
u8 Event1D_TEXTEND(struct EventEngineProc * proc);
void sub_800E640(struct EventEngineProc*);
// ??? _WhileFace6CExists(???);
u8 Event1E_(struct EventEngineProc * proc);
u8 Event1F_(struct EventEngineProc * proc);
u8 Event20_(struct EventEngineProc * proc);
u8 EventShowTextBgDirect(u8 mode, u16 bgIndex);
u8 Event21_TextBg(struct EventEngineProc * proc);
// ??? sub_800EA84(???);
// ??? sub_800EBB0(???);
// ??? sub_800EC00(???);
// ??? sub_800EC50(???);
// ??? sub_800ED50(???);
// ??? sub_800EE54(???);
// ??? sub_800EEE8(???);
// ??? sub_800EF48(???);
u8 Event22_ClearScreen(struct EventEngineProc *); // CLEAN
u8 Event23_DisaleMapDisp(struct EventEngineProc *); // Lock Game Graphics
u8 Event24_EnableMapDisp(struct EventEngineProc *); // Resume Game Graphics
u8 Event25_ChangeMap(struct EventEngineProc *);
u8 Event26_CameraControl(struct EventEngineProc * proc);
u8 Event27_MapChange(struct EventEngineProc * proc);
u8 Event28_ChangeWeather(struct EventEngineProc * proc);
u8 Event29_SetFogVision(struct EventEngineProc * proc);
u8 Event2A_MoveToChapter(struct EventEngineProc * proc);
// ??? GetLoadUnitsAmount(???);
// ??? ShouldUNITBeLoaded(???);
// ??? EventLoadUnitWithMovement(???);
void EventLoadUnitSliently(const struct UnitDefinition* def, s16 count, u8 param);
void LoadUnit_800F704(const struct UnitDefinition *, u16, s8, s8);
void sub_800F8A8(struct Unit*, const struct UnitDefinition*, u16, s8);
// ??? GetUnitDefinitionFormEventScr(???);
u8 Event2B_ConfigLoadUnit(struct EventEngineProc * proc);
u8 Event2C_LoadUnits(struct EventEngineProc * proc);
u8 TryPrepareEventUnitMovement(struct EventEngineProc * proc, int x, int y);
unsigned ModifyMoveUnitFlag(struct EventEngineProc *, s8);
u8 Event2D_ChangeSpritePal(struct EventEngineProc * proc);
u8 Event2E_CheckAt(struct EventEngineProc * proc);
u8 Event2F_MoveUnit(struct EventEngineProc * proc);
u8 Event30_ENUN(struct EventEngineProc * proc);
u8 Event31_DisplayEffectRange(struct EventEngineProc * proc);
u8 Event32_SpawnSingleUnit(struct EventEngineProc * proc);
u8 Event33_CheckUnitVarious(struct EventEngineProc * proc);
u8 Event34_MessWithUnitState(struct EventEngineProc * proc);
u8 Event35_UnitClassChanging(struct EventEngineProc * proc);
u8 Event36_CheckInArea(struct EventEngineProc * param_1);
u8 Event37_GiveItem(struct EventEngineProc * proc);
u8 Event38_ChangeActiveUnit(struct EventEngineProc * proc);
u8 Event39_ChangeAiScript(struct EventEngineProc * proc);
u8 Event3A_DisplayPopup(struct EventEngineProc * proc);
// ??? EventDisplayCursor_Loop(???);
u8 Event3B_DisplayCursor(struct EventEngineProc * proc);
u8 Event3C_MoveCursor(struct EventEngineProc * proc);
u8 Event3D_MenuOverride(struct EventEngineProc * proc);
u8 Event3E_PrepScreenCall(struct EventEngineProc * proc);
// ??? GenerateScriptBattleHitFormEventQueue(???);
// ??? ScriptBattleDeamon(???);
u8 Event3F_ScriptBattle(struct EventEngineProc * proc);
// ??? WaitEventPromoteDone(???);
u8 Event40_PromoteUnit(struct EventEngineProc * proc);
u8 Event41_Warp(struct EventEngineProc * proc);
u8 Event42_EarthQuake(struct EventEngineProc * proc);
u8 Event43_SummonUnit(struct EventEngineProc * proc);
u8 Event44_BreakingSacredStone(struct EventEngineProc * proc);
u8 Event45_GlowingCross(struct EventEngineProc * proc);

#define EVENT_IS_SKIPPING(aEventEngineProc) (((aEventEngineProc)->evStateBits >> 2) & 1)

#endif // GUARD_EVENT_H
