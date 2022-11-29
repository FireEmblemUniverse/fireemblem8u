
#include "global.h"

#include "ctc.h"
#include "proc.h"
#include "hardware.h"

struct FaceProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct FaceData* pFaceInfo;
    /* 30 */ u32 displayBits;
    /* 34 */ s16 xPos;
    /* 36 */ s16 yPos;

    /* 38 */ void* sprite;

    /* 3C */ u16 oam2;
    /* 3E */ u16 faceId;
    /* 40 */ u8 faceSlot;
    /* 41 */ u8 spriteLayer;

    /* 44 */ ProcPtr unk_44;
    /* 48 */ ProcPtr unk_48;
};

// TODO: Move to "constants/faces.h"
enum {
    FID_LUTE                = 0x10,
    FID_AMELIA              = 0x19,
    FID_EWAN                = 0x21,
    FID_DOZLA               = 0x23,
    FID_MYRRH               = 0x26,

    FID_SHOP_ARMORY         = 0x65,
    FID_SHOP_VENDOR         = 0x66,
    FID_ARENA               = 0x67,
    FID_SHOP_SECRET         = 0x68,

    FID_FACTION_CHIBI       = 0x7F00,
};

// generic minimug images
extern u8 CONST_DATA gUnknown_08599D34[];
extern u8 CONST_DATA gUnknown_08599B34[];
extern u8 CONST_DATA gUnknown_08599734[];
extern u8 CONST_DATA gUnknown_08599934[];

// generic minimug palettes
extern u8 CONST_DATA gUnknown_08599F34[];
extern u8 CONST_DATA gUnknown_08599F54[];
extern u8 CONST_DATA gUnknown_08599F74[];

// funcs
void Load6CFACEGraphics(struct FaceProc*);
void sub_80055BC(struct FaceProc*);
void sub_8005AD4(struct FaceProc*);
void sub_8005D64(ProcPtr);
void sub_8005D70(ProcPtr);
void sub_8005D98(ProcPtr);
void sub_8005ECC(ProcPtr);
void sub_8005FD4(ProcPtr);
void sub_8005FE0(ProcPtr);
void sub_800623C(ProcPtr);
void sub_8006280(ProcPtr);
void sub_80062B8(ProcPtr);
void sub_8006324(ProcPtr);
void sub_800632C(ProcPtr);
void sub_8006370(ProcPtr);
void sub_8006378(ProcPtr);
void sub_80063BC(ProcPtr);
void sub_80063C4(ProcPtr);

// default face vram config
struct FaceVramEntry CONST_DATA gUnknown_08590FEC[4] =
{
    [0] =
    {
        .tileOffset = 0x20 * 0x300,
        .paletteId  = 6,
    },

    [1] =
    {
        .tileOffset = 0x20 * 0x280,
        .paletteId  = 7,
    },

    [2] =
    {
        .tileOffset = 0x20 * 0x200,
        .paletteId  = 8,
    },

    [3] =
    {
        .tileOffset = 0x20 * 0x380,
        .paletteId  = 9,
    },
};

// face without shoulders (64x96)
u16 CONST_DATA gUnknown_0859100C[] =
{
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
};

// face without shoulders (64x96), flipped
u16 CONST_DATA gUnknown_08591026[] =
{
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
};

// full face (96x96)
u16 CONST_DATA gUnknown_08591040[] =
{
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(+32), OAM2_CHR(0x16),
};

// full face (96x96), flipped
u16 CONST_DATA gUnknown_08591066[] =
{
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
};

// smaller face (80x72)
u16 CONST_DATA gUnknown_0859108C[] =
{
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(-40), OAM2_CHR(0x15),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(-40), OAM2_CHR(0x55),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(+32), OAM2_CHR(0x56),
};

// smaller face (80x72), flipped
u16 CONST_DATA gUnknown_085910BE[] =
{
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x16),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x15),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x56),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x55),
};

// cut face (96x72)
u16 CONST_DATA gUnknown_085910F0[] =
{
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(-48), OAM2_CHR(0x54),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(+32), OAM2_CHR(0x56),
};

// cut face (96x72), flipped
u16 CONST_DATA gUnknown_08591122[] =
{
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x56),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x54),
};

