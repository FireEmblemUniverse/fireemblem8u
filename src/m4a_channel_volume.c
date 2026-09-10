#include "global.h"
#include "gba/m4a_internal.h"

// Internal audio ABI: channel in r4 and track in r5, both preserved.
register struct SoundChannel * audioChannel asm("r4");
register struct MusicPlayerTrack * audioTrack asm("r5");
void ChnVolSetAsm(void)
{
    register int velocity asm("r1") = audioChannel->ve;
    register int pan asm("r2");
    register int factor asm("r3");
    register int value asm("r0");
    asm("" : "+r"(velocity));
    value = 0x14;
    asm("" : "+r"(value));
    pan = *(s8 *) ((u8 *) audioChannel + value);
    asm("" : "+r"(pan));
    factor = 128;
    asm("" : "+r"(factor));
    factor += pan;
    asm("" : "+r"(factor));
    factor *= velocity;
    asm("" : "+r"(factor));
    value = audioTrack->volMR;
    asm("" : "+r"(value));
    value *= factor;
    asm("" : "+r"(value));
    value >>= 14;
    asm("" : "+r"(value));
    if ((unsigned) value > 255) value = 255;
    asm("" : "+r"(value));
    audioChannel->rightVolume = value;
    factor = 127;
    asm("" : "+r"(factor));
    factor -= pan;
    asm("" : "+r"(factor));
    factor *= velocity;
    asm("" : "+r"(factor));
    value = audioTrack->volML;
    asm("" : "+r"(value));
    value *= factor;
    asm("" : "+r"(value));
    value >>= 14;
    asm("" : "+r"(value));
    if ((unsigned) value > 255) value = 255;
    asm("" : "+r"(value));
    audioChannel->leftVolume = value;
}
