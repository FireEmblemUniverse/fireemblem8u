#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 deadlineValue asm("r0");
register volatile u32 deadlineScanline asm("r1");
register volatile u32 deadlineExit asm("r2");
register struct WaveData *deadlineWave asm("r3");
register volatile struct SoundChannel *deadlineChannel asm("r4");
register volatile struct SoundMainMixerFrame *deadlineFrame asm("sp");
// Research result in r2: 1 exits the mixer, 0 proceeds with this channel.
// Production transfers directly to those destinations instead of returning.
void SoundMainRAM_DeadlineCandidate(void)
{
    deadlineFrame->channelsRemaining = deadlineValue;
    deadlineWave = deadlineChannel->wav;
    deadlineValue = deadlineFrame->deadline;
    if (deadlineValue) {
        deadlineScanline = *(volatile u8 *)0x04000006;
        if (deadlineScanline < 160)
            deadlineScanline += 228;
        asm("" : "+r"(deadlineValue));
        if (deadlineScanline >= deadlineValue)
            { deadlineExit = 1; return; }
    }
    deadlineExit = 0;
}
