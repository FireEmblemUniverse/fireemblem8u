#include "global.h"

#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"

#include "constants/items.h"

struct BmShopProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unk_2c;
    /* 30 */ u16 unk_30[0x14];

    /* 58 */ u16 unk_58;

    /* 5A */ u8 unk_5a;
    /* 5B */ u8 unk_5b;
    /* 5C */ u8 unk_5c;
    /* 5D */ u8 unk_5d;
    /* 5E */ u8 unk_5e;
    /* 5F */ u8 unk_5f;
    /* 60 */ u8 unk_60;
    /* 61 */ u8 unk_61;
    /* 62 */ u8 unk_62;
    /* 63 */ u8 unk_63;
    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

struct BmShop2Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x54-0x29];

    /* 54 */ struct BmShopProc* unk_54;
};

typedef void (*ShopFunc)(struct BmShopProc*, int);


extern int gUnknown_08A3918C[]; // portrait lut
extern int gUnknown_08A39180[]; // dialogue lut

extern u16 gUnknown_08A39170[]; // default inventory?

extern struct ProcCmd gUnknown_08A39210[];

extern struct ProcCmd gUnknown_08A394C0[];

extern struct TextHandle gUnknown_0203EF68[];
extern u16 gUnknown_02023CB6[]; // offset of BG2

extern struct ProcCmd gUnknown_08A39198[];

extern struct ProcCmd gUnknown_08A391D0[];

extern u8 gUnknown_089AD934[]; // tsa

extern u16 gUnknown_08B1754C[]; // pal
extern u8 gUnknown_08B12DB4[]; // gfx

extern u8 gUnknown_08A295D4[]; // tsa

extern u16 gUnknown_02022E5E[];

extern u16 gUnknown_089AD9F8[]; // pal

extern struct ProcCmd gUnknown_08A394C0[];

extern u16 gUnknown_02022E60[]; // offset of bg0

extern int gUnknown_0203EFB4;

extern struct ProcCmd gUnknown_08A39488[];

struct TextHandle gUnknown_03001DA0;

extern u16 gUnknown_02023CB6[]; // offset of bg

extern struct ProcCmd gUnknown_08A39478[];

extern u16 gUnknown_08A39498[]; // sprite

extern u8 gUnknown_08A1C704[]; // icon gfx?
extern u16 gUnknown_08A1A084[]; // pal

struct ShopState {
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0A;
    /* 0C */ u16 unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ ShopFunc unk_14;
    /* 18 */ ProcPtr unk_18;
};

extern struct ShopState gUnknown_0203EF98;
extern struct ShopState* gUnknown_08A394D8;// = &gUnknown_0203EF98;


// forward declaration
void MakeShop(struct Unit*, u16*, u8, ProcPtr);
void sub_80B42B4(struct BmShopProc*);
void sub_80B4F04(struct BmShopProc*);
void sub_80B505C(struct BmShopProc*);
void sub_80B5164(struct TextHandle*, int, struct Unit*, u16*);
void sub_80B51C0(struct TextHandle*, int, struct Unit*, u16*);
void sub_80B55AC(u16, u16, u16, u16, int, ShopFunc, struct BmShopProc*);
void sub_80B5604(void);
int sub_80B5698(void);
u16 sub_80B568C(void);
u16 sub_80B56A8(void);
void sub_80B5384(void);
s8 sub_80B56CC(void);
u16 sub_80B5220(struct Unit*, int);
void sub_80B5440(struct BmShopProc*);
s8 sub_80B527C(int);
u16 sub_80B5268(int);
void sub_80B4ED4(u16*);
void sub_80B52CC(void);
void sub_80B53BC(int, int);
void sub_80B4E24(struct BmShopProc*);
void sub_80B4F90(struct BmShopProc*);
void sub_80B4E88(u16*);
void sub_80B53F8(int, int, u16, int);
s8 sub_80B56F0(void);
s8 sub_80B570C(void);


int Shop6C_GetPortraitIndex(struct BmShopProc* proc) {
    return gUnknown_08A3918C[proc->unk_61];
}

