#include "ap.h"

#define AP_MAX_COUNT 0x14 // 20

static struct APHandle sAPArray[AP_MAX_COUNT];

struct APHandle* TCS_Alloc(const u16* definition);
void TCS_Init(struct APHandle*, const u16*, u16);
void TCS_RegisterGraphics(struct APHandle*, int, int);
s8   TCS_Exec(struct APHandle*);
void TCS_QueueRotScaleData(struct APHandle*);
void TCS_QueueTileGfx(struct APHandle*);
void TCS_ExecOneFrame(struct APHandle*);
void TCS_Load(struct APHandle*, const u16*);

void TCS_ClearAll(void) {
	struct APHandle* it;

	const struct APHandle* base = sAPArray;
	const void*  nullDefinition = NULL;

	it = sAPArray + AP_MAX_COUNT - 1;

	do {
		(it--)->pDefinition = nullDefinition;
	} while ((int)it >= (int)base); // casts are needed for match
}

struct APHandle* TCS_New(const void* apDefinition, u16 aObjNode) {
	struct APHandle* result;

	if (!(result = TCS_Alloc(NULL)))
		return NULL;

	TCS_Init(result, apDefinition, aObjNode);
	return result;
}

void TCS_Free(struct APHandle* handle) {
	if (handle && handle->pDefinition)
		handle->pDefinition = NULL;
}

s8 TCS_Update(struct APHandle* handle, int x, int y) {
	if (!handle || !handle->pDefinition)
		return FALSE;
	
	TCS_RegisterGraphics(handle, x, y);
	return TCS_Exec(handle);
}

void TCS_RegisterGraphics(struct APHandle* handle, int x, int y) {
	int rotScaleMask = 0;

	if (!handle || !handle->pDefinition)
		return;

	if (handle->pCurrentRotScale) {
		TCS_QueueRotScaleData(handle);
		rotScaleMask = (handle->rotScaleIndex << 9);
	}

	RegisterObjectAttributes(
		handle->objLayer,
		x | rotScaleMask, y,
		handle->pCurrentObjData,
		handle->tileBase
	);

	if (handle->pGraphics && handle->gfxNeedsUpdate)
		TCS_QueueTileGfx(handle);
}

s8 TCS_Exec(struct APHandle* handle) {
	int tmp; // needed to match

	if (!handle || !handle->pDefinition)
		return FALSE;
	
	if (!handle->frameInterval)
		return TRUE;
	
	// timer going down
	if (handle->frameTimer != 0) {
		if ((handle->frameTimer = handle->frameTimer-1) > 0)
			return TRUE;
		
		handle->frameTimer = 0;
		handle->pAnimDataCurrent += 2;
	}

	// handle animation end
	if (!handle->pAnimDataCurrent[0]) {
		switch (handle->pAnimDataCurrent[1]) {
		case (u16)(-1): // loop back to start
			handle->pAnimDataCurrent = handle->pAnimDataStart;
			return TCS_Exec(handle);
		
		case 1: // delete handle
			TCS_Free(handle);
		case 0: // end animation
			return FALSE;
		}
	}

	// Increasing the subframe clock
	tmp = (handle->pAnimDataCurrent[0] * handle->frameInterval);
	handle->subframeTimer += tmp;

	// Check if next frame wasn't reached yet
	if (handle->subframeTimer < 0x100) {
		handle->frameTimer = 1;
		return TCS_Exec(handle);
	}

	// Setting clock values depending on subframe clock
	handle->frameTimer    = (handle->subframeTimer >> 8);
	handle->subframeTimer = (handle->subframeTimer & 0xFF);

	// Setting new frame
	handle->pCurrentObjData = handle->pFrameData + handle->pFrameData[handle->pAnimDataCurrent[1]]/2;

	// Handling RotScale data (if any)
	if (handle->pCurrentObjData[0] & 0x8000) {
		handle->pCurrentRotScale  = handle->pCurrentObjData;
		handle->pCurrentObjData += (handle->pCurrentObjData[0] & 0x7FFF)*3 + 1;
	} else {
		handle->pCurrentRotScale = NULL;
	}

	// Gfx needs update
	handle->gfxNeedsUpdate = TRUE;
	return TRUE;
}

