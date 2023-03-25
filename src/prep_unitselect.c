#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"

#include "prepscreen.h"

s8 CheckSomethingSomewhere();
extern struct TextHandle gPrepUnitTexts[];

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line)
{
    int i, color, itext, ilist, _line;
    u32 val;
    struct Unit * unit;

    /**
     * It use 14 TextHandles to store 6 line of 12 Units;
     */

    i = 0;
    val = line * 2;
    _line = line % 7;

    for (; i < 2; i++) {
        itext = val + i;

        if (itext >= PrepGetUnitAmount())
            continue;

        unit = GetUnitFromPrepList(itext);

        color = TEXT_COLOR_NORMAL;
        if (!CheckSomethingSomewhere() && IsCharacterForceDeployed(unit->pCharacterData->number))
            color = TEXT_COLOR_GREEN;
        else if (unit->state & US_NOT_DEPLOYED)
            color = TEXT_COLOR_GRAY;

        ilist = _line * 2 + i;

        Text_Clear(&gPrepUnitTexts[ilist]);

        DrawTextInline(
            &gPrepUnitTexts[ilist],
            TILEMAP_LOCATED( gBG2TilemapBuffer, 0x10 + i * 7, val % 0x20),
            color,
            0, 0,
            GetStringFromIndex(unit->pCharacterData->nameTextId) );
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void PrepUpdateMenuTsaScroll(int val)
{
    u32 _val = val * 2;
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 0x10, _val % 0x20), 0xD, 1, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc)
{
    int i;
    for (i = 0; i < PrepGetUnitAmount(); i++) {
        u32 yOff = ((i >> 1) << 4) - proc->yDiff_cur;
        if((yOff + 0xF) < 0x60 )
            PutUnitSprite(0, (i & 1) * 56 + 0x70, yOff + 0x18,
                        GetUnitFromPrepList(i));
    }

    if (proc->yDiff_cur & 0xF) {
        SetWinEnable(1, 1, 0);
        SetWin0Box(0, 0, 0xF0, 0x1A);
        SetWin1Box(0, 0x78, 0xF0, 0xA0);
        SetWin0Layers(1, 1, 0, 1, 0);
        SetWin1Layers(1, 1, 0, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 1);
    } else {
        SetWinEnable(0, 0, 0);
    }

    if (proc->button_blank)
        proc->button_blank++;

    /* Chapter goal */
    for (i = 0; i < 3; i++)
        PutSpriteExt(4, 4 + i * 0x20, 0x81, gObject_32x16, 0x8700 + 4 * i);

    /* "Start" button */
    if (0 == ((proc->button_blank >> 2) & 1) && proc->cur_counter) {
        if (CheckSomethingSomewhere())
            PutSpriteExt(4, 0x80, 0x82,obj_08A18E62, 0x40);
        else
            PutSpriteExt(4, 0x80, 0x82,obj_08A18E4E, 0x40);
    }

    /* "Select" button */
    PutSpriteExt(4, 0x80, 0x8F, obj_08A18E34, 0x40);

    SyncUnitSpriteSheet();
}

void PrepUnit_InitTexts()
{
    int i;

    Font_InitForUIDefault();

    /* 0x00 ~ 0x0D (size = 14): unit name */
    for (i = 0; i < 14; i++)
        Text_Init(&gPrepUnitTexts[i], 5);
    
    /* 0x0E ~ 0x12 (size = 5):  item name */
    for (i = 0; i < 5; i++)
        Text_Init(&gPrepUnitTexts[i + 0xE], 7);
    
    Text_Init(&gPrepUnitTexts[0x13], 7);
    Text_Init(&gPrepUnitTexts[0x14], 10);
    Text_Init(&gPrepUnitTexts[0x15], 12);
}

void PrepUnit_InitGfx()
{
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    LoadIconPalettes(BGPAL_ICONS);

    Prep_DrawChapterGoal(0x6000, 8);
    sub_80950E8(0x6000, 0xF);

    Decompress(gUnknown_08A1B730, (void*)0x06000440);
    Decompress(gUnknown_08A1B7C8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnknown_08A1D510, (void*)0x6010800);
    ApplyPalette(Pal_MapBattleInfoNum, 0x19);
    EnablePaletteSync();
}

void PrepUnit_InitSMS(struct ProcPrepUnit *proc)
{
    SetupMapSpritesPalettes();
    CpuFastFill(0, gUnknown_02022C08, 0x20);
    MakePrepUnitList();
    PrepAutoCapDeployUnits(proc->proc_parent);
    PrepUpdateSMS();
}

void PrepUnit_DrawLeftUnitName(struct Unit *unit)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 3), 6, 1, 0);
    PutFaceChibi(GetUnitPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 1), 0x270, 2, 0);
    Text_Clear(&gPrepUnitTexts[0x13]);
    DrawTextInline(
        &gPrepUnitTexts[0x13],
        TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 1),
        TEXT_COLOR_NORMAL,
        GetStringTextCenteredPos(0x38, GetStringFromIndex(unit->pCharacterData->nameTextId)),
        0,
        GetStringFromIndex(unit->pCharacterData->nameTextId)
    );

    sub_8004D5C(TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 3), 3, 0x24, 0x25);
    sub_8004B0C(TILEMAP_LOCATED(gBG0TilemapBuffer, 9, 3), 3, 0x1D);

    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 3), 2, unit->level);
    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 3), 2, unit->exp);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc)
{
    PrepUnit_DrawLeftUnitName(GetUnitFromPrepList(proc->list_num_cur));
}

