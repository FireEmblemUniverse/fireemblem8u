#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"

u32 ClassChgMenuSelOnInit(struct MenuProc *proc)
{
    SyncMenuBgs(proc);
    return 0;
}

u32 ClassChgMenuSelOnEnd(struct MenuProc *proc)
{
    SyncMenuBgs(proc);
    return 0;
}

u8 ClassChgMenuItem_OnSelect(struct MenuProc *pmenu, struct MenuItemProc *pmitem) {
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;
    struct ProcPromoMain *ggparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->stat == 0) {
        struct Unit *unit = GetUnitFromCharId(ggparent->pid);
        u8 classnumber = unit->pClassData->number;
        if (pmitem->itemNumber <= 1) {
            classnumber = gPromoJidLut[classnumber][pmitem->itemNumber];
            ggparent->jid = classnumber;
        } else {
            if (pmitem->itemNumber == 2) {
                switch (classnumber) {
                case CLASS_JOURNEYMAN:
                    ggparent->jid = CLASS_JOURNEYMAN_T1;
                    break;
                case CLASS_PUPIL:
                    ggparent->jid = CLASS_PUPIL_T1;
                    break;
                case CLASS_RECRUIT:
                    ggparent->jid = CLASS_RECRUIT_T1;
                    break;
                default:
                    ggparent->jid = classnumber;
                    break;
                }
            }
        }

        switch ((u8) ggparent->jid) {
        case CLASS_RANGER:
        case CLASS_RANGER_F:
            if (unit->state & US_IN_BALLISTA) {
                TryRemoveUnitFromBallista(unit);
            }
            break;
        }

        InitTextFont(&gFontClassChgMenu, (void *)BG_VRAM + 0x1000, 0x80, 0x5);
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 9, 4), 0xA, 0x6, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
        StartMenuExt(&Menu_PromoSubConfirm, 2, 0, 0, 0, pmenu);
    }

    return 0;
}

u8 ClassChgMenuSelOnPressB(struct MenuProc *pmenu, struct MenuItemProc *pmitem) {
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;
    struct ProcPromoMain *ggparent;
    struct ProcPromoHandler *gggparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    gggparent = ggparent->proc_parent;
    if (gggparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) 
        return 0;

    if (gggparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        Proc_End(parent);
        Proc_Goto(gparent, PROC_CLASSCHG_SEL_2);
        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
    }

    if (gggparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_End(parent);
        Proc_Goto(gparent, PROC_CLASSCHG_SEL_2);
        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;;
    }

    return 0;
}

void ClassChgMenuOnDrawCore(struct MenuProc *pmenu, struct MenuItemProc *pmitem, char *str)
{
    u8 unused_stack[32];
    u16 *mapbuf;
    if (pmitem->def->color)
        Text_SetColor(&pmitem->text, pmitem->def->color);

    if (pmitem->availability == MENU_DISABLED)
        Text_SetColor(&pmitem->text, TEXT_COLOR_SYSTEM_GRAY);

    ClearTextPart(&pmitem->text, 0, 20);
    Text_SetCursor(&pmitem->text, 8);
    Text_DrawString(&pmitem->text, str);
    mapbuf = BG_GetMapBuffer(pmenu->frontBg);

    PutText(&pmitem->text, &mapbuf[pmitem->yTile * 32 + pmitem->xTile]);
}

int ClassChgMenuItem_OnTextDraw(struct MenuProc *pmenu, struct MenuItemProc *pmitem)
{
    u8 unused_stack[0x48];
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ClassChgMenuOnDrawCore(pmenu, pmitem, GetStringFromIndex(GetClassData(gparent->jid[pmitem->itemNumber])->nameTextId));
}

int ClassChgMenuItem_OnChange(struct MenuProc *pmenu, struct MenuItemProc *pmitem)
{
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    gparent->stat = 1;
    gparent->main_select = pmitem->itemNumber;
    ChangeClassDescription(gparent->msg_desc[gparent->main_select]);
    SetTalkPrintDelay(-1);
}