// face proc
struct ProcCmd CONST_DATA gProcScr_E_FACE[] =
{
    PROC_NAME("E_FACE"),

    PROC_WHILE_EXISTS(ProcScr_MaybeMapChangeAnim),
    PROC_SLEEP(0),

    PROC_CALL(Load6CFACEGraphics),

    PROC_CALL(sub_80055BC),
    PROC_REPEAT(sub_80055BC),

    PROC_END,
};

// other face proc. This one waits an extra frame before displaying anything
struct ProcCmd CONST_DATA gUnknown_0859118C[] =
{
    PROC_NAME("E_FACE"),

    PROC_WHILE_EXISTS(ProcScr_MaybeMapChangeAnim),
    PROC_SLEEP(1),

    PROC_CALL(Load6CFACEGraphics),

    PROC_CALL(sub_80055BC),
    PROC_REPEAT(sub_80055BC),

    PROC_END,
};

// unk
u8 CONST_DATA gUnknown_085911C4[] =
{
    4, 4,
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F,
};

struct ProcCmd CONST_DATA gUnknown_085911D8[] =
{
    PROC_REPEAT(sub_8005AD4),
    PROC_END,
};

u16 CONST_DATA gUnknown_085911E8[] =
{
    2,
    OAM0_SHAPE_32x16,              OAM1_SIZE_32x16, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16, OAM2_CHR(4),
};

u16 CONST_DATA gUnknown_085911F6[] =
{
    2,
    OAM0_SHAPE_32x16,              OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(4),
};

