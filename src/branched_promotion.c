#include "global.h"

#include "fontgrp.h"
#include "functions.h"
#include "hardware.h"
#include "proc.h"
#include "statscreen.h"
#include "uiutils.h"

struct PromoProc
{
    PROC_HEADER;
    s8 u29;
    s8 u2a;
    s8 u2b;
    ProcPtr u2c;
    s8 u30;
    u8 u31;
    s8 u32;
    s8 u33;
    s8 u34;
    s8 u35;
    s8 u36;
    s8 u37;
    s8 u38;
    s8 u39;
    s8 u3a;
    s8 u3b;
    s8 u3c;
    s8 u3d;
    s8 u3e;
    s8 u3f;
    u32 u40;
    s8 u44[36];
};

extern const struct ProcCmd gUnknown_08B12614[];

ProcPtr Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(struct PromoProc *proc, u8 a, u8 b) {
    u8 * res;
    proc->u30 = 0;
    res = Make6C_PromotionMain(proc);
    proc->u2c = res;
    res[0x38] = a;
    res[0x39] = b;
}

ProcPtr Make6C_PromotionMain(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08B12614, proc);
}

/* Seems like there are a couple of proc structures going on here */
struct PromoProc2
{
    PROC_HEADER;
    s8 u29;
    s8 u2a;
    s8 u2b;
    ProcPtr u2c;
    u32 u30;
    u32 u34;
    s8 u38;
    s8 u39;
    s8 u3a;
    s8 u3b;
    s8 u3c;
    s8 u3d;
    s8 u3e;
    s8 u3f;
    s8 u40;
    s8 u41[40];
};

void sub_80CC4AC(struct PromoProc2 *proc) {
    struct PromoProc *parent;
    proc->u29 = 0;
    proc->u30 = 0;
    proc->u34 = 0;
    parent = proc->proc_parent;
    if (parent->u31 == 0) {
        ResetFaces();
        Font_InitForUIDefault();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
    if (parent->u31 == 1) {
        struct PromoProc *gparent = parent->proc_parent;

        SetupBackgrounds(0);
        EndGreenTextColorManager();
        gparent->u40 = GetThread2SkipStack();
        EndHelpPromptSprite();
        sub_80ADC90();
        DeleteEach6CDifferedLoop();
        DeleteFaceByIndex(0);
        sub_80ACA84(0);
        ResetFaces();
        Font_InitForUIDefault();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
        BG_EnableSyncByMask(2);
    }
    if (parent->u31 == 2) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
}
