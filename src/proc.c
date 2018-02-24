#include "global.h"
#include "proc.h"

#define PROC_FLAG_0x01 (1 << 0)  // process is inactive?
#define PROC_FLAG_BLOCKING (1 << 1)
#define PROC_FLAG_0x04 (1 << 2)
#define PROC_FLAG_0x08 (1 << 3)

#define MAX_PROC_COUNT 64

EWRAM_DATA static struct Proc gProcesses[MAX_PROC_COUNT] = {0}; 
EWRAM_DATA static struct Proc *sProcessAllocList[MAX_PROC_COUNT + 1] = {0};
EWRAM_DATA static struct Proc **sProcessAllocListHead = NULL;  // pointer to next entry in sProcessAllocList
EWRAM_DATA struct Proc *gRootProcesses[8] = {0};

static struct Proc *AllocateProcess(void);
static void FreeProcess(struct Proc *proc);
static void InsertRootProcess(struct Proc *proc, s32 rootIndex);
static void InsertChildProcess(struct Proc *proc, struct Proc *parent);
static void UnlinkProcess(struct Proc *proc);
static void RunProcessScript(struct Proc *proc);

void Proc_Initialize(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        struct Proc *proc = &gProcesses[i];

        proc->script = NULL;
        proc->currCmd = NULL;
        proc->onDelete = NULL;
        proc->nativeFunc = NULL;
        proc->name = NULL;
        proc->parent = NULL;
        proc->child = NULL;
        proc->next = NULL;
        proc->prev = NULL;
        proc->sleepTime = 0;
        proc->mark = 0;
        proc->flags = 0;
        proc->blockSemaphore = 0;

        sProcessAllocList[i] = proc;
    }

    sProcessAllocList[MAX_PROC_COUNT] = NULL;
    sProcessAllocListHead = sProcessAllocList;

    for (i = 0; i < 8; i++)
        gRootProcesses[i] = NULL;
}

struct Proc *Proc_Create(struct ProcCmd *script, struct Proc *parent)
{
    struct Proc *proc = AllocateProcess();
    int rootIndex;

    proc->script = script;
    proc->currCmd = script;
    proc->onDelete = NULL;
    proc->nativeFunc = NULL;
    proc->parent = NULL;
    proc->child = NULL;
    proc->next = NULL;
    proc->prev = NULL;
    proc->sleepTime = 0;
    proc->mark = 0;
    proc->blockSemaphore = 0;
    proc->flags = PROC_FLAG_0x08;

    rootIndex = (int)parent;
    if (rootIndex < 8)  // If this is an integer less than 8, then add a root proc
        InsertRootProcess(proc, rootIndex);
    else
        InsertChildProcess(proc, parent);
    RunProcessScript(proc);

    proc->flags &= ~PROC_FLAG_0x08;
    return proc;
}

// Creates a child process and puts the parent into a wait state
struct Proc *Proc_CreateBlockingChild(struct ProcCmd *script, struct Proc *parent)
{
    struct Proc *proc = Proc_Create(script, parent);

    if (proc->script == NULL)
        return NULL;
    proc->flags |= PROC_FLAG_BLOCKING;
    proc->parent->blockSemaphore++;
    return proc;
}

static void DeleteProcessRecursive(struct Proc *proc)
{
    if (proc->prev != NULL)
        DeleteProcessRecursive(proc->prev);
    if (proc->child != NULL)
        DeleteProcessRecursive(proc->child);
    if (proc->flags & PROC_FLAG_0x01)
        return;
    if (proc->onDelete != NULL)
        proc->onDelete(proc);
    FreeProcess(proc);
    proc->script = NULL;
    proc->nativeFunc = NULL;
    proc->flags |= PROC_FLAG_0x01;
    if (proc->flags & PROC_FLAG_BLOCKING)
        proc->parent->blockSemaphore--;
}

void Proc_Delete(struct Proc *proc)
{
    if (proc != NULL)
    {
        UnlinkProcess(proc);
        DeleteProcessRecursive(proc);
    }
}

static struct Proc *AllocateProcess(void)
{
    // retrieve the next entry in the allocation list
    struct Proc *proc = *sProcessAllocListHead;
    sProcessAllocListHead++;
    return proc;
}

static void FreeProcess(struct Proc *proc)
{
    // place the process back into the allocation list
    sProcessAllocListHead--;
    *sProcessAllocListHead = proc;
}

