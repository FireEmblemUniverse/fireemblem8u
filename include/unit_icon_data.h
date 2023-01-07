// standing and moving map sprite
// reference: https://feuniverse.us/t/map-sprite-insertion-mania/107

#pragma once

#include "unit_icon_pointer.h"

typedef struct {
    unsigned short pattern; // unknown, seems to be useless
    unsigned short size; // icon size
    char *sheet; // animation sheet
} UnitIconWait, *pUnitIconWait;

#define UNIT_ICON_SIZE_16x16 0
#define UNIT_ICON_SIZE_16x32 1
#define UNIT_ICON_SIZE_32x32 2

typedef struct {
    char *sheet; // animation sheet
    char *motion; // frames and scripts for different modes
} UnitIconMove, *pUnitIconMove;
