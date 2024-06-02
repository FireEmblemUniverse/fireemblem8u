#include "global.h"

#include "cp_common.h"
#include "cp_script.h"
#include "cp_data.h"
#include "bmunit.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"

struct AiScr CONST_DATA gAiScript_FallbackAi1[] = {
    AI_ACTION(100),
};

struct AiScr CONST_DATA gAiScript_FallbackAi2[] = {
    AI_MOVE_TO_ENEMY,
};

u8 CONST_DATA gUnknown_085A814C[] = {
    TERRAIN_WALL_1B, TERRAIN_SNAG, 0,
};

const u8 gClassList_Empty1[] = { 0 };

const u8 gClassList_Empty2[] = { 0 };

const u8 gClassList_Empty3[] = { 0 };

const u8 gClassList_Empty4[] = { 0 };

const u8 gClassList_Empty5[] = { 0 };

const u8 gClassList_Empty6[] = { 0 };

const u8 gClassList_Empty7[] = { 0 };

const u8 gClassList_Empty8[] = { 0 };

const u8 gClassList_Empty9[] = { 0 };

// unused in FE8; leftover from FE6
const u8* CONST_DATA gAiClassRankLists[] = {
    gClassList_Empty1,
    gClassList_Empty2,
    gClassList_Empty3,
    gClassList_Empty4,
    gClassList_Empty5,
    gClassList_Empty6,
    gClassList_Empty7,
    gClassList_Empty8,
    gClassList_Empty9,
    0,
};

const struct AiCombatScoreCoefficients gAiCombatScoreCoefficientTable[] = {
    [0] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [1] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [2] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 2,
        .coeffDamageTaken = 2,
        .coeffDanger = 1,
        .coeffLowHpSelf = 2,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [3] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [4] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 0,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 2,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [5] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
            [5] = 40,
        }
    },

    [6] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 5,
            [4] = 5,
            [5] = 5,
            [6] = 40,
        }
    },

    [7] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 5,
            [4] = 5,
            [5] = 5,
            [7] = 40,
        }
    },

    [8] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 5,
            [3] = 40,
        }
    },

    [9] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {}
    },

    [10] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [2] = 40,
            [4] = 40,
        }
    },

    [11] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 2,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
            [8] = 40,
        }
    },

    [12] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 20,
            [1] = 20,
            [2] = 20,
            [4] = 20,
            [5] = 20,
            [6] = 20,
            [7] = 20,
            [8] = 20,
        }
    },

    [13] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 2,
        .coeffDanger = 2,
        .coeffLowHpSelf = 2,
        .classRankBonuses = {
            [0] = 20,
            [1] = 25,
            [3] = 20,
            [4] = 25,
            [5] = 20,
            [6] = 20,
            [7] = 20,
            [8] = 20,
        }
    },

    [14] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 2,
        .coeffDanger = 0,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [15] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 0,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [16] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 5,
            [4] = 5,
        }
    },

    [17] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [18] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [19] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 2,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [20] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 0,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 2,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [21] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 0,
        .coeffDanger = 0,
        .coeffLowHpSelf = 0,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [22] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 5,
            [4] = 5,
            [5] = 5,
            [6] = 50,
        }
    },

    [23] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 5,
            [4] = 5,
            [5] = 5,
            [7] = 50,
        }
    },

    [24] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 5,
            [3] = 80,
        }
    },

    [25] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {}
    },

    [26] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 25,
            [2] = 40,
        }
    },

    [27] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 2,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
            [8] = 40,
        }
    },

    [28] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 2,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 1,
        .coeffDanger = 1,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 20,
            [1] = 20,
            [2] = 20,
            [4] = 20,
            [5] = 20,
            [6] = 20,
            [7] = 20,
            [8] = 20,
        }
    },

    [29] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 2,
        .coeffFriendZone = 1,
        .coeffClassRankBonus = 1,
        .coeffTurnNumber = 1,
        .coeffDamageTaken = 2,
        .coeffDanger = 1,
        .coeffLowHpSelf = 2,
        .classRankBonuses = {
            [0] = 20,
            [1] = 25,
            [3] = 20,
            [4] = 25,
            [5] = 20,
            [6] = 20,
            [7] = 20,
            [8] = 20,
        }
    },

    [30] = {
        .coeffDamageDealt = 2,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 2,
        .coeffDanger = 0,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

    [31] = {
        .coeffDamageDealt = 1,
        .coeffLowHpOpponent = 1,
        .coeffFriendZone = 0,
        .coeffClassRankBonus = 0,
        .coeffTurnNumber = 0,
        .coeffDamageTaken = 1,
        .coeffDanger = 0,
        .coeffLowHpSelf = 1,
        .classRankBonuses = {
            [0] = 10,
            [1] = 15,
            [4] = 5,
        }
    },

};

// unused? padding?
u16 CONST_DATA gUnknown_085A8178[] = { 0 };

