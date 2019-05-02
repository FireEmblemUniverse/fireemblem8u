@ vim:ft=armv4
	.global banim_bism_mg1_2_script
	.global banim_bism_mg1_2_oam_r
	.global banim_bism_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x81
	.section .data.oam_l
banim_bism_mg1_2_oam_l:
banim_bism_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -8, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x6, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x46, 16, -8
	banim_frame_end
banim_bism_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x86, 14, -32
	banim_frame_oam 0x0, 0x1000, 0x6B, 22, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0x88, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -10, 8
	banim_frame_oam 0x4000, 0x9000, 0x27, -10, -16
	banim_frame_oam 0x4000, 0x5000, 0x67, -10, 0
	banim_frame_oam 0x0, 0x1000, 0xA, -10, -24
	banim_frame_oam 0x0, 0x1000, 0x9, -2, -24
	banim_frame_oam 0x4000, 0x1000, 0xB, 12, -24
	banim_frame_oam 0x0, 0x1000, 0x66, 6, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x2C, -2, -16
	banim_frame_oam 0x8000, 0x5000, 0x2E, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0x2B, 14, -16
	banim_frame_oam 0x4000, 0x1000, 0xD, -2, -24
	banim_frame_oam 0x0, 0x1000, 0xF, -10, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0x4F, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -15, -8
	banim_frame_oam 0x4000, 0x9000, 0x12, -15, 0
	banim_frame_oam 0x0, 0x5000, 0x10, -7, -40
	banim_frame_oam 0x0, 0x1000, 0x2F, 9, -32
	banim_frame_end
banim_bism_mg1_2_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x53, -15, -32
	banim_frame_oam 0x4000, 0x5000, 0x93, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x16, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x18, -8, -40
	banim_frame_oam 0x4000, 0x5000, 0x8F, -15, -8
	banim_frame_oam 0x4000, 0x9000, 0x12, -15, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x5000, 0x8F, -15, -8
	banim_frame_oam 0x4000, 0x9000, 0x12, -15, 0
	banim_frame_oam 0x4000, 0x9000, 0xA0, -15, -32
	banim_frame_oam 0x4000, 0x5000, 0xE0, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xA4, 1, -40
	banim_frame_oam 0x0, 0x1000, 0xA6, -7, -40
	banim_frame_end
banim_bism_mg1_2_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x5000, 0x8F, -15, -8
	banim_frame_oam 0x4000, 0x9000, 0x12, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xE0, 9, -16
	banim_frame_oam 0x4000, 0x1000, 0xE6, -7, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xC4, -6, -32
	banim_frame_oam 0x0, 0x1000, 0xA7, -14, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x5000, 0xE9, -10, -8
	banim_frame_oam 0x0, 0x5000, 0xAB, -2, 0
	banim_frame_oam 0x8000, 0x1000, 0xAD, -10, 0
	banim_frame_oam 0x4000, 0x5000, 0xC7, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, -2, -24
	banim_frame_oam 0x0, 0x1000, 0xAA, -10, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, 22, -16
	banim_frame_end
banim_bism_mg1_2_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0xAE, -13, -24
	banim_frame_oam 0x4000, 0x5000, 0xEE, -13, -8
	banim_frame_oam 0x0, 0x5000, 0xB2, -5, 0
	banim_frame_oam 0x0, 0x1000, 0xD4, -13, 8
	banim_frame_oam 0x0, 0x1000, 0xED, 19, -16
	banim_frame_oam 0x0, 0x1000, 0xB4, 11, 0
	banim_frame_oam 0x0, 0x1000, 0x9F, -13, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x9000, 0x23, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x3, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 17, -16
	banim_frame_oam 0x0, 0x5000, 0x0, 1, 0
	banim_frame_oam 0x8000, 0x1000, 0x2, -7, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x9000, 0x23, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x3, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x0, 0x5000, 0x0, 1, 0
	banim_frame_oam 0x8000, 0x1000, 0x2, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x42, 18, 1
	banim_frame_oam 0x0, 0x1000, 0x42, 12, -5
	banim_frame_end
banim_bism_mg1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x9, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xC, -8, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x2A, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x2C, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x6A, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x6C, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xF, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xB, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA, 8, -23
	banim_frame_end
banim_bism_mg1_2_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x87, 4, -27
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0xC7, 4, -27
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x63, -14, -24
	banim_frame_oam 0x4000, 0x5000, 0xE3, -14, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x1000, 0x2D, 9, -49
	banim_frame_oam 0x4000, 0x0, 0xE9, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, 19, -24
	banim_frame_oam 0x4000, 0x9000, 0x89, -2, -40
	banim_frame_oam 0x4000, 0x5000, 0xC9, -2, -24
	banim_frame_oam 0x0, 0x9000, 0x63, -14, -24
	banim_frame_oam 0x4000, 0x5000, 0xE3, -14, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x6D, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0xED, -15, 8
	banim_frame_oam 0x4000, 0x9000, 0x2E, -15, -40
	banim_frame_end