void TCS_QueueRotScaleData(struct APHandle* handle) {
	int i, count;
	const u16* it;

	if (!handle || !handle->pDefinition)
		return;
	
	if (!handle->pCurrentRotScale)
		return;
	
	count = handle->pCurrentRotScale[0] & 0x7FFF; // rotscale data count
	it    = handle->pCurrentRotScale + 1;         // rotscale data start

	for (i = 0; i < count; it += 3, i++) {
		WriteOAMRotScaleData(
			handle->rotScaleIndex + i,  // oam rotscale index

			Div(+COS(it[0])*16, it[1]), // pa
			Div(-SIN(it[0])*16, it[2]), // pb
			Div(+SIN(it[0])*16, it[1]), // pc
			Div(+COS(it[0])*16, it[2])  // pd
		);
	}
}

void TCS_SetAnim(struct APHandle* handle, int index) {
	const u16* animDataList;

	if (!handle || !handle->pDefinition)
		return;
	
	// anim data offset array is defined by there
	// its entries are offsets relative to the table itself
	animDataList = handle->pDefinition + handle->pDefinition[1]/2;

	handle->pAnimDataStart   = animDataList + animDataList[index]/2;
	handle->pAnimDataCurrent = handle->pAnimDataStart;

	TCS_ExecOneFrame(handle);
}

void TCS_SetROMTCS(struct APHandle* handle, const u16* definition) {
	if (!handle || !handle->pDefinition)
		return;
	
	TCS_Load(handle, definition);
	TCS_ExecOneFrame(handle);
}

// TODO: better (local const static variable?)
extern u8 gUnknown_085916A4[];

void TCS_QueueTileGfx(struct APHandle* handle) {
	const u16* itGfxData;
	const u16* itObjData;
	u32 tileOffset;
	int i;

	if (!handle || !handle->pDefinition)
		return;
	
	i = handle->pCurrentObjData[0];

	itObjData = handle->pCurrentObjData + 1;
	itGfxData = handle->pCurrentObjData + 1 + i*3;
	
	tileOffset = 0;

	// This expression is used a lot here, so using helper macro for readability
	#define OBJ_SIZE_TABLE_INDEX(aIt) ((((aIt[0] & 0xC000)>>12)+((aIt[1] & 0xC000)>>14))*2)

	while ((i--) > 0) {
		RegisterObjectTileGraphics(
			handle->pGraphics + (*itGfxData & 0x3FF) * 0x20,             // source location
			OBJ_VRAM0 + ((handle->tileBase & 0x3FF) * 0x20) + tileOffset, // target location
			gUnknown_085916A4[OBJ_SIZE_TABLE_INDEX(itObjData)+0],        // x size (tiles)
			gUnknown_085916A4[OBJ_SIZE_TABLE_INDEX(itObjData)+1]         // y size (tiles)
		);

		if (!gLCDControlBuffer.dispcnt.obj1dMap)
			// Adding (width * sizeof(Tile4bpp))
			tileOffset += (gUnknown_085916A4[OBJ_SIZE_TABLE_INDEX(itObjData)]) * 0x20;
		else
			// Using the square of the width here?
			// Maybe it's bugged, since I don't think the obj1dMap flag is ever set
			tileOffset += ((
				(gUnknown_085916A4[OBJ_SIZE_TABLE_INDEX(itObjData)]) *
				(gUnknown_085916A4[OBJ_SIZE_TABLE_INDEX(itObjData)])
			)& 0x3FF) * 0x20;

		itObjData += 3;
		itGfxData += 1;
	}

	#undef OBJ_SIZE_TABLE_INDEX

	handle->gfxNeedsUpdate = FALSE;
}