// AI2 01=Move towards enemy (except [0x5A817A])
u16 CONST_DATA PList_AiUnused1[] = { 0 };

// AI2 02=Move towards enemy (except [0x5A817C])
u16 CONST_DATA PList_AiUnused2[] = { 0 };

// AI1 09=Do not attack [0x5A817E]
u16 CONST_DATA gUnknown_085A817E[] = { 0 };

u16 CONST_DATA gUnknown_085A8180[] = { TERRAIN_ARMORY };

// AI2 0D=Target terrain (Throne, Gate) Length:2
u8 CONST_DATA gUnknown_085A8182[] = { TERRAIN_GATE_0B, TERRAIN_THRONE, };

// TODO: unused? padding? file boundary?
u8 CONST_DATA gUnknown_085A8184[] = { 0, 0, 0, 0 };

// All escape points between FE8U:0x080D83F8 - FE8U:0x080D84E0 appear to be unreferenced

const struct AiEscapePt gUnknown_080D83F8[] = {
    {  1, 1, 5 },
    {  3, 1, 5 },
    { -1, 0, 0 }
};

const struct AiEscapePt gUnknown_080D8404[] = {
    {  0, 11, 2 },
    {  1, 11, 2 },
    {  2, 11, 2 },
    { -1,  0, 0 }
};

const struct AiEscapePt gUnknown_080D8414[] = {
    { 10, 27, 2 },
    { 11, 27, 2 },
    { 12, 27, 2 },
    { -1,  0, 0 }
};

const struct AiEscapePt gUnknown_080D8424[] = {
    {  7, 16, 2 },
    {  8, 16, 2 },
    {  9, 16, 2 },
    { -1,  0, 0 }
};

const struct AiEscapePt gUnknown_080D8434[] = {
    { 15, 0, 3 },
    { 16, 0, 3 },
    { -1, 0, 0 }
};

const struct AiEscapePt gUnknown_080D8440[] = {
    {  7, 0, 3 },
    {  8, 0, 3 },
    {  9, 0, 3 },
    { -1, 0, 0 }
};

const struct AiEscapePt gUnknown_080D8450[] = {
    { 16, 19, 1 },
    { 13, 22, 2 },
    { -1,  0, 0 },
};

const struct AiEscapePt gUnknown_080D845C[] = {
    {  0, 1, 0 },
    {  0, 2, 0 },
    {  0, 3, 0 },
    { -1, 0, 0 },
};

const struct AiEscapePt gUnknown_080D846C[] = {
    { 20, 22, 2 },
    { 19, 22, 2 },
    { -1,  0, 0 },
};

const struct AiEscapePt gUnknown_080D8478[] = {
    {  9, 0, 3 },
    { 10, 0, 3 },
    { -1, 0, 0 },
};

