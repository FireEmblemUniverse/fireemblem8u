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
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

/* .section(.bss) */
static struct PopupInstruction gPopupInst[4];
static struct Unit * gpPopupUnit;
static u16 gPopupItem;
static u32 gPopupNumber;

/* .section(.data) */
struct ProcCmd CONST_DATA ProcScr_Popup[] = {
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

struct ProcCmd CONST_DATA ProcScr_PopupUpdateIcon[] = {
    PROC_REPEAT(PopupIconUpdateProc_Loop),
    /* no PROC_END ... ? */
};

struct PopupInstruction CONST_DATA PopupScr_GotItem[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x008),                   /* Got */
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_STR,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_SPACE(1),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_ItemWasPilfered[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x009),                   /* was pilfered.[.] */
    POPUP_END
};

struct ProcCmd CONST_DATA ProcScr_GotItem[] = {
    PROC_YIELD,
    PROC_CALL(ItemGot_DisplayLePopup),
    PROC_YIELD,
    PROC_CALL(ItemGot_GotLeItem),
    PROC_YIELD,
    PROC_END
};

struct PopupInstruction CONST_DATA PopupScr_GotGold[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x005),                   /* Got */
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_NUM,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x006),                   /* gold.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_GoldWasStole[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_NUM,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x007),                   /* gold was stolen. */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_StoleItem[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x00A),                   /* Stole */
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_STR,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_ItemStolen[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x00B),                   /* was stolen.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_WpnBroken[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_STR_CAP,
    POPUP_SPACE(1),
    POPUP_ITEM_ICON,
    POPUP_SPACE(1),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x003),                   /* broke! */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_WRankUp[] = {
    POPUP_SOUND(0x5A),
    POPUP_MSG(0x001),                   /*  [.] */
    POPUP_WTYPE_ICON,
    POPUP_MSG(0x002),                   /* Weapon Level increased.[.] */
    POPUP_END
};

struct PopupInstruction CONST_DATA PopupScr_NewAlly[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x00E),                   /* You can now use */
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_UNIT_NAME,
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_SPACE(1),
    POPUP_MSG(0x022),                   /* .[.] */
    POPUP_END
};

