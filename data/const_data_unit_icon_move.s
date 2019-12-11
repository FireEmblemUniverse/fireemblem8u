	.section .rodata

	.global unit_icon_move_0_sheet
unit_icon_move_0_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_0_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_0_motion
unit_icon_move_0_motion:
	.2byte (unit_icon_move_0_frame_list - unit_icon_move_0_motion), (unit_icon_move_0_anim_list - unit_icon_move_0_motion) @ header

unit_icon_move_0_frame_list: @ +$4
	.2byte (unit_icon_move_0_frame_0 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_1 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_2 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_3 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_4 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_5 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_6 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_7 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_8 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_9 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_10 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_11 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_12 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_13 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_14 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_15 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_16 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_17 - unit_icon_move_0_frame_list)
	.2byte (unit_icon_move_0_frame_18 - unit_icon_move_0_frame_list)

unit_icon_move_0_anim_list: @ +$2A
	.2byte (unit_icon_move_0_anim_0 - unit_icon_move_0_anim_list)
	.2byte (unit_icon_move_0_anim_1 - unit_icon_move_0_anim_list)
	.2byte (unit_icon_move_0_anim_2 - unit_icon_move_0_anim_list)
	.2byte (unit_icon_move_0_anim_3 - unit_icon_move_0_anim_list)
	.2byte (unit_icon_move_0_anim_4 - unit_icon_move_0_anim_list)

unit_icon_move_0_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_0_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_0_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_0_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_0_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_0_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_0_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_0_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_0_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_0_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_0_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_0_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_0_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_0_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_0_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_0_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_0_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_0_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_0_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_0_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_0_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_0_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_0_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_0_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_1_sheet
unit_icon_move_1_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_1_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_1_motion
unit_icon_move_1_motion:
	.2byte (unit_icon_move_1_frame_list - unit_icon_move_1_motion), (unit_icon_move_1_anim_list - unit_icon_move_1_motion) @ header

unit_icon_move_1_frame_list: @ +$4
	.2byte (unit_icon_move_1_frame_0 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_1 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_2 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_3 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_4 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_5 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_6 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_7 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_8 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_9 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_10 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_11 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_12 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_13 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_14 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_15 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_16 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_17 - unit_icon_move_1_frame_list)
	.2byte (unit_icon_move_1_frame_18 - unit_icon_move_1_frame_list)

unit_icon_move_1_anim_list: @ +$2A
	.2byte (unit_icon_move_1_anim_0 - unit_icon_move_1_anim_list)
	.2byte (unit_icon_move_1_anim_1 - unit_icon_move_1_anim_list)
	.2byte (unit_icon_move_1_anim_2 - unit_icon_move_1_anim_list)
	.2byte (unit_icon_move_1_anim_3 - unit_icon_move_1_anim_list)
	.2byte (unit_icon_move_1_anim_4 - unit_icon_move_1_anim_list)

unit_icon_move_1_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_1_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_1_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_1_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_1_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_1_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_1_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_1_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_1_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_1_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_1_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_1_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_1_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_1_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_1_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_1_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_1_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_1_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_1_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_1_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_1_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_1_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_1_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_1_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_2_sheet
unit_icon_move_2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_2_motion
unit_icon_move_2_motion:
	.2byte (unit_icon_move_2_frame_list - unit_icon_move_2_motion), (unit_icon_move_2_anim_list - unit_icon_move_2_motion) @ header

unit_icon_move_2_frame_list: @ +$4
	.2byte (unit_icon_move_2_frame_0 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_1 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_2 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_3 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_4 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_5 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_6 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_7 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_8 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_9 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_10 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_11 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_12 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_13 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_14 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_15 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_16 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_17 - unit_icon_move_2_frame_list)
	.2byte (unit_icon_move_2_frame_18 - unit_icon_move_2_frame_list)

unit_icon_move_2_anim_list: @ +$2A
	.2byte (unit_icon_move_2_anim_0 - unit_icon_move_2_anim_list)
	.2byte (unit_icon_move_2_anim_1 - unit_icon_move_2_anim_list)
	.2byte (unit_icon_move_2_anim_2 - unit_icon_move_2_anim_list)
	.2byte (unit_icon_move_2_anim_3 - unit_icon_move_2_anim_list)
	.2byte (unit_icon_move_2_anim_4 - unit_icon_move_2_anim_list)

unit_icon_move_2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_2_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_2_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_2_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_2_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_2_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_2_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_3_sheet
unit_icon_move_3_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_3_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_3_motion
unit_icon_move_3_motion:
	.2byte (unit_icon_move_3_frame_list - unit_icon_move_3_motion), (unit_icon_move_3_anim_list - unit_icon_move_3_motion) @ header

unit_icon_move_3_frame_list: @ +$4
	.2byte (unit_icon_move_3_frame_0 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_1 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_2 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_3 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_4 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_5 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_6 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_7 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_8 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_9 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_10 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_11 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_12 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_13 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_14 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_15 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_16 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_17 - unit_icon_move_3_frame_list)
	.2byte (unit_icon_move_3_frame_18 - unit_icon_move_3_frame_list)

unit_icon_move_3_anim_list: @ +$2A
	.2byte (unit_icon_move_3_anim_0 - unit_icon_move_3_anim_list)
	.2byte (unit_icon_move_3_anim_1 - unit_icon_move_3_anim_list)
	.2byte (unit_icon_move_3_anim_2 - unit_icon_move_3_anim_list)
	.2byte (unit_icon_move_3_anim_3 - unit_icon_move_3_anim_list)
	.2byte (unit_icon_move_3_anim_4 - unit_icon_move_3_anim_list)

unit_icon_move_3_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_3_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_3_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_3_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_3_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_3_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_3_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_3_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_3_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_3_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_3_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_3_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_3_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_3_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_3_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_3_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_3_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_3_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_3_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_3_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_3_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_3_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_3_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_3_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_4_sheet
unit_icon_move_4_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_4_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_4_motion
unit_icon_move_4_motion:
	.2byte (unit_icon_move_4_frame_list - unit_icon_move_4_motion), (unit_icon_move_4_anim_list - unit_icon_move_4_motion) @ header

unit_icon_move_4_frame_list: @ +$4
	.2byte (unit_icon_move_4_frame_0 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_1 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_2 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_3 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_4 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_5 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_6 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_7 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_8 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_9 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_10 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_11 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_12 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_13 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_14 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_15 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_16 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_17 - unit_icon_move_4_frame_list)
	.2byte (unit_icon_move_4_frame_18 - unit_icon_move_4_frame_list)

unit_icon_move_4_anim_list: @ +$2A
	.2byte (unit_icon_move_4_anim_0 - unit_icon_move_4_anim_list)
	.2byte (unit_icon_move_4_anim_1 - unit_icon_move_4_anim_list)
	.2byte (unit_icon_move_4_anim_2 - unit_icon_move_4_anim_list)
	.2byte (unit_icon_move_4_anim_3 - unit_icon_move_4_anim_list)
	.2byte (unit_icon_move_4_anim_4 - unit_icon_move_4_anim_list)

unit_icon_move_4_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_4_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_4_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_4_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_4_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_4_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_4_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_4_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_4_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_4_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_4_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_4_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_4_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_4_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_4_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_4_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_4_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_4_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_4_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_4_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_4_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_4_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_4_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_4_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_6_sheet
unit_icon_move_6_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_6_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_6_motion
unit_icon_move_6_motion:
	.2byte (unit_icon_move_6_frame_list - unit_icon_move_6_motion), (unit_icon_move_6_anim_list - unit_icon_move_6_motion) @ header

unit_icon_move_6_frame_list: @ +$4
	.2byte (unit_icon_move_6_frame_0 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_1 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_2 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_3 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_4 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_5 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_6 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_7 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_8 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_9 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_10 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_11 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_12 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_13 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_14 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_15 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_16 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_17 - unit_icon_move_6_frame_list)
	.2byte (unit_icon_move_6_frame_18 - unit_icon_move_6_frame_list)

unit_icon_move_6_anim_list: @ +$2A
	.2byte (unit_icon_move_6_anim_0 - unit_icon_move_6_anim_list)
	.2byte (unit_icon_move_6_anim_1 - unit_icon_move_6_anim_list)
	.2byte (unit_icon_move_6_anim_2 - unit_icon_move_6_anim_list)
	.2byte (unit_icon_move_6_anim_3 - unit_icon_move_6_anim_list)
	.2byte (unit_icon_move_6_anim_4 - unit_icon_move_6_anim_list)

unit_icon_move_6_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_6_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_6_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_6_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_6_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_6_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_6_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_6_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_6_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_6_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_6_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_6_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_6_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_6_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_6_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_6_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_6_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_6_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_6_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_6_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_6_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_6_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_6_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_6_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_8_sheet
unit_icon_move_8_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_8_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_8_motion
unit_icon_move_8_motion:
	.2byte (unit_icon_move_8_frame_list - unit_icon_move_8_motion), (unit_icon_move_8_anim_list - unit_icon_move_8_motion) @ header

unit_icon_move_8_frame_list: @ +$4
	.2byte (unit_icon_move_8_frame_0 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_1 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_2 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_3 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_4 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_5 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_6 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_7 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_8 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_9 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_10 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_11 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_12 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_13 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_14 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_15 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_16 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_17 - unit_icon_move_8_frame_list)
	.2byte (unit_icon_move_8_frame_18 - unit_icon_move_8_frame_list)

unit_icon_move_8_anim_list: @ +$2A
	.2byte (unit_icon_move_8_anim_0 - unit_icon_move_8_anim_list)
	.2byte (unit_icon_move_8_anim_1 - unit_icon_move_8_anim_list)
	.2byte (unit_icon_move_8_anim_2 - unit_icon_move_8_anim_list)
	.2byte (unit_icon_move_8_anim_3 - unit_icon_move_8_anim_list)
	.2byte (unit_icon_move_8_anim_4 - unit_icon_move_8_anim_list)

unit_icon_move_8_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_8_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_8_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_8_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_8_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_8_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_8_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_8_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_8_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_8_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_8_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_8_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_8_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_8_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_8_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_8_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_8_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_8_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_8_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_8_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_8_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_8_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_8_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_8_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_10_sheet
unit_icon_move_10_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_10_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_10_motion
unit_icon_move_10_motion:
	.2byte (unit_icon_move_10_frame_list - unit_icon_move_10_motion), (unit_icon_move_10_anim_list - unit_icon_move_10_motion) @ header

unit_icon_move_10_frame_list: @ +$4
	.2byte (unit_icon_move_10_frame_0 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_1 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_2 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_3 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_4 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_5 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_6 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_7 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_8 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_9 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_10 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_11 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_12 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_13 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_14 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_15 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_16 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_17 - unit_icon_move_10_frame_list)
	.2byte (unit_icon_move_10_frame_18 - unit_icon_move_10_frame_list)

unit_icon_move_10_anim_list: @ +$2A
	.2byte (unit_icon_move_10_anim_0 - unit_icon_move_10_anim_list)
	.2byte (unit_icon_move_10_anim_1 - unit_icon_move_10_anim_list)
	.2byte (unit_icon_move_10_anim_2 - unit_icon_move_10_anim_list)
	.2byte (unit_icon_move_10_anim_3 - unit_icon_move_10_anim_list)
	.2byte (unit_icon_move_10_anim_4 - unit_icon_move_10_anim_list)

unit_icon_move_10_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_10_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_10_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_10_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_10_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_10_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_10_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_10_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_10_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_10_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_10_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_10_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_10_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_10_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_10_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_10_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_10_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_10_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_10_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0x80ED, 0x1E4, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_10_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_10_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_10_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_10_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_10_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_12_sheet
unit_icon_move_12_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_12_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_12_motion
unit_icon_move_12_motion:
	.2byte (unit_icon_move_12_frame_list - unit_icon_move_12_motion), (unit_icon_move_12_anim_list - unit_icon_move_12_motion) @ header

unit_icon_move_12_frame_list: @ +$4
	.2byte (unit_icon_move_12_frame_0 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_1 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_2 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_3 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_4 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_5 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_6 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_7 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_8 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_9 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_10 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_11 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_12 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_13 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_14 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_15 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_16 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_17 - unit_icon_move_12_frame_list)
	.2byte (unit_icon_move_12_frame_18 - unit_icon_move_12_frame_list)

unit_icon_move_12_anim_list: @ +$2A
	.2byte (unit_icon_move_12_anim_0 - unit_icon_move_12_anim_list)
	.2byte (unit_icon_move_12_anim_1 - unit_icon_move_12_anim_list)
	.2byte (unit_icon_move_12_anim_2 - unit_icon_move_12_anim_list)
	.2byte (unit_icon_move_12_anim_3 - unit_icon_move_12_anim_list)
	.2byte (unit_icon_move_12_anim_4 - unit_icon_move_12_anim_list)

unit_icon_move_12_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_12_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_12_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_12_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_12_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_12_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_12_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_12_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_12_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_12_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_12_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_12_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_12_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_12_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_12_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_12_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_12_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_12_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_12_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_12_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_12_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_12_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_12_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_12_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_13_sheet
unit_icon_move_13_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_13_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_13_motion
unit_icon_move_13_motion:
	.2byte (unit_icon_move_13_frame_list - unit_icon_move_13_motion), (unit_icon_move_13_anim_list - unit_icon_move_13_motion) @ header

unit_icon_move_13_frame_list: @ +$4
	.2byte (unit_icon_move_13_frame_0 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_1 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_2 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_3 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_4 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_5 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_6 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_7 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_8 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_9 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_10 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_11 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_12 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_13 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_14 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_15 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_16 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_17 - unit_icon_move_13_frame_list)
	.2byte (unit_icon_move_13_frame_18 - unit_icon_move_13_frame_list)

unit_icon_move_13_anim_list: @ +$2A
	.2byte (unit_icon_move_13_anim_0 - unit_icon_move_13_anim_list)
	.2byte (unit_icon_move_13_anim_1 - unit_icon_move_13_anim_list)
	.2byte (unit_icon_move_13_anim_2 - unit_icon_move_13_anim_list)
	.2byte (unit_icon_move_13_anim_3 - unit_icon_move_13_anim_list)
	.2byte (unit_icon_move_13_anim_4 - unit_icon_move_13_anim_list)

unit_icon_move_13_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_13_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_13_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_13_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_13_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_13_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_13_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_13_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_13_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_13_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_13_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_13_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_13_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_13_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_13_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_13_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_13_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_13_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_13_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_13_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_13_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_13_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_13_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_13_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_14_sheet
unit_icon_move_14_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_14_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_14_motion
unit_icon_move_14_motion:
	.2byte (unit_icon_move_14_frame_list - unit_icon_move_14_motion), (unit_icon_move_14_anim_list - unit_icon_move_14_motion) @ header

unit_icon_move_14_frame_list: @ +$4
	.2byte (unit_icon_move_14_frame_0 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_1 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_2 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_3 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_4 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_5 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_6 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_7 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_8 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_9 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_10 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_11 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_12 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_13 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_14 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_15 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_16 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_17 - unit_icon_move_14_frame_list)
	.2byte (unit_icon_move_14_frame_18 - unit_icon_move_14_frame_list)

unit_icon_move_14_anim_list: @ +$2A
	.2byte (unit_icon_move_14_anim_0 - unit_icon_move_14_anim_list)
	.2byte (unit_icon_move_14_anim_1 - unit_icon_move_14_anim_list)
	.2byte (unit_icon_move_14_anim_2 - unit_icon_move_14_anim_list)
	.2byte (unit_icon_move_14_anim_3 - unit_icon_move_14_anim_list)
	.2byte (unit_icon_move_14_anim_4 - unit_icon_move_14_anim_list)

unit_icon_move_14_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_14_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_14_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_14_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_14_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_14_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_14_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_14_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_14_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_14_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_14_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_14_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_14_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_14_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_14_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_14_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_14_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_14_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_14_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_14_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_14_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_14_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_14_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_14_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_15_sheet
unit_icon_move_15_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_15_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_15_motion
unit_icon_move_15_motion:
	.2byte (unit_icon_move_15_frame_list - unit_icon_move_15_motion), (unit_icon_move_15_anim_list - unit_icon_move_15_motion) @ header

unit_icon_move_15_frame_list: @ +$4
	.2byte (unit_icon_move_15_frame_0 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_1 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_2 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_3 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_4 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_5 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_6 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_7 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_8 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_9 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_10 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_11 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_12 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_13 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_14 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_15 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_16 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_17 - unit_icon_move_15_frame_list)
	.2byte (unit_icon_move_15_frame_18 - unit_icon_move_15_frame_list)

unit_icon_move_15_anim_list: @ +$2A
	.2byte (unit_icon_move_15_anim_0 - unit_icon_move_15_anim_list)
	.2byte (unit_icon_move_15_anim_1 - unit_icon_move_15_anim_list)
	.2byte (unit_icon_move_15_anim_2 - unit_icon_move_15_anim_list)
	.2byte (unit_icon_move_15_anim_3 - unit_icon_move_15_anim_list)
	.2byte (unit_icon_move_15_anim_4 - unit_icon_move_15_anim_list)

unit_icon_move_15_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_15_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_15_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_15_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_15_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_15_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_15_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_15_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_15_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_15_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_15_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_15_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_15_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_15_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_15_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_15_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_15_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_15_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_15_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_15_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_15_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_15_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_15_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_15_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_16_sheet
unit_icon_move_16_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_16_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_16_motion
unit_icon_move_16_motion:
	.2byte (unit_icon_move_16_frame_list - unit_icon_move_16_motion), (unit_icon_move_16_anim_list - unit_icon_move_16_motion) @ header

unit_icon_move_16_frame_list: @ +$4
	.2byte (unit_icon_move_16_frame_0 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_1 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_2 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_3 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_4 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_5 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_6 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_7 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_8 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_9 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_10 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_11 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_12 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_13 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_14 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_15 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_16 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_17 - unit_icon_move_16_frame_list)
	.2byte (unit_icon_move_16_frame_18 - unit_icon_move_16_frame_list)

unit_icon_move_16_anim_list: @ +$2A
	.2byte (unit_icon_move_16_anim_0 - unit_icon_move_16_anim_list)
	.2byte (unit_icon_move_16_anim_1 - unit_icon_move_16_anim_list)
	.2byte (unit_icon_move_16_anim_2 - unit_icon_move_16_anim_list)
	.2byte (unit_icon_move_16_anim_3 - unit_icon_move_16_anim_list)
	.2byte (unit_icon_move_16_anim_4 - unit_icon_move_16_anim_list)

unit_icon_move_16_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_16_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_16_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_16_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_16_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_16_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_16_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_16_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_16_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_16_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_16_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_16_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_16_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_16_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_16_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_16_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_16_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_16_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_16_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1EC, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_16_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_16_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_16_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_16_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_16_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_17_sheet
unit_icon_move_17_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_17_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_17_motion
unit_icon_move_17_motion:
	.2byte (unit_icon_move_17_frame_list - unit_icon_move_17_motion), (unit_icon_move_17_anim_list - unit_icon_move_17_motion) @ header

unit_icon_move_17_frame_list: @ +$4
	.2byte (unit_icon_move_17_frame_0 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_1 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_2 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_3 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_4 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_5 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_6 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_7 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_8 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_9 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_10 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_11 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_12 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_13 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_14 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_15 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_16 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_17 - unit_icon_move_17_frame_list)
	.2byte (unit_icon_move_17_frame_18 - unit_icon_move_17_frame_list)

unit_icon_move_17_anim_list: @ +$2A
	.2byte (unit_icon_move_17_anim_0 - unit_icon_move_17_anim_list)
	.2byte (unit_icon_move_17_anim_1 - unit_icon_move_17_anim_list)
	.2byte (unit_icon_move_17_anim_2 - unit_icon_move_17_anim_list)
	.2byte (unit_icon_move_17_anim_3 - unit_icon_move_17_anim_list)
	.2byte (unit_icon_move_17_anim_4 - unit_icon_move_17_anim_list)

unit_icon_move_17_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_17_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_17_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_17_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_17_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_17_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_17_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_17_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_17_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_17_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_17_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_17_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_17_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_17_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_17_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_17_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_17_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_17_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_17_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1EC, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_17_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_17_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_17_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_17_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_17_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_18_sheet
unit_icon_move_18_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_18_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_18_motion
unit_icon_move_18_motion:
	.2byte (unit_icon_move_18_frame_list - unit_icon_move_18_motion), (unit_icon_move_18_anim_list - unit_icon_move_18_motion) @ header

unit_icon_move_18_frame_list: @ +$4
	.2byte (unit_icon_move_18_frame_0 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_1 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_2 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_3 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_4 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_5 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_6 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_7 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_8 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_9 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_10 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_11 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_12 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_13 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_14 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_15 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_16 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_17 - unit_icon_move_18_frame_list)
	.2byte (unit_icon_move_18_frame_18 - unit_icon_move_18_frame_list)

