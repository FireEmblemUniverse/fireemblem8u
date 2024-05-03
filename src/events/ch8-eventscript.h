#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch8_BeginingScene[] = {
    MUSC(0x25)
    LOAD2(0x1, UnitDef_088B76FC)
    ENUN
    CUMO_CHAR(CHARACTER_ORSON_CH5X)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa08)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    LOAD1(0x1, UnitDef_088B774C)
    ENUN
    CUMO_CHAR(CHARACTER_TIRADO)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xa09)
    TEXTEND
    REMA
    STAL(30)
    CUSE(CHARACTER_ORSON_CH5X)
    CUMO_CHAR(CHARACTER_ORSON_CH5X)
    STAL(60)
    CURE
    MOVE(0x0, CHARACTER_ORSON_CH5X, 20, 19)
    SVAL(EVT_SLOT_B, 0x100014)
    MOVE_1STEP(0x0, CHAR_EVT_POSITION_AT_SLOTB, FACING_RIGHT)
    ENUN
    MOVE(0x0, CHARACTER_ORSON_CH5X, 20, 15)
    ENUN
    SVAL(EVT_SLOT_B, 0x100015)
    MOVE_1STEP(0x0, CHAR_EVT_POSITION_AT_SLOTB, FACING_LEFT)
    MOVE(0x0, CHARACTER_ORSON_CH5X, 19, 10)
    ENUN
    DISA(CHARACTER_ORSON_CH5X)
    CUMO_CHAR(CHARACTER_TIRADO)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    SVAL(EVT_SLOT_3, 0xa0a)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_B, 0x100013)
    MOVE_1STEP(0x0, CHAR_EVT_POSITION_AT_SLOTB, FACING_LEFT)
    ENUN
    MOVE(0x0, CHARACTER_TIRADO, 19, 14)
    ENUN
    SVAL(EVT_SLOT_B, 0x100012)
    MOVE_1STEP(0x0, CHAR_EVT_POSITION_AT_SLOTB, FACING_RIGHT)
    ENUN
    MOVE(0x0, CHARACTER_TIRADO, 19, 14)
    ENUN
    CUMO_CHAR(CHARACTER_TIRADO)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa0b)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x150014)
    SOUN(0xab)
    TILECHANGE(0xffff)
    MOVE(0x0, CHARACTER_TIRADO, 19, 10)
    SVAL(EVT_SLOT_B, 0x100013)
    MOVE(0x10, CHAR_EVT_POSITION_AT_SLOTB, 19, 11)
    SVAL(EVT_SLOT_B, 0x100014)
    MOVE(0x10, CHAR_EVT_POSITION_AT_SLOTB, 20, 11)
    ENUN
    CLEE
    LOAD1(0x1, UnitDef_088B73C8)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088B77C4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa0c)
    TEXTEND
    REMA
    CALL(EventScr_08591FD8)
    ENUT(12)
    ENDA
};

CONST_DATA EventListScr EventScr_089F3124[] = {
    CAMERA(0, 23)
    LOAD1(0x1, UnitDef_088B75F8)
    ENUN
    REVEAL(CHARACTER_EPHRAIM)
    REVEAL(CHARACTER_FORDE)
    REVEAL(CHARACTER_KYLE)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_FORDE)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_KYLE)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0xa0d)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch8_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa10)
    TEXTEND
    REMA
    ENUT(223)
    MNCH(0x6)
    ENDA
};

CONST_DATA EventListScr EventScr_089F31B8[] = {
    MUSC(0x27)
    TEXTSTART
    TEXTSHOW(0xa11)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F31D4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xa12)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F31F4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xa13)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F3214[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xa14)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch8_MiscThiefRainforce[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F3250[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B7648)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F3268[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B7698)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F3280[] = {
    CAMERA(14, 20)
    LOAD2(0x1, UnitDef_088B783C)
    ENUN
    MUSC(0x4c)
    FADU(16)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x5)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc02)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x14000e)
    LOMA(0x4e)
    UNIT_COLORS(0x4)
    LOAD2(0x1, UnitDef_088B788C)
    ENUN
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    FAWU(2)
    BROWNBOXTEXT(0x20f, 8, 8)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    REMOVEPORTRAITS
    FAWI(16)
    BACG(0x6)
    FAWU(16)
    TEXTSHOW(0xc03)
    TEXTEND
    REMA
    FAWI(16)
    CLEAN
    FAWU(16)
    MOVE(0x0, CHARACTER_EIRIKA, 0, 16)
    STAL2(32)
    FAWI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    REMOVEPORTRAITS
    BACG(0x6)
    FAWU(16)
    TEXTSHOW(0xc04)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    SVAL(EVT_SLOT_B, 0x14000e)
    LOMA(0x6)
    UNIT_COLORS(0x0)
    LOAD2(0x1, UnitDef_088B783C)
    ENUN
    MUSC(0x4c)
    FAWU(2)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x5)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc05)
    TEXTEND
    REMA
    MNCH(0x38)
    ENDB
};

