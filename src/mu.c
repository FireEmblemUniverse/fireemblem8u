#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"

EWRAM_OVERLAY(0) int Unk_2004BDC = 0;
EWRAM_OVERLAY(0) u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT] = { 0 };
static struct MuConfig sMuConfig[MU_MAX_COUNT];

const u16 * CONST_DATA gMuFlashPalLut[] = {
    [MU_FLASH_WHITE] = Pal_AllWhite,
    [MU_FLASH_BLACK] = Pal_AllBlack,
    [MU_FLASH_RED]   = Pal_AllRed,
    [MU_FLASH_GREEN] = Pal_AllGreen,
    [MU_FLASH_BLUE]  = Pal_AllBlue,
    [MU_FLASH_YELLOW]     = Pal_AllYellow,
};

 struct ProcCmd CONST_DATA ProcScr_MuStepSe[] = {
    PROC_CALL(MuStepSe_Init),
    PROC_YIELD,
    PROC_CALL(MuStepSe_PlaySeA),
    PROC_YIELD,
    PROC_CALL(MuStepSe_PlaySeB),
    PROC_END
};

 struct ProcCmd CONST_DATA ProcScr_MuFogBump[] = {
    PROC_CALL(MuFogBump_Init),
    PROC_REPEAT(MuFogBump_ScaleLoop),
    PROC_REPEAT(MuFogBump_EndLoop),
    PROC_END
};

static short CONST_DATA sMoveOffsetLut[] = {
    -1,  0, // left
    +1,  0, // right
     0, +1, // up
     0, -1, // down
};

