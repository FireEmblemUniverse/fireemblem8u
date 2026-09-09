.section .data

	.global Pal_WmHighLightNationMap
Pal_WmHighLightNationMap:  @ 0x08A9E688
	.incbin "graphics/misc/Pal_WmHighLightNationMap.gbapal"

    .global Img_WmHightLightMapFrecia
Img_WmHightLightMapFrecia:
    .incbin "graphics/world_map/nations/Gfx_WmNationFrecia.4bpp.lz"

    .global Ap_WmHightLightMapFrecia
Ap_WmHightLightMapFrecia:
Ap_WmHightLightMapFrecia_motion:
	.2byte (Ap_WmHightLightMapFrecia_frame_list - Ap_WmHightLightMapFrecia_motion), (Ap_WmHightLightMapFrecia_anim_list - Ap_WmHightLightMapFrecia_motion) @ header

Ap_WmHightLightMapFrecia_frame_list: @ +$4
	.2byte (Ap_WmHightLightMapFrecia_frame_0 - Ap_WmHightLightMapFrecia_frame_list)
	.2byte (Ap_WmHightLightMapFrecia_frame_1 - Ap_WmHightLightMapFrecia_frame_list)

Ap_WmHightLightMapFrecia_anim_list: @ +$8
	.2byte (Ap_WmHightLightMapFrecia_anim_0 - Ap_WmHightLightMapFrecia_anim_list)
	.2byte (Ap_WmHightLightMapFrecia_anim_1 - Ap_WmHightLightMapFrecia_anim_list)

Ap_WmHightLightMapFrecia_frame_0: @ +$C
	.2byte 10 @ oam entries
	.2byte 0x40DF, 0xC1C9, 0x0 @ OAM Data #0
	.2byte 0xDF, 0x8009, 0x8 @ OAM Data #1
	.2byte 0x40FF, 0xC1D1, 0xE @ OAM Data #2
	.2byte 0x401F, 0x81D9, 0x1A @ OAM Data #3
	.2byte 0x801F, 0x1F9, 0x1E @ OAM Data #4
	.2byte 0x40FF, 0x8011, 0x16 @ OAM Data #5
	.2byte 0xEF, 0x4029, 0x4C @ OAM Data #6
	.2byte 0xE7, 0x29, 0x2C @ OAM Data #7
	.2byte 0xF, 0x11, 0xC @ OAM Data #8
	.2byte 0x1F, 0x1D1, 0x1F @ OAM Data #9

Ap_WmHightLightMapFrecia_frame_1: @ +$4A
	.2byte 3 @ oam entries
	.2byte 0x40F9, 0x81E6, 0x56 @ OAM Data #0
	.2byte 0xF9, 0x4006, 0x5A @ OAM Data #1
	.2byte 0x80F9, 0x16, 0x5C @ OAM Data #2

Ap_WmHightLightMapFrecia_anim_0: @ +$5E
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMapFrecia_anim_1: @ +$66
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_Ap_WmHightLightMapFrecia:
	.if (.L_end_Ap_WmHightLightMapFrecia - Ap_WmHightLightMapFrecia) != 112
	.error "Ap_WmHightLightMapFrecia size mismatch"
	.endif

    .global Img_WmHightLightMap2
Img_WmHightLightMap2:
    .incbin "graphics/misc/Img_WmHightLightMap2.4bpp.lz"

    .global Ap_WmHightLightMap2
Ap_WmHightLightMap2:
Ap_WmHightLightMap2_motion:
	.2byte (Ap_WmHightLightMap2_frame_list - Ap_WmHightLightMap2_motion), (Ap_WmHightLightMap2_anim_list - Ap_WmHightLightMap2_motion) @ header

Ap_WmHightLightMap2_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap2_frame_0 - Ap_WmHightLightMap2_frame_list)
	.2byte (Ap_WmHightLightMap2_frame_1 - Ap_WmHightLightMap2_frame_list)

Ap_WmHightLightMap2_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap2_anim_0 - Ap_WmHightLightMap2_anim_list)
	.2byte (Ap_WmHightLightMap2_anim_1 - Ap_WmHightLightMap2_anim_list)

