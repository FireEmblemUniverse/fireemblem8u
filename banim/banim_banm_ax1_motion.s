@ vim:ft=armv4
	.global banim_banm_ax1_script
	.global banim_banm_ax1_oam_r
	.global banim_banm_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1F
	.section .data.oam_l
banim_banm_ax1_oam_l:
banim_banm_ax1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x24, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0x64, 0, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -23, -16
	banim_frame_oam 0x0, 0x1000, 0x4, -7, -24
	banim_frame_end
banim_banm_ax1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x26, 1, -15
	banim_frame_oam 0x8000, 0x5000, 0x28, -7, -15
	banim_frame_oam 0x8000, 0x1000, 0x49, -15, -7
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 9
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -23
	banim_frame_oam 0x0, 0x1000, 0x9, -15, -23
	banim_frame_oam 0x0, 0x1000, 0x5, 17, 0
	banim_frame_oam 0x0, 0x1000, 0x6, 17, 8
	banim_frame_end
banim_banm_ax1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, -15, 3
	banim_frame_oam 0x0, 0x1000, 0x84, 10, -5
	banim_frame_oam 0x0, 0x1000, 0xA4, -14, -5
	banim_frame_oam 0x8000, 0x9000, 0xA, 4, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x2D, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xD, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -20, 8
	banim_frame_end
banim_banm_ax1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x4E, 0, -34
	banim_frame_oam 0x4000, 0x9000, 0xF, -8, -50
	banim_frame_oam 0x0, 0x1000, 0x52, -8, -34
	banim_frame_oam 0x0, 0x1000, 0x72, -8, -58
	banim_frame_oam 0x0, 0x1000, 0x2E, 0, -58
	banim_frame_oam 0x8000, 0x1000, 0x92, 2, -2
	banim_frame_oam 0x0, 0x1000, 0xA5, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 13, 8
	banim_frame_end
banim_banm_ax1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 3, -57
	banim_frame_oam 0x0, 0x1000, 0xB4, 10, -25
	banim_frame_oam 0x0, 0x1000, 0xB3, 11, -17
	banim_frame_oam 0x0, 0x1000, 0x16, -5, -57
	banim_frame_oam 0x4000, 0x1000, 0x13, 1, -65
	banim_frame_oam 0x0, 0x1000, 0x15, -7, -65
	banim_frame_oam 0x0, 0x1000, 0xA5, 14, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 6, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 22, 8
	banim_frame_end
banim_banm_ax1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 5, -60
	banim_frame_oam 0x0, 0x1000, 0xB4, 12, -28
	banim_frame_oam 0x0, 0x1000, 0xB3, 13, -20
	banim_frame_oam 0x0, 0x1000, 0x16, -3, -60
	banim_frame_oam 0x4000, 0x1000, 0x13, 3, -68
	banim_frame_oam 0x0, 0x1000, 0x15, -5, -68
	banim_frame_oam 0x0, 0x1000, 0xA5, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 24, 8
	banim_frame_end
banim_banm_ax1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 6, -61
	banim_frame_oam 0x0, 0x1000, 0xB4, 13, -29
	banim_frame_oam 0x0, 0x1000, 0xB3, 14, -21
	banim_frame_oam 0x0, 0x1000, 0x16, -2, -61
	banim_frame_oam 0x4000, 0x1000, 0x13, 4, -69
	banim_frame_oam 0x0, 0x1000, 0x15, -4, -69
	banim_frame_oam 0x0, 0x1000, 0xA5, 17, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 9, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 25, 8
	banim_frame_end
banim_banm_ax1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 7, -62
	banim_frame_oam 0x0, 0x1000, 0xB4, 14, -30
	banim_frame_oam 0x0, 0x1000, 0xB3, 15, -22
	banim_frame_oam 0x0, 0x1000, 0x16, -1, -62
	banim_frame_oam 0x4000, 0x1000, 0x13, 5, -70
	banim_frame_oam 0x0, 0x1000, 0x15, -3, -70
	banim_frame_oam 0x0, 0x1000, 0xA5, 18, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 10, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 26, 8
	banim_frame_end
banim_banm_ax1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 8, -62
	banim_frame_oam 0x0, 0x1000, 0xB4, 15, -30
	banim_frame_oam 0x0, 0x1000, 0xB3, 16, -22
	banim_frame_oam 0x0, 0x1000, 0x16, 0, -62
	banim_frame_oam 0x4000, 0x1000, 0x13, 6, -70
	banim_frame_oam 0x0, 0x1000, 0x15, -2, -70
	banim_frame_oam 0x0, 0x1000, 0xA5, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 11, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 27, 8
	banim_frame_end
banim_banm_ax1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 9, -61
	banim_frame_oam 0x0, 0x1000, 0xB4, 16, -29
	banim_frame_oam 0x0, 0x1000, 0xB3, 17, -21
	banim_frame_oam 0x0, 0x1000, 0x16, 1, -61
	banim_frame_oam 0x4000, 0x1000, 0x13, 7, -69
	banim_frame_oam 0x0, 0x1000, 0x15, -1, -69
	banim_frame_oam 0x0, 0x1000, 0xA5, 20, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 12, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 28, 8
	banim_frame_end
banim_banm_ax1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x33, 10, -58
	banim_frame_oam 0x0, 0x1000, 0xB4, 17, -26
	banim_frame_oam 0x0, 0x1000, 0xB3, 18, -18
	banim_frame_oam 0x0, 0x1000, 0x16, 2, -58
	banim_frame_oam 0x4000, 0x1000, 0x13, 8, -66
	banim_frame_oam 0x0, 0x1000, 0x15, 0, -66
	banim_frame_oam 0x0, 0x1000, 0xA5, 21, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 13, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 29, 8
	banim_frame_end
