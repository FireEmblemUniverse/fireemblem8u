
#include "global.h"

#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"

#include "constants/faces.h"

#include "face.h"

struct FaceBlinkProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct FaceProc* pFaceProc;

    /* 30 */ s16 blinkControl;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;

    /* 38 */ int unk_38;
    /* 3C */ u16* unk_3c;

    /* 40 */ u16 tileId;
    /* 42 */ u16 palId;
    /* 44 */ u16 faceId;
};

struct DeleteFaceProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x54-0x29];

    /* 54 */ struct FaceProc* target;
};

struct UnkFaceProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct FaceProc* pFaceProc;
    /* 30 */ const struct FaceData* pFaceInfo;
    /* 34 */ int faceId;
};

// generic minimug images
extern u8 CONST_DATA gUnknown_08599D34[];
extern u8 CONST_DATA gUnknown_08599B34[];
extern u8 CONST_DATA gUnknown_08599734[];
extern u8 CONST_DATA gUnknown_08599934[];

// generic minimug palettes
extern u16 CONST_DATA gUnknown_08599F34[];
extern u16 CONST_DATA gUnknown_08599F54[];
extern u16 CONST_DATA gUnknown_08599F74[];

// funcs
void Face_OnInit(struct FaceProc*);
void Face_OnIdle(struct FaceProc*);
void FaceChibiSpr_OnIdle(struct FaceProc*);
void sub_8005D64(struct FaceBlinkProc*);
void sub_8005D70(struct FaceBlinkProc*);
void sub_8005D98(struct FaceBlinkProc*);
void EndFacePtr(struct DeleteFaceProc*);
void sub_8005FD4(struct FaceBlinkProc*);
void sub_8005FE0(struct FaceBlinkProc*);
void sub_800623C(struct FaceBlinkProc*);
void sub_8006280(struct FaceBlinkProc*);
void sub_80062B8(struct FaceBlinkProc*);
void sub_8006324(struct FaceBlinkProc*);
void sub_800632C(struct FaceBlinkProc*);
void sub_8006370(struct FaceBlinkProc*);
void sub_8006378(struct FaceBlinkProc*);
void sub_80063BC(struct FaceBlinkProc*);
void sub_80063C4(struct FaceBlinkProc*);
void sub_800662C(struct UnkFaceProc*);
void sub_8006650(struct UnkFaceProc*);
void sub_80066A8(struct UnkFaceProc*);

struct FaceVramEntry CONST_DATA sDefaultFaceConfig[FACE_SLOT_COUNT] =
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
u16 CONST_DATA gSprite_Face64x96[] =
{
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
};

// face without shoulders (64x96), flipped
u16 CONST_DATA gSprite_Face64x96_Flipped[] =
{
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
};

// full face (96x96)
u16 CONST_DATA gSprite_Face96x96[] =
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
u16 CONST_DATA gSprite_Face96x96_Flipped[] =
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
u16 CONST_DATA gSprite_Face80x72[] =
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
u16 CONST_DATA gSprite_Face80x72_Flipped[] =
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
u16 CONST_DATA gSprite_Face96x72[] =
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
u16 CONST_DATA gSprite_Face96x72_Flipped[] =
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

    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_SLEEP(0),

    PROC_CALL(Face_OnInit),

    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),

    PROC_END,
};

// other face proc. This one waits an extra frame before displaying anything
struct ProcCmd CONST_DATA gProcScr_E_FACE_ExtraFrame[] =
{
    PROC_NAME("E_FACE"),

    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_SLEEP(1),

    PROC_CALL(Face_OnInit),

    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),

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

