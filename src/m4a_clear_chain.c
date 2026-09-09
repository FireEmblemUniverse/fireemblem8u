#include "global.h"
#include "gba/m4a_internal.h"

// SoundChannel and CgbChannel share the track/previous/next fields at
// offsets 0x2C/0x30/0x34. This translation unit disables strict aliasing.
void RealClearChain(void * channel)
{
    struct SoundChannel * ch = channel;
    register struct MusicPlayerTrack * track asm("r3") = ch->track;
    register struct SoundChannel * next asm("r1");
    register struct SoundChannel * prev asm("r2");

    asm("" : : "r"(track));
    if (!track)
        return;

    next = (struct SoundChannel *) ch->np;
    prev = (struct SoundChannel *) ch->pp;
    asm("" : : "r"(next), "r"(prev));

    if (prev)
        prev->np = (u32) next;
    else
        track->chan = next;

    if (next)
        next->pp = (u32) prev;

    // Keep the original r1 zero store; all instruction templates are empty.
    next = 0;
    asm("" : "+r"(next));
    ch->track = (struct MusicPlayerTrack *) next;
}
