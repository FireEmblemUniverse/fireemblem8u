#ifndef GBA_M4A_MIXER_FRAME_H
#define GBA_M4A_MIXER_FRAME_H
#include "global.h"

// Layout at SoundMainRAM_Buffer entry; the mixer owns the scratch slots.
struct SoundMainMixerFrame
{
    u32 samplesRemaining;
    u32 channelsRemaining;
    u32 pcmBuffer;
    u32 mixerScratchC;
    u32 mixerScratch10;
    u32 deadline;
    u32 soundInfo;
    u32 savedR8;
    u32 savedR9;
    u32 savedR10;
    u32 savedR11;
    u32 savedR4;
    u32 savedR5;
    u32 savedR6;
    u32 savedR7;
    u32 returnAddress;
};
typedef char SoundMainFrameSizeCheck[sizeof(struct SoundMainMixerFrame)==64 ? 1 : -1];
typedef char SoundMainFrameInfoCheck[__builtin_offsetof(struct SoundMainMixerFrame,soundInfo)==24 ? 1 : -1];
typedef char SoundMainFrameReturnCheck[__builtin_offsetof(struct SoundMainMixerFrame,returnAddress)==60 ? 1 : -1];
typedef char SoundMainFrameLoopSourceCheck[__builtin_offsetof(struct SoundMainMixerFrame,mixerScratchC)==12 ? 1 : -1];
typedef char SoundMainFrameLoopCountCheck[__builtin_offsetof(struct SoundMainMixerFrame,mixerScratch10)==16 ? 1 : -1];
#endif
