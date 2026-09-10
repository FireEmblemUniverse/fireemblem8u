#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 volumeMask asm("r0");
register volatile u32 volumeFlags asm("r3");
register volatile u32 channelType asm("r6");
register volatile struct SoundChannel *volumeChannel asm("r4");
register volatile struct MusicPlayerTrack *volumeTrack asm("r5");
extern void MPlayMainPostPitchGuard(void);
extern void MPlayMainPostVolumeInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayPostVolumeGuardCandidate(void)
{
    volumeMask = volumeChannel->type;
    asm("" : "+r"(volumeMask));
    channelType = 7;
    asm("" : "+r"(channelType));
    channelType &= volumeMask;
    asm("" : "+r"(channelType));
    volumeFlags = volumeTrack->flags;
    asm("" : "+r"(volumeFlags));
    volumeMask = 3;
    asm("" : "+r"(volumeMask));
    if (!(volumeMask & volumeFlags)) {
        MPlayMainPostPitchGuard();
        return;
    }
    MPlayMainPostVolumeInvoke();
}
