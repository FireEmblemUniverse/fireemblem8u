// portrait pointer table entry structure

#pragma once

#include "portrait_pointer.h"

typedef struct {
    unsigned char *tileset;
    unsigned char *chibi;
    unsigned short *palette;
    unsigned short *mouth;
    unsigned char *card;
    char x_mouth;
    char y_mouth;
    char x_eye;
    char y_eye;
    int eye_state;
} Portrait, *pPortrait;

#define EYE_STATE_NORMAL 1
#define EYE_STATE_CLOSED 6

