#ifndef GUARD_PROC_H
#define GUARD_PROC_H

struct Proc;

typedef void* ProcPtr;
typedef void(*ProcFunc)(ProcPtr proc);

struct ProcCmd
{
    short opcode;
    short dataImm;
    void* dataPtr;
};

#define PROC_END                                     { 0x00, 0x0000, 0 }
#define PROC_SET_NAME(aName)                         { 0x01, 0x0000, aName }
#define PROC_CALL_ROUTINE(apRoutine)                 { 0x02, 0x0000, (void*)(apRoutine) }
#define PROC_LOOP_ROUTINE(apRoutine)                 { 0x03, 0x0000, (void*)(apRoutine) }
#define PROC_SET_DESTRUCTOR(apRoutine)               { 0x04, 0x0000, (void*)(apRoutine) }
#define PROC_NEW_CHILD(ap6CChild)                    { 0x05, 0x0000, (void*)(ap6CChild) }
#define PROC_NEW_CHILD_BLOCKING(ap6CChild)           { 0x06, 0x0000, (void*)(ap6CChild) }
#define PROC_NEW_MAIN_BUGGED(ap6CMain)               { 0x07, 0x0000, ap6CMain }
#define PROC_WHILE_EXISTS(ap6CToCheck)               { 0x08, 0x0000, (void*)(ap6CToCheck) }
#define PROC_END_ALL(ap6CToCheck)                    { 0x09, 0x0000, (void*)(ap6CToCheck) }
#define PROC_BREAK_ALL_LOOP(ap6CToCheck)             { 0x0A, 0x0000, (void*)(ap6CToCheck) }
#define PROC_LABEL(aLabelId)                         { 0x0B, aLabelId, 0 }
#define PROC_GOTO(aLabelId)                          { 0x0C, aLabelId, 0 }
#define PROC_JUMP(ap6CCode)                          { 0x0D, 0x0000, (void*)(ap6CCode) }
#define PROC_SLEEP(aTime)                            { 0x0E, aTime,  0 }
#define PROC_SET_MARK(aMark)                         { 0x0F, aMark,  0 }
#define PROC_BLOCK                                   { 0x10, 0x0000, 0 }
#define PROC_END_IF_DUPLICATE                        { 0x11, 0x0000, 0 }
#define PROC_SET_BIT4                                { 0x12, 0x0000, 0 }
#define PROC_13                                      { 0x13, 0x0000, 0 }
#define PROC_WHILE_ROUTINE(aprRoutine)               { 0x14, 0x0000, (void*)(aprRoutine) }
#define PROC_15                                      { 0x15, 0x0000, 0 }
#define PROC_CALL_ROUTINE_2(aprRoutine)              { 0x16, 0x0000, (void*)(aprRoutine) }
#define PROC_END_DUPLICATES                          { 0x17, 0x0000, 0 }
#define PROC_CALL_ROUTINE_ARG(aprRoutine, aArgument) { 0x18, aArgument, (void*)(aprRoutine) }
#define PROC_19                                      { 0x19, 0x0000, 0 }
#define PROC_YIELD                                   PROC_SLEEP(0)

// allows local Proc structs to invoke the general Proc
// fields when creating local Proc definitions.
#define PROC_HEADER                                                                        \
    const struct ProcCmd* proc_script; /* pointer to proc script */                        \
    const struct ProcCmd* proc_scrCur; /* pointer to currently executing script command */ \
    ProcFunc proc_endCb; /* callback to run upon delegint the process */                   \
    ProcFunc proc_idleCb; /* callback to run once each frame. */                           \
                          /* disables script execution when not null */                    \
    char* proc_name;                                                                       \
    struct Proc* proc_parent; /* pointer to parent proc. If this proc is a root proc, */   \
                              /* this member is an integer which is the root index. */     \
    struct Proc* proc_child; /* pointer to most recently added child */                    \
    struct Proc* proc_next; /* next sibling */                                             \
    struct Proc* proc_prev; /* previous sibling */                                         \
    s16 proc_sleepTime;                                                                    \
    u8 proc_mark;                                                                          \
    u8 proc_flags;                                                                         \
    u8 proc_lockCnt; /* wait semaphore. Process execution */                               \
                     /* is blocked when this is nonzero. */                                \

// general Proc struct for use in proc.c when initializing and using the proc.
struct Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u32 data[0x10];
};

struct UnknownProcStruct
{
    struct Proc *unk0;
    struct ProcCmd *unk4;
    int unk8;
};

enum
{
    PROC_MARK_0 = 0,
    PROC_MARK_1 = 1,
    PROC_MARK_2 = 2,
    PROC_MARK_3 = 3,
    PROC_MARK_4 = 4,
    PROC_MARK_5 = 5,
    PROC_MARK_6 = 6,
    PROC_MARK_7 = 7
};

#define ROOT_PROC_0 (struct Proc *)0
#define ROOT_PROC_1 (struct Proc *)1
#define ROOT_PROC_2 (struct Proc *)2
#define ROOT_PROC_3 (struct Proc *)3
#define ROOT_PROC_4 (struct Proc *)4
#define ROOT_PROC_5 (struct Proc *)5
#define ROOT_PROC_6 (struct Proc *)6
#define ROOT_PROC_7 (struct Proc *)7

void Proc_Initialize(void);
struct Proc *Proc_Create(const struct ProcCmd *script, struct Proc *parent);
struct Proc *Proc_CreateBlockingChild(const struct ProcCmd *script, struct Proc *parent);
void Proc_Delete(struct Proc *proc);
// ??? Proc_Run(???);
void Proc_ClearNativeCallback(struct Proc *proc);
struct Proc *Proc_Find(const struct ProcCmd *script);
// ??? Proc_FindNonBlocked(???);
// ??? Proc_FindWithMark(???);
void Proc_GotoLabel(struct Proc* proc_arg, int label);
void Proc_JumpToPointer(struct Proc *proc, const struct ProcCmd *ptr);
// ??? Proc_SetMark(???);
// ??? Proc_SetDestructor(???);
// ??? Proc_ForEach(???);
void Proc_ForEachWithScript(const struct ProcCmd *script, ProcFunc func);
// ??? Proc_ForEachWithMark(???);
void Proc_BlockEachWithMark(int mark);
void Proc_UnblockEachWithMark(int mark);
void Proc_DeleteEachWithMark(int mark);
void Proc_DeleteAllWithScript(const struct ProcCmd *script);
// ??? Proc_ClearNativeCallbackEachWithScript(???);
// ??? sub_80030CC(???);
// ??? sub_800344C(???);
// ??? Proc_SetNativeFunc(???);
// ??? Proc_BlockSemaphore(???);
// ??? Proc_WakeSemaphore(???);
// ??? Proc_FindAfter(???);
// ??? Proc_FindAfterWithParent(???);
// ??? sub_80034D4(???);
// ??? sub_80034FC(???);
// ??? sub_8003530(???);
// ??? sub_8003540(???);

#endif  // GUARD_PROC_H
