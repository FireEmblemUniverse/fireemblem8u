#ifndef GUARD_HARDWARE_H
#define GUARD_HARDWARE_H

#include "global.h"

enum {
    FRAMES_PER_SECOND = 60,
    FRAMES_PER_MINUTE = 60 * FRAMES_PER_SECOND,
    FRAMES_PER_HOUR   = 60 * FRAMES_PER_MINUTE,
};

struct DispCnt {
    /* bit  0 */ u16 mode : 3;
    /* bit  3 */ u16 cgbMode : 1; // reserved, do not use
    /* bit  4 */ u16 bmpFrameNum : 1;
    /* bit  5 */ u16 hblankIntervalFree : 1;
    /* bit  6 */ u16 obj1dMap : 1;
    /* bit  7 */ u16 forcedBlank : 1;
    /* bit  8 */ u16 bg0_on : 1;
    /* bit  9 */ u16 bg1_on : 1;
    /* bit 10 */ u16 bg2_on : 1;
    /* bit 11 */ u16 bg3_on : 1;
    /* bit 12 */ u16 obj_on : 1;
    /* bit 13 */ u16 win0_on : 1;
    /* bit 14 */ u16 win1_on : 1;
    /* bit 15 */ u16 objWin_on : 1;
    STRUCT_PAD(0x02, 0x04);
} BITPACKED;

struct DispStat {
    /* bit  0 */ u16 vblankFlag : 1;
    /* bit  1 */ u16 hblankFlag : 1;
    /* bit  2 */ u16 vcountFlag : 1;
    /* bit  3 */ u16 vblankIrqEnable : 1;
    /* bit  4 */ u16 hblankIrqEnable : 1;
    /* bit  5 */ u16 vcountIrqEnable : 1;
    /* bit  6 */ u16 dummy : 2;
    /* bit  8 */ u16 vcountCompare : 8;
    STRUCT_PAD(0x02, 0x04);
} BITPACKED;

struct BgCnt {
    /* bit  0 */ u16 priority : 2;
    /* bit  2 */ u16 charBaseBlock : 2;
    /* bit  4 */ u16 dummy : 2;
    /* bit  6 */ u16 mosaic : 1;
    /* bit  7 */ u16 colorMode : 1;
    /* bit  8 */ u16 screenBaseBlock : 5;
    /* bit 13 */ u16 areaOverflowMode : 1;
    /* bit 14 */ u16 screenSize : 2;
    STRUCT_PAD(0x02, 0x04);
} BITPACKED;

struct WinCnt {
    u8 win0_enableBg0 : 1;
    u8 win0_enableBg1 : 1;
    u8 win0_enableBg2 : 1;
    u8 win0_enableBg3 : 1;
    u8 win0_enableObj : 1;
    u8 win0_enableBlend : 1;
    u8 : 2;

    u8 win1_enableBg0 : 1;
    u8 win1_enableBg1 : 1;
    u8 win1_enableBg2 : 1;
    u8 win1_enableBg3 : 1;
    u8 win1_enableObj : 1;
    u8 win1_enableBlend : 1;
    u8 : 2;

    u8 wout_enableBg0 : 1;
    u8 wout_enableBg1 : 1;
    u8 wout_enableBg2 : 1;
    u8 wout_enableBg3 : 1;
    u8 wout_enableObj : 1;
    u8 wout_enableBlend : 1;
    u8 : 2;

    u8 wobj_enableBg0 : 1;
    u8 wobj_enableBg1 : 1;
    u8 wobj_enableBg2 : 1;
    u8 wobj_enableBg3 : 1;
    u8 wobj_enableObj : 1;
    u8 wobj_enableBlend : 1;
    u8 : 2;
} BITPACKED;

