#include "global.h"
#include "proc.h"

#define PROC_FLAG_0x01 (1 << 0)
#define PROC_FLAG_0x02 (1 << 1)
#define PROC_FLAG_0x04 (1 << 2)
#define PROC_FLAG_0x08 (1 << 3)

#define MAX_PROC_COUNT 64

struct Proc *Allocate6C(void);
void InsertMain6C();
void InsertChild6C();
void Call6CCode();
void Free6C();
void Isolate6C();

extern struct Proc gUnknown_02024E68[MAX_PROC_COUNT];
extern struct Proc *gUnknown_02026968[MAX_PROC_COUNT + 1];
extern struct Proc **gUnknown_02026A6C;
extern struct Proc *gUnknown_02026A70[8];
extern s8 (*const gUnknown_085879D8[])(struct Proc *);

void Initialize6CEngine(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        struct Proc *proc = &gUnknown_02024E68[i];

        proc->codeStart = NULL;
        proc->codeNext = NULL;
        proc->onDestroy = NULL;
        proc->onCycle = NULL;
        proc->name = NULL;
        proc->unk14 = NULL;
        proc->child = NULL;
        proc->prev = NULL;
        proc->next = NULL;
        proc->sleepTime = 0;
        proc->mark = 0;
        proc->flags = 0;
        proc->blockCount = 0;

        gUnknown_02026968[i] = proc;
    }

    gUnknown_02026968[MAX_PROC_COUNT] = NULL;
    gUnknown_02026A6C = gUnknown_02026968;

    for (i = 0; i < 8; i++)
        gUnknown_02026A70[i] = NULL;
}

struct Proc *New6C(struct ProcCmd *a, s32 b)
{
    struct Proc *proc = Allocate6C();

    proc->codeStart = a;
    proc->codeNext = a;
    proc->onDestroy = NULL;
    proc->onCycle = NULL;
    proc->unk14 = NULL;
    proc->child = NULL;
    proc->prev = NULL;
    proc->next = NULL;
    proc->sleepTime = 0;
    proc->mark = 0;
    proc->blockCount = 0;
    proc->flags = PROC_FLAG_0x08;

    if (b < 8)
        InsertMain6C(proc, b);
    else
        InsertChild6C(proc, b);
    Call6CCode(proc);

    proc->flags &= ~PROC_FLAG_0x08;
    return proc;
}

struct Proc *NewBlocking6C(struct ProcCmd *a, s32 b)
{
    struct Proc *proc = New6C(a, b);

    if (proc->codeStart == 0)
        return NULL;
    proc->flags |= PROC_FLAG_0x02;
    proc->unk14->blockCount++;
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
    if (proc->onDestroy != 0)
        proc->onDestroy(proc);
    Free6C(proc);
    proc->codeStart = 0;
    proc->onCycle = 0;
    proc->flags |= PROC_FLAG_0x01;
    if (proc->flags & PROC_FLAG_0x02)
        proc->unk14->blockCount--;
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

void InsertMain6C(struct Proc *proc, s32 b)
{
    struct Proc *r0;

    asm(""::"r"(b * 4));
    r0 = gUnknown_02026A70[b];
    if (r0 != NULL)
    {
        r0->prev = proc;
        proc->next = r0;
    }
    proc->unk14 = (struct Proc *)b;
    gUnknown_02026A70[b] = proc;
}

void InsertChild6C(struct Proc *proc, struct Proc *parent)
{
    if (parent->child != NULL)
    {
        parent->child->prev = proc;
        proc->next = parent->child;
    }
    parent->child = proc;
    proc->unk14 = parent;
}

void Isolate6C(struct Proc *proc)
{
    if (proc->prev != NULL)
        proc->prev->next = proc->next;
    if (proc->next != NULL)
        proc->next->prev = proc->prev;
    if ((int)proc->unk14 > 8)
    {
        if (proc->unk14->child == proc)
            proc->unk14->child = proc->next;
    }
    else
    {
        int r1 = (int)proc->unk14;

        asm(""::"r"(r1 * 4));
        if (gUnknown_02026A70[r1] == proc)
            gUnknown_02026A70[r1] = proc->next;
    }
    proc->prev = NULL;
    proc->next = NULL;
}

void Exec6C_(struct Proc *proc)
{
    if (proc->next != NULL)
        Exec6C_(proc->next);
    if (proc->blockCount == 0 && !(proc->flags & PROC_FLAG_0x08))
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

struct Proc *Find6C(struct ProcCmd *a)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->codeStart == a)
            return proc;
    }
    return NULL;
}

struct Proc *sub_8002EC4(struct ProcCmd *a)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->codeStart == a && proc->blockCount == 0)
            return proc;
    }
    return NULL;
}