// adds the process as a root process
static void InsertRootProcess(struct Proc *proc, s32 rootIndex)
{
    struct Proc *r0;

    r0 = rootIndex[gRootProcesses];  // gRootProcesses[rootIndex]
    if (r0 != NULL)  // root process already exists
    {
        // add this process as a sibling
        r0->next = proc;
        proc->prev = r0;
    }
    proc->parent = (struct Proc *)rootIndex;
    gRootProcesses[rootIndex] = proc;
}

// adds the process to the tree as a child of 'parent'
static void InsertChildProcess(struct Proc *proc, struct Proc *parent)
{
    if (parent->child != NULL)  // parent already has a child
    {
        // add this process as a sibling
        parent->child->next = proc;
        proc->prev = parent->child;
    }
    parent->child = proc;
    proc->parent = parent;
}

// removes the process from the tree
static void UnlinkProcess(struct Proc *proc)
{
    int rootIndex;

    // remove sibling links to this process
    if (proc->next != NULL)
        proc->next->prev = proc->prev;
    if (proc->prev != NULL)
        proc->prev->next = proc->next;

    // remove parent links to this process
    rootIndex = (int)proc->parent;
    if (rootIndex > 8)  // child proc
    {
        if (proc->parent->child == proc)
            proc->parent->child = proc->prev;
    }
    else  // root proc
    {
        if (rootIndex[gRootProcesses] == proc)
            rootIndex[gRootProcesses] = proc->prev;
    }
    proc->next = NULL;
    proc->prev = NULL;
}

// Runs all processes using a pre-order traversal.
static void RunProcessRecursive(struct Proc *proc)
{
    // Run previous sibling process
    if (proc->prev != NULL)
        RunProcessRecursive(proc->prev);
    // Run this process
    if (proc->blockSemaphore == 0 && !(proc->flags & PROC_FLAG_0x08))
    {
        if (proc->nativeFunc == NULL)
            RunProcessScript(proc);
        if (proc->nativeFunc != NULL)
            proc->nativeFunc(proc);
        if (proc->flags & PROC_FLAG_0x01)
            return;
    }
    // Run child process
    if (proc->child != NULL)
        RunProcessRecursive(proc->child);
}

void Proc_Run(struct Proc *proc)
{
    if (proc != NULL)
        RunProcessRecursive(proc);
}

void Proc_ClearNativeCallback(struct Proc *proc)
{
    proc->nativeFunc = NULL;
}

struct Proc *Proc_Find(struct ProcCmd *script)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->script == script)
            return proc;
    }
    return NULL;
}

// unreferenced
static struct Proc *Proc_FindNonBlocked(struct ProcCmd *script)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->script == script && proc->blockSemaphore == 0)
            return proc;
    }
    return NULL;
}

// unreferenced
static struct Proc *Proc_FindWithMark(u32 mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->script != NULL && proc->mark == mark)
            return proc;
    }
    return NULL;
}

void Proc_GotoLabel(struct Proc* proc_arg, int label)
{
    struct Proc* proc = proc_arg;
    struct ProcCmd* ptr;

    for (ptr = proc->script; ptr->opcode != 0; ptr++)
    {
        if (ptr->opcode == 11 && ptr->dataImm == label)
        {
            proc->currCmd = ptr;
            proc->nativeFunc = NULL;
            return;
        }
    }
}

void Proc_JumpToPointer(struct Proc *proc, struct ProcCmd *ptr)
{
    proc->currCmd = ptr;
    proc->nativeFunc = NULL;
}

void Proc_SetMark(struct Proc *proc, u8 mark)
{
    proc->mark = mark;
}

void Proc_SetDestructor(struct Proc *proc, ProcFunc func)
{
    proc->onDelete = func;
}

void Proc_ForEach(ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->script != NULL)
            func(proc);
    }
}

void Proc_ForEachWithScript(struct ProcCmd *script, ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->script == script)
            func(proc);
    }
}

void Proc_ForEachWithMark(int mark, ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            func(proc);
    }
}

void Proc_BlockEachWithMark(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            proc->blockSemaphore++;
    }
}

void Proc_UnblockEachWithMark(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark && proc->blockSemaphore > 0)
            proc->blockSemaphore--;
    }
}

void Proc_DeleteEachWithMark(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            Proc_Delete(proc);
    }
}