u16 CONST_DATA MuSoundScr_Foot[] = {
    0x10, 2,
    SONG_96, 0, 0, 0, 0, 0, 0, 0,
    SONG_97, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_FootHeavy[] = {
    0x20, 2,
    SONG_A4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SONG_A5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Mounted[] = {
    0x15, 3,
    SONG_9A, 0, 0,
    SONG_9B, 0, 0, 0, 0, 0, 0,
    SONG_9C, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Wyvern[] = {
    0x14, 1,
    SONG_A0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Pegasus[] = {
    0x14, 1,
    SONG_A6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Unused1[] = {
    0x14, 1,
    SONG_2E0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Zombie[] = {
    0x0F, 1,
    SONG_302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Skeleton[] = {
    0x0F, 1,
    SONG_304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Mogall[] = {
    0x14, 1,
    SONG_306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Spider[] = {
    0x0A, 1,
    SONG_308, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Dog[] = {
    0x15, 1,
    SONG_30A, 0, 0,
    SONG_30A, 0, 0, 0, 0, 0, 0,
    SONG_30A, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Gorgon[] = {
    0x0F, 1,
    SONG_30C, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Unused2[] = {
    0x20, 2,
    SONG_2E0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Boat[] = {
    0x18, 1,
    SONG_30F, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SONG_30E, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u16 CONST_DATA MuSoundScr_Myrrh[] = {
    0x10, 1,
    SONG_3BB, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

static MuStateFunc CONST_DATA sMuStateFuncs[] = {
    [MU_STATE_NONE]       = Mu_OnStateNone,
    [MU_STATE_INACTIVE]   = Mu_OnStateDoNothing,
    [MU_STATE_MOVEMENT]   = Mu_OnStateMovement,
    [MU_STATE_SLEEPING]   = Mu_OnStateSleeping,
    [MU_STATE_UNK4]       = Mu_OnStateUnk4,
    [MU_STATE_BUMPING]    = Mu_OnStateBump,
    [MU_STATE_DISPLAY_UI] = Mu_OnStateDoNothing,
    [MU_STATE_DEATHFADE]  = Mu_OnStateDoNothing,
};

struct ProcCmd CONST_DATA ProcScr_Mu[] = {
    PROC_NAME("MOVEUNIT"),
    PROC_MARK(PROC_MARK_MU),

    PROC_SET_END_CB(MU_OnEnd),
    PROC_REPEAT(MU_OnLoop)
};

static u16 CONST_DATA sMuChrOffLut_Default[MU_MAX_COUNT] = {
    0x00, 0x10, 0x08, 0x18
};

static u16 CONST_DATA sMuChrOffLut[MU_MAX_COUNT] = {
    0x00, 0x08, 0x04, 0x10
};

static u8 CONST_DATA sMuWalkSpeedLut[2] = {
    [UNIT_WALKSPEED_FAST] = 2,
    [UNIT_WALKSPEED_SLOW] = 1,
};

static u8 CONST_DATA sMuImgBufOffLut[MU_MAX_COUNT + 1] = {
    0, // dummy because active ids start at 1
    0, 2, 1, 3
};

struct ProcCmd CONST_DATA ProcScr_MuDeathFade[] = {
    PROC_REPEAT(MuDeathFade_OnLoop),
    PROC_SLEEP(15),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_MuBlink[] = {
    PROC_REPEAT(MuBlink_OnLoop),
    PROC_END
};

// Doesn't match without being volatile
// :/
CONST_DATA vu8 static sUnknown_089A2CA8[0x40] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F
};

 struct ProcCmd CONST_DATA ProcScr_MuPixelEffect[] = {
    PROC_REPEAT(MuPixelEffect_OnLoop),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[] = {
    PROC_SLEEP(8),
    PROC_CALL(MuRestorePalInfo_Apply),
    PROC_END
};

 struct ProcCmd CONST_DATA ProcScr_MuCritFlash[] = {
    PROC_CALL(MuCritFlash_Init),
    PROC_SLEEP(1),

    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(2),

    PROC_CALL(MuCritFlash_SetRegularPalette),
    PROC_SLEEP(3),

    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(2),

    PROC_CALL(MuCritFlash_SetRegularPalette),
    PROC_SLEEP(3),

    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(1),

    PROC_CALL(MuCritFlash_StartFadeBack_maybe),
    PROC_REPEAT(MuCritFlash_SpriteShakeLoop),

    PROC_SLEEP(17),
    PROC_CALL(MuCritFlash_RestorePalette),

    PROC_END
};

 struct ProcCmd CONST_DATA ProcScr_MuHitFlash[] = {
    PROC_SLEEP(17),
    PROC_CALL(MuFlashFadeFrom_RestorePal),
    PROC_END
};

void InitMus(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        sMuConfig[i].slot = 0;
}

struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned pal)
{
    struct MuProc * proc;
    
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, pal);
    proc->unit = unit;
    proc->cam_b = true;
    return proc;
}

struct MuProc * StartMu(struct Unit * unit)
{
    struct MuProc * proc;

    unsigned jid = UNIT_CLASS_ID(unit);

    if (unit->state & US_IN_BALLISTA)
    {
        switch (GetTrap(unit->ballistaIndex)->extra) {
        case ITEM_BALLISTA_REGULAR:
            jid = CLASS_BLST_REGULAR_USED;
            break;

        case ITEM_BALLISTA_LONG:
            jid = CLASS_BLST_LONG_USED;
            break;

        case ITEM_BALLISTA_KILLER:
            jid = CLASS_BLST_KILLER_USED;
            break;

        } // switch (blst->extra)
    }

    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, GetUnitSpritePalette(unit));
    proc->unit = unit;
    proc->cam_b = true;
    return proc;
}

void UpdateMu(struct MuProc * proc)
{
    MU_OnLoop(proc);
}

void EnableMuCamera(struct MuProc * proc)
{
    proc->cam_b = true;
}

void DisableMuCamera(struct MuProc * proc)
{
    proc->cam_b = false;
}

struct MuProc * StartUiMu(struct Unit * unit, int x, int y)
{
    struct MuProc * proc = StartMu(unit);

    if (!proc)
        return NULL;

    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
    proc->state = MU_STATE_DISPLAY_UI;
    return proc;
}

void StartUiStandingMu(struct MuProc * proc)
{
    StartUiSMS(
        GetClassSMSId(proc->jid),
        proc->slot
    );
}

struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId)
{
    struct MuConfig * config;
    struct MuProc * proc;
    struct APHandle * ap;

    u8 delay = 0;
    u8 slot = 0;

    if (objTileId == -1)
        config = GetDefaultMuConfig(objTileId = OBCHR_MU_380, &slot);
    else
        config = GetNewMuConfig(objTileId, &slot);

    if (!config)
        return NULL;

    if (Proc_Find(ProcScr_Mu))
        delay = -2;

    proc = Proc_Start(ProcScr_Mu, PROC_TREE_5);

    if (!proc)
        return NULL;

    proc->unit = NULL;
    proc->state = MU_STATE_INACTIVE;
    proc->x_q4 = (x * 16) << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = (y * 16) << MU_SUBPIXEL_PRECISION;
    proc->x_offset_q4 = 0;
    proc->y_offset_q4 = 0;
    proc->facing = MU_FACING_UNK11;
    proc->move_clock_q4 = 0;
    proc->step_sound_clock = delay;
    proc->jid = jid;
    proc->hidden_b = 0;
    proc->pGfxVRAM = OBJ_VRAM0 + (0x20 * objTileId);
    proc->slot = slot;
    proc->layer = OAM2_LAYER(2);
    proc->moveConfig = 0;
    proc->fast_walk_b = false;
    config->pal = palId;

    ap = AP_Create(GetMuAnimForJid(jid), 10);
    AP_SwitchAnimation(ap, MU_FACING_SELECTED);

    Decompress(
        GetMuImg(proc),
        GetMuImgBufById(config->slot)
    );

    ap->pGraphics = GetMuImgBufById(config->slot);
    ap->tileBase = OAM2_PAL(config->pal) + config->chr + proc->layer;

    proc->sprite_anim = ap;
    proc->config = config;
    config->mu = proc;
    return proc;
}

void SetMuFacing(struct MuProc * proc, int facing)
{
    proc->facing = facing;

    if (facing == MU_FACING_STANDING)
        sub_8027068(proc->slot, proc->pGfxVRAM);
    else
        AP_SwitchAnimation(proc->sprite_anim, proc->facing);
}

void SetMuDefaultFacing(struct MuProc * proc)
{
    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
        SetMuFacing(proc, 1);
    else
        SetMuFacing(proc, 2);
}

void SetAutoMuDefaultFacing(void)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (proc)
        SetMuDefaultFacing(proc);
}

void SetAutoMuMoveScript(const u8 commands[MOVE_CMD_MAX_COUNT])
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (proc)
        SetMuMoveScript(proc, commands);
}

bool MuExists(void)
{
    return Proc_Find(ProcScr_Mu) ? true : false;
}

bool MuExistsActive(void)
{
    int i;

    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
#ifndef NONMATCHING
        asm(""::"r"(&sMuConfig[i].slot));
        asm(""::"r"(&sMuConfig[i].mu));
#endif
        if (sMuConfig[i].slot == 0) continue;
        while (0) ;
        if (sMuConfig[i].mu->state != MU_STATE_INACTIVE)
            return true;
    }

    if (i >= MU_MAX_COUNT)
        return false;

    return true;
}

bool IsMuActive(struct MuProc * mu)
{
    if (mu->config->slot && mu->state != MU_STATE_INACTIVE)
        return true;

    return false;
}

void SetMuMoveScript(struct MuProc * mu, const u8 commands[MOVE_CMD_MAX_COUNT])
{
    int i;

    for (i = 0; i < 0x40; ++i)
        mu->config->movescr[i] = commands[i];

    mu->config->pc = 0;
    mu->state = MU_STATE_MOVEMENT;

    PlayMuStepSe(mu);
}

struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int pal, const u8 commands[MOVE_CMD_MAX_COUNT])
{
    struct MuProc * proc = StartMuInternal(x, y, jid, -1, pal);
    if (!proc)
        return NULL;

    SetMuMoveScript(proc, commands);
    return proc;
}

void MuStepSe_Init(struct MuStepSoundProc * proc)
{
    proc->song1 = 0;
    proc->x1 = 0;

    proc->song2 = 0;
    proc->x2 = 0;
}

void MuStepSe_PlaySeA(struct MuStepSoundProc * proc)
{
    PlaySeSpacial(proc->song1, proc->x1);
}

void MuStepSe_PlaySeB(struct MuStepSoundProc * proc)
{
    if (proc->song2)
        PlaySeSpacial(proc->song2, proc->x2);
}

void StartPlayMuStepSe(int song, int alt_offset, int x)
{
    struct MuStepSoundProc * proc;

    proc = Proc_Find(ProcScr_MuStepSe);

    if (!proc)
        proc = Proc_Start(ProcScr_MuStepSe, PROC_TREE_3);

    if (!proc->song1)
    {
        proc->song1 = song;
        proc->x1 = x;
    }
#if BUGFIX
    else if (!proc->song2)
#else
    else if (!proc->unk60)
#endif
    {
        proc->song2 = song + alt_offset;
        proc->x2 = x;
    }
}

void PlayMuStepSe(struct MuProc * proc)
{
    UpdateMuStepSounds(proc);
}

void EndMuMovement(struct MuProc * proc) {}

void RunMuMoveScript(struct MuProc * proc)
{
    while (true)
    {
        short command = proc->config->movescr[proc->config->pc++];

        switch (command) {
        case MOVE_CMD_SLEEP:
            proc->move_clock_q4 = proc->config->movescr[proc->config->pc++];
            proc->state = MU_STATE_SLEEPING;
            return;

        case MOVE_CMD_BUMP:
            EndMuMovement(proc);
            proc->state = MU_STATE_BUMPING;
            StartMuFogBump(
                (proc->x_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x,
                (proc->y_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y
            );
            return;

        case MOVE_CMD_HALT:
            HaltMu(proc);
            return;

        case MOVE_CMD_END:
            EndMuMovement(proc);
            MU_End(proc);
            return;

        case MOVE_CMD_MOVE_LEFT:
        case MOVE_CMD_MOVE_RIGHT:
        case MOVE_CMD_MOVE_DOWN:
        case MOVE_CMD_MOVE_UP:
            command = command - MOVE_CMD_MOVE_BASE;
            if (command != proc->facing)
            {
#if !BUGFIX
                GetMuAnimForJid(proc->jid);
#endif
                SetMuFacing(proc, command - MOVE_CMD_MOVE_BASE);
                proc->state = MU_STATE_MOVEMENT;
            }
            return;

        case MOVE_CMD_FACE_LEFT:
        case MOVE_CMD_FACE_RIGHT:
        case MOVE_CMD_FACE_DOWN:
        case MOVE_CMD_FACE_UP:
            command = command - MOVE_CMD_FACE_BASE;
            if (command != proc->facing)
            {
#if !BUGFIX
                GetMuAnimForJid(proc->jid);
#endif
                SetMuFacing(proc, command);
            }

            break;

        case MOVE_CMD_SET_SPEED:
            proc->moveConfig = proc->config->movescr[proc->config->pc++];
            break;

        case MOVE_CMD_CAMERA_ON:
            EnableMuCamera(proc);
            break;

        case MOVE_CMD_CAMERA_OFF:
            DisableMuCamera(proc);
            break;

        } // switch (command)
    } // while (true)
}

void StartMuFogBump(int x, int y)
{
    struct APHandle * ap;
    struct MuFogBumpProc * proc;

    Decompress(
        Img_GmapSoguSprites,
        OBJ_VRAM0 + CHR_SIZE * OBCHR_MU_180
    );

    ap = AP_Create(ApHandle_GmapSoguSprites, 2);
    ap->tileBase = OAM2_CHR(OBCHR_MU_180) + OAM2_PAL(OBPAL_MU_1);
    AP_SwitchAnimation(ap, MU_FACING_LEFT);

    proc = Proc_Start(ProcScr_MuFogBump, PROC_TREE_3);
    proc->sprite_anim = ap;
    proc->x = x + 8;
    proc->y = y - 4;
}

void MuFogBump_Init(struct MuFogBumpProc * proc)
{
    PlaySoundEffect(SONG_77);

    proc->timer = 0;
    SetObjAffineAuto(0, 0, 0x200, 0x200);
}

void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc)
{
    int scale;

    if (proc->timer++ >= 8)
        Proc_Break(proc);

    scale = Interpolate(INTERPOLATE_RCUBIC, 0x200, 0x100, proc->timer, 8);
    SetObjAffineAuto(0, 0, scale, scale);

    AP_Update(
        proc->sprite_anim,
        (proc->x - 8),
        (proc->y - 8) | OAM0_AFFINE_ENABLE | OAM0_DOUBLESIZE);
}

void MuFogBump_EndLoop(struct MuFogBumpProc * proc)
{
    if (proc->timer++ >= 40)
        Proc_Break(proc);

    AP_Update(
        proc->sprite_anim,
        (proc->x),
        (proc->y) | OAM0_AFFINE_ENABLE);
}

u8 MU_IsFogBumpFxActive(void)
{
    return Proc_Exists(ProcScr_MuFogBump);
}

void Mu_OnStateBump(struct MuProc * proc)
{
    if (!MU_IsFogBumpFxActive())
        proc->state = MU_STATE_SLEEPING;
}

void Mu_OnStateUnk4(struct MuProc * proc)
{
    proc->state = MU_STATE_MOVEMENT;
}

void Mu_OnStateSleeping(struct MuProc * proc)
{
    if (proc->move_clock_q4 == 0)
        proc->state = MU_STATE_MOVEMENT;
    else
        proc->move_clock_q4--;
}

void Mu_OnStateNone(struct MuProc * proc) {}

void Mu_OnStateDoNothing(struct MuProc * proc) {}

void Mu_OnStateMovement(struct MuProc * proc)
{
    unsigned moveSpeed = GetMuQ4MovementSpeed(proc);

    proc->move_clock_q4 = moveSpeed + proc->move_clock_q4;

    proc->x_q4 += moveSpeed * sMoveOffsetLut[proc->facing * 2 + 0];
    proc->y_q4 += moveSpeed * sMoveOffsetLut[proc->facing * 2 + 1];

    if ((proc->move_clock_q4 / 16) >= 16)
    {
        proc->move_clock_q4 -= 0x100;

        proc->x_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 0];
        proc->y_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 1];

        proc->move_clock_q4 = 0;

        proc->x_q4 &= ~0xF;
        proc->y_q4 &= ~0xF;
    }

    if (proc->cam_b && !Proc_Find(gProcScr_CamMove))
    {
        gBmSt.camera.x = GetCameraAdjustedX(proc->x_q4 >> MU_SUBPIXEL_PRECISION);
        gBmSt.camera.y = GetCameraAdjustedY(proc->y_q4 >> MU_SUBPIXEL_PRECISION);
    }

    if (!(proc->moveConfig & MU_CONFIG_SPPED_NORMAL))
        UpdateMuStepSounds(proc);
}

void UpdateMuStepSounds(struct MuProc * proc)
{
    const u16 * scr;

    int pc;
    struct Vec2 position;

    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
    {
        switch (proc->jid) {
        case CLASS_WYVERN_RIDER:
        case CLASS_WYVERN_RIDER_F:
        case CLASS_WYVERN_LORD:
        case CLASS_WYVERN_LORD_F:
        case CLASS_WYVERN_KNIGHT:
        case CLASS_WYVERN_KNIGHT_F:
            scr = MuSoundScr_Wyvern;
            break;

        case CLASS_MOGALL:
        case CLASS_ARCH_MOGALL:
            scr = MuSoundScr_Mogall;
            break;

        case CLASS_PEGASUS_KNIGHT:
        case CLASS_FALCON_KNIGHT:
            scr = MuSoundScr_Pegasus;
            break;

        default: // Any other mounted class
            scr = MuSoundScr_Mounted;
            break;
        }
    }
    else
    {
        switch (proc->jid) {
        case CLASS_REVENANT:
        case CLASS_ENTOUMBED:
            scr = MuSoundScr_Zombie;
            break;

        case CLASS_BONEWALKER:
        case CLASS_BONEWALKER_BOW:
        case CLASS_WIGHT:
        case CLASS_WIGHT_BOW:
            scr = MuSoundScr_Skeleton;
            break;

        case CLASS_BAEL:
        case CLASS_ELDER_BAEL:
            scr = MuSoundScr_Spider;
            break;

        case CLASS_MAUTHEDOOG:
        case CLASS_GWYLLGI:
            scr = MuSoundScr_Dog;
            break;

        case CLASS_TARVOS:
        case CLASS_MAELDUIN:
            scr = MuSoundScr_Mounted;
            break;

        case CLASS_MOGALL:
        case CLASS_ARCH_MOGALL:
            scr = MuSoundScr_Mogall;
            break;

        case CLASS_GORGON:
            scr = MuSoundScr_Gorgon;
            break;

        case CLASS_GARGOYLE:
        case CLASS_DEATHGOYLE:
            scr = MuSoundScr_Wyvern;
            break;

        case CLASS_ARMOR_KNIGHT:
        case CLASS_ARMOR_KNIGHT_F:
        case CLASS_GENERAL:
        case CLASS_GENERAL_F:
        case CLASS_MANAKETE_2:
        case CLASS_CYCLOPS:
        case CLASS_DRACO_ZOMBIE:
        case CLASS_DEMON_KING:
        case CLASS_BLST_REGULAR_USED:
        case CLASS_BLST_LONG_USED:
        case CLASS_BLST_KILLER_USED:
            scr = MuSoundScr_FootHeavy;
            break;

        case CLASS_FLEET:
            scr = MuSoundScr_Boat;
            break;

        case CLASS_MANAKETE_MYRRH:
            scr = MuSoundScr_Myrrh;
            break;

        case CLASS_FALLEN_PRINCE:
        case CLASS_FALLEN_PEER:
            return; // no sounds

        default: // Any other non-mounted class
            scr = MuSoundScr_Foot;
            break;

        } // switch (proc->jid)
    }

    pc = DivRem(proc->step_sound_clock++, scr[0]);
    GetMuDisplayPosition(proc, &position);

    if (scr[2 + pc])
    {
        StartPlayMuStepSe(scr[2 + pc], scr[1], position.x);
    }
}

void MU_OnLoop(struct MuProc * proc)
{
    if (proc->state)
    {
        if (proc->move_clock_q4 == 0)
            if (proc->state == MU_STATE_SLEEPING || proc->state == MU_STATE_MOVEMENT)
                RunMuMoveScript(proc);

        sMuStateFuncs[proc->state](proc);
    }

    if (proc->facing == MU_FACING_STANDING)
        PutMuSMS(proc);
    else
        PutMu(proc);
}

void MU_OnEnd(struct MuProc * proc)
{
    proc->config->slot = 0;
    AP_Delete(proc->sprite_anim);
}

void MU_EndAll(void)
{
    Proc_EndEach(ProcScr_Mu);
}

void MU_End(struct MuProc * proc)
{
    MU_EndInternal(proc);
}

void MU_EndInternal(struct MuProc * proc)
{
    Proc_End(proc);
}

void HaltMu(struct MuProc * proc)
{
    EndMuMovement(proc);
    proc->state = MU_STATE_INACTIVE;
}

void MU_AllDisable(void)
{
    Proc_BlockEachMarked(PROC_MARK_MU);
}

void MU_AllEnable(void)
{
    Proc_UnblockEachMarked(PROC_MARK_MU);
}

void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * movescr)
{
    while (TRUE)
    {
        switch (*movescr++) {
        case MOVE_CMD_END:
        case MOVE_CMD_HALT:
            return;

        case MOVE_CMD_MOVE_LEFT:
            (*x)--;
            break;

        case MOVE_CMD_MOVE_RIGHT:
            (*x)++;
            break;

        case MOVE_CMD_MOVE_UP:
            (*y)--;
            break;

        case MOVE_CMD_MOVE_DOWN:
            (*y)++;
            break;

        case MOVE_CMD_SLEEP:
            movescr++;
            break;

        default:
            break;

        }
    }
}

bool CanStartMu(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        if (sMuConfig[i].slot == 0)
            return true;

    return false;
}

void ResetMuAnims(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            ResetSpriteAnimClock(sMuConfig[i].mu->sprite_anim);
        }
    }
}

struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot)
            continue;

        sMuConfig[i].slot = i + 1;
        sMuConfig[i].chr = sMuChrOffLut_Default[i] + objTileId;

        *outIndex = i;
        return sMuConfig + i;
    }
    return NULL;
}

struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot)
            continue;

        sMuConfig[i].slot = i + 1;
        sMuConfig[i].chr = sMuChrOffLut[i] + objTileId;

        *outIndex = i;
        return sMuConfig + i;
    }
    return NULL;
}

