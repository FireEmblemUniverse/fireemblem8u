#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

extern struct AnimSpriteData AnimSprite_EkrMainMini_L_Far[];
extern AnimScr AnimScr_EkrMainMini_L_Far[];
extern struct AnimSpriteData AnimSprite_EkrMainMini_R_Far[];
extern AnimScr AnimScr_EkrMainMini_R_Far[];
extern struct AnimSpriteData AnimSprite_EkrMainMini_L_Close[];
extern AnimScr AnimScr_EkrMainMini_L_Close[];
extern struct AnimSpriteData AnimSprite_EkrMainMini_R_Close[];
extern AnimScr AnimScr_EkrMainMini_R_Close[];
extern struct AnimSpriteData AnimSprite_EkrMainMini_R_Close_1[];
extern AnimScr AnimScr_Ekrmainminifx[];

struct AnimSpriteData CONST_DATA AnimSprite_EkrMainMini_L_Far[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, -48, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, -16, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0008, 16, 8 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000C, 48, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000D, -48, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0011, -16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0015, 16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0019, -48, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x001D, -16, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0039, 0, -16 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_EkrMainMini_L_Far[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_L_Far, 4),
    ANIMSCR_BLOCKED,
};

struct AnimSpriteData CONST_DATA AnimSprite_EkrMainMini_R_Far[] =
{
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0000, 16, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0004, -16, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0008, -48, 8 } } },
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000C, -56, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000D, 16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0011, -16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0015, -48, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0019, 16, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x001D, 0, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0039, -32, -16 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_EkrMainMini_R_Far[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_R_Far, 4),
    ANIMSCR_BLOCKED,
};

struct AnimSpriteData CONST_DATA AnimSprite_EkrMainMini_L_Close[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, -48, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, -16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0008, 16, 8 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000A, 32, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000B, -48, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000F, -16, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0013, 16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0015, -48, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0019, -16, -16 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_EkrMainMini_L_Close[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_L_Close, 4),
    ANIMSCR_BLOCKED,
};

struct AnimSpriteData CONST_DATA AnimSprite_EkrMainMini_R_Close[] =
{
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0000, 16, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0004, -16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0008, -32, 8 } } },
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000A, -40, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000B, 16, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000F, -16, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0013, -32, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0015, 16, -16 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0019, -16, -16 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_EkrMainMini_R_Close[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_R_Close, 4),
    ANIMSCR_BLOCKED,
};

struct AnimSpriteData CONST_DATA AnimSprite_EkrMainMini_R_Close_1[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x1000, -107, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x1008, -75, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x1004, -59, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x1008, -27, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, 11, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0008, 43, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, 59, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0008, 91, -8 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_Ekrmainminifx[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_R_Close_1, 4),
    ANIMSCR_BLOCKED,
};
