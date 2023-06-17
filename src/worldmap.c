#include "global.h"
#include "types.h"
#include "functions.h"

//! FE8U = 0x080BC8BC
bool SetupNewWMRoute(struct GMapData *pGMapData, struct OpenPaths *routeData, int idx) {
    if (routeData->openPathsLength < sizeof(routeData->openPaths)) {
        routeData->openPaths[routeData->openPathsLength] = idx;
        routeData->openPathsLength += 1;
        sub_80BCA0C(pGMapData);
        return false;
    }
    else {
        return true;
    }
}