banim_banm_ax1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x98, 42, -31
	banim_frame_oam 0x8000, 0x1000, 0x97, 48, -47
	banim_frame_oam 0x0, 0x9000, 0x18, 17, -40
	banim_frame_oam 0x8000, 0x1000, 0x37, 49, -32
	banim_frame_oam 0x0, 0x1000, 0x77, 49, -16
	banim_frame_oam 0x0, 0x1000, 0xA5, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 19, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 35, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x18, 18, -39
	banim_frame_oam 0x8000, 0x1000, 0x37, 50, -31
	banim_frame_oam 0x0, 0x1000, 0x77, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xA5, 28, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 20, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 36, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xB5, 46, -17
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x1C, 36, -30
	banim_frame_oam 0x8000, 0x1000, 0x1E, 28, -30
	banim_frame_oam 0x4000, 0x1000, 0x5C, 36, -14
	banim_frame_oam 0x0, 0x1000, 0x5E, 28, -14
	banim_frame_oam 0x0, 0x5000, 0x7D, 28, -6
	banim_frame_oam 0x8000, 0x1000, 0x3F, 20, -30
	banim_frame_oam 0x0, 0x1000, 0x7F, 20, -14
	banim_frame_oam 0x8000, 0x1000, 0x7C, 52, -23
	banim_frame_oam 0x0, 0x1000, 0xA5, 30, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 22, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 38, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x9A, 54, -26
	banim_frame_end
banim_banm_ax1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0xC1, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xE0, 52, -8
	banim_frame_oam 0x4000, 0x1000, 0xA7, 20, -24
	banim_frame_oam 0x4000, 0x9000, 0xC6, 20, 0
	banim_frame_oam 0x0, 0x1000, 0xC5, 52, 0
	banim_frame_end
banim_banm_ax1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0xA9, 56, -7
	banim_frame_oam 0x0, 0x1000, 0xAA, 56, 1
	banim_frame_end
banim_banm_ax1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x5000, 0xCF, 28, 0
	banim_frame_oam 0x0, 0x1000, 0xD3, 20, 0
	banim_frame_oam 0x4000, 0x5000, 0xF0, 20, 8
	banim_frame_oam 0x4000, 0x9000, 0xCB, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, 52, -8
	banim_frame_oam 0x0, 0x1000, 0xCA, 52, -16
	banim_frame_end
banim_banm_ax1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0xA9, 56, -9
	banim_frame_oam 0x0, 0x1000, 0xAA, 56, -1
	banim_frame_end
banim_banm_ax1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0xD4, 28, -19
	banim_frame_oam 0x8000, 0x1000, 0xD8, 20, -19
	banim_frame_oam 0x4000, 0x9000, 0xD9, 20, -3
	banim_frame_oam 0x4000, 0x1000, 0xAB, 30, 13
	banim_frame_oam 0x0, 0x1000, 0xAD, 22, 13
	banim_frame_end
banim_banm_ax1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0xBD, 36, -1
	banim_frame_oam 0x8000, 0x1000, 0xBF, 28, -1
	banim_frame_oam 0x0, 0x1000, 0xFD, 20, -1
	banim_frame_oam 0x0, 0x1000, 0xFE, 20, 7
	banim_frame_oam 0x4000, 0x9000, 0xD4, 28, -18
	banim_frame_oam 0x8000, 0x1000, 0xD8, 20, -18
	banim_frame_oam 0x4000, 0x5000, 0xD9, 20, -2
	banim_frame_end
banim_banm_ax1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -62
	banim_frame_oam 0x8000, 0x5000, 0x2, 8, -62
	banim_frame_oam 0x4000, 0x1000, 0x80, 16, -30
	banim_frame_oam 0x0, 0x1000, 0x82, 8, -30
	banim_frame_oam 0x8000, 0x1000, 0x43, 0, -46
	banim_frame_oam 0x0, 0x1000, 0x83, 0, -30
	banim_frame_oam 0x0, 0x1000, 0xA0, 22, -22
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -22
	banim_frame_oam 0x0, 0x1000, 0x3, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x23, 8, 8
	banim_frame_oam 0x0, 0x0, 0x23, 24, 8
	banim_frame_end
banim_banm_ax1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 13, -73
	banim_frame_oam 0x8000, 0x5000, 0x2, 5, -73
	banim_frame_oam 0x4000, 0x1000, 0x80, 13, -41
	banim_frame_oam 0x0, 0x1000, 0x82, 5, -41
	banim_frame_oam 0x8000, 0x1000, 0x43, -3, -57
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -41
	banim_frame_oam 0x0, 0x1000, 0xA0, 19, -33
	banim_frame_oam 0x0, 0x1000, 0xA1, 5, -33
	banim_frame_oam 0x0, 0x1000, 0x3, 13, 8
	banim_frame_oam 0x0, 0x1000, 0x23, 5, 8
	banim_frame_oam 0x0, 0x0, 0x23, 21, 8
	banim_frame_end
banim_banm_ax1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 11, -74
	banim_frame_oam 0x8000, 0x5000, 0x2, 3, -74
	banim_frame_oam 0x4000, 0x1000, 0x80, 11, -42
	banim_frame_oam 0x0, 0x1000, 0x82, 3, -42
	banim_frame_oam 0x8000, 0x1000, 0x43, -5, -58
	banim_frame_oam 0x0, 0x1000, 0x83, -5, -42
	banim_frame_oam 0x0, 0x1000, 0xA0, 17, -34
	banim_frame_oam 0x0, 0x1000, 0xA1, 3, -34
	banim_frame_oam 0x0, 0x1000, 0x3, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x23, 3, 8
	banim_frame_oam 0x0, 0x0, 0x23, 19, 8
	banim_frame_end
