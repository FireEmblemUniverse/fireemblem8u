#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "chapterdata.h"
#include "prepscreen.h"

/**
* This proc seems to be the "sub-menu" dialogue that pops up when selecting "Fortune" on the prep screen in FE7.
* In FE8, most of the functionality has been dummied out, and this proc goes directly to the support screen.
*/

struct PrepProcA1962C {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2C */ int unk_2c;
    /* 30 */ s8 unk_30[4];
};

s8 sub_80A0A34(void);
s8 sub_80A0A70(void);

extern u16 gUnknown_02022F28[];

extern struct TextHandle gUnknown_02013498[];

void FortuneSubMenu_Init_Null(void);
void FortuneSubMenu_OnOptionSelected(ProcPtr);
void FortuneSubMenu_HandleOptionSwitch(struct PrepProcA1962C*);
void StartSupportScreenFromPrepScreen(ProcPtr);

struct ProcCmd CONST_DATA gProcScr_FortuneSubMenu[] = {
    PROC_SLEEP(0),

    PROC_CALL(FortuneSubMenu_Init_Null),

PROC_LABEL(0),
    PROC_CALL(FortuneSubMenu_HandleOptionSwitch),

    // fallthrough

PROC_LABEL(1),
PROC_LABEL(2),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),

    PROC_GOTO(5),

PROC_LABEL(3),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),

    PROC_GOTO(5),

PROC_LABEL(4),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_CALL(StartSupportScreenFromPrepScreen),

    PROC_SLEEP(0),

    PROC_GOTO(5),

PROC_LABEL(5),
    PROC_END,
};

int CONST_DATA gUnknown_08A196BC[] = {
    0x586, // TODO: msgid "Rank"
    0x587, // TODO: msgid "Tactician"
    0x588, // TODO: msgid "Augury"
    0x577, // TODO: msgid "Support"
    0x589, // TODO: msgid "Augury Menu"
};

int CONST_DATA gUnknown_08A196D0[] = {
    0x586, // TODO: msgid "Rank"
    0x587, // TODO: msgid "Tactician"
    0x588, // TODO: msgid "Augury"
    0x577, // TODO: msgid "Support"
    0x589, // TODO: msgid "Augury Menu"
};

int CONST_DATA gUnused_08A196E4[] = {
    0x58A, // TODO: msgid "Tactics"
    0x58B, // TODO: msgid "Survival"
    0x58C, // TODO: msgid "Funds"
    0x58D, // TODO: msgid "Exp"
    0x58E, // TODO: msgid "Combat"
    0x58F, // TODO: msgid "Objective"
};

//! FE8U = 0x080A0724
void sub_80A0724(struct PrepProcA1962C* proc) {
    sub_808F128(10, 7, 17, 4, proc->unk_2c, 0x06011000, -1, 0);
    sub_808E9D8(0x7c);
    return;
}

//! FE8U = 0x080A0758
void FortuneSubMenu_Init_Null(void) {
    return;
}

//! FE8U = 0x080A075C
void __malloc_unlock_2(void) {
    return;
}

//! FE8U = 0x080A0760
void FortuneSubMenu_Unused_SetAvailableOptions(struct PrepProcA1962C* proc) {
    proc->unk_30[0] = 1;
    proc->unk_30[1] = sub_80A0A34();
    proc->unk_30[2] = sub_80A0A70();
    proc->unk_30[3] = 1;
    return;
}