const struct AiEscapePt gUnknown_080D8484[] = {
    { 11, 3, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt gUnknown_080D848C[] = {
    {  8, 11, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt gUnknown_080D8494[] = {
    { 19, 2, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt gUnknown_080D849C[] = {
    {  1, 17, 5 },
    {  2, 18, 5 },
    {  6, 18, 5 },
    { 16,  1, 5 },
    { 17,  1, 5 },
    { 12, 18, 5 },
    { 13, 18, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt gUnknown_080D84BC[] = {
    {  0, 5, 0 },
    {  0, 6, 0 },
    { -1, 0, 0 },
};

const struct AiEscapePt gUnknown_080D84C8[] = {
    { 13, 27, 2 },
    { 14, 27, 2 },
    { 15, 27, 2 },
    { 16, 27, 2 },
    { 17, 27, 2 },
    { -1,  0, 0 },
};

// Here is where the referenced escape points start

const struct AiEscapePt AiEscapePts_None[] = {
    { -1, 0, 0 },
};

const struct AiEscapePt AiEscapePts_09[] = {
    { 10, 13, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_3D[] = {
    {  0, 17, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_0E[] = {
    {  0, 13, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_10[] = {
    { 12, 21, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_1D[] = {
    { 12, 21, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_13[] = {
    { 28, 2, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt AiEscapePts_1B[] = {
    {  1, 1, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt AiEscapePts_20[] = {
    { 28, 2, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt AiEscapePts_31[] = {
    {  0, 27, 5 },
    { 19,  1, 5 },
    { -1,  0, 0 },
};

const struct AiEscapePt AiEscapePts_32[] = {
    { 19, 2, 5 },
    { -1, 0, 0 },
};

const struct AiEscapePt* CONST_DATA gRedAiEscapePoints[] = {
    [0x00] = AiEscapePts_None,
    [0x01] = AiEscapePts_None,
    [0x02] = AiEscapePts_None,
    [0x03] = AiEscapePts_None,
    [0x04] = AiEscapePts_None,
    [0x05] = AiEscapePts_None,
    [0x06] = AiEscapePts_None,
    [0x07] = AiEscapePts_None,
    [0x08] = AiEscapePts_None,
    [0x09] = AiEscapePts_09,
    [0x0A] = AiEscapePts_None,
    [0x0B] = AiEscapePts_None,
    [0x0C] = AiEscapePts_None,
    [0x0D] = AiEscapePts_None,
    [0x0E] = AiEscapePts_0E,
    [0x0F] = AiEscapePts_None,
    [0x10] = AiEscapePts_10,
    [0x11] = AiEscapePts_None,
    [0x12] = AiEscapePts_None,
    [0x13] = AiEscapePts_13,
    [0x14] = AiEscapePts_None,
    [0x15] = AiEscapePts_None,
    [0x16] = AiEscapePts_None,
    [0x17] = AiEscapePts_None,
    [0x18] = AiEscapePts_None,
    [0x19] = AiEscapePts_None,
    [0x1A] = AiEscapePts_None,
    [0x1B] = AiEscapePts_1B,
    [0x1C] = AiEscapePts_None,
    [0x1D] = AiEscapePts_1D,
    [0x1E] = AiEscapePts_None,
    [0x1F] = AiEscapePts_None,
    [0x20] = AiEscapePts_20,
    [0x21] = AiEscapePts_None,
    [0x22] = AiEscapePts_None,
    [0x23] = AiEscapePts_None,
    [0x24] = AiEscapePts_None,
    [0x25] = AiEscapePts_None,
    [0x26] = AiEscapePts_None,
    [0x27] = AiEscapePts_None,
    [0x28] = AiEscapePts_None,
    [0x29] = AiEscapePts_None,
    [0x2A] = AiEscapePts_None,
    [0x2B] = AiEscapePts_None,
    [0x2C] = AiEscapePts_None,
    [0x2D] = AiEscapePts_None,
    [0x2E] = AiEscapePts_None,
    [0x2F] = AiEscapePts_None,
    [0x30] = AiEscapePts_None,
    [0x31] = AiEscapePts_31,
    [0x32] = AiEscapePts_32,
    [0x33] = AiEscapePts_None,
    [0x34] = AiEscapePts_None,
    [0x35] = AiEscapePts_None,
    [0x36] = AiEscapePts_None,
    [0x37] = AiEscapePts_None,
    [0x38] = AiEscapePts_None,
    [0x39] = AiEscapePts_None,
    [0x3A] = AiEscapePts_None,
    [0x3B] = AiEscapePts_None,
    [0x3C] = AiEscapePts_None,
    [0x3D] = AiEscapePts_3D,
    [0x3E] = AiEscapePts_None,
    [0x3F] = AiEscapePts_None,
    [0x40] = AiEscapePts_None,
};

const struct AiEscapePt* CONST_DATA gGreenAiEscapePoints[] = {
    [0x00] = AiEscapePts_None,
    [0x01] = AiEscapePts_None,
    [0x02] = AiEscapePts_None,
    [0x03] = AiEscapePts_None,
    [0x04] = AiEscapePts_None,
    [0x05] = AiEscapePts_None,
    [0x06] = AiEscapePts_None,
    [0x07] = AiEscapePts_None,
    [0x08] = AiEscapePts_None,
    [0x09] = AiEscapePts_None,
    [0x0A] = AiEscapePts_None,
    [0x0B] = AiEscapePts_None,
    [0x0C] = AiEscapePts_None,
    [0x0D] = AiEscapePts_None,
    [0x0E] = AiEscapePts_None,
    [0x0F] = AiEscapePts_None,
    [0x10] = AiEscapePts_None,
    [0x11] = AiEscapePts_None,
    [0x12] = AiEscapePts_None,
    [0x13] = AiEscapePts_None,
    [0x14] = AiEscapePts_None,
    [0x15] = AiEscapePts_None,
    [0x16] = AiEscapePts_None,
    [0x17] = AiEscapePts_None,
    [0x18] = AiEscapePts_None,
    [0x19] = AiEscapePts_None,
    [0x1A] = AiEscapePts_None,
    [0x1B] = AiEscapePts_None,
    [0x1C] = AiEscapePts_None,
    [0x1D] = AiEscapePts_None,
    [0x1E] = AiEscapePts_None,
    [0x1F] = AiEscapePts_None,
    [0x20] = AiEscapePts_None,
    [0x21] = AiEscapePts_None,
    [0x22] = AiEscapePts_None,
    [0x23] = AiEscapePts_None,
    [0x24] = AiEscapePts_None,
    [0x25] = AiEscapePts_None,
    [0x26] = AiEscapePts_None,
    [0x27] = AiEscapePts_None,
    [0x28] = AiEscapePts_None,
    [0x29] = AiEscapePts_None,
    [0x2A] = AiEscapePts_None,
    [0x2B] = AiEscapePts_None,
    [0x2C] = AiEscapePts_None,
    [0x2D] = AiEscapePts_None,
    [0x2E] = AiEscapePts_None,
    [0x2F] = AiEscapePts_None,
    [0x30] = AiEscapePts_None,
    [0x31] = AiEscapePts_None,
    [0x32] = AiEscapePts_None,
    [0x33] = AiEscapePts_None,
    [0x34] = AiEscapePts_None,
    [0x35] = AiEscapePts_None,
    [0x36] = AiEscapePts_None,
    [0x37] = AiEscapePts_None,
    [0x38] = AiEscapePts_None,
    [0x39] = AiEscapePts_None,
    [0x3A] = AiEscapePts_None,
    [0x3B] = AiEscapePts_None,
    [0x3C] = AiEscapePts_None,
    [0x3D] = AiEscapePts_None,
    [0x3E] = AiEscapePts_None,
    [0x3F] = AiEscapePts_None,
    [0x40] = AiEscapePts_None,
};

struct AiHealThreshold CONST_DATA gAI3HealingThresholdTable[] = {
    { 100,  50, },
    {  80,  30, },
    {  50,  10, },
    { 100,  80, },
    {   0,   0, },
};

u16 CONST_DATA gAiStealPriorityItemList[] = {
    ITEM_MEMBERCARD,
    ITEM_SILVERCARD,
    ITEM_HOPLON_SHIELD,
    ITEM_DELPHISHIELD,
    ITEM_LOCKPICK,
    ITEM_METISSTOME,
    ITEM_MASTERSEAL,
    ITEM_HEROCREST,
    ITEM_KNIGHTCREST,
    ITEM_ORIONSBOLT,
    ITEM_ELYSIANWHIP,
    ITEM_GUIDINGRING,
    ITEM_HEAVENSEAL,
    ITEM_UNK_C1,
    ITEM_WHITEGEM,
    ITEM_FILLAS_MIGHT,
    ITEM_NINISS_GRACE,
    ITEM_THORS_IRE,
    ITEM_SETS_LITANY,
    ITEM_BOOSTER_SKL,
    ITEM_BOOSTER_LCK,
    ITEM_BOOSTER_HP,
    ITEM_BOOSTER_DEF,
    ITEM_BOOSTER_POW,
    ITEM_BOOSTER_SPD,
    ITEM_BOOSTER_RES,
    ITEM_BOOSTER_MOV,
    ITEM_BOOSTER_CON,
    ITEM_JUNAFRUIT,
    ITEM_BLUEGEM,
    ITEM_REDGEM,
    ITEM_ELIXIR,
    ITEM_CHESTKEY,
    ITEM_DOORKEY,
    ITEM_PUREWATER,
    ITEM_TORCH,
    ITEM_VULNERARY,
    ITEM_ANTITOXIN,
    ITEM_MINE,
    ITEM_LIGHTRUNE,

    -1,
};

const u32 gAiItemConfigTable[] = {
    [0x00] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x01] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x02] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x03] = (AI_ENABLE_LOCKPICK),
    [0x04] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x05] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x06] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x07] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x08] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x09] = (AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x0A] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x0B] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x0C] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x0D] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x0E] = (AI_ENABLE_LOCKPICK),
    [0x0F] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x10] = (AI_ENABLE_LOCKPICK),
    [0x11] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x12] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x13] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x14] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x15] = (AI_ENABLE_LOCKPICK),
    [0x16] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x17] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK),
    [0x18] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x19] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x1A] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x1B] = (AI_ENABLE_LOCKPICK),
    [0x1C] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x1D] = (AI_ENABLE_LOCKPICK),
    [0x1E] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x1F] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x20] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x21] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x22] = (AI_ENABLE_LOCKPICK),
    [0x23] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x24] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x25] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x26] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x27] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x28] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x29] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2A] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2B] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2C] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2D] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2E] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x2F] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x30] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x31] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x32] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x33] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x34] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x35] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x36] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x37] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x38] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x39] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3A] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3B] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3C] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3D] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3E] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x3F] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
    [0x40] = (AI_ENABLE_DOOR_KEY | AI_ENABLE_LOCKPICK | AI_ENABLE_ANTITOXIN),
};

