#include "global.h"

u32 GetPartyGoldAmount() {
    s8 id = gRAMChapterData.chapterIndex;
    if (id == 5) {
        return 0;
    }
    else {
        return gRAMChapterData.partyGoldAmount;
    }
}

void SetPartyGoldAmount(s32 amt) {
    gRAMChapterData.partyGoldAmount = amt;
    if (amt > 999999) {
        gRAMChapterData.partyGoldAmount = 999999;
    }
}

// addToPartyGold
void sub_8024E20(u32 amt) {
    s32 new_amt = gRAMChapterData.partyGoldAmount + amt;
    gRAMChapterData.partyGoldAmount = new_amt;
    if (new_amt > 999999) {
        gRAMChapterData.partyGoldAmount = 999999;
    }
}

