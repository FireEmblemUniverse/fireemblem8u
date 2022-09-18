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

/* convoymenu */
void HandleNewItemGetFromDrop(struct Unit* unit, int item, ProcPtr parent);
extern struct PopupInstruction gPopupInst[2];
extern struct Unit* gpPopupUnit;
extern u16 gPopupItem;
extern u32 gPopupNumber;
extern struct ProcCmd CONST_DATA sProcScr_PopupUpdateIcon[];
extern struct ProcCmd CONST_DATA sProcScr_Popup[];
extern struct ProcCmd CONST_DATA sProcScr_GotItem[];
extern struct PopupInstruction CONST_DATA gPopup_GotItem[];
extern struct PopupInstruction CONST_DATA gPopup_ItemWasPilfered[];
extern struct PopupInstruction CONST_DATA gUnknown_08592300[];
extern struct PopupInstruction CONST_DATA gUnknown_08592348[];
extern struct PopupInstruction CONST_DATA gUnknown_08592380[]; /* stole */
extern struct PopupInstruction CONST_DATA gUnknown_085923D8[];
extern struct PopupInstruction CONST_DATA gUnknown_08592420[]; /* wpn break */
extern struct PopupInstruction CONST_DATA gUnknown_08592468[]; // wRank increase
extern struct PopupInstruction CONST_DATA gUnknown_08592490[]; // change fraction

int GetSomeLongPopupLength(struct PopupProc *proc)
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

void GenSomeLongPopupText(const struct PopupInstruction *inst, struct TextHandle th)
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

void LongPopup_Init(struct PopupProc *proc)
{
    proc->xTileParam = -1;
    proc->yTileParam = -1;
    proc->textColorId = TEXT_COLOR_NORMAL;
    proc->iconId = -1;
    proc->iconX = 0;
    proc->soundId = 0;
}

void LongPopup_PrepareGfx(struct PopupProc *proc)
{
    Font_InitForUI(0, GetBackgroundTileDataOffset(0) +
                   BG_SCREEN_ADDR(4), 0x100, 0);
    ResetIconGraphics();
    LoadUiFrameGraphics();
    SetDefaultColorEffects();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    proc->xGfxSize = GetSomeLongPopupLength(proc);
}

void sub_80111F4(struct PopupProc *proc)
{
    if (0 != proc->soundId)
        ISuspectThisToBeMusicRelated_8002730(0x100, 0x80, 0x10, (ProcPtr)proc);
}

void LongPopup_PlaySound(struct PopupProc *proc)
{
    if (0 != proc->soundId) {
        PlaySoundEffect(proc->soundId);
    }
}

void sub_8011238(struct PopupProc *proc)
{
    if (0 != proc->soundId)
        ISuspectThisToBeMusicRelated_8002730(0x80, 0x100, 0x10, (ProcPtr)proc);
}

void IconOAMUpdater_Loop(struct PopupIconUpdateProc *proc)
{
    CallARM_PushToSecondaryOAM(proc->unk_2C, 
                               proc->unk_30, 
                               gObject_16x16, 
                               proc->unk_4A);
}

#if NONMATCHING

void LongPopup_Draw(struct PopupProc *proc)
{
    char *str[0x4];
    struct TextHandle th;

    register u16 tile_len;
    register s16 icon_pos;
    register s8 x_pos, y_pos;

    proc->xGfxSize = GetSomeLongPopupLength(proc);

    tile_len = proc->xGfxSize >> 0x3;
    if (0 != (proc->xGfxSize & 0x7)) tile_len++;
    icon_pos = (tile_len * 8 - proc->xGfxSize) / 2;

    x_pos = -1 == proc->xTileParam
          ? (0x1E - tile_len) / 2 - 1
          : proc->xTileParam;
    y_pos = -1 == proc->yTileParam
          ? proc->yTileParam
          : 8;

    DrawUiFrame2(x_pos, y_pos, tile_len, 4, proc->winStyle);

    proc->xTileReal = x_pos;
    proc->yTileReal = y_pos;
    proc->xTileSize = tile_len;
    proc->yTileSize = 3;
    proc->iconX += icon_pos;

    Text_Init(&th, tile_len);
    Text_SetColorId(&th, proc->textColorId);
    Text_SetXCursor(&th, icon_pos);
    GenSomeLongPopupText(proc->pDefinition, th);

    if (-1 != (s16)proc->iconId)
        LoadIconObjectGraphics(proc->iconId, proc->iconObjTileId);

    Text_Draw(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x_pos, y_pos));
    Font_InitForUIDefault();

    if (-1 != (s16)proc->iconId) {
        struct PopupIconUpdateProc* child =
                        Proc_Start(sProcScr_PopupUpdateIcon, proc);

        child->unk_2C = (proc->xTileReal + 1) * 8 + proc->iconX;
        child->unk_30 = (proc->yTileReal + 1) * 8;
        child->unk_4A = (proc->iconPalId & 0xF) << 0xC | proc->iconObjTileId;
    }
}