const struct Vec2 gUnknown_080D863C[] = {
    {  3,  1 },
    {  3,  5 },
    {  7,  5 },
    {  7,  1 },

    { -1, -1 },
};

const struct Vec2 gUnknown_080D8650[] = {
    {  9,  9 },
    { 13, 15 },
    {  3, 18 },

    { -1, -1 },
};

const struct Vec2* CONST_DATA gUnknown_085A83F8[] = {
    gUnknown_080D863C,
    gUnknown_080D8650
};

const struct Vec2** CONST_DATA gUnknown_085A8400 = gUnknown_085A83F8;

char CONST_DATA gUnknown_085A8404[] = "CALL TEST\n";

// AI2 08=- Length:2
const u8 gUnknown_080D8660[] = {
    -1, +1, 0, 0
};

// AI2 06=If possible to attack in 2 actions, move towards enemy Length:2
const struct AiCountEnemiesInRangeArg AiCountInRangArg_InRange2 = {
    .move_coeff_q4 = 0x20, // 2.0
    .attack_range = TRUE,
    .result_slot = 0,
};

//AI1 0C=Attack if enemy is in half of unit's range Length:2
const u8 gUnknown_080D8668[] = {
    0x08, 0x01, 0, 0
};

//?
const u8 gUnknown_080D866C[] = {
    0x08, 0x01, 0, 0
};