banim_banm_ax1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 12, -73
	banim_frame_oam 0x8000, 0x5000, 0x6, 4, -73
	banim_frame_oam 0x8000, 0x1000, 0x27, -4, -65
	banim_frame_oam 0x0, 0x1000, 0x67, -4, -49
	banim_frame_oam 0x0, 0x1000, 0x84, 15, -41
	banim_frame_oam 0x0, 0x1000, 0x85, 2, -41
	banim_frame_oam 0x0, 0x1000, 0x7, 9, -81
	banim_frame_oam 0x0, 0x1000, 0x3, 10, 8
	banim_frame_oam 0x0, 0x1000, 0x23, 2, 8
	banim_frame_oam 0x0, 0x0, 0x23, 18, 8
	banim_frame_end
banim_banm_ax1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 10, -73
	banim_frame_oam 0x8000, 0x5000, 0x6, 2, -73
	banim_frame_oam 0x8000, 0x1000, 0x27, -6, -65
	banim_frame_oam 0x0, 0x1000, 0x67, -6, -49
	banim_frame_oam 0x0, 0x1000, 0x84, 13, -41
	banim_frame_oam 0x0, 0x1000, 0x85, 0, -41
	banim_frame_oam 0x0, 0x1000, 0x7, 7, -81
	banim_frame_oam 0x0, 0x1000, 0x3, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x0, 0x23, 16, 8
	banim_frame_end
banim_banm_ax1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 9, -72
	banim_frame_oam 0x8000, 0x5000, 0x6, 1, -72
	banim_frame_oam 0x8000, 0x1000, 0x27, -7, -64
	banim_frame_oam 0x0, 0x1000, 0x67, -7, -48
	banim_frame_oam 0x0, 0x1000, 0x84, 12, -40
	banim_frame_oam 0x0, 0x1000, 0x85, -1, -40
	banim_frame_oam 0x0, 0x1000, 0x7, 6, -80
	banim_frame_oam 0x0, 0x1000, 0x3, 6, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -2, 8
	banim_frame_oam 0x0, 0x0, 0x23, 14, 8
	banim_frame_end
banim_banm_ax1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 6, -70
	banim_frame_oam 0x8000, 0x5000, 0x6, -2, -70
	banim_frame_oam 0x8000, 0x1000, 0x27, -10, -62
	banim_frame_oam 0x0, 0x1000, 0x67, -10, -46
	banim_frame_oam 0x0, 0x1000, 0x84, 9, -38
	banim_frame_oam 0x0, 0x1000, 0x85, -4, -38
	banim_frame_oam 0x0, 0x1000, 0x7, 3, -78
	banim_frame_oam 0x0, 0x1000, 0x3, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0x23, 8, 8
	banim_frame_end
banim_banm_ax1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -39
	banim_frame_oam 0x8000, 0x5000, 0x6, -8, -39
	banim_frame_oam 0x8000, 0x1000, 0x27, -16, -31
	banim_frame_oam 0x0, 0x1000, 0x67, -16, -15
	banim_frame_oam 0x0, 0x1000, 0x84, 3, -7
	banim_frame_oam 0x0, 0x1000, 0x85, -10, -7
	banim_frame_oam 0x0, 0x1000, 0x7, -3, -47
	banim_frame_oam 0x0, 0x1000, 0x3, -5, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -13, 8
	banim_frame_oam 0x0, 0x0, 0x23, 3, 8
	banim_frame_end
banim_banm_ax1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -21, -16
	banim_frame_oam 0x0, 0x1000, 0x86, 11, 0
	banim_frame_oam 0x0, 0x1000, 0x87, 11, 8
	banim_frame_end
banim_banm_ax1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0x2C, -22, -32
	banim_frame_oam 0x4000, 0x5000, 0x6C, -22, -16
	banim_frame_oam 0x4000, 0x1000, 0x8D, -14, -8
	banim_frame_oam 0x0, 0x1000, 0x8F, -22, -8
	banim_frame_oam 0x4000, 0x1000, 0xD, -14, -40
	banim_frame_oam 0x0, 0x1000, 0x7, -14, -48
	banim_frame_oam 0x4000, 0x9000, 0x88, -22, 0
	banim_frame_end
banim_banm_ax1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x5000, 0xB0, -22, 8
	banim_frame_oam 0x4000, 0x1000, 0x11, -14, -32
	banim_frame_oam 0x0, 0x1000, 0x13, -22, -32
	banim_frame_oam 0x4000, 0x1000, 0xD, -14, -37
	banim_frame_oam 0x0, 0x1000, 0x7, -14, -45
	banim_frame_oam 0x4000, 0x9000, 0x30, -22, -24
	banim_frame_oam 0x0, 0x5000, 0x71, -14, -8
	banim_frame_oam 0x8000, 0x1000, 0x73, -22, -8
	banim_frame_oam 0x0, 0x1000, 0x90, 2, 0
	banim_frame_end
banim_banm_ax1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -17, -15
	banim_frame_oam 0x8000, 0x9000, 0x18, -33, -15
	banim_frame_oam 0x0, 0x1000, 0xF, 15, -7
	banim_frame_oam 0x0, 0x1000, 0x10, 15, 1
	banim_frame_end
banim_banm_ax1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0x1A, -33, -11
	banim_frame_oam 0x4000, 0x5000, 0x5A, -33, 5
	banim_frame_oam 0x0, 0x5000, 0x3E, -1, -14
	banim_frame_oam 0x0, 0x1000, 0x1E, 15, -9
	banim_frame_end
banim_banm_ax1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x98, 36, -11
	banim_frame_oam 0x8000, 0x1000, 0x97, 42, -27
	banim_frame_oam 0x0, 0x9000, 0x18, 11, -20
	banim_frame_oam 0x8000, 0x1000, 0x37, 43, -12
	banim_frame_oam 0x0, 0x1000, 0x77, 43, 4
	banim_frame_oam 0x0, 0x1000, 0xA5, 21, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 13, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 29, 8
	banim_frame_end