unit_icon_move_18_anim_list: @ +$2A
	.2byte (unit_icon_move_18_anim_0 - unit_icon_move_18_anim_list)
	.2byte (unit_icon_move_18_anim_1 - unit_icon_move_18_anim_list)
	.2byte (unit_icon_move_18_anim_2 - unit_icon_move_18_anim_list)
	.2byte (unit_icon_move_18_anim_3 - unit_icon_move_18_anim_list)
	.2byte (unit_icon_move_18_anim_4 - unit_icon_move_18_anim_list)

unit_icon_move_18_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_18_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_18_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_18_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_18_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_18_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_18_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_18_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_18_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_18_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_18_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_18_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_18_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_18_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_18_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_18_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_18_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_18_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_18_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_18_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_18_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_18_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_18_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_18_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_19_sheet
unit_icon_move_19_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_19_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_19_motion
unit_icon_move_19_motion:
	.2byte (unit_icon_move_19_frame_list - unit_icon_move_19_motion), (unit_icon_move_19_anim_list - unit_icon_move_19_motion) @ header

unit_icon_move_19_frame_list: @ +$4
	.2byte (unit_icon_move_19_frame_0 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_1 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_2 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_3 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_4 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_5 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_6 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_7 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_8 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_9 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_10 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_11 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_12 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_13 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_14 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_15 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_16 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_17 - unit_icon_move_19_frame_list)
	.2byte (unit_icon_move_19_frame_18 - unit_icon_move_19_frame_list)

unit_icon_move_19_anim_list: @ +$2A
	.2byte (unit_icon_move_19_anim_0 - unit_icon_move_19_anim_list)
	.2byte (unit_icon_move_19_anim_1 - unit_icon_move_19_anim_list)
	.2byte (unit_icon_move_19_anim_2 - unit_icon_move_19_anim_list)
	.2byte (unit_icon_move_19_anim_3 - unit_icon_move_19_anim_list)
	.2byte (unit_icon_move_19_anim_4 - unit_icon_move_19_anim_list)

unit_icon_move_19_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_19_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_19_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_19_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_19_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_19_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_19_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_19_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_19_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_19_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_19_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_19_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_19_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_19_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_19_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_19_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_19_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_19_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_19_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_19_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_19_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_19_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_19_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_19_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_20_sheet
unit_icon_move_20_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_20_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_20_motion
unit_icon_move_20_motion:
	.2byte (unit_icon_move_20_frame_list - unit_icon_move_20_motion), (unit_icon_move_20_anim_list - unit_icon_move_20_motion) @ header

unit_icon_move_20_frame_list: @ +$4
	.2byte (unit_icon_move_20_frame_0 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_1 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_2 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_3 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_4 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_5 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_6 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_7 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_8 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_9 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_10 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_11 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_12 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_13 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_14 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_15 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_16 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_17 - unit_icon_move_20_frame_list)
	.2byte (unit_icon_move_20_frame_18 - unit_icon_move_20_frame_list)

unit_icon_move_20_anim_list: @ +$2A
	.2byte (unit_icon_move_20_anim_0 - unit_icon_move_20_anim_list)
	.2byte (unit_icon_move_20_anim_1 - unit_icon_move_20_anim_list)
	.2byte (unit_icon_move_20_anim_2 - unit_icon_move_20_anim_list)
	.2byte (unit_icon_move_20_anim_3 - unit_icon_move_20_anim_list)
	.2byte (unit_icon_move_20_anim_4 - unit_icon_move_20_anim_list)

unit_icon_move_20_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_20_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_20_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_20_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_20_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_20_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_20_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_20_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_20_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_20_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_20_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_20_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_20_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_20_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_20_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_20_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_20_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_20_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_20_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x0, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_20_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_20_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_20_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_20_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_20_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_21_sheet
unit_icon_move_21_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_21_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_21_motion
unit_icon_move_21_motion:
	.2byte (unit_icon_move_21_frame_list - unit_icon_move_21_motion), (unit_icon_move_21_anim_list - unit_icon_move_21_motion) @ header

unit_icon_move_21_frame_list: @ +$4
	.2byte (unit_icon_move_21_frame_0 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_1 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_2 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_3 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_4 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_5 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_6 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_7 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_8 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_9 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_10 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_11 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_12 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_13 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_14 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_15 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_16 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_17 - unit_icon_move_21_frame_list)
	.2byte (unit_icon_move_21_frame_18 - unit_icon_move_21_frame_list)

unit_icon_move_21_anim_list: @ +$2A
	.2byte (unit_icon_move_21_anim_0 - unit_icon_move_21_anim_list)
	.2byte (unit_icon_move_21_anim_1 - unit_icon_move_21_anim_list)
	.2byte (unit_icon_move_21_anim_2 - unit_icon_move_21_anim_list)
	.2byte (unit_icon_move_21_anim_3 - unit_icon_move_21_anim_list)
	.2byte (unit_icon_move_21_anim_4 - unit_icon_move_21_anim_list)

unit_icon_move_21_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_21_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_21_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_21_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_21_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_21_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_21_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_21_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_21_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_21_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_21_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_21_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_21_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_21_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_21_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_21_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_21_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_21_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_21_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x0, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_21_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_21_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_21_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_21_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_21_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_22_sheet
unit_icon_move_22_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_22_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_22_motion
unit_icon_move_22_motion:
	.2byte (unit_icon_move_22_frame_list - unit_icon_move_22_motion), (unit_icon_move_22_anim_list - unit_icon_move_22_motion) @ header

unit_icon_move_22_frame_list: @ +$4
	.2byte (unit_icon_move_22_frame_0 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_1 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_2 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_3 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_4 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_5 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_6 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_7 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_8 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_9 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_10 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_11 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_12 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_13 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_14 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_15 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_16 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_17 - unit_icon_move_22_frame_list)
	.2byte (unit_icon_move_22_frame_18 - unit_icon_move_22_frame_list)

unit_icon_move_22_anim_list: @ +$2A
	.2byte (unit_icon_move_22_anim_0 - unit_icon_move_22_anim_list)
	.2byte (unit_icon_move_22_anim_1 - unit_icon_move_22_anim_list)
	.2byte (unit_icon_move_22_anim_2 - unit_icon_move_22_anim_list)
	.2byte (unit_icon_move_22_anim_3 - unit_icon_move_22_anim_list)
	.2byte (unit_icon_move_22_anim_4 - unit_icon_move_22_anim_list)

unit_icon_move_22_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_22_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_22_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_22_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_22_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_22_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_22_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_22_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_22_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_22_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_22_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_22_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_22_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_22_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_22_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_22_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_22_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_22_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_22_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_22_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_22_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_22_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_22_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_22_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_23_sheet
unit_icon_move_23_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_23_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_23_motion
unit_icon_move_23_motion:
	.2byte (unit_icon_move_23_frame_list - unit_icon_move_23_motion), (unit_icon_move_23_anim_list - unit_icon_move_23_motion) @ header

unit_icon_move_23_frame_list: @ +$4
	.2byte (unit_icon_move_23_frame_0 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_1 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_2 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_3 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_4 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_5 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_6 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_7 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_8 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_9 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_10 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_11 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_12 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_13 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_14 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_15 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_16 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_17 - unit_icon_move_23_frame_list)
	.2byte (unit_icon_move_23_frame_18 - unit_icon_move_23_frame_list)

unit_icon_move_23_anim_list: @ +$2A
	.2byte (unit_icon_move_23_anim_0 - unit_icon_move_23_anim_list)
	.2byte (unit_icon_move_23_anim_1 - unit_icon_move_23_anim_list)
	.2byte (unit_icon_move_23_anim_2 - unit_icon_move_23_anim_list)
	.2byte (unit_icon_move_23_anim_3 - unit_icon_move_23_anim_list)
	.2byte (unit_icon_move_23_anim_4 - unit_icon_move_23_anim_list)

unit_icon_move_23_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_23_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_23_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_23_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_23_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_23_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_23_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_23_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_23_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_23_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_23_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_23_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_23_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_23_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_23_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_23_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_23_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_23_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_23_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_23_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_23_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_23_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_23_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_23_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_24_sheet
unit_icon_move_24_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_24_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_24_motion
unit_icon_move_24_motion:
	.2byte (unit_icon_move_24_frame_list - unit_icon_move_24_motion), (unit_icon_move_24_anim_list - unit_icon_move_24_motion) @ header

unit_icon_move_24_frame_list: @ +$4
	.2byte (unit_icon_move_24_frame_0 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_1 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_2 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_3 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_4 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_5 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_6 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_7 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_8 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_9 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_10 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_11 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_12 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_13 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_14 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_15 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_16 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_17 - unit_icon_move_24_frame_list)
	.2byte (unit_icon_move_24_frame_18 - unit_icon_move_24_frame_list)

unit_icon_move_24_anim_list: @ +$2A
	.2byte (unit_icon_move_24_anim_0 - unit_icon_move_24_anim_list)
	.2byte (unit_icon_move_24_anim_1 - unit_icon_move_24_anim_list)
	.2byte (unit_icon_move_24_anim_2 - unit_icon_move_24_anim_list)
	.2byte (unit_icon_move_24_anim_3 - unit_icon_move_24_anim_list)
	.2byte (unit_icon_move_24_anim_4 - unit_icon_move_24_anim_list)

unit_icon_move_24_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_24_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_24_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_24_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_24_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_24_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_24_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_24_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_24_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_24_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_24_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_24_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_24_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_24_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_24_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_24_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_24_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_24_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_24_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_24_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_24_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_24_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_24_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_24_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_25_sheet
unit_icon_move_25_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_25_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_25_motion
unit_icon_move_25_motion:
	.2byte (unit_icon_move_25_frame_list - unit_icon_move_25_motion), (unit_icon_move_25_anim_list - unit_icon_move_25_motion) @ header

unit_icon_move_25_frame_list: @ +$4
	.2byte (unit_icon_move_25_frame_0 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_1 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_2 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_3 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_4 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_5 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_6 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_7 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_8 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_9 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_10 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_11 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_12 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_13 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_14 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_15 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_16 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_17 - unit_icon_move_25_frame_list)
	.2byte (unit_icon_move_25_frame_18 - unit_icon_move_25_frame_list)

unit_icon_move_25_anim_list: @ +$2A
	.2byte (unit_icon_move_25_anim_0 - unit_icon_move_25_anim_list)
	.2byte (unit_icon_move_25_anim_1 - unit_icon_move_25_anim_list)
	.2byte (unit_icon_move_25_anim_2 - unit_icon_move_25_anim_list)
	.2byte (unit_icon_move_25_anim_3 - unit_icon_move_25_anim_list)
	.2byte (unit_icon_move_25_anim_4 - unit_icon_move_25_anim_list)

unit_icon_move_25_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_25_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_25_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_25_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_25_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_25_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_25_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_25_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_25_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_25_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_25_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_25_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_25_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_25_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_25_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_25_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_25_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_25_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_25_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_25_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_25_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_25_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_25_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_25_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_26_sheet
unit_icon_move_26_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_26_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_26_motion
unit_icon_move_26_motion:
	.2byte (unit_icon_move_26_frame_list - unit_icon_move_26_motion), (unit_icon_move_26_anim_list - unit_icon_move_26_motion) @ header

unit_icon_move_26_frame_list: @ +$4
	.2byte (unit_icon_move_26_frame_0 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_1 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_2 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_3 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_4 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_5 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_6 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_7 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_8 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_9 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_10 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_11 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_12 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_13 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_14 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_15 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_16 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_17 - unit_icon_move_26_frame_list)
	.2byte (unit_icon_move_26_frame_18 - unit_icon_move_26_frame_list)

unit_icon_move_26_anim_list: @ +$2A
	.2byte (unit_icon_move_26_anim_0 - unit_icon_move_26_anim_list)
	.2byte (unit_icon_move_26_anim_1 - unit_icon_move_26_anim_list)
	.2byte (unit_icon_move_26_anim_2 - unit_icon_move_26_anim_list)
	.2byte (unit_icon_move_26_anim_3 - unit_icon_move_26_anim_list)
	.2byte (unit_icon_move_26_anim_4 - unit_icon_move_26_anim_list)

unit_icon_move_26_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_26_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_26_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_26_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_26_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_26_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_26_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_26_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_26_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_26_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_26_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_26_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_26_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_26_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_26_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_26_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_26_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_26_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_26_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_26_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_26_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_26_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_26_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_26_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_27_sheet
unit_icon_move_27_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_27_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_27_motion
unit_icon_move_27_motion:
	.2byte (unit_icon_move_27_frame_list - unit_icon_move_27_motion), (unit_icon_move_27_anim_list - unit_icon_move_27_motion) @ header

unit_icon_move_27_frame_list: @ +$4
	.2byte (unit_icon_move_27_frame_0 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_1 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_2 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_3 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_4 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_5 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_6 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_7 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_8 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_9 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_10 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_11 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_12 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_13 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_14 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_15 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_16 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_17 - unit_icon_move_27_frame_list)
	.2byte (unit_icon_move_27_frame_18 - unit_icon_move_27_frame_list)

unit_icon_move_27_anim_list: @ +$2A
	.2byte (unit_icon_move_27_anim_0 - unit_icon_move_27_anim_list)
	.2byte (unit_icon_move_27_anim_1 - unit_icon_move_27_anim_list)
	.2byte (unit_icon_move_27_anim_2 - unit_icon_move_27_anim_list)
	.2byte (unit_icon_move_27_anim_3 - unit_icon_move_27_anim_list)
	.2byte (unit_icon_move_27_anim_4 - unit_icon_move_27_anim_list)

unit_icon_move_27_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_27_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_27_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_27_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_27_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_27_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_27_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_27_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_27_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_27_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_27_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_27_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_27_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_27_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_27_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_27_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_27_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_27_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_27_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_27_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_27_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_27_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_27_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_27_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_28_sheet
unit_icon_move_28_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_28_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_28_motion
unit_icon_move_28_motion:
	.2byte (unit_icon_move_28_frame_list - unit_icon_move_28_motion), (unit_icon_move_28_anim_list - unit_icon_move_28_motion) @ header

unit_icon_move_28_frame_list: @ +$4
	.2byte (unit_icon_move_28_frame_0 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_1 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_2 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_3 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_4 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_5 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_6 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_7 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_8 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_9 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_10 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_11 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_12 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_13 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_14 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_15 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_16 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_17 - unit_icon_move_28_frame_list)
	.2byte (unit_icon_move_28_frame_18 - unit_icon_move_28_frame_list)

unit_icon_move_28_anim_list: @ +$2A
	.2byte (unit_icon_move_28_anim_0 - unit_icon_move_28_anim_list)
	.2byte (unit_icon_move_28_anim_1 - unit_icon_move_28_anim_list)
	.2byte (unit_icon_move_28_anim_2 - unit_icon_move_28_anim_list)
	.2byte (unit_icon_move_28_anim_3 - unit_icon_move_28_anim_list)
	.2byte (unit_icon_move_28_anim_4 - unit_icon_move_28_anim_list)

unit_icon_move_28_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_28_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_28_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_28_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_28_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_28_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_28_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_28_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_28_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_28_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_28_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_28_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_28_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_28_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_28_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_28_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_28_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_28_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_28_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_28_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_28_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_28_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_28_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_28_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_30_sheet
unit_icon_move_30_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_30_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_30_motion
unit_icon_move_30_motion:
	.2byte (unit_icon_move_30_frame_list - unit_icon_move_30_motion), (unit_icon_move_30_anim_list - unit_icon_move_30_motion) @ header

unit_icon_move_30_frame_list: @ +$4
	.2byte (unit_icon_move_30_frame_0 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_1 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_2 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_3 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_4 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_5 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_6 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_7 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_8 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_9 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_10 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_11 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_12 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_13 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_14 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_15 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_16 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_17 - unit_icon_move_30_frame_list)
	.2byte (unit_icon_move_30_frame_18 - unit_icon_move_30_frame_list)

unit_icon_move_30_anim_list: @ +$2A
	.2byte (unit_icon_move_30_anim_0 - unit_icon_move_30_anim_list)
	.2byte (unit_icon_move_30_anim_1 - unit_icon_move_30_anim_list)
	.2byte (unit_icon_move_30_anim_2 - unit_icon_move_30_anim_list)
	.2byte (unit_icon_move_30_anim_3 - unit_icon_move_30_anim_list)
	.2byte (unit_icon_move_30_anim_4 - unit_icon_move_30_anim_list)

unit_icon_move_30_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_30_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_30_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_30_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_30_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_30_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_30_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_30_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_30_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_30_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_30_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_30_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_30_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_30_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_30_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_30_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_30_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_30_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_30_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_30_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_30_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_30_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_30_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_30_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_31_sheet
unit_icon_move_31_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_31_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_31_motion
unit_icon_move_31_motion:
	.2byte (unit_icon_move_31_frame_list - unit_icon_move_31_motion), (unit_icon_move_31_anim_list - unit_icon_move_31_motion) @ header

unit_icon_move_31_frame_list: @ +$4
	.2byte (unit_icon_move_31_frame_0 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_1 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_2 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_3 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_4 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_5 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_6 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_7 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_8 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_9 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_10 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_11 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_12 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_13 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_14 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_15 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_16 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_17 - unit_icon_move_31_frame_list)
	.2byte (unit_icon_move_31_frame_18 - unit_icon_move_31_frame_list)

unit_icon_move_31_anim_list: @ +$2A
	.2byte (unit_icon_move_31_anim_0 - unit_icon_move_31_anim_list)
	.2byte (unit_icon_move_31_anim_1 - unit_icon_move_31_anim_list)
	.2byte (unit_icon_move_31_anim_2 - unit_icon_move_31_anim_list)
	.2byte (unit_icon_move_31_anim_3 - unit_icon_move_31_anim_list)
	.2byte (unit_icon_move_31_anim_4 - unit_icon_move_31_anim_list)

unit_icon_move_31_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_31_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_31_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_31_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_31_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_31_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_31_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_31_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_31_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_31_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_31_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_31_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_31_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_31_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_31_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_31_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_31_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_31_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_31_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_31_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_31_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_31_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_31_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_31_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_32_sheet
unit_icon_move_32_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_32_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_32_motion
unit_icon_move_32_motion:
	.2byte (unit_icon_move_32_frame_list - unit_icon_move_32_motion), (unit_icon_move_32_anim_list - unit_icon_move_32_motion) @ header

unit_icon_move_32_frame_list: @ +$4
	.2byte (unit_icon_move_32_frame_0 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_1 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_2 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_3 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_4 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_5 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_6 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_7 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_8 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_9 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_10 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_11 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_12 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_13 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_14 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_15 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_16 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_17 - unit_icon_move_32_frame_list)
	.2byte (unit_icon_move_32_frame_18 - unit_icon_move_32_frame_list)

unit_icon_move_32_anim_list: @ +$2A
	.2byte (unit_icon_move_32_anim_0 - unit_icon_move_32_anim_list)
	.2byte (unit_icon_move_32_anim_1 - unit_icon_move_32_anim_list)
	.2byte (unit_icon_move_32_anim_2 - unit_icon_move_32_anim_list)
	.2byte (unit_icon_move_32_anim_3 - unit_icon_move_32_anim_list)
	.2byte (unit_icon_move_32_anim_4 - unit_icon_move_32_anim_list)

unit_icon_move_32_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_32_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_32_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_32_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_32_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_32_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_32_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_32_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_32_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_32_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_32_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_32_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_32_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_32_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_32_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_32_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_32_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_32_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_32_frame_18: @ +$E8
	.2byte 3 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x4 @ OAM Data #1
	.2byte 0xD8, 0x3, 0x5 @ OAM Data #2
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1
	.2byte 0xF1 @ Sheet Tile #2

unit_icon_move_32_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_32_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_32_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_32_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_32_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_33_sheet
unit_icon_move_33_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_33_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_33_motion
unit_icon_move_33_motion:
	.2byte (unit_icon_move_33_frame_list - unit_icon_move_33_motion), (unit_icon_move_33_anim_list - unit_icon_move_33_motion) @ header

unit_icon_move_33_frame_list: @ +$4
	.2byte (unit_icon_move_33_frame_0 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_1 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_2 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_3 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_4 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_5 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_6 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_7 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_8 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_9 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_10 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_11 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_12 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_13 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_14 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_15 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_16 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_17 - unit_icon_move_33_frame_list)
	.2byte (unit_icon_move_33_frame_18 - unit_icon_move_33_frame_list)

unit_icon_move_33_anim_list: @ +$2A
	.2byte (unit_icon_move_33_anim_0 - unit_icon_move_33_anim_list)
	.2byte (unit_icon_move_33_anim_1 - unit_icon_move_33_anim_list)
	.2byte (unit_icon_move_33_anim_2 - unit_icon_move_33_anim_list)
	.2byte (unit_icon_move_33_anim_3 - unit_icon_move_33_anim_list)
	.2byte (unit_icon_move_33_anim_4 - unit_icon_move_33_anim_list)

