#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/event-flags.h"

extern u16 EventScr_8A0035C[];
extern u16 EventScr_8A00364[];
extern u16 EventScr_EirikaModeGameEnd[];
extern u16 EventScr_EphraimModeGameEnd[];

extern struct ProcCmd CONST_DATA ProcScr_GameEarlyStartUI[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA ProcScr_OpAnim[]; // intro cutscene
extern struct ProcCmd CONST_DATA gProcScr_WorldMapWrapper[];

struct ProcCmd CONST_DATA gUnused_085916BC[] =
{
    PROC_CALL(GameControl_8009A58),
    PROC_REPEAT(GameControl_8009A60_Null),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_GameControl[] =
{
    PROC_NAME("GAMECTRL"),
    PROC_MARK(PROC_MARK_B),

    PROC_15,
    PROC_CALL(GameControl_CallEraseSaveEventWithKeyCombo),
    PROC_CALL(GameControl_8009A58),
    PROC_REPEAT(GameControl_8009A60_Null),

    // fallthrough

PROC_LABEL(LGAMECTRL_GAME_INTRO_UI),
    PROC_START_CHILD_BLOCKING(ProcScr_GameEarlyStartUI),

    // fallthrough

PROC_LABEL(LGAMECTRL_OP_ANIM),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_START_CHILD_BLOCKING(ProcScr_OpAnim),
    PROC_CALL(GameControl_PostIntro),
    PROC_YIELD,
    PROC_GOTO(4),

PROC_LABEL(LGAMECTRL_CLASS_REEL),
    PROC_CALL_2(GamceControl_StartClassReel),
    PROC_CALL(sub_8009B64),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(3),
    PROC_YIELD,
    PROC_CALL(sub_8009A84),
    PROC_CALL(sub_8009B64),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(LGAMECTRL_TITLE_DIRECT),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_WithMusic),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(24),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagTrue),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(25),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagFalse),
    PROC_GOTO(LGAMECTRL_POST_TITLE_IDLE),

PROC_LABEL(LGAMECTRL_POST_TITLE_IDLE),
    PROC_YIELD,
    PROC_CALL(GameControl_PostIntro),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_OP_ANIM),

PROC_LABEL(LGAMECTRL_EXEC_SAVEMENU),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(Make6C_SaveMenuNewGame),
    PROC_YIELD,
    PROC_CALL(GameControl_SwitchPostSaveMenu),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(LGAMECTRL_EXEC_BM_EXT),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_YIELD,
    PROC_CALL(StartBattleMap),
    PROC_YIELD,
    PROC_GOTO(9),

PROC_LABEL(LGAMECTRL_EXEC_BM),
    PROC_CALL(GameCtrl_CheckNewGameAndBranch),
    PROC_CALL(GameCtrl_CheckGameCompleteAndBranch),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(GameCtrlStartIntroMonologue),
    PROC_YIELD,
    PROC_START_CHILD_BLOCKING(gProcScr_WorldMapWrapper),
    PROC_CALL(EndWM),
    PROC_CALL(sub_8009E28),
    PROC_YIELD,
    PROC_CALL(StartBattleMap),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(LGAMECTRL_POST_NORMAL_CHAPTER),
    PROC_YIELD,

    PROC_CALL(GameControl_PostChapterSwitch),
    PROC_YIELD,
    PROC_CALL(GameControl_RestoreChapterId),

    // fallthrough

PROC_LABEL(19),
    PROC_CALL(GameControl_ChapterSwitch),
    PROC_CALL(GameControl_CallPostChapterSaveMenu),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(8),
    PROC_CALL(sub_8009E28),
    PROC_CALL(GameCtrl_StartResumedGame),
    PROC_YIELD,
    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(GameControlHandlePostNormalOrExtraChapter),

    PROC_GOTO(9),

PROC_LABEL(14),
    PROC_YIELD,
    // fallthrough

PROC_LABEL(LGAMECTRL_POST_EXTRA_MAP),
    PROC_YIELD,
    PROC_GOTO(LGAMECTRL_TITLE_DIRECT),

PROC_LABEL(LGAMECTRL_EXEC_BM_),
    PROC_GOTO(LGAMECTRL_EXEC_BM),

PROC_LABEL(12),
    PROC_CALL(sub_80481E0),
    PROC_YIELD,
    PROC_CALL(sub_8009ABC),
    PROC_GOTO(LGAMECTRL_EXEC_SAVEMENU),