banim_banm_ax1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x9000, 0xC1, 25, -8
	banim_frame_oam 0x8000, 0x1000, 0xC5, 17, -8
	banim_frame_oam 0x4000, 0x5000, 0xA2, 17, -16
	banim_frame_oam 0x8000, 0x1000, 0xC0, 9, -16
	banim_frame_oam 0x4000, 0x1000, 0xA6, 41, 8
	banim_frame_oam 0x4000, 0x1000, 0xC8, 25, 7
	banim_frame_oam 0x0, 0x1000, 0xCA, 17, 7
	banim_frame_end
banim_banm_ax1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x9000, 0xAC, 16, -17
	banim_frame_oam 0x4000, 0x5000, 0xEC, 16, -1
	banim_frame_oam 0x0, 0x1000, 0xC7, 48, -1
	banim_frame_oam 0x4000, 0x1000, 0xC8, 25, 7
	banim_frame_oam 0x0, 0x1000, 0xCA, 17, 7
	banim_frame_oam 0x4000, 0x1000, 0xE6, 47, 7
	banim_frame_oam 0x0, 0x1000, 0xE8, 39, 7
	banim_frame_end
banim_banm_ax1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, 23, -30
	banim_frame_oam 0x8000, 0x1000, 0x1E, 15, -30
	banim_frame_oam 0x4000, 0x1000, 0x5C, 23, -14
	banim_frame_oam 0x0, 0x1000, 0x5E, 15, -14
	banim_frame_oam 0x0, 0x5000, 0x7D, 15, -6
	banim_frame_oam 0x8000, 0x1000, 0x3F, 7, -30
	banim_frame_oam 0x0, 0x1000, 0x7F, 7, -14
	banim_frame_oam 0x8000, 0x1000, 0x7C, 39, -23
	banim_frame_oam 0x0, 0x1000, 0xA5, 17, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 9, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 25, 8
	banim_frame_oam 0x8000, 0x1000, 0x9A, 41, -26
	banim_frame_end
banim_banm_ax1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_banm_ax1_oam_frame_28_l:
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
banim_banm_ax1_oam_r:
banim_banm_ax1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x24, -16, -8
	banim_frame_oam 0x4000, 0x0, 0x64, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -9, -16
	banim_frame_oam 0x0, 0x0, 0x4, -1, -24
	banim_frame_end
banim_banm_ax1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x26, -17, -15
	banim_frame_oam 0x8000, 0x4000, 0x28, -1, -15
	banim_frame_oam 0x8000, 0x0, 0x49, 7, -7
	banim_frame_oam 0x0, 0x0, 0x89, 7, 9
	banim_frame_oam 0x4000, 0x0, 0x7, -9, -23
	banim_frame_oam 0x0, 0x0, 0x9, 7, -23
	banim_frame_oam 0x0, 0x0, 0x5, -25, 0
	banim_frame_oam 0x0, 0x0, 0x6, -25, 8
	banim_frame_end
banim_banm_ax1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -17, 3
	banim_frame_oam 0x0, 0x0, 0x84, -18, -5
	banim_frame_oam 0x0, 0x0, 0xA4, 6, -5
	banim_frame_oam 0x8000, 0x8000, 0xA, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, -4, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -20, 8
	banim_frame_oam 0x0, 0x0, 0x8C, -4, 8
	banim_frame_oam 0x8000, 0x4000, 0x2D, 4, -16
	banim_frame_oam 0x0, 0x0, 0xD, 12, 0
	banim_frame_oam 0x0, 0x0, 0xE, 12, 8
	banim_frame_end
banim_banm_ax1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x4E, -32, -34
	banim_frame_oam 0x4000, 0x8000, 0xF, -24, -50
	banim_frame_oam 0x0, 0x0, 0x52, 0, -34
	banim_frame_oam 0x0, 0x0, 0x72, 0, -58
	banim_frame_oam 0x0, 0x0, 0x2E, -8, -58
	banim_frame_oam 0x8000, 0x0, 0x92, -10, -2
	banim_frame_oam 0x0, 0x0, 0xA5, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -21, 8
	banim_frame_end
banim_banm_ax1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -35, -57
	banim_frame_oam 0x0, 0x0, 0xB4, -18, -25
	banim_frame_oam 0x0, 0x0, 0xB3, -19, -17
	banim_frame_oam 0x0, 0x0, 0x16, -3, -57
	banim_frame_oam 0x4000, 0x0, 0x13, -17, -65
	banim_frame_oam 0x0, 0x0, 0x15, -1, -65
	banim_frame_oam 0x0, 0x0, 0xA5, -22, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -14, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -30, 8
	banim_frame_end
banim_banm_ax1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -37, -60
	banim_frame_oam 0x0, 0x0, 0xB4, -20, -28
	banim_frame_oam 0x0, 0x0, 0xB3, -21, -20
	banim_frame_oam 0x0, 0x0, 0x16, -5, -60
	banim_frame_oam 0x4000, 0x0, 0x13, -19, -68
	banim_frame_oam 0x0, 0x0, 0x15, -3, -68
	banim_frame_oam 0x0, 0x0, 0xA5, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -32, 8
	banim_frame_end
banim_banm_ax1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -38, -61
	banim_frame_oam 0x0, 0x0, 0xB4, -21, -29
	banim_frame_oam 0x0, 0x0, 0xB3, -22, -21
	banim_frame_oam 0x0, 0x0, 0x16, -6, -61
	banim_frame_oam 0x4000, 0x0, 0x13, -20, -69
	banim_frame_oam 0x0, 0x0, 0x15, -4, -69
	banim_frame_oam 0x0, 0x0, 0xA5, -25, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -33, 8
	banim_frame_end
banim_banm_ax1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -39, -62
	banim_frame_oam 0x0, 0x0, 0xB4, -22, -30
	banim_frame_oam 0x0, 0x0, 0xB3, -23, -22
	banim_frame_oam 0x0, 0x0, 0x16, -7, -62
	banim_frame_oam 0x4000, 0x0, 0x13, -21, -70
	banim_frame_oam 0x0, 0x0, 0x15, -5, -70
	banim_frame_oam 0x0, 0x0, 0xA5, -26, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -18, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -34, 8
	banim_frame_end
