#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "constants/items.h"
#include "bmudisp.h"

#include "prepscreen.h"
s8 CheckSomethingSomewhere();

void PrepScreenMenu_OnPickUnits(struct ProcAtMenu* proc) {
    proc->state = 1;
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnItems(struct ProcAtMenu* proc) {
    proc->state = 2;
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnSupport(struct ProcAtMenu* proc) {
    proc->state = 4;
    sub_80029E8(0x37, 0x100, 0x100, 0x20, 0);
    Proc_Goto(proc, 0xA);
}

void PrepScreenMenu_OnSave(struct ProcAtMenu* proc) {
    PlaySoundEffect(0x6A);
    proc->state = 3;
    Proc_Goto(proc, 0x8);
}

int PrepScreenMenu_OnStartPress(struct ProcAtMenu* proc) {
    if(0 == proc->cur_counter)
        return 0;

    PrepSpecialChar_BlinkButtonStart();
    Proc_Goto(proc, 0xB);
    return 1;
    
}

int Prep_HasUnitDeployed()
{
    struct ProcAtMenu* proc = Proc_Find(ProcScr_AtMenu);
    if (0 == proc->cur_counter)
        return 0;
    else
        return 1;
}

void sub_8095284(ProcPtr proc)
{
    Proc_Goto(proc, 0x5);
}

#if NONMATCHING
    if(0 == CheckSomethingSomewhere()) {
        if(0 == CanPrepScreenCheckMap())
            return 0;

        PrepSpecialChar_BlinkButtonB();
    }

    Proc_Goto(proc, 0x5);
    return 1;
#else
int PrepScreenMenu_OnBPress(struct ProcAtMenu* proc) {

    if (0 != CheckSomethingSomewhere())
        goto goto_jump;
    
    if (0 != CanPrepScreenCheckMap()) {
        PrepSpecialChar_BlinkButtonB();
    goto_jump:
        Proc_Goto(proc, 0x5);
            return 1;
    }

    return 0;
}
#endif

void PrepScreenMenu_OnCheckMap(struct ProcAtMenu* proc) {
    Proc_Goto(proc, 0x5);
}

void sub_80952CC() {}
void __malloc_unlock_1() {}

void Reset203E87C()
{
    int i;
    for (i = 0; i < 5; i++)
        gUnknown_0203E87C.unk00[i] = 0;
}

void Reset203E87C_WithVal(u8 val)
{
    int i;
    for (i = 0; i < 5; i++)
        if (0 == gUnknown_0203E87C.unk00[i]) {
            gUnknown_0203E87C.unk00[i] = val;
            return;
        }
}

void Modify203E87C(u8 val)
{
    int i, j;
    for (i = 0; i < 5; i++) {
        if (gUnknown_0203E87C.unk00[i] != val)
            continue;

        j = i;
        if (i <= 3) {
            while (j <= 3) {
                gUnknown_0203E87C.unk00[j] = gUnknown_0203E87C.unk00[j + 1];
                j++;
            }
        }

        gUnknown_0203E87C.unk00[4] = 0;
        break;
    }
}

struct Unit *GetUnitFromPrepList(int index)
{
    return gPrepUnitList.units[index];
}

void RegisterPrepUnitList(int index, struct Unit *unit)
{
    gPrepUnitList.units[index] = unit;
}

int PrepGetUnitAmount()
{
    return gPrepUnitList.max_num;
}

void PrepSetUnitAmount(int val)
{
    gPrepUnitList.max_num = val;
}

int PrepGetLatestCharId()
{
    if (0 == (1 & gGMData.state))
        return gPrepUnitList.latest_pid;
    else
        return sub_80C4088();
}

void PrepSetLatestCharId(int val)
{
    if (1 & gGMData.state)
        sub_80C409C(val);
    else
        gPrepUnitList.latest_pid = val;
}

s8 IsCharacterForceDeployed(int char_id)
{
    if (0 != CheckSomethingSomewhere())
        return 0;

    if (0 != GetChapterThing())
        return 0;

    return IsCharacterForceDeployed_(char_id);
}

int CalcForceDeployedUnitCounts()
{
    int i, ret = 0;
    for (i = 1; i < 0x40; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((US_DEAD | US_BIT16) & unit->state)
            continue;

        if (IsCharacterForceDeployed(UNIT_CHAR_ID(unit)))
            ret++;
    }
    return ret;
}

s8 SomeLeftoverFunctionThatReturns0(struct Unit *unit)
{
    return 0;
}

s8 IsUnitInCurrentRoster(struct Unit *unit)
{
    if ((US_DEAD | US_BIT16) & unit->state)
        return 0;

    if (0x200 & UNIT_CATTRIBUTES(unit)) {
        unit->state = 8;
        return 0;
    }

    return 1;
}

void AtMenu_AddPrepScreenSupportMenuItem(struct ProcAtMenu *proc)
{
    int i;
    int color = 0;

    proc->unk_2F = 0;
    if (0 != (CHAPTER_FLAG_7 & gRAMChapterData.chapterStateBits))
        return;

    for (i = 0; i < 4; i++) {
        if (0 == sub_80A095C(i))
            continue;

        proc->unk_2F |= 1 << i;
    }

    if (0 == sub_80A095C(2))
        color = 1;

    SetPrepScreenMenuItem(4, PrepScreenMenu_OnSupport, color, 0x577, 0);
}

s8 CanPrepScreenCheckMap()
{
    if (0x7D == gRAMChapterData.chapterIndex)
        return 0;
    else
        return 1;
}

void InitPrepScreenMainMenu(struct ProcAtMenu* proc)
{
    int color;

    StartPrepScreenMenu(proc);
    if (!CheckSomethingSomewhere()) {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_NORMAL,
            0x574, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_NORMAL,
            0x576, 0);

        AtMenu_AddPrepScreenSupportMenuItem(proc);

        if (CanPrepScreenCheckMap()) {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_NORMAL,
                0x578, 0);
        } else {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_GRAY,
                0x578, 0);
        }

        color = TEXT_COLOR_NORMAL;
        if (!CanPrepScreenSave())
            color = TEXT_COLOR_GRAY;
        
        SetPrepScreenMenuItem(
            PREP_MAINMENU_SAVE,
            PrepScreenMenu_OnSave,
            color,
            0x579, 0);

    } else {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_NORMAL,
            0x574, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_NORMAL,
            0x576, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNK3,
            sub_8095284,
            TEXT_COLOR_NORMAL,
            0x75C, 0);
    }

    SetPrepScreenMenuOnBPress(PrepScreenMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepScreenMenu_OnStartPress);

    TileMap_FillRect(gBG0TilemapBuffer, 0xC, 0x13, 0);
    TileMap_FillRect(gBG1TilemapBuffer, 0xC, 0x13, 0);

    if (CheckSomethingSomewhere())
        SetPrepScreenMenuPosition(1, 5);
    else
        SetPrepScreenMenuPosition(1, 6);

    SetPrepScreenMenuSelectedItem(proc->cur_cmd);
}

