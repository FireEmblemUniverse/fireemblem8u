#include "global.h"
#include "gba/m4a_internal.h"
extern const u8 gClockTable[];
register volatile u32 waitValue asm("r0");
register volatile u32 waitCommand asm("r1");
register volatile struct MusicPlayerTrack *waitTrack asm("r5");
extern void MPlayMainTrackWait(void);
__attribute__((matching_tail_transfer))
void MPlayMainWaitCommand(void)
{
    waitValue = (u32)gClockTable;
    asm("" : "+r"(waitValue));
    waitCommand -= 0x80;
    asm("" : "+r"(waitCommand));
    waitCommand += waitValue;
    asm("" : "+r"(waitCommand));
    waitValue = *(volatile u8 *)waitCommand;
    asm("" : "+r"(waitValue));
    waitTrack->wait = waitValue;
    MPlayMainTrackWait();
}
