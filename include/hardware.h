#ifndef GUARD_HARDWARE_H
#define GUARD_HARDWARE_H


struct BgCoords
{
    u16 x;
    u16 y;
};

struct Struct03003080
{
    /*0x00*/ struct DispCnt dispcnt;
    /*0x04*/ struct DispStat dispstat;
    /*0x08*/ u8 filler8[4];
    /*0x0C*/ struct BgCnt bg0cnt;
    /*0x10*/ struct BgCnt bg1cnt;
    /*0x14*/ struct BgCnt bg2cnt;
    /*0x18*/ struct BgCnt bg3cnt;
    /*0x1C*/ struct BgCoords bgoffset[4];
    /*0x2C*/ u16 win0h;
    /*0x2C*/ u16 win1h;
    /*0x30*/ u16 win0v;
    /*0x30*/ u16 win1v;
    /*0x34*/ struct WinCnt wincnt;
    /*0x38*/ u16 mosaic;
             u8 filler3A[2];
    /*0x3C*/ struct BlendCnt bldcnt;
    /*0x40*/ u8 filler40[4];
    /*0x44*/ u8 blendCoeffA;
    /*0x45*/ u8 blendCoeffB;
    /*0x46*/ u8 blendY;
    /*0x48*/ u16 bg2pa;
    /*0x4A*/ u16 bg2pb;
    /*0x4C*/ u16 bg2pc;
    /*0x4E*/ u16 bg2pd;
    /*0x50*/ u32 bg2x;
    /*0x54*/ u32 bg2y;
    /*0x58*/ u16 bg3pa;
    /*0x5A*/ u16 bg3pb;
    /*0x5C*/ u16 bg3pc;
    /*0x5E*/ u16 bg3pd;
    /*0x60*/ u32 bg3x;
    /*0x64*/ u32 bg3y;
    /*0x68*/ s8 colorAddition;
};


void CopyToPaletteBuffer(void *src, int b, int size);
// ??? sub_8000E14(???);
// ??? FlushLCDControl(???);
// ??? BG_GetControlBuffer(???);
int GetBackgroundTileDataOffset(int bg);
int GetTileIndex(int bg, int offset);
// ??? BG_GetTileMapOffset(???);
void SetBackgroundTileDataOffset(int bg, int offset);
void SetBackgroundMapDataOffset(int bg, int offset);
void SetBackgroundScreenSize(int bg, int size);
// ??? BG_SetColorBpp(???);
// ??? ApplyColorAddition_ClampMax(???);
// ??? ApplyColorAddition_ClampMin(???);
// ??? FlushBackgrounds(???);
void BG_Fill();
// ??? RegisterBlankTile(???);
void SetInterrupt_LCDVBlank(InterruptHandler handler);
// ??? SetInterrupt_LCDVCountMatch(???);
// ??? sub_8001308(???);
// ??? SetLCDVCountSetting(???);
// ??? SetMainUpdateRoutine(???);
void ExecMainUpdate();
// ??? _UpdateKeyStatus(???);
void UpdateKeyStatus(struct KeyStatusBuffer *keyStatus);
// ??? sub_8001414(???);
void ResetKeyStatus(struct KeyStatusBuffer *keyStatus);
// ??? SetKeyStatus_IgnoreMask(???);
// ??? GetKeyStatus_IgnoreMask(???);
// ??? KeyStatusSetter_Set(???);
// ??? NewKeyStatusSetter(???);
void BG_SetPosition(u16 a, u16 b, u16 c);
// ??? sub_80014E8(???);
// ??? sub_800151C(???);
// ??? sub_8001530(???);
// ??? sub_800154C(???);
// ??? sub_800159C(???);
// ??? sub_80016C4(???);
// ??? sub_8001710(???);
// ??? sub_800172C(???);
// ??? sub_80017B4(???);
// ??? sub_800183C(???);
// ??? sub_8001860(???);
// ??? sub_80018E4(???);
// ??? sub_8001964(???);
// ??? sub_80019E8(???);
// ??? sub_8001A6C(???);
// ??? SetupBackgrounds(???);
void *BG_GetMapBuffer();
void sub_8001C5C(u8);
// ??? ShouldSkipHSScreen(???);
void SoftResetIfKeyComboPressed();
// ??? sub_8001CB0(???);
// ??? ExecBothHBlankHandlers(???);
// ??? UpdateHBlankHandlerState(???);
// ??? SetPrimaryHBlankHandler(???);
// ??? SetSecondaryHBlankHandler(???);
// ??? GetBackgroundFromBufferPointer(???);
// ??? BG_SetPriority(???);
// ??? BG_GetPriority(???);
void SetSpecialColorEffectsParameters(u16 effect, u8 coeffA, u8 coeffB, u8 blendY);
void sub_8001ED0(int a, int b, int c, int d, int e);
void sub_8001F0C(int a, int b, int c, int d, int e);
void sub_8001F48(int bkdropOnOff);
void sub_8001F64(int bkdropOnOff);
void SetDefaultColorEffects(void);
void EnablePaletteSync(void);
void DisablePaletteSync(void);
void BG_EnableSyncByMask(int bg);
void BG_EnableSync(int bg);
// ??? sub_8001FD0(???);
// ??? ClearTileRigistry(???);
void RegisterTileGraphics(const void *a, void *b, int c);
void RegisterFillTile(void *a, void *b, int c);
// ??? FlushTiles(???);
void SetupOAMBufferSplice(int a);
// ??? FlushSecondaryOAM(???);
// ??? FlushPrimaryOAM(???);
void WriteOAMRotScaleData(int index, s16 pa, s16 pb, s16 pc, s16 pd);
// ??? sub_80021E4(???);
// ??? GetPrimaryOAMSize(???);

#endif  // GUARD_HARDWARE_H
