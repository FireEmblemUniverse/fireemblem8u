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
    CopyToPaletteBuffer(gUnknown_085996F4, Dest << 5, 0x40);
}

void LoadIconPalette(u32 Index, u32 Dest)
{
    CopyToPaletteBuffer((gUnknown_085996F4 + (Index << 3)), Dest << 5, 0x20);
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

#ifdef NONMATCHING
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
            gUnknown_085926F4 + (Index * 0x80),
            (void*)(VRAM + ((GetIconGfxTileIndex(DrawnIconLookupTable[Index].Index) * 0x20) & (0x0001FFE0 + 0 * 1))), //Here, 0x6000000 Gets put in r0 instead of r2.
            0x80
        );

        return GetIconGfxTileIndex(DrawnIconLookupTable[Index].Index);
    }
}
#else
__attribute__((naked))
u16 GetIconTileIndex (int Index)
{
    asm(".syntax unified\n\
    push {r4, r5, lr}\n\
    adds r4, r0, #0\n\
    ldr r0, _0800366C  @ DrawnIconLookupTable\n\
    lsls r1, r4, #2\n\
    adds r5, r1, r0\n\
    ldrb r0, [r5, #1]\n\
    cmp r0, #0\n\
    beq _08003670\n\
    ldrb r0, [r5]\n\
    cmp r0, #0xfe\n\
    bhi _080036A4\n\
    adds r0, #1\n\
    strb r0, [r5]\n\
    b _080036A4\n\
    .align 2, 0\n\
_0800366C: .4byte DrawnIconLookupTable\n\
_08003670:\n\
    ldrb r0, [r5]\n\
    adds r0, #1\n\
    strb r0, [r5]\n\
    adds r0, r4, #0\n\
    bl GetIconGfxIndex\n\
    adds r0, #1\n\
    strb r0, [r5, #1]\n\
    lsls r4, r4, #7\n\
    ldr r0, _080036B4  @ gUnknown_085926F4\n\
    adds r4, r4, r0\n\
    ldrb r0, [r5, #1]\n\
    bl GetIconGfxTileIndex\n\
    adds r1, r0, #0\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0xb\n\
    movs r2, #0xc0\n\
    lsls r2, r2, #0x13\n\
    ldr r0, _080036B8  @ 0x0001FFE0\n\
    ands r1, r0\n\
    adds r1, r1, r2\n\
    adds r0, r4, #0\n\
    movs r2, #0x80\n\
    bl RegisterTileGraphics\n\
_080036A4:\n\
    ldrb r0, [r5, #1]\n\
    bl GetIconGfxTileIndex\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    pop {r4, r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080036B4: .4byte gUnknown_085926F4\n\
_080036B8: .4byte 0x0001FFE0\n\
    .syntax divided\n");
}
#endif

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

        pSource = (void *)gUnknown_085926F4;
        pSource += Index * 0x80;

        RegisterTileGraphics(pSource,        pTarget,         0x40);
        RegisterTileGraphics(pSource + 0x40, pTarget + 0x400, 0x40);
    }
}
