#include "global.h"

#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmio.h"

#include "uiselecttarget.h"

static struct Vec2 EWRAM_DATA sSelectTargetRoot = {};

static struct SelectTarget EWRAM_DATA sSelectTargetList[MAX_TARGET_LIST_COUNT] = {0};

static int EWRAM_DATA sSelectTargetCount = 0;

struct ProcCmd CONST_DATA gProcScr_TargetSelection[] =
{
PROC_LABEL(0),
    PROC_REPEAT(TargetSelection_Loop),
    PROC_SLEEP(1),

    PROC_CALL(RefreshBMapGraphics),
    PROC_GOTO(0),

    PROC_END,
};

struct Unk_085B658C
{
    s8 x, y;
};

struct Unk_085B658C CONST_DATA gNearTargetLinkOrder[] =
{
    {  0,  0 },
    {  0, -2 },
    {  0, -1 },
    { +1, -1 },
    { +1,  0 },
    { +2,  0 },
    { +1, +1 },
    {  0, +1 },
    {  0, +2 },
    { -1, +1 },
    { -1,  0 },
    { -2,  0 },
    { -1, -1 },
};

void InitTargets(int xRoot, int yRoot) {
    sSelectTargetRoot.x = xRoot;
    sSelectTargetRoot.y = yRoot;
    sSelectTargetCount = 0;
}

void AddTarget(int x, int y, int unitId, int tId) {
    sSelectTargetList[sSelectTargetCount].x = x;
    sSelectTargetList[sSelectTargetCount].y = y;
    sSelectTargetList[sSelectTargetCount].uid = unitId;
    sSelectTargetList[sSelectTargetCount].extra = tId;

    sSelectTargetCount++;
}

inline int GetSelectTargetCount(void)
{
    return sSelectTargetCount;
}

inline struct SelectTarget* GetTarget(int index)
{
    return &sSelectTargetList[index];
}

void LinkTargets(void)
{
    int i, last;

    for (i = 0; i < GetSelectTargetCount(); i++)
    {
        GetTarget(i)->prev = GetTarget(i - 1);
        GetTarget(i)->next = GetTarget(i + 1);
    }

    last = GetSelectTargetCount() - 1;

    GetTarget(0)->prev = GetTarget(last);
    GetTarget(last)->next = GetTarget(0);
}

void TargetSelection_GetRealCursorPosition(struct SelectTargetProc* proc, int* xPos, int* yPos) {
    *xPos = proc->currentTarget->x * 16;
    *yPos = proc->currentTarget->y * 16;
}

void TargetSelection_Loop(struct SelectTargetProc* proc) {
    int x, y;
    int r5;

    if ((TARGETSELECTION_FLAG_FROZEN & proc->flags) != 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        DisplayCursor(x, y, 4);
        return;
    }

    TargetSelection_HandleMoveInput(proc);

    r5 = TargetSelection_HandleSelectInput(proc);

    if ((TARGETSELECTION_ACTION_END & r5) != 0) {
        EndTargetSelection(proc);
    }

    if ((TARGETSELECTION_ACTION_SE_6A & r5) != 0) {
        PlaySoundEffect(0x6A);
    }

    if ((TARGETSELECTION_ACTION_SE_6B & r5) != 0) {
        PlaySoundEffect(0x6B);
    }

    if ((TARGETSELECTION_ACTION_CLEARBGS & r5) != 0) {
        ClearBg0Bg1();
    }

    if ((TARGETSELECTION_ACTION_ENDFACE & r5) != 0) {
        DeleteFaceByIndex(0);
    }

    if ((TARGETSELECTION_ACTION_ENDFAST & r5) == 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        if (EnsureCameraOntoPosition(proc, x >> 4, y >> 4) != 1) {
            DisplayCursor(x, y, 2);
        }
    }

    return;
}

ProcPtr NewTargetSelection(const struct SelectInfo* selectInfo) {
    struct SelectTargetProc* proc;

    AddSkipThread2();
    proc = Proc_Start(gProcScr_TargetSelection, PROC_TREE_3);

    proc->flags = TARGETSELECTION_FLAG_GAMELOCK;
    proc->selectRoutines = selectInfo;
    proc->currentTarget = GetLinkedTargets();
    proc->onAPress = 0;

    if (proc->selectRoutines->onInit) {
        proc->selectRoutines->onInit(proc);
    }

    if (proc->selectRoutines->onUnk08) {
        proc->selectRoutines->onUnk08(proc);
    }

    if (proc->selectRoutines->onSwitchIn) {
        proc->selectRoutines->onSwitchIn(proc, proc->currentTarget);
    }

    gKeyStatusPtr->newKeys = 0;

    return proc;
}