unit_icon_move_33_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_33_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_33_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_33_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_33_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_33_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_33_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_33_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_33_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_33_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_33_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_33_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_33_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_33_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_33_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_33_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_33_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_33_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_33_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_33_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_33_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_33_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_33_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_33_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_34_sheet
unit_icon_move_34_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_34_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_34_motion
unit_icon_move_34_motion:
	.2byte (unit_icon_move_34_frame_list - unit_icon_move_34_motion), (unit_icon_move_34_anim_list - unit_icon_move_34_motion) @ header

unit_icon_move_34_frame_list: @ +$4
	.2byte (unit_icon_move_34_frame_0 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_1 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_2 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_3 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_4 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_5 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_6 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_7 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_8 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_9 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_10 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_11 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_12 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_13 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_14 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_15 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_16 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_17 - unit_icon_move_34_frame_list)
	.2byte (unit_icon_move_34_frame_18 - unit_icon_move_34_frame_list)

unit_icon_move_34_anim_list: @ +$2A
	.2byte (unit_icon_move_34_anim_0 - unit_icon_move_34_anim_list)
	.2byte (unit_icon_move_34_anim_1 - unit_icon_move_34_anim_list)
	.2byte (unit_icon_move_34_anim_2 - unit_icon_move_34_anim_list)
	.2byte (unit_icon_move_34_anim_3 - unit_icon_move_34_anim_list)
	.2byte (unit_icon_move_34_anim_4 - unit_icon_move_34_anim_list)

unit_icon_move_34_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_34_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_34_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_34_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_34_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_34_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_34_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_34_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_34_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_34_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_34_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_34_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_34_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_34_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_34_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_34_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_34_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_34_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_34_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0x80E0, 0x13, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_34_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_34_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_34_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_34_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_34_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_36_sheet
unit_icon_move_36_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_36_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_36_motion
unit_icon_move_36_motion:
	.2byte (unit_icon_move_36_frame_list - unit_icon_move_36_motion), (unit_icon_move_36_anim_list - unit_icon_move_36_motion) @ header

unit_icon_move_36_frame_list: @ +$4
	.2byte (unit_icon_move_36_frame_0 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_1 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_2 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_3 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_4 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_5 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_6 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_7 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_8 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_9 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_10 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_11 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_12 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_13 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_14 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_15 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_16 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_17 - unit_icon_move_36_frame_list)
	.2byte (unit_icon_move_36_frame_18 - unit_icon_move_36_frame_list)

unit_icon_move_36_anim_list: @ +$2A
	.2byte (unit_icon_move_36_anim_0 - unit_icon_move_36_anim_list)
	.2byte (unit_icon_move_36_anim_1 - unit_icon_move_36_anim_list)
	.2byte (unit_icon_move_36_anim_2 - unit_icon_move_36_anim_list)
	.2byte (unit_icon_move_36_anim_3 - unit_icon_move_36_anim_list)
	.2byte (unit_icon_move_36_anim_4 - unit_icon_move_36_anim_list)

unit_icon_move_36_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_36_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_36_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_36_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_36_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_36_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_36_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_36_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_36_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_36_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_36_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_36_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_36_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_36_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_36_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_36_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_36_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_36_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_36_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_36_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_36_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_36_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_36_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_36_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_37_sheet
unit_icon_move_37_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_37_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_37_motion
unit_icon_move_37_motion:
	.2byte (unit_icon_move_37_frame_list - unit_icon_move_37_motion), (unit_icon_move_37_anim_list - unit_icon_move_37_motion) @ header

unit_icon_move_37_frame_list: @ +$4
	.2byte (unit_icon_move_37_frame_0 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_1 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_2 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_3 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_4 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_5 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_6 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_7 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_8 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_9 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_10 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_11 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_12 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_13 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_14 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_15 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_16 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_17 - unit_icon_move_37_frame_list)
	.2byte (unit_icon_move_37_frame_18 - unit_icon_move_37_frame_list)

unit_icon_move_37_anim_list: @ +$2A
	.2byte (unit_icon_move_37_anim_0 - unit_icon_move_37_anim_list)
	.2byte (unit_icon_move_37_anim_1 - unit_icon_move_37_anim_list)
	.2byte (unit_icon_move_37_anim_2 - unit_icon_move_37_anim_list)
	.2byte (unit_icon_move_37_anim_3 - unit_icon_move_37_anim_list)
	.2byte (unit_icon_move_37_anim_4 - unit_icon_move_37_anim_list)

unit_icon_move_37_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_37_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_37_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_37_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_37_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_37_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_37_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_37_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_37_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_37_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_37_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_37_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_37_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_37_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_37_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_37_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_37_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_37_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_37_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_37_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_37_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_37_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_37_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_37_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_38_sheet
unit_icon_move_38_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_38_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_38_motion
unit_icon_move_38_motion:
	.2byte (unit_icon_move_38_frame_list - unit_icon_move_38_motion), (unit_icon_move_38_anim_list - unit_icon_move_38_motion) @ header

unit_icon_move_38_frame_list: @ +$4
	.2byte (unit_icon_move_38_frame_0 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_1 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_2 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_3 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_4 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_5 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_6 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_7 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_8 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_9 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_10 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_11 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_12 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_13 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_14 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_15 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_16 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_17 - unit_icon_move_38_frame_list)
	.2byte (unit_icon_move_38_frame_18 - unit_icon_move_38_frame_list)

unit_icon_move_38_anim_list: @ +$2A
	.2byte (unit_icon_move_38_anim_0 - unit_icon_move_38_anim_list)
	.2byte (unit_icon_move_38_anim_1 - unit_icon_move_38_anim_list)
	.2byte (unit_icon_move_38_anim_2 - unit_icon_move_38_anim_list)
	.2byte (unit_icon_move_38_anim_3 - unit_icon_move_38_anim_list)
	.2byte (unit_icon_move_38_anim_4 - unit_icon_move_38_anim_list)

unit_icon_move_38_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_38_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_38_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_38_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_38_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_38_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_38_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_38_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_38_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_38_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_38_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_38_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_38_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_38_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_38_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_38_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_38_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_38_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_38_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_38_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_38_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_38_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_38_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_38_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_39_sheet
unit_icon_move_39_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_39_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_39_motion
unit_icon_move_39_motion:
	.2byte (unit_icon_move_39_frame_list - unit_icon_move_39_motion), (unit_icon_move_39_anim_list - unit_icon_move_39_motion) @ header

unit_icon_move_39_frame_list: @ +$4
	.2byte (unit_icon_move_39_frame_0 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_1 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_2 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_3 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_4 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_5 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_6 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_7 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_8 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_9 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_10 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_11 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_12 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_13 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_14 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_15 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_16 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_17 - unit_icon_move_39_frame_list)
	.2byte (unit_icon_move_39_frame_18 - unit_icon_move_39_frame_list)

unit_icon_move_39_anim_list: @ +$2A
	.2byte (unit_icon_move_39_anim_0 - unit_icon_move_39_anim_list)
	.2byte (unit_icon_move_39_anim_1 - unit_icon_move_39_anim_list)
	.2byte (unit_icon_move_39_anim_2 - unit_icon_move_39_anim_list)
	.2byte (unit_icon_move_39_anim_3 - unit_icon_move_39_anim_list)
	.2byte (unit_icon_move_39_anim_4 - unit_icon_move_39_anim_list)

unit_icon_move_39_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_39_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_39_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_39_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_39_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_39_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_39_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_39_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_39_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_39_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_39_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_39_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_39_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_39_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_39_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_39_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_39_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_39_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_39_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_39_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_39_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_39_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_39_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_39_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_40_sheet
unit_icon_move_40_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_40_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_40_motion
unit_icon_move_40_motion:
	.2byte (unit_icon_move_40_frame_list - unit_icon_move_40_motion), (unit_icon_move_40_anim_list - unit_icon_move_40_motion) @ header

unit_icon_move_40_frame_list: @ +$4
	.2byte (unit_icon_move_40_frame_0 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_1 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_2 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_3 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_4 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_5 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_6 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_7 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_8 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_9 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_10 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_11 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_12 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_13 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_14 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_15 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_16 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_17 - unit_icon_move_40_frame_list)
	.2byte (unit_icon_move_40_frame_18 - unit_icon_move_40_frame_list)

unit_icon_move_40_anim_list: @ +$2A
	.2byte (unit_icon_move_40_anim_0 - unit_icon_move_40_anim_list)
	.2byte (unit_icon_move_40_anim_1 - unit_icon_move_40_anim_list)
	.2byte (unit_icon_move_40_anim_2 - unit_icon_move_40_anim_list)
	.2byte (unit_icon_move_40_anim_3 - unit_icon_move_40_anim_list)
	.2byte (unit_icon_move_40_anim_4 - unit_icon_move_40_anim_list)

unit_icon_move_40_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_40_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_40_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_40_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_40_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_40_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_40_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_40_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_40_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_40_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_40_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_40_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_40_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_40_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_40_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_40_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_40_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_40_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_40_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_40_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_40_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_40_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_40_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_40_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_41_sheet
unit_icon_move_41_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_41_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_41_motion
unit_icon_move_41_motion:
	.2byte (unit_icon_move_41_frame_list - unit_icon_move_41_motion), (unit_icon_move_41_anim_list - unit_icon_move_41_motion) @ header

unit_icon_move_41_frame_list: @ +$4
	.2byte (unit_icon_move_41_frame_0 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_1 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_2 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_3 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_4 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_5 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_6 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_7 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_8 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_9 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_10 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_11 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_12 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_13 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_14 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_15 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_16 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_17 - unit_icon_move_41_frame_list)
	.2byte (unit_icon_move_41_frame_18 - unit_icon_move_41_frame_list)

unit_icon_move_41_anim_list: @ +$2A
	.2byte (unit_icon_move_41_anim_0 - unit_icon_move_41_anim_list)
	.2byte (unit_icon_move_41_anim_1 - unit_icon_move_41_anim_list)
	.2byte (unit_icon_move_41_anim_2 - unit_icon_move_41_anim_list)
	.2byte (unit_icon_move_41_anim_3 - unit_icon_move_41_anim_list)
	.2byte (unit_icon_move_41_anim_4 - unit_icon_move_41_anim_list)

unit_icon_move_41_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_41_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_41_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_41_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_41_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_41_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_41_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_41_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_41_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_41_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_41_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_41_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_41_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_41_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_41_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_41_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_41_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_41_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_41_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_41_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_41_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_41_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_41_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_41_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_42_sheet
unit_icon_move_42_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_42_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_42_motion
unit_icon_move_42_motion:
	.2byte (unit_icon_move_42_frame_list - unit_icon_move_42_motion), (unit_icon_move_42_anim_list - unit_icon_move_42_motion) @ header

unit_icon_move_42_frame_list: @ +$4
	.2byte (unit_icon_move_42_frame_0 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_1 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_2 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_3 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_4 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_5 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_6 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_7 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_8 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_9 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_10 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_11 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_12 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_13 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_14 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_15 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_16 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_17 - unit_icon_move_42_frame_list)
	.2byte (unit_icon_move_42_frame_18 - unit_icon_move_42_frame_list)

unit_icon_move_42_anim_list: @ +$2A
	.2byte (unit_icon_move_42_anim_0 - unit_icon_move_42_anim_list)
	.2byte (unit_icon_move_42_anim_1 - unit_icon_move_42_anim_list)
	.2byte (unit_icon_move_42_anim_2 - unit_icon_move_42_anim_list)
	.2byte (unit_icon_move_42_anim_3 - unit_icon_move_42_anim_list)
	.2byte (unit_icon_move_42_anim_4 - unit_icon_move_42_anim_list)

unit_icon_move_42_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_42_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_42_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_42_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_42_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_42_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_42_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_42_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_42_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_42_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_42_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_42_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_42_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_42_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_42_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_42_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_42_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_42_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_42_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_42_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_42_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_42_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_42_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_42_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_43_sheet
unit_icon_move_43_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_43_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_43_motion
unit_icon_move_43_motion:
	.2byte (unit_icon_move_43_frame_list - unit_icon_move_43_motion), (unit_icon_move_43_anim_list - unit_icon_move_43_motion) @ header

unit_icon_move_43_frame_list: @ +$4
	.2byte (unit_icon_move_43_frame_0 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_1 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_2 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_3 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_4 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_5 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_6 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_7 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_8 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_9 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_10 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_11 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_12 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_13 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_14 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_15 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_16 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_17 - unit_icon_move_43_frame_list)
	.2byte (unit_icon_move_43_frame_18 - unit_icon_move_43_frame_list)

unit_icon_move_43_anim_list: @ +$2A
	.2byte (unit_icon_move_43_anim_0 - unit_icon_move_43_anim_list)
	.2byte (unit_icon_move_43_anim_1 - unit_icon_move_43_anim_list)
	.2byte (unit_icon_move_43_anim_2 - unit_icon_move_43_anim_list)
	.2byte (unit_icon_move_43_anim_3 - unit_icon_move_43_anim_list)
	.2byte (unit_icon_move_43_anim_4 - unit_icon_move_43_anim_list)

unit_icon_move_43_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_43_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_43_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_43_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_43_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_43_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_43_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_43_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_43_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_43_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_43_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_43_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_43_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_43_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_43_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_43_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_43_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_43_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_43_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_43_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_43_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_43_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_43_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_43_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_44_sheet
unit_icon_move_44_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_44_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_44_motion
unit_icon_move_44_motion:
	.2byte (unit_icon_move_44_frame_list - unit_icon_move_44_motion), (unit_icon_move_44_anim_list - unit_icon_move_44_motion) @ header

unit_icon_move_44_frame_list: @ +$4
	.2byte (unit_icon_move_44_frame_0 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_1 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_2 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_3 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_4 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_5 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_6 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_7 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_8 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_9 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_10 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_11 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_12 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_13 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_14 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_15 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_16 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_17 - unit_icon_move_44_frame_list)
	.2byte (unit_icon_move_44_frame_18 - unit_icon_move_44_frame_list)

unit_icon_move_44_anim_list: @ +$2A
	.2byte (unit_icon_move_44_anim_0 - unit_icon_move_44_anim_list)
	.2byte (unit_icon_move_44_anim_1 - unit_icon_move_44_anim_list)
	.2byte (unit_icon_move_44_anim_2 - unit_icon_move_44_anim_list)
	.2byte (unit_icon_move_44_anim_3 - unit_icon_move_44_anim_list)
	.2byte (unit_icon_move_44_anim_4 - unit_icon_move_44_anim_list)

unit_icon_move_44_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_44_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_44_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_44_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_44_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_44_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_44_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_44_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_44_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_44_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_44_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_44_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_44_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_44_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_44_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_44_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_44_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_44_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_44_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_44_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_44_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_44_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_44_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_44_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_46_sheet
unit_icon_move_46_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_46_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_46_motion
unit_icon_move_46_motion:
	.2byte (unit_icon_move_46_frame_list - unit_icon_move_46_motion), (unit_icon_move_46_anim_list - unit_icon_move_46_motion) @ header

unit_icon_move_46_frame_list: @ +$4
	.2byte (unit_icon_move_46_frame_0 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_1 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_2 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_3 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_4 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_5 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_6 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_7 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_8 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_9 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_10 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_11 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_12 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_13 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_14 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_15 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_16 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_17 - unit_icon_move_46_frame_list)
	.2byte (unit_icon_move_46_frame_18 - unit_icon_move_46_frame_list)

unit_icon_move_46_anim_list: @ +$2A
	.2byte (unit_icon_move_46_anim_0 - unit_icon_move_46_anim_list)
	.2byte (unit_icon_move_46_anim_1 - unit_icon_move_46_anim_list)
	.2byte (unit_icon_move_46_anim_2 - unit_icon_move_46_anim_list)
	.2byte (unit_icon_move_46_anim_3 - unit_icon_move_46_anim_list)
	.2byte (unit_icon_move_46_anim_4 - unit_icon_move_46_anim_list)

unit_icon_move_46_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_46_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_46_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_46_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_46_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_46_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_46_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_46_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_46_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_46_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_46_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_46_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_46_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_46_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_46_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_46_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_46_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_46_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_46_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_46_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_46_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_46_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_46_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_46_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_48_sheet
unit_icon_move_48_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_48_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_48_motion
unit_icon_move_48_motion:
	.2byte (unit_icon_move_48_frame_list - unit_icon_move_48_motion), (unit_icon_move_48_anim_list - unit_icon_move_48_motion) @ header

unit_icon_move_48_frame_list: @ +$4
	.2byte (unit_icon_move_48_frame_0 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_1 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_2 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_3 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_4 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_5 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_6 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_7 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_8 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_9 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_10 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_11 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_12 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_13 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_14 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_15 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_16 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_17 - unit_icon_move_48_frame_list)
	.2byte (unit_icon_move_48_frame_18 - unit_icon_move_48_frame_list)

unit_icon_move_48_anim_list: @ +$2A
	.2byte (unit_icon_move_48_anim_0 - unit_icon_move_48_anim_list)
	.2byte (unit_icon_move_48_anim_1 - unit_icon_move_48_anim_list)
	.2byte (unit_icon_move_48_anim_2 - unit_icon_move_48_anim_list)
	.2byte (unit_icon_move_48_anim_3 - unit_icon_move_48_anim_list)
	.2byte (unit_icon_move_48_anim_4 - unit_icon_move_48_anim_list)

unit_icon_move_48_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_48_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_48_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_48_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_48_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_48_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_48_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_48_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_48_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_48_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_48_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_48_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_48_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_48_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_48_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_48_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_48_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_48_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_48_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_48_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_48_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_48_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_48_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_48_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_50_sheet
unit_icon_move_50_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_50_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_50_motion
unit_icon_move_50_motion:
	.2byte (unit_icon_move_50_frame_list - unit_icon_move_50_motion), (unit_icon_move_50_anim_list - unit_icon_move_50_motion) @ header

unit_icon_move_50_frame_list: @ +$4
	.2byte (unit_icon_move_50_frame_0 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_1 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_2 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_3 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_4 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_5 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_6 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_7 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_8 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_9 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_10 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_11 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_12 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_13 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_14 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_15 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_16 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_17 - unit_icon_move_50_frame_list)
	.2byte (unit_icon_move_50_frame_18 - unit_icon_move_50_frame_list)

unit_icon_move_50_anim_list: @ +$2A
	.2byte (unit_icon_move_50_anim_0 - unit_icon_move_50_anim_list)
	.2byte (unit_icon_move_50_anim_1 - unit_icon_move_50_anim_list)
	.2byte (unit_icon_move_50_anim_2 - unit_icon_move_50_anim_list)
	.2byte (unit_icon_move_50_anim_3 - unit_icon_move_50_anim_list)
	.2byte (unit_icon_move_50_anim_4 - unit_icon_move_50_anim_list)

unit_icon_move_50_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_50_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_50_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_50_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_50_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_50_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_50_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_50_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_50_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_50_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_50_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_50_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_50_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_50_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_50_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_50_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_50_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_50_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_50_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_50_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_50_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_50_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_50_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_50_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_51_sheet
unit_icon_move_51_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_51_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_51_motion
unit_icon_move_51_motion:
	.2byte (unit_icon_move_51_frame_list - unit_icon_move_51_motion), (unit_icon_move_51_anim_list - unit_icon_move_51_motion) @ header

unit_icon_move_51_frame_list: @ +$4
	.2byte (unit_icon_move_51_frame_0 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_1 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_2 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_3 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_4 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_5 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_6 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_7 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_8 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_9 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_10 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_11 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_12 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_13 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_14 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_15 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_16 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_17 - unit_icon_move_51_frame_list)
	.2byte (unit_icon_move_51_frame_18 - unit_icon_move_51_frame_list)

unit_icon_move_51_anim_list: @ +$2A
	.2byte (unit_icon_move_51_anim_0 - unit_icon_move_51_anim_list)
	.2byte (unit_icon_move_51_anim_1 - unit_icon_move_51_anim_list)
	.2byte (unit_icon_move_51_anim_2 - unit_icon_move_51_anim_list)
	.2byte (unit_icon_move_51_anim_3 - unit_icon_move_51_anim_list)
	.2byte (unit_icon_move_51_anim_4 - unit_icon_move_51_anim_list)

unit_icon_move_51_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_51_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_51_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_51_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_51_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_51_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_51_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_51_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_51_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_51_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_51_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_51_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_51_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_51_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_51_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_51_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_51_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_51_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_51_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_51_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_51_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_51_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_51_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_51_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_52_sheet
unit_icon_move_52_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_52_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_52_motion
unit_icon_move_52_motion:
	.2byte (unit_icon_move_52_frame_list - unit_icon_move_52_motion), (unit_icon_move_52_anim_list - unit_icon_move_52_motion) @ header

unit_icon_move_52_frame_list: @ +$4
	.2byte (unit_icon_move_52_frame_0 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_1 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_2 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_3 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_4 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_5 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_6 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_7 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_8 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_9 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_10 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_11 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_12 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_13 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_14 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_15 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_16 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_17 - unit_icon_move_52_frame_list)
	.2byte (unit_icon_move_52_frame_18 - unit_icon_move_52_frame_list)

