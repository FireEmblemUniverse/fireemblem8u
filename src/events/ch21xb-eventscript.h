#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch21x_BeginingScene[] = {
    CALL(EventScr_089F94AC)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21xb_EndingScene[] = {
    CALL(EventScr_Ch21xa_EndingSceneExt)
    MNC4
    ENDA
};
