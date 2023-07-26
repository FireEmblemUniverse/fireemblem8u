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

   
    OBJPAL_BANIM_SPELL_OBJ = 0x12 - 0x10,
};

enum
{
    VRAMOFF_BANIM_SPELL_OBJ = 0x0800,
    VRAMOFF_BANIM_SPELL_BG  = 0x2000,
};

#define OBPAL_EFX_UNK_7 7

#define OBPAL_EFX_UNK_9 9

#define OBPAL_EFXHPBAR_L 11
#define OBPAL_EFXHPBAR_R 12
