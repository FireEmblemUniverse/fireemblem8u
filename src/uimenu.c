#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"

#include "uimenu.h"

// data

static CONST_DATA
struct ProcCmd sProc_MenuMain[] =
{
    PROC_REPEAT(Menu_OnIdle),

    PROC_CALL(EndGreenTextColorManager),
    PROC_END
};

static CONST_DATA
struct ProcCmd sProc_Menu[] =
{
    PROC_NAME("E_Menu"),
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL(NewGreenTextColorManager),
    PROC_CALL(RedrawMenu),

    PROC_CALL(Menu_OnInit),

    PROC_JUMP(sProc_MenuMain),
    PROC_END
};

static CONST_DATA
struct ProcCmd sProc_MenuItem[] =
{
    PROC_BLOCK
};

static void Menu_AutoHelpBox_OnInit(struct MenuProc* proc);
static void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc);

static CONST_DATA
struct ProcCmd sProc_MenuAutoHelpBox[] =
{
    PROC_CALL(Menu_AutoHelpBox_OnInit),
    PROC_REPEAT(Menu_AutoHelpBox_OnLoop),
    PROC_END
};

static void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc);

static CONST_DATA
struct ProcCmd sProc_MenuFrozenHelpBox[] =
{
    PROC_REPEAT(Menu_FrozenHelpBox_OnLoop),
    PROC_END
};

static void Menu_Frozen_OnLoop(struct MenuProc* proc);

static CONST_DATA
struct ProcCmd sProc_MenuFrozen[] =
{
    PROC_REPEAT(Menu_Frozen_OnLoop),
    PROC_END
};

// functions

struct MenuProc* StartOrphanMenuAdjusted(
    const struct MenuDef* def,
    int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return StartMenuAt(def, rect, NULL);
}

struct MenuProc* StartMenu(const struct MenuDef* def, struct Proc* parent)
{
    return StartMenuAt(def, def->rect, parent);
}

struct MenuProc* StartOrphanMenuAt(const struct MenuDef* def, struct MenuRect rect)
{
    return StartMenuAt(def, rect, NULL);
}

struct MenuProc* StartOrphanMenu(const struct MenuDef* def)
{
    return StartMenuAt(def, def->rect, NULL);
}

