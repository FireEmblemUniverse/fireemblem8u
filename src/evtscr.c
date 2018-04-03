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

/*

	THUMB_FUNC_START Event17_
Event17_: @ 0x0800DF20
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DF34
	movs r0, #0
	b _0800DFB4
_0800DF34:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r1, #2]
	cmp r2, #1
	beq _0800DF5E
	cmp r2, #1
	bgt _0800DF4C
	cmp r2, #0
	beq _0800DF56
	b _0800DFB2
_0800DF4C:
	cmp r2, #2
	beq _0800DF66
	cmp r2, #3
	beq _0800DF9C
	b _0800DFB2
_0800DF56:
	adds r1, r4, #0
	bl sub_8013D20
	b _0800DF6C
_0800DF5E:
	adds r1, r4, #0
	bl sub_8013D08
	b _0800DFA2
_0800DF66:
	adds r1, r4, #0
	bl sub_8013D50
_0800DF6C:
	ldrh r1, [r4, #0x3c]
	ldr r0, _0800DF94  @ 0x0000FEFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	ldr r2, _0800DF98  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	b _0800DFB4
	.align 2, 0
_0800DF94: .4byte 0x0000FEFF
_0800DF98: .4byte gLCDControlBuffer
_0800DF9C:
	adds r1, r4, #0
	bl sub_8013D38
_0800DFA2:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	b _0800DFB4
_0800DFB2:
	movs r0, #6
_0800DFB4:
	pop {r4}
	pop {r1}
	bx r1

*/