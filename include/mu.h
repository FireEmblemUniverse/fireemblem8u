#ifndef GUARD_MU_H
#define GUARD_MU_H

#include "global.h"
#include "ap.h"

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

enum
{
    // Possible MU States

    MU_STATE_NONE,
    MU_STATE_INACTIVE,
    MU_STATE_MOVEMENT,
    MU_STATE_SLEEPING,
    MU_STATE_UNK4,
    MU_STATE_BUMPING,
    MU_STATE_DISPLAY_UI,
    MU_STATE_DEATHFADE,
};

enum
{
    // MU command identifiers

    MU_COMMAND_END = -1, // end

    MU_COMMAND_MOVE_BASE,

    MU_COMMAND_MOVE_LEFT  = MU_COMMAND_MOVE_BASE + FACING_LEFT,
    MU_COMMAND_MOVE_RIGHT = MU_COMMAND_MOVE_BASE + FACING_RIGHT,
    MU_COMMAND_MOVE_DOWN  = MU_COMMAND_MOVE_BASE + FACING_DOWN,
    MU_COMMAND_MOVE_UP    = MU_COMMAND_MOVE_BASE + FACING_UP,

    MU_COMMAND_HALT,

    MU_COMMAND_FACE_BASE,

    MU_COMMAND_FACE_LEFT  = MU_COMMAND_FACE_BASE + FACING_LEFT,
    MU_COMMAND_FACE_RIGHT = MU_COMMAND_FACE_BASE + FACING_RIGHT,
    MU_COMMAND_FACE_DOWN  = MU_COMMAND_FACE_BASE + FACING_DOWN,
    MU_COMMAND_FACE_UP    = MU_COMMAND_FACE_BASE + FACING_UP,

    MU_COMMAND_WAIT,
    MU_COMMAND_BUMP,
    MU_COMMAND_UNK11,
    MU_COMMAND_SET_SPEED,

    MU_COMMAND_CAMERA_ON,
    MU_COMMAND_CAMERA_OFF,
};

enum
{
    // MU facing identifiers

    MU_FACING_LEFT  = FACING_LEFT,
    MU_FACING_RIGHT = FACING_RIGHT,
    MU_FACING_DOWN  = FACING_DOWN,
    MU_FACING_UP    = FACING_UP,

    MU_FACING_SELECTED = 4,

    // TODO: Which is MU_FACING_DANCING? 5? 6?

    MU_FACING_UNK11    = 11, // The facing id at start
    MU_FACING_STANDING = 15,
};

enum
{
    // MU flash identifiers

    MU_FLASH_WHITE,
    MU_FLASH_BLACK,
    MU_FLASH_RED,
    MU_FLASH_GREEN,
    MU_FLASH_BLUE,
    MU_FLASH_YELLOW,
};

struct MUConfig;

struct MUProc {
    PROC_HEADER;

    /* 2C */ struct Unit * pUnit;
    /* 30 */ struct APHandle * pAPHandle;
    /* 34 */ struct MUConfig * pMUConfig;
    /* 38 */ void* pGfxVRAM;

    /* 3C */ u8 muIndex;
    /* 3D */ u8 _u3D;
    /* 3E */ u8 boolAttractCamera;
    /* 3F */ u8 stateId;
    /* 40 */ u8 boolIsHidden;
    /* 41 */ u8 displayedClassId;
    /* 42 */ s8 facingId;
    /* 43 */ u8 stepSoundTimer;
    /* 44 */ u8 boolForceMaxSpeed;
    /* 46 */ u16 objPriorityBits;
    /* 48 */ u16 moveTimer;
    /* 4A */ short moveConfig;

    // Coordinates are in 16th of pixel
    /* 4C */ short xSubPosition;
    /* 4E */ short ySubPosition;
    /* 50 */ short xSubOffset;
    /* 52 */ short ySubOffset;
};

#define MU_GetDisplayXOrg(proc) ((((proc)->xSubPosition + (proc)->xSubOffset) >> MU_SUBPIXEL_PRECISION) + 8)
#define MU_GetDisplayYOrg(proc) ((((proc)->ySubPosition + (proc)->ySubOffset) >> MU_SUBPIXEL_PRECISION) + 8)


struct MUConfig {
    /* 00 */ u8  muIndex;
    /* 01 */ u8  paletteIndex;
    /* 02 */ u16 objTileIndex;
    /* 04 */ u8  currentCommand;
    /* 05 */ s8  commands[MU_COMMAND_MAX_COUNT];
    /* 45 */ // 3 byte padding
    /* 48 */ struct MUProc * pMUProc;
};

#define MU_AdvanceGetCommand(proc) (proc->pMUConfig->commands[proc->pMUConfig->currentCommand++])

