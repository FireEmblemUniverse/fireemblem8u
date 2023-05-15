#ifndef GUARD_UI_MENU_H
#define GUARD_UI_MENU_H

#include "fontgrp.h"

// config

enum
{
    MENU_ITEM_MAX = 11,       //!< max menu item count
    MENU_OVERRIDE_MAX = 0x10, //!< max menu overrides
};

// type decls

struct MenuDef;
struct MenuItemDef;

struct MenuProc;
struct MenuItemProc;

struct MenuRect { s8 x, y, w, h; };

typedef u8(*MenuAvailabilityFunc)(const struct MenuItemDef*, int);
typedef u8(*MenuSelectFunc)(struct MenuProc*, struct MenuItemProc*);

struct MenuItemDef
{
    /* 00 */ const char* name;

    /* 04 */ u16 nameMsgId, helpMsgId;
    /* 08 */ u8 color, overrideId;

    /* 0C */ u8(*isAvailable)(const struct MenuItemDef*, int number);

    /* 10 */ int(*onDraw)(struct MenuProc*, struct MenuItemProc*);

    /* 14 */ u8(*onSelected)(struct MenuProc*, struct MenuItemProc*);
    /* 18 */ u8(*onIdle)(struct MenuProc*, struct MenuItemProc*);

    /* 1C */ int(*onSwitchIn)(struct MenuProc*, struct MenuItemProc*);
    /* 20 */ int(*onSwitchOut)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuDef
{
    /* 00 */ struct MenuRect rect;
    /* 04 */ u8 style;
    /* 08 */ const struct MenuItemDef* menuItems;

    /* 0C */ void(*onInit)(struct MenuProc*);
    /* 10 */ void(*onEnd)(struct MenuProc*);
    /* 14 */ void(*_u14)(struct MenuProc*);
    /* 18 */ u8(*onBPress)(struct MenuProc*, struct MenuItemProc*);
    /* 1C */ u8(*onRPress)(struct MenuProc*);
    /* 20 */ u8(*onHelpBox)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct MenuRect rect;
    /* 30 */ const struct MenuDef* def;

    /* 34 */ struct MenuItemProc* menuItems[MENU_ITEM_MAX];

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

    /* 3C */ s8 itemNumber;
    /* 3D */ u8 availability;
};

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

    MENU_STATE_GAMELOCKING = (1 << 0),
    MENU_STATE_UNUSED1 = (1 << 1),
    MENU_STATE_ENDING = (1 << 2),
    MENU_STATE_NOTSHOWN = (1 << 3),
    MENU_STATE_FLAT = (1 << 4),
    MENU_STATE_NOCURSOR = (1 << 5),
    MENU_STATE_FROZEN = (1 << 6),
    MENU_STATE_DOOMED = (1 << 7),
};

enum
{
    // Menu action bits

    MENU_ACT_SKIPCURSOR = (1 << 0),
    MENU_ACT_END = (1 << 1),
    MENU_ACT_SND6A = (1 << 2),
    MENU_ACT_SND6B = (1 << 3),
    MENU_ACT_CLEAR = (1 << 4),
    MENU_ACT_ENDFACE = (1 << 5),
    MENU_ACT_UNUSED6 = (1 << 6),
    MENU_ACT_DOOM = (1 << 7),
};

enum
{
    // Menu item identifiers

    MENU_ITEM_NONE = 0,
};

// function decls

struct MenuProc* StartOrphanMenuAdjusted(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight);
struct MenuProc* StartMenu(const struct MenuDef* def, ProcPtr parent);
struct MenuProc* StartOrphanMenuAt(const struct MenuDef* def, struct MenuRect rect);
struct MenuProc* StartOrphanMenu(const struct MenuDef* def);
struct MenuProc* StartOrphanMenuAdjustedExt(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* StartMenuExt(const struct MenuDef* def, int backBg, int tileref, int frontBg, int unk, ProcPtr parent);
struct MenuProc* StartOrphanMenuAtExt(const struct MenuDef* def, struct MenuRect rect, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* StartOrphanMenuExt(const struct MenuDef* def, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* StartMenuAt(const struct MenuDef* def, struct MenuRect rect, ProcPtr parent);
struct MenuProc* StartMenuCore(const struct MenuDef* def, struct MenuRect rect, int backBg, int tileref, int frontBg, int unk, ProcPtr parent);

struct Proc* EndMenu(struct MenuProc* proc);
void EndAllMenus(void);

void SyncMenuBgs(struct MenuProc* proc);
void ClearMenuBgs(struct MenuProc* proc);
s8 HasMenuChangedItem(struct MenuProc* proc);

void Menu_OnInit(struct MenuProc* proc);
void RedrawMenu(struct MenuProc* proc);
void DrawMenuItemHover(struct MenuProc* proc, int item, s8 boolHover);
void Menu_OnIdle(struct MenuProc* proc);
void ProcessMenuDpadInput(struct MenuProc* proc);
int  ProcessMenuSelectInput(struct MenuProc* proc);
void GetMenuCursorPosition(struct MenuProc* proc, int* xResult, int* yResult);

u8 MenuAlwaysEnabled(const struct MenuItemDef* def, int number);
u8 MenuAlwaysDisabled(const struct MenuItemDef* def, int number);
u8 MenuAlwaysNotShown(const struct MenuItemDef* def, int number);

u8 MenuCancelSelect(struct MenuProc* menu, struct MenuItemProc* item);
u8 MenuStdHelpBox(struct MenuProc* menu, struct MenuItemProc* item);
u8 MenuAutoHelpBoxSelect(struct MenuProc* menu);
u8 MenuFrozenHelpBox(struct MenuProc* proc, int msgid);
u8 MenuFrozen(struct MenuProc* proc);

void FreezeMenu(void);
void ResumeMenu(void);

struct MenuProc* StartSemiCenteredOrphanMenu(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight);
void ApplyMenuCursorVScroll(struct MenuProc* proc, int* xRef, int* yRef);

void ResetMenuOverrides(void);
void GetForceDisabledMenuItems(u8 list[MENU_OVERRIDE_MAX]);
void SetForceDisabledMenuItems(u8 list[MENU_OVERRIDE_MAX]);
void AddMenuOverride(int cmdid, int kind, void* func);
u8 OverriddenMenuAvailability(const struct MenuItemDef* def, int number);
u8 OverriddenMenuSelected(struct MenuProc* proc, struct MenuItemProc* item);

#endif // GUARD_UI_MENU_H