struct BlendCnt {
    u16 target1_bg0_on : 1;
    u16 target1_bg1_on : 1;
    u16 target1_bg2_on : 1;
    u16 target1_bg3_on : 1;
    u16 target1_obj_on : 1;
    u16 target1_bd_on : 1;
    u16 effect : 2;
    u16 target2_bg0_on : 1;
    u16 target2_bg1_on : 1;
    u16 target2_bg2_on : 1;
    u16 target2_bg3_on : 1;
    u16 target2_obj_on : 1;
    u16 target2_bd_on : 1;
    u32 _unused;
} BITPACKED;

struct LCDControlBuffer {
    /* 00 */ struct DispCnt dispcnt;
    /* 04 */ struct DispStat dispstat;
    /* 08 */ STRUCT_PAD(0x08, 0x0C);
    /* 0C */ struct BgCnt bg0cnt;
    /* 10 */ struct BgCnt bg1cnt;
    /* 14 */ struct BgCnt bg2cnt;
    /* 18 */ struct BgCnt bg3cnt;
    /* 1C */ struct BgCoords bgoffset[4];
    /* 2C */ u8 win0_right, win0_left;
    /* 2C */ u8 win1_right, win1_left;
    /* 30 */ u8 win0_bottom, win0_top;
    /* 30 */ u8 win1_bottom, win1_top;
    /* 34 */ struct WinCnt wincnt;
    /* 38 */ u16 mosaic;
             STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ struct BlendCnt bldcnt;
    /* 44 */ u8 blendCoeffA;
    /* 45 */ u8 blendCoeffB;
    /* 46 */ u8 blendY;
    /* 48 */ u16 bg2pa;
    /* 4A */ u16 bg2pb;
    /* 4C */ u16 bg2pc;
    /* 4E */ u16 bg2pd;
    /* 50 */ u32 bg2x;
    /* 54 */ u32 bg2y;
    /* 58 */ u16 bg3pa;
    /* 5A */ u16 bg3pb;
    /* 5C */ u16 bg3pc;
    /* 5E */ u16 bg3pd;
    /* 60 */ u32 bg3x;
    /* 64 */ u32 bg3y;
    /* 68 */ s8 colorAddition;
};

struct KeyStatusBuffer {
    /* 00 */ u8 repeatDelay;     // initial delay before generating auto-repeat presses
    /* 01 */ u8 repeatInterval;  // time between auto-repeat presses
    /* 02 */ u8 repeatTimer;     // (decreased by one each frame, reset to repeatDelay when Presses change and repeatInterval when reaches 0)
    /* 04 */ u16 heldKeys;       // keys that are currently held down
    /* 06 */ u16 repeatedKeys;   // auto-repeated keys
    /* 08 */ u16 newKeys;        // keys that went down this frame
    /* 0A */ u16 prevKeys;       // keys that were held down last frame
    /* 0C */ u16 LastPressState;
    /* 0E */ bool16 ABLRPressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 newKeys2;
    /* 12 */ u16 TimeSinceStartSelect; // Time since last Non-Start Non-Select Button was pressed
};

struct Struct02024CD4 {
    int count;
    int size;
};

struct TileDataTransfer {
    const void *src;
    void *dest;
    u16 size;
    u16 mode;
};

struct OamSection {
    u16 * buf;
    void * oam;
    u16 offset;
    u16 count;
};

extern struct OamSection sOamHi;
extern struct OamSection sOamLo;

// extern ??? gKeyComboResetEN
extern u8 sModifiedBGs;  // BGs that need copying
extern s8 sModifiedPalette;
extern u16 gKeyStatusIgnoredSt;
// extern ??? gUnknown_03000014
extern u8 gUnknown_03000018;
extern u8 gUnknown_03000019;
extern bool gSoftwareResetFlag;

extern s8 gUnknown_02022288[];
extern s8 gUnknown_020222A8[];
extern s8 gUnknown_02022308[];

extern u16 gPaletteBuffer[];

// In text mode, the tilemap entries are 16 bits,
// while in affine mode, they are 8 bits.
// they are defined as u16 for convenience

