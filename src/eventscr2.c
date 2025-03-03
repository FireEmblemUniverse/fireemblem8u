#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "face.h"

#include "functions.h"
#include "variables.h"
#include "bmlib.h"
#include "bg.h"
#include "scene.h"
#include "event.h"
#include "ekrbattle.h"


void ReputConvoBg_unused(int index)
{
    ResetDialogueScreen();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    Decompress(
        gConvoBackgroundData[index].gfx,
        (void*)(GetBackgroundTileDataOffset(3) + BG_VRAM));

    CallARM_FillTileRect(gBG3TilemapBuffer, gConvoBackgroundData[index].tsa, 0x8000);
    ApplyPalettes(gConvoBackgroundData[index].pal, 0x8, 0x8);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
}

void ResetDialogueScreen(void) // function: MapLevelUp_EndFace
{
    ClearTalkBubble();
    Proc_EndEach(gProcScr_E_FACE);
    ResetFaces();
    ClearTalkFaceRefs();
}

/* This is a function related to display cursor (Event3B -> proc-85908<gProc_SetCursorMayBe>) */
u16 EventShinningCursorAdvance(s16 x, s16 y, s16 counter)
{
    /**
     * I think there maybe a better compile method to handle (x << 0x14) >> 0x10.
     * For now, (x * 0x10) outputs (x << 0x10) >> 0x0C in trouble.
     */
    u16 tmp_counter0 = counter;
    s16 tmp_x = - gBmSt.camera.x + ((x << 0x14)>>0x10);
    s16 tmp_y = - gBmSt.camera.y + ((y << 0x14)>>0x10);

    CallARM_PushToSecondaryOAM(
        (tmp_x + 0x200) & 0x1FF,
        (tmp_y + 0x100) & 0xFF,
        Obj_EventShinningCursor,
        0x2822);

    if (tmp_counter0 <= 0xF) {
        ShinningEventCursor(0x10, 0x0, tmp_counter0 / 2);
        tmp_counter0++;
    }
    else {
        ShinningEventCursor(0x0, 0x10, tmp_counter0 / 2 - 0x8);
        tmp_counter0++;

        if (tmp_counter0 > 0x1F)
            tmp_counter0 = 0;
    }

    return tmp_counter0;
}

void ShinningEventCursor(int lo, int hi, int cur)
{
    int var = Interpolate(1, lo, hi, cur, 8);
    CpuFastCopy(Pal_EventCursorShinning, PAL_OBJ(0x2), 0x20);
    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, var);
    EnablePaletteSync();
}

struct CONST_DATA gfx_set gConvoBackgroundData[] = {
	{bg_house_tiles, bg_house_map, bg_house_palette},
	{bg_caer_pelyn_tiles, bg_caer_pelyn_map, bg_caer_pelyn_palette},
	{bg_normal_village_tiles, bg_normal_village_map, bg_normal_village_palette},
	{bg_village_clear_tiles, bg_village_clear_map, bg_village_clear_palette},
	{bg_village_clear_tiles, bg_village_clear_map, bg_village_sunset_palette},
	{bg_serafew_village_tiles, bg_serafew_village_map, bg_serafew_village_palette},
	{bg_serafew_village_tiles, bg_serafew_village_map, bg_serafew_flashback_palette},
	{bg_port_tiles, bg_port_map, bg_port_palette},
	{bg_ship_tiles, bg_ship_map, bg_ship_palette},
	{bg_fireplace_tiles, bg_fireplace_map, bg_fireplace_palette},
	{bg_castle_interior_tiles, bg_castle_interior_map, bg_castle_interior_palette},
	{bg_castle_interior_tiles, bg_castle_interior_map, bg_castle_night_palette},
	{bg_grado_chamber_tiles, bg_grado_chamber_map, bg_grado_chamber_palette},
	{bg_grado_chamber_tiles, bg_grado_chamber_map, bg_grado_chamber_flashback_palette},
	{bg_throne_normal_tiles, bg_throne_normal_map, bg_throne_normal_palette},
	{bg_throne_normal_tiles, bg_throne_normal_map, bg_throne_flashback_palette},
	{bg_castle_bright_tiles, bg_castle_bright_map, bg_castle_bright_palette},
	{bg_castle_bright_tiles, bg_castle_bright_map, bg_castle_dark_palette},
	{bg_gate_tiles, bg_gate_map, bg_gate_palette},
	{bg_garden_tiles, bg_garden_map, bg_garden_palette},
	{bg_garden_tiles, bg_garden_map, bg_garden_flashback_palette},
	{bg_manse_back_tiles, bg_manse_back_map, bg_manse_back_palette},
	{bg_manse_back_tiles, bg_manse_back_map, bg_manse_flashback_palette},
	{bg_cell_tiles, bg_cell_map, bg_cell_palette},
	{bg_plain_1_tiles, bg_plain_1_map, bg_plain_1_palette},
	{bg_plain_1_tiles, bg_plain_1_map, bg_plain_1_sunset_palette},
	{bg_plain_1_tiles, bg_plain_1_map, bg_plain_1_fog_palette},
	{bg_grass_plains_2_tiles, bg_grass_plains_2_map, bg_grass_plains_2_palette},
	{bg_grass_plains_tiles, bg_grass_plains_map, bg_grass_plains_palette},
	{bg_plain_2_tiles, bg_plain_2_map, bg_plain_2_palette},
	{bg_plain_2_tiles, bg_plain_2_map, bg_plain_2_fog_palette},
	{bg_plain_2_tiles, bg_plain_2_map, bg_plain_2_sunset_palette},
	{bg_plain_2_tiles, bg_plain_2_map, bg_plain_2_night_palette},
	{bg_stream_tiles, bg_stream_map, bg_stream_palette},
	{bg_trees_tiles, bg_trees_map, bg_trees_palette},
	{bg_forest_tiles, bg_forest_map, bg_forest_palette},
	{bg_town_tiles, bg_town_map, bg_town_palette},
	{bg_castle_back_tiles, bg_castle_back_map, bg_castle_back_palette},
	{bg_interior_black_tiles, bg_interior_black_map, bg_interior_black_palette},
	{bg_interior_black_tiles, bg_interior_black_map, bg_interior_brown_palette},
	{bg_fort_sunset_tiles, bg_fort_sunset_map, bg_fort_sunset_palette},
	{bg_fort_tiles, bg_fort_map, bg_fort_palette},
	{bg_passage_tiles, bg_passage_map, bg_passage_palette},
	{bg_burning_castle_tiles, bg_burning_castle_map, bg_burning_castle_palette},
	{bg_stone_chamber_tiles, bg_stone_chamber_map, bg_stone_chamber_palette},
	{bg_stone_chamber_tiles, bg_stone_chamber_map, bg_stone_flashback_palette},
	{bg_renais_chamber_tiles, bg_renais_chamber_map, bg_renais_chamber_palette},
	{bg_white_chamber_tiles, bg_white_chamber_map, bg_white_chamber_palette},
	{bg_desert_tiles, bg_desert_map, bg_desert_palette},
	{bg_darkling_woods_tiles, bg_darkling_woods_map, bg_darkling_woods_palette},
	{bg_volcano_tiles, bg_volcano_map, bg_volcano_palette},
	{bg_black_temple_outside_tiles, bg_black_temple_outside_map, bg_black_temple_outside_palette},
	{bg_black_temple_inside_tiles, bg_black_temple_inside_map, bg_black_temple_inside_palette},
	{bg_black_tiles, bg_black_map, bg_black_palette},
};
