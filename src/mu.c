#include "global.h"
#include "proc.h"
#include "ap.h"
#include "items.h"

// TODO: move this elsewhere
enum {
	US_NONE = 0x00000000,

	US_HIDDEN = 0x00000001,
	US_UNSELECTABLE = 0x00000002,
	US_DEAD = 0x00000004,
	US_NOT_DEPLOYED = 0x00000008,
	US_RESCUING = 0x00000010,
	US_RESCUED = 0x00000020,
	US_HAS_MOVED = 0x00000040, // Bad name?
	US_CANTOING = 0x00000040, // Alias
	US_UNDER_A_ROOF = 0x00000080,
	// = 0x00000100,
	// = 0x00000200,
	US_HAS_MOVED_AI = 0x00000400,
	US_IN_BALLISTA = 0x00000800,
	US_DROP_ITEM = 0x00001000,
	US_GROWTH_BOOST = 0x00002000,
	US_SOLOANIM_1 = 0x00004000,
	US_SOLOANIM_2 = 0x00008000,
	// = 0x00010000,
	// = 0x00020000,
	// = 0x00040000,
	// = 0x00080000,
	// = 0x00100000,
	// = 0x00200000,
	// = 0x00400000,
	// = 0x00800000,
	// = 0x01000000,
	// = 0x02000000,
	// = 0x04000000,
	// = 0x08000000,
	// = 0x10000000,
	// = 0x20000000,
	// = 0x40000000,
	// = 0x80000000,

	US_DUMMY
};

// TODO: move to mu.h
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

struct MUProc* MakeMOVEUNITForMapUnit(struct Unit* pUnit) {
	struct MUProc* proc;

	unsigned spriteId = pUnit->pClassData->number;

	if (pUnit->state & US_IN_BALLISTA) {
		struct Trap* blst = GetTrap(pUnit->ballistaIndex);

		// FIXME: use class id

		switch (blst->data[TRAP_EXTDATA_BLST_ITEMID]) {

		case Ballista:
			spriteId = 0x67;
			break;

		case IronBallista:
			spriteId = 0x68;
			break;

		case KillerBallista:
			spriteId = 0x69;
			break;

		} // switch (blst->data[TRAP_EXTDATA_BLST_ITEMID])
	}

	proc = NewMOVEUNIT(
		pUnit->xPos,
		pUnit->yPos,

		spriteId,

		-1,
		GetUnitMapSpritePaletteIndex(pUnit)
	);

	proc->pUnit = pUnit;
	proc->boolAttractCamera = TRUE;

	return proc;
}
