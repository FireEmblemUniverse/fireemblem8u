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

struct MuConfig;

struct MuProc {
    PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ struct APHandle * sprite_anim;
    /* 34 */ struct MuConfig * config;
    /* 38 */ void* pGfxVRAM;

    /* 3C */ u8 muIndex;
    /* 3D */ u8 _u3D;
    /* 3E */ u8 cam_b;
    /* 3F */ u8 state;
    /* 40 */ u8 hidden_b;
    /* 41 */ u8 jid;
    /* 42 */ s8 facing;
    /* 43 */ u8 step_sound_clock;
    /* 44 */ u8 boolForceMaxSpeed;
    /* 46 */ u16 layer;
    /* 48 */ u16 move_clock_q4;
    /* 4A */ short moveConfig;

    // Coordinates are in 16th of pixel
    /* 4C */ short x_q4;
    /* 4E */ short y_q4;
    /* 50 */ short x_offset_q4;
    /* 52 */ short y_offset_q4;
};

#define MU_GetDisplayXOrg(proc) ((((proc)->x_q4 + (proc)->x_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8)
#define MU_GetDisplayYOrg(proc) ((((proc)->y_q4 + (proc)->y_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8)


struct MuConfig {
    /* 00 */ u8  muIndex;
    /* 01 */ u8  pal;
    /* 02 */ u16 chr;
    /* 04 */ u8  currentCommand;
    /* 05 */ s8  commands[MU_COMMAND_MAX_COUNT];
    /* 45 */ // 3 byte padding
    /* 48 */ struct MuProc * mu;
};

#define MU_AdvanceGetCommand(proc) (proc->config->commands[proc->config->currentCommand++])

struct MuStepSoundProc
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);

    /* 58 */ u32 song1;
    /* 5C */ u32 song2;
    /* 60 */ u32 u60_buggedmaybe; // Checked for in MU_StartStepSfx but never initialized
    /* 64 */ s16 x1;
    /* 66 */ s16 x2;
};

struct MuFogBumpProc
{
    PROC_HEADER;

    /* 2C */ int xDisplay;
    /* 30 */ int yDisplay;

    /* 34 */ STRUCT_PAD(0x34, 0x50);
    /* 50 */ struct APHandle * sprite_anim;

    /* 54 */ STRUCT_PAD(0x54, 0x64);
    /* 64 */ s16 timer;
};

struct MuEffectProc
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ struct MuProc * mu;

    /* 58 */ STRUCT_PAD(0x58, 0x64);
    /* 64 */ s16 timeLeft;
    /* 66 */ s16 frameIndex;
};

struct MuFlashEffectProc
{
    PROC_HEADER;

    /* 2C */ struct MuProc * mu;
    /* 30 */ u8 timer;
};

struct MuInfo {
    const void * img;
    const void * anim;
};

extern CONST_DATA struct MuInfo unit_icon_move_table[];
#define gMuInfoTable unit_icon_move_table

typedef void (* MuStateFunc)(struct MuProc *);

