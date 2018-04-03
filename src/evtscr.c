#include "global.h"
#include "proc.h"
#include "event.h"

#include "rng.h"

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

#ifndef NONMATCHING

__attribute__((naked)) u8 Event0D_AsmCall(struct EventEngineProc* proc) {
	asm(
		".syntax unified\n"
		"push {r4, lr}\n"
		"adds r4, r0, #0\n"
		"ldr r0, [r4, #0x38]\n"
		"ldrb r2, [r0]\n"
		"movs r1, #0xf\n"
		"ldrh r3, [r0, #4]\n"
		"ldrh r0, [r0, #6]\n"
		"lsls r0, r0, #0x10\n"
		"orrs r3, r0\n"
		"ands r1, r2\n"
		"cmp r1, #1\n"
		"bne _0800DB28\n"
		"ldrh r0, [r4, #0x3c]\n"
		"lsrs r0, r0, #2\n"
		"movs r1, #1\n"
		"ands r0, r1\n"
		"cmp r0, #0\n"
		"beq _0800DB28\n"
		"movs r0, #0\n"
		"b _0800DB30\n"
	"_0800DB28:\n"
		"adds r0, r4, #0\n"
		"bl _call_via_r3\n"
		"movs r0, #2\n"
	"_0800DB30:\n"
		"pop {r4}\n"
		"pop {r1}\n"
		"bx r1\n"
		".syntax divided\n"
	);
}

#else

u8 Event0D_AsmCall(struct EventEngineProc* proc) {
	u8 sc = ((*(const u8*)(proc->pEventCurrent)) & 0xF);
	void(*target)(struct EventEngineProc*);
	
	target = (void(*)(struct EventEngineProc*))(proc->pEventCurrent[2] | (proc->pEventCurrent[3] << 16));
	
	if ((sc == 1) && ((proc->evStateBits >> 2) & 1))
		return EVC_ADVANCE_CONTINUE;
	
	target(proc);

	return EVC_ADVANCE_YIELD;
}

/*

	THUMB_FUNC_START Event0D_AsmCall
Event0D_AsmCall: @ 0x0800DB00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r2, [r0]
	movs r1, #0xf
	ldrh r3, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r3, r0
	ands r1, r2
	cmp r1, #1
	bne _0800DB28
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DB28
	movs r0, #0
	b _0800DB30
_0800DB28:
	adds r0, r4, #0
	bl _call_via_r3
	movs r0, #2
_0800DB30:
	pop {r4}
	pop {r1}
	bx r1

*/

#endif

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