u8 GetMuDisplayPosition(struct MuProc * proc, struct Vec2 * out)
{
    if (proc->state == MU_STATE_DISPLAY_UI)
    {
        out->x = (proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION;
        out->y = (proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION;
    }
    else
    {
        short x = ((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x + 8;
        short y = ((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y + 8;

        out->x = x;
        out->y = y + 8;

        if (x < -0x10 || x > 0x100 || y < -0x10 || y > 0xB0)
            return false;
    }
    return true;
}

void PutMuSMS(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;

        if (!GetMuDisplayPosition(proc, &pos))
            return;

        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);

        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;

        sub_8026FF4(
            proc->slot,
            proc->pGfxVRAM
        );

        sub_8027DB4(
            proc->sprite_anim->objLayer,

            pos.x - 8,
            pos.y - 16,

            ((((unsigned)(proc->pGfxVRAM - OBJ_VRAM0) & 0x1FFFF) >> 5)
                | ((proc->config->pal & 0xF) << 12))
                + proc->layer,

            proc->jid,
            proc->slot
        );
    }
}

void PutMu(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;

        if (!GetMuDisplayPosition(proc, &pos))
            return;

        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);

        if (proc->state != MU_STATE_DISPLAY_UI)
            if (proc->unit && UNIT_FACTION(proc->unit) == FACTION_RED)
                if (gPlaySt.chapterVisionRange != 0)
                    if (gBmMapFog[MU_GetDisplayYOrg(proc) >> 4][MU_GetDisplayXOrg(proc) >> 4] == 0)
                        return; // whew

        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;

        AP_Update(proc->sprite_anim, pos.x, pos.y);
    }
}

u16 GetMuQ4MovementSpeed(struct MuProc * proc)
{
    int config = proc->moveConfig;

    if (config & 0x80)
        config += 0x80; // I don't really get that one

    if (proc->fast_walk_b)
        return 0x100;

    if (config != 0x40)
    {
        if (config != 0x00)
        {
            int speed = config;

            if (speed & 0x40)
                speed ^= 0x40;
            else if (gPlaySt.config.gameSpeed || (gKeyStatusPtr->heldKeys & A_BUTTON))
                speed *= 4;

            if (speed > 0x80)
                speed = 0x80;

            return speed;
        }

        if (!IsFirstPlaythrough() && (gKeyStatusPtr->heldKeys & A_BUTTON))
            return 0x80;

        if (gPlaySt.config.gameSpeed)
            return 0x40;
    }

    return 16 * sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking];
}

void SetMuConfig(struct MuProc * proc, u16 config)
{
    if (config > 0x100)
        proc->moveConfig = 0x100;
    else
        proc->moveConfig = config;
}

void* GetMuImgBufById(int slot)
{
    return gMUGfxBuffer + (sMuImgBufOffLut[slot] * MU_GFX_MAX_SIZE);
}

const void * GetMuImg(struct MuProc * proc)
{
    return gMuInfoTable[proc->jid - 1].img;
}

const void * GetMuAnimForJid(u16 jid)
{
    return gMuInfoTable[jid - 1].anim;
}

void MU_StartDeathFade(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuDeathFade, mu);
    proc->mu = mu;
    proc->timeLeft = 0x20;
    SetBlendConfig(0, 0x10, 0x10, 0);
    FreezeSpriteAnim(mu->sprite_anim);
    StartMuHitFlash(mu, MU_FLASH_WHITE);
    mu->sprite_anim->objLayer = 13;
    PlaySoundEffect(SONG_D6);

    if (mu->unit->state & US_IN_BALLISTA)
    {
        TryRemoveUnitFromBallista(mu->unit);
        HideUnitSprite(mu->unit);
    }
}