unit_icon_move_52_anim_list: @ +$2A
	.2byte (unit_icon_move_52_anim_0 - unit_icon_move_52_anim_list)
	.2byte (unit_icon_move_52_anim_1 - unit_icon_move_52_anim_list)
	.2byte (unit_icon_move_52_anim_2 - unit_icon_move_52_anim_list)
	.2byte (unit_icon_move_52_anim_3 - unit_icon_move_52_anim_list)
	.2byte (unit_icon_move_52_anim_4 - unit_icon_move_52_anim_list)

unit_icon_move_52_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_52_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_52_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_52_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_52_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_52_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_52_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_52_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_52_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_52_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_52_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_52_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_52_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_52_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_52_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_52_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_52_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_52_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_52_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_52_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_52_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_52_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_52_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_52_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_54_sheet
unit_icon_move_54_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_54_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_54_motion
unit_icon_move_54_motion:
	.2byte (unit_icon_move_54_frame_list - unit_icon_move_54_motion), (unit_icon_move_54_anim_list - unit_icon_move_54_motion) @ header

unit_icon_move_54_frame_list: @ +$4
	.2byte (unit_icon_move_54_frame_0 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_1 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_2 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_3 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_4 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_5 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_6 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_7 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_8 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_9 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_10 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_11 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_12 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_13 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_14 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_15 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_16 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_17 - unit_icon_move_54_frame_list)
	.2byte (unit_icon_move_54_frame_18 - unit_icon_move_54_frame_list)

unit_icon_move_54_anim_list: @ +$2A
	.2byte (unit_icon_move_54_anim_0 - unit_icon_move_54_anim_list)
	.2byte (unit_icon_move_54_anim_1 - unit_icon_move_54_anim_list)
	.2byte (unit_icon_move_54_anim_2 - unit_icon_move_54_anim_list)
	.2byte (unit_icon_move_54_anim_3 - unit_icon_move_54_anim_list)
	.2byte (unit_icon_move_54_anim_4 - unit_icon_move_54_anim_list)

unit_icon_move_54_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_54_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_54_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_54_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_54_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_54_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_54_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_54_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_54_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_54_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_54_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_54_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_54_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_54_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_54_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_54_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_54_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_54_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_54_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_54_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_54_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_54_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_54_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_54_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_55_sheet
unit_icon_move_55_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_55_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_55_motion
unit_icon_move_55_motion:
	.2byte (unit_icon_move_55_frame_list - unit_icon_move_55_motion), (unit_icon_move_55_anim_list - unit_icon_move_55_motion) @ header

unit_icon_move_55_frame_list: @ +$4
	.2byte (unit_icon_move_55_frame_0 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_1 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_2 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_3 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_4 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_5 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_6 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_7 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_8 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_9 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_10 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_11 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_12 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_13 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_14 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_15 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_16 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_17 - unit_icon_move_55_frame_list)
	.2byte (unit_icon_move_55_frame_18 - unit_icon_move_55_frame_list)

unit_icon_move_55_anim_list: @ +$2A
	.2byte (unit_icon_move_55_anim_0 - unit_icon_move_55_anim_list)
	.2byte (unit_icon_move_55_anim_1 - unit_icon_move_55_anim_list)
	.2byte (unit_icon_move_55_anim_2 - unit_icon_move_55_anim_list)
	.2byte (unit_icon_move_55_anim_3 - unit_icon_move_55_anim_list)
	.2byte (unit_icon_move_55_anim_4 - unit_icon_move_55_anim_list)

unit_icon_move_55_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_55_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_55_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_55_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_55_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_55_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_55_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_55_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_55_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_55_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_55_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_55_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_55_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_55_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_55_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_55_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_55_frame_16: @ +$D4
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0, 0x1F1, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_55_frame_17: @ +$E6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_55_frame_18: @ +$F0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_55_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_55_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_55_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_55_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_55_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_56_sheet
unit_icon_move_56_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_56_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_56_motion
unit_icon_move_56_motion:
	.2byte (unit_icon_move_56_frame_list - unit_icon_move_56_motion), (unit_icon_move_56_anim_list - unit_icon_move_56_motion) @ header

unit_icon_move_56_frame_list: @ +$4
	.2byte (unit_icon_move_56_frame_0 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_1 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_2 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_3 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_4 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_5 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_6 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_7 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_8 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_9 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_10 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_11 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_12 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_13 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_14 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_15 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_16 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_17 - unit_icon_move_56_frame_list)
	.2byte (unit_icon_move_56_frame_18 - unit_icon_move_56_frame_list)

unit_icon_move_56_anim_list: @ +$2A
	.2byte (unit_icon_move_56_anim_0 - unit_icon_move_56_anim_list)
	.2byte (unit_icon_move_56_anim_1 - unit_icon_move_56_anim_list)
	.2byte (unit_icon_move_56_anim_2 - unit_icon_move_56_anim_list)
	.2byte (unit_icon_move_56_anim_3 - unit_icon_move_56_anim_list)
	.2byte (unit_icon_move_56_anim_4 - unit_icon_move_56_anim_list)

unit_icon_move_56_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_56_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_56_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_56_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_56_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_56_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_56_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_56_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_56_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_56_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_56_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_56_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_56_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_56_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_56_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_56_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_56_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_56_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_56_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_56_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_56_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_56_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_56_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_56_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_58_sheet
unit_icon_move_58_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_58_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_58_motion
unit_icon_move_58_motion:
	.2byte (unit_icon_move_58_frame_list - unit_icon_move_58_motion), (unit_icon_move_58_anim_list - unit_icon_move_58_motion) @ header

unit_icon_move_58_frame_list: @ +$4
	.2byte (unit_icon_move_58_frame_0 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_1 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_2 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_3 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_4 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_5 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_6 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_7 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_8 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_9 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_10 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_11 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_12 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_13 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_14 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_15 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_16 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_17 - unit_icon_move_58_frame_list)
	.2byte (unit_icon_move_58_frame_18 - unit_icon_move_58_frame_list)

unit_icon_move_58_anim_list: @ +$2A
	.2byte (unit_icon_move_58_anim_0 - unit_icon_move_58_anim_list)
	.2byte (unit_icon_move_58_anim_1 - unit_icon_move_58_anim_list)
	.2byte (unit_icon_move_58_anim_2 - unit_icon_move_58_anim_list)
	.2byte (unit_icon_move_58_anim_3 - unit_icon_move_58_anim_list)
	.2byte (unit_icon_move_58_anim_4 - unit_icon_move_58_anim_list)

unit_icon_move_58_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_58_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_58_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_58_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_58_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_58_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_58_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_58_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_58_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_58_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_58_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_58_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_58_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_58_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_58_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_58_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_58_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_58_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_58_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_58_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_58_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_58_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_58_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_58_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_59_sheet
unit_icon_move_59_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_59_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_59_motion
unit_icon_move_59_motion:
	.2byte (unit_icon_move_59_frame_list - unit_icon_move_59_motion), (unit_icon_move_59_anim_list - unit_icon_move_59_motion) @ header

unit_icon_move_59_frame_list: @ +$4
	.2byte (unit_icon_move_59_frame_0 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_1 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_2 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_3 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_4 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_5 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_6 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_7 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_8 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_9 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_10 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_11 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_12 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_13 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_14 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_15 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_16 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_17 - unit_icon_move_59_frame_list)
	.2byte (unit_icon_move_59_frame_18 - unit_icon_move_59_frame_list)

unit_icon_move_59_anim_list: @ +$2A
	.2byte (unit_icon_move_59_anim_0 - unit_icon_move_59_anim_list)
	.2byte (unit_icon_move_59_anim_1 - unit_icon_move_59_anim_list)
	.2byte (unit_icon_move_59_anim_2 - unit_icon_move_59_anim_list)
	.2byte (unit_icon_move_59_anim_3 - unit_icon_move_59_anim_list)
	.2byte (unit_icon_move_59_anim_4 - unit_icon_move_59_anim_list)

unit_icon_move_59_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_59_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_59_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_59_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_59_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_59_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_59_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_59_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_59_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_59_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_59_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_59_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_59_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_59_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_59_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_59_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_59_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_59_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_59_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_59_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_59_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_59_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_59_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_59_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_62_sheet
unit_icon_move_62_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_62_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_62_motion
unit_icon_move_62_motion:
	.2byte (unit_icon_move_62_frame_list - unit_icon_move_62_motion), (unit_icon_move_62_anim_list - unit_icon_move_62_motion) @ header

unit_icon_move_62_frame_list: @ +$4
	.2byte (unit_icon_move_62_frame_0 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_1 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_2 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_3 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_4 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_5 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_6 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_7 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_8 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_9 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_10 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_11 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_12 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_13 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_14 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_15 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_16 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_17 - unit_icon_move_62_frame_list)
	.2byte (unit_icon_move_62_frame_18 - unit_icon_move_62_frame_list)

unit_icon_move_62_anim_list: @ +$2A
	.2byte (unit_icon_move_62_anim_0 - unit_icon_move_62_anim_list)
	.2byte (unit_icon_move_62_anim_1 - unit_icon_move_62_anim_list)
	.2byte (unit_icon_move_62_anim_2 - unit_icon_move_62_anim_list)
	.2byte (unit_icon_move_62_anim_3 - unit_icon_move_62_anim_list)
	.2byte (unit_icon_move_62_anim_4 - unit_icon_move_62_anim_list)

unit_icon_move_62_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_62_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_62_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_62_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_62_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_62_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_62_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_62_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_62_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_62_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_62_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_62_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_62_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_62_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_62_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_62_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_62_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_62_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_62_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_62_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_62_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_62_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_62_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_62_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_63_sheet
unit_icon_move_63_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_63_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_63_motion
unit_icon_move_63_motion:
	.2byte (unit_icon_move_63_frame_list - unit_icon_move_63_motion), (unit_icon_move_63_anim_list - unit_icon_move_63_motion) @ header

unit_icon_move_63_frame_list: @ +$4
	.2byte (unit_icon_move_63_frame_0 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_1 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_2 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_3 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_4 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_5 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_6 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_7 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_8 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_9 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_10 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_11 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_12 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_13 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_14 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_15 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_16 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_17 - unit_icon_move_63_frame_list)
	.2byte (unit_icon_move_63_frame_18 - unit_icon_move_63_frame_list)

unit_icon_move_63_anim_list: @ +$2A
	.2byte (unit_icon_move_63_anim_0 - unit_icon_move_63_anim_list)
	.2byte (unit_icon_move_63_anim_1 - unit_icon_move_63_anim_list)
	.2byte (unit_icon_move_63_anim_2 - unit_icon_move_63_anim_list)
	.2byte (unit_icon_move_63_anim_3 - unit_icon_move_63_anim_list)
	.2byte (unit_icon_move_63_anim_4 - unit_icon_move_63_anim_list)

unit_icon_move_63_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_63_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_63_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_63_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_63_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_63_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_63_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_63_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_63_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_63_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_63_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_63_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_63_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_63_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_63_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_63_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_63_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_63_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_63_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_63_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_63_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_63_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_63_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_63_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_64_sheet
unit_icon_move_64_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_64_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_64_motion
unit_icon_move_64_motion:
	.2byte (unit_icon_move_64_frame_list - unit_icon_move_64_motion), (unit_icon_move_64_anim_list - unit_icon_move_64_motion) @ header

unit_icon_move_64_frame_list: @ +$4
	.2byte (unit_icon_move_64_frame_0 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_1 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_2 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_3 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_4 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_5 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_6 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_7 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_8 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_9 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_10 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_11 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_12 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_13 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_14 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_15 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_16 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_17 - unit_icon_move_64_frame_list)
	.2byte (unit_icon_move_64_frame_18 - unit_icon_move_64_frame_list)

unit_icon_move_64_anim_list: @ +$2A
	.2byte (unit_icon_move_64_anim_0 - unit_icon_move_64_anim_list)
	.2byte (unit_icon_move_64_anim_1 - unit_icon_move_64_anim_list)
	.2byte (unit_icon_move_64_anim_2 - unit_icon_move_64_anim_list)
	.2byte (unit_icon_move_64_anim_3 - unit_icon_move_64_anim_list)
	.2byte (unit_icon_move_64_anim_4 - unit_icon_move_64_anim_list)

unit_icon_move_64_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_64_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_64_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_64_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_64_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_64_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_64_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_64_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_64_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_64_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_64_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_64_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_64_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_64_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_64_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_64_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_64_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_64_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_64_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_64_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_64_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_64_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_64_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_64_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_65_sheet
unit_icon_move_65_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_65_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_65_motion
unit_icon_move_65_motion:
	.2byte (unit_icon_move_65_frame_list - unit_icon_move_65_motion), (unit_icon_move_65_anim_list - unit_icon_move_65_motion) @ header

unit_icon_move_65_frame_list: @ +$4
	.2byte (unit_icon_move_65_frame_0 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_1 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_2 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_3 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_4 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_5 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_6 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_7 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_8 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_9 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_10 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_11 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_12 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_13 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_14 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_15 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_16 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_17 - unit_icon_move_65_frame_list)
	.2byte (unit_icon_move_65_frame_18 - unit_icon_move_65_frame_list)

unit_icon_move_65_anim_list: @ +$2A
	.2byte (unit_icon_move_65_anim_0 - unit_icon_move_65_anim_list)
	.2byte (unit_icon_move_65_anim_1 - unit_icon_move_65_anim_list)
	.2byte (unit_icon_move_65_anim_2 - unit_icon_move_65_anim_list)
	.2byte (unit_icon_move_65_anim_3 - unit_icon_move_65_anim_list)
	.2byte (unit_icon_move_65_anim_4 - unit_icon_move_65_anim_list)

unit_icon_move_65_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_65_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_65_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_65_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_65_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_65_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_65_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_65_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_65_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_65_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_65_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_65_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_65_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_65_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_65_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_65_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_65_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_65_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_65_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_65_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_65_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_65_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_65_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_65_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_66_sheet
unit_icon_move_66_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_66_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_66_motion
unit_icon_move_66_motion:
	.2byte (unit_icon_move_66_frame_list - unit_icon_move_66_motion), (unit_icon_move_66_anim_list - unit_icon_move_66_motion) @ header

unit_icon_move_66_frame_list: @ +$4
	.2byte (unit_icon_move_66_frame_0 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_1 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_2 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_3 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_4 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_5 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_6 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_7 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_8 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_9 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_10 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_11 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_12 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_13 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_14 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_15 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_16 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_17 - unit_icon_move_66_frame_list)
	.2byte (unit_icon_move_66_frame_18 - unit_icon_move_66_frame_list)

unit_icon_move_66_anim_list: @ +$2A
	.2byte (unit_icon_move_66_anim_0 - unit_icon_move_66_anim_list)
	.2byte (unit_icon_move_66_anim_1 - unit_icon_move_66_anim_list)
	.2byte (unit_icon_move_66_anim_2 - unit_icon_move_66_anim_list)
	.2byte (unit_icon_move_66_anim_3 - unit_icon_move_66_anim_list)
	.2byte (unit_icon_move_66_anim_4 - unit_icon_move_66_anim_list)

unit_icon_move_66_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_66_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_66_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_66_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_66_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_66_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_66_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_66_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_66_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_66_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_66_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_66_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_66_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_66_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_66_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_66_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_66_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_66_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_66_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_66_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_66_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_66_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_66_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_66_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_67_sheet
unit_icon_move_67_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_67_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_67_motion
unit_icon_move_67_motion:
	.2byte (unit_icon_move_67_frame_list - unit_icon_move_67_motion), (unit_icon_move_67_anim_list - unit_icon_move_67_motion) @ header

unit_icon_move_67_frame_list: @ +$4
	.2byte (unit_icon_move_67_frame_0 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_1 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_2 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_3 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_4 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_5 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_6 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_7 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_8 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_9 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_10 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_11 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_12 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_13 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_14 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_15 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_16 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_17 - unit_icon_move_67_frame_list)
	.2byte (unit_icon_move_67_frame_18 - unit_icon_move_67_frame_list)

unit_icon_move_67_anim_list: @ +$2A
	.2byte (unit_icon_move_67_anim_0 - unit_icon_move_67_anim_list)
	.2byte (unit_icon_move_67_anim_1 - unit_icon_move_67_anim_list)
	.2byte (unit_icon_move_67_anim_2 - unit_icon_move_67_anim_list)
	.2byte (unit_icon_move_67_anim_3 - unit_icon_move_67_anim_list)
	.2byte (unit_icon_move_67_anim_4 - unit_icon_move_67_anim_list)

unit_icon_move_67_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_67_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_67_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_67_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_67_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_67_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_67_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_67_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_67_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_67_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_67_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_67_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_67_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_67_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_67_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_67_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_67_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_67_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_67_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_67_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_67_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_67_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_67_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_67_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_68_sheet
unit_icon_move_68_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_68_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_68_motion
unit_icon_move_68_motion:
	.2byte (unit_icon_move_68_frame_list - unit_icon_move_68_motion), (unit_icon_move_68_anim_list - unit_icon_move_68_motion) @ header

unit_icon_move_68_frame_list: @ +$4
	.2byte (unit_icon_move_68_frame_0 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_1 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_2 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_3 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_4 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_5 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_6 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_7 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_8 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_9 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_10 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_11 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_12 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_13 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_14 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_15 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_16 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_17 - unit_icon_move_68_frame_list)
	.2byte (unit_icon_move_68_frame_18 - unit_icon_move_68_frame_list)

unit_icon_move_68_anim_list: @ +$2A
	.2byte (unit_icon_move_68_anim_0 - unit_icon_move_68_anim_list)
	.2byte (unit_icon_move_68_anim_1 - unit_icon_move_68_anim_list)
	.2byte (unit_icon_move_68_anim_2 - unit_icon_move_68_anim_list)
	.2byte (unit_icon_move_68_anim_3 - unit_icon_move_68_anim_list)
	.2byte (unit_icon_move_68_anim_4 - unit_icon_move_68_anim_list)

unit_icon_move_68_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_68_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_68_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_68_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_68_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_68_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_68_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_68_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_68_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_68_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_68_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_68_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_68_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_68_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_68_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_68_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_68_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_68_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_68_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_68_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_68_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_68_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_68_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_68_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_69_sheet
unit_icon_move_69_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_69_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_69_motion
unit_icon_move_69_motion:
/*	.2byte (unit_icon_move_69_frame_list - unit_icon_move_69_motion), (unit_icon_move_69_anim_list - unit_icon_move_69_motion) @ header

unit_icon_move_69_frame_list: @ +$4
	.2byte (unit_icon_move_69_frame_0 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_1 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_2 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_3 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_4 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_5 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_6 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_7 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_8 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_9 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_10 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_11 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_12 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_13 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_14 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_15 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_16 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_17 - unit_icon_move_69_frame_list)
	.2byte (unit_icon_move_69_frame_18 - unit_icon_move_69_frame_list)

unit_icon_move_69_anim_list: @ +$2E
	.2byte (unit_icon_move_69_anim_0 - unit_icon_move_69_anim_list)
	.2byte (unit_icon_move_69_anim_1 - unit_icon_move_69_anim_list)
	.2byte (unit_icon_move_69_anim_2 - unit_icon_move_69_anim_list)
	.2byte (unit_icon_move_69_anim_3 - unit_icon_move_69_anim_list)
	.2byte (unit_icon_move_69_anim_4 - unit_icon_move_69_anim_list)
	.2byte (unit_icon_move_69_anim_5 - unit_icon_move_69_anim_list)

unit_icon_move_69_frame_0: @ +$3A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_69_frame_1: @ +$44
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_69_frame_2: @ +$4E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_69_frame_3: @ +$58
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_69_frame_4: @ +$62
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_69_frame_5: @ +$6C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_69_frame_6: @ +$76
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_69_frame_7: @ +$80
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_69_frame_8: @ +$8A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_69_frame_9: @ +$94
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_69_frame_10: @ +$9E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_69_frame_11: @ +$A8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_69_frame_12: @ +$B2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_69_frame_13: @ +$BC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_69_frame_14: @ +$C6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_69_frame_15: @ +$D0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_69_frame_16: @ +$DA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_69_frame_17: @ +$E4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_69_frame_18: @ +$EE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_69_anim_0: @ +$10C
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_69_anim_1: @ +$120
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_69_anim_2: @ +$134
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_69_anim_3: @ +$148
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_69_anim_4: @ +$15C
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

unit_icon_move_69_anim_5: @ +$170
	.2byte  6, 17
	.2byte 15, 18
	.2byte  3, 17
	.2byte 11, 16
	.2byte  5, 17
	.2byte 11, 18

	.2byte 0, 0 @ end current animation */
