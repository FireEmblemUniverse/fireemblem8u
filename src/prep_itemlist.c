#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "prepscreen.h"

struct PrepItemListProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit* unk_2c;
    /* 30 */ u8 unk_30; // index into unit's inventory
    /* 31 */ s8 unk_31; // scroll amount? when L is held
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33; // "page" (item type)
    /* 34 */ u16 unk_34; // initialized to 0xff and untouched
    /* 36 */ u16 unk_36; // 1 when helpbox is open, 0 (or 0xff?) when closed
    /* 38 */ u16 unk_38[9]; // cursor index per item type
    /* 4A */ u16 unk_4a[9]; // y offset per item type?
};

struct Struct20122D4 {
    /* 00 */ u8 pid; // 0 if item is in Supply inventory
    /* 01 */ u8 itemSlot;
    /* 02 */ u16 item;
};

extern struct Struct20122D4 gUnknown_020122D4[];

extern u16 gUnknown_02012F56;

struct GMapBaseMenuProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
};

struct GMapBaseMenuProc* sub_80C4048(void);

extern struct TextHandle gUnknown_02013660[16];

void sub_8098C3C(int, int);
void sub_809D300(void*, void*, int, void*);
void sub_809D418(u16*, int);
void sub_809D47C(struct TextHandle*, u16*, int, struct Unit*);
void sub_809D8D4(u16*, int, int);
void sub_80ACD7C(int, int, int, int);
void sub_80ACDA4(int);
void sub_80ACCE0(ProcPtr);
void sub_80ACCF4(int, int, int);

void StoreConvoyWeaponIconGraphics(int, int);

extern u8 gUnknown_08A19CCC[]; // gfx
extern u8 gUnknown_08A1B9EC[]; // tsa
extern u16 gUnknown_08A1A084[]; // pal

extern u16 gUnknown_08A1BD60[];
extern u16* gUnknown_08A19608[];
extern u16 gUnknown_08A195F8[];

// forward declarations

void sub_809EBF0(void);
void sub_809EC38(struct PrepItemListProc*);
void sub_809ECFC(struct PrepItemListProc*);
void sub_809F150(struct PrepItemListProc*);
void sub_809F370(struct PrepItemListProc*);
void sub_809F5F4(struct PrepItemListProc*);

//! FE8U = 0x0809EB78
void sub_809EB78(struct PrepItemListProc* proc) {
    int i;

    struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);

    proc->unk_36 = 0;
    proc->unk_34 = 0xff;

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = sub_80C4048();

        if (pGMapBaseMenuProc) {
            proc->unk_33 = pGMapBaseMenuProc->unk_2a;
        } else {
            proc->unk_33 = 0;
        }
    } else {
        proc->unk_33 = pAtMenuProc->unk_31;
    }

    proc->unk_31 = 4;
    proc->unk_30 = 0;

    for (i = 0; i < 9; i++) {
        proc->unk_38[i] = 0;
        proc->unk_4a[i] = 0;
    }

    return;
}

//! FE8U = 0x0809EBF0
void sub_809EBF0(void) {
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 0xc, 1, 0);

    DrawTextInline(gUnknown_02013660 + 15, gBG0TilemapBuffer + 0x34, 0, 0, 0, GetStringFromIndex(0x5A9));

    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x0809EC38
