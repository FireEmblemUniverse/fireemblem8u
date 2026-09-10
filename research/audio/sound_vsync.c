#include "global.h"
#include "gba/m4a_internal.h"

struct AudioDma {
    vu32 source;
    vu32 destination;
    union { vu32 control; struct { vu16 count, flags; } half; } cnt;
};
void m4aSoundVSync(void)
{
    register struct SoundInfo ** address asm("r0") = &SOUND_INFO_PTR;
    register struct SoundInfo * info asm("r0");
    register unsigned id asm("r2");
    register unsigned state asm("r3");
    register int counter asm("r1");
    asm("" : "+r"(address));
    info = *address;
    asm("" : "+r"(info));
    id = ID_NUMBER;
    asm("" : "+r"(id));
    state = info->ident;
    asm("" : "+r"(state));
    state -= id;
    asm("" : "+r"(state));
    if (state > 1) return;
    counter = info->pcmDmaCounter;
    asm("" : "+r"(counter));
    --counter;
    info->pcmDmaCounter = counter;
    if (counter > 0) return;
    counter = info->pcmDmaPeriod;
    asm("" : "+r"(counter));
    info->pcmDmaCounter = counter;
    {
        register struct AudioDma * dma asm("r2") = (struct AudioDma *) REG_ADDR_DMA1SAD;
        register unsigned control asm("r1");
        asm("" : "+r"(dma));
        control = dma[0].cnt.control;
        asm("" : "+r"(control));
        if (control & (DMA_REPEAT << 16)) {
            control = ((DMA_ENABLE | DMA_32BIT | DMA_DEST_FIXED) << 16) | 4;
            asm("" : "+r"(control));
            dma[0].cnt.control = control;
        }
        control = dma[1].cnt.control;
        asm("" : "+r"(control));
        if (control & (DMA_REPEAT << 16)) {
            control = ((DMA_ENABLE | DMA_32BIT | DMA_DEST_FIXED) << 16) | 4;
            asm("" : "+r"(control));
            dma[1].cnt.control = control;
        }
        control = DMA_32BIT >> 8;
        asm("" : "+r"(control));
        control <<= 8;
        asm("" : "+r"(control));
        dma[0].cnt.half.flags = control;
        asm("" : "+r"(control));
        dma[1].cnt.half.flags = control;
        control = (DMA_ENABLE | DMA_START_SPECIAL | DMA_32BIT | DMA_REPEAT) >> 8;
        asm("" : "+r"(control));
        control <<= 8;
        asm("" : "+r"(control));
        dma[0].cnt.half.flags = control;
        asm("" : "+r"(control));
        dma[1].cnt.half.flags = control;
    }
}
