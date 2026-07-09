#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

extern struct AnimSpriteData AnimSprite_LvupStatup_1[];
extern struct AnimSpriteData AnimSprite_LvupStatup_2[];
extern struct AnimSpriteData AnimSprite_LvupStatup_3[];
extern struct AnimSpriteData AnimSprite_LvupStatup_4[];
extern struct AnimSpriteData AnimSprite_LvupStatup_5[];
extern struct AnimSpriteData AnimSprite_LvupStatup_6[];
extern struct AnimSpriteData AnimSprite_LvupStatup_7[];
extern struct AnimSpriteData AnimSprite_LvupStatup_8[];
extern struct AnimSpriteData AnimSprite_LvupStatup_9[];
extern struct AnimSpriteData AnimSprite_LvupStatup_10[];
extern struct AnimSpriteData AnimSprite_LvupStatup_11[];
extern struct AnimSpriteData AnimSprite_LvupStatup_12[];
extern struct AnimSpriteData AnimSprite_LvupStatup_13[];
extern struct AnimSpriteData AnimSprite_LvupStatup_14[];
extern struct AnimSpriteData AnimSprite_LvupStatup_15[];
extern struct AnimSpriteData AnimSprite_LvupStatup_16[];
extern struct AnimSpriteData AnimSprite_LvupStatup_17[];
extern struct AnimSpriteData AnimSprite_LvupStatup_18[];
extern struct AnimSpriteData AnimSprite_LvupStatup_19[];
extern struct AnimSpriteData AnimSprite_LvupStatup_20[];
extern struct AnimSpriteData AnimSprite_LvupStatup_21[];
extern struct AnimSpriteData AnimSprite_LvupStatup_22[];
extern struct AnimSpriteData AnimSprite_LvupStatup_23[];
extern struct AnimSpriteData AnimSprite_LvupStatup_24[];
extern struct AnimSpriteData AnimSprite_LvupStatup_25[];
extern struct AnimSpriteData AnimSprite_LvupStatup_26[];
extern struct AnimSpriteData AnimSprite_LvupStatup_27[];
extern struct AnimSpriteData AnimSprite_LvupStatup_28[];
extern struct AnimSpriteData AnimSprite_LvupStatup_29[];
extern struct AnimSpriteData AnimSprite_LvupStatup_30[];
extern struct AnimSpriteData AnimSprite_LvupStatup_31[];
extern struct AnimSpriteData AnimSprite_LvupStatup_32[];
extern struct AnimSpriteData AnimSprite_LvupStatup_33[];
extern struct AnimSpriteData AnimSprite_LvupStatup_34[];
extern struct AnimSpriteData AnimSprite_LvupStatup_35[];
extern struct AnimSpriteData AnimSprite_LvupStatup_36[];
extern struct AnimSpriteData AnimSprite_LvupStatup_37[];
extern struct AnimSpriteData AnimSprite_LvupStatup_38[];
extern struct AnimSpriteData AnimSprite_LvupStatup_39[];
extern struct AnimSpriteData AnimSprite_LvupStatup_40[];
extern struct AnimSpriteData AnimSprite_LvupStatup_41[];
extern struct AnimSpriteData AnimSprite_LvupStatup_42[];
extern struct AnimSpriteData AnimSprite_LvupStatup_43[];
extern struct AnimSpriteData AnimSprite_LvupStatup_44[];
extern struct AnimSpriteData AnimSprite_LvupStatup_45[];
extern struct AnimSpriteData AnimSprite_LvupStatup_46[];
extern AnimScr AnimScr_LvupStatupfx1[];
extern AnimScr AnimScr_LvupStatupfx2[];
extern AnimScr AnimScr_LvupStatupfx3[];
extern AnimScr AnimScr_LvupStatupfx4[];
extern AnimScr AnimScr_LvupStatupfx5[];
extern AnimScr AnimScr_LvupStatupfx6[];
extern AnimScr AnimScr_LvupStatupObj[];

u8 CONST_DATA Img_EkrLvupNumBig[] = INCBIN_U8("graphics/misc/Img_EkrLvupNumBig.4bpp");

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_1[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -7, -10 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -6, -6 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -4, -4 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_2[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -7, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -5, -5 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 2, -19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -4, -17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -7, -13 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_3[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -5, -15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -7, -6 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 11, -12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 6, -18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -1, -18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -7, -11 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_4[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 0, -19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -7, -10 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 13, -5 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 11, -12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 7, -17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -5, -15 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_5[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 9, -14 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -4, -17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 8, 6 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 13, -1 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 13, -7 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 2, -18 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_6[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 13, -7 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 4, -18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -2, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 8, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 13, 2 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 9, -14 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_7[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 13, 2 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 8, -16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -16, 10 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -6, 13 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 5, 10 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 13, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_8[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 0, 14 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 13, -3 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -24, -2 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -20, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -12, 15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 10, 7 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_9[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -17, 14 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 8, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -25, -17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -28, -6 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -25, 5 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -4, 16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_10[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -7, 17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -28, -11 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -22, -22 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -18, 13 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -13, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -27, 2 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_11[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -19, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -25, -18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -7, -31 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -17, -27 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -25, 4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -28, -7 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_12[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0040, -8, -9 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -37, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_13[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -17 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -46, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -30, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_14[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0024, -8, -17 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0007, -52, -8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000B, -20, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_15[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0024, -8, -20 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_16[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -27 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_17[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0040, -8, -22 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_18[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -25 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_19[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0026, -8, -17 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_20[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0028, -8, -17 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_21[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002A, -8, -17 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, -56, -8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0010, -24, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_22[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(0x2000) << 16), .as = { .object = { 0x0040, -8, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_23[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(0x6000) << 16), .as = { .object = { 0x0028, -8, -22 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_24[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(0x6000) << 16), .as = { .object = { 0x002A, -8, -22 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_25[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_26[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0040, -8, -9 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_27[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -17 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_28[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0024, -8, -17 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_29[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0024, -8, -20 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_30[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -27 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_31[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0040, -8, -22 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_32[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0022, -8, -25 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_33[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0026, -8, -17 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_34[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0028, -8, -17 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_35[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002A, -8, -17 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_36[] =
{
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_37[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x80, 0x0, 0x0, 0x80 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON + OBJ_DISABLE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_38[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x8e, 0x0, 0x0, 0x8e } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON + OBJ_DISABLE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_39[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0xa0, 0x0, 0x0, 0xa0 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON + OBJ_DISABLE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_40[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0xb7, 0x0, 0x0, 0xb7 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON + OBJ_DISABLE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_41[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0xd5, 0x0, 0x0, 0xd5 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON + OBJ_DISABLE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_42[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_43[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x141, 0x0, 0x0, 0x141 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_44[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x1ac, 0x0, 0x0, 0x1ac } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_45[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x282, 0x0, 0x0, 0x282 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_LvupStatup_46[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x505, 0x0, 0x0, 0x505 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x002C, -8, -8 } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx1[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_11, 2),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx2[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_16, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_17, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_16, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_19, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_20, 24),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_21, 8),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx3[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_22, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_23, 24),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_24, 8),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx4[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_36, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_25, 1),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx5[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_36, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_25, 4),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupfx6[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_26, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_27, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_29, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_31, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_32, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_33, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_34, 24),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_35, 8),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_LvupStatupObj[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_37, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_39, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_41, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_42, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_43, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_45, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_46, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_36, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LvupStatup_25, 4),
    ANIMSCR_BLOCKED,
};
