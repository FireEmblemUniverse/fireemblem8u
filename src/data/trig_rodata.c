#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/trig_rodata.s into .rodata.
 */

const u8 __attribute__((aligned(4))) gSinLookup[] = INCBIN_U8("graphics/misc/gSinLookup.4bpp");
