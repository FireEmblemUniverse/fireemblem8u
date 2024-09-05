#ifndef GUARD_AP_H
#define GUARD_AP_H

#include "global.h"
#include "proc.h"

#define AP_MAX_COUNT 0x14 // 20

struct APProc {
    PROC_HEADER;

    u8 _pad[0x50-0x29];
    
    struct APHandle* pHandle;

    u32 xPosition;
    u32 yPosition;
};

struct APHandle {
    /* 00 */ const u16 * pDefinition;      // Pointer to Definition Root
    /* 04 */ const u16 * pFrameData;       // Pointer to Frame Data Array
    /* 08 */ const u16 * pAnimDataStart;   // Pointer to Current Anim Data (Start, where we go back on loop)
    /* 0C */ const u16 * pAnimDataCurrent; // Pointer to Current Anim Data (Cursor, where we are now)
    /* 10 */ const u16 * pCurrentObjData;  // Pointer to Current Obj Data
    /* 14 */ const u16 * pCurrentRotScale; // Pointer to Current Rot/Scale Data
    /* 18 */ s16 frameTimer;              // Cycle Timer
    /* 1A */ u16 frameInterval;           // Cycle Time Step (0x100 is one frame)
    /* 1C */ u16 subframeTimer;           // Sub frame time offset or something
    /* 1E */ u16 objLayer;                // HiObj layer
    /* 20 */ u8  gfxNeedsUpdate;          // bool defining whether gfx needs update
    /* 21 */ u8  rotScaleIndex;           // Rotation/Scale OAM Index
    /* 22 */ u16 tileBase;                // OAM Extra Data (Tile Index Root & OAM2 Stuff)
    /* 24 */ const void * pGraphics;       // Pointer to graphics (if any)
};


void AP_ClearAll();
struct APHandle * AP_Create(const void * apDefinition, u16 aObjNode);
void AP_Delete(struct APHandle * handle);
s8   AP_Update(struct APHandle * handle, int x, int y);
void AP_Display(struct APHandle *, int, int);
s8   AP_ExecFrame(struct APHandle *);
void AP_QueueObjRotScale(struct APHandle *);
void AP_SwitchAnimation(struct APHandle * handle, int index);
void AP_SetDefinition(struct APHandle * handle, const u16 * definition);
void AP_QueueObjGraphics(struct APHandle *);
void AP_LoadDefinition(struct APHandle *, const u16 *);
void AP_ExecDummyFrame(struct APHandle *);
void AP_Init(struct APHandle *, const u16 *, u16);
struct APHandle * AP_Find(const u16 * definition);
ProcPtr APProc_Create(const void * apDefinition, int xPos, int yPos, int tileBase, int anim, int aObjNode);
void APProc_OnUpdate(struct APProc * proc);
void APProc_OnEnd(struct APProc * proc);
void APProc_SetParameters(struct APProc * proc, int x, int y, int tileBase);
void APProc_Delete(struct APProc * proc);
void APProc_DeleteAll(void);
bool APProc_Exists(void);

#define ResetSpriteAnimClock(anim) \
    (anim)->frameTimer = 0; \
    (anim)->frameInterval = 0x100

#define FreezeSpriteAnim(anim) \
    (anim)->frameTimer = 0; \
    (anim)->frameInterval = 0

extern struct ProcCmd CONST_DATA ProcScr_ApProc[];
extern u8 CONST_DATA sOamTileSizeLut[];
// extern struct APHandle sAPArray[AP_MAX_COUNT];

#endif // GUARD_AP_H
