#include "global.h"

#include "bmdebug.h"

#define DebugMenuItems (const struct MenuItemDef*)0x859C080

const struct MenuDef DebugMenuDef = {
    {1, 1, 15, 0},
    0,
    DebugMenuItems,
    &DebugMenuInit,
    (void(*)(struct MenuProc*))0, 
    (void(*)(struct MenuProc*))0,
    &EndMenuAndClear,
    (u8(*)(struct MenuProc*))0,
    (void(*)(struct MenuProc*, struct MenuItemProc*))0
};

