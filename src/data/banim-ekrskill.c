#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/banim-ekrskill.s into .data.
 */

u8 Img_EfxSkill1[] = INCBIN_U8("graphics/efxskill/efxskill_1.feimg1.bin.lz");
u8 Img_EfxSkill2[] = INCBIN_U8("graphics/efxskill/efxskill_2.feimg1.bin.lz");
u8 Img_EfxSkill3[] = INCBIN_U8("graphics/efxskill/efxskill_3.feimg1.bin.lz");
u8 Img_EfxSkill4[] = INCBIN_U8("graphics/efxskill/efxskill_4.feimg1.bin.lz");
u8 Img_EfxSkill5[] = INCBIN_U8("graphics/efxskill/efxskill_5.feimg1.bin.lz");
u8 Img_EfxSkill6[] = INCBIN_U8("graphics/efxskill/efxskill_6.feimg1.bin.lz");
u8 Img_EfxSkill7[] = INCBIN_U8("graphics/efxskill/efxskill_7.feimg1.bin.lz");
u8 Img_EfxSkill8[] = INCBIN_U8("graphics/efxskill/efxskill_8.feimg1.bin.lz");
u8 Img_EfxSkill9[] = INCBIN_U8("graphics/efxskill/efxskill_9.feimg1.bin.lz");
u8 Img_EfxSkillA[] = INCBIN_U8("graphics/efxskill/efxskill_10.feimg1.bin.lz");
u8 Img_EfxSkillB[] = INCBIN_U8("graphics/efxskill/efxskill_11.feimg1.bin.lz");
u8 Img_EfxSkillC[] = INCBIN_U8("graphics/efxskill/efxskill_12.feimg1.bin.lz");
u8 Img_EfxSkillD[] = INCBIN_U8("graphics/efxskill/efxskill_13.feimg1.bin.lz");
u8 Img_EfxSkillE[] = INCBIN_U8("graphics/efxskill/efxskill_14.feimg1.bin.lz");
u8 Img_EfxSkillF[] = INCBIN_U8("graphics/efxskill/efxskill_15.feimg1.bin.lz");
u8 Img_EfxSkill10[] = INCBIN_U8("graphics/efxskill/efxskill_16.feimg1.bin.lz");
u16 Pal_EfxSkill1[] = INCBIN_U16("graphics/efxskill/efxskill_1.gbapal");
u16 Pal_EfxSkill2[] = INCBIN_U16("graphics/efxskill/efxskill_2.gbapal");
u16 Pal_EfxSkill3[] = INCBIN_U16("graphics/efxskill/efxskill_3.gbapal");
u16 Pal_EfxSkill4[] = INCBIN_U16("graphics/efxskill/efxskill_4.gbapal");
u16 Pal_EfxSkill5[] = INCBIN_U16("graphics/efxskill/efxskill_5.gbapal");
u16 Pal_EfxSkill6[] = INCBIN_U16("graphics/efxskill/efxskill_6.gbapal");
u16 Pal_EfxSkill7[] = INCBIN_U16("graphics/efxskill/efxskill_7.gbapal");
u16 Pal_EfxSkill8[] = INCBIN_U16("graphics/efxskill/efxskill_8.gbapal");
u16 Pal_EfxSkill9[] = INCBIN_U16("graphics/efxskill/efxskill_9.gbapal");
u16 Pal_EfxSkillA[] = INCBIN_U16("graphics/efxskill/efxskill_10.gbapal");
u16 Pal_EfxSkillB[] = INCBIN_U16("graphics/efxskill/efxskill_11.gbapal");
u16 Pal_EfxSkillC[] = INCBIN_U16("graphics/efxskill/efxskill_12.gbapal");
u16 Pal_EfxSkillD[] = INCBIN_U16("graphics/efxskill/efxskill_13.gbapal");
u16 Pal_EfxSkillE[] = INCBIN_U16("graphics/efxskill/efxskill_14.gbapal");
u16 Pal_EfxSkillF[] = INCBIN_U16("graphics/efxskill/efxskill_15.gbapal");
u16 Pal_EfxSkill10[] = INCBIN_U16("graphics/efxskill/efxskill_16.gbapal");
u8 Tsa_EfxSkill1[] = INCBIN_U8("graphics/efxskill/efxskill_1.fetsa1.bin.lz");
u8 Tsa_EfxSkill2[] = INCBIN_U8("graphics/efxskill/efxskill_2.fetsa1.bin.lz");
u8 Tsa_EfxSkill3[] = INCBIN_U8("graphics/efxskill/efxskill_3.fetsa1.bin.lz");
u8 Tsa_EfxSkill4[] = INCBIN_U8("graphics/efxskill/efxskill_4.fetsa1.bin.lz");
u8 Tsa_EfxSkill5[] = INCBIN_U8("graphics/efxskill/efxskill_5.fetsa1.bin.lz");
u8 Tsa_EfxSkill6[] = INCBIN_U8("graphics/efxskill/efxskill_6.fetsa1.bin.lz");
u8 Tsa_EfxSkill7[] = INCBIN_U8("graphics/efxskill/efxskill_7.fetsa1.bin.lz");
u8 Tsa_EfxSkill8[] = INCBIN_U8("graphics/efxskill/efxskill_8.fetsa1.bin.lz");
u8 Tsa_EfxSkill9[] = INCBIN_U8("graphics/efxskill/efxskill_9.fetsa1.bin.lz");
u8 Tsa_EfxSkillA[] = INCBIN_U8("graphics/efxskill/efxskill_10.fetsa1.bin.lz");
u8 Tsa_EfxSkillB[] = INCBIN_U8("graphics/efxskill/efxskill_11.fetsa1.bin.lz");
u8 Tsa_EfxSkillC[] = INCBIN_U8("graphics/efxskill/efxskill_12.fetsa1.bin.lz");
u8 Tsa_EfxSkillD[] = INCBIN_U8("graphics/efxskill/efxskill_13.fetsa1.bin.lz");
u8 Tsa_EfxSkillE[] = INCBIN_U8("graphics/efxskill/efxskill_14.fetsa1.bin.lz");
u8 Tsa_EfxSkillF[] = INCBIN_U8("graphics/efxskill/efxskill_15.fetsa1.bin.lz");
u8 Tsa_EfxSkill10[] = INCBIN_U8("graphics/efxskill/efxskill_16.fetsa1.bin.lz");
