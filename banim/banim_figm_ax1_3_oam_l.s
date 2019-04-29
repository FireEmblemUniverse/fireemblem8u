@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1A
	.global banim_figm_ax1_3_oam_frame_0_l
	.global banim_figm_ax1_3_oam_frame_1_l
	.global banim_figm_ax1_3_oam_frame_2_l
	.section .data
banim_figm_ax1_3_oam_l:
banim_figm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x43, -19, -14
	banim_frame_oam 0x0, 0x5000, 0xCF, -3, 2
	banim_frame_oam 0x0, 0x5000, 0xCD, -3, -14
	banim_frame_oam 0x4000, 0x1000, 0xC2, -10, -22
	banim_frame_oam 0x0, 0x1000, 0xA0, 13, 10
	banim_frame_end
banim_figm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0xCA, 0, -1
	banim_frame_oam 0xF000, 0x1000, 0xCC, -8, -1
	banim_frame_oam 0x4000, 0x1000, 0xF1, 0, -9
	banim_frame_oam 0x0, 0x1000, 0xF3, -8, -9
	banim_frame_oam 0x0, 0x5000, 0x1C, 0, -25
	banim_frame_oam 0xF000, 0x1000, 0x1E, -8, -25
	banim_frame_end
banim_figm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x96, 11, -1
	banim_frame_oam 0x4000, 0x5000, 0xE5, -5, -9
	banim_frame_oam 0x0, 0x1000, 0xE9, -5, -17
	banim_frame_oam 0x4000, 0x1000, 0xE2, 11, -17
	banim_frame_oam 0x0, 0x1000, 0xE4, 3, -17
	banim_frame_oam 0x4000, 0x1000, 0xE0, 10, -25
	banim_frame_oam 0x4000, 0x1000, 0xF4, 27, -17
	banim_frame_oam 0xF000, 0x1000, 0xD6, 3, -1
	banim_frame_oam 0x0, 0x1000, 0xF7, -5, 7
	banim_frame_oam 0x0, 0x1000, 0xD7, 27, 7
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
