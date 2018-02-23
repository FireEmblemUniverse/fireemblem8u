#include "global.h"
#include "proc.h"

#define PROC_FLAG_0x01 (1 << 0)  // process is inactive?
#define PROC_FLAG_BLOCKED (1 << 1)
#define PROC_FLAG_0x04 (1 << 2)
#define PROC_FLAG_0x08 (1 << 3)

#define MAX_PROC_COUNT 64

struct Proc *Allocate6C(void);
void InsertMain6C();
void InsertChild6C();
void Call6CCode();
void Free6C();
void Isolate6C();

extern struct Proc gProcesses[MAX_PROC_COUNT];
extern struct Proc *gUnknown_02026968[MAX_PROC_COUNT + 1];
extern struct Proc **gUnknown_02026A6C;
extern struct Proc *gRootProcesses[8];
extern s8 (*const gProcCmdFuncs[])(struct Proc *);

void Initialize6CEngine(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        struct Proc *proc = &gProcesses[i];

        proc->scriptStart = NULL;
        proc->currCmd = NULL;
        proc->onDestroy = NULL;
        proc->onCycle = NULL;
        proc->name = NULL;
        proc->parent = NULL;
        proc->child = NULL;
        proc->prev = NULL;
        proc->next = NULL;
        proc->sleepTime = 0;
        proc->mark = 0;
        proc->flags = 0;
        proc->blockSemaphore = 0;

        gUnknown_02026968[i] = proc;
    }

    gUnknown_02026968[MAX_PROC_COUNT] = NULL;
    gUnknown_02026A6C = gUnknown_02026968;

    for (i = 0; i < 8; i++)
        gRootProcesses[i] = NULL;
}

struct Proc *New6C(struct ProcCmd *script, struct Proc *parent)
{
    struct Proc *proc = Allocate6C();

    proc->scriptStart = script;
    proc->currCmd = script;
    proc->onDestroy = NULL;
    proc->onCycle = NULL;
    proc->parent = NULL;
    proc->child = NULL;
    proc->prev = NULL;
    proc->next = NULL;
    proc->sleepTime = 0;
    proc->mark = 0;
    proc->blockSemaphore = 0;
    proc->flags = PROC_FLAG_0x08;

    if ((int)parent < 8)  // If this is an integer less than 8, then add a root proc
        InsertMain6C(proc, parent);
    else
        InsertChild6C(proc, parent);
    Call6CCode(proc);

    proc->flags &= ~PROC_FLAG_0x08;
    return proc;
}

struct Proc *NewBlocking6C(struct ProcCmd *script, struct Proc *parent)
{
    struct Proc *proc = New6C(script, parent);

    if (proc->scriptStart == NULL)
        return NULL;
    proc->flags |= PROC_FLAG_BLOCKED;
    proc->parent->blockSemaphore++;
    return proc;
}

void Delete6CInternal(struct Proc *proc)
{
    if (proc->next != NULL)
        Delete6CInternal(proc->next);
    if (proc->child != NULL)
        Delete6CInternal(proc->child);
    if (proc->flags & PROC_FLAG_0x01)
        return;
    if (proc->onDestroy != NULL)
        proc->onDestroy(proc);
    Free6C(proc);
    proc->scriptStart = NULL;
    proc->onCycle = NULL;
    proc->flags |= PROC_FLAG_0x01;
    if (proc->flags & PROC_FLAG_BLOCKED)
        proc->parent->blockSemaphore--;
}

void Delete6C(struct Proc *proc)
{
    if (proc != NULL)
    {
        Isolate6C(proc);
        Delete6CInternal(proc);
    }
}

struct Proc *Allocate6C(void)
{
    struct Proc *proc = *gUnknown_02026A6C;

    gUnknown_02026A6C++;
    return proc;
}

void Free6C(struct Proc *proc)
{
    gUnknown_02026A6C--;
    *gUnknown_02026A6C = proc;
}

void InsertMain6C(struct Proc *proc, s32 rootIndex)
{
    struct Proc *r0;

    r0 = rootIndex[gRootProcesses];  // gRootProcesses[rootIndex]
    if (r0 != NULL)
    {
        r0->prev = proc;
        proc->next = r0;
    }
    proc->parent = (struct Proc *)rootIndex;
    gRootProcesses[rootIndex] = proc;
}

void InsertChild6C(struct Proc *proc, struct Proc *parent)
{
    if (parent->child != NULL)
    {
        parent->child->prev = proc;
        proc->next = parent->child;
    }
    parent->child = proc;
    proc->parent = parent;
}

void Isolate6C(struct Proc *proc)
{
    int rootIndex;

    if (proc->prev != NULL)
        proc->prev->next = proc->next;
    if (proc->next != NULL)
        proc->next->prev = proc->prev;
        
    rootIndex = (int)proc->parent;
    if (rootIndex > 8)  // this is a child proc
    {
        if (proc->parent->child == proc)
            proc->parent->child = proc->next;
    }
    else  // this is a root proc
    {
        if (rootIndex[gRootProcesses] == proc)
            rootIndex[gRootProcesses] = proc->next;
    }
    proc->prev = NULL;
    proc->next = NULL;
}

