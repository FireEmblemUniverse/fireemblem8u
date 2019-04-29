// battle animation data in the ROM
// by laqieer

#include "banim_pointer.h"

typedef struct {
    char abbr[12];
    int *modes;
    char *script;
    char *oam_r;
    char *oam_l;
    char *pal;
} BattleAnim, *pBattleAnim;

