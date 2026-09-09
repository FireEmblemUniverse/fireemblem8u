#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/banim-efxbattle.s into .data.
 */

u16 TsaConf_BanimTmA1[] = INCBIN_U16("graphics/banim/efxbattle/TsaConf_BanimTmA1.map.bin");
u16 TsaConf_BanimTmA2[] = INCBIN_U16("graphics/banim/efxbattle/TsaConf_BanimTmA2.map.bin");
u16 TsaConf_BanimTmA3[] = INCBIN_U16("graphics/banim/efxbattle/TsaConf_BanimTmA3.map.bin");
u16 TsaConf_BanimTmA4[] = INCBIN_U16("graphics/banim/efxbattle/TsaConf_BanimTmA4.map.bin");
u16 Img_NODAMGEMIS[] = INCBIN_U16("graphics/banim/efxbattle/Img_NODAMGEMIS.4bpp.lz");
u16 Pal_Efxbattle_0[] = INCBIN_U16("graphics/banim/efxbattle/Pal_085BA2E0.gbapal");
u16 Pal_Efxbattle_1[] = INCBIN_U16("graphics/banim/efxbattle/Pal_085BA300.gbapal");
u16 Pal_Efxbattle_2[] = INCBIN_U16("graphics/banim/efxbattle/Pal_085BA320.gbapal");

/* This is unused, called in FE7 UnitKakudai1 (although is also unused in FE7) */
u8 Img_BanimArcherFBallistaIntro[] = INCBIN_U8("./graphics/efxbattle/Img_BanimSnipperFBallistaIntro.4bpp.lz");
u8 Img_BanimArcherMBallistaIntro[] = INCBIN_U8("./graphics/efxbattle/Img_BanimSnipperMBallistaIntro.4bpp.lz");
u8 Img_BanimSnipperFBallistaIntro[] = INCBIN_U8("./graphics/efxbattle/Img_BanimSnipperFBallistaIntro.4bpp.lz");