struct MUStepSoundProc
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ u32 idSound1;
    /* 5C */ u32 idSound2;
    /* 60 */ u32 u60_buggedmaybe; // Checked for in MU_StartStepSfx but never initialized
    /* 64 */ s16 xSound1;
    /* 66 */ s16 xSound2;
};

struct MUFogBumpFxProc
{
    PROC_HEADER;

    /* 2C */ int xDisplay;
    /* 30 */ int yDisplay;

    /* 34 */ STRUCT_PAD(0x34, 0x50);
    /* 50 */ struct APHandle * pAPHandle;

    /* 54 */ STRUCT_PAD(0x54, 0x64);
    /* 64 */ s16 timer;
};

struct MUEffectProc
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ struct MUProc * pMUProc;

    /* 58 */ STRUCT_PAD(0x58, 0x64);
    /* 64 */ s16 timeLeft;
    /* 66 */ s16 frameIndex;
};

struct MUFlashEffectProc
{
    PROC_HEADER;

    /* 2C */ struct MUProc * pMUProc;
    /* 30 */ u8 timer;
};

struct MuInfo {
    const void * img;
    const void * anim;
};

extern CONST_DATA struct MuInfo unit_icon_move_table[];
#define gMuInfoTable unit_icon_move_table

typedef void (* MuStateFunc)(struct MUProc *);

void MU_Init();
struct MUProc * MU_CreateExt(struct Unit* pUnit, unsigned jid, unsigned palId);
struct MUProc * MU_Create(struct Unit* pUnit);
void MU_ManualUpdate(struct MUProc * proc);
void MU_EnableAttractCamera(struct MUProc * proc);
void MU_DisableAttractCamera(struct MUProc * proc);
struct MUProc * MU_CreateForUI(struct Unit* pUnit, int x, int y);
void MU_8078524(struct MUProc * proc);
struct MUProc * MU_CreateInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);
void MU_SetFacing(struct MUProc * proc, int facingId);
void MU_SetDefaultFacing(struct MUProc * proc);
void MU_SetDefaultFacing_Auto(void);
void MU_StartMoveScript_Auto(const u8 commands[MU_COMMAND_MAX_COUNT]);
s8 MU_Exists(void);
s8 MU_IsAnyActive(void);
s8 MU_IsActive(struct MUProc * proc);
void MU_StartMoveScript(struct MUProc * proc, const u8 commands[MU_COMMAND_MAX_COUNT]);
struct MUProc * MU_CreateScripted(u16 x, u16 y, u16 jid, unsigned palId, const u8 commands[MU_COMMAND_MAX_COUNT]);
void MuStepSe_Init(struct MUStepSoundProc * proc);
void MuStepSe_PlaySeA(struct MUStepSoundProc * proc);
void MuStepSe_PlaySeB(struct MUStepSoundProc * proc);
void MU_StartStepSfx(int soundId, int b, int hPosition);
void MU_PlayStepSfx(struct MUProc * proc);
void MU_8078894(struct MUProc * proc);
void MU_InterpretCommandScript(struct MUProc * proc);
void MU_StartFogBumpFx(int x, int y);
void MuFogBump_Init(struct MUFogBumpFxProc * proc);
void MuFogBump_ScaleLoop(struct MUFogBumpFxProc * proc);
void MuFogBump_EndLoop(struct MUFogBumpFxProc * proc);
u8 MU_IsFogBumpFxActive(void);
void Mu_OnStateBump(struct MUProc * proc);
void Mu_OnStateMoving(struct MUProc * proc);
void Mu_OnStateSleeping(struct MUProc * proc);
void Mu_OnStateNone(struct MUProc * proc);
void Mu_OnStateDoNothing(struct MUProc * proc);
void Mu_OnStateMovement(struct MUProc * proc);
void MU_AdvanceStepSfx(struct MUProc * proc);
void MU_OnLoop(struct MUProc * proc);
void MU_OnEnd(struct MUProc * proc);
void MU_EndAll(void);
void MU_End(struct MUProc * proc);
void MU_EndInternal(struct MUProc * proc);
void MU_80790CC(struct MUProc * proc);
void MU_AllDisable(void);
void MU_AllEnable(void);
void MU_GetComputedEndPosition(int * xOut, int * yOut, const u8 * commands);
s8 MU_CanStart(void);
void MU_AllRestartAnimations(void);
static struct MUConfig * MU_GenerateConfigDefault(int objTileId, u8 * outIndex);
static struct MUConfig * MU_GenerateConfigOther(int objTileId, u8 * outIndex);
u8 MU_ComputeDisplayPosition(struct MUProc * proc, struct Vec2 * out);
void MU_DisplayAsSMS(struct MUProc * proc);
void MU_DisplayAsMMS(struct MUProc * proc);
u16 MU_GetMovementSpeed(struct MUProc * proc);
void MU_SetMoveConfig(struct MUProc * proc, u16 config);
void* MU_GetGfxBufferById(int muIndex);
const void * MU_GetSheetGfx(struct MUProc * proc);
const void * MU_GetAnimationByClassId(u16 classId);
void MU_StartDeathFade(struct MUProc * muProc);
void MU_DeathFade_OnLoop(struct MUEffectProc * proc);
void MU_BlinkEffect_OnLoop(struct MUEffectProc * proc);
void MU_StartBlinkEffect(struct MUProc * muProc);
void MU_SetupPixelEffect(u32* data, int frame);
void MU_PixelEffect_OnLoop(struct MUEffectProc * proc);
void MU_StartPixelEffect(struct MUProc * muProc);
void MU_Hide(struct MUProc * proc);
void MU_Show(struct MUProc * proc);
void MU_SetDisplayPosition(struct MUProc * proc, int x, int y);
void MU_SetDisplayOffset(struct MUProc * proc, int xOff, int yOff);
void MU_StartFlashFade(struct MUProc * proc, int flashType);
void MU_8079858(struct MUProc * muProc);
void MU_807988C(struct MUEffectProc * proc);
void MU_StartActionAnim(struct MUProc * proc);
void MU_EndSelectionApAnim(int argAp);
void MU_StartDelayedFaceTarget(struct MUProc * proc);
void MU_EndRefaceApAnim(int argAp);
void MU_EndFasterApAnim(int argAp);
void MU_StartFastMoveAnim(struct MUProc * proc);
void MU_StartCritFlash(struct MUProc * muProc, int flashType);
void MU_CritFlash_Init(struct MUFlashEffectProc * proc);
void MU_CritFlash_SetFadedPalette(struct MUFlashEffectProc * proc);
void MU_CritFlash_SetRegularPalette(struct MUFlashEffectProc * proc);
void MU_CritFlash_StartFadeBack_maybe(struct MUFlashEffectProc * proc);
void MU_CritFlash_SpriteShakeLoop(struct MUFlashEffectProc * proc);
void MU_CritFlash_RestorePalette(struct MUFlashEffectProc * proc);
void MU_StartHitFlash(struct MUProc * muProc, int flashType);
void MU_HitFlash_RestorePalette(struct MUFlashEffectProc * proc);
void MU_AllForceSetMaxMoveSpeed(void);
void MU_ForceSetMaxMoveSpeed(ProcPtr proc);
void MU_SetSpecialSprite(struct MUProc * proc, int displayedClassId, const u16 * palette);
void MU_SetPaletteId(struct MUProc * proc, unsigned paletteId);
struct MUProc * MU_GetByIndex(int muIndex);
struct MUProc * MU_GetByUnit(struct Unit* unit);
void MU_SortObjLayers(void);

