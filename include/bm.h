#ifndef GUARD_BM_H
#define GUARD_BM_H


void OnVBlank(void);
void OnGameLoopMain(void);
void LockGame(void);
void UnlockGame(void);
u8 GetGameLock(void);
void SwitchPhases(void);
int CallBeginningEvents(void);
int BmMain_ChangePhase(void);
bool sub_8015434(void);
void BmMain_StartPhase(ProcPtr proc);
void BmMain_ResumePlayerPhase(ProcPtr proc);
int BmMain_UpdateTraps(ProcPtr proc);
void BmMain_SuspendBeforePhase(void);
void BmMain_StartIntroFx(ProcPtr proc);
void UndeployEveryone(void);
void GotoChapterWithoutSave(u16 chapterId);
void sub_80155C4(void);
void InitBmBgLayers(void);
void LoadObjUIGfx(void);
void sub_80156BC(void);
void sub_80156D4(void);
void ReadGameSaveCoreGfx(void);
void HandleMapCursorInput(u16 keys);
void HandleMoveMapCursor(int step);
void HandleMoveCameraWithMapCursor(int step);
u16 GetCameraAdjustedX(int);
u16 GetCameraAdjustedY(int);
u16 GetCameraCenteredX(int xMapCoord);
u16 GetCameraCenteredY(int yMapCoord);
void PutMapCursor(int x, int y, int kind);
// ??? sub_8015B88(???);
void SetCursorMapPosition(int, int);
void UpdateStatArrowSprites(int, int, u8);
// ??? CamMove_OnInit(???);
// ??? CamMove_OnLoop(???);
void StoreAdjustedCameraPositions(int xIn, int yIn, int * xOut, int * yOut);
s8 sub_8015D84(ProcPtr parent, int x, int y);
s8 EnsureCameraOntoPosition(ProcPtr p, int x, int y);
s8 IsCameraNotWatchingPosition(int x, int y);
s8 CameraMove_8015EDC(ProcPtr parent);
// ??? UnkMapCursor_OnLoop(???);
// ??? sub_8015F90(???);
int GetCurrentMapMusicIndex(void);
void StartMapSongBgm(void);
// ??? sub_80160E0(???);
// ??? sub_801613C(???);
// ??? sub_8016140(???);

extern struct ProcCmd CONST_DATA gProc_BMapMain[];
extern struct ProcCmd CONST_DATA gProcScr_CamMove[];

#endif // GUARD_BM_H