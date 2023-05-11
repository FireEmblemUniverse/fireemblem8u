#ifndef GUARD_BM_H
#define GUARD_BM_H


void OnVBlank(void);
void OnGameLoopMain(void);
void LockGame(void);
void UnlockGame(void);
u8 GetGameLock(void);
// ??? SwitchPhases(???);
// ??? CallBeginningEvents(???);
// ??? BmMain_ChangePhase(???);
// ??? sub_8015434(???);
// ??? BmMain_StartPhase(???);
// ??? BmMain_ResumePlayerPhase(???);
// ??? BmMain_UpdateTraps(???);
// ??? BmMain_SuspendBeforePhase(???);
// ??? BmMain_StartIntroFx(???);
// ??? UndeployEveryone(???);
// ??? GotoChapterWithoutSave(???);
// ??? sub_80155C4(???);
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
// ??? StoreAdjustedCameraPositions(???);
// ??? sub_8015D84(???);
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