struct MenuProc* StartOrphanMenuAdjustedExt(
    const struct MenuDef* def,
    int xSubject, int xTileLeft, int xTileRight,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return StartMenuCore(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartMenuExt(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    struct Proc* parent)
{
    return StartMenuCore(def, def->rect, backBg, tileref, frontBg, unk, parent);
}

struct MenuProc* StartOrphanMenuAtExt(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return StartMenuCore(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartOrphanMenuExt(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return StartMenuCore(def, def->rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartMenuAt(
    const struct MenuDef* def,
    struct MenuRect rect,
    struct Proc* parent)
{
    return StartMenuCore(def, rect, 1, TILEREF(0, 0), 0, 0, parent);
}

struct MenuProc* StartMenuCore(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    struct Proc* parent)
{
    struct MenuProc* proc;
    int i, itemCount;

    int xTileInner = rect.x + 1;
    int yTileInner = rect.y + 1;

    BG_SetPosition(frontBg, 0, 0);
    BG_SetPosition(backBg, 0, 0);

    PlaySoundEffect(0x68); /* TODO: song ids! */

    if (parent)
    {
        proc = Proc_StartBlocking(sProc_Menu, parent);
        proc->state = 0;
    }
    else
    {
        AddSkipThread2();

        proc = Proc_Start(sProc_Menu, PROC_TREE_3);
        proc->state = MENU_STATE_GAMELOCKING;
    }

    if (rect.h < 0)
        proc->state |= MENU_STATE_NOTSHOWN;

    for (i = 0, itemCount = 0; def->menuItems[i].isAvailable; ++i)
    {
        int availability = OverriddenMenuAvailability(&def->menuItems[i], i);

        if (!availability)
            availability = def->menuItems[i].isAvailable(&def->menuItems[i], i);

        if (availability != MENU_NOTSHOWN)
        {
            struct MenuItemProc* item = Proc_Start(sProc_MenuItem, proc);
            proc->menuItems[itemCount++] = item;

            item->def = &def->menuItems[i];
            item->itemNumber = i;
            item->availability = availability;

            item->xTile = xTileInner;
            item->yTile = yTileInner;

            if (!(proc->state & MENU_STATE_NOTSHOWN))
                Text_Init(&item->text, rect.w - 1);

            yTileInner += 2;
        }
    }

    proc->def = def;
    proc->rect = rect;
    proc->itemCount = itemCount;
    proc->itemCurrent = 0;
    proc->itemPrevious = -1;

    if (rect.y + rect.h < yTileInner)
        proc->rect.h = yTileInner + 1 - rect.y;

    proc->backBg  = backBg & 3;
    proc->tileref = tileref;
    proc->frontBg = frontBg & 3;
    proc->unk68   = unk;

    gKeyStatusPtr->newKeys = 0;

    return proc;
}

struct Proc* EndMenu(struct MenuProc* proc)
{
    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];

    proc->state |= MENU_STATE_ENDING;

    if (item->def->onSwitchOut)
        item->def->onSwitchOut(proc, item);

    if (proc->def->onEnd)
        proc->def->onEnd(proc);

    if (proc->state & MENU_STATE_GAMELOCKING)
        SubSkipThread2();

    Proc_End(proc);

    BG_SetPosition(proc->frontBg, 0, 0);
    BG_SetPosition(proc->backBg, 0, 0);

    return proc->proc_parent;
}

void EndAllMenus(void)
{
    Proc_ForEach(sProc_Menu, (ProcFunc) EndMenu);
}

inline
void SyncMenuBgs(struct MenuProc* proc)
{
    BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
}

inline
void ClearMenuBgs(struct MenuProc* proc)
{
    BG_Fill(BG_GetMapBuffer(proc->frontBg), 0);
    BG_Fill(BG_GetMapBuffer(proc->backBg), 0);

    SyncMenuBgs(proc);
}

inline
s8 HasMenuChangedItem(struct MenuProc* proc)
{
    return proc->itemCurrent != proc->itemPrevious;
}

void Menu_OnInit(struct MenuProc* proc)
{
    if (proc->def->onInit)
        proc->def->onInit(proc);

    if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
        proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
}

void RedrawMenu(struct MenuProc* proc)
{
    int i;

    if (proc->state & MENU_STATE_NOTSHOWN)
        return;

    DrawUiFrame(
        BG_GetMapBuffer(proc->backBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
        proc->tileref, proc->def->style);

    ClearUiFrame(
        BG_GetMapBuffer(proc->frontBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h);

    for (i = 0; i < proc->itemCount; ++i)
    {
        struct MenuItemProc* item = proc->menuItems[i];

        if (item->def->onDraw)
        {
            item->def->onDraw(proc, item);
            continue;
        }

        if (item->def->color)
            Text_SetColorId(&item->text, item->def->color);

        if (item->availability == MENU_DISABLED)
            Text_SetColorId(&item->text, TEXT_COLOR_GRAY);

        if (!item->def->nameMsgId)
            Text_AppendString(&item->text, item->def->name);
        else
            Text_AppendString(&item->text, GetStringFromIndex(item->def->nameMsgId));

        Text_Draw(
            &item->text,
            TILEMAP_LOCATED(BG_GetMapBuffer(proc->frontBg), item->xTile, item->yTile));
    }

    DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
    SyncMenuBgs(proc);
}

void DrawMenuItemHover(struct MenuProc* proc, int item, s8 boolHover)
{
    int x, y, w;

    if (proc->state & MENU_STATE_FLAT)
        return;

    x = proc->rect.x + 1;
    y = proc->menuItems[item]->yTile;
    w = proc->rect.w - 2;

    switch (boolHover)
    {

    case TRUE:
        DrawUiItemHoverExt(proc->backBg, proc->tileref, x, y, w);
        break;

    case FALSE:
        ClearUiItemHoverExt(proc->backBg, proc->tileref, x, y, w);
        break;

    }
}

void Menu_OnIdle(struct MenuProc* proc)
{
    int x, y, actions;

    if (proc->state & MENU_STATE_FROZEN)
    {
        GetMenuCursorPosition(proc, &x, &y);
        DisplayFrozenUiHand(x, y);

        return;
    }

    if (proc->state & MENU_STATE_DOOMED)
    {
        EndMenu(proc);
        return;
    }

    ProcessMenuDpadInput(proc);
    actions = ProcessMenuSelectInput(proc);

    if (actions & MENU_ACT_END)
        EndMenu(proc);

    if (actions & MENU_ACT_SND6A)
        PlaySoundEffect(0x6A); // TODO: song ids!

    if (actions & MENU_ACT_SND6B)
        PlaySoundEffect(0x6B); // TODO: song ids!

    if (actions & MENU_ACT_CLEAR)
        ClearMenuBgs(proc);

    if (actions & MENU_ACT_ENDFACE)
        DeleteFaceByIndex(0);

    if (actions & MENU_ACT_DOOM)
        proc->state |= MENU_STATE_DOOMED;

    if (actions & MENU_ACT_SKIPCURSOR)
        return;

    if (proc->state & MENU_STATE_NOCURSOR)
        return;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);
}

void ProcessMenuDpadInput(struct MenuProc* proc)
{
    proc->itemPrevious = proc->itemCurrent;

    // Handle Up keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->itemCurrent == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                return;

            proc->itemCurrent = proc->itemCount;
        }

        proc->itemCurrent--;
    }

    // Handle down keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->itemCurrent == (proc->itemCount - 1))
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                return;

            proc->itemCurrent = -1;
        }

        proc->itemCurrent++;
    }

    // Update hover display

    if (proc->itemPrevious != proc->itemCurrent)
    {
        DrawMenuItemHover(proc, proc->itemPrevious, FALSE);
        DrawMenuItemHover(proc, proc->itemCurrent, TRUE);

        PlaySoundEffect(0x66); // TODO: song ids!
    }

    // Call def's switch in/out funcs

    if (HasMenuChangedItem(proc))
    {
        if (proc->menuItems[proc->itemPrevious]->def->onSwitchOut)
            proc->menuItems[proc->itemPrevious]->def->onSwitchOut(proc, proc->menuItems[proc->itemPrevious]);

        if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
            proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
    }
}

int ProcessMenuSelectInput(struct MenuProc* proc)
{
    int result = 0;

    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];
    const struct MenuItemDef* itemDef = item->def;

    if (itemDef->onIdle)
        result = itemDef->onIdle(proc, item);

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        // A Button press

        result = OverriddenMenuSelected(proc, item);

        if ((result == 0xFF) && itemDef->onSelected)
            result = itemDef->onSelected(proc, item);
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        // B Button press

        if (proc->def->onBPress)
            result = proc->def->onBPress(proc, item);
    }
    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        // R Button press

        if (proc->def->onRPress)
            proc->def->onRPress(proc);
    }

    return result;
}

