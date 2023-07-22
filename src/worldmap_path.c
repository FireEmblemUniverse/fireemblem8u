#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"

#include "worldmap.h"

// ?
void sub_80BBC54(ProcPtr);
void sub_80BBCC8(int, int, int);
void sub_80BBDA4(int, int, int, int, int);

//! FE8U = 0x080BBEB4
void nullsub_38(void)
{
    return;
}

//! FE8U = 0x080BBEB8
void sub_80BBEB8(struct GmRouteProc * proc)
{
    proc->unk_31 = 4;
    proc->unk_32 = 0;
    proc->unk_33 = -1;
    proc->unk_34 = 2;
    proc->unk_35 = 1;
    proc->unk_3a = BG_GetPriority(BG_1);

    *&proc->unk_36 = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_34;
    *&proc->unk_37 = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_36;

    proc->unk_39 = -2;
    proc->unk_38 = -2;

    sub_80BBC54(proc);
    proc->unk_31 |= 3;

    return;
}

//! FE8U = 0x080BBF1C
void sub_80BBF1C(u16 * a, u16 b, int c)
{
    int i;

    for (i = 0; i < c; i++)
    {
        *a = ((b + (*a & ~0xc00)) & ~0xc00) | (*a & 0xc00);
        a++;
    }

    return;
}

//! FE8U = 0x080BBF60
void sub_80BBF60(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    if (!(proc->unk_31 & 4))
    {
        return;
    }

    proc->unk_38 = proc->unk_36;
    proc->unk_39 = proc->unk_37;

    *&x = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_34;
    *&y = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_36;

    proc->unk_36 = x / 8;
    proc->unk_37 = y / 8;

    if (proc->unk_36 != proc->unk_38 || proc->unk_37 != proc->unk_39)
    {
        if ((ABS(proc->unk_36 - proc->unk_38) >= 2) || (ABS(proc->unk_37 - proc->unk_39) >= 2))
        {
            sub_80BBCC8(proc->unk_36, proc->unk_37, proc->unk_34);
            BG_EnableSync(proc->unk_34);
        }
        else
        {
            sub_80BBDA4(proc->unk_36, proc->unk_37, proc->unk_38, proc->unk_39, proc->unk_34);
            BG_EnableSync(proc->unk_34);
        }
    }

    if ((proc->unk_31 & 2) != 0)
    {
        sub_80BBC54(proc);
        proc->unk_31 &= ~2;
    }

    if ((proc->unk_31 & 1) != 0)
    {
        sub_80BBCC8(proc->unk_36, proc->unk_37, proc->unk_34);
        BG_EnableSync(proc->unk_34);
        proc->unk_31 &= ~1;
    }

    BG_SetPosition(proc->unk_34, x & 0x1FF, y & 0xff);

    return;
}

//! FE8U = 0x080BC0BC
int MapRoute_StartTransition(struct GmRouteProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->unk_35), 0);
    BG_EnableSync(proc->unk_35);
    PlaySoundEffect(0x310);
    return 0;
}

//! FE8U = 0x080BC0F4
int sub_80BC0F4(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= (1 << proc->unk_35);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TGT2_BG3;

    sub_80BBC54(proc);
    sub_80BBCC8(proc->unk_36, proc->unk_37, proc->unk_35);

    *&x = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_34;
    *&y = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_36;

    BG_SetPosition(proc->unk_35, x & 0x1FF, y & 0xff);

    return 0;
}

//! FE8U = 0x080BC184
int MapRoute_EnableBGSyncs(struct GmRouteProc * proc)
{
    BG_SetPriority(proc->unk_35, BG_GetPriority(BG_3));
    BG_EnableSyncByMask((1 << proc->unk_35) | (1 << proc->unk_34));
    return 0;
}