banim_banm_ax1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -40, -62
	banim_frame_oam 0x0, 0x0, 0xB4, -23, -30
	banim_frame_oam 0x0, 0x0, 0xB3, -24, -22
	banim_frame_oam 0x0, 0x0, 0x16, -8, -62
	banim_frame_oam 0x4000, 0x0, 0x13, -22, -70
	banim_frame_oam 0x0, 0x0, 0x15, -6, -70
	banim_frame_oam 0x0, 0x0, 0xA5, -27, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -35, 8
	banim_frame_end
banim_banm_ax1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -41, -61
	banim_frame_oam 0x0, 0x0, 0xB4, -24, -29
	banim_frame_oam 0x0, 0x0, 0xB3, -25, -21
	banim_frame_oam 0x0, 0x0, 0x16, -9, -61
	banim_frame_oam 0x4000, 0x0, 0x13, -23, -69
	banim_frame_oam 0x0, 0x0, 0x15, -7, -69
	banim_frame_oam 0x0, 0x0, 0xA5, -28, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -20, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -36, 8
	banim_frame_end
banim_banm_ax1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x33, -42, -58
	banim_frame_oam 0x0, 0x0, 0xB4, -25, -26
	banim_frame_oam 0x0, 0x0, 0xB3, -26, -18
	banim_frame_oam 0x0, 0x0, 0x16, -10, -58
	banim_frame_oam 0x4000, 0x0, 0x13, -24, -66
	banim_frame_oam 0x0, 0x0, 0x15, -8, -66
	banim_frame_oam 0x0, 0x0, 0xA5, -29, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -21, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -37, 8
	banim_frame_end
banim_banm_ax1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x98, -58, -31
	banim_frame_oam 0x8000, 0x0, 0x97, -56, -47
	banim_frame_oam 0x0, 0x8000, 0x18, -49, -40
	banim_frame_oam 0x8000, 0x0, 0x37, -57, -32
	banim_frame_oam 0x0, 0x0, 0x77, -57, -16
	banim_frame_oam 0x0, 0x0, 0xA5, -35, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -43, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x18, -50, -39
	banim_frame_oam 0x8000, 0x0, 0x37, -58, -31
	banim_frame_oam 0x0, 0x0, 0x77, -58, -15
	banim_frame_oam 0x0, 0x0, 0xA5, -36, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -28, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -44, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xB5, -62, -17
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x1C, -52, -30
	banim_frame_oam 0x8000, 0x0, 0x1E, -36, -30
	banim_frame_oam 0x4000, 0x0, 0x5C, -52, -14
	banim_frame_oam 0x0, 0x0, 0x5E, -36, -14
	banim_frame_oam 0x0, 0x4000, 0x7D, -44, -6
	banim_frame_oam 0x8000, 0x0, 0x3F, -28, -30
	banim_frame_oam 0x0, 0x0, 0x7F, -28, -14
	banim_frame_oam 0x8000, 0x0, 0x7C, -60, -23
	banim_frame_oam 0x0, 0x0, 0xA5, -38, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -30, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -46, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x9A, -62, -26
	banim_frame_end
banim_banm_ax1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0xC1, -52, -16
	banim_frame_oam 0x0, 0x0, 0xE0, -60, -8
	banim_frame_oam 0x4000, 0x0, 0xA7, -36, -24
	banim_frame_oam 0x4000, 0x8000, 0xC6, -52, 0
	banim_frame_oam 0x0, 0x0, 0xC5, -60, 0
	banim_frame_end
banim_banm_ax1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0xA9, -64, -7
	banim_frame_oam 0x0, 0x0, 0xAA, -64, 1
	banim_frame_end
banim_banm_ax1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x4000, 0xCF, -60, 0
	banim_frame_oam 0x0, 0x0, 0xD3, -28, 0
	banim_frame_oam 0x4000, 0x4000, 0xF0, -52, 8
	banim_frame_oam 0x4000, 0x8000, 0xCB, -52, -16
	banim_frame_oam 0x0, 0x0, 0xEA, -60, -8
	banim_frame_oam 0x0, 0x0, 0xCA, -60, -16
	banim_frame_end
banim_banm_ax1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0xA9, -64, -9
	banim_frame_oam 0x0, 0x0, 0xAA, -64, -1
	banim_frame_end
banim_banm_ax1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0xD4, -60, -19
	banim_frame_oam 0x8000, 0x0, 0xD8, -28, -19
	banim_frame_oam 0x4000, 0x8000, 0xD9, -52, -3
	banim_frame_oam 0x4000, 0x0, 0xAB, -46, 13
	banim_frame_oam 0x0, 0x0, 0xAD, -30, 13
	banim_frame_end
banim_banm_ax1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0xBD, -52, -1
	banim_frame_oam 0x8000, 0x0, 0xBF, -36, -1
	banim_frame_oam 0x0, 0x0, 0xFD, -28, -1
	banim_frame_oam 0x0, 0x0, 0xFE, -28, 7
	banim_frame_oam 0x4000, 0x8000, 0xD4, -60, -18
	banim_frame_oam 0x8000, 0x0, 0xD8, -28, -18
	banim_frame_oam 0x4000, 0x4000, 0xD9, -52, -2
	banim_frame_end
banim_banm_ax1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -62
	banim_frame_oam 0x8000, 0x4000, 0x2, -16, -62
	banim_frame_oam 0x4000, 0x0, 0x80, -32, -30
	banim_frame_oam 0x0, 0x0, 0x82, -16, -30
	banim_frame_oam 0x8000, 0x0, 0x43, -8, -46
	banim_frame_oam 0x0, 0x0, 0x83, -8, -30
	banim_frame_oam 0x0, 0x0, 0xA0, -30, -22
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -22
	banim_frame_oam 0x0, 0x0, 0x3, -24, 8
	banim_frame_oam 0x0, 0x0, 0x23, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -32, 8
	banim_frame_end
