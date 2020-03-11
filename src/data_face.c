
#include "global.h"

#include "ctc.h"
#include "proc.h"

// This file contains data for to-be-decompiled face.c
// Once face.c has been decompiled, merge the content of that file into this

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
void Load6CFACEGraphics(ProcPtr);
void sub_80055BC(ProcPtr);
void sub_8005AD4(ProcPtr);
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
struct ProcCmd CONST_DATA gUnknown_08591154[] =
{
    PROC_NAME("E_FACE"),

    PROC_WHILE_EXISTS(gUnknown_0859A548),
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

    PROC_WHILE_EXISTS(gUnknown_0859A548),
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
