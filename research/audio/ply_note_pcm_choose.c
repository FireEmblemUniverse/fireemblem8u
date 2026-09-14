#include "global.h"
register volatile u32 pcmR0 asm("r0");
register volatile u32 pcmR1 asm("r1");
register volatile u32 pcmR2 asm("r2");
register volatile u32 pcmR4 asm("r4");
register volatile u32 pcmR6 asm("r6");
register volatile u32 pcmR7 asm("r7");
register volatile u32 pcmR8 asm("r8");
extern void PlyNoteChannelAttach(void);
extern void PlyNotePcmAdvance(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails, matching_thumb_block_layout))
void PlyNotePcmChooseCandidate(void)
{
    pcmR1 = *(volatile u8 *)pcmR4;
    asm("" : "+r"(pcmR1));
    pcmR0 = 0xc7;
    asm("" : "+r"(pcmR0));
    if (!(pcmR0 & pcmR1)) { PlyNoteChannelAttach(); return; }
    pcmR0 = 0x40;
    asm("" : "+r"(pcmR0));
    if (!(pcmR0 & pcmR1)) goto active;
    if (pcmR2) goto compare;
    pcmR2++;
    asm("" : "+r"(pcmR2));
    pcmR6 = *(volatile u8 *)(pcmR4 + 19);
    asm("" : "+r"(pcmR6));
    pcmR7 = *(volatile u32 *)(pcmR4 + 44);
    goto select;
active:
    if (pcmR2) goto next;
compare:
    pcmR0 = *(volatile u8 *)(pcmR4 + 19);
    asm("" : "+r"(pcmR0));
    if (pcmR0 >= pcmR6) goto tie;
    pcmR6 = pcmR0;
    asm("" : "+r"(pcmR6));
    pcmR7 = *(volatile u32 *)(pcmR4 + 44);
    goto select;
tie:
    if (pcmR0 > pcmR6) goto next;
    pcmR0 = *(volatile u32 *)(pcmR4 + 44);
    asm("" : "+r"(pcmR0));
    if (pcmR0 <= pcmR7) goto owner_tie;
    pcmR7 = pcmR0;
    goto select;
owner_tie:
    if (pcmR0 < pcmR7) goto next;
select:
    pcmR8 = pcmR4;
next:
    PlyNotePcmAdvance();
}
