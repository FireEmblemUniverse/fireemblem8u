#ifndef GUARD_FACE_H
#define GUARD_FACE_H

enum { FACE_SLOT_COUNT = 4 };

enum
{
    FACE_64x80,
    FACE_64x80_FLIPPED,
    FACE_96x80,
    FACE_96x80_FLIPPED,
    FACE_64x72,
    FACE_64x72_FLIPPED,
};

enum
{
    FACE_HLAYER_DEFAULT,

    // why shifts?
    FACE_HLAYER_0 = 1 << 0,
    FACE_HLAYER_1 = 1 << 1,
    FACE_HLAYER_2 = 1 << 2,
    FACE_HLAYER_3 = 1 << 3,
};

#define FACE_DISP_FLIPPED (1 << 0)
#define FACE_DISP_KIND(kind) ((kind) & 7)
#define FACE_DISP_KIND_MASK FACE_DISP_KIND(-1)
#define FACE_DISP_SMILE (1 << 3)
#define FACE_DISP_TALK_1 (1 << 4)
#define FACE_DISP_TALK_2 (1 << 5)
#define FACE_DISP_HLAYER(layer) (((layer) & 0xF) << 6)
#define FACE_DISP_HLAYER_MASK FACE_DISP_HLAYER(-1)
#define FACE_DISP_BLEND (1 << 10)
#define FACE_DISP_BIT_12 (1 << 12)
#define FACE_DISP_BIT_13 (1 << 13)
#define FACE_DISP_BIT_14 (1 << 14)

struct FaceBlinkProc;

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
    /* 48 */ struct FaceBlinkProc* pBlinkProc;
};


const struct FaceData* GetPortraitData(int fid);
void ResetFaces(void);
void SetupFaceGfxData(struct FaceVramEntry*);
// ??? FindFreeFaceSlot(???);
// ??? Face_OnInit(???);
// ??? Face_OnIdle(???);
struct FaceProc* StartFaceAuto(int fid, int x, int y, int disp);
struct FaceProc* StartFace(int faceSlot, int portraitId, int x, int y, int displayType);
// ??? EndFace(???);
void EndFaceById(int faceSlot);
int SetFaceDisplayBits(struct FaceProc*, int);
int SetFaceDisplayBitsById(int slot, int disp);
int GetFaceDisplayBits(struct FaceProc*);
int GetFaceDisplayBitsById(int slot);
// ??? FaceRefreshSprite(???);
// ??? PutFaceTm(???);
// ??? UnpackFaceChibiGraphics(???);
void PutFaceChibi(int, u16*, int, int, s8);
// ??? UnpackFaceChibiSprGraphics(???);
// ??? FaceChibiSpr_OnIdle(???);
// ??? StartFaceChibiSpr(???);
// ??? EndFaceChibiSpr(???);
// ??? PutFace80x72_Standard(???);
// ??? PutFace80x72_Raised(???);
// ??? ShouldFaceBeRaised(???);
void PutFace80x72_Core(u16*, int, int, int);
// ??? sub_8005D64(???);
// ??? sub_8005D70(???);
// ??? sub_8005D98(???);
void PutFace80x72(struct Proc* proc, u16* bgOut, int fid, int tileId, int palId);
// ??? EndFacePtr(???);
// ??? EndFaceIn8Frames(???);
void StartFaceFadeIn(struct FaceProc* proc);
void StartFaceFadeOut(struct FaceProc* proc);
// ??? sub_8005F6C(???);
// ??? sub_8005F9C(???);
// ??? sub_8005FD4(???);
// ??? sub_8005FE0(???);
// ??? sub_8006134(???);
// ??? sub_800623C(???);
// ??? sub_8006280(???);
// ??? sub_80062B8(???);
// ??? sub_8006324(???);
// ??? sub_800632C(???);
// ??? sub_8006370(???);
// ??? sub_8006378(???);
// ??? sub_80063BC(???);
// ??? sub_80063C4(???);
void SetFaceBlinkControl(struct FaceProc* proc, int blinkControl);
void SetFaceBlinkControlById(int faceSlot, int unk);
// ??? FaceBlinkProc_GenBlinkInterval(???);
void sub_80064D4(struct FaceProc* proc, int unk);
// ??? sub_80064DC(???);
struct FaceProc* StartFace2(int slot, int fid, int x, int y, int disp);
void sub_8006618(int slot, int x, int y);
// ??? sub_800662C(???);
// ??? sub_8006650(???);
// ??? sub_80066A8(???);
void sub_80066E0(struct FaceProc* parent, int fid);
void sub_80066FC(int offset, int fid);
void sub_800671C(int pal, int fid);
void sub_8006738(u16* a, u16 b, s8 c);

extern struct FaceProc* gFaces[];
extern struct ProcCmd gProcScr_E_FACE[];

#endif  // GUARD_FACE_H
