#include "global.h"
#include "proc.h"
#include "ap.h"
#include "items.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"

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

enum {
	CA_NONE = 0x00000000,
	CA_MOUNTEDAID = 0x00000001,
	CA_CANTO = 0x00000002,
	CA_STEAL = 0x00000004,
	CA_LOCKPICK = 0x00000008,
	CA_DANCE = 0x00000010,
	CA_PLAY = 0x00000020,
	CA_CRITBONUS = 0x00000040,
	CA_BALLISTAE = 0x00000080,
	CA_PROMOTED = 0x00000100,
	CA_SUPPLY = 0x00000200,
	CA_MOUNTED = 0x00000400,
	CA_WYVERN = 0x00000800,
	CA_PEGASUS = 0x00001000,
	CA_LORD = 0x00002000,
	CA_FEMALE = 0x00004000,
	CA_BOSS = 0x00008000,
	CA_LOCK_1 = 0x00010000,
	CA_LOCK_2 = 0x00020000,
	CA_LOCK_3 = 0x00040000, // Dragons or Monster depending of game
	CA_MAXLEVEL10 = 0x00080000,
	CA_UNSELECTABLE = 0x00100000,
	CA_TRIANGLEATTACK_PEGASI = 0x00200000,
	CA_TRIANGLEATTACK_ARMORS = 0x00400000,
	// = 0x00800000,
	// = 0x01000000,
	CA_LETHALITY = 0x02000000,
	// = 0x04000000,
	CA_SUMMON = 0x08000000,
	CA_LOCK_4 = 0x10000000,
	CA_LOCK_5 = 0x20000000,
	CA_LOCK_6 = 0x40000000,
	CA_LOCK_7 = 0x80000000,

	CA_DUMMY
};

struct Struct0202BCB0 { // Game State Struct
    /* 00 */ u8  mainLoopEndedFlag;

    /* 01 */ s8  gameLogicSemaphore;
    /* 02 */ s8  gameGfxSemaphore;

    /* 03 */ u8  _unk04;

    /* 04 */ u8  gameStateBits;

    /* 05 */ u8  _unk05;

    /* 06 */ u16 prevVCount;

    /* 08 */ u32 _unk08;

    /* 0C */ short xCameraReal;
    /* 0E */ short yCameraReal;
};

extern struct Struct0202BCB0 gUnknown_0202BCB0;

// TODO: move to mu.h
enum { MU_SUBPIXELS_PER_PIXEL = 16 };
enum { MU_MAX_COUNT = 4 };
enum { MU_COMMAND_MAX_COUNT = 0x40 };

enum {
	MU_STATE_IDLE,
	MU_STATE_IDLE_EXEC,
	MU_STATE_MOVING_EXEC,
	MU_STATE_WAITING,
	MU_STATE_SOMETHING_END,
	MU_STATE_WAITING_FOR_SOMETHING_TO_FINISH,
	MU_STATE_UI_DISPLAY,
};

enum {
	MU_COMMAND_FF = -1, // end

	MU_COMMAND_0,
	MU_COMMAND_1,
	MU_COMMAND_2,
	MU_COMMAND_3,

	MU_COMMAND_4,

	MU_COMMAND_5,
	MU_COMMAND_6,
	MU_COMMAND_7,
	MU_COMMAND_8,

	MU_COMMAND_9,
	MU_COMMAND_10,
	MU_COMMAND_11,
	MU_COMMAND_12,

	MU_COMMAND_13,

	MU_COMMAND_14,
	MU_COMMAND_15,
};

struct MUConfig;

struct MUProc {
	PROC_HEADER;

	/* 2C */ struct Unit* pUnit;
	/* 30 */ struct APHandle* pAPHandle;
	/* 34 */ struct MUConfig* pMUConfig;
	/* 38 */ void* vramPtr_maybe;

	/* 3C */ u8 currentFrame_maybe;
	/* 3D */ u8 _u3D;
	/* 3E */ u8 boolAttractCamera;
	/* 3F */ u8 stateId;
	/* 40 */ u8 _u40;
	/* 41 */ u8 displayedClassId;
	/* 42 */ s8 directionId_maybe;
	/* 43 */ u8 _u43;
	/* 44 */ u8 _u44;
	/* 45 */ u8 _u45;
	/* 46 */ u16 objPriorityBits;
	/* 48 */ u16 _u48;
	/* 4A */ u16 configBits;

	// Coordinates are in 16th of pixel
	/* 4C */ short xSubPosition;
	/* 4E */ short ySubPosition;
	/* 50 */ u16 xSubOffset;
	/* 52 */ u16 ySubOffset;
};

