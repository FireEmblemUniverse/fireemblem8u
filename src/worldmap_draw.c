#include "global.h"

#include "worldmap.h"

//! FE8U = 0x080BF4D0
void SetGmClassUnit(int id, int jid, int allegiance, int nodeId)
{
    MapMU_SetUnitClass(GM_MU, id, jid, allegiance, nodeId);
}

//! FE8U = 0x080BF504
void SetGmCharUnit(int id, int pid, int allegiance, int nodeId)
{
    MapMU_SetUnitChar(GM_MU, id, pid, allegiance, nodeId);
}

//! FE8U = 0x080BF538
void RemoveGmUnit(int index)
{
    GmMu_RemoveUnit(GM_MU, index);
}

//! FE8U = 0x080BF554
void ShowGmUnit(int index)
{
    GmMu_ShowUnit(GM_MU, index);
}

//! FE8U = 0x080BF570
void HideGmUnit(int index)
{
    GmMu_HideUnit(GM_MU, index);
}

//! FE8U = 0x080BF58C
void AddAndDrawGmPath(int pathId, int unk)
{
    if (!AddGmPath(&gGMData, &gGMData.openPaths, pathId))
    {
        MapRoute_BeginRouteTransition(GM_SCREEN->gmroute, unk);
    }
}
