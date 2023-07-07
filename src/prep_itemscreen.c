#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"

#include "prepscreen.h"

struct PrepItemScreenProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ s8 unk_32;
    /* 34 */ u16 unk_34;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 unk_38[2];
    /* 3C */ u16 unk_3c[2];
    /* 40 */ u16 unk_40[2];
    /* 44 */ struct Unit* unk_44[2];
};

struct ProcA18944 {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

struct ProcA1898C {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
};

// TODO: Are these all part of the same array of TextHandles?
extern struct TextHandle gUnknown_02013510[];
extern struct TextHandle gUnknown_02013538[];
extern struct TextHandle gUnknown_02013560[];
extern struct TextHandle gUnknown_02013570[];
extern struct TextHandle gUnknown_02013588[];

extern u8 Img_PrepTextShadow[];
extern u8 Img_PrepPopupWindow[];

extern u8 gUnknown_08A1B1FC[]; // gfx
extern u16 gUnknown_08A1B638[]; // pal

extern u8 gUnknown_08A1B8B8[]; // tsa
extern u8 gUnknown_08A1B990[]; // tsa


int CheckInLinkArena(void);

// Forward declarations

s8 sub_8098E40(struct PrepItemScreenProc*);
void sub_8098FAC(struct PrepItemScreenProc*);
void sub_8099E98(int, struct Unit*, u16, u16, u16);
void sub_8099F7C(struct TextHandle*, u16*, struct Unit*, u16);
void sub_809A08C(struct PrepItemScreenProc*);
void sub_809A114(struct PrepItemScreenProc*, u8, s8);
s8 sub_809A21C(u32, int);
void sub_809A274(struct PrepItemScreenProc*);
void sub_809A504(struct PrepItemScreenProc*, u8);
s8 sub_809A538(struct Unit*);


//! FE8U = 0x080983D4
void sub_80983D4(void) {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT) {
        vcount = 0;
    }

    if (vcount == 0) {
        REG_BG0VOFS = 248;
    }

    if (vcount == 72) {
        REG_BG0VOFS = 252;
    }

    return;
}

//! FE8U = 0x08098408
void sub_8098408(struct PrepItemScreenProc* proc) {
    proc->unk_29 = 0;

    proc->unk_2b = -1;
    proc->unk_2d = -1;
    proc->unk_2e = 0;
    proc->unk_34 = 0;
    proc->unk_44[1] = NULL;
    proc->unk_44[0] = NULL;
    proc->unk_2c = HasConvoyAccess_();
    return;
}

//! FE8U = 0x08098448
void sub_8098448(struct ProcA18944* proc) {
    Decompress(gUnknown_08A1B1FC, (void *)0x06013000);
    CopyToPaletteBuffer(gUnknown_08A1B638, (proc->unk_34 + 0x10) * 0x20, 0x20);
    return;
}

extern u16 gUnknown_08A18928[];

//! FE8U = 0x08098474
void sub_8098474(struct ProcA18944* proc) {
    if (proc->unk_38 != 0) {
        PutSpriteExt(
            4,
            proc->unk_2c,
            proc->unk_30,
            gUnknown_08A18928,
            OAM2_PAL(proc->unk_34) + 0x580
        );
    }
    return;
}

extern struct ProcCmd gUnknown_08A18944[];

//! FE8U = 0x080984A8
void sub_80984A8(int x, int y, int pal, ProcPtr parent) {
    struct ProcA18944* proc = Proc_Start(gUnknown_08A18944, parent);
    proc->unk_38 = 0;
    proc->unk_2c = x;
    proc->unk_30 = y;
    proc->unk_34 = pal;
    return;
}

//! FE8U = 0x080984CC
void sub_80984CC(int x, int y) {
    struct ProcA18944* proc = Proc_Find(gUnknown_08A18944);
    proc->unk_38 = 1;
    proc->unk_2c = x;
    proc->unk_30 = y;
    return;
}

//! FE8U = 0x080984EC
void sub_80984EC(void) {
    struct ProcA18944* proc = Proc_Find(gUnknown_08A18944);
    proc->unk_38 = 0;
    return;
}

//! FE8U = 0x08098500
void sub_8098500(void) {
    Proc_End(Proc_Find(gUnknown_08A18944));
    return;
}

//! FE8U = 0x08098514
void sub_8098514(void) {
    CopyToPaletteBuffer(gUiFramePaletteA, 0x240, 0x20);
    return;
}

extern u16 gUnknown_08A18964[];

//! FE8U = 0x0809852C
void sub_809852C(struct ProcA1898C* proc) {
    if (proc->unk_34 != 0) {
        PutSpriteExt(
            4,
            proc->unk_2c,
            proc->unk_30,
            gUnknown_08A18964,
            0x2580
        );
    }
    return;
}

extern struct ProcCmd gUnknown_08A1898C[];

//! FE8U = 0x08098554
void sub_8098554(ProcPtr parent) {
    struct ProcA1898C* proc = Proc_Start(gUnknown_08A1898C, parent);
    proc->unk_34 = 0;
    proc->unk_2c = 0;
    proc->unk_30 = 0;
    return;
}

//! FE8U = 0x08098570
void sub_8098570(int x, int y) {
    struct ProcA1898C* proc = Proc_Find(gUnknown_08A1898C);
    proc->unk_34 = 1;
    proc->unk_2c = x;
    proc->unk_30 = y;
    return;
}

