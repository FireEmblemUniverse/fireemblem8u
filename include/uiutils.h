#ifndef GUARD_UI_UTILS_H
#define GUARD_UI_UTILS_H

enum
{
    BGPAL_UI_FRAME   = 1,
	BGPAL_UI_STATBAR = 6,
};

void LoadOldUIPal(int palId);
void LoadNewUIPal(int palId);
void LoadOldUIImage(void* dest);
void LoadNewUIImage(void* dest);
void sub_804E138(int palId);
void sub_804E168(int id);
void WriteUIWindowTileMap(u16* tilemap, int x, int y, int width, int height, int tilebase, int style);
void ClearTileMapRect(u16* tilemap, int x, int y, int width, int height);
void MakeUIWindowTileMap_BG0BG1(int x, int y, int width, int height, int style);
void sub_804E79C(int x, int y);
void sub_804E80C(int x, int y);
void sub_804E848(int x, int y);
int sub_804E86C(void);
int sub_804E878(void);
void ClearBG0BG1(void);
void sub_804E8A8(int x, int y, int width);
void sub_804E90C(int x, int y, int width);
void sub_804E98C(int bg, int base, int x, int y, int width);
void sub_804EA08(int bg, int base, int x, int y, int width);
void sub_804EA8C(void* vram, int palId, int palCount);
void sub_804EAB8(int x, int y, unsigned objTileOffset);
void sub_804EB2C(int x, int y, unsigned objTileOffset);
void LoadOldUIGfx(void);
void LoadNewUIGraphics(void);
void sub_804EB7C(unsigned offset, int palId);

#endif // GUARD_UI_UTILS_H
