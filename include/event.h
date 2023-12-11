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

extern struct Struct03000428 gUnknown_03000428;
extern char gUnknown_03000430[4];
extern struct Unit * gLoadedUnitBuffer;
// extern ??? gUnknown_030004E4
// extern ??? gUnknown_030004E6
// extern ??? gUnknown_030004E8
extern u32 gEventSlotQueue[]; // event slot queue (just an array)
extern u32 gEventSlotCounter;
extern struct ProcCmd gGenericProc[4];
extern struct UnitDefinition gLoadUnitBuffer[];

extern const struct ProcCmd gProc_StdEventEngine[]; // map event engine proc
extern const struct ProcCmd gProc_BattleEventEngine[]; // battle (?) event engine proc
extern const EventFuncType gEventLoCmdTable[]; // regular event functions
extern const EventFuncType gEventHiCmdTable[]; // gmap event functions
extern const struct ProcCmd gUnknown_08591DD8[]; // map event engine "witness lock" (alive while map event engine is)

extern struct ProcCmd gUnknown_08591DE8[]; // "face witness"
extern struct ProcCmd gUnknown_08591E00[];
extern struct ProcCmd gUnknown_08591E58[];
extern struct ProcCmd gUnknown_08591EB0[];
extern struct ProcCmd CONST_DATA ProcScr_EventDisplayCursor[];
extern struct ProcCmd CONST_DATA ProcScr_ScriptBattleDeamon[];
extern struct ProcCmd CONST_DATA gUnknown_08591F28[];
extern EventScr EventScr_RemoveBGIfNeeded[];
extern const u16 gEvent_DisplayBattleQuote[];
extern const u16 gEvent_TriggerQueuedTileChanges[];
extern const u16 gEvent_OpenChest[];
extern const u16 gEvent_MapSupportConversation[];
extern const u16 gEvent_SupportViewerConversation[];
extern const u16 gEvent_SkirmishRetreat[];
extern const u16 gEvent_SuspendPrompt[];
extern const u16 gEvent_GameOver[];
extern u16 gEvent_08592114[];
extern u16 CONST_DATA Obj_EventShinningCursor[];

void _MarkSomethingInMenu(void);
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
void sub_800D1E4(ProcPtr proc);
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

