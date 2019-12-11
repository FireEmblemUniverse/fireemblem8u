#ifndef GUARD_ICON_H
#define GUARD_ICON_H

struct IconStruct {
    u8 References; // Seems to count the number of references to that icon ID
    u8 Index;
};

void ResetIconGraphics_();
void ResetIconGraphics();
void LoadIconPalettes(u32 Dest);
void LoadIconPalette(u32 Index, u32 Dest);
int sub_80035EC();
u16 GetIconGfxTileIndex(u32 Index);
int GetIconGfxIndex(int Index);
u16 GetIconTileIndex(int Index); // NONMATCHING
void DrawIcon(u16* BgOut, int IconIndex, int OamPalBase);
void ClearIconGfx(u32 Index);
void LoadIconObjectGraphics(int Index, int b);

extern const u16 item_icon_palette[2][16]; // Item Icon Palette
extern const u8 item_icon_tiles[]; // Item Icon GFX

#endif  // GUARD_ICON_H
