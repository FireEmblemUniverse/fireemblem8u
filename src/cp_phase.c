
#include "global.h"

#include "proc.h"

#include "cp_common.h"

extern const u32 gUnknown_080D8538[];

static void AiPhaseInit(struct Proc* proc);
static void AiPhaseBerserkInit(struct Proc* proc);
static void AiPhaseCleanup(struct Proc* proc);

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

    gAiState.flags = AI_FLAG_0;
    gAiState.unk7E = -1;

    gAiState.orderState = 0;

    for (i = 0; i < 8; ++i)
        gAiState.unk86[i] = 0;

    gAiState.specialItemFlags = gUnknown_080D8538[gUnknown_0202BCF0.chapterIndex];
    gAiState.unk84 = 0;

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_CreateBlockingChild(gProcScr_CpOrder, proc);
}

static void AiPhaseBerserkInit(struct Proc* proc)
{
    int i;

    gAiState.flags = AI_FLAG_BERSERKED;
    gAiState.unk7E = -1;

    for (i = 0; i < 8; ++i)
        gAiState.unk86[i] = 0;

    gAiState.specialItemFlags = gUnknown_080D8538[gUnknown_0202BCF0.chapterIndex];

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_CreateBlockingChild(gProcScr_BerserkCpOrder, proc);
}

static void AiPhaseCleanup(struct Proc* proc)
{
    gAiState.flags = AI_FLAGS_NONE;
}