@ TODO parse bard unit icon move animation motion
.byte   4,  0, 46,  0, 54,  0, 64,  0, 74,  0, 84,  0, 94,  0,104,  0
.byte 114,  0,124,  0,134,  0,144,  0,154,  0,164,  0,174,  0,184,  0
.byte 194,  0,204,  0,214,  0,224,  0,234,  0,244,  0,254,  0,222,  0
.byte 242,  0,  6,  1, 26,  1, 46,  1, 66,  1,  1,  0,224,  0,240,129
.byte   0,  0,  0,  0,  1,  0,224,  0,240,129,  0,  0, 16,  0,  1,  0
.byte 224,  0,240,129,  0,  0, 32,  0,  1,  0,224,  0,240,129,  0,  0
.byte  48,  0,  1,  0,224,  0,240,145,  0,  0,  0,  0,  1,  0,224,  0
.byte 240,145,  0,  0, 16,  0,  1,  0,224,  0,240,145,  0,  0, 32,  0
.byte   1,  0,224,  0,240,145,  0,  0, 48,  0,  1,  0,224,  0,240,129
.byte   0,  0, 64,  0,  1,  0,224,  0,240,129,  0,  0, 80,  0,  1,  0
.byte 224,  0,240,129,  0,  0, 96,  0,  1,  0,224,  0,240,129,  0,  0
.byte 112,  0,  1,  0,224,  0,240,129,  0,  0,128,  0,  1,  0,224,  0
.byte 240,129,  0,  0,144,  0,  1,  0,224,  0,240,129,  0,  0,160,  0
.byte   1,  0,224,  0,240,129,  0,  0,176,  0,  1,  0,224,  0,240,129
.byte   0,  0,224,  0,  1,  0,224,  0,240,129,  0,  0,208,  0,  1,  0
.byte 224,  0,240,129,  0,  0,192,  0,  1,  0,224,  0,242,145,  0,  0
.byte   0,  0,  1,  0,224,  0,242,145,  0,  0, 16,  0, 13,  0,  0,  0
.byte   6,  0,  1,  0, 13,  0,  2,  0,  6,  0,  3,  0,  0,  0,255,255
.byte  13,  0,  4,  0,  6,  0,  5,  0, 13,  0,  6,  0,  6,  0,  7,  0
.byte   0,  0,255,255, 13,  0,  8,  0,  6,  0,  9,  0, 13,  0, 10,  0
.byte   6,  0, 11,  0,  0,  0,255,255, 13,  0, 12,  0,  6,  0, 13,  0
.byte  13,  0, 14,  0,  6,  0, 15,  0,  0,  0,255,255, 20,  0, 16,  0
.byte   4,  0, 17,  0, 20,  0, 18,  0,  4,  0, 17,  0,  0,  0,255,255
.byte   6,  0, 17,  0, 15,  0, 18,  0,  3,  0, 17,  0, 11,  0, 16,  0
.byte   5,  0, 17,  0, 11,  0, 18,  0,  0,  0,  0,  0,  0,  0,255,255

	.align 2, 0

	.global unit_icon_move_71_sheet
unit_icon_move_71_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_71_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_71_motion
unit_icon_move_71_motion:
	.2byte (unit_icon_move_71_frame_list - unit_icon_move_71_motion), (unit_icon_move_71_anim_list - unit_icon_move_71_motion) @ header

unit_icon_move_71_frame_list: @ +$4
	.2byte (unit_icon_move_71_frame_0 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_1 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_2 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_3 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_4 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_5 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_6 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_7 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_8 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_9 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_10 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_11 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_12 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_13 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_14 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_15 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_16 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_17 - unit_icon_move_71_frame_list)
	.2byte (unit_icon_move_71_frame_18 - unit_icon_move_71_frame_list)

unit_icon_move_71_anim_list: @ +$2A
	.2byte (unit_icon_move_71_anim_0 - unit_icon_move_71_anim_list)
	.2byte (unit_icon_move_71_anim_1 - unit_icon_move_71_anim_list)
	.2byte (unit_icon_move_71_anim_2 - unit_icon_move_71_anim_list)
	.2byte (unit_icon_move_71_anim_3 - unit_icon_move_71_anim_list)
	.2byte (unit_icon_move_71_anim_4 - unit_icon_move_71_anim_list)

unit_icon_move_71_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_71_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_71_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_71_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_71_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_71_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_71_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_71_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_71_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_71_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_71_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_71_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_71_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_71_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_71_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_71_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_71_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_71_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_71_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_71_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_71_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_71_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_71_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_71_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_72_sheet
unit_icon_move_72_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_72_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_72_motion
unit_icon_move_72_motion:
	.2byte (unit_icon_move_72_frame_list - unit_icon_move_72_motion), (unit_icon_move_72_anim_list - unit_icon_move_72_motion) @ header

unit_icon_move_72_frame_list: @ +$4
	.2byte (unit_icon_move_72_frame_0 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_1 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_2 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_3 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_4 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_5 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_6 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_7 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_8 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_9 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_10 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_11 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_12 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_13 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_14 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_15 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_16 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_17 - unit_icon_move_72_frame_list)
	.2byte (unit_icon_move_72_frame_18 - unit_icon_move_72_frame_list)

unit_icon_move_72_anim_list: @ +$2A
	.2byte (unit_icon_move_72_anim_0 - unit_icon_move_72_anim_list)
	.2byte (unit_icon_move_72_anim_1 - unit_icon_move_72_anim_list)
	.2byte (unit_icon_move_72_anim_2 - unit_icon_move_72_anim_list)
	.2byte (unit_icon_move_72_anim_3 - unit_icon_move_72_anim_list)
	.2byte (unit_icon_move_72_anim_4 - unit_icon_move_72_anim_list)

unit_icon_move_72_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_72_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_72_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_72_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_72_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_72_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_72_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_72_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_72_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_72_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_72_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_72_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_72_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_72_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_72_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_72_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_72_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_72_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_72_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_72_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_72_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_72_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_72_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_72_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_73_sheet
unit_icon_move_73_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_73_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_73_motion
unit_icon_move_73_motion:
	.2byte (unit_icon_move_73_frame_list - unit_icon_move_73_motion), (unit_icon_move_73_anim_list - unit_icon_move_73_motion) @ header

unit_icon_move_73_frame_list: @ +$4
	.2byte (unit_icon_move_73_frame_0 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_1 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_2 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_3 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_4 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_5 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_6 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_7 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_8 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_9 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_10 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_11 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_12 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_13 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_14 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_15 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_16 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_17 - unit_icon_move_73_frame_list)
	.2byte (unit_icon_move_73_frame_18 - unit_icon_move_73_frame_list)

unit_icon_move_73_anim_list: @ +$2A
	.2byte (unit_icon_move_73_anim_0 - unit_icon_move_73_anim_list)
	.2byte (unit_icon_move_73_anim_1 - unit_icon_move_73_anim_list)
	.2byte (unit_icon_move_73_anim_2 - unit_icon_move_73_anim_list)
	.2byte (unit_icon_move_73_anim_3 - unit_icon_move_73_anim_list)
	.2byte (unit_icon_move_73_anim_4 - unit_icon_move_73_anim_list)

unit_icon_move_73_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_73_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_73_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_73_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_73_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_73_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_73_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_73_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_73_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_73_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_73_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_73_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_73_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_73_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_73_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_73_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_73_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_73_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_73_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_73_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_73_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_73_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_73_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_73_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_74_sheet
unit_icon_move_74_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_74_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_74_motion
unit_icon_move_74_motion:
	.2byte (unit_icon_move_74_frame_list - unit_icon_move_74_motion), (unit_icon_move_74_anim_list - unit_icon_move_74_motion) @ header

unit_icon_move_74_frame_list: @ +$4
	.2byte (unit_icon_move_74_frame_0 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_1 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_2 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_3 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_4 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_5 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_6 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_7 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_8 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_9 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_10 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_11 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_12 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_13 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_14 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_15 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_16 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_17 - unit_icon_move_74_frame_list)
	.2byte (unit_icon_move_74_frame_18 - unit_icon_move_74_frame_list)

unit_icon_move_74_anim_list: @ +$2A
	.2byte (unit_icon_move_74_anim_0 - unit_icon_move_74_anim_list)
	.2byte (unit_icon_move_74_anim_1 - unit_icon_move_74_anim_list)
	.2byte (unit_icon_move_74_anim_2 - unit_icon_move_74_anim_list)
	.2byte (unit_icon_move_74_anim_3 - unit_icon_move_74_anim_list)
	.2byte (unit_icon_move_74_anim_4 - unit_icon_move_74_anim_list)

unit_icon_move_74_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_74_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_74_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_74_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_74_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_74_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_74_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_74_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_74_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_74_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_74_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_74_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_74_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_74_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_74_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_74_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_74_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_74_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_74_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_74_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_74_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_74_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_74_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_74_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_75_sheet
unit_icon_move_75_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_75_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_75_motion
unit_icon_move_75_motion:
	.2byte (unit_icon_move_75_frame_list - unit_icon_move_75_motion), (unit_icon_move_75_anim_list - unit_icon_move_75_motion) @ header

unit_icon_move_75_frame_list: @ +$4
	.2byte (unit_icon_move_75_frame_0 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_1 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_2 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_3 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_4 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_5 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_6 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_7 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_8 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_9 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_10 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_11 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_12 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_13 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_14 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_15 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_16 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_17 - unit_icon_move_75_frame_list)
	.2byte (unit_icon_move_75_frame_18 - unit_icon_move_75_frame_list)

unit_icon_move_75_anim_list: @ +$2A
	.2byte (unit_icon_move_75_anim_0 - unit_icon_move_75_anim_list)
	.2byte (unit_icon_move_75_anim_1 - unit_icon_move_75_anim_list)
	.2byte (unit_icon_move_75_anim_2 - unit_icon_move_75_anim_list)
	.2byte (unit_icon_move_75_anim_3 - unit_icon_move_75_anim_list)
	.2byte (unit_icon_move_75_anim_4 - unit_icon_move_75_anim_list)

unit_icon_move_75_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_75_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_75_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_75_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_75_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_75_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_75_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_75_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_75_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_75_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_75_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_75_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_75_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_75_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_75_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_75_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_75_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_75_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_75_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_75_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_75_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_75_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_75_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_75_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_76_sheet
unit_icon_move_76_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_76_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_76_motion
unit_icon_move_76_motion:
/*	.2byte (unit_icon_move_76_frame_list - unit_icon_move_76_motion), (unit_icon_move_76_anim_list - unit_icon_move_76_motion) @ header

unit_icon_move_76_frame_list: @ +$4
	.2byte (unit_icon_move_76_frame_0 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_1 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_2 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_3 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_4 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_5 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_6 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_7 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_8 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_9 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_10 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_11 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_12 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_13 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_14 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_15 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_16 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_17 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_18 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_19 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_20 - unit_icon_move_76_frame_list)
	.2byte (unit_icon_move_76_frame_21 - unit_icon_move_76_frame_list)

unit_icon_move_76_anim_list: @ +$30
	.2byte (unit_icon_move_76_anim_0 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_1 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_2 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_3 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_4 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_5 - unit_icon_move_76_anim_list)
	.2byte (unit_icon_move_76_anim_6 - unit_icon_move_76_anim_list)

unit_icon_move_76_frame_0: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_76_frame_1: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_76_frame_2: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_76_frame_3: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_76_frame_4: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_76_frame_5: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_76_frame_6: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_76_frame_7: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_76_frame_8: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x4A @ Sheet Tile #0

unit_icon_move_76_frame_9: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x5A @ Sheet Tile #0

unit_icon_move_76_frame_10: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x6A @ Sheet Tile #0

unit_icon_move_76_frame_11: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x7A @ Sheet Tile #0

unit_icon_move_76_frame_12: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_76_frame_13: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_76_frame_14: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_76_frame_15: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_76_frame_16: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xF0 @ Sheet Tile #0

unit_icon_move_76_frame_17: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_76_frame_18: @ +$F2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_76_frame_19: @ +$FC
	.2byte 5 @ oam entries
	.2byte 0xE1, 0x41F8, 0x0 @ OAM Data #0
	.2byte 0x80E1, 0x8, 0x2 @ OAM Data #1
	.2byte 0xFA, 0x1FB, 0x3 @ OAM Data #2
	.2byte 0xFA, 0x1FE, 0x4 @ OAM Data #3
	.2byte 0xF1, 0x1FC, 0x5 @ OAM Data #4
	.2byte 0x40 @ Sheet Tile #0
	.2byte 0x44 @ Sheet Tile #1
	.2byte 0x48 @ Sheet Tile #2
	.2byte 0x48 @ Sheet Tile #3
	.2byte 0x46 @ Sheet Tile #4

unit_icon_move_76_frame_20: @ +$126
	.2byte 5 @ oam entries
	.2byte 0xE4, 0x41F8, 0x0 @ OAM Data #0
	.2byte 0x80E4, 0x8, 0x2 @ OAM Data #1
	.2byte 0xFB, 0x1FA, 0x3 @ OAM Data #2
	.2byte 0xFB, 0x1FF, 0x4 @ OAM Data #3
	.2byte 0xF4, 0x1FC, 0x5 @ OAM Data #4
	.2byte 0x40 @ Sheet Tile #0
	.2byte 0x44 @ Sheet Tile #1
	.2byte 0x48 @ Sheet Tile #2
	.2byte 0x48 @ Sheet Tile #3
	.2byte 0x46 @ Sheet Tile #4

unit_icon_move_76_frame_21: @ +$150
	.2byte 7 @ oam entries
	.2byte 0xE7, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x80E7, 0x0, 0x2 @ OAM Data #1
	.2byte 0xF7, 0x2, 0x3 @ OAM Data #2
	.2byte 0xF7, 0x1FC, 0x4 @ OAM Data #3
	.2byte 0xF7, 0x11F7, 0x5 @ OAM Data #4
	.2byte 0xFB, 0x1FA, 0x6 @ OAM Data #5
	.2byte 0xFB, 0x1FF, 0x7 @ OAM Data #6
	.2byte 0x8A @ Sheet Tile #0
	.2byte 0x8E @ Sheet Tile #1
	.2byte 0x47 @ Sheet Tile #2
	.2byte 0x49 @ Sheet Tile #3
	.2byte 0x47 @ Sheet Tile #4
	.2byte 0x48 @ Sheet Tile #5
	.2byte 0x48 @ Sheet Tile #6

unit_icon_move_76_anim_0: @ +$18A
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_76_anim_1: @ +$19E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_76_anim_2: @ +$1B2
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_76_anim_3: @ +$1C6
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_76_anim_4: @ +$1DA
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

unit_icon_move_76_anim_5: @ +$1EE
	.2byte  5,  0
	.2byte  3, 12
	.2byte  2, 14
	.2byte  3,  5
	.2byte  2,  7
	.2byte  3,  8
	.2byte  2,  9
	.2byte  3, 20
	.2byte 15, 19
	.2byte  3, 20
	.2byte  1, 21

	.2byte 0, 0 @ end current animation

unit_icon_move_76_anim_6: @ +$222
	.2byte  5,  0
	.2byte  3, 12
	.2byte  2, 14
	.2byte  3,  5
	.2byte  2,  7
	.2byte  3,  8
	.2byte  2,  9
	.2byte  3, 20
	.2byte  1, 19

	.2byte 0, 0 @ end current animation */
@ TODO parse dancer unit icon move animation motion
.byte   4,  0, 48,  0, 58,  0, 68,  0, 78,  0, 88,  0, 98,  0,108,  0
.byte 118,  0,128,  0,138,  0,148,  0,158,  0,168,  0,178,  0,188,  0
.byte 198,  0,208,  0,218,  0,228,  0,238,  0,248,  0, 34,  1, 76,  1
.byte  90,  1,110,  1,130,  1,150,  1,170,  1,190,  1,242,  1,  1,  0
.byte 224,  0,240,129,  0,  0,  0,  0,  1,  0,224,  0,240,129,  0,  0
.byte  16,  0,  1,  0,224,  0,240,129,  0,  0, 32,  0,  1,  0,224,  0
.byte 240,129,  0,  0, 48,  0,  1,  0,224,  0,240,145,  0,  0,  0,  0
.byte   1,  0,224,  0,240,145,  0,  0, 16,  0,  1,  0,224,  0,240,145
.byte   0,  0, 32,  0,  1,  0,224,  0,240,145,  0,  0, 48,  0,  1,  0
.byte 224,  0,240,129,  0,  0, 74,  0,  1,  0,224,  0,240,129,  0,  0
.byte  90,  0,  1,  0,224,  0,240,129,  0,  0,106,  0,  1,  0,224,  0
.byte 240,129,  0,  0,122,  0,  1,  0,224,  0,240,129,  0,  0,144,  0
.byte   1,  0,224,  0,240,129,  0,  0,160,  0,  1,  0,224,  0,240,129
.byte   0,  0,176,  0,  1,  0,224,  0,240,129,  0,  0,192,  0,  1,  0
.byte 224,  0,240,129,  0,  0,240,  0,  1,  0,224,  0,240,129,  0,  0
.byte 224,  0,  1,  0,224,  0,240,129,  0,  0,208,  0,  5,  0,225,  0
.byte 248, 65,  0,  0,225,128,  8,  0,  2,  0,250,  0,251,  1,  3,  0
.byte 250,  0,254,  1,  4,  0,241,  0,252,  1,  5,  0, 64,  0, 68,  0
.byte  72,  0, 72,  0, 70,  0,  5,  0,228,  0,248, 65,  0,  0,228,128
.byte   8,  0,  2,  0,251,  0,250,  1,  3,  0,251,  0,255,  1,  4,  0
.byte 244,  0,252,  1,  5,  0, 64,  0, 68,  0, 72,  0, 72,  0, 70,  0
.byte   7,  0,231,  0,240, 65,  0,  0,231,128,  0,  0,  2,  0,247,  0
.byte   2,  0,  3,  0,247,  0,252,  1,  4,  0,247,  0,247, 17,  5,  0
.byte 251,  0,250,  1,  6,  0,251,  0,255,  1,  7,  0,138,  0,142,  0
.byte  71,  0, 73,  0, 71,  0, 72,  0, 72,  0, 13,  0,  0,  0,  6,  0
.byte   1,  0, 13,  0,  2,  0,  6,  0,  3,  0,  0,  0,255,255, 13,  0
.byte   4,  0,  6,  0,  5,  0, 13,  0,  6,  0,  6,  0,  7,  0,  0,  0
.byte 255,255, 13,  0,  8,  0,  6,  0,  9,  0, 13,  0, 10,  0,  6,  0
.byte  11,  0,  0,  0,255,255, 13,  0, 12,  0,  6,  0, 13,  0, 13,  0
.byte  14,  0,  6,  0, 15,  0,  0,  0,255,255, 20,  0, 16,  0,  4,  0
.byte  17,  0, 20,  0, 18,  0,  4,  0, 17,  0,  0,  0,255,255,  5,  0
.byte   0,  0,  3,  0, 12,  0,  2,  0, 14,  0,  3,  0,  5,  0,  2,  0
.byte   7,  0,  3,  0,  8,  0,  2,  0,  9,  0,  3,  0, 20,  0, 15,  0
.byte  19,  0,  3,  0, 20,  0,  1,  0, 21,  0,  0,  0,  0,  0,  0,  0
.byte 255,255,  5,  0,  0,  0,  3,  0, 12,  0,  2,  0, 14,  0,  3,  0
.byte   5,  0,  2,  0,  7,  0,  3,  0,  8,  0,  2,  0,  9,  0,  3,  0
.byte  20,  0,  1,  0, 19,  0,  0,  0,  0,  0,  0,  0,255,255,  0,  0

	.align 2, 0

	.global unit_icon_move_77_sheet
unit_icon_move_77_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_77_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_77_motion
unit_icon_move_77_motion:
	.2byte (unit_icon_move_77_frame_list - unit_icon_move_77_motion), (unit_icon_move_77_anim_list - unit_icon_move_77_motion) @ header

unit_icon_move_77_frame_list: @ +$4
	.2byte (unit_icon_move_77_frame_0 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_1 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_2 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_3 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_4 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_5 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_6 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_7 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_8 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_9 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_10 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_11 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_12 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_13 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_14 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_15 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_16 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_17 - unit_icon_move_77_frame_list)
	.2byte (unit_icon_move_77_frame_18 - unit_icon_move_77_frame_list)

unit_icon_move_77_anim_list: @ +$2A
	.2byte (unit_icon_move_77_anim_0 - unit_icon_move_77_anim_list)
	.2byte (unit_icon_move_77_anim_1 - unit_icon_move_77_anim_list)
	.2byte (unit_icon_move_77_anim_2 - unit_icon_move_77_anim_list)
	.2byte (unit_icon_move_77_anim_3 - unit_icon_move_77_anim_list)
	.2byte (unit_icon_move_77_anim_4 - unit_icon_move_77_anim_list)

unit_icon_move_77_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_77_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_77_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_77_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_77_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_77_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_77_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_77_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_77_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_77_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_77_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_77_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_77_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_77_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_77_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_77_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_77_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_77_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_77_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_77_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_77_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_77_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_77_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_77_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_78_sheet
unit_icon_move_78_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_78_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_78_motion
unit_icon_move_78_motion:
	.2byte (unit_icon_move_78_frame_list - unit_icon_move_78_motion), (unit_icon_move_78_anim_list - unit_icon_move_78_motion) @ header

