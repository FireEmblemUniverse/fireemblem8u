
#include "global.h"

#include "proc.h"

void sub_80396AC(void);
void sub_8039778(void);
void sub_8039718(void);

CONST_DATA
struct ProcCmd gUnknown_085A7F08[] =
{
    PROC_SET_NAME("E_CPPHASE"),

    PROC_CALL_ROUTINE(sub_80396AC),
    PROC_YIELD,

    PROC_CALL_ROUTINE(sub_8039778),

    PROC_END,
};

CONST_DATA
struct ProcCmd gUnknown_085A7F30[] =
{
    PROC_SET_NAME("E_BSKPHASE"),

    PROC_CALL_ROUTINE(sub_8039718),
    PROC_YIELD,

    PROC_CALL_ROUTINE(sub_8039778),

    PROC_END,
};
