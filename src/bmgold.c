#include "global.h"

u32 GetPartyGoldAmount() {
    s8 id = gPlaySt.chapterIndex;
    if (id == 5) {
        return 0;
    }
    else {
        return gPlaySt.partyGoldAmount;
    }
}

void SetPartyGoldAmount(s32 amt) {
    gPlaySt.partyGoldAmount = amt;
    if (amt > 999999) {
        gPlaySt.partyGoldAmount = 999999;
    }
}

// addToPartyGold
void sub_8024E20(u32 amt) {
    s32 new_amt = gPlaySt.partyGoldAmount + amt;
    gPlaySt.partyGoldAmount = new_amt;
    if (new_amt > 999999) {
        gPlaySt.partyGoldAmount = 999999;
    }
}