void GetMenuCursorPosition(struct MenuProc* proc, int* xResult, int* yResult)
{
    *xResult = proc->menuItems[proc->itemCurrent]->xTile*8;
    *yResult = proc->menuItems[proc->itemCurrent]->yTile*8;

    if (proc->def->style != 0)
        *xResult -= 4;
}

u8 MenuAlwaysEnabled(const struct MenuItemDef* def, int number)
{
    return MENU_ENABLED;
}

u8 MenuAlwaysDisabled(const struct MenuItemDef* def, int number)
{
    return MENU_DISABLED;
}

u8 MenuAlwaysNotShown(const struct MenuItemDef* def, int number)
{
    return MENU_NOTSHOWN;
}

u8 MenuCancelSelect(struct MenuProc* menu, struct MenuItemProc* item)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_CLEAR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 MenuStdHelpBox(struct MenuProc* menu, struct MenuItemProc* item)
{
    StartHelpBox(item->xTile*8, item->yTile*8, item->def->helpMsgId);
}

void Menu_AutoHelpBox_OnInit(struct MenuProc* proc)
{
    LoadDialogueBoxGfx(NULL, -1); // TODO: NOPAL constant?
    proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
}

void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc)
{
    int x, y;

    ProcessMenuDpadInput(proc);

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, sProc_MenuMain);

        return;
    }

    if (HasMenuChangedItem(proc))
    {
        proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
    }
}