banim_banm_ax1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -29, -73
	banim_frame_oam 0x8000, 0x4000, 0x2, -13, -73
	banim_frame_oam 0x4000, 0x0, 0x80, -29, -41
	banim_frame_oam 0x0, 0x0, 0x82, -13, -41
	banim_frame_oam 0x8000, 0x0, 0x43, -5, -57
	banim_frame_oam 0x0, 0x0, 0x83, -5, -41
	banim_frame_oam 0x0, 0x0, 0xA0, -27, -33
	banim_frame_oam 0x0, 0x0, 0xA1, -13, -33
	banim_frame_oam 0x0, 0x0, 0x3, -21, 8
	banim_frame_oam 0x0, 0x0, 0x23, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -29, 8
	banim_frame_end
banim_banm_ax1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -27, -74
	banim_frame_oam 0x8000, 0x4000, 0x2, -11, -74
	banim_frame_oam 0x4000, 0x0, 0x80, -27, -42
	banim_frame_oam 0x0, 0x0, 0x82, -11, -42
	banim_frame_oam 0x8000, 0x0, 0x43, -3, -58
	banim_frame_oam 0x0, 0x0, 0x83, -3, -42
	banim_frame_oam 0x0, 0x0, 0xA0, -25, -34
	banim_frame_oam 0x0, 0x0, 0xA1, -11, -34
	banim_frame_oam 0x0, 0x0, 0x3, -19, 8
	banim_frame_oam 0x0, 0x0, 0x23, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -27, 8
	banim_frame_end
banim_banm_ax1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -28, -73
	banim_frame_oam 0x8000, 0x4000, 0x6, -12, -73
	banim_frame_oam 0x8000, 0x0, 0x27, -4, -65
	banim_frame_oam 0x0, 0x0, 0x67, -4, -49
	banim_frame_oam 0x0, 0x0, 0x84, -23, -41
	banim_frame_oam 0x0, 0x0, 0x85, -10, -41
	banim_frame_oam 0x0, 0x0, 0x7, -17, -81
	banim_frame_oam 0x0, 0x0, 0x3, -18, 8
	banim_frame_oam 0x0, 0x0, 0x23, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -26, 8
	banim_frame_end
banim_banm_ax1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -26, -73
	banim_frame_oam 0x8000, 0x4000, 0x6, -10, -73
	banim_frame_oam 0x8000, 0x0, 0x27, -2, -65
	banim_frame_oam 0x0, 0x0, 0x67, -2, -49
	banim_frame_oam 0x0, 0x0, 0x84, -21, -41
	banim_frame_oam 0x0, 0x0, 0x85, -8, -41
	banim_frame_oam 0x0, 0x0, 0x7, -15, -81
	banim_frame_oam 0x0, 0x0, 0x3, -16, 8
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -24, 8
	banim_frame_end
banim_banm_ax1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -25, -72
	banim_frame_oam 0x8000, 0x4000, 0x6, -9, -72
	banim_frame_oam 0x8000, 0x0, 0x27, -1, -64
	banim_frame_oam 0x0, 0x0, 0x67, -1, -48
	banim_frame_oam 0x0, 0x0, 0x84, -20, -40
	banim_frame_oam 0x0, 0x0, 0x85, -7, -40
	banim_frame_oam 0x0, 0x0, 0x7, -14, -80
	banim_frame_oam 0x0, 0x0, 0x3, -14, 8
	banim_frame_oam 0x0, 0x0, 0x23, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -22, 8
	banim_frame_end
banim_banm_ax1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -22, -70
	banim_frame_oam 0x8000, 0x4000, 0x6, -6, -70
	banim_frame_oam 0x8000, 0x0, 0x27, 2, -62
	banim_frame_oam 0x0, 0x0, 0x67, 2, -46
	banim_frame_oam 0x0, 0x0, 0x84, -17, -38
	banim_frame_oam 0x0, 0x0, 0x85, -4, -38
	banim_frame_oam 0x0, 0x0, 0x7, -11, -78
	banim_frame_oam 0x0, 0x0, 0x3, -8, 8
	banim_frame_oam 0x0, 0x0, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -16, 8
	banim_frame_end
banim_banm_ax1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -39
	banim_frame_oam 0x8000, 0x4000, 0x6, 0, -39
	banim_frame_oam 0x8000, 0x0, 0x27, 8, -31
	banim_frame_oam 0x0, 0x0, 0x67, 8, -15
	banim_frame_oam 0x0, 0x0, 0x84, -11, -7
	banim_frame_oam 0x0, 0x0, 0x85, 2, -7
	banim_frame_oam 0x0, 0x0, 0x7, -5, -47
	banim_frame_oam 0x0, 0x0, 0x3, -3, 8
	banim_frame_oam 0x0, 0x0, 0x23, 5, 8
	banim_frame_oam 0x0, 0x1000, 0x23, -11, 8
	banim_frame_end
banim_banm_ax1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -11, -16
	banim_frame_oam 0x0, 0x0, 0x86, -19, 0
	banim_frame_oam 0x0, 0x0, 0x87, -19, 8
	banim_frame_end
banim_banm_ax1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0x2C, -10, -32
	banim_frame_oam 0x4000, 0x4000, 0x6C, -10, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, -2, -8
	banim_frame_oam 0x0, 0x0, 0x8F, 14, -8
	banim_frame_oam 0x4000, 0x0, 0xD, -2, -40
	banim_frame_oam 0x0, 0x0, 0x7, 6, -48
	banim_frame_oam 0x4000, 0x8000, 0x88, -10, 0
	banim_frame_end
