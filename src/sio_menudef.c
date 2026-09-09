#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D858
u8 SioWeaponSelectMenu_Usability(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if ((GetItemAttributes(item) & IA_WEAPON) == 0)
    {
        return MENU_NOTSHOWN;
    }

    if (GetItemMinRange(item) > 2)
    {
        return MENU_DISABLED;
    }

    if (!CanUnitUseWeapon(gActiveUnit, item))
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x0804D8A4
u8 SioWeaponSelectMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        return MENU_ACT_SND6B;
    }

    gUnk_Sio_16.unk_07 = menuItem->itemNumber;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;
}

//! FE8U = 0x0804D8C8
u8 SioAttackTypeMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_16.unk_06 = menuItem->itemNumber + 1;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x0804D8DC
int SioWeaponSelectMenu_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber];

    s8 color = CanUnitUseWeapon(gActiveUnit, item);

    if (GetItemMinRange(item) > 2)
    {
        color = 0;
    }

    DrawItemMenuLine(
        &menuItem->text, item, color, TILEMAP_LOCATED(gBG0TilemapBuffer, menuItem->xTile, menuItem->yTile));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    // return;
}

//! FE8U = 0x0804D940
u8 SioMenu_OnBPress(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_16.unk_06 = 0;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x0804D950
u8 SioMenu_OnRPress(struct MenuProc * menu)
{
    gUnk_Sio_16.unk_06 = 0;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

// clang-format off

struct MenuItemDef CONST_DATA MenuItems_SioMenudef_0[] =
{
    {
        .name = "　直接攻撃",
        .overrideId = 1,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = SioAttackTypeMenu_OnSelect,
    },

    {
        .name = "　間接攻撃",
        .overrideId = 2,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = SioAttackTypeMenu_OnSelect,
    },

    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_SioMenudef_1[] =
{
    {
        .name = "",
        .overrideId = 3,
        .isAvailable = SioWeaponSelectMenu_Usability,
        .onDraw = SioWeaponSelectMenu_Draw,
        .onSelected = SioWeaponSelectMenu_OnSelect,
    },

    {
        .name = "",
        .overrideId = 4,
        .isAvailable = SioWeaponSelectMenu_Usability,
        .onDraw = SioWeaponSelectMenu_Draw,
        .onSelected = SioWeaponSelectMenu_OnSelect,
    },

    {
        .name = "",
        .overrideId = 5,
        .isAvailable = SioWeaponSelectMenu_Usability,
        .onDraw = SioWeaponSelectMenu_Draw,
        .onSelected = SioWeaponSelectMenu_OnSelect,
    },

    {
        .name = "",
        .overrideId = 6,
        .isAvailable = SioWeaponSelectMenu_Usability,
        .onDraw = SioWeaponSelectMenu_Draw,
        .onSelected = SioWeaponSelectMenu_OnSelect,
    },

    {
        .name = "",
        .overrideId = 7,
        .isAvailable = SioWeaponSelectMenu_Usability,
        .onDraw = SioWeaponSelectMenu_Draw,
        .onSelected = SioWeaponSelectMenu_OnSelect,
    },

    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_SioMenudef_2[] =
{
    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_SioMenudef_3[] =
{
    { 0 }, // end
};

struct MenuDef CONST_DATA gSioMenudef_0 =
{
    .rect = { 16, 2, 8, 0 },
    .menuItems = MenuItems_SioMenudef_0,
    .onBPress = SioMenu_OnBPress,
};

struct MenuDef CONST_DATA gSioMenudef_1 =
{
    .rect = { 1, 1, 14, 0 },
    .menuItems = MenuItems_SioMenudef_1,
    .onBPress = SioMenu_OnBPress,
};

struct MenuDef CONST_DATA gSioMenudef_2 =
{
    .rect = { 1, 2, 12, 0 },
    .menuItems = MenuItems_SioMenudef_2,
    .onBPress = MenuCancelSelect,
};

struct MenuDef CONST_DATA gSioMenudef_3 =
{
    .rect = { 1, 2, 22, 0 },
    .menuItems = MenuItems_SioMenudef_3,
    .onBPress = MenuCancelSelect,
};

// clang-format on
