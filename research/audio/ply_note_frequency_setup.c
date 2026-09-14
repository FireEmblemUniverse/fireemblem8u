#include "global.h"
register volatile u32 freqR0 asm("r0");
register volatile u32 freqR1 asm("r1");
register volatile u32 freqR2 asm("r2");
register volatile s32 freqR3 asm("r3");
register volatile u32 freqR4 asm("r4");
register volatile u32 freqR5 asm("r5");
register volatile u32 freqR6 asm("r6");
register volatile u32 freqR9 asm("r9");
register volatile u32 freqSP asm("sp");
extern void PlyNotePcmFrequencySetup(void);
extern void PlyNoteCgbFrequencyInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_add_sign_branch, matching_thumb_direct_tails, matching_thumb_copy_add_zero))
void PlyNoteFrequencySetupCandidate(void)
{
    freqR1 = *(volatile u8 *)(freqR4 + 8);
    asm("" : "+r"(freqR1));
    freqR0 = 8;
    asm("" : "+r"(freqR0));
    freqR0 = *(volatile s8 *)(freqR5 + freqR0);
    asm("" : "+r"(freqR0));
    freqR3 = freqR1 + freqR0;
    if (freqR3 < 0) freqR3 = 0;
    freqR6 = *(volatile u32 *)(freqSP + 12);
    asm("" : "+r"(freqR6));
    if (!freqR6) { PlyNotePcmFrequencySetup(); return; }
    freqR6 = freqR9;
    asm("" : "+r"(freqR6));
    freqR0 = *(volatile u8 *)(freqR6 + 2);
    asm("" : "+r"(freqR0));
    *(volatile u8 *)(freqR4 + 30) = freqR0;
    freqR1 = *(volatile u8 *)(freqR6 + 3);
    asm("" : "+r"(freqR1));
    freqR0 = 128;
    asm("" : "+r"(freqR0));
    if (freqR1 & freqR0) goto reset;
    freqR0 = 112;
    asm("" : "+r"(freqR0));
    if (freqR1 & freqR0) goto store;
reset:
    freqR1 = 8;
store:
    *(volatile u8 *)(freqR4 + 31) = freqR1;
    freqR2 = *(volatile u8 *)(freqR5 + 9);
    asm("" : "+r"(freqR2));
    freqR1 = freqR3;
    asm("" : "+r"(freqR1));
    freqR0 = *(volatile u32 *)(freqSP + 12);
    asm("" : "+r"(freqR0));
    freqR3 = *(volatile u32 *)(freqSP + 4);
    asm("" : "+r"(freqR3));
    freqR3 = *(volatile u32 *)((u32)freqR3 + 48);
    PlyNoteCgbFrequencyInvoke();
}
