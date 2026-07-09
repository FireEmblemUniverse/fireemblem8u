.section .data

	.global ApConf_MapAnimBerserkfx
ApConf_MapAnimBerserkfx:  @ 0x089B2108
ApConf_MapAnimBerserkfx_motion:
	.2byte (ApConf_MapAnimBerserkfx_frame_list - ApConf_MapAnimBerserkfx_motion), (ApConf_MapAnimBerserkfx_anim_list - ApConf_MapAnimBerserkfx_motion) @ header

ApConf_MapAnimBerserkfx_frame_list: @ +$4
	.2byte (ApConf_MapAnimBerserkfx_frame_0 - ApConf_MapAnimBerserkfx_frame_list)
	.2byte (ApConf_MapAnimBerserkfx_frame_1 - ApConf_MapAnimBerserkfx_frame_list)
	.2byte (ApConf_MapAnimBerserkfx_frame_2 - ApConf_MapAnimBerserkfx_frame_list)
	.2byte (ApConf_MapAnimBerserkfx_frame_3 - ApConf_MapAnimBerserkfx_frame_list)
	.2byte (ApConf_MapAnimBerserkfx_frame_4 - ApConf_MapAnimBerserkfx_frame_list)
	.2byte (ApConf_MapAnimBerserkfx_frame_5 - ApConf_MapAnimBerserkfx_frame_list)

ApConf_MapAnimBerserkfx_anim_list: @ +$10
	.2byte (ApConf_MapAnimBerserkfx_anim_0 - ApConf_MapAnimBerserkfx_anim_list)

ApConf_MapAnimBerserkfx_frame_0: @ +$12
	.2byte 1 @ oam entries
	.2byte 0x40F9, 0x1E6, 0x0 @ OAM Data #0

ApConf_MapAnimBerserkfx_frame_1: @ +$1A
	.2byte 2 @ oam entries
	.2byte 0xFB, 0x41E4, 0xE @ OAM Data #0
	.2byte 0x80FB, 0x1F4, 0x10 @ OAM Data #1

ApConf_MapAnimBerserkfx_frame_2: @ +$28
	.2byte 2 @ oam entries
	.2byte 0x40FB, 0x81E8, 0x2 @ OAM Data #0
	.2byte 0xFB, 0x4008, 0x6 @ OAM Data #1

ApConf_MapAnimBerserkfx_frame_3: @ +$36
	.2byte 4 @ oam entries
	.2byte 0x40F4, 0x81E7, 0x8 @ OAM Data #0
	.2byte 0xF4, 0x4007, 0xC @ OAM Data #1
	.2byte 0x4004, 0x41E7, 0x17 @ OAM Data #2
	.2byte 0x4, 0x7, 0x1B @ OAM Data #3

ApConf_MapAnimBerserkfx_frame_4: @ +$50
	.2byte 2 @ oam entries
	.2byte 0x40F5, 0x81FB, 0x11 @ OAM Data #0
	.2byte 0x4005, 0x41FB, 0x51 @ OAM Data #1

ApConf_MapAnimBerserkfx_frame_5: @ +$5E
	.2byte 1 @ oam entries
	.2byte 0xF2, 0x4007, 0x15 @ OAM Data #0

ApConf_MapAnimBerserkfx_anim_0: @ +$66
	.2byte  2,  0
	.2byte  2,  1
	.2byte  2,  2
	.2byte  2,  3
	.2byte  2,  4
	.2byte  2,  5
	.2byte  2,  0
	.2byte  2,  1
	.2byte  2,  2
	.2byte  2,  3
	.2byte  2,  4
	.2byte  2,  5
	.2byte  2,  0
	.2byte  2,  1
	.2byte  2,  2
	.2byte  2,  3
	.2byte  2,  4
	.2byte  2,  5
	.2byte  2,  0
	.2byte  2,  1
	.2byte  2,  2
	.2byte  2,  3
	.2byte  2,  4
	.2byte  2,  5

	.2byte 0, 1 @ kill animated object

	.byte 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_ApConf_MapAnimBerserkfx:
	.if (.L_end_ApConf_MapAnimBerserkfx - ApConf_MapAnimBerserkfx) != 208
	.error "ApConf_MapAnimBerserkfx size mismatch"
	.endif

	.global Img_ManimSilenceObjfx
Img_ManimSilenceObjfx:  @ 0x089B21D8
	.incbin "graphics/misc/Img_ManimSilenceObjfx.4bpp.lz"

	.global Img_ManimSilenceBgfx
Img_ManimSilenceBgfx:  @ 0x089B2618
    .incbin "graphics/misc/Img_ManimSilenceBgfx.4bpp.lz"

	.global Pal_ManimSilencefx
Pal_ManimSilencefx:  @ 0x089B2728
	.incbin "graphics/misc/Pal_ManimSilencefx.gbapal"

	.global ApConf_ManimSilencefx