void sub_80B4168(int baseMsgId, struct BmShopProc* proc) {
    int idx = baseMsgId + gUnknown_08A39180[proc->unk_61];

    sub_8006978();
    sub_8008250();

    sub_800698C(8, 2, GetStringFromIndex(idx), proc);

    sub_8006B10(0);

    sub_8006AA8(1);
    sub_8006AA8(2);
    sub_8006AA8(4);

    sub_8007838(1);

    return;
}

void sub_80B41C0(struct Unit* unit, ProcPtr proc) {
    MakeShop(unit, 0, 0, proc);
    return;
}

void sub_80B41D0(struct Unit* unit, u16* shopItems) {
    MakeShop(unit, shopItems, 0, 0);
    return;
}

void MakeShopArmory(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    MakeShop(unit, shopItems, 0, parent);
    return;
}

void sub_80B41F0(struct Unit* unit, u16* shopItems) {
    MakeShop(unit, shopItems, 1, 0);
    return;
}

void MakeShopVendor(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    MakeShop(unit, shopItems, 1, parent);
    return;
}

void sub_80B4210(struct Unit* unit, u16* shopItems) {
    MakeShop(unit, shopItems, 2, 0);
    return;
}

void sub_80B4220(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    MakeShop(unit, shopItems, 2, parent);
    return;
}

void sub_80B4230(struct Unit* unit, u16* shopItems) {
    MakeShop(unit, shopItems, 0, 0);
    return;
}

void MakeShop(struct Unit* unit, u16* inventory, u8 shopType, ProcPtr parent) {
    struct BmShopProc* proc;
    u16* shopItems;
    int i;

    EndPlayerPhaseSideWindows();

    if (parent != 0) {
        proc = Proc_StartBlocking(gUnknown_08A39210, parent);
    } else {
        proc = Proc_Start(gUnknown_08A39210, PROC_TREE_3);
    }

    proc->unk_61 = shopType;
    proc->unk_2c = unit;

    shopItems = gUnknown_08A39170;
    if (inventory != 0) {
        shopItems = inventory;
    }

    for (i = 0; i <= 0x14; i++) {
        u16 itemId = *shopItems++;

        proc->unk_30[i] = MakeNewItem(itemId);
    }

    sub_80B42B4(proc);

    return;
}

void sub_80B42B4(struct BmShopProc* proc) {
    int count = 0;

    if (*(proc->unk_30) != 0) {
        u16* item = proc->unk_30;
        count = 0;

        while (*item != 0) {
            item++;
            count++;
        }
    }

    proc->unk_5a = count;

    proc->unk_5b = GetUnitItemCount(proc->unk_2c);

    return;
}

void sub_80B42E8(void) {
    struct BmShopProc* proc = Proc_Find(gUnknown_08A39210);

    if (proc->unk_60 != 0) {
        sub_80B4F04(proc);
    }

    return;
}

void sub_80B4308(void) {
    struct BmShopProc* proc = Proc_Find(gUnknown_08A39210);

    if (proc->unk_60 != 1) {
        sub_80B505C(proc);
    }

    return;
}

void sub_80B4328(void) {
    return;
}

void sub_80B432C(struct BmShopProc* proc) {

    if (proc->unk_2c == 0) {
        Proc_Goto(proc, 0xD);
    } else {
        sub_80B4168(0x89A, proc);
    }

    return;
}

void sub_80B4350(struct BmShopProc* proc) {
    switch (sub_8008A00()) {
        case 0:
        default:
            Proc_Goto(proc, 0xC);

            return;

        case 1:
            Proc_Goto(proc, 1);

            return;

        case 2:
            if (GetUnitItemCount(proc->unk_2c) == 0) {
                sub_80B4168(0x8AC, proc);
                Proc_Goto(proc, 7);
            } else {
                Proc_Goto(proc, 4);
            }

    }
    return;
}

void sub_80B43A8(struct BmShopProc* proc) {
    sub_80B4168(0x8A3, proc);
    return;
}

