#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

//! FE8U = 0x08097CC4
int sub_8097CC4(void)
{
    return 0;
}

//! FE8U = 0x08097CC8
u8 GetConvoyItemCount_(void) {
    return GetConvoyItemCount();
}

//! FE8U = 0x08097CD8
void ViewCounter_Loop(struct ViewCounterProc * proc)
{

    if (proc->targetFrameCount == proc->counter) {
        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 1;
        gLCDControlBuffer.dispcnt.obj_on = 1;

        Proc_Break(proc);
    }

    proc->counter++;

    return;
}

struct ProcCmd CONST_DATA ProcScr_ViewCounter[] = {
    PROC_NAME("ViewCounter"),
    PROC_SLEEP(0),
    PROC_REPEAT(ViewCounter_Loop),
    PROC_END,
};

//! FE8U = 0x08097D14
void StartViewCounter(u16 frames, ProcPtr parent)
{
    struct ViewCounterProc* proc = Proc_Start(ProcScr_ViewCounter, parent);

    proc->counter = 0;
    proc->targetFrameCount = frames;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x08097D54
void TryLockProc(ProcPtr proc)
{
    struct Proc * proc_ = proc;
    if (proc_ != 0)
        proc_->proc_lockCnt++;
}

//! FE8U = 0x08097D68
void TryUnlockProc(ProcPtr proc)
{
    struct Proc* proc_ = proc;
    if (proc_ != 0 && proc_->proc_lockCnt != 0)
        proc_->proc_lockCnt--;
}

//! FE8U = 0x08097D80
void PrepHbKeyListener_Loop(ProcPtr proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY)) {
        CloseHelpBox();
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_PrepHelpboxListener[] = {
    PROC_SLEEP(1),
    PROC_REPEAT(PrepHbKeyListener_Loop),

    PROC_END,
};

//! FE8U = 0x08097DA8
ProcPtr StartPrepErrorHelpbox(int x, int y, int msgId, ProcPtr parent) {
    if (x < 0 && y < 0) {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    StartHelpBox(x, y, msgId);

    return Proc_StartBlocking(gProcScr_PrepHelpboxListener, parent);
}

//! FE8U = 0x08097DE0
s8 IsWeaponUsable(struct Unit * unit, int item)
{
    if (!CanUnitUseWeapon(unit, item)) {
        return 0;
    }

    if (GetItemAttributes(item) & IA_UNCOUNTERABLE) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08097E08
int CountUnitUsableWeapons(struct Unit * unit)
{
    int i;

    int count = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (IsWeaponUsable(unit, unit->items[i]) == 1) {
            count++;
        }
    }

    return count;
}

//! FE8U = 0x08097E38
s8 sub_8097E38(struct Unit* unit) {

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return 0;
    }

    if (!ArenaIsUnitAllowed(unit)) {
        return 0;
    }

    if (CountUnitUsableWeapons(unit) == 0) {
        return 0;
    }

    return 1;
}

const s16 gLinkArenaBanList[] = {
    CHARACTER_MYRRH,
    CHARACTER_CAELLACH_CC,
    CHARACTER_GLEN_CC,
    CHARACTER_ORSON_CC,
    CHARACTER_VALTER_CC,
    CHARACTER_RIEV_CC,
    CHARACTER_HAYDEN_CC,
    CHARACTER_FADO_CC,
    CHARACTER_ISMAIRE_CC,
    CHARACTER_SELENA_CC,
    CHARACTER_LYON_CC,

    0,
};

//! FE8U = 0x08097E74
s8 CanUnitBeDeployedLinkArena(struct Unit* unit) {
    u32 i;

    for (i = 0; i < 0xb; i++) {
        if (unit->pCharacterData->number == gLinkArenaBanList[i]) {
            return 0;
        }
    }

    return 1;
}

//! FE8U = 0x08097EA0
s8 CheckValidLinkArenaItemSwap(struct Unit* unitA, int itemSlotA, struct Unit* unitB, int itemSlotB) {

    if (unitA == unitB) {
        return 1;
    }

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (!(unitA->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitA, unitA->items[itemSlotA]) != 0) {
            if (CountUnitUsableWeapons(unitA) <= 1) {
                if (IsWeaponUsable(unitA, unitB->items[itemSlotB]) == 0) {
                    return 0;
                }
            }
        }
    }

    if (!(unitB->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitB, unitB->items[itemSlotB]) != 0) {
            if (CountUnitUsableWeapons(unitB) <= 1) {
                if (IsWeaponUsable(unitB, unitA->items[itemSlotA]) == 0) {
                    return 0;
                }
            }
        }
    }

    return 1;
}

//! FE8U = 0x08097F44
s8 CheckValidLinkArenaItemSupply(struct Unit* unit, int itemSlot, int item) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!IsWeaponUsable(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (CountUnitUsableWeapons(unit) != 1) {
        return 1;
    }

    if (IsWeaponUsable(unit, item)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08097F98
s8 sub_8097F98(struct Unit* unit, int itemSlot) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!IsWeaponUsable(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (CountUnitUsableWeapons(unit) != 1) {
        return 1;
    }

    return 0;
}

extern u16 Pal_08A1D448[];
extern u16 gUnknown_02013460[];

//! FE8U = 0x08097FDC
void sub_8097FDC(void)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        int pal = gPlaySt.config.windowColor;

        u16* dst = &gUnknown_02013460[i];
        u16* src = &Pal_08A1D448[pal * 0x10 + i];

        *dst = *src;
    }

    return;
}

