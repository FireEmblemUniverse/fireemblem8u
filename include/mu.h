#ifndef GUARD_MU_H
#define GUARD_MU_H

/*
    "MOVEUNIT" proc and related functions.
    Handles managing and displaying moving map sprites.
*/

enum {
	// MU Magic Constants

	// Maximum simultaneous MU count
	MU_MAX_COUNT = 4,

	// Maximum move command count
	MU_COMMAND_MAX_COUNT = 0x40,

	// Maximum size of uncompressed MU sprite sheet
	MU_GFX_MAX_SIZE = 0x2200,

	// Default base obj tile index for storing sprites in VRAM
	MU_BASE_OBJ_TILE = 0x380,

	// obj palette id used for MU fade effects
	MU_FADE_OBJ_PAL = 5,

	// Number of bits used to keep track of subpixels
	MU_SUBPIXEL_PRECISION = 4,
};

enum {
	// Possible MU States

	MU_STATE_IDLE,
	MU_STATE_IDLE_EXEC,
	MU_STATE_MOVING_EXEC,
	MU_STATE_WAITING,
	MU_STATE_SOMETHING_END,
	MU_STATE_WAITING_FOR_SOMETHING_TO_FINISH,
	MU_STATE_UI_DISPLAY,
	MU_STATE_7,
};

enum {
	// MU command identifiers

	MU_COMMAND_FF = -1, // end

	MU_COMMAND_MOVE_BASE,

	MU_COMMAND_0 = MU_COMMAND_MOVE_BASE + 0,
	MU_COMMAND_1 = MU_COMMAND_MOVE_BASE + 1,
	MU_COMMAND_2 = MU_COMMAND_MOVE_BASE + 2,
	MU_COMMAND_3 = MU_COMMAND_MOVE_BASE + 3,

	MU_COMMAND_4,

	MU_COMMAND_TURN_BASE,

	MU_COMMAND_5 = MU_COMMAND_TURN_BASE + 0,
	MU_COMMAND_6 = MU_COMMAND_TURN_BASE + 1,
	MU_COMMAND_7 = MU_COMMAND_TURN_BASE + 2,
	MU_COMMAND_8 = MU_COMMAND_TURN_BASE + 3,

	MU_COMMAND_9,
	MU_COMMAND_10,
	MU_COMMAND_11,
	MU_COMMAND_12,

	MU_COMMAND_13,

	MU_COMMAND_14,
	MU_COMMAND_15,
};

enum {
	// MU fade identifiers

	MU_FLASH_0,
	MU_FLASH_1,
	MU_FLASH_2,
	MU_FLASH_3,
	MU_FLASH_4,
	MU_FLASH_5,
};

struct MUConfig;

struct MUProc {
	PROC_HEADER;

	/* 2C */ struct Unit* pUnit;
	/* 30 */ struct APHandle* pAPHandle;
	/* 34 */ struct MUConfig* pMUConfig;
	/* 38 */ void* vramPtr_maybe;

	/* 3C */ u8 muIndex;
	/* 3D */ u8 _u3D;
	/* 3E */ u8 boolAttractCamera;
	/* 3F */ u8 stateId;
	/* 40 */ u8 boolIsHidden;
	/* 41 */ u8 displayedClassId;
	/* 42 */ s8 directionId_maybe;
	/* 43 */ u8 stepSoundTimer;
	/* 44 */ u8 boolForceMaxSpeed;
	/* 45 */ u8 _u45;
	/* 46 */ u16 objPriorityBits;
	/* 48 */ u16 moveTimer;
	/* 4A */ short moveSpeedConfig;

	// Coordinates are in 16th of pixel
	/* 4C */ short xSubPosition;
	/* 4E */ short ySubPosition;
	/* 50 */ short xSubOffset;
	/* 52 */ short ySubOffset;
};

struct MUConfig {
	/* 00 */ u8  muIndex;
	/* 01 */ u8  paletteIndex;
	/* 02 */ u16 objTileIndex;
	/* 04 */ u8  currentCommand;
	/* 05 */ s8  commands[MU_COMMAND_MAX_COUNT];
	/* 45 */ // 3 byte padding
	/* 48 */ struct MUProc* pMUProc;
};

struct MMSData {
	const void* pGraphics;
	const void* pAnimation;
};

struct PositionS16 {
	short x, y;
};

typedef void(*MUStateHandlerFunc)(struct MUProc*);

extern u8 gUnknown_02004BE0[];

#endif // GUARD_MU_H
