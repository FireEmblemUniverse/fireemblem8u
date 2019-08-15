#include "global.h"

#include "proc.h"

// this is only here to hold data for now
// source needs to be decompiled from asm/ui_menu.s

void NewGreenTextColorManager();
void EndGreenTextColorManager();

void Menu_Idle();
void Menu_Draw();
void Menu_CallDefinedConstructors();
void sub_804F474();
void sub_804F4A0();
void sub_804F530();
void sub_804F5B4();

CONST_DATA
struct ProcCmd gUnknown_085B64B8[] =
{
    PROC_LOOP_ROUTINE(Menu_Idle),
    PROC_CALL_ROUTINE(EndGreenTextColorManager),

    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B64D0[] =
{
    PROC_SET_NAME("E_Menu"),
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL_ROUTINE(NewGreenTextColorManager),
    PROC_CALL_ROUTINE(Menu_Draw),
    PROC_CALL_ROUTINE(Menu_CallDefinedConstructors),

    PROC_JUMP(gUnknown_085B64B8),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6510[] =
{
    PROC_BLOCK
};

CONST_DATA
struct ProcCmd gUnknown_085B6518[] =
{
    PROC_CALL_ROUTINE(sub_804F474),
    PROC_LOOP_ROUTINE(sub_804F4A0),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6530[] =
{
    PROC_LOOP_ROUTINE(sub_804F530),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6540[] =
{
    PROC_LOOP_ROUTINE(sub_804F5B4),
    PROC_END
};

CONST_DATA
u8 gUnknown_085B6550[12] = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    2,
    3,
    3,
    3,
};
