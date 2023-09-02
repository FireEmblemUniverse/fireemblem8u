#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "ap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "bmmap.h"
#include "bm.h"
#include "bmlib.h"
#include "constants/video-global.h"


/**
 * Various Graphical Effects related to activating traps
 * port from fe6@StanHash
 */


/* struct definitions */

struct TrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x4A - 0x34];
    /* 4A */ s16 direction;
    /* 60 */
};

struct UnkTrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x58 - 0x34];
    /* 58 */ int direction;
    /* 5C */ int timer;
    /* 60 */
};

struct ShowMapChangeProc{
    PROC_HEADER;

    /* 2C */ int mcId;
    /* 30 */ int altSong;
    /* 34 */ int sndx;
};

/* function declarations */
void GasTrapSpriteAnim_Init(struct TrapfxProc *proc);
void FireTrapSpriteAnim_Init(struct TrapfxProc *proc);
void ProcUnkTrapAnimFunc(struct UnkTrapfxProc *proc);
void ArrowTrapSpriteAnim_Init(struct TrapfxProc *proc);
void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc *proc);
void ProcShowMapChange_UpdateGame(struct ShowMapChangeProc *proc);
void PikeTrapSpriteAnim_Init(struct TrapfxProc *proc);


/* section.data */
extern u16 CONST_DATA Img_GasTrapVertical[];
extern u16 CONST_DATA SpriteAnim_GasTrapVertical[];
extern u16 CONST_DATA Img_GasTrapHorizontal[];
extern u16 CONST_DATA SpriteAnim_GasTrapHorizontal[];
extern u16 CONST_DATA Pal_GasTrap[];
extern u16 CONST_DATA Img_FireTrap[];
extern u16 CONST_DATA SpriteAnim_FireTrap[];
extern u16 CONST_DATA Pal_FireTrap[];
extern u16 CONST_DATA Pal_FireTrap2[];
extern u16 CONST_DATA Obj_WallBreakAnim[];
extern u16 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern u16 CONST_DATA Img_ArrowTrap[];
extern u16 CONST_DATA Pal_ArrowTrap[];
extern u16 CONST_DATA SpriteAnim_ArrowTrap[];
extern u16 CONST_DATA Img_PikeTrap[];
extern u16 CONST_DATA Pal_PikeTrap[];
extern u16 CONST_DATA SpriteAnim_PikeTrap[];

