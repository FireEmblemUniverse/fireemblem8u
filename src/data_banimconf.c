#include "global.h"
#include "bmitem.h"
#include "ekrbattle.h"
#include "constants/items.h"

CONST_DATA struct BattleAnimDef AnimConf_0[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0001,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0002,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_1[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0003,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0004,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_2[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0005,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0007,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_3[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0008,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x000A,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_4[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0034,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0035,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0036,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_5[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0037,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0038,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0039,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_6[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x003A,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x003B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x003C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_7[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x003D,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x003E,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x003F,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_8[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0040,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0041,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_9[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0042,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0043,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_10[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0045,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0046,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0047,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0047,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0048,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0044,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0047,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_11[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x004A,
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
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x004D,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0049,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x004C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_12[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0089,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x008A,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_13[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C7,
    },
    {
        .wtype = ITEM_DIVINESTONE,
        .index = 0x00C7,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_14[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x000B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x000C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_15[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x000B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x000C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_16[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x000D,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x000E,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x000F,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x000F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0010,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x000F,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_17[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x000D,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x000E,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x000F,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x000F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0010,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x000F,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_18[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0011,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0012,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_19[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0013,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0014,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_20[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0015,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0016,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_21[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0017,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0018,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_22[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x008B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x008C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_23[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x008D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x008E,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_24[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x0026,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0027,
    },
    {
        .wtype = ITEM_BALLISTA_REGULAR,
        .index = 0x009F,
    },
    {
        .wtype = ITEM_BALLISTA_LONG,
        .index = 0x009F,
    },
    {
        .wtype = ITEM_BALLISTA_KILLER,
        .index = 0x009F,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_25[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x0028,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0029,
    },
    {
        .wtype = ITEM_BALLISTA_REGULAR,
        .index = 0x00CA,
    },
    {
        .wtype = ITEM_BALLISTA_LONG,
        .index = 0x00CA,
    },
    {
        .wtype = ITEM_BALLISTA_KILLER,
        .index = 0x00CA,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_26[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x002A,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x002B,
    },
    {
        .wtype = ITEM_BALLISTA_REGULAR,
        .index = 0x00CB,
    },
    {
        .wtype = ITEM_BALLISTA_LONG,
        .index = 0x00CB,
    },
    {
        .wtype = ITEM_BALLISTA_KILLER,
        .index = 0x00CB,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_27[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x002C,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x002D,
    },
    {
        .wtype = ITEM_BALLISTA_REGULAR,
        .index = 0x00CC,
    },
    {
        .wtype = ITEM_BALLISTA_LONG,
        .index = 0x00CC,
    },
    {
        .wtype = ITEM_BALLISTA_KILLER,
        .index = 0x00CC,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_28[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x002F,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x002E,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0030,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_29[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x0032,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0031,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0033,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_30[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0058,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0059,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_31[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x005A,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x005B,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_32[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x005D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x005E,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x005C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_33[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0060,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0061,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x005F,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_34[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0062,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0063,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_35[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0062,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0063,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_36[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x006B,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x006B,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x006B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x006B,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_37[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x006C,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x006C,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x006C,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x006C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_38[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x006D,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x006D,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x006D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x006D,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x006E,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_39[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x006F,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x006F,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x006F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x006F,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0070,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_40[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0072,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0071,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_41[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0074,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0073,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0073,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0073,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0073,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_42[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0082,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0082,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0082,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0082,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0081,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_43[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0083,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0083,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0083,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0083,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0084,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_44[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0075,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0075,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0075,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0075,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_45[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0076,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0076,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0076,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0076,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_46[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0077,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0077,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0077,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0077,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0078,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_47[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0079,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0079,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0079,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0079,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x007A,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_48[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x007C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_49[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x007B,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x007C,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_50[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x008F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0090,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_51[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x004E,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x004F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0052,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0050,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0051,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0051,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0051,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_52[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0053,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0054,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0057,
    },
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0055,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0056,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0056,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0056,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_53[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0096,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0097,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_54[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0092,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0094,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0093,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_55[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0095,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_56[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0096,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0097,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_57[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C9,
    },
    {
        .wtype = ITEM_MONSTER_WRETCHAIR,
        .index = 0x00C9,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_58[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C7,
    },
    {
        .wtype = ITEM_DIVINESTONE,
        .index = 0x00C7,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_59[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0092,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0094,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0093,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_60[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0095,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_61[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0019,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x001B,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x001A,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x001A,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x001A,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_62[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x001C,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x001F,
    },
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x001E,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x001D,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x001D,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x001D,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_63[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0020,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0022,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0021,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0021,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0021,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_64[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x009A,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x009C,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x009B,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x009B,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x009B,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_65[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0023,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0025,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0024,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0024,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0024,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_66[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x007D,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x007D,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x007D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x007D,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_67[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x007F,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x007E,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_68[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0096,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0097,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_69[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0066,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0067,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_70[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0069,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x006A,
    },
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x0068,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_71[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0080,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C8,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_72[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0086,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0085,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_73[] = {
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x0088,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0087,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0087,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0087,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0087,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_74[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0091,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0091,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0091,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0091,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_75[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x0098,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0099,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_76[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x009D,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x009D,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x009D,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x009D,
    },
    {
        .wtype = 0x0100 | ITYPE_STAFF,
        .index = 0x009E,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_77[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00A0,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00A0,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_78[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00A1,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00A1,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_79[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x00A2,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00A4,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x00A3,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_80[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x00A5,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00A6,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_81[] = {
    {
        .wtype = 0x0100 | ITYPE_SWORD,
        .index = 0x00A7,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00A9,
    },
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x00A8,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_82[] = {
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x00AA,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00AB,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_83[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00AC,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00AC,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_84[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00AD,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00AD,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_85[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x00AE,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B0,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x00AF,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x00AF,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x00AF,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_86[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00B1,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B1,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_87[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00B2,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B2,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_88[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x00B3,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B5,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x00B4,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x00B4,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x00B4,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_89[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x00B6,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B9,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x00B7,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x00B7,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0051,
    },
    {
        .wtype = 0x0100 | ITYPE_BOW,
        .index = 0x00B8,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_90[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x00BA,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x00BA,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x00BA,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00BA,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_91[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x00BB,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x00BB,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x00BB,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00BB,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_92[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00BC,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x00BC,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x00BC,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x00BC,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_93[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x00BD,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00BE,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_94[] = {
    {
        .wtype = 0x0100 | ITYPE_LANCE,
        .index = 0x00BF,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C0,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_95[] = {
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C1,
    },
    {
        .wtype = ITEM_MONSTER_WRETCHAIR,
        .index = 0x00C1,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_96[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00C2,
    },
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x00C3,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x00C3,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x00C3,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00C2,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_97[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x00AE,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00B0,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x00AF,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x00AF,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x00AF,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_98[] = {
    {
        .wtype = 0x0100 | ITYPE_MONSTER,
        .index = 0x00AD,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x00AD,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_99[] = {
    {
        .wtype = 0x0100 | ITYPE_AXE,
        .index = 0x0092,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0094,
    },
    {
        .wtype = ITEM_AXE_HANDAXE,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_TOMAHAWK,
        .index = 0x0093,
    },
    {
        .wtype = ITEM_AXE_HATCHET,
        .index = 0x0093,
    },
    { 0 }
};

CONST_DATA struct BattleAnimDef AnimConf_100[] = {
    {
        .wtype = 0x0100 | ITYPE_ANIMA,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_LIGHT,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_DARK,
        .index = 0x0095,
    },
    {
        .wtype = 0x0100 | ITYPE_ITEM,
        .index = 0x0095,
    },
    { 0 }
};
