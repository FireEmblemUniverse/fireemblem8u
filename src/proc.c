
#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

#define MAX_PROC_COUNT 64

EWRAM_DATA static struct Proc sProcArray[MAX_PROC_COUNT] = {0}; 

EWRAM_DATA static struct Proc *sProcAllocList[MAX_PROC_COUNT + 1] = {0};
EWRAM_DATA static struct Proc **sProcAllocListHead = NULL; // pointer to next entry in sProcAllocList

EWRAM_DATA struct Proc *gProcTreeRootArray[8] = {0};

static struct Proc* AllocateProcess(void);
static void FreeProcess(struct Proc *proc);
static void InsertRootProcess(struct Proc *proc, int rootIndex);
static void InsertChildProcess(struct Proc *proc, struct Proc *parent);
static void UnlinkProcess(struct Proc *proc);
static void RunProcessScript(struct Proc *proc);

void Proc_Init(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        struct Proc *proc = &sProcArray[i];

        proc->proc_script = NULL;
        proc->proc_scrCur = NULL;
        proc->proc_endCb = NULL;
        proc->proc_idleCb = NULL;
        proc->proc_name = NULL;
        proc->proc_parent = NULL;
        proc->proc_child = NULL;
        proc->proc_next = NULL;
        proc->proc_prev = NULL;
        proc->proc_sleepTime = 0;
        proc->proc_mark = 0;
        proc->proc_flags = 0;
        proc->proc_lockCnt = 0;

        sProcAllocList[i] = proc;
    }

    sProcAllocList[MAX_PROC_COUNT] = NULL;
    sProcAllocListHead = sProcAllocList;

    for (i = 0; i < 8; i++)
        ROOT_PROC(i) = NULL;
}

ProcPtr Proc_Start(const struct ProcCmd* script, ProcPtr parent)
{
    struct Proc* proc = AllocateProcess();

    proc->proc_script = script;
    proc->proc_scrCur = script;
    proc->proc_endCb = NULL;
    proc->proc_idleCb = NULL;
    proc->proc_parent = NULL;
    proc->proc_child = NULL;
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
    proc->proc_sleepTime = 0;
    proc->proc_mark = 0;
    proc->proc_lockCnt = 0;

    proc->proc_flags = PROC_FLAG_STARTING;

    if ((int) parent < 8) // If this is an integer less than 8, then add a root proc
        InsertRootProcess(proc, (int) parent);
    else
        InsertChildProcess(proc, parent);

    RunProcessScript(proc);

    proc->proc_flags &= ~PROC_FLAG_STARTING;

    return proc;
}

// Creates a child process and puts the parent into a wait state
ProcPtr Proc_StartBlocking(const struct ProcCmd *script, ProcPtr parent)
{
    struct Proc *proc = Proc_Start(script, parent);

    if (proc->proc_script == NULL)
        return NULL;

    proc->proc_flags |= PROC_FLAG_BLOCKING;
    ((struct Proc*) proc->proc_parent)->proc_lockCnt++;

    return proc;
}

static void DeleteProcessRecursive(struct Proc *proc)
{
    if (proc->proc_prev)
        DeleteProcessRecursive(proc->proc_prev);

    if (proc->proc_child)
        DeleteProcessRecursive(proc->proc_child);

    if (proc->proc_flags & PROC_FLAG_ENDED)
        return;

    if (proc->proc_endCb)
        proc->proc_endCb(proc);

    FreeProcess(proc);

    proc->proc_script = NULL;
    proc->proc_idleCb = NULL;
    proc->proc_flags |= PROC_FLAG_ENDED;

    if (proc->proc_flags & PROC_FLAG_BLOCKING)
        ((struct Proc*) proc->proc_parent)->proc_lockCnt--;
}

void Proc_End(ProcPtr proc)
{
    struct Proc* casted = (struct Proc*) proc;

    if (proc != NULL)
    {
        UnlinkProcess(casted);
        DeleteProcessRecursive(casted);
    }
}

static struct Proc *AllocateProcess(void)
{
    // retrieve the next entry in the allocation list
    struct Proc *proc = *sProcAllocListHead;
    sProcAllocListHead++;
    return proc;
}

static void FreeProcess(struct Proc *proc)
{
    // place the process back into the allocation list
    sProcAllocListHead--;
    *sProcAllocListHead = proc;
}

// adds the process as a root process
static void InsertRootProcess(struct Proc *proc, s32 rootIndex)
{
    struct Proc* root = ROOT_PROC(rootIndex);

    if (root) // root process already exists
    {
        // add this process as a sibling
        root->proc_next = proc;
        proc->proc_prev = root;
    }

    proc->proc_parent = (ProcPtr) rootIndex;
    ROOT_PROC(rootIndex) = proc;
}