#else

__attribute__((naked))
void LongPopup_Draw(struct PopupProc *r0)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x10\n\
        adds r5, r0, #0\n\
        bl GetSomeLongPopupLength\n\
        adds r2, r5, #0\n\
        adds r2, #0x46\n\
        strh r0, [r2]\n\
        lsls r1, r0, #0x10\n\
        lsrs r6, r1, #0x13\n\
        movs r1, #7\n\
        ands r1, r0\n\
        cmp r1, #0\n\
        beq _08011296\n\
        adds r6, #1\n\
    _08011296:\n\
        lsls r0, r6, #3\n\
        ldrh r1, [r2]\n\
        subs r0, r0, r1\n\
        asrs r0, r0, #1\n\
        mov r9, r0\n\
        adds r2, r5, #0\n\
        adds r2, #0x34\n\
        movs r1, #0\n\
        ldrsb r1, [r2, r1]\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _080112BA\n\
        movs r0, #0x1e\n\
        subs r0, r0, r6\n\
        asrs r0, r0, #1\n\
        subs r7, r0, #1\n\
        b _080112BE\n\
    _080112BA:\n\
        movs r7, #0\n\
        ldrsb r7, [r2, r7]\n\
    _080112BE:\n\
        adds r2, r5, #0\n\
        adds r2, #0x35\n\
        movs r1, #0\n\
        ldrsb r1, [r2, r1]\n\
        movs r0, #1\n\
        negs r0, r0\n\
        movs r3, #8\n\
        mov r8, r3\n\
        cmp r1, r0\n\
        beq _080112D6\n\
        adds r2, r1, #0\n\
        mov r8, r2\n\
    _080112D6:\n\
        adds r4, r6, #2\n\
        adds r0, r5, #0\n\
        adds r0, #0x36\n\
        ldrb r0, [r0]\n\
        str r0, [sp]\n\
        adds r0, r7, #0\n\
        mov r1, r8\n\
        adds r2, r4, #0\n\
        movs r3, #4\n\
        bl DrawUiFrame2\n\
        movs r0, #0x37\n\
        adds r0, r0, r5\n\
        mov sl, r0\n\
        strb r7, [r0]\n\
        adds r1, r5, #0\n\
        adds r1, #0x38\n\
        str r1, [sp, #0xc]\n\
        mov r2, r8\n\
        strb r2, [r1]\n\
        adds r0, r5, #0\n\
        adds r0, #0x39\n\
        strb r4, [r0]\n\
        adds r1, #2\n\
        movs r0, #3\n\
        strb r0, [r1]\n\
        adds r4, r5, #0\n\
        adds r4, #0x44\n\
        ldrb r0, [r4]\n\
        add r0, r9\n\
        strb r0, [r4]\n\
        add r0, sp, #4\n\
        adds r1, r6, #0\n\
        bl Text_Init\n\
        adds r0, r5, #0\n\
        adds r0, #0x3b\n\
        ldrb r1, [r0]\n\
        add r0, sp, #4\n\
        bl Text_SetColorId\n\
        add r0, sp, #4\n\
        mov r1, r9\n\
        bl Text_SetXCursor\n\
        ldr r0, [r5, #0x2c]\n\
        ldr r1, [sp, #4]\n\
        ldr r2, [sp, #8]\n\
        bl GenSomeLongPopupText\n\
        ldrh r0, [r5, #0x3e]\n\
        ldr r6, _080113B4  @ 0x0000FFFF\n\
        cmp r0, r6\n\
        beq _0801134C\n\
        adds r1, r5, #0\n\
        adds r1, #0x40\n\
        ldrh r1, [r1]\n\
        bl LoadIconObjectGraphics\n\
    _0801134C:\n\
        mov r1, r8\n\
        adds r1, #1\n\
        lsls r1, r1, #5\n\
        adds r1, #1\n\
        adds r1, r1, r7\n\
        lsls r1, r1, #1\n\
        ldr r0, _080113B8  @ gBG0TilemapBuffer\n\
        adds r1, r1, r0\n\
        add r0, sp, #4\n\
        bl Text_Draw\n\
        bl Font_InitForUIDefault\n\
        ldrh r0, [r5, #0x3e]\n\
        cmp r0, r6\n\
        beq _080113A4\n\
        ldr r0, _080113BC  @ sProcScr_PopupUpdateIcon\n\
        adds r1, r5, #0\n\
        bl Proc_Start\n\
        mov r3, sl\n\
        ldrb r1, [r3]\n\
        adds r1, #1\n\
        lsls r1, r1, #3\n\
        ldrb r4, [r4]\n\
        adds r1, r1, r4\n\
        str r1, [r0, #0x2c]\n\
        ldr r2, [sp, #0xc]\n\
        ldrb r1, [r2]\n\
        adds r1, #1\n\
        lsls r1, r1, #3\n\
        str r1, [r0, #0x30]\n\
        adds r3, r5, #0\n\
        adds r3, #0x40\n\
        adds r1, r5, #0\n\
        adds r1, #0x42\n\
        ldrb r2, [r1]\n\
        movs r1, #0xf\n\
        ands r1, r2\n\
        lsls r1, r1, #0xc\n\
        ldrh r2, [r3]\n\
        orrs r1, r2\n\
        adds r0, #0x4a\n\
        strh r1, [r0]\n\
    _080113A4:\n\
        add sp, #0x10\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080113B4: .4byte 0x0000FFFF\n\
    _080113B8: .4byte gBG0TilemapBuffer\n\
    _080113BC: .4byte sProcScr_PopupUpdateIcon\n\
        .syntax divided\n\
    ");
}

#endif /* NONMATCHING */

void LongPopup_WaitForPress(struct PopupProc *proc)
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

void LongPopup_Clear(struct PopupProc *proc)
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

ProcPtr NewPopupSimple(const struct PopupInstruction *inst,
                    int clock,
                    int winStyle,
                    ProcPtr parent)
{
    return NewPopup(inst, clock, winStyle, 0x240, 4, parent);
}

ProcPtr NewPopup(const struct PopupInstruction *inst,
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

void NewGotItemPopup(struct Unit* unit, u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(unit))
        NewPopupSimple(gPopup_GotItem, 0x60, 0x0, parent);
    else
        NewPopupSimple(gPopup_ItemWasPilfered, 0x60, 0x0, parent);
}

void ItemGot_DisplayLePopup(struct GotItemPopupProc *proc)
{
    NewGotItemPopup(proc->unit, proc->item, proc);
}

void ItemGot_GotLeItem(struct GotItemPopupProc *proc)
{
    HandleNewItemGetFromDrop(proc->unit, MakeNewItem(proc->item), proc);
}

void NewItemGot(ProcPtr parent, struct Unit *unit, u16 item)
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

void NewGeneralItemGot(struct Unit *unit, u16 item, ProcPtr parent)
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
        NewGoldGotPopup(parent, unit, GetItemCost(item));
        break;

    default:
        NewItemGot(parent, unit, item);
        break;
    } /* switch item index */
}

void sub_80115DC(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopupSimple(gUnknown_08592300, 0x60, 0x0, parent);
    else
        NewPopupSimple(gUnknown_08592348, 0x60, 0x0, parent);
}

void sub_8011624(u32 num, ProcPtr parent)  /* unused */
{
    SetPopupNumber(num);
    NewPopupSimple(gUnknown_08592300, 0x60, 0x0, parent);
}

void NewGoldGotPopup(ProcPtr parent, struct Unit *unit, int value)
{
    SetPopupNumber(value);

    if (FACTION_BLUE == UNIT_FACTION(unit)) {
        value += GetPartyGoldAmount();
        SetPartyGoldAmount(value);
        NewPopupSimple(gUnknown_08592300, 0x60, 0x0, parent);
    } else
        NewPopupSimple(gUnknown_08592348, 0x60, 0x0, parent);
}

void CreatedItemStealingPopUp(u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopupSimple(gUnknown_08592380, 0x60, 0x0, parent);
    else
        NewPopupSimple(gUnknown_085923D8, 0x60, 0x0, parent);
}

void NewPopup_WeaponBroke(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopupSimple(gUnknown_08592420, 0x60, 0x0, parent);
}

void NewPopup_WRankIncrease(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopupSimple(gUnknown_08592468, 0x60, 0x0, parent);
}

/* maybe change uniy fraction to ally */
void sub_8011728(ProcPtr parent, u8 char_id)
{
    SetPopupUnit(GetUnitFromCharId(char_id));
    NewPopupSimple(gUnknown_08592490, 0x60, 0x0, parent);
}

