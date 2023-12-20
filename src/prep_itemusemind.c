#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "icon.h"
#include "hardware.h"
#include "mapanim.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "sysutil.h"

void PrepItemUseBooster_OnDraw(struct ProcPrepItemUseBooster *proc, int x, int y, int msg, int item)
{
    const char *str = GetStringFromIndex(msg);
    int icon = GetItemIconId(item);
    int width = GetStringTextLen(str);

    if (icon != 0)
        DrawIcon(TILEMAP_LOCATED(gBG2TilemapBuffer, x, y), GetItemIconId(item), 0x4000);

    ClearText(&gPrepItemTexts[TEXT_PREPITEM_POPUP]);

    PutDrawText(
        &gPrepItemTexts[TEXT_PREPITEM_POPUP],
        TILEMAP_LOCATED(gBG2TilemapBuffer,
            icon == 0 ? x : x + 2, y),
        TEXT_COLOR_SYSTEM_WHITE,
        0, 0, str
    );

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->xpos = x * 8 - 4;
    proc->ypos = y * 8 - 4;

    proc->width = width / 8 + 1;

    if (icon != 0)
        proc->width += 2;

    proc->height = 2;
}

void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc)
{
    int i, item, msg;
    struct ProcPrepItemUse *parent = proc->proc_parent;

    StartManimLevelUpStatGainLabels(0x1C0, 3, 0, proc);

    proc->status_pre[EKRLVUP_STAT_HP] = GetUnitCurrentHp(parent->unit);
    proc->status_pre[EKRLVUP_STAT_POW] = GetUnitPower(parent->unit);
    proc->status_pre[EKRLVUP_STAT_SKL] = GetUnitSkill(parent->unit);
    proc->status_pre[EKRLVUP_STAT_SPD] = GetUnitSpeed(parent->unit);
    proc->status_pre[EKRLVUP_STAT_LCK] = GetUnitLuck(parent->unit);
    proc->status_pre[EKRLVUP_STAT_DEF] = GetUnitDefense(parent->unit);
    proc->status_pre[EKRLVUP_STAT_RES] = GetUnitResistance(parent->unit);
    proc->status_pre[EKRLVUP_STAT_CON] = UNIT_CON(parent->unit);

    item = parent->unit->items[parent->slot];

    msg = ApplyStatBoostItem(parent->unit, parent->slot);
    
    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    DrawPrepScreenItemUseStatValues(parent->unit);

    proc->status_pst[EKRLVUP_STAT_HP] = GetUnitCurrentHp(parent->unit);
    proc->status_pst[EKRLVUP_STAT_POW] = GetUnitPower(parent->unit);
    proc->status_pst[EKRLVUP_STAT_SKL] = GetUnitSkill(parent->unit);
    proc->status_pst[EKRLVUP_STAT_SPD] = GetUnitSpeed(parent->unit);
    proc->status_pst[EKRLVUP_STAT_LCK] = GetUnitLuck(parent->unit);
    proc->status_pst[EKRLVUP_STAT_DEF] = GetUnitDefense(parent->unit);
    proc->status_pst[EKRLVUP_STAT_RES] = GetUnitResistance(parent->unit);
    proc->status_pst[EKRLVUP_STAT_CON] = UNIT_CON(parent->unit);

    PrepItemUseBooster_OnDraw(proc, 0xE, 0xE, msg, item);

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        if (proc->status_pre[i] == proc->status_pst[i])
            continue;

        StartPrepItemBoostStatGainLabelAnim(
            (i >> 2) * 56 + 0xB0,
            (i  & 3) * 16 + 0x2A,
            proc->status_pst[i] - proc->status_pre[i]
        );
    }

    proc->timer = 0x78;
    PlaySoundEffect(0x5A);
}

void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc)
{
    PrepItemDrawPopupBox(proc->xpos, proc->ypos, proc->width, proc->height, 0xA440);

    if (--proc->timer == 0 || gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_Break(proc);
}

void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc)
{
    struct ProcPrepItemUse *parent = proc->proc_parent;
    int max = GetUnitItemCount(parent->unit);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 14, 14), 14, 1, 0);

    if (max == 0) {
        Proc_Goto(parent, 0x6);
    } else {
        if (parent->slot >= max)
            parent->slot--;

        ShowSysHandCursor(0x10, parent->slot * 0x10 + 0x48, 0xB, 0x800);
    }

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &gPrepItemTexts[15],
        parent->unit, 1
    );

    DrawPrepScreenItemUseDesc(parent->unit, parent->slot);

    sub_80ACA84(0);
    EndManimLevelUpStatGainLabels();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);
    LoadHelpBoxGfx(OBJ_VRAM1, -1);
}