Ap_WmHightLightMap2_frame_0: @ +$C
	.2byte 41 @ oam entries
	.2byte 0x40F8, 0x81B7, 0x40 @ OAM Data #0
	.2byte 0xF8, 0x41F7, 0x48 @ OAM Data #1
	.2byte 0x80F8, 0x27, 0x9 @ OAM Data #2
	.2byte 0x4018, 0x41CF, 0x50 @ OAM Data #3
	.2byte 0x4018, 0x81EF, 0x54 @ OAM Data #4
	.2byte 0x4018, 0x800F, 0x58 @ OAM Data #5
	.2byte 0x4008, 0x81B7, 0x10 @ OAM Data #6
	.2byte 0x4008, 0x81D7, 0x14 @ OAM Data #7
	.2byte 0x8, 0x403F, 0x1E @ OAM Data #8
	.2byte 0x40D8, 0x81BF, 0x18 @ OAM Data #9
	.2byte 0xD8, 0x41DF, 0x1C @ OAM Data #10
	.2byte 0x40E0, 0x41EF, 0x70 @ OAM Data #11
	.2byte 0xC8, 0x41D7, 0x4A @ OAM Data #12
	.2byte 0xE8, 0x41D7, 0x4 @ OAM Data #13
	.2byte 0xE8, 0x41E7, 0x6 @ OAM Data #14
	.2byte 0xE8, 0x4007, 0xA @ OAM Data #15
	.2byte 0xE8, 0x4017, 0xC @ OAM Data #16
	.2byte 0x40F0, 0x27, 0x2E @ OAM Data #17
	.2byte 0xE8, 0x41F7, 0x6 @ OAM Data #18
	.2byte 0xF8, 0x4007, 0x6 @ OAM Data #19
	.2byte 0xF8, 0x4017, 0x6 @ OAM Data #20
	.2byte 0x80E8, 0x1BF, 0x1 @ OAM Data #21
	.2byte 0xF0, 0x1B7, 0x20 @ OAM Data #22
	.2byte 0xE8, 0x41C7, 0x2 @ OAM Data #23
	.2byte 0x8, 0x41FF, 0x6 @ OAM Data #24
	.2byte 0x8, 0x400F, 0x6 @ OAM Data #25
	.2byte 0x8, 0x401F, 0x6 @ OAM Data #26
	.2byte 0x8, 0x402F, 0x6 @ OAM Data #27
	.2byte 0x18, 0x402F, 0x5C @ OAM Data #28
	.2byte 0x8018, 0x3F, 0x5E @ OAM Data #29
	.2byte 0x18, 0x47, 0x5F @ OAM Data #30
	.2byte 0xF0, 0x37, 0x7F @ OAM Data #31
	.2byte 0xF8, 0x402F, 0x4C @ OAM Data #32
	.2byte 0x4000, 0x3F, 0x6E @ OAM Data #33
	.2byte 0xF8, 0x3F, 0x4E @ OAM Data #34
	.2byte 0x18, 0x1C7, 0xE @ OAM Data #35
	.2byte 0xD0, 0x1CF, 0xF @ OAM Data #36
	.2byte 0x8008, 0x1F7, 0x8 @ OAM Data #37
	.2byte 0xF8, 0x41E7, 0x46 @ OAM Data #38
	.2byte 0x40F8, 0x1D7, 0x44 @ OAM Data #39
	.2byte 0x4028, 0x2F, 0x64 @ OAM Data #40

Ap_WmHightLightMap2_frame_1: @ +$104
	.2byte 6 @ oam entries
	.2byte 0x40F9, 0x41E7, 0x80 @ OAM Data #0
	.2byte 0x40F9, 0x7, 0x84 @ OAM Data #1
	.2byte 0xF9, 0x17, 0x86 @ OAM Data #2
	.2byte 0x4001, 0x41E7, 0x87 @ OAM Data #3
	.2byte 0x4001, 0x7, 0x8B @ OAM Data #4
	.2byte 0x1, 0x17, 0x8D @ OAM Data #5

Ap_WmHightLightMap2_anim_0: @ +$12A
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap2_anim_1: @ +$132
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_Ap_WmHightLightMap2:
	.if (.L_end_Ap_WmHightLightMap2 - Ap_WmHightLightMap2) != 316
	.error "Ap_WmHightLightMap2 size mismatch"
	.endif

    .global Img_WmHightLightMap3
