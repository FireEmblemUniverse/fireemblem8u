#include "global.h"
#include "proc.h"
#include "event.h"

// TODO: move those where they belong when possible
void sub_8013D08(int speed, struct Proc* parent); // aka NewFadeInBack
void sub_800E640(struct EventEngineProc*);

static bool8 sub_800D3A4(struct EventEngineProc*);
static void  sub_800D488(struct EventEngineProc*);
static void  HandleNextEventEngineCall(void); // local

#define EVENT_SLOT_COUNT 0xE

struct EnqueuedEventCall {
	const u16* events;
	u8 idk1;
	s8 idk2;
};

extern unsigned gUnknown_030004B8[EVENT_SLOT_COUNT]; // event slot values (Null (0), Vars (1-A) + Position (B) + Check (C) + QP (D))
extern unsigned gUnknown_030004F0[]; // event slot queue (just an array)

extern unsigned gUnknown_03000568;

// TODO: better
extern struct EnqueuedEventCall gUnknown_03000438[]; // gEventCallQueue

extern struct ProcCmd gUnknown_030005B0[4];

extern const EventFuncType gUnknown_08591B28[]; // regular event functions
extern const EventFuncType gUnknown_08591C98[]; // gmap event functions

extern const struct ProcCmd gUnknown_08591AC0[]; // map event engine proc
extern const struct ProcCmd gUnknown_08591AF8[]; // battle (?) event engine proc

extern const struct ProcCmd gUnknown_08591DD8[]; // map event engine "witness lock" (alive while map event engine is)

// TODO: actual events

extern const u16 gUnknown_08591F88[]; /*
	1020 0003 | EVBIT_MODIFY 3  // modifies event state bits (how?)
	1B20 FFFF | TEXTSHOW 0xFFFF // Show text in event slot 2
	1D20 0000 | TEXTEND         // Ends text
	1B22 0000 | REMA            // deletes all text-related procs (or something)
	0120 0000 | ENDA            // ends event execution
*/

extern const u16 gUnknown_08591F9C[]; /*
	1020 0001 | EVBIT_MODIFY 1    // modifies event state bits (how?)
	2720 FFFD | TILECHANGE 0xFFFD // Changes tile by tile change id in event slot Queue (or something)
	0120 0000 | ENDA              // ends event execution
*/

extern const u16 gUnknown_08591FA8[]; /*
	1020 0001           | EVBIT_MODIFY 1
	2720 FFFD           | TILECHANGE 0xFFFD
	0540 0007 000000FF  | SVAL s7 0xFF
	0C43 0000 0003 0007 | BGT 0 s3 s7
	3720 FFFF           | GIVEITEMTO 0xFFFF
	0920 0001           | GOTO 1
	0820 0000           | LABEL 0
	3721 FFFF           | GIVEITEMTOMAIN 0xFFFF
	0820 0001           | LABEL 1
	0120 0000           | ENDA
*/

extern const u16 gUnknown_08591FF0[]; /*
	1020 0003           | EVBIT_MODIFY 3
	0C40 0000 0002 0000 | 
	1220 FFFF           | 
	0920 0001           | GOTO 1
	0820 0000           | LABEL 0
	1520 0000           | 
	0820 0001           | LABEL 1
	0620 0032           | 
	1B20 FFFF           | 
	1D20 0000           | 
	1B22 0000           | 
	3A40 000C 005A 0000 | 
	0228 0007           | 
	0120 0000           | ENDA
*/

extern const u16 gUnknown_08592030[]; /*
	1020 0003           | EVBIT_MODIFY 3
	1A21 0000           | 
	2140 0037 0000 0000 | 
	1720 0010           | 
	1B20 FFFF           | 
	1D20 0000           | 
	1B22 0000           | 
	1721 0010           | 
	0120 0000           | ENDA
*/

extern const u16 gUnknown_08592058[]; /*
	I don't have the patience to do this anymore
*/

extern const u16 gUnknown_085920B8[]; /*
	events
*/