// void sub_800B910(u8 bg1, u8 bg2, u8 c);
// void sub_800B954(u8 a, u8 bg, u8 c);
// void sub_800B994(u8 a, u8 b, u8 c);
// void sub_800B9B8(u8 bg, u8 b);
// void sub_800BA04(u8 a, u8 b);
void sub_800BA34(void);
void SetSomeRealCamPos(int x, int y, s8 unk);
void sub_800BAA8(s16, s8, ProcPtr);
void TriggerMapChanges(u16 mapChangeId, s8 displayFlag, ProcPtr parent);
void UntriggerMapChange(u16 mapChangeId, s8 displayFlag, ProcPtr parent);
void sub_800BB98(void);
void sub_800BB98(void);
s8 sub_800BBB4(u16 pid);
u16 sub_800BBE4(void);
void HideAllUnits(void);
struct Unit * GetUnitStructFromEventParameter(s16 pid);
void sub_800BCDC(u16); // battle related
// ??? Event80_WmSkip_Unsure(???);
// ??? Event81_WmFadeOut(???);
// ??? Event82_WmEnd(???);
// ??? Event83_WmSetCamera(???);
// ??? Event84_WmSetCameraOntoNode(???);
// ??? Event85_WmSetCameraOntoUnit(???);
// ??? Event86_WmScrollCamera(???);
// ??? Event87_WmScrollCameraOntoNode(???);
// ??? Event88_WmScrollCameraOntoUnit(???);
// ??? Event89_WmScrollWait(???);
// ??? Event8A_WmShowCursor_Unsure(???);
// ??? Event8B_WmHideCursor_Unsure(???);
// ??? Event8C_WmSetCursor_Unsure(???);
// ??? Event8D_WmNop(???);
// ??? Event8E_WmNop(???);
// ??? Event8F_WmNop(???);
// ??? Event90_WmAddPathDisplayed(???);
// ??? Event91_WmAddPath(???);
// ??? Event92_WmRemovePath(???);
// ??? Event93_WmEnableNode(???);
// ??? Event94_WmDisableNode(???);
// ??? Event95_WmEnableNodeDisplayed(???);
// ??? Event96_WmEnablePathTargetDisplayed(???);
// ??? Event97_WmInitNextStoryNode(???);
// ??? Event98_WmSetNextStoryNodePath(???);
// ??? Event99_GmNodeDisplayWait(???);
// ??? Event9A_WmSetStoryNodeSilent(???);
// ??? Event9B_WmSetNextStoryNodeSilentNoFlag(???);
// ??? Event9C_(???);
// ??? Event9D_(???);
// ??? Event9E_WmSetClassUnit(???);
// ??? Event9F_WmSetCharUnit(???);
// ??? EventA0_WmRemoveUnit(???);
// ??? EventA1_WmShowUnit(???);
// ??? EventA2_WmHideUnit(???);
// ??? EventA3_WmShowUnitFaded(???);
// ??? EventA4_WmHideUnitFaded(???);
// ??? EventA5_WmUnitFadeWait(???);
// ??? EventA6_WmUnitSetOnNode(???);
// ??? EventA7_WmUnitSetPosition(???);
// ??? EventA8_WmUnitMoveFree(???);
// ??? EventA9_WmUnitMovePaths(???);
// ??? EventAA_WmUnitPauseMove(???);
// ??? EventAB_WmUnitResumeMove(???);
// ??? EventAC_WmUnitMoveWait(???);
// ??? EventAD_WmFadeToDarker(???);
// ??? EventAE_WmFadeToDarkerWait(???);
// ??? EventAF_WmShowTextBox(???);
// ??? EventB0_WmHideTextBox_Bugged(???);
// ??? EventB1_WmTextBoxWait(???);
// ??? EventB2_WmFancyFade(???);
// ??? EventB3_WmFancyFadeWait(???);
// ??? EventB4_WmDisplayBigMap(???);
// ??? EventB5_WmHideBigMap(???);
// ??? EventB6_WmMoveBigMap(???);
// ??? EventB7_WmBigMapWait(???);
// ??? EventB8_WmShowBigMapHighlight(???);
// ??? EventB9_(???);
// ??? EventBA_(???);
// ??? EventBB_(???);
// ??? EventBC_(???);
// ??? EventBD_(???);
// ??? EventBE_(???);
// ??? EventBF_(???);
// ??? EventC0_(???);
// ??? EventC1_SKIPWM(???);
// ??? EventC2_(???);
// ??? EventC3_(???);
// ??? EventCE_(???);
// ??? EventCF_(???);
// ??? EventC4_(???);
// ??? sub_800CCE8(???);
// ??? nullsub_32(???);
// ??? EventC5_(???);
// ??? sub_800CD38(???);
// ??? nullsub_34(???);
// ??? sub_800CD40(???);
// ??? EventC6_(???);
// ??? EventC7_(???);
// ??? EventC8_(???);
// ??? EventC9_(???);
// ??? sub_800CDE8(???);
// ??? sub_800CDEC(???);
// ??? EventCA_(???);
// ??? EventCB_(???);
// ??? EventCC_(???);
// ??? EventCD_(???);
// ??? Event00_NULL(???);
// ??? Event01_End(???);
// ??? Event02_EvBitAndIdMod(???);
// ??? Event03_CheckEvBitOrId(???);
// ??? Event04_CheckRandom(???);
// ??? Event05_SetSlot(???);
// ??? Event06_SlotOperation(???);
// ??? Event07_SlotQueueOperations(???);
// ??? Event08_Label(???);
// ??? Event09_Goto(???);
// ??? Event0A_Call(???);
// ??? Event0B_EnqueueCall(???);
// ??? Event0C_Branch(???);
// ??? Event0D_AsmCall(???);
// ??? Event0E_STAL(???);
// ??? Event0F_(???);
// ??? Event10_ModifyEvBit(???);
// ??? Event11_SetIgnoredKeys(???);
// ??? Event12_StartBGM(???);
// ??? Event12_BgmFadeIn(???);
// ??? Event14_(???);
// ??? Event15_BgmVolume(???);
// ??? Event16_(???);
// ??? Event17_Fade(???);
// ??? Event18_(???);
// ??? Event19_Checks(???);
// ??? Event1A_TEXTSTART(???);
// ??? sub_800E210(???);
// ??? sub_800E290(???);
// ??? sub_800E31C(???);
// ??? Event1B_TEXTSHOW(???);
// ??? Event1C_TEXTCONT(???);
// ??? Event1D_TEXTEND(???);
void sub_800E640(struct EventEngineProc*);
// ??? _WhileFace6CExists(???);
// ??? Event1E_(???);
// ??? Event1F_(???);
// ??? Event20_(???);
// ??? sub_800E7D0(???);
// ??? Event21_(???);
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
// ??? Event26_CameraControl(???);
// ??? Event27_MapChange(???);
// ??? Event28_ChangeWeather(???);
// ??? Event29_SetFogVision(???);
// ??? Event2A_MoveToChapter(???);
// ??? GetLoadUnitsAmount(???);
// ??? ShouldUNITBeLoaded(???);
// ??? EventLoadUnitWithMovement(???);
void EventLoadUnitSliently(const struct UnitDefinition* def, s16 count, u8 param);
void LoadUnit_800F704(const struct UnitDefinition *, u16, s8, s8);
void sub_800F8A8(struct Unit*, const struct UnitDefinition*, u16, s8);
// ??? GetUnitDefinitionFormEventScr(???);
// ??? Event2B_(???);
// ??? Event2C_LoadUnits(???);
u8 TryPrepareEventUnitMovement(struct EventEngineProc * proc, int x, int y);
unsigned ModifyMoveUnitFlag(struct EventEngineProc *, s8);
// ??? Event2D_GetPid(???);
// ??? Event2E_CheckAt(???);
// ??? Event2F_MoveUnit(???);
// ??? Event30_ENUN(???);
// ??? Event31_DisplayEffectRange(???);
// ??? Event32_SpawnSingleUnit(???);
// ??? Event33_CheckUnitVarious(???);
// ??? Event34_MessWithUnitState(???);
// ??? Event35_UnitClassChanging(???);
// ??? Event36_CheckInArea(???);
// ??? Event37_GiveItem(???);
// ??? Event38_ChangeActiveUnit(???);
// ??? Event39_ChangeAiScript(???);
// ??? Event3A_DisplayPopup(???);
// ??? EventDisplayCursor_Loop(???);
// ??? Event3B_DisplayCursor(???);
// ??? Event3C_(???);
// ??? Event3D_MenuOverride(???);
// ??? Event3E_PrepScreenCall(???);
// ??? GenerateScriptBattleHitFormEventQueue(???);
// ??? ScriptBattleDeamon(???);
// ??? Event3F_ScriptBattle(???);
// ??? sub_8010B48(???);
// ??? Event40_(???);
// ??? Event41_(???);
// ??? Event42_(???);
// ??? Event43_(???);
// ??? Event44_BreakingSacredStone(???);
// ??? Event45_(???);

#define EVENT_IS_SKIPPING(aEventEngineProc) (((aEventEngineProc)->evStateBits >> 2) & 1)

#endif // GUARD_EVENT_H
