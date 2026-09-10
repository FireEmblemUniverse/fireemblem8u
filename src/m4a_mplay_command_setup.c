#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 commandIndex asm("r0");
register volatile u32 commandInput asm("r1");
register volatile u32 commandTarget asm("r3");
register volatile u32 commandTrack asm("r5");
register volatile u32 commandPlayer asm("r7");
register volatile u32 commandInfo asm("r8");
extern void MPlayMainCommandInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainCommandSetup(void)
{
    commandIndex = commandInput;
    asm("" : "+r"(commandIndex));
    commandIndex -= 0xb1;
    asm("" : "+r"(commandIndex));
    *(volatile u8 *)(commandPlayer + offsetof(struct MusicPlayerInfo, cmd)) = commandIndex;
    commandTarget = commandInfo;
    asm("" : "+r"(commandTarget));
    commandTarget = ((volatile struct SoundInfo *)commandTarget)->MPlayJumpTable;
    asm("" : "+r"(commandTarget));
    commandIndex <<= 2;
    asm("" : "+r"(commandIndex));
    commandTarget = *(volatile u32 *)(commandTarget + commandIndex);
    asm("" : "+r"(commandTarget));
    commandIndex = commandPlayer;
    asm("" : "+r"(commandIndex));
    commandInput = commandTrack;
    MPlayMainCommandInvoke();
}
