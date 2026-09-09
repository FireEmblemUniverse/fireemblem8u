#include "global.h"

/* Arrays expanded from binary files at build time by tools/preproc (run
 * before cpp). Migrated in-place from data/const_data_1C0AFC.s into .rodata.
 */

u16 SECTION(".rodata") gPal_StoneShatterAnim[] = INCBIN_U16("graphics/misc/gPal_StoneShatterAnim.gbapal");
u8 SECTION(".rodata") gImg_StoneShatterAnim[] = INCBIN_U8("graphics/misc/gImg_StoneShatterAnim.4bpp.lz");
u8 SECTION(".rodata") gTsa_StoneShatter_0[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_0.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_1[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_1.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_2[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_2.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_3[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_3.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_4[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_4.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_5[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_5.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_6[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_6.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_7[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_7.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_8[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_8.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_9[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_9.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_10[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_10.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_11[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_11.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_12[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_12.tsa.bin");
u8 SECTION(".rodata") gTsa_StoneShatter_13[] = INCBIN_U8("graphics/misc/gTsa_StoneShatter_13.tsa.bin");

/* Unused leftover data: the Japanese version's terrain notation table
 * ("地形の日本語表記", FEBuilder 0x081C1D28), a pool of NUL-padded
 * Shift-JIS terrain names. It was concatenated onto the end of the .map.bin
 * that gTsa_StoneShatter_13 was mis-extracted from; it is not referenced in
 * FE8U (the apparent pointer to it is coincidental s8 data in Unk_TerrainTable_11).
 * Emitted as UTF-8 literals; the build's iconv(UTF-8->CP932) yields the exact bytes. */
const char SECTION(".rodata") JapaneseTerrainNames[408] =
    "マスト\0\0"            /* +0x000 */
    "支柱\0\0\0\0"         /* +0x008 */
    "甲板\0\0\0\0"         /* +0x010 */
    "舷\0\0"              /* +0x018 */
    "水\0\0"              /* +0x01C */
    "闇\0\0"              /* +0x020 */
    "骨\0\0"              /* +0x024 */
    "タル\0\0\0\0"         /* +0x028 */
    "酒場\0\0\0\0"         /* +0x030 */
    "遺跡\0\0\0\0"         /* +0x038 */
    "深海\0\0\0\0"         /* +0x040 */
    "空\0\0"              /* +0x048 */
    "丸太橋\0\0"            /* +0x04C */
    "古木\0\0\0\0"         /* +0x054 */
    "谷\0\0"              /* +0x05C */
    "通信闘技\0\0\0\0"       /* +0x060 */
    "氷河\0\0\0\0"         /* +0x06C */
    "階段\0\0\0\0"         /* +0x074 */
    "壊れた家\0\0\0\0"       /* +0x07C */
    "荒地\0\0\0\0"         /* +0x088 */
    "キラー\0\0"            /* +0x090 */
    "ロング\0\0"            /* +0x098 */
    "アーチ\0\0"            /* +0x0A0 */
    "がけ\0\0\0\0"         /* +0x0A8 */
    "廃墟\0\0\0\0"         /* +0x0B0 */
    "教会\0\0\0\0"         /* +0x0B8 */
    "門\0\0"              /* +0x0C0 */
    "屋根\0\0\0\0"         /* +0x0C4 */
    "宝箱\0\0\0\0"         /* +0x0CC */
    "空宝箱\0\0"            /* +0x0D4 */
    "玉座\0\0\0\0"         /* +0x0DC */
    "扉\0\0"              /* +0x0E4 */
    "柱\0\0"              /* +0x0E8 */
    "壊れた壁\0\0\0\0"       /* +0x0EC */
    "壁\0\0"              /* +0x0F8 */
    "塀\0\0"              /* +0x0FC */
    "床\0\0"              /* +0x100 */
    "湖\0\0"              /* +0x104 */
    "海\0\0"              /* +0x108 */
    "はね橋\0\0"            /* +0x10C */
    "橋\0\0"              /* +0x114 */
    "高い山\0\0"            /* +0x118 */
    "山\0\0"              /* +0x120 */
    "川\0\0"              /* +0x124 */
    "砂漠\0\0\0\0"         /* +0x128 */
    "砂地\0\0\0\0"         /* +0x130 */
    "深い森\0\0"            /* +0x138 */
    "森\0\0"              /* +0x140 */
    "城門\0\0\0\0"         /* +0x144 */
    "砦\0\0"              /* +0x14C */
    "預り所\0\0"            /* +0x150 */
    "闘技場\0\0"            /* +0x158 */
    "道具屋\0\0"            /* +0x160 */
    "武器屋\0\0"            /* +0x168 */
    "民家\0\0\0\0"         /* +0x170 */
    "閉じ村\0\0"            /* +0x178 */
    "村\0\0"              /* +0x180 */
    "道\0\0"              /* +0x184 */
    "平地\0\0\0\0"         /* +0x188 */
    "ーー\0\0\0\0"         /* +0x190 */;
