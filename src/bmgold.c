#include "global.h"

u32 GetPartyGoldAmount() {
    s8 id = gUnknown_0202BCF0.chapterIndex;
    if (id == 5) {
        return 0;
    }
    else {
        return gUnknown_0202BCF0.partyGoldAmount;
    }
}

void SetPartyGoldAmount(s32 amt) {
    gUnknown_0202BCF0.partyGoldAmount = amt;
    if (amt > 999999) {
        gUnknown_0202BCF0.partyGoldAmount = 999999;
    }
}

// addToPartyGold
void sub_8024E20(u32 amt) {
    s32 new_amt = gUnknown_0202BCF0.partyGoldAmount + amt;
    gUnknown_0202BCF0.partyGoldAmount = new_amt;
    if (new_amt > 999999) {
        gUnknown_0202BCF0.partyGoldAmount = 999999;
    }
}