// adds the process to the tree as a child of 'parent'
static void InsertChildProcess(struct Proc *proc, struct Proc *parent)
{
    if (parent->proc_child != NULL)  // parent already has a child
    {
        // add this process as a sibling
        ((struct Proc*) parent->proc_child)->proc_next = proc;
        proc->proc_prev = parent->proc_child;
    }
    parent->proc_child = proc;
    proc->proc_parent = parent;
}

// removes the process from the tree
static void UnlinkProcess(struct Proc *proc)
{
    int rootIndex;

    // remove sibling links to this process
    if (proc->proc_next != NULL)
        ((struct Proc*) proc->proc_next)->proc_prev = proc->proc_prev;
    if (proc->proc_prev != NULL)
        ((struct Proc*) proc->proc_prev)->proc_next = proc->proc_next;

    // remove parent links to this process
    rootIndex = (int) proc->proc_parent;
    if (rootIndex > 8)  // child proc
    {
        if (((struct Proc*) proc->proc_parent)->proc_child == proc)
            ((struct Proc*) proc->proc_parent)->proc_child = proc->proc_prev;
    }
    else  // root proc
    {
        if (ROOT_PROC(rootIndex) == proc)
            ROOT_PROC(rootIndex) = proc->proc_prev;
    }
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
}

// Runs all processes using a pre-order traversal.
static void RunProcessRecursive(struct Proc* proc)
{
    // Run previous sibling process
    if (proc->proc_prev != NULL)
        RunProcessRecursive(proc->proc_prev);
    // Run this process
    if (proc->proc_lockCnt == 0 && !(proc->proc_flags & PROC_FLAG_STARTING))
    {
        if (proc->proc_idleCb == NULL)
            RunProcessScript(proc);
        if (proc->proc_idleCb != NULL)
            proc->proc_idleCb(proc);
        if (proc->proc_flags & PROC_FLAG_ENDED)
            return;
    }
    // Run child process
    if (proc->proc_child != NULL)
        RunProcessRecursive(proc->proc_child);
}

void Proc_Run(ProcPtr proc)
{
    if (proc)
        RunProcessRecursive(proc);
}

void Proc_Break(ProcPtr proc)
{
    struct Proc* casted = (struct Proc*) proc;
    casted->proc_idleCb = NULL;
}

ProcPtr Proc_Find(const struct ProcCmd* script)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script)
            return proc;
    }

    return NULL;
}

// unreferenced
static ProcPtr Proc_FindNonBlocked(struct ProcCmd* script)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script && proc->proc_lockCnt == 0)
            return proc;
    }

    return NULL;
}

// unreferenced
static ProcPtr Proc_FindWithMark(u32 mark)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script != NULL && proc->proc_mark == mark)
            return proc;
    }

    return NULL;
}

void Proc_Goto(ProcPtr proc, int label)
{
    struct Proc* casted = (struct Proc*) proc;
    const struct ProcCmd* cmd;

    for (cmd = casted->proc_script; cmd->opcode != 0; cmd++)
    {
        if (cmd->opcode == 11 && cmd->dataImm == label)
        {
            casted->proc_scrCur = cmd;
            casted->proc_idleCb = NULL;

            return;
        }
    }
}

void Proc_GotoScript(ProcPtr proc, const struct ProcCmd* script)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_scrCur = script;
    casted->proc_idleCb = NULL;
}

void Proc_SetMark(ProcPtr proc, int mark)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_mark = mark;
}

void Proc_SetEndCb(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_endCb = func;
}

void Proc_ForAll(ProcFunc func)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script)
            func(proc);
    }
}

void Proc_ForEach(const struct ProcCmd* script, ProcFunc func)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script)
            func(proc);
    }
}

void Proc_ForEachMarked(int mark, ProcFunc func)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            func(proc);
    }
}

void Proc_BlockEachMarked(int mark)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            proc->proc_lockCnt++;
    }
}

void Proc_UnblockEachMarked(int mark)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark && proc->proc_lockCnt > 0)
            proc->proc_lockCnt--;
    }
}

void Proc_EndEachMarked(int mark)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            Proc_End(proc);
    }
}

static void Delete(ProcPtr proc)
{
    Proc_End(proc);
}

void Proc_EndEach(const struct ProcCmd* script)
{
    Proc_ForEach(script, Delete);
}

static void ClearNativeCallback(ProcPtr proc)
{
    Proc_Break(proc);
}