// AI1 0E=Heal unit with HP is 50% or less Length:2
const u8 gUnknown_080D8670[] = {
    0x64, 0x32, 0, 0
};

//AI1 10=Steal Main Length:2
const u8 gUnknown_080D8674[] = {
    0x64, 0x64, 0, 0
};

//AI1 11=Do not move until door is open Length:2
const u8 gUnknown_080D8678[] = {
    0x64, 0x64, 0, 0
};

// TODO: These are defined elsewhere; need to standardize declarations
s8 AiTryUseNightmareStaff(const void*);
s8 AiDecideNightmareStaff(const void*);
s8 AiTryDKSummon(const void*);
s8 AiDecideDKSummon(const void*);

// 0x00 = Move towards opponents. If blocked, do nothing
struct AiScr CONST_DATA AiScr_AiB_MoveToEnemy[] = {
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// 0x0F = Move towards opponents. Move as close as possible when blocked.
struct AiScr CONST_DATA gAiScript_085A8430[] = {
    AI_MOVE_TO_ENEMY_2,
    AI_GOTO_START,
};

// 0x12 = Wait one turn, then change AI2 to 0x0 (Pursue)
struct AiScr CONST_DATA AiScr_AiB_MoveToEnemyAfterOneTurn[] = {
    AI_NOP_0E,
    AI_SET_AI2(AI_B_00),
    AI_GOTO_START,
};

// 0x11 = Wait one turn, then change AI2 to 0x4 (raid then attack)
struct AiScr CONST_DATA AiScr_AiB_PillageThenPursueAfterOneTurn[] = {
    AI_NOP_0E,
    AI_SET_AI2(AI_B_04),
    AI_GOTO_START,
};

// 0x01 = Move towards opponents, but not character(s) 0x0 (5A817A)
// In FE6, it is Clarine, but now unused
// Maybe we can redirect there to select which unit to ignore
struct AiScr CONST_DATA AiScr_AiB_MoveToEnemy_IgnoreChar_Unused1[] = {
    AI_MOVE_TO_ENEMY_IGNORING(PList_AiUnused1),
    AI_GOTO_START,
};

// 0x02 = Move towards opponents, but not character(s) 0x0 (5A817C)
struct AiScr CONST_DATA AiScr_AiB_MoveToEnemy_IgnoreChar_Unused2[] = {
    AI_MOVE_TO_ENEMY_IGNORING(PList_AiUnused2),
    AI_GOTO_START,
};

// 0x03 = Do nothing
struct AiScr CONST_DATA AiScr_AiB_NeverMove[] = {
    AI_NOP_0E,
    AI_GOTO_START,
};

// 0x04 = Loot villages/open chests, then change AI2 to 0x0
struct AiScr CONST_DATA AiScr_AiB_PillageThenPursue[] = {
    AI_PILLAGE,
    AI_SET_AI(AI_A_00, AI_B_00),
    AI_GOTO_START,
};

// 0x05 = Loot villages/open chests, then change AI2 to 0xC
struct AiScr CONST_DATA AiScr_AiB_PillageThenEscape[] = {
    AI_PILLAGE,
    AI_SET_AI(AI_A_06, AI_B_0C),
    AI_GOTO_START,
};

// 0x0C = Move to escape point and escape; if cannot escape, do nothing
struct AiScr CONST_DATA gAiScript_Escape[] = {
    AI_ESCAPE,
    AI_GOTO_START,
};

// unused?
struct AiScr CONST_DATA gAiScript_085A8590[] =
{
    AI_MOVE_TOWARDS(21, 17),
AI_LABEL(0x1),
    AI_NOP,
    AI_GOTO(0x1),
};

// 0x08 = ?
struct AiScr CONST_DATA gAiScript_085A85D0[] = {
    AI_CALL_FUNC(AiCountEnemyInRangeOrTryMoveToSpecificPosition, 0x0),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_CALL_FUNC(sub_803F34C, gUnknown_080D8660),
};

// 0x06 = If could reach opponents in two turns, change AI2 to 0x0
struct AiScr CONST_DATA AiScr_AiB_MoveTwiceToEnemy[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, &AiCountInRangArg_InRange2),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_NOP_0E,
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI2(AI_B_00),
    AI_GOTO(0x1),
};