unit_icon_move_78_frame_list: @ +$4
	.2byte (unit_icon_move_78_frame_0 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_1 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_2 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_3 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_4 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_5 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_6 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_7 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_8 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_9 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_10 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_11 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_12 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_13 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_14 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_15 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_16 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_17 - unit_icon_move_78_frame_list)
	.2byte (unit_icon_move_78_frame_18 - unit_icon_move_78_frame_list)

unit_icon_move_78_anim_list: @ +$2A
	.2byte (unit_icon_move_78_anim_0 - unit_icon_move_78_anim_list)
	.2byte (unit_icon_move_78_anim_1 - unit_icon_move_78_anim_list)
	.2byte (unit_icon_move_78_anim_2 - unit_icon_move_78_anim_list)
	.2byte (unit_icon_move_78_anim_3 - unit_icon_move_78_anim_list)
	.2byte (unit_icon_move_78_anim_4 - unit_icon_move_78_anim_list)

unit_icon_move_78_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_78_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_78_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_78_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_78_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_78_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_78_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_78_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_78_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_78_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_78_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_78_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_78_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_78_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_78_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_78_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_78_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_78_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_78_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_78_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_78_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_78_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_78_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_78_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_79_sheet
unit_icon_move_79_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_79_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_79_motion
unit_icon_move_79_motion:
	.2byte (unit_icon_move_79_frame_list - unit_icon_move_79_motion), (unit_icon_move_79_anim_list - unit_icon_move_79_motion) @ header

unit_icon_move_79_frame_list: @ +$4
	.2byte (unit_icon_move_79_frame_0 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_1 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_2 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_3 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_4 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_5 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_6 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_7 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_8 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_9 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_10 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_11 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_12 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_13 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_14 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_15 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_16 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_17 - unit_icon_move_79_frame_list)
	.2byte (unit_icon_move_79_frame_18 - unit_icon_move_79_frame_list)

unit_icon_move_79_anim_list: @ +$2A
	.2byte (unit_icon_move_79_anim_0 - unit_icon_move_79_anim_list)
	.2byte (unit_icon_move_79_anim_1 - unit_icon_move_79_anim_list)
	.2byte (unit_icon_move_79_anim_2 - unit_icon_move_79_anim_list)
	.2byte (unit_icon_move_79_anim_3 - unit_icon_move_79_anim_list)
	.2byte (unit_icon_move_79_anim_4 - unit_icon_move_79_anim_list)

unit_icon_move_79_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_79_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_79_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_79_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_79_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_79_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_79_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_79_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_79_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_79_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_79_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_79_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_79_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_79_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_79_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_79_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_79_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_79_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_79_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_79_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_79_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_79_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_79_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_79_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_80_sheet
unit_icon_move_80_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_80_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_80_motion
unit_icon_move_80_motion:
	.2byte (unit_icon_move_80_frame_list - unit_icon_move_80_motion), (unit_icon_move_80_anim_list - unit_icon_move_80_motion) @ header

unit_icon_move_80_frame_list: @ +$4
	.2byte (unit_icon_move_80_frame_0 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_1 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_2 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_3 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_4 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_5 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_6 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_7 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_8 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_9 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_10 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_11 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_12 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_13 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_14 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_15 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_16 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_17 - unit_icon_move_80_frame_list)
	.2byte (unit_icon_move_80_frame_18 - unit_icon_move_80_frame_list)

unit_icon_move_80_anim_list: @ +$2A
	.2byte (unit_icon_move_80_anim_0 - unit_icon_move_80_anim_list)
	.2byte (unit_icon_move_80_anim_1 - unit_icon_move_80_anim_list)
	.2byte (unit_icon_move_80_anim_2 - unit_icon_move_80_anim_list)
	.2byte (unit_icon_move_80_anim_3 - unit_icon_move_80_anim_list)
	.2byte (unit_icon_move_80_anim_4 - unit_icon_move_80_anim_list)

unit_icon_move_80_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_80_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_80_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_80_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_80_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_80_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_80_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_80_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_80_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_80_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_80_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_80_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_80_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_80_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_80_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_80_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_80_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_80_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_80_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_80_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_80_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_80_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_80_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_80_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_81_sheet
unit_icon_move_81_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_81_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_81_motion
unit_icon_move_81_motion:
	.2byte (unit_icon_move_81_frame_list - unit_icon_move_81_motion), (unit_icon_move_81_anim_list - unit_icon_move_81_motion) @ header

unit_icon_move_81_frame_list: @ +$4
	.2byte (unit_icon_move_81_frame_0 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_1 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_2 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_3 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_4 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_5 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_6 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_7 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_8 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_9 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_10 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_11 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_12 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_13 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_14 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_15 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_16 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_17 - unit_icon_move_81_frame_list)
	.2byte (unit_icon_move_81_frame_18 - unit_icon_move_81_frame_list)

unit_icon_move_81_anim_list: @ +$2A
	.2byte (unit_icon_move_81_anim_0 - unit_icon_move_81_anim_list)
	.2byte (unit_icon_move_81_anim_1 - unit_icon_move_81_anim_list)
	.2byte (unit_icon_move_81_anim_2 - unit_icon_move_81_anim_list)
	.2byte (unit_icon_move_81_anim_3 - unit_icon_move_81_anim_list)
	.2byte (unit_icon_move_81_anim_4 - unit_icon_move_81_anim_list)

unit_icon_move_81_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_81_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_81_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_81_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_81_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_81_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_81_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_81_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_81_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_81_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_81_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_81_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_81_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_81_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_81_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_81_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_81_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_81_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_81_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_81_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_81_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_81_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_81_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_81_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_82_sheet
unit_icon_move_82_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_82_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_82_motion
unit_icon_move_82_motion:
	.2byte (unit_icon_move_82_frame_list - unit_icon_move_82_motion), (unit_icon_move_82_anim_list - unit_icon_move_82_motion) @ header

unit_icon_move_82_frame_list: @ +$4
	.2byte (unit_icon_move_82_frame_0 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_1 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_2 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_3 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_4 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_5 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_6 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_7 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_8 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_9 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_10 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_11 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_12 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_13 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_14 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_15 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_16 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_17 - unit_icon_move_82_frame_list)
	.2byte (unit_icon_move_82_frame_18 - unit_icon_move_82_frame_list)

unit_icon_move_82_anim_list: @ +$2A
	.2byte (unit_icon_move_82_anim_0 - unit_icon_move_82_anim_list)
	.2byte (unit_icon_move_82_anim_1 - unit_icon_move_82_anim_list)
	.2byte (unit_icon_move_82_anim_2 - unit_icon_move_82_anim_list)
	.2byte (unit_icon_move_82_anim_3 - unit_icon_move_82_anim_list)
	.2byte (unit_icon_move_82_anim_4 - unit_icon_move_82_anim_list)

unit_icon_move_82_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_82_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_82_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_82_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_82_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_82_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_82_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_82_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_82_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_82_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_82_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_82_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_82_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_82_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_82_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_82_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_82_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_82_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_82_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_82_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_82_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_82_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_82_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_82_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_83_sheet
unit_icon_move_83_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_83_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_83_motion
unit_icon_move_83_motion:
	.2byte (unit_icon_move_83_frame_list - unit_icon_move_83_motion), (unit_icon_move_83_anim_list - unit_icon_move_83_motion) @ header

unit_icon_move_83_frame_list: @ +$4
	.2byte (unit_icon_move_83_frame_0 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_1 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_2 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_3 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_4 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_5 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_6 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_7 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_8 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_9 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_10 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_11 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_12 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_13 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_14 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_15 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_16 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_17 - unit_icon_move_83_frame_list)
	.2byte (unit_icon_move_83_frame_18 - unit_icon_move_83_frame_list)

unit_icon_move_83_anim_list: @ +$2A
	.2byte (unit_icon_move_83_anim_0 - unit_icon_move_83_anim_list)
	.2byte (unit_icon_move_83_anim_1 - unit_icon_move_83_anim_list)
	.2byte (unit_icon_move_83_anim_2 - unit_icon_move_83_anim_list)
	.2byte (unit_icon_move_83_anim_3 - unit_icon_move_83_anim_list)
	.2byte (unit_icon_move_83_anim_4 - unit_icon_move_83_anim_list)

unit_icon_move_83_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_83_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_83_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_83_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_83_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_83_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_83_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_83_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_83_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_83_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_83_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_83_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_83_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_83_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_83_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_83_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_83_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_83_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_83_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_83_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_83_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_83_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_83_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_83_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_84_sheet
unit_icon_move_84_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_84_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_84_motion
unit_icon_move_84_motion:
	.2byte (unit_icon_move_84_frame_list - unit_icon_move_84_motion), (unit_icon_move_84_anim_list - unit_icon_move_84_motion) @ header

unit_icon_move_84_frame_list: @ +$4
	.2byte (unit_icon_move_84_frame_0 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_1 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_2 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_3 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_4 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_5 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_6 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_7 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_8 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_9 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_10 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_11 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_12 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_13 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_14 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_15 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_16 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_17 - unit_icon_move_84_frame_list)
	.2byte (unit_icon_move_84_frame_18 - unit_icon_move_84_frame_list)

unit_icon_move_84_anim_list: @ +$2A
	.2byte (unit_icon_move_84_anim_0 - unit_icon_move_84_anim_list)
	.2byte (unit_icon_move_84_anim_1 - unit_icon_move_84_anim_list)
	.2byte (unit_icon_move_84_anim_2 - unit_icon_move_84_anim_list)
	.2byte (unit_icon_move_84_anim_3 - unit_icon_move_84_anim_list)
	.2byte (unit_icon_move_84_anim_4 - unit_icon_move_84_anim_list)

unit_icon_move_84_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_84_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_84_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_84_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_84_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_84_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_84_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_84_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_84_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_84_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_84_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_84_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_84_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_84_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_84_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_84_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_84_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_84_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_84_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_84_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_84_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_84_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_84_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_84_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_85_sheet
unit_icon_move_85_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_85_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_85_motion
unit_icon_move_85_motion:
	.2byte (unit_icon_move_85_frame_list - unit_icon_move_85_motion), (unit_icon_move_85_anim_list - unit_icon_move_85_motion) @ header

unit_icon_move_85_frame_list: @ +$4
	.2byte (unit_icon_move_85_frame_0 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_1 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_2 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_3 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_4 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_5 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_6 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_7 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_8 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_9 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_10 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_11 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_12 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_13 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_14 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_15 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_16 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_17 - unit_icon_move_85_frame_list)
	.2byte (unit_icon_move_85_frame_18 - unit_icon_move_85_frame_list)

unit_icon_move_85_anim_list: @ +$2A
	.2byte (unit_icon_move_85_anim_0 - unit_icon_move_85_anim_list)
	.2byte (unit_icon_move_85_anim_1 - unit_icon_move_85_anim_list)
	.2byte (unit_icon_move_85_anim_2 - unit_icon_move_85_anim_list)
	.2byte (unit_icon_move_85_anim_3 - unit_icon_move_85_anim_list)
	.2byte (unit_icon_move_85_anim_4 - unit_icon_move_85_anim_list)

unit_icon_move_85_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_85_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_85_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_85_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_85_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_85_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_85_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_85_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_85_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_85_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_85_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_85_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_85_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_85_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_85_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_85_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_85_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_85_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_85_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_85_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_85_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_85_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_85_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_85_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_86_sheet
unit_icon_move_86_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_86_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_86_motion
unit_icon_move_86_motion:
	.2byte (unit_icon_move_86_frame_list - unit_icon_move_86_motion), (unit_icon_move_86_anim_list - unit_icon_move_86_motion) @ header

unit_icon_move_86_frame_list: @ +$4
	.2byte (unit_icon_move_86_frame_0 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_1 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_2 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_3 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_4 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_5 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_6 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_7 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_8 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_9 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_10 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_11 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_12 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_13 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_14 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_15 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_16 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_17 - unit_icon_move_86_frame_list)
	.2byte (unit_icon_move_86_frame_18 - unit_icon_move_86_frame_list)

unit_icon_move_86_anim_list: @ +$2A
	.2byte (unit_icon_move_86_anim_0 - unit_icon_move_86_anim_list)
	.2byte (unit_icon_move_86_anim_1 - unit_icon_move_86_anim_list)
	.2byte (unit_icon_move_86_anim_2 - unit_icon_move_86_anim_list)
	.2byte (unit_icon_move_86_anim_3 - unit_icon_move_86_anim_list)
	.2byte (unit_icon_move_86_anim_4 - unit_icon_move_86_anim_list)

unit_icon_move_86_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_86_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_86_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_86_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_86_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_86_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_86_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_86_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_86_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_86_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_86_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_86_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_86_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_86_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_86_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_86_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_86_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_86_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_86_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_86_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_86_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_86_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_86_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_86_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_87_sheet
unit_icon_move_87_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_87_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_87_motion
unit_icon_move_87_motion:
	.2byte (unit_icon_move_87_frame_list - unit_icon_move_87_motion), (unit_icon_move_87_anim_list - unit_icon_move_87_motion) @ header

unit_icon_move_87_frame_list: @ +$4
	.2byte (unit_icon_move_87_frame_0 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_1 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_2 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_3 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_4 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_5 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_6 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_7 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_8 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_9 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_10 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_11 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_12 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_13 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_14 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_15 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_16 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_17 - unit_icon_move_87_frame_list)
	.2byte (unit_icon_move_87_frame_18 - unit_icon_move_87_frame_list)

unit_icon_move_87_anim_list: @ +$2A
	.2byte (unit_icon_move_87_anim_0 - unit_icon_move_87_anim_list)
	.2byte (unit_icon_move_87_anim_1 - unit_icon_move_87_anim_list)
	.2byte (unit_icon_move_87_anim_2 - unit_icon_move_87_anim_list)
	.2byte (unit_icon_move_87_anim_3 - unit_icon_move_87_anim_list)
	.2byte (unit_icon_move_87_anim_4 - unit_icon_move_87_anim_list)

unit_icon_move_87_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_87_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_87_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_87_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_87_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_87_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_87_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_87_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_87_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_87_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_87_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_87_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_87_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_87_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_87_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_87_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_87_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_87_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_87_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_87_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_87_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_87_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_87_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_87_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_88_sheet
unit_icon_move_88_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_88_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_88_motion
unit_icon_move_88_motion:
	.2byte (unit_icon_move_88_frame_list - unit_icon_move_88_motion), (unit_icon_move_88_anim_list - unit_icon_move_88_motion) @ header

unit_icon_move_88_frame_list: @ +$4
	.2byte (unit_icon_move_88_frame_0 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_1 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_2 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_3 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_4 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_5 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_6 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_7 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_8 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_9 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_10 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_11 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_12 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_13 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_14 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_15 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_16 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_17 - unit_icon_move_88_frame_list)
	.2byte (unit_icon_move_88_frame_18 - unit_icon_move_88_frame_list)

unit_icon_move_88_anim_list: @ +$2A
	.2byte (unit_icon_move_88_anim_0 - unit_icon_move_88_anim_list)
	.2byte (unit_icon_move_88_anim_1 - unit_icon_move_88_anim_list)
	.2byte (unit_icon_move_88_anim_2 - unit_icon_move_88_anim_list)
	.2byte (unit_icon_move_88_anim_3 - unit_icon_move_88_anim_list)
	.2byte (unit_icon_move_88_anim_4 - unit_icon_move_88_anim_list)

unit_icon_move_88_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_88_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_88_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_88_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_88_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_88_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_88_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_88_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_88_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_88_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_88_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_88_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_88_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_88_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_88_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_88_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_88_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_88_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_88_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_88_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_88_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_88_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_88_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_88_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_89_sheet
unit_icon_move_89_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_89_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_89_motion
unit_icon_move_89_motion:
	.2byte (unit_icon_move_89_frame_list - unit_icon_move_89_motion), (unit_icon_move_89_anim_list - unit_icon_move_89_motion) @ header

unit_icon_move_89_frame_list: @ +$4
	.2byte (unit_icon_move_89_frame_0 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_1 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_2 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_3 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_4 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_5 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_6 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_7 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_8 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_9 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_10 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_11 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_12 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_13 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_14 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_15 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_16 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_17 - unit_icon_move_89_frame_list)
	.2byte (unit_icon_move_89_frame_18 - unit_icon_move_89_frame_list)

unit_icon_move_89_anim_list: @ +$2A
	.2byte (unit_icon_move_89_anim_0 - unit_icon_move_89_anim_list)
	.2byte (unit_icon_move_89_anim_1 - unit_icon_move_89_anim_list)
	.2byte (unit_icon_move_89_anim_2 - unit_icon_move_89_anim_list)
	.2byte (unit_icon_move_89_anim_3 - unit_icon_move_89_anim_list)
	.2byte (unit_icon_move_89_anim_4 - unit_icon_move_89_anim_list)

unit_icon_move_89_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_89_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_89_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_89_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_89_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_89_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_89_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_89_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_89_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_89_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_89_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_89_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_89_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_89_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_89_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_89_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_89_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_89_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_89_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D8, 0x1F0, 0x3004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_89_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_89_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_89_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_89_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_89_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_90_sheet
unit_icon_move_90_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_90_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_90_motion
unit_icon_move_90_motion:
	.2byte (unit_icon_move_90_frame_list - unit_icon_move_90_motion), (unit_icon_move_90_anim_list - unit_icon_move_90_motion) @ header

unit_icon_move_90_frame_list: @ +$4
	.2byte (unit_icon_move_90_frame_0 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_1 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_2 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_3 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_4 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_5 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_6 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_7 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_8 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_9 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_10 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_11 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_12 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_13 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_14 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_15 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_16 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_17 - unit_icon_move_90_frame_list)
	.2byte (unit_icon_move_90_frame_18 - unit_icon_move_90_frame_list)

unit_icon_move_90_anim_list: @ +$2A
	.2byte (unit_icon_move_90_anim_0 - unit_icon_move_90_anim_list)
	.2byte (unit_icon_move_90_anim_1 - unit_icon_move_90_anim_list)
	.2byte (unit_icon_move_90_anim_2 - unit_icon_move_90_anim_list)
	.2byte (unit_icon_move_90_anim_3 - unit_icon_move_90_anim_list)
	.2byte (unit_icon_move_90_anim_4 - unit_icon_move_90_anim_list)

unit_icon_move_90_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_90_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_90_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_90_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_90_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_90_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_90_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_90_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_90_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_90_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_90_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_90_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_90_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_90_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_90_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_90_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_90_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_90_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_90_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_90_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_90_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_90_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_90_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_90_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_91_sheet
unit_icon_move_91_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_91_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_91_motion
unit_icon_move_91_motion:
	.2byte (unit_icon_move_91_frame_list - unit_icon_move_91_motion), (unit_icon_move_91_anim_list - unit_icon_move_91_motion) @ header

unit_icon_move_91_frame_list: @ +$4
	.2byte (unit_icon_move_91_frame_0 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_1 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_2 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_3 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_4 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_5 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_6 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_7 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_8 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_9 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_10 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_11 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_12 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_13 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_14 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_15 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_16 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_17 - unit_icon_move_91_frame_list)
	.2byte (unit_icon_move_91_frame_18 - unit_icon_move_91_frame_list)

unit_icon_move_91_anim_list: @ +$2A
	.2byte (unit_icon_move_91_anim_0 - unit_icon_move_91_anim_list)
	.2byte (unit_icon_move_91_anim_1 - unit_icon_move_91_anim_list)
	.2byte (unit_icon_move_91_anim_2 - unit_icon_move_91_anim_list)
	.2byte (unit_icon_move_91_anim_3 - unit_icon_move_91_anim_list)
	.2byte (unit_icon_move_91_anim_4 - unit_icon_move_91_anim_list)

unit_icon_move_91_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_91_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_91_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_91_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_91_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_91_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_91_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_91_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_91_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_91_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_91_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_91_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_91_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_91_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_91_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_91_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_91_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_91_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_91_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_91_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_91_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_91_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_91_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_91_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_92_sheet
unit_icon_move_92_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_92_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_92_motion
unit_icon_move_92_motion:
	.2byte (unit_icon_move_92_frame_list - unit_icon_move_92_motion), (unit_icon_move_92_anim_list - unit_icon_move_92_motion) @ header

unit_icon_move_92_frame_list: @ +$4
	.2byte (unit_icon_move_92_frame_0 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_1 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_2 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_3 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_4 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_5 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_6 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_7 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_8 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_9 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_10 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_11 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_12 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_13 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_14 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_15 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_16 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_17 - unit_icon_move_92_frame_list)
	.2byte (unit_icon_move_92_frame_18 - unit_icon_move_92_frame_list)