void sub_809EC38(struct PrepItemListProc* proc) {
    int idx = proc->unk_38[proc->unk_33];

    TileMap_FillRect(gBG0TilemapBuffer + 0x38, 10, 1, 0);

    Text_Clear(gUnknown_02013660 + 1);

    if (gUnknown_02012F56 <= idx) {
        DrawTextInline(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 1, 0, 0, GetStringFromIndex(0x536));
    } else {
        int charId = gUnknown_020122D4[proc->unk_38[proc->unk_33]].pid;

        if (charId == 0) {
            DrawTextInline(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 3, 0, 0, GetStringFromIndex(0x598));
        } else {
            DrawTextInline(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 0, 0, 0, GetStringFromIndex(GetUnitFromCharId(charId)->pCharacterData->nameTextId));
        }
    }

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x0809ECFC
void sub_809ECFC(struct PrepItemListProc* proc) {
    int x = proc->unk_33 * 12 + 124;

    gPaletteBuffer[0x14D] = *(gUnknown_08A1BD60 + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 0x18, gUnknown_08A19608[proc->unk_33], 0x4280);
    PutSprite(4, x, 0x18, gUnknown_08A195F8, 0x4280);

    sub_80976CC(0xc, proc->unk_4a[proc->unk_33], gUnknown_02012F56, 7);

    return;
}

//! FE8U = 0x0809ED8C
void sub_809ED8C(struct PrepItemListProc* proc) {
    int i;
    const char* str;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(NULL);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();
    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, proc->unk_4a[proc->unk_33] - 40);

    LoadHelpBoxGfx((void*)0x06012000, -1);
    LoadIconPalettes(4);

    EndSlidingWallEffectMaybe();

    PutImg_PrepItemUseUnk(0x5000, 5);

    Decompress(gUnknown_08A1B9EC, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

    sub_80AC9C0(proc);

    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 128;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 224;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    NewGreenTextColorManager(proc);

    StartHelpPromptSprite(195, 147, 9, proc);

    Text_Init(gUnknown_02013660 + 0, 6);
    Text_Init(gUnknown_02013660 + 1, 5);

    Text_Init(gUnknown_02013660 + 15, 4);

    for (i = 0; i < 5; i++) {
        Text_Init(gUnknown_02013660 + 2 + i, 7);
    }

    for (i = 0; i < 8; i++) {
        Text_Allocate(gUnknown_02013660 + 7 + i, 7);
    }

    StoreConvoyWeaponIconGraphics(0x4000, 6);

    sub_809D8D4(gBG0TilemapBuffer + 0x6F, 0x4000, 6);

    Decompress(gUnknown_08A19CCC, (void*)0x06015000);
    CopyToPaletteBuffer(gUnknown_08A1A084, 0x280, 0x20);

    PrepStartSideBarScroll(proc, 225, 47, 0x5800, 9);
    sub_8097668();
    SomethingPrepListRelated(proc->unk_2c, proc->unk_33, 3);
    sub_809F5F4(proc);

    sub_809D300(
        gUnknown_02013660 + 7,
        gBG2TilemapBuffer + 0xF,
        (proc->unk_4a[proc->unk_33]) >> 4,
        proc->unk_2c
    );

    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x6F + 0xb3, gUnknown_02013660 + 2, proc->unk_2c, 0);
    sub_809EBF0();

    sub_80ACCE0(proc);
    sub_80ACCF4(0, 0x280, 2);
    sub_80ACD7C(0x78, 0x18, 0xe9, 0x18);
    sub_80ACD60(3);

    StartParallelWorker(sub_809ECFC, proc);

    StartFace2(0, GetUnitPortraitId(proc->unk_2c), 64, -4, FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(FACE_HLAYER_3));

    str = GetStringFromIndex(proc->unk_2c->pCharacterData->nameTextId);

    StartSmallBrownNameBoxes(0xd, 0xe00, 0xf, 0xc00, 0x400, proc);

    SmallBrownNameBoxDoSomeConfig(0, -40, -1, 1);
    SmallBrownNameBoxDoSomeConfig(1, 0x98, 6, 2);

    SetSpecialColorEffectsParameters(1, 0xe, 4, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    DrawTextInline(gUnknown_02013660, gBG0TilemapBuffer, 0, GetStringTextCenteredPos(48, str), 0, str);

    sub_809EC38(proc);

    return;
}

//! FE8U = 0x0809F0FC
void sub_809F0FC(struct PrepItemListProc* proc) {

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = sub_80C4048();
        if (pGMapBaseMenuProc) {
            pGMapBaseMenuProc->unk_2a = proc->unk_33;
        }
    } else {
        struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
        pAtMenuProc->unk_31 = proc->unk_33;
    }

    EndAllProcChildren(proc);
    EndFaceById(0);
    EndBG3Slider_();

    return;
}

//! FE8U = 0x0809F150
void sub_809F150(struct PrepItemListProc* proc) {
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unk_2c, proc->unk_33, 3);
    sub_809F370(proc);

    sub_809D300(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, proc->unk_4a[proc->unk_33] >> 4, proc->unk_2c);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unk_2c);

    ShowPrepScreenHandCursor(
        0x80,
        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    StartParallelFiniteLoop(sub_809EC38, 2, (u32)proc);

    if (proc->unk_36 == 0) {
        return;
    }

    if (gUnknown_02012F56 != 0) {
        int item = gUnknown_020122D4[proc->unk_38[proc->unk_33]].item;
        StartItemHelpBox(
            0x80,
            proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
            item
        );
        proc->unk_36 = 1;
    } else {
        CloseHelpBox();
        proc->unk_36 = 0xff;
    }

    return;
}

