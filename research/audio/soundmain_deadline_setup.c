#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile struct SoundInfo *setupInfo asm("r0");
register volatile u32 setupDeadline asm("r1");
register volatile u32 setupScanline asm("r2");
register volatile struct SoundMainMixerFrame *setupFrame asm("sp");
// Private SoundMain frame is already allocated before this entry.
void SoundMainDeadlineSetupCandidate(void)
{
    setupDeadline = setupInfo->maxLines;
    asm("" : "+r"(setupDeadline));
    if (setupDeadline) {
        setupScanline = 0x04000006;
        asm("" : "+r"(setupScanline));
        setupScanline = *(volatile u8 *)setupScanline;
        asm("" : "+r"(setupScanline));
        if (setupScanline < 160)
            setupScanline += 228;
        setupDeadline += setupScanline;
    }
    setupFrame->deadline = setupDeadline;
}