void InitMus();
struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned palId);
struct MuProc * StartMu(struct Unit * unit);
void UpdateMu(struct MuProc * proc);
void EnableMuCamera(struct MuProc * proc);
void DisableMuCamera(struct MuProc * proc);
struct MuProc * StartUiMu(struct Unit * unit, int x, int y);
void StartUiStandingMu(struct MuProc * proc);
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);
void SetMuFacing(struct MuProc * proc, int facing);
void SetMuDefaultFacing(struct MuProc * proc);
void SetAutoMuDefaultFacing(void);
void SetAutoMuMoveScript(const u8 commands[MU_COMMAND_MAX_COUNT]);
s8 MuExists(void);
s8 MuExistsActive(void);
s8 IsMuActive(struct MuProc * proc);
void SetMuMoveScript(struct MuProc * proc, const u8 commands[MU_COMMAND_MAX_COUNT]);
struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int palId, const u8 commands[MU_COMMAND_MAX_COUNT]);
void MuStepSe_Init(struct MuStepSoundProc * proc);
void MuStepSe_PlaySeA(struct MuStepSoundProc * proc);
void MuStepSe_PlaySeB(struct MuStepSoundProc * proc);
void MU_StartStepSfx(int soundId, int b, int hPosition);
void PlayMuStepSe(struct MuProc * proc);
void MU_8078894(struct MuProc * proc);
void MU_InterpretCommandScript(struct MuProc * proc);
void MU_StartFogBumpFx(int x, int y);
void MuFogBump_Init(struct MuFogBumpProc * proc);
void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc);
void MuFogBump_EndLoop(struct MuFogBumpProc * proc);
u8 MU_IsFogBumpFxActive(void);
void Mu_OnStateBump(struct MuProc * proc);
void Mu_OnStateMoving(struct MuProc * proc);
void Mu_OnStateSleeping(struct MuProc * proc);
void Mu_OnStateNone(struct MuProc * proc);
void Mu_OnStateDoNothing(struct MuProc * proc);
void Mu_OnStateMovement(struct MuProc * proc);
void MU_AdvanceStepSfx(struct MuProc * proc);
void MU_OnLoop(struct MuProc * proc);
void MU_OnEnd(struct MuProc * proc);
void MU_EndAll(void);
void MU_End(struct MuProc * proc);
void MU_EndInternal(struct MuProc * proc);
void MU_80790CC(struct MuProc * proc);
void MU_AllDisable(void);
void MU_AllEnable(void);
void MU_GetComputedEndPosition(int * xOut, int * yOut, const u8 * commands);
s8 MU_CanStart(void);
void MU_AllRestartAnimations(void);
static struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex);
static struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex);
u8 MU_ComputeDisplayPosition(struct MuProc * proc, struct Vec2 * out);
void MU_DisplayAsSMS(struct MuProc * proc);
void MU_DisplayAsMMS(struct MuProc * proc);
u16 MU_GetMovementSpeed(struct MuProc * proc);
void MU_SetMoveConfig(struct MuProc * proc, u16 config);
void* GetMuImgBufById(int muIndex);
const void * GetMuImg(struct MuProc * proc);
const void * GetMuAnimForJid(u16 classId);
void MU_StartDeathFade(struct MuProc * muProc);
void MuDeathFade_OnLoop(struct MuEffectProc * proc);
void MUBlinkEffect_OnLoop(struct MuEffectProc * proc);
void MU_StartBlinkEffect(struct MuProc * muProc);
void MU_SetupPixelEffect(u32* data, int frame);
void MuPixelEffect_OnLoop(struct MuEffectProc * proc);
void MU_StartPixelEffect(struct MuProc * muProc);
void MU_Hide(struct MuProc * proc);
void MU_Show(struct MuProc * proc);
void MU_SetDisplayPosition(struct MuProc * proc, int x, int y);
void MU_SetDisplayOffset(struct MuProc * proc, int xOff, int yOff);
void MU_StartFlashFade(struct MuProc * proc, int flashType);
void MU_8079858(struct MuProc * muProc);
void MuRestorePalInfo_Apply(struct MuEffectProc * proc);
void MU_StartActionAnim(struct MuProc * proc);
void MU_EndSelectionApAnim(int argAp);
void MU_StartDelayedFaceTarget(struct MuProc * proc);
void MU_EndRefaceApAnim(int argAp);
void MU_EndFasterApAnim(int argAp);
void MU_StartFastMoveAnim(struct MuProc * proc);
void MU_StartCritFlash(struct MuProc * muProc, int flashType);
void MuCritFlash_Init(struct MuFlashEffectProc * proc);
void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc);
void MuCritFlash_SetRegularPalette(struct MuFlashEffectProc * proc);
void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc);
void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc);
void MuCritFlash_RestorePalette(struct MuFlashEffectProc * proc);
void MU_StartHitFlash(struct MuProc * muProc, int flashType);
void MuHitFlash_RestorePalette(struct MuFlashEffectProc * proc);
void MU_AllForceSetMaxMoveSpeed(void);
void MU_ForceSetMaxMoveSpeed(ProcPtr proc);
void MU_SetSpecialSprite(struct MuProc * proc, int jid, const u16 * palette);
void MU_SetPaletteId(struct MuProc * proc, unsigned paletteId);
struct MuProc * MU_GetByIndex(int muIndex);
struct MuProc * MU_GetByUnit(struct Unit * unit);
void MU_SortObjLayers(void);

extern u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT];

extern struct ProcCmd CONST_DATA ProcScr_Mu[];
extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];
extern struct ProcCmd CONST_DATA ProcScr_MuBlinkEffect[];
extern struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[];
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
// extern ??? ProcScr_Mu
extern CONST_DATA struct ProcCmd ProcScr_MuDeathFade[];
extern CONST_DATA struct ProcCmd ProcScr_MuBlinkEffect[];
extern CONST_DATA struct ProcCmd ProcScr_MuRestorePalInfo[];

extern const u16 * CONST_DATA MUFlashColorLookup[];

#endif // GUARD_MU_H
