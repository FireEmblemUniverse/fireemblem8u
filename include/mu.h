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

// Buffer for MU graphics
// what to do with this?
extern u8 gUnknown_02004BE0[];

// FUNCTIONS

void ResetMoveunitStructs();

struct MUProc* Make6CMOVEUNITForUnit(struct Unit* pUnit, unsigned classIndex, unsigned palId);
struct MUProc* MakeMOVEUNITForMapUnit(struct Unit* pUnit);

void sub_80784D8(struct MUProc* proc);

void MOVEUNIT6C_SetCameraFollow(struct MUProc* proc);
void MOVEUNIT6C_UnsetCameraFollow(struct MUProc* proc);

struct MUProc* Make6CMOVEUNITForUI(struct Unit* pUnit, int x, int y);

void sub_8078524(struct MUProc* proc);

void MOVEUNIT6C_SetSpriteDirection(struct MUProc* proc, int directionId);
void MOVEUNIT6C_SetDefaultSpriteDirection(struct MUProc* proc);
void _MOVEUNIT6C_SetDefaultFacingDirection(void);
void _MOVEUNIT6C_ChangeFutureMovement(const u8 commands[MU_COMMAND_MAX_COUNT]);

int DoesMoveunitExist(void);
int IsThereAMovingMoveunit(void);

int sub_8078770(struct MUProc* proc);
void MOVEUNIT6C_ChangeFutureMovement(struct MUProc* proc, const u8 commands[MU_COMMAND_MAX_COUNT]);

struct MUProc* sub_80787C4(u16 x, u16 y, u16 classIndex, unsigned palId, const u8 commands[MU_COMMAND_MAX_COUNT]);

void NewSoundStepPlay6C(int soundId, int b, int hPosition);
u8 Does6C_89A2968Exist(void);

void __MOVEUNIT6C_PlaySoundStepByClass(struct MUProc* proc);

void ClearMOVEUNITs(void);
void EndMoveunitMaybe(struct MUProc* proc);

void BlockAll6CMarked4(void);
void UnblockAll6CMarked4(void);

void sub_80790F8(int* xOut, int* yOut, const u8* commands);

int IsSomeMOVEUNITRelatedStructAvailable(void);

void ResetAllMoveunitAnims(void);

u8 GetMOVEUNITDisplayPosition(struct MUProc* proc, struct PositionS16* out);

void sub_807953C(struct MUProc* proc, u16 config);

void MOVEUNIT6C_807959C(struct MUProc* muProc);
void sub_807968C(struct MUProc* muProc);
void sub_8079788(struct MUProc* muProc);

void SetMOVEUNITField40To1(struct MUProc* proc);
void sub_80797DC(struct MUProc* proc);

void MOVEUNIT6C_SetDisplayPos(struct MUProc* proc, int x, int y);
void sub_80797F4(struct MUProc* proc, int xOff, int yOff);

void sub_8079804(struct MUProc* proc, int flashType);
void sub_8079858(struct MUProc* muProc);

void SetupSomeMoveunitAnim(struct MUProc* proc);
void sub_80798E8(struct MUProc* proc);
void MOVEUNIT_Begin20FramesFastAnim(struct MUProc* proc);
void sub_8079970(struct MUProc* muProc, int flashType);
void sub_8079A74(struct MUProc* muProc, int flashType);

void SetAllMOVEUNITField44To1(void);

void ChangeMOVEUNITDataMaybe(struct MUProc* proc, int displayedClassId, const u16* palette);

void sub_8079B6C(struct MUProc* proc, int paletteId);

struct MUProc* GetExistingMoveunitForUnit(struct Unit* unit);

void sub_8079BE0(void);

#endif // GUARD_MU_H