struct Proc *sub_8002EF4(u32 a)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->codeStart != NULL && proc->mark == a)
            return proc;
    }
    return NULL;
}

/*
void Goto6CLabel(struct Proc *proc, s32 b)
{
    struct ProcCmd *ptr;
    int i;

    for (ptr = proc->codeStart; ptr->opcode != 0; ptr++)
    {
        if (ptr->opcode == 11 && ptr->dataImm == b)
        {
            proc->codeNext = ptr;
            proc->onCycle = NULL;
            return;
        }
    }
}
*/

/*
void Goto6CLabel(struct Proc *proc, s32 b)
{
    int i;

    for (i = 0; proc->codeStart[i].opcode != 0; i++)
    {
        struct ProcCmd *ptr = &proc->codeStart[i];

        if (ptr->opcode == 11 && ptr->dataImm == b)
        {
            proc->codeNext = ptr;
            proc->onCycle = NULL;
            return;
        }
    }
}
*/

/*
void Goto6CLabel(struct Proc *proc, s32 b)
{
    struct ProcCmd *ptr = (void *)proc->codeStart;

    while (ptr->opcode != 0)
    {
        if (ptr->opcode == 11 && ptr->dataImm == b)
        {
            proc->codeNext = (s16 *)ptr;
            proc->onCycle = NULL;
            return;
        }
        ptr++;
    }
}
*/

__attribute__((naked))
void Goto6CLabel(struct Proc *proc, s32 b)
{
    asm(".syntax unified\n\
	push {r4, r5, r6, lr}\n\
	adds r4, r1, #0\n\
	adds r1, r0, #0\n\
	ldr r2, [r1]\n\
	ldrh r3, [r2]\n\
	movs r5, #0\n\
	ldrsh r0, [r2, r5]\n\
	cmp r0, #0\n\
	beq _08002F56\n\
	movs r5, #0\n\
_08002F38:\n\
	cmp r3, #0xb\n\
	bne _08002F4A\n\
	movs r6, #2\n\
	ldrsh r0, [r2, r6]\n\
	cmp r0, r4\n\
	bne _08002F4A\n\
	str r2, [r1, #4]\n\
	str r5, [r1, #0xc]\n\
	b _08002F56\n\
_08002F4A:\n\
	adds r2, #8\n\
	ldrh r3, [r2]\n\
	movs r6, #0\n\
	ldrsh r0, [r2, r6]\n\
	cmp r0, #0\n\
	bne _08002F38\n\
_08002F56:\n\
	pop {r4, r5, r6}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided");
}

void Goto6CPointer(struct Proc *proc, struct ProcCmd *b)
{
    proc->codeNext = b;
    proc->onCycle = NULL;
}

void Set6CMark(struct Proc *proc, u8 mark)
{
    proc->mark = mark;
}

void Set6CDestructor(struct Proc *proc, ProcFunc onDestroy)
{
    proc->onDestroy = onDestroy;
}

void ForAll6C(ProcFunc func)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->codeStart != NULL)
            func(proc);
    }
}

void ForEach6C(struct ProcCmd *code, ProcFunc func)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->codeStart == code)
            func(proc);
    }
}

void sub_8002FC0(int mark, ProcFunc func)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            func(proc);
    }
}

void BlockEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark)
            proc->blockCount++;
    }
}

void UnblockEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->mark == mark && proc->blockCount > 0)
            proc->blockCount--;
    }
}

