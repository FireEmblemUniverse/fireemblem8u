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

#include "gamecontrol.h"

extern u16 gEvent_8A0035C[];
extern u16 gEvent_8A00364[];
extern u16 gEvent_EirikaModeGameEnd[];
extern u16 gEvent_EphraimModeGameEnd[];

extern struct ProcCmd CONST_DATA gUnknown_08AA7680[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08AA71C8[]; // intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08A3DD50[]; // world map wrapper

s8 sub_80099E4(ProcPtr);
void GameControl_HandleSelectRightL(ProcPtr);
void sub_8009A24(ProcPtr);
void GameControl_8009A58(struct GameCtrlProc*);
void GameControl_8009A60_Null(ProcPtr);
void sub_8009A84(ProcPtr);
void sub_8009ABC(ProcPtr);
void GameControl_PostIntro(struct GameCtrlProc*);
void sub_8009B64(struct GameCtrlProc*);
void GameControl_MasterSwitch(struct GameCtrlProc*);
void GameControl_PostChapterSwitch(struct GameCtrlProc*);
void sub_8009D1C(struct GameCtrlProc*);
void sub_8009D44(struct GameCtrlProc*);
void sub_8009D6C(struct GameCtrlProc*);
void GameControl_ChapterSwitch(struct GameCtrlProc*);
void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc*);
void sub_8009E00(struct GameCtrlProc*);
void sub_8009E28(ProcPtr);
void CallGameEndingEvent(ProcPtr);
void sub_8009EFC(ProcPtr);
void GameControl_RememberChapterId(struct GameCtrlProc*);
void GameControl_RestoreChapterId(struct GameCtrlProc*);
void GameControl_EnableSoundEffects(ProcPtr);


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

    PROC_CALL(GameControl_HandleSelectRightL),

    PROC_CALL(GameControl_8009A58),
    PROC_REPEAT(GameControl_8009A60_Null),

    // fallthrough

PROC_LABEL(0),
    PROC_START_CHILD_BLOCKING(gUnknown_08AA7680),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_START_CHILD_BLOCKING(gUnknown_08AA71C8),
    PROC_CALL(GameControl_PostIntro),
    PROC_SLEEP(0),

    PROC_GOTO(4),

PROC_LABEL(2),
    PROC_CALL_2(sub_80099E4),
    PROC_CALL(sub_8009B64),
    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_SLEEP(0),

    PROC_CALL(sub_8009A84),
    PROC_CALL(sub_8009B64),
    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_WithMusic),

    PROC_GOTO(26),

PROC_LABEL(24),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagTrue),

    PROC_GOTO(26),

PROC_LABEL(25),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(StartTitleScreen_FlagFalse),

    PROC_GOTO(26),

PROC_LABEL(26),
    PROC_SLEEP(0),

    PROC_CALL(GameControl_PostIntro),
    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(5),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(Make6C_savemenu),
    PROC_SLEEP(0),

    PROC_CALL(GameControl_MasterSwitch),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(6),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_SLEEP(0),

    PROC_CALL(StartBattleMap),
    PROC_SLEEP(0),

    PROC_GOTO(9),

PROC_LABEL(7),
    PROC_CALL(sub_8009D1C),
    PROC_CALL(sub_8009D44),
    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(sub_8009E00),
    PROC_SLEEP(0),

    PROC_START_CHILD_BLOCKING(gUnknown_08A3DD50),
    PROC_CALL(EndWM),

    PROC_CALL(sub_8009E28),
    PROC_SLEEP(0),

    PROC_CALL(StartBattleMap),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(9),
    PROC_SLEEP(0),

    PROC_CALL(GameControl_PostChapterSwitch),
    PROC_SLEEP(0),

    PROC_CALL(GameControl_RestoreChapterId),

    // fallthrough

