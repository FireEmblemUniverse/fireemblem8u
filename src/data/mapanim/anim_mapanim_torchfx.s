.section .data

	.global gMapanimTorchfx_0
gMapanimTorchfx_0:  @ 0x089A5A6C
gMapanimTorchfx_motion:
	.2byte (gMapanimTorchfx_frame_list - gMapanimTorchfx_motion), (gMapanimTorchfx_anim_list - gMapanimTorchfx_motion) @ header

gMapanimTorchfx_frame_list: @ +$4
	.2byte (gMapanimTorchfx_frame_0 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_1 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_2 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_3 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_4 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_5 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_6 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_7 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_8 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_9 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_10 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_11 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_12 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_13 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_14 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_15 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_16 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_17 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_18 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_19 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_20 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_21 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_22 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_23 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_24 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_25 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_26 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_27 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_28 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_29 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_30 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_31 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_32 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_33 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_34 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_35 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_36 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_37 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_38 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_39 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_40 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_41 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_42 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_43 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_44 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_45 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_46 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_47 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_48 - gMapanimTorchfx_frame_list)
	.2byte (gMapanimTorchfx_frame_49 - gMapanimTorchfx_frame_list)

gMapanimTorchfx_anim_list: @ +$68
	.2byte (gMapanimTorchfx_anim_0 - gMapanimTorchfx_anim_list)
	.2byte (gMapanimTorchfx_anim_1 - gMapanimTorchfx_anim_list)
	.2byte (gMapanimTorchfx_anim_2 - gMapanimTorchfx_anim_list)
	.2byte (gMapanimTorchfx_anim_3 - gMapanimTorchfx_anim_list)

gMapanimTorchfx_frame_0: @ +$70
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x33
	.2byte 1 @ oam entries
	.2byte 0x1FC, 0x41D0, 0x0 @ OAM Data #0

gMapanimTorchfx_frame_1: @ +$80
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x4C
	.2byte 1 @ oam entries
	.2byte 0x1FC, 0x41D0, 0x0 @ OAM Data #0