void sub_80B43BC(struct BmShopProc* proc, int itemIndex) {
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetFont(0);
    Font_LoadForUI();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Text_Clear(&gUnknown_0203EF68[index]);

    item = proc->unk_30[itemIndex];

    if (item != 0) {
        sub_80B5164(&gUnknown_0203EF68[index], item, proc->unk_2c, gUnknown_02023CB6 + (itemIndex * 2 & 0x1F) * 0x20);
    }

    return;
}

void sub_80B4418(struct BmShopProc* proc, int itemIndex) {
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetFont(0);
    Font_LoadForUI();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Text_Clear(&gUnknown_0203EF68[index]);

    item = proc->unk_30[itemIndex];

    if (item != 0) {
        sub_80B51C0(&gUnknown_0203EF68[index], item, proc->unk_2c, gUnknown_02023CB6 + (itemIndex * 2 & 0x1F) * 0x20);
    }

    return;
}

void sub_80B4474(struct BmShopProc* proc) {
    sub_80B55AC(proc->unk_5e, proc->unk_5a, 5, proc->unk_5f, 0x48, &sub_80B43BC, proc);
    return;
}

void sub_80B44A8(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkB;
    u32 unkC;
    int price;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->unk_5c;
    unkB = sub_80B568C() ^ unkA;
    unkC = (-(unkB) | unkB) >> 31;

    proc->unk_5c = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    proc->unk_5e = proc->unk_5c;
    proc->unk_5f = proc->unk_5d;

    #if NONMATCHING

    a = (proc->unk_5c * 0x10);

    #else // if !NONMATCHING

    asm("\n\
        ldrb %0, [r6]\n\
        lsl %0, %0, #4\n\
    " : "=r" (a));

    #endif // NONMATCHING

    b = ((proc->unk_5d * 0x10)) - 0x48;

    DisplayUiHand(0x38, a - b);

    if ((proc->unk_62 != 0) && (unkC != 0)) {
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_30[proc->unk_5c]);
    }

    sub_80B5384();

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->unk_62 != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->unk_62 = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->unk_62 = 1;
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_30[proc->unk_5c]);

        return;
    }

    price = sub_80B5220(proc->unk_2c, proc->unk_30[proc->unk_5c]);

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (price > (int)GetPartyGoldAmount()) {
            sub_80B4168(0x8B2, proc);

            Proc_Goto(proc, 1);
        } else {
            sub_8008A18(price);
            sub_80B4168(0x8B5, proc);

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 7);

        return;
    }

    return;
}

void sub_80B4630(struct BmShopProc* proc) {
    if (sub_8008A00() != 1) {
        Proc_Goto(proc, 1);
    }

    return;
}

void sub_80B464C(struct BmShopProc* proc) {
    if (proc->unk_5b >= 5) {
        if (HasConvoyAccess() != 0) {
            sub_80B4168(0x8BE, proc);
        } else {
            sub_80B4168(0x8C1, proc);
            Proc_Goto(proc, 0xB);
        }

        return;
    }

    UnitAddItem(proc->unk_2c, proc->unk_30[proc->unk_5c]);
    sub_80B5440(proc);

    Proc_Goto(proc, 3);

    return;
}

void sub_80B46B0(struct BmShopProc* proc) {
    if (sub_8008A00() != 1) {
        Proc_Goto(proc, 0xB);
    }

    return;
}

void sub_80B46CC(struct BmShopProc* proc) {
    if (HasConvoyAccess()) {
        sub_80B4168(0x8C7, proc);
    } else {
        sub_80B4168(0x8CA, proc);
    }

    return;
}

void sub_80B46FC(struct BmShopProc* proc) {
    AddItemToConvoy(proc->unk_30[proc->unk_5c]);
    sub_80B5440(proc);
    return;
}

void sub_80B471C(struct BmShopProc* proc) {
    sub_80B4168(0x8C4, proc);
    return;
}

void sub_80B4730(struct BmShopProc* proc) {
    if (GetConvoyItemCount() < CONVOY_ITEM_COUNT) {
        Proc_Goto(proc, 10);
    }

    return;
}

void sub_80B474C(struct BmShopProc* proc) {
    sub_80B4168(0x8CD, proc);
    return;
}

void sub_80B4760(struct BmShopProc* proc) {
    sub_80B4168(0x8A6, proc);
    return;
}

