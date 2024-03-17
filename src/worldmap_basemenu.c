#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

//! FE8U = 0x080C3EC4
void GMapBaseMenu_OnEnd_Null(void)
{
    return;
}

//! FE8U = 0x080C3EC8
void GMapBaseMenu_Init(struct GMapBaseMenuProc * proc)
{
    proc->unk_2a = 0;
    proc->unk_2b = 0;
    proc->pid = -1;
    return;
}

//! FE8U = 0x080C3EDC
void GMapBaseMenu_StartItemScreen(struct GMapBaseMenuProc * proc)
{
    proc->wasBgmPlaying = IsBgmPlaying();

    if (proc->wasBgmPlaying != 0)
    {
        proc->bgmSongId = GetCurrentBgmSong();
    }

    StartPrepItemScreen(proc);

    return;
}

//! FE8U = 0x080C3F04
void GMapBaseMenu_RestoreBgm(struct GMapBaseMenuProc * proc)
{
    if (proc->wasBgmPlaying != 0)
    {
        StartBgmFadeIn(proc->bgmSongId, 1, 0);
    }

    return;
}

//! FE8U = 0x080C3F24
void GMapBaseMenu_ShopFromItemScreen(struct GMapBaseMenuProc * proc)
{
    switch (proc->kind)
    {
        case SHOP_TYPE_ARMORY:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 1);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case SHOP_TYPE_VENDOR:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 2);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case SHOP_TYPE_SECRET_SHOP:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 3);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        default:
            Proc_Goto(proc, 5);
            return;
    }

    return;
}

//! FE8U = 0x080C3F88
void GMapBaseMenu_StartArmory(struct GMapBaseMenuProc * proc)
{
    StartArmoryScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].armory, proc);
    return;
}

//! FE8U = 0x080C3FB4
void GMapBaseMenu_StartVendor(struct GMapBaseMenuProc * proc)
{
    StartVendorScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].vendor, proc);
    return;
}

//! FE8U = 0x080C3FE0
void GMapBaseMenu_StartSecretShop(struct GMapBaseMenuProc * proc)
{
    StartSecretShopScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].secretShop, proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GmapBaseMenu[] =
{
    PROC_NAME("Gmap Base Menu"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GMapBaseMenu_OnEnd_Null),

    PROC_CALL(GMapBaseMenu_Init),

PROC_LABEL(0),
    PROC_CALL(GMapBaseMenu_StartItemScreen),
    PROC_YIELD,

    PROC_CALL(GMapBaseMenu_ShopFromItemScreen),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(GMapBaseMenu_StartArmory),
    PROC_YIELD,

    PROC_GOTO(4),

PROC_LABEL(2),
    PROC_CALL(GMapBaseMenu_StartVendor),
    PROC_YIELD,

    PROC_GOTO(4),

PROC_LABEL(3),
    PROC_CALL(GMapBaseMenu_StartSecretShop),
    PROC_YIELD,

    PROC_GOTO(4),

PROC_LABEL(4),
    PROC_CALL(GMapBaseMenu_RestoreBgm),

    PROC_GOTO(0),

PROC_LABEL(5),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080C400C
ProcPtr StartGMapBaseMenu(int kind, ProcPtr parent)
{
    struct GMapBaseMenuProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapBaseMenu, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapBaseMenu, PROC_TREE_3);
    }

    proc->kind = kind;

    // return; BUG
}

//! FE8U = 0x080C4038
void EndGMapBaseMenu(void)
{
    Proc_EndEach(ProcScr_GmapBaseMenu);
    return;
}

//! FE8U = 0x080C4048
struct GMapBaseMenuProc * FindGMapBaseMenu(void)
{
    return Proc_Find(ProcScr_GmapBaseMenu);
}

//! FE8U = 0x080C4058
bool IsGMapBaseMenuActive(void)
{
    return Proc_Find(ProcScr_GmapBaseMenu) ? true : false;
}

//! FE8U = 0x080C4070
int GetGMapBaseMenuKind(void)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        return proc->kind;
    }

    return 0;
}

//! FE8U = 0x080C4088
int GetGMapBaseMenuPid(void)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        return proc->pid;
    }

    return 0;
}

//! FE8U = 0x080C409C
void SetGMapBaseMenuPid(int pid)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        proc->pid = pid;
    }

    return;
}
