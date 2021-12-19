#ifndef GUARD_BM_PATH_ARROW_DISP_H
#define GUARD_BM_PATH_ARROW_DISP_H

// I think this may be a proc struct because of the way it's accessed - but I
// haven't yet found it going into the proc API so this could be wrong.
struct PathArrowProc
{
    PROC_HEADER;
    s8 lastX;
    s8 lastY;
    s8 maxMov;
    s8 pathLen;
    /* 0x2d */ s8 pathX[20];
    /* 0x41 */ s8 pathY[20];
    /* 0x55 */ s8 pathCosts[20];
};
struct Unknown_0859DBA0 {
    struct PathArrowProc *proc;
};
extern struct Unknown_0859DBA0 gUnknown_0859DBA0;

extern u16 gPathArrowOAMTable[5][5];

void SetLastCoords(u16 x, u16 y);
void CutOffPathLength(s8 newIndex);
void AddPointToPathArrowProc(s8 x, s8 y);
s32 GetPointAlongPath(s8 x, s8 y);
void GetPathFromMovementScript(void);
void GetMovementScriptFromPath(void);
void GenerateMovementMapForActiveUnit(void);
void ResetPathArrow(void);
bool8 PathContainsNoCycle(void);
void PathArrowDisp_Init(u8 a);
void UpdatePathArrowWithCursor(void);
u8 GetDirectionOfPathBeforeIndex(u8 i);
u8 GetDirectionOfPathAfterIndex(u8 i);
u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound);
void DrawPathArrow(void);
void DrawUpdatedPathArrow(void);

#endif // GUARD_BM_PATH_ARROW_DISP_H
