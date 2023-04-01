#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"


struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char* unk_2c;
    /* 30 */ struct Font* unk_30;

    /* 34 */ struct TextHandle* unk_34[9]; // unknown size; 3?

    /* 58 */ int unk_58;
    /* 5C */ s16 unk_5c;
    /* 5E */ s16 unk_5e;
    /* 60 */ u16 unk_60;
    /* 62 */ s16 unk_62;
    /* 64 */ s16 unk_64;
};

struct HelpBox8A01650Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x58-0x29];

    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
    /* 60 */ int unk_60;
    /* 64 */ s16 unk_64;
};

struct Struct203E794 {
    /* 00 */ struct Font font;
    /* 16 */ struct TextHandle text[3];
    /* 30 */ u16 unk_30;
};

extern struct Struct203E794 gUnknown_0203E794;

// gfx
extern u8 gUnknown_08A0285C[];
extern u8 gUnknown_08A02884[];
extern u8 gUnknown_08A028AC[];
extern u8 gUnknown_08A02914[];
extern u8 gUnknown_08A02980[];

extern u16 gUnknown_0859EF40[]; // pal

char* sub_80AA768(void); // GetWMNodeNameForSaveMenu
int sub_80AA744(void); // GetHeroLevelForSaveMenu

extern struct HelpBoxInfo gUnknown_0203E7C8;
extern const struct HelpBoxInfo* gUnknown_0203E7E4;

extern struct ProcCmd gUnknown_08A01628[];
extern struct ProcCmd gUnknown_08A01650[];
extern struct ProcCmd gUnknown_08A01678[];
extern struct ProcCmd gUnknown_08A01698[];

// (probably) forward declarations

void sub_808A354(const struct HelpBoxInfo*);
void sub_808A384(struct HelpBoxProc*, int, int);
void sub_808A3C4(struct HelpBoxProc*, int, int);
void sub_808A43C(struct HelpBoxProc*, int, int);
void sub_808A444(struct HelpBoxProc*);

void sub_80045FC(struct TextHandle *th);

//! FE8U = 0x08089804
void LoadDialogueBoxGfx(void* vram, int palId) {

    if (vram == 0) {
        vram = (void *)0x06013000;
    }

    if (palId < 0) {
        palId = 5;
    }

    palId = (palId & 0xF) + 0x10;

    Decompress(gUnknown_08A0285C, vram + 0x360);
    Decompress(gUnknown_08A02884, vram + 0x760);
    Decompress(gUnknown_08A028AC, vram + 0xb60);
    Decompress(gUnknown_08A02914, vram + 0xf60);
    Decompress(gUnknown_08A02980, vram + 0x1360);

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_0203E794.font, vram, palId);

    Text_Init3(&gUnknown_0203E794.text[0]);
    Text_Init3(&gUnknown_0203E794.text[1]);
    Text_Init3(&gUnknown_0203E794.text[2]);

    SetFont(0);

    CopyToPaletteBuffer(gUnknown_0859EF40, palId * 0x20, 0x20);

    gUnknown_0203E794.unk_30 = (((u32)vram << 0x11) >> 0x16) + (palId & 0xF) * 0x1000;

    return;
}

//! FE8U = 0x080898C4
void sub_80898C4(void* vram, int palId) {

    if (vram == 0) {
        vram = (void *)0x06013000;
    }

    if (palId < 0) {
        palId = 5;
    }

    palId = (palId & 0xf) + 0x10;

    Decompress(gUnknown_08A0285C, vram + 0x360);
    Decompress(gUnknown_08A02884, vram + 0x760);
    Decompress(gUnknown_08A028AC, vram + 0xb60);
    Decompress(gUnknown_08A02914, vram + 0xf60);
    Decompress(gUnknown_08A02980, vram + 0x1360);

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_0203E794.font, vram, palId);

    Text_Init3(&gUnknown_0203E794.text[0]);
    Text_Init3(&gUnknown_0203E794.text[1]);

    gUnknown_0203E794.text[2].unk4 = 0;

    SetFont(0);

    CopyToPaletteBuffer(gUnknown_0859EF40, palId * 0x20, 0x20);

    gUnknown_0203E794.unk_30 = (((u32)vram << 0x11) >> 0x16) + (palId & 0xF) * 0x1000;

    return;
}