CONST_DATA EventListScr EventScr_SplitMenu[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc06)
    TEXTEND
    FADI(16)
    REMA
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc07)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc08)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    STAL(30)
    MUSC(0x2b)
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc09)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    FADI(16)
    REMA
    CALL(EventScr_Ch8_TowerFall)
    REMOVEPORTRAITS
    BACG(0xe)
    FADU(4)
    TEXTSHOW(0xc0d)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc0e)
    TEXTEND
    REMA
    MUSCSLOW(0x7fff)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    MUSC(0x29)
    TEXTSHOW(0xc0f)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    EVBIT_MODIFY(0x4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xc14)
    TEXTEND
    REMA
LABEL(0x0)
    ASMC(CallRouteSplitMenu)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_7)
    EVBIT_MODIFY(0x0)
    MUSC(0x24)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x9, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc10)
    TEXTEND
    GOTO(0x3)
LABEL(0x1)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc11)
    TEXTEND
    GOTO(0x3)
LABEL(0x2)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc12)
    TEXTEND
LABEL(0x3)
    REMA
    FADI(16)
    MNCH(0xa)
    ASMC(AutolevelSecondaryLord)
    REMU(CHARACTER_EPHRAIM)
    ENDB
};

CONST_DATA EventListScr EventScr_089F35FC[] = {
LABEL(0x9)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xc13)
    TEXTEND
    REMA
    FADI(16)
    MNCH(0x17)
    ASMC(AutolevelSecondaryLord)
    REMU(CHARACTER_EIRIKA)
    ENDB
};

void CallRouteSplitMenu(ProcPtr proc)
{
    ClearBg0Bg1();
    SetDispEnable(1, 1, 1, 1, 1);
    SetTextFont(0);
    InitSystemTextFont();
    LoadUiFrameGraphics();
    StartMenu(&MenuDef_RouteSplit, proc);
}

int MenuCommand_DrawRouteSplit(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    const char *str = GetStringFromIndex(menu_item->def->nameMsgId);

    Text_SetParams(&menu_item->text, 0, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&menu_item->text, str);
    PutText(
        &menu_item->text,
        TILEMAP_LOCATED(gBG0TilemapBuffer, menu_item->xTile + 1, menu_item->yTile)
    );
    ResetText();
    return 0;
}