PROC_LABEL(16),
    PROC_CALL(ClearTemporaryUnits),
    PROC_CALL(GameCtrl_DeclareCompletedChapter),
    PROC_CALL(Make6C_SaveMenuPostChapter),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(LGAMECTRL_EXEC_ENDING_SCENE),
    PROC_CALL(GameCtrl_SavePlayThroughData),

    PROC_CALL(CallGameEndingEvent),
    PROC_YIELD,

    PROC_WHILE(EventEngineExists),

    PROC_CALL(StartFinScreen),
    PROC_CALL(_SetGameEndFlag),

    PROC_SLEEP(30),

    PROC_GOTO(4),

PROC_LABEL(LGAMECTRL_ERASE_SAVE),
    PROC_CALL(GameControl_CallEraseMural),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(CallEraseSaveEvent),
    PROC_WHILE(EventEngineExists),
    PROC_YIELD,
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(EndMuralBackground),
    PROC_GOTO(LGAMECTRL_GAME_INTRO_UI),

    PROC_END,
};

int GetRealChaperIndex(int chapterId)
{

    switch (chapterId) {
    case 0x02:
        return 1;

    case 0x03:
        return 2;

    case 0x04:
        return 3;

    case 0x05:
    case 0x06:
        return 4;

    case 0x07:
        return 5;

    case 0x08:
        return 6;

    case 0x09:
    case 0x38:
        return 7;

    case 0x0A:
    case 0x17:
        return 8;

    case 0x0B:
    case 0x18:
        return 9;

    case 0x0C:
    case 0x19:
    case 0x3D:
    case 0x3E:
        return 10;

    case 0x0D:
    case 0x1A:
        return 11;

    case 0x0E:
    case 0x1B:
        return 12;

    case 0x0F:
    case 0x1C:
        return 13;

    case 0x10:
    case 0x1D:
        return 14;

    case 0x11:
    case 0x1E:
        return 15;

    case 0x12:
    case 0x1F:
        return 16;

    case 0x13:
    case 0x20:
        return 17;

    case 0x14:
    case 0x21:
        return 18;

    case 0x15:
    case 0x16:
    case 0x22:
    case 0x23:
        return 19;

    case 0x00:
    case 0x01:
    default:
        return 0;
    }
}

u8 GetTitleClassReelSet(void)
{
    int furthestChapter;
    int chapter;
    int i;
    struct PlaySt chapterData;

    if (GetGlobalCompletionCount() != 0)
        return 9;

    furthestChapter = 0;

    for (i = 0; i < 3; i++)
    {
        if (IsSaveValid(i) == 0)
            continue;

        ReadGameSavePlaySt(i, &chapterData);

        if (chapterData.unk_2C_2 != 0)
            return 9;

        chapter = GetRealChaperIndex(chapterData.chapterIndex);

        if (furthestChapter < chapter)
            furthestChapter = chapter;
    }

    if (furthestChapter > 17)
        return 8;
    else if (furthestChapter > 15)
        return 7;
    else if (furthestChapter > 13)
        return 6;
    else if (furthestChapter > 11)
        return 5;
    else if (furthestChapter > 9)
        return 4;
    else if (furthestChapter > 7)
        return 3;
    else if (furthestChapter > 5)
        return 2;
    else if (furthestChapter > 3)
        return 1;

    return 0;
}

bool GamceControl_StartClassReel(ProcPtr proc)
{
    StartClassReel(GetTitleClassReelSet(), proc);
    return false;
}

void GameControl_CallEraseSaveEventWithKeyCombo(ProcPtr proc)
{
    if (gKeyStatusPtr->heldKeys == (L_BUTTON | DPAD_RIGHT | SELECT_BUTTON))
        Proc_Goto(proc, LGAMECTRL_ERASE_SAVE);
}

void GameControl_CallEraseMural(ProcPtr proc)
{
    SetupBackgrounds(0);
    sub_80156D4();
    gPlaySt.config.textSpeed = 1;
    StartMuralBackground(PROC_TREE_3, 0, -1);
}

void GameControl_8009A58(struct GameCtrlProc * proc)
{
    proc->unk_2E = 20;
}

void GameControl_8009A60_Null(ProcPtr proc)
{
    Proc_Break(proc);
}

void EndProcIfNotMarkedB(ProcPtr proc)
{
    if (((struct Proc*)proc)->proc_mark != PROC_MARK_B)
        Proc_End(proc);
}

void sub_8009A84(ProcPtr proc)
{
    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
    Proc_ForAll(EndProcIfNotMarkedB);
    SetMainUpdateRoutine(OnGameLoopMain);
}

void sub_8009ABC(ProcPtr proc)
{
    StartBgmCore(0x43, 0);
    StartBgmVolumeChange(0, 0xC0, 0x3C, 0);
}


void sub_8009AD8(ProcPtr proc)
{
    StartBgmVolumeChange(0x100, 0xC0, 0x20, 0);
}

