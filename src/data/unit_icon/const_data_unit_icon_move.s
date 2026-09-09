	.section .rodata

	.global unit_icon_move_Ephraim_Lord_sheet
unit_icon_move_Ephraim_Lord_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Ephraim_Lord_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Ephraim_Lord_motion
unit_icon_move_Ephraim_Lord_motion:
	.2byte (unit_icon_move_Ephraim_Lord_frame_list - unit_icon_move_Ephraim_Lord_motion), (unit_icon_move_Ephraim_Lord_anim_list - unit_icon_move_Ephraim_Lord_motion) @ header

unit_icon_move_Ephraim_Lord_frame_list: @ +$4
	.2byte (unit_icon_move_Ephraim_Lord_frame_0 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_1 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_2 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_3 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_4 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_5 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_6 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_7 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_8 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_9 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_10 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_11 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_12 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_13 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_14 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_15 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_16 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_17 - unit_icon_move_Ephraim_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Lord_frame_18 - unit_icon_move_Ephraim_Lord_frame_list)

unit_icon_move_Ephraim_Lord_anim_list: @ +$2A
	.2byte (unit_icon_move_Ephraim_Lord_anim_0 - unit_icon_move_Ephraim_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Lord_anim_1 - unit_icon_move_Ephraim_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Lord_anim_2 - unit_icon_move_Ephraim_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Lord_anim_3 - unit_icon_move_Ephraim_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Lord_anim_4 - unit_icon_move_Ephraim_Lord_anim_list)

unit_icon_move_Ephraim_Lord_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Ephraim_Lord_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Lord_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Lord_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Lord_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Lord_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Eirika_Lord_sheet
unit_icon_move_Eirika_Lord_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Eirika_Lord_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Eirika_Lord_motion
unit_icon_move_Eirika_Lord_motion:
	.2byte (unit_icon_move_Eirika_Lord_frame_list - unit_icon_move_Eirika_Lord_motion), (unit_icon_move_Eirika_Lord_anim_list - unit_icon_move_Eirika_Lord_motion) @ header

unit_icon_move_Eirika_Lord_frame_list: @ +$4
	.2byte (unit_icon_move_Eirika_Lord_frame_0 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_1 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_2 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_3 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_4 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_5 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_6 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_7 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_8 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_9 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_10 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_11 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_12 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_13 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_14 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_15 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_16 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_17 - unit_icon_move_Eirika_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Lord_frame_18 - unit_icon_move_Eirika_Lord_frame_list)

unit_icon_move_Eirika_Lord_anim_list: @ +$2A
	.2byte (unit_icon_move_Eirika_Lord_anim_0 - unit_icon_move_Eirika_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Lord_anim_1 - unit_icon_move_Eirika_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Lord_anim_2 - unit_icon_move_Eirika_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Lord_anim_3 - unit_icon_move_Eirika_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Lord_anim_4 - unit_icon_move_Eirika_Lord_anim_list)

unit_icon_move_Eirika_Lord_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Eirika_Lord_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Lord_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Lord_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Lord_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Lord_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Ephraim_Master_Lord_sheet
unit_icon_move_Ephraim_Master_Lord_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Ephraim_Master_Lord_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Ephraim_Master_Lord_motion
unit_icon_move_Ephraim_Master_Lord_motion:
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_list - unit_icon_move_Ephraim_Master_Lord_motion), (unit_icon_move_Ephraim_Master_Lord_anim_list - unit_icon_move_Ephraim_Master_Lord_motion) @ header

unit_icon_move_Ephraim_Master_Lord_frame_list: @ +$4
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_0 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_1 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_2 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_3 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_4 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_5 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_6 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_7 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_8 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_9 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_10 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_11 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_12 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_13 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_14 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_15 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_16 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_17 - unit_icon_move_Ephraim_Master_Lord_frame_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_frame_18 - unit_icon_move_Ephraim_Master_Lord_frame_list)

unit_icon_move_Ephraim_Master_Lord_anim_list: @ +$2A
	.2byte (unit_icon_move_Ephraim_Master_Lord_anim_0 - unit_icon_move_Ephraim_Master_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_anim_1 - unit_icon_move_Ephraim_Master_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_anim_2 - unit_icon_move_Ephraim_Master_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_anim_3 - unit_icon_move_Ephraim_Master_Lord_anim_list)
	.2byte (unit_icon_move_Ephraim_Master_Lord_anim_4 - unit_icon_move_Ephraim_Master_Lord_anim_list)

unit_icon_move_Ephraim_Master_Lord_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Ephraim_Master_Lord_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Ephraim_Master_Lord_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Master_Lord_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Master_Lord_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Master_Lord_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ephraim_Master_Lord_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Eirika_Master_Lord_sheet
unit_icon_move_Eirika_Master_Lord_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Eirika_Master_Lord_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Eirika_Master_Lord_motion
unit_icon_move_Eirika_Master_Lord_motion:
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_list - unit_icon_move_Eirika_Master_Lord_motion), (unit_icon_move_Eirika_Master_Lord_anim_list - unit_icon_move_Eirika_Master_Lord_motion) @ header

unit_icon_move_Eirika_Master_Lord_frame_list: @ +$4
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_0 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_1 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_2 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_3 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_4 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_5 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_6 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_7 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_8 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_9 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_10 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_11 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_12 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_13 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_14 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_15 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_16 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_17 - unit_icon_move_Eirika_Master_Lord_frame_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_frame_18 - unit_icon_move_Eirika_Master_Lord_frame_list)

unit_icon_move_Eirika_Master_Lord_anim_list: @ +$2A
	.2byte (unit_icon_move_Eirika_Master_Lord_anim_0 - unit_icon_move_Eirika_Master_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_anim_1 - unit_icon_move_Eirika_Master_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_anim_2 - unit_icon_move_Eirika_Master_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_anim_3 - unit_icon_move_Eirika_Master_Lord_anim_list)
	.2byte (unit_icon_move_Eirika_Master_Lord_anim_4 - unit_icon_move_Eirika_Master_Lord_anim_list)

unit_icon_move_Eirika_Master_Lord_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Eirika_Master_Lord_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Eirika_Master_Lord_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Master_Lord_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Master_Lord_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Master_Lord_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Eirika_Master_Lord_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Cavalier_sheet
unit_icon_move_Cavalier_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Cavalier_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Cavalier_motion
unit_icon_move_Cavalier_motion:
	.2byte (unit_icon_move_Cavalier_frame_list - unit_icon_move_Cavalier_motion), (unit_icon_move_Cavalier_anim_list - unit_icon_move_Cavalier_motion) @ header

unit_icon_move_Cavalier_frame_list: @ +$4
	.2byte (unit_icon_move_Cavalier_frame_0 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_1 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_2 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_3 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_4 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_5 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_6 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_7 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_8 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_9 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_10 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_11 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_12 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_13 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_14 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_15 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_16 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_17 - unit_icon_move_Cavalier_frame_list)
	.2byte (unit_icon_move_Cavalier_frame_18 - unit_icon_move_Cavalier_frame_list)

unit_icon_move_Cavalier_anim_list: @ +$2A
	.2byte (unit_icon_move_Cavalier_anim_0 - unit_icon_move_Cavalier_anim_list)
	.2byte (unit_icon_move_Cavalier_anim_1 - unit_icon_move_Cavalier_anim_list)
	.2byte (unit_icon_move_Cavalier_anim_2 - unit_icon_move_Cavalier_anim_list)
	.2byte (unit_icon_move_Cavalier_anim_3 - unit_icon_move_Cavalier_anim_list)
	.2byte (unit_icon_move_Cavalier_anim_4 - unit_icon_move_Cavalier_anim_list)

unit_icon_move_Cavalier_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Cavalier_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Cavalier_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cavalier_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cavalier_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cavalier_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cavalier_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Paladin_sheet
unit_icon_move_Paladin_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Paladin_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Paladin_motion
unit_icon_move_Paladin_motion:
	.2byte (unit_icon_move_Paladin_frame_list - unit_icon_move_Paladin_motion), (unit_icon_move_Paladin_anim_list - unit_icon_move_Paladin_motion) @ header

unit_icon_move_Paladin_frame_list: @ +$4
	.2byte (unit_icon_move_Paladin_frame_0 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_1 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_2 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_3 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_4 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_5 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_6 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_7 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_8 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_9 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_10 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_11 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_12 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_13 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_14 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_15 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_16 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_17 - unit_icon_move_Paladin_frame_list)
	.2byte (unit_icon_move_Paladin_frame_18 - unit_icon_move_Paladin_frame_list)

unit_icon_move_Paladin_anim_list: @ +$2A
	.2byte (unit_icon_move_Paladin_anim_0 - unit_icon_move_Paladin_anim_list)
	.2byte (unit_icon_move_Paladin_anim_1 - unit_icon_move_Paladin_anim_list)
	.2byte (unit_icon_move_Paladin_anim_2 - unit_icon_move_Paladin_anim_list)
	.2byte (unit_icon_move_Paladin_anim_3 - unit_icon_move_Paladin_anim_list)
	.2byte (unit_icon_move_Paladin_anim_4 - unit_icon_move_Paladin_anim_list)

unit_icon_move_Paladin_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Paladin_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Paladin_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Paladin_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Paladin_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Paladin_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Paladin_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Paladin_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Paladin_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Paladin_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Paladin_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Paladin_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Paladin_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Paladin_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Paladin_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Paladin_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Paladin_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Paladin_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Paladin_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Armor_Knight_sheet
unit_icon_move_Armor_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Armor_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Armor_Knight_motion
unit_icon_move_Armor_Knight_motion:
	.2byte (unit_icon_move_Armor_Knight_frame_list - unit_icon_move_Armor_Knight_motion), (unit_icon_move_Armor_Knight_anim_list - unit_icon_move_Armor_Knight_motion) @ header

unit_icon_move_Armor_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Armor_Knight_frame_0 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_1 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_2 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_3 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_4 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_5 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_6 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_7 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_8 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_9 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_10 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_11 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_12 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_13 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_14 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_15 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_16 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_17 - unit_icon_move_Armor_Knight_frame_list)
	.2byte (unit_icon_move_Armor_Knight_frame_18 - unit_icon_move_Armor_Knight_frame_list)

unit_icon_move_Armor_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Armor_Knight_anim_0 - unit_icon_move_Armor_Knight_anim_list)
	.2byte (unit_icon_move_Armor_Knight_anim_1 - unit_icon_move_Armor_Knight_anim_list)
	.2byte (unit_icon_move_Armor_Knight_anim_2 - unit_icon_move_Armor_Knight_anim_list)
	.2byte (unit_icon_move_Armor_Knight_anim_3 - unit_icon_move_Armor_Knight_anim_list)
	.2byte (unit_icon_move_Armor_Knight_anim_4 - unit_icon_move_Armor_Knight_anim_list)

unit_icon_move_Armor_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Armor_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Armor_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Armor_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Armor_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Armor_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_General_sheet
unit_icon_move_General_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_General_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_General_motion
unit_icon_move_General_motion:
	.2byte (unit_icon_move_General_frame_list - unit_icon_move_General_motion), (unit_icon_move_General_anim_list - unit_icon_move_General_motion) @ header

unit_icon_move_General_frame_list: @ +$4
	.2byte (unit_icon_move_General_frame_0 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_1 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_2 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_3 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_4 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_5 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_6 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_7 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_8 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_9 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_10 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_11 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_12 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_13 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_14 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_15 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_16 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_17 - unit_icon_move_General_frame_list)
	.2byte (unit_icon_move_General_frame_18 - unit_icon_move_General_frame_list)

unit_icon_move_General_anim_list: @ +$2A
	.2byte (unit_icon_move_General_anim_0 - unit_icon_move_General_anim_list)
	.2byte (unit_icon_move_General_anim_1 - unit_icon_move_General_anim_list)
	.2byte (unit_icon_move_General_anim_2 - unit_icon_move_General_anim_list)
	.2byte (unit_icon_move_General_anim_3 - unit_icon_move_General_anim_list)
	.2byte (unit_icon_move_General_anim_4 - unit_icon_move_General_anim_list)

unit_icon_move_General_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_General_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_General_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_General_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_General_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_General_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_General_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_General_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_General_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_General_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_General_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_General_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_General_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_General_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_General_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_General_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_General_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_General_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_General_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE5, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0x80ED, 0x1E4, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_General_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_General_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_General_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_General_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_General_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Thief_sheet
unit_icon_move_Thief_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Thief_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Thief_motion
unit_icon_move_Thief_motion:
	.2byte (unit_icon_move_Thief_frame_list - unit_icon_move_Thief_motion), (unit_icon_move_Thief_anim_list - unit_icon_move_Thief_motion) @ header

unit_icon_move_Thief_frame_list: @ +$4
	.2byte (unit_icon_move_Thief_frame_0 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_1 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_2 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_3 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_4 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_5 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_6 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_7 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_8 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_9 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_10 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_11 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_12 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_13 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_14 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_15 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_16 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_17 - unit_icon_move_Thief_frame_list)
	.2byte (unit_icon_move_Thief_frame_18 - unit_icon_move_Thief_frame_list)

unit_icon_move_Thief_anim_list: @ +$2A
	.2byte (unit_icon_move_Thief_anim_0 - unit_icon_move_Thief_anim_list)
	.2byte (unit_icon_move_Thief_anim_1 - unit_icon_move_Thief_anim_list)
	.2byte (unit_icon_move_Thief_anim_2 - unit_icon_move_Thief_anim_list)
	.2byte (unit_icon_move_Thief_anim_3 - unit_icon_move_Thief_anim_list)
	.2byte (unit_icon_move_Thief_anim_4 - unit_icon_move_Thief_anim_list)

unit_icon_move_Thief_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Thief_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Thief_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Thief_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Thief_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Thief_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Thief_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Thief_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Thief_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Thief_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Thief_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Thief_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Thief_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Thief_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Thief_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Thief_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Thief_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Thief_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Thief_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Thief_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Thief_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Thief_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Thief_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Thief_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Manakete_sheet
unit_icon_move_Manakete_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Manakete_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Manakete_motion
unit_icon_move_Manakete_motion:
	.2byte (unit_icon_move_Manakete_frame_list - unit_icon_move_Manakete_motion), (unit_icon_move_Manakete_anim_list - unit_icon_move_Manakete_motion) @ header

unit_icon_move_Manakete_frame_list: @ +$4
	.2byte (unit_icon_move_Manakete_frame_0 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_1 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_2 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_3 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_4 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_5 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_6 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_7 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_8 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_9 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_10 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_11 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_12 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_13 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_14 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_15 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_16 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_17 - unit_icon_move_Manakete_frame_list)
	.2byte (unit_icon_move_Manakete_frame_18 - unit_icon_move_Manakete_frame_list)

unit_icon_move_Manakete_anim_list: @ +$2A
	.2byte (unit_icon_move_Manakete_anim_0 - unit_icon_move_Manakete_anim_list)
	.2byte (unit_icon_move_Manakete_anim_1 - unit_icon_move_Manakete_anim_list)
	.2byte (unit_icon_move_Manakete_anim_2 - unit_icon_move_Manakete_anim_list)
	.2byte (unit_icon_move_Manakete_anim_3 - unit_icon_move_Manakete_anim_list)
	.2byte (unit_icon_move_Manakete_anim_4 - unit_icon_move_Manakete_anim_list)

unit_icon_move_Manakete_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Manakete_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Manakete_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Manakete_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Manakete_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Manakete_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Manakete_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Manakete_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Manakete_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mercenary_sheet
unit_icon_move_Mercenary_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mercenary_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mercenary_motion
unit_icon_move_Mercenary_motion:
	.2byte (unit_icon_move_Mercenary_frame_list - unit_icon_move_Mercenary_motion), (unit_icon_move_Mercenary_anim_list - unit_icon_move_Mercenary_motion) @ header

unit_icon_move_Mercenary_frame_list: @ +$4
	.2byte (unit_icon_move_Mercenary_frame_0 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_1 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_2 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_3 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_4 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_5 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_6 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_7 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_8 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_9 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_10 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_11 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_12 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_13 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_14 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_15 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_16 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_17 - unit_icon_move_Mercenary_frame_list)
	.2byte (unit_icon_move_Mercenary_frame_18 - unit_icon_move_Mercenary_frame_list)

unit_icon_move_Mercenary_anim_list: @ +$2A
	.2byte (unit_icon_move_Mercenary_anim_0 - unit_icon_move_Mercenary_anim_list)
	.2byte (unit_icon_move_Mercenary_anim_1 - unit_icon_move_Mercenary_anim_list)
	.2byte (unit_icon_move_Mercenary_anim_2 - unit_icon_move_Mercenary_anim_list)
	.2byte (unit_icon_move_Mercenary_anim_3 - unit_icon_move_Mercenary_anim_list)
	.2byte (unit_icon_move_Mercenary_anim_4 - unit_icon_move_Mercenary_anim_list)

unit_icon_move_Mercenary_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mercenary_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mercenary_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mercenary_F_sheet
unit_icon_move_Mercenary_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mercenary_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mercenary_F_motion
unit_icon_move_Mercenary_F_motion:
	.2byte (unit_icon_move_Mercenary_F_frame_list - unit_icon_move_Mercenary_F_motion), (unit_icon_move_Mercenary_F_anim_list - unit_icon_move_Mercenary_F_motion) @ header

unit_icon_move_Mercenary_F_frame_list: @ +$4
	.2byte (unit_icon_move_Mercenary_F_frame_0 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_1 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_2 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_3 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_4 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_5 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_6 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_7 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_8 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_9 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_10 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_11 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_12 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_13 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_14 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_15 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_16 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_17 - unit_icon_move_Mercenary_F_frame_list)
	.2byte (unit_icon_move_Mercenary_F_frame_18 - unit_icon_move_Mercenary_F_frame_list)

unit_icon_move_Mercenary_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Mercenary_F_anim_0 - unit_icon_move_Mercenary_F_anim_list)
	.2byte (unit_icon_move_Mercenary_F_anim_1 - unit_icon_move_Mercenary_F_anim_list)
	.2byte (unit_icon_move_Mercenary_F_anim_2 - unit_icon_move_Mercenary_F_anim_list)
	.2byte (unit_icon_move_Mercenary_F_anim_3 - unit_icon_move_Mercenary_F_anim_list)
	.2byte (unit_icon_move_Mercenary_F_anim_4 - unit_icon_move_Mercenary_F_anim_list)

unit_icon_move_Mercenary_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mercenary_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mercenary_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Hero_sheet
unit_icon_move_Hero_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Hero_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Hero_motion
unit_icon_move_Hero_motion:
	.2byte (unit_icon_move_Hero_frame_list - unit_icon_move_Hero_motion), (unit_icon_move_Hero_anim_list - unit_icon_move_Hero_motion) @ header

unit_icon_move_Hero_frame_list: @ +$4
	.2byte (unit_icon_move_Hero_frame_0 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_1 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_2 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_3 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_4 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_5 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_6 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_7 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_8 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_9 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_10 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_11 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_12 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_13 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_14 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_15 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_16 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_17 - unit_icon_move_Hero_frame_list)
	.2byte (unit_icon_move_Hero_frame_18 - unit_icon_move_Hero_frame_list)

unit_icon_move_Hero_anim_list: @ +$2A
	.2byte (unit_icon_move_Hero_anim_0 - unit_icon_move_Hero_anim_list)
	.2byte (unit_icon_move_Hero_anim_1 - unit_icon_move_Hero_anim_list)
	.2byte (unit_icon_move_Hero_anim_2 - unit_icon_move_Hero_anim_list)
	.2byte (unit_icon_move_Hero_anim_3 - unit_icon_move_Hero_anim_list)
	.2byte (unit_icon_move_Hero_anim_4 - unit_icon_move_Hero_anim_list)

unit_icon_move_Hero_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Hero_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Hero_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Hero_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Hero_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Hero_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Hero_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Hero_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Hero_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Hero_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Hero_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Hero_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Hero_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Hero_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Hero_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Hero_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Hero_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Hero_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Hero_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1EC, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Hero_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Hero_F_sheet
unit_icon_move_Hero_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Hero_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Hero_F_motion
unit_icon_move_Hero_F_motion:
	.2byte (unit_icon_move_Hero_F_frame_list - unit_icon_move_Hero_F_motion), (unit_icon_move_Hero_F_anim_list - unit_icon_move_Hero_F_motion) @ header

unit_icon_move_Hero_F_frame_list: @ +$4
	.2byte (unit_icon_move_Hero_F_frame_0 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_1 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_2 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_3 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_4 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_5 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_6 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_7 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_8 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_9 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_10 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_11 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_12 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_13 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_14 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_15 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_16 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_17 - unit_icon_move_Hero_F_frame_list)
	.2byte (unit_icon_move_Hero_F_frame_18 - unit_icon_move_Hero_F_frame_list)

unit_icon_move_Hero_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Hero_F_anim_0 - unit_icon_move_Hero_F_anim_list)
	.2byte (unit_icon_move_Hero_F_anim_1 - unit_icon_move_Hero_F_anim_list)
	.2byte (unit_icon_move_Hero_F_anim_2 - unit_icon_move_Hero_F_anim_list)
	.2byte (unit_icon_move_Hero_F_anim_3 - unit_icon_move_Hero_F_anim_list)
	.2byte (unit_icon_move_Hero_F_anim_4 - unit_icon_move_Hero_F_anim_list)

unit_icon_move_Hero_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Hero_F_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EC, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1EC, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Hero_F_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_F_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_F_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_F_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Hero_F_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Myrmidon_sheet
unit_icon_move_Myrmidon_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Myrmidon_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Myrmidon_motion
unit_icon_move_Myrmidon_motion:
	.2byte (unit_icon_move_Myrmidon_frame_list - unit_icon_move_Myrmidon_motion), (unit_icon_move_Myrmidon_anim_list - unit_icon_move_Myrmidon_motion) @ header