struct MUStepSoundProc {
	PROC_HEADER;

	/* 29 */ u8 _pad29[0x58 - 0x29];

	/* 58 */ unsigned u58;
	/* 5C */ unsigned u5C;
	/* 60 */ unsigned u60;
	/* 64 */ short u64;
	/* 66 */ short u66;
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

extern struct MUConfig gUnknown_03001900[MU_MAX_COUNT];

extern const struct ProcCmd gUnknown_089A2938[];
extern const struct ProcCmd gUnknown_089A2C48[];
extern const struct ProcCmd gUnknown_089A2968[];

extern const u16 gUnknown_089A8EF8[];
extern const u8 gUnknown_089ADD4C[];

struct MUProc* NewMOVEUNIT(u16 x, u16 y, u16 classIndex, int objTileId, unsigned palId);
void _6CMOVEUNIT_Loop(struct MUProc* proc);
struct MUConfig* GetNextMoveunitEntryStruct(int objTileId, u8* outIndex_maybe);
struct MUConfig* sub_807920C(int objTileId, u8* outIndex_maybe);
const void* MMS_GetROMTCS(int classId);
const void* GetMovingMapSpriteGfxPtrFromMOVEUNIT(struct MUProc* proc);
void* GetMOVEUNITGraphicsBuffer(int muIndex);
void MOVEUNIT6C_ChangeFutureMovement(struct MUProc* proc, const u8 commands[MU_COMMAND_MAX_COUNT]);
void __MOVEUNIT6C_PlaySoundStepByClass(struct MUProc* proc);
void MOVEUNIT6C_PlaySoundStepByClass(struct MUProc* proc);
void EndMoveunitMaybe(struct MUProc* proc);
void sub_80790CC(struct MUProc* proc);
void DisplayFogThingMaybe(int x, int y);

void ResetMoveunitStructs(void) {
	int i;

	for (i = 0; i < MU_MAX_COUNT; ++i)
		gUnknown_03001900[i].muIndex = 0;
}

struct MUProc* Make6CMOVEUNITForUnit(struct Unit* pUnit, unsigned classIndex, unsigned palId) {
	struct MUProc* proc = NewMOVEUNIT(
		pUnit->xPos,
		pUnit->yPos,

		classIndex,

		-1,
		palId
	);

	proc->pUnit = pUnit;
	proc->boolAttractCamera = TRUE;

	return proc;
}

struct MUProc* MakeMOVEUNITForMapUnit(struct Unit* pUnit) {
	struct MUProc* proc;

	unsigned classIndex = pUnit->pClassData->number;

	if (pUnit->state & US_IN_BALLISTA) {
		struct Trap* blst = GetTrap(pUnit->ballistaIndex);

		// FIXME: use class id definitions

		switch (blst->data[TRAP_EXTDATA_BLST_ITEMID]) {

		case Ballista:
			classIndex = 0x67;
			break;

		case IronBallista:
			classIndex = 0x68;
			break;

		case KillerBallista:
			classIndex = 0x69;
			break;

		} // switch (blst->data[TRAP_EXTDATA_BLST_ITEMID])
	}

	proc = NewMOVEUNIT(
		pUnit->xPos,
		pUnit->yPos,

		classIndex,

		-1,
		GetUnitMapSpritePaletteIndex(pUnit)
	);

	proc->pUnit = pUnit;
	proc->boolAttractCamera = TRUE;

	return proc;
}

void sub_80784D8(struct MUProc* proc) {
	_6CMOVEUNIT_Loop(proc);
}

void MOVEUNIT6C_SetCameraFollow(struct MUProc* proc) {
	proc->boolAttractCamera = TRUE;
}

void MOVEUNIT6C_UnsetCameraFollow(struct MUProc* proc) {
	proc->boolAttractCamera = FALSE;
}

struct MUProc* Make6CMOVEUNITForUI(struct Unit* pUnit, int x, int y) {
	struct MUProc* proc = MakeMOVEUNITForMapUnit(pUnit);

	if (!proc)
		return NULL;

	proc->xSubPosition = x * MU_SUBPIXELS_PER_PIXEL;
	proc->ySubPosition = y * MU_SUBPIXELS_PER_PIXEL;

	proc->stateId = MU_STATE_UI_DISPLAY;