//! FE8U = 0x080BC1B8
void MapRoute_TransitionLoop(struct GmRouteProc * proc)
{
    proc->unk_3e++;

    if (proc->unk_3e < proc->unk_3c)
    {
        int coeff = (proc->unk_3e * 0x10) / proc->unk_3c;
        SetSpecialColorEffectsParameters(1, coeff, 0x10 - coeff, 0);
    }
    else
    {
        CpuFastCopy(BG_GetMapBuffer(proc->unk_35), BG_GetMapBuffer(proc->unk_34), 0x800);
        BG_EnableSync(proc->unk_34);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BC228
int MapRoute_TransitionEnd(struct GmRouteProc * proc)
{
    BG_SetPosition(proc->unk_35, 0, 0);
    BG_Fill(BG_GetMapBuffer(proc->unk_35), 0);
    BG_SetPriority(proc->unk_35, proc->unk_3a);
    BG_EnableSyncByMask((1 << proc->unk_34) | (1 << proc->unk_35));

    SetDefaultColorEffects();

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);

    proc->unk_32 &= ~1;

    return 0;
}

//! FE8U = 0x080BC29C
void MapRoute_BeginRouteTransition(struct GmRouteProc * proc, int unk)
{
    if (unk < 2)
    {
        proc->unk_31 |= 3;
        proc->unk_32 &= ~1;
    }
    else
    {
        proc->unk_3c = unk;
        proc->unk_3e = 0;
        proc->unk_32 |= 1;

        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080BC2DC
void MapRoute_80BC2DC(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    if (!(proc->unk_32 & 1))
    {
        return;
    }

    *&x = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_34;
    *&y = ((struct UnkGmRouteParentProc *)(proc->proc_parent))->unk_36;

    sub_80BBC54(proc);

    sub_80BBCC8(x / 8, y / 8, proc->unk_34);
    BG_SetPosition(proc->unk_35, 0, 0);
    BG_Fill(BG_GetMapBuffer(proc->unk_35), 0);
    BG_SetPriority(proc->unk_35, proc->unk_3a);
    BG_EnableSyncByMask((1 << proc->unk_34) | (1 << proc->unk_35));

    SetDefaultColorEffects();

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);

    proc->unk_32 &= ~1;

    Proc_Goto(proc, 0);

    return;
}

extern struct ProcCmd gUnknown_08A3DFC4[];

//! FE8U = 0x080BC3A4
ProcPtr NewMapRoute(ProcPtr parent, void * b, int c, int d)
{
    struct GmRouteProc * proc = Proc_Start(gUnknown_08A3DFC4, parent);
    proc->unk_2c = c;
    proc->unk_30 = d;
    proc->unk_40 = b;
    return proc;
}

//! FE8U = 0x080BC3D4
int sub_80BC3D4(int idx)
{
    int count;

    struct GMapMovementPathData * pMovementPath = idx[gUnknown_08206674].movementPath;

    if (pMovementPath == NULL)
    {
        return 0;
    }

    count = 0;

    while (pMovementPath->elapsedTime >= 0)
    {
        pMovementPath++;
        count++;
    }

    return count;
}

//! FE8U = 0x080BC404
void sub_80BC404(struct GmRouteProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->unk_34), 0);
    BG_EnableSyncByMask((1 << proc->unk_34));
    return;
}

// TODO: Possibly debug-related procs for the world map?
// Seems to be unrelated to anything around it

struct UnknownWorldMapStructB
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct Text unk_34;
};

struct UnknownWorldMapStructA
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct UnknownWorldMapStructB * unk_34[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x60);
    /* 60 */ u8 unk_60;
};

//! FE8U = 0x080BC428
void sub_80BC428(struct UnknownWorldMapStructA * a)
{
    int i = 0;

    if (i < a->unk_60)
    {
        struct UnknownWorldMapStructB ** unk_34 = a->unk_34;

        for (; i < a->unk_60; i++)
        {
            Text_SetCursor(&(*unk_34++)->unk_34, 0);
        }
    }

    return;
}

extern struct Font gUnknown_0201AFC0;
extern struct MenuDef gUnknown_08A3E124;
extern struct MenuRect gUnknown_08A3E148;

//! FE8U = 0x080BC454
struct MenuProc * sub_80BC454(ProcPtr parent)
{
    gGMData.unk01 = 0;
    InitTextFont(&gUnknown_0201AFC0, (void *)0x06001000, 0x80, 0);
    return StartMenuAt(&gUnknown_08A3E124, gUnknown_08A3E148, parent);
}

//! FE8U = 0x080BC490
int sub_80BC490(struct MenuProc * menu)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return 0;
}

//! FE8U = 0x080BC4A0
int sub_80BC4A0(struct MenuProc * menu)
{
    ClearBg0Bg1();
    return 0;
}

//! FE8U = 0x080BC4AC
int sub_80BC4AC(struct MenuProc * menu)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 3);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4C4
u8 sub_80BC4C4(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 9);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4DC
u8 sub_80BC4DC(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 12);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4F4
u8 sub_80BC4F4(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (!(menuProc->state & MENU_STATE_NOTSHOWN))
    {
        if (!sub_80CF480())
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GREEN);
        }

        if (menuItemProc->availability == MENU_DISABLED)
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GRAY);
        }

        Text_DrawString(&menuItemProc->text, GetStringFromIndex(menuItemProc->def->nameMsgId));

        PutText(
            &menuItemProc->text,
            BG_GetMapBuffer(menuProc->frontBg) + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));
    }

    // return 0; // BUG?
}

//! FE8U = 0x080BC56C
u8 sub_80BC56C(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 10);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC584
u8 sub_80BC584(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 11);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC59C
u8 sub_80BC59C(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 13);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