//! FE8U = 0x08089980
void sub_8089980(int x, int y, int w, int h, int unk) {
    s8 flag;
    s8 flag_;
    s8 anotherFlag;

    int xCount;
    int yCount;

    int xPx;
    int yPx;
    int iy;
    int ix;

    flag = (w + 7) & 0x10;
    anotherFlag = w & 0xf;

    if (w < 0x20) {
        w = 0x20;
    }

    if (w > 0xC0) {
        w = 0xc0;
    }

    if (h < 0x10) {
        h = 0x10;
    }

    if (h > 0x30) {
        h = 0x30;
    }

    xCount = (w + 0x1f) / 0x20;
    yCount = (h + 0x0f) / 0x10;

    flag_ = flag;

    for (ix = xCount - 1; ix >= 0; ix--) {
        for (iy = yCount; iy >= 0; iy--) {

            yPx = (iy + 1) * 0x10;
            if (yPx > h) {
                yPx = h;
            }
            yPx -= 0x10;

            xPx = (ix + 1) * 0x20;

            if (flag_ != 0) {
                xPx -= 0x20;
                PutSprite(0, x + xPx, y + yPx, gObject_16x16, gUnknown_0203E794.unk_30 + ix * 4 + iy * 0x40);
            } else {

                if (xPx > w) {
                    xPx = w;
                }
                xPx -= 0x20;

                PutSprite(0, x + xPx, y + yPx, gObject_32x16, gUnknown_0203E794.unk_30 + ix * 4 + iy * 0x40);

            }
        }

        flag_ = 0;
    }

    flag_ = flag;

    for (ix = xCount - 1; ix >= 0; ix--) {
        xPx = (ix + 1) * 0x20;

        if (flag_ != 0) {
            xPx -= 0x20;

            PutSprite(0, x + xPx, y - 8, gObject_16x8, gUnknown_0203E794.unk_30 + 0x1b);
            PutSprite(0, x + xPx, y + h, gObject_16x8, gUnknown_0203E794.unk_30 + 0x3b);

            flag_ = 0;
        } else {
            if (xPx > w) {
                xPx = w;
            }
            xPx -= 0x20;

            PutSprite(0, x + xPx, y - 8, gObject_32x8, gUnknown_0203E794.unk_30 + 0x1b);
            PutSprite(0, x + xPx, y + h, gObject_32x8, gUnknown_0203E794.unk_30 + 0x3b);

        }

    }

    for (iy = yCount; iy >= 0; iy--) {
        yPx = (iy + 1) * 0x10;
        if (yPx > h) {
            yPx = h;
        }
        yPx -= 0x10;

        PutSprite(0, x - 8, y + yPx, gObject_8x16, gUnknown_0203E794.unk_30 + 0x5f);
        PutSprite(0, x + w, y + yPx, gObject_8x16, gUnknown_0203E794.unk_30 + 0x1f);

        if (anotherFlag != 0) {
            PutSprite(0, x + w - 8, y + yPx, gObject_8x16, gUnknown_0203E794.unk_30 + 0x1a);
        }
    }

    PutSprite(0, x - 8, y - 8, gObject_8x8, gUnknown_0203E794.unk_30 + 0x5b); // top left
    PutSprite(0, x + w, y - 8, gObject_8x8, gUnknown_0203E794.unk_30 + 0x5c); // top right
    PutSprite(0, x - 8, y + h, gObject_8x8, gUnknown_0203E794.unk_30 + 0x5d); // bottom left
    PutSprite(0, x + w, y + h, gObject_8x8, gUnknown_0203E794.unk_30 + 0x5e); // bottom right

    if (anotherFlag != 0) {
        PutSprite(0, x + w - 8, y - 8, gObject_8x8, gUnknown_0203E794.unk_30 + 0x1b);
        PutSprite(0, x + w - 8, y + h, gObject_8x8, gUnknown_0203E794.unk_30 + 0x3b);
    }

    if (unk == 0) {
        PutSprite(0, x, y - 0xb, gObject_32x16, (0x3FF & gUnknown_0203E794.unk_30) + 0x7b);
    }

    return;
}

