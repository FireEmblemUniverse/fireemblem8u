#ifndef GUARD_UI_UTILS_H
#define GUARD_UI_UTILS_H

void UnpackLegacyUiFramePalette(int palId);
void UnpackUiFramePalette(int palId);
void UnpackLegacyUiFrameImage(void* dest);
void UnpackUiFrameImage(void* dest);
void UnpackUiBarPalette(int palId);
void UnpackUiFrameBuffered(int id);
void DrawUiFrame(u16* tilemap, int x, int y, int width, int height, int tilebase, int style);
void ClearUiFrame(u16* tilemap, int x, int y, int width, int height);
void DrawUiFrame2(int x, int y, int width, int height, int style);
void DisplayUiHand(int x, int y);
void DisplayUiHand_unused(int x, int y);
void DisplayFrozenUiHand(int x, int y);
int GetUiHandPrevDisplayX(void);
int GetUiHandPrevDisplayY(void);
void ClearBg0Bg1(void);
void DrawUiItemHover(int x, int y, int width);
void ClearUiItemHover(int x, int y, int width);
void DrawUiItemHoverExt(int bg, int base, int x, int y, int width);
void ClearUiItemHoverExt(int bg, int base, int x, int y, int width);
void UnpackUnkUiFrame(void* vram, int palId, int palCount);
void DisplayUiHandExt(int x, int y, unsigned objTileOffset);
void DisplayFrozenUiHandExt(int x, int y, unsigned objTileOffset);
void LoadLegacyUiFrameGraphics(void);
void LoadUiFrameGraphics(void);
void LoadUiFrameGraphicsTo(unsigned vramOffset, int palId);

#endif // GUARD_UI_UTILS_H