void MuDeathFade_OnLoop(struct MuEffectProc * proc)
{
    SetBlendConfig(0, (proc->timeLeft--) >> 1, 0x10, 0);
    if (proc->timeLeft == 0)
    {
        MU_End(proc->mu);
        Proc_Break(proc);
    }
}

void MuBlink_OnLoop(struct MuEffectProc * proc)
{
    struct MuProc * mu = (struct MuProc *) proc->proc_parent;
    int boolHidden = false;

    if ((proc->timeLeft & 0x7) < 4)
        boolHidden = true;

    mu->hidden_b = boolHidden;

    if (--proc->timeLeft < 0)
    {
        Proc_Break(proc);
        mu->hidden_b = true;
    }
}

void StartBlinkMu(struct MuProc * mu)
{
    struct MuEffectProc * proc;

    mu->state = MU_STATE_DEATHFADE;

    proc = Proc_Start(ProcScr_MuBlink, mu);

    proc->mu = mu;
    proc->timeLeft = 0x40;

    mu->sprite_anim->frameTimer = 0;
    mu->sprite_anim->frameInterval = 0;

    PlaySoundEffect(0xD6); // TODO: SOUND DEFINITIONS
}

void MU_SetupPixelEffect(u32* data, int frame)
{
    static u32 sKeptPixelsWordMask;
    static u32 sClearedPixelWordMask;

    int i, j;

    int pixel = sUnknown_089A2CA8[frame] % 8;
    int wordId = sUnknown_089A2CA8[frame] / 8;

    sKeptPixelsWordMask = ~(sClearedPixelWordMask = (0xF << (pixel * 4)));

    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 4; ++j)
        {
            data[wordId] &= sKeptPixelsWordMask;

            data += 8;
        }

        data += 0xE0;
    }
}

