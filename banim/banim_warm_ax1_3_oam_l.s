@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1E
	.global banim_warm_ax1_3_oam_frame_0_l
	.global banim_warm_ax1_3_oam_frame_2_l
	.global banim_warm_ax1_3_oam_frame_1_l
	.section .data
banim_warm_ax1_3_oam_l:
banim_warm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x0, -7, -32
	banim_frame_oam 0xF000, 0x5000, 0x4, -15, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -7, 0
	banim_frame_oam 0xF000, 0x1000, 0x84, -15, 0
	banim_frame_end
banim_warm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0xB0, -28, -23
	banim_frame_oam 0x0, 0x1000, 0xAF, -28, -15
	banim_frame_oam 0x0, 0x1000, 0xAE, -27, -7
	banim_frame_oam 0x4000, 0x1000, 0xAC, -28, 1
	banim_frame_oam 0x4000, 0xF000, 0x88, -17, 1
	banim_frame_oam 0xF000, 0xF000, 0x8, -1, -31
	banim_frame_oam 0xF000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0xF000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
	banim_frame_end
banim_warm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0x88, -17, 1
	banim_frame_oam 0xF000, 0xF000, 0x8, -1, -31
	banim_frame_oam 0xF000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0xF000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
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