//! FE8U = 0x0809F218
void sub_809F218(struct PrepItemListProc* proc) {
    int x;

    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four) {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_32 == four) {
        if (proc->unk_33 == 0) {
            proc->unk_33 = 8;
        } else {
            proc->unk_33--;
        }
        sub_809F150(proc);
    }

    if (proc->unk_32 >= four) {
        int tmp = four - (proc->unk_32 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    BG_SetPosition(2, (x & 0xff), proc->unk_4a[proc->unk_33] - 40);

    if (proc->unk_32 == four * 2) {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x0809F2C4
void sub_809F2C4(struct PrepItemListProc* proc) {
    int x;

    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four) {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_32 == four) {
        if (proc->unk_33 == 8) {
            proc->unk_33 = 0;
        } else {
            proc->unk_33++;
        }
        sub_809F150(proc);
    }

    if (proc->unk_32 >= four) {
        int tmp = four - (proc->unk_32 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    BG_SetPosition(2, (x & 0xff), proc->unk_4a[proc->unk_33] - 40);

    if (proc->unk_32 == four * 2) {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x0809F370
void sub_809F370(struct PrepItemListProc* proc) {
    if (gUnknown_02012F56 == 0) {
        proc->unk_38[proc->unk_33] = proc->unk_4a[proc->unk_33] = 0;
    } else {
        if ((proc->unk_38[proc->unk_33] > gUnknown_02012F56 - 1)) {
            proc->unk_38[proc->unk_33] = (gUnknown_02012F56 - 1);
        }
    }

    if (gUnknown_02012F56 > 6) {
        if (((proc->unk_4a[proc->unk_33] >> 4) + 7) > gUnknown_02012F56) {
            proc->unk_4a[proc->unk_33] = (gUnknown_02012F56 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->unk_4a[proc->unk_33] - 40);

    return;
}

//! FE8U = 0x0809F3F4
void sub_809F3F4(struct PrepItemListProc* proc, int amount) {
    ResetIconGraphics_();
    sub_809D418(gBG2TilemapBuffer + 0xF, proc->unk_4a[proc->unk_33] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unk_2c);
    BG_EnableSyncByMask(5);
    if (amount < 0) {
        sub_809D47C(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, (proc->unk_4a[proc->unk_33] >> 4) - 1,  proc->unk_2c);
    }

    if (amount > 0) {
        sub_809D47C(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, (proc->unk_4a[proc->unk_33] >> 4) + 7, proc->unk_2c);
    }

    proc->unk_4a[proc->unk_33] += amount;

    BG_SetPosition(2, 0, proc->unk_4a[proc->unk_33] - 40);

    return;
}

//! FE8U = 0x0809F498
void sub_809F498(struct PrepItemListProc* proc) {
    int count = GetUnitItemCount(proc->unk_2c);

    if ((count == 5) || (gUnknown_02012F56 == 0)) {
        PlaySoundEffect(0x6c);
        return;
    }

    proc->unk_36 = 0;

    proc->unk_2c->items[count] = gUnknown_020122D4[proc->unk_38[proc->unk_33]].item;
    UnitRemoveInvalidItems(proc->unk_2c);
    gUnknown_020122D4[proc->unk_38[proc->unk_33]].item = 0;

    sub_80982B8();

    SomethingPrepListRelated(proc->unk_2c, proc->unk_33, 3);
    sub_809F370(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gUnknown_02013660 + 2, proc->unk_2c, 0);
    sub_809D300(
        gUnknown_02013660 + 7,
        gBG2TilemapBuffer + 0xF,
        proc->unk_4a[proc->unk_33] >> 4,
        proc->unk_2c
    );

    if (gUnknown_020122D4[proc->unk_38[proc->unk_33]].pid != 0) {
        StartParallelFiniteLoop(sub_809EC38, 1, (u32)proc);
    }

    ShowPrepScreenHandCursor(
        0x80,
        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    if (GetUnitItemCount(proc->unk_2c) == 5) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x6b);
    } else {
        PlaySoundEffect(0x6a);
    }

    return;
}

//! FE8U = 0x0809F5F4
void sub_809F5F4(struct PrepItemListProc* proc) {

    if ((proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33] < 0x38) &&
        (proc->unk_38[proc->unk_33] != 0)) {
        proc->unk_38[proc->unk_33]++;
    }

    if ((0x78 < proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33]) &&
        (proc->unk_38[proc->unk_33] != gUnknown_02012F56 - 1)) {
        proc->unk_38[proc->unk_33]--;
    }

    sub_809F370(proc);

    ShowPrepScreenHandCursor(
        0x80,
        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
        0xb,
        0x800
    );

    return;
}

//! FE8U = 0x0809F688
void sub_809F688(struct PrepItemListProc* proc) {
    int idx = proc->unk_38[proc->unk_33];

    if ((proc->unk_4a[proc->unk_33] & 0xf) == 0) {
        if ((proc->unk_36 == 0) || (proc->unk_36 == 0xff)) {
            if (gKeyStatusPtr->newKeys & R_BUTTON) {
                if (gUnknown_02012F56 == 0) {
                    PlaySoundEffect(0x6c);
                    return;
                } else {
                    int item = gUnknown_020122D4[proc->unk_38[proc->unk_33]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
                        item
                    );
                    proc->unk_36 = 1;
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                if (gUnknown_02012F56 == 0) {
                    PlaySoundEffect(0x6c);
                    return;
                }

                if (gUnknown_020122D4[idx].pid == 0) {
                    sub_80AC9D4(
                        0,
                        0x80,
                        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
                        2
                    );
                    Proc_Goto(proc, 7);
                    PlaySoundEffect(0x6a);
                    return;
                } else {
                    Proc_Goto(proc, 6);
                    PlaySoundEffect(0x6a);
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Goto(proc, 8);
                PlaySoundEffect(0x6b);
                proc->unk_36 = 0;
                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                CloseHelpBox();
                proc->unk_36 = 0;
                return;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            sub_80ACDA4(0);
            PlaySoundEffect(0x67);
            Proc_Goto(proc, 3);
            proc->unk_32 = 0;
            sub_809F218(proc);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            sub_80ACDA4(1);
            PlaySoundEffect(0x67);
            Proc_Goto(proc, 4);
            proc->unk_32 = 0;
            sub_809F2C4(proc);
            return;
        }

        if (gKeyStatusPtr->heldKeys & L_BUTTON) {
            proc->unk_31 = 8;
        } else {
            proc->unk_31 = 4;
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) ||
            ((gKeyStatusPtr->heldKeys & DPAD_UP) && (proc->unk_31 == 8))) {
            if (proc->unk_38[proc->unk_33] != 0) {
                proc->unk_38[proc->unk_33]--;
            }
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) ||
            ((gKeyStatusPtr->heldKeys & DPAD_DOWN) && (proc->unk_31 == 8))) {
            if (proc->unk_38[proc->unk_33] < gUnknown_02012F56 - 1) {
                proc->unk_38[proc->unk_33]++;
            }
        }
    } else {
        if ((proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33]) < 0x38) {
            proc->unk_4a[proc->unk_33] -= proc->unk_31;
        }

        if ((proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33]) > 0x78) {
            proc->unk_4a[proc->unk_33] += proc->unk_31;
        }

        BG_SetPosition(2, 0, proc->unk_4a[proc->unk_33] - 40);
    }

    if (idx != proc->unk_38[proc->unk_33]) {
        u16 item = gUnknown_020122D4[proc->unk_38[proc->unk_33]].item;
        PlaySoundEffect(0x66);

        if (gUnknown_020122D4[proc->unk_38[proc->unk_33]].pid != gUnknown_020122D4[idx].pid) {
            sub_809EC38(proc);
        }

        if ((proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33] < 0x38) && (proc->unk_38[proc->unk_33] != 0)) {
            if (proc->unk_36 != 0) {
                StartItemHelpBox(
                    0x80,
                    proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33] + 16,
                    item
                );
            }

            sub_809F3F4(proc, -proc->unk_31);
        } else {
            if ((proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33] > 0x78)
                && (proc->unk_38[proc->unk_33] != gUnknown_02012F56 - 1)) {

                if (proc->unk_36 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33] - 0x10,
                        item
                    );
                }
                sub_809F3F4(proc, +proc->unk_31);
            } else {
                if (proc->unk_36 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
                        item
                    );
                }

                ShowPrepScreenHandCursor(
                    0x80,
                    proc->unk_38[proc->unk_33] * 16 + 40 - proc->unk_4a[proc->unk_33],
                    0xb,
                    0x800
                );
            }
        }
    }

    return;
}