void PrepItemUseJuna_OnDraw(struct ProcPrepItemUseJunaFruit *proc, int x, int y, int msg, int item)
{
    /**
     * Level lost.[.]
     *
     * why hardcoded?
     */
    const char *str = GetStringFromIndex(0x1F);
    int icon = GetItemIconId(item);
    int width = GetStringTextLen(str);

    if (icon != 0)
        DrawIcon(TILEMAP_LOCATED(gBG2TilemapBuffer, x, y), GetItemIconId(item), 0x4000);

    ClearText(&gPrepItemTexts[TEXT_PREPITEM_POPUP]);

    PutDrawText(
        &gPrepItemTexts[TEXT_PREPITEM_POPUP],
        TILEMAP_LOCATED(gBG2TilemapBuffer,
            icon == 0 ? x : x + 2, y),
        TEXT_COLOR_SYSTEM_WHITE,
        0, 0, str
    );

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->xpos = x * 8 - 4;
    proc->ypos = y * 8 - 4;

    proc->width = width / 8 + 1;

    if (icon != 0)
        proc->width += 2;

    proc->height = 2;
}

void PrepItemUseJuna_OnInit(struct ProcPrepItemUseJunaFruit * proc)
{
    int item, lv_pre, lv_chg;
    struct ProcPrepItemUse *parent = proc->proc_parent;
    StartManimLevelUpStatGainLabels(0x1C0, 3, 0, proc);

    proc->lv_pre = parent->unit->level;

    item = parent->unit->items[parent->slot];
    lv_chg = ApplyJunaFruitItem(parent->unit, parent->slot);

    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    DrawPrepScreenItemUseStatValues(parent->unit);

    proc->lv_pst = parent->unit->level;

    PrepItemUseJuna_OnDraw(proc, 0x11, 0xE, lv_chg, item);

    if (proc->lv_pre != proc->lv_pst)
        StartPrepItemBoostStatGainLabelAnim(0xB0, 0x1A, proc->lv_pst - proc->lv_pre);

    proc->timer = 0x78;

    PlaySoundEffect(0x5A);
}

void PrepItemUseJuna_IDLE(struct ProcPrepItemUseJunaFruit *proc)
{
    PrepItemDrawPopupBox(proc->xpos, proc->ypos, proc->width, proc->height, 0xA440);

    if (--proc->timer == 0 || gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_Break(proc);
}

void PrepItemUseJuna_OnEnd(struct ProcPrepItemUseJunaFruit *proc)
{
    struct ProcPrepItemUse *parent = proc->proc_parent;
    int max = GetUnitItemCount(parent->unit);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 14), 12, 1, 0);

    if (max == 0) {
        Proc_Goto(parent, 0x6);
    } else {
        if (parent->slot >= max)
            parent->slot--;

        ShowSysHandCursor(0x10, parent->slot * 0x10 + 0x48, 0xB, 0x800);
    }

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &gPrepItemTexts[15],
        parent->unit, 1
    );

    DrawPrepScreenItemUseDesc(parent->unit, parent->slot);

    sub_80ACA84(0);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);
    LoadHelpBoxGfx(OBJ_VRAM1, -1);
}

CONST_DATA struct ProcCmd ProcScr_PrepItemUseBooster[] = {
    PROC_SET_END_CB(PrepItemUseBooster_OnEnd),
    PROC_CALL(PrepItemUseBooster_OnInit),
    PROC_REPEAT(PrepItemUseBooster_IDLE),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepItemUseJunaFruit[] = {
    PROC_SET_END_CB(PrepItemUseJuna_OnEnd),
    PROC_CALL(PrepItemUseJuna_OnInit),
    PROC_REPEAT(PrepItemUseJuna_IDLE),
    PROC_CALL(EndManimLevelUpStatGainLabels),
    PROC_SLEEP(0x1),
    PROC_END
};