void sub_80B4774(struct BmShopProc* proc) {
    sub_80B4168(0x8A9, proc);
    return;
}

void sub_80B4788(struct BmShopProc* proc) {
    sub_80B55AC(proc->unk_5c, proc->unk_5b, 5, 0, 0x48, sub_80B4418, proc);
    return;
}

void sub_80B47B4(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkB;
    u32 unkC;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->unk_5c;
    unkB = sub_80B568C() ^ unkA;
    unkC = (-(unkB) | unkB) >> 31;

    proc->unk_5c = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    #if NONMATCHING

    a = (proc->unk_5c * 0x10);

    #else // if !NONMATCHING

    asm("\n\
        ldrb %0, [r6]\n\
        lsl %0, %0, #4\n\
    " : "=r" (a));

    #endif // NONMATCHING

    b = ((proc->unk_5d * 0x10)) - 0x48;

    DisplayUiHand(0x38, a - b);

    if ((proc->unk_62 != 0) && (unkC != 0)) {
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_2c->items[proc->unk_5c]);
    }

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->unk_62 != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->unk_62 = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->unk_62 = 1;
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_2c->items[proc->unk_5c]);

        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (sub_80B527C(proc->unk_2c->items[proc->unk_5c]) == 0) {
            sub_80B4168(0x8BB, proc);
            Proc_Goto(proc, 4);
        } else {
            sub_8008A18(sub_80B5268(proc->unk_2c->items[proc->unk_5c]));
            sub_80B4168(0x8B5, proc);

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 8);

        return;
    }

    return;
}

void sub_80B4930(struct BmShopProc* proc) {
    if (sub_8008A00() == 1) {
        sub_8014B88(0xB9, 8);

        gActionData.unitActionType = UNIT_ACTION_SHOPPED;

        SetPartyGoldAmount(GetPartyGoldAmount() + sub_80B5268(proc->unk_2c->items[proc->unk_5c]));

        UnitRemoveItem(proc->unk_2c, proc->unk_5c);

        sub_80B42B4(proc);
        sub_80B505C(proc);
        sub_80B4ED4(gUnknown_02022E5E);

        if (proc->unk_5b == 0) {
            Proc_Goto(proc, 7);
        }
    } else {
        Proc_Goto(proc, 4);
    }

    return;
}

void sub_80B49B8(struct BmShopProc* proc) {
    sub_80B4168(0x8AF, proc);
    return;
}

void sub_80B49CC(struct BmShopProc* proc) {
    proc->unk_5c = 0;
    sub_80B4168(0x89D, proc);
    return;
}

void sub_80B49E8(struct BmShopProc* proc) {
    sub_80B4168(0x8A0, proc);
    return;
}

void sub_80B49F8(struct BmShopProc* proc) {

    if (proc->unk_2c == 0) {
        sub_80B4168(0x898, proc);
    } else {
        sub_80B4168(0x8B8, proc);
    }

    return;
}

void sub_80B4A20(void) {
    Proc_EndEach(gUnknown_08A394C0);
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Show);

    return;
}

void sub_80B4A40(struct BmShopProc* proc) {
    sub_80B4168(0x896, proc);
    return;
}

void sub_80B4A54(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkB;
    u32 unkC;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->unk_5c;
    unkB = sub_80B568C() ^ unkA;
    unkC = (-(unkB) | unkB) >> 31;

    proc->unk_5c = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    proc->unk_5e = proc->unk_5c;
    proc->unk_5f = proc->unk_5d;

    #if NONMATCHING

    a = (proc->unk_5c * 0x10);

    #else // if !NONMATCHING

    asm("\n\
        ldrb %0, [r6]\n\
        lsl %0, %0, #4\n\
    " : "=r" (a));

    #endif // NONMATCHING

    b = ((proc->unk_5d * 0x10)) - 0x48;

    DisplayUiHand(0x38, a - b);

    if ((proc->unk_62 != 0) && (unkC != 0)) {
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_30[proc->unk_5c]);
    }

    sub_80B5384();

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->unk_62 != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->unk_62 = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->unk_62 = 1;
        a = (proc->unk_5c * 0x10);
        b = ((proc->unk_5d * 0x10) - 0x48);
        StartItemHelpBox(0x38, a - b, proc->unk_30[proc->unk_5c]);

        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 0xC);

        return;
    }

    return;
}