int ParsePopupInstAndGetLen(struct PopupProc * proc)
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
            len += NumberToStringAscii(gPopupNumber, str) * 8;
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
            len += GetStringTextLen(
                GetStringFromIndex(inst->data));
            break;

        case POPUP_OP_STR:
            len += GetStringTextLen((char*)inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            len += GetStringTextLen(
                GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            len += GetStringTextLen(
                GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            len += GetStringTextLen(
                GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_OP_ITEM_STR:
            len += GetStringTextLen(
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

void GeneratePopupText(const struct PopupInstruction *inst, struct Text th)
{
    char str[0x10];
    struct Text text = th;

    for ( ;POPUP_OP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case POPUP_OP_NUM:
            NumberToStringAscii(gPopupNumber, str);
            Text_DrawString(&text, str);
            break;

        case POPUP_OP_WTYPE_ICON:
        case POPUP_OP_ITEM_ICON:
            Text_Skip(&text, 0x10);
            break;

        case POPUP_OP_COLOR:
            Text_SetColor(&text, inst->data);
            break;

        case POPUP_OP_MSG:
            Text_DrawString(&text, GetStringFromIndex(inst->data));
            break;

        case POPUP_OP_STR:
            Text_DrawString(&text, (char*)inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            Text_DrawString(&text, GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            Text_DrawString(&text, GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_OP_ITEM_STR:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, 0));
            break;

        case POPUP_OP_SPACE:
            Text_Skip(&text, inst->data);

        default:
            break;
        } /* switch opcode */
    } /* while opcode */

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PopupProc_Init(struct PopupProc * proc)
{
    proc->xTileParam = -1;
    proc->yTileParam = -1;
    proc->textColorId = TEXT_COLOR_SYSTEM_WHITE;
    proc->iconId = -1;
    proc->iconX = 0;
    proc->soundId = 0;
}

void PopupProc_PrepareGfx(struct PopupProc * proc)
{
    InitTextFont(0, GetBackgroundTileDataOffset(0) +
                   BG_SCREEN_ADDR(4), 0x100, 0);
    ResetIconGraphics();
    LoadUiFrameGraphics();
    SetDefaultColorEffects();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    proc->xGfxSize = ParsePopupInstAndGetLen(proc);
}

void PopupProc_MaybeSetVolume(struct PopupProc * proc)
{
    if (0 != proc->soundId)
        StartBgmVolumeChange(0x100, 0x80, 0x10, (ProcPtr)proc);
}

void PopupProc_PlaySound(struct PopupProc * proc)
{
    if (0 != proc->soundId) {
        PlaySoundEffect(proc->soundId);
    }
}

void PopupProc_MaybeResetVolume(struct PopupProc * proc)
{
    if (0 != proc->soundId)
        StartBgmVolumeChange(0x80, 0x100, 0x10, (ProcPtr)proc);
}

void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc * proc)
{
    CallARM_PushToSecondaryOAM(proc->unk_2C, 
                               proc->unk_30, 
                               gObject_16x16, 
                               proc->unk_4A);
}

void PopupProc_GfxDraw(struct PopupProc * proc)
{
    struct Text th;
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

    InitText(&th, tile_len);
    Text_SetColor(&th, proc->textColorId);
    Text_SetCursor(&th, icon_pos);
    GeneratePopupText(proc->pDefinition, th);

    if (0xFFFF != proc->iconId)
        LoadIconObjectGraphics(proc->iconId, proc->iconObjTileId);

    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x_pos + 1, y_pos + 1));
    ResetText();

    if (0xFFFF != proc->iconId) {
        struct PopupIconUpdateProc *child =
            Proc_Start(ProcScr_PopupUpdateIcon, proc);

        child->unk_2C = (proc->xTileReal + 1) * 8 + proc->iconX;
        child->unk_30 = (proc->yTileReal + 1) * 8;
        child->unk_4A = proc->iconObjTileId | (proc->iconPalId & 0xf) << 0xC;
    }
}

void PopupProc_WaitForPress(struct PopupProc * proc)
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

void PopupProc_GfxClear(struct PopupProc * proc)
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
    struct PopupProc * proc;

    proc = (0 != parent)
         ? Proc_StartBlocking(ProcScr_Popup, parent)
         : Proc_Start(ProcScr_Popup, PROC_TREE_3);

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
        NewPopup_Simple(PopupScr_GotItem, 0x60, 0x0, parent);
    else
        NewPopup_Simple(PopupScr_ItemWasPilfered, 0x60, 0x0, parent);
}

void ItemGot_DisplayLePopup(struct GotItemPopupProc * proc)
{
    NewPopup_ItemGot_unused(proc->unit, proc->item, proc);
}

void ItemGot_GotLeItem(struct GotItemPopupProc * proc)
{
    HandleNewItemGetFromDrop(proc->unit, MakeNewItem(proc->item), proc);
}

void NewPopup_ItemGot(ProcPtr parent, struct Unit *unit, u16 item)
{
    struct GotItemPopupProc * proc;

    proc = (PROC_IS_ROOT(parent))
         ? Proc_Start(ProcScr_GotItem, parent)
         : Proc_StartBlocking(ProcScr_GotItem, parent);

    proc->item = item;
    proc->unit = unit;

    if (FACTION_RED == UNIT_FACTION(unit))
        unit->state |= US_DROP_ITEM;
}

void NewPopup_GeneralItemGot(struct Unit *unit, int item, ProcPtr parent)
{
    u16 _item = item;
    switch (ITEM_INDEX(_item)) {
    case ITEM_1G:
    case ITEM_5G:
    case ITEM_10G:
    case ITEM_50G:
    case ITEM_100G:
    case ITEM_3000G:
    case ITEM_5000G:
    case ITEM_150G:
    case ITEM_200G:
        NewPopup_GoldGot(parent, unit, GetItemCost(_item));
        break;

    default:
        NewPopup_ItemGot(parent, unit, _item);
        break;
    } /* switch item index */
}

void NewGoldNumPopup_unused(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopup_Simple(PopupScr_GotGold, 0x60, 0x0, parent);
    else
        NewPopup_Simple(PopupScr_GoldWasStole, 0x60, 0x0, parent);
}

void NewNumberPopup_unused(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);
    NewPopup_Simple(PopupScr_GotGold, 0x60, 0x0, parent);
}

void NewPopup_GoldGot(ProcPtr parent, struct Unit *unit, int value)
{
    SetPopupNumber(value);

    if (FACTION_BLUE == UNIT_FACTION(unit)) {
        value += GetPartyGoldAmount();
        SetPartyGoldAmount(value);
        NewPopup_Simple(PopupScr_GotGold, 0x60, 0x0, parent);
    } else
        NewPopup_Simple(PopupScr_GoldWasStole, 0x60, 0x0, parent);
}

void NewPopup_ItemStealing(u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopup_Simple(PopupScr_StoleItem, 0x60, 0x0, parent);
    else
        NewPopup_Simple(PopupScr_ItemStolen, 0x60, 0x0, parent);
}

void NewPopup_WeaponBroke(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(PopupScr_WpnBroken, 0x60, 0x0, parent);
}

void NewPopup_WRankIncrease(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(PopupScr_WRankUp, 0x60, 0x0, parent);
}

/* maybe change uniy fraction to ally */
void NewPopup_NewAlly(ProcPtr parent, u8 char_id)
{
    SetPopupUnit(GetUnitFromCharId(char_id));
    NewPopup_Simple(PopupScr_NewAlly, 0x60, 0x0, parent);
}

void NewPopup_VerySimple(u32 msg, u32 sound_index, ProcPtr parent)
{
    gPopupInst[0].opcode = POPUP_OP_SOUND;
    gPopupInst[0].data   = sound_index;

    gPopupInst[1].opcode = POPUP_OP_COLOR;
    gPopupInst[1].data   = TEXT_COLOR_SYSTEM_WHITE;

    gPopupInst[2].opcode = POPUP_OP_MSG;
    gPopupInst[2].data   = msg;

    gPopupInst[3].opcode = POPUP_OP_END;
    gPopupInst[3].data   = 0;

    NewPopup_Simple(gPopupInst, 0x60, 0x0, parent);
}

void BrownTextBox_Loop(struct BrownTextBoxProc * proc)
{
    int i;

    int oam2A = (((proc->chr + 0x400) & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL((proc->pal + 1));
    int oam2B = ((proc->chr & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL(proc->pal);

    PutSpriteExt(4, proc->x, proc->y + proc->oam0Attr, gObject_16x8, oam2B);
    PutSpriteExt(4, proc->x + (proc->width - 2) * 8, proc->y + proc->oam0Attr, gObject_16x8, oam2B + 4);
    PutSpriteExt(4, proc->x, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 0xd);
    PutSpriteExt(
        4, proc->x + (proc->width - 2) * 8, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 0x11);

    PutSpriteExt(4, proc->x, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 6);
    PutSpriteExt(4, proc->x, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 11);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 10);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 12);

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, gObject_16x8, oam2B + 2);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, gObject_8x8, oam2B + 2);
    }

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 15);
    }

    for (i = 1; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, gObject_16x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, gObject_16x8, oam2B + 8);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 8);
    }

    for (i = 0; i < 3; i++)
    {
        PutSpriteExt(0, proc->x + 8 + (i * 32), proc->y + 8 + proc->oam0Attr, gObject_32x16, oam2A + i * 4);
    }
}

