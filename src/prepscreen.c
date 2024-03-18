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
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"

#include "prepscreen.h"

s8 CheckInLinkArena();

EWRAM_DATA struct SioPidPool gSioPidPool = { 0 };

// clang-format off

u16 CONST_DATA gBgConfig_ItemUseScreen[] =
{
    0x0000, 0xE000, 0x0000,
    0x0000, 0xE800, 0x0000,
    0x0000, 0xF000, 0x0000,
    0x8000, 0xF800, 0x0000,
};

int CONST_DATA gUnknown_08A18200[][3] =
{
    { 0x57A, 0x57A, 0x75D, },
    { 0x57B, 0x57C, 0x75E, },
    { 0x57D, 0x581,     0, },
    {     0,     0, 0x75F, },
    { 0x57D, 0x57F,     0, },
    {     0,     0,     0, },
    {     0,     0,     0, },
    { 0x580, 0x580,     0, },
    { 0x582, 0x582,     0, },
};

// clang-format on

//! FE8U = 0x08094FF4
u8 CanPrepScreenSave(void)
{
    u32 chapterIndex = gPlaySt.chapterIndex;

    if ((!gGMData.state.bits.state_0) && (chapterIndex - 0x24 < 0x14))
    {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08095024
int sub_8095024(void)
{
    int index = GetActivePrepMenuItemIndex();

    if (CheckInLinkArena())
    {
        return gUnknown_08A18200[index][2];
    }

    if (index == 4)
    {
        if (!sub_80A095C(2))
        {
            return gUnknown_08A18200[4][0];
        }
    }
    else if (index == 2)
    {
        if (!CanPrepScreenSave())
        {
            return gUnknown_08A18200[2][0];
        }
    }

    return gUnknown_08A18200[index][1];
}

//! FE8U = 0x08095094
int sub_8095094(int target, int val)
{
    int i;

    int count = 0;

    for (i = 0; i < 4; i++)
    {
        if (((val >> i) & 1) != 0)
        {
            if (target == count)
            {
                return i;
            }

            count++;
        }
    }

    return -1;
}

//! FE8U = 0x080950C4
int sub_80950C4(int val)
{
    int i;
    int count = 0;

    for (i = 0; i < 4; i++)
    {
        if (((val >> i) & 1) != 0)
        {
            count++;
        }
    }

    return count;
}

//! FE8U = 0x080950E8
void sub_80950E8(int vram, int palId)
{
    u16 * palettes[4] =
    {
        Pal_08A1D850,
        Pal_08A1D870,
        Pal_08A1D890,
        Pal_08A1D8B0,
    };

    Decompress(Img_PrepWindow, (void *)(vram + 0x6000000));
    ApplyPalette(palettes[gPlaySt.config.windowColor], palId);

    return;
}

//! FE8U = 0x08095138
void sub_8095138(u16 * tm, int b, u32 c, int d)
{
    int i;

    CallARM_FillTileRect(tm, Tsa_08A1A41C, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));

    for (i = 0; i < b; i++)
    {
        CallARM_FillTileRect(
            (i * 0x40) + tm + 0x20, Tsa_08A1A434, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));
    }

    CallARM_FillTileRect(
        i * 0x40 + tm + 0x20, Tsa_08A1A474, (u16)(d * 0x1000 + ((c / 2) & 0xffff) / 0x10));

    return;
}

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
    CallSomeSoundMaybe(0x37, 0x100, 0x100, 0x20, 0);
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

int PrepScreenMenu_OnBPress(struct ProcAtMenu* proc) {

    if (false != CheckInLinkArena()) {
        Proc_Goto(proc, 0x5);
        return true;
    }
    
    if (false == CanPrepScreenCheckMap())
        return false;

    PrepSpecialChar_BlinkButtonB();
    Proc_Goto(proc, 0x5);
    return true;
}

void PrepScreenMenu_OnCheckMap(struct ProcAtMenu* proc) {
    Proc_Goto(proc, 0x5);
}

void sub_80952CC() {}
void __malloc_unlock_1() {}