//! FE8U = 0x0809FA88
s8 sub_809FA88(struct PrepItemListProc* proc) {
    int count = GetUnitItemCount(proc->unk_2c);
    u8 unitInvSlot = proc->unk_30;

    int maxSlot = count;
    if (count == 5) {
        maxSlot = 4;
    } else {
        if (proc->unk_36 != 0) {
            maxSlot = count - 1;
        }
    }

    if (count != 0) {
        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            if (proc->unk_30 != 0) {
                proc->unk_30--;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_UP) {
                    proc->unk_30 = maxSlot;
                }
            }
        }
        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            if (proc->unk_30 < maxSlot) {
                proc->unk_30++;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                    proc->unk_30 = 0;
                }
            }
        }

        if (unitInvSlot != proc->unk_30) {
            PlaySoundEffect(0x66);
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x0809FB34
void sub_809FB34(struct PrepItemListProc* proc) {
    int count = GetUnitItemCount(proc->unk_2c);

    if (count == 5) {
        proc->unk_30 = 4;
    } else {
        proc->unk_30 = count;
    }

    ShowPrepScreenHandCursor(16, proc->unk_30 * 16 + 72, 0xb, 0x800);

    return;
}

//! FE8U = 0x0809FB70
void sub_809FB70(struct PrepItemListProc* proc) {
    u16 idx = proc->unk_38[proc->unk_33];
    u16 item = proc->unk_2c->items[proc->unk_30];

    proc->unk_2c->items[proc->unk_30] = gUnknown_020122D4[idx].item;
    UnitRemoveInvalidItems(proc->unk_2c);
    gUnknown_020122D4[idx].item = item;

    sub_80982B8();
    if (item == 0) {
        SomethingPrepListRelated(proc->unk_2c, proc->unk_33, 3);
    }

    sub_809F370(proc);
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gUnknown_02013660 + 2, proc->unk_2c, 0);
    sub_809D300(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, proc->unk_4a[proc->unk_33] >> 4, proc->unk_2c);
    StartParallelFiniteLoop(sub_809EC38, 1, (u32)proc);
    BG_EnableSyncByMask(4);

    PlaySoundEffect(0x6a);

    return;
}

