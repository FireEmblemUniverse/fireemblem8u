#ifndef GUARD_BM_H
#define GUARD_BM_H

enum {
    CAMERA_MARGIN_LEFT   = 16 * 3,
    CAMERA_MARGIN_RIGHT  = 16 * 11,
    CAMERA_MARGIN_TOP    = 16 * 2,
    CAMERA_MARGIN_BOTTOM = 16 * 7,
};

struct CamMoveProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ struct Vec2 watchedCoordinate;
    /* 38 */ s16 calibration;
    /* 3A */ s16 distance;
    /* 3C */ int frame;
    /* 40 */ s8 xCalibrated;
};

struct UnkMapCursorProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Vec2 to;
    /* 30 */ struct Vec2 from;
    /* 34 */ int clock;
    /* 38 */ int duration;
};

void OnVBlank(void);
void OnMain(void);
void LockGame(void);
void UnlockGame(void);
u8 GetGameLock(void);
void SwitchPhases(void);
int CallBeginningEvents(void);
int BmMain_ChangePhase(void);
bool BmMain_CheckBeginPhaseEvent(void);
void BmMain_StartPhase(ProcPtr proc);
void BmMain_ResumePlayerPhase(ProcPtr proc);
int BmMain_UpdateTraps(ProcPtr proc);
void BmMain_SuspendBeforePhase(void);
void BmMain_StartIntroFx(ProcPtr proc);
void UndeployEveryone(void);
void GotoChapterWithoutSave(u16 chapterId);
void BmMain_BeginNextChapter(void);
void InitBmBgLayers(void);
void LoadObjUIGfx(void);
void ApplySystemObjectsPalettes(void);
void LoadGameCoreGfxLegacyFrame(void);
void ReadGameSaveCoreGfx(void);
void HandleMapCursorInput(u16 keys);
void HandleMoveMapCursor(int step);
void HandleMoveCameraWithMapCursor(int step);
u16 GetCameraAdjustedX(int);
u16 GetCameraAdjustedY(int);
u16 GetCameraCenteredX(int xMapCoord);
u16 GetCameraCenteredY(int yMapCoord);
void PutMapCursor(int x, int y, int kind);
void DisplayBmTextShadow(int x, int y);
void SetCursorMapPosition(int, int);
void UpdateStatArrowSprites(int, int, u8);
void CamMove_OnInit(struct CamMoveProc * proc);
void CamMove_OnLoop(struct CamMoveProc * proc);
void StoreAdjustedCameraPositions(int xIn, int yIn, int * xOut, int * yOut);
s8 EnsureCameraCenteredOnPosition(ProcPtr parent, int x, int y);
s8 EnsureCameraOntoPosition(ProcPtr p, int x, int y);
s8 IsCameraNotWatchingPosition(int x, int y);
s8 CameraMove_0(ProcPtr parent);
void UnkMapCursor_OnLoop(struct UnkMapCursorProc * proc);
void StartMapCursorSlide(int x, int y, int duration);
int GetCurrentMapMusicIndex(void);
void StartMapSongBgm(void);
void CamMoveLinear_OnLoop(struct CamMoveProc * proc);
void CamMoveLinear_OnEnd(void);
void StartCamMoveLinear(ProcPtr parent, int x, int y, int distance);

extern struct ProcCmd CONST_DATA gProc_BMapMain[];
extern struct ProcCmd CONST_DATA ProcScr_CamMove[];
extern struct ProcCmd gProcScr_ResetCursorPosition[];
extern struct ProcCmd ProcScr_PhaseIntro[];
extern struct ProcCmd gProcScr_ChapterIntroTitleOnly[];

#endif // GUARD_BM_H