//! FE8U = 0x080A078C
void FortuneSubMenu_Unused_SetupText(struct PrepProcA1962C* proc) {
    int i;

    struct TextHandle* th = gUnknown_02013498;

    SetFontGlyphSet(0);
    SetFont(0);

    TileMap_FillRect(gUnknown_02022F28, 31, 10, 0);

    for (i = 0; i < 4; i++) {
        Text_Clear(th);
        DrawTextInline(
            th++,
            gBG0TilemapBuffer + TILEMAP_INDEX(0x144 + (i & 1) * 14, (i >> 1) * 2),
            proc->unk_30[i] != 0 ? 0 : 1,
            0,
            0,
            GetStringFromIndex(gUnknown_08A196D0[i])
        );
    }

    th = gUnknown_02013498 + 0x1e;

    Text_Clear(th);
    DrawTextInline(
        th,
        gBG0TilemapBuffer + 0x16,
        0,
        0,
        0,
        GetStringFromIndex(gUnknown_08A196BC[3])
    );

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A0860
s8 FortuneSubMenu_Unused_KeyHandler(struct PrepProcA1962C* proc) {
    int previous = proc->unk_29;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && ((proc->unk_29 % 2) != 0)) {
        proc->unk_29--;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && ((proc->unk_29 % 2) == 0)) {
        proc->unk_29++;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) && ((proc->unk_29 / 2) == 0)) {
        proc->unk_29 += 2;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) && (proc->unk_29 / 2) != 0) {
        proc->unk_29 -= 2;
    }

    if (previous != proc->unk_29) {
        PlaySoundEffect(0x65);
        return 1;
    }

    return 0;
}

//! FE8U = 0x080A0900
void FortuneSubMenu_OnOptionSelected(ProcPtr proc) {
    sub_808F270();
    EndAllProcChildren(proc);
    EndBG3Slider_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
    return;
}

//! FE8U = 0x080A0924
void FortuneSubMenu_HandleOptionSwitch(struct PrepProcA1962C* proc) {
    switch (proc->unk_29) {
        case 0:
        case 1:
        default:
            return;

        case 2:
            Proc_Goto(proc, 4);
            return;
    }
}

//! FE8U = 0x080A0944
void StartFortuneSubMenu(int option, ProcPtr parent) {
    struct PrepProcA1962C* proc = Proc_StartBlocking(gProcScr_FortuneSubMenu, parent);
    proc->unk_29 = option;
    return;
}

//! FE8U = 0x080A095C
int sub_80A095C(int var) {
    switch (var) {
        case 0:
            return 1;
        case 1:
            return sub_80A0A34();
        case 2:
            return sub_80A0A70();
    }

    return 0;
}

//! FE8U = 0x080A098C
int GetChapterDivinationTextIdHectorStory(void) {
    return GetROMChapterStruct(gPlaySt.chapterIndex)->divinationTextIdInHectorStory;
}

//! FE8U = 0x080A09A8
int GetChapterDivinationTextIdBeginning(void) {
    return GetROMChapterStruct(gPlaySt.chapterIndex)->divinationTextIdBeginning;
}

//! FE8U = 0x080A09C4
int GetChapterDivinationTextIdEnding(void) {
    return GetROMChapterStruct(gPlaySt.chapterIndex)->divinationTextIdEnding;
}

//! FE8U = 0x080A09E0
int GetChapterDivinationFee(void) {
    return GetROMChapterStruct(gPlaySt.chapterIndex)->divinationFee;
}

//! FE8U = 0x080A09FC
int GetChapterDivinationPortrait(void) {
    return GetROMChapterStruct(gPlaySt.chapterIndex)->divinationPortrait;
}

//! FE8U = 0x080A0A18
s8 sub_80A0A18(void) {
    if (!GetChapterDivinationTextIdHectorStory()) {
        return 0;
    }

    if (GetChapterDivinationTextIdBeginning()) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080A0A34
s8 sub_80A0A34(void) {
    if ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) || !GetChapterDivinationTextIdHectorStory()) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080A0A5C
s8 sub_80A0A5C(void) {
    if (GetChapterDivinationPortrait() == 1) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080A0A70
s8 sub_80A0A70(void) {
    return 1;
}

//! FE8U = 0x080A0A74
s8 sub_80A0A74(void) {

    if (gPlaySt.chapterIndex > 0x61) {
        return 1;
    }

    return 0;
}