//! FE8U = 0x08098590
void sub_8098590(void) {
    struct ProcA1898C* proc = Proc_Find(gUnknown_08A1898C);
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x080985A4
void sub_80985A4(void) {
    Proc_End(Proc_Find(gUnknown_08A1898C));
    return;
}

extern u16 gUnknown_0202310E[];

//! FE8U = 0x080985B8
void sub_80985B8(void) {
    Text_Draw(gUnknown_02013588, gUnknown_0202310E);
    sub_8004B88(gUnknown_0202310E + 8, 2, GetPartyGoldAmount());
    DrawSpecialUiChar(gUnknown_0202310E + 9, 3, 0x1e);
    sub_80984CC(168, 133);
    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x08098600
void sub_8098600(void) {
    TileMap_FillRect(gUnknown_0202310E, 10, 1, 0);
    sub_80984EC();
    BG_EnableSyncByMask(1);
    return;
}

extern u16 gUnknown_02022C08[];

extern struct FaceVramEntry gUnknown_08205C14[];

//! FE8U = 0x08098620
void sub_8098620(struct PrepItemScreenProc* proc) {
    int i;

    struct FaceVramEntry hack[4];
    memcpy(hack, gUnknown_08205C14, 0x20);

    SetupBackgrounds(gBgConfig_ItemUseScreen);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupFaceGfxData(hack);

    SetDispEnable(0, 0, 0, 0, 0);

    SetupDebugFontForOBJ(0x06017800, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadUiFrameGraphics();
    CopyToPaletteBuffer(gUiFramePaletteD, 0x40, 0x20);
    LoadObjUIGfx();

    MakePrepUnitList();
    proc->unk_2a = UnitGetIndexInPrepList(PrepGetLatestCharId());

    ResetPrepScreenHandCursor(proc);
    StartParallelWorker(sub_809A274, proc);
    sub_80AC9C0(proc);

    SetPrimaryHBlankHandler(NULL);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    for (i = 0; i < 15; i++) {
        Text_Init(gPrepItemTexts + i, 5);
    }

    for (i = 0; i < 5; i++) {
        Text_Init(gUnknown_02013510 + 0 + i, 7);
        Text_Init(gUnknown_02013510 + 5 + i, 7);
    }

    Text_Allocate(gUnknown_02013560, 8);
    Text_Allocate(gUnknown_02013560 + 1, 8);
    Text_Init(gUnknown_02013560 + 2, 8);
    Text_Init(gUnknown_02013560 + 5, 7);
    Text_Init(gUnknown_02013560 + 6, 5);

    LoadHelpBoxGfx((void *)0x06014000, -1);

    SetBlendBackdropA(0);
    sub_8001F64(0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 4, 240, 68);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    BG_SetPosition(0, 4, -4);
    BG_SetPosition(1, 0, 4);
    BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
    BG_EnableSyncByMask(7);

    SetupMapSpritesPalettes();
    CpuFastFill(0, gUnknown_02022C08, 0x20);

    ForceSyncUnitSpriteSheet();

    Decompress(Img_PrepTextShadow, (void *)0x06013E00);
    sub_80ACA4C(0, 0, 0, 0xd0, 0x3c);
    sub_80AD4A0(0x600, 1);

    EndSlidingWallEffectMaybe();

    if (proc->unk_2b != 0xff) {
        sub_80AC9D4(
            0,
            ((proc->unk_2b % 3) * 64) + 0x18,
            ((proc->unk_2b / 3) * 16) + 4 - proc->unk_34,
            2
        );
        sub_8099E98(0, GetUnitFromPrepList(proc->unk_2b), 0x3c, 0x4c, 0x0503);
    }

    PrepStartSideBarScroll(proc, 0xe0, 0xb, 0x200, 4);

    sub_80976CC(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    sub_8097668();
    PrepUpdateSMS();
    SetSpecialColorEffectsParameters(1, 8, 8, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    SetPrimaryHBlankHandler(sub_80983D4);

    sub_80984A8(0xa8, 0x85, 0xb, proc);

    sub_8098554(proc);

    return;
}

//! FE8U = 0x080989BC
void sub_80989BC(struct PrepItemScreenProc* proc) {
    struct Unit* unit = GetUnitFromPrepList(proc->unk_2a);
    PrepSetLatestCharId(unit->pCharacterData->number);

    EndAllParallelWorkers();
    EndPrepScreenHandCursor();

    sub_80ACB00();

    sub_8099F50(0);
    sub_8099F50(1);

    EndBG3Slider_();
    EndHelpPromptSprite();

    Delete6CMenuScroll();

    sub_8098500();
    sub_80985A4();

    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x08098A04
void sub_8098A04(u16* tm) {

    TileMap_FillRect(tm, 10, 6, 0);

    Text_Clear(gUnknown_02013560);
    Text_Clear(gUnknown_02013560 + 1);

    DrawTextInline(gUnknown_02013560, tm + 33, 0, 0, 0, GetStringFromIndex(0x0583));
    DrawTextInline(gUnknown_02013560 + 1, tm + 97, 0, 0, 0, GetStringFromIndex(0x0584));

    return;
}

//! FE8U = 0x08098A74
void sub_8098A74(u16* tm) {
    int textId;

    TileMap_FillRect(tm, 10, 8, 0);

    Text_Clear(gUnknown_02013560);
    Text_Clear(gUnknown_02013560 + 1);
    Text_Clear(gUnknown_02013560 + 2);

    switch (sub_80C4070()) {
        case 0:
            textId = 0x0672; // TODO: msgid "Enter Armory"
            break;

        case 1:
            textId = 0x0673; // TODO: msgid "Enter Shop"
            break;

        case 2:
            textId = 0x0674; // TODO: msgid "Enter ? Shop"
            break;

        case 3:
            textId = 0x0675; // TODO: msgid "Manage Items"
            break;
    }

    DrawTextInline(gUnknown_02013560, tm + 0x40, 0, 4, 0, GetStringFromIndex(textId));
    DrawTextInline(gUnknown_02013560 + 1, tm + 0x80, 0, 4, 0, GetStringFromIndex(0x0583)); // TODO: msgid "Choose unit"
    DrawTextInline(gUnknown_02013560 + 2, tm + 0xc0, 0, 4, 0, GetStringFromIndex(0x0584)); // TODO: msgid "[.]"
    return;
}

//! FE8U = 0x08098B48
void sub_8098B48(void) {
    PrepItemDrawPopupBox(136, 89, 9, 4, 0xA440);
    return;
}

//! FE8U = 0x08098B68
void sub_8098B68(void) {
    switch (sub_80C4070()) {
        case 3:
            PrepItemDrawPopupBox(136, 81, 9, 6, 0xA440);
            break;
        default:
            PrepItemDrawPopupBox(136, 81, 9, 6, 0xA440);
            break;
    }

    return;
}

//! FE8U = 0x08098BA8
void sub_8098BA8(void) {
    PrepItemDrawPopupBox(8, 92, 10, 5, 0xA440);
    return;
}

//! FE8U = 0x08098BC8
void sub_8098BC8(void) {
    PrepItemDrawPopupBox(136, 81, 9, 6, 0xA840);
    return;
}

//! FE8U = 0x08098BE8
void sub_8098BE8(void) {
    if (gGMData.state.bits.state_0) {
        Proc_End(GetParallelWorker(sub_8098B68));
    } else {
        Proc_End(GetParallelWorker(sub_8098B48));
    }
    Proc_End(GetParallelWorker(sub_8098BA8));
    Proc_End(GetParallelWorker(sub_8098BC8));
    return;
}

extern u16* Pals_PrepWindow[];

//! FE8U = 0x08098C3C
void PutImg_PrepItemUseUnk(int vram, int pal) {
    u16* hack[4];
    memcpy(hack, Pals_PrepWindow, 0x10);

    Decompress(Img_PrepWindow, (void *)(0x6000000 + vram));
    CopyToPaletteBuffer(hack[gPlaySt.cfgWindowColor], pal * 0x20, 0x20);
    return;
}

//! FE8U = 0x08098C8C
void PutImg_PrepPopupWindow(int vram, int pal) {
    Decompress(Img_PrepPopupWindow, (void *)(0x06010000 + vram));
    CopyToPaletteBuffer(gUiFramePaletteD, (pal + 0x10) * 0x20, 0x20);
    return;
}

extern u16 gUnknown_02022EEC[];

//! FE8U = 0x08098CC0
void sub_8098CC0(struct PrepItemScreenProc* proc) {
    LoadUiFrameGraphics();

    BG_SetPosition(1, 0, 4);

    sub_809A08C(proc);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    PutImg_PrepItemUseUnk(0x6000, 5);

    PutImg_PrepPopupWindow(0x800, 10);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    CopyToPaletteBuffer(gUiFramePaletteD, 0x40, 0x20);

    sub_8099E98(0, GetUnitFromPrepList(proc->unk_2a), 0x3c, 0x4c, 0x0503);

    sub_8099F7C(gUnknown_02013510, gUnknown_02022EEC, GetUnitFromPrepList(proc->unk_2a), 2);

    if (gGMData.state.bits.state_0) {
        sub_8098A74(gUnknown_02022EEC - 0x10);
    } else {
        sub_8098A04(gUnknown_02022EEC + 0x30);
    }

    proc->unk_32 = 0;

    ShowPrepScreenHandCursor(
        (proc->unk_2a % 3) * 64 + 0x18,
        ((proc->unk_2a / 3) * 16) + 4 - proc->unk_34,
        7,
        0x800
    );

    sub_809A504(proc, 0);
    sub_80ACAE4();
    sub_80ACAA4();
    StartHelpPromptSprite(0x78, 0x8c, 9, proc);

    sub_8098BE8();

    if (gGMData.state.bits.state_0) {
        StartParallelWorker(sub_8098B68, proc);
    } else {
        StartParallelWorker(sub_8098B48, proc);
    }

    sub_80985B8();
    sub_8098590();

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x08098E40
s8 sub_8098E40(struct PrepItemScreenProc* proc) {
    int previous = proc->unk_2a;

    u16 keys = gKeyStatusPtr->repeatedKeys;

    proc->unk_31 = 4;

    if (gKeyStatusPtr->heldKeys & L_BUTTON) {
        keys = gKeyStatusPtr->heldKeys;
        proc->unk_31 = 8;
    }

    if (keys & DPAD_UP) {
        if ((proc->unk_2a - 3) >= 0) {
           proc->unk_2a -= 3;
        }
    }

    if (keys & DPAD_DOWN) {
        if ((proc->unk_2a + 3) < PrepGetUnitAmount()) {
            proc->unk_2a += 3;
        }
    }

    if (keys & DPAD_LEFT) {
        if ((proc->unk_2a % 3) != 0) {
            proc->unk_2a--;
        }
    }

    if (keys & DPAD_RIGHT) {
        if (((proc->unk_2a % 3) < 2) && ((proc->unk_2a + 1) < PrepGetUnitAmount())) {
            proc->unk_2a++;
        }
    }

    if (proc->unk_2a != previous) {
        #if NONMATCHING
        u32 j;
        #else
        register u32 j asm("r1");
        #endif

        int a = (proc->unk_2a / 3) * 16;

        int b = ((PrepGetUnitAmount() - 1) / 3) * 16;

        if (((a - proc->unk_34) >= 0x21) && ((proc->unk_34 + 0x30) < b)) {
            j = ((proc->unk_34 >> 4) + 4);
            goto _l;
        } else {
            if (((a - proc->unk_34) < 0x10)) {
                if (proc->unk_34 != 0) {
                    j = proc->unk_34;
                    j = (j >> 4) - 1;
                _l:
                    sub_809A114(proc, j, 0);
                    SetPrepScreenHandXPos(((proc->unk_2a % 3) * 64) + 0x18);
                    PlaySoundEffect(0x65);
                    return 1;
                }
            }
        }

        ShowPrepScreenHandCursor(
            ((proc->unk_2a % 3) * 64) + 0x18,
            ((proc->unk_2a / 3) * 16) + 4 - proc->unk_34,
            7,
            0x800
        );

        PlaySoundEffect(0x65);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08098FAC
void sub_8098FAC(struct PrepItemScreenProc* proc) {
    int a = (proc->unk_2a / 3) * 16;
    int b = ((PrepGetUnitAmount() - 1) / 3) * 16;

    if (((a - proc->unk_34) > 0x20) && ((proc->unk_34 + 0x30) < b)) {
        proc->unk_34 = proc->unk_34 + proc->unk_31;
        BG_SetPosition(2, 0xFFD8, (proc->unk_34 - 4) & 0xff);
        if (proc->unk_2b != 0xFF) {
            sub_80AC9D4(
                0,
                ((proc->unk_2b % 3) * 64) + 0x18,
                ((proc->unk_2b / 3) * 16) + 4 - proc->unk_34,
                2
            );
        }
        sub_80976CC(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    if (((a - proc->unk_34) < 0x10) && (proc->unk_34 != 0)) {
        proc->unk_34 = proc->unk_34 - proc->unk_31;
        BG_SetPosition(2, 0xFFD8, (proc->unk_34 - 4) & 0xff);
        if (proc->unk_2b != 0xFF) {
            sub_80AC9D4(
                0,
                ((proc->unk_2b % 3) * 64) + 0x18,
                ((proc->unk_2b / 3) * 16) + 4 - proc->unk_34,
                2
            );
        }

        sub_80976CC(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }
    return;
}

//! FE8U = 0x080990D4
void sub_80990D4(struct PrepItemScreenProc* proc) {
    sub_80989BC(proc);
    SetStatScreenConfig(0x31);
    StartStatScreen(GetUnitFromPrepList(proc->unk_2a), proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x08099100
void sub_8099100(struct PrepItemScreenProc* proc) {
    sub_8098620(proc);
    proc->unk_2a = GetLatestUnitIndexInPrepListByUId();
    sub_809A08C(proc);
    return;
}

//! FE8U = 0x08099120
void sub_8099120(struct PrepItemScreenProc* proc) {
    int tmp = proc->unk_34;

    if (!(tmp & 0xf)) {

        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (gGMData.state.bits.state_0) {
                switch (sub_80C4070()) {
                    case 3:
                        proc->unk_2b =  proc->unk_2a;

                        if (((proc->unk_2a % 3) <= 1) && (proc->unk_2a < PrepGetUnitAmount() - 1)) {
                            proc->unk_2a++;
                        } else {
                            proc->unk_2a--;
                        }

                        break;

                    case 2:
                        if (UnitHasItem(GetUnitFromPrepList(proc->unk_2a), 0x72) != 0) {
                            PlaySoundEffect(0x6a);
                            Proc_Goto(proc, 0xd);
                            return;
                        }

                        PlaySoundEffect(0x6c);

                        return;

                    default:
                        Proc_Goto(proc, 0xd);
                        PlaySoundEffect(0x6a);
                        return;
                }
            } else {
                proc->unk_2b =  proc->unk_2a;

                if (((proc->unk_2a % 3) < 2) && (proc->unk_2a < PrepGetUnitAmount() - 1)) {
                    proc->unk_2a++;
                } else {
                    proc->unk_2a--;
                }
            }

            sub_80AC9D4(
                0,
                ((proc->unk_2b % 3) * 64) + 0x18,
                (proc->unk_2b / 3) * 16 + 4 - proc->unk_34,
                2
            );

            Proc_Goto(proc, 2);
            PlaySoundEffect(0x6a);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            if (gGMData.state.bits.state_0) {
                proc->unk_29 = 1;
            }

            Proc_Goto(proc, 0xd);
            PlaySoundEffect(0x6b);
            return;
        }

        if (sub_8098E40(proc) != 0) {
            sub_8099E98(0, GetUnitFromPrepList(proc->unk_2a), 0x3c, 0x4c, 0x0503);
            sub_8099F7C(gUnknown_02013510, gUnknown_02022EEC, GetUnitFromPrepList(proc->unk_2a), 2);
            BG_EnableSyncByMask(1);
        }
    }

    sub_8098FAC(proc);

    return;
}

//! FE8U = 0x08099328
void sub_8099328(struct PrepItemScreenProc* proc, u16* tm, struct Unit* unit) {
    TileMap_FillRect(tm, 10, 6, 0);

    Text_Clear(gUnknown_02013560);
    Text_InsertString(gUnknown_02013560, 0, PrepGetUnitAmount() < 2 ? 1 : 0, GetStringFromIndex(0x594)); // TODO: msgid "Trade"
    Text_InsertString(gUnknown_02013560, 32, PrepGetUnitAmount() < 2 ? 1 : 0, GetStringFromIndex(0x595)); // TODO: msgid "List"

    Text_Draw(gUnknown_02013560, tm + 32);

    Text_Clear(gUnknown_02013560 + 1);

    Text_InsertString(gUnknown_02013560 + 1, 0, !CanUnitPrepScreenUse(unit) ? 1 : 0, GetStringFromIndex(0x596)); // TODO: msgid "Use"

    Text_InsertString(gUnknown_02013560 + 1, 32, proc->unk_2c == 0 ? 1 : 0, GetStringFromIndex(0x59A)); // TODO: msgid "Give all"
    Text_Draw(gUnknown_02013560 + 1, tm + 96);

    Text_Clear(gUnknown_02013560 + 2);
    Text_InsertString(gUnknown_02013560 + 2, 0, proc->unk_2c == 0 ? 1 : 0, GetStringFromIndex(0x598)); // TODO: msgid "Supply"

    if (gGMData.state.bits.state_0) {
        struct TextHandle* th = gUnknown_02013560 + 2;
        int color = 0;
        if (((proc->unk_2c == 0) || (GetUnitItemCount(unit) < 1)) || (CheckInLinkArena() != 0)) {
            color = 1;
        }
        Text_InsertString(th, 32, color, GetStringFromIndex(0x597)); // TODO: msgid "Sell"
    } else {
        if (CheckInLinkArena() != 0) {
            Text_InsertString(gUnknown_02013560 + 2, 32, 1, GetStringFromIndex(0x599)); // TODO: msgid "Armory"
        } else {
            Text_InsertString(gUnknown_02013560 + 2, 32, 0, GetStringFromIndex(0x599)); // TODO: msgid "Armory"
        }
    }

    Text_Draw(gUnknown_02013570, tm + 0xa0);
    return;
}

//! FE8U = 0x080994C4
void sub_80994C4(struct PrepItemScreenProc* proc) {
    const char* str;
    int x;
    struct TextHandle* th;

    struct Unit* unit = GetUnitFromPrepList(proc->unk_2b);

    proc->unk_32 = 1;
    BG_Fill(BG_GetMapBuffer(0), 0);

    sub_8099F7C(gUnknown_02013510, gUnknown_02022EEC, GetUnitFromPrepList(proc->unk_2b), 0);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    sub_8098570(0, 0x1f);

    PutFaceChibi(GetUnitPortraitId(unit), gUnknown_02022EEC - 0xa0, 0x270, 3, 0);

    Text_Clear(gUnknown_02013510 + 0x10);

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(0x28, str);
    DrawTextInline(gUnknown_02013510 + 0x10, gUnknown_02022EEC - 0x9a, 0, x, 0, str);

    DrawSpecialUiStr(gUnknown_02022EEC - 0x5b, 3, 0x24, 0x25);
    DrawSpecialUiChar(gUnknown_02022EEC - 0x57, 3, 0x1d);

    DrawDecNumber(gUnknown_02022EEC - 0x58, 2, unit->level);
    DrawDecNumber(gUnknown_02022EEC - 0x55, 2, unit->exp);

    BG_EnableSyncByMask(7);

    return;
}

extern u16 gUnknown_02022F06[];

//! FE8U = 0x080995D4
void sub_80995D4(struct PrepItemScreenProc* proc) {
    s8 unk;

    TileMap_FillRect(gUnknown_02022F06, 0xc, 0x14, 0);

    PutImg_PrepItemUseUnk(0x6000, 5);
    PutImg_PrepPopupWindow(0x800, 10);
    sub_80994C4(proc);

    unk = sub_809A21C(
        ((proc->unk_2b % 3) * 64) + 0x14,
        ((proc->unk_2b / 3) * 16) + 4 - proc->unk_34
    );

    if (unk != 0) {
        sub_80ACAC8();
    } else {
        sub_80ACAE4();
    }

    sub_8098BE8();

    BG_EnableSyncByMask(1);

    return;
}

extern u16 gUnknown_02022F0E[];

//! FE8U = 0x08099654
void sub_8099654(struct PrepItemScreenProc* proc) {
    sub_8099328(proc, gUnknown_02022F0E, GetUnitFromPrepList(proc->unk_2b));
    StartParallelWorker(sub_8098BC8, proc);
    StartHelpPromptSprite(0x78, 0x8c, 9, proc);

    ShowPrepScreenHandCursor(
        (proc->unk_2e & 1) * 0x20 + 0x90,
        (proc->unk_2e >> 1) * 0x10 + 0x54,
        3,
        0x400
    );

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080996B0
void sub_80996B0(struct PrepItemScreenProc* proc) {
    struct Unit* unit = GetUnitFromPrepList(proc->unk_2b);

    sub_809A504(proc, 0);
    sub_8099F7C(gUnknown_02013510, gUnknown_02022EEC, unit, 0);

    BG_EnableSyncByMask(4);

    return;
}

extern int gUnknown_08A188F8[];
extern int gUnknown_08A18910[];

//! FE8U = 0x080996E8
void sub_80996E8(struct PrepItemScreenProc* proc) {
    int previous = proc->unk_2e;

    if (proc->unk_2d == 0xff) {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            proc->unk_2d = proc->unk_2e;

            if ((gGMData.state.bits.state_0)) {
                StartHelpBox(
                    (proc->unk_2e & 1) * 0x20 + 0x88,
                    (proc->unk_2e >> 1) * 0x10 + 0x54,
                    gUnknown_08A18910[proc->unk_2e]
                );
                return;
            } else {
                StartHelpBox(
                    (proc->unk_2e & 1) * 0x20 + 0x88,
                    (proc->unk_2e >> 1) * 0x10 + 0x54,
                    gUnknown_08A188F8[proc->unk_2e]
                );
                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            switch (proc->unk_2e) {
                case 0:
                    if (PrepGetUnitAmount() < 2) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 4);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 1:
                    if (PrepGetUnitAmount() < 2) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 8);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 2:
                    if (CanUnitPrepScreenUse(GetUnitFromPrepList(proc->unk_2b)) == 0) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 9);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 3:
                    if ((CheckInLinkArena() != 0) && ((GetUnitFromPrepList(proc->unk_2b)->state & 8) == 0)) {
                        StartPrepErrorHelpbox(-1, -1, 0x088B, proc);
                        return;
                    }

                    if (proc->unk_2c != 0) {
                        if (sub_809A538(GetUnitFromPrepList(proc->unk_2b)) != 0) {
                            sub_8099328(proc, gUnknown_02022F0E, GetUnitFromPrepList(proc->unk_2b));
                            sub_8099F7C(gUnknown_02013510, gUnknown_02022F0E - 0x11, GetUnitFromPrepList(proc->unk_2b), 0);

                            BG_EnableSyncByMask(1);

                            PlaySoundEffect(0x6a);
                            return;
                        }
                    }

                    PlaySoundEffect(0x6c);
                    break;

                case 4:
                    if (proc->unk_2c == 0) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 10);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 5:
                    if ((gGMData.state.bits.state_0) != 0) {
                        if (proc->unk_2c != 0) {
                            int itemCount = GetUnitItemCount(GetUnitFromPrepList(proc->unk_2b));
                            if ((itemCount > 0) && (CheckInLinkArena() == 0)) {
                                Proc_Goto(proc, 11);
                                PlaySoundEffect(0x6a);
                                return;
                            }
                        }
                    } else {
                        if (CheckInLinkArena() == 0) {
                            Proc_Goto(proc, 12);
                            PlaySoundEffect(0x6a);
                            return;
                        }
                    }

                    PlaySoundEffect(0x6c);
                    break;

                default:
                    PlaySoundEffect(0x6c);
                    break;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            proc->unk_2a = proc->unk_2b;
            proc->unk_2b = 0xff;
            sub_80ACA84(0);
            PlaySoundEffect(0x6b);
            Proc_Goto(proc, 0);
            return;
        }
    } else if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
        CloseHelpBox();
        proc->unk_2d = 0xff;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        if ((proc->unk_2e & 1) != 0) {
            proc->unk_2e--;
        } else if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
            proc->unk_2e++;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        if ((proc->unk_2e & 1) == 0) {
            proc->unk_2e++;
        } else if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
            proc->unk_2e--;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->unk_2e >= 2) {
            proc->unk_2e -= 2;
        } else if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->unk_2e += 4;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->unk_2e < 4) {
            proc->unk_2e += 2;
        } else if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->unk_2e -= 4;
        }
    }

    if (previous == proc->unk_2e) {
        return;
    }

    PlaySoundEffect(0x65);
    ShowPrepScreenHandCursor(
        (proc->unk_2e & 1) * 32 + 144,
        (proc->unk_2e >> 1) * 16 + 84,
        3,
        0x400
    );

    if (proc->unk_2d == 0xff) {
        return;
    }

    if (gGMData.state.bits.state_0) {
        StartHelpBox(
            (proc->unk_2e & 1) * 38 + 144,
            (proc->unk_2e >> 1) * 16 + 84,
            gUnknown_08A18910[proc->unk_2e]
        );
    } else {
        StartHelpBox(
            (proc->unk_2e & 1) * 38 + 144,
            (proc->unk_2e >> 1) * 16 + 84,
            gUnknown_08A188F8[proc->unk_2e]
        );
    }

    return;
}

//! FE8U = 0x08099AA0
void sub_8099AA0(struct PrepItemScreenProc* proc) {
    BG_Fill(BG_GetMapBuffer(0), 0);

    sub_8099F7C(gUnknown_02013510 + 0, gUnknown_02022EEC, GetUnitFromPrepList(proc->unk_2b), 0);

    sub_8099F7C(gUnknown_02013510 + 5, gUnknown_02022EEC + 15, GetUnitFromPrepList(proc->unk_2a), 0);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x08099AF8
void sub_8099AF8(struct PrepItemScreenProc* proc) {
    BG_SetPosition(1, 0, 4);

    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    TileMap_FillRect(gBG0TilemapBuffer, 31, 8, 0);

    PutImg_PrepItemUseUnk(0x6000, 5);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnknown_08A1B990, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer + 0x12F, gGenericBuffer, 0x1000);

    proc->unk_32 = 0;

    ShowPrepScreenHandCursor(
        ((proc->unk_2a % 3) * 64) + 24,
        ((proc->unk_2a / 3) * 16) + 4 - proc->unk_34,
        7,
        0x800
    );
    sub_809A504(proc, 0);

    BG_EnableSyncByMask(7);

    sub_8099E98(0, GetUnitFromPrepList(proc->unk_2b), 0x3c, 0x4c, 0x0503);
    sub_8099E98(1, GetUnitFromPrepList(proc->unk_2a), 0xb4, 0x4c, 0x0502);

    sub_80AC9D4(
        0,
        ((proc->unk_2b % 3) * 64) + 24,
        ((proc->unk_2b / 3) * 16) + 4 - proc->unk_34,
        2
    );

    StartParallelFiniteLoop(sub_8099AA0, 1, (u32)proc);

    sub_80ACAE4();
    sub_8098590();
    EndHelpPromptSprite();

    return;
}

//! FE8U = 0x08099C60
void sub_8099C60(void) {
    sub_8098BE8();
    BG_EnableSyncByMask(1);
    return;
}

extern u16 gUnknown_02022F0A[];

//! FE8U = 0x08099C70
void sub_8099C70(struct PrepItemScreenProc* proc) {
    int t = proc->unk_34;
    t &= 0xf;

    if (t == 0) {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            int itemCountA = GetUnitItemCount(GetUnitFromPrepList(proc->unk_2a));
            int itemCountB = GetUnitItemCount(GetUnitFromPrepList(proc->unk_2b));
            if ((proc->unk_2a != proc->unk_2b) && ((itemCountA > 0) || (itemCountB > 0))) {
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x6a);
                return;
            }
            PlaySoundEffect(0x6c);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            sub_8099F50(1);
            Proc_Goto(proc, 2);
            PlaySoundEffect(0x6b);
            return;
        }

        if (sub_8098E40(proc) != 0) {
            sub_8099E98(1, GetUnitFromPrepList(proc->unk_2a), 180, 76, 0x0502);
            sub_8099F7C(gUnknown_02013538 + 0, gUnknown_02022F0A, GetUnitFromPrepList(proc->unk_2a), 2);
            sub_8099F7C(gUnknown_02013538 - 5, gUnknown_02022F0A - 15, GetUnitFromPrepList(proc->unk_2b), 1);
            BG_EnableSyncByMask(1);
        }
    }

    sub_8098FAC(proc);

    return;
}

//! FE8U = 0x08099DB8
void StartPrepItemTradeScreen(struct PrepItemScreenProc* proc) {
    sub_80989BC(proc);

    StartPrepItemTradeScreenProc(
        GetUnitFromPrepList(proc->unk_2b),
        GetUnitFromPrepList(proc->unk_2a),
        proc
    );

    return;
}

//! FE8U = 0x08099DE8
void sub_8099DE8(struct PrepItemScreenProc* proc) {
    StartPrepItemUseScreen(GetUnitFromPrepList(proc->unk_2b), proc);
    return;
}

//! FE8U = 0x08099E00
void StartPrepItemSupply(struct PrepItemScreenProc* proc) {
    StartPrepItemSupplyProc(GetUnitFromPrepList(proc->unk_2b), proc);
    return;
}

//! FE8U = 0x08099E18
void sub_8099E18(struct PrepItemScreenProc* proc) {
    StartWorldMapSellScreen(GetUnitFromPrepList(proc->unk_2b), proc);
    return;
}

//! FE8U = 0x08099E30
void StartPrepItemListScreen(struct PrepItemScreenProc* proc) {
    StartPrepItemListScreenProc(GetUnitFromPrepList(proc->unk_2b), proc);
    return;
}

extern u16 gUnknown_08A188E4[];

//! FE8U = 0x08099E48
void sub_8099E48(struct PrepItemScreenProc* proc) {
    StartArmoryScreen(GetUnitFromPrepList(proc->unk_2b), gUnknown_08A188E4, proc);
    return;
}

//! FE8U = 0x08099E68
void sub_8099E68(struct PrepItemScreenProc* proc) {
    if (!gGMData.state.bits.state_0) {
        return;
    }

    if (!proc->unk_29) {
        return;
    }

    sub_80C409C(0);

    return;
}

extern struct ProcCmd ProcScr_PrepItemScreen[];

//! FE8U = 0x08099E98
void sub_8099E98(int slot, struct Unit* unit, u16 x, u16 y, u16 disp) {
    struct PrepItemScreenProc* proc = Proc_Find(ProcScr_PrepItemScreen);

    if (proc->unk_44[slot] != unit) {
        if (proc->unk_44[slot] != NULL) {
            EndFaceById(slot);
        }

        if (unit != NULL) {
            StartFace2(slot, GetUnitPortraitId(unit), (s16)x, (s16)y, disp);
        }
    } else {
        if (unit != NULL) {
            sub_8006618(slot, (s16)x, (s16)y);
            SetFaceDisplayBitsById(slot, disp);
        }
    }

    proc->unk_44[slot] = unit;

    proc->unk_38[slot] = x;
    proc->unk_3c[slot] = y;
    proc->unk_40[slot] = disp;

    return;
}

//! FE8U = 0x08099F50
void sub_8099F50(int slot) {
    sub_8099E98(slot, NULL, 0, 0, 0);
    return;
}

//! FE8U = 0x08099F68
ProcPtr StartPrepItemScreen(ProcPtr proc) {
    return Proc_StartBlocking(ProcScr_PrepItemScreen, proc);
}

//! FE8U = 0x08099F7C
void sub_8099F7C(struct TextHandle* th, u16* tm, struct Unit* unit, u16 flags) {
    int itemCount;
    int i;

    TileMap_FillRect(tm, 12, 20, 0);

    if ((flags & 2) != 0) {
        ResetIconGraphics();
    }

    if (!unit) {
        return;
    }

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; th++, i++) {
        u16 item = unit->items[i];

        int isUnusable = ((flags & 4) != 0)
            ? !CanUnitUseItemPrepScreen(unit, item)
            : !IsItemDisplayUsable(unit, item);

        if ((flags & 1) == 0) {
            Text_Clear(th);
            Text_SetColorId(th, isUnusable);
            Text_SetXCursor(th, 0);
            Text_AppendString(th, GetItemName(item));
        }

        DrawIcon(tm + i * 0x40, GetItemIconId(item), 0x4000);

        Text_Draw(th, tm + 2 + i * 0x40);

        DrawDecNumber(tm + 0xb + i * 0x40, !isUnusable ? 2 : 1, GetItemUses(item));
    }

    return;
}

//! FE8U = 0x0809A08C
void sub_809A08C(struct PrepItemScreenProc* proc) {
    int a = proc->unk_2a / 3;
    int b = a * 16;
    int c = ((PrepGetUnitAmount() - 1) / 3) * 16;
    int d = b - proc->unk_34;

    if (d >= 33) {
        if (b == c) {
            proc->unk_34 = b - 48;
        } else {
            proc->unk_34 = b - 32;
        }
    } else {
        if (d > 0xf) {
            goto _0809A0D8;
        }

        if (b == 0) {
            proc->unk_34 = b;
            goto _0809A0D8;
        }

        proc->unk_34 = b - 16;
    }

_0809A0D8:
    BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
    sub_80976CC(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    return;
}

//! FE8U = 0x0809A114
void sub_809A114(struct PrepItemScreenProc* proc, u8 unk, s8 flag) {
    int idx;
    int isWorldMapMaybe;
    int i;
    int prepUnitAmt;
    struct TextHandle* th;
    int newIdx;
    int x;
    int y;

    idx = ((unk) * 3);
    th = &gPrepItemTexts[idx % 0xf];

    if (gGMData.state.bits.state_0 && sub_80C4070() == 2) {
        isWorldMapMaybe = 1;
    } else {
        isWorldMapMaybe = 0;
    }

    for (i = 0; i < 3; th++, i++) {
        if (flag == 0) {
            Text_Clear(th);
        }

        newIdx = idx + i;
        prepUnitAmt = PrepGetUnitAmount();

        if (newIdx >= prepUnitAmt) {
            continue;
        }

        x = ((i % 3) * 8);
        y = ((unk * 2)) & 0x1f;
        if (flag == 0) {
            struct Unit* unit = GetUnitFromPrepList(newIdx);

            Text_SetXCursor(th, 0);

            if (isWorldMapMaybe) {
                if (UnitHasItem(unit, 0x72) != 0) {
                    Text_SetColorId(th, 0);
                } else {
                    Text_SetColorId(th, 1);
                }
            } else {
                Text_SetColorId(th, 0);
            }

            Text_AppendString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        Text_Draw(th, TILEMAP_LOCATED(gBG2TilemapBuffer, x, y));
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x0809A21C
s8 sub_809A21C(u32 x, int y) {
    if ((x < 97) && (y > 31)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0809A230
void sub_809A230(struct Unit* unit, u16 x, u16 y) {
    int oam2Base;

    int classId = unit->pClassData->number;

    if (UnitHasItem(unit, 0x72)) {
        oam2Base = 0xc000;
    } else {
        oam2Base = 0xf000;
    }

    PutUnitSpriteForClassId(0, x, y, oam2Base + 0x800, classId);

    return;
}

//! FE8U = 0x0809A274
void sub_809A274(struct PrepItemScreenProc* proc) {
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        int x = (i % 3) * 0x40;
        u32 y = (i / 3) * 0x10 - proc->unk_34;

        if (y + 0x14 >= 0x45) {
            continue;
        }

        if ((proc->unk_32 != 0 && (sub_809A21C(x, y) != 0))) {
            continue;
        }

        if (((gGMData.state.bits.state_0)) && (sub_80C4070() == 2)) {
            sub_809A230(GetUnitFromPrepList(i), (x + 0x18) & 0xffff, (y + 4) & 0xff);
        } else {
            PutUnitSprite(0, (x + 0x18), (y + 4) & 0xff, GetUnitFromPrepList(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x0809A31C
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2) {
    int i;
    int j;

    if ((w <= 0) || (h <= 0)) {
        return;
    }

    PutSpriteExt(4, x, y, gObject_8x8, oam2 + 0);
    PutSpriteExt(4, x + w * 8, y, gObject_8x8, oam2 + 3);
    PutSpriteExt(4, x + w * 8, y + h * 8, gObject_8x8, oam2 + 0xd);
    PutSpriteExt(4, x, y + h * 8, gObject_8x8, oam2 + 0xa);

    for (j = 1; j < (w - 1); j += 2) {
        PutSpriteExt(4, x + j * 8, y, gObject_16x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_16x8, oam2 + 0xb);
    }

    for (; j < w; j++) {
        PutSpriteExt(4, x + j * 8, y, gObject_8x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_8x8, oam2 + 0xb);
    }

    for (i = 1; i < h; i++) {
        PutSpriteExt(4, x, y + i * 8, gObject_8x8, oam2 + 4);
        PutSpriteExt(4, x + w * 8, y + i * 8, gObject_8x8, oam2 + 9);
    }

    for (i = 1; i < h; i++) {
        for (j = 1; j < w - 3; j += 4) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_32x8, oam2 + 5);
        }

        for (; j < w - 1; j += 2) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_16x8, oam2 + 5);
        }

        for (; j < w ; j++) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_8x8, oam2 + 5);
        }
    }

    return;
}

//! FE8U = 0x0809A504
void sub_809A504(struct PrepItemScreenProc* proc, u8 unk) {
    int i;

    for (i = (proc->unk_34 >> 4); i < (proc->unk_34 >> 4) + 4; i++) {
        sub_809A114(proc, i, unk);
    }

    return;
}

//! FE8U = 0x0809A538
s8 sub_809A538(struct Unit* unit) {
    int i;

    int unitItemCount = GetUnitItemCount(unit);
    int convoyItemCount = GetConvoyItemCount_();

    for (i = 0; (i < unitItemCount) && (i + convoyItemCount < CONVOY_ITEM_COUNT); i++) {
        AddItemToConvoy(unit->items[0]);
        UnitRemoveItem(unit, 0);
    }

    if (i > 0) {
        return 1;
    }

    return 0;
}
