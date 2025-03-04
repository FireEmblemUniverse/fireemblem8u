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
	{bg_House_tiles, bg_House_map, bg_House_palette},
	{bg_Caer_Pelyn_tiles, bg_Caer_Pelyn_map, bg_Caer_Pelyn_palette},
	{bg_Normal_Village_tiles, bg_Normal_Village_map, bg_Normal_Village_palette},
	{bg_Village_Clear_tiles, bg_Village_Clear_map, bg_Village_Clear_palette},
	{bg_Village_Clear_tiles, bg_Village_Clear_map, bg_Village_Sunset_palette},
	{bg_Serafew_Village_tiles, bg_Serafew_Village_map, bg_Serafew_Village_palette},
	{bg_Serafew_Village_tiles, bg_Serafew_Village_map, bg_Serafew_Flashback_palette},
	{bg_Port_tiles, bg_Port_map, bg_Port_palette},
	{bg_Ship_tiles, bg_Ship_map, bg_Ship_palette},
	{bg_Fireplace_tiles, bg_Fireplace_map, bg_Fireplace_palette},
	{bg_Castle_Interior_tiles, bg_Castle_Interior_map, bg_Castle_Interior_palette},
	{bg_Castle_Interior_tiles, bg_Castle_Interior_map, bg_Castle_Night_palette},
	{bg_Grado_Chamber_tiles, bg_Grado_Chamber_map, bg_Grado_Chamber_palette},
	{bg_Grado_Chamber_tiles, bg_Grado_Chamber_map, bg_Grado_Chamber_Flashback_palette},
	{bg_Throne_Normal_tiles, bg_Throne_Normal_map, bg_Throne_Normal_palette},
	{bg_Throne_Normal_tiles, bg_Throne_Normal_map, bg_Throne_Flashback_palette},
	{bg_Castle_Bright_tiles, bg_Castle_Bright_map, bg_Castle_Bright_palette},
	{bg_Castle_Bright_tiles, bg_Castle_Bright_map, bg_Castle_Dark_palette},
	{bg_Gate_tiles, bg_Gate_map, bg_Gate_palette},
	{bg_Garden_tiles, bg_Garden_map, bg_Garden_palette},
	{bg_Garden_tiles, bg_Garden_map, bg_Garden_Flashback_palette},
	{bg_Manse_Back_tiles, bg_Manse_Back_map, bg_Manse_Back_palette},
	{bg_Manse_Back_tiles, bg_Manse_Back_map, bg_Manse_Flashback_palette},
	{bg_Cell_tiles, bg_Cell_map, bg_Cell_palette},
	{bg_Plain_1_tiles, bg_Plain_1_map, bg_Plain_1_palette},
	{bg_Plain_1_tiles, bg_Plain_1_map, bg_Plain_1_Sunset_palette},
	{bg_Plain_1_tiles, bg_Plain_1_map, bg_Plain_1_Fog_palette},
	{bg_Grass_Plains_2_tiles, bg_Grass_Plains_2_map, bg_Grass_Plains_2_palette},
	{bg_Grass_Plains_tiles, bg_Grass_Plains_map, bg_Grass_Plains_palette},
	{bg_Plain_2_tiles, bg_Plain_2_map, bg_Plain_2_palette},
	{bg_Plain_2_tiles, bg_Plain_2_map, bg_Plain_2_Fog_palette},
	{bg_Plain_2_tiles, bg_Plain_2_map, bg_Plain_2_Sunset_palette},
	{bg_Plain_2_tiles, bg_Plain_2_map, bg_Plain_2_Night_palette},
	{bg_Stream_tiles, bg_Stream_map, bg_Stream_palette},
	{bg_Trees_tiles, bg_Trees_map, bg_Trees_palette},
	{bg_Forest_tiles, bg_Forest_map, bg_Forest_palette},
	{bg_Town_tiles, bg_Town_map, bg_Town_palette},
	{bg_Castle_Back_tiles, bg_Castle_Back_map, bg_Castle_Back_palette},
	{bg_Interior_Black_tiles, bg_Interior_Black_map, bg_Interior_Black_palette},
	{bg_Interior_Black_tiles, bg_Interior_Black_map, bg_Interior_Brown_palette},
	{bg_Fort_Sunset_tiles, bg_Fort_Sunset_map, bg_Fort_Sunset_palette},
	{bg_Fort_tiles, bg_Fort_map, bg_Fort_palette},
	{bg_Passage_tiles, bg_Passage_map, bg_Passage_palette},
	{bg_Burning_Castle_tiles, bg_Burning_Castle_map, bg_Burning_Castle_palette},
	{bg_Stone_Chamber_tiles, bg_Stone_Chamber_map, bg_Stone_Chamber_palette},
	{bg_Stone_Chamber_tiles, bg_Stone_Chamber_map, bg_Stone_Flashback_palette},
	{bg_Renais_Chamber_tiles, bg_Renais_Chamber_map, bg_Renais_Chamber_palette},
	{bg_White_Chamber_tiles, bg_White_Chamber_map, bg_White_Chamber_palette},
	{bg_Desert_tiles, bg_Desert_map, bg_Desert_palette},
	{bg_Darkling_Woods_tiles, bg_Darkling_Woods_map, bg_Darkling_Woods_palette},
	{bg_Volcano_tiles, bg_Volcano_map, bg_Volcano_palette},
	{bg_Black_Temple_Outside_tiles, bg_Black_Temple_Outside_map, bg_Black_Temple_Outside_palette},
	{bg_Black_Temple_Inside_tiles, bg_Black_Temple_Inside_map, bg_Black_Temple_Inside_palette},
	{bg_Blank_tiles, bg_Blank_map, bg_Blank_palette},
};