banim_bism_mg1_2_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x5000, 0x10, -12, -44
	banim_frame_oam 0x8000, 0x9000, 0x32, 4, -36
	banim_frame_oam 0x8000, 0x9000, 0x14, -12, -36
	banim_frame_oam 0x8000, 0x5000, 0x16, -20, -36
	banim_frame_oam 0x4000, 0x9000, 0xAD, -15, -8
	banim_frame_oam 0x4000, 0x5000, 0xED, -15, 8
	banim_frame_oam 0x4000, 0x1000, 0xE9, 24, -29
	banim_frame_oam 0x4000, 0x0, 0xE9, -40, -29
	banim_frame_oam 0x8000, 0x1000, 0x2D, -5, -64
	banim_frame_end
banim_bism_mg1_2_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0xB1, -3, -4
	banim_frame_oam 0x0, 0x5000, 0x95, -13, -17
	banim_frame_oam 0x0, 0x1000, 0x91, -5, -1
	banim_frame_oam 0x8000, 0x1000, 0x94, 3, -1
	banim_frame_oam 0x0, 0x5000, 0xB2, -9, -24
	banim_frame_oam 0x4000, 0x1000, 0xF2, -9, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, 7, -16
	banim_frame_oam 0x0, 0x5000, 0xD4, -1, 0
	banim_frame_oam 0x8000, 0x1000, 0xD6, -9, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -8, -10
	banim_frame_oam 0x0, 0x5000, 0x4, -16, -21
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -5
	banim_frame_oam 0x8000, 0x1000, 0x45, 0, -5
	banim_frame_oam 0x8000, 0x9000, 0x20, 0, -17
	banim_frame_oam 0x8000, 0x5000, 0x22, -8, -17
	banim_frame_oam 0x4000, 0x1000, 0x1, -8, -25
	banim_frame_oam 0x8000, 0x1000, 0x23, -16, -17
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
banim_bism_mg1_2_oam_r:
banim_bism_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x82, 0, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x6, -24, -24
	banim_frame_oam 0x0, 0x0, 0x46, -24, -8
	banim_frame_end
banim_bism_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -22, -24
	banim_frame_oam 0x4000, 0x0, 0x88, -14, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 2, 8
	banim_frame_oam 0x4000, 0x0, 0x86, -30, -32
	banim_frame_oam 0x0, 0x0, 0x6B, -30, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0x88, -14, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 2, 8
	banim_frame_oam 0x4000, 0x8000, 0x27, -22, -16
	banim_frame_oam 0x4000, 0x4000, 0x67, -22, 0
	banim_frame_oam 0x0, 0x0, 0xA, 2, -24
	banim_frame_oam 0x0, 0x0, 0x9, -6, -24
	banim_frame_oam 0x4000, 0x0, 0xB, -28, -24
	banim_frame_oam 0x0, 0x0, 0x66, -14, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x2C, -14, -16
	banim_frame_oam 0x8000, 0x4000, 0x2E, 2, -16
	banim_frame_oam 0x8000, 0x0, 0x2B, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xD, -14, -24
	banim_frame_oam 0x0, 0x0, 0xF, 2, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0x4F, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -17, -8
	banim_frame_oam 0x4000, 0x8000, 0x12, -17, 0
	banim_frame_oam 0x0, 0x4000, 0x10, -9, -40
	banim_frame_oam 0x0, 0x0, 0x2F, -17, -32
	banim_frame_end
banim_bism_mg1_2_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x53, -17, -32
	banim_frame_oam 0x4000, 0x4000, 0x93, -17, -16
	banim_frame_oam 0x4000, 0x0, 0x16, -16, -40
	banim_frame_oam 0x0, 0x0, 0x18, 0, -40
	banim_frame_oam 0x4000, 0x4000, 0x8F, -17, -8
	banim_frame_oam 0x4000, 0x8000, 0x12, -17, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x4000, 0x8F, -17, -8
	banim_frame_oam 0x4000, 0x8000, 0x12, -17, 0
	banim_frame_oam 0x4000, 0x8000, 0xA0, -17, -32
	banim_frame_oam 0x4000, 0x4000, 0xE0, -17, -16
	banim_frame_oam 0x4000, 0x0, 0xA4, -17, -40
	banim_frame_oam 0x0, 0x0, 0xA6, -1, -40
	banim_frame_end
