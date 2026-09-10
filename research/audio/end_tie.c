#include "global.h"
#include "gba/m4a_internal.h"

// Consume an optional key byte and release the first live matching tied channel.
#ifdef MATCH_LEAF_FRAME
__attribute__((matching_leaf_frame))
#endif
void ply_endtie(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register u8 * command asm("r2") = track->cmdPtr;
    register unsigned key asm("r3");
    register struct SoundChannel * channel asm("r1");
    register unsigned live asm("r4");
    register unsigned released asm("r5");
    asm("" : "+r"(command));
    key = *command;
    asm("" : "+r"(key));
    if (key < 0x80) {
        track->key = key;
        ++command;
        asm("" : "+r"(command));
        track->cmdPtr = command;
    } else {
        key = track->key;
        asm("" : "+r"(key));
    }
    channel = track->chan;
    asm("" : "+r"(channel));
    if (!channel) return;
    live = 0x83;
    released = 0x40;
    asm("" : "+r"(live), "+r"(released));
    do {
        register unsigned status asm("r2") = channel->status;
        asm("" : "+r"(status));
        if ((live & status) && !(released & status)) {
            register unsigned match asm("r0") = channel->mk;
            asm("" : "+r"(match));
            if (match == key) {
                match = 0x40;
                asm("" : "+r"(match));
                status |= match;
                asm("" : "+r"(status));
                channel->status = status;
                break;
            }
        }
        channel = (struct SoundChannel *) channel->np;
        asm("" : "+r"(channel));
    } while (channel);
}
