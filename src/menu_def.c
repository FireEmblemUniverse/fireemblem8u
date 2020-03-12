#include "global.h"

#include "bmdebug.h"

#define DebugMenuItems 0x859C080

const struct MenuDef DebugMenuDef = {
    {1, 1, 15, 0},
    0,
    &DebugMenuItems,
    &DebugMenuInit,
    0, 0,
    &EndMenuAndClear,
    0, 0
};