banim_bism_mg1_2_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x4000, 0x8F, -17, -8
	banim_frame_oam 0x4000, 0x8000, 0x12, -17, 0
	banim_frame_oam 0x0, 0x0, 0xE0, -17, -16
	banim_frame_oam 0x4000, 0x0, 0xE6, -9, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 7, -16
	banim_frame_oam 0x0, 0x4000, 0xC4, -10, -32
	banim_frame_oam 0x0, 0x0, 0xA7, 6, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x4000, 0xE9, -22, -8
	banim_frame_oam 0x0, 0x4000, 0xAB, -14, 0
	banim_frame_oam 0x8000, 0x0, 0xAD, 2, 0
	banim_frame_oam 0x4000, 0x4000, 0xC7, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -14, -24
	banim_frame_oam 0x0, 0x0, 0xAA, 2, -24
	banim_frame_oam 0x0, 0x0, 0xC6, -30, -16
	banim_frame_end
banim_bism_mg1_2_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0xAE, -19, -24
	banim_frame_oam 0x4000, 0x4000, 0xEE, -19, -8
	banim_frame_oam 0x0, 0x4000, 0xB2, -11, 0
	banim_frame_oam 0x0, 0x0, 0xD4, 5, 8
	banim_frame_oam 0x0, 0x0, 0xED, -27, -16
	banim_frame_oam 0x0, 0x0, 0xB4, -19, 0
	banim_frame_oam 0x0, 0x0, 0x9F, 5, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x8000, 0x23, -17, -16
	banim_frame_oam 0x4000, 0x0, 0x3, -17, -24
	banim_frame_oam 0x0, 0x0, 0x5, -1, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -33, -16
	banim_frame_oam 0x0, 0x4000, 0x0, -17, 0
	banim_frame_oam 0x8000, 0x0, 0x2, -1, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x8000, 0x23, -17, -16
	banim_frame_oam 0x4000, 0x0, 0x3, -17, -24
	banim_frame_oam 0x0, 0x0, 0x5, -1, -24
	banim_frame_oam 0x0, 0x4000, 0x0, -17, 0
	banim_frame_oam 0x8000, 0x0, 0x2, -1, 0
	banim_frame_oam 0x0, 0x0, 0x42, -26, 1
	banim_frame_oam 0x0, 0x0, 0x42, -20, -5
	banim_frame_end
banim_bism_mg1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x9, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xA, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC, 0, -24
	banim_frame_end
banim_bism_mg1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x2A, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x2C, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x6A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x6C, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xD, -16, -16
	banim_frame_oam 0x0, 0x0, 0xF, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xB, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA, -16, -23
	banim_frame_end
banim_bism_mg1_2_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x87, -20, -27
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0xC7, -20, -27
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x63, -18, -24
	banim_frame_oam 0x4000, 0x4000, 0xE3, -18, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x0, 0x2D, -17, -49
	banim_frame_oam 0x4000, 0x1000, 0xE9, -6, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -35, -24
	banim_frame_oam 0x4000, 0x8000, 0x89, -30, -40
	banim_frame_oam 0x4000, 0x4000, 0xC9, -30, -24
	banim_frame_oam 0x0, 0x8000, 0x63, -18, -24
	banim_frame_oam 0x4000, 0x4000, 0xE3, -18, 8
	banim_frame_end
banim_bism_mg1_2_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x6D, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0xED, -17, 8
	banim_frame_oam 0x4000, 0x8000, 0x2E, -17, -40
	banim_frame_end
banim_bism_mg1_2_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x4000, 0x10, -20, -44
	banim_frame_oam 0x8000, 0x8000, 0x32, -20, -36
	banim_frame_oam 0x8000, 0x8000, 0x14, -4, -36
	banim_frame_oam 0x8000, 0x4000, 0x16, 12, -36
	banim_frame_oam 0x4000, 0x8000, 0xAD, -17, -8
	banim_frame_oam 0x4000, 0x4000, 0xED, -17, 8
	banim_frame_oam 0x4000, 0x0, 0xE9, -40, -29
	banim_frame_oam 0x4000, 0x1000, 0xE9, 24, -29
	banim_frame_oam 0x8000, 0x0, 0x2D, -3, -64
	banim_frame_end