void MuPixelEffect_OnLoop(struct MuEffectProc * proc)
{
    MU_SetupPixelEffect(
        GetMuImgBufById(((struct MuProc *)(proc->proc_parent))->slot),
        proc->frameIndex
    );

    proc->frameIndex++;

    // TODO: FIXME: This may be bugged?
    RegisterDataMove(
        gMUGfxBuffer,
        OBJ_VRAM0 + (OBCHR_MU_380 * CHR_SIZE),
        (0x80 * 0x20)
    );

    if (--proc->timeLeft == 0)
    {
        MU_End(proc->mu);
        Proc_Break(proc);
    }
}

void MU_StartPixelEffect(struct MuProc * mu)
{
    struct MuEffectProc * proc;

    mu->state = MU_STATE_DEATHFADE;

    proc = Proc_Start(ProcScr_MuPixelEffect, mu);

    proc->mu = mu;

    proc->timeLeft = 0x40;
    proc->frameIndex = 0;

    mu->sprite_anim->frameTimer = 0;
    mu->sprite_anim->frameInterval = 0;

    PlaySoundEffect(0xD6); // TODO: SOUND DEFINITIONS
}

void HideMu(struct MuProc * proc)
{
    proc->hidden_b = true;
}

void ShowMu(struct MuProc * proc)
{
    proc->hidden_b = false;
}