PROC_LABEL(19),
    PROC_CALL(GameControl_ChapterSwitch),

    PROC_CALL(GameControl_CallPostChapterSaveMenu),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(8),
    PROC_CALL(sub_8009E28),

    PROC_CALL(GameCtrl_StartResumedGame),
    PROC_SLEEP(0),

    PROC_CALL(GameControl_RememberChapterId),
    PROC_CALL(sub_8009D6C),

    PROC_GOTO(9),

PROC_LABEL(14),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(10),
    PROC_SLEEP(0),

    PROC_GOTO(4),

PROC_LABEL(15),
    PROC_GOTO(7),

PROC_LABEL(12),
    PROC_CALL(sub_80481E0),
    PROC_SLEEP(0),

    PROC_CALL(sub_8009ABC),

    PROC_GOTO(5),

PROC_LABEL(16),
    PROC_CALL(ClearTemporaryUnits),
    PROC_CALL(GameCtrl_DeclareCompletedChapter),

    PROC_CALL(Make6C_savemenu2),
    PROC_SLEEP(0),

    // fallthrough

PROC_LABEL(17),
    PROC_CALL(GameCtrl_SavePlayThroughData),

    PROC_CALL(CallGameEndingEvent),
    PROC_SLEEP(0),

    PROC_WHILE(EventEngineExists),

    PROC_CALL(sub_80B7598),
    PROC_CALL(sub_8009EFC),

    PROC_SLEEP(30),

    PROC_GOTO(4),

PROC_LABEL(18),
    PROC_CALL(sub_8009A24),

    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(sub_8048850),

    PROC_WHILE(EventEngineExists),
    PROC_SLEEP(0),

    PROC_CALL(StartFadeInBlackMedium),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndBG3Slider),

    PROC_GOTO(0),

    PROC_END,
};