extern struct MenuDef gUnknown_08A3E200;
extern struct MenuRect gUnknown_08A3E224;
extern struct MenuRect gUnknown_08A3E228;

struct MenuProc * sub_80BC5B4(struct WorldMapMainProc * parent)
{
    struct MenuProc * menuProc;

    gGMData.unk01 = 0;

    InitTextFont(&gUnknown_0201AFC0, (void *)0x06001000, 0x80, 0);

    if ((gGMData.unk08 >> 8) - gGMData.xCamera < 152)
    {
        menuProc = StartMenuAt(&gUnknown_08A3E200, gUnknown_08A3E224, parent);
    }
    else
    {
        menuProc = StartMenuAt(&gUnknown_08A3E200, gUnknown_08A3E228, parent);
    }

    if (gGMData.unk_cd < menuProc->itemCount)
    {
        menuProc->itemCurrent = gGMData.unk_cd;
    }
    else
    {
        menuProc->itemCurrent = menuProc->itemCount - 1;
    }

    return menuProc;
}

//! FE8U = 0x080BC634
u8 sub_80BC634(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return 0;
}

//! FE8U = 0x080BC644
u8 sub_80BC644(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    ClearBg0Bg1();
    return 0;
}

//! FE8U = 0x080BC650
u8 sub_80BC650(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = 0;
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 3);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC674
int sub_80BC674(void)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gUnknown_082060B0].unk_0c[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC6AC
int sub_80BC6AC(void)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gUnknown_082060B0].unk_10[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC6E4
int sub_80BC6E4(void)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gUnknown_082060B0].unk_14[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC72C
int sub_80BC72C(void)
{
    if (!(gGMData.nodes[gGMData.units[0].location].state & 2))
    {
        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

//! FE8U = 0x080BC754
int sub_80BC754(void)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

//! FE8U = 0x080BC77C
int sub_80BC77C(struct MenuProc * menu)
{
    gGMData.unk_cd = menu->itemCurrent;
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 19);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7A4
int sub_80BC7A4(struct MenuProc * menu)
{
    gGMData.unk_cd = menu->itemCurrent;
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 20);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7CC
int sub_80BC7CC(struct MenuProc * menu)
{
    gGMData.unk_cd = menu->itemCurrent;
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 21);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7F4
int sub_80BC7F4(struct MenuProc * menu)
{
    gGMData.unk_cd = menu->itemCurrent;
    Proc_Goto(Proc_Find(gUnknown_08A3D748), 22);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

void sub_80BC898(struct OpenPaths *);

//! FE8U = 0x080BC81C
void sub_80BC81C(void)
{
    int i;

    CpuFill32(0, &gGMData, 0xd4);
    sub_80BC898(&gGMData.routeData);

    for (i = 0; i < 7; i++)
    {
        gGMData.units[i].id = 0;
        gGMData.units[i].state &= ~2;
    }

    gGMData.units[0].id = 1;
    gGMData.units[0].state &= ~2;
    gGMData.units[0].location = 0;

    gGMData.nodes[0].state |= 2;

    gGMData.state.bits.state_2 = 1;
    gGMData.state.bits.state_4_5 = 3;

    gGMData.unk_cd = 0;

    StoreRNState(&gGMData.unk_ce);

    return;
}

//! FE8U = 0x080BC898
void sub_80BC898(struct OpenPaths * pPaths)
{
    u32 i;

    for (i = 0; i < 0x20; i++)
    {
        pPaths->openPaths[i] = 0xff;
    }

    pPaths->openPathsLength = 0;

    return;
}

//! FE8U = 0x080BC8BC
bool SetupNewWMRoute(struct GMapData * pGMapData, struct OpenPaths * routeData, int idx)
{
    if (routeData->openPathsLength < sizeof(routeData->openPaths))
    {
        routeData->openPaths[routeData->openPathsLength] = idx;
        routeData->openPathsLength += 1;
        sub_80BCA0C(pGMapData);
        return false;
    }
    else
    {
        return true;
    }
}

//! FE8U = 0x080BC8EC
bool WM_RemovePath(struct GMapData * pGMapData, struct OpenPaths * routeData, int idx)
{
    int i;

    if (routeData->openPathsLength <= 0)
    {
        return true;
    }

    if (idx < 0)
    {
        routeData->openPathsLength--;
        routeData->openPaths[routeData->openPathsLength] = 0xff;
        sub_80BCA0C(pGMapData);
        return false;
    }

    for (i = 0; i < routeData->openPathsLength; i++)
    {
        int j;

        if (routeData->openPaths[i] != idx)
        {
            continue;
        }

        for (j = i; j < routeData->openPathsLength - 1; j++)
        {
            routeData->openPaths[j] = routeData->openPaths[j + 1];
        }

        routeData->openPathsLength--;
        sub_80BCA0C(pGMapData);
        return false;
    }

    return true;
}
