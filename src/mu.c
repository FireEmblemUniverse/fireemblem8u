#include "global.h"
#include "proc.h"

struct MUProc {
	PROC_HEADER;

	void* pUnit;
};

struct MUConfig {
	/* 00 */ u8  muIndex;
	/* 01 */ u8  paletteIndex;
	/* 02 */ u16 objTileIndex;
	/* 04 */ u8  currentCommand;
	/* 05 */ u8  commands[0x40];
	/* 45 */ // 3 byte padding
	/* 48 */ struct MUProc* pMUProc;
};

extern struct MUConfig gUnknown_03001900[4];

void ResetMoveunitStructs(void) {
	int i;

	for (i = 0; i < 4; ++i)
		gUnknown_03001900[i].muIndex = 0;
}

/*

	THUMB_FUNC_START ResetMoveunitStructs
ResetMoveunitStructs: @ 0x0807840C
	push {lr}
	ldr r1, _08078424  @ gUnknown_03001900
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xe4
_08078416:
	strb r2, [r0]
	subs r0, #0x4c
	cmp r0, r1
	bge _08078416
	pop {r0}
	bx r0
	.align 2, 0
_08078424: .4byte gUnknown_03001900

*/
