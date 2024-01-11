#include "global.h"
#include "bmunit.h"
#include "muctrl.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"

CONST_DATA struct REDA REDAs_PrologueAlly1[] = {
    /* Seth */
    {
        .x = 13,
        .y = 8,
        .flags = 0x18,
        .b = 0xffff,
    },
    {
        .x = 10,
        .y = 8,
        .flags = 0x18,
        .b = 0xffff,
    },
    {
        .x = 10,
        .y = 7,
        .flags = 0x18,
        .b = 0xffff,
    },
    {
        .x = 9,
        .y = 7,
        .flags = 0x18,
        .b = 0xffff,
    },
    {
        .x = 9,
        .y = 5,
        .flags = 0x18,
        .b = 0xffff,
    },
    {
        .x = 8,
        .y = 5,
        .flags = 0x18,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDAs_PrologueAlly2[] = {
    /* Eirika */
    {
        .x = 9,
        .y = 5,
        .flags = 0x10,
        .a = 0x2,
        .b = 0xffff,
    },
};

CONST_DATA struct REDA REDAs_PrologueEnemy1[] = {
    /* ONEILL */
    {
        .x = 10,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDAs_PrologueEnemy2[] = {
    /* Enemy2 */
    {
        .x = 8,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDAs_PrologueEnemy3[] = {
    /* Enemy3 */
    {
        .x = 9,
        .y = 6,
        .b = 0xffff,
        .delayFrames = 16,
    },
};

// 0x88B3C14
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueAlly[] = {
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 13,
        .yPosition = 9,
        .redaCount = 6,
        .redas = REDAs_PrologueAlly1,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 8,
        .yPosition = 5,
        .redaCount = 1,
        .redas = REDAs_PrologueAlly2,
        .items = {
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B3C50
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueEnemy[] = {
    {
        .charIndex = CHARACTER_ONEILL,
        .classIndex = CLASS_FIGHTER,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 14,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDAs_PrologueEnemy1,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x6, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x82,
        .classIndex = CLASS_FIGHTER,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 7,
        .redaCount = 1,
        .redas = REDAs_PrologueEnemy2,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0xa, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 14,
        .yPosition = 7,
        .redaCount = 1,
        .redas = REDAs_PrologueEnemy3,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x12, 0x2, 0x0},
    },
    { 0 },
};

CONST_DATA struct REDA REDAs_PrologueMessager[] = {
    {
        .x = 9,
        .y = 11,
        .b = 0xffff,
    },
    {
        .x = 13,
        .y = 11,
        .b = 0xffff,
    },
    {
        .x = 13,
        .y = 6,
        .b = 0xffff,
    },
};

CONST_DATA struct REDA REDAs_PrologueGradoRoyals1[] = {
    {
        .x = 13,
        .y = 6,
        .flags = 0xc,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDAs_PrologueGradoRoyals2[] = {
    {
        .x = 12,
        .y = 7,
        .flags = 0xc,
        .b = 0xffff,
    },
};

CONST_DATA struct REDA REDA_PrologueGradoShamans0[] = {
    {
        .x = 7,
        .y = 4,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoShamans1[] = {
    {
        .x = 6,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoShamans2[] = {
    {
        .x = 19,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoShamans3[] = {
    {
        .x = 20,
        .y = 6,
        .b = 0xffff,
    },
};

CONST_DATA struct REDA REDA_PrologueGradoCavalry0[] = {
    {
        .x = 10,
        .y = 4,
        .flags = 0x10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoCavalry1[] = {
    {
        .x = 16,
        .y = 4,
        .flags = 0x10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoCavalry2[] = {
    {
        .x = 10,
        .y = 6,
        .flags = 0x10,
        .b = 0xffff,
        .delayFrames = 40,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoCavalry3[] = {
    {
        .x = 16,
        .y = 6,
        .flags = 0x10,
        .b = 0xffff,
        .delayFrames = 40,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoCavalry4[] = {
    {
        .x = 10,
        .y = 8,
        .flags = 0x10,
        .a = 0x83,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueGradoCavalry5[] = {
    {
        .x = 16,
        .y = 8,
        .flags = 0x10,
        .a = 0x83,
        .b = 0xffff,
    },
};

// 0x88B3D18
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueThroneRoomUnits[] = {
    {
        .charIndex = CHARACTER_FADO,
        .classIndex = CLASS_PEER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 13,
        .yPosition = 3,
    },
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 14,
        .yPosition = 4,
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 15,
        .yPosition = 4,
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_GENERAL,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 11,
        .yPosition = 7,
    },
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_GENERAL,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 15,
        .yPosition = 7,
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 7,
        .yPosition = 14,
    },
    {
        .charIndex = CHARACHER_FRELIAN,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 10,
        .yPosition = 14,
    },
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 11,
        .yPosition = 4,
    },
    { 0 },
};

// 0x88B3DCC
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueMessager[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_SOLDIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 15,
        .redaCount = 3,
        .redas = REDAs_PrologueMessager,
    },
    { 0 },
};

// 0x88B3DF4
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueGradoRoyals[] = {
    {
        .charIndex = CHARACTER_VIGARDE,
        .classIndex = CLASS_GENERAL,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 13,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDAs_PrologueGradoRoyals1,
    },
    {
        .charIndex = CHARACTER_LYON,
        .classIndex = CLASS_NECROMANCER,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 12,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDAs_PrologueGradoRoyals2,
    },
    { 0 },
};

CONST_DATA struct UnitDefinition UnitDef_Event_PrologueGradoShamans[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SHAMAN,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 5,
        .yPosition = 1,
        .redaCount = 1,
        .redas = REDA_PrologueGradoShamans0,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SHAMAN,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 5,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_PrologueGradoShamans1,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 19,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoShamans2,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 20,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoShamans3,
    },
    { 0 },
};

// 0x88B3E94
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueGradoCavalry[] = {
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_GREAT_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 10,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry0,
    },
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_GREAT_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 16,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry1,
    },
    {
        .charIndex = 0x84,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 10,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry2,
    },
    {
        .charIndex = 0x84,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 16,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry3,
    },
    {
        .charIndex = 0x85,
        .classIndex = CLASS_MAGE_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 10,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry4,
    },
    {
        .charIndex = 0x85,
        .classIndex = CLASS_MAGE_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 16,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_PrologueGradoCavalry5,
    },
    { 0 },
};

CONST_DATA struct REDA REDA_PrologueEscapees0[] = {
    {
        .x = 9,
        .y = 5,
        .b = 0xffff,
    },
    {
        .x = 6,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueEscapees2[] = {
    {
        .x = 9,
        .y = 4,
        .b = 0xffff,
        .delayFrames = 16,
    },
    {
        .x = 6,
        .y = 4,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_PrologueEscapees4[] = {
    {
        .x = 7,
        .y = 5,
        .flags = 0x10,
        .a = 0x2,
        .b = 0xffff,
        .delayFrames = 16,
    },
};

CONST_DATA struct REDA REDA_PrologueValterGroup0[] = {
    {
        .x = 10,
        .y = 5,
        .b = 0xffff,
    },
    {
        .x = 9,
        .y = 5,
        .flags = 0x10,
        .b = 0xffff,
        .delayFrames = 16,
    },
};
CONST_DATA struct REDA REDA_PrologueValterGroup2[] = {
    {
        .x = 11,
        .y = 4,
        .b = 0xffff,
        .delayFrames = 16,
    },
};
CONST_DATA struct REDA REDA_PrologueValterGroup3[] = {
    {
        .x = 11,
        .y = 6,
        .b = 0xffff,
        .delayFrames = 16,
    },
};

// 0x88B3F68
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueEscapees[] = {
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 3,
        .redaCount = 2,
        .redas = REDA_PrologueEscapees0,
        .items = {
            ITEM_SWORD_STEEL,
        },
    },
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 3,
        .redaCount = 2,
        .redas = REDA_PrologueEscapees2,
    },
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 6,
        .yPosition = 5,
        .redaCount = 1,
        .redas = REDA_PrologueEscapees4,
    },
    { 0 },
};

// 0x88B3FB8
CONST_DATA struct UnitDefinition UnitDef_Event_PrologueValterGroup[] = {
    {
        .charIndex = CHARACTER_VALTER_PROLOGUE,
        .classIndex = CLASS_WYVERN_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 14,
        .yPosition = 5,
        .redaCount = 2,
        .redas = REDA_PrologueValterGroup0,
        .items = {
            ITEM_LANCE_SILVER,
        },
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 4,
        .redaCount = 1,
        .redas = REDA_PrologueValterGroup2,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_PrologueValterGroup3,
    },
    { 0 },
};

CONST_DATA struct REDA REDA_Ch1Ally_Eirika[] = {
    {
        .x = 12,
        .y = 9,
    },
};
CONST_DATA struct REDA REDA_Ch1Ally_Seth[] = {
    {
        .x = 13,
        .y = 8,
    },
};
CONST_DATA struct REDA REDA_088B4018[] = {
    {
        .x = 2,
        .y = 5,
        .flags = 0x18,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4020[] = {
    {
        .x = 1,
        .y = 6,
        .flags = 0x18,
        .b = 0xffff,
        .delayFrames = 16,
    },
};
CONST_DATA struct REDA REDA_088B4028[] = {
    {
        .x = 3,
        .y = 8,
        .flags = 0x18,
        .b = 0xfffe,
        .delayFrames = 16,
    },
    {
        .x = 3,
        .y = 6,
        .flags = 0x18,
        .b = 0xfffe,
    },
};
CONST_DATA struct REDA REDA_088B4038[] = {
    {
        .x = 2,
        .y = 7,
        .flags = 0x18,
        .b = 0xffff,
        .delayFrames = 32,
    },
};
CONST_DATA struct REDA REDA_088B4040[] = {
    {
        .x = 1,
        .y = 8,
        .flags = 0x18,
        .a = 0x46,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4048[] = {
    {
        .x = 3,
        .y = 8,
        .flags = 0x18,
        .a = 0x46,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4050[] = {
    {
        .x = 2,
        .y = 9,
        .flags = 0x18,
        .a = 0x46,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4058[] = {
    {
        .x = 5,
        .y = 1,
    },
};
CONST_DATA struct REDA REDA_088B4060[] = {
    {
        .x = 6,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4068[] = {
    {
        .x = 13,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4070[] = {
    {
        .x = 13,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4078[] = {
    {
        .x = 12,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4080[] = {
    {
        .x = 2,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4088[] = {
    {
        .x = 0,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4090[] = {
    {
        .x = 0,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4098[] = {
    {
        .x = 2,
        .y = 2,
        .a = 0xc1,
    },
};

// 0x88B40A0
CONST_DATA struct UnitDefinition UnitDef_Event_Ch1Ally[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_Ch1Ally_Eirika,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_Ch1Ally_Seth,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B40DC
CONST_DATA struct UnitDefinition UnitDef_Event_Ch1Enemy[] = {
    {
        .charIndex = CHARACTER_BREGUET,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .leaderCharIndex = CHARACTER_BREGUET,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 2,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4018,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x3, 0x3, 0x9, 0x20},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 1,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4020,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 2,
        .yPosition = 9,
        .redaCount = 2,
        .redas = REDA_088B4028,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 2,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4038,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x3, 0x12, 0x1, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 1,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4040,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x1, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 2,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4048,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x1, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 2,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4050,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x12, 0x1, 0x0},
    },
    { 0 },
};

// 0x88B417C
CONST_DATA struct UnitDefinition UnitDef_Event_Ch1AllyReinforce[] = {
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4058,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LANCE_IRON,
            ITEM_VULNERARY,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 4,
        .xPosition = 6,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4060,
        .items = {
            ITEM_LANCE_IRON,
        },
    },
    { 0 },
};

// 0x88B41B8
CONST_DATA struct UnitDefinition UnitDef_Event_Ch1EnemyReinforce[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4068,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_SOLDIER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4070,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .leaderCharIndex = CHARACTER_BREGUET,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B4078,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B4208
CONST_DATA struct UnitDefinition UnitDef_Event_Ch1NPC[] = {
    {
        .charIndex = 0xc1,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 2,
        .yPosition = 2,
        .redaCount = 3,
        .redas = REDA_088B4080,
        .items = {
            ITEM_LANCE_IRON,
        },
    },
    {
        .charIndex = CHARACHER_FRELIAN,
        .classIndex = CLASS_MERCENARY,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 2,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_088B4098,
        .items = {
            ITEM_SWORD_IRON,
        },
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B4244[] = {
    {
        .x = 2,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B424C[] = {
    {
        .x = 0,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4254[] = {
    {
        .x = 1,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B425C[] = {
    {
        .x = 0,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4264[] = {
    {
        .x = 3,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B426C[] = {
    {
        .x = 10,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4274[] = {
    {
        .x = 14,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B427C[] = {
    {
        .x = 13,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4284[] = {
    {
        .x = 6,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B428C[] = {
    {
        .x = 7,
        .y = 14,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4294[] = {
    {
        .x = 12,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B429C[] = {
    {
        .x = 7,
        .y = 4,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B42A4[] = {
    {
        .x = 10,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B42AC[] = {
    {
        .x = 10,
        .y = 4,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B42B4[] = {
    {
        .x = 1,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B42BC[] = {
    {
        .x = 0,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B42C4[] = {
    {
        .x = 11,
        .y = 7,
        .b = 0xffff,
    },
};

// 0x88B42CC
CONST_DATA struct UnitDefinition UnitDef_088B42CC[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 1,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4244,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B424C,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 1,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4254,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B425C,
        .items = {
            ITEM_LANCE_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_PRIEST,
        .allegiance = FACTION_ID_BLUE,
        .level = 3,
        .xPosition = 1,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4264,
        .items = {
            ITEM_STAFF_HEAL,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B4344
CONST_DATA struct UnitDefinition UnitDef_088B4344[] = {
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 9,
        .yPosition = 14,
        .redaCount = 1,
        .redas = REDA_088B426C,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x11, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 7,
        .redaCount = 1,
        .redas = REDA_088B4274,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x12, 0x9, 0x0},
    },
    {
        .charIndex = CHARACTER_BONE,
        .classIndex = CLASS_BRIGAND,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 14,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B427C,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 6,
        .yPosition = 10,
        .itemDrop = 1,
        .redaCount = 1,
        .redas = REDA_088B4284,
        .items = {
            ITEM_AXE_IRON,
            ITEM_VULNERARY,
        },
        .ai = {0x0, 0x12, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 7,
        .yPosition = 14,
        .redaCount = 1,
        .redas = REDA_088B428C,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 14,
        .yPosition = 7,
        .redaCount = 1,
        .redas = REDA_088B4294,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x11, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B43D0
CONST_DATA struct UnitDefinition UnitDef_088B43D0[] = {
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_LANCE_JAVELIN,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_PRIEST,
        .allegiance = FACTION_ID_BLUE,
        .level = 3,
        .xPosition = 0,
        .yPosition = 0,
        .items = {
            ITEM_STAFF_HEAL,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B440C
CONST_DATA struct UnitDefinition UnitDef_088B440C[] = {
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 1,
        .redaCount = 1,
        .redas = REDA_088B429C,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_LANCE_JAVELIN,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B4434
CONST_DATA struct UnitDefinition UnitDef_088B4434[] = {
    {
        .charIndex = CHARACTER_ROSS,
        .classIndex = CLASS_JOURNEYMAN,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 11,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_088B42A4,
        .items = {
            ITEM_AXE_HATCHET,
            ITEM_VULNERARY,
        },
        .ai = {0x0, 0xa, 0x0, 0x0},
    },
    {
        .charIndex = CHARACTER_GARCIA,
        .classIndex = CLASS_FIGHTER,
        .allegiance = FACTION_ID_GREEN,
        .level = 4,
        .xPosition = 11,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_088B42AC,
        .items = {
            ITEM_AXE_IRON,
            ITEM_AXE_HANDAXE,
            ITEM_VULNERARY,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    { 0 },
};

// 0x88B4470
CONST_DATA struct UnitDefinition UnitDef_088B4470[] = {
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 0,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B42B4,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 0,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B42BC,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B44AC
CONST_DATA struct UnitDefinition UnitDef_088B44AC[] = {
    {
        .charIndex = CHARACTER_BAZBA,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 14,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B42C4,
        .items = {
            ITEM_AXE_STEEL,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B44D4[] = {
    {
        .x = 2,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B44DC[] = {
    {
        .x = 3,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B44E4[] = {
    {
        .x = 3,
        .y = 10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B44EC[] = {
    {
        .x = 2,
        .y = 13,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B44F4[] = {
    {
        .x = 1,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B44FC[] = {
    {
        .x = 0,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4504[] = {
    {
        .x = 1,
        .y = 10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B450C[] = {
    {
        .x = 1,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4514[] = {
    {
        .x = 2,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B451C[] = {
    {
        .x = 14,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4524[] = {
    {
        .x = 7,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B452C[] = {
    {
        .x = 9,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4534[] = {
    {
        .x = 15,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B453C[] = {
    {
        .x = 12,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4544[] = {
    {
        .x = 14,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B454C[] = {
    {
        .x = 9,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4554[] = {
    {
        .x = 14,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B455C[] = {
    {
        .x = 5,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4564[] = {
    {
        .x = 7,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B456C[] = {
    {
        .x = 0,
        .y = 5,
        .b = 0xffff,
    },
};

// 0x88B4574
CONST_DATA struct UnitDefinition UnitDef_088B4574[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B44D4,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_PRIEST,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 12,
        .redaCount = 1,
        .redas = REDA_088B44DC,
        .items = {
            ITEM_STAFF_HEAL,
        },
    },
    {
        .charIndex = CHARACTER_ROSS,
        .classIndex = CLASS_JOURNEYMAN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B44E4,
        .items = {
            ITEM_AXE_HATCHET,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 0,
        .yPosition = 12,
        .redaCount = 1,
        .redas = REDA_088B44EC,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 0,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B44F4,
        .items = {
            ITEM_LANCE_IRON,
        },
    },
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B44FC,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LANCE_IRON,
        },
    },
    {
        .charIndex = CHARACTER_NEIMI,
        .classIndex = CLASS_ARCHER_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B4504,
        .items = {
            ITEM_BOW_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 12,
        .redaCount = 1,
        .redas = REDA_088B450C,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GARCIA,
        .classIndex = CLASS_FIGHTER,
        .allegiance = FACTION_ID_BLUE,
        .level = 4,
        .xPosition = 0,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B4514,
        .items = {
            ITEM_AXE_IRON,
        },
    },
    { 0 },
};

// 0x88B463C
CONST_DATA struct UnitDefinition UnitDef_088B463C[] = {
    {
        .charIndex = CHARACTER_BAZBA,
        .classIndex = CLASS_BRIGAND,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 14,
        .yPosition = 1,
        .redaCount = 1,
        .redas = REDA_088B451C,
        .items = {
            ITEM_AXE_STEEL,
            ITEM_AXE_HANDAXE,
        },
        .ai = {0x3, 0x3, 0x9, 0x20},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 7,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_088B4524,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 9,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B452C,
        .items = {
            ITEM_AXE_HANDAXE,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_MERCENARY,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 15,
        .yPosition = 2,
        .redaCount = 1,
        .redas = REDA_088B4534,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_ANTITOXIN,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 12,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B453C,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 14,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_088B4544,
        .items = {
            ITEM_AXE_STEEL,
            ITEM_PUREWATER,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_THIEF,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 9,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B454C,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 14,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B4554,
        .items = {
            ITEM_AXE_HANDAXE,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 5,
        .yPosition = 9,
        .itemDrop = 1,
        .redaCount = 1,
        .redas = REDA_088B455C,
        .items = {
            ITEM_AXE_IRON,
            ITEM_DOORKEY,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x8e,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 7,
        .yPosition = 11,
        .itemDrop = 1,
        .redaCount = 1,
        .redas = REDA_088B4564,
        .items = {
            ITEM_AXE_IRON,
            ITEM_CHESTKEY,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B4718
CONST_DATA struct UnitDefinition UnitDef_088B4718[] = {
    {
        .charIndex = CHARACTER_COLM,
        .classIndex = CLASS_THIEF,
        .allegiance = FACTION_ID_GREEN,
        .level = 2,
        .xPosition = 0,
        .yPosition = 5,
        .redaCount = 1,
        .redas = REDA_088B456C,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LOCKPICK,
            ITEM_VULNERARY,
        },
        .ai = {0x6, 0x5, 0x8, 0x0},
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B4740[] = {
    {
        .x = 14,
        .y = 5,
        .flags = 0x10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4748[] = {
    {
        .x = 15,
        .y = 5,
        .flags = 0x10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4750[] = {
    {
        .x = 13,
        .y = 5,
        .flags = 0x10,
        .b = 0xffff,
    },
};

// 0x88B4758
CONST_DATA struct UnitDefinition UnitDef_088B4758[] = {
    { 0 },
};

// 0x88B476C
CONST_DATA struct UnitDefinition UnitDef_088B476C[] = {
    {
        .charIndex = CHARACTER_VIGARDE,
        .classIndex = CLASS_GENERAL,
        .leaderCharIndex = CHARACTER_VIGARDE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 2,
    },
    {
        .charIndex = CHARACTER_LYON,
        .classIndex = CLASS_NECROMANCER,
        .leaderCharIndex = CHARACTER_VIGARDE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 15,
        .yPosition = 3,
    },
    {
        .charIndex = CHARACTER_DUESSEL,
        .classIndex = CLASS_GREAT_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 5,
    },
    {
        .charIndex = CHARACTER_GLEN,
        .classIndex = CLASS_WYVERN_LORD,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 13,
        .yPosition = 5,
    },
    {
        .charIndex = CHARACTER_SELENA,
        .classIndex = CLASS_MAGE_KNIGHT_F,
        .leaderCharIndex = CHARACTER_VIGARDE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 15,
        .yPosition = 5,
    },
    { 0 },
};

// 0x88B47E4
CONST_DATA struct UnitDefinition UnitDef_088B47E4[] = {
    {
        .charIndex = CHARACTER_RIEV,
        .classIndex = CLASS_BISHOP,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B4740,
    },
    {
        .charIndex = CHARACTER_CAELLACH,
        .classIndex = CLASS_HERO,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 15,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B4748,
    },
    {
        .charIndex = CHARACTER_VALTER,
        .classIndex = CLASS_WYVERN_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 13,
        .yPosition = 10,
        .redaCount = 1,
        .redas = REDA_088B4750,
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B4834[] = {
    {
        .x = 5,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B483C[] = {
    {
        .x = 5,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4844[] = {
    {
        .x = 4,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B484C[] = {
    {
        .x = 4,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4854[] = {
    {
        .x = 3,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B485C[] = {
    {
        .x = 3,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4864[] = {
    {
        .x = 6,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B486C[] = {
    {
        .x = 2,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4874[] = {
    {
        .x = 8,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B487C[] = {
    {
        .x = 8,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4884[] = {
    {
        .x = 7,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B488C[] = {
    {
        .x = 1,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B4894[] = {
    {
        .x = 0,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B489C[] = {
    {
        .x = 2,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48A4[] = {
    {
        .x = 0,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48AC[] = {
    {
        .x = 2,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48B4[] = {
    {
        .x = 13,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48BC[] = {
    {
        .x = 14,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48C4[] = {
    {
        .x = 14,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48CC[] = {
    {
        .x = 13,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48D4[] = {
    {
        .x = 14,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48DC[] = {
    {
        .x = 12,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48E4[] = {
    {
        .x = 13,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48EC[] = {
    {
        .x = 10,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B48F4[] = {
    {
        .x = 11,
        .y = 4,
        .b = 0xffff,
        .delayFrames = 16,
    },
};
CONST_DATA struct REDA REDA_088B48FC[] = {
    {
        .x = 11,
        .y = 6,
        .b = 0xffff,
        .delayFrames = 16,
    },
};

// 0x88B4904
CONST_DATA struct UnitDefinition UnitDef_088B4904[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 2,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_ARTUR,
        .classIndex = CLASS_MONK,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 7,
        .yPosition = 3,
        .items = {
            ITEM_LIGHT_LIGHTNING,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_PRIEST,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 1,
        .items = {
            ITEM_STAFF_HEAL,
        },
    },
    {
        .charIndex = CHARACTER_COLM,
        .classIndex = CLASS_THIEF,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 4,
        .yPosition = 0,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LOCKPICK,
        },
    },
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 4,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 3,
        .yPosition = 3,
        .items = {
            ITEM_LANCE_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_NEIMI,
        .classIndex = CLASS_ARCHER_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 3,
        .yPosition = 1,
        .items = {
            ITEM_BOW_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 6,
        .yPosition = 1,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_ROSS,
        .classIndex = CLASS_JOURNEYMAN,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 2,
        .yPosition = 2,
        .items = {
            ITEM_AXE_HATCHET,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B49CC
CONST_DATA struct UnitDefinition UnitDef_088B49CC[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4834,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_MOULDER,
        .classIndex = CLASS_PRIEST,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B483C,
        .items = {
            ITEM_STAFF_HEAL,
        },
    },
    {
        .charIndex = CHARACTER_COLM,
        .classIndex = CLASS_THIEF,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 4,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4844,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LOCKPICK,
        },
    },
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 4,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B484C,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 3,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4854,
        .items = {
            ITEM_LANCE_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_NEIMI,
        .classIndex = CLASS_ARCHER_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 3,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B485C,
        .items = {
            ITEM_BOW_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 6,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4864,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_ROSS,
        .classIndex = CLASS_JOURNEYMAN,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 2,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B486C,
        .items = {
            ITEM_AXE_HATCHET,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B4A80
CONST_DATA struct UnitDefinition UnitDef_088B4A80[] = {
    {
        .charIndex = 0xb7,
        .classIndex = CLASS_MOGALL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 11,
        .yPosition = 6,
        .items = {
            ITEM_MONSTER_EVILEYE,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 8,
        .yPosition = 14,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 7,
        .yPosition = 9,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 5,
        .yPosition = 8,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb7,
        .classIndex = CLASS_MOGALL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 13,
        .yPosition = 7,
        .items = {
            ITEM_MONSTER_EVILEYE,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 2,
        .yPosition = 7,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 3,
        .yPosition = 10,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 0,
        .yPosition = 4,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb7,
        .classIndex = CLASS_MOGALL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 12,
        .yPosition = 8,
        .items = {
            ITEM_MONSTER_EVILEYE,
        },
        .ai = {0x0, 0x12, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 5,
        .yPosition = 13,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 11,
        .yPosition = 4,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 1,
        .yPosition = 14,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 10,
        .yPosition = 12,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 11,
        .yPosition = 14,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = CHARACTER_ENTOUMBED_CH4,
        .classIndex = CLASS_ENTOUMBED,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 13,
        .yPosition = 13,
        .items = {
            ITEM_MONSTER_FETIDCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb7,
        .classIndex = CLASS_MOGALL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 13,
        .yPosition = 11,
        .items = {
            ITEM_MONSTER_EVILEYE,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    { 0 },
};

// 0x88B4BD4
CONST_DATA struct UnitDefinition UnitDef_088B4BD4[] = {
    {
        .charIndex = CHARACTER_ARTUR,
        .classIndex = CLASS_MONK,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 9,
        .yPosition = 10,
        .redaCount = 3,
        .redas = REDA_088B4874,
        .items = {
            ITEM_LIGHT_LIGHTNING,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B4BFC
CONST_DATA struct UnitDefinition UnitDef_088B4BFC[] = {
    {
        .charIndex = CHARACTER_LUTE,
        .classIndex = CLASS_MAGE_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 1,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B488C,
        .items = {
            ITEM_ANIMA_FIRE,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B4C24
CONST_DATA struct UnitDefinition UnitDef_088B4C24[] = {
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B4894,
        .items = {
            ITEM_MONSTER_FETIDCLW,
            ITEM_VULNERARY,
        },
        .ai = {0x0, 0x0, 0xc, 0x20},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B489C,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B48A4,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B48AC,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    { 0 },
};

// 0x88B4C88
CONST_DATA struct UnitDefinition UnitDef_088B4C88[] = {
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 9,
        .redaCount = 1,
        .redas = REDA_088B48B4,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 14,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B48BC,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x12, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 2,
        .xPosition = 14,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_088B48C4,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    { 0 },
};

// 0x88B4CD8
CONST_DATA struct UnitDefinition UnitDef_088B4CD8[] = {
    {
        .charIndex = CHARACTER_LARACHEL,
        .classIndex = CLASS_TROUBADOUR,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 13,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B48CC,
        .items = {
            ITEM_STAFF_MEND,
        },
    },
    {
        .charIndex = CHARACTER_RENNAC,
        .classIndex = CLASS_ROGUE,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 14,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B48D4,
        .items = {
            ITEM_SWORD_STEEL,
        },
    },
    {
        .charIndex = CHARACTER_DOZLA,
        .classIndex = CLASS_BERSERKER,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 12,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B48DC,
        .items = {
            ITEM_AXE_SILVER,
        },
    },
    { 0 },
};

// 0x88B4D28
CONST_DATA struct UnitDefinition UnitDef_088B4D28[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 8,
        .yPosition = 5,
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 8,
        .yPosition = 4,
    },
    { 0 },
};

// 0x88B4D64
CONST_DATA struct UnitDefinition UnitDef_088B4D64[] = {
    {
        .charIndex = CHARACTER_LARACHEL,
        .classIndex = CLASS_TROUBADOUR,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 14,
        .yPosition = 5,
        .redaCount = 2,
        .redas = REDA_088B48E4,
        .items = {
            ITEM_STAFF_MEND,
        },
    },
    {
        .charIndex = CHARACTER_DOZLA,
        .classIndex = CLASS_BERSERKER,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 14,
        .yPosition = 5,
        .redaCount = 1,
        .redas = REDA_088B48F4,
        .items = {
            ITEM_AXE_SILVER,
        },
    },
    {
        .charIndex = CHARACTER_RENNAC,
        .classIndex = CLASS_ROGUE,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 14,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_088B48FC,
        .items = {
            ITEM_SWORD_STEEL,
        },
    },
    { 0 },
};

// 0x88B4DB4
CONST_DATA struct UnitDefinition UnitDef_088B4DB4[] = {
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 4,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 3,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 0,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    { 0 },
};

// 0x88B4E68
CONST_DATA struct UnitDefinition UnitDef_088B4E68[] = {
    {
        .charIndex = 0x5f,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 8,
        .xPosition = 13,
        .yPosition = 13,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xad,
        .classIndex = CLASS_BONEWALKER_BOW,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 12,
        .yPosition = 14,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_BONEWALKER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 13,
        .yPosition = 12,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 9,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 11,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_EIRIKA_LORD,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 1,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 5,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 3,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 4,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x11, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = CLASS_EIRIKA_LORD,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb5,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 8,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x12, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xab,
        .classIndex = CLASS_EPHRAIM_LORD,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_NONE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    { 0 },
};

// 0x88B5020
CONST_DATA struct UnitDefinition UnitDef_Ch4SkirmishAlly2[] = {
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 4,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 3,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 0,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    { 0 },
};

// 0x88B50D4
CONST_DATA struct UnitDefinition UnitDef_088B50D4[] = {
    {
        .charIndex = 0x5f,
        .classIndex = CLASS_ENTOUMBED,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 8,
        .xPosition = 13,
        .yPosition = 13,
        .items = {
            ITEM_MONSTER_FETIDCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 12,
        .yPosition = 12,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = CLASS_REVENANT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 14,
        .yPosition = 12,
        .items = {
            ITEM_MONSTER_ROTTENCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 9,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 11,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = 0x2, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 1,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 5,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 3,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 4,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x11, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = 0x2, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb5,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 8,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x12, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xab,
        .classIndex = 0x1, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    { 0 },
};

// 0x88B528C
CONST_DATA struct UnitDefinition UnitDef_088B528C[] = {
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 4,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 3,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 1,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 2,
        .yPosition = 3,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .leaderCharIndex = CHARACTER_EIRIKA,
        .allegiance = FACTION_ID_BLUE,
        .level = 10,
        .xPosition = 0,
        .yPosition = 1,
        .items = {
            ITEM_LANCE_SILVER,
            ITEM_SWORD_SILVER,
            ITEM_ELIXIR,
        },
    },
    { 0 },
};

// 0x88B5340
CONST_DATA struct UnitDefinition UnitDef_088B5340[] = {
    {
        .charIndex = 0x5f,
        .classIndex = CLASS_BAEL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 8,
        .xPosition = 13,
        .yPosition = 13,
        .items = {
            ITEM_MONSTER_VENINCLW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb0,
        .classIndex = CLASS_BAEL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 12,
        .yPosition = 12,
        .items = {
            ITEM_MONSTER_SHARPCLAW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb0,
        .classIndex = CLASS_BAEL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 14,
        .yPosition = 12,
        .items = {
            ITEM_MONSTER_SHARPCLAW,
        },
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 9,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 11,
        .yPosition = 10,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = 0x2, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 11,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 1,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xb3,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 5,
        .yPosition = 14,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 3,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x0, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 4,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x11, 0xc, 0x0},
    },
    {
        .charIndex = 0xac,
        .classIndex = 0x2, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xb5,
        .classIndex = 0x9, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 8,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 5,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x12, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 9,
        .yPosition = 6,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xab,
        .classIndex = 0x1, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 7,
        .yPosition = 13,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    {
        .charIndex = 0xaa,
        .classIndex = 0x0, // Group idx for gMonsterClassWeights
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 6,
        .yPosition = 7,
        .genMonster = 1,
        .sumFlag = 1,
        .ai = {0x0, 0x3, 0xc, 0x0},
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B54F8[] = {
    {
        .x = 4,
        .y = 17,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5500[] = {
    {
        .x = 5,
        .y = 18,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5508[] = {
    {
        .x = 5,
        .y = 16,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5510[] = {
    {
        .x = 4,
        .y = 19,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5518[] = {
    {
        .x = 3,
        .y = 16,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5520[] = {
    {
        .x = 6,
        .y = 19,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5528[] = {
    {
        .x = 7,
        .y = 18,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5530[] = {
    {
        .x = 6,
        .y = 17,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5538[] = {
    {
        .x = 3,
        .y = 18,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5540[] = {
    {
        .x = 13,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5548[] = {
    {
        .x = 11,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5550[] = {
    {
        .x = 10,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5558[] = {
    {
        .x = 8,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5560[] = {
    {
        .x = 13,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5568[] = {
    {
        .x = 9,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5570[] = {
    {
        .x = 9,
        .y = 4,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5578[] = {
    {
        .x = 7,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5580[] = {
    {
        .x = 10,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5588[] = {
    {
        .x = 3,
        .y = 3,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5590[] = {
    {
        .x = 0,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5598[] = {
    {
        .x = 1,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55A0[] = {
    {
        .x = 0,
        .y = 10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55A8[] = {
    {
        .x = 3,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55B0[] = {
    {
        .x = 4,
        .y = 10,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55B8[] = {
    {
        .x = 5,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55C0[] = {
    {
        .x = 14,
        .y = 16,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55C8[] = {
    {
        .x = 14,
        .y = 15,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55D0[] = {
    {
        .x = 14,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55D8[] = {
    {
        .x = 14,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55E0[] = {
    {
        .x = 13,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55E8[] = {
    {
        .x = 14,
        .y = 1,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55F0[] = {
    {
        .x = 12,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B55F8[] = {
    {
        .x = 9,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5600[] = {
    {
        .x = 9,
        .y = 7,
        .flags = 0x10,
        .a = 0xd,
    },
};
CONST_DATA struct REDA REDA_088B5608[] = {
    {
        .x = 9,
        .y = 10,
        .flags = 0x20,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5610[] = {
    {
        .x = 9,
        .y = 8,
        .flags = 0x20,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5618[] = {
    {
        .x = 9,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5620[] = {
    {
        .x = 6,
        .y = 16,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5628[] = {
    {
        .x = 5,
        .y = 15,
        .b = 0xffff,
    },
};

// 0x88B5630
CONST_DATA struct UnitDefinition UnitDef_088B5630[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 6,
        .yPosition = 17,
        .redaCount = 1,
        .redas = REDA_088B54F8,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_NATASHA,
        .classIndex = CLASS_CLERIC,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 5,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5500,
        .items = {
            ITEM_STAFF_MEND,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_COLM,
        .classIndex = CLASS_THIEF,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 5,
        .yPosition = 16,
        .redaCount = 1,
        .redas = REDA_088B5508,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LOCKPICK,
        },
    },
    {
        .charIndex = CHARACTER_VANESSA,
        .classIndex = CLASS_PEGASUS_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 4,
        .yPosition = 19,
        .redaCount = 1,
        .redas = REDA_088B5510,
        .items = {
            ITEM_LANCE_SLIM,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_GILLIAM,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 3,
        .yPosition = 16,
        .redaCount = 1,
        .redas = REDA_088B5518,
        .items = {
            ITEM_LANCE_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_FRANZ,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 6,
        .yPosition = 19,
        .redaCount = 1,
        .redas = REDA_088B5520,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LANCE_IRON,
        },
    },
    {
        .charIndex = CHARACTER_NEIMI,
        .classIndex = CLASS_ARCHER_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 7,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5528,
        .items = {
            ITEM_BOW_IRON,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 4,
        .yPosition = 17,
        .redaCount = 1,
        .redas = REDA_088B5530,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
        },
    },
    {
        .charIndex = CHARACTER_ARTUR,
        .classIndex = CLASS_MONK,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 3,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5538,
        .items = {
            ITEM_LIGHT_LIGHTNING,
        },
    },
    { 0 },
};

// 0x88B56F8
CONST_DATA struct UnitDefinition UnitDef_088B56F8[] = {
    {
        .charIndex = CHARACTER_SAAR,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .allegiance = FACTION_ID_RED,
        .level = 8,
        .xPosition = 13,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5540,
        .items = {
            ITEM_LANCE_JAVELIN,
        },
        .ai = {0x3, 0x3, 0x9, 0x20},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 12,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5548,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5550,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5558,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 13,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5560,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5568,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5570,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B5798
CONST_DATA struct UnitDefinition UnitDef_088B5798[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5578,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 11,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5580,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MERCENARY,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5588,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5590,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5598,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 0,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B55A0,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B55A8,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x12, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B55B0,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x12, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B55B8,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B5860
CONST_DATA struct UnitDefinition UnitDef_088B5860[] = {
    {
        .charIndex = CHARACTER_BANDIT_CH5,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 14,
        .yPosition = 16,
        .redaCount = 1,
        .redas = REDA_088B55C0,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    {
        .charIndex = 0x65,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 14,
        .yPosition = 15,
        .redaCount = 1,
        .redas = REDA_088B55C8,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B589C
CONST_DATA struct UnitDefinition UnitDef_088B589C[] = {
    {
        .charIndex = 0x65,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 14,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B55D0,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    {
        .charIndex = 0x65,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 14,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_088B55D8,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B58D8
CONST_DATA struct UnitDefinition UnitDef_088B58D8[] = {
    {
        .charIndex = 0x65,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 13,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B55E0,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    {
        .charIndex = 0x65,
        .classIndex = CLASS_BRIGAND,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 14,
        .yPosition = 1,
        .redaCount = 1,
        .redas = REDA_088B55E8,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x4, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B5914
CONST_DATA struct UnitDefinition UnitDef_088B5914[] = {
    {
        .charIndex = CHARACTER_JOSHUA,
        .classIndex = CLASS_MYRMIDON,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 6,
        .redaCount = 1,
        .redas = REDA_088B55F0,
        .items = {
            ITEM_SWORD_KILLER,
        },
        .ai = {0x7, 0x3, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B593C
CONST_DATA struct UnitDefinition UnitDef_088B593C[] = {
    {
        .charIndex = CHARACTER_JOSHUA,
        .classIndex = CLASS_MYRMIDON,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 9,
        .yPosition = 6,
        .redaCount = 2,
        .redas = REDA_088B55F8,
    },
    {
        .charIndex = CHARACTER_NATASHA,
        .classIndex = CLASS_CLERIC,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 15,
        .redaCount = 2,
        .redas = REDA_088B5608,
        .items = {
            ITEM_STAFF_MEND,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B5978
CONST_DATA struct UnitDefinition UnitDef_088B5978[] = {
    {
        .charIndex = CHARACTER_SAAR,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 9,
        .yPosition = 7,
    },
    {
        .charIndex = CHARACTER_GLEN,
        .classIndex = CLASS_WYVERN_LORD,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 9,
        .yPosition = 9,
    },
    {
        .charIndex = CHARACTER_CORMAG,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 8,
        .yPosition = 10,
    },
    { 0 },
};

// 0x88B59C8
CONST_DATA struct UnitDefinition UnitDef_088B59C8[] = {
    {
        .charIndex = CHARACTER_NATASHA,
        .classIndex = CLASS_CLERIC,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 10,
        .yPosition = 0,
        .redaCount = 1,
        .redas = REDA_088B5618,
        .items = {
            ITEM_STAFF_MEND,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B59F0
CONST_DATA struct UnitDefinition UnitDef_088B59F0[] = {
    {
        .charIndex = CHARACTER_EIRIKA,
        .classIndex = CLASS_EIRIKA_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 0,
        .yPosition = 16,
        .redaCount = 1,
        .redas = REDA_088B5620,
        .items = {
            ITEM_SWORD_RAPIER,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_SETH,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 0,
        .yPosition = 15,
        .redaCount = 1,
        .redas = REDA_088B5628,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_SILVER,
        },
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B5A2C[] = {
    {
        .x = 1,
        .y = 17,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A34[] = {
    {
        .x = 3,
        .y = 17,
        .a = 0xf,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A3C[] = {
    {
        .x = 0,
        .y = 16,
        .a = 0xf,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A44[] = {
    {
        .x = 0,
        .y = 18,
        .a = 0x11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A4C[] = {
    {
        .x = 15,
        .y = 13,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A54[] = {
    {
        .x = 12,
        .y = 13,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5A5C[] = {
    {
        .x = 12,
        .y = 10,
        .b = 0xffff,
    },
};

// 0x88B5A64
CONST_DATA struct UnitDefinition UnitDef_088B5A64[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_EPHRAIM_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 4,
        .xPosition = 1,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5A2C,
        .items = {
            ITEM_LANCE_REGINLEIF,
            ITEM_LANCE_STEEL,
            ITEM_ELIXIR,
        },
    },
    {
        .charIndex = CHARACTER_FORDE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 6,
        .xPosition = 3,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5A34,
        .items = {
            ITEM_SWORD_STEEL,
            ITEM_LANCE_JAVELIN,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_KYLE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 0,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5A3C,
        .items = {
            ITEM_SWORD_IRON,
            ITEM_LANCE_STEEL,
            ITEM_VULNERARY,
        },
    },
    {
        .charIndex = CHARACTER_ORSON_CH5X,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 3,
        .xPosition = 0,
        .yPosition = 18,
        .redaCount = 1,
        .redas = REDA_088B5A44,
        .items = {
            ITEM_SWORD_SILVER,
            ITEM_LANCE_STEEL,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

// 0x88B5AC8
CONST_DATA struct UnitDefinition UnitDef_088B5AC8[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 4,
        .yPosition = 11,
        .itemDrop = 1,
        .items = {
            ITEM_LANCE_IRON,
            ITEM_DOORKEY,
        },
        .ai = {0x0, 0x3, 0x9, 0x20},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 11,
        .yPosition = 8,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 13,
        .yPosition = 10,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = CHARACTER_ZONTA,
        .classIndex = CLASS_MERCENARY,
        .allegiance = FACTION_ID_RED,
        .level = 8,
        .xPosition = 13,
        .yPosition = 7,
        .items = {
            ITEM_BLADE_STEEL,
        },
        .ai = {0x3, 0x3, 0x9, 0x20},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 0,
        .yPosition = 10,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SHAMAN,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 16,
        .yPosition = 7,
        .items = {
            ITEM_DARK_FLUX,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 20,
        .yPosition = 8,
        .itemDrop = 1,
        .items = {
            ITEM_BOW_IRON,
            ITEM_ELIXIR,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 6,
        .yPosition = 15,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MONK,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 10,
        .yPosition = 7,
        .items = {
            ITEM_LIGHT_LIGHTNING,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 5,
        .yPosition = 3,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 15,
        .yPosition = 8,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 19,
        .yPosition = 14,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 2,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 12,
        .yPosition = 3,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 17,
        .yPosition = 3,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 8,
        .yPosition = 1,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 11,
        .yPosition = 13,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 1,
        .yPosition = 1,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 16,
        .yPosition = 2,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 18,
        .yPosition = 9,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 8,
        .yPosition = 8,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MERCENARY,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 0,
        .yPosition = 2,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 13,
        .yPosition = 14,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 15,
        .yPosition = 13,
        .redaCount = 1,
        .redas = REDA_088B5A4C,
        .items = {
            ITEM_AXE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 1,
        .yPosition = 11,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x0, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MAGE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 3,
        .yPosition = 7,
        .itemDrop = 1,
        .items = {
            ITEM_ANIMA_FIRE,
            ITEM_CHESTKEY,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MAGE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 13,
        .yPosition = 18,
        .items = {
            ITEM_ANIMA_FIRE,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 8,
        .yPosition = 4,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SHAMAN,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 8,
        .yPosition = 12,
        .items = {
            ITEM_DARK_FLUX,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 4,
        .xPosition = 6,
        .yPosition = 7,
        .itemDrop = 1,
        .items = {
            ITEM_AXE_IRON,
            ITEM_CHESTKEY,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 3,
        .xPosition = 10,
        .yPosition = 16,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x9, 0x0},
    },
    { 0 },
};

// 0x88B5D48
CONST_DATA struct UnitDefinition UnitDef_088B5D48[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_EPHRAIM_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 4,
        .xPosition = 12,
        .yPosition = 8,
    },
    {
        .charIndex = CHARACTER_KYLE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 6,
        .xPosition = 14,
        .yPosition = 8,
    },
    {
        .charIndex = CHARACTER_FORDE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 5,
        .xPosition = 8,
        .yPosition = 3,
        .redaCount = 2,
        .redas = REDA_088B5A54,
    },
    { 0 },
};

// 0x88B5D98
CONST_DATA struct UnitDefinition UnitDef_088B5D98[] = {
    { 0 },
};

// 0x88B5DAC
CONST_DATA struct UnitDefinition UnitDef_088B5DAC[] = {
    {
        .charIndex = CHARACTER_TIRADO,
        .classIndex = CLASS_GENERAL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 10,
        .yPosition = 2,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 8,
        .yPosition = 8,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 12,
        .yPosition = 8,
    },
    { 0 },
};

// 0x88B5DFC
CONST_DATA struct UnitDefinition UnitDef_088B5DFC[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_EPHRAIM_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 21,
        .yPosition = 11,
    },
    {
        .charIndex = CHARACTER_FORDE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 20,
        .yPosition = 12,
    },
    {
        .charIndex = CHARACTER_KYLE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 22,
        .yPosition = 12,
    },
    { 0 },
};

// 0x88B5E4C
CONST_DATA struct UnitDefinition UnitDef_088B5E4C[] = {
    { 0 },
};

// 0x88B5E60
CONST_DATA struct UnitDefinition UnitDef_088B5E60[] = {
    { 0 },
};

CONST_DATA struct REDA REDA_088B5E74[] = {
    {
        .x = 9,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5E7C[] = {
    {
        .x = 9,
        .y = 9,
        .b = 0xffff,
        .delayFrames = 8,
    },
};
CONST_DATA struct REDA REDA_088B5E84[] = {
    {
        .x = 8,
        .y = 9,
        .b = 0xffff,
        .delayFrames = 8,
    },
};
CONST_DATA struct REDA REDA_088B5E8C[] = {
    {
        .x = 8,
        .y = 10,
        .b = 0xffff,
        .delayFrames = 8,
    },
};

// 0x88B5E94
CONST_DATA struct UnitDefinition UnitDef_088B5E94[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_EPHRAIM_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 12,
        .redaCount = 1,
        .redas = REDA_088B5E74,
    },
    {
        .charIndex = CHARACTER_FORDE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 13,
        .redaCount = 1,
        .redas = REDA_088B5E7C,
    },
    {
        .charIndex = CHARACTER_KYLE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 8,
        .yPosition = 13,
        .redaCount = 1,
        .redas = REDA_088B5E84,
    },
    {
        .charIndex = CHARACTER_ORSON_CH5X,
        .classIndex = CLASS_PALADIN,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 8,
        .yPosition = 14,
        .redaCount = 1,
        .redas = REDA_088B5E8C,
    },
    { 0 },
};

// 0x88B5EF8
CONST_DATA struct UnitDefinition UnitDef_088B5EF8[] = {
    { 0 },
};

CONST_DATA struct REDA REDA_088B5F0C[] = {
    {
        .x = 9,
        .y = 5,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F14[] = {
    {
        .x = 9,
        .y = 6,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F1C[] = {
    {
        .x = 9,
        .y = 13,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F24[] = {
    {
        .x = 9,
        .y = 12,
        .a = 0xf,
    },
};
CONST_DATA struct REDA REDA_088B5F2C[] = {
    {
        .x = 11,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F34[] = {
    {
        .x = 11,
        .y = 14,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F3C[] = {
    {
        .x = 9,
        .y = 12,
        .a = 0xf,
        .b = 0x1,
    },
};
CONST_DATA struct REDA REDA_088B5F44[] = {
    {
        .x = 11,
        .y = 12,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F4C[] = {
    {
        .x = 8,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F54[] = {
    {
        .x = 5,
        .y = 14,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F5C[] = {
    {
        .x = 6,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F64[] = {
    {
        .x = 9,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F6C[] = {
    {
        .x = 8,
        .y = 15,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B5F74[] = {
    {
        .x = 7,
        .y = 13,
        .flags = 0x10,
        .b = 0xffff,
    },
};

// 0x88B5F7C
CONST_DATA struct UnitDefinition UnitDef_088B5F7C[] = {
    {
        .charIndex = CHARACTER_EPHRAIM,
        .classIndex = CLASS_EPHRAIM_LORD,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 4,
        .redaCount = 3,
        .redas = REDA_088B5F0C,
    },
    {
        .charIndex = CHARACTER_FORDE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 4,
        .redaCount = 3,
        .redas = REDA_088B5F24,
    },
    {
        .charIndex = CHARACTER_KYLE,
        .classIndex = CLASS_CAVALIER,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 9,
        .yPosition = 4,
        .redaCount = 2,
        .redas = REDA_088B5F3C,
    },
    { 0 },
};

// 0x88B5FCC
CONST_DATA struct UnitDefinition UnitDef_088B5FCC[] = {
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 2,
        .yPosition = 4,
    },
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 2,
        .yPosition = 9,
    },
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 4,
        .yPosition = 15,
    },
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 3,
        .yPosition = 12,
    },
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 15,
        .yPosition = 8,
    },
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 16,
        .yPosition = 11,
    },
    {
        .charIndex = CHARACTER_SOLDIER_83,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 15,
        .yPosition = 15,
    },
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 3,
        .yPosition = 10,
    },
    {
        .charIndex = 0x89,
        .classIndex = CLASS_DRUID,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 2,
        .yPosition = 15,
    },
    {
        .charIndex = 0x81,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 2,
        .yPosition = 10,
    },
    { 0 },
};

// 0x88B60A8
CONST_DATA struct UnitDefinition UnitDef_088B60A8[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 1,
        .yPosition = 8,
        .redaCount = 1,
        .redas = REDA_088B5F4C,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 1,
        .yPosition = 14,
        .redaCount = 1,
        .redas = REDA_088B5F54,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 1,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_088B5F5C,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 1,
        .yPosition = 7,
        .redaCount = 1,
        .redas = REDA_088B5F64,
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_WYVERN_RIDER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 8,
        .yPosition = 16,
        .redaCount = 1,
        .redas = REDA_088B5F6C,
    },
    { 0 },
};

// 0x88B6120
CONST_DATA struct UnitDefinition UnitDef_088B6120[] = {
    {
        .charIndex = CHARACTER_VALTER,
        .classIndex = CLASS_WYVERN_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 1,
        .yPosition = 13,
        .redaCount = 1,
        .redas = REDA_088B5F74,
    },
    { 0 },
};

CONST_DATA struct REDA REDA_088B6148[] = {
    {
        .x = 3,
        .y = 0,
        .a = 0x1,
    },
};
CONST_DATA struct REDA REDA_088B6150[] = {
    {
        .x = 3,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6158[] = {
    {
        .x = 4,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6160[] = {
    {
        .x = 4,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6168[] = {
    {
        .x = 5,
        .y = 7,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6170[] = {
    {
        .x = 3,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6178[] = {
    {
        .x = 3,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6180[] = {
    {
        .x = 4,
        .y = 2,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6188[] = {
    {
        .x = 4,
        .y = 8,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6190[] = {
    {
        .x = 3,
        .y = 11,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B6198[] = {
    {
        .x = 2,
        .y = 9,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_088B61A0[] = {
    {
        .x = 2,
        .y = 13,
        .b = 0xffff,
    },
};

// 0x88B61A8
CONST_DATA struct UnitDefinition UnitDef_088B61A8[] = {
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 14,
        .yPosition = 9,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 15,
        .yPosition = 7,
        .items = {
            ITEM_LANCE_JAVELIN,
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 16,
        .yPosition = 9,
        .items = {
            ITEM_AXE_VENIN,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MAGE,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 18,
        .yPosition = 5,
        .items = {
            ITEM_ANIMA_THUNDER,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 14,
        .yPosition = 11,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MERCENARY,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 14,
        .yPosition = 14,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 16,
        .yPosition = 12,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 16,
        .yPosition = 13,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_PRIEST,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 18,
        .yPosition = 9,
        .items = {
            ITEM_STAFF_MEND,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SHAMAN,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 18,
        .yPosition = 14,
        .items = {
            ITEM_DARK_FLUX,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 15,
        .yPosition = 15,
        .items = {
            ITEM_AXE_STEEL,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_MERCENARY,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 15,
        .yPosition = 10,
        .itemDrop = 1,
        .items = {
            ITEM_BLADE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x7f,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 8,
        .yPosition = 1,
        .items = {
            ITEM_BLADE_IRON,
        },
        .ai = {0x0, 0x12, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 7,
        .yPosition = 1,
        .items = {
            ITEM_SWORD_IRON,
        },
        .ai = {0x0, 0x12, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_CAVALIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 11,
        .yPosition = 0,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x12, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_TROUBADOUR,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 10,
        .yPosition = 0,
        .itemDrop = 1,
        .items = {
            ITEM_STAFF_MEND,
            ITEM_ELIXIR,
        },
        .ai = {0x0, 0x12, 0x0, 0x0},
    },
    {
        .charIndex = 0xb0,
        .classIndex = CLASS_BAEL,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 1,
        .xPosition = 27,
        .yPosition = 4,
        .items = {
            ITEM_MONSTER_VENINCLW,
        },
    },
    {
        .charIndex = CHARACTER_NOVALA,
        .classIndex = CLASS_SHAMAN,
        .allegiance = FACTION_ID_RED,
        .level = 10,
        .xPosition = 20,
        .yPosition = 5,
        .items = {
            ITEM_DARK_FLUX,
        },
        .ai = {0x3, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARCHER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 12,
        .yPosition = 4,
        .items = {
            ITEM_BOW_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0xf9,
        .classIndex = CLASS_CIVILIAN_F1,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 26,
        .yPosition = 12,
        .ai = {0x6, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0xfa,
        .classIndex = CLASS_CIVILIAN_M3,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 25,
        .yPosition = 13,
        .ai = {0x6, 0x3, 0x60, 0x0},
    },
    {
        .charIndex = 0xfb,
        .classIndex = CLASS_CIVILIAN_F3,
        .autolevel = 1,
        .allegiance = FACTION_ID_GREEN,
        .level = 1,
        .xPosition = 25,
        .yPosition = 12,
        .ai = {0x6, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 14,
        .yPosition = 16,
        .items = {
            ITEM_LANCE_IRON,
        },
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 20,
        .yPosition = 7,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_ARMOR_KNIGHT,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 6,
        .xPosition = 21,
        .yPosition = 13,
        .items = {
            ITEM_LANCE_HORSESLAYER,
            ITEM_LANCE_JAVELIN,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_SOLDIER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 7,
        .xPosition = 19,
        .yPosition = 13,
        .items = {
            ITEM_LANCE_IRON,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    {
        .charIndex = 0x80,
        .classIndex = CLASS_FIGHTER,
        .autolevel = 1,
        .allegiance = FACTION_ID_RED,
        .level = 5,
        .xPosition = 13,
        .yPosition = 6,
        .itemDrop = 1,
        .items = {
            ITEM_AXE_IRON,
            ITEM_AXE_HALBERD,
        },
        .ai = {0x0, 0x3, 0x0, 0x0},
    },
    { 0 },
};