struct PrepItemTypePageEnt CONST_DATA gPrepItemTypePageLut[] = {
    [0] = { ITYPE_SWORD,  ITYPE_SWORD },
    [1] = { ITYPE_LANCE,  ITYPE_LANCE },
    [2] = { ITYPE_AXE,    ITYPE_AXE   },
    [3] = { ITYPE_BOW,    ITYPE_BOW   },
    [4] = { ITYPE_STAFF,  ITYPE_STAFF },
    [5] = { ITYPE_ANIMA,  ITYPE_ANIMA },
    [6] = { ITYPE_LIGHT,  ITYPE_LIGHT },
    [7] = { ITYPE_DARK,   ITYPE_DARK  },
    [8] = { ITYPE_ITEM,   ITYPE_12    },
};

//! FE8U = 0x08098014
int GetPrepPageForItem(int item) {
    int i;

    for (i = 0; i < 9; i++) {
        int itemType = GetItemType(item);

        if (itemType < gPrepItemTypePageLut[i].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[i].upperBound) {
            continue;
        }

        return i;
    }

    return 8;
}

//! FE8U = 0x08098048
void sub_8098048(int page)
{
    int j;
    int i;
    int k;

    struct PrepScreenItemListEnt* buffer = gUnknown_02012914;
    gUnknown_02012F56 = 0;

    for (i = 0; i < gUnknown_02012F54; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[page].upperBound) {
            continue;
        }

        *buffer = gPrepScreenItemList[i];
        buffer++;

        gUnknown_02012F56++;
    }

    for (i = 0; i < gUnknown_02012F54; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound || itemType > gPrepItemTypePageLut[page].upperBound) {
            *buffer = gPrepScreenItemList[i];
            buffer++;
        }
    }

    j = 1;

    while (1) {
        if (j >= gUnknown_02012F56 / 3) {
            break;
        }

        j = j * 3 + 1;
    }

    for (; j > 0; j = j / 3) {
       for (i = j; i < gUnknown_02012F56; i++) {
            for (k = i - j; k >= 0; k -= j) {
                int a = GetItemIndex(gUnknown_02012914[k].item);
                int b = GetItemIndex(gUnknown_02012914[k + j].item);

                if (a > b) {
                    struct PrepScreenItemListEnt t = gUnknown_02012914[k];
                    gUnknown_02012914[k] = gUnknown_02012914[k + j];
                    gUnknown_02012914[k + j] = t;
                } else {
                    if (GetItemIndex(gUnknown_02012914[k].item) != GetItemIndex(gUnknown_02012914[k + j].item)) {
                        break;
                    }

                    if (gUnknown_02012914[k].item > gUnknown_02012914[k + j].item) {
                        struct PrepScreenItemListEnt t = gUnknown_02012914[k];
                        gUnknown_02012914[k] = gUnknown_02012914[k + j];
                        gUnknown_02012914[k + j] = t;
                    }
                }


            }
        }
    }

    CpuFastSet(gUnknown_02012914, gPrepScreenItemList, 0x190);

    return;
}

//! FE8U = 0x080981E4
void SomethingPrepListRelated(struct Unit* pUnit, int page, int flags) {
    struct PrepScreenItemListEnt* pPrepItemList = gPrepScreenItemList;

    gUnknown_02012F54 = 0;

    if (flags & 2) {
        int i;
        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
            int j;
            int itemCount;
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            if (unit == pUnit) {
                continue;
            }

            itemCount = GetUnitItemCount(unit);

            for (j = 0; j < itemCount; j++) {
                pPrepItemList->pid = unit->pCharacterData->number;
                pPrepItemList->item = unit->items[j];
                pPrepItemList->itemSlot = j;
                pPrepItemList++;

                gUnknown_02012F54++;
            }
        }
    }

    if (flags & 1) {
        int j;
        u16* convoy = GetConvoyItemArray();

        for (j = 0; j < CONVOY_ITEM_COUNT && convoy[j] != 0; j++) {
            pPrepItemList->item = convoy[j];
            pPrepItemList->pid = 0;
            pPrepItemList->itemSlot = j;
            pPrepItemList++;

            gUnknown_02012F54++;
        }
    }

    sub_8098048(page);

    return;
}

//! FE8U = 0x080982B8
void sub_80982B8(void) {
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < gUnknown_02012F54; i++) {
        if (gPrepScreenItemList[i].pid != 0) {
            continue;
        }

        if (gPrepScreenItemList[i].item == 0) {
            continue;
        }

        AddItemToConvoy(gPrepScreenItemList[i].item);
    }

    return;
}

//! FE8U = 0x080982FC
void sub_80982FC(void)
{
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        AddItemToConvoy(0x88 - i);
    }

    return;
}

//! FE8U = 0x0809831C
int sub_809831C(u16 a)
{
    int i;

    int count = 0;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            count++;
        }
    }

    return count;
}

//! FE8U = 0x08098344
int sub_8098344(u16 a, int b)
{
    int i;
    int unk = 0;
    for (i = 0; i < 0x10; i++) {
        if (!((a >> i) & 1)) {
            continue;
        }

        if (unk == b) {
            return 1 << i;
        }

        unk++;
    }

    return 0;
}

//! FE8U = 0x08098378
int sub_8098378(u16 a)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            return i;
        }
    }

    return 0;
}

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit*, int);

//! FE8U = 0x0809839C
s8 CanUnitPrepScreenUse(struct Unit* unit) {
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        u16 item = unit->items[i];

        if (CanUnitUseItemPrepScreen(unit, item)) {
            return 1;
        }
    }

    return 0;
}