struct ProcCmd CONST_DATA gUnknown_08591204[] =
{
    PROC_CALL(sub_8005D64),

PROC_LABEL(0),
    PROC_REPEAT(sub_8005D70),
    PROC_REPEAT(sub_8005D98),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08591234[] =
{
    PROC_SLEEP(8),
    PROC_CALL(sub_8005ECC),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_0859124C[] =
{
    PROC_CALL(sub_8005FD4),
    PROC_REPEAT(sub_8005FE0),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08591264[] =
{
PROC_LABEL(0),
    PROC_CALL(sub_800623C),

PROC_LABEL(0),
    PROC_REPEAT(sub_8006280),

PROC_LABEL(1),
    PROC_REPEAT(sub_80062B8),

PROC_LABEL(2),
    PROC_CALL(sub_8006324),
    PROC_REPEAT(sub_800632C),
    PROC_REPEAT(sub_8006280),

PROC_LABEL(3),
    PROC_CALL(sub_8006370),
    PROC_REPEAT(sub_8006378),
    PROC_REPEAT(sub_8006280),

PROC_LABEL(4),
    PROC_CALL(sub_80063BC),
    PROC_REPEAT(sub_80063C4),

PROC_LABEL(97),
    PROC_REPEAT(sub_800632C),

    PROC_END,
};

// generic minimug image lut
const void* const gUnknown_080D77BC[] =
{
    gUnknown_08599D34,
    gUnknown_08599B34,
    gUnknown_08599734,
    gUnknown_08599734,
    gUnknown_08599D34,
    gUnknown_08599934,
    gUnknown_08599934,
    gUnknown_08599D34,
};

// generic minimug palette lut
const void* const gUnknown_080D77DC[] =
{
    gUnknown_08599F34,
    gUnknown_08599F54,
    gUnknown_08599F74,
    gUnknown_08599F54,
    gUnknown_08599F54,
    gUnknown_08599F74,
    gUnknown_08599F54,
    gUnknown_08599F34,
};

// ????
u16 const gUnknown_080D77FC[] =
{
    -1, -1,
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    -1, -1, -1, -1,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
    -1, -1, -1, -1,
    0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
    -1, -1, -1, -1,
    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
    -1, -1, -1, -1,
    0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    -1, -1, -1, -1,
    0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
    -1, -1,

    0x14, 0x15, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D,
    0x4E, 0x4F, 0x16, 0x17, 0x34, 0x35, 0x68, 0x69,
    0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x36, 0x37,
    0x54, 0x55, 0x10, 0x11, 0x12, 0x13, 0x50, 0x51,
    0x52, 0x53, 0x56, 0x57, 0x74, 0x75, 0x30, 0x31,
    0x32, 0x33, 0x70, 0x71, 0x72, 0x73, 0x76, 0x77,
};

extern const struct FaceData portrait_data[];

extern struct FaceVramEntry gUnknown_0202A68C[];
extern struct FaceProc* gUnknown_03004980[];

extern u8 gUnknown_085A0838[]; // tsa
extern u8 gUnknown_085A08F0[]; // tsa

// forward decl.
void SetupFaceGfxData(struct FaceVramEntry*);
int sub_80057A4(struct FaceProc*);
int sub_8005770(struct FaceProc*, int);
void sub_80057C0(struct FaceProc*);
u8* sub_8005F6C(int);
void sub_8005F9C(int, int);

//! FE8U = 0x08005514
const struct FaceData* GetPortraitStructPointer(int fid) {
    return portrait_data + fid - 1;
}

//! FE8U = 0x08005528
void ResetFaces(void) {
    int i;

    for (i = 0; i < 4; i++) {
        DeleteFaceByIndex(i);
    }

    SetupFaceGfxData(0);

    return;
}

//! FE8U = 0x08005544
void SetupFaceGfxData(struct FaceVramEntry* config) {
    int i;

    if (config == 0) {
        config = gUnknown_08590FEC;
    }

    for (i = 0; i < 4; i++) {
        gUnknown_0202A68C[i].tileOffset = config[i].tileOffset;
        gUnknown_0202A68C[i].paletteId = config[i].paletteId;
    }

    return;
}

//! FE8U = 0x08005570
int sub_8005570(void) {
    int i;

    for (i = 0; i < 4; i++) {
        if (gUnknown_03004980[i] == 0) {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x08005594
void Load6CFACEGraphics(struct FaceProc* proc) {

    CopyDataWithPossibleUncomp(proc->pFaceInfo->img, (void *)(gUnknown_0202A68C[proc->faceSlot].tileOffset + 0x06010000));

    return;
}

//! FE8U = 0x080055BC
void sub_80055BC(struct FaceProc* proc) {
    int oam0;

    if (sub_80057A4(proc) & 0x4000) {
        return;
    }

    if (sub_80057A4(proc) & 0x400) {
        oam0 = 0x400;
    } else {
        oam0 = 0;
    }

    oam0 += proc->yPos & 0xFF;

    PutSpriteExt(
        proc->spriteLayer,
        0x1FF & proc->xPos,
        oam0,
        proc->sprite,
        proc->oam2
    );

    return;
}

//! FE8U = 0x08005610
struct FaceProc* sub_8005610(int fid, int x, int y, int disp) {

    int slot = sub_8005570();

    if (slot < 0) {
        return NULL;
    }

    return NewFace(slot, fid, x, y, disp);
}

// TODO: Fix the return type

//! FE8U = 0x0800563C
void* NewFace(int slot, int fid, int x, int y, int disp) {
    struct FaceProc* proc;
    const struct FaceData* info;

    if (gUnknown_03004980[slot] != NULL) {
        return 0;
    }

    proc = Proc_Start(gProcScr_E_FACE, PROC_TREE_5);

    gUnknown_03004980[slot] = proc;

    info = GetPortraitStructPointer(fid);

    if (disp & 0x2000) {
        CpuFastFill(0, (gPaletteBuffer + 0x10 * 0x10) + gUnknown_0202A68C[slot].paletteId * 0x10, 0x20);
        EnablePaletteSync();
    } else {
        CopyToPaletteBuffer(info->pal, (gUnknown_0202A68C[slot].paletteId + 0x10) * 0x20, 0x20);
    }

    proc->pFaceInfo = info;

    proc->faceSlot = slot;
    proc->faceId = fid;

    proc->spriteLayer = 5;

    proc->xPos = x;
    proc->yPos = y;

    if (disp & 0x1000) {
        proc->unk_44 = 0;
        proc->unk_48 = 0;
    } else {
        proc->unk_44 = Proc_Start(gUnknown_0859124C, proc);
        proc->unk_48 = Proc_Start(gUnknown_08591264, proc);
    }

    proc->displayBits = ~disp;

    sub_8005770(proc, disp);

    return proc;
}

//! FE8U = 0x08005738
void DeleteE_FACEByPointer(struct FaceProc* proc) {
    gUnknown_03004980[proc->faceSlot] = NULL;
    Proc_End(proc);

    return;
}

//! FE8U = 0x08005758
void DeleteFaceByIndex(int slot) {
    DeleteE_FACEByPointer(gUnknown_03004980[slot]);

    return;
}

//! FE8U = 0x08005770
int sub_8005770(struct FaceProc* proc, int disp) {

    if (proc == 0) {
        return 0;
    }

    proc->displayBits = disp;

    sub_80057C0(proc);

    return proc->displayBits;
}

//! FE8U = 0x0800578C
int sub_800578C(int slot, int disp) {
    return sub_8005770(gUnknown_03004980[slot], disp);
}

//! FE8U = 0x080057A4
int sub_80057A4(struct FaceProc* proc) {
    return proc->displayBits;
}

//! FE8U = 0x080057A8
int sub_80057A8(int slot) {
    return sub_80057A4(gUnknown_03004980[slot]);
}

//! FE8U = 0x080057C0
void sub_80057C0(struct FaceProc* proc) {
    int oam2Layer;

    switch (proc->displayBits & 0x807) {
        case 0:
            proc->sprite = gUnknown_0859100C;
            break;

        case 1:
            proc->sprite = gUnknown_08591026;
            break;

        case 2:
            proc->sprite = gUnknown_08591040;
            break;

        case 3:
            proc->sprite = gUnknown_08591066;
            break;

        case 4:
            proc->sprite = gUnknown_0859108C;
            break;

        case 5:
            proc->sprite = gUnknown_085910BE;
            break;

        case 0x800:
            proc->sprite = gUnknown_085910F0;
            break;

        case 0x801:
            proc->sprite = gUnknown_08591122;
            break;
    }

    switch (proc->displayBits & 0x3C0) {
        case 0x040:
            oam2Layer = 0;
            break;

        case 0x080:
            oam2Layer = 0x400;
            break;

        case 0x200:
            oam2Layer = 0xC00;
            break;

        default:
            oam2Layer = 0x800;
            break;
    }

    proc->oam2 = (gUnknown_0202A68C[proc->faceSlot].tileOffset >> 5) + ((gUnknown_0202A68C[proc->faceSlot].paletteId & 0xF) * 0x1000) + oam2Layer;

    return;
}

//! FE8U = 0x08005894
void sub_8005894(u16* tm, u8* data, int tileref, s8 isFlipped) {
    int ix;
    int iy;

    int width = *data++;
    int height = *data++;

    u8* it = data;

    if (isFlipped == 0) {

        for (iy = 0; iy < height; iy++) {
            for (ix = 0; ix < width; ix++) {

                if (*it == 0xFF) {
                    it++;
                    continue;
                }

                tm[TILEMAP_INDEX(ix, iy)] = *it++ + tileref;
            }
        }
    } else {
        for (iy = 0; iy < height; iy++) {
            for (ix = width - 1; ix >= 0; ix--) {

                if (*it == 0xFF) {
                    it++;
                    continue;
                }

                tm[TILEMAP_INDEX(ix, iy)] = *it++ + tileref + 0x400;
            }
        }
    }

    return;
}

//! FE8U = 0x08005924
void sub_8005924(int fid, int chr, int pal) {
    if (fid >= FID_FACTION_CHIBI) {
        RegisterTileGraphics(sub_8005F6C(fid), (void *)(((chr * 0x20 + VRAM) & 0x1FFFF) + VRAM), 0x200);
        sub_8005F9C(fid, pal);
    } else {
        const struct FaceData* info = GetPortraitStructPointer(fid);

        CopyDataWithPossibleUncomp(info->imgChibi, (void *)(chr * 0x20 + VRAM));
        CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);
    }
    return;
}

//! FE8U = 0x08005988
void sub_8005988(int fid, u16* tm, int chr, int pal, s8 isFlipped) {
    sub_8005924(fid, chr, pal);

    chr &= 0x3FF;
    sub_8005894(tm, gUnknown_085911C4, TILEREF(chr, pal), isFlipped);

    return;
}

//! FE8U = 0x080059CC
void sub_80059CC(int fid, int chr, int pal) {
    u8 buffer[0x200];

    chr += 0x800;

    if (fid >= FID_FACTION_CHIBI) {
        RegisterTileGraphics(sub_8005F6C(fid) + 0x00, (void *)(((chr + 0x00) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x80, (void *)(((chr + 0x20) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x100, (void *)(((chr + 0x04) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x180, (void *)(((chr + 0x24) * 0x20 & 0x1FFFF) + VRAM), 0x80);

        sub_8005F9C(fid, pal + 0x10);
    } else {
        const struct FaceData* info = GetPortraitStructPointer(fid);

        CopyDataWithPossibleUncomp(info->imgChibi, buffer);

        CpuFastCopy(buffer + 0x00, (void *)((chr + 0x00) * 0x20 + VRAM), 0x80);
        CpuFastCopy(buffer + 0x80, (void *)((chr + 0x20) * 0x20 + VRAM), 0x80);
        CpuFastCopy(buffer + 0x100, (void *)((chr + 0x04) * 0x20 + VRAM), 0x80);
        CpuFastCopy(buffer + 0x180, (void *)((chr + 0x24) * 0x20 + VRAM), 0x80);

        CopyToPaletteBuffer(info->pal, (pal + 0x10) * 0x20, 0x20);
    }

    return;
}

//! FE8U = 0x08005AD4
void sub_8005AD4(struct FaceProc* proc) {
    PutSprite(
        5,
        proc->xPos - gLCDControlBuffer.bgoffset[0].x,
        proc->yPos - gLCDControlBuffer.bgoffset[0].y,
        proc->sprite,
        proc->oam2
    );

    return;
}

//! FE8U = 0x08005B04
void sub_8005B04(int x, int y, int fid, int chr, int pal, s8 isFlipped, ProcPtr parent) {
    struct FaceProc* proc;

    sub_80059CC(fid, chr, pal);

    proc = Proc_Start(gUnknown_085911D8, parent);

    proc->xPos = x;
    proc->yPos = y;

    proc->oam2 = chr + ((pal & 0xF) * 0x1000);

    if (isFlipped) {
       proc->sprite = gUnknown_085911F6;
    } else {
       proc->sprite = gUnknown_085911E8;
    }

    return;
}

//! FE8U = 0x08005B68
void sub_8005B68(void) {
    Proc_EndEach(gUnknown_085911D8);

    return;
}

//! FE8U = 0x08005B78
void sub_8005B78(u16* tm, int tileref, const struct FaceData* info) {
    int x = info->xMouth - 1;
    int y = info->yMouth;

    CallARM_FillTileRect(tm, gUnknown_085A0838, (u16)tileref);

    tm[TILEMAP_INDEX(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TILEMAP_INDEX(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;

    return;
}

//! FE8U = 0x08005BCC
void sub_8005BCC(u16* tm, int tileref, const struct FaceData* info) {
    int x = info->xMouth - 1;
    int y = info->yMouth - 1;

    CallARM_FillTileRect(tm, gUnknown_085A08F0, (u16)tileref);

    tm[TILEMAP_INDEX(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TILEMAP_INDEX(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;

    return;
}

//! FE8U = 0x08005C24
s8 ShouldPortraitBeSmol(int fid) {

    switch (fid) {
        case FID_LUTE:
        case FID_AMELIA:
        case FID_EWAN:
        case FID_DOZLA:
        case FID_MYRRH:
            return 1;

        default:
            return 0;
    }
}

//! FE8U = 0x08005CA4
void sub_8005CA4(u16* tm, int fid, int chr, int pal) {
    const struct FaceData* info;

    if (fid == 0) {
        return;
    }

    info = GetPortraitStructPointer(fid);

    CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);

    if (info->img != 0) {
        int i;

        CopyDataWithPossibleUncomp(info->img, (void *)(chr * 0x20 + VRAM));
        CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);

        if (ShouldPortraitBeSmol(fid) != 0) {
            sub_8005BCC(tm, (pal << 12) + (0x3FF & chr), info);
        } else {
            sub_8005B78(tm, (pal << 12) + (0x3FF & chr), info);
        }

        for (i = 0; i < 5; i++) {
            tm[i * 0x20 + 0] = 0;
            tm[i * 0x20 + 9] = 0;
        }

    } else {
        CopyDataWithPossibleUncomp(info->imgCard, (void*)(chr * 0x20 + VRAM));
        sub_8013104(tm, (pal << 12) + (0x3FF & chr), 10, 9);
    }

    return;
}