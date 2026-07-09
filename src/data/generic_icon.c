#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/generic_icon.s into .data.
 */

u8 CONST_DATA gGenericIcon_0[] = INCBIN_U8("graphics/generic_icon/0.4bpp");
u8 CONST_DATA gGenericIcon_1[] = INCBIN_U8("graphics/generic_icon/1.4bpp");
u8 CONST_DATA gGenericIcon_2[] = INCBIN_U8("graphics/generic_icon/2.4bpp");
u8 CONST_DATA gGenericIcon_3[] = INCBIN_U8("graphics/generic_icon/3.4bpp");
u16 CONST_DATA gGenericIcon_4[] = INCBIN_U16("graphics/generic_icon/0.gbapal");
u16 CONST_DATA gGenericIcon_5[] = INCBIN_U16("graphics/generic_icon/1.gbapal");
u16 CONST_DATA gGenericIcon_6[] = INCBIN_U16("graphics/generic_icon/2.gbapal", "graphics/generic_icon/3.gbapal");