	return proc;
}

void sub_8078524(struct MUProc* proc) {
	SMS_80266F0(
		GetClassStandingMapSpriteId(proc->displayedClassId),
		proc->currentFrame_maybe
	);
}

struct MUProc* NewMOVEUNIT(u16 x, u16 y, u16 classIndex, int objTileId, unsigned palId) {
	struct MUConfig* config;
	struct MUProc* proc;
	struct APHandle* ap;

	unsigned otherThing = 0;
	u8 thing = 0;

	if (objTileId == -1)
		config = GetNextMoveunitEntryStruct(objTileId = 0x380, &thing);
	else
		config = sub_807920C(objTileId, &thing);

	if (!config)
		return NULL;

	if (Proc_Find(gUnknown_089A2C48))
		otherThing = 0xFE;

	proc = (struct MUProc*) Proc_Create(gUnknown_089A2C48, ROOT_PROC_5);

	if (!proc)
		return NULL;

	proc->pUnit = NULL;
	proc->stateId = MU_STATE_IDLE_EXEC;

	proc->xSubPosition = x * 16 * MU_SUBPIXELS_PER_PIXEL;
	proc->ySubPosition = y * 16 * MU_SUBPIXELS_PER_PIXEL;

	proc->xSubOffset = 0;
	proc->ySubOffset = 0;

	proc->directionId_maybe = 11;

	proc->_u48 = 0;
	proc->_u43 = otherThing;

	proc->displayedClassId = classIndex;
	proc->_u40 = 0;

	proc->vramPtr_maybe = OBJ_VRAM0 + (0x20 * objTileId);

	proc->currentFrame_maybe = thing;

	proc->objPriorityBits = 0x800;

	proc->configBits = 0;
	proc->_u44 = 0;

	config->paletteIndex = palId;

	ap = AP_Create(MMS_GetROMTCS(classIndex), 10);
	AP_SwitchAnimation(ap, 4);

	CopyDataWithPossibleUncomp(
		GetMovingMapSpriteGfxPtrFromMOVEUNIT(proc),
		GetMOVEUNITGraphicsBuffer(config->muIndex)
	);

	ap->pGraphics = GetMOVEUNITGraphicsBuffer(config->muIndex);
	ap->tileBase = ((config->paletteIndex & 0xF) << 12) + config->objTileIndex + proc->objPriorityBits;

	proc->pAPHandle = ap;
	proc->pMUConfig = config;

	config->pMUProc = proc;

	return proc;
}

void MOVEUNIT6C_SetSpriteDirection(struct MUProc* proc, int directionId) {
	proc->directionId_maybe = directionId;

	if (directionId == 15)
		sub_8027068(proc->currentFrame_maybe, proc->vramPtr_maybe);
	else
		AP_SwitchAnimation(proc->pAPHandle, proc->directionId_maybe);
}

void MOVEUNIT6C_SetDefaultSpriteDirection(struct MUProc* proc) {
	if (GetROMClassStruct(proc->displayedClassId)->attributes & CA_MOUNTEDAID)
		MOVEUNIT6C_SetSpriteDirection(proc, 1);
	else
		MOVEUNIT6C_SetSpriteDirection(proc, 2);
}

void _MOVEUNIT6C_SetDefaultFacingDirection(void) {
	struct MUProc* proc = (struct MUProc*) Proc_Find(gUnknown_089A2C48);

	if (proc)
		MOVEUNIT6C_SetDefaultSpriteDirection(proc);
}

void _MOVEUNIT6C_ChangeFutureMovement(const u8 commands[MU_COMMAND_MAX_COUNT]) {
	struct MUProc* proc = (struct MUProc*) Proc_Find(gUnknown_089A2C48);

	if (proc)
		MOVEUNIT6C_ChangeFutureMovement(proc, commands);
}

int DoesMoveunitExist(void) {
	return Proc_Find(gUnknown_089A2C48) ? TRUE : FALSE;
}

#if NONMATCHING

int IsThereAMovingMoveunit(void) {
	int i;

	for (i = 0; i < MU_MAX_COUNT; ++i)
		if ((gUnknown_03001900[i].muIndex) && (gUnknown_03001900[i].pMUProc->stateId != MU_STATE_IDLE_EXEC))
			return TRUE;

	return FALSE;
}

#else // NONMATCHING

__attribute__((naked))
int IsThereAMovingMoveunit(void) {
	asm(
		".syntax unified\n"

		"push {lr}\n"
		"movs r3, #0\n"
		"ldr r0, _08078764  @ gUnknown_03001900\n"
		"adds r2, r0, #0\n"
		"adds r2, #0x48\n"
		"adds r1, r0, #0\n"
	"_08078744:\n"
		"ldrb r0, [r1]\n"
		"cmp r0, #0\n"
		"beq _08078754\n"
		"ldr r0, [r2]\n"
		"adds r0, #0x3f\n"
		"ldrb r0, [r0]\n"
		"cmp r0, #1\n"
		"bne _08078768\n"
	"_08078754:\n"
		"adds r2, #0x4c\n"
		"adds r1, #0x4c\n"
		"adds r3, #1\n"
		"cmp r3, #3\n"
		"ble _08078744\n"
		"movs r0, #0\n"
		"b _0807876A\n"
		".align 2, 0\n"
	"_08078764: .4byte gUnknown_03001900\n"
	"_08078768:\n"
		"movs r0, #1\n"
	"_0807876A:\n"
		"pop {r1}\n"
		"bx r1\n"

		".syntax divided\n"
	);
}

#endif // NONMATCHING

int sub_8078770(struct MUProc* proc) {
	if (proc->pMUConfig->muIndex && proc->stateId != MU_STATE_IDLE_EXEC)
		return TRUE;

	return FALSE;
}

void MOVEUNIT6C_ChangeFutureMovement(struct MUProc* proc, const u8 commands[MU_COMMAND_MAX_COUNT]) {
	int i;

	for (i = 0; i < 0x40; ++i)
		proc->pMUConfig->commands[i] = commands[i];

	proc->pMUConfig->currentCommand = 0;
	proc->stateId = MU_STATE_MOVING_EXEC;

	__MOVEUNIT6C_PlaySoundStepByClass(proc);
}

struct MUProc* sub_80787C4(u16 x, u16 y, u16 classIndex, unsigned palId, const u8 commands[MU_COMMAND_MAX_COUNT]) {
	struct MUProc* proc = NewMOVEUNIT(x, y, classIndex, -1, palId);