void SetMuScreenPosition(struct MuProc * proc, int x, int y)
{
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
}

void SetMuScreenOffset(struct MuProc * proc, int xOff, int yOff)
{
    proc->x_offset_q4 = xOff << MU_SUBPIXEL_PRECISION;
    proc->y_offset_q4 = yOff << MU_SUBPIXEL_PRECISION;
}

void StartMuFadeIntoFlash(struct MuProc * proc, int flashType)
{
    proc->sprite_anim->tileBase =
        proc->config->chr + OAM2_PAL(OBPAL_MU_FADE) + proc->layer;

    ApplyPalette(PAL_OBJ(proc->config->pal), 0x10 + OBPAL_MU_FADE);

    StartPalFade(
        gMuFlashPalLut[flashType],
        0x15, 8, proc);
}

void StartMuFadeFromFlash(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    StartPalFade(
        PAL_OBJ(mu->config->pal),
        0x15, 8, mu
    );

    proc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    proc->mu = mu;
}

void MuRestorePalInfo_Apply(struct MuEffectProc * proc)
{
    struct MuProc * mu = proc->mu;
    mu->sprite_anim->tileBase =
        mu->config->chr + OAM2_PAL(mu->config->pal) + mu->layer;
}

void StartMuActionAnim(struct MuProc * proc)
{
    AP_SwitchAnimation(proc->sprite_anim, MU_FACING_SELECTED);
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuActionAnimFinishFunc, (int) proc->sprite_anim, 30);
}

