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

extern struct Unit* gpPopupUnit;
extern u16 gPopupItem;
extern u32 gPopupNumber;
extern struct ProcCmd CONST_DATA gUnknown_08592228[];

int GetSomeLongPopupLength(struct PopupProc *proc)
{
    char str[0x10];
    int len = 0;
    const struct PopupInstruction *inst;

    for (inst = proc->pDefinition; POPUP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case POPUP_SOUND:
            proc->soundId = inst->data;
            break;
        
        case POPUP_NUM:
            len += String_FromNumber(gPopupNumber, str) * 8;
            break;

        case POPUP_ITEM_ICON:
            proc->iconX = len;
            proc->iconId = GetItemIconId(gPopupItem);
            LoadIconPalette(0, proc->iconPalId);
            len += 0x10;
            break;

        case POPUP_WTYPE_ICON:
            proc->iconX = len;
            proc->iconId = gPopupItem + 0x70;
            LoadIconPalette(1, proc->iconPalId);
            len += 0x10;
            break;

        case POPUP_MSG:
            len += GetStringTextWidth(
                GetStringFromIndex(inst->data));
            break;

        case POPUP_STR:
            len += GetStringTextWidth((char*)inst->data);
            break;

        case POPUP_UNIT_NAME:
            len += GetStringTextWidth(
                GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_ITEM_NAME:
            len += GetStringTextWidth(
                GetItemName(gPopupItem));
            break;

        case POPUP_ITEM_STR_CAP:
            len += GetStringTextWidth(
                GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_ITEM_STR:
            len += GetStringTextWidth(
                GetItemNameWithArticle(gPopupItem, 0));
            break;

        case POPUP_SPACE:
            len += inst->data;
            break;

        case POPUP_COLOR:
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

    for ( ;POPUP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case POPUP_NUM:
            String_FromNumber(gPopupNumber, str);
            Text_AppendString(&text, str);
            break;

        case POPUP_WTYPE_ICON:
        case POPUP_ITEM_ICON:
            Text_Advance(&text, 0x10);
            break;

        case POPUP_COLOR:
            Text_SetColorId(&text, inst->data);
            break;

        case POPUP_MSG:
            Text_AppendString(&text, GetStringFromIndex(inst->data));
            break;

        case POPUP_STR:
            Text_AppendString(&text, (char*)inst->data);
            break;

        case POPUP_UNIT_NAME:
            Text_AppendString(&text, GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_ITEM_NAME:
            Text_AppendString(&text, GetItemName(gPopupItem));
            break;

        case POPUP_ITEM_STR_CAP:
            Text_AppendString(&text, GetItemNameWithArticle(gPopupItem, 1));
            break;

        case POPUP_ITEM_STR:
            Text_AppendString(&text, GetItemNameWithArticle(gPopupItem, 0));
            break;

        case POPUP_SPACE:
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
