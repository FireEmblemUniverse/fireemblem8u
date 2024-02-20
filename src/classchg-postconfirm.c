#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "bmbattle.h"
#include "bm.h"
#include "hardware.h"
#include "bmusemind.h"
#include "ap.h"
#include "soundwrapper.h"
#include "cgtext.h"
#include "sysutil.h"

CONST_DATA struct ProcCmd ProcScr_ClassChgReal[] = {
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(ClassChgExecPromotionReal),
    PROC_REPEAT(ClassChgPostConfirmWaitBanimEnd),
    PROC_SLEEP(0x8),
    PROC_CALL(sub_80CDE98),
    PROC_SLEEP(0x5),
    PROC_WHILE(MusicProc4Exists),
    PROC_END
};

void ClassChgExecPromotionReal(struct ProcClassChgPostConfirm *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *gparent = parent->proc_parent;

    struct Unit *unit = GetUnitFromCharId(parent->pid);

    if (unit == NULL) {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetGameLock();
    SetWinEnable(0, 0, 0);
    ExecUnitPromotion(unit, parent->jid, -1, 0);

    if (gparent->bmtype != PROMO_HANDLER_TYPE_PREP)
        gBattleStats.config = BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_PROMOTION;
    else
        gBattleStats.config = BATTLE_CONFIG_PROMOTION;

    BeginBattleAnimations();
}

void ClassChgPostConfirmWaitBanimEnd(struct ProcClassChgPostConfirm *proc)
{
    int game_lock = proc->game_lock;
    if (game_lock == GetGameLock())
        Proc_Break(proc);
}

void sub_80CDE98(struct ProcClassChgPostConfirm *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    GetUnitFromCharId(parent->pid);
}

void ExecClassChgReal(struct ProcPromoMain *proc)
{
    int slot;
    struct ProcPromoHandler *parent = proc->proc_parent;
    gUnknown_03005398 = -1;
    EndCgText();

    ResetDialogueScreen();
    APProc_DeleteAll();
    EndMuralBackground_();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    EndAllProcChildren(proc);

    Proc_StartBlocking(ProcScr_ClassChgReal, proc);

    if (parent->bmtype != PROMO_HANDLER_TYPE_TRANINEE) {
        slot = parent->item_slot;
        if (slot != -1)
            UnitUpdateUsedItem(parent->unit, slot);
    }
}