ProcPtr NewTargetSelection_Specialized(const struct SelectInfo* selectInfo, u8(*onSelect)(ProcPtr, struct SelectTarget*)) {
    struct SelectTargetProc* proc = NewTargetSelection(selectInfo);

    proc->onAPress = onSelect;

#if 0
    return proc; // BUG
#endif
}

ProcPtr EndTargetSelection(struct SelectTargetProc* proc) {
    if (proc->selectRoutines->onEnd) {
        proc->selectRoutines->onEnd(proc);
    }

    if ((TARGETSELECTION_FLAG_GAMELOCK & proc->flags) != 0) {
        SubSkipThread2();
    }

    Proc_End(proc);

    return proc->proc_parent;
}

void TargetSelection_HandleMoveInput(struct SelectTargetProc* proc) {
    struct SelectTarget* current = proc->currentTarget;

    if ((DPAD_LEFT | DPAD_UP) & gKeyStatusPtr->repeatedKeys) {
        if (current->next != 0) {
            proc->currentTarget = current->next;
        }
    }

    if ((DPAD_RIGHT | DPAD_DOWN) & gKeyStatusPtr->repeatedKeys) {
        if (proc->currentTarget->prev) {
            proc->currentTarget = proc->currentTarget->prev;
        }
    }

    if (proc->currentTarget == current) {
        return;
    }

    if (proc->selectRoutines->onSwitchOut) {
        proc->selectRoutines->onSwitchOut(proc, current);
    }

    if (proc->selectRoutines->onSwitchIn) {
        proc->selectRoutines->onSwitchIn(proc, proc->currentTarget);
    }

    PlaySoundEffect(0x67);
}

int TargetSelection_HandleSelectInput(struct SelectTargetProc* proc) {
    int ret = 0;

    if (A_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->onAPress) {
            ret = proc->onAPress(proc, proc->currentTarget);
        } else {
            if (proc->selectRoutines->onSelect) {
                ret = proc->selectRoutines->onSelect(proc, proc->currentTarget);
            }
        }
    } else if (B_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->selectRoutines->onCancel) {
            ret = proc->selectRoutines->onCancel(proc, proc->currentTarget);
        }
    } else if (R_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->selectRoutines->onHelp) {
            ret = proc->selectRoutines->onHelp(proc, proc->currentTarget);
        }
    }

    return ret;
}

void sub_804FBBC(void) {
    struct SelectTargetProc * proc = Proc_Find(gProcScr_TargetSelection);
    if (proc) {
        proc->flags |= TARGETSELECTION_FLAG_FROZEN;
    }
}

void sub_804FBDC(void) {
    struct SelectTargetProc * proc = Proc_Find(gProcScr_TargetSelection);
    if (proc) {
        proc->flags &= ~TARGETSELECTION_FLAG_FROZEN;
    }
}

int GetFurthestTargetDistance(void)
{
    int i, result = 0;
    struct SelectTarget * it = sSelectTargetList;

    for (i = 0; i < GetSelectTargetCount(); i++, it++)
    {
        // RECT_DISTANCE
        int distance = ABS(sSelectTargetRoot.x - it->x) + ABS(sSelectTargetRoot.y - it->y);

        if (result < distance)
            result = distance;
    }

    return result;
}

struct SelectTarget* GetLinkedTargetsNear(void) {
    int i, j;

    struct SelectTarget * first = NULL;
    struct SelectTarget * last = NULL;

    for (i = 0; i < (int) ARRAY_COUNT(gNearTargetLinkOrder); i++)
    {
        struct SelectTarget * it;

        int x = sSelectTargetRoot.x + gNearTargetLinkOrder[i].x;
        int y = sSelectTargetRoot.y + gNearTargetLinkOrder[i].y;

        for (j = 0, it = sSelectTargetList; j < sSelectTargetCount; j++, it++)
        {
            if (x == it->x && y == it->y)
            {
                it->next = last;

                if (last != NULL)
                    last->prev = it;

                if (first == NULL)
                    first = it;

                last = it;
            }
        }
    }

    first->next = last;
    last->prev = first;

    return first;
}

struct SelectTarget* GetLinkedTargetsFar(void) {
    LinkTargets();
    return sSelectTargetList;
}

struct SelectTarget* GetLinkedTargets(void) {
    if (GetFurthestTargetDistance() > 2) {
        return GetLinkedTargetsFar();
    }
    return GetLinkedTargetsNear();
}