void MuActionAnimFinishFunc(int arg)
{
    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuDelayedFaceDefender(struct MuProc * proc)
{
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuDelayedFaceDefenderFunc, (int) proc->sprite_anim, 30);
}

void MuDelayedFaceDefenderFunc(int arg)
{
    SetBattleAnimFacing(
        gManimSt.subjectActorId,
        1 - gManimSt.subjectActorId,
        GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore));

    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuSpeedUpAnim(struct MuProc * proc)
{
    proc->sprite_anim->frameTimer    = 0;
    proc->sprite_anim->frameInterval = 0x40;

    CallDelayedArg(MuSlowDownAnimFreezeFunc, (int) proc->sprite_anim, 20);
}

void MuSlowDownAnimFreezeFunc(int arg)
{
    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuCritFlash(struct MuProc * mu, int flashType)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flashType], 0x10 + OBPAL_MU_FADE);
    proc = Proc_Start(ProcScr_MuCritFlash, mu);
    proc->mu = mu;
}

void MuCritFlash_Init(struct MuFlashEffectProc * proc)
{
    proc->timer = 0;
}

void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc)
{
    struct MuProc * mu = proc->mu;

    mu->sprite_anim->tileBase =
        OAM2_PAL(OBPAL_MU_FADE) + mu->config->chr + mu->layer;
}