extern const u16 gUnknown_08592104[]; /* Game Over Events?
	1020 0004           | EVBIT_MODIFY 4
	0D40 0000 08085375  | ASMC 0x8085375 (game over)
	0120 0000           | ENDA
*/

extern const struct ProcCmd gUnknown_089A2C80[]; // extern
extern const struct ProcCmd gUnknown_08591540[]; // extern

bool8 sub_800D3A4(struct EventEngineProc*);
void sub_800D414(struct EventEngineProc*);

void _MarkSomethingInMenu(void) {
	MarkSomethingInMenu();
}

void EventEngine_Loop(struct EventEngineProc* proc) {
	if (DoesBMXFADEExist())
		return;
	
	if (sub_800D3A4(proc) && (gKeyStatusPtr->newKeys & START_BUTTON)) {
		sub_800D414(proc);
		return;
	}

	if (proc->idk41 != 0 && proc->idk41 != 4) {
		gLCDControlBuffer.dispcnt.bg0_on = TRUE;
		gLCDControlBuffer.dispcnt.bg1_on = TRUE;
		gLCDControlBuffer.dispcnt.bg2_on = TRUE;
		gLCDControlBuffer.dispcnt.bg3_on = TRUE;
		gLCDControlBuffer.dispcnt.obj_on = TRUE;
	}

	if (proc->pCallback) {
		proc->pCallback(proc);
		return;
	}

	proc->evStateBits |= 0x0002;

	while (TRUE) {
		unsigned evCode;
		EventFuncType evFunc;

		// Event Slot 0
		gUnknown_030004B8[0] = 0;

		evCode = (*proc->pEventCurrent) >> 8;
		evFunc = (evCode < 0x80) ? gUnknown_08591B28[evCode] : gUnknown_08591C98[evCode - 0x80];

		switch (evFunc(proc)) {
		case 0:
			proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
			break;
		
		case 1:
		case 4:
		case 6:
			break;
		
		case 2:
			proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
		case 3:
			return;
		
		case 5:
			Proc_ClearNativeCallback((struct Proc*)(proc));
			return;
		}
	}
}

void EventEngine_Destructor(struct EventEngineProc* proc) {
	SetFont(NULL);
	Font_LoadForUI();
	LoadNewUIGraphics();

	switch (proc->idk41) {
	case 4:
		break;
	
	case 5:
		LoadGameCoreGfx();
		sub_8019974();
		sub_800BCDC(proc->idk44);

		if (proc->evStateBits & 0x0800) {
			ClearMOVEUNITs();
			sub_80311F0();
			memset((u8*)(gUnknown_03000438), 0, 0x80);
		}

	case 2:
		SubSkipThread2();
		sub_804F62C();
		sub_800BB98();
		ClearCutsceneUnits();

		break;
	}

	if (proc->idk41 != 3) {
		sub_8006A7C();
		sub_808F270();
		sub_808BB74();

		if (proc->idk41 == 1)
			sub_800BCDC(proc->idk44);
		
		sub_800E640(proc);
	}

	if (!(proc->evStateBits & 0x0001))
		HandleNextEventEngineCall();
}

void EqueueEventEngineCall(const u16* events, u8 idk) {
	struct EnqueuedEventCall* it;
	u8 i;

	it = gUnknown_03000438;

	for (i = -1; ++i <= 0xf;) {
		if (!it->idk2) {
			it->events = events;
			it->idk1 = idk;
			it->idk2 = TRUE;
			break;
		}

		++it;
	}
}

void HandleNextEventEngineCall(void) {
	struct EnqueuedEventCall* it;
	u8 i;

	it = gUnknown_03000438;

	if (it->idk2 == 1)
		NewMapEventEngine(it->events, it->idk1);
	
	for (i = 0; i < 15; ++i, ++it)
		*it = *(it + 1);
	
	it->events = NULL;
	it->idk1 = 0;
	it->idk2 = 0;
}

void CallMapEventEngine(const u16* events, u8 idk) {
	bool8 found = Proc_Find(gUnknown_08591AC0) != 0;

	if (found)
		EqueueEventEngineCall(events, idk);
	else
		NewMapEventEngine(events, idk);
}

