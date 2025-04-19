	.section .data

	.global gGfx_TitleMainBackground_1
gGfx_TitleMainBackground_1:  @ 0x08AA7760
	.incbin "graphics/titlescreen/title_main_background_1.4bpp.lz" 	
	.align 2, 0

	.global gGfx_TitleMainBackground_2
gGfx_TitleMainBackground_2:  @ 0x08AA9708
	.incbin "graphics/titlescreen/title_main_background_2.4bpp.lz" 	
	.align 2, 0

	.global gTsa_TitleMainBackground
gTsa_TitleMainBackground:  @ 0x08AAAE90
	.incbin "graphics/titlescreen/title_main_background_tsa.bin"

	.global gPal_TitleMainBackground
gPal_TitleMainBackground:  @ 0x08AAB3F4
	.incbin "graphics/titlescreen/title_main_background.gbapal"

	.global gGfx_TitleDragonForeground
gGfx_TitleDragonForeground:  @ 0x08AAB414
	.incbin "graphics/titlescreen/title_dragon_foreground.4bpp.lz" 	
	.align 2, 0

	.global gTsa_TitleDragonForeground
gTsa_TitleDragonForeground:  @ 0x08AAC2A4
	.incbin "graphics/titlescreen/title_dragon_foreground_tsa.bin" 	
	.global gPal_TitleDragonForeground
gPal_TitleDragonForeground:  @ 0x08AAC58C
	.incbin "graphics/titlescreen/title_dragon_foreground.gbapal" 	
	.align 2, 0

	.global gGfx_FireEmblemLogo
gGfx_FireEmblemLogo:  @ 0x08AAC5AC
	.incbin "graphics/titlescreen/title_fire_emblem_logo.4bpp.lz"
	.align 2, 0
	
	.global gGfx_SubtitlePressStart
gGfx_SubtitlePressStart:  @ 0x08AACEDC
	.incbin "graphics/titlescreen/title_logos.4bpp.lz"
	.align 2, 0

	.global gPal_PressStart
gPal_PressStart:  @ 0x08AADB68
	.incbin "graphics/titlescreen/title_press_start.gbapal"
	.incbin "graphics/titlescreen/title_copyright.gbapal"
	.incbin "graphics/titlescreen/title_fire_emblem_logo.gbapal"
	.incbin "graphics/titlescreen/title_scared_strones_banner.gbapal"

	.global gPal_08AADBE8
gPal_08AADBE8:  @ 0x08AADBE8
	.incbin "baserom.gba", 0xAADBE8, 0x20

	.global gGfx_08AADC08
gGfx_08AADC08:  @ 0x08AADC08
	.incbin "baserom.gba", 0xAADC08, 0xA14

	.global gTsa_08AAE61C
gTsa_08AAE61C:  @ 0x08AAE61C
	.incbin "baserom.gba", 0xAAE61C, 0x2B0

	.global gPal_08AAE8CC
gPal_08AAE8CC:  @ 0x08AAE8CC
	.incbin "baserom.gba", 0xAAE8CC, 0x20

	.global gGfx_08AAE8EC
gGfx_08AAE8EC:  @ 0x08AAE8EC
	.incbin "baserom.gba", 0xAAE8EC, 0x103C

	.global gTsa_08AAF928
gTsa_08AAF928:  @ 0x08AAF928
	.incbin "baserom.gba", 0xAAF928, 0x3CC

	.global gPal_08AAFCF4
gPal_08AAFCF4:  @ 0x08AAFCF4
	.incbin "baserom.gba", 0xAAFCF4, 0x20

	.global gGfx_08AAFD14
gGfx_08AAFD14:  @ 0x08AAFD14
	.incbin "baserom.gba", 0xAAFD14, 0x1FC

	.global gTsa_08AAFF10
gTsa_08AAFF10:  @ 0x08AAFF10
	.incbin "baserom.gba", 0xAAFF10, 0x204

	.global gPal_08AB0114
gPal_08AB0114:  @ 0x08AB0114
	.incbin "baserom.gba", 0xAB0114, 0x20

	.global gGfx_08AB0134
gGfx_08AB0134:  @ 0x08AB0134
	.incbin "baserom.gba", 0xAB0134, 0x8EC

	.global gTsa_08AB0A20
gTsa_08AB0A20:  @ 0x08AB0A20
	.incbin "baserom.gba", 0xAB0A20, 0x104

	.global gPal_08AB0B24
gPal_08AB0B24:  @ 0x08AB0B24
	.incbin "baserom.gba", 0xAB0B24, 0x20

	.global gGfx_TitleDemonKing
gGfx_TitleDemonKing:  @ 0x08AB0B44
	.incbin "graphics/titlescreen/title_demon_king.4bpp.lz"
	.align 2, 0

	.global gTsa_TitleDemonKing
gTsa_TitleDemonKing:  @ 0x08AB1890
	.incbin "graphics/titlescreen/title_demon_king_tsa.bin"

	.global gPal_TitleDemonKing
gPal_TitleDemonKing:  @ 0x08AB1C04
	.incbin "graphics/titlescreen/title_demon_king.gbapal"

	.global gGfx_TitleLargeGlowingOrb
gGfx_TitleLargeGlowingOrb:  @ 0x08AB1C24
	.incbin "graphics/titlescreen/title_large_glowing_orb.4bpp.lz"
	.align 2, 0

	.global gPal_TitleLargeGlowingOrb
gPal_TitleLargeGlowingOrb:  @ 0x08AB210C
	.incbin "graphics/titlescreen/title_large_glowing_orb.gbapal"
	.incbin "baserom.gba", 0xAB212C, 0x40

	.global gGfx_TitleSmallLightBubbles
gGfx_TitleSmallLightBubbles:  @ 0x08AB216C
	.incbin "graphics/titlescreen/title_small_light_bubbles.4bpp.lz"
	.align 2, 0

	.global gPal_TitleSmallLightBubbles
gPal_TitleSmallLightBubbles:  @ 0x08AB21B8
	.incbin "graphics/titlescreen/title_small_light_bubbles.gbapal"
