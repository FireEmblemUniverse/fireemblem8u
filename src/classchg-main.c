#include "classchg.h"

#include "bm.h"
#include "bmio.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "sysutil.h"

int PromoMain_SetupTraineeEvent_(struct ProcPromoMain *proc);
bool PromoTraineeEventExists(struct ProcPromoMain *proc);
bool StartAndWaitPromoSelect(ProcPtr proc);
bool sub_80CD330(struct ProcPromoMain *proc);

CONST_DATA struct ProcCmd ProcScr_PromoMain[] = {
	PROC_NAME("ccramify"),

PROC_LABEL(PROMOMAIN_LABEL_START),
    PROC_CALL(PromoMain_InitScreen),
    PROC_SLEEP(3),

PROC_LABEL(PROMOMAIN_LABEL_1),
    PROC_CALL(PromoMain_HandleType),

PROC_LABEL(PROMOMAIN_LABEL_TRAINEE),
    PROC_WHILE(PromoMain_SetupTraineeEvent_),
    PROC_WHILE(PromoTraineeEventExists),
    PROC_CALL(PromoHandleTraineePostType),

PROC_LABEL(PROMOMAIN_LABEL_SEL_EN),
    PROC_WHILE(StartAndWaitPromoSelect),
    PROC_SLEEP(5),
    PROC_REPEAT(sub_80CD330),

PROC_LABEL(PROMOMAIN_LABEL_POST_SEL),
    PROC_CALL(ExecClassChgReal),
    PROC_SLEEP(2),

PROC_LABEL(6),
    PROC_CALL(PromoMain_HandlePrepEndEffect),

PROC_LABEL(7),
PROC_LABEL(8),
    PROC_CALL(PromoMain_OnEnd),
    PROC_END,
};

struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(struct ProcPromoHandler *proc, u8 pid, u8 terrain)
{
    struct ProcPromoMain *child;

    /* set callback stat */
    proc->stat = PROMO_HANDLER_STAT_INIT;

    child = Make6C_PromotionMain(proc);
    proc->promo_main = child;
    child->pid = pid;
    child->terrain = terrain;
}

struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_PromoMain, proc);
}

void PromoMain_InitScreen(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent;
    proc->stat = PROMO_HANDLER_STAT_INIT;
    proc->priv = 0;
    proc->sel_en = 0;
    parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        ResetFaces();
        ResetText();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
    if (parent->bmtype == PROMO_HANDLER_TYPE_BM) {
        struct ProcPromoHandler *gparent = parent->proc_parent;

        SetupBackgrounds(0);
        EndGreenText();
        gparent->game_lock = GetGameLock();
        EndHelpPromptSprite();
        EndSysBrownBox();
        EndAllParallelWorkers();
        EndFaceById(0);
        sub_80ACA84(0);
        ResetFaces();
        ResetText();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
        BG_EnableSyncByMask(2);
    }
    if (parent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
}

void PromoMain_HandleType(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    switch (parent->bmtype) {
        case PROMO_HANDLER_TYPE_TRANINEE:
            Proc_Goto(proc, PROMOMAIN_LABEL_TRAINEE);
            break;

        case PROMO_HANDLER_TYPE_BM:

            /* If not select, direcly promote unit */
            if (parent->sel_en == false) {
                proc->jid = parent->jid;
                Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
            }
            /* other prepare for branch selection */
            else if (parent->sel_en == true)
                Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
            break;

        case PROMO_HANDLER_TYPE_PREP:
            if (parent->sel_en == false) {
                proc->jid = parent->jid;
                Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
            }
            else if (parent->sel_en == true)
                Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
            break;
    }
}

void PromoHandleTraineePostType(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        if (parent->sel_en == false) {
            proc->jid = parent->jid;
            Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
        }
        if (parent->sel_en == true) {
            Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
        }
    }
}

void PromoMain_HandlePrepEndEffect(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    switch (parent->bmtype) {
        case PROMO_HANDLER_TYPE_TRANINEE:
        case PROMO_HANDLER_TYPE_BM:
            break;

        case PROMO_HANDLER_TYPE_PREP:
            BMapDispResume();
            RefreshUnitSprites();
            ApplyUnitSpritePalettes();
            ForceSyncUnitSpriteSheet();
            InitSystemTextFont();
            break;
    }
}

void PromoMain_OnEnd(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        RestoreBgm();
        Sound_SetSEVolume(0x100);
        OverrideBgm(0x34);
    }
    parent->stat = 2;
    EndAllProcChildren(proc);
    Proc_End(proc);
}
