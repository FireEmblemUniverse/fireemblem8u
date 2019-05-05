#include "global.h"
#include "icon.h"

#define MAX_ICON_COUNT 224
#define MAX_ICON_GFX_COUNT 32

EWRAM_DATA static struct IconStruct DrawnIconLookupTable[MAX_ICON_COUNT] = {0};
EWRAM_DATA static u8 IconGFXIDLookupTable[MAX_ICON_GFX_COUNT] = {0};
extern void CopyToPaletteBuffer(const void *Palette, u32 Dest, u32 Size);
extern void RegisterTileGraphics(const void *GFX, void *Dest, u32 size);
extern void RegisterFillTile(const void *GFX, void *Dest, u32 size);

void ResetIconGraphics_()
{
    ResetIconGraphics(); //Probably was a debug wrapper.
}

void ResetIconGraphics() 
{
    CpuFill16(0, &DrawnIconLookupTable, sizeof(DrawnIconLookupTable));
    CpuFill16(0, &IconGFXIDLookupTable, 0x20);
}

void LoadIconPalettes(u32 Dest)
{
    CopyToPaletteBuffer(&item_icon_palette, Dest << 5, sizeof(item_icon_palette));
}

void LoadIconPalette(u32 Index, u32 Dest)
{
    CopyToPaletteBuffer(item_icon_palette[Index], Dest << 5, 0x20);
}

int GetNextFreeIcon() // Unused
{ 
    int retVal = 0;
    int i;
    for(i = MAX_ICON_GFX_COUNT-1; i >= 0; i--)
    {
        if(IconGFXIDLookupTable[i] != 0) retVal++;
    }
    return retVal;
}

u16 GetIconGfxTileIndex(u32 Index)
{
    return 0x300 - Index * 4;
}

int GetIconGfxIndex(int Index)
{
    int i;
    for(i = 0; i <= MAX_ICON_GFX_COUNT-1; i++)
    {
        if (IconGFXIDLookupTable[i] == 0)
        {
            IconGFXIDLookupTable[i] = Index + 1;
            return i;
        }
    }
    return -1;
}

u16 GetIconTileIndex(int Index)
{
    if (DrawnIconLookupTable[Index].Index != 0)
    {
        if (DrawnIconLookupTable[Index].References < 0xFF)
            DrawnIconLookupTable[Index].References++;
        
        return GetIconGfxTileIndex(DrawnIconLookupTable[Index].Index);
    }
    else 
    {
        DrawnIconLookupTable[Index].References++;
        DrawnIconLookupTable[Index].Index = GetIconGfxIndex(Index) + 1;

        RegisterTileGraphics(
            item_icon_tiles + (Index * 0x80),
            (void*)(VRAM + (0x1FFE0 & (VRAM + 0x20 * GetIconGfxTileIndex(DrawnIconLookupTable[Index].Index)))),
            0x80
        );

        return GetIconGfxTileIndex(DrawnIconLookupTable[Index].Index);
    }
}

void DrawIcon(u16* BgOut, int IconIndex, int OamPalBase) 
{
    if (IconIndex < 0) {
        BgOut[0]  = 0;
        BgOut[1]  = 0;
        BgOut[32] = 0;
        BgOut[33] = 0;
    } else {
        u16 Tile = GetIconTileIndex(IconIndex) + OamPalBase;

        BgOut[0]  = Tile++;
        BgOut[1]  = Tile++;
        BgOut[32] = Tile++;
        BgOut[33] = Tile;
    }
}

void ClearIconGfx(u32 Index) 
{
    IconGFXIDLookupTable[DrawnIconLookupTable[Index].Index - 1] = 0;
    DrawnIconLookupTable[Index].Index = 0;
}

void LoadIconObjectGraphics(int Index, int b)
{
    void* pTarget;

    pTarget = OBJ_VRAM0;
    pTarget += ((b & 0x3FF) * 0x20);

    if (Index < 0) { // Clear Obj VRAM
        RegisterFillTile(0, pTarget,         0x40);
        RegisterFillTile(0, pTarget + 0x400, 0x40);
    } else {
        void* pSource;

        pSource = (void *)item_icon_tiles;
        pSource += Index * 0x80;

        RegisterTileGraphics(pSource,        pTarget,         0x40);
        RegisterTileGraphics(pSource + 0x40, pTarget + 0x400, 0x40);
    }
}
