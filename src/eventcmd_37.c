#include "global.h"
#include "variables.h"
#include "functions.h"

#include "event.h"
#include "proc.h"
#include "bmunit.h"
#include "popup.h"

// TODO: Give this a more human name (EventCmd_GiveItem?)
int Event37_GiveItem(struct EventEngineProc *proc) {
    u8 currentEventLoBits;
    struct Unit *target;
    u8 currentEventLoBits_;
    s32 gold;

    currentEventLoBits = 0xF & *proc->pEventCurrent;
    currentEventLoBits_ = currentEventLoBits;

    target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target) {
        return 6;
    }

    switch (currentEventLoBits) {
        case 0:
            NewPopup_ItemGot(proc, target, gEventSlots[3]);
            break;
        case 1:
            NewPopup_GoldGot(proc, target, gEventSlots[3]);
            break;
        case 2:
            if (currentEventLoBits_ == 2) {
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