extern u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT];

extern struct ProcCmd CONST_DATA gProcScr_MoveUnit[];
extern struct ProcCmd CONST_DATA gProcScr_MUDeathFade[];
extern struct ProcCmd CONST_DATA gProcScr_MUBlinkEffect[];
extern struct ProcCmd CONST_DATA gProcScr_MU_89A2CF8[];
extern u16 CONST_DATA MuSoundScr_Foot[];
extern u16 CONST_DATA MuSoundScr_FootHeavy[];
extern u16 CONST_DATA MuSoundScr_Mounted[];
extern u16 CONST_DATA MuSoundScr_Wyvern[];
extern u16 CONST_DATA MuSoundScr_Pegasus[];
extern u16 CONST_DATA MuSoundScr_Unused1[];
extern u16 CONST_DATA MuSoundScr_Zombie[];
extern u16 CONST_DATA MuSoundScr_Skeleton[];
extern u16 CONST_DATA MuSoundScr_Mogall[];
extern u16 CONST_DATA MuSoundScr_Spider[];
extern u16 CONST_DATA MuSoundScr_Dog[];
extern u16 CONST_DATA MuSoundScr_Gorgon[];
extern u16 CONST_DATA MuSoundScr_Unused2[];
extern u16 CONST_DATA MuSoundScr_Boat[];
extern u16 CONST_DATA MuSoundScr_Myrrh[];
// extern ??? gUnknown_089A2C28
// extern ??? gProcScr_MoveUnit
extern CONST_DATA struct ProcCmd gProcScr_MUDeathFade[];
extern CONST_DATA struct ProcCmd gProcScr_MUBlinkEffect[];
extern CONST_DATA struct ProcCmd gProcScr_MU_89A2CF8[];

extern const u16 * CONST_DATA MUFlashColorLookup[];

#endif // GUARD_MU_H