	if (!proc)
		return NULL;

	MOVEUNIT6C_ChangeFutureMovement(proc, commands);
	return proc;
}

void Init6C_89A2938(struct MUStepSoundProc* proc) {
	proc->u58 = 0;
	proc->u64 = 0;

	proc->u5C = 0;
	proc->u66 = 0;
}

void Call89A2938_PlaySound1(struct MUStepSoundProc* proc) {
	PlaySpacialSoundMaybe(proc->u58, proc->u64);
}

void Call89A2938_PlaySound2(struct MUStepSoundProc* proc) {
	if (proc->u5C)
		PlaySpacialSoundMaybe(proc->u5C, proc->u66);
}

void NewSoundStepPlay6C(int a, int b, int c) {
	struct MUStepSoundProc* proc;

	proc = (struct MUStepSoundProc*) Proc_Find(gUnknown_089A2938);

	if (!proc)
		proc = (struct MUStepSoundProc*) Proc_Create(gUnknown_089A2938, ROOT_PROC_3);

	if (!proc->u58) {
		proc->u58 = a;
		proc->u64 = c;
	} else if (!proc->u60) { // TODO: FIXME: Is this a bug? u60 is never set
		proc->u5C = a + b;
		proc->u66 = c;
	}
}

void __MOVEUNIT6C_PlaySoundStepByClass(struct MUProc* proc) {
	MOVEUNIT6C_PlaySoundStepByClass(proc);
}

void nullsub_19(struct MUProc* proc) {}

void Moveunit_ExecMoveCommand(struct MUProc* proc) {
	#define MU_AdvanceGetCommand(proc) (proc->pMUConfig->commands[proc->pMUConfig->currentCommand++])

	while (TRUE) {
		short command = MU_AdvanceGetCommand(proc);

		switch (command) {

		case MU_COMMAND_9:
			proc->_u48 = MU_AdvanceGetCommand(proc);
			proc->stateId = MU_STATE_WAITING;

			return;

		case MU_COMMAND_10:
			nullsub_19(proc);

			proc->stateId = MU_STATE_WAITING_FOR_SOMETHING_TO_FINISH;

			DisplayFogThingMaybe(
				(proc->xSubPosition >> 4) - gUnknown_0202BCB0.xCameraReal,
				(proc->ySubPosition >> 4) - gUnknown_0202BCB0.yCameraReal
			);

			return;

		case MU_COMMAND_4:
			sub_80790CC(proc);

			return;

		case MU_COMMAND_FF:
			nullsub_19(proc);
			EndMoveunitMaybe(proc);

			return;

		case MU_COMMAND_0:
		case MU_COMMAND_1:
		case MU_COMMAND_2:
		case MU_COMMAND_3:
			command = command - MU_COMMAND_0;

			if (command != proc->directionId_maybe) {
				MMS_GetROMTCS(proc->displayedClassId); // TODO: FIXME: is this a bug?
				MOVEUNIT6C_SetSpriteDirection(proc, command);

				proc->stateId = MU_STATE_MOVING_EXEC;
			}

			return;

		case MU_COMMAND_5:
		case MU_COMMAND_6:
		case MU_COMMAND_7:
		case MU_COMMAND_8:
			command = command - MU_COMMAND_5;

			if (command != proc->directionId_maybe) {
				MMS_GetROMTCS(proc->displayedClassId); // TODO: FIXME: is this a bug?
				MOVEUNIT6C_SetSpriteDirection(proc, command);
			}

			break;

		case MU_COMMAND_12:
			proc->configBits = MU_AdvanceGetCommand(proc);
			break;

		case MU_COMMAND_13:
			MOVEUNIT6C_SetCameraFollow(proc);
			break;

		case MU_COMMAND_14:
			MOVEUNIT6C_UnsetCameraFollow(proc);
			break;

		} // switch (command)
	} // while (TRUE)

	#undef MU_AdvanceGetCommand
}

struct SomeProc {
	PROC_HEADER;

