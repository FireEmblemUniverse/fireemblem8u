#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

CONST_DATA struct SupportBonuses gAffinityBonuses[] = {
    {
        .affinity     = UNIT_AFFIN_FIRE,
        .bonusAttack  = 1,
        .bonusDefense = 0,
        .bonusHit     = 5,
        .bonusAvoid   = 5,
        .bonusCrit    = 5,
        .bonusDodge   = 0,
    },
    {
        .affinity     = UNIT_AFFIN_THUNDER,
        .bonusAttack  = 0,
        .bonusDefense = 1,
        .bonusHit     = 0,
        .bonusAvoid   = 5,
        .bonusCrit    = 5,
        .bonusDodge   = 5,
    },
    {
        .affinity     = UNIT_AFFIN_WIND,
        .bonusAttack  = 1,
        .bonusDefense = 0,
        .bonusHit     = 5,
        .bonusAvoid   = 0,
        .bonusCrit    = 5,
        .bonusDodge   = 5,
    },
    {
        .affinity     = UNIT_AFFIN_ICE,
        .bonusAttack  = 0,
        .bonusDefense = 1,
        .bonusHit     = 5,
        .bonusAvoid   = 5,
        .bonusCrit    = 0,
        .bonusDodge   = 5,
    },
    {
        .affinity     = UNIT_AFFIN_DARK,
        .bonusAttack  = 0,
        .bonusDefense = 0,
        .bonusHit     = 5,
        .bonusAvoid   = 5,
        .bonusCrit    = 5,
        .bonusDodge   = 5,
    },
    {
        .affinity     = UNIT_AFFIN_LIGHT,
        .bonusAttack  = 1,
        .bonusDefense = 1,
        .bonusHit     = 5,
        .bonusAvoid   = 0,
        .bonusCrit    = 5,
        .bonusDodge   = 0,
    },
    {
        .affinity     = UNIT_AFFIN_ANIMA,
        .bonusAttack  = 1,
        .bonusDefense = 1,
        .bonusHit     = 0,
        .bonusAvoid   = 5,
        .bonusCrit    = 0,
        .bonusDodge   = 5,
    },
    {0}
};
