#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"

struct SoundRoomEnt {
    /* 00 */ int bgmId;
    /* 04 */ int songLength; // in frames
    /* 08 */ void* displayCondFunc;
    /* 0C */ int nameTextId;
};

extern struct SoundRoomEnt gUnknown_08A20E74[];

struct SoundRoomProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29; // maybe padding?
    /* 2A */ u16 bgYOffset;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s8 shuffleActive;
    /* 31 */ u8 unk_31;
    /* 32 */ s8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 curIndex;
    /* 36 */ u8 maxIndex;
    /* 37 */ s8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ s8 unk_3c;
    /* 3D */ s8 unk_3d;
    /* 3E */ s8 unk_3e;
    /* 3F */ u8 unk_3f;
};

struct Proc8A21530 {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct Unknown201F148 {
    /* 00 */ struct Font font;
    /* 18 */ struct TextHandle th1;
    /* 20 */ struct TextHandle th2;
    /* 28 */ struct TextHandle th3;
    /* 30 */ struct TextHandle th[3];

    /* 48 */ struct TextHandle th4;
    /* 50 */ u16 unk_50;
};

extern struct Unknown201F148 gUnknown_0201F148;

extern u16 gUnknown_0201F198;
extern u8 gUnknown_0201F19C[];

extern u8 gUnknown_08A2C908[]; // gfx
extern u16 gUnknown_08A01EE4[]; // pal
extern u16 gUnknown_08A01F04[]; // pal
extern u8 gUnknown_08A2C4C8[]; // tsa
extern u8 gUnknown_08A2C5A8[]; // tsa

extern u8 gUnknown_08A2D32C[]; // gfx
extern u16 gUnknown_08A2E1B8[]; // pal

extern u8 gUnknown_08A2CABC[]; // gfx
extern u16 gUnknown_08A2D2CC[]; // pal

extern struct ProcCmd gUnknown_08A21308[];

extern void* gUnknown_08A212D4;
extern void* gUnknown_08A212D8;

extern u16 gUnknown_0202396C[];

extern u8 gUnknown_08A2C92C[];
extern u8 gUnknown_08A2C5A8[];
extern u8 gUnknown_08A2C7A4[];

// forward declarations
void sub_80AF878(struct SoundRoomProc*);
void sub_80AFF30(void);
void DrawSoundRoomSongTitle(int);
ProcPtr DrawSoundRoomSprites(ProcPtr);

// TODO: Move elsewhere?
void sub_80AC844(void*, int, int, int, int, int, int, int);

// TODO: Decompile these next
s8 sub_80AECEC(struct SoundRoomProc*, int);
void sub_80AED64(struct SoundRoomProc*);
void sub_80AEF24(struct SoundRoomProc*);
void sub_80AEF64(struct SoundRoomProc*);
void sub_80AF0E0(struct SoundRoomProc*);
void sub_80AF140(struct SoundRoomProc*);
void sub_80AF1D8(void);
void sub_80AF220(ProcPtr);
void nullsub_65(void);
void sub_80AF22C(ProcPtr);
void sub_80AF338(struct SoundRoomProc*);
void sub_80AF350(struct SoundRoomProc*);
int sub_80AF378(struct SoundRoomProc*);
void sub_80AF3C8(struct SoundRoomProc*);
void sub_80AF4D0(u16*, struct SoundRoomProc*);
void sub_80AF510(void);

struct ProcCmd CONST_DATA gUnknown_08A21308[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80AF220),

    PROC_SLEEP(0),
    PROC_CALL(nullsub_65),

    PROC_REPEAT(sub_80AF22C),

    PROC_END,
};

