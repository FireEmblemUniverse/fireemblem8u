#ifndef GUARD_UI_MENU_H
#define GUARD_UI_MENU_H

// config

enum
{
    MENU_ITEM_MAX = 11, //!< max menu item count
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
    /* 08 */ u8 color, unk09;

    /* 0C */ u8(*isAvailable)(const struct MenuItemDef*, int number);

    /* 10 */ void(*onDraw)(struct MenuProc*, struct MenuItemProc*);

    /* 14 */ u8(*onSelected)(struct MenuProc*, struct MenuItemProc*);
    /* 18 */ u8(*onIdle)(struct MenuProc*, struct MenuItemProc*);

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
    /* 18 */ u8(*onBPress)(struct MenuProc*, struct MenuItemProc*);
    /* 1C */ u8(*onRPress)(struct MenuProc*);
    /* 20 */ void(*onHelpBox)(struct MenuProc*, struct MenuItemProc*);
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

    /* 3C */ u8 itemNumber;
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

enum
{
    // Menu item identifiers

    MENU_ITEM_NONE = 0,
};

// function decls

struct MenuProc* NewMenu_DefaultAdjusted(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight);
struct MenuProc* NewMenu_DefaultChild(const struct MenuDef* def, struct Proc* parent);
struct MenuProc* sub_804EBD8(const struct MenuDef* def, struct MenuRect rect);
struct MenuProc* NewMenu_Default(const struct MenuDef* def);
struct MenuProc* sub_804EBF4(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* NewMenu_804EC34(const struct MenuDef* def, int backBg, int tileref, int frontBg, int unk, struct Proc* parent);
struct MenuProc* sub_804EC58(const struct MenuDef* def, struct MenuRect rect, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* sub_804EC74(const struct MenuDef* def, int backBg, int tileref, int frontBg, int unk);
struct MenuProc* NewMenu_BG0BG1(const struct MenuDef* def, struct MenuRect rect, struct Proc* parent);
struct MenuProc* NewMenu(const struct MenuDef* def, struct MenuRect rect, int backBg, int tileref, int frontBg, int unk, struct Proc* parent);

struct Proc* EndMenu(struct MenuProc* proc);
void EndAllMenus(void);
void Menu_CallDefinedConstructors(struct MenuProc* proc);
void Menu_Draw(struct MenuProc* proc);
void Menu_DrawHoverThing(struct MenuProc* proc, int item, s8 boolHover);
void Menu_Idle(struct MenuProc* proc);
void Menu_HandleDirectionInputs(struct MenuProc* proc);
int Menu_HandleSelectInputs(struct MenuProc* proc);
void Menu_GetCursorGfxCurrentPosition(struct MenuProc* proc, int* xResult, int* yResult);

u8 MenuCommand_UsabilityAlways(const struct MenuItemDef* def, int number);
u8 UsabilityGrayed(const struct MenuItemDef* def, int number);
u8 UsabilityNever(const struct MenuItemDef* def, int number);
u8 sub_804F454(struct MenuProc* menu, struct MenuItemProc* item);
u8 sub_804F458(struct MenuProc* menu, struct MenuItemProc* item);
void sub_804F474(struct MenuProc* proc);
void sub_804F4A0(struct MenuProc* proc);
u8 sub_804F520(struct MenuProc* menu, struct MenuItemProc* item);
void sub_804F530(struct MenuProc* proc);
u8 Menu_CallTextBox(struct MenuProc* proc, int msgid);
void sub_804F5B4(struct MenuProc* proc);
u8 sub_804F5FC(struct MenuProc* proc);

void MarkSomethingInMenu(void);
void sub_804F62C(void);
struct MenuProc* NewMenu_AndDoSomethingCommands(const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight);
void Menu_UpdateMovingCursorGfxPosition(struct MenuProc* proc, int* xRef, int* yRef);

void ClearMenuRelatedList(void);
void sub_804F714(u8 list[MENU_OVERRIDE_MAX]);
void sub_804F754(u8 list[MENU_OVERRIDE_MAX]);
void sub_804F77C(int cmdid, int kind, void* func);
u8 sub_804F7AC(const struct MenuItemDef* def, int number);
u8 sub_804F7E8(struct MenuProc* proc, struct MenuItemProc* item);
void sub_804F82C(struct MenuProc* proc);
void sub_804F84C(struct MenuProc* proc);
s8 sub_804F890(struct MenuProc* proc);

#endif // GUARD_UI_MENU_H
