@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6D
	.global banim_sagm_mg1_2_oam_frame_0_l
	.global banim_sagm_mg1_2_oam_frame_1_l
	.global banim_sagm_mg1_2_oam_frame_3_l
	.global banim_sagm_mg1_2_oam_frame_4_l
	.global banim_sagm_mg1_2_oam_frame_5_l
	.global banim_sagm_mg1_2_oam_frame_2_l
	.section .data
banim_sagm_mg1_2_oam_l:
banim_sagm_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0xCC, 6, -16
	banim_frame_oam 0x0, 0x1000, 0xEC, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, 4, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, 4, 0
	banim_frame_oam 0x0, 0x1000, 0xCD, -2, -16
	banim_frame_oam 0x0, 0x5000, 0x21, 0, -8
	banim_frame_oam 0xF000, 0x1000, 0x23, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x61, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 16, 0
	banim_frame_oam 0xF000, 0x1000, 0x0, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x60, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x1, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x14, -11, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0xAF, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0xEF, -14, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, 2, -16
	banim_frame_oam 0x0, 0x1000, 0x91, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x92, -2, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, 10, -19
	banim_frame_oam 0x0, 0x1000, 0xCE, 10, -11
	banim_frame_oam 0x0, 0x1000, 0x14, -10, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0xB3, -12, -8
	banim_frame_oam 0x4000, 0x5000, 0xF3, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x93, 2, -16
	banim_frame_oam 0x0, 0x1000, 0x95, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -6, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, 11, -25
	banim_frame_oam 0x0, 0x1000, 0xCE, 11, -17
	banim_frame_oam 0x0, 0x1000, 0xB7, -20, 1
	banim_frame_end
banim_sagm_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x4000, 0xF000, 0xAE, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0xEE, -14, 8
	banim_frame_oam 0x4000, 0x1000, 0xCC, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x8E, 0, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x69, 10, 8
	banim_frame_oam 0x0, 0x1000, 0xD, -22, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -10, -24
	banim_frame_oam 0x0, 0x1000, 0x6A, 2, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -14, 8
	banim_frame_oam 0x0, 0x5000, 0x4D, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0x2D, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x2F, -25, -16
	banim_frame_oam 0x0, 0x1000, 0x4F, -17, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -6, 0
	banim_frame_oam 0xF000, 0x1000, 0x29, 10, -8
	banim_frame_end
banim_sagm_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
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
