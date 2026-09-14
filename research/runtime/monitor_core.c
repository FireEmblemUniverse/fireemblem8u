/* Executable half of the monitor compiler bridge. The generated configuration
 * binds only the registers selected by the legacy allocator. The bridge uses
 * the four-instruction core, not this isolated compilation unit's return.
 * Original caller clobber handling belongs to the allocation half. */
#include "monitor_registers.h"
#ifdef MONITOR_R8_RESULT
__attribute__((matching_monitor_r8_core))
#endif
__attribute__((matching_thumb_copy_add_zero))
void core(void)
{
    v_r0 = MONITOR_REASON;
    v_r1 = MONITOR_ARGUMENT;
    asm volatile ("swi 171" : "+r" (v_r0), "+r" (v_r1));
    MONITOR_RESULT = v_r0;
}
