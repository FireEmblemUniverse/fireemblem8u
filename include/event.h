#ifndef GUARD_EVENT_H
#define GUARD_EVENT_H

#include "global.h"

struct EventEngineProc {
    PROC_HEADER;

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

    /* 46 */ // pad

    /* 48 */ const void* pUnitLoadData;
    /* 4C */ s16 unitLoadCount;

    /* 4E */ u8  idk4E;

    /* 4F */ u8 _pad_4F[0x54 - 0x4F];
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

// This will probably be used in evtcmd_gmap/evtscr for defining the event code handler arrays or something
typedef u8(*EventFuncType)(struct EventEngineProc*);

// ??? _MarkSomethingInMenu(???);
// ??? EventEngine_OnUpdate(???);
// ??? EventEngine_OnEnd(???);
// ??? EnqueueEventCall(???);
// ??? CallNextQueuedEvent(???);
void CallEvent(const u16* events, u8 execType);
struct EventEngineProc* EventEngine_Create(const u16* events, u8 idk);
void EventEngine_CreateBattle(const u16* events);
s8 EventEngineExists(void);
int BattleEventEngineExists(void);
void DeleteEventEngines(void);
// ??? sub_800D1E4(???);
void SetEventSlotC(unsigned value);
// ??? sub_800D204(???);
int sub_800D208(void);
// ??? CallBattleQuoteEvent(???);
void CallBattleQuoteEventInBattle(u16 textIndex);
void CallTileChangeEvent(u16 tileChangeIndex);
void CallChestOpeningEvent(u16 tileChangeIndex, u16 idr);
void CallMapSupportEvent(u16 musicIndex, u16 textIndex);
void CallSupportViewerEvent(u16);
void CallRetreatPromptEvent(void);
void CallSuspendPromptEvent(void);
void CallGameOverEvent(void);
void sub_800D3E4(void);
// ??? EventEngine_StartSkip(???);
// ??? sub_800D488(???);
// ??? SetEventTriggerState(???);
s8 GetEventTriggerState(u16 triggerId);
// ??? sub_800D4D4(???);
// ??? sub_800D524(???);
// ??? SlotQueuePush(???);
// ??? SlotQueuePop(???);
void SetEventSlotCounter(unsigned value);
unsigned GetEventSlotCounter(void);

#endif // GUARD_EVENT_H
