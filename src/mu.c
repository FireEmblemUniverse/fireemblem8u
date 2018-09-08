#include "global.h"
#include "proc.h"
#include "ap.h"

struct MUProc {
	PROC_HEADER;

	/* 2C */ struct Unit* pUnit;
	/* 30 */ struct APHandle* pAPHandle;
	/* 34 */ const u8* pCommands_maybe;
	/* 38 */ u32 vramPtr_maybe;

	/* 3C */ u8 currentFrame_maybe;
	/* 3D */ u8 _u3D;
	/* 3E */ u8 boolAttractCamera;
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

struct MUProc* NewMOVEUNIT(u16 x, u16 y, u16 spriteIndex, int objTileId, unsigned palId);

void ResetMoveunitStructs(void) {
	int i;

	for (i = 0; i < 4; ++i)
		gUnknown_03001900[i].muIndex = 0;
}

struct MUProc* Make6CMOVEUNITForUnit(struct Unit* pUnit, unsigned spriteIndex, unsigned palId) {
	struct MUProc* proc = NewMOVEUNIT(
		pUnit->xPos,
		pUnit->yPos,

		spriteIndex,

		-1,

		palId
	);

	proc->pUnit = pUnit;
	proc->boolAttractCamera = TRUE;

	return proc;
}

/*

	THUMB_FUNC_START Make6CMOVEUNITForUnit
Make6CMOVEUNITForUnit: @ 0x08078428
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r3, #1
	negs r3, r3
	str r2, [sp]
	adds r2, r4, #0
	bl NewMOVEUNIT
	str r5, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x3e
	movs r1, #1
	strb r1, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

*/