unit_icon_move_Myrmidon_frame_list: @ +$4
	.2byte (unit_icon_move_Myrmidon_frame_0 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_1 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_2 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_3 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_4 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_5 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_6 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_7 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_8 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_9 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_10 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_11 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_12 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_13 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_14 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_15 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_16 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_17 - unit_icon_move_Myrmidon_frame_list)
	.2byte (unit_icon_move_Myrmidon_frame_18 - unit_icon_move_Myrmidon_frame_list)

unit_icon_move_Myrmidon_anim_list: @ +$2A
	.2byte (unit_icon_move_Myrmidon_anim_0 - unit_icon_move_Myrmidon_anim_list)
	.2byte (unit_icon_move_Myrmidon_anim_1 - unit_icon_move_Myrmidon_anim_list)
	.2byte (unit_icon_move_Myrmidon_anim_2 - unit_icon_move_Myrmidon_anim_list)
	.2byte (unit_icon_move_Myrmidon_anim_3 - unit_icon_move_Myrmidon_anim_list)
	.2byte (unit_icon_move_Myrmidon_anim_4 - unit_icon_move_Myrmidon_anim_list)

unit_icon_move_Myrmidon_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Myrmidon_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Myrmidon_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Myrmidon_F_sheet
unit_icon_move_Myrmidon_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Myrmidon_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Myrmidon_F_motion
unit_icon_move_Myrmidon_F_motion:
	.2byte (unit_icon_move_Myrmidon_F_frame_list - unit_icon_move_Myrmidon_F_motion), (unit_icon_move_Myrmidon_F_anim_list - unit_icon_move_Myrmidon_F_motion) @ header

unit_icon_move_Myrmidon_F_frame_list: @ +$4
	.2byte (unit_icon_move_Myrmidon_F_frame_0 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_1 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_2 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_3 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_4 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_5 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_6 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_7 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_8 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_9 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_10 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_11 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_12 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_13 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_14 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_15 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_16 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_17 - unit_icon_move_Myrmidon_F_frame_list)
	.2byte (unit_icon_move_Myrmidon_F_frame_18 - unit_icon_move_Myrmidon_F_frame_list)

unit_icon_move_Myrmidon_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Myrmidon_F_anim_0 - unit_icon_move_Myrmidon_F_anim_list)
	.2byte (unit_icon_move_Myrmidon_F_anim_1 - unit_icon_move_Myrmidon_F_anim_list)
	.2byte (unit_icon_move_Myrmidon_F_anim_2 - unit_icon_move_Myrmidon_F_anim_list)
	.2byte (unit_icon_move_Myrmidon_F_anim_3 - unit_icon_move_Myrmidon_F_anim_list)
	.2byte (unit_icon_move_Myrmidon_F_anim_4 - unit_icon_move_Myrmidon_F_anim_list)

unit_icon_move_Myrmidon_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Myrmidon_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Myrmidon_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Swordmaster_sheet
unit_icon_move_Swordmaster_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Swordmaster_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Swordmaster_motion
unit_icon_move_Swordmaster_motion:
	.2byte (unit_icon_move_Swordmaster_frame_list - unit_icon_move_Swordmaster_motion), (unit_icon_move_Swordmaster_anim_list - unit_icon_move_Swordmaster_motion) @ header

unit_icon_move_Swordmaster_frame_list: @ +$4
	.2byte (unit_icon_move_Swordmaster_frame_0 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_1 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_2 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_3 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_4 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_5 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_6 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_7 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_8 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_9 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_10 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_11 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_12 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_13 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_14 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_15 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_16 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_17 - unit_icon_move_Swordmaster_frame_list)
	.2byte (unit_icon_move_Swordmaster_frame_18 - unit_icon_move_Swordmaster_frame_list)

unit_icon_move_Swordmaster_anim_list: @ +$2A
	.2byte (unit_icon_move_Swordmaster_anim_0 - unit_icon_move_Swordmaster_anim_list)
	.2byte (unit_icon_move_Swordmaster_anim_1 - unit_icon_move_Swordmaster_anim_list)
	.2byte (unit_icon_move_Swordmaster_anim_2 - unit_icon_move_Swordmaster_anim_list)
	.2byte (unit_icon_move_Swordmaster_anim_3 - unit_icon_move_Swordmaster_anim_list)
	.2byte (unit_icon_move_Swordmaster_anim_4 - unit_icon_move_Swordmaster_anim_list)

unit_icon_move_Swordmaster_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Swordmaster_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x0, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Swordmaster_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Swordmaster_F_sheet
unit_icon_move_Swordmaster_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Swordmaster_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Swordmaster_F_motion
unit_icon_move_Swordmaster_F_motion:
	.2byte (unit_icon_move_Swordmaster_F_frame_list - unit_icon_move_Swordmaster_F_motion), (unit_icon_move_Swordmaster_F_anim_list - unit_icon_move_Swordmaster_F_motion) @ header

unit_icon_move_Swordmaster_F_frame_list: @ +$4
	.2byte (unit_icon_move_Swordmaster_F_frame_0 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_1 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_2 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_3 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_4 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_5 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_6 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_7 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_8 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_9 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_10 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_11 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_12 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_13 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_14 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_15 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_16 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_17 - unit_icon_move_Swordmaster_F_frame_list)
	.2byte (unit_icon_move_Swordmaster_F_frame_18 - unit_icon_move_Swordmaster_F_frame_list)

unit_icon_move_Swordmaster_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Swordmaster_F_anim_0 - unit_icon_move_Swordmaster_F_anim_list)
	.2byte (unit_icon_move_Swordmaster_F_anim_1 - unit_icon_move_Swordmaster_F_anim_list)
	.2byte (unit_icon_move_Swordmaster_F_anim_2 - unit_icon_move_Swordmaster_F_anim_list)
	.2byte (unit_icon_move_Swordmaster_F_anim_3 - unit_icon_move_Swordmaster_F_anim_list)
	.2byte (unit_icon_move_Swordmaster_F_anim_4 - unit_icon_move_Swordmaster_F_anim_list)

unit_icon_move_Swordmaster_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Swordmaster_F_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x0, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Swordmaster_F_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_F_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_F_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_F_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Swordmaster_F_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Assassin_sheet
unit_icon_move_Assassin_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Assassin_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Assassin_motion
unit_icon_move_Assassin_motion:
	.2byte (unit_icon_move_Assassin_frame_list - unit_icon_move_Assassin_motion), (unit_icon_move_Assassin_anim_list - unit_icon_move_Assassin_motion) @ header

unit_icon_move_Assassin_frame_list: @ +$4
	.2byte (unit_icon_move_Assassin_frame_0 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_1 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_2 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_3 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_4 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_5 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_6 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_7 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_8 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_9 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_10 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_11 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_12 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_13 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_14 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_15 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_16 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_17 - unit_icon_move_Assassin_frame_list)
	.2byte (unit_icon_move_Assassin_frame_18 - unit_icon_move_Assassin_frame_list)

unit_icon_move_Assassin_anim_list: @ +$2A
	.2byte (unit_icon_move_Assassin_anim_0 - unit_icon_move_Assassin_anim_list)
	.2byte (unit_icon_move_Assassin_anim_1 - unit_icon_move_Assassin_anim_list)
	.2byte (unit_icon_move_Assassin_anim_2 - unit_icon_move_Assassin_anim_list)
	.2byte (unit_icon_move_Assassin_anim_3 - unit_icon_move_Assassin_anim_list)
	.2byte (unit_icon_move_Assassin_anim_4 - unit_icon_move_Assassin_anim_list)

unit_icon_move_Assassin_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Assassin_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Assassin_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Assassin_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Assassin_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Assassin_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Assassin_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Assassin_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Assassin_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Assassin_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Assassin_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Assassin_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Assassin_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Assassin_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Assassin_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Assassin_F_sheet
unit_icon_move_Assassin_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Assassin_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Assassin_F_motion
unit_icon_move_Assassin_F_motion:
	.2byte (unit_icon_move_Assassin_F_frame_list - unit_icon_move_Assassin_F_motion), (unit_icon_move_Assassin_F_anim_list - unit_icon_move_Assassin_F_motion) @ header

unit_icon_move_Assassin_F_frame_list: @ +$4
	.2byte (unit_icon_move_Assassin_F_frame_0 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_1 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_2 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_3 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_4 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_5 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_6 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_7 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_8 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_9 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_10 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_11 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_12 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_13 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_14 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_15 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_16 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_17 - unit_icon_move_Assassin_F_frame_list)
	.2byte (unit_icon_move_Assassin_F_frame_18 - unit_icon_move_Assassin_F_frame_list)

unit_icon_move_Assassin_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Assassin_F_anim_0 - unit_icon_move_Assassin_F_anim_list)
	.2byte (unit_icon_move_Assassin_F_anim_1 - unit_icon_move_Assassin_F_anim_list)
	.2byte (unit_icon_move_Assassin_F_anim_2 - unit_icon_move_Assassin_F_anim_list)
	.2byte (unit_icon_move_Assassin_F_anim_3 - unit_icon_move_Assassin_F_anim_list)
	.2byte (unit_icon_move_Assassin_F_anim_4 - unit_icon_move_Assassin_F_anim_list)

unit_icon_move_Assassin_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Assassin_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Assassin_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Assassin_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Archer_sheet
unit_icon_move_Archer_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Archer_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Archer_motion
unit_icon_move_Archer_motion:
	.2byte (unit_icon_move_Archer_frame_list - unit_icon_move_Archer_motion), (unit_icon_move_Archer_anim_list - unit_icon_move_Archer_motion) @ header

unit_icon_move_Archer_frame_list: @ +$4
	.2byte (unit_icon_move_Archer_frame_0 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_1 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_2 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_3 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_4 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_5 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_6 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_7 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_8 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_9 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_10 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_11 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_12 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_13 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_14 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_15 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_16 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_17 - unit_icon_move_Archer_frame_list)
	.2byte (unit_icon_move_Archer_frame_18 - unit_icon_move_Archer_frame_list)

unit_icon_move_Archer_anim_list: @ +$2A
	.2byte (unit_icon_move_Archer_anim_0 - unit_icon_move_Archer_anim_list)
	.2byte (unit_icon_move_Archer_anim_1 - unit_icon_move_Archer_anim_list)
	.2byte (unit_icon_move_Archer_anim_2 - unit_icon_move_Archer_anim_list)
	.2byte (unit_icon_move_Archer_anim_3 - unit_icon_move_Archer_anim_list)
	.2byte (unit_icon_move_Archer_anim_4 - unit_icon_move_Archer_anim_list)

unit_icon_move_Archer_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Archer_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Archer_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Archer_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Archer_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Archer_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Archer_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Archer_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Archer_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Archer_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Archer_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Archer_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Archer_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Archer_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Archer_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Archer_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Archer_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Archer_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Archer_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F2, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Archer_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Archer_F_sheet
unit_icon_move_Archer_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Archer_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Archer_F_motion
unit_icon_move_Archer_F_motion:
	.2byte (unit_icon_move_Archer_F_frame_list - unit_icon_move_Archer_F_motion), (unit_icon_move_Archer_F_anim_list - unit_icon_move_Archer_F_motion) @ header

unit_icon_move_Archer_F_frame_list: @ +$4
	.2byte (unit_icon_move_Archer_F_frame_0 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_1 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_2 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_3 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_4 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_5 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_6 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_7 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_8 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_9 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_10 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_11 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_12 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_13 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_14 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_15 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_16 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_17 - unit_icon_move_Archer_F_frame_list)
	.2byte (unit_icon_move_Archer_F_frame_18 - unit_icon_move_Archer_F_frame_list)

unit_icon_move_Archer_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Archer_F_anim_0 - unit_icon_move_Archer_F_anim_list)
	.2byte (unit_icon_move_Archer_F_anim_1 - unit_icon_move_Archer_F_anim_list)
	.2byte (unit_icon_move_Archer_F_anim_2 - unit_icon_move_Archer_F_anim_list)
	.2byte (unit_icon_move_Archer_F_anim_3 - unit_icon_move_Archer_F_anim_list)
	.2byte (unit_icon_move_Archer_F_anim_4 - unit_icon_move_Archer_F_anim_list)

unit_icon_move_Archer_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Archer_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Archer_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Archer_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Sniper_sheet
unit_icon_move_Sniper_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Sniper_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Sniper_motion
unit_icon_move_Sniper_motion:
	.2byte (unit_icon_move_Sniper_frame_list - unit_icon_move_Sniper_motion), (unit_icon_move_Sniper_anim_list - unit_icon_move_Sniper_motion) @ header

unit_icon_move_Sniper_frame_list: @ +$4
	.2byte (unit_icon_move_Sniper_frame_0 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_1 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_2 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_3 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_4 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_5 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_6 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_7 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_8 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_9 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_10 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_11 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_12 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_13 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_14 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_15 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_16 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_17 - unit_icon_move_Sniper_frame_list)
	.2byte (unit_icon_move_Sniper_frame_18 - unit_icon_move_Sniper_frame_list)

unit_icon_move_Sniper_anim_list: @ +$2A
	.2byte (unit_icon_move_Sniper_anim_0 - unit_icon_move_Sniper_anim_list)
	.2byte (unit_icon_move_Sniper_anim_1 - unit_icon_move_Sniper_anim_list)
	.2byte (unit_icon_move_Sniper_anim_2 - unit_icon_move_Sniper_anim_list)
	.2byte (unit_icon_move_Sniper_anim_3 - unit_icon_move_Sniper_anim_list)
	.2byte (unit_icon_move_Sniper_anim_4 - unit_icon_move_Sniper_anim_list)

unit_icon_move_Sniper_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sniper_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sniper_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sniper_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sniper_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sniper_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sniper_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Sniper_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Sniper_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Sniper_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Sniper_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Sniper_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Sniper_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Sniper_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Sniper_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Sniper_F_sheet
unit_icon_move_Sniper_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Sniper_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Sniper_F_motion
unit_icon_move_Sniper_F_motion:
	.2byte (unit_icon_move_Sniper_F_frame_list - unit_icon_move_Sniper_F_motion), (unit_icon_move_Sniper_F_anim_list - unit_icon_move_Sniper_F_motion) @ header

unit_icon_move_Sniper_F_frame_list: @ +$4
	.2byte (unit_icon_move_Sniper_F_frame_0 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_1 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_2 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_3 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_4 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_5 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_6 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_7 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_8 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_9 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_10 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_11 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_12 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_13 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_14 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_15 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_16 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_17 - unit_icon_move_Sniper_F_frame_list)
	.2byte (unit_icon_move_Sniper_F_frame_18 - unit_icon_move_Sniper_F_frame_list)

unit_icon_move_Sniper_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Sniper_F_anim_0 - unit_icon_move_Sniper_F_anim_list)
	.2byte (unit_icon_move_Sniper_F_anim_1 - unit_icon_move_Sniper_F_anim_list)
	.2byte (unit_icon_move_Sniper_F_anim_2 - unit_icon_move_Sniper_F_anim_list)
	.2byte (unit_icon_move_Sniper_F_anim_3 - unit_icon_move_Sniper_F_anim_list)
	.2byte (unit_icon_move_Sniper_F_anim_4 - unit_icon_move_Sniper_F_anim_list)

unit_icon_move_Sniper_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Sniper_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Sniper_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sniper_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Ranger_sheet
unit_icon_move_Ranger_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Ranger_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Ranger_motion
unit_icon_move_Ranger_motion:
	.2byte (unit_icon_move_Ranger_frame_list - unit_icon_move_Ranger_motion), (unit_icon_move_Ranger_anim_list - unit_icon_move_Ranger_motion) @ header

unit_icon_move_Ranger_frame_list: @ +$4
	.2byte (unit_icon_move_Ranger_frame_0 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_1 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_2 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_3 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_4 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_5 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_6 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_7 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_8 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_9 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_10 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_11 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_12 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_13 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_14 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_15 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_16 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_17 - unit_icon_move_Ranger_frame_list)
	.2byte (unit_icon_move_Ranger_frame_18 - unit_icon_move_Ranger_frame_list)

unit_icon_move_Ranger_anim_list: @ +$2A
	.2byte (unit_icon_move_Ranger_anim_0 - unit_icon_move_Ranger_anim_list)
	.2byte (unit_icon_move_Ranger_anim_1 - unit_icon_move_Ranger_anim_list)
	.2byte (unit_icon_move_Ranger_anim_2 - unit_icon_move_Ranger_anim_list)
	.2byte (unit_icon_move_Ranger_anim_3 - unit_icon_move_Ranger_anim_list)
	.2byte (unit_icon_move_Ranger_anim_4 - unit_icon_move_Ranger_anim_list)

unit_icon_move_Ranger_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ranger_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ranger_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ranger_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Ranger_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Ranger_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Ranger_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Ranger_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Ranger_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Ranger_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Ranger_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Ranger_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Ranger_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Ranger_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Ranger_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ranger_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ranger_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ranger_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Ranger_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wyvern_Rider_sheet
unit_icon_move_Wyvern_Rider_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wyvern_Rider_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wyvern_Rider_motion
unit_icon_move_Wyvern_Rider_motion:
	.2byte (unit_icon_move_Wyvern_Rider_frame_list - unit_icon_move_Wyvern_Rider_motion), (unit_icon_move_Wyvern_Rider_anim_list - unit_icon_move_Wyvern_Rider_motion) @ header

unit_icon_move_Wyvern_Rider_frame_list: @ +$4
	.2byte (unit_icon_move_Wyvern_Rider_frame_0 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_1 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_2 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_3 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_4 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_5 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_6 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_7 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_8 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_9 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_10 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_11 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_12 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_13 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_14 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_15 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_16 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_17 - unit_icon_move_Wyvern_Rider_frame_list)
	.2byte (unit_icon_move_Wyvern_Rider_frame_18 - unit_icon_move_Wyvern_Rider_frame_list)

unit_icon_move_Wyvern_Rider_anim_list: @ +$2A
	.2byte (unit_icon_move_Wyvern_Rider_anim_0 - unit_icon_move_Wyvern_Rider_anim_list)
	.2byte (unit_icon_move_Wyvern_Rider_anim_1 - unit_icon_move_Wyvern_Rider_anim_list)
	.2byte (unit_icon_move_Wyvern_Rider_anim_2 - unit_icon_move_Wyvern_Rider_anim_list)
	.2byte (unit_icon_move_Wyvern_Rider_anim_3 - unit_icon_move_Wyvern_Rider_anim_list)
	.2byte (unit_icon_move_Wyvern_Rider_anim_4 - unit_icon_move_Wyvern_Rider_anim_list)

unit_icon_move_Wyvern_Rider_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wyvern_Rider_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Wyvern_Rider_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Rider_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Rider_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Rider_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Rider_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wyvern_Lord_sheet
unit_icon_move_Wyvern_Lord_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wyvern_Lord_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wyvern_Lord_motion
unit_icon_move_Wyvern_Lord_motion:
	.2byte (unit_icon_move_Wyvern_Lord_frame_list - unit_icon_move_Wyvern_Lord_motion), (unit_icon_move_Wyvern_Lord_anim_list - unit_icon_move_Wyvern_Lord_motion) @ header

unit_icon_move_Wyvern_Lord_frame_list: @ +$4
	.2byte (unit_icon_move_Wyvern_Lord_frame_0 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_1 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_2 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_3 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_4 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_5 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_6 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_7 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_8 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_9 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_10 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_11 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_12 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_13 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_14 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_15 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_16 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_17 - unit_icon_move_Wyvern_Lord_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_frame_18 - unit_icon_move_Wyvern_Lord_frame_list)

unit_icon_move_Wyvern_Lord_anim_list: @ +$2A
	.2byte (unit_icon_move_Wyvern_Lord_anim_0 - unit_icon_move_Wyvern_Lord_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_anim_1 - unit_icon_move_Wyvern_Lord_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_anim_2 - unit_icon_move_Wyvern_Lord_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_anim_3 - unit_icon_move_Wyvern_Lord_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_anim_4 - unit_icon_move_Wyvern_Lord_anim_list)

unit_icon_move_Wyvern_Lord_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Wyvern_Lord_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wyvern_Lord_F_sheet
unit_icon_move_Wyvern_Lord_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wyvern_Lord_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wyvern_Lord_F_motion
unit_icon_move_Wyvern_Lord_F_motion:
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_list - unit_icon_move_Wyvern_Lord_F_motion), (unit_icon_move_Wyvern_Lord_F_anim_list - unit_icon_move_Wyvern_Lord_F_motion) @ header

unit_icon_move_Wyvern_Lord_F_frame_list: @ +$4
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_0 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_1 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_2 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_3 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_4 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_5 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_6 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_7 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_8 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_9 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_10 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_11 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_12 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_13 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_14 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_15 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_16 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_17 - unit_icon_move_Wyvern_Lord_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_frame_18 - unit_icon_move_Wyvern_Lord_F_frame_list)

unit_icon_move_Wyvern_Lord_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Wyvern_Lord_F_anim_0 - unit_icon_move_Wyvern_Lord_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_anim_1 - unit_icon_move_Wyvern_Lord_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_anim_2 - unit_icon_move_Wyvern_Lord_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_anim_3 - unit_icon_move_Wyvern_Lord_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Lord_F_anim_4 - unit_icon_move_Wyvern_Lord_F_anim_list)

unit_icon_move_Wyvern_Lord_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wyvern_Lord_F_frame_18: @ +$E8
	.2byte 3 @ oam entries
	.2byte 0xE0, 0x81EB, 0x0 @ OAM Data #0
	.2byte 0xE0, 0xB, 0x4 @ OAM Data #1
	.2byte 0xD8, 0x3, 0x5 @ OAM Data #2
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1
	.2byte 0xF1 @ Sheet Tile #2

