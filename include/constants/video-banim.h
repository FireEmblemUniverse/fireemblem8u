#pragma once

#include "constants/video-global.h"

enum
{
    OBJCHR_BANIM_FACE = 0x40,
};

enum
{
    OBJPAL_BANIM_SPELL_BG = 1,
    OBJPAL_BANIM_FACE = 3,

    OBPAL_EFX_UNIT_L = 7,
    OBPAL_EFX_UNIT_R = 9,
   
    OBJPAL_BANIM_SPELL_OBJ = 0x12 - 0x10,
};

enum
{
    VRAMOFF_BANIM_SPELL_OBJ = 0x0800,
    VRAMOFF_BANIM_SPELL_BG  = 0x2000,
};

#define OBPAL_EFXHPBAR_L 11
#define OBPAL_EFXHPBAR_R 12
