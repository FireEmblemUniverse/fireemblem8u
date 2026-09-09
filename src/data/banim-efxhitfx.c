#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

extern struct AnimSpriteData AnimSprite_NoDamage1[];
extern struct AnimSpriteData AnimSprite_NoDamage2[];
extern struct AnimSpriteData AnimSprite_NoDamage3[];
extern struct AnimSpriteData AnimSprite_NoDamage4[];
extern struct AnimSpriteData AnimSprite_NoDamage5[];
extern struct AnimSpriteData AnimSprite_NoDamage6[];
extern struct AnimSpriteData AnimSprite_NoDamage7[];
extern struct AnimSpriteData AnimSprite_NoDamage8[];
extern struct AnimSpriteData AnimSprite_NoDamage9[];
extern struct AnimSpriteData AnimSprite_NoDamageA[];
extern struct AnimSpriteData AnimSprite_NoDamageB[];
extern struct AnimSpriteData AnimSprite_NoDamageC[];
extern struct AnimSpriteData AnimSprite_NoDamageD[];
extern struct AnimSpriteData AnimSprite_NoDamageE[];
extern struct AnimSpriteData AnimSprite_NoDamageF[];
extern struct AnimSpriteData AnimSprite_NoDamage10[];
extern struct AnimSpriteData AnimSprite_NoDamage11[];
extern struct AnimSpriteData AnimSprite_NoDamage12[];
extern struct AnimSpriteData AnimSprite_NoDamage13[];
extern struct AnimSpriteData AnimSprite_NoDamage14[];
extern struct AnimSpriteData AnimSprite_NoDamage15[];
extern struct AnimSpriteData AnimSprite_NoDamage16[];
extern struct AnimSpriteData AnimSprite_NoDamage17[];
extern struct AnimSpriteData AnimSprite_NoDamage18[];
extern struct AnimSpriteData AnimSprite_NoDamage19[];
extern struct AnimSpriteData AnimSprite_NoDamage1A[];
extern struct AnimSpriteData AnimSprite_Miss1[];
extern struct AnimSpriteData AnimSprite_Miss2[];
extern struct AnimSpriteData AnimSprite_Miss3[];
extern struct AnimSpriteData AnimSprite_Miss4[];
extern struct AnimSpriteData AnimSprite_Miss5[];
extern struct AnimSpriteData AnimSprite_Miss6[];
extern struct AnimSpriteData AnimSprite_Miss7[];
extern struct AnimSpriteData AnimSprite_Miss8[];
extern struct AnimSpriteData AnimSprite_Miss9[];
extern struct AnimSpriteData AnimSprite_MissA[];
extern struct AnimSpriteData AnimSprite_MissB[];
extern struct AnimSpriteData AnimSprite_MissC[];
extern struct AnimSpriteData AnimSprite_MissD[];
extern struct AnimSpriteData AnimSprite_MissE[];
extern struct AnimSpriteData AnimSprite_MissF[];
extern struct AnimSpriteData AnimSprite_Miss10[];
extern struct AnimSpriteData AnimSprite_Miss11[];
extern struct AnimSpriteData AnimSprite_Miss12[];
extern struct AnimSpriteData AnimSprite_Miss13[];
extern struct AnimSpriteData AnimSprite_Miss14[];
extern AnimScr AnimScr_NoDamage[];
extern AnimScr AnimScr_Miss[];

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage1[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x20 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x18 /* D */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage2[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x1F /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x17 /* D */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage3[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x1E /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x15 /* D */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage4[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x1B /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x20 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x13 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x18 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage5[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x17 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x1F /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x11 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x17 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage6[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x12 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x1D /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x15 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage7[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x1A /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x11 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x13 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x14 /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage8[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x11 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x16 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x12 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x11 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x13 /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage9[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x13 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x11 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x13 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x11 /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageA[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x15 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x13 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x11 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x14 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageB[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x16 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x11 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x12 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x12 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x11 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x13 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageC[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x16 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x13 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x11 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x13 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x12 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x11 /* A */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageD[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x15 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x15 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x13 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x12 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x12 /* G */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageE[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x13 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x16 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x12 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x11 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x11 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x11 /* G */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamageF[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x11 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x16 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x11 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x12 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage10[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x15 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x12 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x11 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x12 /* E */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage11[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x13 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x11 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x12 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x11 /* E */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage12[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x11 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x11 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x10 /* E */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage13[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x11 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x12 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage14[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x11 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x12 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage15[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x11 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x10 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage16[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x10 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage17[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x10 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x12 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage18[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x10 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage19[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000 / 0x20, -0x28, -0x10 /* N */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x020 / 0x20, -0x20, -0x10 /* O */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x040 / 0x20, -0x10, -0x10 /* D */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, -0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x080 / 0x20, -0x00, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x060 / 0x20, +0x08, -0x10 /* A */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0A0 / 0x20, +0x10, -0x10 /* G */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0C0 / 0x20, +0x18, -0x10 /* E */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x20, -0x10 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_NoDamage1A[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x180 / 0x20, 0x0, -0x08 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss1[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x20 /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss2[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x1F /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss3[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x1D /* M */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss4[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x1A /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x18 /* I */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss5[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x16 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x17 /* I */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss6[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x11 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x15 /* I */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss7[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x12 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x14 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss8[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x11 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x13 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss9[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x13 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x11 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x11 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissA[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x15 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x12 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x14 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissB[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x16 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x12 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x11 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x13 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissC[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x16 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x11 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x12 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x11 /* S */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissD[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x15 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x11 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x14 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissE[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x13 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x11 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x13 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_MissF[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x11 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x12 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss10[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x11 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x10 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss11[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss12[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x12 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss13[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x11 /* ! */ } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData CONST_DATA AnimSprite_Miss14[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x100 / 0x20, -0x14, -0x10 /* M */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x120 / 0x20, -0x0C, -0x10 /* I */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, -0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x140 / 0x20, +0x04, -0x10 /* S */ } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0E0 / 0x20, +0x0C, -0x10 /* ! */ } } },
    ANIM_SPRITE_END,
};

AnimScr CONST_DATA AnimScr_NoDamage[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageA, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageB, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageD, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageE, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamageF, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage15, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage17, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage19, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage1A, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

AnimScr CONST_DATA AnimScr_Miss[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissA, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissB, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissD, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissE, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_MissF, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss14, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage1A, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};