unit_icon_move_Wyvern_Lord_F_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_F_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_F_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_F_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Lord_F_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wyvern_Knight_sheet
unit_icon_move_Wyvern_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wyvern_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wyvern_Knight_motion
unit_icon_move_Wyvern_Knight_motion:
	.2byte (unit_icon_move_Wyvern_Knight_frame_list - unit_icon_move_Wyvern_Knight_motion), (unit_icon_move_Wyvern_Knight_anim_list - unit_icon_move_Wyvern_Knight_motion) @ header

unit_icon_move_Wyvern_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Wyvern_Knight_frame_0 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_1 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_2 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_3 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_4 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_5 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_6 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_7 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_8 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_9 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_10 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_11 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_12 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_13 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_14 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_15 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_16 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_17 - unit_icon_move_Wyvern_Knight_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_frame_18 - unit_icon_move_Wyvern_Knight_frame_list)

unit_icon_move_Wyvern_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Wyvern_Knight_anim_0 - unit_icon_move_Wyvern_Knight_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_anim_1 - unit_icon_move_Wyvern_Knight_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_anim_2 - unit_icon_move_Wyvern_Knight_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_anim_3 - unit_icon_move_Wyvern_Knight_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_anim_4 - unit_icon_move_Wyvern_Knight_anim_list)

unit_icon_move_Wyvern_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wyvern_Knight_F_sheet
unit_icon_move_Wyvern_Knight_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wyvern_Knight_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wyvern_Knight_F_motion
unit_icon_move_Wyvern_Knight_F_motion:
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_list - unit_icon_move_Wyvern_Knight_F_motion), (unit_icon_move_Wyvern_Knight_F_anim_list - unit_icon_move_Wyvern_Knight_F_motion) @ header

unit_icon_move_Wyvern_Knight_F_frame_list: @ +$4
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_0 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_1 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_2 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_3 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_4 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_5 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_6 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_7 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_8 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_9 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_10 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_11 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_12 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_13 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_14 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_15 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_16 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_17 - unit_icon_move_Wyvern_Knight_F_frame_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_frame_18 - unit_icon_move_Wyvern_Knight_F_frame_list)

unit_icon_move_Wyvern_Knight_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Wyvern_Knight_F_anim_0 - unit_icon_move_Wyvern_Knight_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_anim_1 - unit_icon_move_Wyvern_Knight_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_anim_2 - unit_icon_move_Wyvern_Knight_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_anim_3 - unit_icon_move_Wyvern_Knight_F_anim_list)
	.2byte (unit_icon_move_Wyvern_Knight_F_anim_4 - unit_icon_move_Wyvern_Knight_F_anim_list)

unit_icon_move_Wyvern_Knight_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wyvern_Knight_F_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0x80E0, 0x13, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Wyvern_Knight_F_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_F_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_F_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_F_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wyvern_Knight_F_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mage_sheet
unit_icon_move_Mage_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mage_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mage_motion
unit_icon_move_Mage_motion:
	.2byte (unit_icon_move_Mage_frame_list - unit_icon_move_Mage_motion), (unit_icon_move_Mage_anim_list - unit_icon_move_Mage_motion) @ header

unit_icon_move_Mage_frame_list: @ +$4
	.2byte (unit_icon_move_Mage_frame_0 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_1 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_2 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_3 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_4 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_5 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_6 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_7 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_8 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_9 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_10 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_11 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_12 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_13 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_14 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_15 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_16 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_17 - unit_icon_move_Mage_frame_list)
	.2byte (unit_icon_move_Mage_frame_18 - unit_icon_move_Mage_frame_list)

unit_icon_move_Mage_anim_list: @ +$2A
	.2byte (unit_icon_move_Mage_anim_0 - unit_icon_move_Mage_anim_list)
	.2byte (unit_icon_move_Mage_anim_1 - unit_icon_move_Mage_anim_list)
	.2byte (unit_icon_move_Mage_anim_2 - unit_icon_move_Mage_anim_list)
	.2byte (unit_icon_move_Mage_anim_3 - unit_icon_move_Mage_anim_list)
	.2byte (unit_icon_move_Mage_anim_4 - unit_icon_move_Mage_anim_list)

unit_icon_move_Mage_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mage_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mage_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mage_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mage_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mage_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mage_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mage_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mage_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mage_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mage_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mage_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mage_F_sheet
unit_icon_move_Mage_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mage_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mage_F_motion
unit_icon_move_Mage_F_motion:
	.2byte (unit_icon_move_Mage_F_frame_list - unit_icon_move_Mage_F_motion), (unit_icon_move_Mage_F_anim_list - unit_icon_move_Mage_F_motion) @ header

unit_icon_move_Mage_F_frame_list: @ +$4
	.2byte (unit_icon_move_Mage_F_frame_0 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_1 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_2 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_3 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_4 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_5 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_6 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_7 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_8 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_9 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_10 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_11 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_12 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_13 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_14 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_15 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_16 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_17 - unit_icon_move_Mage_F_frame_list)
	.2byte (unit_icon_move_Mage_F_frame_18 - unit_icon_move_Mage_F_frame_list)

unit_icon_move_Mage_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Mage_F_anim_0 - unit_icon_move_Mage_F_anim_list)
	.2byte (unit_icon_move_Mage_F_anim_1 - unit_icon_move_Mage_F_anim_list)
	.2byte (unit_icon_move_Mage_F_anim_2 - unit_icon_move_Mage_F_anim_list)
	.2byte (unit_icon_move_Mage_F_anim_3 - unit_icon_move_Mage_F_anim_list)
	.2byte (unit_icon_move_Mage_F_anim_4 - unit_icon_move_Mage_F_anim_list)

unit_icon_move_Mage_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mage_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F1, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mage_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Sage_sheet
unit_icon_move_Sage_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Sage_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Sage_motion
unit_icon_move_Sage_motion:
	.2byte (unit_icon_move_Sage_frame_list - unit_icon_move_Sage_motion), (unit_icon_move_Sage_anim_list - unit_icon_move_Sage_motion) @ header

unit_icon_move_Sage_frame_list: @ +$4
	.2byte (unit_icon_move_Sage_frame_0 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_1 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_2 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_3 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_4 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_5 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_6 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_7 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_8 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_9 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_10 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_11 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_12 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_13 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_14 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_15 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_16 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_17 - unit_icon_move_Sage_frame_list)
	.2byte (unit_icon_move_Sage_frame_18 - unit_icon_move_Sage_frame_list)

unit_icon_move_Sage_anim_list: @ +$2A
	.2byte (unit_icon_move_Sage_anim_0 - unit_icon_move_Sage_anim_list)
	.2byte (unit_icon_move_Sage_anim_1 - unit_icon_move_Sage_anim_list)
	.2byte (unit_icon_move_Sage_anim_2 - unit_icon_move_Sage_anim_list)
	.2byte (unit_icon_move_Sage_anim_3 - unit_icon_move_Sage_anim_list)
	.2byte (unit_icon_move_Sage_anim_4 - unit_icon_move_Sage_anim_list)

unit_icon_move_Sage_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sage_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sage_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sage_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sage_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sage_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sage_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sage_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sage_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Sage_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Sage_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Sage_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Sage_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Sage_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Sage_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Sage_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Sage_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Sage_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Sage_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE1, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Sage_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Sage_F_sheet
unit_icon_move_Sage_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Sage_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Sage_F_motion
unit_icon_move_Sage_F_motion:
	.2byte (unit_icon_move_Sage_F_frame_list - unit_icon_move_Sage_F_motion), (unit_icon_move_Sage_F_anim_list - unit_icon_move_Sage_F_motion) @ header

unit_icon_move_Sage_F_frame_list: @ +$4
	.2byte (unit_icon_move_Sage_F_frame_0 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_1 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_2 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_3 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_4 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_5 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_6 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_7 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_8 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_9 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_10 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_11 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_12 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_13 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_14 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_15 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_16 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_17 - unit_icon_move_Sage_F_frame_list)
	.2byte (unit_icon_move_Sage_F_frame_18 - unit_icon_move_Sage_F_frame_list)

unit_icon_move_Sage_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Sage_F_anim_0 - unit_icon_move_Sage_F_anim_list)
	.2byte (unit_icon_move_Sage_F_anim_1 - unit_icon_move_Sage_F_anim_list)
	.2byte (unit_icon_move_Sage_F_anim_2 - unit_icon_move_Sage_F_anim_list)
	.2byte (unit_icon_move_Sage_F_anim_3 - unit_icon_move_Sage_F_anim_list)
	.2byte (unit_icon_move_Sage_F_anim_4 - unit_icon_move_Sage_F_anim_list)

unit_icon_move_Sage_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Sage_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE2, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Sage_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Sage_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mage_Knight_sheet
unit_icon_move_Mage_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mage_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mage_Knight_motion
unit_icon_move_Mage_Knight_motion:
	.2byte (unit_icon_move_Mage_Knight_frame_list - unit_icon_move_Mage_Knight_motion), (unit_icon_move_Mage_Knight_anim_list - unit_icon_move_Mage_Knight_motion) @ header

unit_icon_move_Mage_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Mage_Knight_frame_0 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_1 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_2 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_3 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_4 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_5 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_6 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_7 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_8 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_9 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_10 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_11 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_12 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_13 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_14 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_15 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_16 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_17 - unit_icon_move_Mage_Knight_frame_list)
	.2byte (unit_icon_move_Mage_Knight_frame_18 - unit_icon_move_Mage_Knight_frame_list)

unit_icon_move_Mage_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Mage_Knight_anim_0 - unit_icon_move_Mage_Knight_anim_list)
	.2byte (unit_icon_move_Mage_Knight_anim_1 - unit_icon_move_Mage_Knight_anim_list)
	.2byte (unit_icon_move_Mage_Knight_anim_2 - unit_icon_move_Mage_Knight_anim_list)
	.2byte (unit_icon_move_Mage_Knight_anim_3 - unit_icon_move_Mage_Knight_anim_list)
	.2byte (unit_icon_move_Mage_Knight_anim_4 - unit_icon_move_Mage_Knight_anim_list)

unit_icon_move_Mage_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mage_Knight_F_sheet
unit_icon_move_Mage_Knight_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mage_Knight_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mage_Knight_F_motion
unit_icon_move_Mage_Knight_F_motion:
	.2byte (unit_icon_move_Mage_Knight_F_frame_list - unit_icon_move_Mage_Knight_F_motion), (unit_icon_move_Mage_Knight_F_anim_list - unit_icon_move_Mage_Knight_F_motion) @ header

unit_icon_move_Mage_Knight_F_frame_list: @ +$4
	.2byte (unit_icon_move_Mage_Knight_F_frame_0 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_1 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_2 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_3 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_4 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_5 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_6 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_7 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_8 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_9 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_10 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_11 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_12 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_13 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_14 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_15 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_16 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_17 - unit_icon_move_Mage_Knight_F_frame_list)
	.2byte (unit_icon_move_Mage_Knight_F_frame_18 - unit_icon_move_Mage_Knight_F_frame_list)

unit_icon_move_Mage_Knight_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Mage_Knight_F_anim_0 - unit_icon_move_Mage_Knight_F_anim_list)
	.2byte (unit_icon_move_Mage_Knight_F_anim_1 - unit_icon_move_Mage_Knight_F_anim_list)
	.2byte (unit_icon_move_Mage_Knight_F_anim_2 - unit_icon_move_Mage_Knight_F_anim_list)
	.2byte (unit_icon_move_Mage_Knight_F_anim_3 - unit_icon_move_Mage_Knight_F_anim_list)
	.2byte (unit_icon_move_Mage_Knight_F_anim_4 - unit_icon_move_Mage_Knight_F_anim_list)

unit_icon_move_Mage_Knight_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mage_Knight_F_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_F_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_F_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_F_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mage_Knight_F_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bishop_sheet
unit_icon_move_Bishop_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bishop_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bishop_motion
unit_icon_move_Bishop_motion:
	.2byte (unit_icon_move_Bishop_frame_list - unit_icon_move_Bishop_motion), (unit_icon_move_Bishop_anim_list - unit_icon_move_Bishop_motion) @ header

unit_icon_move_Bishop_frame_list: @ +$4
	.2byte (unit_icon_move_Bishop_frame_0 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_1 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_2 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_3 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_4 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_5 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_6 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_7 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_8 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_9 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_10 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_11 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_12 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_13 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_14 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_15 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_16 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_17 - unit_icon_move_Bishop_frame_list)
	.2byte (unit_icon_move_Bishop_frame_18 - unit_icon_move_Bishop_frame_list)

unit_icon_move_Bishop_anim_list: @ +$2A
	.2byte (unit_icon_move_Bishop_anim_0 - unit_icon_move_Bishop_anim_list)
	.2byte (unit_icon_move_Bishop_anim_1 - unit_icon_move_Bishop_anim_list)
	.2byte (unit_icon_move_Bishop_anim_2 - unit_icon_move_Bishop_anim_list)
	.2byte (unit_icon_move_Bishop_anim_3 - unit_icon_move_Bishop_anim_list)
	.2byte (unit_icon_move_Bishop_anim_4 - unit_icon_move_Bishop_anim_list)

unit_icon_move_Bishop_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bishop_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bishop_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bishop_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bishop_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bishop_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bishop_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bishop_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bishop_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bishop_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bishop_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bishop_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bishop_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bishop_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Bishop_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bishop_F_sheet
unit_icon_move_Bishop_F_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bishop_F_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bishop_F_motion
unit_icon_move_Bishop_F_motion:
	.2byte (unit_icon_move_Bishop_F_frame_list - unit_icon_move_Bishop_F_motion), (unit_icon_move_Bishop_F_anim_list - unit_icon_move_Bishop_F_motion) @ header

unit_icon_move_Bishop_F_frame_list: @ +$4
	.2byte (unit_icon_move_Bishop_F_frame_0 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_1 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_2 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_3 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_4 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_5 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_6 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_7 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_8 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_9 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_10 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_11 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_12 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_13 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_14 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_15 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_16 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_17 - unit_icon_move_Bishop_F_frame_list)
	.2byte (unit_icon_move_Bishop_F_frame_18 - unit_icon_move_Bishop_F_frame_list)

unit_icon_move_Bishop_F_anim_list: @ +$2A
	.2byte (unit_icon_move_Bishop_F_anim_0 - unit_icon_move_Bishop_F_anim_list)
	.2byte (unit_icon_move_Bishop_F_anim_1 - unit_icon_move_Bishop_F_anim_list)
	.2byte (unit_icon_move_Bishop_F_anim_2 - unit_icon_move_Bishop_F_anim_list)
	.2byte (unit_icon_move_Bishop_F_anim_3 - unit_icon_move_Bishop_F_anim_list)
	.2byte (unit_icon_move_Bishop_F_anim_4 - unit_icon_move_Bishop_F_anim_list)

unit_icon_move_Bishop_F_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bishop_F_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD8, 0x1F8, 0x2004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Bishop_F_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_F_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_F_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_F_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bishop_F_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Shaman_sheet
unit_icon_move_Shaman_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Shaman_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Shaman_motion
unit_icon_move_Shaman_motion:
	.2byte (unit_icon_move_Shaman_frame_list - unit_icon_move_Shaman_motion), (unit_icon_move_Shaman_anim_list - unit_icon_move_Shaman_motion) @ header

unit_icon_move_Shaman_frame_list: @ +$4
	.2byte (unit_icon_move_Shaman_frame_0 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_1 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_2 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_3 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_4 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_5 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_6 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_7 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_8 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_9 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_10 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_11 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_12 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_13 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_14 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_15 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_16 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_17 - unit_icon_move_Shaman_frame_list)
	.2byte (unit_icon_move_Shaman_frame_18 - unit_icon_move_Shaman_frame_list)

unit_icon_move_Shaman_anim_list: @ +$2A
	.2byte (unit_icon_move_Shaman_anim_0 - unit_icon_move_Shaman_anim_list)
	.2byte (unit_icon_move_Shaman_anim_1 - unit_icon_move_Shaman_anim_list)
	.2byte (unit_icon_move_Shaman_anim_2 - unit_icon_move_Shaman_anim_list)
	.2byte (unit_icon_move_Shaman_anim_3 - unit_icon_move_Shaman_anim_list)
	.2byte (unit_icon_move_Shaman_anim_4 - unit_icon_move_Shaman_anim_list)

unit_icon_move_Shaman_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Shaman_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Shaman_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Shaman_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Shaman_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Shaman_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Shaman_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Shaman_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Shaman_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Shaman_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Shaman_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Shaman_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Shaman_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Shaman_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Shaman_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Shaman_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Shaman_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Shaman_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Shaman_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Druid_sheet
unit_icon_move_Druid_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Druid_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Druid_motion
unit_icon_move_Druid_motion:
	.2byte (unit_icon_move_Druid_frame_list - unit_icon_move_Druid_motion), (unit_icon_move_Druid_anim_list - unit_icon_move_Druid_motion) @ header

unit_icon_move_Druid_frame_list: @ +$4
	.2byte (unit_icon_move_Druid_frame_0 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_1 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_2 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_3 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_4 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_5 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_6 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_7 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_8 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_9 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_10 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_11 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_12 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_13 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_14 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_15 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_16 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_17 - unit_icon_move_Druid_frame_list)
	.2byte (unit_icon_move_Druid_frame_18 - unit_icon_move_Druid_frame_list)

unit_icon_move_Druid_anim_list: @ +$2A
	.2byte (unit_icon_move_Druid_anim_0 - unit_icon_move_Druid_anim_list)
	.2byte (unit_icon_move_Druid_anim_1 - unit_icon_move_Druid_anim_list)
	.2byte (unit_icon_move_Druid_anim_2 - unit_icon_move_Druid_anim_list)
	.2byte (unit_icon_move_Druid_anim_3 - unit_icon_move_Druid_anim_list)
	.2byte (unit_icon_move_Druid_anim_4 - unit_icon_move_Druid_anim_list)

unit_icon_move_Druid_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Druid_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Druid_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Druid_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Druid_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Druid_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Druid_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Druid_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Druid_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Druid_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Druid_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Druid_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Druid_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Druid_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Druid_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Druid_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Druid_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Druid_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Druid_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Druid_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Druid_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Druid_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Druid_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Druid_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Summoner_sheet
unit_icon_move_Summoner_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Summoner_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Summoner_motion
unit_icon_move_Summoner_motion:
	.2byte (unit_icon_move_Summoner_frame_list - unit_icon_move_Summoner_motion), (unit_icon_move_Summoner_anim_list - unit_icon_move_Summoner_motion) @ header

unit_icon_move_Summoner_frame_list: @ +$4
	.2byte (unit_icon_move_Summoner_frame_0 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_1 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_2 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_3 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_4 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_5 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_6 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_7 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_8 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_9 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_10 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_11 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_12 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_13 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_14 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_15 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_16 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_17 - unit_icon_move_Summoner_frame_list)
	.2byte (unit_icon_move_Summoner_frame_18 - unit_icon_move_Summoner_frame_list)

unit_icon_move_Summoner_anim_list: @ +$2A
	.2byte (unit_icon_move_Summoner_anim_0 - unit_icon_move_Summoner_anim_list)
	.2byte (unit_icon_move_Summoner_anim_1 - unit_icon_move_Summoner_anim_list)
	.2byte (unit_icon_move_Summoner_anim_2 - unit_icon_move_Summoner_anim_list)
	.2byte (unit_icon_move_Summoner_anim_3 - unit_icon_move_Summoner_anim_list)
	.2byte (unit_icon_move_Summoner_anim_4 - unit_icon_move_Summoner_anim_list)

unit_icon_move_Summoner_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Summoner_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Summoner_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Summoner_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Summoner_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Summoner_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Summoner_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Summoner_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Summoner_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Summoner_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Summoner_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Summoner_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Summoner_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Summoner_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Summoner_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Summoner_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Summoner_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Summoner_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Summoner_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Rogue_sheet
unit_icon_move_Rogue_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Rogue_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Rogue_motion
unit_icon_move_Rogue_motion:
	.2byte (unit_icon_move_Rogue_frame_list - unit_icon_move_Rogue_motion), (unit_icon_move_Rogue_anim_list - unit_icon_move_Rogue_motion) @ header

unit_icon_move_Rogue_frame_list: @ +$4
	.2byte (unit_icon_move_Rogue_frame_0 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_1 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_2 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_3 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_4 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_5 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_6 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_7 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_8 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_9 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_10 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_11 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_12 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_13 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_14 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_15 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_16 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_17 - unit_icon_move_Rogue_frame_list)
	.2byte (unit_icon_move_Rogue_frame_18 - unit_icon_move_Rogue_frame_list)

unit_icon_move_Rogue_anim_list: @ +$2A
	.2byte (unit_icon_move_Rogue_anim_0 - unit_icon_move_Rogue_anim_list)
	.2byte (unit_icon_move_Rogue_anim_1 - unit_icon_move_Rogue_anim_list)
	.2byte (unit_icon_move_Rogue_anim_2 - unit_icon_move_Rogue_anim_list)
	.2byte (unit_icon_move_Rogue_anim_3 - unit_icon_move_Rogue_anim_list)
	.2byte (unit_icon_move_Rogue_anim_4 - unit_icon_move_Rogue_anim_list)

unit_icon_move_Rogue_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Rogue_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Rogue_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Rogue_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Rogue_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Rogue_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Rogue_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Rogue_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Rogue_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Rogue_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Rogue_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Rogue_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Rogue_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Rogue_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Rogue_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Rogue_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Rogue_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Rogue_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Rogue_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Gorgonegg2_sheet
unit_icon_move_Gorgonegg2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Gorgonegg2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Gorgonegg2_motion
unit_icon_move_Gorgonegg2_motion:
	.2byte (unit_icon_move_Gorgonegg2_frame_list - unit_icon_move_Gorgonegg2_motion), (unit_icon_move_Gorgonegg2_anim_list - unit_icon_move_Gorgonegg2_motion) @ header

