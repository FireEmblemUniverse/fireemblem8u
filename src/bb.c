#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"


struct SubtitleHelpProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char* string;
    /* 30 */ struct Font font;
    /* 48 */ struct TextHandle text[2];
    /* 58 */ s16 textOffset;
    /* 5A */ s16 textShowCnt;
    /* 5C */ s16 textNum;
    /* 5E */ s16 textCount;
};

extern u8 gUnknown_0859EF20[]; // pal

extern u16 gUnknown_0859E14C[];
extern u8 gUnknown_0859E166[];
extern struct ProcCmd gUnknown_0859E188[];
extern u8 gUnknown_0859E1B0[];
extern struct ProcCmd gUnknown_0859E1B8[];

// bm.s
void sub_8015EDC(int);

void sub_803547C(struct SubtitleHelpProc* proc, int y) {
    int i;
    int x;
    int index;


    for (i = 0; i < 9; i++) {
        x = (i * 32) - 32 + proc->textOffset;
        index = (proc->textNum + i) % proc->textCount;

        PutSprite(2, x, y, gObject_32x16, 0x4240 + gUnknown_0859E14C[index]);
    }

    return;
}

void sub_80354E0(struct SubtitleHelpProc* proc) {
    const char* iter;
    int line;
    int width;

    iter = proc->string;

    InitSomeOtherGraphicsRelatedStruct(&proc->font, OBJ_VRAM0 + 0x4800, 0x14);
    SetFontGlyphSet(1);

    CopyToPaletteBuffer(gUnknown_0859EF20, 0x280, 0x20);

    for (line = 0; line < 2; line++) {
        Text_Init3(proc->text + line);

        Text_80046B4(proc->text + line, 0);
        Text_SetColorId(proc->text + line, 0);
    }

    line = 0;

    if (iter != 0) {
        while (*iter > 1) {

            iter = Text_AppendChar(proc->text + line, iter);

            if (Text_GetXCursor(proc->text + line) > 0xE0) {

                iter -= 2;
                line++;

                GetCharTextWidth(iter, &width);

                Text_SetXCursor(proc->text + line, (Text_GetXCursor(proc->text) - width) - 0xC0);
            }
        }

        proc->textCount = ((GetStringTextWidth(proc->string) + 16) >> 5) + 1;
        proc->textNum = proc->textCount - 1;
    }

    SetFont(0);

    return;
}

void sub_80355AC() {

    u16 vcount = REG_VCOUNT;

    if ((vcount < 140) || (vcount > 160)) {
        REG_BLDCNT = *(u16*)(&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = *(u16*)(&gLCDControlBuffer.blendCoeffA);
        REG_BLDY = gLCDControlBuffer.blendY;
    } else {
        int bldy;

        bldy = gUnknown_0859E166[vcount - 128];
        bldy = bldy - gUnknown_0202BCB0._pad30[8];

        if (bldy < 0) {
            bldy = 0;
        }

        REG_BLDCNT = 0xEC;
        REG_BLDY = bldy;
    }

    return;
}

void sub_8035614() {

    gUnknown_0202BCB0._pad30[8] = 8; // unk38
    SetPrimaryHBlankHandler(sub_80355AC);

    return;
}

void sub_8035630() {

    if (gUnknown_0202BCB0._pad30[8] != 0) {
        gUnknown_0202BCB0._pad30[8]--;
    }

    return;
}

void sub_803564C(struct SubtitleHelpProc* proc) {

    gUnknown_0202BCB0._pad30[8]++;

    if (gUnknown_0202BCB0._pad30[8] == 8) {
        SetPrimaryHBlankHandler(0);
        Proc_Break(proc);
    }

    return;
}

void sub_8035678(struct SubtitleHelpProc* proc) {
    proc->textOffset = 31;
    proc->textShowCnt = 6;

    Proc_Start(gUnknown_0859E188, PROC_TREE_3);

    return;
}

void sub_8035698() {

    gUnknown_0202BCB0.unk28.y -= 16;

    sub_8015EDC(0);

    Proc_BreakEach(gUnknown_0859E188);

    return;
}

void sub_80356BC(struct SubtitleHelpProc* proc) {

    sub_803547C(proc, gUnknown_0859E1B0[proc->textShowCnt]);

    if (proc->textShowCnt != 0) {
        proc->textShowCnt--;
    }

    proc->textOffset--;

    if (proc->textOffset < 0) {
        proc->textOffset = 31;
        proc->textNum++;
    }

    return;
}

void NewBottomHelpText(ProcPtr parent, const char* string) {

    if (gRAMChapterData.unk41_8 != 1) {
        struct SubtitleHelpProc* proc = Proc_Start(gUnknown_0859E1B8, parent);

        proc->string = string;

        sub_80354E0(proc);

        sub_801A278();

        gUnknown_0202BCB0.unk28.y += 16;
    }

    return;
}

void DeleteEach6CBB() {
    Proc_EndEach(gUnknown_0859E1B8);
    return;
}

s8 sub_8035758() {
    return Proc_Find(gUnknown_0859E1B8) != 0;
}

void sub_8035770(ProcPtr parent, const char* string) {
    struct SubtitleHelpProc* proc;

    proc = Proc_Find(gUnknown_0859E1B8);
    if (proc == 0) {
        proc = Proc_Start(gUnknown_0859E1B8, parent);
    }

    proc->string = string;

    sub_80354E0(proc);

    proc->textOffset = 31;

    return;
}
