#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "hardware.h"
#include "sysutil.h"

void sub_80CDA4C(struct MenuProc *proc)
{
    int i;
    for (i = 0; i < proc->itemCount; i++)
        if (proc->menuItems[i]->def->onDraw == 0)
            Text_SetCursor(&proc->menuItems[i]->text, 0);
}

int PromoSubConfirm_OnInit(struct MenuProc *proc)
{
    SyncMenuBgs(proc);
    return 0;
}

int PromoSubConfirm_OnEnd(struct MenuProc *proc)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), 0xA, 6, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 8, 4), 0xA, 6, 0);
    SetTextFont(&gFontClassChg);
    sub_80CDA4C(proc->proc_parent);
    RedrawMenu(proc->proc_parent);
    SyncMenuBgs(proc);
    return 0;
}

u8 PromoSubConfirmMenuOnSelect(struct MenuProc *proc, struct MenuItemProc *b)
{
    if (b->itemNumber == 0) {
        ProcPtr found;
        EndMenu(proc);
        EndMenu(proc->proc_parent);
        found = Proc_Find(ProcScr_PromoMain);

        EndAllProcChildren(found);
        ClassChgLoadEfxTerrain();
        Proc_Goto(found, PROMOMAIN_LABEL_POST_SEL);
    }
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 ClassChgMenuSel_OnBPress(struct MenuProc *_proc, struct MenuItemProc *_proc2)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

CONST_DATA struct MenuItemDef MenuItem_PromoSubConfirm[] = {
    {
        "　決定",
        0x23,   /* Change */
        0, TEXT_COLOR_SYSTEM_WHITE, 0,
        MenuAlwaysEnabled,
        NULL,
        PromoSubConfirmMenuOnSelect,
        NULL, NULL
    },
    {
        "　やめる",
        0x24,   /* Cancel */
        0, TEXT_COLOR_SYSTEM_WHITE, 1,
        MenuAlwaysEnabled,
        NULL,
        PromoSubConfirmMenuOnSelect,
        NULL,
        NULL
    },
    {0},
};

CONST_DATA struct MenuDef Menu_PromoSubConfirm = {
    { 9, 4, 6, 0 },
    1,
    MenuItem_PromoSubConfirm,
    (void(*)(struct MenuProc*)) PromoSubConfirm_OnInit,
    (void(*)(struct MenuProc*)) PromoSubConfirm_OnEnd,
    NULL,
    ClassChgMenuSel_OnBPress,
    NULL,
    MenuStdHelpBox
};