banim_banm_ax1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x4000, 0xB0, -10, 8
	banim_frame_oam 0x4000, 0x0, 0x11, -2, -32
	banim_frame_oam 0x0, 0x0, 0x13, 14, -32
	banim_frame_oam 0x4000, 0x0, 0xD, -2, -37
	banim_frame_oam 0x0, 0x0, 0x7, 6, -45
	banim_frame_oam 0x4000, 0x8000, 0x30, -10, -24
	banim_frame_oam 0x0, 0x4000, 0x71, -2, -8
	banim_frame_oam 0x8000, 0x0, 0x73, 14, -8
	banim_frame_oam 0x0, 0x0, 0x90, -10, 0
	banim_frame_end
banim_banm_ax1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -15, -15
	banim_frame_oam 0x8000, 0x8000, 0x18, 17, -15
	banim_frame_oam 0x0, 0x0, 0xF, -23, -7
	banim_frame_oam 0x0, 0x0, 0x10, -23, 1
	banim_frame_end
banim_banm_ax1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0x1A, 1, -11
	banim_frame_oam 0x4000, 0x4000, 0x5A, 1, 5
	banim_frame_oam 0x0, 0x4000, 0x3E, -15, -14
	banim_frame_oam 0x0, 0x0, 0x1E, -23, -9
	banim_frame_end
banim_banm_ax1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x98, -52, -11
	banim_frame_oam 0x8000, 0x0, 0x97, -50, -27
	banim_frame_oam 0x0, 0x8000, 0x18, -43, -20
	banim_frame_oam 0x8000, 0x0, 0x37, -51, -12
	banim_frame_oam 0x0, 0x0, 0x77, -51, 4
	banim_frame_oam 0x0, 0x0, 0xA5, -29, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -21, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -37, 8
	banim_frame_end
banim_banm_ax1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x8000, 0xC1, -57, -8
	banim_frame_oam 0x8000, 0x0, 0xC5, -25, -8
	banim_frame_oam 0x4000, 0x4000, 0xA2, -49, -16
	banim_frame_oam 0x8000, 0x0, 0xC0, -17, -16
	banim_frame_oam 0x4000, 0x0, 0xA6, -57, 8
	banim_frame_oam 0x4000, 0x0, 0xC8, -41, 7
	banim_frame_oam 0x0, 0x0, 0xCA, -25, 7
	banim_frame_end
banim_banm_ax1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x8000, 0xAC, -48, -17
	banim_frame_oam 0x4000, 0x4000, 0xEC, -48, -1
	banim_frame_oam 0x0, 0x0, 0xC7, -56, -1
	banim_frame_oam 0x4000, 0x0, 0xC8, -41, 7
	banim_frame_oam 0x0, 0x0, 0xCA, -25, 7
	banim_frame_oam 0x4000, 0x0, 0xE6, -63, 7
	banim_frame_oam 0x0, 0x0, 0xE8, -47, 7
	banim_frame_end
banim_banm_ax1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -39, -30
	banim_frame_oam 0x8000, 0x0, 0x1E, -23, -30
	banim_frame_oam 0x4000, 0x0, 0x5C, -39, -14
	banim_frame_oam 0x0, 0x0, 0x5E, -23, -14
	banim_frame_oam 0x0, 0x4000, 0x7D, -31, -6
	banim_frame_oam 0x8000, 0x0, 0x3F, -15, -30
	banim_frame_oam 0x0, 0x0, 0x7F, -15, -14
	banim_frame_oam 0x8000, 0x0, 0x7C, -47, -23
	banim_frame_oam 0x0, 0x0, 0xA5, -25, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -33, 8
	banim_frame_oam 0x8000, 0x0, 0x9A, -49, -26
	banim_frame_end
