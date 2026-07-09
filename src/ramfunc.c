#include "global.h"

extern u8 gUnk_68[];  // buffer to copy the code to

// pointers to the loaded functions
extern void (*gUnk_67)(int, int, int, int);
extern void (*DecodeStringRAMFunc)(const char *, char *);
extern void (*gUnk_66)(int, int, const u16 *, int);
extern void (*gUnk_69)(int, int, const u16 *, int);
extern void (*gUnk_70)(int, int, int);
extern void (*gUnk_65)(void);

// arm.s symbols
extern const u8 ARMCodeToCopy_Start[];
extern const u8 DrawGlyph[];
extern const u8 DecodeString[];
extern const u8 PutOamHi[];
extern const u8 PutOamLo[];
extern const u8 MapFloodCoreStep[];
extern const u8 MapFloodCore[];
extern const u8 ARMCodeToCopy_End[];

void StoreRoutinesToIRAM(void)
{
    size_t armCodeSize = (ARMCodeToCopy_End - ARMCodeToCopy_Start);

    // Copy all of the ARM code into RAM
    CpuCopy16(ARMCodeToCopy_Start, gUnk_68, armCodeSize + (armCodeSize >> 31));

    // Set pointers to each of the functions
    gUnk_67 = (void *)(gUnk_68 + (DrawGlyph    - ARMCodeToCopy_Start));
    DecodeStringRAMFunc = (void *)(gUnk_68 + (DecodeString - ARMCodeToCopy_Start));
    gUnk_66 = (void *)(gUnk_68 + (PutOamHi - ARMCodeToCopy_Start));
    gUnk_69 = (void *)(gUnk_68 + (PutOamLo   - ARMCodeToCopy_Start));
    gUnk_70 = (void *)(gUnk_68 + (MapFloodCoreStep              - ARMCodeToCopy_Start));
    gUnk_65 = (void *)(gUnk_68 + (MapFloodCore    - ARMCodeToCopy_Start));
}

void DrawGlyphRam(int a, int b, int c, int d)
{
    gUnk_67(a, b, c, d);
}

void CallARM_DecompText(const char *a, char *b)
{
    DecodeStringRAMFunc(a, b);
}

void CallARM_PushToSecondaryOAM(int a, int b, const u16 *c, int d)
{
    gUnk_66(a, b, c, d);
}

void CallARM_PushToPrimaryOAM(int a, int b, const u16 *c, int d)
{
    gUnk_69(a, b, c, d);
}

void CallARM_Func5(int a, int b, int c)
{
    gUnk_70(a, b, c);
}

void CallARM_FillMovementMap()
{
    gUnk_65();
}
