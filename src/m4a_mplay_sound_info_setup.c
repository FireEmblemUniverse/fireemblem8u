#include "global.h"
register volatile u32 infoArgument asm("r0");
register volatile u32 infoPlayer asm("r7");
register volatile u32 infoSaved asm("r8");
extern void MPlayMainFadeInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainSoundInfoSetup(void)
{
    infoArgument = 0x03007ff0;
    asm("" : "+r"(infoArgument));
    infoArgument = *(volatile u32 *)infoArgument;
    asm("" : "+r"(infoArgument));
    infoSaved = infoArgument;
    asm("" : "+r"(infoSaved));
    infoArgument = infoPlayer;
    MPlayMainFadeInvoke();
}