void PrepUnit_DrawUnitItems(struct Unit *unit)
{
    int i, cnt;

    ResetIconGraphics_();
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 5), 0xB, 0xA, 0);

    cnt = GetUnitItemCount(unit);
    for (i = 0; i < cnt; i++) {
        int item = unit->items[i];

        DrawIcon(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 5 + 2 * i),
            GetItemIconId(item),
            TILEREF(0, BGPAL_ICONS)
        );

        Text_Clear(&gPrepUnitTexts[i + 0xE]);

        DrawTextInline(
            &gPrepUnitTexts[i + 0xE],
            TILEMAP_LOCATED( gBG0TilemapBuffer, 3, 5 + 2 * i),
            IsItemDisplayUsable(unit, item)
                ? TEXT_COLOR_NORMAL
                : TEXT_COLOR_GRAY,
            0, 0, GetItemName(item)
        );

        DrawDecNumber(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 5 + 2 * i),
            IsItemDisplayUsable(unit, item)
                ? TEXT_COLOR_BLUE
                : TEXT_COLOR_GRAY,
            GetItemUses(item)
        );

    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val)
{
    if (0 == val) {
        Text_Clear(&gPrepUnitTexts[0x15]);
        DrawTextInline(
            &gPrepUnitTexts[0x15],
            TILEMAP_LOCATED(gBG0TilemapBuffer, 0xD, 0x1),
            TEXT_COLOR_NORMAL,
            6, 0,
            GetStringFromIndex(0x5A1)   /* Pick */
        );

        DrawTextInline(
            &gPrepUnitTexts[0x15],
            TILEMAP_LOCATED(gBG0TilemapBuffer, 0xD, 0x1),
            TEXT_COLOR_NORMAL,
            0x29, 0,
            GetStringFromIndex(0x5A2)   /* Units Left */
        );
    }

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x10, 0x1), 1, 1, 0);
    DrawDecNumber(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x11, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_GRAY
            : TEXT_COLOR_BLUE,
        proc->max_counter - proc->cur_counter
    );

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x18, 0x1), 4, 1, 0);
    DrawDecNumber(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x19, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        proc->cur_counter
    );

    sub_8004B0C(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1A, 1), 0, 0x16);
    DrawDecNumber(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1C, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        proc->max_counter
    );

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

s8 PrepCheckCanSelectUnit(struct ProcPrepUnit *proc, struct Unit *unit)
{
    if (proc->max_counter > proc->cur_counter) {
        proc->cur_counter++;
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);
        Reset203E87C_WithVal(unit->pCharacterData->number);
        PlaySoundEffect(0x6A);
        PrepUnit_DrawUnitListNames(proc, proc->list_num_cur / 2);
        return 1;
    } else {
        PlaySoundEffect(0x6C);
        return 0;
    }
}

s8 PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit)
{
    if (!IsCharacterForceDeployed(unit->pCharacterData->number)) {
        proc->cur_counter--;
        unit->state |= US_UNSELECTABLE | US_NOT_DEPLOYED;
        Modify203E87C(unit->pCharacterData->number);
        PlaySoundEffect(0x6B);
        PrepUnit_DrawUnitListNames(proc, proc->list_num_cur / 2);
        return 1;
    } else {
        PlaySoundEffect(0x6C);
        return 0;
    }
}

