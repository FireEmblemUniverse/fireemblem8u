#ifndef GUARD_GAMECONTROL_H
#define GUARD_GAMECONTROL_H

enum game_ctrl_proc_lable {
    LGAMECTRL_GAME_INTRO_UI = 0,
    LGAMECTRL_OP_ANIM = 1,
    LGAMECTRL_CLASS_REEL = 2,

    LGAMECTRL_TITLE_DIRECT = 4,
    LGAMECTRL_EXEC_SAVEMENU = 5,

    LGAMECTRL_EXEC_BM_EXT = 6,  /* Directly goto bmmap */
    LGAMECTRL_EXEC_BM = 7,      /* Judge on game-start or game end */

    LGAMECTRL_POST_NORMAL_CHAPTER = 9,
    LGAMECTRL_POST_EXTRA_MAP = 10,

    LGAMECTRL_EXEC_BM_ = 15,

    LGAMECTRL_EXEC_ENDING_SCENE = 17,

    LGAMECTRL_ERASE_SAVE = 18,
    LGAMECTRL_POST_TITLE_IDLE = 26
};

struct GameCtrlProc {
    PROC_HEADER;

    /* 29 */ u8 nextAction;
    /* 2A */ u8 nextChapter;
    /* 2B */ u8 idle_status;
    /* 2C */ u8 unk_2C;

    /* 2E */ u16 unk_2E;
    /* 30 */ u8 ch_index;
};

int GetRealChaperIndex(int chapterId);
u8 GetTitleClassReelSet(void);
bool GamceControl_StartClassReel(ProcPtr proc);
void GameControl_CallEraseSaveEventWithKeyCombo(ProcPtr proc);
void GameControl_CallEraseMural(ProcPtr);
void GameControl_0(struct GameCtrlProc *);
void GameControl_Null_0(ProcPtr);
void EndProcIfNotMarkedB(ProcPtr proc);
void GameControl_ClearPaletteAndReset(ProcPtr proc);
void GameControl_StartMainTheme(ProcPtr proc);
void GameControl_FadeBgmVolume(ProcPtr proc);
void GameControl_PostIntro(struct GameCtrlProc * proc);
void GameControl_PostClassReel(struct GameCtrlProc * proc);
void GameControl_SwitchPostSaveMenu(struct GameCtrlProc * proc);
void GameControl_GotoTitleIfAction5(struct GameCtrlProc * proc);
void GameControl_GotoTitle(struct GameCtrlProc * proc);
void GameControl_GotoChapterSwitchIfClassReel(struct GameCtrlProc * proc);
void GameControl_InitTutorialGame(struct GameCtrlProc * proc);
void GameCtrlStartExtraMap(ProcPtr proc);
void GameControl_InvalidateSuspendSave(ProcPtr proc);
void GameControl_PostChapterSwitch(struct GameCtrlProc*);
void GameCtrl_CheckNewGameAndBranch(struct GameCtrlProc *);
void GameCtrl_CheckGameCompleteAndBranch(struct GameCtrlProc *);
void GameControlHandlePostNormalOrExtraChapter(struct GameCtrlProc *);
void GameControl_ChapterSwitch(struct GameCtrlProc *);
void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc *);
void GameCtrlStartIntroMonologue(struct GameCtrlProc *);
void GameControl_SetupBackdropBlend(ProcPtr);
void GameControl_StartRuinEvent(ProcPtr proc);
void CallGameEndingEvent(ProcPtr);
void GameControl_RememberChapterId(struct GameCtrlProc *);
void GameControl_RestoreChapterId(struct GameCtrlProc *);
void _SetGameEndFlag(ProcPtr);
void StartGame(void);
struct GameCtrlProc * GetGameControl();
void SetNextGameActionId(int id);
void SetNextChapterId(int id);
s8 HasNextChapter();
void RestartGameAndGoto8(void);
void RestartGameAndGoto12(void);
void RestartGameAndGoto7(void);
void Nop_Gamecontrol_0();
void GameControl_EnableSoundEffects(ProcPtr);
void GameControl_ResetPlayConfig(ProcPtr proc);

extern struct ProcCmd gProcScr_GameControl[];

#endif  // GUARD_GAMECONTROL_H