//! FE8U = 0x080AF524
void SoundRoomUi_Init(struct SoundRoomProc* proc) {
    SetupBackgrounds(NULL);

    Font_ResetAllocation();
    Font_InitForUIDefault();

    LoadObjUIGfx();
    LoadUiFrameGraphics();
    Font_LoadForUI();

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    RegisterBlankTile(0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(0xf);

    proc->curIndex = 0;
    proc->unk_37 = 0;
    proc->bgYOffset = 0;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_3d = 0;
    proc->unk_3e = 0;
    proc->unk_2f = 0;
    proc->shuffleActive = 0;
    proc->unk_32 = -1;
    proc->unk_2e = 0;
    proc->unk_2c = 0;
    proc->unk_3f = 0;

    sub_80AED64(proc);
    sub_80AFF30();
    sub_80AF878(proc);
    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x280, 2);
    sub_80AF350(proc);
    sub_80AF3C8(proc);
    PrepStartSideBarScroll(proc, 0xd8, 0x48, 0x1000, 3);
    sub_80AF338(proc);

    Decompress(gUnknown_08A2C908, (void*)0x06004000);
    CopyToPaletteBuffer(gUnknown_08A01EE4, 0x80, 0x20);
    CopyToPaletteBuffer(gUnknown_08A01F04, 0xa0, 0x20);
    CallARM_FillTileRect(gBG1TilemapBuffer + 0xE1, gUnknown_08A2C4C8, 0x1000);
    CallARM_FillTileRect(gBG1TilemapBuffer + 0xAB, gUnknown_08A2C5A8, 0x1000);

    sub_80AF4D0(gBG0TilemapBuffer + 0xCF, proc);

    Decompress(gUnknown_08A2D32C, (void*)0x06016000);
    CopyToPaletteBuffer(gUnknown_08A2E1B8, 0x380, 0x20);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(2, -4, 0);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.win0_left = 4;
    gLCDControlBuffer.win0_top = 66;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 144;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    Decompress(gUnknown_08A2CABC, (void*)0x06012000);
    CopyToPaletteBuffer(gUnknown_08A2D2CC, 0x260, 0x60);

    DrawSoundRoomSprites(proc);

    SetSpecialColorEffectsParameters(1, 0xf, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8086BB8(proc, 0, 0xe);

    NewGreenTextColorManager((void*)proc);
    sub_80AF1D8();

    StartParallelWorker(sub_80AF510, proc);

    Proc_Start(gUnknown_08A21308, proc);

    return;
}

//! FE8U = 0x080AF7F4
s8 StartSoundRoomSong(struct SoundRoomProc* proc, int index, int flagsMaybe) {
    if (MusicProc4Exists() != 0) {
        return 0;
    }

    proc->unk_32 = index;
    proc->unk_2c = 1;
    sub_80029E8(gUnknown_08A20E74[index].bgmId, 0x100, 0x100, flagsMaybe, 0);

    return 1;
}

//! FE8U = 0x080AF840
void StopSoundRoomSong(struct SoundRoomProc* proc) {
    if (MusicProc4Exists() != 0) {
        return;
    }

    proc->unk_2c = 0;
    sub_80029E8(0, 0x100, 0, 0x18, 0);
    proc->unk_2f = 0;
    proc->shuffleActive = 0;

    return;
}

//! FE8U = 0x080AF878
void sub_80AF878(struct SoundRoomProc* proc) {
    if (sub_80AECEC(proc, proc->curIndex) != 0) {
        DrawSoundRoomSongTitle(proc->curIndex);
    } else {
        DrawSoundRoomSongTitle(-1);
    }

    return;
}

//! FE8U = 0x080AF8A0
void SoundRoomUi_Loop_MainKeyHandler(struct SoundRoomProc* proc) {
    int moveAmt = 0;

    if (proc->unk_37 == 0) {

        u16 keys = gKeyStatusPtr->repeatedKeys;
        proc->unk_38 = 4;

        if (gKeyStatusPtr->heldKeys & L_BUTTON) {
            keys = gKeyStatusPtr->heldKeys;
            proc->unk_38 = 8;
        }

        if (keys & DPAD_UP) {
            moveAmt = -4;
        }

        if (keys & DPAD_DOWN) {
            moveAmt = +4;
        }

        if (keys & DPAD_LEFT) {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) != 0) {
                moveAmt = -1;
            }
        }

        if (keys & DPAD_RIGHT) {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) < 3) {
                moveAmt = +1;
            }
        }

        if (moveAmt != 0) {
            if ((proc->curIndex + moveAmt) < 0) {
                return;
            }

            if ((proc->curIndex + moveAmt) >= proc->maxIndex) {
                return;
            }

            proc->curIndex += moveAmt;

            sub_80AF878(proc);

            proc->unk_37 = sub_80AF378(proc);

            if (proc->unk_37 != 0) {
                if (proc->unk_37 == -1) {
                    Proc_Goto(proc, 10);
                }

                if (proc->unk_37 == +1) {
                    Proc_Goto(proc, 11);
                }

                sub_80AF3C8(proc);
            } else {
                sub_80AF350(proc);
            }
        }
    }

    if (proc->unk_37 != 0) {
        int tmp;

        proc->bgYOffset = proc->unk_37 * proc->unk_38 + proc->bgYOffset;

        BG_SetPosition(2, -4, proc->bgYOffset & 0xff);

        tmp = proc->bgYOffset;
        if ((tmp & 0xf) == 0) {
            proc->unk_37 = 0;
        }

        sub_80AF338(proc);

        return;
    }

    if (gKeyStatusPtr->newKeys & START_BUTTON) {
        StopSoundRoomSong(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (sub_80AECEC(proc, proc->curIndex) != 0) {
            StartSoundRoomSong(proc, proc->curIndex, 0x20);
            return;
        }

        PlaySoundEffect(0x6c);
        return;
    }

    if (gKeyStatusPtr->newKeys & SELECT_BUTTON) {
        if (MusicProc4Exists() != 0) {
            return;
        }

        Proc_Goto(proc, 2);

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}

//! FE8U = 0x080AFA64
void SoundRoomUi_RestartTitleMusic(struct SoundRoomProc* proc) {
    if (MusicProc4Exists() == 0) {
        sub_80029E8(0x43, 0, 0xc0, 0x18, 0);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFA94
void SoundRoomUi_OnEnd(struct SoundRoomProc* proc) {
    EndBG3Slider();
    EndAllProcChildren(proc);
    Proc_EndEach(gUnknown_08A21308);

    return;
}

//! FE8U = 0x080AFAB4
void sub_80AFAB4(struct SoundRoomProc* proc) {
    proc->unk_3c = -proc->unk_3b / 3;
    proc->unk_3d = (-(proc->unk_3b) * 2) / 3;

    proc->unk_3e = proc->unk_3b;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 0, 7, 1, proc->unk_3d + 1, 7, 10, 0xb);
    sub_80AC844(gUnknown_08A212D4, 10, 5, 1, proc->unk_3e + 0xb, 5, 0x12, 0xe);

    sub_80AC844(gUnknown_08A212D8, 0xc, 0, 2, proc->unk_3e + 0xc, 0, 0x10, 0x20);
    sub_80AC844(gUnknown_08A212D8, 0, 0, 0, proc->unk_3e + 0xf, 6, 10, 2);

    sub_80976AC(proc->unk_3e * 8 + 0xd8, 0x48);

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080AFBBC
void sub_80AFBBC(struct SoundRoomProc* proc) {
    proc->unk_3b = 0;

    CallARM_FillTileRect((u16*)gUnknown_08A212D4 + 0xE0, gUnknown_08A2C4C8, 0x1000);
    CallARM_FillTileRect((u16*)gUnknown_08A212D4 + 0xAA, gUnknown_08A2C5A8, 0x1000);

    CpuFastCopy(gBG2TilemapBuffer, gUnknown_08A212D8, 0x800);

    sub_80AF4D0(gUnknown_08A212D8, proc);

    CallARM_FillTileRect(gUnknown_0202396C, gUnknown_08A2C92C, 0x1200);
    CallARM_FillTileRect((u16*)gUnknown_08A212D4 + 0x321, gUnknown_08A2C7A4, 0x1000);

    HidePrepScreenHandCursor();

    proc->unk_3a = 0;

    return;
}

//! FE8U = 0x080AFC60
void SoundRoomUi_Loop_MainUiSlideOut(struct SoundRoomProc* proc) {
    int tmp;

    proc->unk_3a++;

    tmp = ((proc->unk_3a * 2 + proc->unk_3a) << 3) * proc->unk_3a;

    proc->unk_3b = tmp >> 6;

    sub_80AFAB4(proc);

    if (proc->unk_3b == 24) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFC98
void sub_80AFC98(struct SoundRoomProc* proc) {

    if (gKeyStatusPtr->newKeys & (A_BUTTON | SELECT_BUTTON)) {
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        sub_80AF0E0(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
        sub_80AF140(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}

//! FE8U = 0x080AFCE4
void sub_80AFCE4(struct SoundRoomProc* proc) {
    sub_80AF878(proc);
    proc->unk_3a = 0;
    return;
}

//! FE8U = 0x080AFCF8
void SoundRoomUi_Loop_MainUiSlideIn(struct SoundRoomProc* proc) {
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 0x40);

    sub_80AFAB4(proc);

    if (proc->unk_3b == 0) {
        sub_80AF350(proc);
        sub_80AF338(proc);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFD48
void sub_80AFD48(struct SoundRoomProc* proc) {
    proc->unk_3a = 0;
    proc->unk_2c = 0;
    sub_80AEF64(proc);
    return;
}

//! FE8U = 0x080AFD5C
void SoundRoomUi_Loop_ShufflePlayUiSlideIn(struct SoundRoomProc* proc) {
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = 0x18 - (tmp / 0x40);

    proc->unk_3c = 0x14 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 1, 0x19, 1, 3, proc->unk_3c + 4, 0x18, 3);

    BG_EnableSyncByMask(2);

    if (proc->unk_3b == 24) {
        proc->unk_3a = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFDF4
void SoundRoomUi_Loop_ShufflePlayKeyHandler(struct SoundRoomProc* proc) {

    if (proc->unk_3f != 0) {
        return;
    }

    if (proc->shuffleActive != 0) {
        if (proc->unk_2c >= (gUnknown_08A20E74[proc->unk_32].songLength)) {
            sub_80AEF24(proc);
            return;
        }
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
        sub_80AF0E0(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        sub_80AF140(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & (START_BUTTON | SELECT_BUTTON)) {
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
    }

    return;
}

//! FE8U = 0x080AFE8C
void SoundRoomUi_Loop_ShufflePlayUiSlideOut(struct SoundRoomProc* proc) {
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 0x40);

    proc->unk_3c = 20 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 1, 0x19, 1, 3, proc->unk_3c + 4, 0x18, 3);

    BG_EnableSyncByMask(2);

    if (proc->unk_3b == 0) {
        proc->shuffleActive = 0;
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SoundRoomUi[] = {
    PROC_SLEEP(0),

    PROC_CALL(SoundRoomUi_Init),

    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_WHILE(MusicProc4Exists),

PROC_LABEL(0),
    PROC_REPEAT(SoundRoomUi_Loop_MainKeyHandler),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(sub_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),

    PROC_REPEAT(sub_80AFC98),

    PROC_CALL(sub_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(sub_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),

    PROC_CALL(sub_80AFD48),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideIn),

    PROC_SLEEP(16),

    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayKeyHandler),

    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideOut),
 
    PROC_CALL(sub_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),

    PROC_SLEEP(16),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_REPEAT(SoundRoomUi_RestartTitleMusic),

    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(SoundRoomUi_OnEnd),

    PROC_SLEEP(0),

    PROC_END,
};

//! FE8U = 0x080AFF1C
ProcPtr StartSoundRoomScreen(ProcPtr parent) {
    return Proc_StartBlocking(gProcScr_SoundRoomUi, parent);
}

//! FE8U = 0x080AFF30
void sub_80AFF30(void) {
    int i;

    u32 vram = 0x06014000;

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_0201F148.font, (void*)vram, 5);

    CopyToPaletteBuffer(Pal_UIFont, 0x340, 0x40);
    gPaletteBuffer[0x1A * 0x10] = 0;

    EnablePaletteSync();

    SetFont(&gUnknown_0201F148.font);
    Text_Init3(&gUnknown_0201F148.th2);
    Text_Init3(&gUnknown_0201F148.th3);

    for (i = 0; i < 3; i++) {
        Text_Init3(&gUnknown_0201F148.th[i]);
    }

    SetFont(NULL);

    gUnknown_0201F148.unk_50 = (((0x1FFFF & vram) >> 5) & 0x3FF) + 0xa000;

    SetFont(NULL);
    SetFontGlyphSet(0);

    Text_Init(&gUnknown_0201F148.th1, 5);
    Text_Clear(&gUnknown_0201F148.th1);

    Text_InsertString(&gUnknown_0201F148.th1, 0, 0, GetStringFromIndex(0x5AA)); // TODO: msgid "Success[.]"

    Text_Init(&gUnknown_0201F148.th4, 2);
    Text_Clear(&gUnknown_0201F148.th4);

    Text_AppendString(&gUnknown_0201F148.th4, GetStringFromIndex(0x5AE)); // TODO: msgid "%[.]"

    return;
}

//! FE8U = 0x080B0018
void DrawSoundRoomSongTitle(int index) {
    const char* str;

    if (index == -1) {
        str = GetStringFromIndex(0x7D0); // TODO: msgid "?????[.]"
    } else {
        str = GetStringFromIndex(gUnknown_08A20E74[index].nameTextId);
    }

    SetFont(&gUnknown_0201F148.font);
    SetFontGlyphSet(1);

    Text_80046B4(&gUnknown_0201F148.th2, 0);

    Text_SetXCursor(&gUnknown_0201F148.th2, GetStringTextCenteredPos(176, str));
    Text_SetColorId(&gUnknown_0201F148.th2, 0);
    Text_AppendString(&gUnknown_0201F148.th2, str);

    SetFont(NULL);

    return;
}

//! FE8U = 0x080B0088
void sub_80B0088(int y, u16 unk) {
    int i;

    if (unk > 32) {
        y &= 0xff;

        WriteOAMRotScaleData(
            0,
            Div(+COS(0) * 16, 256),
            Div(-SIN(0) * 16, unk),
            Div(+SIN(0) * 16, 256),
            Div(+COS(0) * 16, unk)
        );

        for (i = 0; i < 5; i++) {
            int a = gUnknown_0201F198;

            PutSpriteExt(4, 36 + i * 32, y + 264, gObject_32x16, i * 4 + gUnknown_0201F198 + 0x1000);
        }

        for (i = 0; i < 3; i++) {
            PutSpriteExt(4, 24 + i * 64, y + 256, gObject_64x32, 0xcb00 + i * 8);
        }
    }

    return;
}

//! FE8U = 0x080B017C
void DrawSoundLevelMeterSprites(int x, int y, int param_3, int param_4) {
    int count = 0;
    int pal = 0xd;

    if (param_4 == 0) {
        return;
    }

    y &= 0xff;

    if (param_3 > 7) {
        int x_ = x;

        for (; param_3 > 7; ) {
            param_3 -= 8;

            PutSpriteExt(0, x_ & 0x1FF, y, gObject_8x8, pal * 0x1000 + 0x847);

            x_ += 8;
            count++;

            if (count > 2) {
                pal = 0xe;
            }

            if (count > 4) {
                pal = 0xf;
            }
        }
    }

    PutSpriteExt(0, (count * 8 + x) & 0x1FF, y, gObject_8x8, param_3 + pal * 0x1000 + 0x840);

    return;
}

//! FE8U = 0x080B0204
void sub_80B0204(struct Proc8A21530* proc) {
    int i;

    struct SoundRoomProc* parent = ((struct SoundRoomProc*)(proc->proc_parent));

    u8* ptr = gUnknown_0201F19C;
    ptr += 0x30;

    for (i = 0; i < 2; i++) {
        int a = ptr[i*0x31];

        DrawSoundLevelMeterSprites(parent->unk_3d * 8 + 15, 64 + i * 8, a, a);
    }

    return;
}

// Sound Room Control PlayButton
u16 CONST_DATA gUnknown_08A21440[] = {
    2,
    0x0000, 0x4008, 0x0550,
    0x4000, 0x8020, 0x0512,
};

// Sound Room Control StopButton
u16 CONST_DATA gUnknown_08A2144E[] = {
    2,
    0x4000, 0x8000, 0x0552,
    0x4000, 0x8020, 0x0516,
};

// Sound Room Control RandomMode Button
u16 CONST_DATA gUnknown_08A2145C[] = {
    2,
    0x4000, 0x8000, 0x0556,
    0x4000, 0x8020, 0x051A,
};

u16 CONST_DATA gSprite_RandomModeBanner[] = {
    5,
    0x4000, 0x8000, 0x0500,
    0x4000, 0x8020, 0x0504,
    0x4000, 0x8040, 0x0508,
    0x4000, 0x8060, 0x050C,
    0x0000, 0x4080, 0x0510,
};

u16 CONST_DATA gSprite_MusicPlayer_SeekBar[] = {
    3,
    0x4000, 0x4000, 0x0560,
    0x4000, 0x4020, 0x0564,
    0x0000, 0x0040, 0x0568,
};

u16 CONST_DATA gSprite_MusicPlayer_SeekBarIndicator[] = {
    1,
    0x0000, 0x0000, 0x014F,
};

u16 CONST_DATA gSprite_MusicPlayer_Time[] = {
    1,
    0x4000, 0x4000, 0x0140,
};

u16 CONST_DATA gSprite_MusicPlayer_Colon[] = {
    1,
    0x0000, 0x0000, 0x014E,
};

u16 CONST_DATA gSprite_08A214B6[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x144),
};

u16 CONST_DATA gSprite_08A214BE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x145),
};

u16 CONST_DATA gSprite_08A214C6[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x146),
};

u16 CONST_DATA gSprite_08A214CE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x147),
};

u16 CONST_DATA gSprite_08A214D6[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x148),
};

u16 CONST_DATA gSprite_08A214DE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x149),
};