unit_icon_move_Gorgonegg2_frame_list: @ +$4
	.2byte (unit_icon_move_Gorgonegg2_frame_0 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_1 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_2 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_3 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_4 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_5 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_6 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_7 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_8 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_9 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_10 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_11 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_12 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_13 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_14 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_15 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_16 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_17 - unit_icon_move_Gorgonegg2_frame_list)
	.2byte (unit_icon_move_Gorgonegg2_frame_18 - unit_icon_move_Gorgonegg2_frame_list)

unit_icon_move_Gorgonegg2_anim_list: @ +$2A
	.2byte (unit_icon_move_Gorgonegg2_anim_0 - unit_icon_move_Gorgonegg2_anim_list)
	.2byte (unit_icon_move_Gorgonegg2_anim_1 - unit_icon_move_Gorgonegg2_anim_list)
	.2byte (unit_icon_move_Gorgonegg2_anim_2 - unit_icon_move_Gorgonegg2_anim_list)
	.2byte (unit_icon_move_Gorgonegg2_anim_3 - unit_icon_move_Gorgonegg2_anim_list)
	.2byte (unit_icon_move_Gorgonegg2_anim_4 - unit_icon_move_Gorgonegg2_anim_list)

unit_icon_move_Gorgonegg2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Gorgonegg2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Great_Knight_sheet
unit_icon_move_Great_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Great_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Great_Knight_motion
unit_icon_move_Great_Knight_motion:
	.2byte (unit_icon_move_Great_Knight_frame_list - unit_icon_move_Great_Knight_motion), (unit_icon_move_Great_Knight_anim_list - unit_icon_move_Great_Knight_motion) @ header

unit_icon_move_Great_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Great_Knight_frame_0 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_1 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_2 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_3 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_4 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_5 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_6 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_7 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_8 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_9 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_10 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_11 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_12 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_13 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_14 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_15 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_16 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_17 - unit_icon_move_Great_Knight_frame_list)
	.2byte (unit_icon_move_Great_Knight_frame_18 - unit_icon_move_Great_Knight_frame_list)

unit_icon_move_Great_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Great_Knight_anim_0 - unit_icon_move_Great_Knight_anim_list)
	.2byte (unit_icon_move_Great_Knight_anim_1 - unit_icon_move_Great_Knight_anim_list)
	.2byte (unit_icon_move_Great_Knight_anim_2 - unit_icon_move_Great_Knight_anim_list)
	.2byte (unit_icon_move_Great_Knight_anim_3 - unit_icon_move_Great_Knight_anim_list)
	.2byte (unit_icon_move_Great_Knight_anim_4 - unit_icon_move_Great_Knight_anim_list)

unit_icon_move_Great_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Great_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Great_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Great_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Great_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Great_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Great_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Recruit_T1_sheet
unit_icon_move_Recruit_T1_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Recruit_T1_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Recruit_T1_motion
unit_icon_move_Recruit_T1_motion:
	.2byte (unit_icon_move_Recruit_T1_frame_list - unit_icon_move_Recruit_T1_motion), (unit_icon_move_Recruit_T1_anim_list - unit_icon_move_Recruit_T1_motion) @ header

unit_icon_move_Recruit_T1_frame_list: @ +$4
	.2byte (unit_icon_move_Recruit_T1_frame_0 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_1 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_2 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_3 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_4 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_5 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_6 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_7 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_8 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_9 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_10 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_11 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_12 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_13 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_14 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_15 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_16 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_17 - unit_icon_move_Recruit_T1_frame_list)
	.2byte (unit_icon_move_Recruit_T1_frame_18 - unit_icon_move_Recruit_T1_frame_list)

unit_icon_move_Recruit_T1_anim_list: @ +$2A
	.2byte (unit_icon_move_Recruit_T1_anim_0 - unit_icon_move_Recruit_T1_anim_list)
	.2byte (unit_icon_move_Recruit_T1_anim_1 - unit_icon_move_Recruit_T1_anim_list)
	.2byte (unit_icon_move_Recruit_T1_anim_2 - unit_icon_move_Recruit_T1_anim_list)
	.2byte (unit_icon_move_Recruit_T1_anim_3 - unit_icon_move_Recruit_T1_anim_list)
	.2byte (unit_icon_move_Recruit_T1_anim_4 - unit_icon_move_Recruit_T1_anim_list)

unit_icon_move_Recruit_T1_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Recruit_T1_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Recruit_T1_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Recruit_T1_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Recruit_T1_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Recruit_T1_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Journeyman_T2_sheet
unit_icon_move_Journeyman_T2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Journeyman_T2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Journeyman_T2_motion
unit_icon_move_Journeyman_T2_motion:
	.2byte (unit_icon_move_Journeyman_T2_frame_list - unit_icon_move_Journeyman_T2_motion), (unit_icon_move_Journeyman_T2_anim_list - unit_icon_move_Journeyman_T2_motion) @ header

unit_icon_move_Journeyman_T2_frame_list: @ +$4
	.2byte (unit_icon_move_Journeyman_T2_frame_0 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_1 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_2 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_3 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_4 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_5 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_6 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_7 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_8 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_9 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_10 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_11 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_12 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_13 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_14 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_15 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_16 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_17 - unit_icon_move_Journeyman_T2_frame_list)
	.2byte (unit_icon_move_Journeyman_T2_frame_18 - unit_icon_move_Journeyman_T2_frame_list)

unit_icon_move_Journeyman_T2_anim_list: @ +$2A
	.2byte (unit_icon_move_Journeyman_T2_anim_0 - unit_icon_move_Journeyman_T2_anim_list)
	.2byte (unit_icon_move_Journeyman_T2_anim_1 - unit_icon_move_Journeyman_T2_anim_list)
	.2byte (unit_icon_move_Journeyman_T2_anim_2 - unit_icon_move_Journeyman_T2_anim_list)
	.2byte (unit_icon_move_Journeyman_T2_anim_3 - unit_icon_move_Journeyman_T2_anim_list)
	.2byte (unit_icon_move_Journeyman_T2_anim_4 - unit_icon_move_Journeyman_T2_anim_list)

unit_icon_move_Journeyman_T2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_16: @ +$D4
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0, 0x1F1, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Journeyman_T2_frame_17: @ +$E6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_frame_18: @ +$F0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Journeyman_T2_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Journeyman_T2_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Journeyman_T2_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Journeyman_T2_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Journeyman_T2_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Pupil_T2_sheet
unit_icon_move_Pupil_T2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Pupil_T2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Pupil_T2_motion
unit_icon_move_Pupil_T2_motion:
	.2byte (unit_icon_move_Pupil_T2_frame_list - unit_icon_move_Pupil_T2_motion), (unit_icon_move_Pupil_T2_anim_list - unit_icon_move_Pupil_T2_motion) @ header

unit_icon_move_Pupil_T2_frame_list: @ +$4
	.2byte (unit_icon_move_Pupil_T2_frame_0 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_1 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_2 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_3 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_4 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_5 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_6 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_7 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_8 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_9 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_10 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_11 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_12 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_13 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_14 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_15 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_16 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_17 - unit_icon_move_Pupil_T2_frame_list)
	.2byte (unit_icon_move_Pupil_T2_frame_18 - unit_icon_move_Pupil_T2_frame_list)

unit_icon_move_Pupil_T2_anim_list: @ +$2A
	.2byte (unit_icon_move_Pupil_T2_anim_0 - unit_icon_move_Pupil_T2_anim_list)
	.2byte (unit_icon_move_Pupil_T2_anim_1 - unit_icon_move_Pupil_T2_anim_list)
	.2byte (unit_icon_move_Pupil_T2_anim_2 - unit_icon_move_Pupil_T2_anim_list)
	.2byte (unit_icon_move_Pupil_T2_anim_3 - unit_icon_move_Pupil_T2_anim_list)
	.2byte (unit_icon_move_Pupil_T2_anim_4 - unit_icon_move_Pupil_T2_anim_list)

unit_icon_move_Pupil_T2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Pupil_T2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pupil_T2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pupil_T2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pupil_T2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pupil_T2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Manakete_2_sheet
unit_icon_move_Manakete_2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Manakete_2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Manakete_2_motion
unit_icon_move_Manakete_2_motion:
	.2byte (unit_icon_move_Manakete_2_frame_list - unit_icon_move_Manakete_2_motion), (unit_icon_move_Manakete_2_anim_list - unit_icon_move_Manakete_2_motion) @ header

unit_icon_move_Manakete_2_frame_list: @ +$4
	.2byte (unit_icon_move_Manakete_2_frame_0 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_1 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_2 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_3 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_4 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_5 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_6 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_7 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_8 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_9 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_10 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_11 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_12 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_13 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_14 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_15 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_16 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_17 - unit_icon_move_Manakete_2_frame_list)
	.2byte (unit_icon_move_Manakete_2_frame_18 - unit_icon_move_Manakete_2_frame_list)

unit_icon_move_Manakete_2_anim_list: @ +$2A
	.2byte (unit_icon_move_Manakete_2_anim_0 - unit_icon_move_Manakete_2_anim_list)
	.2byte (unit_icon_move_Manakete_2_anim_1 - unit_icon_move_Manakete_2_anim_list)
	.2byte (unit_icon_move_Manakete_2_anim_2 - unit_icon_move_Manakete_2_anim_list)
	.2byte (unit_icon_move_Manakete_2_anim_3 - unit_icon_move_Manakete_2_anim_list)
	.2byte (unit_icon_move_Manakete_2_anim_4 - unit_icon_move_Manakete_2_anim_list)

unit_icon_move_Manakete_2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Manakete_2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Manakete_2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Manakete_Myrrh_sheet
unit_icon_move_Manakete_Myrrh_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Manakete_Myrrh_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Manakete_Myrrh_motion
unit_icon_move_Manakete_Myrrh_motion:
	.2byte (unit_icon_move_Manakete_Myrrh_frame_list - unit_icon_move_Manakete_Myrrh_motion), (unit_icon_move_Manakete_Myrrh_anim_list - unit_icon_move_Manakete_Myrrh_motion) @ header

unit_icon_move_Manakete_Myrrh_frame_list: @ +$4
	.2byte (unit_icon_move_Manakete_Myrrh_frame_0 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_1 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_2 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_3 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_4 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_5 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_6 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_7 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_8 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_9 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_10 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_11 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_12 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_13 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_14 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_15 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_16 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_17 - unit_icon_move_Manakete_Myrrh_frame_list)
	.2byte (unit_icon_move_Manakete_Myrrh_frame_18 - unit_icon_move_Manakete_Myrrh_frame_list)

unit_icon_move_Manakete_Myrrh_anim_list: @ +$2A
	.2byte (unit_icon_move_Manakete_Myrrh_anim_0 - unit_icon_move_Manakete_Myrrh_anim_list)
	.2byte (unit_icon_move_Manakete_Myrrh_anim_1 - unit_icon_move_Manakete_Myrrh_anim_list)
	.2byte (unit_icon_move_Manakete_Myrrh_anim_2 - unit_icon_move_Manakete_Myrrh_anim_list)
	.2byte (unit_icon_move_Manakete_Myrrh_anim_3 - unit_icon_move_Manakete_Myrrh_anim_list)
	.2byte (unit_icon_move_Manakete_Myrrh_anim_4 - unit_icon_move_Manakete_Myrrh_anim_list)

unit_icon_move_Manakete_Myrrh_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Manakete_Myrrh_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_Myrrh_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_Myrrh_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_Myrrh_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Manakete_Myrrh_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Fighter_sheet
unit_icon_move_Fighter_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Fighter_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Fighter_motion
unit_icon_move_Fighter_motion:
	.2byte (unit_icon_move_Fighter_frame_list - unit_icon_move_Fighter_motion), (unit_icon_move_Fighter_anim_list - unit_icon_move_Fighter_motion) @ header

unit_icon_move_Fighter_frame_list: @ +$4
	.2byte (unit_icon_move_Fighter_frame_0 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_1 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_2 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_3 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_4 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_5 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_6 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_7 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_8 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_9 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_10 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_11 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_12 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_13 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_14 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_15 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_16 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_17 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_18 - unit_icon_move_Fighter_frame_list)

unit_icon_move_Fighter_anim_list: @ +$2A
	.2byte (unit_icon_move_Fighter_anim_0 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_1 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_2 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_3 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_4 - unit_icon_move_Fighter_anim_list)

unit_icon_move_Fighter_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fighter_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fighter_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fighter_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fighter_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fighter_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fighter_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Fighter_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Fighter_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Fighter_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Fighter_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Fighter_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Fighter_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Fighter_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Warrior_sheet
unit_icon_move_Warrior_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Warrior_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Warrior_motion
unit_icon_move_Warrior_motion:
	.2byte (unit_icon_move_Warrior_frame_list - unit_icon_move_Warrior_motion), (unit_icon_move_Warrior_anim_list - unit_icon_move_Warrior_motion) @ header

unit_icon_move_Warrior_frame_list: @ +$4
	.2byte (unit_icon_move_Warrior_frame_0 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_1 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_2 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_3 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_4 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_5 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_6 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_7 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_8 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_9 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_10 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_11 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_12 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_13 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_14 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_15 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_16 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_17 - unit_icon_move_Warrior_frame_list)
	.2byte (unit_icon_move_Warrior_frame_18 - unit_icon_move_Warrior_frame_list)

unit_icon_move_Warrior_anim_list: @ +$2A
	.2byte (unit_icon_move_Warrior_anim_0 - unit_icon_move_Warrior_anim_list)
	.2byte (unit_icon_move_Warrior_anim_1 - unit_icon_move_Warrior_anim_list)
	.2byte (unit_icon_move_Warrior_anim_2 - unit_icon_move_Warrior_anim_list)
	.2byte (unit_icon_move_Warrior_anim_3 - unit_icon_move_Warrior_anim_list)
	.2byte (unit_icon_move_Warrior_anim_4 - unit_icon_move_Warrior_anim_list)

unit_icon_move_Warrior_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Warrior_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Warrior_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Warrior_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Warrior_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Warrior_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Warrior_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Warrior_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Warrior_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Warrior_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Warrior_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Warrior_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Warrior_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Warrior_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Warrior_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Warrior_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Warrior_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Warrior_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Warrior_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Brigand_sheet
unit_icon_move_Brigand_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Brigand_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Brigand_motion
unit_icon_move_Brigand_motion:
	.2byte (unit_icon_move_Brigand_frame_list - unit_icon_move_Brigand_motion), (unit_icon_move_Brigand_anim_list - unit_icon_move_Brigand_motion) @ header

unit_icon_move_Brigand_frame_list: @ +$4
	.2byte (unit_icon_move_Brigand_frame_0 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_1 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_2 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_3 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_4 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_5 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_6 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_7 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_8 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_9 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_10 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_11 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_12 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_13 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_14 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_15 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_16 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_17 - unit_icon_move_Brigand_frame_list)
	.2byte (unit_icon_move_Brigand_frame_18 - unit_icon_move_Brigand_frame_list)

unit_icon_move_Brigand_anim_list: @ +$2A
	.2byte (unit_icon_move_Brigand_anim_0 - unit_icon_move_Brigand_anim_list)
	.2byte (unit_icon_move_Brigand_anim_1 - unit_icon_move_Brigand_anim_list)
	.2byte (unit_icon_move_Brigand_anim_2 - unit_icon_move_Brigand_anim_list)
	.2byte (unit_icon_move_Brigand_anim_3 - unit_icon_move_Brigand_anim_list)
	.2byte (unit_icon_move_Brigand_anim_4 - unit_icon_move_Brigand_anim_list)

unit_icon_move_Brigand_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Brigand_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Brigand_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Brigand_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Brigand_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Brigand_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Brigand_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Brigand_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Brigand_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Brigand_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Brigand_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Brigand_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Brigand_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Brigand_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Brigand_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Brigand_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Brigand_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Brigand_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Brigand_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Pirate_sheet
unit_icon_move_Pirate_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Pirate_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Pirate_motion
unit_icon_move_Pirate_motion:
	.2byte (unit_icon_move_Pirate_frame_list - unit_icon_move_Pirate_motion), (unit_icon_move_Pirate_anim_list - unit_icon_move_Pirate_motion) @ header

unit_icon_move_Pirate_frame_list: @ +$4
	.2byte (unit_icon_move_Pirate_frame_0 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_1 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_2 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_3 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_4 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_5 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_6 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_7 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_8 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_9 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_10 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_11 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_12 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_13 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_14 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_15 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_16 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_17 - unit_icon_move_Pirate_frame_list)
	.2byte (unit_icon_move_Pirate_frame_18 - unit_icon_move_Pirate_frame_list)

unit_icon_move_Pirate_anim_list: @ +$2A
	.2byte (unit_icon_move_Pirate_anim_0 - unit_icon_move_Pirate_anim_list)
	.2byte (unit_icon_move_Pirate_anim_1 - unit_icon_move_Pirate_anim_list)
	.2byte (unit_icon_move_Pirate_anim_2 - unit_icon_move_Pirate_anim_list)
	.2byte (unit_icon_move_Pirate_anim_3 - unit_icon_move_Pirate_anim_list)
	.2byte (unit_icon_move_Pirate_anim_4 - unit_icon_move_Pirate_anim_list)

unit_icon_move_Pirate_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pirate_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pirate_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pirate_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pirate_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pirate_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pirate_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Pirate_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Pirate_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Pirate_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Pirate_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Pirate_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Pirate_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Pirate_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Pirate_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pirate_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pirate_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pirate_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pirate_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Berserker_sheet
unit_icon_move_Berserker_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Berserker_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Berserker_motion
unit_icon_move_Berserker_motion:
	.2byte (unit_icon_move_Berserker_frame_list - unit_icon_move_Berserker_motion), (unit_icon_move_Berserker_anim_list - unit_icon_move_Berserker_motion) @ header

unit_icon_move_Berserker_frame_list: @ +$4
	.2byte (unit_icon_move_Berserker_frame_0 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_1 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_2 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_3 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_4 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_5 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_6 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_7 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_8 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_9 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_10 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_11 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_12 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_13 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_14 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_15 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_16 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_17 - unit_icon_move_Berserker_frame_list)
	.2byte (unit_icon_move_Berserker_frame_18 - unit_icon_move_Berserker_frame_list)

unit_icon_move_Berserker_anim_list: @ +$2A
	.2byte (unit_icon_move_Berserker_anim_0 - unit_icon_move_Berserker_anim_list)
	.2byte (unit_icon_move_Berserker_anim_1 - unit_icon_move_Berserker_anim_list)
	.2byte (unit_icon_move_Berserker_anim_2 - unit_icon_move_Berserker_anim_list)
	.2byte (unit_icon_move_Berserker_anim_3 - unit_icon_move_Berserker_anim_list)
	.2byte (unit_icon_move_Berserker_anim_4 - unit_icon_move_Berserker_anim_list)

unit_icon_move_Berserker_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Berserker_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Berserker_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Berserker_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Berserker_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Berserker_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Berserker_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Berserker_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Berserker_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Berserker_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Berserker_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Berserker_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Berserker_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Berserker_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Berserker_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Berserker_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Berserker_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Berserker_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Berserker_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Monk_sheet
unit_icon_move_Monk_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Monk_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Monk_motion
unit_icon_move_Monk_motion:
	.2byte (unit_icon_move_Monk_frame_list - unit_icon_move_Monk_motion), (unit_icon_move_Monk_anim_list - unit_icon_move_Monk_motion) @ header

unit_icon_move_Monk_frame_list: @ +$4
	.2byte (unit_icon_move_Monk_frame_0 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_1 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_2 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_3 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_4 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_5 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_6 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_7 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_8 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_9 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_10 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_11 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_12 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_13 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_14 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_15 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_16 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_17 - unit_icon_move_Monk_frame_list)
	.2byte (unit_icon_move_Monk_frame_18 - unit_icon_move_Monk_frame_list)

unit_icon_move_Monk_anim_list: @ +$2A
	.2byte (unit_icon_move_Monk_anim_0 - unit_icon_move_Monk_anim_list)
	.2byte (unit_icon_move_Monk_anim_1 - unit_icon_move_Monk_anim_list)
	.2byte (unit_icon_move_Monk_anim_2 - unit_icon_move_Monk_anim_list)
	.2byte (unit_icon_move_Monk_anim_3 - unit_icon_move_Monk_anim_list)
	.2byte (unit_icon_move_Monk_anim_4 - unit_icon_move_Monk_anim_list)

unit_icon_move_Monk_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Monk_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Monk_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Monk_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Monk_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Monk_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Monk_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Monk_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Monk_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Monk_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Monk_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Monk_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Monk_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Monk_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Monk_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Monk_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Monk_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Monk_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Monk_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Monk_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Monk_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Monk_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Monk_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Monk_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Priest_sheet
unit_icon_move_Priest_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Priest_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Priest_motion
unit_icon_move_Priest_motion:
	.2byte (unit_icon_move_Priest_frame_list - unit_icon_move_Priest_motion), (unit_icon_move_Priest_anim_list - unit_icon_move_Priest_motion) @ header

unit_icon_move_Priest_frame_list: @ +$4
	.2byte (unit_icon_move_Priest_frame_0 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_1 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_2 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_3 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_4 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_5 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_6 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_7 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_8 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_9 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_10 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_11 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_12 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_13 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_14 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_15 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_16 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_17 - unit_icon_move_Priest_frame_list)
	.2byte (unit_icon_move_Priest_frame_18 - unit_icon_move_Priest_frame_list)

