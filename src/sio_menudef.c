#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D858
int sub_804D858(struct Unit * unit, int itemSlot)
{
    int item = gActiveUnit->items[itemSlot];

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