extern u16 gBG0TilemapBuffer[32 * 32];
extern u16 gBG1TilemapBuffer[32 * 32];
extern u16 gBG2TilemapBuffer[32 * 32];
extern u16 gBG3TilemapBuffer[32 * 32];

extern void * gBGVramTilemapPointers[4];

extern void (*gMainCallback)(void);

extern struct KeyStatusBuffer * CONST_DATA gKeyStatusPtr;

extern struct LCDControlBuffer gLCDControlBuffer;

extern struct Struct02024CD4 gFrameTmRegisterConfig;
extern struct TileDataTransfer gFrameTmRegister[32];

extern SHOULD_BE_CONST s16 gSinLookup[]; // needs to be non-const to match?

// Utility macros and constants

// Some functions only match with one of the macros.
// NOTE: TILEMAP_INDEX2 is TM_OFFSET in fe6
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_INDEX2(aX, aY) (((aY) << 5) + (aX))

#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

#define TILEREF(aChar, aPal) ((aChar) + ((aPal) << 12))
#define TILE_HFLIP 0x0400
#define TILE_VFLIP 0x0800

#define CHR_SIZE 0x20
#define CHR_LINE 0x20
#define BG_CHR_ADDR(n)   (void *)(BG_VRAM + (CHR_SIZE * (n)))
#define OBJ_CHR_ADDR(n)  (void *)(OBJ_VRAM0 + (CHR_SIZE * (n)))

#define PAL_COLOR_OFFSET(palid, colornum) (palid) * 0x10 + (colornum)
#define PAL_OFFSET(palid) PAL_COLOR_OFFSET((palid), 0)
#define BGPAL_OFFSET(bgpal) PAL_OFFSET(0x00 + (bgpal))
#define OBPAL_OFFSET(obpal) PAL_OFFSET(0x10 + (obpal))

#define PAL_BACKDROP_OFFSET PAL_COLOR_OFFSET(0, 0)

#define PAL_BUF_COLOR(buf, palid, colornum) buf[PAL_COLOR_OFFSET((palid), (colornum))]
#define PAL_COLOR(palid, colornum) PAL_BUF_COLOR(gPaletteBuffer, palid, colornum)
#define PAL_BG_COLOR(palid, colornum) PAL_COLOR(palid, colornum)
#define PAL_OBJ_COLOR(palid, colornum) PAL_COLOR((palid) + 0x10, colornum)
#define PAL_BG(palid) (&PAL_BG_COLOR(palid, 0))
#define PAL_OBJ(palid) (&PAL_OBJ_COLOR(palid, 0))

#define SIN(aAngle) (gSinLookup[((aAngle) & 0xFF)])
#define COS(aAngle) (gSinLookup[0x40 + ((aAngle) & 0xFF)])

#define BG_SYNC_BIT(aBg) (1 << (aBg))

enum {
    BG_0 = 0,
    BG_1,
    BG_2,
    BG_3,
};

enum {
    BG0_SYNC_BIT = BG_SYNC_BIT(0),
    BG1_SYNC_BIT = BG_SYNC_BIT(1),
    BG2_SYNC_BIT = BG_SYNC_BIT(2),
    BG3_SYNC_BIT = BG_SYNC_BIT(3),
};

#define ApplyPalettes(aSrc, aPalId, aPalCount) CopyToPaletteBuffer((aSrc), 0x20 * (aPalId), 0x20 * (aPalCount))
#define ApplyPalette(aSrc, aPalId) ApplyPalettes((aSrc), (aPalId), 1)

#define SetDispEnable(bg0, bg1, bg2, bg3, obj) \
{ \
    gLCDControlBuffer.dispcnt.bg0_on = (bg0); \
    gLCDControlBuffer.dispcnt.bg1_on = (bg1); \
    gLCDControlBuffer.dispcnt.bg2_on = (bg2); \
    gLCDControlBuffer.dispcnt.bg3_on = (bg3); \
    gLCDControlBuffer.dispcnt.obj_on = (obj); \
}

