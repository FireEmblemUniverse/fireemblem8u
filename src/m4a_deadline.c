#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 deadlineValue asm("r0");
register volatile u32 deadlineScanline asm("r1");
register struct WaveData *deadlineWave asm("r3");
register volatile struct SoundChannel *deadlineChannel asm("r4");
register volatile struct SoundMainMixerFrame *deadlineFrame asm("sp");
extern void SoundMainRAM_DeadlineContinue(void);
extern void SoundMainRAM_DeadlineExit(void);
__attribute__((matching_tail_transfer))
void SoundMainRAM_ChanLoop(void)
{
    deadlineFrame->channelsRemaining = deadlineValue;
    deadlineWave = deadlineChannel->wav;
    deadlineValue = deadlineFrame->deadline;
    if (deadlineValue) {
        deadlineScanline = 0x04000006;
        asm("" : "+r"(deadlineScanline));
        deadlineScanline = *(volatile u8 *)deadlineScanline;
        if (deadlineScanline < 160)
            deadlineScanline += 228;
        asm("" : "+r"(deadlineValue));
        if (deadlineScanline >= deadlineValue)
            { SoundMainRAM_DeadlineExit(); return; }
    }
    SoundMainRAM_DeadlineContinue();
}
