#pragma once

#include "global.h"
#include "muctrl.h"
#include "eventcall.h"
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