unit_icon_move_92_anim_list: @ +$2A
	.2byte (unit_icon_move_92_anim_0 - unit_icon_move_92_anim_list)
	.2byte (unit_icon_move_92_anim_1 - unit_icon_move_92_anim_list)
	.2byte (unit_icon_move_92_anim_2 - unit_icon_move_92_anim_list)
	.2byte (unit_icon_move_92_anim_3 - unit_icon_move_92_anim_list)
	.2byte (unit_icon_move_92_anim_4 - unit_icon_move_92_anim_list)

unit_icon_move_92_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_92_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_92_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_92_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_92_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_92_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_92_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_92_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_92_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_92_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_92_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_92_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_92_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_92_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_92_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_92_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_92_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_92_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_92_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_92_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_92_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_92_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_92_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_92_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_93_sheet
unit_icon_move_93_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_93_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_93_motion
unit_icon_move_93_motion:
	.2byte (unit_icon_move_93_frame_list - unit_icon_move_93_motion), (unit_icon_move_93_anim_list - unit_icon_move_93_motion) @ header

unit_icon_move_93_frame_list: @ +$4
	.2byte (unit_icon_move_93_frame_0 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_1 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_2 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_3 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_4 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_5 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_6 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_7 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_8 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_9 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_10 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_11 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_12 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_13 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_14 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_15 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_16 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_17 - unit_icon_move_93_frame_list)
	.2byte (unit_icon_move_93_frame_18 - unit_icon_move_93_frame_list)

unit_icon_move_93_anim_list: @ +$2A
	.2byte (unit_icon_move_93_anim_0 - unit_icon_move_93_anim_list)
	.2byte (unit_icon_move_93_anim_1 - unit_icon_move_93_anim_list)
	.2byte (unit_icon_move_93_anim_2 - unit_icon_move_93_anim_list)
	.2byte (unit_icon_move_93_anim_3 - unit_icon_move_93_anim_list)
	.2byte (unit_icon_move_93_anim_4 - unit_icon_move_93_anim_list)

unit_icon_move_93_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_93_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_93_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_93_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_93_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_93_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_93_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_93_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_93_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_93_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_93_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_93_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_93_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_93_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_93_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_93_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_93_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_93_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_93_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_93_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_93_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_93_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_93_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_93_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_94_sheet
unit_icon_move_94_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_94_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_94_motion
unit_icon_move_94_motion:
	.2byte (unit_icon_move_94_frame_list - unit_icon_move_94_motion), (unit_icon_move_94_anim_list - unit_icon_move_94_motion) @ header

unit_icon_move_94_frame_list: @ +$4
	.2byte (unit_icon_move_94_frame_0 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_1 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_2 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_3 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_4 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_5 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_6 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_7 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_8 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_9 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_10 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_11 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_12 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_13 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_14 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_15 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_16 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_17 - unit_icon_move_94_frame_list)
	.2byte (unit_icon_move_94_frame_18 - unit_icon_move_94_frame_list)

unit_icon_move_94_anim_list: @ +$2A
	.2byte (unit_icon_move_94_anim_0 - unit_icon_move_94_anim_list)
	.2byte (unit_icon_move_94_anim_1 - unit_icon_move_94_anim_list)
	.2byte (unit_icon_move_94_anim_2 - unit_icon_move_94_anim_list)
	.2byte (unit_icon_move_94_anim_3 - unit_icon_move_94_anim_list)
	.2byte (unit_icon_move_94_anim_4 - unit_icon_move_94_anim_list)

unit_icon_move_94_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_94_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_94_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_94_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_94_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_94_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_94_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_94_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_94_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_94_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_94_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_94_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_94_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_94_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_94_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_94_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_94_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_94_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_94_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_94_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_94_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_94_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_94_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_94_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_95_sheet
unit_icon_move_95_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_95_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_95_motion
unit_icon_move_95_motion:
	.2byte (unit_icon_move_95_frame_list - unit_icon_move_95_motion), (unit_icon_move_95_anim_list - unit_icon_move_95_motion) @ header

unit_icon_move_95_frame_list: @ +$4
	.2byte (unit_icon_move_95_frame_0 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_1 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_2 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_3 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_4 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_5 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_6 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_7 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_8 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_9 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_10 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_11 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_12 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_13 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_14 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_15 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_16 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_17 - unit_icon_move_95_frame_list)
	.2byte (unit_icon_move_95_frame_18 - unit_icon_move_95_frame_list)

unit_icon_move_95_anim_list: @ +$2A
	.2byte (unit_icon_move_95_anim_0 - unit_icon_move_95_anim_list)
	.2byte (unit_icon_move_95_anim_1 - unit_icon_move_95_anim_list)
	.2byte (unit_icon_move_95_anim_2 - unit_icon_move_95_anim_list)
	.2byte (unit_icon_move_95_anim_3 - unit_icon_move_95_anim_list)
	.2byte (unit_icon_move_95_anim_4 - unit_icon_move_95_anim_list)

unit_icon_move_95_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_95_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_95_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_95_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_95_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_95_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_95_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_95_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_95_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_95_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_95_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_95_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_95_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_95_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_95_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_95_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_95_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_95_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_95_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_95_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_95_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_95_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_95_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_95_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_96_sheet
unit_icon_move_96_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_96_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_96_motion
unit_icon_move_96_motion:
	.2byte (unit_icon_move_96_frame_list - unit_icon_move_96_motion), (unit_icon_move_96_anim_list - unit_icon_move_96_motion) @ header

unit_icon_move_96_frame_list: @ +$4
	.2byte (unit_icon_move_96_frame_0 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_1 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_2 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_3 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_4 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_5 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_6 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_7 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_8 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_9 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_10 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_11 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_12 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_13 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_14 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_15 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_16 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_17 - unit_icon_move_96_frame_list)
	.2byte (unit_icon_move_96_frame_18 - unit_icon_move_96_frame_list)

unit_icon_move_96_anim_list: @ +$2A
	.2byte (unit_icon_move_96_anim_0 - unit_icon_move_96_anim_list)
	.2byte (unit_icon_move_96_anim_1 - unit_icon_move_96_anim_list)
	.2byte (unit_icon_move_96_anim_2 - unit_icon_move_96_anim_list)
	.2byte (unit_icon_move_96_anim_3 - unit_icon_move_96_anim_list)
	.2byte (unit_icon_move_96_anim_4 - unit_icon_move_96_anim_list)

unit_icon_move_96_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_96_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_96_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_96_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_96_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_96_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_96_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_96_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_96_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_96_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_96_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_96_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_96_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_96_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_96_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_96_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_96_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_96_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_96_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_96_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_96_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_96_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_96_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_96_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_97_sheet
unit_icon_move_97_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_97_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_97_motion
unit_icon_move_97_motion:
	.2byte (unit_icon_move_97_frame_list - unit_icon_move_97_motion), (unit_icon_move_97_anim_list - unit_icon_move_97_motion) @ header

unit_icon_move_97_frame_list: @ +$4
	.2byte (unit_icon_move_97_frame_0 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_1 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_2 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_3 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_4 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_5 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_6 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_7 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_8 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_9 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_10 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_11 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_12 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_13 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_14 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_15 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_16 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_17 - unit_icon_move_97_frame_list)
	.2byte (unit_icon_move_97_frame_18 - unit_icon_move_97_frame_list)

unit_icon_move_97_anim_list: @ +$2A
	.2byte (unit_icon_move_97_anim_0 - unit_icon_move_97_anim_list)
	.2byte (unit_icon_move_97_anim_1 - unit_icon_move_97_anim_list)
	.2byte (unit_icon_move_97_anim_2 - unit_icon_move_97_anim_list)
	.2byte (unit_icon_move_97_anim_3 - unit_icon_move_97_anim_list)
	.2byte (unit_icon_move_97_anim_4 - unit_icon_move_97_anim_list)

unit_icon_move_97_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_97_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_97_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_97_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_97_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_97_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_97_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_97_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_97_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_97_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_97_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_97_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_97_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_97_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_97_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_97_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_97_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_97_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_97_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_97_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_97_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_97_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_97_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_97_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_98_sheet
unit_icon_move_98_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_98_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_98_motion
unit_icon_move_98_motion:
	.2byte (unit_icon_move_98_frame_list - unit_icon_move_98_motion), (unit_icon_move_98_anim_list - unit_icon_move_98_motion) @ header

unit_icon_move_98_frame_list: @ +$4
	.2byte (unit_icon_move_98_frame_0 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_1 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_2 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_3 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_4 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_5 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_6 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_7 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_8 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_9 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_10 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_11 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_12 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_13 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_14 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_15 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_16 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_17 - unit_icon_move_98_frame_list)
	.2byte (unit_icon_move_98_frame_18 - unit_icon_move_98_frame_list)

unit_icon_move_98_anim_list: @ +$2A
	.2byte (unit_icon_move_98_anim_0 - unit_icon_move_98_anim_list)
	.2byte (unit_icon_move_98_anim_1 - unit_icon_move_98_anim_list)
	.2byte (unit_icon_move_98_anim_2 - unit_icon_move_98_anim_list)
	.2byte (unit_icon_move_98_anim_3 - unit_icon_move_98_anim_list)
	.2byte (unit_icon_move_98_anim_4 - unit_icon_move_98_anim_list)

unit_icon_move_98_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_98_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_98_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_98_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_98_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_98_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_98_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_98_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_98_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_98_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_98_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_98_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_98_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_98_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_98_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_98_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_98_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_98_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_98_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_98_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_98_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_98_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_98_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_98_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_99_sheet
unit_icon_move_99_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_99_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_99_motion
unit_icon_move_99_motion:
	.2byte (unit_icon_move_99_frame_list - unit_icon_move_99_motion), (unit_icon_move_99_anim_list - unit_icon_move_99_motion) @ header

unit_icon_move_99_frame_list: @ +$4
	.2byte (unit_icon_move_99_frame_0 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_1 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_2 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_3 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_4 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_5 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_6 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_7 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_8 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_9 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_10 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_11 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_12 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_13 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_14 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_15 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_16 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_17 - unit_icon_move_99_frame_list)
	.2byte (unit_icon_move_99_frame_18 - unit_icon_move_99_frame_list)

unit_icon_move_99_anim_list: @ +$2A
	.2byte (unit_icon_move_99_anim_0 - unit_icon_move_99_anim_list)
	.2byte (unit_icon_move_99_anim_1 - unit_icon_move_99_anim_list)
	.2byte (unit_icon_move_99_anim_2 - unit_icon_move_99_anim_list)
	.2byte (unit_icon_move_99_anim_3 - unit_icon_move_99_anim_list)
	.2byte (unit_icon_move_99_anim_4 - unit_icon_move_99_anim_list)

unit_icon_move_99_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_99_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_99_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_99_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_99_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_99_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_99_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_99_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_99_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_99_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_99_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_99_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_99_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_99_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_99_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_99_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_99_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_99_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_99_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_99_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_99_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_99_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_99_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_99_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_100_sheet
unit_icon_move_100_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_100_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_100_motion
unit_icon_move_100_motion:
	.2byte (unit_icon_move_100_frame_list - unit_icon_move_100_motion), (unit_icon_move_100_anim_list - unit_icon_move_100_motion) @ header

unit_icon_move_100_frame_list: @ +$4
	.2byte (unit_icon_move_100_frame_0 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_1 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_2 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_3 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_4 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_5 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_6 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_7 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_8 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_9 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_10 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_11 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_12 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_13 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_14 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_15 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_16 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_17 - unit_icon_move_100_frame_list)
	.2byte (unit_icon_move_100_frame_18 - unit_icon_move_100_frame_list)

unit_icon_move_100_anim_list: @ +$2A
	.2byte (unit_icon_move_100_anim_0 - unit_icon_move_100_anim_list)
	.2byte (unit_icon_move_100_anim_1 - unit_icon_move_100_anim_list)
	.2byte (unit_icon_move_100_anim_2 - unit_icon_move_100_anim_list)
	.2byte (unit_icon_move_100_anim_3 - unit_icon_move_100_anim_list)
	.2byte (unit_icon_move_100_anim_4 - unit_icon_move_100_anim_list)

unit_icon_move_100_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_100_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_100_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_100_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_100_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_100_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_100_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_100_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_100_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_100_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_100_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_100_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_100_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_100_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_100_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_100_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_100_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_100_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_100_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0x80E0, 0x13, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_100_anim_0: @ +$FA
	.2byte 18,  0
	.2byte 10,  1
	.2byte 18,  2
	.2byte 10,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_100_anim_1: @ +$10E
	.2byte 18,  4
	.2byte 10,  5
	.2byte 18,  6
	.2byte 10,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_100_anim_2: @ +$122
	.2byte 18,  8
	.2byte 10,  9
	.2byte 18, 10
	.2byte 10, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_100_anim_3: @ +$136
	.2byte 18, 12
	.2byte 10, 13
	.2byte 18, 14
	.2byte 10, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_100_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_101_sheet
unit_icon_move_101_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_101_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_101_motion
unit_icon_move_101_motion:
	.2byte (unit_icon_move_101_frame_list - unit_icon_move_101_motion), (unit_icon_move_101_anim_list - unit_icon_move_101_motion) @ header

unit_icon_move_101_frame_list: @ +$4
	.2byte (unit_icon_move_101_frame_0 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_1 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_2 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_3 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_4 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_5 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_6 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_7 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_8 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_9 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_10 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_11 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_12 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_13 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_14 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_15 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_16 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_17 - unit_icon_move_101_frame_list)
	.2byte (unit_icon_move_101_frame_18 - unit_icon_move_101_frame_list)

unit_icon_move_101_anim_list: @ +$2A
	.2byte (unit_icon_move_101_anim_0 - unit_icon_move_101_anim_list)
	.2byte (unit_icon_move_101_anim_1 - unit_icon_move_101_anim_list)
	.2byte (unit_icon_move_101_anim_2 - unit_icon_move_101_anim_list)
	.2byte (unit_icon_move_101_anim_3 - unit_icon_move_101_anim_list)
	.2byte (unit_icon_move_101_anim_4 - unit_icon_move_101_anim_list)

unit_icon_move_101_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_101_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_101_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_101_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_101_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_101_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_101_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_101_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_101_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_101_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_101_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_101_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_101_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_101_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_101_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_101_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_101_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_101_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_101_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_101_anim_0: @ +$F2
	.2byte 16,  0
	.2byte 10,  1
	.2byte 16,  2
	.2byte 10,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_101_anim_1: @ +$106
	.2byte 16,  4
	.2byte 10,  5
	.2byte 16,  6
	.2byte 10,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_101_anim_2: @ +$11A
	.2byte 16,  8
	.2byte 10,  9
	.2byte 16, 10
	.2byte 10, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_101_anim_3: @ +$12E
	.2byte 16, 12
	.2byte 10, 13
	.2byte 16, 14
	.2byte 10, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_101_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_102_sheet
unit_icon_move_102_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_102_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_102_motion
unit_icon_move_102_motion:
	.2byte (unit_icon_move_102_frame_list - unit_icon_move_102_motion), (unit_icon_move_102_anim_list - unit_icon_move_102_motion) @ header

unit_icon_move_102_frame_list: @ +$4
	.2byte (unit_icon_move_102_frame_0 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_1 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_2 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_3 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_4 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_5 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_6 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_7 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_8 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_9 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_10 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_11 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_12 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_13 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_14 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_15 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_16 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_17 - unit_icon_move_102_frame_list)
	.2byte (unit_icon_move_102_frame_18 - unit_icon_move_102_frame_list)

unit_icon_move_102_anim_list: @ +$2A
	.2byte (unit_icon_move_102_anim_0 - unit_icon_move_102_anim_list)
	.2byte (unit_icon_move_102_anim_1 - unit_icon_move_102_anim_list)
	.2byte (unit_icon_move_102_anim_2 - unit_icon_move_102_anim_list)
	.2byte (unit_icon_move_102_anim_3 - unit_icon_move_102_anim_list)
	.2byte (unit_icon_move_102_anim_4 - unit_icon_move_102_anim_list)

unit_icon_move_102_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_102_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_102_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_102_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_102_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_102_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_102_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_102_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_102_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_102_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_102_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_102_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_102_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_102_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_102_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_102_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_102_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_102_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_102_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_102_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_102_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_102_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_102_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_102_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_103_sheet
unit_icon_move_103_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_103_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_103_motion
unit_icon_move_103_motion:
	.2byte (unit_icon_move_103_frame_list - unit_icon_move_103_motion), (unit_icon_move_103_anim_list - unit_icon_move_103_motion) @ header

unit_icon_move_103_frame_list: @ +$4
	.2byte (unit_icon_move_103_frame_0 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_1 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_2 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_3 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_4 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_5 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_6 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_7 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_8 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_9 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_10 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_11 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_12 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_13 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_14 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_15 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_16 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_17 - unit_icon_move_103_frame_list)
	.2byte (unit_icon_move_103_frame_18 - unit_icon_move_103_frame_list)

unit_icon_move_103_anim_list: @ +$2A
	.2byte (unit_icon_move_103_anim_0 - unit_icon_move_103_anim_list)
	.2byte (unit_icon_move_103_anim_1 - unit_icon_move_103_anim_list)
	.2byte (unit_icon_move_103_anim_2 - unit_icon_move_103_anim_list)
	.2byte (unit_icon_move_103_anim_3 - unit_icon_move_103_anim_list)
	.2byte (unit_icon_move_103_anim_4 - unit_icon_move_103_anim_list)

unit_icon_move_103_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_103_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_103_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_103_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_103_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_103_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_103_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_103_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_103_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_103_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_103_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_103_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_103_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_103_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_103_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_103_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_103_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_103_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_103_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_103_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_103_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_103_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_103_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_103_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_104_sheet
unit_icon_move_104_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_104_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_104_motion
unit_icon_move_104_motion:
	.2byte (unit_icon_move_104_frame_list - unit_icon_move_104_motion), (unit_icon_move_104_anim_list - unit_icon_move_104_motion) @ header

unit_icon_move_104_frame_list: @ +$4
	.2byte (unit_icon_move_104_frame_0 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_1 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_2 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_3 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_4 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_5 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_6 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_7 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_8 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_9 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_10 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_11 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_12 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_13 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_14 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_15 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_16 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_17 - unit_icon_move_104_frame_list)
	.2byte (unit_icon_move_104_frame_18 - unit_icon_move_104_frame_list)

unit_icon_move_104_anim_list: @ +$2A
	.2byte (unit_icon_move_104_anim_0 - unit_icon_move_104_anim_list)
	.2byte (unit_icon_move_104_anim_1 - unit_icon_move_104_anim_list)
	.2byte (unit_icon_move_104_anim_2 - unit_icon_move_104_anim_list)
	.2byte (unit_icon_move_104_anim_3 - unit_icon_move_104_anim_list)
	.2byte (unit_icon_move_104_anim_4 - unit_icon_move_104_anim_list)

unit_icon_move_104_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_104_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_104_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_104_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_104_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_104_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_104_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_104_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_104_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_104_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_104_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_104_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_104_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_104_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_104_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_104_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_104_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_104_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_104_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_104_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_104_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_104_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_104_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_104_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_105_sheet
unit_icon_move_105_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_105_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_105_motion
unit_icon_move_105_motion:
	.2byte (unit_icon_move_105_frame_list - unit_icon_move_105_motion), (unit_icon_move_105_anim_list - unit_icon_move_105_motion) @ header

unit_icon_move_105_frame_list: @ +$4
	.2byte (unit_icon_move_105_frame_0 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_1 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_2 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_3 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_4 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_5 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_6 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_7 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_8 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_9 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_10 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_11 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_12 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_13 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_14 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_15 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_16 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_17 - unit_icon_move_105_frame_list)
	.2byte (unit_icon_move_105_frame_18 - unit_icon_move_105_frame_list)

unit_icon_move_105_anim_list: @ +$2A
	.2byte (unit_icon_move_105_anim_0 - unit_icon_move_105_anim_list)
	.2byte (unit_icon_move_105_anim_1 - unit_icon_move_105_anim_list)
	.2byte (unit_icon_move_105_anim_2 - unit_icon_move_105_anim_list)
	.2byte (unit_icon_move_105_anim_3 - unit_icon_move_105_anim_list)
	.2byte (unit_icon_move_105_anim_4 - unit_icon_move_105_anim_list)

unit_icon_move_105_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_105_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_105_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_105_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_105_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_105_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_105_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_105_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_105_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_105_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_105_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_105_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_105_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_105_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_105_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_105_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_105_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_105_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_105_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_105_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_105_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_105_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_105_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_105_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_106_sheet
unit_icon_move_106_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_106_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_106_motion
unit_icon_move_106_motion:
	.2byte (unit_icon_move_106_frame_list - unit_icon_move_106_motion), (unit_icon_move_106_anim_list - unit_icon_move_106_motion) @ header

unit_icon_move_106_frame_list: @ +$4
	.2byte (unit_icon_move_106_frame_0 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_1 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_2 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_3 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_4 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_5 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_6 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_7 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_8 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_9 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_10 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_11 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_12 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_13 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_14 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_15 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_16 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_17 - unit_icon_move_106_frame_list)
	.2byte (unit_icon_move_106_frame_18 - unit_icon_move_106_frame_list)

