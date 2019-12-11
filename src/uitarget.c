#include "global.h"

#include "proc.h"
#include "bmio.h"

// this is only here to hold data for now
// source needs to be decompiled from asm/ui_targetselection.s

void TargetSelection_Loop();

CONST_DATA
struct ProcCmd gUnknown_085B655C[] =
{
PROC_LABEL(0),
    PROC_LOOP_ROUTINE(TargetSelection_Loop),
    PROC_SLEEP(1),

    PROC_CALL_ROUTINE(RefreshBMapGraphics),
    PROC_GOTO(0),

    PROC_END
};

struct Unk_085B658C
{
    s8 x, y;
};

CONST_DATA
struct Unk_085B658C gUnknown_085B658C[] = {
    {  0,  0 },
    {  0, -2 },
    {  0, -1 },
    { +1, -1 },
    { +1,  0 },
    { +2,  0 },
    { +1, +1 },
    {  0, +1 },
    {  0, +2 },
    { -1, +1 },
    { -1,  0 },
    { -2,  0 },
    { -1, -1 },
};
