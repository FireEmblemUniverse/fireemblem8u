#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "chapterdata.h"

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

extern int gUnknown_08A196BC[];
extern int gUnknown_08A196D0[];

//! FE8U = 0x080A0724
void sub_80A0724(struct PrepProcA1962C* proc) {
    sub_808F128(10, 7, 17, 4, proc->unk_2c, 0x06011000, -1, 0);
    sub_808E9D8(0x7c);
    return;
}

//! FE8U = 0x080A0758
void sub_80A0758(void) {
    return;
}

//! FE8U = 0x080A075C
void __malloc_unlock_2(void) {
    return;
}

//! FE8U = 0x080A0760
void sub_80A0760(struct PrepProcA1962C* proc) {
    proc->unk_30[0] = 1;
    proc->unk_30[1] = sub_80A0A34();
    proc->unk_30[2] = sub_80A0A70();
    proc->unk_30[3] = 1;
    return;
}

//! FE8U = 0x080A078C
void sub_80A078C(struct PrepProcA1962C* proc) {
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
s8 sub_80A0860(struct PrepProcA1962C* proc) {
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
void sub_80A0900(ProcPtr proc) {
    sub_808F270();
    EndAllProcChildren(proc);
    EndBG3Slider_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
    return;
}

//! FE8U = 0x080A0924
void sub_80A0924(struct PrepProcA1962C* proc) {
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

extern struct ProcCmd gUnknown_08A1962C[];

//! FE8U = 0x080A0944
void StartPrepSupportScreen(int a, ProcPtr parent) {
    struct PrepProcA1962C* proc = Proc_StartBlocking(gUnknown_08A1962C, parent);
    proc->unk_29 = a;
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
int sub_80A098C(void) {
    return GetROMChapterStruct(gRAMChapterData.chapterIndex)->divinationTextIdInHectorStory;
}

//! FE8U = 0x080A09A8
int sub_80A09A8(void) {
    return GetROMChapterStruct(gRAMChapterData.chapterIndex)->divinationTextIdBeginning;
}

//! FE8U = 0x080A09C4
int sub_80A09C4(void) {
    return GetROMChapterStruct(gRAMChapterData.chapterIndex)->divinationTextIdEnding;
}

//! FE8U = 0x080A09E0
int sub_80A09E0(void) {
    return GetROMChapterStruct(gRAMChapterData.chapterIndex)->divinationFee;
}

//! FE8U = 0x080A09FC
int sub_80A09FC(void) {
    return GetROMChapterStruct(gRAMChapterData.chapterIndex)->divinationPortrait;
}

//! FE8U = 0x080A0A18
s8 sub_80A0A18(void) {
    if (!sub_80A098C()) {
        return 0;
    }

    if (sub_80A09A8()) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080A0A34
s8 sub_80A0A34(void) {
    if ((gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT) || !sub_80A098C()) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080A0A5C
s8 sub_80A0A5C(void) {
    if (sub_80A09FC() == 1) {
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

    if (gRAMChapterData.chapterIndex > 0x61) {
        return 1;
    }

    return 0;
}