u8 MenuAutoHelpBoxSelect(struct MenuProc* menu)
{
    Proc_GotoScript(menu, sProc_MenuAutoHelpBox);
}

void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc)
{
    int x, y;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, sProc_MenuMain);
    }
}

u8 MenuFrozenHelpBox(struct MenuProc* proc, int msgid)
{
    Proc_GotoScript(proc, sProc_MenuFrozenHelpBox);

    LoadDialogueBoxGfx(NULL, -1); // TODO: default constants?
    StartHelpBox(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgid);
}

void Menu_Frozen_OnLoop(struct MenuProc* proc)
{
    int x, y;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_GotoScript(proc, sProc_MenuMain);
}

u8 MenuFrozen(struct MenuProc* proc)
{
    Proc_GotoScript(proc, sProc_MenuFrozen);
}

void FreezeMenu(void)
{
    struct MenuProc* proc = Proc_Find(sProc_Menu);

    if (proc)
        proc->state |= MENU_STATE_FROZEN;
}

void ResumeMenu(void)
{
    struct MenuProc* proc = Proc_Find(sProc_Menu);

    if (proc)
        proc->state &= ~MENU_STATE_FROZEN;
}

static CONST_DATA
u8 sItemCountYOffsetLookup[12] = { 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 3, 3 };

struct MenuProc* StartSemiCenteredOrphanMenu(
    const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuProc* result = StartOrphanMenuAdjusted(def, xSubject, xTileLeft, xTileRight);
    int i;

    if (result->itemCount <= 6)
        return result;

    result->rect.y -= sItemCountYOffsetLookup[result->itemCount];

    for (i = 0; i < result->itemCount; ++i)
        result->menuItems[i]->yTile -= sItemCountYOffsetLookup[result->itemCount];

    return result;
}

void ApplyMenuCursorVScroll(struct MenuProc* proc, int* xRef, int* yRef)
{
    int off;

    if (proc->itemCount <= 9)
        return;

    off = (proc->itemCount*16 - 9*16) * proc->itemCurrent / 9;

    BG_SetPosition(proc->frontBg, 0, off);
    BG_SetPosition(proc->backBg, 0, off);

    *yRef -= off;
}

enum
{
    MENU_OVERRIDE_NONE = 0,
    MENU_OVERRIDE_ISAVAILABLE,
    MENU_OVERRIDE_ONSELECT,
};

struct MenuItemOverride
{
    /* 00 */ short cmdid;
    /* 02 */ short kind;
    /* 04 */ void* func;
};

static
struct MenuItemOverride sMenuOverrides[MENU_OVERRIDE_MAX];

void ResetMenuOverrides(void)
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
        sMenuOverrides[i].kind = MENU_OVERRIDE_NONE;
}

void GetForceDisabledMenuItems(u8 list[MENU_OVERRIDE_MAX])
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
    {
        if (sMenuOverrides[i].kind && sMenuOverrides[i].func == MenuAlwaysNotShown)
            list[i] = sMenuOverrides[i].cmdid;
        else
            list[i] = MENU_ITEM_NONE;
    }
}

void SetForceDisabledMenuItems(u8 list[MENU_OVERRIDE_MAX])
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
        if (list[i])
            AddMenuOverride(list[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);
}

void AddMenuOverride(int cmdid, int kind, void* func)
{
    struct MenuItemOverride* it = sMenuOverrides;

    while ((it->kind != 0) && !((it->kind == kind) && (it->cmdid == cmdid)))
        ++it;

    it->cmdid = cmdid;
    it->kind = kind;
    it->func = func;
}

u8 OverriddenMenuAvailability(const struct MenuItemDef* def, int number)
{
    struct MenuItemOverride* it = sMenuOverrides;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ISAVAILABLE)
            continue;

        if (it->cmdid != def->overrideId)
            continue;

        return ((MenuAvailabilityFunc)(it->func))(def, number);
    }

    return 0;
}

u8 OverriddenMenuSelected(struct MenuProc* proc, struct MenuItemProc* item)
{
    struct MenuItemOverride* it = sMenuOverrides;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ONSELECT)
            continue;

        if (it->cmdid != item->def->overrideId)
            continue;

        return ((MenuSelectFunc)(it->func))(proc, item);
    }

    return 0xFF;
}
