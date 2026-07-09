#include "gbafe.h"

CONST_DATA EventListScr EventScr_MelkaenCoast_BeginningScene[] = {
    LOAD1(0x1, UnitDef_MelkaenCoastEnemy_0)
    ENUN
    CALL(EventScr_CommonPrep)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_MelkaenCoast_EndingScene[] = {
    MNCH(0x0)
    ENDA
};