// 0x07 = If could reach opponents in two turns, change AI2 to 0x1
struct AiScr CONST_DATA AiScr_AiB_MoveTwiceToEnemy_IgnoreChar_Unused1[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, &AiCountInRangArg_InRange2),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_NOP_0E,
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI2(0x1),
    AI_GOTO(0x1),
};

// unused?
struct AiScr CONST_DATA AiScr_AiB_MoveTwiceToEnemy_IgnoreChar_Unused2[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, &AiCountInRangArg_InRange2),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0),
    AI_NOP_0E,
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI2(0x0),
    AI_GOTO(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// 0x09 = Random movement
struct AiScr CONST_DATA gAiScript_085A8790[] = {
    AI_MOVE_RANDOM,
    AI_GOTO_START,
};

// unused?
struct AiScr CONST_DATA gAiScript_085A87B0[] = {
    AI_MOVE_TO_LISTED_TERRAIN(gUnknown_085A8180),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x4),
    AI_GOTO_START,
AI_BAD_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// 0x0D = Move on to nearest terrain 0x1B/0x1F (Throne/Fence) (0x5A8182)
struct AiScr CONST_DATA gAiScript_085A8810[] = {
    AI_MOVE_TO_LISTED_TERRAIN(gUnknown_085A8182),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x4),
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8840[] = {
    AI_BAD_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// 0x00 = Action 100%
struct AiScr CONST_DATA gAiScript_ActionInRange[] = {
    AI_ACTION(100),
    AI_GOTO_START,
};

// 0x01 = Action 80%, end turn without moving/acting 20%
struct AiScr CONST_DATA gAiScript_ActionInRange_80Perc[] = {
    AI_ACTION(80),
    AI_GOTO_START,
};

// 0x02 = Action 50%, end turn without moving/acting 50%
struct AiScr CONST_DATA gAiScript_ActionInRange_50Perc[] = {
    AI_ACTION(50),
    AI_GOTO_START,
};

// 0x03 = Action without moving 100%
struct AiScr CONST_DATA gAiScript_ActionStanding[] = {
    AI_ACTION_IN_PLACE(100),
    AI_GOTO_START,
};

// 0x04 = Action without moving 80%, end turn without moving/acting 20%
struct AiScr CONST_DATA gAiScript_ActionStanding_80Perc[] = {
    AI_ACTION_IN_PLACE(80),
    AI_GOTO_START,
};

// 0x05 = Action without moving 50%, end turn without moving/acting 50%
struct AiScr CONST_DATA gAiScript_ActionStanding_50Perc[] = {
    AI_ACTION_IN_PLACE(50),
    AI_GOTO_START,
};

// 0x06 = Do Nothing
struct AiScr CONST_DATA gAiScript_DoNothing[] = {
    AI_NOP,
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8950[] = {
    AI_ACTION(100),
    AI_CALL_FUNC(sub_803F330, NULL),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_ACTION_IN_PLACE(100),
    AI_GOTO(0x1),
};

// unused
struct AiScr CONST_DATA gAiScript_085A89C0[] = {
    AI_ACTION(100),
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A89E0[] = {
    AI_ACTION(100),
    AI_GOTO_START,
};

u8 CONST_DATA gUnknown_085A8A00[] = { CHARACTER_NATASHA, 0, 0, 0 };

// 0x07 = Do not attack character 0xD (Natasha, character at 5A8A00)
struct AiScr CONST_DATA gAiScript_ActionInRange_ExceptNatasha[] = {
    AI_ACTION_IGNORING(100, gUnknown_085A8A00),
    AI_GOTO_START,
};

const u16 CONST_DATA gUnknown_085A8A24[] = { 0x100, 0x100, 0 };

// 0x12 = Do not attack character ??? (points to 00 01 00 01)
struct AiScr CONST_DATA gAiScript_085A8A2C[] = {
    AI_ACTION_IGNORING(100, gUnknown_085A8A24),
    AI_GOTO_START,
};

const u16 CONST_DATA gUnknown_085A8A4C[] = { 0x100, 0 };

// 0x13 = Do not attack character ??? (points to 00 01 00 00)
struct AiScr CONST_DATA gAiScript_085A8A50[] = {
    AI_ACTION_IGNORING(100, gUnknown_085A8A4C),
    AI_GOTO_START,
};

const u8 CONST_DATA gUnknown_085A8A70[] = {
    5, 4, 80, 0
};

const u8 CONST_DATA gUnknown_085A8A74[] = {
    5, 3, 0, 0
};

struct UnitDefinition* CONST_DATA gUnknown_085A8A78 = gUnitDefSumDK;

// 0x14 = Try to use Nightmare (but not on turn one), then try to Summon Units, then act like 0x0 (AttackInRange)
struct AiScr CONST_DATA gAiScript_085A8A7C[] = {
    AI_CALL_FUNC(AiTryUseNightmareStaff, gUnknown_085A8A70),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x0),
    AI_CALL_FUNC(AiDecideNightmareStaff, 0x0),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_CALL_FUNC(AiTryDKSummon, gUnknown_085A8A74),
    AI_GOTO_IFEQ(0x2, gAiState.cmd_result+0, 0x0),
    AI_CALL_FUNC(AiDecideDKSummon, 0x0),
    AI_GOTO_START,
AI_LABEL(0x2),
    AI_ACTION(100),
    AI_GOTO_START,
};

u8 CONST_DATA gUnknown_085A8B3C[] = { CHARACTER_CITIZEN, 0, 0, 0 };

// 0x08 = Do not attack character 0xFC (character at 5A8B3C)
struct AiScr CONST_DATA gAiScript_ActionInRange_ExceptCivilian[] = {
    AI_ACTION_IGNORING(100, gUnknown_085A8B3C),
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8B60[] = {
    AI_ACTION_IGNORING(100, PList_AiUnused2),
    AI_GOTO_START,
};

// 0x09 = Do not attack character 0x0 (character at 5A817C)
struct AiScr CONST_DATA gAiScript_085A8B80[] = {
    AI_ACTION_IGNORING(100, gUnknown_085A817E),
    AI_GOTO_START,
};

// 0x0A = Only attack character ??? if deployed. (currently 00 01, set it at 5A8BA4)
struct AiScr CONST_DATA gAiScript_085A8BA0[] = {
    AI_ACTION_ON_CHAR(100, 0x100),
    AI_GOTO_IFNE(0x0, gAiState.cmd_result+0, 0x3),
    AI_ACTION(100),
    AI_GOTO_START,
};

// 0x0B = Same as 0x0
struct AiScr CONST_DATA gAiScript_085A8BE0[] = {
    AI_ACTION(100),
    AI_GOTO_START,
};

// 0x0C = Attack if within Mov/2+Range(?)
struct AiScr CONST_DATA gAiScript_085A8C00[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, gUnknown_080D8668),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_ACTION_IN_PLACE(100),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_ACTION(100),
    AI_GOTO_START,
};

// 0x0D = CHAI [0x0, 0x0] if the unit's leader has foe in range.(?)
struct AiScr CONST_DATA gAiScript_085A8C70[] = {
    AI_CALL_FUNC(sub_803F51C, NULL),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+1, 0x1),
    AI_CALL_FUNC(sub_803F72C, NULL),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI(0x0, 0x0),
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8CE0[] = {
    AI_SET_AI(0x0, 0x0),
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8D00[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, gUnknown_080D866C),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_MOVE_TOWARDS(5, 7),
    AI_ACTION_IN_PLACE(100),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// unused
struct AiScr CONST_DATA gAiScript_085A8D80[] = {
    AI_CALL_FUNC(AiFunc_CountEnemiesInRange, gUnknown_080D866C),
    AI_GOTO_IFGT(0x1, gAiState.cmd_result+0, 0x0),
    AI_MOVE_TOWARDS(17, 6),
    AI_ACTION_IN_PLACE(0x64),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
};

// 0x0A = Move to character 0x1 Eirika if not in range, or move to opponents if so
struct AiScr CONST_DATA gAiScript_085A8E00[] = {
    AI_MOVE_TOWARDS_CHAR(CHARACTER_EIRIKA),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x4),
    AI_GOTO_IFEQ(0x2, gAiState.cmd_result+0, 0x1),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x2),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
AI_LABEL(0x2),
    AI_MOVE_TO_ENEMY,
    AI_GOTO(0x2),
};

// 0x0B = Move to character 0xF Ephraim if not in range, or move to opponents if so
struct AiScr CONST_DATA gAiScript_085A8EB0[] = {
    AI_MOVE_TOWARDS_CHAR(CHARACTER_EPHRAIM),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x4),
    AI_GOTO_IFEQ(0x2, gAiState.cmd_result+0, 0x1),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x2),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_MOVE_TO_ENEMY,
    AI_GOTO_START,
AI_LABEL(0x2),
    AI_MOVE_TO_ENEMY,
    AI_GOTO(0x2),
};

