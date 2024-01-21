#include "global.h"

#include "bmitem.h"
#include "ekrbattle.h"
#include "constants/items.h"

/**
* Leftover data from FE7. These are the unit-specific battle animation
* configurations.
*/

CONST_DATA struct BattleAnimDef AnimConf_Unused_LuciusUnpromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x008F,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x008F,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x008F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x008F,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LuciusPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0096,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0094,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0094,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0094,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LinusPromoted_A[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0090,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0093,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0091,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0092,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LinusPromoted_B[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0090,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0093,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0091,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0092,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LinusPromoted_C[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0090,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0093,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0091,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0092,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LloydPromoted_A[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0037,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0038,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LloydPromoted_B[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0037,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0038,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LloydPromoted_C[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0037,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0038,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_IsadoraPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x004D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x004F,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x004B,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x004C,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x004C,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x004E,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_NinoPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x005E,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x005E,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x005E,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x005E,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x005F,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LegaultUnpromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x007C,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_LegaultPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x003F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0040,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_RavenPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0090,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0093,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0091,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0092,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_GuyUnpromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0099,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x009A,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_GuyPromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x009B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x009C,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_HawkeyePromoted[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x001B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x001D,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x001C,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x001C,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_JermePromoted_A[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x003F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0040,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef AnimConf_Unused_JermePromoted_B[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x003F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0040,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef * gUnitSpecificBanimConfigs[] = {
    NULL,
    AnimConf_Unused_LuciusUnpromoted,
    AnimConf_Unused_LuciusPromoted,
    AnimConf_Unused_LinusPromoted_A,
    AnimConf_Unused_LinusPromoted_B,
    AnimConf_Unused_LinusPromoted_C,
    AnimConf_Unused_LloydPromoted_A,
    AnimConf_Unused_LloydPromoted_B,
    AnimConf_Unused_LloydPromoted_C,
    AnimConf_Unused_IsadoraPromoted,
    AnimConf_Unused_NinoPromoted,
    AnimConf_Unused_LegaultUnpromoted,
    AnimConf_Unused_LegaultPromoted,
    AnimConf_Unused_RavenPromoted,
    AnimConf_Unused_GuyUnpromoted,
    AnimConf_Unused_GuyPromoted,
    AnimConf_Unused_HawkeyePromoted,
    AnimConf_Unused_JermePromoted_A,
    AnimConf_Unused_JermePromoted_B,
};