s8 PrepUnit_HandlePressA(struct ProcPrepUnit *proc)
{
    struct Unit *unit = GetUnitFromPrepList(proc->list_num_cur);

    if (unit->state & US_BIT25) {
        u32 ilist = proc->list_num_cur;
        sub_8097DA8(
            (ilist & 1) * 56 + 0x70,
            (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
            0xC52,    /* This unit cannot take part[NL]in this chapter. */
            proc
        );
        return 0;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        if (CheckSomethingSomewhere() && !sub_8097E74(unit)) {
            u32 ilist = proc->list_num_cur;
            sub_8097DA8(
                (ilist & 1) * 56 + 0x70,
                (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
                0x88A,    /* This unit cannot be deployed.[.] */
                proc
            );
            return 0;
        }

        if (CheckSomethingSomewhere() && !sub_8097E38(unit)) {
            u32 ilist = proc->list_num_cur;
            sub_8097DA8(
                (ilist & 1) * 56 + 0x70,
                (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
                0x889,    /* his unit has no usable[.][NL]weapons, so it cannot join.[.] */
                proc
            );
            return 0;
        }

        if (PrepCheckCanSelectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;

    } else {
        if (PrepCheckCanUnselectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;
    }
}

s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc)
{
    int val1, val2, val3;

    val1 = proc->yDiff_cur / 16;
    if (val1 > 0 && proc->list_num_cur / 2 <= val1)
        return 1;

    val2 = val1 + 5;
    val3 = (PrepGetUnitAmount() - 1) >> 1;
    if (val2 < val3 && proc->list_num_cur / 2 >= val2)
        return 1;

    return 0;
}

void sub_809ADC8(struct ProcPrepUnit *proc)
{
    if (ShouldPrepUnitMenuScroll(proc)) {
        int lst = proc->list_num_cur / 2;
        int dif = proc->yDiff_cur / 16;
        int amt = (PrepGetUnitAmount() - 1) >> 1;

        if (lst <= dif) {
            if (lst == 0)
                proc->yDiff_cur = 0;
            else
                proc->yDiff_cur = (lst - 1) * 16;

            if (lst <= dif)
                return;
        }

        if (lst == amt)
            proc->yDiff_cur = (lst - 5) * 16;
        else
            proc->yDiff_cur = (lst - 4) * 16;
    }
}

void sub_809AE10(struct ProcPrepUnit *proc)
{
    int msk = 0;
    int dif = proc->yDiff_cur / 16;
    int amt = (PrepGetUnitAmount() - 1) >> 1;

    if (dif > 0)
        msk = 1;
    if ((dif + 5) < amt)
        msk |= 2;

    sub_80ACD60(msk);
}

void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc)
{
    struct ProcAtMenu *parent;
    MakePrepUnitList();
    proc->list_num_cur = UnitGetIndexInPrepList(PrepGetLatestCharId());
    proc->max_counter = ((struct ProcAtMenu *)(proc->proc_parent))->max_counter;
    proc->cur_counter = ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter;
    proc->yDiff_cur = ((struct ProcAtMenu *)(proc->proc_parent))->yDiff;
    proc->list_num_pre = proc->list_num_cur;
    proc->button_blank = 0;
}

void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc)
{
    int i;
    SetupBackgrounds(gUnknown_08A181E8);
    SetDispEnable(0, 0, 0, 0, 0);
    sub_809ADC8(proc);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
    BG_SetPosition(BG_3, 0, 0);

    PrepUnit_InitTexts();
    PrepUnit_InitGfx();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
    SetDefaultColorEffects();

    PrepUnit_InitSMS(proc);
    StartParallelWorker(PrepUnit_DrawSMSAndObjs, proc);
    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 0x1);
    ShowPrepScreenHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);

    PrepStartSideBarScroll(proc, 0xE0, 0x20, 0x200, 2);
    sub_80976CC(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
    StartHelpPromptSprite(0x20, 0x8F, 9, proc);
    PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
    PrepUnit_DrawLeftUnitName(GetUnitFromPrepList(proc->list_num_cur));

    for (i = 0; i < 6; i++)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 + i);

    PrepUnit_DrawPickLeftBar(proc, 0);
    NewGreenTextColorManager(proc);
    LoadDialogueBoxGfx(BG_SCREEN_ADDR(0x29), 5);
    EndSlidingWallEffectMaybe();
}