void Exec6C_(struct Proc *proc)
{
    if (proc->next != NULL)
        Exec6C_(proc->next);
    if (proc->blockSemaphore == 0 && !(proc->flags & PROC_FLAG_0x08))
    {
        if (proc->onCycle == NULL)
            Call6CCode(proc);
        if (proc->onCycle != NULL)
            proc->onCycle(proc);
        if (proc->flags & PROC_FLAG_0x01)
            return;
    }
    if (proc->child != NULL)
        Exec6C_(proc->child);
}

void Exec6C(struct Proc *proc)
{
    if (proc != NULL)
        Exec6C_(proc);
}

void Break6CLoop(struct Proc *proc)
{
    proc->onCycle = NULL;
}

struct Proc *Find6C(struct ProcCmd *script)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->scriptStart == script)
            return proc;
    }
    return NULL;
}

struct Proc *sub_8002EC4(struct ProcCmd *script)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->scriptStart == script && proc->blockSemaphore == 0)
            return proc;
    }
    return NULL;
}

struct Proc *sub_8002EF4(u32 mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->scriptStart != NULL && proc->mark == mark)
            return proc;
    }
    return NULL;
}

void Goto6CLabel(struct Proc* proc_arg, int identifier)
{
    struct Proc* proc = proc_arg;
    struct ProcCmd* ptr;

    for (ptr = proc->scriptStart; ptr->opcode != 0; ptr++)
    {
        if (ptr->opcode == 11 && (s16)ptr->dataImm == identifier)
        {
            proc->currCmd = ptr;
            proc->onCycle = NULL;
            
            return;
        }
    }
}

void Goto6CPointer(struct Proc *proc, struct ProcCmd *ptr)
{
    proc->currCmd = ptr;
    proc->onCycle = NULL;
}

void Set6CMark(struct Proc *proc, u8 mark)
{
    proc->mark = mark;
}

void Set6CDestructor(struct Proc *proc, ProcFunc func)
{
    proc->onDestroy = func;
}

void ForAll6C(ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->scriptStart != NULL)
            func(proc);
    }
}

void ForEach6C(struct ProcCmd *script, ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->scriptStart == script)
            func(proc);
    }
}

void sub_8002FC0(int mark, ProcFunc func)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            func(proc);
    }
}

void BlockEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            proc->blockSemaphore++;
    }
}

void UnblockEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark && proc->blockSemaphore > 0)
            proc->blockSemaphore--;
    }
}

void DeleteEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            Delete6C(proc);
    }
}

void Delete6C_(struct Proc *proc)
{
    Delete6C(proc);
}

void DeleteEach6C(struct ProcCmd *code)
{
    ForEach6C(code, Delete6C_);
}

void Clear6CLoopWrapper(struct Proc *proc)
{
    Break6CLoop(proc);
}

void ClearCallbackAll6CMatch(struct ProcCmd *script)
{
    ForEach6C(script, Clear6CLoopWrapper);
}

void ForAllFollowing6C(struct Proc *proc, ProcFunc func)
{
    if (proc->next != NULL)
        ForAllFollowing6C(proc->next, func);
    func(proc);
    if (proc->child != NULL)
        ForAllFollowing6C(proc->child, func);
}

void sub_80030CC(struct Proc *proc, ProcFunc func)
{
    func(proc);
    if (proc->child != NULL)
        ForAllFollowing6C(proc->child, func);
}

int Call6C_00Delete(struct Proc *proc)
{
    Delete6C(proc);
    return 0;
}

int Call6C_01Name(struct Proc *proc)
{
    proc->name = proc->currCmd->dataPtr;
    proc->currCmd++;
    return 1;
}

int Call6C_02CallAndContinue(struct Proc *proc)
{
    ProcFunc func = proc->currCmd->dataPtr;

    proc->currCmd++;
    func(proc);
    return 1;
}

int Call6C_16Call(struct Proc *proc)
{
    s8 (*func)(struct Proc *) = proc->currCmd->dataPtr;

    proc->currCmd++;
    return func(proc);
}

int Call6C_18CallWithArg(struct Proc *proc)
{
    s16 arg = proc->currCmd->dataImm;
    s8 (*func)(s16, struct Proc *) = proc->currCmd->dataPtr;

    proc->currCmd++;
    return func(arg, proc);
}

int Call6C_14While(struct Proc *proc)
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

int Call6C_03SetLoop(struct Proc *proc)
{
    proc->onCycle = proc->currCmd->dataPtr;
    proc->currCmd++;
    return 0;
}

