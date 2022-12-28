#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"

#include "prepscreen.h"
s8 CheckSomethingSomewhere();

void PrepAtMenu_OnInit(struct ProcAtMenu *proc)
{
    PrepSetLatestCharId(0);
    proc->xDiff = 0;
    *((u16*)&proc->yDiff) = 0;    /* ? */

    if (CheckSomethingSomewhere())
        proc->max_counter = 5;
    else
        proc->max_counter = GetChapterAllyUnitCount();

    proc->unk_30 = 0;
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->state = 0;
    proc->unk_34 = 0;
    proc->end_prep = 0;
    proc->cur_cmd = 0;
    proc->unk_2E = 0;
}

void ResetPrepMenuDescTexts()
{
    int i = 0;
    for (i = 0; i < 5; i++)
        Text_Clear(&gPrepMenuDescTexts[i]);

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 0xD, 0x6),
        0xF, 0xA, 0);

    BG_EnableSyncByMask(0x4);
}

void ParsePrepMenuDescTexts(int msg)
{
    struct TextHandle *th = &gPrepMenuDescTexts[0];
    const char *str = GetStringFromIndex(msg);

    while (1) {
        if ('\0' == *str)        /* End for fetext */
            return;

        if ('\1' == *str) {      /* '\n' for fetext */
            th++;
            str++;
            continue;
        }

        str = Text_AppendChar(th, str);
    }
}

void DrawPrepMenuDescTexts()
{
    int i, base_line;

    base_line = CheckSomethingSomewhere() ? 1 : 0;
    for (i = 0; i < 5; i++) {
        Text_Draw(
            &gPrepMenuDescTexts[i],
            TILEMAP_LOCATED(gBG2TilemapBuffer, 0xD, 2 * i - base_line + 7));
    }

    BG_EnableSyncByMask(0x4);
}

void PrepMenuDescOnInit(struct ProcPrepMenuDesc *proc)
{
    proc->unk4C = 0;
    ResetPrepMenuDescTexts();
}

void PrepMenuDescOnParse(struct ProcPrepMenuDesc *proc)
{
    ParsePrepMenuDescTexts(proc->msg);
}

void PrepMenuDescOnDraw()
{
    DrawPrepMenuDescTexts();
}

void sub_8095C00(int msg, ProcPtr parent)
{
    struct ProcPrepMenuDesc *proc;

    proc = Proc_Find(ProcScr_PrepMenuDescHandler);
    if (proc)
        Proc_End(proc);
    
    proc = Proc_Start(ProcScr_PrepMenuDescHandler, parent);
    proc->msg = msg;
}

void sub_8095C2C(struct ProcAtMenu *proc)
{
    sub_80AD2D4();
    sub_8096C20();
    EndBG3Slider_();
    proc->cur_cmd = sub_809710C();
    EndPrepScreenMenu();
}

void sub_8095C50(int tile, int pal)
{
    CopyDataWithPossibleUncomp(gUnknown_08A1AC88, OBJ_VRAM0 + tile);
    ApplyPalette(gUnknown_08A1B174, pal + 0x10);
}
