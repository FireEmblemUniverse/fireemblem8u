.section .data

	.global gWarpPrepUnitSwapCursorAp
gWarpPrepUnitSwapCursorAp:  @ 0x085A0EA0
g085A0EA0_motion:
	.2byte (g085A0EA0_frame_list - g085A0EA0_motion), (g085A0EA0_anim_list - g085A0EA0_motion) @ header

g085A0EA0_frame_list: @ +$4
	.2byte (g085A0EA0_frame_0 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_1 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_2 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_3 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_4 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_5 - g085A0EA0_frame_list)
	.2byte (g085A0EA0_frame_6 - g085A0EA0_frame_list)

g085A0EA0_anim_list: @ +$12
	.2byte (g085A0EA0_anim_0 - g085A0EA0_anim_list)
	.2byte (g085A0EA0_anim_1 - g085A0EA0_anim_list)

g085A0EA0_frame_0: @ +$16
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xCC
	.2byte 5 @ oam entries
	.2byte 0x1F7, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_frame_1: @ +$3E
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xE6
	.2byte 5 @ oam entries
	.2byte 0x1F5, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_frame_2: @ +$66
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x100
	.2byte 5 @ oam entries
	.2byte 0x1F4, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_frame_3: @ +$8E
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x100
	.2byte 5 @ oam entries
	.2byte 0x1F3, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_frame_4: @ +$B6
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x100
	.2byte 5 @ oam entries
	.2byte 0x1F2, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_frame_5: @ +$DE
	.2byte 5 @ oam entries
	.2byte 0xF6, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x25 @ OAM Data #1
	.2byte 0x8, 0x2000, 0x25 @ OAM Data #2
	.2byte 0x0, 0x1008, 0x25 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x25 @ OAM Data #4

g085A0EA0_frame_6: @ +$FE
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x100
	.2byte 5 @ oam entries
	.2byte 0x1F6, 0x4000, 0x6 @ OAM Data #0
	.2byte 0x0, 0x0, 0x5 @ OAM Data #1
	.2byte 0x0, 0x1008, 0x5 @ OAM Data #2
	.2byte 0x8, 0x2000, 0x5 @ OAM Data #3
	.2byte 0x8, 0x3008, 0x5 @ OAM Data #4

g085A0EA0_anim_0: @ +$126
	.2byte  4,  0
	.2byte  3,  1
	.2byte  1,  2
	.2byte  3,  3
	.2byte  4,  4
	.2byte  3,  3
	.2byte  1,  2
	.2byte  3,  1

	.2byte 0, (-1) @ loop back to start

g085A0EA0_anim_1: @ +$14A
	.2byte 30,  5
	.2byte  8,  6

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
.L_end_gUnknown_085A0EA0:
	.if (.L_end_gUnknown_085A0EA0 - gWarpPrepUnitSwapCursorAp) != 344
	.error "gWarpPrepUnitSwapCursorAp size mismatch"
	.endif
