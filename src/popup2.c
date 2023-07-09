#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"

/**
 * It's like a popup but for some reason it's not
 */


/* struct definitions */

struct Popup2Proc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4c */ u16 timer;
};


/* function declarations */

void ProcPopup2_Init(struct Popup2Proc *proc);
void ProcPopup2_Loop(struct Popup2Proc *proc);


/* section.data */

struct ProcCmd CONST_DATA ProcScr_Popup2[] = {
    PROC_CALL(ProcPopup2_Init),
    PROC_REPEAT(ProcPopup2_Loop),
    PROC_CALL(ClearBg0Bg1),
    PROC_END
};


/* section.text */

void ProcPopup2_Init(struct Popup2Proc *proc)
{
    proc->timer = 0xF0;
}

void ProcPopup2_Loop(struct Popup2Proc *proc)
{
    int timer = --proc->timer;

    /* todo */
    if ((timer << 0x10 < 0) || ((A_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys))
        Proc_Break(proc);
}

void NewPopup2_PlanA(ProcPtr parent, int IconIndex, char *str)
{
    int len = GetStringTextLen(str);
    int x, x_tile, y_tile;

    if (IconIndex >= 0)
        len += 0x10;
    
    len += 0x18;

    x_tile = 0xF0 - len;
    if (x_tile < 0)
        x_tile += 0xF;

    x = x_tile >> 4;

    y_tile = len < 0 ? len + 7 : len;

    DrawUiFrame2(x_tile >> 4, 8, y_tile >> 3, 4, 0);

    if (IconIndex >= 0) {
        ResetIconGraphics_();
        LoadIconPalettes(4);
        DrawIcon(
            TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9),
            IconIndex,
            TILEREF(0, 0x4)); /* todo */
        x += 2;
    }

    ResetTextFont();
    PutDrawText(NULL, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9), TEXT_COLOR_SYSTEM_WHITE, 0, 0x14, str);
    Proc_StartBlocking(ProcScr_Popup2, parent);
}

void NewPopup2_PlanB(ProcPtr proc, int icon_index, char *str0, int num, char *str1)
{
    int tmp, tiles, x, x_tile;
    struct Text th;
    int len = 1;

    if (0 != str0)
        len += GetStringTextLen(str0) + 2;
    
    if (0 != str1)
        len += GetStringTextLen(str1) + 2;

    tiles = 8;
    tmp = num;
    
    while (1) {
        tmp = tmp / 0xA;
        
        if (tmp == 0)
            break;

        tiles += 8;
    }

    if (icon_index >= 0)
        len += 0x10;
    len += 0x18;

    x_tile = 0xF0 - len;
    if (x_tile < 0)
        x_tile += 0xF;
    x = x_tile >> 4;

    tmp = len += tiles;
    len = len < 0 ? tmp + 7 : tmp;
    tiles = len >> 3;

    DrawUiFrame2(x, 8, tiles, 4, 0);

    if (icon_index >= 0) {
        ResetIconGraphics_();
        LoadIconPalettes(4);
        DrawIcon(
            TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9),
            icon_index,
            TILEREF(0, 0x4)); /* todo */
        x += 2;
    }

    ResetTextFont();
    InitText(&th, tiles);
    Text_Skip(&th, 1);

    if (0 != str0) {
        Text_SetColor(&th, 0);
        Text_DrawString(&th, str0);
        Text_Skip(&th, 2);
    }

    Text_SetColor(&th, 2);
    Text_DrawNumberOrSpace(&th, num);    /* seems like draw this number */

    if (0 != str1) {
        Text_Skip(&th, 2);
        Text_SetColor(&th, 0);
        Text_DrawString(&th, str1);
    }

    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9));
    Proc_StartBlocking(ProcScr_Popup2, proc);
}

void NewPopup2_PlanC(ProcPtr parent, int item, int msg)
{
    int len, x, y, x_tile, y_tile;

    struct Text th;

    ResetTextFont();
    InitText(&th, 0x14);
    Text_SetColor(&th, TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawString(&th, GetItemName(item));
    Text_Skip(&th, 2);
    Text_SetColor(&th, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&th, GetStringFromIndex(msg));

    len = Text_GetCursor(&th);
    len += 0x28;

    x_tile = 0xF0 - len;

    if (x_tile < 0)
        x_tile += 0xF;
    x = x_tile >> 4;

    y_tile = len < 0 ? len + 7 : len;
    y = y_tile >> 3;

    DrawUiFrame2(x, 8, y, 4, 0);
    DrawIcon(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9),
        GetItemIconId(item),
        TILEREF(0, 0x4)
    );

    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 3, 9));
    Proc_StartBlocking(ProcScr_Popup2, parent);

}


void NewPopup2_PlanD(ProcPtr parent, int item, int msg0, int msg1)
{
    int len2, x_tile, y_tile, y;
    char *str;

#if NONMATCHING
    int len1, x0, x1;
#else
    register int len1 asm("r1") = 0;
    register int x0 asm("r4") = 0;
    register int x1 asm("r6") = 0;
#endif /* NONMATCHING */

    struct Text th;

    ResetTextFont();
    InitText(&th, 0x14);

    if (0 != msg0) {
        Text_SetColor(&th, 0);
        Text_DrawString(&th, GetStringFromIndex(msg0));
        Text_Skip(&th, 2);
    }

    Text_SetColor(&th, 2);

    if (0 != msg0)
        str = GetItemNameWithArticle(item, 0);
    else
        str = GetItemNameWithArticle(item, 1);

    Text_DrawString(&th, str);

    len1 = Text_GetCursor(&th) + 7;
    if (len1 < 0)
        len1 += 7;

    x0 = len1 >> 3;

    Text_SetCursor(&th, (x0 + 2) * 8);
    Text_SetColor(&th, 0);

    if (0 != msg1) {
        Text_DrawString(&th, GetStringFromIndex(msg1));
    }

    len2 = Text_GetCursor(&th);
    len2 += 0x18;

    x_tile = 0xF0 - len2;
    if (x_tile < 0)
        x_tile += 0xF;
    x1 = x_tile >> 4;

    y_tile = len2 < 0 ? len2 + 7 : len2;
    y = y_tile >> 3;

    DrawUiFrame2(x1, 8, y, 4, 0);
    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x1 + 1, 9));

    x0 += 1;
    DrawIcon(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x1 + x0, 9),
        GetItemIconId(item),
        TILEREF(0, 0x4)
    );
    Proc_StartBlocking(ProcScr_Popup2, parent);
}

void NewPopup2_DropItem(ProcPtr parent, int item)
{
    NewPopup2_PlanD(parent, item,
        0x00F,        /* Dropped */
        0x022);      /* .[.] */
}

void NewPopup2_SendItem(ProcPtr parent, int item)
{
    NewPopup2_PlanD(parent, item,
    0x010,           /* Sent [.] */
    0x011);          /* .[.] */
}
