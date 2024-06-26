#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D858
u8 sub_804D858(const struct MenuItemDef * def, int number)
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
u8 sub_804D8A4(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        return MENU_ACT_SND6B;
    }

    gUnk_Sio_0203DD90.unk_07 = menuItem->itemNumber;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;
}

//! FE8U = 0x0804D8C8
u8 sub_804D8C8(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_0203DD90.unk_06 = menuItem->itemNumber + 1;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x0804D8DC
int sub_804D8DC(struct MenuProc * menu, struct MenuItemProc * menuItem)
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
u8 sub_804D940(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_0203DD90.unk_06 = 0;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x0804D950
u8 sub_804D950(struct MenuProc * menu)
{
    gUnk_Sio_0203DD90.unk_06 = 0;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

// clang-format off

struct MenuItemDef CONST_DATA MenuItems_085AABF0[] =
{
    {
        .name = "　直接攻撃",
        .overrideId = 1,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = sub_804D8C8,
    },

    {
        .name = "　間接攻撃",
        .overrideId = 2,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = sub_804D8C8,
    },

    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_085AAC5C[] =
{
    {
        .name = "",
        .overrideId = 3,
        .isAvailable = sub_804D858,
        .onDraw = sub_804D8DC,
        .onSelected = sub_804D8A4,
    },

    {
        .name = "",
        .overrideId = 4,
        .isAvailable = sub_804D858,
        .onDraw = sub_804D8DC,
        .onSelected = sub_804D8A4,
    },

    {
        .name = "",
        .overrideId = 5,
        .isAvailable = sub_804D858,
        .onDraw = sub_804D8DC,
        .onSelected = sub_804D8A4,
    },

    {
        .name = "",
        .overrideId = 6,
        .isAvailable = sub_804D858,
        .onDraw = sub_804D8DC,
        .onSelected = sub_804D8A4,
    },

    {
        .name = "",
        .overrideId = 7,
        .isAvailable = sub_804D858,
        .onDraw = sub_804D8DC,
        .onSelected = sub_804D8A4,
    },

    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_085AAD34[] =
{
    { 0 }, // end
};

struct MenuItemDef CONST_DATA MenuItems_085AAD58[] =
{
    { 0 }, // end
};

struct MenuDef CONST_DATA gUnknown_085AAD7C =
{
    .rect = { 16, 2, 8, 0 },
    .menuItems = MenuItems_085AABF0,
    .onBPress = sub_804D940,
};

struct MenuDef CONST_DATA gUnknown_085AADA0 =
{
    .rect = { 1, 1, 14, 0 },
    .menuItems = MenuItems_085AAC5C,
    .onBPress = sub_804D940,
};

struct MenuDef CONST_DATA gUnknown_085AADC4 =
{
    .rect = { 1, 2, 12, 0 },
    .menuItems = MenuItems_085AAD34,
    .onBPress = MenuCancelSelect,
};

struct MenuDef CONST_DATA gUnknown_085AADE8 =
{
    .rect = { 1, 2, 22, 0 },
    .menuItems = MenuItems_085AAD58,
    .onBPress = MenuCancelSelect,
};

// clang-format on
