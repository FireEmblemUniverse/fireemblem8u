@ vim:ft=armv4
	.global banim_myrm_sw1_script
	.global banim_myrm_sw1_oam_r
	.global banim_myrm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x10
	.section .data.oam_l
banim_myrm_sw1_oam_l:
banim_myrm_sw1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -6, -22
	banim_frame_oam 0x4000, 0x1000, 0x20, -13, -14
	banim_frame_oam 0x4000, 0x1000, 0x40, -6, -6
	banim_frame_oam 0x0, 0x1000, 0x42, -14, -6
	banim_frame_oam 0x4000, 0x9000, 0x60, -22, 2
	banim_frame_oam 0x8000, 0x1000, 0x2, -30, 3
	banim_frame_oam 0x0, 0x1000, 0x7F, -14, -22
	banim_frame_oam 0x0, 0x1000, 0xFF, 3, -14
	banim_frame_end
banim_myrm_sw1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x3, -8, -15
	banim_frame_oam 0x8000, 0x1000, 0x5, -16, -15
	banim_frame_oam 0x0, 0x1000, 0x43, -24, -7
	banim_frame_oam 0x4000, 0x9000, 0x44, -22, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, -30, 1
	banim_frame_oam 0x0, 0x1000, 0x27, -38, 9
	banim_frame_oam 0x0, 0x1000, 0x1, -6, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x48, -6, 1
	banim_frame_oam 0x8000, 0x1000, 0x4A, -14, 1
	banim_frame_oam 0x0, 0x5000, 0x8, -7, -15
	banim_frame_oam 0x8000, 0x1000, 0xA, -15, -15
	banim_frame_oam 0x0, 0x1000, 0x1, -6, -23
	banim_frame_oam 0x8000, 0x1000, 0x4B, -23, -23
	banim_frame_oam 0x8000, 0x1000, 0xB, -31, -15
	banim_frame_oam 0x8000, 0x1000, 0xC, -39, -7
	banim_frame_oam 0x4000, 0x1000, 0x84, -30, 9
	banim_frame_oam 0x0, 0x1000, 0x86, -38, 9
	banim_frame_oam 0x0, 0x1000, 0xBF, -31, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -23, -7
	banim_frame_end
banim_myrm_sw1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0x10, -30, 9
	banim_frame_oam 0x0, 0x5000, 0x6C, -6, 1
	banim_frame_oam 0x8000, 0x1000, 0x6E, -14, 1
	banim_frame_oam 0x4000, 0x9000, 0x2D, -25, -15
	banim_frame_oam 0x4000, 0x1000, 0xD, -9, -23
	banim_frame_oam 0x0, 0x1000, 0xF, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x4C, -30, -1
	banim_frame_end
banim_myrm_sw1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x31, -6, -15
	banim_frame_oam 0x8000, 0x5000, 0x33, -14, -15
	banim_frame_oam 0x0, 0x1000, 0x70, -22, 9
	banim_frame_oam 0x0, 0x1000, 0x6F, 10, -12
	banim_frame_oam 0x0, 0x1000, 0x1, -6, -23
	banim_frame_oam 0x0, 0x1000, 0x12, -22, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x14, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x16, -20, -15
	banim_frame_oam 0x0, 0x1000, 0x13, 5, 9
	banim_frame_oam 0x0, 0x5000, 0x54, -11, 1
	banim_frame_oam 0x8000, 0x1000, 0x56, -19, 1
	banim_frame_oam 0x0, 0x1000, 0x1E, -14, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, -10, -16
	banim_frame_oam 0x8000, 0x5000, 0x19, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, -26, -16
	banim_frame_oam 0x0, 0x1000, 0x7A, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x5A, 6, -24
	banim_frame_oam 0x0, 0x1000, 0x7B, 6, -16
	banim_frame_end
banim_myrm_sw1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x57, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x59, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x7A, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, 15, -24
	banim_frame_oam 0x0, 0x5000, 0xA0, -17, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, -25, -16
	banim_frame_oam 0x8000, 0x1000, 0xA4, -1, -16
	banim_frame_oam 0x8000, 0x1000, 0xA3, 7, -24
	banim_frame_end
banim_myrm_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x87, -30, -16
	banim_frame_oam 0x8000, 0x1000, 0xA6, 2, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 2, 8
	banim_frame_oam 0x8000, 0x1000, 0xA5, -38, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -38, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -6, -24
	banim_frame_oam 0x0, 0x1000, 0xE3, -14, -24
	banim_frame_end
banim_myrm_sw1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, 12, -18
	banim_frame_oam 0x8000, 0x1000, 0xAD, 4, -18
	banim_frame_oam 0x4000, 0x1000, 0xEB, 12, -2
	banim_frame_oam 0x0, 0x1000, 0xED, 4, -2
	banim_frame_oam 0x0, 0x1000, 0x8B, 28, -10
	banim_frame_oam 0x4000, 0x5000, 0xEE, -36, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0xAE, 11, -27
	banim_frame_oam 0x8000, 0x1000, 0xD2, 3, -19
	banim_frame_oam 0x0, 0x1000, 0xB2, 19, -3
	banim_frame_oam 0x4000, 0x1000, 0x8F, 3, -3
	banim_frame_oam 0x4000, 0x5000, 0xF3, 11, -11
	banim_frame_oam 0x4000, 0x1000, 0xD3, 18, 9
	banim_frame_oam 0x4000, 0x0, 0xD3, 3, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x1000, 0xD3, 27, 9
	banim_frame_oam 0x4000, 0x0, 0xD3, 12, 9
	banim_frame_oam 0x4000, 0x1000, 0x97, 15, -37
	banim_frame_oam 0x0, 0x1000, 0x99, 7, -37
	banim_frame_oam 0x4000, 0x1000, 0xB7, 3, -5
	banim_frame_oam 0x0, 0x5000, 0x94, 19, -29
	banim_frame_oam 0x4000, 0x1000, 0xD5, 19, -13
	banim_frame_oam 0x0, 0x1000, 0xB3, 19, -5
	banim_frame_oam 0x8000, 0x1000, 0x96, 11, -21
	banim_frame_oam 0x0, 0x1000, 0x7E, 11, -25
	banim_frame_end
banim_myrm_sw1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xD3, 31, 9
	banim_frame_oam 0x4000, 0x0, 0xD3, 16, 9
	banim_frame_oam 0x4000, 0x1000, 0x9A, 6, -42
	banim_frame_oam 0x0, 0x1000, 0xBA, 21, -34
	banim_frame_oam 0x0, 0x5000, 0xD9, 19, -27
	banim_frame_oam 0x0, 0x5000, 0xD7, 23, -11
	banim_frame_oam 0x0, 0x1000, 0xB9, 15, -3
	banim_frame_end
banim_myrm_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0xDB, 51, -14
	banim_frame_oam 0x0, 0x1000, 0xBB, 59, -22
	banim_frame_oam 0x8000, 0x1000, 0x9C, 27, -15
	banim_frame_oam 0x8000, 0x9000, 0x9D, 35, -15
	banim_frame_oam 0x0, 0x0, 0xD3, 27, 10
	banim_frame_oam 0x0, 0x1000, 0x7D, 35, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0xDD, 35, 1
	banim_frame_oam 0x0, 0x0, 0xD3, 27, 10
	banim_frame_oam 0x0, 0x5000, 0x1B, 35, -15
	banim_frame_oam 0x8000, 0x1000, 0x1D, 27, -15
	banim_frame_oam 0x4000, 0x1000, 0x5C, 51, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 37, -15
	banim_frame_oam 0x8000, 0x1000, 0x2, 29, -15
	banim_frame_oam 0x0, 0x1000, 0x62, 53, -6
	banim_frame_oam 0x4000, 0x1000, 0x26, 27, 10
	banim_frame_oam 0x0, 0x1000, 0xE9, 29, -7
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x9F, 24, 8
	banim_frame_end
banim_myrm_sw1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 33, -14
	banim_frame_oam 0x8000, 0x5000, 0x5, 25, -14
	banim_frame_oam 0x0, 0x1000, 0x6, 17, 10
	banim_frame_end
banim_myrm_sw1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x5000, 0x7, 16, -6
	banim_frame_oam 0x4000, 0x1000, 0x28, 24, -14
	banim_frame_oam 0x4000, 0x9000, 0x46, 16, 2
	banim_frame_oam 0x4000, 0x1000, 0x2A, 0, 2
	banim_frame_oam 0x0, 0x1000, 0x53, 40, -11
	banim_frame_end
banim_myrm_sw1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0x4A, 18, 2
	banim_frame_oam 0x4000, 0x5000, 0xB, 18, -6
	banim_frame_oam 0x4000, 0x1000, 0x2C, 26, -14
	banim_frame_oam 0x4000, 0x1000, 0x2E, 2, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x5000, 0xB, 18, -6
	banim_frame_oam 0x4000, 0x1000, 0x2C, 26, -14
	banim_frame_oam 0x0, 0x5000, 0x4A, 34, 2
	banim_frame_oam 0x4000, 0x1000, 0x6C, 18, 10
	banim_frame_oam 0x4000, 0x5000, 0xF, 3, 2
	banim_frame_oam 0x0, 0x1000, 0x4C, 26, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x13, 32, -8
	banim_frame_oam 0x0, 0x5000, 0x4F, 16, -16
	banim_frame_oam 0x0, 0x5000, 0x51, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0x30, 8, 1
	banim_frame_oam 0x0, 0x1000, 0x6E, 8, -15
	banim_frame_oam 0x0, 0x1000, 0x32, 17, -24
	banim_frame_oam 0x4000, 0x0, 0x78, 22, 10
	banim_frame_oam 0x0, 0x1000, 0x78, 38, 10
	banim_frame_oam 0x4000, 0x1000, 0x78, 28, 11
	banim_frame_end
