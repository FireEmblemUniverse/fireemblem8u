#include "global.h"
#include "gba/m4a_internal.h"
register u32 *tableOutput asm("r0");
register volatile int tableCount asm("r1");
register const u32 * volatile tableSource asm("r2");
register volatile u32 tableWord asm("r3");
extern const u32 gMPlayJumpTableTemplate[];
extern void chk_adr_r2(void);
#ifdef TABLE_PRIVATE_RETURN
__attribute__((matching_ip_return))
#endif
void MPlayJumpTableCopy(void **destination)
{
    tableCount = 36;
    tableSource = gMPlayJumpTableTemplate;
    do
    {
        tableWord = *tableSource;
        chk_adr_r2();
        *tableOutput++ = tableWord;
        tableSource++;
        tableCount--;
    } while (tableCount > 0);
}
