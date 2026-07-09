#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/data_A167C8.s into .data.
 */

u8 gGfx_PlayerInterfaceFontTiles[] = INCBIN_U8("graphics/player_interface/player_interface_font_tiles.4bpp.lz");
u8 gGfx_PlayerInterfaceNumbers[] = INCBIN_U8("graphics/player_interface/player_interface_numbers.4bpp.lz");
u8 gGfx_StatusText[] = INCBIN_U8("graphics/player_interface/status_text.4bpp");
u16 gPal_PlayerInterface_Blue[] = INCBIN_U16("graphics/player_interface/player_interface_blue.gbapal");
u16 gPal_PlayerInterface_Red[] = INCBIN_U16("graphics/player_interface/player_interface_red.gbapal");
u16 gPal_PlayerInterface_Green[] = INCBIN_U16("graphics/player_interface/player_interface_green.gbapal");
/* TSA tilemap (0x09/0x02 header) filled by CallARM_FillTileRect in unitinfowindow.c;
 * was mis-extracted as two .gbapal palettes (gUnkData_48 + the spillover gUnkData_49). */
u16 gTSA_UnitInfoWindow[] = INCBIN_U16("graphics/player_interface/gTSA_UnitInfoWindow.tsa.bin");
u16 gTSA_TerrainBox[] = INCBIN_U16("graphics/misc/gTSA_TerrainBox.tsa.bin");
u16 gTSA_MinimugBox[] = INCBIN_U16("graphics/misc/gTSA_MinimugBox.tsa.bin");
u16 gTsa_UnitBurstMapUiTopFlat[] = INCBIN_U16("graphics/misc/gUnkData_50.tsa.bin");
u16 gTsa_UnitBurstMapUiTopLeftTail[] = INCBIN_U16("graphics/misc/gUnkData_51.tsa.bin");
u16 gTsa_UnitBurstMapUiTopCenterTail[] = INCBIN_U16("graphics/misc/gUnkData_52.tsa.bin");
u16 gTsa_UnitBurstMapUiTopRightTail[] = INCBIN_U16("graphics/misc/gUnkData_53.tsa.bin");
u16 gTsa_UnitBurstMapUiMiddle[] = INCBIN_U16("graphics/misc/gUnkData_54.tsa.bin");
u16 gTsa_UnitBurstMapUiBottomLeftTail[] = INCBIN_U16("graphics/misc/gUnkData_55.tsa.bin");
u16 gTsa_UnitBurstMapUiBottomCenterTail[] = INCBIN_U16("graphics/misc/gUnkData_56.tsa.bin");
u16 gTsa_UnitBurstMapUiBottomRightTail[] = INCBIN_U16("graphics/misc/gUnkData_57.tsa.bin");
u16 gTsa_UnitBurstMapUiBottomFlat[] = INCBIN_U16("graphics/misc/gUnkData_58.tsa.bin");
u16 Tsa_TerrainMapUi_Labels[] = INCBIN_U16("graphics/misc/Tsa_TerrainMapUi_Labels.tsa.bin");
u16 gTSA_TerrainBox_Ballistae[] = INCBIN_U16("graphics/misc/gTSA_TerrainBox_Ballistae.tsa.bin");
u16 Tsa_TerrainMapUi_ObstacleLabels[] = INCBIN_U16("graphics/misc/Tsa_TerrainMapUi_ObstacleLabels.tsa.bin");
u16 Tsa_TerrainMapUi_ObstacleFullHp[] = INCBIN_U16("graphics/misc/Tsa_TerrainMapUi_ObstacleFullHp.tsa.bin");
u16 gTSA_GoalBox_TwoLines[] = INCBIN_U16("graphics/misc/gTSA_GoalBox_TwoLines.tsa.bin");
u16 gTSA_GoalBox_OneLine[] = INCBIN_U16("graphics/misc/gTSA_GoalBox_OneLine.tsa.bin");