banim_myrm_sw1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, 13, -34
	banim_frame_oam 0x8000, 0x1000, 0x16, 5, -34
	banim_frame_oam 0x0, 0x1000, 0x56, 5, -18
	banim_frame_oam 0x0, 0x1000, 0x33, 13, -2
	banim_frame_oam 0x4000, 0x0, 0x78, 5, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 21, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 12, -2
	banim_frame_oam 0x0, 0x5000, 0x17, 12, -34
	banim_frame_oam 0x8000, 0x1000, 0x19, 4, -34
	banim_frame_oam 0x4000, 0x1000, 0x57, 12, -18
	banim_frame_oam 0x0, 0x1000, 0x59, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x77, 12, -10
	banim_frame_oam 0x0, 0x1000, 0x76, 28, -20
	banim_frame_oam 0x4000, 0x0, 0x78, 4, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 20, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 10, -2
	banim_frame_oam 0x0, 0x5000, 0x17, 10, -34
	banim_frame_oam 0x8000, 0x1000, 0x19, 2, -34
	banim_frame_oam 0x4000, 0x1000, 0x57, 10, -18
	banim_frame_oam 0x0, 0x1000, 0x59, 2, -18
	banim_frame_oam 0x0, 0x1000, 0x77, 10, -10
	banim_frame_oam 0x0, 0x1000, 0x76, 26, -20
	banim_frame_oam 0x4000, 0x0, 0x78, 2, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 18, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 9, -1
	banim_frame_oam 0x0, 0x5000, 0x17, 9, -33
	banim_frame_oam 0x8000, 0x1000, 0x19, 1, -33
	banim_frame_oam 0x4000, 0x1000, 0x57, 9, -17
	banim_frame_oam 0x0, 0x1000, 0x59, 1, -17
	banim_frame_oam 0x0, 0x1000, 0x77, 9, -9
	banim_frame_oam 0x0, 0x1000, 0x76, 25, -19
	banim_frame_oam 0x4000, 0x0, 0x78, 1, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 17, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x17, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x19, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0x57, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x59, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x77, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x76, 24, -18
	banim_frame_oam 0x4000, 0x0, 0x78, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 16, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 7, 1
	banim_frame_oam 0x0, 0x5000, 0x17, 7, -31
	banim_frame_oam 0x8000, 0x1000, 0x19, -1, -31
	banim_frame_oam 0x4000, 0x1000, 0x57, 7, -15
	banim_frame_oam 0x0, 0x1000, 0x59, -1, -15
	banim_frame_oam 0x0, 0x1000, 0x77, 7, -7
	banim_frame_oam 0x0, 0x1000, 0x76, 23, -17
	banim_frame_oam 0x4000, 0x0, 0x78, -1, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 15, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x33, 4, 3
	banim_frame_oam 0x0, 0x5000, 0x17, 4, -29
	banim_frame_oam 0x8000, 0x1000, 0x19, -4, -29
	banim_frame_oam 0x4000, 0x1000, 0x57, 4, -13
	banim_frame_oam 0x0, 0x1000, 0x59, -4, -13
	banim_frame_oam 0x0, 0x1000, 0x77, 4, -5
	banim_frame_oam 0x0, 0x1000, 0x76, 20, -15
	banim_frame_oam 0x4000, 0x0, 0x78, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x78, 12, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -21, 9
	banim_frame_oam 0x4000, 0x9000, 0xA0, -13, -7
	banim_frame_oam 0x8000, 0x1000, 0xA4, -21, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xE4, -7, -23
	banim_frame_oam 0x0, 0x1000, 0x82, -18, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x9000, 0xC5, -22, 2
	banim_frame_oam 0x8000, 0x1000, 0x88, -30, 3
	banim_frame_oam 0x0, 0x5000, 0x86, -13, -22
	banim_frame_oam 0x4000, 0x1000, 0x84, -14, -6
	banim_frame_oam 0x0, 0x1000, 0xA5, 2, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0xC5, -22, 2
	banim_frame_oam 0x8000, 0x1000, 0x88, -30, 3
	banim_frame_oam 0x0, 0x1000, 0xA5, 2, -6
	banim_frame_oam 0x0, 0x1000, 0xA5, 2, -6
	banim_frame_oam 0x4000, 0x1000, 0xC9, -14, -6
	banim_frame_oam 0x0, 0x5000, 0x89, -13, -22
	banim_frame_end
banim_myrm_sw1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x9000, 0xC5, -22, 2
	banim_frame_oam 0x8000, 0x1000, 0x88, -30, 3
	banim_frame_oam 0x0, 0x1000, 0xA5, 2, -6
	banim_frame_oam 0x0, 0x1000, 0xA5, 2, -6
	banim_frame_oam 0x4000, 0x1000, 0xC9, -14, -6
	banim_frame_oam 0x0, 0x5000, 0x8B, -13, -22
	banim_frame_oam 0x0, 0x1000, 0xEB, 3, -14
	banim_frame_end
banim_myrm_sw1_oam_frame_70_l:
	banim_frame_oam 0x0, 0x9000, 0x8D, -26, -16
	banim_frame_end
banim_myrm_sw1_oam_frame_71_l:
	banim_frame_oam 0x0, 0x9000, 0x91, -31, -17
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x7C, 59, -22
	banim_frame_oam 0x0, 0x1000, 0x5C, 57, -20
	banim_frame_end
banim_myrm_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x7C, 63, -9
	banim_frame_oam 0x0, 0x1000, 0x5C, 61, -7
	banim_frame_end
banim_myrm_sw1_oam_frame_67_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, 2, -46
	banim_frame_oam 0x0, 0x5000, 0x3B, -14, -38
	banim_frame_oam 0x8000, 0x9000, 0x7A, -6, -22
	banim_frame_oam 0x8000, 0x5000, 0x7C, -14, -22
	banim_frame_oam 0x4000, 0x1000, 0xFA, -6, 10
	banim_frame_oam 0x0, 0x1000, 0xFC, -14, 10
	banim_frame_oam 0x8000, 0x5000, 0x99, -22, -14
	banim_frame_oam 0x0, 0x1000, 0xF8, -30, 10
	banim_frame_oam 0x8000, 0x1000, 0xD7, -30, -6
	banim_frame_oam 0x0, 0x1000, 0xD8, -22, -22
	banim_frame_oam 0x0, 0x1000, 0x5A, -22, -30
	banim_frame_end
banim_myrm_sw1_oam_frame_68_l:
	banim_frame_oam 0x4000, 0x5000, 0x1B, -17, 8
	banim_frame_oam 0x0, 0x5000, 0x3D, -9, -8
	banim_frame_oam 0x0, 0x1000, 0x5F, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xDD, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xDF, -17, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -8
	banim_frame_oam 0x8000, 0x1000, 0x7D, 7, -8
	banim_frame_oam 0x4000, 0x1000, 0xBD, -9, -32
	banim_frame_oam 0x0, 0x1000, 0xBF, -17, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -3, -40
	banim_frame_oam 0x0, 0x1000, 0x9E, 1, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -13, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -21, -15
	banim_frame_oam 0x8000, 0x1000, 0x23, 3, 1
	banim_frame_oam 0x8000, 0x1000, 0x24, -29, 1
	banim_frame_oam 0x0, 0x1000, 0x63, -37, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x80, 3, -19
	banim_frame_oam 0x8000, 0x1000, 0xA0, 11, -19
	banim_frame_oam 0x0, 0x1000, 0xE0, 11, -3
	banim_frame_oam 0x0, 0x1000, 0xC2, -5, 5
	banim_frame_oam 0x0, 0x1000, 0xE2, -29, -3
	banim_frame_oam 0x0, 0x5000, 0xC3, -21, 7
	banim_frame_oam 0x0, 0x1000, 0x64, -29, 15
	banim_frame_oam 0x8000, 0x5000, 0x81, 3, -11
	banim_frame_oam 0x0, 0x5000, 0x83, -21, -9
	banim_frame_oam 0x8000, 0x1000, 0x82, -5, -11
	banim_frame_oam 0x4000, 0x1000, 0x3, -4, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -19, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -21, -10
	banim_frame_oam 0x0, 0x5000, 0x45, -22, -26
	banim_frame_oam 0x0, 0x1000, 0x47, -30, -26
	banim_frame_oam 0x0, 0x1000, 0x67, -6, -18
	banim_frame_oam 0x8000, 0x1000, 0x48, -2, 6
	banim_frame_oam 0x4000, 0x1000, 0x3, -5, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -20, 9
	banim_frame_oam 0x0, 0x1000, 0xB5, -16, 6
	banim_frame_end
banim_myrm_sw1_oam_frame_37_l:
	banim_frame_affine -221, -128, -128, 221, 1
	banim_frame_oam 0x4000, 0x1000, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -21, 9
	banim_frame_oam 0x100, 0xC000, 0x18, -37, -37
	banim_frame_end
banim_myrm_sw1_oam_frame_38_l:
	banim_frame_oam 0x0, 0xD000, 0x18, -37, -37
	banim_frame_oam 0x4000, 0x1000, 0x3, -7, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -22, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_39_l:
	banim_frame_affine -177, 184, 184, 177, 1
	banim_frame_oam 0x4000, 0x1000, 0x3, -5, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -20, 9
	banim_frame_oam 0x100, 0xC000, 0x18, -34, -39
	banim_frame_end
banim_myrm_sw1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x9000, 0x85, -26, -25
	banim_frame_oam 0x4000, 0x1000, 0xE5, -26, 7
	banim_frame_oam 0x0, 0x1000, 0xC8, 6, -17
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_oam 0x4000, 0x1000, 0xC5, -18, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -26, -9
	banim_frame_oam 0x0, 0x1000, 0xE7, -23, -1
	banim_frame_oam 0x4000, 0x1000, 0xE8, -23, -33
	banim_frame_oam 0x0, 0x1000, 0xC9, -20, -41
	banim_frame_end
banim_myrm_sw1_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, -26, 7
	banim_frame_oam 0x4000, 0x1000, 0xC5, -18, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -26, -9
	banim_frame_oam 0x0, 0x1000, 0xE7, -23, -1
	banim_frame_oam 0x4000, 0x9000, 0xCA, -26, -25
	banim_frame_oam 0x4000, 0x1000, 0xA9, -25, -33
	banim_frame_oam 0x0, 0x1000, 0xC9, -20, -41
	banim_frame_oam 0x0, 0x1000, 0x89, 6, -25
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, -26, 7
	banim_frame_oam 0x4000, 0x1000, 0xC5, -18, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -26, -9
	banim_frame_oam 0x0, 0x1000, 0xE7, -23, -1
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_oam 0x0, 0x5000, 0x2A, -18, -25
	banim_frame_oam 0x0, 0x1000, 0x49, -2, -17
	banim_frame_oam 0x4000, 0x1000, 0xA, -26, -33
	banim_frame_oam 0x0, 0x1000, 0xC9, -20, -41
	banim_frame_oam 0x0, 0x1000, 0x29, -10, -33
	banim_frame_oam 0x8000, 0x1000, 0xC, -26, -25
	banim_frame_end
