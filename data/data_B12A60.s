    .section .data

	.global Img_CommGameBgScreen
Img_CommGameBgScreen:  @ 0x08B12DB4
	.incbin "baserom.gba", 0xB12DB4, 0x4798

	.global Pal_CommGameBgScreenInShop
Pal_CommGameBgScreenInShop:  @ 0x08B1754C
	.incbin "baserom.gba", 0xB1754C, 0x20

	.global Pal_08B1756C
Pal_08B1756C:  @ 0x08B1756C
	.incbin "baserom.gba", 0xB1756C, 0x160

	.global Tsa_08B176CC
Tsa_08B176CC:  @ 0x08B176CC
	.incbin "baserom.gba", 0xB176CC, 0xF4

	.global Img_08B177C0
Img_08B177C0:  @ 0x08B177C0
	.incbin "baserom.gba", 0xB177C0, 0xA4

	.global Img_08B17864
Img_08B17864:  @ 0x08B17864
	.incbin "baserom.gba", 0xB17864, 0x2E0

	.global Pal_08B17B44
Pal_08B17B44:  @ 0x08B17B44
	.incbin "baserom.gba", 0xB17B44, 0x20

	.global Img_ChapterIntro_LensFlare
Img_ChapterIntro_LensFlare:  @ 0x08B17B64
	.incbin "baserom.gba", 0xB17B64, 0x1204

	.global Tsa_08B18D68
Tsa_08B18D68:  @ 0x08B18D68
	.incbin "baserom.gba", 0xB18D68, 0x16C

	.global Pal_ChapterIntro_LensFlare
Pal_ChapterIntro_LensFlare:  @ 0x08B18ED4
	.incbin "baserom.gba", 0xB18ED4, 0x60

	.global Img_ChapterIntro_Fog
Img_ChapterIntro_Fog:  @ 0x08B18F34
	.incbin "baserom.gba", 0xB18F34, 0x7A4

	.global Tsa_ChapterIntro_Fog
Tsa_ChapterIntro_Fog:  @ 0x08B196D8
	.incbin "baserom.gba", 0xB196D8, 0x17C

	.global Pal_ChapterIntro_Fog
Pal_ChapterIntro_Fog:  @ 0x08B19854
	.incbin "baserom.gba", 0xB19854, 0x20

	.global Img_ChapterIntro_Sprites
Img_ChapterIntro_Sprites:  @ 0x08B19874
	.incbin "baserom.gba", 0xB19874, 0x578

	.global Pal_ChapterIntro_Sprites
Pal_ChapterIntro_Sprites:  @ 0x08B19DEC
	.incbin "baserom.gba", 0xB19DEC, 0x20