	/* 2C */ int xDisplay;
	/* 30 */ int yDisplay;

	/* 34 */ u8 _pad34[0x50 - 0x34];

	/* 50 */ struct APHandle* pAPHandle;
	/* 54 */ u8 _pad54[0x64 - 0x54];
	/* 64 */ short u64;
};

void DisplayFogThingMaybe(int x, int y) {
	struct APHandle* ap;
	struct SomeProc* proc;

	CopyDataWithPossibleUncomp(
		gUnknown_089ADD4C,
		OBJ_VRAM0 + 0x20 * 0x180
	);

	ap = AP_Create(gUnknown_089A8EF8, 2);

	ap->tileBase = 0x1180;
	AP_SwitchAnimation(ap, 0);

	proc = (struct SomeProc*) Proc_Create(gUnknown_089A2968, ROOT_PROC_3);

	proc->pAPHandle = ap;

	proc->xDisplay = x + 8;
	proc->yDisplay = y - 4;
}

void Call6C_89A2968(struct SomeProc* proc) {
	PlaySoundEffect(0x77);

	proc->u64 = 0;

	// TODO: maybe a macro that takes angle/xScale/yScale?

	WriteOAMRotScaleData(
		0,  // oam rotscale index

		Div(+COS(0) * 16, 0x200), // pa
		Div(-SIN(0) * 16, 0x200), // pb
		Div(+SIN(0) * 16, 0x200), // pc
		Div(+COS(0) * 16, 0x200)  // pd
	);
}

void Loop6C_89A2968_1(struct SomeProc* proc) {
	int scale;

	if (proc->u64++ >= 8)
		Proc_ClearNativeCallback((struct Proc*) proc);

	scale = sub_8012DCC(5, 0x200, 0x100, proc->u64, 8);

	WriteOAMRotScaleData(
		0,  // oam rotscale index

		Div(+COS(0) * 16, scale), // pa
		Div(-SIN(0) * 16, scale), // pb
		Div(+SIN(0) * 16, scale), // pc
		Div(+COS(0) * 16, scale)  // pd
	);

	AP_Update(
		proc->pAPHandle,

		(proc->xDisplay - 8),
		(proc->yDisplay - 8) | 0x300
	);
}

void Loop6C_89A2968_2(struct SomeProc* proc) {
	if (proc->u64++ >= 40)
		Proc_ClearNativeCallback((struct Proc*) proc);

	AP_Update(
		proc->pAPHandle,

		(proc->xDisplay),
		(proc->yDisplay) | 0x100
	);
}

u8 Does6C_89A2968Exist(void) {
	return Proc_Find(gUnknown_089A2968) ? TRUE : FALSE;
}

void MOVU_Call5_WaitForSomething(struct MUProc* proc) {
	if (!Does6C_89A2968Exist())
		proc->stateId = MU_STATE_WAITING;
}

void MOVU_Call4_SetState2(struct MUProc* proc) {
	proc->stateId = MU_STATE_MOVING_EXEC;
}

void MOVU_Call3_Wait(struct MUProc* proc) {
	if (proc->_u48 == 0)
		proc->stateId = MU_STATE_MOVING_EXEC;
	else
		proc->_u48--;
}

void sub_8078C58(struct MUProc* proc) {}

void nullsub_54(struct MUProc* proc) {}
