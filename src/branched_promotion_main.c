#include "branched_promotion.h"

#include "bmio.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"

void sub_80CC4AC(struct PromoProc2 *proc);
void sub_80CC5B4(struct PromoProc2 *proc);
int sub_80CDA2C(struct PromoProc2 *proc);
u32 sub_80CDA38(struct PromoProc2 *proc);
void sub_80CC628(struct PromoProc2 *proc);
u32 sub_80CD2F8(struct PromoProc2 *proc);
u32 sub_80CD330(struct PromoProc2 *proc);
void sub_80CDEA8(struct PromoProc2 *proc);
void sub_80CC66C(struct PromoProc2 *proc);
void sub_80CC698(struct PromoProc2 *proc);

CONST_DATA
struct ProcCmd gUnknown_08B12614[] =
{
	PROC_NAME("ccramify"),
	PROC_LABEL(0),
    PROC_CALL(sub_80CC4AC),
    PROC_SLEEP(3),
	PROC_LABEL(1),
    PROC_CALL(sub_80CC5B4),
    PROC_LABEL(2),
    PROC_WHILE(sub_80CDA2C),
    PROC_WHILE(sub_80CDA38),
    PROC_CALL(sub_80CC628),
    PROC_LABEL(4),
    PROC_WHILE(sub_80CD2F8),
    PROC_SLEEP(5),
    PROC_REPEAT(sub_80CD330),
    PROC_LABEL(5),
    PROC_CALL(sub_80CDEA8),
    PROC_SLEEP(2),
    PROC_LABEL(6),
    PROC_CALL(sub_80CC66C),
    PROC_LABEL(7),
    PROC_LABEL(8),
    PROC_CALL(sub_80CC698),
    PROC_END,
};

struct PromoProc2 *Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(ProcPtr proc, u32 a, u32 b) {
    struct PromoProc *proc_ = (struct PromoProc *) proc;
    u8 a_ = a;
    u8 b_ = b;
    struct PromoProc2 *res;
    proc_->u30 = 0;
    res = Make6C_PromotionMain(proc_);
    proc_->u2c = res;
    res->u38 = a_;
    res->u39 = b_;
}

struct PromoProc2 *Make6C_PromotionMain(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08B12614, proc);
}

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

void sub_80CC5B4(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    switch (parent->u31) {
        case 0:
            Proc_Goto(proc, 2);
            break;
        case 1:
            if (!parent->u34) {
                proc->u3b = parent->u35;
                Proc_Goto(proc, 5);
            }
            else if (parent->u34 == 1)
                Proc_Goto(proc, 4);
            break;
        case 2:
            if (!parent->u34) {
                proc->u3b = parent->u35;
                Proc_Goto(proc, 5);
            }
            else if (parent->u34 == 1)
                Proc_Goto(proc, 4);
            break;
    }
}

void sub_80CC628(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    if (parent->u31 == 0) {
        if (parent->u34 == 0) {
            proc->u3b = parent->u35;
            Proc_Goto(proc, 5);
        }
        if (parent->u34 == 1) {
            Proc_Goto(proc, 4);
        }
    }
}

void sub_80CC66C(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    switch (parent->u31) {
        case 0:
        case 1:
            break;
        case 2:
            BMapDispResume();
            SMS_UpdateFromGameData();
            SetupMapSpritesPalettes();
            SMS_FlushIndirect();
            Font_LoadForUI();
            break;
    }
}

void sub_80CC698(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    if (parent->u31 == 0) {
        sub_8002670();
        Sound_SetSEVolume(0x100);
        sub_8002620(0x34);
    }
    parent->u30 = 2;
    sub_80ADDD4(proc);
    Proc_End(proc);
}

