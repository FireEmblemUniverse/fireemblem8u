#ifndef GUARD_AP_H
#define GUARD_AP_H

#include "global.h"
#include "proc.h"

struct APHandle {
    const u16* pDefinition;      // Pointer to Definition Root
    const u16* pFrameData;       // Pointer to Frame Data Array
    const u16* pAnimDataStart;   // Pointer to Current Anim Data (Start, where we go back on loop)
    const u16* pAnimDataCurrent; // Pointer to Current Anim Data (Cursor, where we are now)
    const u16* pCurrentObjData;  // Pointer to Current Obj Data
    const u16* pCurrentRotScale; // Pointer to Current Rot/Scale Data
    s16 frameTimer;              // Cycle Timer
    u16 frameInterval;           // Cycle Time Step (0x100 is one frame)
    u16 subframeTimer;           // Sub frame time offset or something
    u16 objLayer;                // HiObj layer
    u8  gfxNeedsUpdate;          // bool defining whether gfx needs update
    u8  rotScaleIndex;           // Rotation/Scale OAM Index
    u16 tileBase;                // OAM Extra Data (Tile Index Root & OAM2 Stuff)
    const void* pGraphics;       // Pointer to graphics (if any)
};

struct APProc {
    PROC_HEADER;

    u8 _pad[0x50-0x29];
    
    struct APHandle* pHandle;

    u32 xPosition;
    u32 yPosition;
};

extern struct ProcCmd gUnknown_0859168C[];

#endif // GUARD_AP_H
