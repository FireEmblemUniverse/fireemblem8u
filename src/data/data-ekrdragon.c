#include "global.h"
#include "proc.h"
#include "efxbattle.h"

void EkrDragonPalFade_Init(struct Proc * proc);
void EkrDragonPalFade_Loop(struct Proc * proc);

struct ProcCmd CONST_DATA ProcScr_EkrDragon_0[] =
{
    PROC_YIELD,
    PROC_CALL(EkrDragonPalFade_Init),
    PROC_REPEAT(EkrDragonPalFade_Loop),

    PROC_END,
};