//! FE8U = 0x0809FC24
void sub_809FC24(struct PrepItemListProc* proc) {
    u16 item;

    if (proc->unk_36 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_36 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unk_2c->items[proc->unk_30];
            if (item == 0) {
                return;
            }
            StartItemHelpBox(16, proc->unk_30 * 16 + 72, item);
            proc->unk_36 = 1;
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (sub_8097F44(proc->unk_2c, proc->unk_30, gUnknown_020122D4[proc->unk_38[proc->unk_33]].item) == 0) {
                sub_8097DA8(-1, -1, 0x88B, proc);
                return;
            }
            sub_80ACA84(0);
            Proc_Break(proc);
            sub_809FB70(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            sub_80ACA84(0);
            Proc_Break(proc);
            PlaySoundEffect(0x6b);
            return;
        }
    }

    if (sub_809FA88(proc) != 0) {
        ShowPrepScreenHandCursor(16, proc->unk_30 * 16 + 72, 0xb, 0x800);
        if (proc->unk_36 == 1) {
            item = proc->unk_2c->items[proc->unk_30];
            if (item != 0) {
                StartItemHelpBox(16, proc->unk_30 * 16 + 72, item);
            }
        }
    }
    return;
}

//! FE8U = 0x0809FD54
void sub_809FD54(struct PrepItemListProc* proc) {
    struct Struct20122D4* ent = &gUnknown_020122D4[proc->unk_38[proc->unk_33]];

    sub_809BE60(
        proc->unk_2c,
        GetUnitFromCharId(ent->pid),
        ent->itemSlot,
        proc
    );
    return;
}

//! FE8U = 0x0809FD88
void StartPrepItemListScreenProc(struct Unit* unit, ProcPtr parent) {
    struct PrepItemListProc* proc = Proc_StartBlocking(ProcScr_PrepItemListScreen, parent);
    proc->unk_2c = unit;
    return;
}