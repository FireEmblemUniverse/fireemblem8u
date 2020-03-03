
#include "global.h"

#include "proc.h"

#include "cp_common.h"

extern const u32 gUnknown_080D8538[];

static void AiPhaseInit(struct Proc* proc);
static void AiPhaseBerserkInit(struct Proc* proc);
static void AiPhaseCleanup(struct Proc* proc);

extern struct ProcCmd gUnknown_085A7F5C[]; // CPORDER
extern struct ProcCmd gUnknown_085A7F74[]; // BSKORDER

CONST_DATA
struct ProcCmd gProcScr_CpPhase[] =
{
    PROC_SET_NAME("E_CPPHASE"),

    PROC_CALL_ROUTINE(AiPhaseInit),
    PROC_YIELD,

    PROC_CALL_ROUTINE(AiPhaseCleanup),

    PROC_END,
};

CONST_DATA
struct ProcCmd gProcScr_BerserkCpPhase[] =
{
    PROC_SET_NAME("E_BSKPHASE"),

    PROC_CALL_ROUTINE(AiPhaseBerserkInit),
    PROC_YIELD,

    PROC_CALL_ROUTINE(AiPhaseCleanup),

    PROC_END,
};

static void AiPhaseInit(struct Proc* proc)
{
    int i;

    gUnknown_0203AA04.flags = AI_FLAG_0;
    gUnknown_0203AA04.unk7E = -1;

    gUnknown_0203AA04.orderState = 0;

    for (i = 0; i < 8; ++i)
        gUnknown_0203AA04.unk86[i] = 0;

    gUnknown_0203AA04.specialItemFlags = gUnknown_080D8538[gUnknown_0202BCF0.chapterIndex];
    gUnknown_0203AA04.unk84 = 0;

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_CreateBlockingChild(gUnknown_085A7F5C, proc);
}

static void AiPhaseBerserkInit(struct Proc* proc)
{
    int i;

    gUnknown_0203AA04.flags = AI_FLAG_BERSERKED;
    gUnknown_0203AA04.unk7E = -1;

    for (i = 0; i < 8; ++i)
        gUnknown_0203AA04.unk86[i] = 0;

    gUnknown_0203AA04.specialItemFlags = gUnknown_080D8538[gUnknown_0202BCF0.chapterIndex];

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_CreateBlockingChild(gUnknown_085A7F74, proc);
}

static void AiPhaseCleanup(struct Proc* proc)
{
    gUnknown_0203AA04.flags = AI_FLAGS_NONE;
}