Img_WmHightLightMap3:
    .incbin "graphics/misc/Img_WmHightLightMap3.4bpp.lz"

    .global Ap_WmHightLightMap3
Ap_WmHightLightMap3:
Ap_WmHightLightMap3_motion:
	.2byte (Ap_WmHightLightMap3_frame_list - Ap_WmHightLightMap3_motion), (Ap_WmHightLightMap3_anim_list - Ap_WmHightLightMap3_motion) @ header

Ap_WmHightLightMap3_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap3_frame_0 - Ap_WmHightLightMap3_frame_list)
	.2byte (Ap_WmHightLightMap3_frame_1 - Ap_WmHightLightMap3_frame_list)

Ap_WmHightLightMap3_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap3_anim_0 - Ap_WmHightLightMap3_anim_list)
	.2byte (Ap_WmHightLightMap3_anim_1 - Ap_WmHightLightMap3_anim_list)

Ap_WmHightLightMap3_frame_0: @ +$C
	.2byte 8 @ oam entries
	.2byte 0x40EB, 0xC1D9, 0x0 @ OAM Data #0
	.2byte 0x80EB, 0x8019, 0x8 @ OAM Data #1
	.2byte 0x80EB, 0x4029, 0xA @ OAM Data #2
	.2byte 0x400B, 0xC1D9, 0xB @ OAM Data #3
	.2byte 0x40DB, 0x81E1, 0x15 @ OAM Data #4
	.2byte 0x40DB, 0x8001, 0x19 @ OAM Data #5
	.2byte 0xB, 0x4019, 0x13 @ OAM Data #6
	.2byte 0xFB, 0x31, 0x1D @ OAM Data #7

Ap_WmHightLightMap3_frame_1: @ +$3E
	.2byte 3 @ oam entries
	.2byte 0x40F8, 0x81DF, 0x53 @ OAM Data #0
	.2byte 0x40F8, 0x81FF, 0x57 @ OAM Data #1
	.2byte 0x80F8, 0x1F, 0x5B @ OAM Data #2

Ap_WmHightLightMap3_anim_0: @ +$52
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap3_anim_1: @ +$5A
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_Ap_WmHightLightMap3:
	.if (.L_end_Ap_WmHightLightMap3 - Ap_WmHightLightMap3) != 100
	.error "Ap_WmHightLightMap3 size mismatch"
	.endif

    .global Img_WmHightLightMap4
Img_WmHightLightMap4:
    .incbin "graphics/misc/Img_WmHightLightMap4.4bpp.lz"

    .global Ap_WmHightLightMap4
Ap_WmHightLightMap4:
Ap_WmHightLightMap4_motion:
	.2byte (Ap_WmHightLightMap4_frame_list - Ap_WmHightLightMap4_motion), (Ap_WmHightLightMap4_anim_list - Ap_WmHightLightMap4_motion) @ header

Ap_WmHightLightMap4_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap4_frame_0 - Ap_WmHightLightMap4_frame_list)
	.2byte (Ap_WmHightLightMap4_frame_1 - Ap_WmHightLightMap4_frame_list)

Ap_WmHightLightMap4_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap4_anim_0 - Ap_WmHightLightMap4_anim_list)
	.2byte (Ap_WmHightLightMap4_anim_1 - Ap_WmHightLightMap4_anim_list)

Ap_WmHightLightMap4_frame_0: @ +$C
	.2byte 8 @ oam entries
	.2byte 0xDD, 0x81DD, 0x0 @ OAM Data #0
	.2byte 0x80FD, 0x8005, 0xA @ OAM Data #1
	.2byte 0x80FD, 0x4015, 0xC @ OAM Data #2
	.2byte 0xDD, 0x81DD, 0x0 @ OAM Data #3
	.2byte 0xED, 0x41FD, 0x44 @ OAM Data #4
	.2byte 0x40F5, 0xD, 0x66 @ OAM Data #5
	.2byte 0x40FD, 0x81E5, 0x6 @ OAM Data #6
	.2byte 0x400D, 0x1F5, 0x48 @ OAM Data #7

Ap_WmHightLightMap4_frame_1: @ +$3E
	.2byte 2 @ oam entries
	.2byte 0x40F8, 0x81E0, 0xD @ OAM Data #0
	.2byte 0x40F8, 0x8000, 0x11 @ OAM Data #1