//! FE8U = 0x08011A18
void nullsub_44(void)
{
    return;
}

struct ProcCmd CONST_DATA ProcScr_BrownTextBox[] =
{
    PROC_YIELD,
    PROC_SET_END_CB(nullsub_44),

    PROC_REPEAT(BrownTextBox_Loop),

    PROC_END,
};

void sub_8011A1C(struct BrownTextBoxProc * proc, s8 doBlend)
{
    if (!proc)
    {
        return;
    }

    if (doBlend)
    {
        proc->oam0Attr = OAM0_BLEND;
    }
    else
    {
        proc->oam0Attr = 0;
    }
}

void sub_8011A48(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    sub_8011A1C(Proc_Find(ProcScr_BrownTextBox), 1);
}

void sub_8011AA0(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(blendVal, 0x10 - blendVal);

    if (blendVal == 0x10)
    {
        Proc_Break(proc);
        SetBlendNone();

        sub_8011A1C(Proc_Find(ProcScr_BrownTextBox), 0);
    }
}

struct ProcCmd CONST_DATA gProcScr_085924F8[] =
{
    PROC_CALL(sub_8011A48),
    PROC_REPEAT(sub_8011AA0),

    PROC_END,
};

void sub_8011AF4(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    sub_8011A1C(Proc_Find(ProcScr_BrownTextBox), 1);
}

