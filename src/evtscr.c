#include "global.h"
#include "proc.h"
#include "event.h"

#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"

// TODO: #include "hino.h"
void sub_8013D08(int speed, struct Proc* parent); // aka StartFadeInBlack
void sub_8013D20(int speed, struct Proc* parent); // aka StartFadeOutBlack
void sub_8013D38(int speed, struct Proc* parent); // aka StartFadeInWhite
void sub_8013D50(int speed, struct Proc* parent); // aka StartFadeOutWhite
void sub_8012890(int, int, int, int, int, struct Proc*); // aka idk

// face
void sub_800680C(int, int, int);
void sub_8006EF0(void);
void sub_8006A30(int, int, u16);
void sub_8006AA8(int); // set dialog flag

// ???
void sub_808A518(u16);
void sub_808AA04(int, int, u16, struct Proc*);
void sub_808AADC(const char*, int*, int*);
void sub_808E9D8(int);
void sub_808F128(int, int, int, int, int, void*, int, struct Proc*);

// local
void sub_800E640(struct EventEngineProc*);
u8 Event23_(struct EventEngineProc*);

// TODO: not use this?
struct EventCommandHeader {
	u16 subcommand : 4;
	u16 size       : 4;
	u16 commandId  : 8;
} __attribute__((packed));

struct EventCallReturnData {
	const u16* pEventStart;
	const u16* pEventCurrent;
};

// void SetEventId(int);
// void UnsetEventId(int);

extern struct EventCallReturnData gUnknown_03000570[];
extern u16 gUnknown_08592114[]; // gEvent_PostEnd

u8 Event00_NULL(struct EventEngineProc* proc) {
	return EVC_ADVANCE_CONTINUE;
}

u8 Event01_End(struct EventEngineProc* proc) {
	s8 i;

	if (proc->evStateBits & EV_STATE_ABORT)
		return EVC_END;
	
	if (((struct EventCommandHeader*)(proc->pEventCurrent))->subcommand == 1) {
		for (i = 0; i < 8; ++i) {
			gUnknown_03000570[i].pEventStart   = NULL;
			gUnknown_03000570[i].pEventCurrent = NULL;
		}
	}

	if (gUnknown_03000570->pEventStart) {
		proc->pEventIdk     = gUnknown_03000570[0].pEventStart;
		proc->pEventCurrent = gUnknown_03000570[0].pEventCurrent;

		for (i = 0; i < 7; ++i) {
			gUnknown_03000570[i].pEventStart   = gUnknown_03000570[i+1].pEventStart;
			gUnknown_03000570[i].pEventCurrent = gUnknown_03000570[i+1].pEventCurrent;
		}
		
		gUnknown_03000570[i].pEventStart   = NULL;
		gUnknown_03000570[i].pEventCurrent = NULL;

		return EVC_ADVANCE_CONTINUE;
	}

	switch (proc->execType) {

	case EV_EXEC_WORLDMAP:
		proc->execType = EV_EXEC_UNK4;
		break;
	
	case EV_EXEC_CUTSCENE:
		proc->evStateBits = (proc->evStateBits &~ EV_STATE_SKIPPING) | EV_STATE_NOSKIP;
		proc->execType = EV_EXEC_UNK5;

		proc->pEventIdk     = gUnknown_08592114;
		proc->pEventCurrent = gUnknown_08592114;

		return EVC_STOP_CONTINUE;

	}

	return EVC_END;
}

u8 Event02_EvBitAndIdMod(struct EventEngineProc* proc) {
	u8 scType, scValue;
	short index;

	scType  = (proc->pEventCurrent[0] & 0x7);
	scValue = (proc->pEventCurrent[0] & 0xF) >> 3;
	index   = proc->pEventCurrent[1];
	
	if (index < 0)
		index = gEventSlots[2];

	switch (scType) {

	case 0: // Sets/Unsets event bit
		if (scValue == 0)
			proc->evStateBits &= ~(1 << index);
		else
			proc->evStateBits |= (1 << index);
		
		break;

	case 1: // Sets/Unsets trigger
		if (scValue == 0)
			UnsetEventId(index);
		else
			SetEventId(index);

		break;

	}

	return EVC_ADVANCE_CONTINUE;
}

u8 Event03_CheckEvBitOrId(struct EventEngineProc* proc) {
	u8 sc;
	short index;

	sc    = (*(const u8*)(proc->pEventCurrent)) & 0xF;
	index = proc->pEventCurrent[1];

	if (index < 0)
		index = gEventSlots[2];
	
	switch (sc) {

	case 0:
		if (proc->evStateBits & (1 << index))
			gEventSlots[0xC] = 1;
		else
			gEventSlots[0xC] = 0;

		break;
	
	case 1:
		if (!CheckEventId(index))
			gEventSlots[0xC] = 0;
		else
			gEventSlots[0xC] = 1;

		break;

	}

	return EVC_ADVANCE_CONTINUE;
}