void sub_809B014()
{
    Delete6CMenuScroll();
    EndAllParallelWorkers();
	sub_80AD2D4();
	EndPrepScreenHandCursor();
	EndHelpPromptSprite();
	sub_80ACDDC();
	EndBG3Slider_();
}

void ProcPrepUnit_Idle(struct ProcPrepUnit *proc)
{
    int ret;

    if (proc->list_num_pre == proc->list_num_cur) {
        int key_pre = gKeyStatusPtr->repeatedKeys;

        proc->scroll_val = 4;
        if (L_BUTTON & gKeyStatusPtr->heldKeys) {
            key_pre = gKeyStatusPtr->heldKeys;
            proc->scroll_val = 8;
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys) {
            if (0 == proc->cur_counter) {
                PlaySoundEffect(0x6C);
            } else {
                PlaySoundEffect(0x6A);
                Proc_Goto(proc, PROC_LABEL_PREPUNIT_GAME_START);
            }
            return;
        }

        if (SELECT_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(0x6A);
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_SELECT);
            return;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_R);
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            ret = PrepUnit_HandlePressA(proc);
            if (ret)
                PrepUnit_DrawPickLeftBar(proc, 1);
            return;
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(0x6B);
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_B);
            return;
        }

        if (DPAD_LEFT & key_pre) {
            if (1 & proc->list_num_cur)
                proc->list_num_cur--;
        }

        if (DPAD_RIGHT & key_pre) {
            if (!(1 & proc->list_num_cur) && proc->list_num_cur < (PrepGetUnitAmount() - 1))
                proc->list_num_cur++;
        }

        if (DPAD_UP & key_pre) {
            if ((proc->list_num_cur - 2) >= 0)
                proc->list_num_cur -= 2;
        }

        if (DPAD_DOWN & key_pre) {
            if ((proc->list_num_cur + 2) <= (PrepGetUnitAmount() - 1))
                proc->list_num_cur += 2;
        }

        if (proc->list_num_pre == proc->list_num_cur)
            return;

        PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
        StartParallelFiniteLoop(PrepUnit_DrawLeftUnitNameCur, 1, (u32)proc);
        PlaySoundEffect(0x65);
    
        if (ShouldPrepUnitMenuScroll(proc)) {
            if (proc->list_num_cur < proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 - 1);
            if (proc->list_num_cur > proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 + 6);

            SetPrepScreenHandXPos((1 & proc->list_num_cur) * 56 + 0x70);
        } else {
            proc->list_num_pre = proc->list_num_cur;
            ShowPrepScreenHandCursor(
                (1 & proc->list_num_pre) * 56 + 0x70,
                (proc->list_num_pre >> 1) * 16 + 0x18 - proc->yDiff_cur,
                0x7, 0x800
            );
        }
    
        if (proc->list_num_pre == proc->list_num_cur)
            return;
    }

    if (proc->list_num_cur < proc->list_num_pre)
        proc->yDiff_cur -= proc->scroll_val;

    if (proc->list_num_cur > proc->list_num_pre)
        proc->yDiff_cur += proc->scroll_val;

    if (0 == proc->yDiff_cur % 0x10) {
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 - 1);
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 + 6);
        sub_809AE10(proc);
        proc->list_num_pre = proc->list_num_cur;
    }

    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
    sub_80976CC(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
}

void sub_809B2DC(struct ProcPrepUnit *proc)
{
    proc->unk34 += 4;
    proc->yDiff_cur += 4;

    if (proc->unk34 == 0x20)
        Proc_Break(proc);

    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);

    if (0 == proc->yDiff_cur % 0x10)
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 0x10 - 1);
}

void sub_809B324(struct ProcPrepUnit *proc)
{
    if (0 == proc->yDiff_cur % 0x10)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 - 1);

    proc->unk34 -= 4;
    proc->yDiff_cur -= 4;

    if (proc->unk34 <= 0)
        Proc_Break(proc);

    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
}

void nullsub_21()
{
    return;
}

void sub_809B370(struct ProcPrepUnit *proc)
{
    nullsub_21();
    ShowPrepScreenHandCursor(0xD0, 0x68, 0, 0x800);
}

void sub_809B388(struct ProcPrepUnit *proc)
{
    ShowPrepScreenHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);
}

void sub_809B3B4(struct ProcPrepUnit *proc)
{
    if (A_BUTTON & gKeyStatusPtr->newKeys)
        PlaySoundEffect(0x6C);

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys) {
        PlaySoundEffect(0x65);
        Proc_Break(proc);
    }
}

