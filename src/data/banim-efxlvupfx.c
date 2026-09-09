#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_0[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_1[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_2[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_3[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_4[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_5[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_6[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_7[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_8[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_9[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_10[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_11[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_12[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_13[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_14[];
extern struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_15[];
extern AnimScr AnimScr_EfxLvupOBJ2[];

u8 CONST_DATA Img_LvupApfx[] = INCBIN_U8("./graphics/lvup/LvupAp.4bpp.lz");

u16 CONST_DATA Pal_LvupApfx[] = INCBIN_U16("./graphics/lvup/LvupAp.gbapal", 0x0, 0x20);

/* EfxLvupOBJ2 level-up effect: sprite frames + their AnimScr. Was the raw blob
 * gUnknown_085BB2FC.bin (.agbpal-mislabeled); decompiled to typed AnimSpriteData +
 * an AnimScr script (ANIMSCR_FORCE_SPRITE references into the frame data). */
struct AnimSpriteData CONST_DATA gEfxlvupfx_0[] =
{
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0505 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x035E } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0282 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0505 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -5 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0200 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x035E } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -6 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x01AC } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0282 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0505 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -6 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -5 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4400) << 16), .as = { .object = { 0x0004, -16, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x016E } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0200 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x035E } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -7 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -6 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4400) << 16), .as = { .object = { 0x0004, -16, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0141 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x01AC } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0282 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -7 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -6 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4400) << 16), .as = { .object = { 0x0004, -16, -5 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x011C } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x016E } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0200 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -7 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4400) << 16), .as = { .object = { 0x0004, -16, -6 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0141 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x01AC } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -7 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0004, -16, -6 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x00D5 } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x011C } } },
    { .header = (u32)(0x0003) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x016E } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -10 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4400) << 16), .as = { .object = { 0x0004, -16, -7 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x00E9 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0141 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0004, -16, -7 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x00D5 } } },
    { .header = (u32)(0x0002) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x011C } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -10 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4200) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x00E9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x00D5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0100) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -10 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0A3D, 0x0000, 0x0000, 0x0A3D } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -3 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0505, 0x0000, 0x0000, 0x0505 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x035E, 0x0000, 0x0000, 0x035E } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -5 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0282, 0x0000, 0x0000, 0x0282 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -5 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -6 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x01AC, 0x0000, 0x0000, 0x01AC } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -6 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -7 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -7 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0001) | ((u32)(0xFFFF) << 16), .as = { .affine = { 0x011C, 0x0000, 0x0000, 0x011C } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0000, -48, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0002, -32, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -16, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0006, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000D, -7, 0 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000A, -3, -5 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x002B, -7, 0 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000A, -3, -6 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000B, -7, 0 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000A, -3, -7 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000B, -7, 0 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000A, -3, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -4, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -1, -6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -6, -6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -6, -1 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -4, 1 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -1, -1 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 1, -4 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -8, -4 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -2, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 1, -6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -6, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -8, -1 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -5, 2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -1, 1 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 2, -2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -9, -5 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 3, -5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 2, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -9, -7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -10, -2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -7, 2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -2, 3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -5, -10 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 5, -3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 1, 2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 3, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -8, -10 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -11, -5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -9, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -5, 4 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -2, -12 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -13, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -8, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -13, -7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -1, -12 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 4, -7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 4, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -1, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -8, -12 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -14, -3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -10, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -12, -10 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 2, -12 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 6, -5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 4, 3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -3, 7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -6, -14 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -15, -4 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -12, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -12, -12 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 4, -11 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 7, -3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 3, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -5, 8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -4, -15 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -16, -7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -14, 3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -10, -14 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 6, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 7, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 1, 7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -8, 8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -1, -15 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -15, -10 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -16, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -7, -15 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 8, -6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 6, 4 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -2, 9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, -11, 7 } } },
    { .header = (u32)(0x0000) | ((u32)(0x1000) << 16), .as = { .object = { 0x0000, 3, -14 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -2, -16 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, 7, -11 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, 10, -2 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, 5, 6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -5, 10 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -13, 5 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -16, -4 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -12, -13 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, 0, -16 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, 8, -9 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, 10, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, 3, 8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -7, 10 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -14, 3 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -6 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -10, -15 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0040, 18, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0005, -16, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0022, 18, -16 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0009, -24, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x000D, 8, -8 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 18, -16 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 18, -19 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0022, 18, -26 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0040, 18, -21 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0022, 18, -24 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0026, 18, -16 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0028, 18, -16 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x002A, 18, -16 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x000F, -32, -8 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0013, 0, -8 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

AnimScr CONST_DATA gEfxlvupfx_0_script[] =
{
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[0], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[3], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[6], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[11], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[16], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[23], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[30], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[37], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[44], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[50], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[57], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[63], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[69], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[74], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[79], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[83], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[89], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[95], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[101], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[107], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[113], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[119], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[125], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[131], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[137], 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[142], 10),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[145], 3),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[148], 3),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[151], 10),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[148], 3),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[145], 3),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[154], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[163], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[172], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[181], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[190], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[199], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[208], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[217], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[226], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[235], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[244], 2),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[253], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[256], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[259], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[263], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[267], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[271], 3),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[267], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[275], 2),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[279], 1),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[283], 24),
    ANIMSCR_FORCE_SPRITE(&gEfxlvupfx_0[287], 8),
    ANIMSCR_BLOCKED,
};