void DeleteEach6CMarked(int mark)
{
    int i;
    struct Proc *proc = &gUnknown_02024E68[0];

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

void ClearCallbackAll6CMatch(struct ProcCmd *code)
{
    ForEach6C(code, Clear6CLoopWrapper);
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
    proc->name = proc->codeNext->dataPtr;
    proc->codeNext++;
    return 1;
}

int Call6C_02CallAndContinue(struct Proc *proc)
{
    ProcFunc func = proc->codeNext->dataPtr;

    proc->codeNext++;
    func(proc);
    return 1;
}

int Call6C_16Call(struct Proc *proc)
{
    s8 (*func)(struct Proc *) = proc->codeNext->dataPtr;

    proc->codeNext++;
    return func(proc);
}

int Call6C_18CallWithArg(struct Proc *proc)
{
    s16 arg = proc->codeNext->dataImm;
    s8 (*func)(s16, struct Proc *) = proc->codeNext->dataPtr;

    proc->codeNext++;
    return func(arg, proc);
}

int Call6C_14While(struct Proc *proc)
{
    s8 (*func)(struct Proc *) = proc->codeNext->dataPtr;

    proc->codeNext++;
    if (func(proc) == 1)
    {
        proc->codeNext--;
        return 0;
    }
    return 1;
}

int Call6C_03SetLoop(struct Proc *proc)
{
    proc->onCycle = proc->codeNext->dataPtr;
    proc->codeNext++;
    return 0;
}

int Call6C_04SetDestructor(struct Proc *proc)
{
    Set6CDestructor(proc, proc->codeNext->dataPtr);
    proc->codeNext++;
    return 1;
}

int Call6C_05AddChild(struct Proc *proc)
{
    New6C(proc->codeNext->dataPtr, (int)proc);
    proc->codeNext++;
    return 1;
}

int Call6C_06AddBlockingChild(struct Proc *proc)
{
    NewBlocking6C(proc->codeNext->dataPtr, (int)proc);
    proc->codeNext++;
    return 0;
}

int Call6C_07AddGlobal_BuggedMaybe(struct Proc *proc)
{
    New6C(proc->codeNext->dataPtr, proc->sleepTime);
    proc->codeNext++;
    return 1;
}

int Call6C_08WhileExists(struct Proc *proc)
{
    struct Proc *var = Find6C(proc->codeNext->dataPtr);

    //int exists = (Find6C(proc->codeNext->dataPtr) != NULL);
    //if (exists)
    if (((s32)var | -(s32)var)  < 0)
        return 0;
    proc->codeNext++;
    return 1;
}

int Call6C_09DeleteEach6C(struct Proc *proc)
{
    DeleteEach6C(proc->codeNext->dataPtr);
    proc->codeNext++;
    return 1;
}

int Call6C_0AClearLoopForEach6C(struct Proc *proc)
{
    ClearCallbackAll6CMatch(proc->codeNext->dataPtr);
    proc->codeNext++;
    return 1;
}

int Call6C_0BOr19Label(struct Proc *proc)
{
    proc->codeNext++;
    return 1;
}

int Call6C_0DJump(struct Proc *proc)
{
    Goto6CPointer(proc, proc->codeNext->dataPtr);
    return 1;
}

int Call6C_0CGotoLabel(struct Proc *proc)
{
    Goto6CLabel(proc, proc->codeNext->dataImm);
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
    if (proc->codeNext->dataImm != 0)
    {
        proc->sleepTime = proc->codeNext->dataImm;
        proc->onCycle = _6CSleepLoop;
    }
    proc->codeNext++;
    return 0;
}

int Call6C_0FMark(struct Proc *proc)
{
    proc->mark = proc->codeNext->dataImm;
    proc->codeNext++;
    return 1;
}

int Call6C_13Blank(struct Proc *proc)
{
    proc->codeNext++;
    return 1;
}

int Call6C_10Block(struct Proc *proc)
{
    return 0;
}

int Call6C_11DeleteIfDuplicate(struct Proc *proc)
{
    int i;
    struct Proc *p = &gUnknown_02024E68[0];
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p->codeStart == proc->codeStart)
            count++;
    }
    if (count > 1)
    {
        Delete6C(proc);
        return 0;
    }
    proc->codeNext++;
    return 1;
}

int Call6C_17DeleteOtherDuplicates(struct Proc *proc)
{
    int i;
    struct Proc *p = &gUnknown_02024E68[0];

    for (i = 0; i < MAX_PROC_COUNT; i++, p++)
    {
        if (p != proc && p->codeStart == proc->codeStart)
        {
            Delete6C(p);
            break;
        }
    }
    proc->codeNext++;
    return 1;
}

int Call6C_15Blank(struct Proc *proc)
{
    proc->codeNext++;
    return 1;
}

int Call6C_12SetBit4(struct Proc *proc)
{
    proc->flags |= PROC_FLAG_0x04;
    proc->codeNext++;
    return 1;
}

void Call6CCode(struct Proc *proc)
{
    if (proc->codeStart == NULL)
        return;
    if (proc->blockCount > 0)
        return;
    if (proc->onCycle != NULL)
        return;
    while (gUnknown_085879D8[proc->codeNext->opcode](proc) != 0)
    {
        if (proc->codeStart == NULL)
            return;
    }
}

void nullsub_2(struct Proc *proc)
{
}

void ForEach6CDoNothing(struct Proc *proc, int *b)
{
    if (proc->next != NULL)
        ForEach6CDoNothing(proc->next, b);
    nullsub_2(proc);
    if (proc->child != NULL)
    {
        (*b) += 2;
        ForEach6CDoNothing(proc->child, b);
        (*b) -= 2;
    }
}

void sub_8003418(struct Proc *proc)
{
    int var = 4;

    nullsub_2(proc);
    if (proc->child != NULL)
    {
        var += 2;
        ForEach6CDoNothing(proc->child, &var);
        var -= 2;
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
    proc->blockCount++;
}

void sub_8003460(struct Proc *proc)
{
    proc->blockCount--;
}