u16 CONST_DATA gSprite_08A214E6[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14A),
};

u16 CONST_DATA gSprite_08A214EE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14B),
};

u16 CONST_DATA gSprite_08A214F6[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14C),
};

u16 CONST_DATA gSprite_08A214FE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14D),
};

u16* CONST_DATA gSpriteArray_MusicPlayer_TimeNumbers[] = {
    gSprite_08A214B6,
    gSprite_08A214BE,
    gSprite_08A214C6,
    gSprite_08A214CE,
    gSprite_08A214D6,
    gSprite_08A214DE,
    gSprite_08A214E6,
    gSprite_08A214EE,
    gSprite_08A214F6,
    gSprite_08A214FE,
};

//! FE8U = 0x080B0240
void DrawMusicPlayerTime(int x, int y, int time) {
    int seconds = time / 60;
    int minutes = seconds / 60;
    int secondsIntoMin = seconds % 60;

    PutSpriteExt(0, x, y, gSprite_MusicPlayer_Time, 0x4000);

    PutSpriteExt(0, x + 40, y, gSpriteArray_MusicPlayer_TimeNumbers[minutes], 0x4000);

    PutSpriteExt(0, x + 48, y, gSprite_MusicPlayer_Colon, 0x4000);

    if (secondsIntoMin >= 10) {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin / 10], 0x4000);
    } else {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[0], 0x4000);
    }

    PutSpriteExt(0, x + 64, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin % 10], 0x4000);

    return;
}