gMapanimTorchfx_frame_2: @ +$90
	.2byte (2 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x66
	.2byte 0x100, 0x100, 0x33
	.2byte 2 @ oam entries
	.2byte 0x1FB, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1FC, 0x43E0, 0x2 @ OAM Data #1

gMapanimTorchfx_frame_3: @ +$AC
	.2byte (2 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x80
	.2byte 0x100, 0x100, 0x4C
	.2byte 2 @ oam entries
	.2byte 0x1FA, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1FC, 0x43E0, 0x2 @ OAM Data #1

gMapanimTorchfx_frame_4: @ +$C8
	.2byte (3 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x99
	.2byte 0x100, 0x100, 0x66
	.2byte 0x100, 0x100, 0x33
	.2byte 3 @ oam entries
	.2byte 0x1FA, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1FB, 0x43E0, 0x2 @ OAM Data #1
	.2byte 0x1FC, 0x45F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_5: @ +$F0
	.2byte (3 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xB3
	.2byte 0x100, 0x100, 0x80
	.2byte 0x100, 0x100, 0x4C
	.2byte 3 @ oam entries
	.2byte 0x1F9, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1FA, 0x43E0, 0x2 @ OAM Data #1
	.2byte 0x1FC, 0x45F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_6: @ +$118
	.2byte (3 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xCC
	.2byte 0x100, 0x100, 0x99
	.2byte 0x100, 0x100, 0x66
	.2byte 3 @ oam entries
	.2byte 0x1F9, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1FA, 0x43E0, 0x2 @ OAM Data #1
	.2byte 0x1FB, 0x45F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_7: @ +$140
	.2byte (3 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xE6
	.2byte 0x100, 0x100, 0xB3
	.2byte 0x100, 0x100, 0x80
	.2byte 3 @ oam entries
	.2byte 0x1F8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1F9, 0x43E0, 0x2 @ OAM Data #1
	.2byte 0x1FA, 0x45F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_8: @ +$168
	.2byte (2 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xCC
	.2byte 0x100, 0x100, 0x99
	.2byte 3 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1F9, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0x1FA, 0x43F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_9: @ +$18A
	.2byte (3 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x133
	.2byte 0x100, 0x100, 0xE6
	.2byte 0x100, 0x100, 0xB3
	.2byte 3 @ oam entries
	.2byte 0x1F6, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1F8, 0x43E0, 0x2 @ OAM Data #1
	.2byte 0x1F9, 0x45F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_10: @ +$1B2
	.2byte (2 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x119
	.2byte 0x100, 0x100, 0xCC
	.2byte 3 @ oam entries
	.2byte 0x1F7, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0x1F9, 0x43F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_11: @ +$1D4
	.2byte (2 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x133
	.2byte 0x100, 0x100, 0xE6
	.2byte 3 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1F6, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0x1F8, 0x43F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_12: @ +$1F6
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x119
	.2byte 3 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0x1F7, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_13: @ +$212
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x133
	.2byte 3 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0x1F6, 0x41F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_14: @ +$22E
	.2byte 3 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2

gMapanimTorchfx_frame_15: @ +$242
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x19, 0x19
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FD, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_16: @ +$264
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x33, 0x33
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FC, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_17: @ +$286
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x4C, 0x4C
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FB, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_18: @ +$2A8
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x66, 0x66
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FB, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_19: @ +$2CA
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x80, 0x80
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FA, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_20: @ +$2EC
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x99, 0x99
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41FA, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_21: @ +$30E
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0xB3, 0xB3
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41F9, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_22: @ +$330
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0xCC, 0xCC
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41F9, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_23: @ +$352
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0xE6, 0xE6
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x41F8, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_24: @ +$374
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x41D0, 0x0 @ OAM Data #0
	.2byte 0xF8, 0x41E0, 0x2 @ OAM Data #1
	.2byte 0xF8, 0x41F0, 0x4 @ OAM Data #2
	.2byte 0x40F8, 0x8000, 0x6 @ OAM Data #3

gMapanimTorchfx_frame_25: @ +$38E
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x1F9, 0xD @ OAM Data #0
	.2byte 0x80FB, 0x1FD, 0xA @ OAM Data #1

gMapanimTorchfx_frame_26: @ +$39C
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x1F9, 0x2B @ OAM Data #0
	.2byte 0x80FA, 0x1FD, 0xA @ OAM Data #1

gMapanimTorchfx_frame_27: @ +$3AA
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x1F9, 0xB @ OAM Data #0
	.2byte 0x80F9, 0x1FD, 0xA @ OAM Data #1

gMapanimTorchfx_frame_28: @ +$3B8
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x1F9, 0xB @ OAM Data #0
	.2byte 0x80F8, 0x1FD, 0xA @ OAM Data #1

gMapanimTorchfx_frame_29: @ +$3C6
	.2byte 8 @ oam entries
	.2byte 0xF8, 0x1FC, 0x0 @ OAM Data #0
	.2byte 0xFA, 0x1FF, 0x0 @ OAM Data #1
	.2byte 0xFA, 0x1FA, 0x0 @ OAM Data #2
	.2byte 0xFF, 0x1FA, 0x0 @ OAM Data #3
	.2byte 0x1, 0x1FC, 0x0 @ OAM Data #4
	.2byte 0xFF, 0x1FF, 0x0 @ OAM Data #5
	.2byte 0xFC, 0x1, 0x0 @ OAM Data #6
	.2byte 0xFC, 0x1F8, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_30: @ +$3F8
	.2byte 8 @ oam entries
	.2byte 0xF7, 0x1FE, 0x0 @ OAM Data #0
	.2byte 0xFA, 0x1, 0x0 @ OAM Data #1
	.2byte 0xF8, 0x1FA, 0x0 @ OAM Data #2
	.2byte 0xFF, 0x1F8, 0x0 @ OAM Data #3
	.2byte 0x2, 0x1FB, 0x0 @ OAM Data #4
	.2byte 0x1, 0x1FF, 0x0 @ OAM Data #5
	.2byte 0xFE, 0x2, 0x0 @ OAM Data #6
	.2byte 0xFB, 0x1F7, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_31: @ +$42A
	.2byte 8 @ oam entries
	.2byte 0xFB, 0x3, 0x0 @ OAM Data #0
	.2byte 0x0, 0x2, 0x0 @ OAM Data #1
	.2byte 0xF7, 0x0, 0x0 @ OAM Data #2
	.2byte 0xF9, 0x1F7, 0x0 @ OAM Data #3
	.2byte 0xFE, 0x1F6, 0x0 @ OAM Data #4
	.2byte 0x2, 0x1F9, 0x0 @ OAM Data #5
	.2byte 0x3, 0x1FE, 0x0 @ OAM Data #6
	.2byte 0xF6, 0x1FB, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_32: @ +$45C
	.2byte 8 @ oam entries
	.2byte 0xFD, 0x5, 0x0 @ OAM Data #0
	.2byte 0x2, 0x1, 0x0 @ OAM Data #1
	.2byte 0xF7, 0x3, 0x0 @ OAM Data #2
	.2byte 0xF6, 0x1F8, 0x0 @ OAM Data #3
	.2byte 0xFB, 0x1F5, 0x0 @ OAM Data #4
	.2byte 0x0, 0x1F7, 0x0 @ OAM Data #5
	.2byte 0x4, 0x1FB, 0x0 @ OAM Data #6
	.2byte 0xF4, 0x1FE, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_33: @ +$48E
	.2byte 8 @ oam entries
	.2byte 0x0, 0x11F3, 0x0 @ OAM Data #0
	.2byte 0x5, 0x11F8, 0x0 @ OAM Data #1
	.2byte 0xF9, 0x11F3, 0x0 @ OAM Data #2
	.2byte 0xF4, 0x11FF, 0x0 @ OAM Data #3
	.2byte 0xF9, 0x1004, 0x0 @ OAM Data #4
	.2byte 0x0, 0x1004, 0x0 @ OAM Data #5
	.2byte 0x5, 0x11FF, 0x0 @ OAM Data #6
	.2byte 0xF4, 0x11F8, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_34: @ +$4C0
	.2byte 8 @ oam entries
	.2byte 0xFD, 0x11F2, 0x0 @ OAM Data #0
	.2byte 0x5, 0x11F6, 0x0 @ OAM Data #1
	.2byte 0xF6, 0x11F4, 0x0 @ OAM Data #2
	.2byte 0xF4, 0x1002, 0x0 @ OAM Data #3
	.2byte 0xFB, 0x1006, 0x0 @ OAM Data #4
	.2byte 0x3, 0x1004, 0x0 @ OAM Data #5
	.2byte 0x7, 0x11FD, 0x0 @ OAM Data #6
	.2byte 0xF2, 0x11FA, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_35: @ +$4F2
	.2byte 8 @ oam entries
	.2byte 0xFC, 0x11F1, 0x0 @ OAM Data #0
	.2byte 0x5, 0x11F4, 0x0 @ OAM Data #1
	.2byte 0xF4, 0x11F4, 0x0 @ OAM Data #2
	.2byte 0xF5, 0x1004, 0x0 @ OAM Data #3
	.2byte 0xFD, 0x1007, 0x0 @ OAM Data #4
	.2byte 0x5, 0x1003, 0x0 @ OAM Data #5
	.2byte 0x8, 0x11FB, 0x0 @ OAM Data #6
	.2byte 0xF1, 0x11FC, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_36: @ +$524
	.2byte 8 @ oam entries
	.2byte 0xF9, 0x11F0, 0x0 @ OAM Data #0
	.2byte 0x3, 0x11F2, 0x0 @ OAM Data #1
	.2byte 0xF2, 0x11F6, 0x0 @ OAM Data #2
	.2byte 0xF7, 0x1006, 0x0 @ OAM Data #3
	.2byte 0x0, 0x1007, 0x0 @ OAM Data #4
	.2byte 0x7, 0x1001, 0x0 @ OAM Data #5
	.2byte 0x8, 0x11F8, 0x0 @ OAM Data #6
	.2byte 0xF1, 0x11FF, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_37: @ +$556
	.2byte 8 @ oam entries
	.2byte 0xF6, 0x11F1, 0x0 @ OAM Data #0
	.2byte 0x0, 0x11F0, 0x0 @ OAM Data #1
	.2byte 0xF1, 0x11F9, 0x0 @ OAM Data #2
	.2byte 0xFA, 0x1008, 0x0 @ OAM Data #3
	.2byte 0x4, 0x1006, 0x0 @ OAM Data #4
	.2byte 0x9, 0x11FE, 0x0 @ OAM Data #5
	.2byte 0x7, 0x11F5, 0x0 @ OAM Data #6
	.2byte 0xF2, 0x1003, 0x0 @ OAM Data #7

gMapanimTorchfx_frame_38: @ +$588
	.2byte 8 @ oam entries
	.2byte 0xF0, 0x1FE, 0x1 @ OAM Data #0
	.2byte 0xF5, 0x7, 0x1 @ OAM Data #1
	.2byte 0xFE, 0xA, 0x1 @ OAM Data #2
	.2byte 0x6, 0x5, 0x1 @ OAM Data #3
	.2byte 0xA, 0x1FB, 0x1 @ OAM Data #4
	.2byte 0x5, 0x1F3, 0x1 @ OAM Data #5
	.2byte 0xFC, 0x1F0, 0x1 @ OAM Data #6
	.2byte 0xF3, 0x1F4, 0x1 @ OAM Data #7

gMapanimTorchfx_frame_39: @ +$5BA
	.2byte 8 @ oam entries
	.2byte 0xF0, 0x0, 0x2 @ OAM Data #0
	.2byte 0xF7, 0x8, 0x2 @ OAM Data #1
	.2byte 0x0, 0xA, 0x2 @ OAM Data #2
	.2byte 0x8, 0x3, 0x2 @ OAM Data #3
	.2byte 0xA, 0x1F9, 0x2 @ OAM Data #4
	.2byte 0x3, 0x1F2, 0x2 @ OAM Data #5
	.2byte 0xFA, 0x1F0, 0x2 @ OAM Data #6
	.2byte 0xF1, 0x1F6, 0x2 @ OAM Data #7

gMapanimTorchfx_frame_40: @ +$5EC
	.2byte 2 @ oam entries
	.2byte 0x40F8, 0x1F8, 0x3 @ OAM Data #0
	.2byte 0x40F8, 0x12, 0x40 @ OAM Data #1

gMapanimTorchfx_frame_41: @ +$5FA
	.2byte 2 @ oam entries
	.2byte 0x40F8, 0x41F0, 0x5 @ OAM Data #0
	.2byte 0xF0, 0x4012, 0x22 @ OAM Data #1

gMapanimTorchfx_frame_42: @ +$608
	.2byte 3 @ oam entries
	.2byte 0x40F8, 0x41E8, 0x9 @ OAM Data #0
	.2byte 0x40F8, 0x8, 0xD @ OAM Data #1
	.2byte 0xF0, 0x4012, 0x24 @ OAM Data #2

gMapanimTorchfx_frame_43: @ +$61C
	.2byte 3 @ oam entries
	.2byte 0xED, 0x4012, 0x24 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_44: @ +$630
	.2byte 3 @ oam entries
	.2byte 0xE6, 0x4012, 0x22 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_45: @ +$644
	.2byte 3 @ oam entries
	.2byte 0x40EB, 0x12, 0x40 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_46: @ +$658
	.2byte 3 @ oam entries
	.2byte 0xE8, 0x4012, 0x22 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_47: @ +$66C
	.2byte 3 @ oam entries
	.2byte 0xF0, 0x4012, 0x26 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_48: @ +$680
	.2byte 3 @ oam entries
	.2byte 0xF0, 0x4012, 0x28 @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_frame_49: @ +$694
	.2byte 3 @ oam entries
	.2byte 0xF0, 0x4012, 0x2A @ OAM Data #0
	.2byte 0x40F8, 0x41E0, 0xF @ OAM Data #1
	.2byte 0x40F8, 0x4000, 0x13 @ OAM Data #2

gMapanimTorchfx_anim_0: @ +$6A8
	.2byte  1,  0
	.2byte  1,  1
	.2byte  1,  2
	.2byte  1,  3
	.2byte  1,  4
	.2byte  1,  5
	.2byte  1,  6
	.2byte  1,  7
	.2byte  1,  8
	.2byte  1,  9
	.2byte  1, 10
	.2byte  1, 11
	.2byte  1, 12
	.2byte  1, 13
	.2byte  1, 14
	.2byte  1, 15
	.2byte  1, 16
	.2byte  1, 17
	.2byte  1, 18
	.2byte  1, 19
	.2byte  1, 20
	.2byte  1, 21
	.2byte  1, 22
	.2byte  1, 23
	.2byte 50, 24

	.2byte 0, (-1) @ loop back to start

gMapanimTorchfx_anim_1: @ +$710
	.2byte 10, 25
	.2byte  3, 26
	.2byte  3, 27
	.2byte 10, 28
	.2byte  3, 27
	.2byte  3, 26

	.2byte 0, (-1) @ loop back to start

gMapanimTorchfx_anim_2: @ +$72C
	.2byte  2, 29
	.2byte  2, 30
	.2byte  2, 31
	.2byte  2, 32
	.2byte  2, 33
	.2byte  2, 34
	.2byte  2, 35
	.2byte  2, 36
	.2byte  2, 37
	.2byte  2, 38
	.2byte  2, 39

	.2byte 0, (-1) @ loop back to start

gMapanimTorchfx_anim_3: @ +$75C
	.2byte  1, 40
	.2byte  1, 41
	.2byte  1, 42
	.2byte  2, 43
	.2byte  2, 44
	.2byte  3, 45
	.2byte  2, 44
	.2byte  2, 46
	.2byte  1, 47
	.2byte 24, 48
	.2byte  8, 49

	.2byte 0, (-1) @ loop back to start

.L_end_gUnknown_089A5A6C:
	.if (.L_end_gUnknown_089A5A6C - gMapanimTorchfx_0) != 1932
	.error "gMapanimTorchfx_0 size mismatch"
	.endif

	.global ApConf_MapAnimTorchfx
ApConf_MapAnimTorchfx:  @ 0x089A61F8
ApConf_MapAnimTorchfx_motion:
	.2byte (ApConf_MapAnimTorchfx_frame_list - ApConf_MapAnimTorchfx_motion), (ApConf_MapAnimTorchfx_anim_list - ApConf_MapAnimTorchfx_motion) @ header

ApConf_MapAnimTorchfx_frame_list: @ +$4
	.2byte (ApConf_MapAnimTorchfx_frame_0 - ApConf_MapAnimTorchfx_frame_list)
	.2byte (ApConf_MapAnimTorchfx_frame_1 - ApConf_MapAnimTorchfx_frame_list)
	.2byte (ApConf_MapAnimTorchfx_frame_2 - ApConf_MapAnimTorchfx_frame_list)
	.2byte (ApConf_MapAnimTorchfx_frame_3 - ApConf_MapAnimTorchfx_frame_list)

ApConf_MapAnimTorchfx_anim_list: @ +$C
	.2byte (ApConf_MapAnimTorchfx_anim_0 - ApConf_MapAnimTorchfx_anim_list)

ApConf_MapAnimTorchfx_frame_0: @ +$E
	.2byte 2 @ oam entries
	.2byte 0xF0, 0x41F8, 0x0 @ OAM Data #0
	.2byte 0x4000, 0x1F8, 0x40 @ OAM Data #1

ApConf_MapAnimTorchfx_frame_1: @ +$1C
	.2byte 2 @ oam entries
	.2byte 0xF0, 0x41F8, 0x2 @ OAM Data #0
	.2byte 0x4000, 0x1F8, 0x42 @ OAM Data #1

ApConf_MapAnimTorchfx_frame_2: @ +$2A
	.2byte 2 @ oam entries
	.2byte 0xF0, 0x41F8, 0x4 @ OAM Data #0
	.2byte 0x4000, 0x1F8, 0x44 @ OAM Data #1

ApConf_MapAnimTorchfx_frame_3: @ +$38
	.2byte 2 @ oam entries
	.2byte 0xF0, 0x41F8, 0x6 @ OAM Data #0
	.2byte 0x4000, 0x1F8, 0x46 @ OAM Data #1

ApConf_MapAnimTorchfx_anim_0: @ +$46
	.2byte  5,  0
	.2byte  4,  1
	.2byte  3,  2
	.2byte  4,  3

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_ApConf_MapAnimTorchfx:
	.if (.L_end_ApConf_MapAnimTorchfx - ApConf_MapAnimTorchfx) != 92
	.error "ApConf_MapAnimTorchfx size mismatch"
	.endif
