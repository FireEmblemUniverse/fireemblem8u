#ifndef GUARD_EVENT_H
#define GUARD_EVENT_H

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
	/* 4C */ u16 unitLoadCount;
	
	/* 4E */ u8  idk4E;
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
	EV_STATE_NONE      = 0x0000, // null

	EV_STATE_ABORT     = 0x0001, // queued event engine calls will wait
	EV_STATE_0002      = 0x0002, // prevents "ENDA events" to play. Needs further investigation
	EV_STATE_SKIPPING  = 0x0004, // currently skipping events (trigger with start)
	EV_STATE_0008      = 0x0008, // ??? seems to be dialogue related
	EV_STATE_NOSKIP    = 0x0010, // prevents skipping with start, set by EVBIT_MODIFY
	EV_STATE_0020      = 0x0020, // set by EVBIT_MODIFY
	EV_STATE_0040      = 0x0040, // set by EVBIT_MODIFY
	EV_STATE_NOFADE    = 0x0080, // don't fade at end of events
	EV_STATE_FADEDIN   = 0x0100, // faded into white/back
	EV_STATE_UNITCAM   = 0x0200, // camera follows unit movement
	EV_STATE_CHANGECH  = 0x0400, // moving to another chapter (?)
	EV_STATE_CHANGEGM  = 0x0800, // changing "game mode" (GAMECTRL field 0x29 was changed?)
	EV_STATE_GFXLOCKED = 0x1000  // set when the game graphics have been locked through events (codes 0x23/0x24)

	// I don't think there's more, but I could be wrong
};

// This will probably be used in evtcmd_gmap/evtscr for defining the event code handler arrays or something
typedef u8(*EventFuncType)(struct EventEngineProc*);

// ??? _MarkSomethingInMenu(???);
// ??? EventEngine_Loop(???);
// ??? EventEngine_Destructor(???);
// ??? EqueueEventEngineCall(???);
// ??? HandleNextEventEngineCall(???);
// ??? CallMapEventEngine(???);
struct EventEngineProc* NewMapEventEngine(const u16* events, u8 idk);
// ??? NewBattleEventEngine(???);
// ??? MapEventEngineExists(???);
// ??? BattleEventEngineExists(???);
// ??? DeleteEventEngines(???);
// ??? sub_800D1E4(???);
// ??? SetEventSlotC(???);
// ??? sub_800D204(???);
// ??? sub_800D208(???);
// ??? sub_800D260(???);
// ??? CallBattleQuoteTextEvents(???);
// ??? sub_800D2A4(???);
// ??? CallSomeOtherEvents(???);
// ??? sub_800D304(???);
// ??? sub_800D330(???);
// ??? sub_800D354(???);
// ??? sub_800D37C(???);
// ??? sub_800D390(???);
// ??? sub_800D3E4(???);
// ??? sub_800D414(???);
// ??? sub_800D488(???);
// ??? sub_800D49C(???);
// ??? CheckEventId_(???);
// ??? sub_800D4D4(???);
// ??? sub_800D524(???);
// ??? SlotQueuePush(???);
// ??? SlotQueuePop(???);
// ??? SetEventCounter(???);
// ??? sub_800D594(???);

#endif // GUARD_EVENT_H
