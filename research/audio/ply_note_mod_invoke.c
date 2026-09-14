#include "global.h"
register volatile u32 callInput0 asm("r0");
register volatile u32 callInput1 asm("r1");
register volatile u32 callInput2 asm("r2");
register volatile u32 callInput3 asm("r3");
extern void clear_modM(void);
extern void PlyNoteTrackVolumeSetup(void);
__attribute__((matching_thumb_callback_tail))
void PlyNoteModInvokeCandidate(void)
{
    clear_modM();
    PlyNoteTrackVolumeSetup();
}
