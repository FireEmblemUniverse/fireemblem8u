#include "global.h"
#include "gba/m4a_internal.h"
/* Research probe for tone selection; matching has not been established. */
register volatile u32 toneR0 asm("r0");
register volatile u32 toneR1 asm("r1");
register volatile u32 toneR2 asm("r2");
register volatile u32 toneR3 asm("r3");
register volatile u32 toneR4 asm("r4");
register volatile u32 toneR5 asm("r5");
register volatile u32 toneR6 asm("r6");
register volatile u32 toneR7 asm("r7");
register volatile u32 toneR8 asm("r8");
register volatile u32 toneR9 asm("r9");
register volatile u32 toneR10 asm("r10");
register volatile u32 toneR11 asm("r11");
register volatile u32 toneSP asm("sp");
#define TIE(x) asm("" : "+r"(x))
extern void PlyNotePriority(void);
extern void PlyNoteExit(void);
__attribute__((matching_tail_transfer, matching_thumb_block_layout))
void PlyNoteToneCandidate(void)
{
    toneR0 = 0; TIE(toneR0);
    *(volatile u32 *)(toneSP + 20) = toneR0;
    toneR4 = toneR5; TIE(toneR4);
    toneR4 += 36; TIE(toneR4);
    toneR2 = *(volatile u8 *)toneR4; TIE(toneR2);
    toneR0 = 0xc0; TIE(toneR0);
    if (!(toneR0 & toneR2)) goto plain;
    toneR3 = *(volatile u8 *)(toneR5 + 5); TIE(toneR3);
    toneR0 = 0x40; TIE(toneR0);
    if (!(toneR0 & toneR2)) goto unsplit;
    toneR1 = *(volatile u32 *)(toneR5 + 44); TIE(toneR1);
    toneR1 += toneR3; TIE(toneR1);
    toneR0 = *(volatile u8 *)toneR1; TIE(toneR0);
    goto select;
unsplit:
    toneR0 = toneR3; TIE(toneR0);
select:
    toneR1 = toneR0 << 1; TIE(toneR1);
    toneR1 += toneR0; TIE(toneR1);
    toneR1 <<= 2; TIE(toneR1);
    toneR0 = *(volatile u32 *)(toneR5 + 40); TIE(toneR0);
    toneR1 += toneR0; TIE(toneR1);
    toneR9 = toneR1; TIE(toneR9);
    toneR6 = toneR9; TIE(toneR6);
    toneR1 = *(volatile u8 *)toneR6; TIE(toneR1);
    toneR0 = 0xc0; TIE(toneR0);
    if (toneR0 & toneR1) { PlyNoteExit(); return; }
    toneR0 = 0x80; TIE(toneR0);
    if (!(toneR0 & toneR2)) goto done;
    toneR1 = *(volatile u8 *)(toneR6 + 3); TIE(toneR1);
    toneR0 = 0x80; TIE(toneR0);
    if (!(toneR0 & toneR1)) goto rhythm_key;
    toneR1 -= 0xc0; TIE(toneR1);
    toneR1 <<= 1; TIE(toneR1);
    *(volatile u32 *)(toneSP + 20) = toneR1;
rhythm_key:
    toneR3 = *(volatile u8 *)(toneR6 + 1); TIE(toneR3);
    goto done;
plain:
    toneR9 = toneR4; TIE(toneR9);
    toneR3 = *(volatile u8 *)(toneR5 + 5); TIE(toneR3);
done:
    PlyNotePriority();
}