struct ProcCmd CONST_DATA ProcScr_GasTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(GasTrapSpriteAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_FireTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(FireTrapSpriteAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_UnkTrapAnim[] = {
    PROC_YIELD,
PROC_LABEL(0x00),
    PROC_CALL(ProcUnkTrapAnimFunc),
    PROC_SLEEP(0x08),
    PROC_GOTO(0x00),
PROC_LABEL(0x64),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_ArrowTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(ArrowTrapSpriteAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_SLEEP(0x0F),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_ShowMapChangeAnim[] = {
    PROC_YIELD,
    PROC_CALL(ProcShowMapChange_MoveCamera),
    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_CALL(ProcShowMapChange_UpdateGame),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_PikeTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(PikeTrapSpriteAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};


/* section.text */

void GasTrapSpriteAnim_Init(struct TrapfxProc *proc)
{
    int x, y, oam2;

    const u16 *img = NULL;
    const u16 *anim = NULL;
    int animNum = 0;

    switch (proc->direction)
    {

    case FACING_UP:
        img = Img_GasTrapVertical;
        anim = SpriteAnim_GasTrapVertical;
        break;

    case FACING_DOWN:
        img = Img_GasTrapVertical;
        anim = SpriteAnim_GasTrapVertical;
        animNum = 1;
        break;

    case FACING_LEFT:
        img = Img_GasTrapHorizontal;
        anim = SpriteAnim_GasTrapHorizontal;
        animNum = 1;
        break;

    case FACING_RIGHT:
        img = Img_GasTrapHorizontal;
        anim = SpriteAnim_GasTrapHorizontal;
        break;

    }

    Decompress(img, OBJ_CHR_ADDR(OBJCHR_TRAPFX));
    ApplyPalette(Pal_GasTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = OAM2_CHR(OBJCHR_TRAPFX) | OAM2_PAL(OBJPAL_TRAPFX) | OAM2_LAYER(1);

    APProc_Create(anim, x, y, oam2, animNum, 0);
    PlaySeSpacial(0xBA, x + 8);
}

void StartGasTrapAnim(ProcPtr parent, int x, int y, int facing)
{
    struct TrapfxProc *proc = Proc_StartBlocking(ProcScr_GasTrapAnim, parent);

    proc->x = x;
    proc->y = y;
    proc->direction = facing;
}

void FireTrapSpriteAnim_Init(struct TrapfxProc *proc)
{
    int x, y, oam2;

    Decompress(Img_FireTrap, OBJ_CHR_ADDR(OBJCHR_TRAPFX));

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = OAM2_CHR(OBJCHR_TRAPFX) | OAM2_PAL(OBJPAL_TRAPFX) | OAM2_LAYER(1);

    APProc_Create(SpriteAnim_FireTrap, x, y, oam2, 0, 0);
    PlaySeSpacial(0xBF, x + 8);
}

void StartFireTrapAnim(ProcPtr parent, int x, int y)
{
    struct TrapfxProc *proc;
    
    ApplyPalette(Pal_FireTrap, 0x10 + OBJPAL_TRAPFX);
    proc = Proc_StartBlocking(ProcScr_FireTrapAnim, parent);

    proc->x = x;
    proc->y = y;
}

void StartFireTrapAnim2(ProcPtr parent, int x, int y)
{
    struct TrapfxProc *proc;
    
    ApplyPalette(Pal_FireTrap2, 0x10 + OBJPAL_TRAPFX);
    proc = Proc_StartBlocking(ProcScr_FireTrapAnim, parent);

    proc->x = x;
    proc->y = y;
}

void ProcUnkTrapAnimFunc(struct UnkTrapfxProc *proc)
{
    int x = (proc->x * 16 + 8 - gBmSt.camera.x) & 0x1FF;
    int y = (proc->y * 16 + 8 - gBmSt.camera.y) & 0x0FF;
    int tileBase = 0x2640;

    APProc_Create(Obj_WallBreakAnim, x, y, tileBase, 0, 0);

    if (--proc->timer <= 0)
        Proc_Goto(proc, 0x64);

    switch (proc->direction) {
    case FACING_UP:
        proc->y--;
        break;

    case FACING_DOWN:
        proc->y++;
        break;

    case FACING_LEFT:
        proc->x--;
        break;

    case FACING_RIGHT:
        proc->x++;
        break;

    default:
        break;
    }
}

void StartUnkTrapAnim(ProcPtr parent, int x, int y, int direction, int time)
{
    struct UnkTrapfxProc *proc;

    Decompress(Img_WallBreakAnim, OBJ_CHR_ADDR(OBJCHR_TRAPFX));
    ApplyPalette(Pal_WallBreakAnim, 0x10 + OBJPAL_TRAPFX);

    proc = Proc_StartBlocking(ProcScr_UnkTrapAnim, parent);
    proc->direction = direction;
    proc->timer = time;
    proc->x = x;
    proc->y = y;
}

void ArrowTrapSpriteAnim_Init(struct TrapfxProc *proc)
{
    int x, oam2;

    Decompress(Img_ArrowTrap, OBJ_CHR_ADDR(OBJCHR_TRAPFX));
    ApplyPalette(Pal_ArrowTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    oam2 = OAM2_CHR(OBJCHR_TRAPFX) | OAM2_PAL(OBJPAL_TRAPFX) | OAM2_LAYER(1);

    APProc_Create(SpriteAnim_ArrowTrap, x, DISPLAY_HEIGHT / 2, oam2, 0, 0);
    PlaySeSpacial(0xBC, x + 8);

    EnsureCameraOntoPosition(proc, proc->x, 31);
}

void StartArrowTrapAnim(ProcPtr parent, int x)
{
    struct UnkTrapfxProc *proc = Proc_StartBlocking(ProcScr_ArrowTrapAnim, parent);
    proc->x = x;
}

void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc * proc)
{
    const struct MapChange *info = GetMapChange(proc->mcId);

    int x = info->xOrigin + info->xSize / 2;
    int y = info->yOrigin + info->ySize / 2;

    EnsureCameraOntoPosition(proc, x, y);

    proc->sndx = x;
}

void ProcShowMapChange_UpdateGame(struct ShowMapChangeProc * proc)
{
    int song;

    RenderBmMapOnBg2();

    sub_8019778();
    RenderBmMap();

    NewBMXFADE(FALSE);

    if (proc->altSong)
        song = 0xBE;
    else
        song = 0xBD;

    PlaySeSpacial(song, proc->sndx /* *16 + 8 */ - gBmSt.camera.x);
}

void StartShowMapChangeAnim(ProcPtr parent, int unused, int trapid)
{
    struct ShowMapChangeProc * proc;
    struct Trap * trap;

    proc = Proc_StartBlocking(ProcScr_ShowMapChangeAnim, parent);

    trap = GetTrap(trapid);
    trap->extra ^= 1;

    if (trap->extra != 0)
        proc->mcId = trap->yPos;
    else
        proc->mcId = trap->xPos;

    proc->altSong = trap->extra;
}

void PikeTrapSpriteAnim_Init(struct TrapfxProc *proc)
{
    int x, y, oam2;

    Decompress(Img_PikeTrap, OBJ_CHR_ADDR(OBJCHR_TRAPFX));
    ApplyPalette(Pal_PikeTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = OAM2_CHR(OBJCHR_TRAPFX) | OAM2_PAL(OBJPAL_TRAPFX) | OAM2_LAYER(1);

    APProc_Create(SpriteAnim_PikeTrap, x, y, oam2, proc->direction, 0);
    PlaySeSpacial(0xBB, x + 8);
}

void StartPikeTrapAnim(ProcPtr parent, int x, int y, int facing)
{
    struct TrapfxProc *proc = Proc_StartBlocking(ProcScr_PikeTrapAnim, parent);

    proc->x = x;
    proc->y = y;

    switch (facing)
    {
    case FACING_RIGHT:
        proc->direction = FACING_LEFT;
        break;

    case FACING_LEFT:
        proc->direction = FACING_RIGHT;
        break;

    case FACING_UP:
        proc->direction = FACING_DOWN;
        break;

    default:
        break;
    }
}
