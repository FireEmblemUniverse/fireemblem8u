#include "global.h"
#include "gba/m4a_internal.h"

// The existing audio bridge calls the callback supplied in r3.
extern void call_r3(unsigned channelType);
void TrackStop(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register struct MusicPlayerTrack * saved asm("r5") = track;
    register struct SoundChannel * channel asm("r4");
    register unsigned zero asm("r6");
    register unsigned flags asm("r1");
    register unsigned active asm("r0");
    asm("" : "+r"(saved));
    flags = saved->flags;
    asm("" : "+r"(flags));
    active = 0x80;
    asm("" : "+r"(active));
    if (!(active & flags)) return;
    channel = saved->chan;
    if (channel) {
        zero = 0;
        asm("" : "+r"(zero));
        do {
            register unsigned type asm("r0") = channel->status;
            asm("" : "+r"(type));
            if (type) {
                register unsigned mask asm("r3");
                type = channel->type;
                asm("" : "+r"(type));
                mask = 7;
                asm("" : "+r"(mask));
                type &= mask;
                if (type) {
                    register struct SoundInfo ** address asm("r3") = &SOUND_INFO_PTR;
                    register struct SoundInfo * info asm("r3");
                    register void (*callback)(u8) asm("r3");
                    asm("" : "+r"(address));
                    info = *address;
                    asm("" : "+r"(info));
                    callback = info->CgbOscOff;
                    asm("" : : "r"(callback));
                    call_r3(type);
                }
                channel->status = zero;
            }
            channel->track = (struct MusicPlayerTrack *) zero;
            channel = (struct SoundChannel *) channel->np;
        } while (channel);
    }
    saved->chan = channel;
}