void MuCritFlash_SetRegularPalette(struct MuFlashEffectProc * proc)
{
    struct MuProc * mu = proc->mu;

    mu->sprite_anim->tileBase =
        OAM2_PAL(mu->config->pal) + mu->config->chr + mu->layer;
}

void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc)
{
    StartPalFade(
        PAL_OBJ(proc->mu->config->pal),
        0x10 + OBPAL_MU_FADE, 20, proc
    );
}

void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc)
{
    proc->timer++;

    SetMuScreenOffset(proc->mu, ((proc->timer & 1) ? 2 : -2), 0);

    if (proc->timer >= 12)
    {
        SetMuScreenOffset(proc->mu, 0, 0);
        Proc_Break(proc);
    }
}

void MuCritFlash_RestorePalette(struct MuFlashEffectProc * proc)
{
    struct MuProc * mu = proc->mu;

    mu->sprite_anim->tileBase =
        ((mu->config->pal & 0xF) << 12) + mu->config->chr + mu->layer;
}

void StartMuHitFlash(struct MuProc * mu, int flashType)
{
    struct MuFlashEffectProc * proc;

    ApplyPalette(gMuFlashPalLut[flashType], 0x10 + OBPAL_MU_FADE);

    mu->sprite_anim->tileBase =
        OAM2_PAL(OBPAL_MU_FADE) + mu->config->chr + mu->layer;

    StartPalFade(
        PAL_OBJ(mu->config->pal),
        0x15, 0x14, mu
    );

    proc = Proc_Start(ProcScr_MuHitFlash, mu);

    proc->mu = mu;
}

void MuFlashFadeFrom_RestorePal(struct MuFlashEffectProc * proc)
{
    struct MuProc * mu = proc->mu;

    mu->sprite_anim->tileBase =
        OAM2_PAL(mu->config->pal) + mu->config->chr + mu->layer;
}

void SetMuMaxWalkSpeed(void)
{
    Proc_ForEach(ProcScr_Mu, MuMaxWalkSpeedFunc);
}

void MuMaxWalkSpeedFunc(ProcPtr proc)
{
    ((struct MuProc *)(proc))->fast_walk_b = true;
}

void SetMuSpecialSprite(struct MuProc * proc, int jid, const u16 * pal)
{
    proc->sprite_anim->frameTimer = 0;
    proc->sprite_anim->frameInterval = 0;

    proc->jid = jid;

    AP_SetDefinition(
        proc->sprite_anim,
        GetMuAnimForJid(proc->jid)
    );

    Decompress(
        GetMuImg(proc),
        GetMuImgBufById(proc->config->slot)
    );

    ApplyPalette(pal, 0x10 + proc->config->pal);
}

void SetMuPal(struct MuProc * proc, unsigned paletteId)
{
    proc->config->pal = paletteId;

    proc->sprite_anim->tileBase =
        proc->config->chr + OAM2_PAL(paletteId % 0x10) + proc->layer;
}

struct MuProc * GetMu(int slot)
{
    if (!sMuConfig[slot].slot)
        return NULL;

    return sMuConfig[slot].mu;
}

struct MuProc * GetUnitMu(struct Unit * unit)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);

        if (proc->unit == unit)
            return proc;
    }
    return NULL;
}

void SortMus(void)
{
    struct MuProc * procs[MU_MAX_COUNT];

    s8 i, j, count;

    // Clear proc list
    CpuFill32(0, procs, MU_MAX_COUNT * sizeof(struct MuProc *));
    count = 0;

    // Building proc list
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);

        if (proc)
        {
            procs[count] = proc;
            count++;
        }
    }

    // Sorting proc list
    for (i = 0; i < (count - 1); ++i)
    {
        for (j = (i + 1); j < count; ++j)
        {
            if (procs[j]->y_q4 < procs[i]->y_q4)
            {
                struct MuProc * tmp = procs[i];

                procs[i] = procs[j];
                procs[j] = tmp;
            }
        }
    }

    // Set obj layer based on order
    for (i = 0; i < count; ++i)
        procs[i]->sprite_anim->objLayer = 10 - i;
}
