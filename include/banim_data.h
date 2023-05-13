// battle animation data in the ROM
// by laqieer

#include "global.h"
#include "packed_data_block.h"
#include "banim_pointer.h"

typedef struct {
    char abbr[12];
    int *modes;
    char *script;
    char *oam_r;
    char *oam_l;
    char *pal;
} BattleAnim, *pBattleAnim;

typedef struct {
    char abbr[12];
    char *pal;
} BattleAnimCharaPal, *pBattleAnimCharaPal;

typedef struct {
    char abbr[12];
    char *tileset;
    short *palette;
    int null_1; // useless, always 00
} BattleAnimTerrain, *pBattleAnimTerrain;

extern BattleAnim banim_data[];
extern BattleAnimCharaPal character_battle_animation_palette_table[];
extern BattleAnimTerrain battle_terrain_table[];
