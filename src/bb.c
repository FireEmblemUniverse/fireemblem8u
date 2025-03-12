#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void PutSubtitleHelpText(struct SubtitleHelpProc * proc, int y)
{
    static u16 lut[] = {
        0x00,
        0x04, 0x08, 0x0C, 0x10, 0x14, 0x18,
        0x44, 0x48, 0x4C, 0x50, 0x54, 0x58,
    };

    int i;

    for (i = 0; i < 9; i++) {
        int x = (i * 32) - 32 + proc->textOffset;
        int index = (proc->textNum + i) % proc->textCount;

        PutSprite(2, x, y, &gObject_32x16, 0x4240 + lut[index]);
    }

    return;
}

void InitSubtitleHelpText(struct SubtitleHelpProc * proc)
{
    const char * iter;
    int line;
    int width;

    iter = proc->string;

    InitSpriteTextFont(&proc->font, OBJ_VRAM0 + 0x4800, 0x14);
    SetTextFontGlyphs(1);

    ApplyPalette(gUnknown_0859EF20, 0x14);

    for (line = 0; line < 2; line++) {
        InitSpriteText(proc->text + line);

        SpriteText_DrawBackgroundExt(proc->text + line, 0);
        Text_SetColor(proc->text + line, 0);
    }

    line = 0;

    if (iter != 0) {
        while (*iter > 1) {

            iter = Text_DrawCharacter(proc->text + line, iter);

            if (Text_GetCursor(proc->text + line) > 0xE0) {

                iter -= 2;
                line++;

                GetCharTextLen(iter, &width);

                Text_SetCursor(proc->text + line, (Text_GetCursor(proc->text) - width) - 0xC0);
            }
        }

        proc->textCount = ((GetStringTextLen(proc->string) + 16) >> 5) + 1;
        proc->textNum = proc->textCount - 1;
    }

    SetTextFont(0);

    return;
}

void SubtitleHelpDarkenerOnHBlank()
{
    static u8 bldyLut[] = {
        0, 0, 0, 0, 0, 0, 0, 0, // 128 .. 135
        0, 0, 0, 0, 1, 2, 3, 4, // 136 .. 143
        5, 6, 7, 7, 7, 7, 7, 7, // 144 .. 151
        7, 7, 7, 7, 7, 7, 7, 7, // 152 .. 159
    };

    u16 vcount = REG_VCOUNT;

    if ((vcount < 140) || (vcount > 160)) {
        REG_BLDCNT = *(u16*)(&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = *(u16*)(&gLCDControlBuffer.blendCoeffA);
        REG_BLDY = gLCDControlBuffer.blendY;
    } else {
        int bldy;

        bldy = bldyLut[vcount - 128];
        bldy = bldy - gBmSt.altBlendACa;

        if (bldy < 0) {
            bldy = 0;
        }

        REG_BLDCNT =
            BLDCNT_EFFECT_DARKEN |
            BLDCNT_TGT1_BG2 |
            BLDCNT_TGT1_BG3 |
            BLDCNT_TGT1_BD;

        REG_BLDY = bldy;
    }

    return;
}

void SubtitleHelpDarkener_Init()
{
    gBmSt.altBlendACa = 8;
    SetPrimaryHBlankHandler(SubtitleHelpDarkenerOnHBlank);

    return;
}

void SubtitleHelpDarkener_FadeIn()
{
    if (gBmSt.altBlendACa != 0)
        gBmSt.altBlendACa--;
}

void SubtitleHelpDarkener_FadeOut(struct SubtitleHelpProc * proc)
{
    gBmSt.altBlendACa++;

    if (gBmSt.altBlendACa == 8) {
        SetPrimaryHBlankHandler(0);
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SubtitleHelpDarkener[] = {
    PROC_END_DUPLICATES,

    PROC_CALL(SubtitleHelpDarkener_Init),

    PROC_REPEAT(SubtitleHelpDarkener_FadeIn),
    PROC_REPEAT(SubtitleHelpDarkener_FadeOut),

    PROC_END,
};

void SubtitleHelp_Init(struct SubtitleHelpProc * proc)
{
    proc->textOffset = 31;
    proc->textShowCnt = 6;

    Proc_Start(gProcScr_SubtitleHelpDarkener, PROC_TREE_3);

    return;
}

void SubtitleHelp_OnEnd(void)
{
    gBmSt.cameraMax.y -= 16;

    CameraMove_8015EDC(0);

    Proc_BreakEach(gProcScr_SubtitleHelpDarkener);

    return;
}


void SubtitleHelp_Loop(struct SubtitleHelpProc * proc)
{
    static u8 lut[] = {
        0x90, 0x91, 0x92, 0x94, 0x96, 0x99, 0x9C, 0x00,
    };

    PutSubtitleHelpText(proc, lut[proc->textShowCnt]);

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

struct ProcCmd CONST_DATA gProcScr_SubtitleHelp[] = {
    PROC_NAME("BB"),
    PROC_15,

    PROC_SET_END_CB(SubtitleHelp_OnEnd),

    PROC_SLEEP(0),

    PROC_CALL(SubtitleHelp_Init),
    PROC_REPEAT(SubtitleHelp_Loop),

    PROC_BLOCK,
};

void StartSubtitleHelp(ProcPtr parent, const char * string) {

    if (gPlaySt.config.noSubtitleHelp != 1) {
        struct SubtitleHelpProc* proc = Proc_Start(gProcScr_SubtitleHelp, parent);

        proc->string = string;

        InitSubtitleHelpText(proc);

        sub_801A278();

        gBmSt.cameraMax.y += 16;
    }

    return;
}

void EndSubtitleHelp() {
    Proc_EndEach(gProcScr_SubtitleHelp);
    return;
}

s8 IsSubtitleHelpActive() {
    return Proc_Find(gProcScr_SubtitleHelp) != 0;
}

void sub_8035770(ProcPtr parent, const char * string)
{
    struct SubtitleHelpProc* proc;

    proc = Proc_Find(gProcScr_SubtitleHelp);
    if (proc == 0) {
        proc = Proc_Start(gProcScr_SubtitleHelp, parent);
    }

    proc->string = string;

    InitSubtitleHelpText(proc);

    proc->textOffset = 31;

    return;
}