void Proc_BreakEach(const struct ProcCmd* script)
{
    Proc_ForEach(script, ClearNativeCallback);
}

static void ForAllFollowingProcs(struct Proc* proc, ProcFunc func)
{
    if (proc->proc_prev)
        ForAllFollowingProcs(proc->proc_prev, func);

    func(proc);

    if (proc->proc_child)
        ForAllFollowingProcs(proc->proc_child, func);
}

// unreferenced
static void sub_80030CC(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    func(casted);

    if (casted->proc_child)
        ForAllFollowingProcs(casted->proc_child, func);
}

static s8 ProcCmd_DELETE(struct Proc *proc)
{
    Proc_End(proc);

    return FALSE;
}

static s8 ProcCmd_SET_NAME(struct Proc *proc)
{
    proc->proc_name = proc->proc_scrCur->dataPtr;
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_CALL_ROUTINE(struct Proc *proc)
{
    ProcFunc func = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    func(proc);

    return TRUE;
}

static s8 ProcCmd_CALL_ROUTINE_2(struct Proc *proc)
{
    s8(*func)(ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    return func(proc);
}

static s8 ProcCmd_CALL_ROUTINE_ARG(struct Proc *proc)
{
    short arg = proc->proc_scrCur->dataImm;
    s8(*func)(short, ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    return func(arg, proc);
}

static s8 ProcCmd_WHILE_ROUTINE(struct Proc *proc)
{
    s8(*func)(ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;

    if (func(proc) == TRUE)
    {
        proc->proc_scrCur--;
        return FALSE;
    }

    return TRUE;
}

static s8 ProcCmd_LOOP_ROUTINE(struct Proc *proc)
{
    proc->proc_idleCb = proc->proc_scrCur->dataPtr;
    proc->proc_scrCur++;

    return FALSE;
}

static s8 ProcCmd_SET_DESTRUCTOR(struct Proc *proc)
{
    Proc_SetEndCb(proc, proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NEW_CHILD(struct Proc* proc)
{
    Proc_Start(proc->proc_scrCur->dataPtr, proc);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NEW_CHILD_BLOCKING(struct Proc* proc)
{
    Proc_StartBlocking(proc->proc_scrCur->dataPtr, proc);
    proc->proc_scrCur++;

    return FALSE;
}

static s8 ProcCmd_NEW_MAIN_BUGGED(struct Proc *proc)
{
    Proc_Start(proc->proc_scrCur->dataPtr, (struct Proc *)(u32) proc->proc_sleepTime);  // Why are we using sleepTime here?
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_WHILE_EXISTS(struct Proc *proc)
{
    s8 exists = (Proc_Find(proc->proc_scrCur->dataPtr) != NULL);

    if (exists)
        return FALSE;

    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_END_ALL(struct Proc *proc)
{
    Proc_EndEach(proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_BREAK_ALL_LOOP(struct Proc *proc)
{
    Proc_BreakEach(proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NOP(struct Proc *proc)
{
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_JUMP(struct Proc *proc)
{
    Proc_GotoScript(proc, proc->proc_scrCur->dataPtr);

    return TRUE;
}

static s8 ProcCmd_GOTO(struct Proc *proc)
{
    Proc_Goto(proc, proc->proc_scrCur->dataImm);

    return TRUE;
}

static void UpdateSleep(ProcPtr proc)
{
    ((struct Proc*) proc)->proc_sleepTime--;

    if (((struct Proc*) proc)->proc_sleepTime == 0)
        Proc_Break(proc);
}

static s8 ProcCmd_SLEEP(struct Proc *proc)
{
    if (proc->proc_scrCur->dataImm != 0)
    {
        proc->proc_sleepTime = proc->proc_scrCur->dataImm;
        proc->proc_idleCb = UpdateSleep;
    }

    proc->proc_scrCur++;

    return FALSE;
}

static s8 ProcCmd_SET_MARK(struct Proc *proc)
{
    proc->proc_mark = proc->proc_scrCur->dataImm;
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NOP2(struct Proc *proc)
{
    proc->proc_scrCur++;
    return TRUE;
}

static s8 ProcCmd_BLOCK(struct Proc *proc)
{
    return FALSE;
}

static s8 ProcCmd_END_IF_DUPLICATE(struct Proc *proc)
{
    int i;
    struct Proc *it = sProcArray;
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it->proc_script == proc->proc_script)
            count++;
    }

    if (count > 1)
    {
        Proc_End(proc);
        return FALSE;
    }

    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_END_DUPLICATES(struct Proc *proc)
{
    int i;
    struct Proc* it = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it != proc && it->proc_script == proc->proc_script)
        {
            Proc_End(it);
            break;
        }
    }

    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NOP3(struct Proc *proc)
{
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_SET_BIT4(struct Proc *proc)
{
    proc->proc_flags |= PROC_FLAG_UNK2;
    proc->proc_scrCur++;

    return TRUE;
}

static s8(*sProcessCmdTable[])(struct Proc*) =
{
    ProcCmd_DELETE,
    ProcCmd_SET_NAME,
    ProcCmd_CALL_ROUTINE,
    ProcCmd_LOOP_ROUTINE,
    ProcCmd_SET_DESTRUCTOR,
    ProcCmd_NEW_CHILD,
    ProcCmd_NEW_CHILD_BLOCKING,
    ProcCmd_NEW_MAIN_BUGGED,
    ProcCmd_WHILE_EXISTS,
    ProcCmd_END_ALL,
    ProcCmd_BREAK_ALL_LOOP,
    ProcCmd_NOP,
    ProcCmd_GOTO,
    ProcCmd_JUMP,
    ProcCmd_SLEEP,
    ProcCmd_SET_MARK,
    ProcCmd_BLOCK,
    ProcCmd_END_IF_DUPLICATE,
    ProcCmd_SET_BIT4,
    ProcCmd_NOP2,
    ProcCmd_WHILE_ROUTINE,
    ProcCmd_NOP3,
    ProcCmd_CALL_ROUTINE_2,
    ProcCmd_END_DUPLICATES,
    ProcCmd_CALL_ROUTINE_ARG,
    ProcCmd_NOP,
};

static void RunProcessScript(struct Proc* proc)
{
    if (proc->proc_script == NULL)
        return;

    if (proc->proc_lockCnt > 0)
        return;

    if (proc->proc_idleCb != NULL)
        return;

    while (sProcessCmdTable[proc->proc_scrCur->opcode](proc))
    {
        if (proc->proc_script == NULL)
            return;
    }
}

// This was likely used to print the process list in the debug version of the game,
// but does nothing in the release version.

static void PrintProcessName(struct Proc* proc)
{
}

static void PrintProcessNameRecursive(struct Proc* proc, int* indent)
{
    if (proc->proc_prev != NULL)
        PrintProcessNameRecursive(proc->proc_prev, indent);

    PrintProcessName(proc);

    if (proc->proc_child != NULL)
    {
        *indent += 2;
        PrintProcessNameRecursive(proc->proc_child, indent);
        *indent -= 2;
    }
}

// unreferenced
static void PrintProcessTree(struct Proc* proc)
{
    int indent = 4;

    PrintProcessName(proc);

    if (proc->proc_child != NULL)
    {
        indent += 2;
        PrintProcessNameRecursive(proc->proc_child, &indent);
        indent -= 2;
    }
}

// unreferenced
static void sub_800344C(void)
{
}

void Proc_SetRepeatCb(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_idleCb = func;
}

// unreferenced
static void Proc_BlockSemaphore(struct Proc *proc)
{
    proc->proc_lockCnt++;
}

// unreferenced
static void Proc_WakeSemaphore(struct Proc *proc)
{
    proc->proc_lockCnt--;
}

ProcPtr Proc_FindAfter(struct ProcCmd* script, struct Proc* proc)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_script == script)
            return proc;

        proc++;
    }

    return NULL;
}

struct Proc *Proc_FindAfterWithParent(struct Proc* proc, struct Proc* parent)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_parent == parent)
            return proc;

        proc++;
    }

    return NULL;
}

// unreferenced
static int sub_80034D4(void)
{
    int i, result = MAX_PROC_COUNT;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        if (sProcArray[i].proc_script)
            result--;
    }

    return result;
}

int sub_80034FC(const struct ProcCmd* script)
{
    struct Proc* proc = sProcArray;
    int i, result = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (script == NULL)
        {
            if (proc->proc_script != NULL)
                result++;
        }
        else
        {
            if (proc->proc_script == script)
                result++;
        }
    }

    return result;
}

void Proc_FindBegin(struct ProcFindIterator* it, const struct ProcCmd* script)
{
    it->proc = sProcArray;
    it->script = script;
    it->count = 0;
}

ProcPtr Proc_FindNext(struct ProcFindIterator* it)
{
    struct Proc* result = NULL;

    while (it->count < MAX_PROC_COUNT)
    {
        if (it->proc->proc_script == it->script)
            result = it->proc;

        it->count++;
        it->proc++;

        if (result)
            return result;
    }

    return NULL;
}
