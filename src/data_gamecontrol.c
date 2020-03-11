
#include "global.h"

#include "proc.h"
#include "bmio.h"
#include "bmunit.h"
#include "event.h"

void sub_8009A58(ProcPtr);
void Null6CCallback(ProcPtr);
void Goto6CLabel12IfSomething(ProcPtr);
void ForceEnableSoundEffects(ProcPtr);
void sub_8009AEC(ProcPtr);
void sub_80099E4(ProcPtr);
void sub_8009B64(ProcPtr);
void sub_8009A84(ProcPtr);
void sub_80C6424(ProcPtr);
void sub_80C645C(ProcPtr);
void sub_80C6444(ProcPtr);
void Make6C_savemenu(ProcPtr);
void GAMECTRL_MasterSwitch(ProcPtr);
void GetChapterIdTo6C(ProcPtr);
void sub_8009D1C(ProcPtr);
void sub_8009D44(ProcPtr);
void sub_8009E00(ProcPtr);
void EndWM(ProcPtr);
void sub_8009E28(ProcPtr);
void sub_8009CE0(ProcPtr);
void SetChapterIdFrom6C(ProcPtr);
void sub_8009D98(ProcPtr);
void CallActualSaveMenu(ProcPtr);
void sub_8009D6C(ProcPtr);
void sub_80481E0(ProcPtr);
void sub_8009ABC(ProcPtr);
void Make6C_savemenu2(ProcPtr);
void sub_8009E98(ProcPtr);
void sub_80B7598(ProcPtr);
void sub_8009EFC(ProcPtr);
void sub_8009A24(ProcPtr);
void sub_8013D8C(ProcPtr);
void ContinueUntilSomeTransistion6CExists(ProcPtr);
void sub_8048850(ProcPtr);
void sub_8013D68(ProcPtr);
void EndBG3Slider(ProcPtr);

extern struct ProcCmd CONST_DATA gUnknown_08AA7680[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08AA71C8[]; // intro cutscene
extern struct ProcCmd CONST_DATA gUnknown_08A3DD50[]; // world map wrapper

struct ProcCmd CONST_DATA gUnused_085916BC[] =
{
    PROC_CALL(sub_8009A58),
    PROC_REPEAT(Null6CCallback),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085916D4[] =
{
    PROC_NAME("GAMECTRL"),
    PROC_MARK(PROC_MARK_B),

    PROC_15,

    PROC_CALL(Goto6CLabel12IfSomething),

    PROC_CALL(sub_8009A58),
    PROC_REPEAT(Null6CCallback),

    // fallthrough

PROC_LABEL(0),
    PROC_START_CHILD_BLOCKING(gUnknown_08AA7680),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(ForceEnableSoundEffects),
    PROC_START_CHILD_BLOCKING(gUnknown_08AA71C8),
    PROC_CALL(sub_8009AEC),
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
    PROC_CALL(ForceEnableSoundEffects),
    PROC_CALL(sub_80C6424),

    PROC_GOTO(26),

PROC_LABEL(24),
    PROC_CALL(ForceEnableSoundEffects),
    PROC_CALL(sub_80C645C),

    PROC_GOTO(26),

PROC_LABEL(25),
    PROC_CALL(ForceEnableSoundEffects),
    PROC_CALL(sub_80C6444),

    PROC_GOTO(26),

PROC_LABEL(26),
    PROC_SLEEP(0),

    PROC_CALL(sub_8009AEC),
    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(5),
    PROC_CALL(ForceEnableSoundEffects),
    PROC_CALL(Make6C_savemenu),
    PROC_SLEEP(0),

    PROC_CALL(GAMECTRL_MasterSwitch),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(6),
    PROC_CALL(GetChapterIdTo6C),
    PROC_SLEEP(0),

    PROC_CALL(StartBattleMap),
    PROC_SLEEP(0),

    PROC_GOTO(9),

PROC_LABEL(7),
    PROC_CALL(sub_8009D1C),
    PROC_CALL(sub_8009D44),
    PROC_CALL(GetChapterIdTo6C),
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

    PROC_CALL(sub_8009CE0),
    PROC_SLEEP(0),

    PROC_CALL(SetChapterIdFrom6C),

    // fallthrough

PROC_LABEL(19),
    PROC_CALL(sub_8009D98),

    PROC_CALL(CallActualSaveMenu),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(8),
    PROC_CALL(sub_8009E28),

    PROC_CALL(GameCtrl_StartResumedGame),
    PROC_SLEEP(0),

    PROC_CALL(GetChapterIdTo6C),
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

    PROC_CALL(sub_8009E98),
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
