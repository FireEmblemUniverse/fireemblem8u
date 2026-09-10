#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 exitIdentifier asm("r0");
register volatile struct MusicPlayerInfo *exitPlayer asm("r7");
extern void MPlayMainExitRestore(void);
__attribute__((matching_tail_transfer))
void MPlayMainExit(void)
{
    exitIdentifier = 0x68736d53;
    asm("" : "+r"(exitIdentifier));
    exitPlayer->ident = exitIdentifier;
    MPlayMainExitRestore();
}