banim_myrm_sw1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, -26, 7
	banim_frame_oam 0x4000, 0x1000, 0xC5, -18, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -26, -9
	banim_frame_oam 0x0, 0x1000, 0xE7, -23, -1
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_oam 0x4000, 0x1000, 0xAB, -26, -33
	banim_frame_oam 0x0, 0x1000, 0xC9, -20, -40
	banim_frame_oam 0x0, 0x5000, 0x6A, -18, -25
	banim_frame_oam 0x8000, 0x1000, 0x6C, -26, -25
	banim_frame_oam 0x0, 0x1000, 0x69, -2, -17
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xE5, -26, 7
	banim_frame_oam 0x0, 0x1000, 0xE7, -23, -1
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_oam 0x0, 0x5000, 0xD, -18, -17
	banim_frame_oam 0x8000, 0x1000, 0xF, -26, -17
	banim_frame_oam 0x0, 0x1000, 0x69, -2, -17
	banim_frame_oam 0x4000, 0x1000, 0x4C, -18, -25
	banim_frame_oam 0x0, 0x1000, 0x4E, -26, -25
	banim_frame_oam 0x4000, 0x1000, 0x6D, -26, -33
	banim_frame_oam 0x0, 0x1000, 0xC9, -20, -40
	banim_frame_end
banim_myrm_sw1_oam_frame_44_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -15, -14
	banim_frame_oam 0x8000, 0x9000, 0x12, -31, -17
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x8D, 10, 9
	banim_frame_oam 0x0, 0x1000, 0xAD, -6, 7
	banim_frame_oam 0x0, 0x5000, 0x8E, -14, -9
	banim_frame_oam 0x8000, 0x1000, 0x90, -22, -9
	banim_frame_oam 0x8000, 0x1000, 0xCE, 2, 1
	banim_frame_oam 0x4000, 0x1000, 0xCF, -22, 7
	banim_frame_oam 0x4000, 0x1000, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -25, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x9000, 0xD1, -18, 5
	banim_frame_oam 0x8000, 0x1000, 0xD5, -26, 5
	banim_frame_oam 0x0, 0x1000, 0xF0, 6, -3
	banim_frame_oam 0x0, 0x1000, 0xEF, 14, 7
	banim_frame_oam 0x0, 0x5000, 0x91, -10, -11
	banim_frame_oam 0x8000, 0x1000, 0x93, -18, -11
	banim_frame_oam 0x0, 0x1000, 0xB4, -26, -3
	banim_frame_oam 0x4000, 0x1000, 0x3, -2, 6
	banim_frame_oam 0x4000, 0x0, 0x3, -17, 6
	banim_frame_oam 0x4000, 0x1000, 0x3, -9, 9
	banim_frame_oam 0x4000, 0x0, 0x3, -24, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -17, 13
	banim_frame_oam 0x4000, 0x0, 0x3, -32, 13
	banim_frame_end
banim_myrm_sw1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x1000, 0x3, -51, 21
	banim_frame_oam 0x0, 0x9000, 0x80, -43, -3
	banim_frame_oam 0x8000, 0x9000, 0x4, -11, -20
	banim_frame_oam 0x4000, 0x1000, 0x84, -11, 12
	banim_frame_oam 0x0, 0x5000, 0x6, -27, -19
	banim_frame_oam 0x4000, 0x1000, 0x8, -43, -11
	banim_frame_oam 0x8000, 0x1000, 0xA4, -51, -1
	banim_frame_oam 0x0, 0x1000, 0x23, 5, 5
	banim_frame_end
banim_myrm_sw1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x1000, 0x28, -55, 2
	banim_frame_oam 0x0, 0x9000, 0x88, -47, -3
	banim_frame_oam 0x4000, 0x1000, 0x46, -47, -11
	banim_frame_oam 0x0, 0x5000, 0x48, -31, -19
	banim_frame_oam 0x8000, 0x1000, 0x4A, 1, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, 9, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -15, 21
	banim_frame_oam 0x8000, 0x9000, 0x66, -15, -23
	banim_frame_oam 0x4000, 0x1000, 0xE6, -15, 9
	banim_frame_oam 0x0, 0x1000, 0xE4, 1, 1
	banim_frame_end
banim_myrm_sw1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0x99, 42, -4
	banim_frame_oam 0x4000, 0x1000, 0xBB, 44, -12
	banim_frame_oam 0x0, 0x1000, 0x9C, 34, 4
	banim_frame_oam 0x4000, 0x1000, 0xD8, 26, 12
	banim_frame_oam 0x4000, 0x1000, 0xDA, 10, 17
	banim_frame_oam 0x4000, 0x5000, 0xF8, -22, 22
	banim_frame_oam 0x4000, 0x9000, 0xDC, -54, 20
	banim_frame_oam 0x0, 0x5000, 0x9D, -62, 4
	banim_frame_oam 0x8000, 0x1000, 0x9F, -70, 4
	banim_frame_oam 0x4000, 0x1000, 0x3E, -70, 20
	banim_frame_oam 0x0, 0x1000, 0x1E, -74, -4
	banim_frame_oam 0x0, 0x1000, 0x7C, -78, 4
	banim_frame_oam 0x0, 0x5000, 0x1C, -66, -12
	banim_frame_oam 0x0, 0x5000, 0x5D, -53, -28
	banim_frame_oam 0x8000, 0x1000, 0x5F, -61, -28
	banim_frame_oam 0x0, 0x1000, 0x5C, -37, -28
	banim_frame_end
banim_myrm_sw1_oam_frame_61_l:
	banim_frame_oam 0x8000, 0x1000, 0x5B, 56, -24
	banim_frame_oam 0x8000, 0x1000, 0x5A, 64, -32
	banim_frame_end
banim_myrm_sw1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x36, 76, -47
	banim_frame_oam 0x0, 0x1000, 0x16, 87, -55
	banim_frame_oam 0x0, 0x1000, 0x17, 68, -39
	banim_frame_oam 0x4000, 0x1000, 0x76, 63, -15
	banim_frame_oam 0x4000, 0x1000, 0x18, 39, -9
	banim_frame_oam 0x0, 0x1000, 0x39, 36, -1
	banim_frame_oam 0x0, 0x1000, 0x38, 63, -23
	banim_frame_oam 0x8000, 0x1000, 0x1A, 59, -7
	banim_frame_oam 0x8000, 0x1000, 0x1B, 51, 1
	banim_frame_oam 0x0, 0x5000, 0x58, 71, -31
	banim_frame_end
banim_myrm_sw1_oam_frame_62_l:
	banim_frame_oam 0x0, 0x5000, 0x96, 53, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x7000, 0x99, 42, -30
	banim_frame_oam 0x4000, 0x3000, 0xBB, 44, -14
	banim_frame_oam 0x0, 0x3000, 0x9C, 34, -30
	banim_frame_oam 0x4000, 0x3000, 0xD8, 26, -38
	banim_frame_oam 0x4000, 0x3000, 0xDA, 10, -43
	banim_frame_oam 0x4000, 0x7000, 0xF8, -22, -48
	banim_frame_oam 0x4000, 0xB000, 0xDC, -54, -54
	banim_frame_oam 0x0, 0x7000, 0x9D, -62, -38
	banim_frame_oam 0x8000, 0x3000, 0x9F, -70, -38
	banim_frame_oam 0x4000, 0x3000, 0x3E, -70, -46
	banim_frame_oam 0x0, 0x3000, 0x1E, -74, -22
	banim_frame_oam 0x0, 0x3000, 0x7C, -78, -30
	banim_frame_oam 0x0, 0x7000, 0x1C, -66, -22
	banim_frame_oam 0x0, 0x7000, 0x5D, -53, -6
	banim_frame_oam 0x8000, 0x3000, 0x5F, -61, -6
	banim_frame_oam 0x0, 0x3000, 0x5C, -37, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_63_l:
	banim_frame_oam 0x8000, 0x3000, 0x5B, 56, -10
	banim_frame_oam 0x8000, 0x3000, 0x5A, 64, -2
	banim_frame_end
banim_myrm_sw1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0xCF, 72, 24
	banim_frame_oam 0x0, 0x5000, 0x8F, 67, 8
	banim_frame_oam 0x4000, 0x1000, 0x6F, 66, 1
	banim_frame_oam 0x4000, 0x1000, 0x6D, 51, 9
	banim_frame_oam 0x4000, 0x1000, 0x4D, 56, 21
	banim_frame_oam 0x0, 0x5000, 0xD, 50, -7
	banim_frame_oam 0x0, 0x1000, 0x4C, 42, -5
	banim_frame_oam 0x0, 0x1000, 0x2C, 34, -11
	banim_frame_oam 0x0, 0x1000, 0xC, 58, -15
	banim_frame_oam 0x0, 0x1000, 0xF1, 83, 40
	banim_frame_end
banim_myrm_sw1_oam_frame_64_l:
	banim_frame_oam 0x8000, 0x1000, 0xB, 52, -20
	banim_frame_oam 0x8000, 0x1000, 0x4B, 44, -26
	banim_frame_end
banim_myrm_sw1_oam_frame_56_l:
	banim_frame_oam 0x0, 0x1000, 0x4F, -52, -1
	banim_frame_oam 0x0, 0x1000, 0x57, -44, 6
	banim_frame_oam 0x0, 0x1000, 0x37, -36, 6
	banim_frame_oam 0x0, 0x1000, 0x17, -28, 6
	banim_frame_oam 0x0, 0x5000, 0x34, 44, -11
	banim_frame_oam 0x8000, 0x1000, 0x36, 36, -11
	banim_frame_oam 0x4000, 0x5000, 0x74, 4, -8
	banim_frame_oam 0x4000, 0x1000, 0x94, -12, -4
	banim_frame_oam 0x0, 0x5000, 0x96, -28, -10
	banim_frame_oam 0x0, 0x5000, 0xD6, -44, -10
	banim_frame_end
banim_myrm_sw1_oam_frame_65_l:
	banim_frame_oam 0x4000, 0x1000, 0x73, 62, -13
	banim_frame_oam 0x0, 0x1000, 0x75, 54, -13
	banim_frame_end