void sub_8011B4C(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(0x10 - blendVal, blendVal);

    if (blendVal == 0x10)
    {
        Proc_End(Proc_Find(ProcScr_BrownTextBox));
        Proc_Break(proc);
    }
}

void sub_8011B90(void)
{
    SetBlendNone();
}

struct ProcCmd CONST_DATA gProcScr_08592510[] =
{
    PROC_CALL(sub_8011AF4),
    PROC_REPEAT(sub_8011B4C),

    PROC_CALL(sub_8011B90),

    PROC_END,
};

void StartBrownTextBoxCore(int x, int y, int textId, int chr, int pal, ProcPtr parent)
{
    struct Font font;
    struct Text text;

    int r6 = 0;
    int r4;

    struct BrownTextBoxProc * proc = Proc_Start(ProcScr_BrownTextBox, parent);
    const char * str = GetStringFromIndex(textId);

    proc->x = x;
    proc->y = y;
    proc->chr = chr;
    proc->pal = pal;
    proc->textId = textId;
    proc->oam0Attr = 0;

    ApplyPalette(gPal_BrownTextBox, (proc->pal + 0x10));
    ApplyPalette(Pal_Text, (proc->pal + 0x11));
    Decompress(gGfx_BrownTextBox, (void *)(0x06010000 + proc->chr));

    r6 = GetStringTextLen(str);

    r4 = r6 / 8;
    r6 = r4 + 5;

    proc->width = r6;

    InitSpriteTextFont(&font, (void *)(proc->chr + 0x06010400), proc->pal + 0x12);
    SetTextFont(&font);
    InitSpriteText(&text);
    SpriteText_DrawBackgroundExt(&text, 0);
    SetTextFontGlyphs(0);

    Text_InsertDrawString(&text, GetStringTextCenteredPos((r4 + 3) * 8, str), 0, str);

    SetTextFont(NULL);
}

struct ProcCmd CONST_DATA ProcScr_08592530[] = {
    PROC_CALL(sub_8011A48),
    PROC_REPEAT(sub_8011AA0),

    PROC_SLEEP(100),

    PROC_CALL(sub_8011AF4),
    PROC_REPEAT(sub_8011B4C),

    PROC_CALL(sub_8011B90),

    PROC_END,
};

void StartBrownTextBox(int textId, s16 x, s16 y, ProcPtr parent)
{
    StartBrownTextBoxCore(x, y, textId, 0x5000, 9, parent);
    Proc_StartBlocking(ProcScr_08592530, parent);
}
