#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 noteArgument asm("r0");
register volatile u32 noteCommand asm("r1");
register volatile u32 noteTrackArgument asm("r2");
register volatile u32 noteTarget asm("r3");
register volatile u32 noteTrack asm("r5");
register volatile u32 notePlayer asm("r7");
register volatile u32 noteSoundInfo asm("r8");
extern void MPlayMainNoteInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainNoteSetup(void)
{
    noteArgument = noteSoundInfo;
    asm("" : "+r"(noteArgument));
    noteTarget = ((volatile struct SoundInfo *)noteArgument)->plynote;
    asm("" : "+r"(noteTarget));
    noteArgument = noteCommand;
    asm("" : "+r"(noteArgument));
    noteArgument -= 0xcf;
    asm("" : "+r"(noteArgument));
    noteCommand = notePlayer;
    asm("" : "+r"(noteCommand));
    noteTrackArgument = noteTrack;
    MPlayMainNoteInvoke();
}