Ap_WmHightLightMap4_anim_0: @ +$4C
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap4_anim_1: @ +$54
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

.L_end_Ap_WmHightLightMap4:
	.if (.L_end_Ap_WmHightLightMap4 - Ap_WmHightLightMap4) != 92
	.error "Ap_WmHightLightMap4 size mismatch"
	.endif

    .global Img_WmHightLightMap5
Img_WmHightLightMap5:
    .incbin "graphics/misc/Img_WmHightLightMap5.4bpp.lz"

    .global Ap_WmHightLightMap5
Ap_WmHightLightMap5:
Ap_WmHightLightMap5_motion:
	.2byte (Ap_WmHightLightMap5_frame_list - Ap_WmHightLightMap5_motion), (Ap_WmHightLightMap5_anim_list - Ap_WmHightLightMap5_motion) @ header

Ap_WmHightLightMap5_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap5_frame_0 - Ap_WmHightLightMap5_frame_list)
	.2byte (Ap_WmHightLightMap5_frame_1 - Ap_WmHightLightMap5_frame_list)

Ap_WmHightLightMap5_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap5_anim_0 - Ap_WmHightLightMap5_anim_list)
	.2byte (Ap_WmHightLightMap5_anim_1 - Ap_WmHightLightMap5_anim_list)

Ap_WmHightLightMap5_frame_0: @ +$C
	.2byte 2 @ oam entries
	.2byte 0xF0, 0x81E9, 0x0 @ OAM Data #0
	.2byte 0x80F0, 0x4009, 0x4 @ OAM Data #1

Ap_WmHightLightMap5_frame_1: @ +$1A
	.2byte 1 @ oam entries
	.2byte 0xF9, 0x41F9, 0x5 @ OAM Data #0

Ap_WmHightLightMap5_anim_0: @ +$22
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap5_anim_1: @ +$2A
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_Ap_WmHightLightMap5:
	.if (.L_end_Ap_WmHightLightMap5 - Ap_WmHightLightMap5) != 52
	.error "Ap_WmHightLightMap5 size mismatch"
	.endif

    .global Img_WmHightLightMap6
Img_WmHightLightMap6:
    .incbin "graphics/misc/Img_WmHightLightMap6.4bpp.lz"

    .global Ap_WmHightLightMap6
Ap_WmHightLightMap6:
Ap_WmHightLightMap6_motion:
	.2byte (Ap_WmHightLightMap6_frame_list - Ap_WmHightLightMap6_motion), (Ap_WmHightLightMap6_anim_list - Ap_WmHightLightMap6_motion) @ header

Ap_WmHightLightMap6_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap6_frame_0 - Ap_WmHightLightMap6_frame_list)
	.2byte (Ap_WmHightLightMap6_frame_1 - Ap_WmHightLightMap6_frame_list)

Ap_WmHightLightMap6_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap6_anim_0 - Ap_WmHightLightMap6_anim_list)
	.2byte (Ap_WmHightLightMap6_anim_1 - Ap_WmHightLightMap6_anim_list)

Ap_WmHightLightMap6_frame_0: @ +$C
	.2byte 5 @ oam entries
	.2byte 0x40E4, 0xC1DB, 0x0 @ OAM Data #0
	.2byte 0x80E4, 0x801B, 0x8 @ OAM Data #1
	.2byte 0x80E4, 0x402B, 0xA @ OAM Data #2
	.2byte 0x4004, 0xC1E3, 0xB @ OAM Data #3
	.2byte 0x8004, 0x8023, 0x13 @ OAM Data #4

Ap_WmHightLightMap6_frame_1: @ +$2C
	.2byte 3 @ oam entries
	.2byte 0x40F8, 0x81DE, 0x15 @ OAM Data #0
	.2byte 0x40F8, 0x81FE, 0x19 @ OAM Data #1
	.2byte 0x80F8, 0x1E, 0x1D @ OAM Data #2

Ap_WmHightLightMap6_anim_0: @ +$40
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap6_anim_1: @ +$48
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

.L_end_Ap_WmHightLightMap6:
	.if (.L_end_Ap_WmHightLightMap6 - Ap_WmHightLightMap6) != 80
	.error "Ap_WmHightLightMap6 size mismatch"
	.endif

    .global Img_WmHightLightMap7