//! FE8U = 0x08089C40
int sub_8089C40(int item) {
    Text_InsertString(&gUnknown_0203E794.text[0], 0, 8, GetWeaponTypeDisplayString(GetItemType(item)));
    Text_InsertString(&gUnknown_0203E794.text[0], 47, 8, GetStringFromIndex(0x500)); // TODO: msg id "Rng[.]"
    Text_InsertString(&gUnknown_0203E794.text[0], 97, 8, GetStringFromIndex(0x502)); // TODO: msg id "Wt"

    Text_InsertString(&gUnknown_0203E794.text[1], 0, 8, GetStringFromIndex(0x503)); // TODO: msg id "Mt"
    Text_InsertString(&gUnknown_0203E794.text[1], 47, 8, GetStringFromIndex(0x4F4)); // TODO: msg id "Hit[.]}"
    Text_InsertString(&gUnknown_0203E794.text[1], 97, 8, GetStringFromIndex(0x501)); // TODO: msg id "Crit"

    return 2;
}

//! FE8U = 0x08089CD4
void sub_8089CD4(int item) {

    Text_InsertString(&gUnknown_0203E794.text[0], 32, 7, GetItemDisplayRankString(item));
    Text_InsertString(&gUnknown_0203E794.text[0], 67, 7, GetItemDisplayRangeString(item));
    Text_InsertNumberOr2Dashes(&gUnknown_0203E794.text[0], 129, 7, GetItemWeight(item));

    Text_InsertNumberOr2Dashes(&gUnknown_0203E794.text[1], 32, 7, GetItemMight(item));
    Text_InsertNumberOr2Dashes(&gUnknown_0203E794.text[1], 81, 7, GetItemHit(item));
    Text_InsertNumberOr2Dashes(&gUnknown_0203E794.text[1], 129, 7, GetItemCrit(item));

    return;
}

//! FE8U = 0x08089D50
int sub_8089D50(int item) {
    Text_InsertString(&gUnknown_0203E794.text[0], 0, 8, GetStringFromIndex(0x509)); // TODO: msg id "Staff[.]"
    Text_InsertString(&gUnknown_0203E794.text[0], 30, 7, GetItemDisplayRankString(item));
    Text_InsertString(&gUnknown_0203E794.text[0], 48, 8, GetStringFromIndex(0x500)); // TODO: msg id "Rng[.]"
    Text_InsertString(&gUnknown_0203E794.text[0], 70, 7, GetItemDisplayRangeString(item));

    return 1;
}

//! FE8U = 0x08089DB0
void sub_8089DB0(void) {
    Text_InsertString(&gUnknown_0203E794.text[0], 0, 8, GetStringFromIndex(0x147)); // TODO: msg id "Base"
    Text_InsertString(&gUnknown_0203E794.text[0], 90, 8, GetStringFromIndex(0x148)); // TODO: msg id "LV"

    return;
}

//! FE8U = 0x08089DE8
void sub_8089DE8(void) {
    int level;

    char* str = sub_80AA768();

    if (str != 0) {
        Text_InsertString(&gUnknown_0203E794.text[0], 26, 7, str);
    } else {
        Text_InsertString(&gUnknown_0203E794.text[0], 26, 7, GetStringFromIndex(0x538));
    }

    level = sub_80AA744();

    if (level >= 0) {
        Text_InsertNumberOr2Dashes(&gUnknown_0203E794.text[0], 116, 7, level);
    } else {
        Text_InsertString(&gUnknown_0203E794.text[0], 108, 7, GetStringFromIndex(0x535));
    }

    return;
}

//! FE8U = 0x08089E58
void sub_8089E58(struct HelpBoxScrollProc* proc) {

    int i;

    proc->unk_5e--;

    if (proc->unk_5e > 0) {
        return;
    }

    proc->unk_5e = proc->unk_60;

    SetFont(proc->unk_30);

    for (i = 0; i < proc->unk_62; i++) {

        switch (*proc->unk_2c) {

            case 0:
                Proc_Break(proc);
                goto _08089EE0;

            case 1:
                proc->unk_2c++;
                proc->unk_5c++;

                continue;


            case 4:
                proc->unk_2c++;

                continue;

            default:
                proc->unk_2c = Text_AppendChar(proc->unk_34[proc->unk_5c], proc->unk_2c);

                continue;
        }

    }

_08089EE0:
    SetFont(0);

    return;
}

