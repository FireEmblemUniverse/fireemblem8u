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
	{bg_0_tiles, bg_0_map, bg_0_palette},
	{bg_1_tiles, bg_1_map, bg_1_palette},
	{bg_2_tiles, bg_2_map, bg_2_palette},
	{bg_3_tiles, bg_3_map, bg_3_palette},
	{bg_3_tiles, bg_3_map, bg_4_palette},
	{bg_5_tiles, bg_5_map, bg_5_palette},
	{bg_5_tiles, bg_5_map, bg_6_palette},
	{bg_7_tiles, bg_7_map, bg_7_palette},
	{bg_8_tiles, bg_8_map, bg_8_palette},
	{bg_9_tiles, bg_9_map, bg_9_palette},
	{bg_10_tiles, bg_10_map, bg_10_palette},
	{bg_10_tiles, bg_10_map, bg_11_palette},
	{bg_12_tiles, bg_12_map, bg_12_palette},
	{bg_12_tiles, bg_12_map, bg_13_palette},
	{bg_14_tiles, bg_14_map, bg_14_palette},
	{bg_14_tiles, bg_14_map, bg_15_palette},
	{bg_16_tiles, bg_16_map, bg_16_palette},
	{bg_16_tiles, bg_16_map, bg_17_palette},
	{bg_18_tiles, bg_18_map, bg_18_palette},
	{bg_19_tiles, bg_19_map, bg_19_palette},
	{bg_19_tiles, bg_19_map, bg_20_palette},
	{bg_21_tiles, bg_21_map, bg_21_palette},
	{bg_21_tiles, bg_21_map, bg_22_palette},
	{bg_23_tiles, bg_23_map, bg_23_palette},
	{bg_24_tiles, bg_24_map, bg_24_palette},
	{bg_24_tiles, bg_24_map, bg_25_palette},
	{bg_24_tiles, bg_24_map, bg_26_palette},
	{bg_27_tiles, bg_27_map, bg_27_palette},
	{bg_28_tiles, bg_28_map, bg_28_palette},
	{bg_29_tiles, bg_29_map, bg_29_palette},
	{bg_29_tiles, bg_29_map, bg_30_palette},
	{bg_29_tiles, bg_29_map, bg_31_palette},
	{bg_29_tiles, bg_29_map, bg_32_palette},
	{bg_33_tiles, bg_33_map, bg_33_palette},
	{bg_34_tiles, bg_34_map, bg_34_palette},
	{bg_35_tiles, bg_35_map, bg_35_palette},
	{bg_36_tiles, bg_36_map, bg_36_palette},
	{bg_37_tiles, bg_37_map, bg_37_palette},
	{bg_38_tiles, bg_38_map, bg_38_palette},
	{bg_38_tiles, bg_38_map, bg_39_palette},
	{bg_40_tiles, bg_40_map, bg_40_palette},
	{bg_41_tiles, bg_41_map, bg_41_palette},
	{bg_42_tiles, bg_42_map, bg_42_palette},
	{bg_43_tiles, bg_43_map, bg_43_palette},
	{bg_44_tiles, bg_44_map, bg_44_palette},
	{bg_44_tiles, bg_44_map, bg_45_palette},
	{bg_46_tiles, bg_46_map, bg_46_palette},
	{bg_47_tiles, bg_47_map, bg_47_palette},
	{bg_48_tiles, bg_48_map, bg_48_palette},
	{bg_49_tiles, bg_49_map, bg_49_palette},
	{bg_50_tiles, bg_50_map, bg_50_palette},
	{bg_51_tiles, bg_51_map, bg_51_palette},
	{bg_52_tiles, bg_52_map, bg_52_palette},
	{bg_53_tiles, bg_53_map, bg_53_palette},
};