u8 CONST_DATA Img_ArenaBattleBg[] = INCBIN_U8("graphics/banim/efxlvupfx/Img_ArenaBattleBg.4bpp.lz");

u8 CONST_DATA Tsa_ArenaBattleBg[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa_ArenaBattleBg.map.bin.lz");

u16 CONST_DATA Pal_ArenaBattleBg_A[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_ArenaBattleBg_A.gbapal");

u16 CONST_DATA Pal_ArenaBattleBg_B[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_ArenaBattleBg_B.gbapal");

u16 CONST_DATA Pal_ArenaBattleBg_C[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_ArenaBattleBg_C.gbapal");

u8 CONST_DATA gEfxlvupfx_1[] = INCBIN_U8("graphics/banim/efxlvupfx/gUnknown_085BF114.4bpp.lz");

u16 CONST_DATA gEfxlvupfx_2[] = INCBIN_U16("graphics/banim/efxlvupfx/gUnknown_085BF4FC.agbpal");

u8 CONST_DATA gEfxlvupfx_3[] = INCBIN_U8("graphics/banim/efxlvupfx/gEfxlvupfx_3.map.bin.lz");

u8 CONST_DATA Img1_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img1_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img2_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img2_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img3_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img3_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img4_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img4_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img5_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img5_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img6_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img6_EfxLvupBG.4bpp.lz");

u8 CONST_DATA Img7_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Img7_EfxLvupBG.4bpp.lz");

u16 CONST_DATA Pal_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_EfxLvupBG.gbapal");

u8 CONST_DATA Tsa1_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa1_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa2_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa2_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa3_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa3_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa4_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa4_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa5_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa5_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa6_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa6_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa7_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa7_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa8_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa8_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa9_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa9_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa10_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa10_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Tsa11_EfxLvupBG[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa11_EfxLvupBG.map.bin.lz");

u8 CONST_DATA Img_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Img_EfxLvupBG2.4bpp.lz");

u16 CONST_DATA Pal_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_EfxLvupBG2.gbapal");

u16 CONST_DATA Pal_EfxLvupBGCOL[] = INCBIN_U16("graphics/banim/efxlvupfx/Pal_EfxLvupBGCOL.gbapal");

u8 CONST_DATA Tsa1_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa1_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Tsa2_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa2_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Tsa3_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa3_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Tsa4_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa4_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Tsa5_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa5_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Tsa6_EfxLvupBG2[] = INCBIN_U8("graphics/banim/efxlvupfx/Tsa6_EfxLvupBG2.map.bin.lz");

u8 CONST_DATA Img_EfxLvupOBJ2[] = INCBIN_U8("graphics/banim/efxlvupfx/Img_EfxLvupOBJ2.4bpp.lz");

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_0[] =
{
    { .header = (u32)(0x8000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0002, -120, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -104, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -112, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -88, -40 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_1[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -120, -48 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -88, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -96, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -72, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -112, -24 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_2[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -104, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -120, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -72, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -80, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -56, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -104, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -96, -24 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_3[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -88, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -104, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -56, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -64, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -40, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -112, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -88, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -80, -24 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_4[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -72, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -88, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -40, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -48, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -24, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -96, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -72, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -64, -24 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_5[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -56, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -72, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -24, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -32, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -8, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -80, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -56, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -48, -24 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_6[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -40, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -56, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -8, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -16, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 8, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -64, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -32, -24 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -40, -48 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_7[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -24, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -40, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 8, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 0, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 24, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -48, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_8[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -8, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -24, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 24, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 16, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 40, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -32, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_9[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 8, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, -8, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 40, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 32, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 56, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, -16, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_10[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 24, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 8, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 56, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 48, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 72, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 0, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_11[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 40, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 24, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 40, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 72, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 64, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 88, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 16, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_12[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 56, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 40, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 40, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 88, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 80, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 104, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 32, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_13[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 72, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 56, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 40, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 72, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 104, -40 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 96, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 48, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_14[] =
{
    { .header = (u32)(0x0000) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 88, -48 } } },
    { .header = (u32)(0x0000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0024, 72, -40 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 40, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 72, -36 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 112, -32 } } },
    { .header = (u32)(0x0000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0026, 64, -32 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

struct AnimSpriteData CONST_DATA AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_15[] =
{
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -120, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -88, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -56, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, -24, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 8, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 40, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x4000) << 16), .as = { .object = { 0x0004, 72, -36 } } },
    { .header = (u32)(0x4000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 104, -36 } } },
    { .header = (u32)(0x0001) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, 0, 0 } } },
};

AnimScr CONST_DATA AnimScr_EfxLvupOBJ2[] =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_15, 10),
    ANIMSCR_BLOCKED,
};
