#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/data_5B65C0.s into .data.
 */

const u8 CONST_DATA gUiFrameImage[] = INCBIN_U8("graphics/misc/gUiFrameImage.4bpp.lz");
const u16 CONST_DATA gUiFramePaletteA[] = INCBIN_U16("graphics/misc/gUiFramePaletteA.gbapal");
const u16 CONST_DATA gUiFramePaletteB[] = INCBIN_U16("graphics/misc/gUiFramePaletteB.gbapal");
const u16 CONST_DATA gUiFramePaletteC[] = INCBIN_U16("graphics/misc/gUiFramePaletteC.gbapal");
const u16 CONST_DATA gUiFramePaletteD[] = INCBIN_U16("graphics/misc/gUiFramePaletteD.gbapal");
const u8 CONST_DATA gLegacyUiFrameAImage[] = INCBIN_U8("graphics/misc/gLegacyUiFrameAImage.4bpp.lz");
const u16 CONST_DATA gLegacyUiFrameAPalette[] = INCBIN_U16("graphics/misc/gLegacyUiFrameAPalette.gbapal");
const u16 CONST_DATA gUiBarPaletteA[] = INCBIN_U16("graphics/misc/gUiBarPaletteA.gbapal");
const u8 CONST_DATA gLegacyUiFrameBImage[] = INCBIN_U8("graphics/misc/gLegacyUiFrameBImage.4bpp.lz");
const u16 CONST_DATA gLegacyUiFrameBPalette[] = INCBIN_U16("graphics/misc/gLegacyUiFrameBPalette.gbapal");
const u16 CONST_DATA gUiBarPaletteB[] = INCBIN_U16("graphics/misc/gUiBarPaletteB.gbapal");
const u8 CONST_DATA gLegacyUiFrameCImage[] = INCBIN_U8("graphics/misc/gLegacyUiFrameCImage.4bpp.lz");
const u16 CONST_DATA gLegacyUiFrameCPalette[] = INCBIN_U16("graphics/misc/gLegacyUiFrameCPalette.gbapal");
const u16 CONST_DATA gUiBarPaletteC[] = INCBIN_U16("graphics/misc/gUiBarPaletteC.gbapal");
const u8 CONST_DATA gLegacyUiFrameDImage[] = INCBIN_U8("graphics/misc/gLegacyUiFrameDImage.4bpp.lz");
const u16 CONST_DATA gLegacyUiFrameDPalette[] = INCBIN_U16("graphics/misc/gLegacyUiFrameDPalette.gbapal");
const u16 CONST_DATA gUiBarPaletteD[] = INCBIN_U16("graphics/misc/gUiBarPaletteD.gbapal");
const u8 CONST_DATA gUnkUiFrameImage[] = INCBIN_U8("graphics/misc/gUnkUiFrameImage.4bpp.lz");
const u16 CONST_DATA gUnkUiFramePalettes[] = INCBIN_U16("graphics/misc/gUnkUiFramePalettes.gbapal");
u8 Img_SysGrayBox[] = INCBIN_U8("./graphics/sysutils/Img_SysGrayBox.4bpp.lz");