#define SetWinEnable(win0, win1, objwin) \
{ \
    gLCDControlBuffer.dispcnt.win0_on = (win0); \
    gLCDControlBuffer.dispcnt.win1_on = (win1); \
    gLCDControlBuffer.dispcnt.objWin_on = (objwin); \
}

#define SetWin0Box(left, top, right, bottom) \
{ \
    gLCDControlBuffer.win0_left = (left); \
    gLCDControlBuffer.win0_top = (top); \
    gLCDControlBuffer.win0_right = (right); \
    gLCDControlBuffer.win0_bottom = (bottom); \
}

#define SetWin1Box(left, top, right, bottom) \
{ \
    gLCDControlBuffer.win1_left = (left); \
    gLCDControlBuffer.win1_top = (top); \
    gLCDControlBuffer.win1_right = (right); \
    gLCDControlBuffer.win1_bottom = (bottom); \
}

#define SetWin0Layers(bg0, bg1, bg2, bg3, obj) \
{ \
    gLCDControlBuffer.wincnt.win0_enableBg0 = (bg0); \
    gLCDControlBuffer.wincnt.win0_enableBg1 = (bg1); \
    gLCDControlBuffer.wincnt.win0_enableBg2 = (bg2); \
    gLCDControlBuffer.wincnt.win0_enableBg3 = (bg3); \
    gLCDControlBuffer.wincnt.win0_enableObj = (obj); \
}

#define SetWin1Layers(bg0, bg1, bg2, bg3, obj) \
{ \
    gLCDControlBuffer.wincnt.win1_enableBg0 = (bg0); \
    gLCDControlBuffer.wincnt.win1_enableBg1 = (bg1); \
    gLCDControlBuffer.wincnt.win1_enableBg2 = (bg2); \
    gLCDControlBuffer.wincnt.win1_enableBg3 = (bg3); \
    gLCDControlBuffer.wincnt.win1_enableObj = (obj); \
}

#define SetWObjLayers(bg0, bg1, bg2, bg3, obj) \
{ \
    gLCDControlBuffer.wincnt.wobj_enableBg0 = (bg0); \
    gLCDControlBuffer.wincnt.wobj_enableBg1 = (bg1); \
    gLCDControlBuffer.wincnt.wobj_enableBg2 = (bg2); \
    gLCDControlBuffer.wincnt.wobj_enableBg3 = (bg3); \
    gLCDControlBuffer.wincnt.wobj_enableObj = (obj); \
}

#define SetWOutLayers(bg0, bg1, bg2, bg3, obj) \
{ \
    gLCDControlBuffer.wincnt.wout_enableBg0 = (bg0); \
    gLCDControlBuffer.wincnt.wout_enableBg1 = (bg1); \
    gLCDControlBuffer.wincnt.wout_enableBg2 = (bg2); \
    gLCDControlBuffer.wincnt.wout_enableBg3 = (bg3); \
    gLCDControlBuffer.wincnt.wout_enableObj = (obj); \
}

#define SetBlendAlpha(ca, cb) \
    SetSpecialColorEffectsParameters(BLEND_EFFECT_ALPHA, (ca), (cb), 0)

#define SetBlendBrighten(cy) \
    SetSpecialColorEffectsParameters(BLEND_EFFECT_BRIGHTEN, 0, 0, (cy))

#define SetBlendDarken(cy) \
    SetSpecialColorEffectsParameters(BLEND_EFFECT_DARKEN, 0, 0, (cy))

#define SetBlendNone() \
    SetSpecialColorEffectsParameters(BLEND_EFFECT_NONE, 0x10, 0, 0)

// Functions