banim_myrm_sw1_oam_frame_57_l:
	banim_frame_oam 0x4000, 0x1000, 0xB3, 43, -12
	banim_frame_oam 0x0, 0x1000, 0xB5, 35, -12
	banim_frame_oam 0x0, 0x1000, 0xD2, 115, -24
	banim_frame_oam 0x0, 0x1000, 0xF2, 107, -22
	banim_frame_oam 0x8000, 0x1000, 0xD6, 75, -16
	banim_frame_oam 0x8000, 0x1000, 0xD7, 67, -12
	banim_frame_oam 0x4000, 0x1000, 0xB1, 37, 3
	banim_frame_oam 0x4000, 0x1000, 0x94, 51, -5
	banim_frame_oam 0x8000, 0x1000, 0xD3, 99, -21
	banim_frame_oam 0x0, 0x5000, 0xD4, 83, -20
	banim_frame_end
banim_myrm_sw1_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x1000, 0x91, 66, -15
	banim_frame_oam 0x0, 0x1000, 0x93, 58, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_58_l:
	banim_frame_oam 0x0, 0x5000, 0x30, 103, -33
	banim_frame_oam 0x8000, 0x1000, 0x52, 119, -32
	banim_frame_oam 0x4000, 0x5000, 0x12, 63, -32
	banim_frame_oam 0x0, 0x1000, 0x71, 95, -32
	banim_frame_oam 0x4000, 0x1000, 0x32, 102, -17
	banim_frame_oam 0x4000, 0x1000, 0x34, 94, -9
	banim_frame_oam 0x4000, 0x1000, 0x54, 86, -1
	banim_frame_oam 0x0, 0x1000, 0x53, 80, 7
	banim_frame_end
banim_myrm_sw1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x1B, 28, -25
	banim_frame_oam 0x4000, 0x5000, 0x5B, 28, -9
	banim_frame_oam 0x8000, 0x1000, 0x9F, 36, -1
	banim_frame_oam 0x8000, 0x1000, 0xDF, 44, -1
	banim_frame_oam 0x8000, 0x1000, 0x7E, 28, -1
	banim_frame_end
banim_myrm_sw1_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -32, 1
	banim_frame_oam 0x4000, 0x1000, 0x20, -24, -7
	banim_frame_oam 0x0, 0x1000, 0x22, -32, -7
	banim_frame_oam 0x4000, 0x1000, 0x0, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x2, -31, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x1000, 0xE6, -7, 9
	banim_frame_oam 0x0, 0x5000, 0xCC, -22, 2
	banim_frame_oam 0x8000, 0x1000, 0xCE, -30, 2
	banim_frame_oam 0x0, 0x1000, 0x28, -40, -7
	banim_frame_oam 0x8000, 0x1000, 0xA5, 0, -28
	banim_frame_oam 0x0, 0x5000, 0x8C, -24, -14
	banim_frame_oam 0x8000, 0x1000, 0x8E, -32, -14
	banim_frame_oam 0x0, 0x1000, 0x29, -17, -22
	banim_frame_oam 0x0, 0x1000, 0x6A, -9, -11
	banim_frame_oam 0x0, 0x1000, 0x2A, -8, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xD, 27, -30
	banim_frame_oam 0x8000, 0x9000, 0x11, 11, -30
	banim_frame_oam 0x4000, 0x1000, 0xB3, 26, 9
	banim_frame_oam 0x4000, 0x1000, 0xD3, 10, 9
	banim_frame_oam 0x0, 0x5000, 0xCB, 54, -17
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xB3, 28, 9
	banim_frame_oam 0x4000, 0x1000, 0xD3, 12, 9
	banim_frame_oam 0x0, 0x9000, 0x8E, 22, -29
	banim_frame_oam 0x8000, 0x5000, 0x92, 14, -29
	banim_frame_oam 0x0, 0x5000, 0xCB, 53, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x17, 25, -26
	banim_frame_oam 0x4000, 0x5000, 0x97, 25, 6
	banim_frame_oam 0x4000, 0x1000, 0xB3, 38, 7
	banim_frame_oam 0x4000, 0x1000, 0xD3, 22, 7
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x1B, 28, -25
	banim_frame_oam 0x4000, 0x5000, 0x9B, 28, 7
	banim_frame_end
banim_myrm_sw1_oam_frame_69_l:
	banim_frame_oam 0x4000, 0x1000, 0xCB, -6, -42
	banim_frame_oam 0x0, 0x2000, 0xCC, 2, -34
	banim_frame_oam 0x0, 0x1000, 0xEC, -6, -34
	banim_frame_oam 0x0, 0x1000, 0xCC, -14, -34
	banim_frame_oam 0x0, 0x2000, 0xCC, -6, -26
	banim_frame_oam 0x4000, 0x5000, 0x1B, -17, 8
	banim_frame_oam 0x0, 0x5000, 0x3D, -9, -8
	banim_frame_oam 0x0, 0x1000, 0x5F, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xDD, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xDF, -17, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -8
	banim_frame_oam 0x8000, 0x1000, 0x7D, 7, -8
	banim_frame_oam 0x4000, 0x1000, 0xBD, -9, -32
	banim_frame_oam 0x0, 0x1000, 0xBF, -17, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -3, -40
	banim_frame_oam 0x0, 0x1000, 0x9E, 1, -48
	banim_frame_end
	.section .data.oam_r
banim_myrm_sw1_oam_r:
banim_myrm_sw1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x0, -2, -22
	banim_frame_oam 0x4000, 0x0, 0x20, -3, -14
	banim_frame_oam 0x4000, 0x0, 0x40, -10, -6
	banim_frame_oam 0x0, 0x0, 0x42, 6, -6
	banim_frame_oam 0x4000, 0x8000, 0x60, -10, 2
	banim_frame_oam 0x8000, 0x0, 0x2, 22, 3
	banim_frame_oam 0x0, 0x0, 0x7F, 6, -22
	banim_frame_oam 0x0, 0x0, 0xFF, -11, -14
	banim_frame_end
banim_myrm_sw1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x3, -8, -15
	banim_frame_oam 0x8000, 0x0, 0x5, 8, -15
	banim_frame_oam 0x0, 0x0, 0x43, 16, -7
	banim_frame_oam 0x4000, 0x8000, 0x44, -10, 1
	banim_frame_oam 0x8000, 0x0, 0x6, 22, 1
	banim_frame_oam 0x0, 0x0, 0x27, 30, 9
	banim_frame_oam 0x0, 0x0, 0x1, -2, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x48, -10, 1
	banim_frame_oam 0x8000, 0x0, 0x4A, 6, 1
	banim_frame_oam 0x0, 0x4000, 0x8, -9, -15
	banim_frame_oam 0x8000, 0x0, 0xA, 7, -15
	banim_frame_oam 0x0, 0x0, 0x1, -2, -23
	banim_frame_oam 0x8000, 0x0, 0x4B, 15, -23
	banim_frame_oam 0x8000, 0x0, 0xB, 23, -15
	banim_frame_oam 0x8000, 0x0, 0xC, 31, -7
	banim_frame_oam 0x4000, 0x0, 0x84, 14, 9
	banim_frame_oam 0x0, 0x0, 0x86, 30, 9
	banim_frame_oam 0x0, 0x0, 0xBF, 23, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 15, -7
	banim_frame_end
banim_myrm_sw1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0x10, 14, 9
	banim_frame_oam 0x0, 0x4000, 0x6C, -10, 1
	banim_frame_oam 0x8000, 0x0, 0x6E, 6, 1
	banim_frame_oam 0x4000, 0x8000, 0x2D, -7, -15
	banim_frame_oam 0x4000, 0x0, 0xD, -7, -23
	banim_frame_oam 0x0, 0x0, 0xF, 9, -23
	banim_frame_oam 0x0, 0x0, 0x4C, 22, -1
	banim_frame_end
banim_myrm_sw1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x31, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x33, 6, -15
	banim_frame_oam 0x0, 0x0, 0x70, 14, 9
	banim_frame_oam 0x0, 0x0, 0x6F, -18, -12
	banim_frame_oam 0x0, 0x0, 0x1, -2, -23
	banim_frame_oam 0x0, 0x0, 0x12, 14, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x16, 12, -15
	banim_frame_oam 0x0, 0x0, 0x13, -13, 9
	banim_frame_oam 0x0, 0x4000, 0x54, -5, 1
	banim_frame_oam 0x8000, 0x0, 0x56, 11, 1
	banim_frame_oam 0x0, 0x0, 0x1E, 6, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -6, -16
	banim_frame_oam 0x8000, 0x4000, 0x19, 10, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, 18, -16
	banim_frame_oam 0x0, 0x0, 0x7A, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x5A, -22, -24
	banim_frame_oam 0x0, 0x0, 0x7B, -14, -16
	banim_frame_end
banim_myrm_sw1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x57, -6, 0
	banim_frame_oam 0x8000, 0x0, 0x59, 10, 0
	banim_frame_oam 0x0, 0x0, 0x7A, -14, 8
	banim_frame_oam 0x0, 0x0, 0xE0, -23, -24
	banim_frame_oam 0x0, 0x4000, 0xA0, 1, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, 17, -16
	banim_frame_oam 0x8000, 0x0, 0xA4, -7, -16
	banim_frame_oam 0x8000, 0x0, 0xA3, -15, -24
	banim_frame_end
banim_myrm_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x87, -2, -16
	banim_frame_oam 0x8000, 0x0, 0xA6, -10, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -10, 8
	banim_frame_oam 0x8000, 0x0, 0xA5, 30, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 30, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -10, -24
	banim_frame_oam 0x0, 0x0, 0xE3, 6, -24
	banim_frame_end
banim_myrm_sw1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -28, -18
	banim_frame_oam 0x8000, 0x0, 0xAD, -12, -18
	banim_frame_oam 0x4000, 0x0, 0xEB, -28, -2
	banim_frame_oam 0x0, 0x0, 0xED, -12, -2
	banim_frame_oam 0x0, 0x0, 0x8B, -36, -10
	banim_frame_oam 0x4000, 0x4000, 0xEE, 4, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0xAE, -43, -27
	banim_frame_oam 0x8000, 0x0, 0xD2, -11, -19
	banim_frame_oam 0x0, 0x0, 0xB2, -27, -3
	banim_frame_oam 0x4000, 0x0, 0x8F, -19, -3
	banim_frame_oam 0x4000, 0x4000, 0xF3, -43, -11
	banim_frame_oam 0x4000, 0x0, 0xD3, -34, 9
	banim_frame_oam 0x4000, 0x1000, 0xD3, -19, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x0, 0xD3, -43, 9
	banim_frame_oam 0x4000, 0x1000, 0xD3, -28, 9
	banim_frame_oam 0x4000, 0x0, 0x97, -31, -37
	banim_frame_oam 0x0, 0x0, 0x99, -15, -37
	banim_frame_oam 0x4000, 0x0, 0xB7, -19, -5
	banim_frame_oam 0x0, 0x4000, 0x94, -35, -29
	banim_frame_oam 0x4000, 0x0, 0xD5, -35, -13
	banim_frame_oam 0x0, 0x0, 0xB3, -27, -5
	banim_frame_oam 0x8000, 0x0, 0x96, -19, -21
	banim_frame_oam 0x0, 0x0, 0x7E, -19, -25
	banim_frame_end