int GetLatestUnitIndexInPrepListByUId()
{
    int i;
    for (i = 0; i < PrepGetUnitAmount(); i++) {
        if (GetLastStatScreenUid() == GetUnitFromPrepList(i)->index)
            return i;
    }
    return 0;
}

int GetLatestUnitIndexInPrepListByCharId()
{
    int i;
    for (i = 0; i < PrepGetUnitAmount(); i++) {
        if (UNIT_CHAR_ID(GetUnitFromPrepList(i)) == PrepGetLatestCharId())
            return i;
    }
    return 0;
}

void ReorderPlayerUnitsBasedOnDeployment()
{
    int i;
    struct Unit *unit;

    InitUnitStack(gPrepUnitPool);
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit) && !(0x1000C & unit->state))
            PushUnit(unit);
    }

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit) && (0x1000C & unit->state))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();
}

void SortPlayerUnitsForPrepScreen()
{
    int i, state1, state2;
    struct Unit *unit;
    int count = GetChapterAllyUnitCount();
    int _count = 0;

    InitUnitStack(gPrepUnitPool);

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->state &= 0xFDFFFFFF;

        if (IsUnitInCurrentRoster(unit) &&
            IsCharacterForceDeployed(unit->pCharacterData->number))
                PushUnit(unit);
    }

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit) ||
            !IsCharacterForceDeployed(unit->pCharacterData->number))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit))
            continue;

        if (SomeLeftoverFunctionThatReturns0(unit)) {
            state1 = unit->state;
            state2 = 0x02000008;
        } else {
            if (count > _count) {
                unit->state &= 0xFFFFFFF7;
                _count++;
                continue;
            }

            state1 = unit->state;
            state2 = 0x08;
        }

        unit->state = state1 | state2;
    }
}