// unused
struct AiScr CONST_DATA gAiScript_085A8F60[] = {
    AI_CALL_FUNC(sub_803F51C, NULL),
    AI_CALL_FUNC(sub_803F72C, NULL),
    AI_GOTO_START,
};

// 0x0E = Heal allies under 50% HP(?)
struct AiScr CONST_DATA gAiScript_085A8F90[] = {
    AI_CALL_FUNC(sub_803F790, gUnknown_080D8670),
    AI_GOTO_START,
};

// 0x0F = Alternate between 0xE and 0x3
struct AiScr CONST_DATA gAiScript_085A8FB0[] = {
    AI_CALL_FUNC(sub_803F790, gUnknown_080D8670),
    AI_ACTION_IN_PLACE(100),
    AI_GOTO_START,
};

// 0x10 = Pick Locks/Steal, then CHAI [0x6, 0xC] (Escape)
struct AiScr CONST_DATA gAiScript_085A8FE0[] = {
    AI_CALL_FUNC(sub_803F7DC, gUnknown_080D8674),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x5),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI(0x6, 0xC),
    AI_GOTO_START,
};

// 0x11 = Pick Locks/Steal
struct AiScr CONST_DATA gAiScript_085A9040[] = {
    AI_CALL_FUNC(sub_803F7DC, gUnknown_080D8678),
    AI_GOTO_START,
};

