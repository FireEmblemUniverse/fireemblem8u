#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"

#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

/* convoymenu.s */
void HandleNewItemGetFromDrop(struct Unit* unit, int item, ProcPtr parent);

/* functions declearation */
void PopupProc_GfxClear(struct PopupProc *proc);
void PopupProc_Init(struct PopupProc *proc);
void PopupProc_PrepareGfx(struct PopupProc *proc);
void PopupProc_MaybeSetVolume(struct PopupProc *proc);
void PopupProc_PlaySound(struct PopupProc *proc);
void PopupProc_GfxDraw(struct PopupProc *proc);
void PopupProc_WaitForPress(struct PopupProc *proc);
void PopupProc_MaybeResetVolume(struct PopupProc *proc);
void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc *proc);
void ItemGot_DisplayLePopup(struct GotItemPopupProc *proc);
void ItemGot_GotLeItem(struct GotItemPopupProc *proc);

/* .section(.bss) */
static struct PopupInstruction gPopupInst[4];
static struct Unit* gpPopupUnit;
static u16 gPopupItem;
static u32 gPopupNumber;

/* .section(.data) */
struct ProcCmd CONST_DATA sProcScr_Popup[] = {
    PROC_SET_END_CB(PopupProc_GfxClear),
    PROC_CALL(PopupProc_Init),
    PROC_SLEEP(0xA),
    PROC_CALL(PopupProc_PrepareGfx),
    PROC_CALL(PopupProc_MaybeSetVolume),
    PROC_YIELD,
    PROC_CALL(PopupProc_PlaySound),
    PROC_CALL(PopupProc_GfxDraw),
    PROC_REPEAT(PopupProc_WaitForPress),
    PROC_CALL(PopupProc_MaybeResetVolume),
    PROC_YIELD,
    PROC_END
};

struct ProcCmd CONST_DATA sProcScr_PopupUpdateIcon[] = {
    PROC_REPEAT(PopupIconUpdateProc_Loop),
    /* no PROC_END ... ? */
};

struct PopupInstruction CONST_DATA gPopup_GotItem[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x008),                   /* Got */
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_ITEM_STR,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_SPACE(1),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_ItemWasPilfered[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x009),                   /* was pilfered.[.] */
    POPUP_END
};

struct ProcCmd CONST_DATA sProcScr_GotItem[] = {
    PROC_YIELD,
    PROC_CALL(ItemGot_DisplayLePopup),
    PROC_YIELD,
    PROC_CALL(ItemGot_GotLeItem),
    PROC_YIELD,
    PROC_END
};

