#include "global.h"
#include "gba/m4a_internal.h"

// Empty constraints preserve the audio driver's original register allocation.
void ply_fine(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register struct MusicPlayerTrack * saved asm("r5") = track;
    struct SoundChannel * channel;
    asm("" : "+r"(saved));
    channel = saved->chan;
    while (channel)
    {
        register unsigned status asm("r1") = channel->status;
        register unsigned mask asm("r0") = 0xC7;
        asm("" : "+r"(status), "+r"(mask));
        if (mask & status)
        {
            mask = 0x40;
            asm("" : "+r"(mask));
            status |= mask;
            asm("" : "+r"(status));
            channel->status = status;
        }
        RealClearChain(channel);
        channel = (struct SoundChannel *) channel->np;
    }
    {
        register unsigned zero asm("r0") = 0;
        asm("" : "+r"(zero));
        saved->flags = zero;
    }
}