ApConf_ManimSilencefx:  @ 0x089B2748
ApConf_ManimSilencefx_motion:
	.2byte (ApConf_ManimSilencefx_frame_list - ApConf_ManimSilencefx_motion), (ApConf_ManimSilencefx_anim_list - ApConf_ManimSilencefx_motion) @ header

ApConf_ManimSilencefx_frame_list: @ +$4
	.2byte (ApConf_ManimSilencefx_frame_0 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_1 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_2 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_3 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_4 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_5 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_6 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_7 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_8 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_9 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_10 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_11 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_12 - ApConf_ManimSilencefx_frame_list)
	.2byte (ApConf_ManimSilencefx_frame_13 - ApConf_ManimSilencefx_frame_list)

ApConf_ManimSilencefx_anim_list: @ +$20
	.2byte (ApConf_ManimSilencefx_anim_0 - ApConf_ManimSilencefx_anim_list)

ApConf_ManimSilencefx_frame_0: @ +$22
	.2byte 1 @ oam entries
	.2byte 0xFC, 0x1FC, 0x0 @ OAM Data #0

ApConf_ManimSilencefx_frame_1: @ +$2A
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x2 @ OAM Data #0

ApConf_ManimSilencefx_frame_2: @ +$32
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x42 @ OAM Data #0

ApConf_ManimSilencefx_frame_3: @ +$3A
	.2byte 2 @ oam entries
	.2byte 0x40F0, 0x81F0, 0x4 @ OAM Data #0
	.2byte 0x4000, 0xA1F0, 0x4 @ OAM Data #1

ApConf_ManimSilencefx_frame_4: @ +$48
	.2byte 2 @ oam entries
	.2byte 0x80F0, 0x81F0, 0x8 @ OAM Data #0
	.2byte 0x80F0, 0x9000, 0x8 @ OAM Data #1

ApConf_ManimSilencefx_frame_5: @ +$56
	.2byte 1 @ oam entries
	.2byte 0xF0, 0x81F0, 0xA @ OAM Data #0

ApConf_ManimSilencefx_frame_6: @ +$5E
	.2byte 4 @ oam entries
	.2byte 0xE0, 0x8000, 0xE @ OAM Data #0
	.2byte 0xFF, 0xA000, 0xE @ OAM Data #1
	.2byte 0xE0, 0x91E1, 0xE @ OAM Data #2
	.2byte 0xFF, 0xB1E1, 0xE @ OAM Data #3

ApConf_ManimSilencefx_frame_7: @ +$78
	.2byte 1 @ oam entries
	.2byte 0xF0, 0x81F0, 0x12 @ OAM Data #0

ApConf_ManimSilencefx_frame_8: @ +$80
	.2byte 1 @ oam entries
	.2byte 0xF4, 0x81EC, 0x16 @ OAM Data #0

ApConf_ManimSilencefx_frame_9: @ +$88
	.2byte 1 @ oam entries
	.2byte 0xF4, 0x81F0, 0xA @ OAM Data #0

ApConf_ManimSilencefx_frame_10: @ +$90
	.2byte 1 @ oam entries
	.2byte 0xF6, 0x81ED, 0xA @ OAM Data #0

ApConf_ManimSilencefx_frame_11: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xF6, 0x81F3, 0xA @ OAM Data #0

ApConf_ManimSilencefx_frame_12: @ +$A0
	.2byte 1 @ oam entries
	.2byte 0xF1, 0x81EB, 0xA @ OAM Data #0

ApConf_ManimSilencefx_frame_13: @ +$A8
	.2byte 1 @ oam entries
	.2byte 0x0, 0x0, 0x1F @ OAM Data #0

ApConf_ManimSilencefx_anim_0: @ +$B0
	.2byte  4,  6
	.2byte  2,  7
	.2byte  2,  8
	.2byte  1,  9
	.2byte  1, 10
	.2byte  1, 11
	.2byte  1, 12
	.2byte  1,  7
	.2byte  1, 10
	.2byte  1, 11
	.2byte  1, 12
	.2byte  1,  7
	.2byte  1, 10
	.2byte  1,  8
	.2byte  4, 13
	.2byte  1,  9
	.2byte  5, 13
	.2byte  2,  9
	.2byte  2,  7
	.2byte  2, 13
	.2byte  2,  9
	.2byte  2, 13
	.2byte  2,  0
	.2byte  2, 13
	.2byte  1,  7
	.2byte  1, 13
	.2byte  1,  9
	.2byte  1,  7
	.2byte  1,  9
	.2byte  1,  7
	.2byte  1,  9
	.2byte  1,  0

	.2byte 0, 1 @ kill animated object

	.byte 0x00, 0x00, 0xFF, 0xFF  @ trailing anim data not decoded by apdump
.L_end_ApConf_ManimSilencefx:
	.if (.L_end_ApConf_ManimSilencefx - ApConf_ManimSilencefx) != 312
	.error "ApConf_ManimSilencefx size mismatch"
	.endif
