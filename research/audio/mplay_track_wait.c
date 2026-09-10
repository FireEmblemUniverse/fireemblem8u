#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 trackWait asm("r0");
register volatile struct MusicPlayerTrack *waitingTrack asm("r5");
extern void MPlayMainTrackDispatch(void);
extern void MPlayMainModulationStart(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayTrackWaitCandidate(void)
{
    trackWait = waitingTrack->wait;
    asm("" : "+r"(trackWait));
    if (trackWait == 0) {
        MPlayMainTrackDispatch();
        return;
    }
    trackWait -= 1;
    asm("" : "+r"(trackWait));
    waitingTrack->wait = trackWait;
    MPlayMainModulationStart();
}