struct EventEngineProc* NewMapEventEngine(const u16* events, u8 idk) {
	struct EventEngineProc* proc;

	proc = (struct EventEngineProc*) Proc_Create(gUnknown_08591AC0, ROOT_PROC_3);

	proc->pCallback     = NULL;

	proc->pEventStart   = events;
	proc->pEventIdk     = events;
	proc->pEventCurrent = events;

	proc->evStateBits   = 0x0000;
	proc->evStallTimer  = 0;

	proc->idk40         = 0xFF;
	proc->idk41         = idk;
	proc->idk42         = 0;
	proc->chapterIndex  = -1;

	proc->idk44         = 0;

	proc->pUnitLoadData = NULL;
	proc->unitLoadCount = 0;

	proc->idk4E         = 0;

	if (gLCDControlBuffer.blendY == 0x10)
		proc->evStateBits |= 0x0100;

	switch (idk) {
	case 0:
		break;

	case 1:
	case 2:
		proc->chapterIndex = gUnknown_0202BCF0.chapterIndex;
		AddSkipThread2();
		break;
	}

	return proc;
}

void NewBattleEventEngine(const u16* events) {
	struct EventEngineProc* proc;

	proc = (struct EventEngineProc*) Proc_Create(gUnknown_08591AF8, ROOT_PROC_3);

	proc->pCallback     = NULL;

	proc->pEventStart   = events;
	proc->pEventIdk     = events;
	proc->pEventCurrent = events;

	proc->evStateBits   = 0x0000;
	proc->evStallTimer  = 0;

	proc->idk40         = 0xFF;
	proc->idk41         = 3; // TODO: what does it mean? it's probably some enum
	proc->idk42         = 0;
	
	proc->idk44         = 0;

	proc->pUnitLoadData = NULL;
	proc->unitLoadCount = 0;

	proc->idk4E         = 0;

	proc->evStateBits |= 0x0001;
}

int MapEventEngineExists(void) {
	return Proc_Find(gUnknown_08591AC0) ? TRUE : FALSE;
}

int BattleEventEngineExists(void) {
	return Proc_Find(gUnknown_08591AF8) ? TRUE : FALSE;
}

void DeleteEventEngines(void) {
	Proc_DeleteAllWithScript(gUnknown_08591AC0);
	Proc_DeleteAllWithScript(gUnknown_08591AF8);
}

void sub_800D1E4(struct Proc* proc) {
	Proc_CreateBlockingChild(gUnknown_08591DD8, proc);
}

void SetEventSlotC(unsigned value) {
	gUnknown_030004B8[0xC] = value;
}

void sub_800D204(void) {} // nullsub

int sub_800D208(void) {
	struct EventEngineProc* proc;

	if (!(proc = (struct EventEngineProc*) Proc_Find(gUnknown_08591AC0)))
		if (!(proc = (struct EventEngineProc*) Proc_Find(gUnknown_08591AF8)))
			return FALSE;
	
	switch (proc->idk42) {

	case 0:
		return FALSE;

	case 1:
		return TRUE;

	case 2:
		return TRUE;

	case 3:
		return FALSE;

	case 4:
		return FALSE;

	case 5:
		return FALSE;

	}

	return FALSE;
}

void sub_800D260(u16 textIndex) {
	CallMapEventEngine(gUnknown_08591F88, 2);

	gUnknown_030004B8[0x02] = textIndex;
}

void CallBattleQuoteTextEvents(u16 textIndex) {
	NewBattleEventEngine(gUnknown_08591F88);

	gUnknown_030004B8[0x2] = textIndex;
}

void sub_800D2A4(u16 tileChangeIndex) {
	CallMapEventEngine(gUnknown_08591F9C, 2);

	gUnknown_030004B8[0xD] = 1; // qp
	gUnknown_030004F0[0]   = tileChangeIndex;
}

// Probably chest opening events?
void CallSomeOtherEvents(u16 tileChangeIndex, u16 idr) {
	CallMapEventEngine(gUnknown_08591FA8, 2);

	gUnknown_030004B8[0xD] = 1; // qp
	gUnknown_030004F0[0]   = tileChangeIndex;
	gUnknown_030004B8[0x3] = idr;
}