void sub_80B4B7C(struct BmShopProc* proc) {

    if (gGameState.gameStateBits & 0x10) {
        return;
    }

    if (gUnknown_03005280.state & GMAP_STATE_BIT0) {
        return;
    }

    Proc_StartBlocking(gUnknown_08A39198, proc);

    return;
}

void sub_80B4BB0(struct BmShopProc* proc) {

    if ((!(gGameState.gameStateBits & 0x10)) && (!(gUnknown_03005280.state & GMAP_STATE_BIT0))) {
        Proc_StartBlocking(gUnknown_08A391D0, proc);
        return;
    }

    ResetDialogueScreen();

    return;
}

void sub_80B4BEC(struct BmShopProc* proc) {
    int i;

    if (proc->unk_61 == 0) {
        Sound_PlaySong80024D4(0x36, 0);
    } else {
        Sound_PlaySong80024D4(0x35, 0);
    }

    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Hide);

    sub_80B52CC();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    sub_800680C(0x200, 2, 0);

    ResetFaces();

    proc->unk_5c = 0;
    proc->unk_5e = 0;
    proc->unk_5f = 0;
    proc->unk_5d = 0;
    proc->unk_60 = 0;
    proc->unk_62 = 0;

    sub_80B53BC(0x240, 3);

    sub_8007938(Shop6C_GetPortraitIndex(proc), 0x20, 8, 3, 1);

    CopyDataWithPossibleUncomp(gUnknown_089AD934, gUnknown_02020188);
    CallARM_FillTileRect(gBG1TilemapBuffer, gUnknown_02020188, 0x1000);

    DrawUiFrame2(6, 8, 0x14, 0xC, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    sub_80B4E24(proc);

    for (i = 0; i <= 5; i++) {
        Text_Init(&gUnknown_0203EF68[i], 0x14);
    }

    sub_80B4F90(proc);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win0_left = 0x38;
    gLCDControlBuffer.win0_top = 0x48;
    gLCDControlBuffer.win0_right = 0xF0;
    gLCDControlBuffer.win0_bottom = 0x98;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 8;
    gLCDControlBuffer.win1_right = 0xF0;
    gLCDControlBuffer.win1_bottom = 0x38;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetSpecialColorEffectsParameters(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x1C0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08B12DB4, (void *)(GetBackgroundTileDataOffset(3) + 0x6000000));

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A295D4, 0xE000);

    BG_EnableSyncByMask(8);

    return;
}

void sub_80B4E24(struct BmShopProc* parent) {
    struct BmShopProc* proc;

    CopyDataWithPossibleUncomp(gUnknown_089AD9F8, (void *)0x06014C00);

    proc = Proc_Start(gUnknown_08A394C0, parent);
    proc->unk_64 = 0xAC;
    proc->unk_66 = 0x2D;
    proc->unk_68 = 0x4260;

    CopyToPaletteBuffer(gUiFramePaletteA, 0x280, 0x20);

    sub_80B4E88(gUnknown_02022E60);

    sub_80B4ED4(gUnknown_02022E60 - 1);

    return;
}

void sub_80B4E88(u16* tm) {
    SetFont(0);
    Font_LoadForUI();

    Text_Init(&gUnknown_03001DA0, 1);

    sub_8004B0C(tm, 3, 0x1E);

    return;
}

void sub_80B4EB4(u16* tm, int num) {

    while (num > 0) {
        *tm = 0;
        *(tm + 0x20) = 0;

        tm--;
        num--;
    }

    return;
}

