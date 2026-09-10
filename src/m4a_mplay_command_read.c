#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 commandByte asm("r1");
register volatile u8 *commandPointer asm("r2");
register volatile struct MusicPlayerTrack *commandTrack asm("r5");
extern void MPlayMainCommandDecode(void);
__attribute__((matching_tail_transfer))
void MPlayMainTrackDispatch(void)
{
    commandPointer = commandTrack->cmdPtr;
    asm("" : "+r"(commandPointer));
    commandByte = *commandPointer;
    asm("" : "+r"(commandByte));
    if (commandByte < 0x80) {
        commandByte = commandTrack->runningStatus;
    } else {
        commandPointer++;
        commandTrack->cmdPtr = (u8 *)commandPointer;
        if (commandByte >= 0xbd)
            commandTrack->runningStatus = commandByte;
    }
    MPlayMainCommandDecode();
}