int Call6C_04SetDestructor(struct Proc *proc)
{
    Set6CDestructor(proc, proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

int Call6C_05AddChild(struct Proc *proc)
{
    New6C(proc->currCmd->dataPtr, proc);
    proc->currCmd++;
    return 1;
}

int Call6C_06AddBlockingChild(struct Proc *proc)
{
    NewBlocking6C(proc->currCmd->dataPtr, proc);
    proc->currCmd++;
    return 0;
}

int Call6C_07AddGlobal_BuggedMaybe(struct Proc *proc)
{
    New6C(proc->currCmd->dataPtr, (struct Proc *)(u32)proc->sleepTime);  // Why are we using sleepTime here?
    proc->currCmd++;
    return 1;
}

int Call6C_08WhileExists(struct Proc *proc)
{
    bool8 exists = (Find6C(proc->currCmd->dataPtr) != NULL);

    if (exists)
        return 0;
    proc->currCmd++;
    return 1;
}

int Call6C_09DeleteEach6C(struct Proc *proc)
{
    DeleteEach6C(proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

int Call6C_0AClearLoopForEach6C(struct Proc *proc)
{
    ClearCallbackAll6CMatch(proc->currCmd->dataPtr);
    proc->currCmd++;
    return 1;
}

int Call6C_0BOr19Label(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

int Call6C_0DJump(struct Proc *proc)
{
    Goto6CPointer(proc, proc->currCmd->dataPtr);
    return 1;
}

int Call6C_0CGotoLabel(struct Proc *proc)
{
    Goto6CLabel(proc, proc->currCmd->dataImm);
    return 1;
}

void _6CSleepLoop(struct Proc *proc)
{
    proc->sleepTime--;
    if (proc->sleepTime == 0)
        Break6CLoop(proc);
}

int Call6C_0ESleep(struct Proc *proc)
{
    if (proc->currCmd->dataImm != 0)
    {
        proc->sleepTime = proc->currCmd->dataImm;
        proc->onCycle = _6CSleepLoop;
    }
    proc->currCmd++;
    return 0;
}

int Call6C_0FMark(struct Proc *proc)
{
    proc->mark = proc->currCmd->dataImm;
    proc->currCmd++;
    return 1;
}

int Call6C_13Blank(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

int Call6C_10Block(struct Proc *proc)
{
    return 0;
}

int Call6C_11DeleteIfDuplicate(struct Proc *proc)
{
    int i;
    struct Proc *p = &gProcesses[0];
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p->scriptStart == proc->scriptStart)
            count++;
    }
    if (count > 1)
    {
        Delete6C(proc);
        return 0;
    }
    proc->currCmd++;
    return 1;
}

int Call6C_17DeleteOtherDuplicates(struct Proc *proc)
{
    int i;
    struct Proc *p = &gProcesses[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p != proc && p->scriptStart == proc->scriptStart)
        {
            Delete6C(p);
            break;
        }
    }
    proc->currCmd++;
    return 1;
}

int Call6C_15Blank(struct Proc *proc)
{
    proc->currCmd++;
    return 1;
}

int Call6C_12SetBit4(struct Proc *proc)
{
    proc->flags |= PROC_FLAG_0x04;
    proc->currCmd++;
    return 1;
}

void Call6CCode(struct Proc *proc)
{
    if (proc->scriptStart == NULL)
        return;
    if (proc->blockSemaphore > 0)
        return;
    if (proc->onCycle != NULL)
        return;
    while (gProcCmdFuncs[proc->currCmd->opcode](proc) != 0)
    {
        if (proc->scriptStart == NULL)
            return;
    }
}

// This was likely used to print the process list in the debug version of the game,
// but does nothing in the release version.

void nullsub_2(struct Proc *proc)
{
}

void ForEach6CDoNothing(struct Proc *proc, int *indent)
{
    if (proc->next != NULL)
        ForEach6CDoNothing(proc->next, indent);
    nullsub_2(proc);
    if (proc->child != NULL)
    {
        *indent += 2;
        ForEach6CDoNothing(proc->child, indent);
        *indent -= 2;
    }
}

void sub_8003418(struct Proc *proc)
{
    int indent = 4;

    nullsub_2(proc);
    if (proc->child != NULL)
    {
        indent += 2;
        ForEach6CDoNothing(proc->child, &indent);
        indent -= 2;
    }
}

void sub_800344C(void)
{
}

void Set6CLoop(struct Proc *proc, ProcFunc func)
{
    proc->onCycle = func;
}

void sub_8003454(struct Proc *proc)
{
    proc->blockSemaphore++;
}

void sub_8003460(struct Proc *proc)
{
    proc->blockSemaphore--;
}

struct Proc *Find6C_(struct ProcCmd *script, struct Proc *proc)
{
    if (proc == NULL)
        proc = gProcesses;
    else
        proc++;

    while (proc < gProcesses + MAX_PROC_COUNT)
    {
        if (proc->scriptStart == script)
            return proc;
        proc++;
    }
    return NULL;
}

struct Proc *sub_80034A0(struct Proc *proc, struct Proc *parent)
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

int sub_80034D4(void)
{
    int i;
    int r2 = MAX_PROC_COUNT;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        if (gProcesses[i].scriptStart != NULL)
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
            if (proc->scriptStart != NULL)
                r1++;
        }
        else
        {
            if (proc->scriptStart == script)
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
        if (a->unk0->scriptStart == a->unk4)
            r4 = a->unk0;
        a->unk8++;
        a->unk0++;
        if (r4 != 0)
            return r4;
    }
    return NULL;
}