void sub_80B4ED4(u16* tm) {
    SetFont(0);
    Font_LoadForUI();

    sub_80B4EB4(tm, 6);
    sub_8004B88(tm, 2, GetPartyGoldAmount());

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

void sub_80B4F04(struct BmShopProc* parent) {
    struct BmShop2Proc* proc;
    int i;

    parent->unk_60 = 0;

    proc = Proc_Start(gUnknown_08A39478, PROC_TREE_3);
    proc->unk_54 = parent;

    SetFont(0);
    Font_LoadForUI();

    for (i = parent->unk_5f; i < parent->unk_5f + 5; i++) {
        Text_DrawBlank(&gUnknown_0203EF68[DivRem(i, 6)],gUnknown_02023CB6 + (((i*2) & 0x1F) * 0x20));
    }

    BG_SetPosition(2, 0, (((parent->unk_5f) << 0x14) + 0xFFB80000) >> 0x10);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B4F90(struct BmShopProc* proc) {
    int item;
    int index;
    int i;

    SetFont(0);
    Font_LoadForUI();

    for (i = proc->unk_5f; i < proc->unk_5f + 5; i++) {
        index = DivRem(i, 6);
        Text_Clear(&gUnknown_0203EF68[index]);
    }

    for (i = proc->unk_5f; i < proc->unk_5f + 5; i++) {
        index = DivRem(i,6);
        item = proc->unk_30[i];

        if (item == 0) {
            break;
        }

        sub_80B5164(&gUnknown_0203EF68[index], item, proc->unk_2c, gUnknown_02023CB6 + ((i * 2) & 0x1F) * 0x20);
    }

    BG_SetPosition(2, 0, ((proc->unk_5f << 0x14) + 0xFFB80000) >> 0x10);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B5040(struct BmShop2Proc* proc) {
    sub_80B4474(proc->unk_54);
    sub_80B4F90(proc->unk_54);

    Proc_Break(proc);

    return;
}

void sub_80B505C(struct BmShopProc* parent) {
    struct BmShop2Proc* proc;
    int i;

    parent->unk_60 = 1;

    proc = Proc_Start(gUnknown_08A39488, PROC_TREE_3);
    proc->unk_54 = parent;

    SetFont(0);
    Font_LoadForUI();

    for (i = 0; i < 5; i++) {
        Text_DrawBlank(&gUnknown_0203EF68[DivRem(i, 6)], gUnknown_02023CB6 + ((i * 2) & 0x1F) * 0x20);
    }

    BG_SetPosition(2, 0, 0x0000FFB8);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B50C8(struct BmShopProc* proc) {
    int i;
    int index;

    SetFont(0);
    Font_LoadForUI();

    for (i = 0; i < 5; i++) {
        index = DivRem(i, 6);
        Text_Clear(&gUnknown_0203EF68[index]);
    }

    for (i = 0; i < 5; i++) {
        int item;

        index = DivRem(i, 6);
        item = proc->unk_2c->items[i];

        if (item == 0) {
            break;
        }

        sub_80B51C0(&gUnknown_0203EF68[index], item, proc->unk_2c, gUnknown_02023CB6 + ((i * 2) & 0x1F) * 0x20);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B5148(struct BmShop2Proc* proc) {
    sub_80B4788(proc->unk_54);
    sub_80B50C8(proc->unk_54);

    Proc_Break(proc);

    return;
}

void sub_80B5164(struct TextHandle* th, int item, struct Unit* unit, u16* dst) {
    u8 visible;

    int price = sub_80B5220(unit, item);

    if (unit == 0) {
        visible = 1;
    } else {
        visible = IsItemDisplayUsable(unit, item);
    }

    DrawItemMenuLine(th, item, visible, dst);

    sub_8004B88(
        dst + 0x11,
        (int)GetPartyGoldAmount() >= price
            ? 2
            : 1,
        price
    );

    return;
}

void sub_80B51C0(struct TextHandle* th, int item, struct Unit* unit, u16* dst) {

    DrawItemMenuLine(th, item, IsItemDisplayUsable(unit, item), dst);

    if (sub_80B527C(item) != 0) {
        sub_8004B88(dst + 0x11, 2, sub_80B5268(item));
    } else {
        Text_InsertString(th, 0x5C, 2, GetStringFromIndex(0x537));
    }

    return;
}

u16 sub_80B5220(struct Unit* unit, int item) {
    int cost = GetItemCost(item);

    if (gGameState.gameStateBits & 0x10) {
        cost = cost + (cost / 2);
    }

    if (UnitHasItem(unit, ITEM_SILVERCARD)) {
        return (cost / 2);
    } else {
        return cost;
    }
}

u16 sub_80B5268(int item) {
    return GetItemCost(item) / 2;
}

s8 sub_80B527C(int item) {
    if (GetItemAttributes(item) & IA_UNSELLABLE) {
        return 0;
    }

    if (sub_80B5268(item) == 0) {
        return 0;
    }

    return 1;
}

void sub_80B52A4(struct BmShopProc* proc) {
    CallARM_PushToSecondaryOAM(proc->unk_64, proc->unk_66, gUnknown_08A39498, proc->unk_68);
    return;
}

void sub_80B52CC(void) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;


    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(0xF);

    Font_InitForUIDefault();
    LoadUiFrameGraphics();

    ResetIconGraphics_();

    LoadIconPalettes(4);

    LoadDialogueBoxGfx(0, -1);

    return;
}

void sub_80B5378(void) {
    sub_80B5384();
    return;
}

void sub_80B5384(void) {
    if (sub_80B56F0() != 0) {
        sub_80B53F8(0x78, 0x40, 0x3240, 1);
    }

    if (sub_80B570C() != 0) {
        sub_80B53F8(0x78, 0x98, 0x3240, 0);
    }

    return;
}

void sub_80B53BC(int index, int palIdx) {
    CopyDataWithPossibleUncomp(gUnknown_08A1C704, (void *)((0x3FF & index) * 0x20 + 0x06010000));
    CopyToPaletteBuffer(gUnknown_08A1A084, (palIdx + 0x10) * 0x20, 0x20);

    return;
}

void sub_80B53F8(int x, int y, u16 oam2Base, int d) {
    int vflip;

    int offset = Div(DivRem(GetGameClock(), 0x28), 8) * 2;

    vflip = 0;
    if (d == 0) {
        vflip = 0x2000;
    }

    PutSpriteExt(
        2,
        x | vflip,
        y,
        gObject_16x8,
        (oam2Base) + offset
    );

    return;
}

void sub_80B5440(struct BmShopProc* proc) {
    sub_8014B88(0xB9, 8);

    gActionData.unitActionType = UNIT_ACTION_SHOPPED;

    SetPartyGoldAmount(GetPartyGoldAmount() - sub_80B5220(proc->unk_2c, proc->unk_30[proc->unk_5c]));

    sub_80B42B4(proc);
    sub_80B4F90(proc);

    sub_80B4ED4(gUnknown_02022E5E);

    return;
}

int sub_80B5498(int pos, int lastIdx, s8 unk) {
    int previous;

    if (pos < 0) {
        pos = 0;
    }

    if (pos >= lastIdx) {
        pos = lastIdx - 1;
    }

    previous = pos;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (pos == 0) {
            if ((unk != 0) && (gKeyStatusPtr->newKeys & DPAD_UP)) {
                pos = lastIdx - 1;
            }
        } else {
            pos--;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (pos == (lastIdx - 1)) {
            if ((unk != 0) && (gKeyStatusPtr->newKeys & DPAD_DOWN)) {
                pos = 0;
            }
        } else {
            pos++;
        }
    }

    if (previous != pos) {
        PlaySoundEffect(0x66);
    }

    return pos;
}

void sub_80B5528(int unk) {
    gUnknown_0203EFB4 = unk;
    return;
}

int sub_80B5534(int a, int b, int c, int d) {
    int var = gUnknown_0203EFB4;

    gUnknown_0203EFB4 = a;

    if (a == var) {
        return 0;
    }

    if (c > b) {
        return 0;
    }

    if (a < var) {
        if ((d != 0) && ((a - d) < 1)) {
            return -1;
        }
    } else if (((c + d) != b) && ((a - d) >= (c - 1))) {
        return 1;
    }

    return 0;
}

#if NONMATCHING

int sub_80B557C(int a, int b, int c) {

    if (a - b >= 0) {
        if (a - b < c) {
            return b;
        }

    } else {
        if (b - a < c) {
            return b;
        }
    }

    if (b - a <= 0) {
        return b - a >= 0
            ? a
            : a - c;
    } else {
        b = a + c;
    }

    return b;
}

#else // if !NONMATCHING

__attribute__((naked))
int sub_80B557C(int a, int b, int c) {

    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        subs r3, r0, r1\n\
        cmp r3, #0\n\
        blt _080B558C\n\
        cmp r3, r2\n\
        blt _080B5592\n\
        subs r3, r1, r0\n\
        b _080B5596\n\
    _080B558C:\n\
        subs r3, r1, r0\n\
        cmp r3, r2\n\
        bge _080B5596\n\
    _080B5592:\n\
        adds r0, r1, #0\n\
        b _080B55A8\n\
    _080B5596:\n\
        cmp r3, #0\n\
        bgt _080B55A4\n\
        adds r1, r0, #0\n\
        cmp r3, #0\n\
        bge _080B55A6\n\
        subs r1, r0, r2\n\
        b _080B55A6\n\
    _080B55A4:\n\
        adds r1, r0, r2\n\
    _080B55A6:\n\
        adds r0, r1, #0\n\
    _080B55A8:\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");

}

#endif

void sub_80B55AC(u16 a, u16 b, u16 c, u16 d, int e, ShopFunc func, struct BmShopProc* proc) {

    sub_80B5528(a);

    gUnknown_08A394D8->unk_00 = a;
    gUnknown_08A394D8->unk_02 = b;
    gUnknown_08A394D8->unk_04 = c;
    gUnknown_08A394D8->unk_06 = d;
    gUnknown_08A394D8->unk_08 = 16;
    gUnknown_08A394D8->unk_0A = 4;

    gUnknown_08A394D8->unk_14 = func;
    gUnknown_08A394D8->unk_18 = proc;

    gUnknown_08A394D8->unk_10 = -e;

    gUnknown_08A394D8->unk_0C = d * 16;

    return;
}

void sub_80B5604(void) {

    gUnknown_08A394D8->unk_00 = sub_80B5498(gUnknown_08A394D8->unk_00, gUnknown_08A394D8->unk_02, 0);

    switch (sub_80B5534(gUnknown_08A394D8->unk_00, gUnknown_08A394D8->unk_02, gUnknown_08A394D8->unk_04, gUnknown_08A394D8->unk_06)) {
        case 0:
            break;

        case +1:
            gUnknown_08A394D8->unk_06++;

            gUnknown_08A394D8->unk_14(gUnknown_08A394D8->unk_18, gUnknown_08A394D8->unk_06 + gUnknown_08A394D8->unk_04 - 1);

            break;

        case -1:
            gUnknown_08A394D8->unk_06--;

            gUnknown_08A394D8->unk_14(gUnknown_08A394D8->unk_18, gUnknown_08A394D8->unk_06);

            break;
    }

    gUnknown_08A394D8->unk_0C = sub_80B557C(gUnknown_08A394D8->unk_0C, gUnknown_08A394D8->unk_06 * gUnknown_08A394D8->unk_08, gUnknown_08A394D8->unk_0A);

    return;
}

u16 sub_80B568C(void) {
    return gUnknown_08A394D8->unk_00;
}

int sub_80B5698(void) {
    return gUnknown_08A394D8->unk_10 + gUnknown_08A394D8->unk_0C;
}

u16 sub_80B56A8(void) {
    return gUnknown_08A394D8->unk_06;
}

void sub_80B56B4(int unk) {
    gUnknown_08A394D8->unk_08 = unk;
    return;
}

void sub_80B56C0(int unk) {
    gUnknown_08A394D8->unk_0A = unk;
    return;
}

s8 sub_80B56CC(void) {
    if (gUnknown_08A394D8->unk_0C != (gUnknown_08A394D8->unk_06 * gUnknown_08A394D8->unk_08)) {
        return 1;
    }

    return 0;
}

s8 sub_80B56F0(void) {
    if (gUnknown_08A394D8->unk_06 != 0) {
        return 1;
    }

    return 0;
}

s8 sub_80B570C(void) {
    if (gUnknown_08A394D8->unk_06 + gUnknown_08A394D8->unk_04 < gUnknown_08A394D8->unk_02) {
        return 1;
    }

    return 0;
}