u8 Command_EirikaMode(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_EIRIKA;
    SetEventSlotC(0xC17);
    return MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 Command_EphraimMode(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_EPHRAIM;
    SetEventSlotC(0xC18);
    return MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

void AutolevelSecondaryLord()
{
    u8 i;
    struct BattleUnit bunit;
    struct Unit *unit;

    switch (gPlaySt.chapterModeIndex) {
    case CHAPTER_MODE_EIRIKA:
        unit = GetUnitFromCharId(CHARACTER_EPHRAIM);
        break;

    case CHAPTER_MODE_EPHRAIM:
        unit = GetUnitFromCharId(CHARACTER_EIRIKA);
        break;
    }

    /** 
     * This may cause bug if unit is not initialized!
     *
     * if (!UNIT_IS_VALID(unit))
     *     return;
     */

    if (unit->level < 15) {
        u8 old_level = unit->level;
        u8 tar_level = unit->level + 6;

        if (tar_level < 10)
            tar_level = 10;
        if (tar_level > 15)
            tar_level = 15;

        while (old_level < tar_level) {
            InitBattleUnit(&bunit, unit);
            bunit.unit.exp += 100;
            CheckBattleUnitLevelUp(&bunit);
            UpdateUnitFromBattle(unit, &bunit);
            old_level++;
        }
        unit->exp = 0;
    }

    for (i = 0; i < 8; i++) {
        u8 rank = unit->ranks[i] - 1;
        if (rank <= 0x45)
            unit->ranks[i] = 0x47;
    }

    for (i = 0; i < 5; i++) {
        if (0 == unit->items[i]) {
            switch (gPlaySt.chapterModeIndex) {
            case CHAPTER_MODE_EIRIKA:
                UnitAddItem(unit, MakeNewItem(ITEM_LANCE_STEEL));
                break;
            
            case CHAPTER_MODE_EPHRAIM:
                UnitAddItem(unit, MakeNewItem(ITEM_SWORD_STEEL));
                break;
            }
            break;
        }
    }
}

CONST_DATA struct MenuItemDef MenuItemDef_RouteSplit[] = {
    {
        .name = (const char *)0x8205958,
        .nameMsgId = 0xC15, /* Go with Eirika to Rausten. */
        .overrideId = 0,
        .color = TEXT_COLOR_SYSTEM_WHITE,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = MenuCommand_DrawRouteSplit,
        .onSelected = Command_EirikaMode,
    },
    {
        .name = (const char *)0x8205958,
        .nameMsgId = 0xC16, /* Go with Ephraim to Grado. */
        .overrideId = 1,
        .color = TEXT_COLOR_SYSTEM_WHITE,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = MenuCommand_DrawRouteSplit,
        .onSelected = Command_EphraimMode,
    },
    { 0 }
};

CONST_DATA struct MenuDef MenuDef_RouteSplit = {
    .rect = {6, 8, 18, 0},
    .style = 1,
    .menuItems = MenuItemDef_RouteSplit,
};

CONST_DATA EventListScr EventScr_Ch8_TowerFall[] = {
    SVAL(EVT_SLOT_B, 0x14000c)
    LOMA(0x2b)
    LOAD1(0x1, UnitDef_088B78EC)
    ENUN
    FADU(16)
    BROWNBOXTEXT(0x66a, 8, 8)
    CALL(EventScr_089F36FC)
    CALL(EventScr_089F3880)
    ENDA
};

CONST_DATA EventListScr EventScr_089F36FC[] = {
LABEL(0x5f90)
    LOAD1(0x1, UnitDef_088B7964)
    ENUN
    SVAL(EVT_SLOT_B, 0x14000b)
    MOVE_1STEP(0x0, CHAR_EVT_POSITION_AT_SLOTB, FACING_DOWN)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000b)
    FIGHT_MAP(CHARACTER_CAELLACH, CHAR_EVT_ACTIVE_UNIT, 0, 0)
    DISA(CHAR_EVT_POSITION_AT_SLOTB)
    SVAL(EVT_SLOT_B, 0x140009)
    MOVE(0x0, CHAR_EVT_POSITION_AT_SLOTB, 9, 22)
    SVAL(EVT_SLOT_B, 0x14000d)
    MOVE(0x10, CHAR_EVT_POSITION_AT_SLOTB, 13, 21)
    LOAD1(0x1, UnitDef_088B798C)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x501)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x160009)
    FIGHT_MAP(0x80, CHAR_EVT_ACTIVE_UNIT, 0, 0)
    DISA(CHAR_EVT_POSITION_AT_SLOTB)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000d)
    FIGHT_MAP(0x81, CHAR_EVT_ACTIVE_UNIT, 0, 0)
    DISA(CHAR_EVT_POSITION_AT_SLOTB)
    MOVE(0x0, 0x80, 10, 20)
    MOVE(0x0, 0x81, 13, 18)
    SVAL(EVT_SLOT_B, 0x130010)
    MOVE(0x0, CHAR_EVT_POSITION_AT_SLOTB, 19, 14)
    LOAD1(0x1, UnitDef_088B79F0)
    SVAL(EVT_SLOT_B, 0x130006)
    MOVE(0x0, CHAR_EVT_POSITION_AT_SLOTB, 7, 24)
    LOAD1(0x1, UnitDef_088B79C8)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x180007)
    FIGHT_MAP(0x82, CHAR_EVT_ACTIVE_UNIT, 0, 0)
    DISA(CHAR_EVT_POSITION_AT_SLOTB)
    MOVE(0x0, 0x82, 5, 24)
    MOVE(0x10, CHARACTER_CAELLACH, 9, 17)
    STAL2(30)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_089F3880[] = {
LABEL(0x5f90)
    CAMERA2(11, 4)
    MUSS(0x2e)
    STAL(33)
    LOAD1(0x1, UnitDef_088B7A54)
    ENUN
    FADU(16)
    SVAL(EVT_SLOT_2, 0x53)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xc0a)
    TEXTEND
    REMA
    MOVE(0x2, CHARACHER_FRELIAN, 10, 4)
    ENUN
    MOVE(0x10, CHARACTER_CAELLACH, 11, 4)
    ENUN
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xc0b)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_1, 0x3)
    SET_HP(CHARACHER_FRELIAN)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    FIGHT_MAP(CHARACTER_CAELLACH, CHARACHER_FRELIAN, 0, 0)
    DISA(CHARACHER_FRELIAN)
    MOVE_1STEP(0x0, CHARACTER_SELENA, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xc0c)
    TEXTEND
    REMA
    MURE(0x4)
    FADI(4)
    CLEA
    CLEE
    CLEN
    ENDA
};