void GameControl_PostIntro(struct GameCtrlProc * proc)
{
    int tmp;

    switch (proc->nextAction) {
    case GAME_ACTION_USR_SKIPPED:
        Proc_Goto(proc, LGAMECTRL_TITLE_DIRECT);
        break;

    case GAME_ACTION_EVENT_RETURN:
        Proc_Goto(proc, LGAMECTRL_EXEC_SAVEMENU);
        sub_8009AD8(proc);
        break;

    case GAME_ACTION_CLASS_REEL:
        tmp = proc->idle_status;
        switch (tmp & 1) {
        case 0:
            Proc_Goto(proc, LGAMECTRL_CLASS_REEL);
            break;

        case 1:
            Proc_Goto(proc, LGAMECTRL_OP_ANIM);
            break;
        }

        proc->idle_status++;
        break;

    case GAME_ACTION_PLAYED_THROUGH:
        Proc_Goto(proc, 24);
        break;
    }
}

void sub_8009B64(struct GameCtrlProc * proc)
{
    switch (proc->nextAction) {
    case GAME_ACTION_EVENT_RETURN:
        Proc_Goto(proc, LGAMECTRL_TITLE_DIRECT);
        break;

    case GAME_ACTION_CLASS_REEL:
        Proc_Goto(proc, LGAMECTRL_OP_ANIM);
        break;
    }
}

void GameControl_SwitchPostSaveMenu(struct GameCtrlProc * proc)
{
    switch (proc->nextAction) {
    case GAME_ACTION_EVENT_RETURN:
        GmDataInit();

        // fallthrough

    case GAME_ACTION_CLASS_REEL:
    case GAME_ACTION_USR_SKIPPED:
    case GAME_ACTION_PLAYED_THROUGH:
        Proc_Goto(proc, LGAMECTRL_EXEC_BM);
        return;

    case GAME_ACTION_4:
        Proc_Goto(proc, 8);
        return;

    case GAME_ACTION_5:
        Proc_Goto(proc, 25);
        return;

    case GAME_ACTION_6:
        Proc_Goto(proc, 12);
        return;

    case GAME_ACTION_EXTRA_MAP:
        Proc_Goto(proc, 14);
        return;

    case GAME_ACTION_C:
        Proc_Goto(proc, 15);
        return;

    case GAME_ACTION_8:
    case GAME_ACTION_9:
    case GAME_ACTION_A:
    case GAME_ACTION_B:
    default:
        return;
    }

    return;
}

void sub_8009C1C(struct GameCtrlProc * proc)
{
    if (proc->nextAction == GAME_ACTION_5)
        Proc_Goto(proc, LGAMECTRL_TITLE_DIRECT);
}

void sub_8009C34(struct GameCtrlProc * proc)
{
    Proc_Goto(proc, LGAMECTRL_TITLE_DIRECT);
}

void sub_8009C40(struct GameCtrlProc * proc)
{
    if (proc->nextAction == GAME_ACTION_EVENT_RETURN)
        return;

    if (proc->nextAction == GAME_ACTION_CLASS_REEL)
        Proc_Goto(proc, 19);
}

void sub_8009C5C(struct GameCtrlProc * proc)
{
    if (proc->nextAction == GAME_ACTION_5)
    {
        Proc_Goto(proc, 5);
        return;
    }

    InitPlayConfig(0, 0);
    gPlaySt.chapterStateBits |= PLAY_FLAG_TUTORIAL;
    ResetPermanentFlags();
    ResetChapterFlags();
    InitUnits();
    gPlaySt.chapterIndex = proc->nextChapter;
}

void GameCtrlStartExtraMap(ProcPtr proc)
{
    NullBmMapHidden_();
    ClearPidStats();
    ChapterChangeUnitCleanup();
    gPlaySt.chapterIndex = 0x7F;

}

void sub_8009CC0(ProcPtr proc)
{
    InvalidateSuspendSave(SAVE_ID_SUSPEND);
    gPlaySt.config.disableBgm = 0;
}

void GameControl_PostChapterSwitch(struct GameCtrlProc* proc) {

    MU_EndAll();

    switch (proc->nextAction) {
    case GAME_ACTION_EVENT_RETURN:
        Proc_Goto(proc, LGAMECTRL_TITLE_DIRECT);
        break;

    case GAME_ACTION_PLAYED_THROUGH:
        Proc_Goto(proc, 16);
        break;

    case GAME_ACTION_CLASS_REEL:
    case GAME_ACTION_USR_SKIPPED:
    default:
        break;
    }

    return;
}

void GameCtrl_CheckNewGameAndBranch(struct GameCtrlProc* proc) {
    if ((gPlaySt.save_menu_type == 2) || (gPlaySt.save_menu_type == 4)) {
        Proc_Goto(proc, LGAMECTRL_EXEC_BM_EXT);
    }

    return;
}