banim_banm_ax1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_banm_ax1_oam_frame_28_r:
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
banim_banm_ax1_script:
banim_banm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 1, banim_banm_ax1_oam_frame_1_r - banim_banm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 5, banim_banm_ax1_sheet_0, 2, banim_banm_ax1_oam_frame_2_r - banim_banm_ax1_oam_r
	banim_code_effect_dirt_kick
	banim_code_frame 4, banim_banm_ax1_sheet_0, 3, banim_banm_ax1_oam_frame_3_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 4, banim_banm_ax1_oam_frame_4_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 5, banim_banm_ax1_oam_frame_5_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 6, banim_banm_ax1_oam_frame_6_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 7, banim_banm_ax1_oam_frame_7_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_0, 8, banim_banm_ax1_oam_frame_8_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 9, banim_banm_ax1_oam_frame_9_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 10, banim_banm_ax1_oam_frame_10_r - banim_banm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_0, 11, banim_banm_ax1_oam_frame_11_r - banim_banm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_banm_ax1_sheet_0, 18, banim_banm_ax1_oam_frame_12_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 16, banim_banm_ax1_oam_frame_13_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_0, 20, banim_banm_ax1_oam_frame_14_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_0, 21, banim_banm_ax1_oam_frame_15_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 22, banim_banm_ax1_oam_frame_16_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 23, banim_banm_ax1_oam_frame_17_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 24, banim_banm_ax1_oam_frame_18_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 25, banim_banm_ax1_oam_frame_19_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 26, banim_banm_ax1_oam_frame_20_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 27, banim_banm_ax1_oam_frame_21_r - banim_banm_ax1_oam_r
	banim_code_frame 3, banim_banm_ax1_sheet_1, 28, banim_banm_ax1_oam_frame_22_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 29, banim_banm_ax1_oam_frame_23_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_banm_ax1_sheet_1, 30, banim_banm_ax1_oam_frame_24_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 5, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_effect_dirt_kick
	banim_code_frame 4, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_banm_ax1_sheet_0, 19, banim_banm_ax1_oam_frame_26_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 17, banim_banm_ax1_oam_frame_27_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 3, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_sound_scream
	banim_code_frame 2, banim_banm_ax1_sheet_1, 31, banim_banm_ax1_oam_frame_29_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 32, banim_banm_ax1_oam_frame_30_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 31, banim_banm_ax1_oam_frame_29_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 32, banim_banm_ax1_oam_frame_30_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 31, banim_banm_ax1_oam_frame_29_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 32, banim_banm_ax1_oam_frame_30_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 31, banim_banm_ax1_oam_frame_29_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 32, banim_banm_ax1_oam_frame_30_r - banim_banm_ax1_oam_r
	banim_code_frame 45, banim_banm_ax1_sheet_1, 31, banim_banm_ax1_oam_frame_29_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 1, banim_banm_ax1_oam_frame_1_r - banim_banm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 5, banim_banm_ax1_sheet_0, 2, banim_banm_ax1_oam_frame_2_r - banim_banm_ax1_oam_r
	banim_code_effect_dirt_kick
	banim_code_frame 4, banim_banm_ax1_sheet_0, 3, banim_banm_ax1_oam_frame_3_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 4, banim_banm_ax1_oam_frame_4_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 5, banim_banm_ax1_oam_frame_5_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 6, banim_banm_ax1_oam_frame_6_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 7, banim_banm_ax1_oam_frame_7_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_0, 8, banim_banm_ax1_oam_frame_8_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 9, banim_banm_ax1_oam_frame_9_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 10, banim_banm_ax1_oam_frame_10_r - banim_banm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_0, 11, banim_banm_ax1_oam_frame_11_r - banim_banm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_banm_ax1_sheet_0, 18, banim_banm_ax1_oam_frame_12_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 16, banim_banm_ax1_oam_frame_13_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_0, 20, banim_banm_ax1_oam_frame_14_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_0, 21, banim_banm_ax1_oam_frame_15_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 22, banim_banm_ax1_oam_frame_16_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 23, banim_banm_ax1_oam_frame_17_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 24, banim_banm_ax1_oam_frame_18_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 25, banim_banm_ax1_oam_frame_19_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 26, banim_banm_ax1_oam_frame_20_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 27, banim_banm_ax1_oam_frame_21_r - banim_banm_ax1_oam_r
	banim_code_frame 3, banim_banm_ax1_sheet_1, 28, banim_banm_ax1_oam_frame_22_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 29, banim_banm_ax1_oam_frame_23_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_banm_ax1_sheet_1, 30, banim_banm_ax1_oam_frame_24_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_sound_scream
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 45, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 5, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_effect_dirt_kick
	banim_code_frame 4, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_banm_ax1_sheet_0, 19, banim_banm_ax1_oam_frame_26_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 17, banim_banm_ax1_oam_frame_27_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 3, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_banm_ax1_sheet_0, 39, banim_banm_ax1_oam_frame_25_r - banim_banm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_banm_ax1_sheet_1, 40, banim_banm_ax1_oam_frame_28_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_attack_range:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_end_mode
banim_banm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_end_mode
banim_banm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 33, banim_banm_ax1_oam_frame_31_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 34, banim_banm_ax1_oam_frame_32_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 33, banim_banm_ax1_oam_frame_31_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 33, banim_banm_ax1_oam_frame_31_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 34, banim_banm_ax1_oam_frame_32_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 33, banim_banm_ax1_oam_frame_31_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_mode_stand_close:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_mode_stand:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_mode_stand_range:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_frame 5, banim_banm_ax1_sheet_0, 1, banim_banm_ax1_oam_frame_1_r - banim_banm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 5, banim_banm_ax1_sheet_0, 2, banim_banm_ax1_oam_frame_2_r - banim_banm_ax1_oam_r
	banim_code_effect_dirt_kick
	banim_code_frame 4, banim_banm_ax1_sheet_0, 3, banim_banm_ax1_oam_frame_3_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 4, banim_banm_ax1_oam_frame_4_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 5, banim_banm_ax1_oam_frame_5_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 6, banim_banm_ax1_oam_frame_6_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 7, banim_banm_ax1_oam_frame_7_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_0, 8, banim_banm_ax1_oam_frame_8_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_0, 9, banim_banm_ax1_oam_frame_9_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_0, 10, banim_banm_ax1_oam_frame_10_r - banim_banm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_0, 35, banim_banm_ax1_oam_frame_33_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_banm_ax1_sheet_1, 36, banim_banm_ax1_oam_frame_34_r - banim_banm_ax1_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 37, banim_banm_ax1_oam_frame_35_r - banim_banm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_0, 38, banim_banm_ax1_oam_frame_36_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 22, banim_banm_ax1_oam_frame_16_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 23, banim_banm_ax1_oam_frame_17_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 24, banim_banm_ax1_oam_frame_18_r - banim_banm_ax1_oam_r
	banim_code_frame 6, banim_banm_ax1_sheet_1, 25, banim_banm_ax1_oam_frame_19_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 26, banim_banm_ax1_oam_frame_20_r - banim_banm_ax1_oam_r
	banim_code_frame 4, banim_banm_ax1_sheet_1, 27, banim_banm_ax1_oam_frame_21_r - banim_banm_ax1_oam_r
	banim_code_frame 3, banim_banm_ax1_sheet_1, 28, banim_banm_ax1_oam_frame_22_r - banim_banm_ax1_oam_r
	banim_code_frame 2, banim_banm_ax1_sheet_1, 29, banim_banm_ax1_oam_frame_23_r - banim_banm_ax1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_oam_frame_0_r - banim_banm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_banm_ax1_sheet_1, 30, banim_banm_ax1_oam_frame_24_r - banim_banm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_banm_ax1_mode_attack_close - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_close_back - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_close_critical - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_close_critical_back - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_range - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_range_critical - banim_banm_ax1_script
	.word banim_banm_ax1_mode_dodge_close - banim_banm_ax1_script
	.word banim_banm_ax1_mode_dodge_range - banim_banm_ax1_script
	.word banim_banm_ax1_mode_stand_close - banim_banm_ax1_script
	.word banim_banm_ax1_mode_stand - banim_banm_ax1_script
	.word banim_banm_ax1_mode_stand_range - banim_banm_ax1_script
	.word banim_banm_ax1_mode_attack_miss - banim_banm_ax1_script
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

