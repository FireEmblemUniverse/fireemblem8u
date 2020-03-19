//
// Created by laqieer on 2020/3/3.
//

#include "bmdebug.h"

// if current seconds is even, return 2; else return 3
int Return2or3BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) == 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// if current seconds is even, return 3; else return 2
int Return3or2BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) != 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// return 8
int Get8(void)
{
    return 8;
}

// return 23
int Get23(void)
{
    return 23;
}

// do nothing, return directly
void DummyFunction(void)
{

}

void Loop6C_WaitForSelectPress(struct Proc *proc)
{
    if (gKeyStatusPtr->newKeys & SELECT_BUTTON) {
        Proc_Break(proc);
    }
}

void SetNewKeyStatusWith16(void)
{
    NewKeyStatusSetter(16);
}


// do nothing, return directly
void DummyFunction2(void)
{

}

void DebugPrintWithProc(struct DebugPrintProc *proc)
{
    int x;
    int y;
    int width;
    const char *text;
    struct TextHandle textHandler;

    x = proc->x;
    y = proc->y;
    width = proc->width;
    text = proc->text;
    Text_Init(&textHandler, width);
    Text_AppendString(&textHandler, text);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    Text_Draw(&textHandler, &gBG0TilemapBuffer[32 * (y + 1) + (x + 1)]);
    BG_EnableSyncByMask(3);
}

struct ProcCmd gProc_DebugPrintWithProc[] = {
    PROC_SLEEP(1), PROC_CALL(DebugPrintWithProc), PROC_END
};

void DebugPrint(int x, int y, int width, const char *text)
{
    struct DebugPrintProc *proc;

    proc = (struct DebugPrintProc *)Proc_Start(gProc_DebugPrintWithProc, (struct Proc *)PROC_MARK_3);
    proc->x = x;
    proc->y = y;
    proc->text = text;
    proc->width = width;
}

int StartDebugMenu(struct MenuProc *menuProc)
{
    EndMenu(menuProc);
    ClearBg0Bg1();
    StartOrphanMenu(&gDebugMenuDef);
    SetupDebugFontForBG(2, 0);
    return 1;
}

u8 DebugMenu_MapIdle(struct MenuProc *menuProc, struct MenuItemProc *menuItemProc)
{
    DebugMenuMapIdleCore(menuItemProc, 7, 2);
    return 0;
}

u8 DebugMenu_MapEffect(struct MenuProc *menuProc, struct MenuItemProc *menuItemProc)
{
  EndBMapMain();
  gRAMChapterData.chapterIndex = sub_801C650(menuItemProc->itemNumber);
  gRAMChapterData.chapterModeIndex = gUnknown_03001780;
  ChapterChangeUnitCleanup();
  nullsub_9();
  gRAMChapterData.unk4A_2 = 2;
  return 23;
}
