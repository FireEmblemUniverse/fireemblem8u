#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile struct SoundInfo *bufferInfo asm("r0");
register volatile u32 bufferPeriod asm("r1");
register volatile u32 bufferProduct asm("r2");
register volatile u32 bufferValue asm("r3");
register volatile u32 bufferCounter asm("r4");
register volatile u32 bufferAddress asm("r5");
register u32 bufferWidth asm("r6");
register volatile u32 bufferPrevious asm("r7");
register u32 bufferSamples asm("r8");
register volatile struct SoundMainMixerFrame *bufferFrame asm("sp");
extern char SoundMainRAM_BufferThumb[];
// Empty ties retain the private register values without compiler stack spills.
// Entered with the existing 64-byte mixer frame; tail-transfer into copied RAM.
__attribute__((matching_thumb_literal_constants, matching_tail_transfer, matching_thumb_subtract_branch, matching_thumb_add_order))
void SoundMainBufferEntry(void)
{
    bufferInfo = (volatile struct SoundInfo *)bufferFrame->soundInfo;
    asm("" : "+r"(bufferInfo));
    bufferValue = bufferInfo->pcmSamplesPerVBlank;
    asm("" : "+r"(bufferValue));
    bufferSamples = bufferValue;
    asm("" : "+r"(bufferSamples));
    bufferAddress = offsetof(struct SoundInfo, pcmBuffer);
    asm("" : "+r"(bufferAddress));
    bufferAddress += (u32)bufferInfo;
    asm("" : "+r"(bufferAddress));
    bufferCounter = bufferInfo->pcmDmaCounter;
    asm("" : "+r"(bufferCounter));
    bufferPrevious = bufferCounter - 1;
    asm("" : "+r"(bufferPrevious));
    if (bufferCounter > 1) {
        bufferPeriod = bufferInfo->pcmDmaPeriod;
        asm("" : "+r"(bufferPeriod));
        bufferPeriod -= bufferPrevious;
        asm("" : "+r"(bufferPeriod));
        bufferProduct = bufferSamples;
        asm("" : "+r"(bufferProduct));
        bufferProduct *= bufferPeriod;
        asm("" : "+r"(bufferProduct));
        bufferAddress += bufferProduct;
    }
    bufferFrame->pcmBuffer = bufferAddress;
    bufferWidth = PCM_DMA_BUF_SIZE;
    bufferValue = (u32)SoundMainRAM_BufferThumb;
    asm("" : "+r"(bufferValue));
    ((void (*)(void))bufferValue)();
}
