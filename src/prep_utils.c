#include "global.h"

#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

struct ViewCounterProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
};

//! FE8U = 0x08097CC4
int sub_8097CC4(void) {
    return 0;
}

//! FE8U = 0x08097CC8
u8 GetConvoyItemCount_(void) {
    return GetConvoyItemCount();
}

//! FE8U = 0x08097CD8
void sub_8097CD8(struct ViewCounterProc* proc) {

    if (proc->unk_2a == proc->unk_2c) {
        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 1;
        gLCDControlBuffer.dispcnt.obj_on = 1;

        Proc_Break(proc);
    }

    proc->unk_2c++;

    return;
}

struct ProcCmd CONST_DATA ProcScr_ViewCounter[] = {
    PROC_NAME("ViewCounter"),
    PROC_SLEEP(0),
    PROC_REPEAT(sub_8097CD8),
    PROC_END,
};

//! FE8U = 0x08097D14
void sub_8097D14(u16 unk, ProcPtr parent) {
    struct ViewCounterProc* proc = Proc_Start(ProcScr_ViewCounter, parent);

    proc->unk_2c = 0;
    proc->unk_2a = unk;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x08097D54
void sub_8097D54(ProcPtr proc) {
    struct Proc* proc_ = (struct Proc*)proc;
    if (proc_ != 0) {
        proc_->proc_lockCnt++;
    }

    return;
}

//! FE8U = 0x08097D68
void sub_8097D68(ProcPtr proc) {
    struct Proc* proc_ = (struct Proc*)proc;
    if (proc_ != 0 && proc_->proc_lockCnt != 0) {
        proc_->proc_lockCnt--;
    }

    return;
}

//! FE8U = 0x08097D80
void sub_8097D80(ProcPtr proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY)) {
        CloseHelpBox();
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gUnknown_08A188A8[] = {
    PROC_SLEEP(1),
    PROC_REPEAT(sub_8097D80),

    PROC_END,
};

//! FE8U = 0x08097DA8
ProcPtr sub_8097DA8(int x, int y, int msgId, ProcPtr parent) {
    if (x < 0 && y < 0) {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    StartHelpBox(x, y, msgId);

    return Proc_StartBlocking(gUnknown_08A188A8, parent);
}

//! FE8U = 0x08097DE0
s8 sub_8097DE0(struct Unit* unit, int item) {
    if (!CanUnitUseWeapon(unit, item)) {
        return 0;
    }

    if (GetItemAttributes(item) & IA_UNCOUNTERABLE) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08097E08
int sub_8097E08(struct Unit* unit) {
    int i;

    int count = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (sub_8097DE0(unit, unit->items[i]) == 1) {
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

    if (sub_8097E08(unit) == 0) {
        return 0;
    }

    return 1;
}

const s16 gUnknown_08205BFC[] = {
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
s8 sub_8097E74(struct Unit* unit) {
    u32 i;

    for (i = 0; i < 0xb; i++) {
        if (unit->pCharacterData->number == gUnknown_08205BFC[i]) {
            return 0;
        }
    }

    return 1;
}

int CheckInLinkArena(void);

//! FE8U = 0x08097EA0
s8 sub_8097EA0(struct Unit* unitA, int itemSlotA, struct Unit* unitB, int itemSlotB) {

    if (unitA == unitB) {
        return 1;
    }

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (!(unitA->state & US_NOT_DEPLOYED)) {
        if (sub_8097DE0(unitA, unitA->items[itemSlotA]) != 0) {
            if (sub_8097E08(unitA) <= 1) {
                if (sub_8097DE0(unitA, unitB->items[itemSlotB]) == 0) {
                    return 0;
                }
            }
        }
    }

    if (!(unitB->state & US_NOT_DEPLOYED)) {
        if (sub_8097DE0(unitB, unitB->items[itemSlotB]) != 0) {
            if (sub_8097E08(unitB) <= 1) {
                if (sub_8097DE0(unitB, unitA->items[itemSlotA]) == 0) {
                    return 0;
                }
            }
        }
    }

    return 1;
}

//! FE8U = 0x08097F44
s8 sub_8097F44(struct Unit* unit, int itemSlot, int item) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!sub_8097DE0(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (sub_8097E08(unit) != 1) {
        return 1;
    }

    if (sub_8097DE0(unit, item)) {
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

    if (!sub_8097DE0(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (sub_8097E08(unit) != 1) {
        return 1;
    }

    return 0;
}

extern u16 gUnknown_08A1D448[];
extern u16 gUnknown_02013460[];

//! FE8U = 0x08097FDC
void sub_8097FDC(void) {
    int i;

    for (i = 0; i < 0x10; i++) {
        int pal = gPlaySt.cfgWindowColor;

        u16* dst = &gUnknown_02013460[i];
        u16* src = &gUnknown_08A1D448[pal * 0x10 + i];

        *dst = *src;
    }

    return;
}

struct Struct8A188C0 {
    /* 00 */ u8 lowerBound;
    /* 01 */ u8 upperBound;
};

struct Struct8A188C0 CONST_DATA gUnknown_08A188C0[] = {
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
int sub_8098014(int item) {
    int i;

    for (i = 0; i < 9; i++) {
        int itemType = GetItemType(item);

        if (itemType < gUnknown_08A188C0[i].lowerBound) {
            continue;
        }

        if (itemType > gUnknown_08A188C0[i].upperBound) {
            continue;
        }

        return i;
    }

    return 8;
}

extern u16 gUnknown_02012F54;
extern struct PrepScreenItemListEnt gUnknown_02012914[];

//! FE8U = 0x08098048
void sub_8098048(int page) {
    int j;
    int i;
    int k;

    struct PrepScreenItemListEnt* prepItemListBuffer = gUnknown_02012914;
    gUnknown_02012F56 = 0;

    for (i = 0; i < gUnknown_02012F54; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gUnknown_08A188C0[page].lowerBound) {
            continue;
        }

        if (itemType > gUnknown_08A188C0[page].upperBound) {
            continue;
        }

        *prepItemListBuffer = gPrepScreenItemList[i];
        prepItemListBuffer++;

        gUnknown_02012F56++;
    }

    for (i = 0; i < gUnknown_02012F54; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gUnknown_08A188C0[page].lowerBound || itemType > gUnknown_08A188C0[page].upperBound) {
            *prepItemListBuffer = gPrepScreenItemList[i];
            prepItemListBuffer++;
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
void sub_80982FC(void) {
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        AddItemToConvoy(0x88 - i);
    }

    return;
}

//! FE8U = 0x0809831C
int sub_809831C(u16 a) {
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
int sub_8098344(u16 a, int b) {
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
int sub_8098378(u16 a) {
    int i;

    for (i = 0; i < 0x10; i++) {

        if ((a >> i) & 1) {
            return i;
        }
    }

    return 0;
}