int sub_80097E8(int chapterId) {

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

u8 sub_8009950() {
    int furthestChapter;
    int chapter;
    int i;
    struct PlaySt chapterData;

    if (GetGlobalCompletionCount() != 0) {
        return 9;
    }

    furthestChapter = 0;

    for (i = 0; i < 3; i++) {

        if (IsSaveValid(i) == 0) {
            continue;
        }

        ReadGameSavePlaySt(i, &chapterData);

        if (chapterData.unk_2C_2 != 0) {
            return 9;
        }

        chapter = sub_80097E8(chapterData.chapterIndex);

        if (furthestChapter < chapter) {
            furthestChapter = chapter;
        }

    }

    if (furthestChapter > 17) {
        return 8;
    } else if (furthestChapter > 15) {
        return 7;
    } else if (furthestChapter > 13) {
        return 6;
    } else if (furthestChapter > 11) {
        return 5;
    } else if (furthestChapter > 9) {
        return 4;
    } else if (furthestChapter > 7) {
        return 3;
    } else if (furthestChapter > 5) {
        return 2;
    } else if (furthestChapter > 3) {
        return 1;
    } else {
        return 0;
    }
}

s8 sub_80099E4(ProcPtr proc) {

    StartClassReel(sub_8009950(), proc);

    return 0;
}

void GameControl_HandleSelectRightL(ProcPtr proc) {

    if (gKeyStatusPtr->heldKeys == (L_BUTTON | DPAD_RIGHT | SELECT_BUTTON)) {
        Proc_Goto(proc, 18);
    }

    return;
}

void sub_8009A24(ProcPtr proc) {

    SetupBackgrounds(0);
    sub_80156D4();

    gPlaySt.cfgTextSpeed = 1;

    sub_8086BB8(PROC_TREE_3, 0, -1);

    return;
}

void GameControl_8009A58(struct GameCtrlProc* proc) {
    proc->unk_2E = 20;

    return;
}

void GameControl_8009A60_Null(ProcPtr proc) {
    Proc_Break(proc);
    return;
}

void EndProcIfNotMarkedB(ProcPtr proc) {
    if (((struct Proc*)proc)->proc_mark != PROC_MARK_B) {
        Proc_End(proc);
    }

    return;
}

void sub_8009A84(ProcPtr proc) {
    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();

    Proc_ForAll(EndProcIfNotMarkedB);

    SetMainUpdateRoutine(OnGameLoopMain);

    return;
}

void sub_8009ABC(ProcPtr proc) {
    Sound_PlaySong8002448(0x43, 0);
    ISuspectThisToBeMusicRelated_8002730(0, 0xC0, 0x3C, 0);
    return;
}


void sub_8009AD8(ProcPtr proc) {
    ISuspectThisToBeMusicRelated_8002730(0x100, 0xC0, 0x20, 0);
    return;
}

void GameControl_PostIntro(struct GameCtrlProc* proc) {
    int tmp;

    switch (proc->nextAction) {
        case GAME_ACTION_2:
            Proc_Goto(proc, 4);
            break;
        case GAME_ACTION_0:
            Proc_Goto(proc, 5);
            sub_8009AD8(proc);
            break;
        case GAME_ACTION_1:

            tmp = proc->unk_2B;

            switch (tmp & 1) {
                case 0:
                    Proc_Goto(proc, 2);
                    break;

                case 1:
                    Proc_Goto(proc, 1);
                    break;
            }

            proc->unk_2B++;
            break;

        case GAME_ACTION_3:
            Proc_Goto(proc, 24);
            break;
    }

    return;
}

void sub_8009B64(struct GameCtrlProc* proc) {

    switch (proc->nextAction) {
        case GAME_ACTION_0:
            Proc_Goto(proc, 4);
            break;

        case GAME_ACTION_1:
            Proc_Goto(proc, 1);
            break;
    }

    return;
}

void GameControl_MasterSwitch(struct GameCtrlProc* proc) {

    switch (proc->nextAction) {
        case GAME_ACTION_0:
            sub_80BC81C();

            // fallthrough

        case GAME_ACTION_1:
        case GAME_ACTION_2:
        case GAME_ACTION_3:
            Proc_Goto(proc, 7);
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

        case GAME_ACTION_7:
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

void sub_8009C1C(struct GameCtrlProc* proc) {

    if (proc->nextAction == GAME_ACTION_5) {
        Proc_Goto(proc, 4);
    }

    return;
}

void sub_8009C34(struct GameCtrlProc* proc) {

    Proc_Goto(proc, 4);
    return;
}

void sub_8009C40(struct GameCtrlProc* proc) {

    if (proc->nextAction == GAME_ACTION_0) {
        return;
    }

    if (proc->nextAction == GAME_ACTION_1) {
        Proc_Goto(proc, 19);
    }

    return;
}

void sub_8009C5C(struct GameCtrlProc* proc) {
    if (proc->nextAction == GAME_ACTION_5) {
        Proc_Goto(proc, 5);
    } else {
        InitPlayConfig(0, 0);

        gPlaySt.chapterStateBits |= PLAY_FLAG_TUTORIAL;

        ResetPermanentFlags();
        ClearLocalEvents();

        InitUnits();

        gPlaySt.chapterIndex = proc->nextChapter;
    }

    return;
}

void sub_8009CA4(ProcPtr proc) {
    NullBmMapHidden_();
    ClearPidStats();

    ChapterChangeUnitCleanup();

    gPlaySt.chapterIndex = 0x7F;

    return;
}

void sub_8009CC0(ProcPtr proc) {
    InvalidateSuspendSave(SAVE_ID_SUSPEND);

    gPlaySt.cfgDisableBgm = 0;

    return;
}

void GameControl_PostChapterSwitch(struct GameCtrlProc* proc) {

    MU_EndAll();

    switch (proc->nextAction) {
        case GAME_ACTION_0:
            Proc_Goto(proc, 4);
            break;

        case GAME_ACTION_3:
            Proc_Goto(proc, 16);
            break;

        case GAME_ACTION_1:
        case GAME_ACTION_2:
        default:
            break;
    }

    return;
}

void sub_8009D1C(struct GameCtrlProc* proc) {
    if ((gPlaySt.unk4A_2 == 2) || (gPlaySt.unk4A_2 == 4)) {
        Proc_Goto(proc, 6);
    }

    return;
}

void sub_8009D44(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        return;
    }

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)) {
        return;
    }

    Proc_Goto(proc, 17);

    return;
}

