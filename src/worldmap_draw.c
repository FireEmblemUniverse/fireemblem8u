#include "global.h"

#include "worldmap.h"

//! FE8U = 0x080BF4D0
void SetGmClassUnit(int id, int jid, int allegiance, int nodeId)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    MapMU_SetUnitClass(proc->unk_54, id, jid, allegiance, nodeId);
    return;
}

//! FE8U = 0x080BF504
void SetGmCharUnit(int id, int pid, int allegiance, int nodeId)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    MapMU_SetUnitChar(proc->unk_54, id, pid, allegiance, nodeId);
    return;
}

//! FE8U = 0x080BF538
void RemoveGmUnit(int index)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_RemoveUnit(proc->unk_54, index);
    return;
}

//! FE8U = 0x080BF554
void ShowGmUnit(int index)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_ShowUnit(proc->unk_54, index);
    return;
}

//! FE8U = 0x080BF570
void HideGmUnit(int index)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_HideUnit(proc->unk_54, index);
    return;
}

//! FE8U = 0x080BF58C
void AddAndDrawGmPath(int pathId, int unk)
{
    if (!AddGmPath(&gGMData, &gGMData.openPaths, pathId))
    {
        struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
        MapRoute_BeginRouteTransition(proc->unk_44->unk_4c, unk);
    }

    return;
}
