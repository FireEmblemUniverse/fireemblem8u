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

#endif // GUARD_CP_DATA_H