void CopyToPaletteBuffer(const void* src, int b, int size);
void sub_8000E14(u16 *a, int b, int size, int d);
void FlushLCDControl(void);
struct BgCnt *BG_GetControlBuffer(u16 bg);
int GetBackgroundTileDataOffset(int bg);
int GetTileIndex(int bg, int offset);
int BG_GetTileMapOffset(int bg);
void SetBackgroundTileDataOffset(int bg, int offset);
void SetBackgroundMapDataOffset(int bg, int offset);
void SetBackgroundScreenSize(int bg, int size);
void BG_SetColorBpp(int bg, int bitsPerPixel);
// ??? ApplyColorAddition_ClampMax(???);
// ??? ApplyColorAddition_ClampMin(???);
void FlushBackgrounds(void);
void BG_Fill(void *dest, int b);
void RegisterBlankTile(int a);
void SetInterrupt_LCDVBlank(InterruptHandler handler);
void SetInterrupt_LCDVCountMatch(InterruptHandler handler);
void SetNextVCount(int a);
void SetLCDVCountSetting(int set);
void SetMainUpdateRoutine(void(*)(void));
void ExecMainUpdate();
// ??? _UpdateKeyStatus(???);
void UpdateKeyStatus(struct KeyStatusBuffer *keyStatus);
void SnycKeyStatus(struct KeyStatusBuffer *keyStatus);
void ResetKeyStatus(struct KeyStatusBuffer *keyStatus);
void SetKeyStatus_IgnoreMask(int keys);
int GetKeyStatus_IgnoreMask(void);
// ??? AsnycKeyStatusExt(???);
void AsnycKeyStatus(int key);
void BG_SetPosition(u16 bg, u16 x, u16 y);
void sub_800151C(u8 a, u8 b);
void sub_800151C(u8 a, u8 b);
void sub_8001530(u16 *a, u16 *b);
void sub_800154C(void* outTm, void const* inData, u8 base, u8 linebits);
void sub_800159C(u16 *a1, u16 *a2, s16 a3, s16 a4, u16 a5);
// ??? sub_80016C4(???);
void MaybeResetSomePal(void);
void MaybeSmoothChangeSomePal(u16 *src, int b, int c, int d);
void sub_80017B4(int a, int b, int c, int d);
void sub_800183C(int a, int b, int c);
void ColorFadeSetupFromColorToBlack(u8);
void ColorFadeSetupFromBlack(u8);
void ColorFadeSetupFromColorToWhite(u8);
void ColorFadeSetupFromWhite(u8);
void sub_8001A6C(void);
void SetupBackgrounds(u16 *bgConfig);
u16* BG_GetMapBuffer(int bg);
void SetSoftwareResetFlag(u8);
int IsSoftwareReset(void);
void SoftResetIfKeyComboPressed();
void sub_8001CB0(int a);
void ExecBothHBlankHandlers(void);
void UpdateHBlankHandlerState(void);
void SetPrimaryHBlankHandler(void (*hblankHandler)(void));
void SetSecondaryHBlankHandler(void(*)(void));
int GetBackgroundFromBufferPointer(u16 *ptr);
void BG_SetPriority(int bg, int priority);
int BG_GetPriority(int bg);
void SetSpecialColorEffectsParameters(u16 effect, u8 coeffA, u8 coeffB, u8 blendY);
void SetBlendTargetA(int, int, int, int, int);
void SetBlendTargetB(int, int, int, int, int);
void SetBlendBackdropA(int);
void SetBlendBackdropB(int a);
void SetDefaultColorEffects(void);
void EnablePaletteSync(void);
void DisablePaletteSync(void);
void BG_EnableSyncByMask(int bg);
void BG_EnableSync(int bg);
void sub_8001FD0(int a);
void ClearTileRigistry(void);
void RegisterDataMove(const void *a, void *b, int c);
void RegisterFillTile(const void *a, void *b, int c);
void FlushTiles(void);
void InitOam(int a);
void SyncHiOam(void);
void SyncLoOam(void);
void SetObjAffine(int index, s16 pa, s16 pb, s16 pc, s16 pd);
// ??? sub_80021E4(???);
int GetPrimaryOAMSize(void);

#endif  // GUARD_HARDWARE_H
