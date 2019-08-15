#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bmio.h"
#include "uiutils.h"

// type decls

struct MenuProc;
struct MenuItemProc;

struct MenuRect
{
    s8 x, y, w, h;
};

struct MenuItemDef
{
    /* 00 */ const char* name;

    /* 04 */ u16 nameMsgId, helpMsgId;
    /* 08 */ u8 color, unk09;

    /* 0C */ u8(*isAvailable)(const struct MenuItemDef*, int number);

    /* 10 */ void(*onDraw)(struct MenuProc*, struct MenuItemProc*);

    /* 14 */ int(*onSelected)(struct MenuProc*, struct MenuItemProc*);
    /* 18 */ int(*onIdle)(struct MenuProc*, struct MenuItemProc*);

    /* 1C */ void(*onSwitchIn)(struct MenuProc*, struct MenuItemProc*);
    /* 20 */ void(*onSwitchOut)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuDef
{
    /* 00 */ struct MenuRect rect;
    /* 04 */ u8 style;
    /* 08 */ const struct MenuItemDef* menuItems;

    /* 0C */ void(*onInit)(struct MenuProc*);
    /* 10 */ void(*onEnd)(struct MenuProc*);
    /* 14 */ void(*_u14)(struct MenuProc*);
    /* 18 */ void(*onBPress)(struct MenuProc*, struct MenuItemProc*);
    /* 1C */ void(*onRPress)(struct MenuProc*);
    /* 20 */ void(*onHelpBox)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct MenuRect rect;
    /* 30 */ const struct MenuDef* def;

    /* 34 */ struct MenuItemProc* menuItems[11];

    /* 60 */ u8 itemCount;
    /* 61 */ u8 itemCurrent;
    /* 62 */ u8 itemPrevious;
    /* 63 */ u8 state;

    /* 64 */ u8 backBg : 2;
    /* 64 */ u8 frontBg : 2;

    /* 66 */ u16 tileref;
    /* 68 */ u16 unk68;
};

struct MenuItemProc
{
    /* 00 */ PROC_HEADER;

    /* 2A */ short xTile;
    /* 2C */ short yTile;

    /* 30 */ const struct MenuItemDef* def;

    /* 34 */ struct TextHandle text;

    /* 3C */ u8 itemNumber;
    /* 3D */ u8 availability;
};

// typedef int(*MenuItemAvailableFunc)(struct MenuItemDef*, int);

enum
{
    // Menu availability identifiers

    MENU_ENABLED  = 1,
    MENU_DISABLED = 2,
    MENU_NOTSHOWN = 3,
};

enum
{
    // Menu state bits

    MENU_STATE_BIT0 = (1 << 0),
    MENU_STATE_BIT1 = (1 << 1),
    MENU_STATE_BIT2 = (1 << 2),
    MENU_STATE_BIT3 = (1 << 3),
    MENU_STATE_BIT4 = (1 << 4),
    MENU_STATE_BIT5 = (1 << 5),
    MENU_STATE_BIT6 = (1 << 6),
    MENU_STATE_BIT7 = (1 << 7),
};

enum
{
    // Menu action bits

    MENU_ACTION0 = (1 << 0),
    MENU_ACT_END = (1 << 1),
    MENU_ACT_SND6A = (1 << 2),
    MENU_ACT_SND6B = (1 << 3),
    MENU_ACT_CLEAR = (1 << 4),
    MENU_ACT_ENDFACE = (1 << 5),
    MENU_ACTION6 = (1 << 6),
    MENU_ACTION7 = (1 << 7),
};

// function decls

struct MenuProc* NewMenu_BG0BG1(
    const struct MenuDef* def,
    struct MenuRect rect,
    struct Proc* parent);

struct MenuProc* NewMenu(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    struct Proc* parent);

void Menu_DrawHoverThing(struct MenuProc* proc, int item, s8 boolHover);

void Menu_Idle();
void Menu_Draw();
void Menu_CallDefinedConstructors();
void sub_804F474();
void sub_804F4A0();
void sub_804F530();
void sub_804F5B4();

u8 sub_804F7AC(const struct MenuItemDef*, int);

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

    BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
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

void Menu_GetCursorGfxCurrentPosition(struct MenuProc* proc, int* xResult, int* yResult);
void Menu_UpdateMovingCursorGfxPosition(struct MenuProc* proc, int* xRef, int* yRef);
void Menu_HandleDirectionInputs(struct MenuProc* proc);
int Menu_HandleSelectInputs(struct MenuProc* proc);

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
    {
        BG_Fill(BG_GetMapBuffer(proc->frontBg), 0);
        BG_Fill(BG_GetMapBuffer(proc->backBg), 0);

        BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
    }

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

/*

	THUMB_FUNC_START Menu_Idle
Menu_Idle: @ 0x0804F164
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804F18A
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl Menu_GetCursorGfxCurrentPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	b _0804F286
_0804F18A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804F19A
	adds r0, r5, #0
	bl EndMenu
	b _0804F286
_0804F19A:
	adds r0, r5, #0
	bl Menu_HandleDirectionInputs
	adds r0, r5, #0
	bl Menu_HandleSelectInputs
	adds r6, r0, #0
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0804F1B6
	adds r0, r5, #0
	bl EndMenu
_0804F1B6:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0804F1D0
	ldr r0, _0804F290  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804F1D0
	movs r0, #0x6a
	bl m4aSongNumStart
_0804F1D0:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0804F1EA
	ldr r0, _0804F290  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804F1EA
	movs r0, #0x6b
	bl m4aSongNumStart
_0804F1EA:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0804F22E
	adds r4, r5, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
_0804F22E:
	movs r4, #0x20
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _0804F23E
	movs r0, #0
	bl DeleteFaceByIndex
_0804F23E:
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0804F252
	adds r2, r5, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_0804F252:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _0804F286
	adds r0, r5, #0
	adds r0, #0x63
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804F286
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_GetCursorGfxCurrentPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_UpdateMovingCursorGfxPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayUiHand
_0804F286:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F290: .4byte gUnknown_0202BCF0

*/