u8 Event04_CheckRandom(struct EventEngineProc* proc) {
	unsigned highBound;
	
	highBound = *(const u16*)(proc->pEventCurrent + 1);

	if (highBound == 0)
		gEventSlots[0xC] = 0;
	else
		gEventSlots[0xC] = NextRN_N(highBound+1);
	
	return EVC_ADVANCE_CONTINUE;
}

u8 Event05_SetSlot(struct EventEngineProc* proc) {
	unsigned slotIndex, slotValue;

	slotIndex = *(const u16*)(proc->pEventCurrent + 1);
	slotValue = *(const u32*)(proc->pEventCurrent + 2);

	gEventSlots[slotIndex] = slotValue;

	return EVC_ADVANCE_CONTINUE;
}

u8 Event06_SlotOperation(struct EventEngineProc* proc) {
	u8 sc, slotSrc1, slotSrc2, slotDest;

	sc       = (*(const u8*)(proc->pEventCurrent)) & 0xF;

	slotDest = (*(proc->pEventCurrent + 1) >> 0)   & 0xF;
	slotSrc1 = (*(proc->pEventCurrent + 1) >> 4)   & 0xF;
	slotSrc2 = (*(proc->pEventCurrent + 1) >> 8)   & 0xF;

	switch (sc) {
	
	case 0: // add
		gEventSlots[slotDest] = gEventSlots[slotSrc1] + gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 1: // sub
		gEventSlots[slotDest] = gEventSlots[slotSrc1] - gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 2: // mul
		gEventSlots[slotDest] = gEventSlots[slotSrc1] * gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 3: // div
		gEventSlots[slotDest] = gEventSlots[slotSrc1] / gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 4: // mod
		gEventSlots[slotDest] = gEventSlots[slotSrc1] % gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 5: // and
		gEventSlots[slotDest] = gEventSlots[slotSrc1] & gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 6: // orr
		gEventSlots[slotDest] = gEventSlots[slotSrc1] | gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 7: // xor
		gEventSlots[slotDest] = gEventSlots[slotSrc1] ^ gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 8: // lsl
		gEventSlots[slotDest] = gEventSlots[slotSrc1] << gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	case 9: // lsr
		gEventSlots[slotDest] = gEventSlots[slotSrc1] >> gEventSlots[slotSrc2];
		return EVC_ADVANCE_CONTINUE;
	
	default:
		return EVC_ERROR;

	}
}

u8 Event07_SlotQueueOperations(struct EventEngineProc* proc) {
	u8 sc;
	s16 index;

	sc = (*(const u8*)(proc->pEventCurrent)) & 0xF;

	switch (sc) {
	
	case 0: // Push Slot Indexed by Argument
		index = proc->pEventCurrent[1];
		SlotQueuePush(gEventSlots[index]);
		break;
	
	case 1: // Push Slot 1
		SlotQueuePush(gEventSlots[1]);
		break;
	
	case 2: // Pop in Slot Indexed by Argument
		index = proc->pEventCurrent[1];
		gEventSlots[index] = SlotQueuePop();
		break;

	}

	return EVC_ADVANCE_CONTINUE;
}

u8 Event08_Label(struct EventEngineProc* proc) {
	return EVC_ADVANCE_CONTINUE;
}

u8 Event09_Goto(struct EventEngineProc* proc) {
	u32 target;

	// 0x0820 is Label code (0x08) with size 2 and sc 0
	target = (0x0820) | (proc->pEventCurrent[1] << 16);

	// Start label search at current script start
	proc->pEventCurrent = proc->pEventIdk;

	// Compares with 32bit value for some reason
	while (*(const u32*)(proc->pEventCurrent) != target)
		proc->pEventCurrent += (proc->pEventCurrent[0] >> 4 & 0xF);

	return EVC_ADVANCE_CONTINUE;
}

u8 Event0A_Call(struct EventEngineProc* proc) {
	intptr_t target;
	s8 i;

	target = proc->pEventCurrent[2] | (proc->pEventCurrent[3] << 16);

	if (target < 0)
		target = gEventSlots[2];

	// TODO: replace 7 by ARRAY_SIZE(gUnknown_03000570)-1 ?
	for (i = 7; i > 0; --i) {
		gUnknown_03000570[i].pEventStart   = gUnknown_03000570[i-1].pEventStart;
		gUnknown_03000570[i].pEventCurrent = gUnknown_03000570[i-1].pEventCurrent;
	}

	gUnknown_03000570[0].pEventStart   = proc->pEventIdk;
	gUnknown_03000570[0].pEventCurrent = proc->pEventCurrent;

	proc->pEventIdk     = (const u16*)(target);
	proc->pEventCurrent = (const u16*)(target);

	return EVC_UNK4;
}

