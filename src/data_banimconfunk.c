#include "global.h"

#include "bmitem.h"
#include "ekrbattle.h"

CONST_DATA struct BattleAnimDef Unk_088AF6F4[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF708[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF720[] = {
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
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x0092,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF738[] = {
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
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x0092,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF750[] = {
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
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x0092,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF768[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF774[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF780[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF78C[] = {
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
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x004C,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x004C,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x004E,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF7A8[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF7C0[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF7CC[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF7D8[] = {
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
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x0092,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x0092,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF7F0[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF7FC[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF808[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x001B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x001D,
    },
    {
        .wtype = 0x0020 | ITYPE_BLLST,
        .index = 0x001C,
    },
    {
        .wtype = 0x0020 | ITYPE_ITEM,
        .index = 0x001C,
    },
    { 0 },
};

CONST_DATA struct BattleAnimDef Unk_088AF81C[] = {
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

CONST_DATA struct BattleAnimDef Unk_088AF828[] = {
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

CONST_DATA struct BattleAnimDef * gUnknown_088AF834[] = {
    NULL,
    Unk_088AF6F4,
    Unk_088AF708,
    Unk_088AF720,
    Unk_088AF738,
    Unk_088AF750,
    Unk_088AF768,
    Unk_088AF774,
    Unk_088AF780,
    Unk_088AF78C,
    Unk_088AF7A8,
    Unk_088AF7C0,
    Unk_088AF7CC,
    Unk_088AF7D8,
    Unk_088AF7F0,
    Unk_088AF7FC,
    Unk_088AF808,
    Unk_088AF81C,
    Unk_088AF828,
};
