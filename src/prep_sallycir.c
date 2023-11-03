#include "global.h"

#include "fontgrp.h"
#include "hardware.h"

#include "prepscreen.h"

/**
* SallyCir proc. Windowing effect in FE6 when transitioning to
* a sub-menu in the prep screen. Unused in FE7/FE8.
*/

struct Win1H {
    /* 00 */ u8 left;
    /* 01 */ u8 right;
};

extern struct Win1H gUnknown_02012F58[][160];
extern struct Win1H* gUnknown_02013458[];

//! FE8U = 0x080977AC
void sub_80977AC(struct Text * th, u16 * tm, int color, int x, const char * str)
{
    ClearText(th);
    Text_SetColor(th, color);
    Text_SetCursor(th, x);
    Text_DrawString(th, str);
    PutText(th, tm);

    return;
}

//! FE8U = 0x080977EC
void sub_80977EC(u8 * a, u16 * b)
{
    if (gUnknown_02012F56 == 0) {
        *a = 0;
        *b = 0;
        return;
    }

    if (gUnknown_02012F56 < 8) {
        if (*a >= gUnknown_02012F56) {
            *a = gUnknown_02012F56 - 1;
        }

        *b = 0;
    } else {
        int unk = (*b >> 4) + 7;

        if (unk < gUnknown_02012F56) {
            if (*a != 6) {
                return;
            }

            *a = 5;
            return;
        }

        if (unk <= gUnknown_02012F56) {
            return;
        }

        *b = (gUnknown_02012F56 - 7) * 16;
    }

    return;
}

//! FE8U = 0x08097840
void SallyCir_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount == 160) {
        struct Win1H* swap;

        vcount = 0;

        swap = gUnknown_02013458[0];
        gUnknown_02013458[0] = gUnknown_02013458[1];
        gUnknown_02013458[1] = swap;
    } else {
        if (vcount > 160) {
            vcount = 0;
        }
    }

    REG_WIN1H = ((*gUnknown_02013458 + vcount)->left << 8) | (*gUnknown_02013458 + vcount)->right;
    return;
}

//! FE8U = 0x0809788C
void SallyCir_Init(struct SallyCirProc * proc)
{
    u16 i;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    if (proc->unk_2a < 0) {
        proc->unk_2c = 150;

        for (i = 0; i < 160; i++) {
            gUnknown_02012F58[0][i].left = 0;
            gUnknown_02012F58[0][i].right = 240;

            gUnknown_02012F58[1][i].left = 0;
            gUnknown_02012F58[1][i].right = 240;
        }

        gLCDControlBuffer.win1_left = 0;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 240;
        gLCDControlBuffer.win1_bottom = 160;
    } else {
        proc->unk_2c = 0;

        for (i = 0; i < 160; i++) {
            gUnknown_02012F58[0][i].left = 120;
            gUnknown_02012F58[0][i].right = 120;

            gUnknown_02012F58[1][i].left = 120;
            gUnknown_02012F58[1][i].right = 120;
        }

        gLCDControlBuffer.win1_left = 120;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 120;
        gLCDControlBuffer.win1_bottom = 160;
    }

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    proc->unk_29 = 0;

    gUnknown_02013458[0] = gUnknown_02012F58[0];
    gUnknown_02013458[1] = gUnknown_02012F58[1];

    SetPrimaryHBlankHandler(SallyCir_OnHBlank);

    return;
}

//! FE8U = 0x080979DC
void SallyCir_Loop(struct SallyCirProc * proc)
{
    s16 i;

    proc->unk_2c += proc->unk_2a;

    if (proc->unk_2c > 150) {
        proc->unk_2c = 150;
    }

    if (proc->unk_2c < 0) {
        proc->unk_2c = 0;
    }

    for (i = 0; i < 160; i++) {
        s16 distance;
        int var;
        if (proc->unk_2c < 1
            || (var = (proc->unk_2c * proc->unk_2c) - ((i - 80) * (i - 80))) < 0) {
            gUnknown_02013458[1][i].left = 120;
            gUnknown_02013458[1][i].right = 120;
            continue;
        }

        distance = Sqrt(var);
        if (distance > 120) {
            distance = 120;
        }

        gUnknown_02013458[1][i].left = 120 - distance;
        gUnknown_02013458[1][i].right = distance + 120;
    }

    proc->unk_29++;

    if (proc->unk_29 == 40) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08097AA0
void SallyCir_OnEnd(void)
{
    SetPrimaryHBlankHandler(NULL);
    return;
}

struct ProcCmd CONST_DATA ProcScr_SallyCir[] = {
    PROC_NAME("SallyCir"),
    PROC_SLEEP(1),

    PROC_CALL(SallyCir_Init),
    PROC_REPEAT(SallyCir_Loop),

    PROC_CALL(SallyCir_OnEnd),

    PROC_END,
};

//! FE8U = 0x08097AAC
struct SallyCirProc* StartSallyCirProc(ProcPtr parent, u8 unk)
{
    struct SallyCirProc* proc = Proc_StartBlocking(ProcScr_SallyCir, parent);
    proc->unk_2a = unk;

    return proc;
}

//! FE8U = 0x08097ACC
void sub_8097ACC(struct SallyCirProc * proc)
{
    proc->unk_29 = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    if (proc->unk_2a > 0) {
        gLCDControlBuffer.win1_left = 0;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 240;
        gLCDControlBuffer.win1_bottom = 160;
    } else {
        gLCDControlBuffer.win1_left = 120;
        gLCDControlBuffer.win1_top = 80;
        gLCDControlBuffer.win1_right = 120;
        gLCDControlBuffer.win1_bottom = 80;
    }

    return;
}

//! FE8U = 0x08097B98
void sub_8097B98(struct SallyCirProc * proc)
{
    int a;
    int t;

    proc->unk_29++;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    a = (15 - proc->unk_29);
    t = (640 - (a * 640 * a) / 225) >> 4;


    if (proc->unk_2a > 0) {
        gLCDControlBuffer.win1_left = t * 3;
        gLCDControlBuffer.win1_top = t * 2;
        gLCDControlBuffer.win1_right = -16 - t * 3;
        gLCDControlBuffer.win1_bottom = -96 - t * 2;
    } else {
        gLCDControlBuffer.win1_left = 120 - t * 3;
        gLCDControlBuffer.win1_top = 80 - t * 2;
        gLCDControlBuffer.win1_right =  120 + t * 3;
        gLCDControlBuffer.win1_bottom = 80 + t * 2;
    }

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;


    if (t >= 40) {
        Proc_Break(proc);

        if (proc->unk_2a > 0) {
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        }
    }

    return;
}

struct ProcCmd CONST_DATA gUnused_08A18870[] = {
    PROC_SLEEP(0),
    PROC_SLEEP(0),

    PROC_END,
};