u8 Event0B_(struct EventEngineProc* proc) {
	u8 sc;
	unsigned execType;
	intptr_t target;

	sc       = (*(const u8*)(proc->pEventCurrent)) & 0xF;

	execType = proc->pEventCurrent[1];
	target   = (*(const u32*)(proc->pEventCurrent + 2));

	if (target < 0)
		target = gEventSlots[2];

	if (target) {
		switch (sc) {

		case 0:
			CallEvent((const u16*)(target), proc->execType);
			break;

		case 1:
			sub_8083DD8((const u16*)(target), execType);
			break;

		}
	}

	return EVC_ADVANCE_CONTINUE;
}

u8 Event0C_Branch(struct EventEngineProc* proc) {
	u8 sc;
	int cmp1, cmp2;

	sc = (*(const u8*)(proc->pEventCurrent)) & 0xF;

	cmp1 = *(proc->pEventCurrent + 2);
	cmp2 = *(proc->pEventCurrent + 3);

	cmp1 = gEventSlots[cmp1];
	cmp2 = gEventSlots[cmp2];

	switch (sc) {
	
	case 0: // beq
		if (cmp1 == cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;
	
	case 1: // bne
		if (cmp1 != cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;
	
	case 2: // bge
		if (cmp1 >= cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;
	
	case 3: // bgt
		if (cmp1 > cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;
	
	case 4: // ble
		if (cmp1 <= cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;

	case 5: // blt
		if (cmp1 < cmp2)
			return Event09_Goto(proc);
		return EVC_ADVANCE_CONTINUE;

	}

	return EVC_ERROR;
}

u8 Event0D_AsmCall(struct EventEngineProc* proc) {
	typedef void(*ASMCFuncType)(struct EventEngineProc*);

	u8 subcode = *(const u8*)(proc->pEventCurrent) & 0xF;
	
	ASMCFuncType func = (ASMCFuncType)(
		(proc->pEventCurrent[2]) |
		(proc->pEventCurrent[3] << 0x10)
	);

	if (((subcode & 0xF) == 1) && ((proc->evStateBits >> 2) & 1))
		return EVC_ADVANCE_CONTINUE;

	(*func)(proc);

	return EVC_ADVANCE_YIELD;
}

u8 Event0E_STAL(struct EventEngineProc* proc) {
	u8 subcode;
	short stallTimer;

	subcode = *(const u8*)(proc->pEventCurrent) & 0xF;

	if (((proc->evStateBits >> 0x2) & 1)) {
		proc->evStallTimer = 0;
		return EVC_ADVANCE_CONTINUE;
	}
	
	if (((subcode & 1) && (((proc->evStateBits >> 0x3) & 1) || (gKeyStatusPtr->newKeys & B_BUTTON))))
		goto end_stall; // I can't get it to match without that (ugh)
	
	stallTimer = proc->evStallTimer;
	
	if (stallTimer <= 0) {
		proc->evStallTimer = proc->pEventCurrent[1];
	} else {
		int timeStep = 1;

		if ((!(proc->evStateBits & EV_STATE_0040)) && (subcode & 2))
			if ((gUnknown_0202BCF0.unk40_8) || ((A_BUTTON & gKeyStatusPtr->heldKeys)))
				timeStep = 4;
		
		stallTimer = stallTimer - timeStep;

		if (stallTimer <= 0) {

		end_stall:
			proc->evStallTimer = 0;
			return EVC_ADVANCE_CONTINUE;

		}

		proc->evStallTimer = stallTimer;
	}

	return EVC_STOP_YIELD;
}

// Counter Operations
u8 Event0F_(struct EventEngineProc* proc) {
	s8 newValue;

	u8       subcode  = 0xF & (*(const u8*)(proc->pEventCurrent));
	unsigned argument = proc->pEventCurrent[1];
	unsigned shift    = 4 * (*(const u8*)(proc->pEventCurrent + 1) % 8);

	switch (subcode) {

	case 0: // Check
		gEventSlots[0xC] = (gEventSlotCounter >> shift) & 0xF;

		return EVC_ADVANCE_CONTINUE;

	case 1: // Set
		// I can't get that particular part to match so I'll just go with asm
		
		// nonmatching C
		// newValue = (r5 << 0x10) >> 0x18;

		asm(
			"lsl r0, %1, #16\n"
			"lsr %0, r0, #24\n"

			: "=r"(newValue)
			: "r"(argument)
		);

		break;

	case 2: // Increment
		newValue = ((gEventSlotCounter >> shift) & 0xF) + 1;

		if (newValue > 0xF)
			newValue = 0xF;

		break;

	case 3: // Decrement
		newValue = ((gEventSlotCounter >> shift) & 0xF) - 1;

		if (newValue < 0)
			newValue = 0;

		break;

	} // switch (subcode)

	gEventSlotCounter = (
		(gEventSlotCounter &~ (0xF << shift)) |
		((newValue & 0xF) << shift)
	);

	return EVC_ADVANCE_CONTINUE;
}

u8 Event10_ModifyEvBit(struct EventEngineProc* proc) {
	unsigned evArgument = proc->pEventCurrent[1];

	if (((proc->evStateBits >> 2) & 1) && evArgument)
		proc->evStateBits = (proc->evStateBits &~ EV_STATE_SKIPPING) | EV_STATE_FADEDIN;

	switch (evArgument) {

	case 0:
		proc->evStateBits &= ~EV_STATE_NOSKIP;
		proc->evStateBits &= ~EV_STATE_0020;
		proc->evStateBits &= ~EV_STATE_0040;

		return EVC_ADVANCE_CONTINUE;

	case 1:
		proc->evStateBits |= EV_STATE_NOSKIP;
		proc->evStateBits |= EV_STATE_0020;
		proc->evStateBits |= EV_STATE_0040;

		return EVC_ADVANCE_CONTINUE;

	case 2:
		proc->evStateBits &= ~EV_STATE_NOSKIP;
		proc->evStateBits &= ~EV_STATE_0020;
		proc->evStateBits |= EV_STATE_0040;

		return EVC_ADVANCE_CONTINUE;

	case 3:
		proc->evStateBits |= EV_STATE_NOSKIP;
		proc->evStateBits &= ~EV_STATE_0020;
		proc->evStateBits &= ~EV_STATE_0040;

		return EVC_ADVANCE_CONTINUE;

	case 4:
		proc->evStateBits |= EV_STATE_NOSKIP;
		proc->evStateBits |= EV_STATE_0020;
		proc->evStateBits &= ~EV_STATE_0040;

		return EVC_ADVANCE_CONTINUE;

	default:
		return EVC_ERROR;

	} // switch (evArgument)
}

u8 Event11_SetIgnoredKeys(struct EventEngineProc* proc) {
	u8       subcode = 0xF & *(const u8*)(proc->pEventCurrent);
	unsigned mask    = proc->pEventCurrent[1];

	if (subcode == 0)
		SetKeyStatus_IgnoreMask(mask);

	return EVC_ADVANCE_CONTINUE;
}

// SOUND EVENT CODES

u8 Event12_(struct EventEngineProc* proc) {
	short evArgument;

	if ((proc->evStateBits >> 2) & 1)
		return EVC_ADVANCE_CONTINUE;

	evArgument = proc->pEventCurrent[1];

	if (evArgument < 0)
		evArgument = gEventSlots[2];

	Sound_PlaySong80024E4(evArgument, 3, NULL);
	return EVC_ADVANCE_YIELD;
}

u8 Event13_(struct EventEngineProc* proc) {
	u8    subcode;
	short evArgument;

	subcode    = 0xF & *(const u8*)(proc->pEventCurrent);
	evArgument = proc->pEventCurrent[1];

	if (evArgument < 0)
		evArgument = gEventSlots[2];

	if (evArgument != INT16_MAX) {
		if ((proc->evStateBits >> 2) & 1)
			return EVC_ADVANCE_CONTINUE;

		Sound_PlaySong8002574(evArgument, subcode, 0);
		return EVC_ADVANCE_YIELD;
	} else {
		if ((proc->evStateBits >> 2) & 1)
			subcode = 1;
		
		Sound_FadeOut800231C(subcode);
		return EVC_ADVANCE_YIELD;
	}
}

u8 Event14_(struct EventEngineProc* proc) {
	u8 subcode       = 0xF & *(const u8*)(proc->pEventCurrent);
	short evArgument = proc->pEventCurrent[1];

	switch (subcode) {

	case 0:
		if (((proc->evStateBits >> 2) & 1) || ((proc->evStateBits >> 3) & 1))
			return EVC_ADVANCE_CONTINUE;

		if (evArgument < 0)
			evArgument = gEventSlots[2];

		sub_8002620(evArgument);

		break;

	case 1:
		DeleteAll6CWaitMusicRelated();
		sub_80026BC(evArgument);

		break;

	} // switch (subcode)

	return EVC_ADVANCE_YIELD;
}

u8 Event15_(struct EventEngineProc* proc) {
	u8 subcode = 0xF & *(const u8*)(proc->pEventCurrent);

	switch (subcode) {
	
	case 0:
		if ((proc->evStateBits >> 2) & 1)
			return EVC_ADVANCE_CONTINUE;

		ISuspectThisToBeMusicRelated_8002730(0x100, 0x90, 10, (struct Proc*)(proc));

		break;

	case 1:
		if ((proc->evStateBits >> 2) & 1) {
			Sound_SetVolume80022EC(0x100);
			return EVC_ADVANCE_CONTINUE;
		}

		ISuspectThisToBeMusicRelated_8002730(0x90, 0x100, 10, (struct Proc*)(proc));

		break;

	} // switch (subcode)

	return EVC_ADVANCE_YIELD;
}

u8 Event16_(struct EventEngineProc* proc) {
	short evArgument;

	if (((proc->evStateBits >> 2) & 1) || ((proc->evStateBits >> 3) & 1))
		return EVC_ADVANCE_CONTINUE;

	evArgument = proc->pEventCurrent[1];

	if (evArgument < 0)
		evArgument = gEventSlots[2];

	if (!gUnknown_0202BCF0.unk41_2)
		m4aSongNumStart(evArgument);

	return EVC_ADVANCE_CONTINUE;
}

// Fade
u8 Event17_(struct EventEngineProc* proc) {
	u8       subcode;
	unsigned evArgument;

	if ((proc->evStateBits >> 2) & 1)
		return EVC_ADVANCE_CONTINUE;

	subcode    = 0xF & *(const u8*)(proc->pEventCurrent);
	evArgument = proc->pEventCurrent[1];

	switch (subcode) {

	case 0: // FADU
		sub_8013D20(evArgument, (struct Proc*)(proc)); // StartFadeOutBlack

		proc->evStateBits &= ~EV_STATE_FADEDIN;

		gLCDControlBuffer.dispcnt.bg0_on = TRUE;
		gLCDControlBuffer.dispcnt.bg1_on = TRUE;
		gLCDControlBuffer.dispcnt.bg2_on = TRUE;
		gLCDControlBuffer.dispcnt.bg3_on = TRUE;
		gLCDControlBuffer.dispcnt.obj_on = TRUE;

		return EVC_ADVANCE_YIELD;

	case 1: // FADI
		sub_8013D08(evArgument, (struct Proc*)(proc)); // StartFadeInBlack

		proc->evStateBits |= EV_STATE_FADEDIN;

		return EVC_ADVANCE_YIELD;

	case 2: // FAWU
		sub_8013D50(evArgument, (struct Proc*)(proc)); // StartFadeOutWhite

		proc->evStateBits &= ~EV_STATE_FADEDIN;

		gLCDControlBuffer.dispcnt.bg0_on = TRUE;
		gLCDControlBuffer.dispcnt.bg1_on = TRUE;
		gLCDControlBuffer.dispcnt.bg2_on = TRUE;
		gLCDControlBuffer.dispcnt.bg3_on = TRUE;
		gLCDControlBuffer.dispcnt.obj_on = TRUE;

		return EVC_ADVANCE_YIELD;

	case 3: // FAWI
		sub_8013D38(evArgument, (struct Proc*)(proc)); // StartFadeInWhite

		proc->evStateBits |= EV_STATE_FADEDIN;

		return EVC_ADVANCE_YIELD;

	default:
		return EVC_ERROR;

	} // switch (subcode)
}

// I think this is related to some color filtering effect (?)
// Messes with palettes
u8 Event18_(struct EventEngineProc* proc) {
	unsigned evArgument2, evArgument3, evArgument4, evArgument5;
	unsigned mask;
	u8 subcode, evArgumentBitStart, evArgumentBitCount;

	subcode = 0xF & *(const u8*)(proc->pEventCurrent);

	{
		// This is weird but needed to match
		unsigned read      = proc->pEventCurrent[1];
		evArgumentBitStart = *(const u8*)(proc->pEventCurrent + 1);
		evArgumentBitCount = read >> 8;
	}

	evArgument2 = proc->pEventCurrent[2];
	evArgument3 = proc->pEventCurrent[3];
	evArgument4 = proc->pEventCurrent[4];
	evArgument5 = proc->pEventCurrent[5];

	switch (subcode) {

	case 0:
		sub_80127C4();
		return EVC_ADVANCE_YIELD;

	case 1:
		sub_8012824();
		return EVC_ADVANCE_YIELD;

	case 2: {
		s8 i;

		if (((proc->evStateBits >> 2) & 1) || (proc->evStateBits & EV_STATE_FADEDIN))
			evArgument2 = 0;

		mask = 0;

		for (i = evArgumentBitCount; i > 0; --i) {
			s8 tmp = evArgumentBitStart;
			mask = mask | (1 << tmp);
			evArgumentBitStart = tmp + 1;
		}

		sub_8012890(evArgument2, mask, evArgument3, evArgument4, evArgument5, (struct Proc*)(proc));

		return EVC_ADVANCE_YIELD;
	}

	default:
		return EVC_ERROR;

	} // switch (subcode)
}

// Various Checks
u8 Event19_(struct EventEngineProc* proc) {
	u8 subcode = 0xF & *(const u8*)(proc->pEventCurrent);

	switch (subcode) {

	case 0: // Check Mode
		gEventSlots[0xC] = gUnknown_0202BCF0.chapterModeIndex;
		break;

	case 1: // Check (Next?) Chapter Index
		gEventSlots[0xC] = proc->chapterIndex;
		break;

	case 2: // Check Difficult Mode
		if (!(gUnknown_0202BCF0.chapterStateBits & 0x40))
			gEventSlots[0xC] = FALSE;
		else 
			gEventSlots[0xC] = TRUE;

		break;

	case 3: // Check Turn Number
		gEventSlots[0xC] = gUnknown_0202BCF0.chapterTurnNumber;
		break;

	case 4: // Check ?
		gEventSlots[0xC] = sub_8019034();
		break;

	case 5: // Check ?
		gEventSlots[0xC] = sub_8019074();
		break;

	case 6: // Check Chapter Type?
		gEventSlots[0xC] = GetChapterThing();
		break;

	case 7: // Check Some option or difficult mode
		if (gUnknown_0202BCF0.unk42_6 || (gUnknown_0202BCF0.chapterStateBits & 0x40))
			gEventSlots[0xC] = FALSE;
		else
			gEventSlots[0xC] = TRUE;

		break;

	case 8: // Check gold
		gEventSlots[0xC] = GetPartyGoldAmount();
		break;

	case 9: // Check ?
		gEventSlots[0xC] = sub_80845E4(proc->pEventStart);
		break;

	case 10: // Check ?
		if (gUnknown_0202BCF0.chapterStateBits & 0x20)
			gEventSlots[0xC] = TRUE;
		else 
			gEventSlots[0xC] = FALSE;

		break;

	default:
		break;

	} // switch (subcode)

	return EVC_ADVANCE_CONTINUE;
}

u8 Event1A_TEXTSTART(struct EventEngineProc* proc) {
	u8 subcode = 0xF & *(const u8*)(proc->pEventCurrent);

	if (subcode != proc->activeTextType && subcode != 5) {
		sub_8006A7C();
		sub_808F270();
		sub_808BB74();

		if (proc->execType == EV_EXEC_CUTSCENE)
			sub_800BCDC(proc->mapSpritePalIdOverride);

		sub_800E640(proc);
	}

	proc->activeTextType = subcode;

	switch (subcode) {

	case 0:
	case 3:
	case 4:
	case 5:
		return EVC_ADVANCE_YIELD;
	
	case 1:
	case 2:
		return Event23_(proc);

	default:
		return EVC_ERROR;

	} // switch (subcode)
}

void sub_800E210(struct EventEngineProc* proc, u16 stringIndex, s8 b) {
	if (b == TRUE)
		sub_800680C(0x80, 2, 1);

	if ((proc->evStateBits & EV_STATE_0040) == 1) { // ?????
		proc->overwrittenTextSpeed = gUnknown_0202BCF0.unk40_6;
		gUnknown_0202BCF0.unk40_6 = 1;
	} else {
		proc->overwrittenTextSpeed = 0xFF;
	}

	sub_8006A30(1, 1, stringIndex);

	if (proc->evStateBits & EV_STATE_0020)
		sub_8006AA8(4);

	if (proc->evStateBits & EV_STATE_0040)
		sub_8006AA8(8);
}

void sub_800E290(struct EventEngineProc* proc, u16 stringIndex, unsigned flags) {
	flags |= 0x0400;

	if (proc->evStateBits & EV_STATE_0020)
		flags |= 0x0040;

	if (proc->evStateBits & EV_STATE_0040)
		flags |= 0x2000 | 0x0800 | 0x0020;

	gLCDControlBuffer.dispcnt.win0_on   = FALSE;
	gLCDControlBuffer.dispcnt.win1_on   = FALSE;
	gLCDControlBuffer.dispcnt.objWin_on = FALSE;

	LoadObjUIGfx();
	sub_800680C(0x80, 0, 1);
	BG_EnableSyncByMask(1); // bg0

	sub_808F128(
		3,
		0x12,
		0x14,
		4,
		stringIndex,
		OBJ_VRAM0 + 0x1000,
		-1,
		NULL // parent proc
	);

	sub_808E9D8(flags);
}

void sub_800E31C(struct EventEngineProc* proc, u16 stringIndex, unsigned flags) {
	u8 x, y;

	x = ((u16*)(gEventSlots + 0xB))[0];
	y = ((u16*)(gEventSlots + 0xB))[1];

	if (x == (u8)(-1) && y == (u8)(-1)) {
		x = 0;
		y = 0;
		flags |= 0x0100;
	} else {
		int boxWidth, boxHeight;
		GetStringFromIndex(stringIndex);

		sub_808AADC(sub_800A2A4(), &boxWidth, &boxHeight);

		if (x == (u8)(-1))
			x = (224 - boxWidth) / 2 - 8;
		else if (y == (u8)(-1))
			y = (144 - boxHeight) / 2;
	}

	if (proc->evStateBits & EV_STATE_0020)
		flags |= 0x0080;

	if (proc->evStateBits & EV_STATE_0040)
		flags |= 0x0008;

	sub_808AA04(x, y, stringIndex, NULL);
	sub_808A518(flags);
}

#ifdef NONMATCHING

// Not matching yet

u8 Event1B_TEXTSHOW(struct EventEngineProc* proc) {
	u8       subcode    = 0xF & *(const u8*)(proc->pEventCurrent);
	short    evArgument = proc->pEventCurrent[1];
	unsigned zeroFlag   = 0;

	if (subcode != 2) {
		if (evArgument < 0)
			evArgument = gEventSlots[2];

		if (evArgument == 0)
			return EVC_ADVANCE_CONTINUE;
	}

	switch (subcode) {

	case 0:
		proc->evStateBits &= ~EV_STATE_0008;

		if ((proc->evStateBits >> 2) & 1)
			break;

		switch (proc->activeTextType) {

		case 0:
			sub_800E210(proc, evArgument, TRUE);
			break;

		case 1:
			sub_800E210(proc, evArgument, TRUE);
			break;

		case 2:
			sub_800E290(proc, evArgument, zeroFlag);
			break;

		case 3:
			sub_800E31C(proc, evArgument, 0x0010);
			break;

		case 4:
			sub_800E31C(proc, evArgument, zeroFlag);
			break;

		case 5:
			sub_800E31C(proc, evArgument, (0x0010 | 0x0020));
			break;

		} // switch (proc->activeTextType)

		break;

	case 1:
		if ((proc->evStateBits >> 2) & 1)
			break;

		if ((proc->evStateBits >> 3) & 1)
			break;

		switch (proc->activeTextType) {

		case 0:
			sub_800E210(proc, evArgument, FALSE);
			break;

		case 1:
			sub_800E210(proc, evArgument, FALSE);
			break;

		case 2:
			sub_800E290(proc, evArgument, zeroFlag);
			break;

		case 3:
			sub_800E31C(proc, evArgument, 0x0010);
			break;

		case 4:
			sub_800E31C(proc, evArgument, zeroFlag);
			break;

		case 5:
			sub_800E31C(proc, evArgument, (0x0010 | 0x0020));
			break;

		} // switch (proc->activeTextType)

		break;

	case 2: // REMA
		proc->evStateBits &= ~EV_STATE_0008;

		sub_8006A7C();
		sub_808F270();
		sub_808BB74();

		if (proc->execType == EV_EXEC_CUTSCENE)
			sub_800BCDC(proc->mapSpritePalIdOverride);

		sub_800E640(proc);

		return EVC_ADVANCE_YIELD;

	} // switch (subcode)

	return EVC_ADVANCE_CONTINUE;
}

#else // !NONMATCHING

__attribute__((naked))
u8 Event1B_TEXTSHOW(struct EventEngineProc* proc) {
	asm(
		".syntax unified\n"

		"push {r4, r5, lr}\n"
		"adds r4, r0, #0\n"
		"ldr r1, [r4, #0x38]\n"
		"ldrb r0, [r1]\n"
		"movs r2, #0xf\n"
		"ands r2, r0\n"
		"ldrh r3, [r1, #2]\n"
		"movs r5, #0\n"
		"cmp r2, #2\n"
		"beq _0800E3EC\n"
		"lsls r0, r3, #0x10\n"
		"cmp r0, #0\n"
		"bge _0800E3E6\n"
		"ldr r0, _0800E3FC  @ gEventSlots\n"
		"ldrh r3, [r0, #8]\n"
	"_0800E3E6:\n"
		"cmp r3, #0\n"
		"bne _0800E3EC\n"
		"b _0800E514\n"
	"_0800E3EC:\n"
		"cmp r2, #1\n"
		"beq _0800E462\n"
		"cmp r2, #1\n"
		"bgt _0800E400\n"
		"cmp r2, #0\n"
		"beq _0800E406\n"
		"b _0800E514\n"
		".align 2, 0\n"
	"_0800E3FC: .4byte gEventSlots\n"
	"_0800E400:\n"
		"cmp r2, #2\n"
		"beq _0800E4DE\n"
		"b _0800E514\n"
	"_0800E406:\n"
		"ldrh r0, [r4, #0x3c]\n"
		"ldr r1, _0800E430  @ 0x0000FFF7\n"
		"ands r1, r0\n"
		"strh r1, [r4, #0x3c]\n"
		"lsrs r1, r1, #2\n"
		"movs r0, #1\n"
		"ands r1, r0\n"
		"cmp r1, #0\n"
		"beq _0800E41A\n"
		"b _0800E514\n"
	"_0800E41A:\n"
		"adds r0, r4, #0\n"
		"adds r0, #0x42\n"
		"ldrb r0, [r0]\n"
		"cmp r0, #5\n"
		"bhi _0800E514\n"
		"lsls r0, r0, #2\n"
		"ldr r1, _0800E434  @ _0800E438\n"
		"adds r0, r0, r1\n"
		"ldr r0, [r0]\n"
		"mov pc, r0\n"
		".align 2, 0\n"
	"_0800E430: .4byte 0x0000FFF7\n"
	"_0800E434: .4byte _0800E438\n"
	"_0800E438: @ jump table\n"
		".4byte _0800E450 @ case 0\n"
		".4byte _0800E450 @ case 1\n"
		".4byte _0800E4B4 @ case 2\n"
		".4byte _0800E45C @ case 3\n"
		".4byte _0800E4C6 @ case 4\n"
		".4byte _0800E4D2 @ case 5\n"
	"_0800E450:\n"
		"adds r1, r3, #0\n"
		"adds r0, r4, #0\n"
		"movs r2, #1\n"
		"bl sub_800E210\n"
		"b _0800E514\n"
	"_0800E45C:\n"
		"adds r1, r3, #0\n"
		"movs r2, #0x10\n"
		"b _0800E4D6\n"
	"_0800E462:\n"
		"ldrh r0, [r4, #0x3c]\n"
		"lsls r1, r0, #0x10\n"
		"lsrs r0, r1, #0x12\n"
		"movs r2, #1\n"
		"ands r0, r2\n"
		"cmp r0, #0\n"
		"bne _0800E514\n"
		"lsrs r0, r1, #0x13\n"
		"ands r0, r2\n"
		"cmp r0, #0\n"
		"bne _0800E514\n"
		"adds r0, r4, #0\n"
		"adds r0, #0x42\n"
		"ldrb r0, [r0]\n"
		"cmp r0, #5\n"
		"bhi _0800E514\n"
		"lsls r0, r0, #2\n"
		"ldr r1, _0800E48C  @ _0800E490\n"
		"adds r0, r0, r1\n"
		"ldr r0, [r0]\n"
		"mov pc, r0\n"
		".align 2, 0\n"
	"_0800E48C: .4byte _0800E490\n"
	"_0800E490: @ jump table\n"
		".4byte _0800E4A8 @ case 0\n"
		".4byte _0800E4A8 @ case 1\n"
		".4byte _0800E4B4 @ case 2\n"
		".4byte _0800E4C0 @ case 3\n"
		".4byte _0800E4C6 @ case 4\n"
		".4byte _0800E4D2 @ case 5\n"
	"_0800E4A8:\n"
		"adds r1, r3, #0\n"
		"adds r0, r4, #0\n"
		"movs r2, #0\n"
		"bl sub_800E210\n"
		"b _0800E514\n"
	"_0800E4B4:\n"
		"adds r1, r3, #0\n"
		"adds r0, r4, #0\n"
		"adds r2, r5, #0\n"
		"bl sub_800E290\n"
		"b _0800E514\n"
	"_0800E4C0:\n"
		"adds r1, r3, #0\n"
		"movs r2, #0x10\n"
		"b _0800E4D6\n"
	"_0800E4C6:\n"
		"adds r1, r3, #0\n"
		"adds r0, r4, #0\n"
		"adds r2, r5, #0\n"
		"bl sub_800E31C\n"
		"b _0800E514\n"
	"_0800E4D2:\n"
		"adds r1, r3, #0\n"
		"movs r2, #0x30\n"
	"_0800E4D6:\n"
		"adds r0, r4, #0\n"
		"bl sub_800E31C\n"
		"b _0800E514\n"
	"_0800E4DE:\n"
		"ldrh r0, [r4, #0x3c]\n"
		"ldr r1, _0800E510  @ 0x0000FFF7\n"
		"ands r1, r0\n"
		"strh r1, [r4, #0x3c]\n"
		"bl sub_8006A7C\n"
		"bl sub_808F270\n"
		"bl sub_808BB74\n"
		"adds r0, r4, #0\n"
		"adds r0, #0x41\n"
		"ldrb r0, [r0]\n"
		"cmp r0, #1\n"
		"bne _0800E506\n"
		"adds r0, r4, #0\n"
		"adds r0, #0x44\n"
		"ldrh r0, [r0]\n"
		"bl sub_800BCDC\n"
	"_0800E506:\n"
		"adds r0, r4, #0\n"
		"bl sub_800E640\n"
		"movs r0, #2\n"
		"b _0800E516\n"
		".align 2, 0\n"
	"_0800E510: .4byte 0x0000FFF7\n"
	"_0800E514:\n"
		"movs r0, #0\n"
	"_0800E516:\n"
		"pop {r4, r5}\n"
		"pop {r1}\n"
		"bx r1\n"

		".syntax divided\n"
	);
}

#endif // !NONMATCHING

u8 Event1C_TEXTCONT(struct EventEngineProc* proc) {
	if (((proc->evStateBits >> 2) & 1)) {
		sub_8006A7C();
		sub_808F270();
		sub_808BB74();

		if (proc->execType == EV_EXEC_CUTSCENE)
			sub_800BCDC(proc->mapSpritePalIdOverride);

		sub_800E640(proc);
	} else {
		sub_8006EF0();
	}
	
	return EVC_ADVANCE_YIELD;
}

