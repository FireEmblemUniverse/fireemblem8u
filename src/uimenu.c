#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bmio.h"
#include "uiutils.h"

#include "uimenu.h"

// data

CONST_DATA
struct ProcCmd gUnknown_085B64B8[] =
{
    PROC_LOOP_ROUTINE(Menu_Idle),
    PROC_CALL_ROUTINE(EndGreenTextColorManager),

    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B64D0[] =
{
    PROC_SET_NAME("E_Menu"),
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL_ROUTINE(NewGreenTextColorManager),
    PROC_CALL_ROUTINE(Menu_Draw),
    PROC_CALL_ROUTINE(Menu_CallDefinedConstructors),

    PROC_JUMP(gUnknown_085B64B8),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6510[] =
{
    PROC_BLOCK
};

CONST_DATA
struct ProcCmd gUnknown_085B6518[] =
{
    PROC_CALL_ROUTINE(sub_804F474),
    PROC_LOOP_ROUTINE(sub_804F4A0),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6530[] =
{
    PROC_LOOP_ROUTINE(sub_804F530),
    PROC_END
};

CONST_DATA
struct ProcCmd gUnknown_085B6540[] =
{
    PROC_LOOP_ROUTINE(sub_804F5B4),
    PROC_END
};

CONST_DATA
u8 gUnknown_085B6550[12] = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    2,
    3,
    3,
    3,
};

// functions

struct MenuProc* NewMenu_DefaultAdjusted(
    const struct MenuDef* def,
    int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return NewMenu_BG0BG1(def, rect, NULL);
}

struct MenuProc* NewMenu_DefaultChild(const struct MenuDef* def, struct Proc* parent)
{
    return NewMenu_BG0BG1(def, def->rect, parent);
}

struct MenuProc* sub_804EBD8(const struct MenuDef* def, struct MenuRect rect)
{
    return NewMenu_BG0BG1(def, rect, NULL);
}

struct MenuProc* NewMenu_Default(const struct MenuDef* def)
{
    return NewMenu_BG0BG1(def, def->rect, NULL);
}

struct MenuProc* sub_804EBF4(
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

    return NewMenu(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* NewMenu_804EC34(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    struct Proc* parent)
{
    return NewMenu(def, def->rect, backBg, tileref, frontBg, unk, parent);
}

struct MenuProc* sub_804EC58(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return NewMenu(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* sub_804EC74(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return NewMenu(def, def->rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* NewMenu_BG0BG1(
    const struct MenuDef* def,
    struct MenuRect rect,
    struct Proc* parent)
{
    return NewMenu(def, rect, 1, TILEREF(0, 0), 0, 0, parent);
}

struct MenuProc* NewMenu(
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
        proc = (struct MenuProc*) Proc_CreateBlockingChild(gUnknown_085B64D0, parent);
        proc->state = 0;
    }
    else
    {
        AddSkipThread2();

        proc = (struct MenuProc*) Proc_Create(gUnknown_085B64D0, ROOT_PROC_3);
        proc->state = MENU_STATE_BIT0;
    }

    if (rect.h < 0)
        proc->state |= MENU_STATE_BIT3;

    for (i = 0, itemCount = 0; def->menuItems[i].isAvailable; ++i)
    {
        int availability = sub_804F7AC(&def->menuItems[i], i);

        if (!availability)
            availability = def->menuItems[i].isAvailable(&def->menuItems[i], i);

        if (availability != MENU_NOTSHOWN)
        {
            struct MenuItemProc* item = (struct MenuItemProc*) Proc_Create(gUnknown_085B6510, (struct Proc*) proc);
            proc->menuItems[itemCount++] = item;

            item->def = &def->menuItems[i];
            item->itemNumber = i;
            item->availability = availability;

            item->xTile = xTileInner;
            item->yTile = yTileInner;

            if (!(proc->state & MENU_STATE_BIT3))
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
    proc->tileref   = tileref;
    proc->frontBg = frontBg & 3;
    proc->unk68     = unk;

    gKeyStatusPtr->newKeys = 0;

    return proc;
}

struct Proc* EndMenu(struct MenuProc* proc)
{
    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];

    proc->state |= MENU_STATE_BIT2;

    if (item->def->onSwitchOut)
        item->def->onSwitchOut(proc, item);

    if (proc->def->onEnd)
        proc->def->onEnd(proc);

    if (proc->state & MENU_STATE_BIT0)
        SubSkipThread2();

    Proc_Delete((struct Proc*) proc);

    BG_SetPosition(proc->frontBg, 0, 0);
    BG_SetPosition(proc->backBg, 0, 0);

    return proc->parent;
}

void EndAllMenus(void)
{
    Proc_ForEachWithScript(gUnknown_085B64D0, (ProcFunc) EndMenu);
}

inline
void sub_804F82C(struct MenuProc* proc)
{
    BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
}

inline
void sub_804F84C(struct MenuProc* proc)
{
    BG_Fill(BG_GetMapBuffer(proc->frontBg), 0);
    BG_Fill(BG_GetMapBuffer(proc->backBg), 0);

    sub_804F82C(proc);
}

inline
s8 sub_804F890(struct MenuProc* proc)
{
    return proc->itemCurrent != proc->itemPrevious;
}

void Menu_CallDefinedConstructors(struct MenuProc* proc)
{
    if (proc->def->onInit)
        proc->def->onInit(proc);

    if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
        proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
}

void Menu_Draw(struct MenuProc* proc)
{
    int i;

    if (proc->state & MENU_STATE_BIT3)
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

    Menu_DrawHoverThing(proc, proc->itemCurrent, TRUE);
    sub_804F82C(proc);
}

void Menu_DrawHoverThing(struct MenuProc* proc, int item, s8 boolHover)
{
    int x, y, w;

    if (proc->state & MENU_STATE_BIT4)
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

void Menu_Idle(struct MenuProc* proc)
{
    int x, y, actions;

    if (proc->state & MENU_STATE_BIT6)
    {
        Menu_GetCursorGfxCurrentPosition(proc, &x, &y);
        DisplayFrozenUiHand(x, y);

        return;
    }

    if (proc->state & MENU_STATE_BIT7)
    {
        EndMenu(proc);
        return;
    }

    Menu_HandleDirectionInputs(proc);
    actions = Menu_HandleSelectInputs(proc);

    if (actions & MENU_ACT_END)
        EndMenu(proc);

    if (actions & MENU_ACT_SND6A)
        PlaySoundEffect(0x6A); // TODO: song ids!

    if (actions & MENU_ACT_SND6B)
        PlaySoundEffect(0x6B); // TODO: song ids!

    if (actions & MENU_ACT_CLEAR)
        sub_804F84C(proc);

    if (actions & MENU_ACT_ENDFACE)
        DeleteFaceByIndex(0);

    if (actions & MENU_ACTION7)
        proc->state |= MENU_STATE_BIT7;

    if (actions & MENU_ACTION0)
        return;

    if (proc->state & MENU_STATE_BIT5)
        return;

    Menu_GetCursorGfxCurrentPosition(proc, &x, &y);
    Menu_UpdateMovingCursorGfxPosition(proc, &x, &y);

    DisplayUiHand(x, y);
}

void Menu_HandleDirectionInputs(struct MenuProc* proc)
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
        Menu_DrawHoverThing(proc, proc->itemPrevious, FALSE);
        Menu_DrawHoverThing(proc, proc->itemCurrent, TRUE);

        PlaySoundEffect(0x66); // TODO: song ids!
    }

    // Call def's switch in/out funcs

    if (sub_804F890(proc))
    {
        if (proc->menuItems[proc->itemPrevious]->def->onSwitchOut)
            proc->menuItems[proc->itemPrevious]->def->onSwitchOut(proc, proc->menuItems[proc->itemPrevious]);

        if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
            proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
    }
}

int Menu_HandleSelectInputs(struct MenuProc* proc)
{
    int result = 0;

    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];
    const struct MenuItemDef* itemDef = item->def;

    if (itemDef->onIdle)
        result = itemDef->onIdle(proc, item);

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        // A Button press

        result = sub_804F7E8(proc, item);

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

void Menu_GetCursorGfxCurrentPosition(struct MenuProc* proc, int* xResult, int* yResult)
{
    *xResult = proc->menuItems[proc->itemCurrent]->xTile*8;
    *yResult = proc->menuItems[proc->itemCurrent]->yTile*8;

    if (proc->def->style != 0)
        *xResult -= 4;
}

u8 MenuCommand_UsabilityAlways(const struct MenuItemDef* def, int number)
{
    return MENU_ENABLED;
}

u8 UsabilityGrayed(const struct MenuItemDef* def, int number)
{
    return MENU_DISABLED;
}

u8 UsabilityNever(const struct MenuItemDef* def, int number)
{
    return MENU_NOTSHOWN;
}

u8 sub_804F454(struct MenuProc* menu, struct MenuItemProc* item)
{
    return MENU_ACTION0 | MENU_ACT_CLEAR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 sub_804F458(struct MenuProc* menu, struct MenuItemProc* item)
{
    sub_8088DE0(item->xTile*8, item->yTile*8, item->def->helpMsgId);
}

void sub_804F474(struct MenuProc* proc)
{
    LoadDialogueBoxGfx(NULL, -1); // TODO: NOPAL constant?
    proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
}

void sub_804F4A0(struct MenuProc* proc)
{
    int x, y;

    Menu_HandleDirectionInputs(proc);

    Menu_GetCursorGfxCurrentPosition(proc, &x, &y);
    Menu_UpdateMovingCursorGfxPosition(proc, &x, &y);

    DisplayUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        sub_8089018();
        Proc_JumpToPointer((struct Proc*) proc, gUnknown_085B64B8);

        return;
    }

    if (sub_804F890(proc))
    {
        proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
    }
}

u8 sub_804F520(struct MenuProc* menu, struct MenuItemProc* item)
{
    Proc_JumpToPointer((struct Proc*) menu, gUnknown_085B6518);
}

void sub_804F530(struct MenuProc* proc)
{
    int x, y;

    Menu_GetCursorGfxCurrentPosition(proc, &x, &y);
    Menu_UpdateMovingCursorGfxPosition(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        sub_8089018();
        Proc_JumpToPointer((struct Proc*) proc, gUnknown_085B64B8);
    }
}

u8 Menu_CallTextBox(struct MenuProc* proc, int msgid)
{
    Proc_JumpToPointer((struct Proc*) proc, gUnknown_085B6530);

    LoadDialogueBoxGfx(NULL, -1); // TODO: default constants?
    sub_8088DE0(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgid);
}

void sub_804F5B4(struct MenuProc* proc)
{
    int x, y;

    Menu_GetCursorGfxCurrentPosition(proc, &x, &y);
    Menu_UpdateMovingCursorGfxPosition(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_JumpToPointer((struct Proc*) proc, gUnknown_085B64B8);
}

u8 sub_804F5FC(struct MenuProc* proc)
{
    Proc_JumpToPointer((struct Proc*) proc, gUnknown_085B6540);
}

void MarkSomethingInMenu(void)
{
    struct MenuProc* proc = (struct MenuProc*) Proc_Find(gUnknown_085B64D0);

    if (proc)
        proc->state |= MENU_STATE_BIT6;
}

void sub_804F62C(void)
{
    struct MenuProc* proc = (struct MenuProc*) Proc_Find(gUnknown_085B64D0);

    if (proc)
        proc->state &= ~MENU_STATE_BIT6;
}

struct MenuProc* NewMenu_AndDoSomethingCommands(
    const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuProc* result = NewMenu_DefaultAdjusted(def, xSubject, xTileLeft, xTileRight);
    int i;

    if (result->itemCount <= 6)
        return result;

    result->rect.y -= gUnknown_085B6550[result->itemCount];

    for (i = 0; i < result->itemCount; ++i)
        result->menuItems[i]->yTile -= gUnknown_085B6550[result->itemCount];

    return result;
}

void Menu_UpdateMovingCursorGfxPosition(struct MenuProc* proc, int* xRef, int* yRef)
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

extern struct MenuItemOverride gUnknown_03001870[MENU_OVERRIDE_MAX];

void ClearMenuRelatedList(void)
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
        gUnknown_03001870[i].kind = MENU_OVERRIDE_NONE;
}

void sub_804F714(u8 list[MENU_OVERRIDE_MAX])
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
    {
        if (gUnknown_03001870[i].kind && gUnknown_03001870[i].func == UsabilityNever)
            list[i] = gUnknown_03001870[i].cmdid;
        else
            list[i] = MENU_ITEM_NONE;
    }
}

void sub_804F754(u8 list[MENU_OVERRIDE_MAX])
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; ++i)
        if (list[i])
            sub_804F77C(list[i], MENU_OVERRIDE_ISAVAILABLE, UsabilityNever);
}

void sub_804F77C(int cmdid, int kind, void* func)
{
    struct MenuItemOverride* it = gUnknown_03001870;

    while ((it->kind != 0) && !((it->kind == kind) && (it->cmdid == cmdid)))
        ++it;

    it->cmdid = cmdid;
    it->kind = kind;
    it->func = func;
}

u8 sub_804F7AC(const struct MenuItemDef* def, int number)
{
    struct MenuItemOverride* it = gUnknown_03001870;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ISAVAILABLE)
            continue;

        if (it->cmdid != def->unk09)
            continue;

        return ((MenuAvailabilityFunc)(it->func))(def, number);
    }

    return 0;
}

u8 sub_804F7E8(struct MenuProc* proc, struct MenuItemProc* item)
{
    struct MenuItemOverride* it = gUnknown_03001870;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ONSELECT)
            continue;

        if (it->cmdid != item->def->unk09)
            continue;

        return ((MenuSelectFunc)(it->func))(proc, item);
    }

    return 0xFF;
}