u8 ClassChgMenuItem_3rdUsability(const struct MenuItemDef * _def, int _number)
{
    struct ProcClassChgMenuSel *proc = Proc_Find(ProcScr_ClassChgMenuSel);
    struct ProcPromoSel *parent = proc->proc_parent;
    struct ProcPromoMain *gparent = parent->proc_parent;

    if (Check3rdTraineeEnabled()) {
        switch (GetUnitFromCharId(gparent->pid)->pClassData->number) {
        case CLASS_JOURNEYMAN:
        case CLASS_PUPIL:
        case CLASS_RECRUIT:
            return MENU_ENABLED;

        default:
            return MENU_NOTSHOWN;
        }
    }

    return MENU_NOTSHOWN;
}

CONST_DATA struct MenuItemDef gMenuItem_PromoSel[] = {
    {
        "　第１兵種",
        0,
        0x6DC,  /* Discard items. Important[NL]items cannot be discarded. */
        TEXT_COLOR_SYSTEM_WHITE,
        0,
        MenuAlwaysEnabled,
        ClassChgMenuItem_OnTextDraw,
        ClassChgMenuItem_OnSelect,
        0,
        ClassChgMenuItem_OnChange,
        0
    },
    {
        "　第２兵種",
        0,
        0x6DC,  /* Discard items. Important[NL]items cannot be discarded. */
        TEXT_COLOR_SYSTEM_WHITE,
        1,
        MenuAlwaysEnabled,
        ClassChgMenuItem_OnTextDraw,
        ClassChgMenuItem_OnSelect,
        0,
        ClassChgMenuItem_OnChange,
        0
    },
    {
        "　第３兵種",
        0,
        0x6DC,  /* Discard items. Important[NL]items cannot be discarded. */
        TEXT_COLOR_SYSTEM_WHITE,
        2,
        ClassChgMenuItem_3rdUsability,
        ClassChgMenuItem_OnTextDraw,
        ClassChgMenuItem_OnSelect,
        0,
        ClassChgMenuItem_OnChange,
        0
    },
    {0}
};

CONST_DATA struct MenuDef gMenuDef_PromoSel = {
    .rect = { 16, 2, 8, 0 },
    .menuItems = gMenuItem_PromoSel,
    .onInit = (void(*)(struct MenuProc*)) ClassChgMenuSelOnInit,
    .onEnd = (void(*)(struct MenuProc*)) ClassChgMenuSelOnEnd,
    .onBPress = ClassChgMenuSelOnPressB,
};

CONST_DATA struct ProcCmd ProcScr_ClassChgMenuSel[] = {
    PROC_SLEEP(6),
	PROC_NAME("CCRamifyMenuSelect"),
    PROC_CALL(ClassChgMenuExec),
    PROC_REPEAT(nullsub_80CDDD4),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_GOTO(2),

PROC_LABEL(1),
    PROC_CALL(nullsub_61),

PROC_LABEL(2),
    PROC_END,
};

CONST_DATA struct MenuRect ClassChgMenuRect = {
    .x = 1,
    .y = 1,
    .w = 12,
    .h = 0
};

void ClassChgMenuExec(struct ProcClassChgMenuSel *proc)
{
    proc->unk4C = 0;
    ResetTextFont();
    ResetText();
    SetTextFontGlyphs(0);
    InitTextFont(&gFontClassChg, (void *)BG_VRAM + 0x1400, 160, 5);
    SetTextFont(&gFontClassChg);
    proc->pmenu = StartMenuCore(
		&gMenuDef_PromoSel,
		ClassChgMenuRect,
		2,
		0,
		0,
		0,
		(struct Proc *) proc);
}

void nullsub_80CDDD4(void)
{
    return;
}

void nullsub_61(void)
{
    return;
}

ProcPtr NewClassChgMenuSelect(ProcPtr parent)
{
	return Proc_Start(ProcScr_ClassChgMenuSel, parent);
}
