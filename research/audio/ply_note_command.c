#include "global.h"
#include "gba/m4a_internal.h"
/* Private continuation and explicit unsigned-bound flags preserve the original entry. */
register volatile u32 noteByte asm("r0");
register volatile u32 noteGate asm("r1");
register volatile u8 *noteCommand asm("r3");
register volatile struct MusicPlayerTrack *noteTrack asm("r5");
extern void PlyNoteToneSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_unsigned_bounds))
void PlyNoteCommandCandidate(void)
{
    noteCommand = noteTrack->cmdPtr;
    asm("" : "+r"(noteCommand));
    noteByte = *noteCommand;
    asm("" : "+r"(noteByte));
    if (noteByte >= 0x80)
        goto done;
    noteTrack->key = noteByte;
    noteCommand++;
    asm("" : "+r"(noteCommand));
    noteByte = *noteCommand;
    asm("" : "+r"(noteByte));
    if (noteByte >= 0x80)
        goto save;
    noteTrack->velocity = noteByte;
    noteCommand++;
    asm("" : "+r"(noteCommand));
    noteByte = *noteCommand;
    asm("" : "+r"(noteByte));
    if (noteByte >= 0x80)
        goto save;
    noteGate = noteTrack->gateTime;
    noteGate += noteByte;
    noteTrack->gateTime = noteGate;
    noteCommand++;
save:
    noteTrack->cmdPtr = (u8 *)noteCommand;
done:
    PlyNoteToneSetup();
}