void sub_800D304(u16 a, u16 b) {
	CallMapEventEngine(gUnknown_08591FF0, 1);

	gUnknown_030004B8[0x2] = a;
	gUnknown_030004B8[0x3] = b;
}

void sub_800D330(u16 idk) {
	CallMapEventEngine(gUnknown_08592030, 3);

	gUnknown_030004B8[0x2] = idk;
}

void sub_800D354(void) {
	CallMapEventEngine(gUnknown_08592058, 1);
	
	gUnknown_030004B8[0x2] = gUnknown_0202BCF0.chapterIndex;
}

void sub_800D37C(void) {
	CallMapEventEngine(gUnknown_085920B8, 1);
}

void sub_800D390(void) {
	// Calls Game Over
	NewMapEventEngine(gUnknown_08592104, 2);
}

bool8 sub_800D3A4(struct EventEngineProc* proc) {
	if (!(proc->evStateBits & 0x0002))
		return FALSE;

	// Why is this check so different??
	if (((proc->evStateBits >> 2) & 1))
		return FALSE;

	if ((proc->evStateBits & 0x0010))
		return FALSE;

	if (IsBattleDeamonActive())
		return FALSE;

	if (Proc_Find(gUnknown_089A2C80))
		return FALSE;

	return TRUE;
}

void sub_800D3E4(void) {
	struct EventEngineProc* proc;

	if (!(proc = (struct EventEngineProc*) Proc_Find(gUnknown_08591AC0)))
		if (!(proc = (struct EventEngineProc*) Proc_Find(gUnknown_08591AF8)))
			return;
	
	proc->evStateBits |= 0x0008;
}

void sub_800D414(struct EventEngineProc* proc) {
	proc->evStateBits |= 0x0004;

	if (!GetZero()) {
		if (sub_80BA054() == 1)
			sub_800D488(proc);
		else if (!(proc->evStateBits & 0x0080)) {
			if (proc->evStateBits & 0x0100)
				sub_800D488(proc);
			else
				sub_8013D08(0x40, (struct Proc*)(proc));
			
			proc->evStateBits |= 0x0100;
		}
	}

	if (proc->idk41 == 0)
		sub_80BA424();
	
	Proc_BlockEachWithMark(5);
}

void sub_800D488(struct EventEngineProc* unused) {
	sub_80141B0();
	Proc_DeleteAllWithScript(gUnknown_08591540);
}

void sub_800D49C(u16 triggerId, bool8 value) {
	if (!value)
		UnsetEventId(triggerId);
	else
		SetEventId(triggerId);
}

int CheckEventId_(u16 triggerId) {
	if (!CheckEventId(triggerId))
		return FALSE;
	return TRUE;
}

struct Proc* sub_800D4D4(struct Proc* parent, void(*init)(struct Proc*), void(*loop)(struct Proc*), void(*dest)(struct Proc*)) {
	struct ProcCmd code[] = {
		PROC_SET_DESTRUCTOR(dest),
		PROC_CALL_ROUTINE(init),
		PROC_LOOP_ROUTINE(loop),
		PROC_END
	};
	
	memcpy(gUnknown_030005B0, code, sizeof code);
	return Proc_Create(gUnknown_030005B0, parent);
}

void sub_800D524(void) {} // nullsub

void SlotQueuePush(unsigned value) {
	gUnknown_030004F0[gUnknown_030004B8[0xD]] = value;
	gUnknown_030004B8[0xD]++;
}

unsigned SlotQueuePop(void) {
	s16 i;
	unsigned result;
	
	result = gUnknown_030004F0[0];

	gUnknown_030004B8[0xD]--;

	for (i = 0; i < gUnknown_030004B8[0xD]; ++i)
		gUnknown_030004F0[i] = gUnknown_030004F0[i+1];

	return result;
}

void SetEventCounter(unsigned value) {
	gUnknown_03000568 = value;
}

unsigned sub_800D594(void) {
	return gUnknown_03000568;
}
