#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

s8 IsBgmPlaying(void);

//! FE8U = 0x080C3EC4
void nullsub_71(void)
{
    return;
}

//! FE8U = 0x080C3EC8
void sub_80C3EC8(struct GMapBaseMenuProc * proc)
{
    proc->unk_2a = 0;
    proc->unk_2b = 0;
    proc->unk_2c = -1;
    return;
}

//! FE8U = 0x080C3EDC
void sub_80C3EDC(struct GMapBaseMenuProc * proc)
{
    proc->unk_30 = IsBgmPlaying();

    if (proc->unk_30 != 0)
    {
        proc->unk_34 = GetCurrentBgmSong();
    }

    StartPrepItemScreen(proc);

    return;
}

//! FE8U = 0x080C3F04
void sub_80C3F04(struct GMapBaseMenuProc * proc)
{
    if (proc->unk_30 != 0)
    {
        StartBgmFadeIn(proc->unk_34, 1, 0);
    }

    return;
}

//! FE8U = 0x080C3F24
void sub_80C3F24(struct GMapBaseMenuProc * proc)
{
    switch (proc->unk_29)
    {
        case 0:
            if (proc->unk_2c != 0)
            {
                Proc_Goto(proc, 1);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case 1:
            if (proc->unk_2c != 0)
            {
                Proc_Goto(proc, 2);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case 2:
            if (proc->unk_2c != 0)
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
void sub_80C3F88(struct GMapBaseMenuProc * proc)
{
    StartArmoryScreen(GetUnitFromCharId(proc->unk_2c), gGMData.units[0].location[gWMNodeData].armory, proc);
    return;
}

//! FE8U = 0x080C3FB4
void sub_80C3FB4(struct GMapBaseMenuProc * proc)
{
    StartVendorScreen(GetUnitFromCharId(proc->unk_2c), gGMData.units[0].location[gWMNodeData].vendor, proc);
    return;
}

//! FE8U = 0x080C3FE0
void sub_80C3FE0(struct GMapBaseMenuProc * proc)
{
    StartSecretShopScreen(GetUnitFromCharId(proc->unk_2c), gGMData.units[0].location[gWMNodeData].secretShop, proc);
    return;
}

extern struct ProcCmd ProcScr_GmapBaseMenu[];

//! FE8U = 0x080C400C
ProcPtr sub_80C400C(int kind, ProcPtr parent)
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

    proc->unk_29 = kind;

    // return; BUG
}

//! FE8U = 0x080C4038
void sub_80C4038(void)
{
    Proc_EndEach(ProcScr_GmapBaseMenu);
    return;
}

//! FE8U = 0x080C4048
struct GMapBaseMenuProc * sub_80C4048(void)
{
    return Proc_Find(ProcScr_GmapBaseMenu);
}

//! FE8U = 0x080C4058
bool sub_80C4058(void)
{
    return Proc_Find(ProcScr_GmapBaseMenu) ? true : false;
}

//! FE8U = 0x080C4070
int sub_80C4070(void)
{
    struct GMapBaseMenuProc * proc = sub_80C4048();

    if (proc != NULL)
    {
        return proc->unk_29;
    }

    return 0;
}

//! FE8U = 0x080C4088
int sub_80C4088(void)
{
    struct GMapBaseMenuProc * proc = sub_80C4048();

    if (proc != NULL)
    {
        return proc->unk_2c;
    }

    return 0;
}

//! FE8U = 0x080C409C
void sub_80C409C(int pid)
{
    struct GMapBaseMenuProc * proc = sub_80C4048();

    if (proc != NULL)
    {
        proc->unk_2c = pid;
    }

    return;
}
