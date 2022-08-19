#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"

#include "gamecontrol.h"

extern u16 gGmMonsterRnState[];

extern u16 gEvent_8A0035C[];
extern u16 gEvent_8A00364[];
extern u16 gEvent_EirikaModeGameEnd[];
extern u16 gEvent_EphraimModeGameEnd[];

extern struct ProcCmd CONST_DATA gUnknown_08AA7680[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08AA71C8[]; // intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08A3DD50[]; // world map wrapper

// hino.s
void sub_8013D68(ProcPtr);
void sub_8013D8C(ProcPtr);

// code_sio.s
void sub_80481E0(ProcPtr);
void sub_8048850(ProcPtr);

// ev_triggercheck.s
void sub_8083D18(void);
void ClearLocalEvents(void);

// code.s
void sub_8086BB8(ProcPtr, u8*, int);
void EndBG3Slider(ProcPtr);
void sub_80A41C8(void);
int sub_80A4BB0(void);
void sub_80A4CD8(void);
s8 sub_80A5218(int);
void sub_80A522C(int, struct RAMChapterData*);
void sub_80A5A20(int);
void sub_80A6D38(void);
void Make6C_savemenu(ProcPtr);
void Make6C_savemenu2(ProcPtr);
void Make6C_opinfo(int, ProcPtr);
void EndWM(ProcPtr);
void sub_80B7598(ProcPtr);
void sub_80C541C(ProcPtr);
void sub_80C6424(ProcPtr);
void sub_80C6444(ProcPtr);
void sub_80C645C(ProcPtr);

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
    PROC_CALL(sub_80C6424),

    PROC_GOTO(26),

PROC_LABEL(24),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(sub_80C645C),

    PROC_GOTO(26),

PROC_LABEL(25),
    PROC_CALL(GameControl_EnableSoundEffects),
    PROC_CALL(sub_80C6444),

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
    PROC_CALL(GameCtrl_DeclareCompletedPlaythrough),

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
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(sub_8048850),

    PROC_WHILE(EventEngineExists),
    PROC_SLEEP(0),

    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

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
    struct RAMChapterData chapterData;

    if (sub_80A4BB0() != 0) {
        return 9;
    }

    furthestChapter = 0;

    for (i = 0; i < 3; i++) {

        if (sub_80A5218(i) == 0) {
            continue;
        }

        sub_80A522C(i, &chapterData);

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

    Make6C_opinfo(sub_8009950(), proc);

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

    gRAMChapterData.cfgTextSpeed = 1;

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

    SetMainUpdateRoutine(SomeUpdateRoutine);

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
        InitPlaythroughState(0, 0);

        gRAMChapterData.chapterStateBits |= CHAPTER_FLAG_3;

        sub_8083D18();
        ClearLocalEvents();

        ClearUnits();

        gRAMChapterData.chapterIndex = proc->nextChapter;
    }

    return;
}

void sub_8009CA4(ProcPtr proc) {
    sub_80A6D38();
    sub_80A41C8();

    ChapterChangeUnitCleanup();

    gRAMChapterData.chapterIndex = 0x7F;

    return;
}

void sub_8009CC0(ProcPtr proc) {
    sub_80A5A20(3);

    gRAMChapterData.unk41_1 = 0;

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

#if NONMATCHING

void sub_8009D1C(struct GameCtrlProc* proc) {
    if ((gRAMChapterData.unk4A_2 == 4) || (gRAMChapterData.unk4A_2 == 8)) {
        Proc_Goto(proc, 6);
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8009D1C(struct GameCtrlProc* proc) {

    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        adds r2, r0, #0\n\
        ldr r0, _08009D40  @ gRAMChapterData\n\
        adds r0, #0x4a\n\
        ldrb r0, [r0]\n\
        movs r1, #0xe\n\
        ands r1, r0\n\
        cmp r1, #4\n\
        beq _08009D32\n\
        cmp r1, #8\n\
        bne _08009D3A\n\
    _08009D32:\n\
        adds r0, r2, #0\n\
        movs r1, #6\n\
        bl Proc_Goto\n\
    _08009D3A:\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08009D40: .4byte gRAMChapterData\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

void sub_8009D44(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        return;
    }

    if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_5)) {
        return;
    }

    Proc_Goto(proc, 17);

    return;
}

void sub_8009D6C(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_7) {
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
        RegisterChapterTimeAndTurnCount(&gRAMChapterData);
    }

    ComputeChapterRankings();

    gRAMChapterData.chapterIndex = proc->nextChapter;

    ChapterChangeUnitCleanup();

    return;
}

void GameControl_CallPostChapterSaveMenu(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterIndex != 0x38) {
        Make6C_savemenu2(proc);
    }

    return;
}

void sub_8009E00(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        return;
    }

    if (gRAMChapterData.chapterIndex != 0) {
        return;
    }

    sub_80C541C(proc);

    return;
}

void sub_8009E28(ProcPtr proc) {

    SetSpecialColorEffectsParameters(3, 0, 0, 16);
    sub_8001ED0(1, 1, 1, 1, 1);
    sub_8001F48(1);

    return;
}

void sub_8009E54(ProcPtr proc) {
    SetupBackgrounds(0);

    switch (gRAMChapterData.chapterModeIndex) {
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

    switch (gRAMChapterData.chapterModeIndex) {
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
    proc->unk_30 = gRAMChapterData.chapterIndex;
    return;
}

void GameControl_RestoreChapterId(struct GameCtrlProc* proc) {
    gRAMChapterData.chapterIndex = proc->unk_30;
    return;
}

void sub_8009EFC(ProcPtr proc) {
    sub_80A4CD8();
    return;
}

void StartGame() {
    struct GameCtrlProc* proc;

    SetMainUpdateRoutine(SomeUpdateRoutine);

    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

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
    gRAMChapterData.unk41_1 = 0;
    gRAMChapterData.unk41_2 = 0;

    return;
}

void sub_8009FF8(ProcPtr proc) {

    gRAMChapterData.unk42_2 = 0;
    gRAMChapterData.cfgTextSpeed = 1;
    gRAMChapterData.unk40_8 = 0;
    gRAMChapterData.unk41_1 = 0;
    gRAMChapterData.unk41_2 = 1;
    gRAMChapterData.cfgWindowColor = 0;
    gRAMChapterData.unk40_1 = 0;

    return;
}