void GameCtrl_CheckGameCompleteAndBranch(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        return;
    }

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)) {
        return;
    }

    Proc_Goto(proc, LGAMECTRL_EXEC_ENDING_SCENE);

    return;
}

void GameControlHandlePostNormalOrExtraChapter(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        Proc_Goto(proc, 10);
    else
        Proc_Goto(proc, 9);
}

void GameControl_ChapterSwitch(struct GameCtrlProc* proc) {
    int i;

    for (i = 0; i <= 2; i++) {
        NextRN();
    }

    StoreRNState(gGmMonsterRnState);

    if (CheckFlag(3) != 0) {
        RegisterChapterTimeAndTurnCount(&gPlaySt);
    }

    ComputeChapterRankings();

    gPlaySt.chapterIndex = proc->nextChapter;

    ChapterChangeUnitCleanup();

    return;
}

void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterIndex != 0x38) {
        Make6C_SaveMenuPostChapter(proc);
    }

    return;
}

void GameCtrlStartIntroMonologue(struct GameCtrlProc * proc)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
        return;

    if (gPlaySt.chapterIndex != 0)
        return;

    StartIntroMonologue(proc);
}

void sub_8009E28(ProcPtr proc)
{
    SetBlendConfig(3, 0, 0, 16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

void sub_8009E54(ProcPtr proc)
{
    SetupBackgrounds(0);

    switch (gPlaySt.chapterModeIndex) {
        case 2:
            CallEvent(EventScr_8A0035C, EV_EXEC_CUTSCENE);
            break;

        case 3:
            CallEvent(EventScr_8A00364, EV_EXEC_CUTSCENE);
            break;
    }

    SetFlag(EVFLAG_HIDE_BLINKING_ICON);

    return;
}

void CallGameEndingEvent(ProcPtr proc) {
    StartBattleMap(proc);

    sub_80141B0();

    switch (gPlaySt.chapterModeIndex) {
        case 2:
            CallEvent(EventScr_EirikaModeGameEnd, EV_EXEC_CUTSCENE);
            break;

        case 3:
            CallEvent(EventScr_EphraimModeGameEnd, EV_EXEC_CUTSCENE);
            break;
    }

    SetFlag(EVFLAG_HIDE_BLINKING_ICON);

    return;
}

void GameControl_RememberChapterId(struct GameCtrlProc * proc)
{
    proc->ch_index = gPlaySt.chapterIndex;
}

void GameControl_RestoreChapterId(struct GameCtrlProc * proc)
{
    gPlaySt.chapterIndex = proc->ch_index;
}

void _SetGameEndFlag(ProcPtr proc)
{
    SetGameEndFlag();
}

void StartGame(void)
{
    struct GameCtrlProc* proc;

    SetMainUpdateRoutine(OnGameLoopMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    proc = Proc_Start(gProcScr_GameControl, PROC_TREE_3);
    proc->nextAction = GAME_ACTION_EVENT_RETURN;
    proc->nextChapter = 0;
    proc->idle_status = 0;
}

struct GameCtrlProc * GetGameControl()
{
    return Proc_Find(gProcScr_GameControl);
}

void SetNextGameActionId(int id) {
    struct GameCtrlProc* proc = GetGameControl();

    proc->nextAction = id;

    return;
}

void SetNextChapterId(int id) {
    struct GameCtrlProc* proc = GetGameControl();

    proc->nextChapter = id;

    return;
}

s8 HasNextChapter()
{
    struct GameCtrlProc* proc = GetGameControl();
    return proc->nextChapter == 0 ? 0 : 1;
}

void RestartGameAndGoto8() {
    struct GameCtrlProc* proc;

    Proc_EndEach(gProcScr_GameControl);

    proc = Proc_Start(gProcScr_GameControl, PROC_TREE_3);

    Proc_Goto(proc, 8);

    return;
}

void RestartGameAndGoto12() {
    struct GameCtrlProc* proc;

    Proc_EndEach(gProcScr_GameControl);

    proc = Proc_Start(gProcScr_GameControl, PROC_TREE_3);

    Proc_Goto(proc, 18);

    return;
}

void nullsub_RestartGameAndGoto7(void) {
    return;
}

void nullsub_9()
{
    return;
}

void GameControl_EnableSoundEffects(ProcPtr proc)
{
    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 0;
}

void sub_8009FF8(ProcPtr proc)
{

    gPlaySt.config.animationType = 0;
    gPlaySt.config.textSpeed = 1;
    gPlaySt.config.gameSpeed = 0;
    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 1;
    gPlaySt.config.windowColor = 0;
    gPlaySt.config.unitColor = 0;
}
