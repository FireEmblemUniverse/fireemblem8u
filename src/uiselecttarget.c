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

struct ProcCmd CONST_DATA gUnknown_085B655C[] =
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

struct Unk_085B658C CONST_DATA gUnknown_085B658C[] =
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
    return;
}

void AddTarget(int x, int y, int unitId, int tId) {
    sSelectTargetList[sSelectTargetCount].x = x;
    sSelectTargetList[sSelectTargetCount].y = y;
    sSelectTargetList[sSelectTargetCount].uid = unitId;
    sSelectTargetList[sSelectTargetCount].extra = tId;

    sSelectTargetCount++;
    return;
}

#if NONMATCHING

// Register allocation is wrong :(
void LinkTargets() {
    struct SelectTarget *iter;
    int r1;
    int r2 = 0;

    if (r2 < sSelectTargetCount) {
        do {
            iter = &sSelectTargetList[r2];
            iter->prev = iter - 1;
            iter->next = iter + 1;
            ++r2;
        } while (r2 < sSelectTargetCount);
    }

    r1 = sSelectTargetCount - 1;

    iter = &sSelectTargetList[r1];
    sSelectTargetList[0].prev = iter;
    iter->next = &sSelectTargetList[0];

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void LinkTargets() {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        movs r2, #0\n\
        ldr r0, _0804F950  @ sSelectTargetCount\n\
        ldr r1, [r0]\n\
        adds r6, r0, #0\n\
        ldr r4, _0804F954  @ sSelectTargetList\n\
        cmp r2, r1\n\
        bge _0804F93A\n\
        adds r5, r6, #0\n\
        adds r3, r4, #0\n\
        adds r3, #0xc\n\
        adds r1, r4, #0\n\
        subs r1, #0xc\n\
    _0804F92A:\n\
        str r1, [r1, #0x14]\n\
        str r3, [r1, #0x10]\n\
        adds r3, #0xc\n\
        adds r1, #0xc\n\
        adds r2, #1\n\
        ldr r0, [r5]\n\
        cmp r2, r0\n\
        blt _0804F92A\n\
    _0804F93A:\n\
        ldr r1, [r6]\n\
        subs r1, #1\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r4\n\
        str r0, [r4, #8]\n\
        str r4, [r0, #4]\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0804F950: .4byte sSelectTargetCount\n\
    _0804F954: .4byte sSelectTargetList\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void TargetSelection_GetRealCursorPosition(ProcPtr proc, int* xPos, int* yPos) {
    *xPos = (((struct SelectTargetProc*)(proc))->currentTarget)->x * 16;
    *yPos = (((struct SelectTargetProc*)(proc))->currentTarget)->y * 16;

    return;
}

void TargetSelection_Loop(ProcPtr proc) {
    int x, y;
    int r5;

    if ((0x40 & ((struct SelectTargetProc*)(proc))->unk_34) != 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        DisplayCursor(x, y, 4);
        return;
    }

    TargetSelection_HandleMoveInput(proc);

    r5 = TargetSelection_HandleSelectInput(proc);

    if ((2 & r5) != 0) {
        EndTargetSelection(proc);
    }

    if ((4 & r5) != 0) {
        PlaySoundEffect(0x6A);
    }

    if ((8 & r5) != 0) {
        PlaySoundEffect(0x6B);
    }

    if ((0x10 & r5) != 0) {
        ClearBg0Bg1();
    }

    if ((0x20 & r5) != 0) {
        DeleteFaceByIndex(0);
    }

    if ((1 & r5) == 0) {
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
    proc = Proc_Start(gUnknown_085B655C, PROC_TREE_3);

    proc->unk_34 = 1;
    proc->selectRoutines = selectInfo;
    proc->currentTarget = GetFirstTargetPointer();
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
    struct SelectTargetProc* proc = (struct SelectTargetProc*)NewTargetSelection(selectInfo);

    proc->onAPress = onSelect;
    // return proc; // BUG
}

ProcPtr EndTargetSelection(ProcPtr proc) {
    if (((struct SelectTargetProc*)(proc))->selectRoutines->onEnd) {
        ((struct SelectTargetProc*)(proc))->selectRoutines->onEnd(proc);
    }

    if ((1 & ((struct SelectTargetProc*)(proc))->unk_34) != 0) {
        SubSkipThread2();
    }

    Proc_End(proc);

    return ((struct SelectTargetProc*)(proc))->proc_parent;
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

    return;
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

void sub_804FBBC() {
    ProcPtr proc = Proc_Find(gUnknown_085B655C);
    if (proc) {
        ((struct SelectTargetProc*)(proc))->unk_34 |= 0x40;
    }

    return;
}

void sub_804FBDC() {
    ProcPtr proc = Proc_Find(gUnknown_085B655C);
    if (proc) {
        ((struct SelectTargetProc*)(proc))->unk_34 &= 0xBF;
    }

    return;
}

#if NONMATCHING

// TODO: Seems to be related to the distance more than index
int GetFarthestTargetIndex() {
    int r7 = 0;
    struct SelectTarget *iter = sSelectTargetList;
    int dist;
    int r4;
    if (r7 < sSelectTargetCount) {
        r4 = sSelectTargetCount;
        iter = sSelectTargetList;
        do {
            dist = ABS(sSelectTargetRoot.x - iter->x) + ABS(sSelectTargetRoot.y - iter->y);

            if (r7 < dist) {
                r7 = dist;
            }

            --r4;
            ++iter;
        } while (r4 != 0);
    }

    return r7;
}


#else // if !NONMATCHING

__attribute__((naked))
int GetFarthestTargetIndex() {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        movs r7, #0\n\
        ldr r5, _0804FC34  @ sSelectTargetList\n\
        ldr r0, _0804FC38  @ sSelectTargetCount\n\
        ldr r0, [r0]\n\
        cmp r7, r0\n\
        bge _0804FC52\n\
        ldr r1, _0804FC3C  @ sSelectTargetRoot\n\
        mov ip, r1\n\
        movs r2, #0\n\
        ldrsh r6, [r1, r2]\n\
        adds r4, r0, #0\n\
    _0804FC14:\n\
        movs r0, #0\n\
        ldrsb r0, [r5, r0]\n\
        subs r2, r6, r0\n\
        cmp r2, #0\n\
        bge _0804FC20\n\
        subs r2, r0, r6\n\
    _0804FC20:\n\
        mov r0, ip\n\
        movs r1, #2\n\
        ldrsh r3, [r0, r1]\n\
        movs r0, #1\n\
        ldrsb r0, [r5, r0]\n\
        subs r1, r3, r0\n\
        cmp r1, #0\n\
        blt _0804FC40\n\
        adds r0, r2, r1\n\
        b _0804FC44\n\
        .align 2, 0\n\
    _0804FC34: .4byte sSelectTargetList\n\
    _0804FC38: .4byte sSelectTargetCount\n\
    _0804FC3C: .4byte sSelectTargetRoot\n\
    _0804FC40:\n\
        subs r0, r0, r3\n\
        adds r0, r2, r0\n\
    _0804FC44:\n\
        cmp r7, r0\n\
        bge _0804FC4A\n\
        adds r7, r0, #0\n\
    _0804FC4A:\n\
        subs r4, #1\n\
        adds r5, #0xc\n\
        cmp r4, #0\n\
        bne _0804FC14\n\
    _0804FC52:\n\
        adds r0, r7, #0\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

struct SelectTarget* LinkTargetsOrdered() {
    struct SelectTarget* currentIter = NULL;
    struct SelectTarget* prevIter = NULL;
    int i = 0;
    int j;
    int xDist, yDist;
    struct SelectTarget* target;
    do {
        xDist = sSelectTargetRoot.x + gUnknown_085B658C[i].x;
        yDist = sSelectTargetRoot.y + gUnknown_085B658C[i].y;
        j = 0;
        target = sSelectTargetList;
        while (j < sSelectTargetCount) {
            if (xDist == target->x && yDist == target->y) {
                target->next = prevIter;

                if (prevIter != 0) {
                    prevIter->prev = target;
                }

                if (currentIter == 0) {
                    currentIter = target;
                }

                prevIter = target;
            }
            ++j;
            ++target;
        }
    } while(++i < (int)ARRAY_COUNT(gUnknown_085B658C));

    currentIter->next = prevIter;
    prevIter->prev = currentIter;

    return currentIter;
}

struct SelectTarget* GetLinkedTargetList() {
    LinkTargets();
    return sSelectTargetList;
}

struct SelectTarget* GetFirstTargetPointer() {
    if (GetFarthestTargetIndex() > 2) {
        return GetLinkedTargetList();
    }
    return LinkTargetsOrdered();
}

int GetSelectTargetCount() {
    return sSelectTargetCount;
}

struct SelectTarget* GetTarget(int index) {
    return &sSelectTargetList[index];
}