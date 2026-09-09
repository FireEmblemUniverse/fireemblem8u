#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/data_minimap.s into .data.
 */

u8 gGfx_MinimapTiles[] = INCBIN_U8("graphics/minimap/minimap_tiles.4bpp.lz");
u16 gPal_MinimapTiles[] = INCBIN_U16("graphics/minimap/minimap_tiles.gbapal");
u16 gPal_Minimap_0[] = INCBIN_U16("graphics/minimap/gPal_08A1FFD0.gbapal","graphics/minimap/gPal_Unused_08A1FFF0.gbapal","graphics/minimap/gPal_Unused_08A20010.gbapal","graphics/minimap/gPal_Unused_08A20030.gbapal");