void ResetSioPidPool()
{
    int i;
    for (i = 0; i < 5; i++)
        gSioPidPool.pids[i] = 0;
}

void RegisterSioPid(u8 pid)
{
    int i;
    for (i = 0; i < 5; i++)
        if (0 == gSioPidPool.pids[i]) {
            gSioPidPool.pids[i] = pid;
            return;
        }
}

void RemoveSioPid(u8 pid)
{
    int i, j;
    for (i = 0; i < 5; i++) {
        if (gSioPidPool.pids[i] != pid)
            continue;

        j = i;
        if (i <= 3) {
            while (j <= 3) {
                gSioPidPool.pids[j] = gSioPidPool.pids[j + 1];
                j++;
            }
        }

        gSioPidPool.pids[4] = 0;
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
    if (0 == (gGMData.state.bits.state_0))
        return gPrepUnitList.latest_pid;
    else
        return GetGMapBaseMenuPid();
}

void PrepSetLatestCharId(int val)
{
    if (gGMData.state.bits.state_0)
        SetGMapBaseMenuPid(val);
    else
        gPrepUnitList.latest_pid = val;
}

s8 IsCharacterForceDeployed(int char_id)
{
    if (0 != CheckInLinkArena())
        return 0;

    if (0 != GetBattleMapKind())
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
    if (0 != (PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits))
        return;

    for (i = 0; i < 4; i++) {
        if (0 == (s8)sub_80A095C(i))
            continue;

        proc->unk_2F |= 1 << i;
    }

    if (0 == (s8)sub_80A095C(2))
        color = 1;

    SetPrepScreenMenuItem(4, PrepScreenMenu_OnSupport, color, 0x577, 0);
}

s8 CanPrepScreenCheckMap()
{
    if (0x7D == gPlaySt.chapterIndex)
        return 0;
    else
        return 1;
}

void InitPrepScreenMainMenu(struct ProcAtMenu* proc)
{
    int color;

    StartPrepScreenMenu(proc);
    if (!CheckInLinkArena()) {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_SYSTEM_WHITE,
            0x574, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_SYSTEM_WHITE,
            0x576, 0);

        AtMenu_AddPrepScreenSupportMenuItem(proc);

        if (CanPrepScreenCheckMap()) {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_SYSTEM_WHITE,
                0x578, 0);
        } else {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_SYSTEM_GRAY,
                0x578, 0);
        }

        color = TEXT_COLOR_SYSTEM_WHITE;
        if (!CanPrepScreenSave())
            color = TEXT_COLOR_SYSTEM_GRAY;
        
        SetPrepScreenMenuItem(
            PREP_MAINMENU_SAVE,
            PrepScreenMenu_OnSave,
            color,
            0x579, 0);

    } else {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_SYSTEM_WHITE,
            0x574, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_SYSTEM_WHITE,
            0x576, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNK3,
            sub_8095284,
            TEXT_COLOR_SYSTEM_WHITE,
            0x75C, 0);
    }

    SetPrepScreenMenuOnBPress(PrepScreenMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepScreenMenu_OnStartPress);

    TileMap_FillRect(gBG0TilemapBuffer, 0xC, 0x13, 0);
    TileMap_FillRect(gBG1TilemapBuffer, 0xC, 0x13, 0);

    if (CheckInLinkArena())
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

int PrepGetLatestUnitIndex()
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

void RestartMuralBackground()
{
    Proc_EndEach(ProcScr_SlidingWallBg);
    StartMuralBackground(0, 0, 0xA);
}

void EndMuralBackground_()
{
    EndMuralBackground();
}

void Prep_DrawChapterGoal(int VRAM_offset, int pal)
{
    int msg;
    const char *str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, OBJ_VRAM0 + VRAM_offset, pal);
    ApplyPalette(Pal_Text, 0x10 + pal);
    InitSpriteText(&th);
    SetTextFont(&font);
    SetTextFontGlyphs(0);
    SpriteText_DrawBackgroundExt(&th, 0);

    if (2 != GetBattleMapKind())
        msg = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowTextId;
    else
        msg = 0x19E;

    str = GetStringFromIndex(msg);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetTextFont(0);
}