void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc)
{
    ((struct ProcAtMenu *)(proc->proc_parent))->yDiff = proc->yDiff_cur;
    ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter = proc->cur_counter;

    PrepSetLatestCharId(
        GetUnitFromPrepList(proc->list_num_cur)->pCharacterData->number);
    EndBG3Slider_();
}

void ProcPrepUnit_OnGameStart(struct ProcPrepUnit *proc)
{
    ((struct ProcAtMenu *)(proc->proc_parent))->end_prep = 1;
    Proc_Goto(proc->proc_parent, 0x6);
    proc->button_blank = 1;
}

void sub_809B458(struct ProcPrepUnit *proc)
{
    PrepSetLatestCharId(
        GetUnitFromPrepList(proc->list_num_cur)->pCharacterData->number);

    sub_80920DC(proc);
}

void sub_809B478(struct ProcPrepUnit *proc)
{
    int i, list_index = PrepGetLatestUnitIndex();
    proc->list_num_pre = list_index;
    proc->list_num_cur = list_index;
    proc->cur_counter = 0;

    for (i = 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & (US_DEAD | US_NOT_DEPLOYED | US_BIT16)))
            proc->cur_counter++;
    }
}

void PrepUnitDisableDisp()
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void PrepUnitEnableDisp()
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void sub_809B504(struct ProcPrepUnit *proc)
{
    SetStatScreenConfig(0x11);
    StartStatScreen(GetUnitFromPrepList(proc->list_num_cur), proc);
}

void sub_809B520(struct ProcPrepUnit *proc)
{
    int list_num;
    MakePrepUnitList();

    list_num = GetLatestUnitIndexInPrepListByUId();
    proc->list_num_pre = list_num;
    proc->list_num_cur = list_num;
}

CONST_DATA u16 obj_08A18E34[] = {
    0x4,
    0x4000, 0x8000, 0x9000, 0x4000,
    0x8020, 0x9004, 0x0000, 0x4040,
    0x9008, 0x8000, 0x0050, 0x900A
};

CONST_DATA u16 obj_08A18E4E[] = {
    0x0003, 0x4000, 0x8000, 0x900B,
    0x4000, 0x8020, 0x900F, 0x8000,
    0x0040, 0x9013
};

CONST_DATA u16 obj_08A18E62[] = {
    0x0003, 0x4000, 0x8000, 0x900B,
    0x4000, 0x8020, 0x9014, 0x8000,
    0x0040, 0x9018
};

CONST_DATA u16 obj_08A18E76[] = {
    0x0003, 0x4000, 0x8000, 0x9019,
    0x0000, 0x4020, 0x901D, 0x8000,
    0x0030, 0x901F
};

CONST_DATA struct ProcCmd ProcScr_PrepUnitScreen[] = {
    PROC_YIELD,
    PROC_SET_END_CB(ProcPrepUnit_OnEnd),

PROC_LABEL(PROC_LABEL_PREPUNIT_0),
    PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),

PROC_LABEL(PROC_LABEL_PREPUNIT_IDLE),
    PROC_REPEAT(ProcPrepUnit_Idle),

PROC_LABEL(PROC_LABEL_PREPUNIT_2),
    PROC_CALL(sub_809B370),
    PROC_REPEAT(sub_809B2DC),
    PROC_REPEAT(sub_809B3B4),
    PROC_REPEAT(sub_809B324),
    PROC_CALL(sub_809B388),
    PROC_GOTO(PROC_LABEL_PREPUNIT_IDLE),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_SELECT),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_809B014),
    PROC_CALL(sub_809B458),
    PROC_YIELD,
    PROC_CALL(sub_809B478),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_YIELD,
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(PROC_LABEL_PREPUNIT_IDLE),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_R),
    PROC_CALL(PrepUnitDisableDisp),
    PROC_SLEEP(0x2),
    PROC_CALL(sub_809B014),
    PROC_CALL(sub_809B504),
    PROC_YIELD,
    PROC_CALL(sub_809B520),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(0x2),
    PROC_CALL(PrepUnitEnableDisp),
    PROC_GOTO(0x1),

PROC_LABEL(PROC_LABEL_PREPUNIT_GAME_START),
    PROC_CALL(ProcPrepUnit_OnGameStart),
    PROC_SLEEP(0x1E),
    PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(PROC_LABEL_PREPUNIT_END),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_B),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),

PROC_LABEL(PROC_LABEL_PREPUNIT_END),
    PROC_END
};