static void Delete(struct Proc *proc)
{
    Proc_Delete(proc);
}

void Proc_DeleteAllWithScript(struct ProcCmd *script)
{
    Proc_ForEachWithScript(script, Delete);
}

static void ClearNativeCallback(struct Proc *proc)
{
    Proc_ClearNativeCallback(proc);
}

void Proc_ClearNativeCallbackEachWithScript(struct ProcCmd *script)
{
    Proc_ForEachWithScript(script, ClearNativeCallback);
}

static void ForAllFollowingProcs(struct Proc *proc, ProcFunc func)
{
    if (proc->prev != NULL)
        ForAllFollowingProcs(proc->prev, func);
    func(proc);
    if (proc->child != NULL)
        ForAllFollowingProcs(proc->child, func);
}

// unreferenced
static void sub_80030CC(struct Proc *proc, ProcFunc func)
{
    func(proc);
    if (proc->child != NULL)
        ForAllFollowingProcs(proc->child, func);
}

static s8 ProcCmd_DELETE(struct Proc *proc)
{
    Proc_Delete(proc);
    return 0;
}

static s8 ProcCmd_SET_NAME(struct Proc *proc)
{
    proc->name = proc->currCmd->dataPtr;
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_CALL_ROUTINE(struct Proc *proc)
{
    ProcFunc func = proc->currCmd->dataPtr;

    proc->currCmd++;
    func(proc);
    return 1;
}

static s8 ProcCmd_CALL_ROUTINE_2(struct Proc *proc)
{
    s8 (*func)(struct Proc *) = proc->currCmd->dataPtr;

    proc->currCmd++;
    return func(proc);
}

static s8 ProcCmd_CALL_ROUTINE_ARG(struct Proc *proc)
{
    s16 arg = proc->currCmd->dataImm;
    s8 (*func)(s16, struct Proc *) = proc->currCmd->dataPtr;

    proc->currCmd++;
    return func(arg, proc);
}

static s8 ProcCmd_WHILE_ROUTINE(struct Proc *proc)
{
    s8 (*func)(struct Proc *) = proc->currCmd->dataPtr;

    proc->currCmd++;
    if (func(proc) == 1)
    {
        proc->currCmd--;
        return 0;
    }
    return 1;
}

static s8 ProcCmd_LOOP_ROUTINE(struct Proc *proc)
{
    proc->nativeFunc = proc->currCmd->dataPtr;
    proc->currCmd++;
    return 0;
}

static s8 ProcCmd_SET_DESTRUCTOR(struct Proc *proc)
{
    Proc_SetDestructor(proc, proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_NEW_CHILD(struct Proc *proc)
{
    Proc_Create(proc->currCmd->dataPtr, proc);
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_NEW_CHILD_BLOCKING(struct Proc *proc)
{
    Proc_CreateBlockingChild(proc->currCmd->dataPtr, proc);
    proc->currCmd++;
    return 0;
}

static s8 ProcCmd_NEW_MAIN_BUGGED(struct Proc *proc)
{
    Proc_Create(proc->currCmd->dataPtr, (struct Proc *)(u32)proc->sleepTime);  // Why are we using sleepTime here?
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_WHILE_EXISTS(struct Proc *proc)
{
    bool8 exists = (Proc_Find(proc->currCmd->dataPtr) != NULL);

    if (exists)
        return 0;
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_END_ALL(struct Proc *proc)
{
    Proc_DeleteAllWithScript(proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_BREAK_ALL_LOOP(struct Proc *proc)
{
    Proc_ClearNativeCallbackEachWithScript(proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_NOP(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_JUMP(struct Proc *proc)
{
    Proc_JumpToPointer(proc, proc->currCmd->dataPtr);
    return 1;
}

static s8 ProcCmd_GOTO(struct Proc *proc)
{
    Proc_GotoLabel(proc, proc->currCmd->dataImm);
    return 1;
}

static void UpdateSleep(struct Proc *proc)
{
    proc->sleepTime--;
    if (proc->sleepTime == 0)
        Proc_ClearNativeCallback(proc);
}

static s8 ProcCmd_SLEEP(struct Proc *proc)
{
    if (proc->currCmd->dataImm != 0)
    {
        proc->sleepTime = proc->currCmd->dataImm;
        proc->nativeFunc = UpdateSleep;
    }
    proc->currCmd++;
    return 0;
}

static s8 ProcCmd_SET_MARK(struct Proc *proc)
{
    proc->mark = proc->currCmd->dataImm;
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_NOP2(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_BLOCK(struct Proc *proc)
{
    return 0;
}

static s8 ProcCmd_END_IF_DUPLICATE(struct Proc *proc)
{
    int i;
    struct Proc *p = &gProcesses[0];
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p->script == proc->script)
            count++;
    }
    if (count > 1)
    {
        Proc_Delete(proc);
        return 0;
    }
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_END_DUPLICATES(struct Proc *proc)
{
    int i;
    struct Proc *p = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p != proc && p->script == proc->script)
        {
            Proc_Delete(p);
            break;
        }
    }
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_NOP3(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

static s8 ProcCmd_SET_BIT4(struct Proc *proc)
{
    proc->flags |= PROC_FLAG_0x04;
    proc->currCmd++;
    return 1;
}

static s8 (*const sProcessCmdTable[])(struct Proc *) =
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

static void RunProcessScript(struct Proc *proc)
{
    if (proc->script == NULL)
        return;
    if (proc->blockSemaphore > 0)
        return;
    if (proc->nativeFunc != NULL)
        return;
    while (sProcessCmdTable[proc->currCmd->opcode](proc) != 0)
    {
        if (proc->script == NULL)
            return;
    }
}

// This was likely used to print the process list in the debug version of the game,
// but does nothing in the release version.

static void PrintProcessName(struct Proc *proc)
{
}

static void PrintProcessNameRecursive(struct Proc *proc, int *indent)
{
    if (proc->prev != NULL)
        PrintProcessNameRecursive(proc->prev, indent);
    PrintProcessName(proc);
    if (proc->child != NULL)
    {
        *indent += 2;
        PrintProcessNameRecursive(proc->child, indent);
        *indent -= 2;
    }
}

// unreferenced
static void PrintProcessTree(struct Proc *proc)
{
    int indent = 4;

    PrintProcessName(proc);
    if (proc->child != NULL)
    {
        indent += 2;
        PrintProcessNameRecursive(proc->child, &indent);
        indent -= 2;
    }
}

// unreferenced
static void sub_800344C(void)
{
}

void Proc_SetNativeFunc(struct Proc *proc, ProcFunc func)
{
    proc->nativeFunc = func;
}

// unreferenced
static void Proc_BlockSemaphore(struct Proc *proc)
{
    proc->blockSemaphore++;
}

// unreferenced
static void Proc_WakeSemaphore(struct Proc *proc)
{
    proc->blockSemaphore--;
}

struct Proc *Proc_FindAfter(struct ProcCmd *script, struct Proc *proc)
{
    if (proc == NULL)
        proc = gProcesses;
    else
        proc++;

    while (proc < gProcesses + MAX_PROC_COUNT)
    {
        if (proc->script == script)
            return proc;
        proc++;
    }
    return NULL;
}

struct Proc *Proc_FindAfterWithParent(struct Proc *proc, struct Proc *parent)
{
    if (proc == NULL)
        proc = gProcesses;
    else
        proc++;

    while (proc < gProcesses + MAX_PROC_COUNT)
    {
        if (proc->parent == parent)
            return proc;
        proc++;
    }
    return NULL;
}

// unreferenced
static int sub_80034D4(void)
{
    int i;
    int r2 = MAX_PROC_COUNT;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        if (gProcesses[i].script != NULL)
            r2--;
    }
    return r2;
}

int sub_80034FC(struct ProcCmd *script)
{
    int i;
    struct Proc *proc = &gProcesses[0];
    int r1 = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (script == NULL)
        {
            if (proc->script != NULL)
                r1++;
        }
        else
        {
            if (proc->script == script)
                r1++;
        }
    }
    return r1;
}

void sub_8003530(struct UnknownProcStruct *a, struct ProcCmd *script)
{
    a->unk0 = &gProcesses[0];
    a->unk4 = script;
    a->unk8 = 0;
}

struct Proc *sub_8003540(struct UnknownProcStruct *a)
{
    struct Proc *r4 = NULL;

    while (a->unk8 < MAX_PROC_COUNT)
    {
        if (a->unk0->script == a->unk4)
            r4 = a->unk0;
        a->unk8++;
        a->unk0++;
        if (r4 != 0)
            return r4;
    }
    return NULL;
}
