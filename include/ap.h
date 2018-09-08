#ifndef GUARD_AP_H
#define GUARD_AP_H


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


void AP_ClearAll();
struct APHandle* AP_Create(const void* apDefinition, u16 aObjNode);
// ??? AP_Delete(???);
// ??? AP_Update(???);
void AP_Display(struct APHandle*, int, int);
s8   AP_ExecFrame(struct APHandle*);
void AP_QueueObjRotScale(struct APHandle*);
void AP_SwitchAnimation(struct APHandle* handle, int index);
// ??? AP_SetDefinition(???);
void AP_QueueObjGraphics(struct APHandle*);
void AP_LoadDefinition(struct APHandle*, const u16*);
void AP_ExecDummyFrame(struct APHandle*);
void AP_Init(struct APHandle*, const u16*, u16);
struct APHandle* AP_Find(const u16* definition);
// ??? APProc_Create(???);
// ??? APProc_OnUpdate(???);
// ??? APProc_OnEnd(???);
// ??? APProc_SetParameters(???);
// ??? APProc_Delete(???);
// ??? APProc_DeleteAll(???);
// ??? APProc_Exists(???);

#endif // GUARD_AP_H