//! FE8U = 0x080B031C
void SoundRoom_DrawSprites_Init(struct Proc8A21530* proc) {
    proc->unk_2c = 0;
    return;
}

//! FE8U = 0x080B0324
void SoundRoom_DrawSprites_Loop(struct Proc8A21530* proc) {

    struct SoundRoomProc* parent = ((struct SoundRoomProc*)(proc->proc_parent));

    sub_80B0088(parent->unk_3c * 8 + 6, 0x100);

    if (parent->shuffleActive != 0) {
        int y = (parent->unk_3c * 8 + 36) & 0xff;

        // Draw "Random Mode" banner
        PutSpriteExt(
            0,
            4,
            (((12 - parent->unk_3c) * 8 + 4) & 0xff) + 0x400,
            gSprite_RandomModeBanner,
            0x5000
        );

        // Draw "seek bar" for music player
        PutSpriteExt(
            0,
            124,
            (y + 1) & 0xff,
            gSprite_MusicPlayer_SeekBar,
            0x4000
        );

        // Draw indicator at the song's current playback position
        PutSpriteExt(
            0,
            parent->unk_2c * 66 / (gUnknown_08A20E74[parent->unk_32].songLength + 120) + 124,
            y,
            gSprite_MusicPlayer_SeekBarIndicator,
            0x4000
        );

        DrawMusicPlayerTime(48, y, parent->unk_2c);
    }

    PutSprite(0xb, (parent->unk_3d * 8 + 17) & 0x1FF, 88, gUnknown_08A21440, 0x3000);
    PutSprite(0xb, (parent->unk_3d * 8 + 17) & 0x1FF, 104, gUnknown_08A2144E, 0x3000);
    PutSprite(0xb, (parent->unk_3d * 8 + 17) & 0x1FF, 120, gUnknown_08A2145C, 0x3000);

    sub_80B0204(proc);

    return;
}

struct ProcCmd CONST_DATA gProcScr_SoundRoom_DrawSprites[] = {
    PROC_SLEEP(0),

    PROC_CALL(SoundRoom_DrawSprites_Init),
    PROC_REPEAT(SoundRoom_DrawSprites_Loop),

    PROC_END,
};

//! FE8U = 0x080B0444
ProcPtr DrawSoundRoomSprites(ProcPtr parent) {
    return Proc_Start(gProcScr_SoundRoom_DrawSprites, parent);
}
