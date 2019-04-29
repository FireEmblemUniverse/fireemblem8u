@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x21
	.global banim_banm_ax1_3_oam_frame_0_r
	.global banim_banm_ax1_3_oam_frame_2_r
	.global banim_banm_ax1_3_oam_frame_1_r
	.section .data
banim_banm_ax1_3_oam_r:
banim_banm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -12, -16
	banim_frame_oam 0x0, 0x0, 0x4, -4, -24
	banim_frame_end
banim_banm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x0, 0x8C, -9, -15
	banim_frame_oam 0x0, 0xF000, 0x16, -1, -15
	banim_frame_oam 0x0, 0x0, 0xCB, -17, -15
	banim_frame_oam 0x4000, 0x0, 0xE9, -17, -7
	banim_frame_oam 0x0, 0x0, 0xC6, -17, 1
	banim_frame_oam 0x0, 0x0, 0xEB, -9, 1
	banim_frame_oam 0x0, 0x0, 0x70, -17, 9
	banim_frame_oam 0x0, 0x0, 0xB7, -9, 9
	banim_frame_end
banim_banm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x1A, -1, -11
	banim_frame_oam 0x4000, 0x4000, 0x5A, -1, 5
	banim_frame_oam 0x0, 0x0, 0xDF, -9, -10
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
