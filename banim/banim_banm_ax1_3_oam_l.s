@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x21
	.global banim_banm_ax1_3_oam_frame_0_l
	.global banim_banm_ax1_3_oam_frame_2_l
	.global banim_banm_ax1_3_oam_frame_1_l
	.section .data
banim_banm_ax1_3_oam_l:
banim_banm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x0, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x4, -4, -24
	banim_frame_end
banim_banm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x1000, 0x8C, 1, -15
	banim_frame_oam 0x0, 0xF000, 0x16, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xCB, 9, -15
	banim_frame_oam 0x4000, 0x1000, 0xE9, 1, -7
	banim_frame_oam 0x0, 0x1000, 0xC6, 9, 1
	banim_frame_oam 0x0, 0x1000, 0xEB, 1, 1
	banim_frame_oam 0x0, 0x1000, 0x70, 9, 9
	banim_frame_oam 0x0, 0x1000, 0xB7, 1, 9
	banim_frame_end
banim_banm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0x1A, -31, -11
	banim_frame_oam 0x4000, 0x5000, 0x5A, -31, 5
	banim_frame_oam 0x0, 0x1000, 0xDF, 1, -10
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
