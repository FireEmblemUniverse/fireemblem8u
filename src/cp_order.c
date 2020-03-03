
#include "global.h"

#include "proc.h"

#include "cp_common.h"

void Loop6C_E_CPORDER(struct Proc* proc);
void sub_80397B0(struct Proc* proc);
void sub_8039858(struct Proc* proc);
void CPORDER_End(struct Proc* proc);

CONST_DATA
u32* gUnknown_085A7F58 = (void*) gUnknown_02020188;

CONST_DATA
struct ProcCmd gUnknown_085A7F5C[] =
{
    PROC_SET_NAME("E_CPORDER"),

    PROC_LOOP_ROUTINE(Loop6C_E_CPORDER),

    PROC_END,
};

CONST_DATA
struct ProcCmd gUnknown_085A7F74[] =
{
    PROC_SET_NAME("E_BSKORDER"),

    PROC_CALL_ROUTINE(sub_80397B0),
    PROC_LOOP_ROUTINE(CPORDER_End),

    PROC_END,
};

CONST_DATA
ProcFunc gUnknown_085A7F94[] =
{
    sub_8039858,
    CPORDER_End,
};
