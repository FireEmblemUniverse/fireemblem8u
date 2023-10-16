#pragma once

// battle animation data in the ROM
// by laqieer

#include "global.h"
#include "packed_data_block.h"
#include "banim_pointer.h"

struct BattleAnim {
    char abbr[12];
    int * modes;
    char * script;
    char * oam_r;
    char * oam_l;
    char * pal;
};

extern struct BattleAnim banim_data[];

struct BattleAnimCharaPal {
    char abbr[12];
    char * pal;
};

extern struct BattleAnimCharaPal character_battle_animation_palette_table[];

struct BattleAnimTerrain {
    char abbr[12];
    char * tileset;
    short * palette;
    int null_1; // useless, always 00
};

extern struct BattleAnimTerrain battle_terrain_table[];

struct BanimModeData {
    const u32 * unk0;
    const u32 * img;
    u32 unk2;
};