Img_WmHightLightMap7:
    .incbin "graphics/misc/Img_WmHightLightMap7.4bpp.lz"

    .global Ap_WmHightLightMap7
Ap_WmHightLightMap7:
Ap_WmHightLightMap7_motion:
	.2byte (Ap_WmHightLightMap7_frame_list - Ap_WmHightLightMap7_motion), (Ap_WmHightLightMap7_anim_list - Ap_WmHightLightMap7_motion) @ header

Ap_WmHightLightMap7_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap7_frame_0 - Ap_WmHightLightMap7_frame_list)
	.2byte (Ap_WmHightLightMap7_frame_1 - Ap_WmHightLightMap7_frame_list)

Ap_WmHightLightMap7_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap7_anim_0 - Ap_WmHightLightMap7_anim_list)
	.2byte (Ap_WmHightLightMap7_anim_1 - Ap_WmHightLightMap7_anim_list)

Ap_WmHightLightMap7_frame_0: @ +$C
	.2byte 1 @ oam entries
	.2byte 0xF6, 0x41F9, 0x0 @ OAM Data #0

Ap_WmHightLightMap7_frame_1: @ +$14
	.2byte 3 @ oam entries
	.2byte 0x4008, 0x81D4, 0x2 @ OAM Data #0
	.2byte 0x4008, 0x81F4, 0x6 @ OAM Data #1
	.2byte 0x4008, 0x8014, 0xA @ OAM Data #2

Ap_WmHightLightMap7_anim_0: @ +$28
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap7_anim_1: @ +$30
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

.L_end_Ap_WmHightLightMap7:
	.if (.L_end_Ap_WmHightLightMap7 - Ap_WmHightLightMap7) != 56
	.error "Ap_WmHightLightMap7 size mismatch"
	.endif

    .global Img_WmHightLightMap8
Img_WmHightLightMap8:
    .incbin "graphics/misc/Img_WmHightLightMap8.4bpp.lz"

    .global Ap_WmHightLightMap8
Ap_WmHightLightMap8:
Ap_WmHightLightMap8_motion:
	.2byte (Ap_WmHightLightMap8_frame_list - Ap_WmHightLightMap8_motion), (Ap_WmHightLightMap8_anim_list - Ap_WmHightLightMap8_motion) @ header

Ap_WmHightLightMap8_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap8_frame_0 - Ap_WmHightLightMap8_frame_list)
	.2byte (Ap_WmHightLightMap8_frame_1 - Ap_WmHightLightMap8_frame_list)

Ap_WmHightLightMap8_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap8_anim_0 - Ap_WmHightLightMap8_anim_list)
	.2byte (Ap_WmHightLightMap8_anim_1 - Ap_WmHightLightMap8_anim_list)

Ap_WmHightLightMap8_frame_0: @ +$C
	.2byte 9 @ oam entries
	.2byte 0x40E2, 0xC1D3, 0x0 @ OAM Data #0
	.2byte 0x80E2, 0x8013, 0x8 @ OAM Data #1
	.2byte 0x4002, 0xC1D3, 0xA @ OAM Data #2
	.2byte 0x8002, 0x8013, 0x12 @ OAM Data #3
	.2byte 0x8002, 0x4023, 0x14 @ OAM Data #4
	.2byte 0x40E2, 0xC1D3, 0x0 @ OAM Data #5
	.2byte 0x80E2, 0x8013, 0x8 @ OAM Data #6
	.2byte 0x40E2, 0xC1D3, 0x0 @ OAM Data #7
	.2byte 0x80E2, 0x8013, 0x8 @ OAM Data #8

Ap_WmHightLightMap8_frame_1: @ +$44
	.2byte 3 @ oam entries
	.2byte 0x40F8, 0x81E6, 0x15 @ OAM Data #0
	.2byte 0xF8, 0x4006, 0x19 @ OAM Data #1
	.2byte 0x80F8, 0x16, 0x1B @ OAM Data #2

Ap_WmHightLightMap8_anim_0: @ +$58
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap8_anim_1: @ +$60
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

.L_end_Ap_WmHightLightMap8:
	.if (.L_end_Ap_WmHightLightMap8 - Ap_WmHightLightMap8) != 104
	.error "Ap_WmHightLightMap8 size mismatch"
	.endif
