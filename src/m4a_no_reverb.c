#include "global.h"
register volatile u32 clearZero asm("r0");
register volatile u32 clearWords asm("r1");
register u32 clearRight asm("r5");
register u32 clearLeft asm("r6");
register u32 clearSamples asm("r8");
#define CLEAR_PAIR() do { \
    *(volatile u32 *)clearRight = clearZero; clearRight += 4; asm("" : "+r"(clearRight)); \
    *(volatile u32 *)clearLeft = clearZero; clearLeft += 4; asm("" : "+r"(clearLeft)); \
} while (0)
__attribute__((matching_thumb_word_postincrement, matching_shift_carry, matching_shift_loop_fallthrough))
void SoundMainRAM_NoReverb(void)
{
    u32 discarded;
    clearZero = 0;
    clearWords = clearSamples;
    asm("" : "+r"(clearWords));
    clearLeft += clearRight;
    discarded = clearWords << 29;
    clearWords >>= 3;
    asm("" : "+r"(clearWords));
    if (__builtin_expect((s32)discarded < 0, 1)) {
        CLEAR_PAIR();
    }
    discarded = clearWords << 31;
    clearWords >>= 1;
    asm("" : "+r"(clearWords));
    if (__builtin_expect((s32)discarded < 0, 1)) {
        CLEAR_PAIR();
        CLEAR_PAIR();
    }
    do {
        CLEAR_PAIR();
        CLEAR_PAIR();
        CLEAR_PAIR();
        CLEAR_PAIR();
        clearWords -= 1;
    } while ((s32)clearWords > 0);
}
