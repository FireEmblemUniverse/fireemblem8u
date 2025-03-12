
#include "global.h"

#include "proc.h"
#include "cp_data.h"
#include "cp_utility.h"

#include "cp_common.h"

static void AiPhaseInit(struct Proc* proc);
static void AiPhaseBerserkInit(struct Proc* proc);
static void AiPhaseCleanup(struct Proc* proc);

EWRAM_DATA struct AiState gAiState = {0};

CONST_DATA
struct ProcCmd gProcScr_CpPhase[] =
{
    PROC_NAME("E_CPPHASE"),

    PROC_CALL(AiPhaseInit),
    PROC_YIELD,

    PROC_CALL(AiPhaseCleanup),

    PROC_END,
};

CONST_DATA
struct ProcCmd gProcScr_BerserkCpPhase[] =
{
    PROC_NAME("E_BSKPHASE"),

    PROC_CALL(AiPhaseBerserkInit),
    PROC_YIELD,

    PROC_CALL(AiPhaseCleanup),

    PROC_END,
};

static void AiPhaseInit(struct Proc* proc)
{
    int i;

    gAiState.flags = AI_FLAG_0;
    gAiState.unk7E = -1;

    gAiState.orderState = 0;

    for (i = 0; i < 8; ++i)
        gAiState.cmd_result[i] = 0;

    gAiState.specialItemFlags = gAiItemConfigTable[gPlaySt.chapterIndex];
    gAiState.unk84 = 0;

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_StartBlocking(gProcScr_CpOrder, proc);
}

static void AiPhaseBerserkInit(struct Proc* proc)
{
    int i;

    gAiState.flags = AI_FLAG_BERSERKED;
    gAiState.unk7E = -1;

    for (i = 0; i < 8; ++i)
        gAiState.cmd_result[i] = 0;

    gAiState.specialItemFlags = gAiItemConfigTable[gPlaySt.chapterIndex];

    UpdateAllPhaseHealingAIStatus();
    SetupUnitInventoryAIFlags();

    Proc_StartBlocking(gProcScr_BerserkCpOrder, proc);
}

static void AiPhaseCleanup(struct Proc* proc)
{
    gAiState.flags = AI_FLAGS_NONE;
}
