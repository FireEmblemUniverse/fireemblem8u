#include "global.h"
register volatile u32 cgbR0 asm("r0");
register volatile u32 cgbR1 asm("r1");
register volatile u32 cgbR4 asm("r4");
register volatile u32 cgbR5 asm("r5");
register volatile u32 cgbR6 asm("r6");
register volatile u32 cgbSP asm("sp");
extern void PlyNoteChannelAttach(void);
extern void PlyNoteExit(void);
__attribute__((matching_tail_transfer, matching_thumb_shared_tails))
void PlyNoteCgbSelectCandidate(void)
{
    cgbR0 = *(volatile u32 *)(cgbSP + 4);
    asm("" : "+r"(cgbR0));
    cgbR4 = *(volatile u32 *)(cgbR0 + 28);
    asm("" : "+r"(cgbR4));
    if (!cgbR4) { PlyNoteExit(); return; }
    cgbR6--;
    asm("" : "+r"(cgbR6));
    cgbR0 = cgbR6 << 6;
    asm("" : "+r"(cgbR0));
    cgbR4 += cgbR0;
    asm("" : "+r"(cgbR4));
    cgbR1 = *(volatile u8 *)cgbR4;
    asm("" : "+r"(cgbR1));
    cgbR0 = 0xc7;
    asm("" : "+r"(cgbR0));
    if (!(cgbR0 & cgbR1)) goto accept;
    cgbR0 = 0x40;
    asm("" : "+r"(cgbR0));
    if (cgbR0 & cgbR1) goto accept;
    cgbR1 = *(volatile u8 *)(cgbR4 + 19);
    asm("" : "+r"(cgbR1));
    cgbR0 = *(volatile u32 *)(cgbSP + 16);
    asm("" : "+r"(cgbR0));
    if (cgbR1 < cgbR0) goto accept;
    if (cgbR1 != cgbR0) { PlyNoteExit(); return; }
    cgbR0 = *(volatile u32 *)(cgbR4 + 44);
    asm("" : "+r"(cgbR0));
    if (cgbR0 >= cgbR5) goto accept;
    PlyNoteExit();
    return;
accept:
    PlyNoteChannelAttach();
}
