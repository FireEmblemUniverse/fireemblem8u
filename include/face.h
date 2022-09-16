#ifndef GUARD_FACE_H
#define GUARD_FACE_H

#include "proc.h"
#include "types.h"

struct FaceProc {
	PROC_HEADER;

	/* 2C */ const struct FaceData *pPortraitData;
	/* 30 */ u32 displayBits;
	/* 34 */ short xPosition;
	/* 36 */ short yPosition;
	/* 38 */ const void* pObjData;
	/* 3C */ u16 tileData;
	/* 3E */ u16 portraitIndex;
	/* 40 */ u8 faceSlotIndex;
	/* 41 */ u8 objectDepth;

	/* 44 */ ProcPtr _pu44Proc;
	/* 48 */ ProcPtr pEyeWinkProc;
};

extern struct FaceProc *gFaceProcs[4];

#endif /* GUARD_FACE_H */