struct ProcCmd CONST_DATA gProcScr_FaceChibiSpr[] =
{
    PROC_REPEAT(FaceChibiSpr_OnIdle),
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

struct ProcCmd CONST_DATA gProcScr_08591204[] =
{
    PROC_CALL(sub_8005D64),

PROC_LABEL(0),
    PROC_REPEAT(sub_8005D70),
    PROC_REPEAT(sub_8005D98),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_FaceEndIn8Frames[] =
{
    PROC_SLEEP(8),
    PROC_CALL(EndFacePtr),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_0859124C[] =
{
    PROC_CALL(sub_8005FD4),
    PROC_REPEAT(sub_8005FE0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_FaceBlink[] =
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

struct ProcCmd CONST_DATA gProcScr_08591304[] =
{
    PROC_SLEEP(0),
    PROC_CALL(sub_800662C),

    PROC_SLEEP(2),
    PROC_CALL(sub_8006650),

    PROC_SLEEP(0),
    PROC_CALL(sub_80066A8),

    PROC_END,
};

extern const struct FaceData portrait_data[];

extern struct FaceVramEntry sFaceConfig[];
extern struct FaceProc* gFaces[];

extern u8 gUnknown_085A0838[]; // tsa
extern u8 gUnknown_085A08F0[]; // tsa

// forward decl.
void SetupFaceGfxData(struct FaceVramEntry*);
int GetFaceDisplayBits(struct FaceProc*);
int SetFaceDisplayBits(struct FaceProc*, int);
void FaceRefreshSprite(struct FaceProc*);
u8* sub_8005F6C(int);
void sub_8005F9C(int, int);
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc*);


//! FE8U = 0x08005514
const struct FaceData* GetPortraitData(int fid) {
    return portrait_data + fid - 1;
}

//! FE8U = 0x08005528
void ResetFaces(void) {
    int i;

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        EndFaceById(i);
    }

    SetupFaceGfxData(0);

    return;
}

//! FE8U = 0x08005544
void SetupFaceGfxData(struct FaceVramEntry* config) {
    int i;

    if (config == 0) {
        config = sDefaultFaceConfig;
    }

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        sFaceConfig[i].tileOffset = config[i].tileOffset;
        sFaceConfig[i].paletteId = config[i].paletteId;
    }

    return;
}

//! FE8U = 0x08005570
int FindFreeFaceSlot(void) {
    int i;

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        if (gFaces[i] == 0) {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x08005594
void Face_OnInit(struct FaceProc* proc) {

    CopyDataWithPossibleUncomp(proc->pFaceInfo->img, (void *)(sFaceConfig[proc->faceSlot].tileOffset + 0x06010000));

    return;
}

//! FE8U = 0x080055BC
void Face_OnIdle(struct FaceProc* proc) {
    int oam0;

    if (GetFaceDisplayBits(proc) & 0x4000) {
        return;
    }

    if (GetFaceDisplayBits(proc) & 0x400) {
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
struct FaceProc* StartFaceAuto(int fid, int x, int y, int disp) {

    int slot = FindFreeFaceSlot();

    if (slot < 0) {
        return NULL;
    }

    return StartFace(slot, fid, x, y, disp);
}

//! FE8U = 0x0800563C
struct FaceProc* StartFace(int slot, int fid, int x, int y, int disp) {
    struct FaceProc* proc;
    const struct FaceData* info;

    if (gFaces[slot] != NULL) {
        return 0;
    }

    proc = Proc_Start(gProcScr_E_FACE, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetPortraitData(fid);

    if (disp & 0x2000) {
        CpuFastFill(0, (gPaletteBuffer + 0x10 * 0x10) + sFaceConfig[slot].paletteId * 0x10, 0x20);
        EnablePaletteSync();
    } else {
        CopyToPaletteBuffer(info->pal, (sFaceConfig[slot].paletteId + 0x10) * 0x20, 0x20);
    }

    proc->pFaceInfo = info;

    proc->faceSlot = slot;
    proc->faceId = fid;

    proc->spriteLayer = 5;

    proc->xPos = x;
    proc->yPos = y;

    if (disp & 0x1000) {
        proc->unk_44 = 0;
        proc->pBlinkProc = 0;
    } else {
        proc->unk_44 = Proc_Start(gProcScr_0859124C, proc);
        proc->pBlinkProc = Proc_Start(gProcScr_FaceBlink, proc);
    }

    proc->displayBits = ~disp;

    SetFaceDisplayBits(proc, disp);

    return proc;
}

//! FE8U = 0x08005738
void EndFace(struct FaceProc* proc) {
    gFaces[proc->faceSlot] = NULL;
    Proc_End(proc);

    return;
}

//! FE8U = 0x08005758
void EndFaceById(int slot) {
    EndFace(gFaces[slot]);

    return;
}

//! FE8U = 0x08005770
int SetFaceDisplayBits(struct FaceProc* proc, int disp) {

    if (proc == 0) {
        return 0;
    }

    proc->displayBits = disp;

    FaceRefreshSprite(proc);

    return proc->displayBits;
}

//! FE8U = 0x0800578C
int SetFaceDisplayBitsById(int slot, int disp) {
    return SetFaceDisplayBits(gFaces[slot], disp);
}

//! FE8U = 0x080057A4
int GetFaceDisplayBits(struct FaceProc* proc) {
    return proc->displayBits;
}

//! FE8U = 0x080057A8
int GetFaceDisplayBitsById(int slot) {
    return GetFaceDisplayBits(gFaces[slot]);
}

//! FE8U = 0x080057C0
void FaceRefreshSprite(struct FaceProc* proc) {
    int oam2Layer;

    switch (proc->displayBits & 0x807) {
        case 0:
            proc->sprite = gSprite_Face64x96;
            break;

        case 1:
            proc->sprite = gSprite_Face64x96_Flipped;
            break;

        case 2:
            proc->sprite = gSprite_Face96x96;
            break;

        case 3:
            proc->sprite = gSprite_Face96x96_Flipped;
            break;

        case 4:
            proc->sprite = gSprite_Face80x72;
            break;

        case 5:
            proc->sprite = gSprite_Face80x72_Flipped;
            break;

        case 0x800:
            proc->sprite = gSprite_Face96x72;
            break;

        case 0x801:
            proc->sprite = gSprite_Face96x72_Flipped;
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

    proc->oam2 = (sFaceConfig[proc->faceSlot].tileOffset >> 5) + ((sFaceConfig[proc->faceSlot].paletteId & 0xF) * 0x1000) + oam2Layer;

    return;
}

//! FE8U = 0x08005894
void PutFaceTm(u16* tm, u8* data, int tileref, s8 isFlipped) {
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
void UnpackFaceChibiGraphics(int fid, int chr, int pal) {
    if (fid >= FID_FACTION_CHIBI) {
        RegisterTileGraphics(sub_8005F6C(fid), (void *)(((chr * 0x20 + VRAM) & 0x1FFFF) + VRAM), 0x200);
        sub_8005F9C(fid, pal);
    } else {
        const struct FaceData* info = GetPortraitData(fid);

        CopyDataWithPossibleUncomp(info->imgChibi, (void *)(chr * 0x20 + VRAM));
        CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);
    }
    return;
}

//! FE8U = 0x08005988
void PutFaceChibi(int fid, u16* tm, int chr, int pal, s8 isFlipped) {
    UnpackFaceChibiGraphics(fid, chr, pal);

    chr &= 0x3FF;
    PutFaceTm(tm, gUnknown_085911C4, TILEREF(chr, pal), isFlipped);

    return;
}

//! FE8U = 0x080059CC
void UnpackFaceChibiSprGraphics(int fid, int chr, int pal) {
    u8 buffer[0x200];

    chr += 0x800;

    if (fid >= FID_FACTION_CHIBI) {
        RegisterTileGraphics(sub_8005F6C(fid) + 0x00, (void *)(((chr + 0x00) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x80, (void *)(((chr + 0x20) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x100, (void *)(((chr + 0x04) * 0x20 & 0x1FFFF) + VRAM), 0x80);
        RegisterTileGraphics(sub_8005F6C(fid) + 0x180, (void *)(((chr + 0x24) * 0x20 & 0x1FFFF) + VRAM), 0x80);

        sub_8005F9C(fid, pal + 0x10);
    } else {
        const struct FaceData* info = GetPortraitData(fid);

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
void FaceChibiSpr_OnIdle(struct FaceProc* proc) {
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
void StartFaceChibiSpr(int x, int y, int fid, int chr, int pal, s8 isFlipped, ProcPtr parent) {
    struct FaceProc* proc;

    UnpackFaceChibiSprGraphics(fid, chr, pal);

    proc = Proc_Start(gProcScr_FaceChibiSpr, parent);

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
void EndFaceChibiSpr(void) {
    Proc_EndEach(gProcScr_FaceChibiSpr);

    return;
}

//! FE8U = 0x08005B78
void PutFace80x72_Standard(u16* tm, int tileref, const struct FaceData* info) {
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
void PutFace80x72_Raised(u16* tm, int tileref, const struct FaceData* info) {
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
s8 ShouldFaceBeRaised(int fid) {

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
void PutFace80x72_Core(u16* tm, int fid, int chr, int pal) {
    const struct FaceData* info;

    if (fid == 0) {
        return;
    }

    info = GetPortraitData(fid);

    CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);

    if (info->img != 0) {
        int i;

        CopyDataWithPossibleUncomp(info->img, (void *)(chr * 0x20 + VRAM));
        CopyToPaletteBuffer(info->pal, pal * 0x20, 0x20);

        if (ShouldFaceBeRaised(fid) != 0) {
            PutFace80x72_Raised(tm, (pal << 12) + (0x3FF & chr), info);
        } else {
            PutFace80x72_Standard(tm, (pal << 12) + (0x3FF & chr), info);
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

//! FE8U = 0x08005D64
void sub_8005D64(struct FaceBlinkProc* proc) {
    proc->pFaceProc = NULL;
    proc->unk_38 = 0x78;
    proc->unk_32 = 0;

    return;
}

//! FE8U = 0x08005D70
void sub_8005D70(struct FaceBlinkProc* proc) {

    proc->unk_38--;

    if (proc->unk_38 >= 0) {
        return;
    }

    proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
    proc->unk_34 = 0;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08005D98
void sub_8005D98(struct FaceBlinkProc* proc) {
    const struct FaceData* info;
    u16* ptrA;
    u16* ptrB;
    int offset;

    int tileref = (proc->palId << 12) + (0x3FF & proc->tileId);

    info = GetPortraitData(proc->faceId);

    offset = 0;

    switch (proc->unk_34) {
        case 3:
            offset = 88;
            break;

        case 0:
        case 6:
            offset = 24;
            break;

        case 9:

            PutFace80x72_Standard(proc->unk_3c, (proc->palId << 12) + (0x3FF & proc->tileId), info);

            BG_EnableSync(GetBackgroundFromBufferPointer(proc->unk_3c));

            Proc_Break(proc);

            return;

        case 1:
        case 2:
        case 4:
        case 5:
        case 7:
        case 8:
            proc->unk_34++;
            return;
    }

    info = GetPortraitData(proc->faceId);

    ptrA = ((info->yEyes << 5) + proc->unk_3c) + info->xEyes;

    ptrB = ptrA - 1;

    *(ptrB + 0x00 + 0) = tileref + offset + 0x00 + 0;
    *(ptrB + 0x00 + 1) = tileref + offset + 0x00 + 1;
    *(ptrB + 0x00 + 2) = tileref + offset + 0x00 + 2;
    *(ptrB + 0x00 + 3) = tileref + offset + 0x00 + 3;

    *(ptrA + 0x20 - 1) = tileref + offset + 0x20 + 0;
    *(ptrA + 0x20 + 0) = tileref + offset + 0x20 + 1;
    *(ptrA + 0x20 + 1) = tileref + offset + 0x20 + 2;
    *(ptrA + 0x20 + 2) = tileref + offset + 0x20 + 3;

    BG_EnableSync(GetBackgroundFromBufferPointer(ptrB));

    proc->unk_34++;

    return;
}

//! FE8U = 0x08005E98
void PutFace80x72(struct Proc* proc, u16* bgOut, int fid, int tileId, int palId) {

    Proc_EndEach(gProcScr_08591204);

    PutFace80x72_Core(bgOut, fid, tileId, palId);

    GetPortraitData(fid);

    return;
}

//! FE8U = 0x08005ECC
void EndFacePtr(struct DeleteFaceProc* proc) {
    EndFace(proc->target);
    return;
}

//! FE8U = 0x08005ED8
void EndFaceIn8Frames(struct FaceProc* target) {
    struct DeleteFaceProc* proc = Proc_Start(gProcScr_FaceEndIn8Frames, PROC_TREE_3);

    proc->target = target;

    return;
}

//! FE8U = 0x08005EF0
void StartFaceFadeIn(struct FaceProc* proc) {
    const struct FaceData* info = GetPortraitData(proc->faceId);

    sub_8013A84(sFaceConfig[proc->faceSlot].paletteId + 0x10);
    sub_8013928(info->pal, sFaceConfig[proc->faceSlot].paletteId + 0x10, 12, proc);

    return;
}

//! FE8U = 0x08005F38
void StartFaceFadeOut(struct FaceProc* proc) {

    // unused
    const struct FaceData* info = GetPortraitData(proc->faceId);

    sub_80138F0(sFaceConfig[proc->faceSlot].paletteId + 0x10, 12, proc);

    EndFaceIn8Frames(proc);

    return;
}

//! FE8U = 0x08005F6C
u8* sub_8005F6C(int fid) {

    // generic minimug image lut
    u8* gUnknown_080D77BC[] = {
        gUnknown_08599D34,
        gUnknown_08599B34,
        gUnknown_08599734,
        gUnknown_08599734,
        gUnknown_08599D34,
        gUnknown_08599934,
        gUnknown_08599934,
        gUnknown_08599D34,
    };

    fid = fid - FID_FACTION_CHIBI;

    return gUnknown_080D77BC[fid];
}

//! FE8U = 0x08005F9C
void sub_8005F9C(int fid, int pal) {

    // generic minimug palette lut
    u16* gUnknown_080D77DC[] = {
        gUnknown_08599F34,
        gUnknown_08599F54,
        gUnknown_08599F74,
        gUnknown_08599F54,
        gUnknown_08599F54,
        gUnknown_08599F74,
        gUnknown_08599F54,
        gUnknown_08599F34,
    };

    fid = fid - FID_FACTION_CHIBI;

    CopyToPaletteBuffer(gUnknown_080D77DC[fid], pal * 0x20, 0x20);

    return;
}

//! FE8U = 0x08005FD4
void sub_8005FD4(struct FaceBlinkProc* proc) {
    proc->pFaceProc = (struct FaceProc*)(proc->proc_parent);
    proc->unk_32 = 0;

    return;
}

//! FE8U = 0x08005FE0
void sub_8005FE0(struct FaceBlinkProc* proc) {

    int oam1;
    int oam0;

    if (!(GetFaceDisplayBits(proc->pFaceProc) & 0x30)) {

        int offsetA = (GetFaceDisplayBits(proc->pFaceProc) & 8) ? 0 : 24;
        offsetA += 16;

        RegisterObjectTileGraphics(
            proc->pFaceProc->pFaceInfo->imgMouth + offsetA * 0x20,
            (void*)(((proc->pFaceProc->oam2 + 28) & 0x3FF) * 0x20 + 0x06010000),
            4,
            2
        );

    } else {
        proc->unk_32--;

        if (proc->unk_32 < 0) {
            int offsetB = (GetFaceDisplayBits(proc->pFaceProc) & 8) ? 0 : 24;

            proc->unk_32 = ((AdvanceGetLCGRNValue() >> 16) & 7) + 1;
            proc->blinkControl = (proc->blinkControl + 1) & 3;

            switch (proc->blinkControl) {
                case 1:
                case 3:
                    offsetB += 8;
                    break;

                case 2:
                    offsetB += 16;
                    break;

                case 0:
                default:
                    offsetB += 0;
                    break;
            }

            RegisterObjectTileGraphics(
                proc->pFaceProc->pFaceInfo->imgMouth + offsetB * 0x20,
                (void*)(((proc->pFaceProc->oam2 + 28) & 0x3FF) * 0x20 + 0x06010000),
                4,
                2
            );

        }
    }

    oam1 = 4 - proc->pFaceProc->pFaceInfo->xMouth;

    oam1 = (GetFaceDisplayBits(proc->pFaceProc) & 1) ? oam1 : -oam1;

    oam1 = ((oam1 * 8 + proc->pFaceProc->xPos) - 16) & 0x1FF;

    if (GetFaceDisplayBits(proc->pFaceProc) & 1) {
        oam1 = oam1 + 0x1000;
    }

    if (GetFaceDisplayBits(proc->pFaceProc) & 0x400) {
        oam0 = 0x400;
    } else {
        oam0 = 0;
    }

    oam0 += (proc->pFaceProc->yPos + (proc->pFaceProc->pFaceInfo->yMouth * 8)) & 0xFF;

    PutSpriteExt(
        proc->pFaceProc->spriteLayer,
        oam1,
        oam0,
        gObject_32x16,
        proc->pFaceProc->oam2 + 28
    );

    return;
}

//! FE8U = 0x08006134
void sub_8006134(struct FaceBlinkProc* proc, int unk) {
    int oam1;
    int oam0;

    s8 flag = 0;

    switch (unk) {
        case 0:
            unk = 88;
            break;

        case 1:
            unk = 24;
            break;

        case 0x80:
            unk = 88;
            flag = 1;
            break;

        case 0x81:
            unk = 24;
            flag = 1;
            break;

        default:
            return;
    }

    oam1 = 4 - proc->pFaceProc->pFaceInfo->xEyes;

    oam1 = (GetFaceDisplayBits(proc->pFaceProc) & 1) ? oam1 : -oam1;

    oam1 = ((oam1 * 8 + proc->pFaceProc->xPos) - 16) & 0x1FF;

    if (GetFaceDisplayBits(proc->pFaceProc) & 1) {
        oam1 = oam1 + 0x1000;
    }

    if (GetFaceDisplayBits(proc->pFaceProc) & 0x400) {
        oam0 = 0x400;
    } else {
        oam0 = 0;
    }

    oam0 += (proc->pFaceProc->yPos + (proc->pFaceProc->pFaceInfo->yEyes * 8)) & 0xff;

    if (flag) {
        if (!(GetFaceDisplayBits(proc->pFaceProc) & 1)) {
            oam1 = oam1 + 16;
        }

        PutSpriteExt(
            proc->pFaceProc->spriteLayer,
            oam1,
            oam0,
            gObject_16x16,
            proc->pFaceProc->oam2 + unk + 2
        );
    }
    else {
        PutSpriteExt(
            proc->pFaceProc->spriteLayer,
            oam1,
            oam0,
            gObject_32x16,
            proc->pFaceProc->oam2 + unk
        );
    }

    return;
}

//! FE8U = 0x0800623C
void sub_800623C(struct FaceBlinkProc* proc) {

    proc->pFaceProc = (struct FaceProc*)(proc->proc_parent);
    proc->blinkControl = ((struct FaceProc*)(proc->proc_parent))->pFaceInfo->blinkKind;
    proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
    proc->unk_32 = 0;

    if (proc->blinkControl == 6) {
        proc->blinkControl = 5;
        proc->unk_38 = 0x7FFFFFFF;
        proc->unk_32 = 2;
        proc->unk_34 = 6;

        Proc_Goto(proc, 97);
    }

    return;
}

//! FE8U = 0x08006280
void sub_8006280(struct FaceBlinkProc* proc) {
    int unk;

    proc->unk_38--;

    unk = proc->unk_32;

    if (unk != 0) {
        Proc_Goto(proc, (s16)unk);
        return;
    }

    if (proc->unk_38 < 0) {
        proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
        proc->unk_34 = unk;

        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080062B8
void sub_80062B8(struct FaceBlinkProc* proc) {
    int r5 = 2;

    switch (proc->unk_34) {
        case 3:
        case 4:
        case 5:
            r5 = 0;
            break;

        case 0:
        case 1:
        case 2:
        case 6:
        case 7:
        case 8:
            r5 = 1;
            break;

        case 10:
            Proc_Goto(proc, 0);
            break;

    }

    sub_8006134(proc, r5);

    proc->unk_34++;

    return;
}

//! FE8U = 0x08006324
void sub_8006324(struct FaceBlinkProc* proc) {
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x0800632C
void sub_800632C(struct FaceBlinkProc* proc) {

    if (proc->unk_34 < 6) {
        sub_80062B8(proc);
        return;
    }

    sub_8006134(proc, 0);

    if (proc->unk_32 == 0) {
        Proc_Goto(proc, 1);
    }

    if (proc->unk_32 == 3) {
        Proc_Goto(proc, 3);
    }

    return;
}

//! FE8U = 0x08006370
void sub_8006370(struct FaceBlinkProc* proc) {
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x08006378
void sub_8006378(struct FaceBlinkProc* proc) {

    if (proc->unk_34 < 3) {
        sub_80062B8(proc);
        return;
    }

    sub_8006134(proc, 1);

    if (proc->unk_32 == 0) {
        Proc_Goto(proc, 1);
    }

    if (proc->unk_32 == 2) {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x080063BC
void sub_80063BC(struct FaceBlinkProc* proc) {
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x080063C4
void sub_80063C4(struct FaceBlinkProc* proc) {
    int r5 = 2;

    switch (proc->unk_34) {
        case 3:
        case 4:
        case 5:
            r5 = 0;
            break;

        case 0:
        case 1:
        case 2:
        case 6:
        case 7:
        case 8:
            r5 = 1;
            break;

        case 10:
            Proc_Goto(proc, 0);
            proc->unk_32 = 0;
    }

    sub_8006134(proc, 0x80 + r5);

    proc->unk_34++;

    return;
}

//! FE8U = 0x08006438
void SetFaceBlinkControl(struct FaceProc* proc, int blinkControl) {
    struct FaceBlinkProc* blinkProc;

    if (blinkControl == 0) {
        blinkControl = proc->pFaceInfo->blinkKind;
    }

    blinkProc = proc->pBlinkProc;
    blinkProc->blinkControl = blinkControl;

    blinkProc->unk_38 = FaceBlinkProc_GenBlinkInterval(blinkProc);

    return;
}

//! FE8U = 0x08006458
void SetFaceBlinkControlById(int slot, int blinkControl) {
    SetFaceBlinkControl(gFaces[slot], blinkControl);
    return;
}

#if NONMATCHING

//! FE8U = 0x08006470
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc) {
    int var = AdvanceGetLCGRNValue() >> 0x10;

    switch (proc->blinkControl) {

        default:
        case 3:
            // _080064AC
            return (var >> 7) + (0x96 << 1);

        case 1:
            // _080064B6
            return (var >> 7) + 0x1E;

        case 2:
            // _080064BC
            return (var >> 9) + 0x1E;

        case 4:
            // _080064C2
            return 1;

        case 5:
            // _080064C6
            return 0x7FFFFFFF;
    }
}

#else // if !NONMATCHING

//! FE8U = 0x08006470
__attribute__((naked))
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        adds r4, r0, #0\n\
        bl AdvanceGetLCGRNValue\n\
        adds r1, r0, #0\n\
        lsrs r2, r1, #0x10\n\
        ldrh r1, [r4, #0x30]\n\
        subs r1, #1\n\
        lsls r1, r1, #0x10\n\
        asrs r1, r1, #0x10\n\
        cmp r1, #4\n\
        bhi _080064C8\n\
        lsls r0, r1, #2\n\
        ldr r1, _08006494  @ _08006498\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _08006494: .4byte _08006498\n\
    _08006498: @ jump table\n\
        .4byte _080064B6 @ case 0\n\
        .4byte _080064BC @ case 1\n\
        .4byte _080064AC @ case 2\n\
        .4byte _080064C2 @ case 3\n\
        .4byte _080064C6 @ case 4\n\
    _080064AC:\n\
        asrs r0, r2, #7\n\
        movs r1, #0x96\n\
        lsls r1, r1, #1\n\
        adds r0, r0, r1\n\
        b _080064C8\n\
    _080064B6:\n\
        asrs r0, r2, #7\n\
        adds r0, #0x1e\n\
        b _080064C8\n\
    _080064BC:\n\
        asrs r0, r2, #9\n\
        adds r0, #0x1e\n\
        b _080064C8\n\
    _080064C2:\n\
        movs r0, #1\n\
        b _080064C8\n\
    _080064C6:\n\
        ldr r0, _080064D0  @ 0x7FFFFFFF\n\
    _080064C8:\n\
        pop {r4}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080064D0: .4byte 0x7FFFFFFF\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080064D4
void sub_80064D4(struct FaceProc* proc, int unk) {
    proc->pBlinkProc->unk_32 = unk;
    return;
}

//! FE8U = 0x080064DC
void sub_80064DC(int slot, int unk) {
    sub_80064D4(gFaces[slot], unk);
    return;
}

//! FE8U = 0x080064F4
struct FaceProc* StartFace2(int slot, int fid, int x, int y, int disp) {
    struct FaceProc* proc;
    const struct FaceData* info;
    s16 oam2Layer;

    if (gFaces[slot] != 0) {
        return 0;
    }

    proc = Proc_Start(gProcScr_E_FACE_ExtraFrame, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetPortraitData(fid);

    if (disp & 0x2000) {
        CpuFastFill(0, (gPaletteBuffer + 0x10 * 0x10) + sFaceConfig[slot].paletteId * 0x10, 0x20);
        EnablePaletteSync();
    } else {
        CopyToPaletteBuffer(info->pal, ((sFaceConfig[slot].paletteId) + 0x10) * 0x20, 0x20);
    }

    proc->pFaceInfo = info;

    proc->faceSlot = slot;
    proc->faceId = fid;

    proc->spriteLayer = 5;

    proc->xPos = x;
    proc->yPos = y;

    proc->unk_44 = 0;
    proc->pBlinkProc = 0;

    proc->displayBits = disp;

    FaceRefreshSprite(proc);

    switch (disp & 0x3C0) {
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

    proc->oam2 = (sFaceConfig[slot].tileOffset >> 5) + ((sFaceConfig[slot].paletteId & 0xF) * 0x1000) + oam2Layer;

    return proc;
}

//! FE8U = 0x08006618
void sub_8006618(int slot, int x, int y) {

    gFaces[slot]->xPos = x;
    gFaces[slot]->yPos = y;

    return;
}

//! FE8U = 0x0800662C
void sub_800662C(struct UnkFaceProc* proc) {

    if (proc->pFaceProc->pBlinkProc != 0) {
        sub_8097D54(proc->pFaceProc->pBlinkProc);
    }

    if (proc->pFaceProc->unk_44 != 0) {
        sub_8097D54(proc->pFaceProc->unk_44);
    }

    return;
}

//! FE8U = 0x08006650
void sub_8006650(struct UnkFaceProc* proc) {
    struct FaceProc* faceProc;

    proc->pFaceInfo = GetPortraitData(proc->faceId);

    CopyDataWithPossibleUncomp(proc->pFaceInfo->img, (void*)(sFaceConfig[proc->pFaceProc->faceSlot].tileOffset + 0x06010000));

    CopyToPaletteBuffer(proc->pFaceInfo->pal, (sFaceConfig[proc->pFaceProc->faceSlot].paletteId + 0x10) * 0x20, 0x20);

    faceProc = proc->pFaceProc;
    faceProc->pFaceInfo = proc->pFaceInfo;
    faceProc->faceId = proc->faceId;

    return;
}

//! FE8U = 0x080066A8
void sub_80066A8(struct UnkFaceProc* proc) {
    if (proc->pFaceProc->pBlinkProc != 0) {
        proc->pFaceProc->pBlinkProc->blinkControl = proc->pFaceInfo->blinkKind;

        Proc_Goto(proc->pFaceProc->pBlinkProc, 0);

        sub_8097D68(proc->pFaceProc->pBlinkProc);
    }

    if (proc->pFaceProc->unk_44 != 0) {
        sub_8097D68(proc->pFaceProc->unk_44);
    }

    return;
}

//! FE8U = 0x080066E0
void sub_80066E0(struct FaceProc* parent, int fid) {
    struct UnkFaceProc* proc = Proc_Start(gProcScr_08591304, parent);

    proc->pFaceProc = parent;
    proc->faceId = fid;

    return;
}

//! FE8U = 0x080066FC
void sub_80066FC(int offset, int fid) {
    CopyDataWithPossibleUncomp(GetPortraitData(fid)->img, (void*)(offset * 0x20 + VRAM));
    return;
}

//! FE8U = 0x0800671C
void sub_800671C(int pal, int fid) {
    CopyToPaletteBuffer(GetPortraitData(fid)->pal, pal * 0x20, 0x20);
    return;
}


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
