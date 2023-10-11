#ifndef GUARD_GAMECONTROL_H
#define GUARD_GAMECONTROL_H

enum game_ctrl_proc_lable {
    LGAMECTRL_GAME_INTRO_UI = 0,
    LGAMECTRL_OP_ANIM = 1,
    LGAMECTRL_CLASS_REEL = 2,

    LGAMECTRL_TITLE_DIRECT = 4,
    LGAMECTRL_EXEC_SAVEMENU = 5,

    LGAMECTRL_EXEC_BM = 7,

    LGAMECTRL_POST_NORMAL_CHAPTER = 9,
    LGAMECTRL_POST_EXTRA_MAP = 10,

    LGAMECTRL_EXEC_BM_ = 15,

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
void GameControl_8009A58(struct GameCtrlProc *);
void GameControl_8009A60_Null(ProcPtr);
void EndProcIfNotMarkedB(ProcPtr proc);
void sub_8009A84(ProcPtr proc);
void sub_8009ABC(ProcPtr proc);
void sub_8009AD8(ProcPtr proc);
void GameControl_PostIntro(struct GameCtrlProc * proc);
void sub_8009B64(struct GameCtrlProc * proc);
void GameControl_SwitchPostSaveMenu(struct GameCtrlProc * proc);
void sub_8009C1C(struct GameCtrlProc * proc);
void sub_8009C34(struct GameCtrlProc * proc);
void sub_8009C40(struct GameCtrlProc * proc);
void sub_8009C5C(struct GameCtrlProc * proc);
void GameCtrlStartExtraMap(ProcPtr proc);
void sub_8009CC0(ProcPtr proc);
void GameControl_PostChapterSwitch(struct GameCtrlProc*);
void sub_8009D1C(struct GameCtrlProc *);
void sub_8009D44(struct GameCtrlProc *);
void GameControlHandlePostNormalOrExtraChapter(struct GameCtrlProc *);
void GameControl_ChapterSwitch(struct GameCtrlProc *);
void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc *);
void GameCtrlStartIntroMonologue(struct GameCtrlProc *);
void sub_8009E28(ProcPtr);
void sub_8009E54(ProcPtr proc);
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
void nullsub_RestartGameAndGoto7(void);
void nullsub_9();
void GameControl_EnableSoundEffects(ProcPtr);
void sub_8009FF8(ProcPtr proc);

extern struct ProcCmd gProcScr_GameControl[];

#endif  // GUARD_GAMECONTROL_H
