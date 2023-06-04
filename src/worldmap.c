#include "global.h"
#include "types.h"
#include "functions.h"

//! FE8U = 0x080BC8BC
bool SetupNewWMRoute(struct GMapData *pGMapData, u8 *routeData, int idx) {
    u8 *pNumRoutes = routeData + 0x20;
    if (*pNumRoutes < 0x20) {
        routeData[(s8) *pNumRoutes] = (u8) idx;
        *pNumRoutes += 1;
        sub_80BCA0C(pGMapData);
        return false;
    }
    else {
        return true;
    }
}