banim_bism_mg1_2_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0xB1, -5, -4
	banim_frame_oam 0x0, 0x4000, 0x95, -3, -17
	banim_frame_oam 0x0, 0x0, 0x91, -3, -1
	banim_frame_oam 0x8000, 0x0, 0x94, -11, -1
	banim_frame_oam 0x0, 0x4000, 0xB2, -7, -24
	banim_frame_oam 0x4000, 0x0, 0xF2, -7, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, -15, -16
	banim_frame_oam 0x0, 0x4000, 0xD4, -15, 0
	banim_frame_oam 0x8000, 0x0, 0xD6, 1, 0
	banim_frame_end
banim_bism_mg1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x0, 0, -10
	banim_frame_oam 0x0, 0x4000, 0x4, 0, -21
	banim_frame_oam 0x0, 0x0, 0x44, 0, -5
	banim_frame_oam 0x8000, 0x0, 0x45, -8, -5
	banim_frame_oam 0x8000, 0x8000, 0x20, -16, -17
	banim_frame_oam 0x8000, 0x4000, 0x22, 0, -17
	banim_frame_oam 0x4000, 0x0, 0x1, -8, -25
	banim_frame_oam 0x8000, 0x0, 0x23, 8, -17
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
banim_bism_mg1_2_script:
banim_bism_mg1_2_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 1, banim_bism_mg1_2_oam_frame_1_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 4, banim_bism_mg1_2_oam_frame_4_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_bism_mg1_sheet_0, 5, banim_bism_mg1_2_oam_frame_5_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 6, banim_bism_mg1_2_oam_frame_7_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 1, banim_bism_mg1_2_oam_frame_1_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 4, banim_bism_mg1_2_oam_frame_4_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_bism_mg1_sheet_0, 5, banim_bism_mg1_2_oam_frame_5_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 6, banim_bism_mg1_2_oam_frame_7_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 10, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 6, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 10, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 6, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 1, banim_bism_mg1_2_oam_frame_1_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 4, banim_bism_mg1_2_oam_frame_4_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_bism_mg1_sheet_0, 5, banim_bism_mg1_2_oam_frame_5_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 6, banim_bism_mg1_2_oam_frame_7_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 10, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 16, banim_bism_mg1_2_oam_frame_16_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 15, banim_bism_mg1_2_oam_frame_15_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 17, banim_bism_mg1_2_oam_frame_17_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 19, banim_bism_mg1_2_oam_frame_19_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_1, 18, banim_bism_mg1_2_oam_frame_18_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 20, banim_bism_mg1_2_oam_frame_20_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 21, banim_bism_mg1_2_oam_frame_21_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 6, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 22, banim_bism_mg1_2_oam_frame_22_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 23, banim_bism_mg1_2_oam_frame_23_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 22, banim_bism_mg1_2_oam_frame_22_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 22, banim_bism_mg1_2_oam_frame_22_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 23, banim_bism_mg1_2_oam_frame_23_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 22, banim_bism_mg1_2_oam_frame_22_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_2_mode_stand:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_2_oam_frame_0_r - banim_bism_mg1_2_oam_r
	banim_code_frame 7, banim_bism_mg1_sheet_0, 1, banim_bism_mg1_2_oam_frame_1_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 3, banim_bism_mg1_2_oam_frame_3_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 2, banim_bism_mg1_2_oam_frame_2_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 4, banim_bism_mg1_2_oam_frame_4_r - banim_bism_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_bism_mg1_sheet_0, 5, banim_bism_mg1_2_oam_frame_5_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 6, banim_bism_mg1_2_oam_frame_7_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_0, 7, banim_bism_mg1_2_oam_frame_8_r - banim_bism_mg1_2_oam_r
	banim_code_frame 2, banim_bism_mg1_sheet_0, 8, banim_bism_mg1_2_oam_frame_6_r - banim_bism_mg1_2_oam_r
	banim_code_frame 3, banim_bism_mg1_sheet_0, 9, banim_bism_mg1_2_oam_frame_9_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_0, 10, banim_bism_mg1_2_oam_frame_10_r - banim_bism_mg1_2_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_1, 11, banim_bism_mg1_2_oam_frame_11_r - banim_bism_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bism_mg1_sheet_1, 12, banim_bism_mg1_2_oam_frame_12_r - banim_bism_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bism_mg1_sheet_1, 13, banim_bism_mg1_2_oam_frame_13_r - banim_bism_mg1_2_oam_r
	banim_code_frame 4, banim_bism_mg1_sheet_1, 14, banim_bism_mg1_2_oam_frame_14_r - banim_bism_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bism_mg1_2_mode_attack_close - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_close_back - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_close_critical - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_close_critical_back - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_range - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_range_critical - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_dodge_close - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_dodge_range - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_stand_close - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_stand - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_stand_range - banim_bism_mg1_2_script
	.word banim_bism_mg1_2_mode_attack_miss - banim_bism_mg1_2_script
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

