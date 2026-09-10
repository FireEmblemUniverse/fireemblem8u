#include "global.h"
#include "gba/m4a_internal.h"

// Research entry after Thumb dispatch, with the original private registers.
// Supported here: positive sample counts. The normal C return is a placeholder
// for the original transfer back into the Thumb mixer.
register volatile u32 reverbR0 asm("r0");
register volatile u32 reverbR1 asm("r1");
register u32 reverbStrength asm("r3");
register u32 reverbCount asm("r4");
register u8 *reverbOutput asm("r5");
register volatile u32 reverbWidth asm("r6");
register u8 * volatile reverbSource asm("r7");
register u32 reverbSamples asm("r8");

#ifdef REVERB_POSTINCREMENT
__attribute__((matching_byte_postincrement))
#endif
#ifdef REVERB_SUBTRACT_COMPARE
__attribute__((matching_subtract_compare))
#endif
void SoundMainReverbPrivate(void)
{
    if (reverbCount == 2)
        reverbSource = (u8 *)reverbR0 + offsetof(struct SoundInfo, pcmBuffer);
    else
        reverbSource = reverbOutput + reverbSamples;
    reverbCount = reverbSamples;
    do {
        asm("" : "+r"(reverbWidth), "+r"(reverbStrength));
        reverbR0 = *(volatile s8 *)(reverbOutput + reverbWidth);
        reverbR1 = *(volatile s8 *)reverbOutput;
        reverbR0 += reverbR1;
        reverbR1 = *(volatile s8 *)(reverbSource + reverbWidth);
        reverbR0 += reverbR1;
        reverbR1 = *(volatile s8 *)reverbSource;
        reverbSource++;
        reverbR0 += reverbR1;
        reverbR1 = reverbStrength * reverbR0;
        reverbR0 = (s32)reverbR1 >> 9;
        if (reverbR0 & 0x80)
            reverbR0++;
        *(volatile u8 *)(reverbOutput + reverbWidth) = reverbR0;
        *(volatile u8 *)reverbOutput++ = reverbR0;
#ifdef REVERB_SUBTRACT_COMPARE
        // SUBS/BGT compares the old signed counter with one, including overflow.
    } while ((s32)reverbCount-- > 1);
#else
        reverbCount--;
    } while ((s32)reverbCount > 0);
#endif
}
