#ifndef GUARD_CP_DATA_H
#define GUARD_CP_DATA_H

struct AiCombatScoreCoefficients {
    /* 00 */ u8 coeffDamageDealt;
    /* 01 */ u8 coeffLowHpOpponent;
    /* 02 */ u8 coeffFriendZone;
    /* 03 */ u8 coeffClassRankBonus;
    /* 04 */ u8 coeffTurnNumber;
    /* 05 */ u8 coeffDamageTaken;
    /* 06 */ u8 coeffDanger;
    /* 07 */ u8 coeffLowHpSelf;
    /* 08 */ u8 classRankBonuses[9];
};

struct AiEscapePt {
    /* 00 */ u8 x, y;
    /* 02 */ u8 facing;
};

struct AiHealThreshold {
    /* 00 */ u8 exitThreshold;
    /* 01 */ u8 enterThreshold;
};

enum {
    AI_ENABLE_DOOR_KEY  = (1 << 0),
    AI_ENABLE_LOCKPICK  = (1 << 1),
    AI_ENABLE_ANTITOXIN = (1 << 2),
};

extern const struct AiCombatScoreCoefficients gAiCombatScoreCoefficientTable[];
extern const u32 gAiItemConfigTable[];

extern u8 CONST_DATA gUnknown_085A814C[];
extern const u8* CONST_DATA gAiClassRankLists[];
extern const struct AiEscapePt* CONST_DATA gRedAiEscapePoints[];
extern const struct AiEscapePt* CONST_DATA gGreenAiEscapePoints[];
extern struct AiHealThreshold CONST_DATA gAI3HealingThresholdTable[];
extern const struct Vec2** CONST_DATA gUnknown_085A8400;
extern u16 CONST_DATA gAiStealPriorityItemList[];
extern struct AiScr** CONST_DATA gpAi2Table[];
extern struct AiScr** CONST_DATA gpAi1Table[];

#endif // GUARD_CP_DATA_H