// 0x0E = Attack walls until no more remain(?), then CHAI [0x0,0x0]
struct AiScr CONST_DATA gAiScript_AttackWallsSnags[] = {
    AI_ATTACK_WALLS,
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x4),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI(0x0, 0x0),
    AI_GOTO_START,
};

const u8 CONST_DATA gUnknown_085A90C0[] = {
    0x0F, 0x11, 0, 0
};

const u8 CONST_DATA gUnknown_085A90C4[] = {
    0x0D, 0x0F, 0x12, 0x13
};

// 0x10 = If not in area [13,15]-[18,19], move to [15,17]; if in area, CHAI [0x0,0x0]
struct AiScr CONST_DATA AiScr_AiB_GuardSpecificLocation[] = {
    AI_CALL_FUNC(sub_803F4A4, gUnknown_085A90C4),
    AI_GOTO_IFEQ(0x1, gAiState.cmd_result+0, 0x1),
    AI_CALL_FUNC(sub_803F9A8, gUnknown_085A90C0),
    AI_GOTO_START,
AI_LABEL(0x1),
    AI_SET_AI(0x0, 0x0),
    AI_GOTO_START,
};

struct AiScr* CONST_DATA gAi2ScriptTable[] = {
    [AI_B_00] = AiScr_AiB_MoveToEnemy,
    [AI_B_01] = AiScr_AiB_MoveToEnemy_IgnoreChar_Unused1,
    [AI_B_02] = AiScr_AiB_MoveToEnemy_IgnoreChar_Unused2,
    [AI_B_03] = AiScr_AiB_NeverMove,
    [AI_B_04] = AiScr_AiB_PillageThenPursue,
    [AI_B_05] = AiScr_AiB_PillageThenEscape,
    [AI_B_06] = AiScr_AiB_MoveTwiceToEnemy,
    [AI_B_07] = AiScr_AiB_MoveTwiceToEnemy_IgnoreChar_Unused1,
    [AI_B_08] = gAiScript_085A85D0,
    [AI_B_09] = gAiScript_085A8790,
    [AI_B_0A] = gAiScript_085A8E00,
    [AI_B_0B] = gAiScript_085A8EB0,
    [AI_B_0C] = gAiScript_Escape,
    [AI_B_0D] = gAiScript_085A8810,
    [AI_B_0E] = gAiScript_AttackWallsSnags,
    [AI_B_0F] = gAiScript_085A8430,
    [AI_B_10] = AiScr_AiB_GuardSpecificLocation,
    [AI_B_11] = AiScr_AiB_PillageThenPursueAfterOneTurn,
    [AI_B_12] = AiScr_AiB_MoveToEnemyAfterOneTurn,
};

struct AiScr* CONST_DATA gAi1ScriptTable[] = {
    [AI_A_00] = gAiScript_ActionInRange,
    [AI_A_01] = gAiScript_ActionInRange_80Perc,
    [AI_A_02] = gAiScript_ActionInRange_50Perc,
    [AI_A_03] = gAiScript_ActionStanding,
    [AI_A_04] = gAiScript_ActionStanding_80Perc,
    [AI_A_05] = gAiScript_ActionStanding_50Perc,
    [AI_A_06] = gAiScript_DoNothing,
    [AI_A_07] = gAiScript_ActionInRange_ExceptNatasha,
    [AI_A_08] = gAiScript_ActionInRange_ExceptCivilian,
    [AI_A_09] = gAiScript_085A8B80,
    [AI_A_0A] = gAiScript_085A8BA0,
    [AI_A_0B] = gAiScript_085A8BE0,
    [AI_A_0C] = gAiScript_085A8C00,
    [AI_A_0D] = gAiScript_085A8C70,
    [AI_A_0E] = gAiScript_085A8F90,
    [AI_A_0F] = gAiScript_085A8FB0,
    [AI_A_10] = gAiScript_085A8FE0,
    [AI_A_11] = gAiScript_085A9040,
    [AI_A_12] = gAiScript_085A8A2C,
    [AI_A_13] = gAiScript_085A8A50,
    [AI_A_14] = gAiScript_085A8A7C,
};

struct AiScr** CONST_DATA gpAi2Table[] = {
    gAi2ScriptTable,
    gAi2ScriptTable,
    gAi2ScriptTable,
};

struct AiScr** CONST_DATA gpAi1Table[] = {
    gAi1ScriptTable,
    gAi1ScriptTable,
    gAi1ScriptTable,
};
