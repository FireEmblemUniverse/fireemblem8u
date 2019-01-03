#include "global.h"

extern u8 gUnknown_03003750[];  // buffer to copy the code to

// pointers to the loaded functions
extern void (*gUnknown_03003740)(int, int, int, int);
extern void (*gUnknown_03004150)(const char *, char *);
extern void (*gUnknown_03003130)(int, int, const u16 *, int);
extern void (*gUnknown_03004154)(int, int, const u16 *, int);
extern void (*gUnknown_03004960)(int, int, int);
extern void (*gUnknown_03003128)(void);

// arm.s symbols
extern const u8 ARMCodeToCopy_Start[];
extern const u8 IRAMARM_Func3_DrawGlyph[];
extern const u8 IRAMARM_DecompText[];
extern const u8 IRAMARM_CopyToSecondaryOAM[];
extern const u8 IRAMARM_CopyToPrimaryOAM[];
extern const u8 IRAMARM_Func5[];
extern const u8 IRAMARM_FillMovementMap[];
extern const u8 ARMCodeToCopy_End[];

void StoreRoutinesToIRAM(void)
{
    size_t armCodeSize = (ARMCodeToCopy_End - ARMCodeToCopy_Start);

    // Copy all of the ARM code into RAM
    CpuCopy16(ARMCodeToCopy_Start, gUnknown_03003750, armCodeSize + (armCodeSize >> 31));

    // Set pointers to each of the functions
    gUnknown_03003740 = (void *)(gUnknown_03003750 + (IRAMARM_Func3_DrawGlyph    - ARMCodeToCopy_Start));
    gUnknown_03004150 = (void *)(gUnknown_03003750 + (IRAMARM_DecompText         - ARMCodeToCopy_Start));
    gUnknown_03003130 = (void *)(gUnknown_03003750 + (IRAMARM_CopyToSecondaryOAM - ARMCodeToCopy_Start));
    gUnknown_03004154 = (void *)(gUnknown_03003750 + (IRAMARM_CopyToPrimaryOAM   - ARMCodeToCopy_Start));
    gUnknown_03004960 = (void *)(gUnknown_03003750 + (IRAMARM_Func5              - ARMCodeToCopy_Start));
    gUnknown_03003128 = (void *)(gUnknown_03003750 + (IRAMARM_FillMovementMap    - ARMCodeToCopy_Start));
}

void CallARM_Func3(int a, int b, int c, int d)
{
    gUnknown_03003740(a, b, c, d);
}

void CallARM_DecompText(const char *a, char *b)
{
    gUnknown_03004150(a, b);
}

void CallARM_PushToSecondaryOAM(int a, int b, const u16 *c, int d)
{
    gUnknown_03003130(a, b, c, d);
}

void CallARM_PushToPrimaryOAM(int a, int b, const u16 *c, int d)
{
    gUnknown_03004154(a, b, c, d);
}

void CallARM_Func5(int a, int b, int c)
{
    gUnknown_03004960(a, b, c);
}

void CallARM_FillMovementMap()
{
    gUnknown_03003128();
}