unit_icon_move_106_anim_list: @ +$2A
	.2byte (unit_icon_move_106_anim_0 - unit_icon_move_106_anim_list)
	.2byte (unit_icon_move_106_anim_1 - unit_icon_move_106_anim_list)
	.2byte (unit_icon_move_106_anim_2 - unit_icon_move_106_anim_list)
	.2byte (unit_icon_move_106_anim_3 - unit_icon_move_106_anim_list)
	.2byte (unit_icon_move_106_anim_4 - unit_icon_move_106_anim_list)

unit_icon_move_106_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_106_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_106_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_106_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_106_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_106_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_106_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_106_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_106_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_106_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_106_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_106_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_106_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_106_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_106_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_106_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_106_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_106_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_106_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_106_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_106_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_106_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_106_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_106_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_107_sheet
unit_icon_move_107_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_107_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_107_motion
unit_icon_move_107_motion:
	.2byte (unit_icon_move_107_frame_list - unit_icon_move_107_motion), (unit_icon_move_107_anim_list - unit_icon_move_107_motion) @ header

unit_icon_move_107_frame_list: @ +$4
	.2byte (unit_icon_move_107_frame_0 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_1 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_2 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_3 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_4 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_5 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_6 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_7 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_8 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_9 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_10 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_11 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_12 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_13 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_14 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_15 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_16 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_17 - unit_icon_move_107_frame_list)
	.2byte (unit_icon_move_107_frame_18 - unit_icon_move_107_frame_list)

unit_icon_move_107_anim_list: @ +$2A
	.2byte (unit_icon_move_107_anim_0 - unit_icon_move_107_anim_list)
	.2byte (unit_icon_move_107_anim_1 - unit_icon_move_107_anim_list)
	.2byte (unit_icon_move_107_anim_2 - unit_icon_move_107_anim_list)
	.2byte (unit_icon_move_107_anim_3 - unit_icon_move_107_anim_list)
	.2byte (unit_icon_move_107_anim_4 - unit_icon_move_107_anim_list)

unit_icon_move_107_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_107_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_107_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_107_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_107_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_107_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_107_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_107_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_107_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_107_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_107_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_107_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_107_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_107_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_107_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_107_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_107_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_107_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_107_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_107_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_107_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_107_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_107_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_107_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_108_sheet
unit_icon_move_108_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_108_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_108_motion
unit_icon_move_108_motion:
	.2byte (unit_icon_move_108_frame_list - unit_icon_move_108_motion), (unit_icon_move_108_anim_list - unit_icon_move_108_motion) @ header

unit_icon_move_108_frame_list: @ +$4
	.2byte (unit_icon_move_108_frame_0 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_1 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_2 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_3 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_4 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_5 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_6 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_7 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_8 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_9 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_10 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_11 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_12 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_13 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_14 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_15 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_16 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_17 - unit_icon_move_108_frame_list)
	.2byte (unit_icon_move_108_frame_18 - unit_icon_move_108_frame_list)

unit_icon_move_108_anim_list: @ +$2A
	.2byte (unit_icon_move_108_anim_0 - unit_icon_move_108_anim_list)
	.2byte (unit_icon_move_108_anim_1 - unit_icon_move_108_anim_list)
	.2byte (unit_icon_move_108_anim_2 - unit_icon_move_108_anim_list)
	.2byte (unit_icon_move_108_anim_3 - unit_icon_move_108_anim_list)
	.2byte (unit_icon_move_108_anim_4 - unit_icon_move_108_anim_list)

unit_icon_move_108_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_108_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_108_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_108_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_108_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_108_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_108_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_108_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_108_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_108_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_108_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_108_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_108_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_108_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_108_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_108_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_108_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_108_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_108_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_108_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_108_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_108_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_108_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_108_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_109_sheet
unit_icon_move_109_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_109_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_109_motion
unit_icon_move_109_motion:
	.2byte (unit_icon_move_109_frame_list - unit_icon_move_109_motion), (unit_icon_move_109_anim_list - unit_icon_move_109_motion) @ header

unit_icon_move_109_frame_list: @ +$4
	.2byte (unit_icon_move_109_frame_0 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_1 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_2 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_3 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_4 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_5 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_6 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_7 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_8 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_9 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_10 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_11 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_12 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_13 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_14 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_15 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_16 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_17 - unit_icon_move_109_frame_list)
	.2byte (unit_icon_move_109_frame_18 - unit_icon_move_109_frame_list)

unit_icon_move_109_anim_list: @ +$2A
	.2byte (unit_icon_move_109_anim_0 - unit_icon_move_109_anim_list)
	.2byte (unit_icon_move_109_anim_1 - unit_icon_move_109_anim_list)
	.2byte (unit_icon_move_109_anim_2 - unit_icon_move_109_anim_list)
	.2byte (unit_icon_move_109_anim_3 - unit_icon_move_109_anim_list)
	.2byte (unit_icon_move_109_anim_4 - unit_icon_move_109_anim_list)

unit_icon_move_109_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_109_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_109_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_109_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_109_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_109_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_109_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_109_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_109_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_109_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_109_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_109_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_109_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_109_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_109_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_109_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_109_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_109_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_109_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_109_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_109_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_109_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_109_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_109_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_110_sheet
unit_icon_move_110_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_110_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_110_motion
unit_icon_move_110_motion:
	.2byte (unit_icon_move_110_frame_list - unit_icon_move_110_motion), (unit_icon_move_110_anim_list - unit_icon_move_110_motion) @ header

unit_icon_move_110_frame_list: @ +$4
	.2byte (unit_icon_move_110_frame_0 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_1 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_2 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_3 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_4 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_5 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_6 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_7 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_8 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_9 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_10 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_11 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_12 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_13 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_14 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_15 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_16 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_17 - unit_icon_move_110_frame_list)
	.2byte (unit_icon_move_110_frame_18 - unit_icon_move_110_frame_list)

unit_icon_move_110_anim_list: @ +$2A
	.2byte (unit_icon_move_110_anim_0 - unit_icon_move_110_anim_list)
	.2byte (unit_icon_move_110_anim_1 - unit_icon_move_110_anim_list)
	.2byte (unit_icon_move_110_anim_2 - unit_icon_move_110_anim_list)
	.2byte (unit_icon_move_110_anim_3 - unit_icon_move_110_anim_list)
	.2byte (unit_icon_move_110_anim_4 - unit_icon_move_110_anim_list)

unit_icon_move_110_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_110_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_110_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_110_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_110_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_110_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_110_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_110_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_110_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_110_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_110_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_110_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_110_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_110_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_110_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_110_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_110_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_110_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_110_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_110_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_110_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_110_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_110_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_110_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_111_sheet
unit_icon_move_111_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_111_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_111_motion
unit_icon_move_111_motion:
	.2byte (unit_icon_move_111_frame_list - unit_icon_move_111_motion), (unit_icon_move_111_anim_list - unit_icon_move_111_motion) @ header

unit_icon_move_111_frame_list: @ +$4
	.2byte (unit_icon_move_111_frame_0 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_1 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_2 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_3 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_4 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_5 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_6 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_7 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_8 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_9 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_10 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_11 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_12 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_13 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_14 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_15 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_16 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_17 - unit_icon_move_111_frame_list)
	.2byte (unit_icon_move_111_frame_18 - unit_icon_move_111_frame_list)

unit_icon_move_111_anim_list: @ +$2A
	.2byte (unit_icon_move_111_anim_0 - unit_icon_move_111_anim_list)
	.2byte (unit_icon_move_111_anim_1 - unit_icon_move_111_anim_list)
	.2byte (unit_icon_move_111_anim_2 - unit_icon_move_111_anim_list)
	.2byte (unit_icon_move_111_anim_3 - unit_icon_move_111_anim_list)
	.2byte (unit_icon_move_111_anim_4 - unit_icon_move_111_anim_list)

unit_icon_move_111_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_111_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_111_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_111_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_111_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_111_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_111_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_111_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_111_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_111_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_111_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_111_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_111_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_111_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_111_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_111_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_111_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_111_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_111_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_111_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_111_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_111_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_111_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_111_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_114_sheet
unit_icon_move_114_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_114_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_114_motion
unit_icon_move_114_motion:
	.2byte (unit_icon_move_114_frame_list - unit_icon_move_114_motion), (unit_icon_move_114_anim_list - unit_icon_move_114_motion) @ header

unit_icon_move_114_frame_list: @ +$4
	.2byte (unit_icon_move_114_frame_0 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_1 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_2 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_3 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_4 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_5 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_6 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_7 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_8 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_9 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_10 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_11 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_12 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_13 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_14 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_15 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_16 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_17 - unit_icon_move_114_frame_list)
	.2byte (unit_icon_move_114_frame_18 - unit_icon_move_114_frame_list)

unit_icon_move_114_anim_list: @ +$2A
	.2byte (unit_icon_move_114_anim_0 - unit_icon_move_114_anim_list)
	.2byte (unit_icon_move_114_anim_1 - unit_icon_move_114_anim_list)
	.2byte (unit_icon_move_114_anim_2 - unit_icon_move_114_anim_list)
	.2byte (unit_icon_move_114_anim_3 - unit_icon_move_114_anim_list)
	.2byte (unit_icon_move_114_anim_4 - unit_icon_move_114_anim_list)

unit_icon_move_114_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_114_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_114_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_114_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_114_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_114_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_114_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_114_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_114_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_114_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_114_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_114_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_114_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_114_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_114_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_114_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_114_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_114_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_114_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_114_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_114_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_114_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_114_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_114_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_115_sheet
unit_icon_move_115_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_115_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_115_motion
unit_icon_move_115_motion:
	.2byte (unit_icon_move_115_frame_list - unit_icon_move_115_motion), (unit_icon_move_115_anim_list - unit_icon_move_115_motion) @ header

unit_icon_move_115_frame_list: @ +$4
	.2byte (unit_icon_move_115_frame_0 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_1 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_2 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_3 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_4 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_5 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_6 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_7 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_8 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_9 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_10 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_11 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_12 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_13 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_14 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_15 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_16 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_17 - unit_icon_move_115_frame_list)
	.2byte (unit_icon_move_115_frame_18 - unit_icon_move_115_frame_list)

unit_icon_move_115_anim_list: @ +$2A
	.2byte (unit_icon_move_115_anim_0 - unit_icon_move_115_anim_list)
	.2byte (unit_icon_move_115_anim_1 - unit_icon_move_115_anim_list)
	.2byte (unit_icon_move_115_anim_2 - unit_icon_move_115_anim_list)
	.2byte (unit_icon_move_115_anim_3 - unit_icon_move_115_anim_list)
	.2byte (unit_icon_move_115_anim_4 - unit_icon_move_115_anim_list)

unit_icon_move_115_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_115_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_115_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_115_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_115_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_115_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_115_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_115_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_115_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_115_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_115_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_115_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_115_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_115_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_115_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_115_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_115_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_115_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_115_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_115_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_115_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_115_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_115_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_115_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_116_sheet
unit_icon_move_116_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_116_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_116_motion
unit_icon_move_116_motion:
	.2byte (unit_icon_move_116_frame_list - unit_icon_move_116_motion), (unit_icon_move_116_anim_list - unit_icon_move_116_motion) @ header

unit_icon_move_116_frame_list: @ +$4
	.2byte (unit_icon_move_116_frame_0 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_1 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_2 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_3 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_4 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_5 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_6 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_7 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_8 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_9 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_10 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_11 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_12 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_13 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_14 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_15 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_16 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_17 - unit_icon_move_116_frame_list)
	.2byte (unit_icon_move_116_frame_18 - unit_icon_move_116_frame_list)

unit_icon_move_116_anim_list: @ +$2A
	.2byte (unit_icon_move_116_anim_0 - unit_icon_move_116_anim_list)
	.2byte (unit_icon_move_116_anim_1 - unit_icon_move_116_anim_list)
	.2byte (unit_icon_move_116_anim_2 - unit_icon_move_116_anim_list)
	.2byte (unit_icon_move_116_anim_3 - unit_icon_move_116_anim_list)
	.2byte (unit_icon_move_116_anim_4 - unit_icon_move_116_anim_list)

unit_icon_move_116_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_116_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_116_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_116_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_116_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_116_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_116_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_116_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_116_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_116_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_116_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_116_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_116_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_116_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_116_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_116_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_116_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_116_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_116_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_116_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_116_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_116_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_116_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_116_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_117_sheet
unit_icon_move_117_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_117_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_117_motion
unit_icon_move_117_motion:
	.2byte (unit_icon_move_117_frame_list - unit_icon_move_117_motion), (unit_icon_move_117_anim_list - unit_icon_move_117_motion) @ header

unit_icon_move_117_frame_list: @ +$4
	.2byte (unit_icon_move_117_frame_0 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_1 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_2 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_3 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_4 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_5 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_6 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_7 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_8 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_9 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_10 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_11 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_12 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_13 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_14 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_15 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_16 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_17 - unit_icon_move_117_frame_list)
	.2byte (unit_icon_move_117_frame_18 - unit_icon_move_117_frame_list)

unit_icon_move_117_anim_list: @ +$2A
	.2byte (unit_icon_move_117_anim_0 - unit_icon_move_117_anim_list)
	.2byte (unit_icon_move_117_anim_1 - unit_icon_move_117_anim_list)
	.2byte (unit_icon_move_117_anim_2 - unit_icon_move_117_anim_list)
	.2byte (unit_icon_move_117_anim_3 - unit_icon_move_117_anim_list)
	.2byte (unit_icon_move_117_anim_4 - unit_icon_move_117_anim_list)

unit_icon_move_117_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_117_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_117_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_117_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_117_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_117_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_117_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_117_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_117_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_117_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_117_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_117_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_117_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_117_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_117_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_117_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_117_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_117_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_117_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_117_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_117_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_117_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_117_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_117_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_118_sheet
unit_icon_move_118_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_118_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_118_motion
unit_icon_move_118_motion:
	.2byte (unit_icon_move_118_frame_list - unit_icon_move_118_motion), (unit_icon_move_118_anim_list - unit_icon_move_118_motion) @ header

unit_icon_move_118_frame_list: @ +$4
	.2byte (unit_icon_move_118_frame_0 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_1 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_2 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_3 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_4 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_5 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_6 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_7 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_8 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_9 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_10 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_11 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_12 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_13 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_14 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_15 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_16 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_17 - unit_icon_move_118_frame_list)
	.2byte (unit_icon_move_118_frame_18 - unit_icon_move_118_frame_list)

unit_icon_move_118_anim_list: @ +$2A
	.2byte (unit_icon_move_118_anim_0 - unit_icon_move_118_anim_list)
	.2byte (unit_icon_move_118_anim_1 - unit_icon_move_118_anim_list)
	.2byte (unit_icon_move_118_anim_2 - unit_icon_move_118_anim_list)
	.2byte (unit_icon_move_118_anim_3 - unit_icon_move_118_anim_list)
	.2byte (unit_icon_move_118_anim_4 - unit_icon_move_118_anim_list)

unit_icon_move_118_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_118_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_118_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_118_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_118_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_118_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_118_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_118_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_118_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_118_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_118_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_118_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_118_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_118_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_118_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_118_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_118_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_118_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_118_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_118_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_118_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_118_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_118_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_118_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_119_sheet
unit_icon_move_119_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_119_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_119_motion
unit_icon_move_119_motion:
	.2byte (unit_icon_move_119_frame_list - unit_icon_move_119_motion), (unit_icon_move_119_anim_list - unit_icon_move_119_motion) @ header

unit_icon_move_119_frame_list: @ +$4
	.2byte (unit_icon_move_119_frame_0 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_1 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_2 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_3 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_4 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_5 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_6 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_7 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_8 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_9 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_10 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_11 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_12 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_13 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_14 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_15 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_16 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_17 - unit_icon_move_119_frame_list)
	.2byte (unit_icon_move_119_frame_18 - unit_icon_move_119_frame_list)

unit_icon_move_119_anim_list: @ +$2A
	.2byte (unit_icon_move_119_anim_0 - unit_icon_move_119_anim_list)
	.2byte (unit_icon_move_119_anim_1 - unit_icon_move_119_anim_list)
	.2byte (unit_icon_move_119_anim_2 - unit_icon_move_119_anim_list)
	.2byte (unit_icon_move_119_anim_3 - unit_icon_move_119_anim_list)
	.2byte (unit_icon_move_119_anim_4 - unit_icon_move_119_anim_list)

unit_icon_move_119_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_119_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_119_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_119_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_119_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_119_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_119_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_119_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_119_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_119_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_119_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_119_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_119_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_119_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_119_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_119_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_119_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_119_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_119_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_119_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_119_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_119_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_119_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_119_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_120_sheet
unit_icon_move_120_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_120_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_120_motion
unit_icon_move_120_motion:
	.2byte (unit_icon_move_120_frame_list - unit_icon_move_120_motion), (unit_icon_move_120_anim_list - unit_icon_move_120_motion) @ header

unit_icon_move_120_frame_list: @ +$4
	.2byte (unit_icon_move_120_frame_0 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_1 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_2 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_3 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_4 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_5 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_6 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_7 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_8 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_9 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_10 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_11 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_12 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_13 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_14 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_15 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_16 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_17 - unit_icon_move_120_frame_list)
	.2byte (unit_icon_move_120_frame_18 - unit_icon_move_120_frame_list)

unit_icon_move_120_anim_list: @ +$2A
	.2byte (unit_icon_move_120_anim_0 - unit_icon_move_120_anim_list)
	.2byte (unit_icon_move_120_anim_1 - unit_icon_move_120_anim_list)
	.2byte (unit_icon_move_120_anim_2 - unit_icon_move_120_anim_list)
	.2byte (unit_icon_move_120_anim_3 - unit_icon_move_120_anim_list)
	.2byte (unit_icon_move_120_anim_4 - unit_icon_move_120_anim_list)

unit_icon_move_120_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_120_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_120_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_120_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_120_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_120_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_120_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_120_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_120_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_120_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_120_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_120_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_120_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_120_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_120_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_120_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_120_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_120_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_120_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_120_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_120_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_120_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_120_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_120_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_121_sheet
unit_icon_move_121_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_121_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_121_motion
unit_icon_move_121_motion:
	.2byte (unit_icon_move_121_frame_list - unit_icon_move_121_motion), (unit_icon_move_121_anim_list - unit_icon_move_121_motion) @ header

unit_icon_move_121_frame_list: @ +$4
	.2byte (unit_icon_move_121_frame_0 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_1 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_2 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_3 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_4 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_5 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_6 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_7 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_8 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_9 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_10 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_11 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_12 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_13 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_14 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_15 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_16 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_17 - unit_icon_move_121_frame_list)
	.2byte (unit_icon_move_121_frame_18 - unit_icon_move_121_frame_list)

unit_icon_move_121_anim_list: @ +$2A
	.2byte (unit_icon_move_121_anim_0 - unit_icon_move_121_anim_list)
	.2byte (unit_icon_move_121_anim_1 - unit_icon_move_121_anim_list)
	.2byte (unit_icon_move_121_anim_2 - unit_icon_move_121_anim_list)
	.2byte (unit_icon_move_121_anim_3 - unit_icon_move_121_anim_list)
	.2byte (unit_icon_move_121_anim_4 - unit_icon_move_121_anim_list)

unit_icon_move_121_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_121_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_121_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_121_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_121_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_121_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_121_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_121_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_121_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_121_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_121_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_121_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_121_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_121_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_121_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_121_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_121_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_121_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_121_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_121_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_121_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_121_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_121_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_121_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_122_sheet
unit_icon_move_122_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_122_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_122_motion
unit_icon_move_122_motion:
	.2byte (unit_icon_move_122_frame_list - unit_icon_move_122_motion), (unit_icon_move_122_anim_list - unit_icon_move_122_motion) @ header

unit_icon_move_122_frame_list: @ +$4
	.2byte (unit_icon_move_122_frame_0 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_1 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_2 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_3 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_4 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_5 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_6 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_7 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_8 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_9 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_10 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_11 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_12 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_13 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_14 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_15 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_16 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_17 - unit_icon_move_122_frame_list)
	.2byte (unit_icon_move_122_frame_18 - unit_icon_move_122_frame_list)

unit_icon_move_122_anim_list: @ +$2A
	.2byte (unit_icon_move_122_anim_0 - unit_icon_move_122_anim_list)
	.2byte (unit_icon_move_122_anim_1 - unit_icon_move_122_anim_list)
	.2byte (unit_icon_move_122_anim_2 - unit_icon_move_122_anim_list)
	.2byte (unit_icon_move_122_anim_3 - unit_icon_move_122_anim_list)
	.2byte (unit_icon_move_122_anim_4 - unit_icon_move_122_anim_list)

unit_icon_move_122_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_122_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_122_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_122_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_122_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_122_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_122_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_122_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_122_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_122_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_122_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_122_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_122_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_122_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_122_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_122_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_122_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_122_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_122_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_122_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_122_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_122_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_122_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_122_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0
