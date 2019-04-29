@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1E
	.global banim_warm_ax1_3_oam_frame_0_r
	.global banim_warm_ax1_3_oam_frame_2_r
	.global banim_warm_ax1_3_oam_frame_1_r
	.section .data
banim_warm_ax1_3_oam_r:
banim_warm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -25, -32
	banim_frame_oam 0xF000, 0x4000, 0x4, 7, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -25, 0
	banim_frame_oam 0xF000, 0x0, 0x84, 7, 0
	banim_frame_end
banim_warm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0xB0, 12, -23
	banim_frame_oam 0x0, 0x0, 0xAF, 20, -15
	banim_frame_oam 0x0, 0x0, 0xAE, 19, -7
	banim_frame_oam 0x4000, 0x0, 0xAC, 12, 1
	banim_frame_oam 0x4000, 0xF000, 0x88, -15, 1
	banim_frame_oam 0xF000, 0xF000, 0x8, -15, -31
	banim_frame_oam 0xF000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0xF000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_end
banim_warm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x88, -15, 1
	banim_frame_oam 0xF000, 0xF000, 0x8, -15, -31
	banim_frame_oam 0xF000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0xF000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