unit_icon_move_Priest_anim_list: @ +$2A
	.2byte (unit_icon_move_Priest_anim_0 - unit_icon_move_Priest_anim_list)
	.2byte (unit_icon_move_Priest_anim_1 - unit_icon_move_Priest_anim_list)
	.2byte (unit_icon_move_Priest_anim_2 - unit_icon_move_Priest_anim_list)
	.2byte (unit_icon_move_Priest_anim_3 - unit_icon_move_Priest_anim_list)
	.2byte (unit_icon_move_Priest_anim_4 - unit_icon_move_Priest_anim_list)

unit_icon_move_Priest_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Priest_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Priest_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Priest_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Priest_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Priest_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Priest_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Priest_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Priest_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Priest_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Priest_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Priest_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Priest_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Priest_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Priest_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Priest_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Priest_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Priest_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Priest_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Priest_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Priest_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Priest_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Priest_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Priest_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bard_sheet
unit_icon_move_Bard_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bard_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bard_motion
unit_icon_move_Bard_motion:
/*	.2byte (unit_icon_move_Bard_frame_list - unit_icon_move_Bard_motion), (unit_icon_move_Bard_anim_list - unit_icon_move_Bard_motion) @ header

unit_icon_move_Bard_frame_list: @ +$4
	.2byte (unit_icon_move_Bard_frame_0 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_1 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_2 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_3 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_4 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_5 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_6 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_7 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_8 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_9 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_10 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_11 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_12 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_13 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_14 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_15 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_16 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_17 - unit_icon_move_Bard_frame_list)
	.2byte (unit_icon_move_Bard_frame_18 - unit_icon_move_Bard_frame_list)

unit_icon_move_Bard_anim_list: @ +$2E
	.2byte (unit_icon_move_Bard_anim_0 - unit_icon_move_Bard_anim_list)
	.2byte (unit_icon_move_Bard_anim_1 - unit_icon_move_Bard_anim_list)
	.2byte (unit_icon_move_Bard_anim_2 - unit_icon_move_Bard_anim_list)
	.2byte (unit_icon_move_Bard_anim_3 - unit_icon_move_Bard_anim_list)
	.2byte (unit_icon_move_Bard_anim_4 - unit_icon_move_Bard_anim_list)
	.2byte (unit_icon_move_Bard_anim_5 - unit_icon_move_Bard_anim_list)

unit_icon_move_Bard_frame_0: @ +$3A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bard_frame_1: @ +$44
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bard_frame_2: @ +$4E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bard_frame_3: @ +$58
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bard_frame_4: @ +$62
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bard_frame_5: @ +$6C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bard_frame_6: @ +$76
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bard_frame_7: @ +$80
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bard_frame_8: @ +$8A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bard_frame_9: @ +$94
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bard_frame_10: @ +$9E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bard_frame_11: @ +$A8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bard_frame_12: @ +$B2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bard_frame_13: @ +$BC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bard_frame_14: @ +$C6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bard_frame_15: @ +$D0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bard_frame_16: @ +$DA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Bard_frame_17: @ +$E4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bard_frame_18: @ +$EE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bard_anim_0: @ +$10C
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bard_anim_1: @ +$120
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bard_anim_2: @ +$134
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bard_anim_3: @ +$148
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bard_anim_4: @ +$15C
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bard_anim_5: @ +$170
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

	.global unit_icon_move_Pegasus_Knight_sheet
unit_icon_move_Pegasus_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Pegasus_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Pegasus_Knight_motion
unit_icon_move_Pegasus_Knight_motion:
	.2byte (unit_icon_move_Pegasus_Knight_frame_list - unit_icon_move_Pegasus_Knight_motion), (unit_icon_move_Pegasus_Knight_anim_list - unit_icon_move_Pegasus_Knight_motion) @ header

unit_icon_move_Pegasus_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Pegasus_Knight_frame_0 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_1 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_2 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_3 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_4 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_5 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_6 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_7 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_8 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_9 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_10 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_11 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_12 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_13 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_14 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_15 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_16 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_17 - unit_icon_move_Pegasus_Knight_frame_list)
	.2byte (unit_icon_move_Pegasus_Knight_frame_18 - unit_icon_move_Pegasus_Knight_frame_list)

unit_icon_move_Pegasus_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Pegasus_Knight_anim_0 - unit_icon_move_Pegasus_Knight_anim_list)
	.2byte (unit_icon_move_Pegasus_Knight_anim_1 - unit_icon_move_Pegasus_Knight_anim_list)
	.2byte (unit_icon_move_Pegasus_Knight_anim_2 - unit_icon_move_Pegasus_Knight_anim_list)
	.2byte (unit_icon_move_Pegasus_Knight_anim_3 - unit_icon_move_Pegasus_Knight_anim_list)
	.2byte (unit_icon_move_Pegasus_Knight_anim_4 - unit_icon_move_Pegasus_Knight_anim_list)

unit_icon_move_Pegasus_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Pegasus_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pegasus_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pegasus_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pegasus_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pegasus_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Falcon_Knight_sheet
unit_icon_move_Falcon_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Falcon_Knight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Falcon_Knight_motion
unit_icon_move_Falcon_Knight_motion:
	.2byte (unit_icon_move_Falcon_Knight_frame_list - unit_icon_move_Falcon_Knight_motion), (unit_icon_move_Falcon_Knight_anim_list - unit_icon_move_Falcon_Knight_motion) @ header

unit_icon_move_Falcon_Knight_frame_list: @ +$4
	.2byte (unit_icon_move_Falcon_Knight_frame_0 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_1 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_2 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_3 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_4 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_5 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_6 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_7 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_8 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_9 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_10 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_11 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_12 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_13 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_14 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_15 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_16 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_17 - unit_icon_move_Falcon_Knight_frame_list)
	.2byte (unit_icon_move_Falcon_Knight_frame_18 - unit_icon_move_Falcon_Knight_frame_list)

unit_icon_move_Falcon_Knight_anim_list: @ +$2A
	.2byte (unit_icon_move_Falcon_Knight_anim_0 - unit_icon_move_Falcon_Knight_anim_list)
	.2byte (unit_icon_move_Falcon_Knight_anim_1 - unit_icon_move_Falcon_Knight_anim_list)
	.2byte (unit_icon_move_Falcon_Knight_anim_2 - unit_icon_move_Falcon_Knight_anim_list)
	.2byte (unit_icon_move_Falcon_Knight_anim_3 - unit_icon_move_Falcon_Knight_anim_list)
	.2byte (unit_icon_move_Falcon_Knight_anim_4 - unit_icon_move_Falcon_Knight_anim_list)

unit_icon_move_Falcon_Knight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Falcon_Knight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Falcon_Knight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Falcon_Knight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Falcon_Knight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Falcon_Knight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Cleric_sheet
unit_icon_move_Cleric_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Cleric_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Cleric_motion
unit_icon_move_Cleric_motion:
	.2byte (unit_icon_move_Cleric_frame_list - unit_icon_move_Cleric_motion), (unit_icon_move_Cleric_anim_list - unit_icon_move_Cleric_motion) @ header

unit_icon_move_Cleric_frame_list: @ +$4
	.2byte (unit_icon_move_Cleric_frame_0 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_1 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_2 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_3 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_4 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_5 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_6 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_7 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_8 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_9 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_10 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_11 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_12 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_13 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_14 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_15 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_16 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_17 - unit_icon_move_Cleric_frame_list)
	.2byte (unit_icon_move_Cleric_frame_18 - unit_icon_move_Cleric_frame_list)

unit_icon_move_Cleric_anim_list: @ +$2A
	.2byte (unit_icon_move_Cleric_anim_0 - unit_icon_move_Cleric_anim_list)
	.2byte (unit_icon_move_Cleric_anim_1 - unit_icon_move_Cleric_anim_list)
	.2byte (unit_icon_move_Cleric_anim_2 - unit_icon_move_Cleric_anim_list)
	.2byte (unit_icon_move_Cleric_anim_3 - unit_icon_move_Cleric_anim_list)
	.2byte (unit_icon_move_Cleric_anim_4 - unit_icon_move_Cleric_anim_list)

unit_icon_move_Cleric_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cleric_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cleric_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cleric_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cleric_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cleric_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cleric_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Cleric_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Cleric_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Cleric_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Cleric_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Cleric_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Cleric_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Cleric_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Cleric_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cleric_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cleric_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cleric_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cleric_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Troubadour_sheet
unit_icon_move_Troubadour_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Troubadour_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Troubadour_motion
unit_icon_move_Troubadour_motion:
	.2byte (unit_icon_move_Troubadour_frame_list - unit_icon_move_Troubadour_motion), (unit_icon_move_Troubadour_anim_list - unit_icon_move_Troubadour_motion) @ header

unit_icon_move_Troubadour_frame_list: @ +$4
	.2byte (unit_icon_move_Troubadour_frame_0 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_1 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_2 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_3 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_4 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_5 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_6 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_7 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_8 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_9 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_10 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_11 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_12 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_13 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_14 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_15 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_16 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_17 - unit_icon_move_Troubadour_frame_list)
	.2byte (unit_icon_move_Troubadour_frame_18 - unit_icon_move_Troubadour_frame_list)

unit_icon_move_Troubadour_anim_list: @ +$2A
	.2byte (unit_icon_move_Troubadour_anim_0 - unit_icon_move_Troubadour_anim_list)
	.2byte (unit_icon_move_Troubadour_anim_1 - unit_icon_move_Troubadour_anim_list)
	.2byte (unit_icon_move_Troubadour_anim_2 - unit_icon_move_Troubadour_anim_list)
	.2byte (unit_icon_move_Troubadour_anim_3 - unit_icon_move_Troubadour_anim_list)
	.2byte (unit_icon_move_Troubadour_anim_4 - unit_icon_move_Troubadour_anim_list)

unit_icon_move_Troubadour_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Troubadour_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Troubadour_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Troubadour_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Troubadour_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Troubadour_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Troubadour_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Valkyrie_sheet
unit_icon_move_Valkyrie_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Valkyrie_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Valkyrie_motion
unit_icon_move_Valkyrie_motion:
	.2byte (unit_icon_move_Valkyrie_frame_list - unit_icon_move_Valkyrie_motion), (unit_icon_move_Valkyrie_anim_list - unit_icon_move_Valkyrie_motion) @ header

unit_icon_move_Valkyrie_frame_list: @ +$4
	.2byte (unit_icon_move_Valkyrie_frame_0 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_1 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_2 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_3 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_4 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_5 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_6 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_7 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_8 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_9 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_10 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_11 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_12 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_13 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_14 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_15 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_16 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_17 - unit_icon_move_Valkyrie_frame_list)
	.2byte (unit_icon_move_Valkyrie_frame_18 - unit_icon_move_Valkyrie_frame_list)

unit_icon_move_Valkyrie_anim_list: @ +$2A
	.2byte (unit_icon_move_Valkyrie_anim_0 - unit_icon_move_Valkyrie_anim_list)
	.2byte (unit_icon_move_Valkyrie_anim_1 - unit_icon_move_Valkyrie_anim_list)
	.2byte (unit_icon_move_Valkyrie_anim_2 - unit_icon_move_Valkyrie_anim_list)
	.2byte (unit_icon_move_Valkyrie_anim_3 - unit_icon_move_Valkyrie_anim_list)
	.2byte (unit_icon_move_Valkyrie_anim_4 - unit_icon_move_Valkyrie_anim_list)

unit_icon_move_Valkyrie_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Valkyrie_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Valkyrie_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Valkyrie_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Valkyrie_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Valkyrie_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Valkyrie_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Dancer_sheet
unit_icon_move_Dancer_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Dancer_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Dancer_motion
unit_icon_move_Dancer_motion:
/*	.2byte (unit_icon_move_Dancer_frame_list - unit_icon_move_Dancer_motion), (unit_icon_move_Dancer_anim_list - unit_icon_move_Dancer_motion) @ header

unit_icon_move_Dancer_frame_list: @ +$4
	.2byte (unit_icon_move_Dancer_frame_0 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_1 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_2 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_3 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_4 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_5 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_6 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_7 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_8 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_9 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_10 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_11 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_12 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_13 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_14 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_15 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_16 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_17 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_18 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_19 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_20 - unit_icon_move_Dancer_frame_list)
	.2byte (unit_icon_move_Dancer_frame_21 - unit_icon_move_Dancer_frame_list)

unit_icon_move_Dancer_anim_list: @ +$30
	.2byte (unit_icon_move_Dancer_anim_0 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_1 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_2 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_3 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_4 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_5 - unit_icon_move_Dancer_anim_list)
	.2byte (unit_icon_move_Dancer_anim_6 - unit_icon_move_Dancer_anim_list)

unit_icon_move_Dancer_frame_0: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_1: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Dancer_frame_2: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Dancer_frame_3: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Dancer_frame_4: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_5: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Dancer_frame_6: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Dancer_frame_7: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Dancer_frame_8: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x4A @ Sheet Tile #0

unit_icon_move_Dancer_frame_9: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x5A @ Sheet Tile #0

unit_icon_move_Dancer_frame_10: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x6A @ Sheet Tile #0

unit_icon_move_Dancer_frame_11: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x7A @ Sheet Tile #0

unit_icon_move_Dancer_frame_12: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Dancer_frame_13: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_14: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_15: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_16: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xF0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_17: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_18: @ +$F2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Dancer_frame_19: @ +$FC
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

unit_icon_move_Dancer_frame_20: @ +$126
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

unit_icon_move_Dancer_frame_21: @ +$150
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

unit_icon_move_Dancer_anim_0: @ +$18A
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Dancer_anim_1: @ +$19E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Dancer_anim_2: @ +$1B2
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Dancer_anim_3: @ +$1C6
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Dancer_anim_4: @ +$1DA
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Dancer_anim_5: @ +$1EE
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

unit_icon_move_Dancer_anim_6: @ +$222
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

	.global unit_icon_move_Soldier_sheet
unit_icon_move_Soldier_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Soldier_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Soldier_motion
unit_icon_move_Soldier_motion:
	.2byte (unit_icon_move_Soldier_frame_list - unit_icon_move_Soldier_motion), (unit_icon_move_Soldier_anim_list - unit_icon_move_Soldier_motion) @ header

unit_icon_move_Soldier_frame_list: @ +$4
	.2byte (unit_icon_move_Soldier_frame_0 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_1 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_2 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_3 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_4 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_5 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_6 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_7 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_8 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_9 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_10 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_11 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_12 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_13 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_14 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_15 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_16 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_17 - unit_icon_move_Soldier_frame_list)
	.2byte (unit_icon_move_Soldier_frame_18 - unit_icon_move_Soldier_frame_list)

unit_icon_move_Soldier_anim_list: @ +$2A
	.2byte (unit_icon_move_Soldier_anim_0 - unit_icon_move_Soldier_anim_list)
	.2byte (unit_icon_move_Soldier_anim_1 - unit_icon_move_Soldier_anim_list)
	.2byte (unit_icon_move_Soldier_anim_2 - unit_icon_move_Soldier_anim_list)
	.2byte (unit_icon_move_Soldier_anim_3 - unit_icon_move_Soldier_anim_list)
	.2byte (unit_icon_move_Soldier_anim_4 - unit_icon_move_Soldier_anim_list)

unit_icon_move_Soldier_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Soldier_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Soldier_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Soldier_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Soldier_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Soldier_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Soldier_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Soldier_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Soldier_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Soldier_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Soldier_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Soldier_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Soldier_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Soldier_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Soldier_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Soldier_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Soldier_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Soldier_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Soldier_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Necromancer_sheet
unit_icon_move_Necromancer_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Necromancer_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Necromancer_motion
unit_icon_move_Necromancer_motion:
	.2byte (unit_icon_move_Necromancer_frame_list - unit_icon_move_Necromancer_motion), (unit_icon_move_Necromancer_anim_list - unit_icon_move_Necromancer_motion) @ header

unit_icon_move_Necromancer_frame_list: @ +$4
	.2byte (unit_icon_move_Necromancer_frame_0 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_1 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_2 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_3 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_4 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_5 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_6 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_7 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_8 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_9 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_10 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_11 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_12 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_13 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_14 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_15 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_16 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_17 - unit_icon_move_Necromancer_frame_list)
	.2byte (unit_icon_move_Necromancer_frame_18 - unit_icon_move_Necromancer_frame_list)

unit_icon_move_Necromancer_anim_list: @ +$2A
	.2byte (unit_icon_move_Necromancer_anim_0 - unit_icon_move_Necromancer_anim_list)
	.2byte (unit_icon_move_Necromancer_anim_1 - unit_icon_move_Necromancer_anim_list)
	.2byte (unit_icon_move_Necromancer_anim_2 - unit_icon_move_Necromancer_anim_list)
	.2byte (unit_icon_move_Necromancer_anim_3 - unit_icon_move_Necromancer_anim_list)
	.2byte (unit_icon_move_Necromancer_anim_4 - unit_icon_move_Necromancer_anim_list)

unit_icon_move_Necromancer_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Necromancer_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Necromancer_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Necromancer_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Necromancer_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Necromancer_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Necromancer_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Fleet_sheet
unit_icon_move_Fleet_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Fleet_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Fleet_motion
unit_icon_move_Fleet_motion:
	.2byte (unit_icon_move_Fleet_frame_list - unit_icon_move_Fleet_motion), (unit_icon_move_Fleet_anim_list - unit_icon_move_Fleet_motion) @ header

unit_icon_move_Fleet_frame_list: @ +$4
	.2byte (unit_icon_move_Fleet_frame_0 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_1 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_2 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_3 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_4 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_5 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_6 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_7 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_8 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_9 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_10 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_11 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_12 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_13 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_14 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_15 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_16 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_17 - unit_icon_move_Fleet_frame_list)
	.2byte (unit_icon_move_Fleet_frame_18 - unit_icon_move_Fleet_frame_list)

unit_icon_move_Fleet_anim_list: @ +$2A
	.2byte (unit_icon_move_Fleet_anim_0 - unit_icon_move_Fleet_anim_list)
	.2byte (unit_icon_move_Fleet_anim_1 - unit_icon_move_Fleet_anim_list)
	.2byte (unit_icon_move_Fleet_anim_2 - unit_icon_move_Fleet_anim_list)
	.2byte (unit_icon_move_Fleet_anim_3 - unit_icon_move_Fleet_anim_list)
	.2byte (unit_icon_move_Fleet_anim_4 - unit_icon_move_Fleet_anim_list)

unit_icon_move_Fleet_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fleet_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fleet_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fleet_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fleet_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fleet_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fleet_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fleet_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fleet_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Fleet_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Fleet_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Fleet_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Fleet_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Fleet_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Fleet_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Fleet_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Fleet_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Fleet_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Fleet_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_Fleet_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fleet_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fleet_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fleet_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fleet_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Phantom_sheet
unit_icon_move_Phantom_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Phantom_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Phantom_motion
unit_icon_move_Phantom_motion:
	.2byte (unit_icon_move_Phantom_frame_list - unit_icon_move_Phantom_motion), (unit_icon_move_Phantom_anim_list - unit_icon_move_Phantom_motion) @ header

unit_icon_move_Phantom_frame_list: @ +$4
	.2byte (unit_icon_move_Phantom_frame_0 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_1 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_2 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_3 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_4 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_5 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_6 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_7 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_8 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_9 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_10 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_11 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_12 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_13 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_14 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_15 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_16 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_17 - unit_icon_move_Phantom_frame_list)
	.2byte (unit_icon_move_Phantom_frame_18 - unit_icon_move_Phantom_frame_list)

unit_icon_move_Phantom_anim_list: @ +$2A
	.2byte (unit_icon_move_Phantom_anim_0 - unit_icon_move_Phantom_anim_list)
	.2byte (unit_icon_move_Phantom_anim_1 - unit_icon_move_Phantom_anim_list)
	.2byte (unit_icon_move_Phantom_anim_2 - unit_icon_move_Phantom_anim_list)
	.2byte (unit_icon_move_Phantom_anim_3 - unit_icon_move_Phantom_anim_list)
	.2byte (unit_icon_move_Phantom_anim_4 - unit_icon_move_Phantom_anim_list)

unit_icon_move_Phantom_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Phantom_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Phantom_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Phantom_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Phantom_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Phantom_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Phantom_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Phantom_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Phantom_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Phantom_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Phantom_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Phantom_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Phantom_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Phantom_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Phantom_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Phantom_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Phantom_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Phantom_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Phantom_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Revenant_sheet
unit_icon_move_Revenant_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Revenant_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Revenant_motion
unit_icon_move_Revenant_motion:
	.2byte (unit_icon_move_Revenant_frame_list - unit_icon_move_Revenant_motion), (unit_icon_move_Revenant_anim_list - unit_icon_move_Revenant_motion) @ header

unit_icon_move_Revenant_frame_list: @ +$4
	.2byte (unit_icon_move_Revenant_frame_0 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_1 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_2 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_3 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_4 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_5 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_6 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_7 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_8 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_9 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_10 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_11 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_12 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_13 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_14 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_15 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_16 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_17 - unit_icon_move_Revenant_frame_list)
	.2byte (unit_icon_move_Revenant_frame_18 - unit_icon_move_Revenant_frame_list)

unit_icon_move_Revenant_anim_list: @ +$2A
	.2byte (unit_icon_move_Revenant_anim_0 - unit_icon_move_Revenant_anim_list)
	.2byte (unit_icon_move_Revenant_anim_1 - unit_icon_move_Revenant_anim_list)
	.2byte (unit_icon_move_Revenant_anim_2 - unit_icon_move_Revenant_anim_list)
	.2byte (unit_icon_move_Revenant_anim_3 - unit_icon_move_Revenant_anim_list)
	.2byte (unit_icon_move_Revenant_anim_4 - unit_icon_move_Revenant_anim_list)

unit_icon_move_Revenant_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Revenant_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Revenant_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Revenant_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Revenant_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Revenant_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Revenant_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Revenant_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Revenant_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Revenant_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Revenant_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Revenant_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Revenant_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Revenant_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Revenant_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Revenant_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Revenant_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Revenant_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Revenant_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Entoumbed_sheet
unit_icon_move_Entoumbed_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Entoumbed_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Entoumbed_motion
unit_icon_move_Entoumbed_motion:
	.2byte (unit_icon_move_Entoumbed_frame_list - unit_icon_move_Entoumbed_motion), (unit_icon_move_Entoumbed_anim_list - unit_icon_move_Entoumbed_motion) @ header

unit_icon_move_Entoumbed_frame_list: @ +$4
	.2byte (unit_icon_move_Entoumbed_frame_0 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_1 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_2 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_3 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_4 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_5 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_6 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_7 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_8 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_9 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_10 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_11 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_12 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_13 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_14 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_15 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_16 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_17 - unit_icon_move_Entoumbed_frame_list)
	.2byte (unit_icon_move_Entoumbed_frame_18 - unit_icon_move_Entoumbed_frame_list)

unit_icon_move_Entoumbed_anim_list: @ +$2A
	.2byte (unit_icon_move_Entoumbed_anim_0 - unit_icon_move_Entoumbed_anim_list)
	.2byte (unit_icon_move_Entoumbed_anim_1 - unit_icon_move_Entoumbed_anim_list)
	.2byte (unit_icon_move_Entoumbed_anim_2 - unit_icon_move_Entoumbed_anim_list)
	.2byte (unit_icon_move_Entoumbed_anim_3 - unit_icon_move_Entoumbed_anim_list)
	.2byte (unit_icon_move_Entoumbed_anim_4 - unit_icon_move_Entoumbed_anim_list)

unit_icon_move_Entoumbed_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Entoumbed_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Entoumbed_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Entoumbed_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Entoumbed_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Entoumbed_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Entoumbed_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bonewalker_sheet
unit_icon_move_Bonewalker_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bonewalker_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bonewalker_motion
unit_icon_move_Bonewalker_motion:
	.2byte (unit_icon_move_Bonewalker_frame_list - unit_icon_move_Bonewalker_motion), (unit_icon_move_Bonewalker_anim_list - unit_icon_move_Bonewalker_motion) @ header

unit_icon_move_Bonewalker_frame_list: @ +$4
	.2byte (unit_icon_move_Bonewalker_frame_0 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_1 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_2 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_3 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_4 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_5 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_6 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_7 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_8 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_9 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_10 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_11 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_12 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_13 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_14 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_15 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_16 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_17 - unit_icon_move_Bonewalker_frame_list)
	.2byte (unit_icon_move_Bonewalker_frame_18 - unit_icon_move_Bonewalker_frame_list)

unit_icon_move_Bonewalker_anim_list: @ +$2A
	.2byte (unit_icon_move_Bonewalker_anim_0 - unit_icon_move_Bonewalker_anim_list)
	.2byte (unit_icon_move_Bonewalker_anim_1 - unit_icon_move_Bonewalker_anim_list)
	.2byte (unit_icon_move_Bonewalker_anim_2 - unit_icon_move_Bonewalker_anim_list)
	.2byte (unit_icon_move_Bonewalker_anim_3 - unit_icon_move_Bonewalker_anim_list)
	.2byte (unit_icon_move_Bonewalker_anim_4 - unit_icon_move_Bonewalker_anim_list)

unit_icon_move_Bonewalker_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bonewalker_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Bonewalker_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bonewalker_Bow_sheet
unit_icon_move_Bonewalker_Bow_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bonewalker_Bow_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bonewalker_Bow_motion
unit_icon_move_Bonewalker_Bow_motion:
	.2byte (unit_icon_move_Bonewalker_Bow_frame_list - unit_icon_move_Bonewalker_Bow_motion), (unit_icon_move_Bonewalker_Bow_anim_list - unit_icon_move_Bonewalker_Bow_motion) @ header

unit_icon_move_Bonewalker_Bow_frame_list: @ +$4
	.2byte (unit_icon_move_Bonewalker_Bow_frame_0 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_1 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_2 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_3 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_4 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_5 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_6 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_7 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_8 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_9 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_10 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_11 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_12 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_13 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_14 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_15 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_16 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_17 - unit_icon_move_Bonewalker_Bow_frame_list)
	.2byte (unit_icon_move_Bonewalker_Bow_frame_18 - unit_icon_move_Bonewalker_Bow_frame_list)

unit_icon_move_Bonewalker_Bow_anim_list: @ +$2A
	.2byte (unit_icon_move_Bonewalker_Bow_anim_0 - unit_icon_move_Bonewalker_Bow_anim_list)
	.2byte (unit_icon_move_Bonewalker_Bow_anim_1 - unit_icon_move_Bonewalker_Bow_anim_list)
	.2byte (unit_icon_move_Bonewalker_Bow_anim_2 - unit_icon_move_Bonewalker_Bow_anim_list)
	.2byte (unit_icon_move_Bonewalker_Bow_anim_3 - unit_icon_move_Bonewalker_Bow_anim_list)
	.2byte (unit_icon_move_Bonewalker_Bow_anim_4 - unit_icon_move_Bonewalker_Bow_anim_list)

unit_icon_move_Bonewalker_Bow_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Bonewalker_Bow_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_Bow_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_Bow_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_Bow_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bonewalker_Bow_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wight_sheet
unit_icon_move_Wight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wight_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wight_motion
unit_icon_move_Wight_motion:
	.2byte (unit_icon_move_Wight_frame_list - unit_icon_move_Wight_motion), (unit_icon_move_Wight_anim_list - unit_icon_move_Wight_motion) @ header

unit_icon_move_Wight_frame_list: @ +$4
	.2byte (unit_icon_move_Wight_frame_0 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_1 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_2 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_3 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_4 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_5 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_6 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_7 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_8 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_9 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_10 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_11 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_12 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_13 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_14 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_15 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_16 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_17 - unit_icon_move_Wight_frame_list)
	.2byte (unit_icon_move_Wight_frame_18 - unit_icon_move_Wight_frame_list)

unit_icon_move_Wight_anim_list: @ +$2A
	.2byte (unit_icon_move_Wight_anim_0 - unit_icon_move_Wight_anim_list)
	.2byte (unit_icon_move_Wight_anim_1 - unit_icon_move_Wight_anim_list)
	.2byte (unit_icon_move_Wight_anim_2 - unit_icon_move_Wight_anim_list)
	.2byte (unit_icon_move_Wight_anim_3 - unit_icon_move_Wight_anim_list)
	.2byte (unit_icon_move_Wight_anim_4 - unit_icon_move_Wight_anim_list)

unit_icon_move_Wight_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wight_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wight_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wight_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wight_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wight_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wight_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wight_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wight_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wight_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wight_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wight_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wight_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wight_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wight_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wight_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wight_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wight_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wight_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Wight_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Wight_Bow_sheet
unit_icon_move_Wight_Bow_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Wight_Bow_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Wight_Bow_motion
unit_icon_move_Wight_Bow_motion:
	.2byte (unit_icon_move_Wight_Bow_frame_list - unit_icon_move_Wight_Bow_motion), (unit_icon_move_Wight_Bow_anim_list - unit_icon_move_Wight_Bow_motion) @ header

unit_icon_move_Wight_Bow_frame_list: @ +$4
	.2byte (unit_icon_move_Wight_Bow_frame_0 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_1 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_2 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_3 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_4 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_5 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_6 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_7 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_8 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_9 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_10 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_11 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_12 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_13 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_14 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_15 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_16 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_17 - unit_icon_move_Wight_Bow_frame_list)
	.2byte (unit_icon_move_Wight_Bow_frame_18 - unit_icon_move_Wight_Bow_frame_list)

unit_icon_move_Wight_Bow_anim_list: @ +$2A
	.2byte (unit_icon_move_Wight_Bow_anim_0 - unit_icon_move_Wight_Bow_anim_list)
	.2byte (unit_icon_move_Wight_Bow_anim_1 - unit_icon_move_Wight_Bow_anim_list)
	.2byte (unit_icon_move_Wight_Bow_anim_2 - unit_icon_move_Wight_Bow_anim_list)
	.2byte (unit_icon_move_Wight_Bow_anim_3 - unit_icon_move_Wight_Bow_anim_list)
	.2byte (unit_icon_move_Wight_Bow_anim_4 - unit_icon_move_Wight_Bow_anim_list)

unit_icon_move_Wight_Bow_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Wight_Bow_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_Bow_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_Bow_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_Bow_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Wight_Bow_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Bael_sheet
unit_icon_move_Bael_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bael_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Bael_motion
unit_icon_move_Bael_motion:
	.2byte (unit_icon_move_Bael_frame_list - unit_icon_move_Bael_motion), (unit_icon_move_Bael_anim_list - unit_icon_move_Bael_motion) @ header

unit_icon_move_Bael_frame_list: @ +$4
	.2byte (unit_icon_move_Bael_frame_0 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_1 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_2 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_3 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_4 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_5 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_6 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_7 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_8 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_9 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_10 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_11 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_12 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_13 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_14 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_15 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_16 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_17 - unit_icon_move_Bael_frame_list)
	.2byte (unit_icon_move_Bael_frame_18 - unit_icon_move_Bael_frame_list)

unit_icon_move_Bael_anim_list: @ +$2A
	.2byte (unit_icon_move_Bael_anim_0 - unit_icon_move_Bael_anim_list)
	.2byte (unit_icon_move_Bael_anim_1 - unit_icon_move_Bael_anim_list)
	.2byte (unit_icon_move_Bael_anim_2 - unit_icon_move_Bael_anim_list)
	.2byte (unit_icon_move_Bael_anim_3 - unit_icon_move_Bael_anim_list)
	.2byte (unit_icon_move_Bael_anim_4 - unit_icon_move_Bael_anim_list)

unit_icon_move_Bael_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bael_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bael_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bael_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bael_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Bael_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Bael_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Bael_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Bael_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Bael_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Bael_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Bael_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Bael_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Bael_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Bael_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Bael_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Bael_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Bael_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Bael_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Bael_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bael_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bael_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bael_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Bael_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Elder_Bael_sheet
unit_icon_move_Elder_Bael_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Elder_Bael_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Elder_Bael_motion
unit_icon_move_Elder_Bael_motion:
	.2byte (unit_icon_move_Elder_Bael_frame_list - unit_icon_move_Elder_Bael_motion), (unit_icon_move_Elder_Bael_anim_list - unit_icon_move_Elder_Bael_motion) @ header

unit_icon_move_Elder_Bael_frame_list: @ +$4
	.2byte (unit_icon_move_Elder_Bael_frame_0 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_1 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_2 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_3 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_4 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_5 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_6 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_7 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_8 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_9 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_10 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_11 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_12 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_13 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_14 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_15 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_16 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_17 - unit_icon_move_Elder_Bael_frame_list)
	.2byte (unit_icon_move_Elder_Bael_frame_18 - unit_icon_move_Elder_Bael_frame_list)

unit_icon_move_Elder_Bael_anim_list: @ +$2A
	.2byte (unit_icon_move_Elder_Bael_anim_0 - unit_icon_move_Elder_Bael_anim_list)
	.2byte (unit_icon_move_Elder_Bael_anim_1 - unit_icon_move_Elder_Bael_anim_list)
	.2byte (unit_icon_move_Elder_Bael_anim_2 - unit_icon_move_Elder_Bael_anim_list)
	.2byte (unit_icon_move_Elder_Bael_anim_3 - unit_icon_move_Elder_Bael_anim_list)
	.2byte (unit_icon_move_Elder_Bael_anim_4 - unit_icon_move_Elder_Bael_anim_list)

unit_icon_move_Elder_Bael_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Elder_Bael_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Elder_Bael_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Elder_Bael_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Elder_Bael_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Elder_Bael_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Cyclops_sheet
unit_icon_move_Cyclops_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Cyclops_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Cyclops_motion
unit_icon_move_Cyclops_motion:
	.2byte (unit_icon_move_Cyclops_frame_list - unit_icon_move_Cyclops_motion), (unit_icon_move_Cyclops_anim_list - unit_icon_move_Cyclops_motion) @ header

unit_icon_move_Cyclops_frame_list: @ +$4
	.2byte (unit_icon_move_Cyclops_frame_0 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_1 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_2 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_3 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_4 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_5 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_6 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_7 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_8 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_9 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_10 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_11 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_12 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_13 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_14 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_15 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_16 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_17 - unit_icon_move_Cyclops_frame_list)
	.2byte (unit_icon_move_Cyclops_frame_18 - unit_icon_move_Cyclops_frame_list)

unit_icon_move_Cyclops_anim_list: @ +$2A
	.2byte (unit_icon_move_Cyclops_anim_0 - unit_icon_move_Cyclops_anim_list)
	.2byte (unit_icon_move_Cyclops_anim_1 - unit_icon_move_Cyclops_anim_list)
	.2byte (unit_icon_move_Cyclops_anim_2 - unit_icon_move_Cyclops_anim_list)
	.2byte (unit_icon_move_Cyclops_anim_3 - unit_icon_move_Cyclops_anim_list)
	.2byte (unit_icon_move_Cyclops_anim_4 - unit_icon_move_Cyclops_anim_list)

unit_icon_move_Cyclops_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Cyclops_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D8, 0x1F0, 0x3004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Cyclops_anim_0: @ +$FA
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cyclops_anim_1: @ +$10E
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cyclops_anim_2: @ +$122
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cyclops_anim_3: @ +$136
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Cyclops_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mauthedoog_sheet
unit_icon_move_Mauthedoog_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mauthedoog_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mauthedoog_motion
unit_icon_move_Mauthedoog_motion:
	.2byte (unit_icon_move_Mauthedoog_frame_list - unit_icon_move_Mauthedoog_motion), (unit_icon_move_Mauthedoog_anim_list - unit_icon_move_Mauthedoog_motion) @ header

unit_icon_move_Mauthedoog_frame_list: @ +$4
	.2byte (unit_icon_move_Mauthedoog_frame_0 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_1 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_2 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_3 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_4 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_5 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_6 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_7 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_8 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_9 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_10 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_11 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_12 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_13 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_14 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_15 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_16 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_17 - unit_icon_move_Mauthedoog_frame_list)
	.2byte (unit_icon_move_Mauthedoog_frame_18 - unit_icon_move_Mauthedoog_frame_list)

unit_icon_move_Mauthedoog_anim_list: @ +$2A
	.2byte (unit_icon_move_Mauthedoog_anim_0 - unit_icon_move_Mauthedoog_anim_list)
	.2byte (unit_icon_move_Mauthedoog_anim_1 - unit_icon_move_Mauthedoog_anim_list)
	.2byte (unit_icon_move_Mauthedoog_anim_2 - unit_icon_move_Mauthedoog_anim_list)
	.2byte (unit_icon_move_Mauthedoog_anim_3 - unit_icon_move_Mauthedoog_anim_list)
	.2byte (unit_icon_move_Mauthedoog_anim_4 - unit_icon_move_Mauthedoog_anim_list)

unit_icon_move_Mauthedoog_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mauthedoog_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mauthedoog_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mauthedoog_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mauthedoog_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mauthedoog_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Gwyllgi_sheet
unit_icon_move_Gwyllgi_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Gwyllgi_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Gwyllgi_motion
unit_icon_move_Gwyllgi_motion:
	.2byte (unit_icon_move_Gwyllgi_frame_list - unit_icon_move_Gwyllgi_motion), (unit_icon_move_Gwyllgi_anim_list - unit_icon_move_Gwyllgi_motion) @ header

unit_icon_move_Gwyllgi_frame_list: @ +$4
	.2byte (unit_icon_move_Gwyllgi_frame_0 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_1 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_2 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_3 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_4 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_5 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_6 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_7 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_8 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_9 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_10 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_11 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_12 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_13 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_14 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_15 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_16 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_17 - unit_icon_move_Gwyllgi_frame_list)
	.2byte (unit_icon_move_Gwyllgi_frame_18 - unit_icon_move_Gwyllgi_frame_list)

unit_icon_move_Gwyllgi_anim_list: @ +$2A
	.2byte (unit_icon_move_Gwyllgi_anim_0 - unit_icon_move_Gwyllgi_anim_list)
	.2byte (unit_icon_move_Gwyllgi_anim_1 - unit_icon_move_Gwyllgi_anim_list)
	.2byte (unit_icon_move_Gwyllgi_anim_2 - unit_icon_move_Gwyllgi_anim_list)
	.2byte (unit_icon_move_Gwyllgi_anim_3 - unit_icon_move_Gwyllgi_anim_list)
	.2byte (unit_icon_move_Gwyllgi_anim_4 - unit_icon_move_Gwyllgi_anim_list)

unit_icon_move_Gwyllgi_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Gwyllgi_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gwyllgi_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gwyllgi_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gwyllgi_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gwyllgi_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Tarvos_sheet
unit_icon_move_Tarvos_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Tarvos_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Tarvos_motion
unit_icon_move_Tarvos_motion:
	.2byte (unit_icon_move_Tarvos_frame_list - unit_icon_move_Tarvos_motion), (unit_icon_move_Tarvos_anim_list - unit_icon_move_Tarvos_motion) @ header

unit_icon_move_Tarvos_frame_list: @ +$4
	.2byte (unit_icon_move_Tarvos_frame_0 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_1 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_2 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_3 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_4 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_5 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_6 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_7 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_8 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_9 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_10 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_11 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_12 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_13 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_14 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_15 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_16 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_17 - unit_icon_move_Tarvos_frame_list)
	.2byte (unit_icon_move_Tarvos_frame_18 - unit_icon_move_Tarvos_frame_list)

unit_icon_move_Tarvos_anim_list: @ +$2A
	.2byte (unit_icon_move_Tarvos_anim_0 - unit_icon_move_Tarvos_anim_list)
	.2byte (unit_icon_move_Tarvos_anim_1 - unit_icon_move_Tarvos_anim_list)
	.2byte (unit_icon_move_Tarvos_anim_2 - unit_icon_move_Tarvos_anim_list)
	.2byte (unit_icon_move_Tarvos_anim_3 - unit_icon_move_Tarvos_anim_list)
	.2byte (unit_icon_move_Tarvos_anim_4 - unit_icon_move_Tarvos_anim_list)

unit_icon_move_Tarvos_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Tarvos_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Tarvos_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tarvos_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tarvos_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tarvos_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tarvos_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Maelduin_sheet
unit_icon_move_Maelduin_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Maelduin_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Maelduin_motion
unit_icon_move_Maelduin_motion:
	.2byte (unit_icon_move_Maelduin_frame_list - unit_icon_move_Maelduin_motion), (unit_icon_move_Maelduin_anim_list - unit_icon_move_Maelduin_motion) @ header

unit_icon_move_Maelduin_frame_list: @ +$4
	.2byte (unit_icon_move_Maelduin_frame_0 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_1 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_2 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_3 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_4 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_5 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_6 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_7 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_8 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_9 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_10 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_11 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_12 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_13 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_14 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_15 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_16 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_17 - unit_icon_move_Maelduin_frame_list)
	.2byte (unit_icon_move_Maelduin_frame_18 - unit_icon_move_Maelduin_frame_list)

unit_icon_move_Maelduin_anim_list: @ +$2A
	.2byte (unit_icon_move_Maelduin_anim_0 - unit_icon_move_Maelduin_anim_list)
	.2byte (unit_icon_move_Maelduin_anim_1 - unit_icon_move_Maelduin_anim_list)
	.2byte (unit_icon_move_Maelduin_anim_2 - unit_icon_move_Maelduin_anim_list)
	.2byte (unit_icon_move_Maelduin_anim_3 - unit_icon_move_Maelduin_anim_list)
	.2byte (unit_icon_move_Maelduin_anim_4 - unit_icon_move_Maelduin_anim_list)

unit_icon_move_Maelduin_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Maelduin_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Maelduin_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Maelduin_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Maelduin_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Maelduin_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Maelduin_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Mogall_sheet
unit_icon_move_Mogall_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Mogall_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Mogall_motion
unit_icon_move_Mogall_motion:
	.2byte (unit_icon_move_Mogall_frame_list - unit_icon_move_Mogall_motion), (unit_icon_move_Mogall_anim_list - unit_icon_move_Mogall_motion) @ header

unit_icon_move_Mogall_frame_list: @ +$4
	.2byte (unit_icon_move_Mogall_frame_0 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_1 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_2 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_3 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_4 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_5 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_6 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_7 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_8 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_9 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_10 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_11 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_12 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_13 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_14 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_15 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_16 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_17 - unit_icon_move_Mogall_frame_list)
	.2byte (unit_icon_move_Mogall_frame_18 - unit_icon_move_Mogall_frame_list)

unit_icon_move_Mogall_anim_list: @ +$2A
	.2byte (unit_icon_move_Mogall_anim_0 - unit_icon_move_Mogall_anim_list)
	.2byte (unit_icon_move_Mogall_anim_1 - unit_icon_move_Mogall_anim_list)
	.2byte (unit_icon_move_Mogall_anim_2 - unit_icon_move_Mogall_anim_list)
	.2byte (unit_icon_move_Mogall_anim_3 - unit_icon_move_Mogall_anim_list)
	.2byte (unit_icon_move_Mogall_anim_4 - unit_icon_move_Mogall_anim_list)

unit_icon_move_Mogall_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mogall_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mogall_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mogall_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Mogall_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Mogall_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Mogall_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Mogall_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Mogall_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Mogall_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Mogall_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Mogall_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Mogall_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Mogall_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Mogall_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mogall_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mogall_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mogall_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Mogall_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Arch_Mogall_sheet
unit_icon_move_Arch_Mogall_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Arch_Mogall_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Arch_Mogall_motion
unit_icon_move_Arch_Mogall_motion:
	.2byte (unit_icon_move_Arch_Mogall_frame_list - unit_icon_move_Arch_Mogall_motion), (unit_icon_move_Arch_Mogall_anim_list - unit_icon_move_Arch_Mogall_motion) @ header

unit_icon_move_Arch_Mogall_frame_list: @ +$4
	.2byte (unit_icon_move_Arch_Mogall_frame_0 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_1 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_2 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_3 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_4 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_5 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_6 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_7 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_8 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_9 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_10 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_11 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_12 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_13 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_14 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_15 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_16 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_17 - unit_icon_move_Arch_Mogall_frame_list)
	.2byte (unit_icon_move_Arch_Mogall_frame_18 - unit_icon_move_Arch_Mogall_frame_list)

unit_icon_move_Arch_Mogall_anim_list: @ +$2A
	.2byte (unit_icon_move_Arch_Mogall_anim_0 - unit_icon_move_Arch_Mogall_anim_list)
	.2byte (unit_icon_move_Arch_Mogall_anim_1 - unit_icon_move_Arch_Mogall_anim_list)
	.2byte (unit_icon_move_Arch_Mogall_anim_2 - unit_icon_move_Arch_Mogall_anim_list)
	.2byte (unit_icon_move_Arch_Mogall_anim_3 - unit_icon_move_Arch_Mogall_anim_list)
	.2byte (unit_icon_move_Arch_Mogall_anim_4 - unit_icon_move_Arch_Mogall_anim_list)

unit_icon_move_Arch_Mogall_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Arch_Mogall_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Arch_Mogall_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Arch_Mogall_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Arch_Mogall_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Arch_Mogall_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Gorgon_sheet
unit_icon_move_Gorgon_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Gorgon_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Gorgon_motion
unit_icon_move_Gorgon_motion:
	.2byte (unit_icon_move_Gorgon_frame_list - unit_icon_move_Gorgon_motion), (unit_icon_move_Gorgon_anim_list - unit_icon_move_Gorgon_motion) @ header

unit_icon_move_Gorgon_frame_list: @ +$4
	.2byte (unit_icon_move_Gorgon_frame_0 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_1 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_2 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_3 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_4 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_5 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_6 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_7 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_8 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_9 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_10 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_11 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_12 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_13 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_14 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_15 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_16 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_17 - unit_icon_move_Gorgon_frame_list)
	.2byte (unit_icon_move_Gorgon_frame_18 - unit_icon_move_Gorgon_frame_list)

unit_icon_move_Gorgon_anim_list: @ +$2A
	.2byte (unit_icon_move_Gorgon_anim_0 - unit_icon_move_Gorgon_anim_list)
	.2byte (unit_icon_move_Gorgon_anim_1 - unit_icon_move_Gorgon_anim_list)
	.2byte (unit_icon_move_Gorgon_anim_2 - unit_icon_move_Gorgon_anim_list)
	.2byte (unit_icon_move_Gorgon_anim_3 - unit_icon_move_Gorgon_anim_list)
	.2byte (unit_icon_move_Gorgon_anim_4 - unit_icon_move_Gorgon_anim_list)

unit_icon_move_Gorgon_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Gorgon_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Gorgon_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgon_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgon_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgon_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgon_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Gorgonegg_sheet
unit_icon_move_Gorgonegg_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Gorgonegg_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Gorgonegg_motion
unit_icon_move_Gorgonegg_motion:
	.2byte (unit_icon_move_Gorgonegg_frame_list - unit_icon_move_Gorgonegg_motion), (unit_icon_move_Gorgonegg_anim_list - unit_icon_move_Gorgonegg_motion) @ header

unit_icon_move_Gorgonegg_frame_list: @ +$4
	.2byte (unit_icon_move_Gorgonegg_frame_0 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_1 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_2 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_3 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_4 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_5 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_6 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_7 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_8 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_9 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_10 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_11 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_12 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_13 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_14 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_15 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_16 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_17 - unit_icon_move_Gorgonegg_frame_list)
	.2byte (unit_icon_move_Gorgonegg_frame_18 - unit_icon_move_Gorgonegg_frame_list)

unit_icon_move_Gorgonegg_anim_list: @ +$2A
	.2byte (unit_icon_move_Gorgonegg_anim_0 - unit_icon_move_Gorgonegg_anim_list)
	.2byte (unit_icon_move_Gorgonegg_anim_1 - unit_icon_move_Gorgonegg_anim_list)
	.2byte (unit_icon_move_Gorgonegg_anim_2 - unit_icon_move_Gorgonegg_anim_list)
	.2byte (unit_icon_move_Gorgonegg_anim_3 - unit_icon_move_Gorgonegg_anim_list)
	.2byte (unit_icon_move_Gorgonegg_anim_4 - unit_icon_move_Gorgonegg_anim_list)

unit_icon_move_Gorgonegg_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Gorgonegg_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gorgonegg_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Gargoyle_sheet
unit_icon_move_Gargoyle_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Gargoyle_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Gargoyle_motion
unit_icon_move_Gargoyle_motion:
	.2byte (unit_icon_move_Gargoyle_frame_list - unit_icon_move_Gargoyle_motion), (unit_icon_move_Gargoyle_anim_list - unit_icon_move_Gargoyle_motion) @ header

unit_icon_move_Gargoyle_frame_list: @ +$4
	.2byte (unit_icon_move_Gargoyle_frame_0 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_1 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_2 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_3 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_4 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_5 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_6 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_7 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_8 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_9 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_10 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_11 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_12 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_13 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_14 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_15 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_16 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_17 - unit_icon_move_Gargoyle_frame_list)
	.2byte (unit_icon_move_Gargoyle_frame_18 - unit_icon_move_Gargoyle_frame_list)

unit_icon_move_Gargoyle_anim_list: @ +$2A
	.2byte (unit_icon_move_Gargoyle_anim_0 - unit_icon_move_Gargoyle_anim_list)
	.2byte (unit_icon_move_Gargoyle_anim_1 - unit_icon_move_Gargoyle_anim_list)
	.2byte (unit_icon_move_Gargoyle_anim_2 - unit_icon_move_Gargoyle_anim_list)
	.2byte (unit_icon_move_Gargoyle_anim_3 - unit_icon_move_Gargoyle_anim_list)
	.2byte (unit_icon_move_Gargoyle_anim_4 - unit_icon_move_Gargoyle_anim_list)

unit_icon_move_Gargoyle_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Gargoyle_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Gargoyle_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gargoyle_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gargoyle_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gargoyle_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Gargoyle_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Deathgoyle_sheet
unit_icon_move_Deathgoyle_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Deathgoyle_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Deathgoyle_motion
unit_icon_move_Deathgoyle_motion:
	.2byte (unit_icon_move_Deathgoyle_frame_list - unit_icon_move_Deathgoyle_motion), (unit_icon_move_Deathgoyle_anim_list - unit_icon_move_Deathgoyle_motion) @ header

unit_icon_move_Deathgoyle_frame_list: @ +$4
	.2byte (unit_icon_move_Deathgoyle_frame_0 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_1 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_2 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_3 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_4 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_5 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_6 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_7 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_8 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_9 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_10 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_11 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_12 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_13 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_14 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_15 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_16 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_17 - unit_icon_move_Deathgoyle_frame_list)
	.2byte (unit_icon_move_Deathgoyle_frame_18 - unit_icon_move_Deathgoyle_frame_list)

unit_icon_move_Deathgoyle_anim_list: @ +$2A
	.2byte (unit_icon_move_Deathgoyle_anim_0 - unit_icon_move_Deathgoyle_anim_list)
	.2byte (unit_icon_move_Deathgoyle_anim_1 - unit_icon_move_Deathgoyle_anim_list)
	.2byte (unit_icon_move_Deathgoyle_anim_2 - unit_icon_move_Deathgoyle_anim_list)
	.2byte (unit_icon_move_Deathgoyle_anim_3 - unit_icon_move_Deathgoyle_anim_list)
	.2byte (unit_icon_move_Deathgoyle_anim_4 - unit_icon_move_Deathgoyle_anim_list)

unit_icon_move_Deathgoyle_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Deathgoyle_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Deathgoyle_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Deathgoyle_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Deathgoyle_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Deathgoyle_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Draco_Zombie_sheet
unit_icon_move_Draco_Zombie_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Draco_Zombie_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Draco_Zombie_motion
unit_icon_move_Draco_Zombie_motion:
	.2byte (unit_icon_move_Draco_Zombie_frame_list - unit_icon_move_Draco_Zombie_motion), (unit_icon_move_Draco_Zombie_anim_list - unit_icon_move_Draco_Zombie_motion) @ header

unit_icon_move_Draco_Zombie_frame_list: @ +$4
	.2byte (unit_icon_move_Draco_Zombie_frame_0 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_1 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_2 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_3 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_4 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_5 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_6 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_7 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_8 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_9 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_10 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_11 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_12 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_13 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_14 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_15 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_16 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_17 - unit_icon_move_Draco_Zombie_frame_list)
	.2byte (unit_icon_move_Draco_Zombie_frame_18 - unit_icon_move_Draco_Zombie_frame_list)

unit_icon_move_Draco_Zombie_anim_list: @ +$2A
	.2byte (unit_icon_move_Draco_Zombie_anim_0 - unit_icon_move_Draco_Zombie_anim_list)
	.2byte (unit_icon_move_Draco_Zombie_anim_1 - unit_icon_move_Draco_Zombie_anim_list)
	.2byte (unit_icon_move_Draco_Zombie_anim_2 - unit_icon_move_Draco_Zombie_anim_list)
	.2byte (unit_icon_move_Draco_Zombie_anim_3 - unit_icon_move_Draco_Zombie_anim_list)
	.2byte (unit_icon_move_Draco_Zombie_anim_4 - unit_icon_move_Draco_Zombie_anim_list)

unit_icon_move_Draco_Zombie_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Draco_Zombie_frame_18: @ +$E8
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F3, 0x0 @ OAM Data #0
	.2byte 0x80E0, 0x13, 0x4 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Draco_Zombie_anim_0: @ +$FA
	.2byte 18,  0
	.2byte 10,  1
	.2byte 18,  2
	.2byte 10,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Draco_Zombie_anim_1: @ +$10E
	.2byte 18,  4
	.2byte 10,  5
	.2byte 18,  6
	.2byte 10,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Draco_Zombie_anim_2: @ +$122
	.2byte 18,  8
	.2byte 10,  9
	.2byte 18, 10
	.2byte 10, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Draco_Zombie_anim_3: @ +$136
	.2byte 18, 12
	.2byte 10, 13
	.2byte 18, 14
	.2byte 10, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Draco_Zombie_anim_4: @ +$14A
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Demon_King_sheet
unit_icon_move_Demon_King_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Demon_King_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Demon_King_motion
unit_icon_move_Demon_King_motion:
	.2byte (unit_icon_move_Demon_King_frame_list - unit_icon_move_Demon_King_motion), (unit_icon_move_Demon_King_anim_list - unit_icon_move_Demon_King_motion) @ header

unit_icon_move_Demon_King_frame_list: @ +$4
	.2byte (unit_icon_move_Demon_King_frame_0 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_1 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_2 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_3 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_4 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_5 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_6 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_7 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_8 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_9 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_10 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_11 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_12 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_13 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_14 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_15 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_16 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_17 - unit_icon_move_Demon_King_frame_list)
	.2byte (unit_icon_move_Demon_King_frame_18 - unit_icon_move_Demon_King_frame_list)

unit_icon_move_Demon_King_anim_list: @ +$2A
	.2byte (unit_icon_move_Demon_King_anim_0 - unit_icon_move_Demon_King_anim_list)
	.2byte (unit_icon_move_Demon_King_anim_1 - unit_icon_move_Demon_King_anim_list)
	.2byte (unit_icon_move_Demon_King_anim_2 - unit_icon_move_Demon_King_anim_list)
	.2byte (unit_icon_move_Demon_King_anim_3 - unit_icon_move_Demon_King_anim_list)
	.2byte (unit_icon_move_Demon_King_anim_4 - unit_icon_move_Demon_King_anim_list)

unit_icon_move_Demon_King_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Demon_King_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Demon_King_anim_0: @ +$F2
	.2byte 16,  0
	.2byte 10,  1
	.2byte 16,  2
	.2byte 10,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Demon_King_anim_1: @ +$106
	.2byte 16,  4
	.2byte 10,  5
	.2byte 16,  6
	.2byte 10,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Demon_King_anim_2: @ +$11A
	.2byte 16,  8
	.2byte 10,  9
	.2byte 16, 10
	.2byte 10, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Demon_King_anim_3: @ +$12E
	.2byte 16, 12
	.2byte 10, 13
	.2byte 16, 14
	.2byte 10, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Demon_King_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Regular_Used_sheet
unit_icon_move_Blst_Regular_Used_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Regular_Used_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Regular_Used_motion
unit_icon_move_Blst_Regular_Used_motion:
	.2byte (unit_icon_move_Blst_Regular_Used_frame_list - unit_icon_move_Blst_Regular_Used_motion), (unit_icon_move_Blst_Regular_Used_anim_list - unit_icon_move_Blst_Regular_Used_motion) @ header

unit_icon_move_Blst_Regular_Used_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Regular_Used_frame_0 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_1 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_2 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_3 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_4 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_5 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_6 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_7 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_8 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_9 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_10 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_11 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_12 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_13 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_14 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_15 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_16 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_17 - unit_icon_move_Blst_Regular_Used_frame_list)
	.2byte (unit_icon_move_Blst_Regular_Used_frame_18 - unit_icon_move_Blst_Regular_Used_frame_list)

unit_icon_move_Blst_Regular_Used_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Regular_Used_anim_0 - unit_icon_move_Blst_Regular_Used_anim_list)
	.2byte (unit_icon_move_Blst_Regular_Used_anim_1 - unit_icon_move_Blst_Regular_Used_anim_list)
	.2byte (unit_icon_move_Blst_Regular_Used_anim_2 - unit_icon_move_Blst_Regular_Used_anim_list)
	.2byte (unit_icon_move_Blst_Regular_Used_anim_3 - unit_icon_move_Blst_Regular_Used_anim_list)
	.2byte (unit_icon_move_Blst_Regular_Used_anim_4 - unit_icon_move_Blst_Regular_Used_anim_list)

unit_icon_move_Blst_Regular_Used_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Regular_Used_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Regular_Used_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Regular_Used_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Regular_Used_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Regular_Used_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Long_Used_sheet
unit_icon_move_Blst_Long_Used_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Long_Used_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Long_Used_motion
unit_icon_move_Blst_Long_Used_motion:
	.2byte (unit_icon_move_Blst_Long_Used_frame_list - unit_icon_move_Blst_Long_Used_motion), (unit_icon_move_Blst_Long_Used_anim_list - unit_icon_move_Blst_Long_Used_motion) @ header

unit_icon_move_Blst_Long_Used_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Long_Used_frame_0 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_1 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_2 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_3 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_4 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_5 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_6 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_7 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_8 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_9 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_10 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_11 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_12 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_13 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_14 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_15 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_16 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_17 - unit_icon_move_Blst_Long_Used_frame_list)
	.2byte (unit_icon_move_Blst_Long_Used_frame_18 - unit_icon_move_Blst_Long_Used_frame_list)

unit_icon_move_Blst_Long_Used_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Long_Used_anim_0 - unit_icon_move_Blst_Long_Used_anim_list)
	.2byte (unit_icon_move_Blst_Long_Used_anim_1 - unit_icon_move_Blst_Long_Used_anim_list)
	.2byte (unit_icon_move_Blst_Long_Used_anim_2 - unit_icon_move_Blst_Long_Used_anim_list)
	.2byte (unit_icon_move_Blst_Long_Used_anim_3 - unit_icon_move_Blst_Long_Used_anim_list)
	.2byte (unit_icon_move_Blst_Long_Used_anim_4 - unit_icon_move_Blst_Long_Used_anim_list)

unit_icon_move_Blst_Long_Used_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Used_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Used_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Used_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Used_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Used_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Killer_Used_sheet
unit_icon_move_Blst_Killer_Used_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Killer_Used_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Killer_Used_motion
unit_icon_move_Blst_Killer_Used_motion:
	.2byte (unit_icon_move_Blst_Killer_Used_frame_list - unit_icon_move_Blst_Killer_Used_motion), (unit_icon_move_Blst_Killer_Used_anim_list - unit_icon_move_Blst_Killer_Used_motion) @ header

unit_icon_move_Blst_Killer_Used_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Killer_Used_frame_0 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_1 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_2 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_3 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_4 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_5 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_6 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_7 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_8 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_9 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_10 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_11 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_12 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_13 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_14 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_15 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_16 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_17 - unit_icon_move_Blst_Killer_Used_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Used_frame_18 - unit_icon_move_Blst_Killer_Used_frame_list)

unit_icon_move_Blst_Killer_Used_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Killer_Used_anim_0 - unit_icon_move_Blst_Killer_Used_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Used_anim_1 - unit_icon_move_Blst_Killer_Used_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Used_anim_2 - unit_icon_move_Blst_Killer_Used_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Used_anim_3 - unit_icon_move_Blst_Killer_Used_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Used_anim_4 - unit_icon_move_Blst_Killer_Used_anim_list)

unit_icon_move_Blst_Killer_Used_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Used_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Used_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Used_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Used_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Used_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Long_Empty_sheet
unit_icon_move_Blst_Long_Empty_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Long_Empty_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Long_Empty_motion
unit_icon_move_Blst_Long_Empty_motion:
	.2byte (unit_icon_move_Blst_Long_Empty_frame_list - unit_icon_move_Blst_Long_Empty_motion), (unit_icon_move_Blst_Long_Empty_anim_list - unit_icon_move_Blst_Long_Empty_motion) @ header

unit_icon_move_Blst_Long_Empty_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Long_Empty_frame_0 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_1 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_2 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_3 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_4 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_5 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_6 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_7 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_8 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_9 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_10 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_11 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_12 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_13 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_14 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_15 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_16 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_17 - unit_icon_move_Blst_Long_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Long_Empty_frame_18 - unit_icon_move_Blst_Long_Empty_frame_list)

unit_icon_move_Blst_Long_Empty_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Long_Empty_anim_0 - unit_icon_move_Blst_Long_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Long_Empty_anim_1 - unit_icon_move_Blst_Long_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Long_Empty_anim_2 - unit_icon_move_Blst_Long_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Long_Empty_anim_3 - unit_icon_move_Blst_Long_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Long_Empty_anim_4 - unit_icon_move_Blst_Long_Empty_anim_list)

unit_icon_move_Blst_Long_Empty_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Long_Empty_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Blst_Long_Empty_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_Blst_Long_Empty_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Empty_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Empty_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Empty_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Long_Empty_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Used_Empty_sheet
unit_icon_move_Blst_Used_Empty_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Used_Empty_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Used_Empty_motion
unit_icon_move_Blst_Used_Empty_motion:
	.2byte (unit_icon_move_Blst_Used_Empty_frame_list - unit_icon_move_Blst_Used_Empty_motion), (unit_icon_move_Blst_Used_Empty_anim_list - unit_icon_move_Blst_Used_Empty_motion) @ header

unit_icon_move_Blst_Used_Empty_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Used_Empty_frame_0 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_1 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_2 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_3 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_4 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_5 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_6 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_7 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_8 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_9 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_10 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_11 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_12 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_13 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_14 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_15 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_16 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_17 - unit_icon_move_Blst_Used_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Used_Empty_frame_18 - unit_icon_move_Blst_Used_Empty_frame_list)

unit_icon_move_Blst_Used_Empty_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Used_Empty_anim_0 - unit_icon_move_Blst_Used_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Used_Empty_anim_1 - unit_icon_move_Blst_Used_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Used_Empty_anim_2 - unit_icon_move_Blst_Used_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Used_Empty_anim_3 - unit_icon_move_Blst_Used_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Used_Empty_anim_4 - unit_icon_move_Blst_Used_Empty_anim_list)

unit_icon_move_Blst_Used_Empty_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Blst_Used_Empty_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Used_Empty_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Used_Empty_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Used_Empty_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Used_Empty_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Blst_Killer_Empty_sheet
unit_icon_move_Blst_Killer_Empty_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Blst_Killer_Empty_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Blst_Killer_Empty_motion
unit_icon_move_Blst_Killer_Empty_motion:
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_list - unit_icon_move_Blst_Killer_Empty_motion), (unit_icon_move_Blst_Killer_Empty_anim_list - unit_icon_move_Blst_Killer_Empty_motion) @ header

unit_icon_move_Blst_Killer_Empty_frame_list: @ +$4
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_0 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_1 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_2 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_3 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_4 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_5 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_6 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_7 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_8 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_9 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_10 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_11 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_12 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_13 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_14 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_15 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_16 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_17 - unit_icon_move_Blst_Killer_Empty_frame_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_frame_18 - unit_icon_move_Blst_Killer_Empty_frame_list)

unit_icon_move_Blst_Killer_Empty_anim_list: @ +$2A
	.2byte (unit_icon_move_Blst_Killer_Empty_anim_0 - unit_icon_move_Blst_Killer_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_anim_1 - unit_icon_move_Blst_Killer_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_anim_2 - unit_icon_move_Blst_Killer_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_anim_3 - unit_icon_move_Blst_Killer_Empty_anim_list)
	.2byte (unit_icon_move_Blst_Killer_Empty_anim_4 - unit_icon_move_Blst_Killer_Empty_anim_list)

unit_icon_move_Blst_Killer_Empty_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Blst_Killer_Empty_frame_17: @ +$DE
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40D0, 0x81F0, 0x1004 @ OAM Data #1
	.2byte 0xD0 @ Sheet Tile #0
	.2byte 0xF0 @ Sheet Tile #1

unit_icon_move_Blst_Killer_Empty_frame_18: @ +$F0
	.2byte 2 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0, 0x4000, 0x1004 @ OAM Data #1
	.2byte 0xE0 @ Sheet Tile #0
	.2byte 0xF8 @ Sheet Tile #1

unit_icon_move_Blst_Killer_Empty_anim_0: @ +$102
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Empty_anim_1: @ +$116
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Empty_anim_2: @ +$12A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Empty_anim_3: @ +$13E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Blst_Killer_Empty_anim_4: @ +$152
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Civilian_M1_sheet
unit_icon_move_Civilian_M1_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Civilian_M1_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Civilian_M1_motion
unit_icon_move_Civilian_M1_motion:
	.2byte (unit_icon_move_Civilian_M1_frame_list - unit_icon_move_Civilian_M1_motion), (unit_icon_move_Civilian_M1_anim_list - unit_icon_move_Civilian_M1_motion) @ header

unit_icon_move_Civilian_M1_frame_list: @ +$4
	.2byte (unit_icon_move_Civilian_M1_frame_0 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_1 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_2 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_3 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_4 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_5 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_6 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_7 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_8 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_9 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_10 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_11 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_12 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_13 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_14 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_15 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_16 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_17 - unit_icon_move_Civilian_M1_frame_list)
	.2byte (unit_icon_move_Civilian_M1_frame_18 - unit_icon_move_Civilian_M1_frame_list)

unit_icon_move_Civilian_M1_anim_list: @ +$2A
	.2byte (unit_icon_move_Civilian_M1_anim_0 - unit_icon_move_Civilian_M1_anim_list)
	.2byte (unit_icon_move_Civilian_M1_anim_1 - unit_icon_move_Civilian_M1_anim_list)
	.2byte (unit_icon_move_Civilian_M1_anim_2 - unit_icon_move_Civilian_M1_anim_list)
	.2byte (unit_icon_move_Civilian_M1_anim_3 - unit_icon_move_Civilian_M1_anim_list)
	.2byte (unit_icon_move_Civilian_M1_anim_4 - unit_icon_move_Civilian_M1_anim_list)

unit_icon_move_Civilian_M1_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Civilian_M1_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M1_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M1_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M1_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M1_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Civilian_F1_sheet
unit_icon_move_Civilian_F1_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Civilian_F1_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Civilian_F1_motion
unit_icon_move_Civilian_F1_motion:
	.2byte (unit_icon_move_Civilian_F1_frame_list - unit_icon_move_Civilian_F1_motion), (unit_icon_move_Civilian_F1_anim_list - unit_icon_move_Civilian_F1_motion) @ header

unit_icon_move_Civilian_F1_frame_list: @ +$4
	.2byte (unit_icon_move_Civilian_F1_frame_0 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_1 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_2 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_3 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_4 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_5 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_6 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_7 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_8 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_9 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_10 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_11 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_12 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_13 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_14 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_15 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_16 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_17 - unit_icon_move_Civilian_F1_frame_list)
	.2byte (unit_icon_move_Civilian_F1_frame_18 - unit_icon_move_Civilian_F1_frame_list)

unit_icon_move_Civilian_F1_anim_list: @ +$2A
	.2byte (unit_icon_move_Civilian_F1_anim_0 - unit_icon_move_Civilian_F1_anim_list)
	.2byte (unit_icon_move_Civilian_F1_anim_1 - unit_icon_move_Civilian_F1_anim_list)
	.2byte (unit_icon_move_Civilian_F1_anim_2 - unit_icon_move_Civilian_F1_anim_list)
	.2byte (unit_icon_move_Civilian_F1_anim_3 - unit_icon_move_Civilian_F1_anim_list)
	.2byte (unit_icon_move_Civilian_F1_anim_4 - unit_icon_move_Civilian_F1_anim_list)

unit_icon_move_Civilian_F1_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Civilian_F1_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F1_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F1_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F1_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F1_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Civilian_M2_sheet
unit_icon_move_Civilian_M2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Civilian_M2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Civilian_M2_motion
unit_icon_move_Civilian_M2_motion:
	.2byte (unit_icon_move_Civilian_M2_frame_list - unit_icon_move_Civilian_M2_motion), (unit_icon_move_Civilian_M2_anim_list - unit_icon_move_Civilian_M2_motion) @ header

unit_icon_move_Civilian_M2_frame_list: @ +$4
	.2byte (unit_icon_move_Civilian_M2_frame_0 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_1 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_2 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_3 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_4 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_5 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_6 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_7 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_8 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_9 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_10 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_11 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_12 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_13 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_14 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_15 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_16 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_17 - unit_icon_move_Civilian_M2_frame_list)
	.2byte (unit_icon_move_Civilian_M2_frame_18 - unit_icon_move_Civilian_M2_frame_list)

unit_icon_move_Civilian_M2_anim_list: @ +$2A
	.2byte (unit_icon_move_Civilian_M2_anim_0 - unit_icon_move_Civilian_M2_anim_list)
	.2byte (unit_icon_move_Civilian_M2_anim_1 - unit_icon_move_Civilian_M2_anim_list)
	.2byte (unit_icon_move_Civilian_M2_anim_2 - unit_icon_move_Civilian_M2_anim_list)
	.2byte (unit_icon_move_Civilian_M2_anim_3 - unit_icon_move_Civilian_M2_anim_list)
	.2byte (unit_icon_move_Civilian_M2_anim_4 - unit_icon_move_Civilian_M2_anim_list)

unit_icon_move_Civilian_M2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Civilian_M2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_M2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Civilian_F2_sheet
unit_icon_move_Civilian_F2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Civilian_F2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Civilian_F2_motion
unit_icon_move_Civilian_F2_motion:
	.2byte (unit_icon_move_Civilian_F2_frame_list - unit_icon_move_Civilian_F2_motion), (unit_icon_move_Civilian_F2_anim_list - unit_icon_move_Civilian_F2_motion) @ header

unit_icon_move_Civilian_F2_frame_list: @ +$4
	.2byte (unit_icon_move_Civilian_F2_frame_0 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_1 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_2 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_3 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_4 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_5 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_6 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_7 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_8 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_9 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_10 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_11 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_12 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_13 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_14 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_15 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_16 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_17 - unit_icon_move_Civilian_F2_frame_list)
	.2byte (unit_icon_move_Civilian_F2_frame_18 - unit_icon_move_Civilian_F2_frame_list)

unit_icon_move_Civilian_F2_anim_list: @ +$2A
	.2byte (unit_icon_move_Civilian_F2_anim_0 - unit_icon_move_Civilian_F2_anim_list)
	.2byte (unit_icon_move_Civilian_F2_anim_1 - unit_icon_move_Civilian_F2_anim_list)
	.2byte (unit_icon_move_Civilian_F2_anim_2 - unit_icon_move_Civilian_F2_anim_list)
	.2byte (unit_icon_move_Civilian_F2_anim_3 - unit_icon_move_Civilian_F2_anim_list)
	.2byte (unit_icon_move_Civilian_F2_anim_4 - unit_icon_move_Civilian_F2_anim_list)

unit_icon_move_Civilian_F2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Civilian_F2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Civilian_F2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Peer_sheet
unit_icon_move_Peer_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Peer_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Peer_motion
unit_icon_move_Peer_motion:
	.2byte (unit_icon_move_Peer_frame_list - unit_icon_move_Peer_motion), (unit_icon_move_Peer_anim_list - unit_icon_move_Peer_motion) @ header

unit_icon_move_Peer_frame_list: @ +$4
	.2byte (unit_icon_move_Peer_frame_0 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_1 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_2 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_3 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_4 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_5 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_6 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_7 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_8 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_9 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_10 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_11 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_12 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_13 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_14 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_15 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_16 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_17 - unit_icon_move_Peer_frame_list)
	.2byte (unit_icon_move_Peer_frame_18 - unit_icon_move_Peer_frame_list)

unit_icon_move_Peer_anim_list: @ +$2A
	.2byte (unit_icon_move_Peer_anim_0 - unit_icon_move_Peer_anim_list)
	.2byte (unit_icon_move_Peer_anim_1 - unit_icon_move_Peer_anim_list)
	.2byte (unit_icon_move_Peer_anim_2 - unit_icon_move_Peer_anim_list)
	.2byte (unit_icon_move_Peer_anim_3 - unit_icon_move_Peer_anim_list)
	.2byte (unit_icon_move_Peer_anim_4 - unit_icon_move_Peer_anim_list)

unit_icon_move_Peer_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Peer_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Peer_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Peer_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Peer_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Peer_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Peer_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Peer_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Peer_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Peer_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Peer_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Peer_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Peer_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Peer_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Peer_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Peer_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Peer_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Peer_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Peer_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Peer_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Peer_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Peer_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Peer_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Peer_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Queen_sheet
unit_icon_move_Queen_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Queen_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Queen_motion
unit_icon_move_Queen_motion:
	.2byte (unit_icon_move_Queen_frame_list - unit_icon_move_Queen_motion), (unit_icon_move_Queen_anim_list - unit_icon_move_Queen_motion) @ header

unit_icon_move_Queen_frame_list: @ +$4
	.2byte (unit_icon_move_Queen_frame_0 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_1 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_2 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_3 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_4 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_5 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_6 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_7 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_8 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_9 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_10 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_11 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_12 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_13 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_14 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_15 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_16 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_17 - unit_icon_move_Queen_frame_list)
	.2byte (unit_icon_move_Queen_frame_18 - unit_icon_move_Queen_frame_list)

unit_icon_move_Queen_anim_list: @ +$2A
	.2byte (unit_icon_move_Queen_anim_0 - unit_icon_move_Queen_anim_list)
	.2byte (unit_icon_move_Queen_anim_1 - unit_icon_move_Queen_anim_list)
	.2byte (unit_icon_move_Queen_anim_2 - unit_icon_move_Queen_anim_list)
	.2byte (unit_icon_move_Queen_anim_3 - unit_icon_move_Queen_anim_list)
	.2byte (unit_icon_move_Queen_anim_4 - unit_icon_move_Queen_anim_list)

unit_icon_move_Queen_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Queen_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Queen_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Queen_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Queen_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Queen_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Queen_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Queen_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Queen_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Queen_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Queen_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Queen_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Queen_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Queen_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Queen_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Queen_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Queen_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Queen_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Queen_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Queen_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Prince_sheet
unit_icon_move_Prince_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Prince_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Prince_motion
unit_icon_move_Prince_motion:
	.2byte (unit_icon_move_Prince_frame_list - unit_icon_move_Prince_motion), (unit_icon_move_Prince_anim_list - unit_icon_move_Prince_motion) @ header

unit_icon_move_Prince_frame_list: @ +$4
	.2byte (unit_icon_move_Prince_frame_0 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_1 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_2 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_3 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_4 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_5 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_6 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_7 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_8 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_9 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_10 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_11 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_12 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_13 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_14 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_15 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_16 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_17 - unit_icon_move_Prince_frame_list)
	.2byte (unit_icon_move_Prince_frame_18 - unit_icon_move_Prince_frame_list)

unit_icon_move_Prince_anim_list: @ +$2A
	.2byte (unit_icon_move_Prince_anim_0 - unit_icon_move_Prince_anim_list)
	.2byte (unit_icon_move_Prince_anim_1 - unit_icon_move_Prince_anim_list)
	.2byte (unit_icon_move_Prince_anim_2 - unit_icon_move_Prince_anim_list)
	.2byte (unit_icon_move_Prince_anim_3 - unit_icon_move_Prince_anim_list)
	.2byte (unit_icon_move_Prince_anim_4 - unit_icon_move_Prince_anim_list)

unit_icon_move_Prince_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Prince_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Prince_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Prince_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Prince_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Prince_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Prince_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Prince_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Prince_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Prince_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Prince_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Prince_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Prince_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Prince_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Prince_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Prince_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Prince_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Prince_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Prince_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Prince_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Prince_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Prince_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Prince_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Prince_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Queen_2_sheet
unit_icon_move_Queen_2_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Queen_2_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Queen_2_motion
unit_icon_move_Queen_2_motion:
	.2byte (unit_icon_move_Queen_2_frame_list - unit_icon_move_Queen_2_motion), (unit_icon_move_Queen_2_anim_list - unit_icon_move_Queen_2_motion) @ header

unit_icon_move_Queen_2_frame_list: @ +$4
	.2byte (unit_icon_move_Queen_2_frame_0 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_1 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_2 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_3 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_4 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_5 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_6 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_7 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_8 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_9 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_10 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_11 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_12 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_13 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_14 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_15 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_16 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_17 - unit_icon_move_Queen_2_frame_list)
	.2byte (unit_icon_move_Queen_2_frame_18 - unit_icon_move_Queen_2_frame_list)

unit_icon_move_Queen_2_anim_list: @ +$2A
	.2byte (unit_icon_move_Queen_2_anim_0 - unit_icon_move_Queen_2_anim_list)
	.2byte (unit_icon_move_Queen_2_anim_1 - unit_icon_move_Queen_2_anim_list)
	.2byte (unit_icon_move_Queen_2_anim_2 - unit_icon_move_Queen_2_anim_list)
	.2byte (unit_icon_move_Queen_2_anim_3 - unit_icon_move_Queen_2_anim_list)
	.2byte (unit_icon_move_Queen_2_anim_4 - unit_icon_move_Queen_2_anim_list)

unit_icon_move_Queen_2_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Queen_2_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Queen_2_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_2_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_2_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_2_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Queen_2_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Unk77_sheet
unit_icon_move_Unk77_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Unk77_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Unk77_motion
unit_icon_move_Unk77_motion:
	.2byte (unit_icon_move_Unk77_frame_list - unit_icon_move_Unk77_motion), (unit_icon_move_Unk77_anim_list - unit_icon_move_Unk77_motion) @ header

unit_icon_move_Unk77_frame_list: @ +$4
	.2byte (unit_icon_move_Unk77_frame_0 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_1 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_2 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_3 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_4 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_5 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_6 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_7 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_8 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_9 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_10 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_11 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_12 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_13 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_14 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_15 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_16 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_17 - unit_icon_move_Unk77_frame_list)
	.2byte (unit_icon_move_Unk77_frame_18 - unit_icon_move_Unk77_frame_list)

unit_icon_move_Unk77_anim_list: @ +$2A
	.2byte (unit_icon_move_Unk77_anim_0 - unit_icon_move_Unk77_anim_list)
	.2byte (unit_icon_move_Unk77_anim_1 - unit_icon_move_Unk77_anim_list)
	.2byte (unit_icon_move_Unk77_anim_2 - unit_icon_move_Unk77_anim_list)
	.2byte (unit_icon_move_Unk77_anim_3 - unit_icon_move_Unk77_anim_list)
	.2byte (unit_icon_move_Unk77_anim_4 - unit_icon_move_Unk77_anim_list)

unit_icon_move_Unk77_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Unk77_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Unk77_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Unk77_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Unk77_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Unk77_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Unk77_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Unk77_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Unk77_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Unk77_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Unk77_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Unk77_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Unk77_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Unk77_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Unk77_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Unk77_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Unk77_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Unk77_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Unk77_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Fallen_Prince_sheet
unit_icon_move_Fallen_Prince_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Fallen_Prince_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Fallen_Prince_motion
unit_icon_move_Fallen_Prince_motion:
	.2byte (unit_icon_move_Fallen_Prince_frame_list - unit_icon_move_Fallen_Prince_motion), (unit_icon_move_Fallen_Prince_anim_list - unit_icon_move_Fallen_Prince_motion) @ header

unit_icon_move_Fallen_Prince_frame_list: @ +$4
	.2byte (unit_icon_move_Fallen_Prince_frame_0 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_1 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_2 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_3 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_4 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_5 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_6 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_7 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_8 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_9 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_10 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_11 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_12 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_13 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_14 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_15 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_16 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_17 - unit_icon_move_Fallen_Prince_frame_list)
	.2byte (unit_icon_move_Fallen_Prince_frame_18 - unit_icon_move_Fallen_Prince_frame_list)

unit_icon_move_Fallen_Prince_anim_list: @ +$2A
	.2byte (unit_icon_move_Fallen_Prince_anim_0 - unit_icon_move_Fallen_Prince_anim_list)
	.2byte (unit_icon_move_Fallen_Prince_anim_1 - unit_icon_move_Fallen_Prince_anim_list)
	.2byte (unit_icon_move_Fallen_Prince_anim_2 - unit_icon_move_Fallen_Prince_anim_list)
	.2byte (unit_icon_move_Fallen_Prince_anim_3 - unit_icon_move_Fallen_Prince_anim_list)
	.2byte (unit_icon_move_Fallen_Prince_anim_4 - unit_icon_move_Fallen_Prince_anim_list)

unit_icon_move_Fallen_Prince_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Fallen_Prince_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Prince_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Prince_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Prince_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Prince_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Tent_sheet
unit_icon_move_Tent_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Tent_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Tent_motion
unit_icon_move_Tent_motion:
	.2byte (unit_icon_move_Tent_frame_list - unit_icon_move_Tent_motion), (unit_icon_move_Tent_anim_list - unit_icon_move_Tent_motion) @ header

unit_icon_move_Tent_frame_list: @ +$4
	.2byte (unit_icon_move_Tent_frame_0 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_1 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_2 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_3 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_4 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_5 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_6 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_7 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_8 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_9 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_10 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_11 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_12 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_13 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_14 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_15 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_16 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_17 - unit_icon_move_Tent_frame_list)
	.2byte (unit_icon_move_Tent_frame_18 - unit_icon_move_Tent_frame_list)

unit_icon_move_Tent_anim_list: @ +$2A
	.2byte (unit_icon_move_Tent_anim_0 - unit_icon_move_Tent_anim_list)
	.2byte (unit_icon_move_Tent_anim_1 - unit_icon_move_Tent_anim_list)
	.2byte (unit_icon_move_Tent_anim_2 - unit_icon_move_Tent_anim_list)
	.2byte (unit_icon_move_Tent_anim_3 - unit_icon_move_Tent_anim_list)
	.2byte (unit_icon_move_Tent_anim_4 - unit_icon_move_Tent_anim_list)

unit_icon_move_Tent_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Tent_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Tent_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Tent_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Tent_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Tent_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Tent_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Tent_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Tent_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Tent_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Tent_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Tent_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Tent_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Tent_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Tent_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Tent_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Tent_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Tent_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Tent_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Tent_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tent_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tent_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tent_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Tent_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Pontifex_sheet
unit_icon_move_Pontifex_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Pontifex_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Pontifex_motion
unit_icon_move_Pontifex_motion:
	.2byte (unit_icon_move_Pontifex_frame_list - unit_icon_move_Pontifex_motion), (unit_icon_move_Pontifex_anim_list - unit_icon_move_Pontifex_motion) @ header

unit_icon_move_Pontifex_frame_list: @ +$4
	.2byte (unit_icon_move_Pontifex_frame_0 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_1 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_2 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_3 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_4 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_5 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_6 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_7 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_8 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_9 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_10 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_11 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_12 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_13 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_14 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_15 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_16 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_17 - unit_icon_move_Pontifex_frame_list)
	.2byte (unit_icon_move_Pontifex_frame_18 - unit_icon_move_Pontifex_frame_list)

unit_icon_move_Pontifex_anim_list: @ +$2A
	.2byte (unit_icon_move_Pontifex_anim_0 - unit_icon_move_Pontifex_anim_list)
	.2byte (unit_icon_move_Pontifex_anim_1 - unit_icon_move_Pontifex_anim_list)
	.2byte (unit_icon_move_Pontifex_anim_2 - unit_icon_move_Pontifex_anim_list)
	.2byte (unit_icon_move_Pontifex_anim_3 - unit_icon_move_Pontifex_anim_list)
	.2byte (unit_icon_move_Pontifex_anim_4 - unit_icon_move_Pontifex_anim_list)

unit_icon_move_Pontifex_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Pontifex_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Pontifex_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pontifex_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pontifex_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pontifex_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Pontifex_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

	.global unit_icon_move_Fallen_Peer_sheet
unit_icon_move_Fallen_Peer_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Fallen_Peer_sheet.4bpp.lz"
	.align 2, 0

	.global unit_icon_move_Fallen_Peer_motion
unit_icon_move_Fallen_Peer_motion:
	.2byte (unit_icon_move_Fallen_Peer_frame_list - unit_icon_move_Fallen_Peer_motion), (unit_icon_move_Fallen_Peer_anim_list - unit_icon_move_Fallen_Peer_motion) @ header

unit_icon_move_Fallen_Peer_frame_list: @ +$4
	.2byte (unit_icon_move_Fallen_Peer_frame_0 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_1 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_2 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_3 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_4 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_5 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_6 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_7 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_8 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_9 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_10 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_11 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_12 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_13 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_14 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_15 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_16 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_17 - unit_icon_move_Fallen_Peer_frame_list)
	.2byte (unit_icon_move_Fallen_Peer_frame_18 - unit_icon_move_Fallen_Peer_frame_list)

unit_icon_move_Fallen_Peer_anim_list: @ +$2A
	.2byte (unit_icon_move_Fallen_Peer_anim_0 - unit_icon_move_Fallen_Peer_anim_list)
	.2byte (unit_icon_move_Fallen_Peer_anim_1 - unit_icon_move_Fallen_Peer_anim_list)
	.2byte (unit_icon_move_Fallen_Peer_anim_2 - unit_icon_move_Fallen_Peer_anim_list)
	.2byte (unit_icon_move_Fallen_Peer_anim_3 - unit_icon_move_Fallen_Peer_anim_list)
	.2byte (unit_icon_move_Fallen_Peer_anim_4 - unit_icon_move_Fallen_Peer_anim_list)

unit_icon_move_Fallen_Peer_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Fallen_Peer_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Peer_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Peer_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Peer_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fallen_Peer_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0