banim_myrm_sw1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xD3, -47, 9
	banim_frame_oam 0x4000, 0x1000, 0xD3, -32, 9
	banim_frame_oam 0x4000, 0x0, 0x9A, -22, -42
	banim_frame_oam 0x0, 0x0, 0xBA, -29, -34
	banim_frame_oam 0x0, 0x4000, 0xD9, -35, -27
	banim_frame_oam 0x0, 0x4000, 0xD7, -39, -11
	banim_frame_oam 0x0, 0x0, 0xB9, -23, -3
	banim_frame_end
banim_myrm_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0xDB, -67, -14
	banim_frame_oam 0x0, 0x0, 0xBB, -67, -22
	banim_frame_oam 0x8000, 0x0, 0x9C, -35, -15
	banim_frame_oam 0x8000, 0x8000, 0x9D, -51, -15
	banim_frame_oam 0x0, 0x1000, 0xD3, -35, 10
	banim_frame_oam 0x0, 0x0, 0x7D, -43, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0xDD, -51, 1
	banim_frame_oam 0x0, 0x1000, 0xD3, -35, 10
	banim_frame_oam 0x0, 0x4000, 0x1B, -51, -15
	banim_frame_oam 0x8000, 0x0, 0x1D, -35, -15
	banim_frame_oam 0x4000, 0x0, 0x5C, -67, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -53, -15
	banim_frame_oam 0x8000, 0x0, 0x2, -37, -15
	banim_frame_oam 0x0, 0x0, 0x62, -61, -6
	banim_frame_oam 0x4000, 0x0, 0x26, -43, 10
	banim_frame_oam 0x0, 0x0, 0xE9, -37, -7
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x9F, -32, 8
	banim_frame_end
banim_myrm_sw1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -49, -14
	banim_frame_oam 0x8000, 0x4000, 0x5, -33, -14
	banim_frame_oam 0x0, 0x0, 0x6, -25, 10
	banim_frame_end
banim_myrm_sw1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x4000, 0x7, -48, -6
	banim_frame_oam 0x4000, 0x0, 0x28, -40, -14
	banim_frame_oam 0x4000, 0x8000, 0x46, -48, 2
	banim_frame_oam 0x4000, 0x0, 0x2A, -16, 2
	banim_frame_oam 0x0, 0x0, 0x53, -48, -11
	banim_frame_end
banim_myrm_sw1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0x4A, -50, 2
	banim_frame_oam 0x4000, 0x4000, 0xB, -50, -6
	banim_frame_oam 0x4000, 0x0, 0x2C, -42, -14
	banim_frame_oam 0x4000, 0x0, 0x2E, -18, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x4000, 0xB, -50, -6
	banim_frame_oam 0x4000, 0x0, 0x2C, -42, -14
	banim_frame_oam 0x0, 0x4000, 0x4A, -50, 2
	banim_frame_oam 0x4000, 0x0, 0x6C, -34, 10
	banim_frame_oam 0x4000, 0x4000, 0xF, -35, 2
	banim_frame_oam 0x0, 0x0, 0x4C, -34, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x13, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x4F, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x51, -40, 0
	banim_frame_oam 0x4000, 0x0, 0x30, -24, 1
	banim_frame_oam 0x0, 0x0, 0x6E, -16, -15
	banim_frame_oam 0x0, 0x0, 0x32, -25, -24
	banim_frame_oam 0x4000, 0x1000, 0x78, -38, 10
	banim_frame_oam 0x0, 0x0, 0x78, -46, 10
	banim_frame_oam 0x4000, 0x0, 0x78, -44, 11
	banim_frame_end
banim_myrm_sw1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -29, -34
	banim_frame_oam 0x8000, 0x0, 0x16, -13, -34
	banim_frame_oam 0x0, 0x0, 0x56, -13, -18
	banim_frame_oam 0x0, 0x0, 0x33, -21, -2
	banim_frame_oam 0x4000, 0x1000, 0x78, -21, 9
	banim_frame_oam 0x0, 0x0, 0x78, -29, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x33, -20, -2
	banim_frame_oam 0x0, 0x4000, 0x17, -28, -34
	banim_frame_oam 0x8000, 0x0, 0x19, -12, -34
	banim_frame_oam 0x4000, 0x0, 0x57, -28, -18
	banim_frame_oam 0x0, 0x0, 0x59, -12, -18
	banim_frame_oam 0x0, 0x0, 0x77, -20, -10
	banim_frame_oam 0x0, 0x0, 0x76, -36, -20
	banim_frame_oam 0x4000, 0x1000, 0x78, -20, 9
	banim_frame_oam 0x0, 0x0, 0x78, -28, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x33, -18, -2
	banim_frame_oam 0x0, 0x4000, 0x17, -26, -34
	banim_frame_oam 0x8000, 0x0, 0x19, -10, -34
	banim_frame_oam 0x4000, 0x0, 0x57, -26, -18
	banim_frame_oam 0x0, 0x0, 0x59, -10, -18
	banim_frame_oam 0x0, 0x0, 0x77, -18, -10
	banim_frame_oam 0x0, 0x0, 0x76, -34, -20
	banim_frame_oam 0x4000, 0x1000, 0x78, -18, 9
	banim_frame_oam 0x0, 0x0, 0x78, -26, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x33, -17, -1
	banim_frame_oam 0x0, 0x4000, 0x17, -25, -33
	banim_frame_oam 0x8000, 0x0, 0x19, -9, -33
	banim_frame_oam 0x4000, 0x0, 0x57, -25, -17
	banim_frame_oam 0x0, 0x0, 0x59, -9, -17
	banim_frame_oam 0x0, 0x0, 0x77, -17, -9
	banim_frame_oam 0x0, 0x0, 0x76, -33, -19
	banim_frame_oam 0x4000, 0x1000, 0x78, -17, 9
	banim_frame_oam 0x0, 0x0, 0x78, -25, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x33, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x17, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x19, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x57, -24, -16
	banim_frame_oam 0x0, 0x0, 0x59, -8, -16
	banim_frame_oam 0x0, 0x0, 0x77, -16, -8
	banim_frame_oam 0x0, 0x0, 0x76, -32, -18
	banim_frame_oam 0x4000, 0x1000, 0x78, -16, 9
	banim_frame_oam 0x0, 0x0, 0x78, -24, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x33, -15, 1
	banim_frame_oam 0x0, 0x4000, 0x17, -23, -31
	banim_frame_oam 0x8000, 0x0, 0x19, -7, -31
	banim_frame_oam 0x4000, 0x0, 0x57, -23, -15
	banim_frame_oam 0x0, 0x0, 0x59, -7, -15
	banim_frame_oam 0x0, 0x0, 0x77, -15, -7
	banim_frame_oam 0x0, 0x0, 0x76, -31, -17
	banim_frame_oam 0x4000, 0x1000, 0x78, -15, 9
	banim_frame_oam 0x0, 0x0, 0x78, -23, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x33, -12, 3
	banim_frame_oam 0x0, 0x4000, 0x17, -20, -29
	banim_frame_oam 0x8000, 0x0, 0x19, -4, -29
	banim_frame_oam 0x4000, 0x0, 0x57, -20, -13
	banim_frame_oam 0x0, 0x0, 0x59, -4, -13
	banim_frame_oam 0x0, 0x0, 0x77, -12, -5
	banim_frame_oam 0x0, 0x0, 0x76, -28, -15
	banim_frame_oam 0x4000, 0x1000, 0x78, -12, 9
	banim_frame_oam 0x0, 0x0, 0x78, -20, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -11, 9
	banim_frame_oam 0x4000, 0x8000, 0xA0, -19, -7
	banim_frame_oam 0x8000, 0x0, 0xA4, 13, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -6, -15
	banim_frame_oam 0x0, 0x0, 0xE4, -1, -23
	banim_frame_oam 0x0, 0x0, 0x82, 10, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x8000, 0xC5, -10, 2
	banim_frame_oam 0x8000, 0x0, 0x88, 22, 3
	banim_frame_oam 0x0, 0x4000, 0x86, -3, -22
	banim_frame_oam 0x4000, 0x0, 0x84, -2, -6
	banim_frame_oam 0x0, 0x0, 0xA5, -10, -6
	banim_frame_end
banim_myrm_sw1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0xC5, -10, 2
	banim_frame_oam 0x8000, 0x0, 0x88, 22, 3
	banim_frame_oam 0x0, 0x0, 0xA5, -10, -6
	banim_frame_oam 0x0, 0x0, 0xA5, -10, -6
	banim_frame_oam 0x4000, 0x0, 0xC9, -2, -6
	banim_frame_oam 0x0, 0x4000, 0x89, -3, -22
	banim_frame_end
banim_myrm_sw1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x8000, 0xC5, -10, 2
	banim_frame_oam 0x8000, 0x0, 0x88, 22, 3
	banim_frame_oam 0x0, 0x0, 0xA5, -10, -6
	banim_frame_oam 0x0, 0x0, 0xA5, -10, -6
	banim_frame_oam 0x4000, 0x0, 0xC9, -2, -6
	banim_frame_oam 0x0, 0x4000, 0x8B, -3, -22
	banim_frame_oam 0x0, 0x0, 0xEB, -11, -14
	banim_frame_end
banim_myrm_sw1_oam_frame_70_r:
	banim_frame_oam 0x0, 0x8000, 0x8D, -6, -16
	banim_frame_end
banim_myrm_sw1_oam_frame_71_r:
	banim_frame_oam 0x0, 0x8000, 0x91, -1, -17
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x7C, -67, -22
	banim_frame_oam 0x0, 0x0, 0x5C, -65, -20
	banim_frame_end
banim_myrm_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x7C, -71, -9
	banim_frame_oam 0x0, 0x0, 0x5C, -69, -7
	banim_frame_end
