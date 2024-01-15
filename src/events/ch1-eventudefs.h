#pragma once

#include "global.h"
#include "muctrl.h"
#include "eventcall.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"

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
CONST_DATA struct REDA REDA_Ch1_Franz[] = {
    {
        .x = 5,
        .y = 1,
    },
};
CONST_DATA struct REDA REDA_Ch1_Gilliam[] = {
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
CONST_DATA struct REDA REDA_Ch1_NpcCavalier[] = {
    {
        .x = 2,
        .y = 3,
        .b = 0xffff,
    },
    {
        .x = 0,
        .y = 3,
        .b = 0xffff,
    },
    {
        .x = 0,
        .y = 0,
        .b = 0xffff,
    },
};
CONST_DATA struct REDA REDA_Ch1_NpcMercenary[] = {
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
        .redas = REDA_Ch1_Franz,
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
        .redas = REDA_Ch1_Gilliam,
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
        .redas = REDA_Ch1_NpcCavalier,
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
        .redas = REDA_Ch1_NpcMercenary,
        .items = {
            ITEM_SWORD_IRON,
        },
    },
    { 0 },
};
