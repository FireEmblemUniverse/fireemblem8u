@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1A
	.global banim_figm_ax1_3_oam_frame_0_r
	.global banim_figm_ax1_3_oam_frame_1_r
	.global banim_figm_ax1_3_oam_frame_2_r
	.section .data
banim_figm_ax1_3_oam_r:
banim_figm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x43, 3, -14
	banim_frame_oam 0x0, 0x4000, 0xCF, -13, 2
	banim_frame_oam 0x0, 0x4000, 0xCD, -13, -14
	banim_frame_oam 0x4000, 0x0, 0xC2, -6, -22
	banim_frame_oam 0x0, 0x0, 0xA0, -21, 10
	banim_frame_end
banim_figm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0xCA, -16, -1
	banim_frame_oam 0xF000, 0x0, 0xCC, 0, -1
	banim_frame_oam 0x4000, 0x0, 0xF1, -16, -9
	banim_frame_oam 0x0, 0x0, 0xF3, 0, -9
	banim_frame_oam 0x0, 0x4000, 0x1C, -16, -25
	banim_frame_oam 0xF000, 0x0, 0x1E, 0, -25
	banim_frame_end
banim_figm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x96, -27, -1
	banim_frame_oam 0x4000, 0x4000, 0xE5, -27, -9
	banim_frame_oam 0x0, 0x0, 0xE9, -3, -17
	banim_frame_oam 0x4000, 0x0, 0xE2, -27, -17
	banim_frame_oam 0x0, 0x0, 0xE4, -11, -17
	banim_frame_oam 0x4000, 0x0, 0xE0, -26, -25
	banim_frame_oam 0x4000, 0x0, 0xF4, -43, -17
	banim_frame_oam 0xF000, 0x0, 0xD6, -11, -1
	banim_frame_oam 0x0, 0x0, 0xF7, -3, 7
	banim_frame_oam 0x0, 0x0, 0xD7, -35, 7
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