void RemoveSomeUnitItems()
{
    int i, j, itemNum, removeItem;
    struct Unit *unit;

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        removeItem = 0;
        unit->state |= 8;

        itemNum = GetUnitItemCount(unit);
        if (removeItem < itemNum) {
            for (j = 0; j < itemNum; j++) {
                switch (GetItemIndex(unit->items[j])) {
                case ITEM_SWORD_SHADOWKILLR:
                case ITEM_LANCE_BRIGHTLANCE:
                case ITEM_AXE_FIENDCLEAVER:
                case ITEM_BOW_BEACONBOW:
                case ITEM_JUNAFRUIT:
                case ITEM_UNK_CC:
                    unit->items[j] = 0;
                    removeItem = 1;
                }
            }   
        }

        if (removeItem)
            UnitRemoveInvalidItems(unit);
    }
}

void MakePrepUnitList()
{
    int i, cur = 0;
    struct Unit *unit;
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit)) {
            RegisterPrepUnitList(cur, unit);
            cur++;
        }
    }

    PrepSetUnitAmount(cur);
}

int UnitGetIndexInPrepList(int pid)
{
    int i;
    struct Unit *unit;

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (UNIT_CHAR_ID(unit) == pid)
            return i;
    }
    return 0;
}

void PrepUpdateSMS()
{
    int i, state;
    struct Unit *unit;

    ResetUnitSprites();

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (!(unit->state & 8))
            unit->state &= ~2;
        else
            unit->state |= 0xA;

        UseUnitSprite(GetUnitSMSId(unit));
    }

    ForceSyncUnitSpriteSheet();
}

int PrepGetDeployedUnitAmt(void)
{
    struct Unit *unit;
    int i, _count = 0;
    int count = GetChapterAllyUnitCount();

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (unit->state & 8)
            continue;

        if (_count >= count)
            unit->state |= 8;
        else
            _count++;
    }
    return (s8)_count;
}

void PrepAutoCapDeployUnits(struct ProcAtMenu* proc)
{
    int i;
    struct Unit *unit;

    proc->cur_counter = 0;
    proc->unit_count = 0;

    for (i = 0; i < PrepGetUnitAmount(); proc->unit_count++, i++) {
        unit = GetUnitFromPrepList(i);

        if (unit->state & 8)
            continue;

        if (unit->state & US_NOT_DEPLOYED)
            continue;
        {
            if (proc->cur_counter >= proc->max_counter)
                unit->state = 8;
            else
                proc->cur_counter++;
        }
    }

    if (proc->unit_count < proc->max_counter)
        proc->max_counter = proc->unit_count;
}

void EndSlidingWallEffectMaybe()
{
    Proc_EndEach(ProcScr_SlidingWallBg);
    sub_8086BB8(0, 0, 0xA);
}

void EndBG3Slider_()
{
    EndBG3Slider();
}

void Prep_DrawChapterGoal(int VRAM_offset, int pal)
{
    int msg;
    const char *str;
    struct Font font;
    struct TextHandle th;

    InitSomeOtherGraphicsRelatedStruct(&font, OBJ_VRAM0 + VRAM_offset, pal);
    ApplyPalette(Pal_UIFont, 0x10 + pal);
    Text_Init3(&th);
    SetFont(&font);
    SetFontGlyphSet(0);
    Text_80046B4(&th, 0);

    if (2 != GetChapterThing())
        msg = GetROMChapterStruct(gRAMChapterData.chapterIndex)->goalWindowTextId;
    else
        msg = 0x19E;

    str = GetStringFromIndex(msg);

    Text_InsertString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetFont(0);
}
