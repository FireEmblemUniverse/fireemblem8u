.section .data

	.global gSaveScreen_0
gSaveScreen_0:  @ 0x08A280A8
gSaveScreen_motion:
	.2byte (gSaveScreen_frame_list - gSaveScreen_motion), (gSaveScreen_anim_list - gSaveScreen_motion) @ header

gSaveScreen_frame_list: @ +$4
	.2byte (gSaveScreen_frame_0 - gSaveScreen_frame_list)
	.2byte (gSaveScreen_frame_1 - gSaveScreen_frame_list)
	.2byte (gSaveScreen_frame_2 - gSaveScreen_frame_list)
	.2byte (gSaveScreen_frame_3 - gSaveScreen_frame_list)
	.2byte (gSaveScreen_frame_4 - gSaveScreen_frame_list)
	.2byte (gSaveScreen_frame_5 - gSaveScreen_frame_list)

gSaveScreen_anim_list: @ +$10
	.2byte (gSaveScreen_anim_0 - gSaveScreen_anim_list)

gSaveScreen_frame_0: @ +$12
	.2byte 2 @ oam entries
	.2byte 0x40F0, 0x81F0, 0x4 @ OAM Data #0
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #1

gSaveScreen_frame_1: @ +$20
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0x8 @ OAM Data #1

gSaveScreen_frame_2: @ +$2E
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0xC @ OAM Data #1

gSaveScreen_frame_3: @ +$3C
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0x10 @ OAM Data #1

gSaveScreen_frame_4: @ +$4A
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0x14 @ OAM Data #1

gSaveScreen_frame_5: @ +$58
	.2byte 2 @ oam entries
	.2byte 0x4000, 0x41F0, 0x0 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0x18 @ OAM Data #1

gSaveScreen_anim_0: @ +$66
	.2byte  8,  0
	.2byte  9,  1
	.2byte 10,  2
	.2byte 15,  3
	.2byte 10,  4
	.2byte 60,  5

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_gUnknown_08A280A8:
	.if (.L_end_gUnknown_08A280A8 - gSaveScreen_0) != 132
	.error "gSaveScreen_0 size mismatch"
	.endif
