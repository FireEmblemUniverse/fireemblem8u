#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 callbackArgument asm("r0");
register volatile u32 callbackTarget asm("r3");
register volatile struct SoundMainMixerFrame *callbackFrame asm("sp");
// Both callbacks receive the private r0 value; the optional callback can mutate
// the saved SoundInfo pointer and the mandatory callback entry in sound memory.
void SoundMainCallbacksCandidate(void)
{
    callbackTarget = (u32)((volatile struct SoundInfo *)callbackArgument)->func;
    asm("" : "+r"(callbackTarget));
    if (callbackTarget) {
        callbackArgument = ((volatile struct SoundInfo *)callbackArgument)->intp;
        ((void (*)(void))callbackTarget)();
        callbackArgument = callbackFrame->soundInfo;
    }
    callbackTarget = (u32)((volatile struct SoundInfo *)callbackArgument)->CgbSound;
    ((void (*)(void))callbackTarget)();
}
