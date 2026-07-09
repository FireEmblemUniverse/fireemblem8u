#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/data_A01CC4.s into .data.
 */

u16 CONST_DATA Pal_FaceDisplayPortrait[] = INCBIN_U16("graphics/misc/gUnknown_08A01EE4.4bpp");
u16 CONST_DATA Pal_FaceDisplayGenericCard[] = INCBIN_U16("graphics/misc/gUnknown_08A01F04.4bpp");
u8 CONST_DATA gUnkData_32[] = INCBIN_U8("graphics/misc/gUnknown_08A01F24.4bpp.lz");
u8 CONST_DATA Img_StatscreenEquipmentText[] = INCBIN_U8("graphics/statscreen/StatscreenEquipmentText.4bpp.lz");
u16 CONST_DATA Pal_StatscreenEquipmentText[] = INCBIN_U16("graphics/statscreen/StatscreenEquipmentText.gbapal");
u8 CONST_DATA Tsa_StatscreenEquipmentBG[] = INCBIN_U8("graphics/statscreen/StatscreenEquipmentBG.bin.lz");
u8 CONST_DATA Tsa_StatscreenEquipedWeaponHighlight[] = INCBIN_U8("graphics/statscreen/StatscreenEquipedWeaponHighlight.bin");
u8 CONST_DATA __attribute__((aligned(4))) Img_StatscreenObjs[] = INCBIN_U8("graphics/statscreen/StatscreenObjs.4bpp.lz");
u16 CONST_DATA gPal_StatscreenPageNameAnim[][0x10] = INCBIN_U16("graphics/misc/gUnknown_08A027FC.4bpp");
u8 gGfx_HelpTextBox[] = INCBIN_U8("graphics/misc/gGfx_HelpTextBox.4bpp.lz");
u8 gGfx_HelpTextBox2[] = INCBIN_U8("graphics/misc/gGfx_HelpTextBox2.4bpp.lz");
u8 gGfx_HelpTextBox3[] = INCBIN_U8("graphics/misc/gGfx_HelpTextBox3.4bpp.lz");
u8 gGfx_HelpTextBox4[] = INCBIN_U8("graphics/misc/gGfx_HelpTextBox4.4bpp.lz");
u8 gGfx_HelpTextBox5[] = INCBIN_U8("graphics/misc/gGfx_HelpTextBox5.4bpp.lz");
u8 gGfx_YellowTextBox[] = INCBIN_U8("graphics/misc/gGfx_YellowTextBox.4bpp.lz");
u8 gGfx_YellowTextBox2[] = INCBIN_U8("graphics/misc/gGfx_YellowTextBox2.4bpp.lz");
u8 gGfx_YellowTextBox3[] = INCBIN_U8("graphics/misc/gGfx_YellowTextBox3.4bpp.lz");
u8 gGfx_YellowTextBox4[] = INCBIN_U8("graphics/misc/gGfx_YellowTextBox4.4bpp.lz");
u8 gGfx_YellowTextBox5[] = INCBIN_U8("graphics/misc/gGfx_YellowTextBox5.4bpp.lz");
/* 6 uniform 4-tile animation frames; frame 5 was formerly the separate gUnkData_34. */
u8 CONST_DATA Img_LimitViewSquares[] = INCBIN_U8("graphics/misc/Img_LimitViewSquares.4bpp");
u16 Pal_LimitViewBlue[] = INCBIN_U16("graphics/misc/gUnknown_08A02F34.4bpp");
u16 Pal_LimitViewRed[] = INCBIN_U16("graphics/misc/gUnknown_08A02F94.4bpp");
u16 Pal_LimitViewGreen[] = INCBIN_U16("graphics/misc/gUnknown_08A02FF4.4bpp");
u8 CONST_DATA gImg_PathArrow[] = INCBIN_U8("graphics/misc/gUnknown_08A03054.4bpp.lz");
u8 CONST_DATA gPal_PathArrow[] = INCBIN_U8("graphics/misc/gUnknown_08A0328C.4bpp");
u8 Img_StatusHealEffectBg[] = INCBIN_U8("graphics/misc/gUnknown_08A032AC.4bpp.lz");
u8 Pal_StatusHealEffectBg[] = INCBIN_U8("graphics/misc/gUnknown_08A03334.4bpp");
u16 Tsa_StatusHealEffectBg[] = INCBIN_U16("graphics/misc/gUnkData_42.tsa.bin");
u8 CONST_DATA Img_StatscreenBG[] = INCBIN_U8("graphics/statscreen/StatscreenBG.4bpp.lz");
u8 CONST_DATA Tsa_StatscreenBG[] = INCBIN_U8("graphics/statscreen/StatscreenBG.bin.lz");
u16 CONST_DATA Pal_StatscreenBG[] = INCBIN_U16("graphics/statscreen/StatscreenBG.gbapal");
u8 CONST_DATA Img_StatscreenHalo[] = INCBIN_U8("graphics/statscreen/StatscreenHalo.4bpp.lz");
u8 CONST_DATA Tsa_StatscreenHalo[] = INCBIN_U8("graphics/statscreen/StatscreenHalo.bin.lz");
u16 CONST_DATA Pal_StatscreenHalo[] = INCBIN_U16("graphics/statscreen/StatscreenHalo.gbapal");
u8 Img_ConfigUiSprites[] = INCBIN_U8("graphics/misc/Img_ConfigUiSprites.4bpp.lz");
u8 Img_ConfigUiIcons[] = INCBIN_U8("graphics/misc/Img_ConfigUiIcons.4bpp.lz");
u8 Tsa_ConfigUiFrame[] = INCBIN_U8("graphics/misc/Tsa_ConfigUiFrame.tsa.bin.lz");
u16 Pal_ConfigUiSprites[] = INCBIN_U16("graphics/misc/Pal_ConfigUiSprites.gbapal");
u16 Pal_ChapterTitleAlt[] = INCBIN_U16("graphics/misc/gPal_08A07AD8.gbapal");
u8 gPal_SaveSlotHardSelectedBlendA[] = INCBIN_U8("graphics/misc/gUnknown_08A07AEA.4bpp");
u8 gPal_SaveSlotHardUnselectedBlendA[] = INCBIN_U8("graphics/misc/gUnknown_08A07B0A.4bpp");
u8 gPal_SaveSlotHardSelectedBlendB[] = INCBIN_U8("graphics/misc/gUnknown_08A07BEA.4bpp");
u16 gPal_SaveSlotHardUnselectedBlendB[] = { 0x39F3, 0x0443, 0x3E11, 0x52D7, 0x4A98, 0x290A, 0x5F3D, 0x520E, 0x677D, 0x296A, 0x31AC, 0x39EE, 0x4230, 0x4A52, 0x5294, 0x5AD6, 0x6318, 0x2109, 0x3E11, 0x52D7, 0x5AD6, 0x212A, 0x6F7B, 0x520E, 0x52D8, 0x0CA3, 0x10C4, 0x1906, 0x2148, 0x296A, 0x31AC, 0x39CE, 0x4210, 0x0443, 0x3E11, 0x52D7, 0x5AD6, 0x212A, 0x6F7B };
u16 Pal_ChapterTitleMain[] = INCBIN_U16("graphics/misc/gPal_08A07C58.gbapal");
u16 CONST_DATA Img_ChapterIntroFog[] = INCBIN_U16("graphics/misc/Img_ChapterIntroFog.4bpp.lz");
u16 Pal_PlayerRankFog[] = INCBIN_U16("graphics/misc/Pal_PlayerRankFog.agbpal");
/* PlayerRankFog (orphaned): Img_PlayerRankFog is the 16-tile 4bpp gfx; its AP
 * object-animation SpriteAnim_PlayerRankFog lives in spriteanim_playerrankfog.s
 * (offset tables computed via assembler label arithmetic; see include/ap.h). */
u8 Img_PlayerRankFog[] = INCBIN_U8("graphics/misc/Img_PlayerRankFog.4bpp.lz");