//! FE8U = 0x08089EEC
void sub_8089EEC(struct HelpBoxScrollProc* proc) {
    int i;

    SetFont(proc->unk_30);

    for (i = 0; i < 6; i++) {
        struct TextHandle* th;
_08089EF8:
        th = proc->unk_34[i];

        Text_SetXCursor(th, GetStringTextCenteredPos(th->unk4 * 8, proc->unk_2c));

        while (1) {
            switch (*proc->unk_2c) {
                case 0:
                    goto _08089F4C;

                case 1:
                    proc->unk_2c++;

                    i++;
                    if (i < 6) {
                        goto _08089EF8;
                    } else {
                        goto _08089F4C;
                    }

                case 5:
                case 4:
                    proc->unk_2c++;

                    continue;

                default:
                    proc->unk_2c = Text_AppendChar(th, proc->unk_2c);
                    continue;
            }
        }
    }

_08089F4C:
    SetFont(proc->unk_30);
    return;
}

//! FE8U = 0x08089F58
void sub_8089F58(struct HelpBox8A01650Proc* proc) {
    int item = proc->unk_58;

    SetFont(&gUnknown_0203E794.font);
    SetFontGlyphSet(0);

    switch (GetHelpBoxItemInfoKind(item)) {
        case 0:
            proc->unk_64 = 0;
            break;

        case 1:
            sub_8089C40(item);
            proc->unk_64 = 2;
            break;

        case 2:
            sub_8089D50(item);
            proc->unk_64 = 1;
            break;

        case 3:
            sub_8089DB0();
            proc->unk_64 = 1;
            break;
    }

    SetFont(0);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08089FCC
void sub_8089FCC(struct HelpBox8A01650Proc* proc) {
    int item = proc->unk_58;

    SetFont(&gUnknown_0203E794.font);

    switch (GetHelpBoxItemInfoKind(item)) {
        case 1:
            sub_8089CD4(item);
            break;

        case 3:
            sub_8089DE8();
            break;
    }

    SetFont(0);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808A00C
void sub_808A00C(struct HelpBox8A01650Proc* proc) {
    struct HelpBoxScrollProc* otherProc;
    int textSpeed;

    SetFont(&gUnknown_0203E794.font);

    SetFontGlyphSet(1);

    Text_SetColorId(&gUnknown_0203E794.text[0], 6);
    Text_SetColorId(&gUnknown_0203E794.text[1], 6);
    Text_SetColorId(&gUnknown_0203E794.text[2], 6);

    SetFont(0);

    Proc_EndEach(gUnknown_08A01628);

    otherProc = Proc_Start(gUnknown_08A01628, PROC_TREE_3);
    otherProc->unk_30 = &gUnknown_0203E794.font;

    otherProc->unk_34[0] = &gUnknown_0203E794.text[0];
    otherProc->unk_34[1] = &gUnknown_0203E794.text[1];
    otherProc->unk_34[2] = &gUnknown_0203E794.text[2];

    otherProc->unk_5c = proc->unk_64;

    // TODO: Unknown? Seems pointless, but needed for match
    GetStringFromIndex(proc->unk_5c);

    otherProc->unk_2c = sub_800A2A4();

    otherProc->unk_62 = 1;

    otherProc->unk_5e = 0;

    textSpeed = gPlaySt.cfgTextSpeed;
    switch (gPlaySt.cfgTextSpeed) {
        case 0:
            otherProc->unk_60 = 2;
            break;

        case 1:
            otherProc->unk_60 = textSpeed;
            break;

        case 2:
            otherProc->unk_60 = 1;
            otherProc->unk_62 = textSpeed;
            break;

        case 3:
            otherProc->unk_60 = 0;
            otherProc->unk_62 = 0x7f;
            break;
    }

    return;
}

//! FE8U = 0x0808A0FC
void sub_808A0FC(int item, int msgId) {
    struct HelpBox8A01650Proc* proc = Proc_Start(gUnknown_08A01650, PROC_TREE_3);

    proc->unk_58 = item;
    proc->unk_5c = msgId;

    return;
}

//! FE8U = 0x0808A118
void sub_808A118(void) {

    SetFont(&gUnknown_0203E794.font);

    sub_80045FC(&gUnknown_0203E794.text[0]);
    sub_80045FC(&gUnknown_0203E794.text[1]);
    sub_80045FC(&gUnknown_0203E794.text[2]);

    Proc_EndEach(gUnknown_08A01628);
    Proc_EndEach(gUnknown_08A01650);

    SetFont(0);

    return;
}

//! FE8U = 0x0808A160
void sub_808A160(struct HelpBoxProc* proc) {

    UpdateHelpBoxDisplay(proc, 5);

    if (proc->timer < proc->timerMax) {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x0808A188
void sub_808A188(struct HelpBoxProc* proc) {
    int time;

    sub_808A444(proc);

    sub_808A43C(proc, proc->info->xDisplay, proc->info->yDisplay);

    time = proc->timerMax;
    time = time / 3;

    proc->timerMax = time;
    proc->timer = time;

    return;
}

//! FE8U = 0x0808A1B8
void sub_808A1B8(struct HelpBoxProc* proc) {

    UpdateHelpBoxDisplay(proc, 0);

    proc->timer--;

    if (proc->timer < 0) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808A1E0
void sub_808A1E0(int x, int y, int msgId) {

    gUnknown_0203E7C8.xDisplay = x;
    gUnknown_0203E7C8.yDisplay = y;
    gUnknown_0203E7C8.mid = msgId;
    gUnknown_0203E7C8.redirect = 0;
    gUnknown_0203E7C8.populate = 0;

    sub_808A354(&gUnknown_0203E7C8);

    return;
}

//! FE8U = 0x0808A200
void sub_808A200(const struct HelpBoxInfo* info) {
    int wTextBox;
    int hTextBox;

    struct HelpBoxProc* proc = Proc_Find(gUnknown_08A01678);

    if (!proc) {
        proc = Proc_Start(gUnknown_08A01678, PROC_TREE_3);

        PlaySoundEffect(0x70);

        sub_808A43C(proc, info->xDisplay, info->yDisplay);

        sub_808A444(proc);
    } else {
        proc->xBoxInit = proc->xBox;
        proc->yBoxInit = proc->yBox;
        proc->wBoxInit = proc->wBoxFinal;
        proc->hBoxInit = proc->hBoxFinal;
    }

    proc->info = info;
    proc->timer = 0;
    proc->timerMax = 0xc;

    proc->mid = info->mid;

    SetFontGlyphSet(1);

    sub_8003FAC(GetStringFromIndex(proc->mid), &wTextBox, &hTextBox);

    SetFontGlyphSet(0);

    sub_808A384(proc, wTextBox, hTextBox);
    sub_808A3C4(proc, info->xDisplay, info->yDisplay);

    sub_808A118();

    sub_808A0FC(proc->item, proc->mid);

    gUnknown_0203E7E4 = info;

    return;
}

//! FE8U = 0x0808A2D0
void sub_808A2D0(void) {

    PlaySoundEffect(0x71);

    sub_808A118();

    Proc_BreakEach(gUnknown_08A01678);

    return;
}

//! FE8U = 0x0808A2FC
void sub_808A2FC(struct HelpBoxProc* proc) {

    proc->moveKey = 0;

    if (proc->info->redirect) {
        proc->info->redirect(proc);
    }

    sub_808A200(proc->info);

    return;
}

//! FE8U = 0x0808A320
void sub_808A320(struct HelpBoxProc* proc) {

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808A340
void sub_808A340(struct HelpBoxProc* proc) {

    sub_808A2D0();
    Proc_End(proc);

    return;
}

//! FE8U = 0x0808A354
void sub_808A354(const struct HelpBoxInfo* info) {
    struct HelpBoxProc* proc = Proc_Start(gUnknown_08A01698, PROC_TREE_3);

    proc->info = info;

    return;
}

//! FE8U = 0x0808A36C
s8 sub_808A36C(void) {
    return Proc_Find(gUnknown_08A01698) ? 1 : 0;
}