banim_myrm_sw1_oam_frame_67_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, -10, -46
	banim_frame_oam 0x0, 0x4000, 0x3B, -2, -38
	banim_frame_oam 0x8000, 0x8000, 0x7A, -10, -22
	banim_frame_oam 0x8000, 0x4000, 0x7C, 6, -22
	banim_frame_oam 0x4000, 0x0, 0xFA, -10, 10
	banim_frame_oam 0x0, 0x0, 0xFC, 6, 10
	banim_frame_oam 0x8000, 0x4000, 0x99, 14, -14
	banim_frame_oam 0x0, 0x0, 0xF8, 22, 10
	banim_frame_oam 0x8000, 0x0, 0xD7, 22, -6
	banim_frame_oam 0x0, 0x0, 0xD8, 14, -22
	banim_frame_oam 0x0, 0x0, 0x5A, 14, -30
	banim_frame_end
banim_myrm_sw1_oam_frame_68_r:
	banim_frame_oam 0x4000, 0x4000, 0x1B, -15, 8
	banim_frame_oam 0x0, 0x4000, 0x3D, -7, -8
	banim_frame_oam 0x0, 0x0, 0x5F, 9, 0
	banim_frame_oam 0x0, 0x4000, 0xDD, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xDF, 9, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -8
	banim_frame_oam 0x8000, 0x0, 0x7D, -15, -8
	banim_frame_oam 0x4000, 0x0, 0xBD, -7, -32
	banim_frame_oam 0x0, 0x0, 0xBF, 9, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -13, -40
	banim_frame_oam 0x0, 0x0, 0x9E, -9, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -3, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 13, -15
	banim_frame_oam 0x8000, 0x0, 0x23, -11, 1
	banim_frame_oam 0x8000, 0x0, 0x24, 21, 1
	banim_frame_oam 0x0, 0x0, 0x63, 29, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x80, -11, -19
	banim_frame_oam 0x8000, 0x0, 0xA0, -19, -19
	banim_frame_oam 0x0, 0x0, 0xE0, -19, -3
	banim_frame_oam 0x0, 0x0, 0xC2, -3, 5
	banim_frame_oam 0x0, 0x0, 0xE2, 21, -3
	banim_frame_oam 0x0, 0x4000, 0xC3, 5, 7
	banim_frame_oam 0x0, 0x0, 0x64, 21, 15
	banim_frame_oam 0x8000, 0x4000, 0x81, -11, -11
	banim_frame_oam 0x0, 0x4000, 0x83, 5, -9
	banim_frame_oam 0x8000, 0x0, 0x82, -3, -11
	banim_frame_oam 0x4000, 0x0, 0x3, -12, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 3, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -11, -10
	banim_frame_oam 0x0, 0x4000, 0x45, 6, -26
	banim_frame_oam 0x0, 0x0, 0x47, 22, -26
	banim_frame_oam 0x0, 0x0, 0x67, -2, -18
	banim_frame_oam 0x8000, 0x0, 0x48, -6, 6
	banim_frame_oam 0x4000, 0x0, 0x3, -11, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 4, 9
	banim_frame_oam 0x0, 0x0, 0xB5, 8, 6
	banim_frame_end
banim_myrm_sw1_oam_frame_37_r:
	banim_frame_affine 221, -128, 128, 221, 1
	banim_frame_oam 0x4000, 0x0, 0x3, -10, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 5, 9
	banim_frame_oam 0x100, 0xC000, 0x18, -27, -37
	banim_frame_end
banim_myrm_sw1_oam_frame_38_r:
	banim_frame_oam 0x0, 0xC000, 0x18, -27, -37
	banim_frame_oam 0x4000, 0x0, 0x3, -9, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 6, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_39_r:
	banim_frame_affine 177, 184, -184, 177, 1
	banim_frame_oam 0x4000, 0x0, 0x3, -11, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 4, 9
	banim_frame_oam 0x100, 0xC000, 0x18, -30, -39
	banim_frame_end
banim_myrm_sw1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x8000, 0x85, -6, -25
	banim_frame_oam 0x4000, 0x0, 0xE5, 10, 7
	banim_frame_oam 0x0, 0x0, 0xC8, -14, -17
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_oam 0x4000, 0x0, 0xC5, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, 18, -9
	banim_frame_oam 0x0, 0x0, 0xE7, 15, -1
	banim_frame_oam 0x4000, 0x0, 0xE8, 7, -33
	banim_frame_oam 0x0, 0x0, 0xC9, 12, -41
	banim_frame_end
banim_myrm_sw1_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, 10, 7
	banim_frame_oam 0x4000, 0x0, 0xC5, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, 18, -9
	banim_frame_oam 0x0, 0x0, 0xE7, 15, -1
	banim_frame_oam 0x4000, 0x8000, 0xCA, -6, -25
	banim_frame_oam 0x4000, 0x0, 0xA9, 9, -33
	banim_frame_oam 0x0, 0x0, 0xC9, 12, -41
	banim_frame_oam 0x0, 0x0, 0x89, -14, -25
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, 10, 7
	banim_frame_oam 0x4000, 0x0, 0xC5, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, 18, -9
	banim_frame_oam 0x0, 0x0, 0xE7, 15, -1
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_oam 0x0, 0x4000, 0x2A, 2, -25
	banim_frame_oam 0x0, 0x0, 0x49, -6, -17
	banim_frame_oam 0x4000, 0x0, 0xA, 10, -33
	banim_frame_oam 0x0, 0x0, 0xC9, 12, -41
	banim_frame_oam 0x0, 0x0, 0x29, 2, -33
	banim_frame_oam 0x8000, 0x0, 0xC, 18, -25
	banim_frame_end
banim_myrm_sw1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, 10, 7
	banim_frame_oam 0x4000, 0x0, 0xC5, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, 18, -9
	banim_frame_oam 0x0, 0x0, 0xE7, 15, -1
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_oam 0x4000, 0x0, 0xAB, 10, -33
	banim_frame_oam 0x0, 0x0, 0xC9, 12, -40
	banim_frame_oam 0x0, 0x4000, 0x6A, 2, -25
	banim_frame_oam 0x8000, 0x0, 0x6C, 18, -25
	banim_frame_oam 0x0, 0x0, 0x69, -6, -17
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xE5, 10, 7
	banim_frame_oam 0x0, 0x0, 0xE7, 15, -1
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_oam 0x0, 0x4000, 0xD, 2, -17
	banim_frame_oam 0x8000, 0x0, 0xF, 18, -17
	banim_frame_oam 0x0, 0x0, 0x69, -6, -17
	banim_frame_oam 0x4000, 0x0, 0x4C, 2, -25
	banim_frame_oam 0x0, 0x0, 0x4E, 18, -25
	banim_frame_oam 0x4000, 0x0, 0x6D, 10, -33
	banim_frame_oam 0x0, 0x0, 0xC9, 12, -40
	banim_frame_end
banim_myrm_sw1_oam_frame_44_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -1, -14
	banim_frame_oam 0x8000, 0x8000, 0x12, 15, -17
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x8D, -18, 9
	banim_frame_oam 0x0, 0x0, 0xAD, -2, 7
	banim_frame_oam 0x0, 0x4000, 0x8E, -2, -9
	banim_frame_oam 0x8000, 0x0, 0x90, 14, -9
	banim_frame_oam 0x8000, 0x0, 0xCE, -10, 1
	banim_frame_oam 0x4000, 0x0, 0xCF, 6, 7
	banim_frame_oam 0x4000, 0x0, 0x3, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 9, 9
	banim_frame_end
banim_myrm_sw1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x8000, 0xD1, -14, 5
	banim_frame_oam 0x8000, 0x0, 0xD5, 18, 5
	banim_frame_oam 0x0, 0x0, 0xF0, -14, -3
	banim_frame_oam 0x0, 0x0, 0xEF, -22, 7
	banim_frame_oam 0x0, 0x4000, 0x91, -6, -11
	banim_frame_oam 0x8000, 0x0, 0x93, 10, -11
	banim_frame_oam 0x0, 0x0, 0xB4, 18, -3
	banim_frame_oam 0x4000, 0x0, 0x3, -14, 6
	banim_frame_oam 0x4000, 0x1000, 0x3, 1, 6
	banim_frame_oam 0x4000, 0x0, 0x3, -7, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, 8, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 1, 13
	banim_frame_oam 0x4000, 0x1000, 0x3, 16, 13
	banim_frame_end
banim_myrm_sw1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x0, 0x3, 43, 21
	banim_frame_oam 0x0, 0x8000, 0x80, 11, -3
	banim_frame_oam 0x8000, 0x8000, 0x4, -5, -20
	banim_frame_oam 0x4000, 0x0, 0x84, -5, 12
	banim_frame_oam 0x0, 0x4000, 0x6, 11, -19
	banim_frame_oam 0x4000, 0x0, 0x8, 27, -11
	banim_frame_oam 0x8000, 0x0, 0xA4, 43, -1
	banim_frame_oam 0x0, 0x0, 0x23, -13, 5
	banim_frame_end
banim_myrm_sw1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x0, 0x28, 47, 2
	banim_frame_oam 0x0, 0x8000, 0x88, 15, -3
	banim_frame_oam 0x4000, 0x0, 0x46, 31, -11
	banim_frame_oam 0x0, 0x4000, 0x48, 15, -19
	banim_frame_oam 0x8000, 0x0, 0x4A, -9, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, -17, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 7, 21
	banim_frame_oam 0x8000, 0x8000, 0x66, -1, -23
	banim_frame_oam 0x4000, 0x0, 0xE6, -1, 9
	banim_frame_oam 0x0, 0x0, 0xE4, -9, 1
	banim_frame_end
banim_myrm_sw1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0x99, -58, -4
	banim_frame_oam 0x4000, 0x0, 0xBB, -60, -12
	banim_frame_oam 0x0, 0x0, 0x9C, -42, 4
	banim_frame_oam 0x4000, 0x0, 0xD8, -42, 12
	banim_frame_oam 0x4000, 0x0, 0xDA, -26, 17
	banim_frame_oam 0x4000, 0x4000, 0xF8, -10, 22
	banim_frame_oam 0x4000, 0x8000, 0xDC, 22, 20
	banim_frame_oam 0x0, 0x4000, 0x9D, 46, 4
	banim_frame_oam 0x8000, 0x0, 0x9F, 62, 4
	banim_frame_oam 0x4000, 0x0, 0x3E, 54, 20
	banim_frame_oam 0x0, 0x0, 0x1E, 66, -4
	banim_frame_oam 0x0, 0x0, 0x7C, 70, 4
	banim_frame_oam 0x0, 0x4000, 0x1C, 50, -12
	banim_frame_oam 0x0, 0x4000, 0x5D, 37, -28
	banim_frame_oam 0x8000, 0x0, 0x5F, 53, -28
	banim_frame_oam 0x0, 0x0, 0x5C, 29, -28
	banim_frame_end