void sub_8009D6C(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_7) {
        Proc_Goto(proc, 10);
    } else {
        Proc_Goto(proc, 9);
    }

    return;
}

void GameControl_ChapterSwitch(struct GameCtrlProc* proc) {
    int i;

    for (i = 0; i <= 2; i++) {
        NextRN();
    }

    StoreRNState(gGmMonsterRnState);

    if (CheckEventId(3) != 0) {
        RegisterChapterTimeAndTurnCount(&gPlaySt);
    }

    ComputeChapterRankings();

    gPlaySt.chapterIndex = proc->nextChapter;

    ChapterChangeUnitCleanup();

    return;
}

void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterIndex != 0x38) {
        Make6C_savemenu2(proc);
    }

    return;
}

void sub_8009E00(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        return;
    }

    if (gPlaySt.chapterIndex != 0) {
        return;
    }

    StartIntroMonologue(proc);

    return;
}

void sub_8009E28(ProcPtr proc) {

    SetSpecialColorEffectsParameters(3, 0, 0, 16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    sub_8001F48(1);

    return;
}

void sub_8009E54(ProcPtr proc) {
    SetupBackgrounds(0);

    switch (gPlaySt.chapterModeIndex) {
        case 2:
            CallEvent(gEvent_8A0035C, EV_EXEC_CUTSCENE);
            break;

        case 3:
            CallEvent(gEvent_8A00364, EV_EXEC_CUTSCENE);
            break;
    }

    SetEventId(0x84);

    return;
}

void CallGameEndingEvent(ProcPtr proc) {
    StartBattleMap(proc);

    sub_80141B0();

    switch (gPlaySt.chapterModeIndex) {
        case 2:
            CallEvent(gEvent_EirikaModeGameEnd, EV_EXEC_CUTSCENE);
            break;

        case 3:
            CallEvent(gEvent_EphraimModeGameEnd, EV_EXEC_CUTSCENE);
            break;
    }

    SetEventId(0x84);

    return;
}

void GameControl_RememberChapterId(struct GameCtrlProc* proc) {
    proc->unk_30 = gPlaySt.chapterIndex;
    return;
}

void GameControl_RestoreChapterId(struct GameCtrlProc* proc) {
    gPlaySt.chapterIndex = proc->unk_30;
    return;
}

void sub_8009EFC(ProcPtr proc) {
    SetGameEndFlag();
    return;
}

void StartGame() {
    struct GameCtrlProc* proc;

    SetMainUpdateRoutine(OnGameLoopMain);

    SetInterrupt_LCDVBlank(OnVBlank);

    proc = Proc_Start(gProcScr_GameControl, PROC_TREE_3);
    proc->nextAction = GAME_ACTION_0;
    proc->nextChapter = 0;
    proc->unk_2B = 0;

    return;
}

struct GameCtrlProc* GetGameControl() {
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

s8 HasNextChapter() {
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

void sub_8009FD4(ProcPtr proc) {
    return;
}

void nullsub_9() {
    return;
}

void GameControl_EnableSoundEffects(ProcPtr proc) {
    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 0;

    return;
}

void sub_8009FF8(ProcPtr proc) {

    gPlaySt.cfgAnimationType = 0;
    gPlaySt.cfgTextSpeed = 1;
    gPlaySt.cfgGameSpeed = 0;
    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 1;
    gPlaySt.cfgWindowColor = 0;
    gPlaySt.cfgUnitColor = 0;

    return;
}
