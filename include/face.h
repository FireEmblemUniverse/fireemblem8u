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
#define FACE_DISP_HIDDEN (1 << 14)

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


const struct FaceData* GetPortraitData(int fid);
void ResetFaces(void);
void SetupFaceGfxData(struct FaceVramEntry*);
int FindFreeFaceSlot(void);
void Face_OnInit(struct FaceProc* proc);
void Face_OnIdle(struct FaceProc* proc);
struct FaceProc* StartFaceAuto(int fid, int x, int y, int disp);
struct FaceProc* StartFace(int faceSlot, int portraitId, int x, int y, int displayType);
void EndFace(struct FaceProc* proc);
void EndFaceById(int faceSlot);
int SetFaceDisplayBits(struct FaceProc*, int);
int SetFaceDisplayBitsById(int slot, int disp);
int GetFaceDisplayBits(struct FaceProc*);
int GetFaceDisplayBitsById(int slot);
void FaceRefreshSprite(struct FaceProc* proc);
void PutFaceTm(u16 * tm, u8* data, int tileref, s8 isFlipped);
void UnpackFaceChibiGraphics(int fid, int chr, int pal);
void PutFaceChibi(int, u16*, int, int, s8);
void UnpackFaceChibiSprGraphics(int fid, int chr, int pal);
void FaceChibiSpr_OnIdle(struct FaceProc* proc);
void StartFaceChibiSpr(int x, int y, int fid, int chr, int pal, s8 isFlipped, ProcPtr parent);
void EndFaceChibiSpr(void);
void PutFace80x72_Standard(u16 * tm, int tileref, const struct FaceData* info);
void PutFace80x72_Raised(u16 * tm, int tileref, const struct FaceData* info);
s8 ShouldFaceBeRaised(int fid);
void PutFace80x72_Core(u16*, int, int, int);
void FaceBgBlink_Init(struct FaceBlinkProc*);
void FaceBgBlink_WaitLoop(struct FaceBlinkProc*);
void FaceBgBlink_AnimLoop(struct FaceBlinkProc*);
void PutFace80x72(ProcPtr proc, u16 * bgOut, int fid, int tileId, int palId);
void EndFacePtr(struct DeleteFaceProc* proc);
void EndFaceIn8Frames(struct FaceProc* target) ;
void StartFaceFadeIn(struct FaceProc* proc);
void StartFaceFadeOut(struct FaceProc* proc);
u8* GetGenericChibiImg(int);
void ApplyGenericChibiPal(int, int);
void FaceMouth_Init(struct FaceBlinkProc*);
void FaceMouth_Loop(struct FaceBlinkProc*);
void FaceBlink_Init(struct FaceBlinkProc*);
void FaceBlink_WaitLoop(struct FaceBlinkProc*);
void FaceBlink_AnimLoop(struct FaceBlinkProc*);
void FaceBlink_CloseEyesInit(struct FaceBlinkProc*);
void FaceBlink_CloseEyesLoop(struct FaceBlinkProc*);
void FaceBlink_HalfCloseInit(struct FaceBlinkProc*);
void FaceBlink_HalfCloseLoop(struct FaceBlinkProc*);
void FaceBlink_WinkInit(struct FaceBlinkProc*);
void FaceBlink_WinkLoop(struct FaceBlinkProc*);
void SetFaceBlinkControl(struct FaceProc* proc, int blinkControl);
void SetFaceBlinkControlById(int faceSlot, int unk);
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc);
void SetFaceEyeControl(struct FaceProc* proc, int unk);
void SetFaceEyeControlById(int slot, int unk);
struct FaceProc* StartFace2(int slot, int fid, int x, int y, int disp);
void SetFacePosition(int slot, int x, int y);
void FaceChange_LockChildProcs(struct UnkFaceProc* proc);
void FaceChange_LoadGfx(struct UnkFaceProc* proc);
void FaceChange_Finish(struct UnkFaceProc* proc);
void StartFaceChange(struct FaceProc* parent, int fid);
void DecompressFaceImg(int offset, int fid);
void ApplyFacePalette(int pal, int fid);
void PutFaceOnBackGround(u16* a, u16 b, s8 c);

extern const struct FaceData portrait_data[];
extern struct FaceProc* gFaces[];

// generic minimug images
extern u8 CONST_DATA gGenericIcon_3[];
extern u8 CONST_DATA gGenericIcon_2[];
extern u8 CONST_DATA gGenericIcon_0[];
extern u8 CONST_DATA gGenericIcon_1[];

// generic minimug palettes
extern u16 CONST_DATA gGenericIcon_4[];
extern u16 CONST_DATA gGenericIcon_5[];
extern u16 CONST_DATA gGenericIcon_6[];

extern struct FaceVramEntry CONST_DATA gDefaultFaceConfig[FACE_SLOT_COUNT];
extern u16 CONST_DATA gSprite_Face64x96[];
extern u16 CONST_DATA gSprite_Face64x96_Flipped[];
extern u16 CONST_DATA gSprite_Face96x96[];
extern u16 CONST_DATA gSprite_Face96x96_Flipped[];
extern u16 CONST_DATA gSprite_Face80x72[];
extern u16 CONST_DATA gSprite_Face80x72_Flipped[];
extern u16 CONST_DATA gSprite_Face96x72[];
extern u16 CONST_DATA gSprite_Face96x72_Flipped[];
extern struct ProcCmd gProcScr_E_FACE[];
extern struct ProcCmd CONST_DATA gProcScr_E_FACE_ExtraFrame[];
extern u8 CONST_DATA gFace_1[];
extern struct ProcCmd CONST_DATA gProcScr_FaceChibiSpr[];
extern u16 CONST_DATA Sprite_Face_0[];
extern u16 CONST_DATA Sprite_Face_1[];
extern struct ProcCmd CONST_DATA gProcScr_Face_0[];
extern struct ProcCmd CONST_DATA gProcScr_FaceEndIn8Frames[];
extern struct ProcCmd CONST_DATA gProcScr_Face_1[];
extern struct ProcCmd CONST_DATA gProcScr_FaceBlink[];
extern struct ProcCmd CONST_DATA gProcScr_Face_2[];

#endif  // GUARD_FACE_H
