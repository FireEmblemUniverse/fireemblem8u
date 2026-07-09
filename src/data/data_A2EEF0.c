#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/data_A2EEF0.s into .data.
 */

u8 gImg_ClassIntroNameSprites[] = INCBIN_U8("graphics/misc/gUnknown_08A301B0.4bpp.lz");
u16 gPal_ClassIntroNameSprites[] = INCBIN_U16("graphics/misc/gUnknown_08A30780.4bpp");
u8 Img_ClassChangeSelectUi[] = INCBIN_U8("graphics/misc/gUnknown_08A30800.4bpp.lz");
u16 Tsa_ClassChangeSelectUi[] = INCBIN_U16("graphics/misc/gUnkData_84.tsa.bin");
u8 gImg_ClassReelInfoBg[] = INCBIN_U8("graphics/misc/gUnknown_08A30E2C.4bpp.lz");
u8 gTsa_ClassReelInfoBg[] = INCBIN_U8("graphics/misc/gUnkData_86.tsa.bin");
u16 gPal_ClassReelInfoBg[] = INCBIN_U16("graphics/misc/gUnknown_08A3593C.4bpp");
u8 gImg_ClassIntroBg1[] = INCBIN_U8("graphics/misc/gUnknown_08A35A3C.4bpp.lz");
u8 gTsa_ClassIntroBg1[] = INCBIN_U8("graphics/misc/gUnkData_89.tsa.bin.lz");
u16 gPal_ClassIntroBg1[] = INCBIN_U16("graphics/misc/gUnknown_08A360C8.4bpp");
u8 gImg_ClassIntroBg0[] = INCBIN_U8("graphics/misc/gUnknown_08A360E8.4bpp.lz");
u8 gTsa_ClassIntroBg0[] = INCBIN_U8("graphics/misc/gUnkData_92.tsa.bin.lz");
u16 gUnkData_93[] = INCBIN_U16("graphics/misc/gUnknown_08A36318.gbapal");
u8 Img_ClassReelFont[] = INCBIN_U8("graphics/misc/gUnknown_08A36338.4bpp.lz");
u8 Pal_ClassReelFont[] = INCBIN_U8("graphics/misc/gUnknown_08A372C0.4bpp");
u16 gPal_ClassIntroLetterFont[] = INCBIN_U16("graphics/misc/gUnknown_08A37300.agbpal");

/* Class-reel (promotion-info) letter/glyph font: 64 separately LZ77-compressed
 * 4bpp glyphs, char-indexed by gOpinfo_1[*str] and decompressed at runtime. Each was a
 * concatenated LZ block inside gUnknown_08A37300.agbpal after its 16-colour palette;
 * extracted to per-glyph PNG sources (graphics/misc/opinfo_letter/, -mindist 2). */
u8 gOpinfoLetter_00[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_00.4bpp.lz");
u8 gOpinfoLetter_01[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_01.4bpp.lz");
u8 gOpinfoLetter_02[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_02.4bpp.lz");
u8 gOpinfoLetter_03[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_03.4bpp.lz");
u8 gOpinfoLetter_04[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_04.4bpp.lz");
u8 gOpinfoLetter_05[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_05.4bpp.lz");
u8 gOpinfoLetter_06[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_06.4bpp.lz");
u8 gOpinfoLetter_07[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_07.4bpp.lz");
u8 gOpinfoLetter_08[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_08.4bpp.lz");
u8 gOpinfoLetter_09[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_09.4bpp.lz");
u8 gOpinfoLetter_10[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_10.4bpp.lz");
u8 gOpinfoLetter_11[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_11.4bpp.lz");
u8 gOpinfoLetter_12[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_12.4bpp.lz");
u8 gOpinfoLetter_13[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_13.4bpp.lz");
u8 gOpinfoLetter_14[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_14.4bpp.lz");
u8 gOpinfoLetter_15[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_15.4bpp.lz");
u8 gOpinfoLetter_16[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_16.4bpp.lz");
u8 gOpinfoLetter_17[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_17.4bpp.lz");
u8 gOpinfoLetter_18[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_18.4bpp.lz");
u8 gOpinfoLetter_19[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_19.4bpp.lz");
u8 gOpinfoLetter_20[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_20.4bpp.lz");
u8 gOpinfoLetter_21[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_21.4bpp.lz");
u8 gOpinfoLetter_22[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_22.4bpp.lz");
u8 gOpinfoLetter_23[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_23.4bpp.lz");
u8 gOpinfoLetter_24[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_24.4bpp.lz");
u8 gOpinfoLetter_25[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_25.4bpp.lz");
u8 gOpinfoLetter_26[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_26.4bpp.lz");
u8 gOpinfoLetter_27[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_27.4bpp.lz");
u8 gOpinfoLetter_28[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_28.4bpp.lz");
u8 gOpinfoLetter_29[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_29.4bpp.lz");
u8 gOpinfoLetter_30[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_30.4bpp.lz");
u8 gOpinfoLetter_31[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_31.4bpp.lz");
u8 gOpinfoLetter_32[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_32.4bpp.lz");
u8 gOpinfoLetter_33[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_33.4bpp.lz");
u8 gOpinfoLetter_34[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_34.4bpp.lz");
u8 gOpinfoLetter_35[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_35.4bpp.lz");
u8 gOpinfoLetter_36[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_36.4bpp.lz");
u8 gOpinfoLetter_37[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_37.4bpp.lz");
u8 gOpinfoLetter_38[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_38.4bpp.lz");
u8 gOpinfoLetter_39[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_39.4bpp.lz");
u8 gOpinfoLetter_40[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_40.4bpp.lz");
u8 gOpinfoLetter_41[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_41.4bpp.lz");
u8 gOpinfoLetter_42[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_42.4bpp.lz");
u8 gOpinfoLetter_43[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_43.4bpp.lz");
u8 gOpinfoLetter_44[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_44.4bpp.lz");
u8 gOpinfoLetter_45[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_45.4bpp.lz");
u8 gOpinfoLetter_46[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_46.4bpp.lz");
u8 gOpinfoLetter_47[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_47.4bpp.lz");
u8 gOpinfoLetter_48[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_48.4bpp.lz");
u8 gOpinfoLetter_49[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_49.4bpp.lz");
u8 gOpinfoLetter_50[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_50.4bpp.lz");
u8 gOpinfoLetter_51[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_51.4bpp.lz");
u8 gOpinfoLetter_52[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_52.4bpp.lz");
u8 gOpinfoLetter_53[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_53.4bpp.lz");
u8 gOpinfoLetter_54[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_54.4bpp.lz");
u8 gOpinfoLetter_55[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_55.4bpp.lz");
u8 gOpinfoLetter_56[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_56.4bpp.lz");
u8 gOpinfoLetter_57[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_57.4bpp.lz");
u8 gOpinfoLetter_58[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_58.4bpp.lz");
u8 gOpinfoLetter_59[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_59.4bpp.lz");
u8 gOpinfoLetter_60[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_60.4bpp.lz");
u8 gOpinfoLetter_61[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_61.4bpp.lz");
u8 gOpinfoLetter_62[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_62.4bpp.lz");
u8 gOpinfoLetter_63[] = INCBIN_U8("graphics/misc/opinfo_letter/letter_63.4bpp.lz");
