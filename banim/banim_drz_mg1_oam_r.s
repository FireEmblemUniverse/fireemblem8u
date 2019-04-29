@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC0
	.global banim_drz_mg1_oam_frame_0_r
	.global banim_drz_mg1_oam_frame_9_r
	.global banim_drz_mg1_oam_frame_4_r
	.global banim_drz_mg1_oam_frame_10_r
	.global banim_drz_mg1_oam_frame_12_r
	.global banim_drz_mg1_oam_frame_3_r
	.global banim_drz_mg1_oam_frame_13_r
	.global banim_drz_mg1_oam_frame_6_r
	.global banim_drz_mg1_oam_frame_2_r
	.global banim_drz_mg1_oam_frame_7_r
	.global banim_drz_mg1_oam_frame_8_r
	.global banim_drz_mg1_oam_frame_1_r
	.global banim_drz_mg1_oam_frame_11_r
	.global banim_drz_mg1_oam_frame_5_r
	.section .data
banim_drz_mg1_oam_r:
banim_drz_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x4, -23, -76
	banim_frame_oam 0xF000, 0xF000, 0x8, 9, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -23, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 9, -44
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_1_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x100, 0xF000, 0x18, -39, -94
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_2_r:
	banim_frame_affine 240, 87, -87, 240, 1
	banim_frame_oam 0x100, 0xF000, 0x18, -39, -96
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0xF000, 0xA0, -25, -82
	banim_frame_oam 0x0, 0x4000, 0xA4, 7, -82
	banim_frame_oam 0x4000, 0x4000, 0xE0, -25, -66
	banim_frame_oam 0x4000, 0x0, 0xE4, 7, -66
	banim_frame_oam 0x4000, 0xF000, 0xA6, -17, -58
	banim_frame_oam 0x0, 0x4000, 0xAA, 15, -58
	banim_frame_oam 0x0, 0x0, 0xE6, 23, -66
	banim_frame_oam 0xF000, 0xF000, 0xD, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xF, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0xF000, 0xA0, -27, -83
	banim_frame_oam 0x0, 0x4000, 0xA4, 5, -83
	banim_frame_oam 0x4000, 0x4000, 0xE0, -27, -67
	banim_frame_oam 0x4000, 0x0, 0xE4, 5, -67
	banim_frame_oam 0x4000, 0xF000, 0xA6, -19, -59
	banim_frame_oam 0x0, 0x4000, 0xAA, 13, -59
	banim_frame_oam 0x0, 0x0, 0xE6, 21, -67
	banim_frame_oam 0xF000, 0xF000, 0x1, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0x3, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0xF000, 0xA0, -28, -84
	banim_frame_oam 0x0, 0x4000, 0xA4, 4, -84
	banim_frame_oam 0x4000, 0x4000, 0xE0, -28, -68
	banim_frame_oam 0x4000, 0x0, 0xE4, 4, -68
	banim_frame_oam 0x4000, 0xF000, 0xA6, -20, -60
	banim_frame_oam 0x0, 0x4000, 0xAA, 12, -60
	banim_frame_oam 0xF000, 0xF000, 0x1, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0x3, -10, -49
	banim_frame_oam 0x4000, 0x1000, 0x82, -10, -57
	banim_frame_end
banim_drz_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0xF000, 0x8C, -21, -81
	banim_frame_oam 0xF000, 0xF000, 0x90, 11, -81
	banim_frame_oam 0x0, 0x0, 0xF2, 27, -57
	banim_frame_oam 0x4000, 0x4000, 0x92, -13, -49
	banim_frame_oam 0x0, 0x0, 0x96, 19, -49
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0xF000, 0x8C, -20, -80
	banim_frame_oam 0xF000, 0xF000, 0x90, 12, -80
	banim_frame_oam 0x0, 0x0, 0xF2, 28, -56
	banim_frame_oam 0x4000, 0x4000, 0x92, -12, -48
	banim_frame_oam 0x0, 0x0, 0x96, 20, -48
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_8_r:
	banim_frame_affine 240, 87, -87, 240, 1
	banim_frame_oam 0x100, 0xF000, 0x18, -39, -94
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_9_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x100, 0xF000, 0x18, -39, -94
	banim_frame_oam 0xF000, 0xF000, 0xA, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_drz_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_drz_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0xF000, 0x4, -19, -76
	banim_frame_oam 0xF000, 0xF000, 0x8, 13, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -19, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 13, -44
	banim_frame_oam 0xF000, 0xF000, 0x11, -2, -49
	banim_frame_oam 0xF000, 0x5000, 0x13, -10, -49
	banim_frame_oam 0xF000, 0x5000, 0x10, 14, -49
	banim_frame_end
banim_drz_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0xF000, 0x4, -17, -76
	banim_frame_oam 0xF000, 0xF000, 0x8, 15, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -17, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 15, -44
	banim_frame_oam 0x0, 0xF000, 0x14, -10, -49
	banim_frame_end
	banim_frame_end
