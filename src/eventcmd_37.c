#include "global.h"
#include "variables.h"
#include "functions.h"

#include "event.h"
#include "proc.h"
#include "bmunit.h"
#include "popup.h"

// TODO: Give this a more human name (EventCmd_GiveItem?)
int Event37_GiveItem(struct EventEngineProc *proc) {
    u8 subcmd, subcmd_;
    struct Unit *target;
    s32 gold;

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    subcmd_ = subcmd;

    target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target) {
        return 6;
    }

    switch (subcmd) {
        case 0:
            NewPopup_ItemGot(proc, target, gEventSlots[3]);
            break;
        case 1:
            NewPopup_GoldGot(proc, target, gEventSlots[3]);
            break;
        case 2:
            if (subcmd_ == 2) {
                gold = GetPartyGoldAmount() - gEventSlots[3];
                if (gold < 0) {
                    gold = 0;
                }
                SetPartyGoldAmount(gold);
           }
           break;
    }

    return 2;
}
