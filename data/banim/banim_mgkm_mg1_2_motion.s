@ vim:ft=armv4
	.global banim_mgkm_mg1_2_script
	.global banim_mgkm_mg1_2_oam_r
	.global banim_mgkm_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x71
	.section .data.oam_l
banim_mgkm_mg1_2_oam_l:
banim_mgkm_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -18, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -26, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -18, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -26, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -18, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -26, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -12, -40
	banim_frame_oam 0x8000, 0x9000, 0xF, -28, -40
	banim_frame_oam 0x4000, 0x9000, 0x8B, -12, -8
	banim_frame_oam 0x0, 0x5000, 0x8F, -28, -8
	banim_frame_oam 0x4000, 0x5000, 0xCB, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xCF, -28, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -18, -40
	banim_frame_oam 0x8000, 0x9000, 0x15, -34, -40
	banim_frame_oam 0x4000, 0x9000, 0x91, -18, -8
	banim_frame_oam 0x0, 0x5000, 0x95, -34, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, -18, 8
	banim_frame_oam 0x4000, 0x1000, 0xD5, -34, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -22, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, -30, -40
	banim_frame_oam 0x4000, 0x9000, 0x97, -22, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, -30, -8
	banim_frame_oam 0x4000, 0x5000, 0xD7, -22, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, -30, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, -10, -46
	banim_frame_oam 0x0, 0x5000, 0x88, -10, -14
	banim_frame_oam 0x0, 0x9000, 0x0, -21, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -29, 8
	banim_frame_oam 0x8000, 0x1000, 0xC8, -18, -30
	banim_frame_oam 0x0, 0x1000, 0xE3, 6, -22
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0xA3, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xA5, -16, -14
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -38
	banim_frame_oam 0x8000, 0x1000, 0xA2, -16, -38
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -22
	banim_frame_oam 0x0, 0x1000, 0xE2, -16, -22
	banim_frame_oam 0x0, 0x9000, 0x0, -21, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -29, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -10, -38
	banim_frame_oam 0x8000, 0x5000, 0x7, -18, -38
	banim_frame_oam 0x4000, 0x1000, 0x85, -10, -6
	banim_frame_oam 0x0, 0x1000, 0x87, -18, -6
	banim_frame_oam 0x0, 0x5000, 0xA6, -10, -54
	banim_frame_oam 0x0, 0x9000, 0x0, -21, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -29, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, 6, -22
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -19, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, -27, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, -19, -8
	banim_frame_oam 0x8000, 0x1000, 0x8E, -27, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -27, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -17, -42
	banim_frame_oam 0x4000, 0x9000, 0x8F, -17, -10
	banim_frame_oam 0x4000, 0x5000, 0xCF, -17, 6
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -48
	banim_frame_oam 0x4000, 0x9000, 0x93, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xD3, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF4, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -16, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -20, -40
	banim_frame_oam 0x4000, 0x9000, 0x97, -20, -8
	banim_frame_oam 0x4000, 0x5000, 0xD7, -20, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -17, -40
	banim_frame_oam 0x4000, 0x9000, 0x9B, -17, -8
	banim_frame_oam 0x8000, 0x1000, 0x9F, -25, -8
	banim_frame_oam 0x4000, 0x5000, 0xDB, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xDF, -25, 8
	banim_frame_oam 0x8000, 0x1000, 0x5F, -24, -24
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0xA6, -4, -40
	banim_frame_oam 0x8000, 0x1000, 0xA8, -12, -40
	banim_frame_oam 0x4000, 0x1000, 0xE6, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xE8, -12, -24
	banim_frame_oam 0x0, 0x1000, 0xC5, 4, -48
	banim_frame_oam 0x0, 0x5000, 0xC9, -4, -16
	banim_frame_oam 0x0, 0x9000, 0x5, -14, -23
	banim_frame_oam 0x8000, 0x5000, 0x9, -22, -23
	banim_frame_oam 0x4000, 0x5000, 0x85, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xE0, 12, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, 7, -15
	banim_frame_oam 0x8000, 0x1000, 0xB0, 15, -7
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, -1, -41
	banim_frame_oam 0x8000, 0x1000, 0xAD, -9, -41
	banim_frame_oam 0x4000, 0x1000, 0xEB, -1, -25
	banim_frame_oam 0x0, 0x1000, 0xED, -9, -25
	banim_frame_oam 0x0, 0x1000, 0xAE, 7, -49
	banim_frame_oam 0x0, 0x5000, 0xCE, -1, -17
	banim_frame_oam 0x0, 0x9000, 0xA, -11, -25
	banim_frame_oam 0x8000, 0x5000, 0xE, -19, -25
	banim_frame_oam 0x4000, 0x5000, 0x8A, -11, 7
	banim_frame_oam 0x0, 0x1000, 0x8E, -19, 7
	banim_frame_oam 0x4000, 0x1000, 0xA9, -19, -33
	banim_frame_oam 0x0, 0x1000, 0xE0, 15, -24
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_mgkm_mg1_2_oam_r:
banim_mgkm_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -14, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 18, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 18, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -14, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 18, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -20, -40
	banim_frame_oam 0x8000, 0x8000, 0xF, 12, -40
	banim_frame_oam 0x4000, 0x8000, 0x8B, -20, -8
	banim_frame_oam 0x0, 0x4000, 0x8F, 12, -8
	banim_frame_oam 0x4000, 0x4000, 0xCB, -20, 8
	banim_frame_oam 0x4000, 0x0, 0xCF, 12, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -14, -40
	banim_frame_oam 0x8000, 0x8000, 0x15, 18, -40
	banim_frame_oam 0x4000, 0x8000, 0x91, -14, -8
	banim_frame_oam 0x0, 0x4000, 0x95, 18, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -14, 8
	banim_frame_oam 0x4000, 0x0, 0xD5, 18, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -10, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, 22, -40
	banim_frame_oam 0x4000, 0x8000, 0x97, -10, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, 22, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -10, 8
	banim_frame_oam 0x0, 0x0, 0xDB, 22, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -6, -46
	banim_frame_oam 0x0, 0x4000, 0x88, -6, -14
	banim_frame_oam 0x0, 0x8000, 0x0, -11, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x0, 0x84, 21, 8
	banim_frame_oam 0x8000, 0x0, 0xC8, 10, -30
	banim_frame_oam 0x0, 0x0, 0xE3, -14, -22
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xA3, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xA5, 8, -14
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -38
	banim_frame_oam 0x8000, 0x0, 0xA2, 8, -38
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -22
	banim_frame_oam 0x0, 0x0, 0xE2, 8, -22
	banim_frame_oam 0x0, 0x8000, 0x0, -11, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x0, 0x84, 21, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -6, -38
	banim_frame_oam 0x8000, 0x4000, 0x7, 10, -38
	banim_frame_oam 0x4000, 0x0, 0x85, -6, -6
	banim_frame_oam 0x0, 0x0, 0x87, 10, -6
	banim_frame_oam 0x0, 0x4000, 0xA6, -6, -54
	banim_frame_oam 0x0, 0x8000, 0x0, -11, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x0, 0x84, 21, 8
	banim_frame_oam 0x0, 0x0, 0xE3, -14, -22
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -13, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, 19, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -13, -8
	banim_frame_oam 0x8000, 0x0, 0x8E, 19, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -13, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 19, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -15, -42
	banim_frame_oam 0x4000, 0x8000, 0x8F, -15, -10
	banim_frame_oam 0x4000, 0x4000, 0xCF, -15, 6
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -48
	banim_frame_oam 0x4000, 0x8000, 0x93, -16, -16
	banim_frame_oam 0x4000, 0x4000, 0xD3, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xF4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 8, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -12, -40
	banim_frame_oam 0x4000, 0x8000, 0x97, -12, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -12, 8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -15, -40
	banim_frame_oam 0x4000, 0x8000, 0x9B, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x9F, 17, -8
	banim_frame_oam 0x4000, 0x4000, 0xDB, -15, 8
	banim_frame_oam 0x0, 0x0, 0xDF, 17, 8
	banim_frame_oam 0x8000, 0x0, 0x5F, 16, -24
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0xA6, -12, -40
	banim_frame_oam 0x8000, 0x0, 0xA8, 4, -40
	banim_frame_oam 0x4000, 0x0, 0xE6, -12, -24
	banim_frame_oam 0x0, 0x0, 0xE8, 4, -24
	banim_frame_oam 0x0, 0x0, 0xC5, -12, -48
	banim_frame_oam 0x0, 0x4000, 0xC9, -12, -16
	banim_frame_oam 0x0, 0x8000, 0x5, -18, -23
	banim_frame_oam 0x8000, 0x4000, 0x9, 14, -23
	banim_frame_oam 0x4000, 0x4000, 0x85, -18, 9
	banim_frame_oam 0x0, 0x0, 0xE0, -20, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -23, -15
	banim_frame_oam 0x8000, 0x0, 0xB0, -23, -7
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -15, -41
	banim_frame_oam 0x8000, 0x0, 0xAD, 1, -41
	banim_frame_oam 0x4000, 0x0, 0xEB, -15, -25
	banim_frame_oam 0x0, 0x0, 0xED, 1, -25
	banim_frame_oam 0x0, 0x0, 0xAE, -15, -49
	banim_frame_oam 0x0, 0x4000, 0xCE, -15, -17
	banim_frame_oam 0x0, 0x8000, 0xA, -21, -25
	banim_frame_oam 0x8000, 0x4000, 0xE, 11, -25
	banim_frame_oam 0x4000, 0x4000, 0x8A, -21, 7
	banim_frame_oam 0x0, 0x0, 0x8E, 11, 7
	banim_frame_oam 0x4000, 0x0, 0xA9, 3, -33
	banim_frame_oam 0x0, 0x0, 0xE0, -23, -24
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mgkm_mg1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_mgkm_mg1_2_script:
banim_mgkm_mg1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 1, banim_mgkm_mg1_2_oam_frame_1_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 2, banim_mgkm_mg1_2_oam_frame_2_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 3, banim_mgkm_mg1_2_oam_frame_3_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 4, banim_mgkm_mg1_2_oam_frame_4_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 6, banim_mgkm_mg1_2_oam_frame_6_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 7, banim_mgkm_mg1_2_oam_frame_7_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 8, banim_mgkm_mg1_2_oam_frame_8_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 9, banim_mgkm_mg1_2_oam_frame_9_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 10, banim_mgkm_mg1_2_oam_frame_10_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 12, banim_mgkm_mg1_2_oam_frame_12_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 1, banim_mgkm_mg1_2_oam_frame_1_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 2, banim_mgkm_mg1_2_oam_frame_2_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 3, banim_mgkm_mg1_2_oam_frame_3_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 4, banim_mgkm_mg1_2_oam_frame_4_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 6, banim_mgkm_mg1_2_oam_frame_6_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 7, banim_mgkm_mg1_2_oam_frame_7_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 8, banim_mgkm_mg1_2_oam_frame_8_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 9, banim_mgkm_mg1_2_oam_frame_9_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 10, banim_mgkm_mg1_2_oam_frame_10_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 12, banim_mgkm_mg1_2_oam_frame_12_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 15, banim_mgkm_mg1_2_oam_frame_13_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 16, banim_mgkm_mg1_2_oam_frame_14_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 1, banim_mgkm_mg1_2_oam_frame_1_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 2, banim_mgkm_mg1_2_oam_frame_2_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 3, banim_mgkm_mg1_2_oam_frame_3_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 4, banim_mgkm_mg1_2_oam_frame_4_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 6, banim_mgkm_mg1_2_oam_frame_6_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 7, banim_mgkm_mg1_2_oam_frame_7_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 8, banim_mgkm_mg1_2_oam_frame_8_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 9, banim_mgkm_mg1_2_oam_frame_9_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 10, banim_mgkm_mg1_2_oam_frame_10_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 12, banim_mgkm_mg1_2_oam_frame_12_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 1, banim_mgkm_mg1_2_oam_frame_1_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 2, banim_mgkm_mg1_2_oam_frame_2_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 3, banim_mgkm_mg1_2_oam_frame_3_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 4, banim_mgkm_mg1_2_oam_frame_4_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 6, banim_mgkm_mg1_2_oam_frame_6_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 7, banim_mgkm_mg1_2_oam_frame_7_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 8, banim_mgkm_mg1_2_oam_frame_8_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 9, banim_mgkm_mg1_2_oam_frame_9_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 10, banim_mgkm_mg1_2_oam_frame_10_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 12, banim_mgkm_mg1_2_oam_frame_12_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 13, banim_mgkm_mg1_2_oam_frame_15_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 14, banim_mgkm_mg1_2_oam_frame_16_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 13, banim_mgkm_mg1_2_oam_frame_15_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 13, banim_mgkm_mg1_2_oam_frame_15_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 14, banim_mgkm_mg1_2_oam_frame_16_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 13, banim_mgkm_mg1_2_oam_frame_15_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_2_mode_stand:
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_2_sheet_0, 0, banim_mgkm_mg1_2_oam_frame_0_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 1, banim_mgkm_mg1_2_oam_frame_1_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 2, banim_mgkm_mg1_2_oam_frame_2_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 3, banim_mgkm_mg1_2_oam_frame_3_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_2_sheet_0, 4, banim_mgkm_mg1_2_oam_frame_4_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_2, 6, banim_mgkm_mg1_2_oam_frame_6_r - banim_mgkm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 7, banim_mgkm_mg1_2_oam_frame_7_r - banim_mgkm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 5, banim_mgkm_mg1_2_oam_frame_5_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 8, banim_mgkm_mg1_2_oam_frame_8_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_2, 9, banim_mgkm_mg1_2_oam_frame_9_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_2, 10, banim_mgkm_mg1_2_oam_frame_10_r - banim_mgkm_mg1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 11, banim_mgkm_mg1_2_oam_frame_11_r - banim_mgkm_mg1_2_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 12, banim_mgkm_mg1_2_oam_frame_12_r - banim_mgkm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mgkm_mg1_2_mode_attack_close - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_close_back - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_close_critical - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_close_critical_back - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_range - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_range_critical - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_dodge_close - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_dodge_range - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_stand_close - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_stand - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_stand_range - banim_mgkm_mg1_2_script
	.word banim_mgkm_mg1_2_mode_attack_miss - banim_mgkm_mg1_2_script
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