banim_myrm_sw1_oam_frame_61_r:
	banim_frame_oam 0x8000, 0x0, 0x5B, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x5A, -72, -32
	banim_frame_end
banim_myrm_sw1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x36, -92, -47
	banim_frame_oam 0x0, 0x0, 0x16, -95, -55
	banim_frame_oam 0x0, 0x0, 0x17, -76, -39
	banim_frame_oam 0x4000, 0x0, 0x76, -79, -15
	banim_frame_oam 0x4000, 0x0, 0x18, -55, -9
	banim_frame_oam 0x0, 0x0, 0x39, -44, -1
	banim_frame_oam 0x0, 0x0, 0x38, -71, -23
	banim_frame_oam 0x8000, 0x0, 0x1A, -67, -7
	banim_frame_oam 0x8000, 0x0, 0x1B, -59, 1
	banim_frame_oam 0x0, 0x4000, 0x58, -87, -31
	banim_frame_end
banim_myrm_sw1_oam_frame_62_r:
	banim_frame_oam 0x0, 0x4000, 0x96, -69, -23
	banim_frame_end
banim_myrm_sw1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x6000, 0x99, -58, -30
	banim_frame_oam 0x4000, 0x2000, 0xBB, -60, -14
	banim_frame_oam 0x0, 0x2000, 0x9C, -42, -30
	banim_frame_oam 0x4000, 0x2000, 0xD8, -42, -38
	banim_frame_oam 0x4000, 0x2000, 0xDA, -26, -43
	banim_frame_oam 0x4000, 0x6000, 0xF8, -10, -48
	banim_frame_oam 0x4000, 0xA000, 0xDC, 22, -54
	banim_frame_oam 0x0, 0x6000, 0x9D, 46, -38
	banim_frame_oam 0x8000, 0x2000, 0x9F, 62, -38
	banim_frame_oam 0x4000, 0x2000, 0x3E, 54, -46
	banim_frame_oam 0x0, 0x2000, 0x1E, 66, -22
	banim_frame_oam 0x0, 0x2000, 0x7C, 70, -30
	banim_frame_oam 0x0, 0x6000, 0x1C, 50, -22
	banim_frame_oam 0x0, 0x6000, 0x5D, 37, -6
	banim_frame_oam 0x8000, 0x2000, 0x5F, 53, -6
	banim_frame_oam 0x0, 0x2000, 0x5C, 29, 2
	banim_frame_end
banim_myrm_sw1_oam_frame_63_r:
	banim_frame_oam 0x8000, 0x2000, 0x5B, -64, -10
	banim_frame_oam 0x8000, 0x2000, 0x5A, -72, -2
	banim_frame_end
banim_myrm_sw1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0xCF, -88, 24
	banim_frame_oam 0x0, 0x4000, 0x8F, -83, 8
	banim_frame_oam 0x4000, 0x0, 0x6F, -82, 1
	banim_frame_oam 0x4000, 0x0, 0x6D, -67, 9
	banim_frame_oam 0x4000, 0x0, 0x4D, -72, 21
	banim_frame_oam 0x0, 0x4000, 0xD, -66, -7
	banim_frame_oam 0x0, 0x0, 0x4C, -50, -5
	banim_frame_oam 0x0, 0x0, 0x2C, -42, -11
	banim_frame_oam 0x0, 0x0, 0xC, -66, -15
	banim_frame_oam 0x0, 0x0, 0xF1, -91, 40
	banim_frame_end
banim_myrm_sw1_oam_frame_64_r:
	banim_frame_oam 0x8000, 0x0, 0xB, -60, -20
	banim_frame_oam 0x8000, 0x0, 0x4B, -52, -26
	banim_frame_end
banim_myrm_sw1_oam_frame_56_r:
	banim_frame_oam 0x0, 0x0, 0x4F, 44, -1
	banim_frame_oam 0x0, 0x0, 0x57, 36, 6
	banim_frame_oam 0x0, 0x0, 0x37, 28, 6
	banim_frame_oam 0x0, 0x0, 0x17, 20, 6
	banim_frame_oam 0x0, 0x4000, 0x34, -60, -11
	banim_frame_oam 0x8000, 0x0, 0x36, -44, -11
	banim_frame_oam 0x4000, 0x4000, 0x74, -36, -8
	banim_frame_oam 0x4000, 0x0, 0x94, -4, -4
	banim_frame_oam 0x0, 0x4000, 0x96, 12, -10
	banim_frame_oam 0x0, 0x4000, 0xD6, 28, -10
	banim_frame_end
banim_myrm_sw1_oam_frame_65_r:
	banim_frame_oam 0x4000, 0x0, 0x73, -78, -13
	banim_frame_oam 0x0, 0x0, 0x75, -62, -13
	banim_frame_end
banim_myrm_sw1_oam_frame_57_r:
	banim_frame_oam 0x4000, 0x0, 0xB3, -59, -12
	banim_frame_oam 0x0, 0x0, 0xB5, -43, -12
	banim_frame_oam 0x0, 0x0, 0xD2, -123, -24
	banim_frame_oam 0x0, 0x0, 0xF2, -115, -22
	banim_frame_oam 0x8000, 0x0, 0xD6, -83, -16
	banim_frame_oam 0x8000, 0x0, 0xD7, -75, -12
	banim_frame_oam 0x4000, 0x0, 0xB1, -53, 3
	banim_frame_oam 0x4000, 0x0, 0x94, -67, -5
	banim_frame_oam 0x8000, 0x0, 0xD3, -107, -21
	banim_frame_oam 0x0, 0x4000, 0xD4, -99, -20
	banim_frame_end
banim_myrm_sw1_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x0, 0x91, -82, -15
	banim_frame_oam 0x0, 0x0, 0x93, -66, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_58_r:
	banim_frame_oam 0x0, 0x4000, 0x30, -119, -33
	banim_frame_oam 0x8000, 0x0, 0x52, -127, -32
	banim_frame_oam 0x4000, 0x4000, 0x12, -95, -32
	banim_frame_oam 0x0, 0x0, 0x71, -103, -32
	banim_frame_oam 0x4000, 0x0, 0x32, -118, -17
	banim_frame_oam 0x4000, 0x0, 0x34, -110, -9
	banim_frame_oam 0x4000, 0x0, 0x54, -102, -1
	banim_frame_oam 0x0, 0x0, 0x53, -88, 7
	banim_frame_end
banim_myrm_sw1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_myrm_sw1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x1B, -60, -25
	banim_frame_oam 0x4000, 0x4000, 0x5B, -60, -9
	banim_frame_oam 0x8000, 0x0, 0x9F, -44, -1
	banim_frame_oam 0x8000, 0x0, 0xDF, -52, -1
	banim_frame_oam 0x8000, 0x0, 0x7E, -36, -1
	banim_frame_end
banim_myrm_sw1_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x20, 8, -7
	banim_frame_oam 0x0, 0x0, 0x22, 24, -7
	banim_frame_oam 0x4000, 0x0, 0x0, 7, -15
	banim_frame_oam 0x0, 0x0, 0x2, 23, -15
	banim_frame_end
banim_myrm_sw1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x0, 0xE6, -1, 9
	banim_frame_oam 0x0, 0x4000, 0xCC, 6, 2
	banim_frame_oam 0x8000, 0x0, 0xCE, 22, 2
	banim_frame_oam 0x0, 0x0, 0x28, 32, -7
	banim_frame_oam 0x8000, 0x0, 0xA5, -8, -28
	banim_frame_oam 0x0, 0x4000, 0x8C, 8, -14
	banim_frame_oam 0x8000, 0x0, 0x8E, 24, -14
	banim_frame_oam 0x0, 0x0, 0x29, 9, -22
	banim_frame_oam 0x0, 0x0, 0x6A, 1, -11
	banim_frame_oam 0x0, 0x0, 0x2A, 0, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xD, -59, -30
	banim_frame_oam 0x8000, 0x8000, 0x11, -27, -30
	banim_frame_oam 0x4000, 0x0, 0xB3, -42, 9
	banim_frame_oam 0x4000, 0x0, 0xD3, -26, 9
	banim_frame_oam 0x0, 0x4000, 0xCB, -70, -17
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xB3, -44, 9
	banim_frame_oam 0x4000, 0x0, 0xD3, -28, 9
	banim_frame_oam 0x0, 0x8000, 0x8E, -54, -29
	banim_frame_oam 0x8000, 0x4000, 0x92, -22, -29
	banim_frame_oam 0x0, 0x4000, 0xCB, -69, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x17, -57, -26
	banim_frame_oam 0x4000, 0x4000, 0x97, -57, 6
	banim_frame_oam 0x4000, 0x0, 0xB3, -54, 7
	banim_frame_oam 0x4000, 0x0, 0xD3, -38, 7
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x1B, -60, -25
	banim_frame_oam 0x4000, 0x4000, 0x9B, -60, 7
	banim_frame_end
banim_myrm_sw1_oam_frame_69_r:
	banim_frame_oam 0x4000, 0x0, 0xCB, -10, -42
	banim_frame_oam 0x0, 0x3000, 0xCC, -10, -34
	banim_frame_oam 0x0, 0x0, 0xEC, -2, -34
	banim_frame_oam 0x0, 0x0, 0xCC, 6, -34
	banim_frame_oam 0x0, 0x3000, 0xCC, -2, -26
	banim_frame_oam 0x4000, 0x4000, 0x1B, -15, 8
	banim_frame_oam 0x0, 0x4000, 0x3D, -7, -8
	banim_frame_oam 0x0, 0x0, 0x5F, 9, 0
	banim_frame_oam 0x0, 0x4000, 0xDD, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xDF, 9, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -8
	banim_frame_oam 0x8000, 0x0, 0x7D, -15, -8
	banim_frame_oam 0x4000, 0x0, 0xBD, -7, -32
	banim_frame_oam 0x0, 0x0, 0xBF, 9, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -13, -40
	banim_frame_oam 0x0, 0x0, 0x9E, -9, -48
	banim_frame_end
	.section .data.script
