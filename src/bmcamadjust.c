#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "sallycursor.h"
#include "bmphase.h"
#include "bm.h"
#include "variables.h"
#include "functions.h"

int GetLastStatScreenUid(void);
void ProcFun_ResetCursorPosition(ProcPtr proc);
void ADJUSTFROMXI_MoveCameraOnSomeUnit(ProcPtr proc);

struct ProcCmd CONST_DATA gProcScr_ResetCursorPosition[] = {
    PROC_CALL(ProcFun_ResetCursorPosition),
    PROC_YIELD,
    PROC_END
};

struct ProcCmd CONST_DATA gProcScr_ADJUSTSFROMXI[] = {
    PROC_NAME("ADJUSTSFROMXI"),
    PROC_CALL(ADJUSTFROMXI_MoveCameraOnSomeUnit),
    PROC_SLEEP(1),
    PROC_END
};


void GetPlayerStartCursorPosition(int *px, int *py)
{
    struct Unit *unit;
    if (1 == gRAMChapterData.chapterTurnNumber) {
        unit = GetUnitFromCharId(GetPlayerLeaderUnitId());
        gRAMChapterData.xCursor = unit->xPos;
        gRAMChapterData.yCursor = unit->yPos;
    }

    if (1 != gRAMChapterData.cfgAutoCursor) {
        unit = GetUnitFromCharId(GetPlayerLeaderUnitId());
        *px = unit->xPos;
        *py = unit->yPos;
    } else {
        *px = gRAMChapterData.xCursor;
        *py = gRAMChapterData.yCursor;
    }
}

void GetEnemyStartCursorPosition(int *px, int *py)
{
    int i;

    for (i = gRAMChapterData.faction + 1; i < gRAMChapterData.faction + 0x40; i++) {
        struct Unit *unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;
        
        if (unit->state & (US_HIDDEN | US_BIT9))
            continue;
        
        *px = unit->xPos;
        *py = unit->yPos;

        if (CA_BOSS & UNIT_CATTRIBUTES(unit))
            break;
    }
}

void ProcFun_ResetCursorPosition(ProcPtr proc)
{
    int x, y;
    
    x = -1;
    y = -1;

    if (0 == GetPhaseAbleUnitCount(gRAMChapterData.faction)) {
        Proc_End(proc);
        return;
    }

    switch (gRAMChapterData.faction) {
    case FACTION_BLUE:
        GetPlayerStartCursorPosition(&x, &y);
        break;
    
    case FACTION_GREEN:
    case FACTION_RED:
        GetEnemyStartCursorPosition(&x, &y);
        break;
    
    default:
        break;
    }

    if ((x >= 0) && (y >= 0)) {
        EnsureCameraOntoPosition(proc, x, y);
        SetCursorMapPosition(x, y);
    }
}

void ADJUSTFROMXI_MoveCameraOnSomeUnit(ProcPtr proc)
{
    int x, y;
    struct Unit *unit = GetUnit(GetLastStatScreenUid());

    if (NULL == unit)
        return;

    x = unit->xPos;
    y = unit->yPos;
    EnsureCameraOntoPosition(proc, x, y);
    SetCursorMapPosition(x, y);
}