struct PopupInstruction CONST_DATA gPopup_GotGold[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x005),                   /* Got */
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_NUM,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x006),                   /* gold.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_GoldWasStole[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_NUM,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x007),                   /* gold was stolen. */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_StoleItem[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x00A),                   /* Stole */
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_ITEM_STR,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_ItemStolen[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x00B),                   /* was stolen.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_WpnBroken[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x003),                   /* broke! */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_WRankUp[] = {
    POPUP_SOUND(0x5A),
    POPUP_MSG(0x001),                   /*  [.] */
    POPUP_WTYPE_ICON,
    POPUP_MSG(0x002),                   /* Weapon Level increased.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA gPopup_NewAlly[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_MSG(0x00E),                   /* You can now use */
    POPUP_COLOR(TEXT_COLOR_BLUE),
    POPUP_UNIT_NAME,
    POPUP_COLOR(TEXT_COLOR_NORMAL),
    POPUP_SPACE(1),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

int ParsePopupInstAndGetLen(struct PopupProc *proc)
{
    char str[0x10];
    int len = 0;
    const struct PopupInstruction *inst;

    for (inst = proc->pDefinition; POPUP_OP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case POPUP_OP_SOUND:
            proc->soundId = inst->data;
            break;
        
        case POPUP_OP_NUM:
            len += String_FromNumber(gPopupNumber, str) * 8;
            break;

        case POPUP_OP_ITEM_ICON:
            proc->iconX = len;
            proc->iconId = GetItemIconId(gPopupItem);
            LoadIconPalette(0, proc->iconPalId);
            len += 0x10;
            break;

        case POPUP_OP_WTYPE_ICON:
            proc->iconX = len;
            proc->iconId = gPopupItem + 0x70;
            LoadIconPalette(1, proc->iconPalId);
            len += 0x10;
            break;

        case POPUP_OP_MSG:
            len += GetStringTextWidth(
                GetStringFromIndex(inst->data));
            break;

        case POPUP_OP_STR:
            len += GetStringTextWidth((char*)inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            len += GetStringTextWidth(
                GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            len += GetStringTextWidth(
                GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            len += GetStringTextWidth(
                GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_OP_ITEM_STR:
            len += GetStringTextWidth(
                GetItemNameWithArticle(gPopupItem, 0));
            break;

        case POPUP_OP_SPACE:
            len += inst->data;
            break;

        case POPUP_OP_COLOR:
        default:
            break;
        } /* switch inst */
    } /* for inst */

    return len;
}

void GeneratePopupText(const struct PopupInstruction *inst, struct TextHandle th)
{
    char str[0x10];
    struct TextHandle text = th;

    for ( ;POPUP_OP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case POPUP_OP_NUM:
            String_FromNumber(gPopupNumber, str);
            Text_AppendString(&text, str);
            break;

        case POPUP_OP_WTYPE_ICON:
        case POPUP_OP_ITEM_ICON:
            Text_Advance(&text, 0x10);
            break;

        case POPUP_OP_COLOR:
            Text_SetColorId(&text, inst->data);
            break;

        case POPUP_OP_MSG:
            Text_AppendString(&text, GetStringFromIndex(inst->data));
            break;

        case POPUP_OP_STR:
            Text_AppendString(&text, (char*)inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            Text_AppendString(&text, GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            Text_AppendString(&text, GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            Text_AppendString(&text, GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_OP_ITEM_STR:
            Text_AppendString(&text, GetItemNameWithArticle(gPopupItem, 0));
            break;

        case POPUP_OP_SPACE:
            Text_Advance(&text, inst->data);

        default:
            break;
        } /* switch opcode */
    } /* while opcode */

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PopupProc_Init(struct PopupProc *proc)
{
    proc->xTileParam = -1;
    proc->yTileParam = -1;
    proc->textColorId = TEXT_COLOR_NORMAL;
    proc->iconId = -1;
    proc->iconX = 0;
    proc->soundId = 0;
}

void PopupProc_PrepareGfx(struct PopupProc *proc)
{
    Font_InitForUI(0, GetBackgroundTileDataOffset(0) +
                   BG_SCREEN_ADDR(4), 0x100, 0);
    ResetIconGraphics();
    LoadUiFrameGraphics();
    SetDefaultColorEffects();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    proc->xGfxSize = ParsePopupInstAndGetLen(proc);
}

void PopupProc_MaybeSetVolume(struct PopupProc *proc)
{
    if (0 != proc->soundId)
        ISuspectThisToBeMusicRelated_8002730(0x100, 0x80, 0x10, (ProcPtr)proc);
}

void PopupProc_PlaySound(struct PopupProc *proc)
{
    if (0 != proc->soundId) {
        PlaySoundEffect(proc->soundId);
    }
}

void PopupProc_MaybeResetVolume(struct PopupProc *proc)
{
    if (0 != proc->soundId)
        ISuspectThisToBeMusicRelated_8002730(0x80, 0x100, 0x10, (ProcPtr)proc);
}

void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc *proc)
{
    CallARM_PushToSecondaryOAM(proc->unk_2C, 
                               proc->unk_30, 
                               gObject_16x16, 
                               proc->unk_4A);
}

void PopupProc_GfxDraw(struct PopupProc *proc)
{
    struct TextHandle th;
    int icon_pos;
    int tile_len;
    int x_pos, y_pos;
    int temp;

    u32 len;

    len = ParsePopupInstAndGetLen(proc);
    proc->xGfxSize = len;
    tile_len = (len << 0x10) >> 0x13;

    if (0 != (len & 7))
        tile_len++;

    icon_pos = (tile_len * 8 - proc->xGfxSize) >> 1;

    if (-1 == proc->xTileParam)
        x_pos = ((0x1E - tile_len) >> 1) - 1;
    else
        x_pos = proc->xTileParam;


    if (-1 != proc->yTileParam)
        y_pos = proc->yTileParam;
    else
        y_pos = 8;

    temp = tile_len + 2;
    DrawUiFrame2(x_pos, y_pos, temp, 4, proc->winStyle);

    proc->xTileReal = x_pos;
    proc->yTileReal = y_pos;
    proc->xTileSize = temp;
    proc->yTileSize = 3;
    proc->iconX += icon_pos;

    Text_Init(&th, tile_len);
    Text_SetColorId(&th, proc->textColorId);
    Text_SetXCursor(&th, icon_pos);
    GeneratePopupText(proc->pDefinition, th);

    if (0xFFFF != proc->iconId)
        LoadIconObjectGraphics(proc->iconId, proc->iconObjTileId);

    Text_Draw(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x_pos + 1, y_pos + 1));
    Font_InitForUIDefault();

    if (0xFFFF != proc->iconId) {
        struct PopupIconUpdateProc *child =
            Proc_Start(sProcScr_PopupUpdateIcon, proc);

        child->unk_2C = (proc->xTileReal + 1) * 8 + proc->iconX;
        child->unk_30 = (proc->yTileReal + 1) * 8;
        child->unk_4A = proc->iconObjTileId | (proc->iconPalId & 0xf) << 0xC;
    }
}

void PopupProc_WaitForPress(struct PopupProc *proc)
{
    if (proc->clock < 0) {
        if (0 != gKeyStatusPtr->newKeys) {
            Proc_Break(proc);
            return;
        } 
    } else if (0 != proc->clock) {
        proc->clock--;
        if (0 == proc->clock)
            Proc_Break(proc);
    }
}

void PopupProc_GfxClear(struct PopupProc *proc)
{
    TileMap_FillRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, proc->xTileReal, proc->yTileReal),
        proc->xTileSize, proc->yTileSize, 0);

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer, proc->xTileReal, proc->yTileReal),
        proc->xTileSize, proc->yTileSize, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void SetPopupUnit(struct Unit* unit)
{
    gpPopupUnit = unit;
}

void SetPopupItem(u16 item)
{
    gPopupItem = item;
}

void SetPopupNumber(u32 num)
{
    gPopupNumber = num;
}

ProcPtr NewPopup_Simple(const struct PopupInstruction *inst,
                    int clock,
                    int winStyle,
                    ProcPtr parent)
{
    return NewPopupCore(inst, clock, winStyle, 0x240, 4, parent);
}

ProcPtr NewPopupCore(const struct PopupInstruction *inst,
                           int clock,
                           int winStyle,
                           int iconObjTileId,
                           int pal_base, /* proc->iconPalId - 0x10 */
                           ProcPtr parent)
{
    struct PopupProc *proc;

    proc = (0 != parent)
         ? Proc_StartBlocking(sProcScr_Popup, parent)
         : Proc_Start(sProcScr_Popup, PROC_TREE_3);

    proc->clock = clock;
    proc->pDefinition = inst;
    proc->winStyle = winStyle;
    proc->iconObjTileId = iconObjTileId;
    proc->iconPalId = pal_base + 0x10;

    return proc;
}

void NewPopup_ItemGot_unused(struct Unit* unit, u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(unit))
        NewPopup_Simple(gPopup_GotItem, 0x60, 0x0, parent);
    else
        NewPopup_Simple(gPopup_ItemWasPilfered, 0x60, 0x0, parent);
}

void ItemGot_DisplayLePopup(struct GotItemPopupProc *proc)
{
    NewPopup_ItemGot_unused(proc->unit, proc->item, proc);
}

void ItemGot_GotLeItem(struct GotItemPopupProc *proc)
{
    HandleNewItemGetFromDrop(proc->unit, MakeNewItem(proc->item), proc);
}

void NewPopup_ItemGot(ProcPtr parent, struct Unit *unit, u16 item)
{
    struct GotItemPopupProc *proc;

    proc = (PROC_IS_ROOT(parent))
         ? Proc_Start(sProcScr_GotItem, parent)
         : Proc_StartBlocking(sProcScr_GotItem, parent);

    proc->item = item;
    proc->unit = unit;

    if (FACTION_RED == UNIT_FACTION(unit))
        unit->state |= US_DROP_ITEM;
}

void NewPopup_GeneralItemGot(struct Unit *unit, u16 item, ProcPtr parent)
{
    switch (ITEM_INDEX(item)) {
    case ITEM_1G:
    case ITEM_5G:
    case ITEM_10G:
    case ITEM_50G:
    case ITEM_100G:
    case ITEM_3000G:
    case ITEM_5000G:
    case ITEM_150G:
    case ITEM_200G:
        NewPopup_GoldGot(parent, unit, GetItemCost(item));
        break;

    default:
        NewPopup_ItemGot(parent, unit, item);
        break;
    } /* switch item index */
}

void NewGoldNumPopup_unused(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopup_Simple(gPopup_GotGold, 0x60, 0x0, parent);
    else
        NewPopup_Simple(gPopup_GoldWasStole, 0x60, 0x0, parent);
}

void NewNumberPopup_unused(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);
    NewPopup_Simple(gPopup_GotGold, 0x60, 0x0, parent);
}

void NewPopup_GoldGot(ProcPtr parent, struct Unit *unit, int value)
{
    SetPopupNumber(value);

    if (FACTION_BLUE == UNIT_FACTION(unit)) {
        value += GetPartyGoldAmount();
        SetPartyGoldAmount(value);
        NewPopup_Simple(gPopup_GotGold, 0x60, 0x0, parent);
    } else
        NewPopup_Simple(gPopup_GoldWasStole, 0x60, 0x0, parent);
}

void NewPopup_ItemStealing(u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopup_Simple(gPopup_StoleItem, 0x60, 0x0, parent);
    else
        NewPopup_Simple(gPopup_ItemStolen, 0x60, 0x0, parent);
}

void NewPopup_WeaponBroke(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(gPopup_WpnBroken, 0x60, 0x0, parent);
}

void NewPopup_WRankIncrease(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(gPopup_WRankUp, 0x60, 0x0, parent);
}

/* maybe change uniy fraction to ally */
void NewPopup_NewAlly(ProcPtr parent, u8 char_id)
{
    SetPopupUnit(GetUnitFromCharId(char_id));
    NewPopup_Simple(gPopup_NewAlly, 0x60, 0x0, parent);
}

void NewPopup_VerySimple(u32 msg, u32 sound_index, ProcPtr parent)
{
    gPopupInst[0].opcode = POPUP_OP_SOUND;
    gPopupInst[0].data   = sound_index;

    gPopupInst[1].opcode = POPUP_OP_COLOR;
    gPopupInst[1].data   = TEXT_COLOR_NORMAL;

    gPopupInst[2].opcode = POPUP_OP_MSG;
    gPopupInst[2].data   = msg;

    gPopupInst[3].opcode = POPUP_OP_END;
    gPopupInst[3].data   = 0;

    NewPopup_Simple(gPopupInst, 0x60, 0x0, parent);
}