banim_myrm_sw1_script:
banim_myrm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 1, banim_myrm_sw1_oam_frame_1_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_0, 2, banim_myrm_sw1_oam_frame_2_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 3, banim_myrm_sw1_oam_frame_3_r - banim_myrm_sw1_oam_r
	banim_code_frame 6, banim_myrm_sw1_sheet_0, 4, banim_myrm_sw1_oam_frame_4_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 5, banim_myrm_sw1_oam_frame_5_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 6, banim_myrm_sw1_oam_frame_6_r - banim_myrm_sw1_oam_r
	banim_code_frame 8, banim_myrm_sw1_sheet_0, 7, banim_myrm_sw1_oam_frame_7_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 8, banim_myrm_sw1_oam_frame_8_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 9, banim_myrm_sw1_oam_frame_9_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 10, banim_myrm_sw1_oam_frame_10_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 12, banim_myrm_sw1_oam_frame_11_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 13, banim_myrm_sw1_oam_frame_12_r - banim_myrm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 14, banim_myrm_sw1_oam_frame_13_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 15, banim_myrm_sw1_oam_frame_14_r - banim_myrm_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 17, banim_myrm_sw1_oam_frame_15_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 18, banim_myrm_sw1_oam_frame_16_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 19, banim_myrm_sw1_oam_frame_17_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 20, banim_myrm_sw1_oam_frame_18_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 21, banim_myrm_sw1_oam_frame_19_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 22, banim_myrm_sw1_oam_frame_20_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 23, banim_myrm_sw1_oam_frame_21_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 24, banim_myrm_sw1_oam_frame_22_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 25, banim_myrm_sw1_oam_frame_23_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 26, banim_myrm_sw1_oam_frame_24_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 27, banim_myrm_sw1_oam_frame_25_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 28, banim_myrm_sw1_oam_frame_26_r - banim_myrm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 29, banim_myrm_sw1_oam_frame_27_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 30, banim_myrm_sw1_oam_frame_28_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 31, banim_myrm_sw1_oam_frame_29_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 32, banim_myrm_sw1_oam_frame_30_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 6, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 8, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 36, banim_myrm_sw1_oam_frame_32_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 43, banim_myrm_sw1_oam_frame_34_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 44, banim_myrm_sw1_oam_frame_35_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 45, banim_myrm_sw1_oam_frame_36_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 46, banim_myrm_sw1_oam_frame_37_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 47, banim_myrm_sw1_oam_frame_38_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 48, banim_myrm_sw1_oam_frame_39_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 49, banim_myrm_sw1_oam_frame_40_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 50, banim_myrm_sw1_oam_frame_41_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 51, banim_myrm_sw1_oam_frame_42_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 52, banim_myrm_sw1_oam_frame_43_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_2, 54, banim_myrm_sw1_oam_frame_44_r - banim_myrm_sw1_oam_r
	banim_code_frame 8, banim_myrm_sw1_sheet_2, 55, banim_myrm_sw1_oam_frame_45_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 56, banim_myrm_sw1_oam_frame_46_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 77, banim_myrm_sw1_oam_frame_47_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 57, banim_myrm_sw1_oam_frame_48_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 77, banim_myrm_sw1_oam_frame_47_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 58, banim_myrm_sw1_oam_frame_49_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 78, banim_myrm_sw1_oam_frame_50_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 58, banim_myrm_sw1_oam_frame_49_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 78, banim_myrm_sw1_oam_frame_50_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 58, banim_myrm_sw1_oam_frame_49_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 78, banim_myrm_sw1_oam_frame_50_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 58, banim_myrm_sw1_oam_frame_49_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 78, banim_myrm_sw1_oam_frame_50_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 59, banim_myrm_sw1_oam_frame_51_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 61, banim_myrm_sw1_oam_frame_52_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 63, banim_myrm_sw1_oam_frame_54_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 65, banim_myrm_sw1_oam_frame_55_r - banim_myrm_sw1_oam_r
	banim_code_frame 15, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 67, banim_myrm_sw1_oam_frame_56_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 69, banim_myrm_sw1_oam_frame_57_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 71, banim_myrm_sw1_oam_frame_58_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_0, 11, banim_myrm_sw1_oam_frame_60_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 12, banim_myrm_sw1_oam_frame_11_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 13, banim_myrm_sw1_oam_frame_12_r - banim_myrm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 5, banim_myrm_sw1_sheet_0, 14, banim_myrm_sw1_oam_frame_13_r - banim_myrm_sw1_oam_r
	banim_code_hit_critical_2
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 15, banim_myrm_sw1_oam_frame_14_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 17, banim_myrm_sw1_oam_frame_15_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 18, banim_myrm_sw1_oam_frame_16_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 19, banim_myrm_sw1_oam_frame_17_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 20, banim_myrm_sw1_oam_frame_18_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 21, banim_myrm_sw1_oam_frame_19_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 22, banim_myrm_sw1_oam_frame_20_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 23, banim_myrm_sw1_oam_frame_21_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 24, banim_myrm_sw1_oam_frame_22_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 25, banim_myrm_sw1_oam_frame_23_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 26, banim_myrm_sw1_oam_frame_24_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 27, banim_myrm_sw1_oam_frame_25_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 28, banim_myrm_sw1_oam_frame_26_r - banim_myrm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 29, banim_myrm_sw1_oam_frame_27_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 30, banim_myrm_sw1_oam_frame_28_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 31, banim_myrm_sw1_oam_frame_29_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 32, banim_myrm_sw1_oam_frame_30_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 8, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 60, banim_myrm_sw1_oam_frame_61_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 62, banim_myrm_sw1_oam_frame_62_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 64, banim_myrm_sw1_oam_frame_63_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 66, banim_myrm_sw1_oam_frame_64_r - banim_myrm_sw1_oam_r
	banim_code_frame 15, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 68, banim_myrm_sw1_oam_frame_65_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_myrm_sw1_sheet_3, 70, banim_myrm_sw1_oam_frame_66_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_2, 74, banim_myrm_sw1_oam_frame_53_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_3, 75, banim_myrm_sw1_oam_frame_59_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 72, banim_myrm_sw1_oam_frame_31_r - banim_myrm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 5, banim_myrm_sw1_sheet_0, 36, banim_myrm_sw1_oam_frame_32_r - banim_myrm_sw1_oam_r
	banim_code_hit_critical_2
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 73, banim_myrm_sw1_oam_frame_33_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 37, banim_myrm_sw1_oam_frame_67_r - banim_myrm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 38, banim_myrm_sw1_oam_frame_68_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 37, banim_myrm_sw1_oam_frame_67_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 37, banim_myrm_sw1_oam_frame_67_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 83, banim_myrm_sw1_oam_frame_69_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 38, banim_myrm_sw1_oam_frame_68_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_1, 83, banim_myrm_sw1_oam_frame_69_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 38, banim_myrm_sw1_oam_frame_68_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 83, banim_myrm_sw1_oam_frame_69_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 38, banim_myrm_sw1_oam_frame_68_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_1, 83, banim_myrm_sw1_oam_frame_69_r - banim_myrm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 38, banim_myrm_sw1_oam_frame_68_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 37, banim_myrm_sw1_oam_frame_67_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 33, banim_myrm_sw1_oam_frame_70_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 34, banim_myrm_sw1_oam_frame_71_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 33, banim_myrm_sw1_oam_frame_70_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 33, banim_myrm_sw1_oam_frame_70_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 34, banim_myrm_sw1_oam_frame_71_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_myrm_sw1_sheet_1, 33, banim_myrm_sw1_oam_frame_70_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrm_sw1_mode_stand_close:
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrm_sw1_mode_stand:
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrm_sw1_mode_stand_range:
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 0, banim_myrm_sw1_oam_frame_0_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 1, banim_myrm_sw1_oam_frame_1_r - banim_myrm_sw1_oam_r
	banim_code_frame 4, banim_myrm_sw1_sheet_0, 2, banim_myrm_sw1_oam_frame_2_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 3, banim_myrm_sw1_oam_frame_3_r - banim_myrm_sw1_oam_r
	banim_code_frame 6, banim_myrm_sw1_sheet_0, 4, banim_myrm_sw1_oam_frame_4_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 5, banim_myrm_sw1_oam_frame_5_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 6, banim_myrm_sw1_oam_frame_6_r - banim_myrm_sw1_oam_r
	banim_code_frame 13, banim_myrm_sw1_sheet_0, 7, banim_myrm_sw1_oam_frame_7_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 8, banim_myrm_sw1_oam_frame_8_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 9, banim_myrm_sw1_oam_frame_9_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 10, banim_myrm_sw1_oam_frame_10_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_0, 11, banim_myrm_sw1_oam_frame_60_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 13, banim_myrm_sw1_oam_frame_12_r - banim_myrm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_myrm_sw1_sheet_0, 14, banim_myrm_sw1_oam_frame_13_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 15, banim_myrm_sw1_oam_frame_14_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 17, banim_myrm_sw1_oam_frame_15_r - banim_myrm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 18, banim_myrm_sw1_oam_frame_16_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 19, banim_myrm_sw1_oam_frame_17_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 20, banim_myrm_sw1_oam_frame_18_r - banim_myrm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 21, banim_myrm_sw1_oam_frame_19_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 22, banim_myrm_sw1_oam_frame_20_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 23, banim_myrm_sw1_oam_frame_21_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 24, banim_myrm_sw1_oam_frame_22_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 25, banim_myrm_sw1_oam_frame_23_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 26, banim_myrm_sw1_oam_frame_24_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 27, banim_myrm_sw1_oam_frame_25_r - banim_myrm_sw1_oam_r
	banim_code_frame 1, banim_myrm_sw1_sheet_1, 28, banim_myrm_sw1_oam_frame_26_r - banim_myrm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 29, banim_myrm_sw1_oam_frame_27_r - banim_myrm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 30, banim_myrm_sw1_oam_frame_28_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 31, banim_myrm_sw1_oam_frame_29_r - banim_myrm_sw1_oam_r
	banim_code_frame 2, banim_myrm_sw1_sheet_1, 32, banim_myrm_sw1_oam_frame_30_r - banim_myrm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_myrm_sw1_mode_attack_close - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_close_back - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_close_critical - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_close_critical_back - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_range - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_range_critical - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_dodge_close - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_dodge_range - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_stand_close - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_stand - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_stand_range - banim_myrm_sw1_script
	.word banim_myrm_sw1_mode_attack_miss - banim_myrm_sw1_script
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

