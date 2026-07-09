#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/const_data_banimekrdk.s into .rodata.
 */

const u8 gConstDataBanimekrdk_0[] = INCBIN_U8("graphics/banim/misc/gUnknown_080DFA2C.4bpp.lz");
const u16 gConstDataBanimekrdk_1[] = INCBIN_U16("graphics/banim/misc/gUnknown_080E041C.gbapal");
const u8 gConstDataBanimekrdk_2[] = INCBIN_U8("graphics/banim/misc/gUnknown_080E043C.4bpp.lz");
const u8 gConstDataBanimekrdk_3[] = INCBIN_U8("graphics/banim/misc/gUnknown_080E05F8.4bpp.lz");
const u8 Pal_ConstDataBanimekrdk_0[] = INCBIN_U8("graphics/banim/misc/Pal_080E1164.agbpal");
/* Was a hidden LZ77 TSA tilemap (32x32) baked onto the end of Pal_080E1164.agbpal.
 * Orphaned (no code references it). Extracted to its decompressed tilemap source
 * (Tsa_080E1184.tsa); the build recompresses it to .tsa.lz at -mindist 1 (byte-identical). */
const u8 Tsa_ConstDataBanimekrdk_0[] = INCBIN_U8("graphics/banim/misc/Tsa_080E1184.tsa.lz");
