@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x83
	.global banim_bisf_mg1_2_oam_frame_0_l
	.global banim_bisf_mg1_2_oam_frame_2_l
	.global banim_bisf_mg1_2_oam_frame_1_l
	.global banim_bisf_mg1_2_oam_frame_3_l
	.global banim_bisf_mg1_2_oam_frame_4_l
	.section .data
banim_bisf_mg1_2_oam_l:
banim_bisf_mg1_2_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x0, -3, -24
	banim_frame_oam 0xF000, 0x5000, 0x2, -11, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -3, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -11, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0x1000, 0xA0, 14, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, 14, -8
	banim_frame_oam 0x0, 0x1000, 0xA1, -5, -24
	banim_frame_oam 0xF000, 0xF000, 0x3, -2, -16
	banim_frame_oam 0xF000, 0x5000, 0x5, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xC1, -18, -5
	banim_frame_end
banim_bisf_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0x83, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA2, -16, -16
	banim_frame_oam 0x4000, 0xF000, 0xC3, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -9, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, 7, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, -10, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -6, -6
	banim_frame_oam 0x0, 0x5000, 0xDD, -13, -9
	banim_frame_oam 0x4000, 0x1000, 0xBE, -21, -17
	banim_frame_oam 0xF000, 0xF000, 0x6, -3, -18
	banim_frame_oam 0xF000, 0x5000, 0x8, -11, -18
	banim_frame_oam 0x0, 0x1000, 0x87, -5, -26
	banim_frame_end
banim_bisf_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, -13, -14
	banim_frame_oam 0x0, 0x1000, 0xC7, -9, -11
	banim_frame_oam 0x0, 0x5000, 0xDD, -14, -13
	banim_frame_oam 0x4000, 0x1000, 0xBE, -22, -21
	banim_frame_oam 0xF000, 0xF000, 0x9, -1, -19
	banim_frame_oam 0xF000, 0x5000, 0xB, -9, -19
	banim_frame_oam 0x0, 0x1000, 0xA7, -5, -27
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