void TCS_Load(struct APHandle* handle, const u16* definition) {
	handle->pDefinition = definition;

	// frame data starts at offset in short 0
	handle->pFrameData = definition + (definition[0]/2);
	
	// anim offset array starts at offset in short 1
	// first entry is default anim index
	// anim data is located by indexing the anim offset array.
	// offset is relative to the anim offset array itself, not the definition!

	handle->pAnimDataStart = (
		(definition + definition[1]/2) +  // anim offset array
		(definition[definition[1]/2]/2)   // default anim offset array index
	);

	handle->pAnimDataCurrent = handle->pAnimDataStart;
}

void TCS_ExecOneFrame(struct APHandle* handle) {
	int tmp;

	// needed to match (and apparently even a thing in the source cf FE6:08013050)
	handle->frameTimer = 0;

	tmp = handle->frameInterval;

	// This sequence may have been a macro in the original source
	handle->frameTimer    = 0;
	handle->frameInterval = 0x100;

	TCS_Exec(handle);

	handle->frameInterval = tmp;
}

void TCS_Init(struct APHandle* handle, const u16* definition, u16 objLayer) {
	TCS_Load(handle, definition);

	handle->pGraphics  = NULL;
	handle->tileBase   = 0;
	handle->frameTimer = 0;

	handle->objLayer = objLayer;

	handle->pCurrentRotScale = NULL;
	handle->rotScaleIndex    = 0;

	// this is the second time this exact pattern shows. (Macro?)
	handle->frameTimer    = 0;
	handle->frameInterval = 0x100;

	handle->subframeTimer = 0;

	TCS_Exec(handle);
}

struct APHandle* TCS_Alloc(const u16* definition) {
	int i = 0;
	struct APHandle* result = sAPArray;

	for (i = 0; i < AP_MAX_COUNT; ++i) {
		if (result->pDefinition == definition)
			return result;
		
		result++;
	}

	return NULL;
}

struct APProc* TCSWrapper_New(const void* apDefinition, int xPos, int yPos, int tileBase, int anim, u16 aObjNode) {
	struct APHandle* handle;
	struct APProc* proc;

	// Setting up handle
	handle = TCS_New(apDefinition, aObjNode);
	TCS_SetAnim(handle, anim);
	handle->tileBase = tileBase;

	// Making Proc
	proc = (struct APProc*) Proc_Create(gUnknown_0859168C, ROOT_PROC_3);

	// Setting up proc
	proc->pHandle = handle;
	proc->xPosition = xPos;
	proc->yPosition = yPos;

	return proc;
}

void TCSWrapper_OnUpdate(struct APProc* proc) {
	// Update AP, and end proc if the AP was freed (aka the animation ended)
	if (!TCS_Update(proc->pHandle, proc->xPosition, proc->yPosition))
		if (!proc->pHandle || !proc->pHandle->pDefinition)
			Proc_Delete((struct Proc*) proc);
}

void TCSWrapper_OnDelete(struct APProc* proc) {
	// Free AP when proc ends
	TCS_Free(proc->pHandle);
}

void TCSWrapper_SetParameters(struct APProc* proc, int x, int y, int tileBase) {
	// Set position
	proc->xPosition = x;
	proc->yPosition = y;

	// Set tile base if asked to
	if (tileBase != -1)
		proc->pHandle->tileBase = tileBase;
}

void TCSWrapper_Delete(struct APProc* proc) {
	// delet
	Proc_Delete((struct Proc*) proc);
}

void DeleteAllTCSWrappers(void) {
	// delet all
	Proc_DeleteAllWithScript(gUnknown_0859168C);
}

int DoesTCSWrapperExist(void) {
	return Proc_Find(gUnknown_0859168C) ? TRUE : FALSE;
}
