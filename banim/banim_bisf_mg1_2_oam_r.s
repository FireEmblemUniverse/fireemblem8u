@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x83
	.global banim_bisf_mg1_2_oam_frame_0_r
	.global banim_bisf_mg1_2_oam_frame_2_r
	.global banim_bisf_mg1_2_oam_frame_1_r
	.global banim_bisf_mg1_2_oam_frame_3_r
	.global banim_bisf_mg1_2_oam_frame_4_r
	.section .data
banim_bisf_mg1_2_oam_r:
banim_bisf_mg1_2_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x0, -13, -24
	banim_frame_oam 0xF000, 0x4000, 0x2, 3, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -13, 8
	banim_frame_oam 0x0, 0x0, 0x82, 3, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0x0, 0xA0, -22, -24
	banim_frame_oam 0x0, 0x0, 0xE0, -22, -8
	banim_frame_oam 0x0, 0x0, 0xA1, -3, -24
	banim_frame_oam 0xF000, 0xF000, 0x3, -14, -16
	banim_frame_oam 0xF000, 0x4000, 0x5, 2, -16
	banim_frame_oam 0x0, 0x0, 0xC1, 10, -5
	banim_frame_end
banim_bisf_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x83, -24, -24
	banim_frame_oam 0x0, 0x0, 0xA2, 8, -16
	banim_frame_oam 0x4000, 0xF000, 0xC3, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xE1, -7, 8
	banim_frame_oam 0x0, 0x0, 0xC2, -15, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0xE8, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, -2, -6
	banim_frame_oam 0x0, 0x4000, 0xDD, -3, -9
	banim_frame_oam 0x4000, 0x0, 0xBE, 5, -17
	banim_frame_oam 0xF000, 0xF000, 0x6, -13, -18
	banim_frame_oam 0xF000, 0x4000, 0x8, 3, -18
	banim_frame_oam 0x0, 0x0, 0x87, -3, -26
	banim_frame_end
banim_bisf_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0xE8, 5, -14
	banim_frame_oam 0x0, 0x0, 0xC7, 1, -11
	banim_frame_oam 0x0, 0x4000, 0xDD, -2, -13
	banim_frame_oam 0x4000, 0x0, 0xBE, 6, -21
	banim_frame_oam 0xF000, 0xF000, 0x9, -15, -19
	banim_frame_oam 0xF000, 0x4000, 0xB, 1, -19
	banim_frame_oam 0x0, 0x0, 0xA7, -3, -27
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
