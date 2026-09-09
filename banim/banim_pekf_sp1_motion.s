@ vim:ft=armv4
	.global banim_pekf_sp1_script
	.global banim_pekf_sp1_oam_r
	.global banim_pekf_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x65
	.section .data.oam_l
banim_pekf_sp1_oam_l:
banim_pekf_sp1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -2, 5
	banim_frame_oam 0x4000, 0x1000, 0x47, -18, 9
	banim_frame_oam 0x0, 0x1000, 0x66, -26, 9
	banim_frame_oam 0x4000, 0x9000, 0xC0, -10, -11
	banim_frame_oam 0x0, 0x5000, 0xC4, -26, -11
	banim_frame_oam 0x8000, 0x9000, 0x0, 6, -59
	banim_frame_oam 0x0, 0x5000, 0x80, 6, -27
	banim_frame_oam 0x0, 0x9000, 0x22, -26, -51
	banim_frame_oam 0x4000, 0x5000, 0xA2, -26, -19
	banim_frame_oam 0x4000, 0x1000, 0x3, -18, -59
	banim_frame_oam 0x0, 0x1000, 0x5, -26, -59
	banim_frame_oam 0x8000, 0x1000, 0x6, -34, -59
	banim_frame_oam 0x0, 0x1000, 0x46, -34, -43
	banim_frame_oam 0x0, 0x1000, 0x2, -18, -67
	banim_frame_oam 0x4000, 0x1000, 0x86, 22, -34
	banim_frame_oam 0x0, 0x1000, 0x67, 22, -42
	banim_frame_end
banim_pekf_sp1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, -18, -40
	banim_frame_oam 0x8000, 0x1000, 0xE, -26, -40
	banim_frame_oam 0x4000, 0x5000, 0x4A, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x4E, -26, -24
	banim_frame_oam 0x8000, 0x1000, 0x29, 14, -32
	banim_frame_oam 0x4000, 0x9000, 0x6A, -18, -16
	banim_frame_oam 0x4000, 0x5000, 0xAA, -18, 0
	banim_frame_oam 0x4000, 0x1000, 0xA6, 22, -22
	banim_frame_oam 0x0, 0x1000, 0xC7, 22, -14
	banim_frame_oam 0x0, 0x1000, 0xC6, 1, -48
	banim_frame_oam 0x4000, 0x1000, 0xE6, -23, -48
	banim_frame_oam 0x4000, 0x1000, 0xA8, -26, -56
	banim_frame_oam 0x0, 0x1000, 0x47, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x47, -12, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 4, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -20, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -18, -37
	banim_frame_oam 0x0, 0x5000, 0xC8, -7, -5
	banim_frame_oam 0x8000, 0x1000, 0xCA, -15, -5
	banim_frame_oam 0x8000, 0x1000, 0x6E, 14, -28
	banim_frame_oam 0x4000, 0x1000, 0x88, -26, -45
	banim_frame_oam 0x4000, 0x1000, 0xA6, 22, -22
	banim_frame_oam 0x0, 0x1000, 0xC7, 22, -14
	banim_frame_oam 0x0, 0x1000, 0x47, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x47, -12, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 4, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -20, 9
	banim_frame_oam 0x8000, 0x1000, 0x13, -26, -37
	banim_frame_oam 0x0, 0x1000, 0x53, -26, -21
	banim_frame_end
banim_pekf_sp1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x8F, 11, -17
	banim_frame_oam 0x0, 0x5000, 0x93, -5, -17
	banim_frame_oam 0x0, 0x1000, 0xD2, 11, -1
	banim_frame_oam 0x0, 0x5000, 0xCB, 51, -17
	banim_frame_oam 0x8000, 0x1000, 0xCD, 43, -17
	banim_frame_oam 0x8000, 0x1000, 0xAE, -13, -17
	banim_frame_oam 0x0, 0x1000, 0xEE, -13, -1
	banim_frame_oam 0x4000, 0x5000, 0x14, 11, -25
	banim_frame_oam 0x4000, 0x1000, 0x18, -5, -25
	banim_frame_oam 0x0, 0x1000, 0x1A, -13, -25
	banim_frame_oam 0x0, 0x1000, 0xD1, 19, -1
	banim_frame_oam 0x4000, 0x1000, 0xF3, -29, -1
	banim_frame_oam 0x4000, 0x1000, 0xD3, -29, -9
	banim_frame_oam 0x0, 0x1000, 0xD5, -37, -9
	banim_frame_oam 0x4000, 0x1000, 0xF1, -37, -17
	banim_frame_oam 0x4000, 0x1000, 0xCF, 27, -1
	banim_frame_oam 0x0, 0x1000, 0xF0, 27, 7
	banim_frame_oam 0x0, 0x1000, 0x47, 18, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 10, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 26, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -6, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 2, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x37, 39, -26
	banim_frame_oam 0x8000, 0x5000, 0x39, 31, -26
	banim_frame_oam 0x4000, 0x1000, 0xB6, 42, 6
	banim_frame_oam 0x8000, 0x1000, 0x75, 63, -9
	banim_frame_oam 0x8000, 0x1000, 0x56, 55, -18
	banim_frame_oam 0x0, 0x1000, 0x96, 55, -2
	banim_frame_oam 0x0, 0x5000, 0x34, 15, -22
	banim_frame_oam 0x0, 0x1000, 0x47, 43, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 35, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 51, 9
	banim_frame_oam 0x0, 0x2000, 0x68, 27, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0x1B, 53, -25
	banim_frame_oam 0x4000, 0x1000, 0x5B, 69, -9
	banim_frame_oam 0x0, 0x1000, 0x5D, 61, -9
	banim_frame_oam 0x0, 0x1000, 0x5E, 69, -1
	banim_frame_oam 0x0, 0x1000, 0x3F, 45, -22
	banim_frame_oam 0x8000, 0x1000, 0x3A, 85, -25
	banim_frame_oam 0x0, 0x1000, 0x7A, 85, -9
	banim_frame_oam 0x8000, 0x1000, 0xD6, 93, -25
	banim_frame_end
banim_pekf_sp1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x7B, 41, -27
	banim_frame_oam 0x8000, 0x5000, 0x7D, 33, -27
	banim_frame_oam 0x4000, 0x1000, 0xFB, 41, 5
	banim_frame_oam 0x0, 0x1000, 0xFD, 33, 5
	banim_frame_oam 0x0, 0x5000, 0x9E, 17, -19
	banim_frame_oam 0x8000, 0x1000, 0xDE, 25, -3
	banim_frame_oam 0x0, 0x1000, 0x47, 42, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 34, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 50, 9
	banim_frame_oam 0x0, 0x2000, 0x68, 26, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x1000, 0xB8, 55, -27
	banim_frame_oam 0x0, 0x1000, 0xBA, 47, -27
	banim_frame_oam 0x4000, 0x5000, 0xD7, 47, -19
	banim_frame_oam 0x4000, 0x5000, 0xF7, 47, -11
	banim_frame_oam 0x0, 0x1000, 0xF5, 79, -19
	banim_frame_oam 0x4000, 0x1000, 0x7E, 71, -3
	banim_frame_oam 0x0, 0x1000, 0x5F, 79, -11
	banim_frame_end
banim_pekf_sp1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x20, 22, -24
	banim_frame_oam 0x4000, 0x1000, 0xA0, 38, 8
	banim_frame_oam 0x0, 0x1000, 0xA2, 30, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 30, -32
	banim_frame_oam 0x0, 0x1000, 0x2, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 53, -30
	banim_frame_oam 0x8000, 0x1000, 0xC2, 45, -30
	banim_frame_oam 0x0, 0x1000, 0xA3, 69, -22
	banim_frame_oam 0x4000, 0x5000, 0xC3, 53, -14
	banim_frame_oam 0x0, 0x1000, 0xC7, 45, -14
	banim_frame_oam 0x4000, 0x5000, 0xE3, 53, -6
	banim_frame_end
banim_pekf_sp1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x20, 22, -24
	banim_frame_oam 0x4000, 0x1000, 0xA0, 38, 8
	banim_frame_oam 0x0, 0x1000, 0xA2, 30, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 30, -32
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x1000, 0xB, 18, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 34, 9
	banim_frame_oam 0x4000, 0x5000, 0xD, 7, -67
	banim_frame_oam 0x0, 0x5000, 0x31, -17, -51
	banim_frame_oam 0x8000, 0x1000, 0x50, 7, -51
	banim_frame_oam 0x4000, 0x1000, 0x2D, 23, -59
	banim_frame_oam 0x0, 0x1000, 0x2F, 15, -59
	banim_frame_oam 0x8000, 0x1000, 0x4F, 15, -51
	banim_frame_oam 0x4000, 0x1000, 0x61, 23, -51
	banim_frame_oam 0x0, 0x1000, 0x82, 23, -43
	banim_frame_oam 0x8000, 0x1000, 0x71, -1, -43
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -35
	banim_frame_oam 0x0, 0x1000, 0x92, -9, -35
	banim_frame_oam 0x0, 0x1000, 0x8F, -3, -11
	banim_frame_oam 0x4000, 0x5000, 0x1, 7, -75
	banim_frame_oam 0x4000, 0x1000, 0xA3, 15, -83
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -61
	banim_frame_oam 0x0, 0x1000, 0x5, -5, -55
	banim_frame_oam 0x4000, 0x1000, 0x80, 31, -43
	banim_frame_oam 0x0, 0x5000, 0xAE, -8, -27
	banim_frame_oam 0x8000, 0x1000, 0x2C, 39, -59
	banim_frame_oam 0x0, 0x5000, 0x4D, 55, -55
	banim_frame_oam 0x0, 0x1000, 0x6C, 71, -47
	banim_frame_oam 0x8000, 0x1000, 0x2B, 47, -55
	banim_frame_oam 0x0, 0x1000, 0x8E, 55, -39
	banim_frame_oam 0x0, 0x5000, 0x8C, 63, -39
	banim_frame_oam 0x0, 0x1000, 0xA0, 31, -35
	banim_frame_oam 0x0, 0x1000, 0x4A, 64, -23
	banim_frame_end
banim_pekf_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 8, -38
	banim_frame_oam 0x4000, 0x5000, 0x84, 24, -6
	banim_frame_oam 0x0, 0x1000, 0x88, 16, -6
	banim_frame_oam 0x4000, 0x1000, 0xA4, 40, 2
	banim_frame_oam 0x0, 0x1000, 0xA6, 32, 2
	banim_frame_oam 0x0, 0x5000, 0x24, 40, -30
	banim_frame_oam 0x4000, 0x1000, 0x64, 40, -14
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, 53, -31
	banim_frame_oam 0x8000, 0x1000, 0xE, 45, -31
	banim_frame_oam 0x4000, 0x5000, 0x4A, 53, -15
	banim_frame_oam 0x0, 0x1000, 0x4E, 45, -15
	banim_frame_oam 0x4000, 0x1000, 0x6A, 69, -7
	banim_frame_oam 0x0, 0x1000, 0x6C, 61, -7
	banim_frame_oam 0x4000, 0x1000, 0xA7, 61, -39
	banim_frame_oam 0x0, 0x1000, 0xA9, 53, -39
	banim_frame_end
banim_pekf_sp1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x8A, 46, -50
	banim_frame_oam 0x4000, 0x5000, 0xCA, 46, -34
	banim_frame_oam 0x4000, 0x9000, 0xAE, 14, -42
	banim_frame_oam 0x8000, 0x1000, 0xB4, -10, -42
	banim_frame_oam 0x4000, 0x5000, 0xEB, 38, -26
	banim_frame_oam 0x0, 0x1000, 0x8F, 30, -50
	banim_frame_oam 0x8000, 0x1000, 0xC8, 0, -66
	banim_frame_oam 0x0, 0x5000, 0x4F, 62, -66
	banim_frame_oam 0x8000, 0x1000, 0x51, 54, -66
	banim_frame_oam 0x4000, 0x1000, 0x6D, 30, -2
	banim_frame_oam 0x0, 0x1000, 0x8E, 38, 6
	banim_frame_oam 0x8000, 0x9000, 0x15, 46, -18
	banim_frame_oam 0x4000, 0x1000, 0xF, 14, -18
	banim_frame_oam 0x0, 0x1000, 0x11, 6, -18
	banim_frame_oam 0x8000, 0x1000, 0xC9, 75, -25
	banim_frame_oam 0x0, 0x1000, 0x89, 75, -9
	banim_frame_oam 0x4000, 0x1000, 0x30, 47, -74
	banim_frame_oam 0x0, 0x5000, 0x12, 31, -82
	banim_frame_oam 0x0, 0x1000, 0x14, 23, -82
	banim_frame_oam 0x8000, 0x1000, 0x34, 34, -66
	banim_frame_oam 0x0, 0x5000, 0x52, 30, -18
	banim_frame_oam 0x8000, 0x9000, 0x92, -2, -50
	banim_frame_oam 0x4000, 0x5000, 0xEF, 6, -26
	banim_frame_oam 0x0, 0x1000, 0x94, -10, -50
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x5000, 0x9C, -2, -74
	banim_frame_oam 0x8000, 0x9000, 0x17, 62, -66
	banim_frame_oam 0x8000, 0x5000, 0x19, 54, -66
	banim_frame_oam 0x4000, 0x5000, 0xEB, 38, -26
	banim_frame_oam 0x4000, 0x1000, 0xB1, 6, -42
	banim_frame_oam 0x8000, 0x1000, 0xC8, 0, -66
	banim_frame_oam 0x8000, 0x9000, 0x15, 46, -18
	banim_frame_oam 0x0, 0x1000, 0xF, 22, -18
	banim_frame_oam 0x4000, 0x1000, 0x6D, 30, -2
	banim_frame_oam 0x0, 0x1000, 0x8E, 38, 6
	banim_frame_oam 0x0, 0x5000, 0x52, 30, -18
	banim_frame_oam 0x0, 0x1000, 0x92, 6, -50
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_oam 0x4000, 0x5000, 0xCB, 38, -34
	banim_frame_oam 0x0, 0x1000, 0xCA, 70, -34
	banim_frame_oam 0x4000, 0x1000, 0x90, 28, -42
	banim_frame_oam 0x0, 0x1000, 0xEA, 55, -74
	banim_frame_oam 0x4000, 0x1000, 0xF4, 44, -47
	banim_frame_oam 0x8000, 0x1000, 0x94, -10, -50
	banim_frame_oam 0x0, 0x1000, 0xD4, -10, -34
	banim_frame_oam 0x0, 0x5000, 0x1A, 22, -34
	banim_frame_oam 0x0, 0x5000, 0xB9, 6, -34
	banim_frame_oam 0x4000, 0x1000, 0xF9, 6, -18
	banim_frame_oam 0x8000, 0x5000, 0x9B, -2, -42
	banim_frame_oam 0x0, 0x1000, 0x99, 6, -76
	banim_frame_end
banim_pekf_sp1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xCD, 38, -34
	banim_frame_oam 0x4000, 0x1000, 0xED, 38, -26
	banim_frame_oam 0x8000, 0x9000, 0x17, 62, -66
	banim_frame_oam 0x8000, 0x5000, 0x19, 54, -66
	banim_frame_oam 0x8000, 0x1000, 0xC8, 0, -66
	banim_frame_oam 0x8000, 0x9000, 0x15, 46, -18
	banim_frame_oam 0x4000, 0x1000, 0x6D, 30, -2
	banim_frame_oam 0x0, 0x1000, 0x8E, 38, 6
	banim_frame_oam 0x0, 0x1000, 0xCA, 70, -34
	banim_frame_oam 0x0, 0x5000, 0x52, 30, -18
	banim_frame_oam 0x4000, 0x1000, 0x3, 24, 9
	banim_frame_oam 0x4000, 0x0, 0x3, 40, 9
	banim_frame_oam 0x8000, 0x9000, 0x92, -2, -50
	banim_frame_oam 0x0, 0x1000, 0x94, -10, -50
	banim_frame_oam 0x8000, 0x1000, 0xB4, -10, -42
	banim_frame_oam 0x0, 0x1000, 0xEA, 55, -74
	banim_frame_oam 0x0, 0x1000, 0x74, 43, -53
	banim_frame_oam 0x0, 0x1000, 0x95, 36, -48
	banim_frame_oam 0x8000, 0x1000, 0xB5, 30, -42
	banim_frame_oam 0x0, 0x1000, 0xD6, 5, -11
	banim_frame_oam 0x8000, 0x1000, 0x96, 6, -26
	banim_frame_oam 0x8000, 0x9000, 0x97, 14, -42
	banim_frame_oam 0x0, 0x1000, 0xF3, -2, -26
	banim_frame_oam 0x0, 0x1000, 0x3A, 30, -26
	banim_frame_oam 0x0, 0x5000, 0xCB, 54, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x1, 14, -58
	banim_frame_oam 0x8000, 0x5000, 0x20, 46, -50
	banim_frame_oam 0x4000, 0x5000, 0x81, 14, -26
	banim_frame_oam 0x0, 0x5000, 0x8, 62, -47
	banim_frame_oam 0x4000, 0x1000, 0x48, 62, -31
	banim_frame_oam 0x8000, 0x1000, 0x87, 78, -39
	banim_frame_oam 0x0, 0x1000, 0x0, 86, -31
	banim_frame_oam 0x8000, 0x9000, 0x5, -2, -42
	banim_frame_oam 0x0, 0x1000, 0x6, 6, -50
	banim_frame_oam 0x8000, 0x1000, 0x27, -10, -34
	banim_frame_oam 0x0, 0x1000, 0x67, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x85, -11, -10
	banim_frame_oam 0x4000, 0x1000, 0xB, 23, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 39, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, 38, -18
	banim_frame_oam 0x4000, 0x1000, 0xA3, 22, -66
	banim_frame_oam 0x4000, 0x1000, 0xA1, 78, -23
	banim_frame_oam 0x8000, 0x1000, 0xA, 54, -44
	banim_frame_end
banim_pekf_sp1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x5000, 0xD, 9, -63
	banim_frame_oam 0x0, 0x5000, 0x31, -15, -47
	banim_frame_oam 0x8000, 0x1000, 0x50, 9, -47
	banim_frame_oam 0x4000, 0x1000, 0x2D, 25, -55
	banim_frame_oam 0x0, 0x1000, 0x2F, 17, -55
	banim_frame_oam 0x8000, 0x1000, 0x4F, 17, -47
	banim_frame_oam 0x4000, 0x1000, 0x61, 25, -47
	banim_frame_oam 0x0, 0x1000, 0x82, 25, -39
	banim_frame_oam 0x8000, 0x1000, 0x71, 1, -39
	banim_frame_oam 0x0, 0x1000, 0x90, 9, -31
	banim_frame_oam 0x0, 0x1000, 0x92, -7, -31
	banim_frame_oam 0x0, 0x1000, 0x8F, -1, -7
	banim_frame_oam 0x4000, 0x5000, 0x1, 9, -71
	banim_frame_oam 0x4000, 0x1000, 0xA3, 17, -79
	banim_frame_oam 0x4000, 0x1000, 0x5, -5, -57
	banim_frame_oam 0x0, 0x1000, 0x5, -3, -51
	banim_frame_oam 0x4000, 0x1000, 0x80, 33, -39
	banim_frame_oam 0x0, 0x5000, 0xAE, -6, -23
	banim_frame_oam 0x8000, 0x1000, 0x2C, 41, -55
	banim_frame_oam 0x0, 0x5000, 0x4D, 57, -51
	banim_frame_oam 0x0, 0x1000, 0x6C, 73, -43
	banim_frame_oam 0x8000, 0x1000, 0x2B, 49, -51
	banim_frame_oam 0x0, 0x1000, 0x8E, 57, -35
	banim_frame_oam 0x0, 0x5000, 0x8C, 65, -35
	banim_frame_oam 0x0, 0x1000, 0xA0, 33, -31
	banim_frame_oam 0x0, 0x1000, 0x4A, 66, -19
	banim_frame_oam 0x4000, 0x1000, 0xB, 19, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 35, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x79, 30, -60
	banim_frame_oam 0x0, 0x5000, 0x93, 46, -100
	banim_frame_oam 0x8000, 0x1000, 0x95, 38, -100
	banim_frame_oam 0x8000, 0x1000, 0x76, 54, -84
	banim_frame_oam 0x4000, 0x1000, 0x74, 38, -108
	banim_frame_oam 0x0, 0x5000, 0x17, 38, -84
	banim_frame_oam 0x8000, 0x1000, 0x19, 30, -84
	banim_frame_oam 0x4000, 0x1000, 0x57, 38, -68
	banim_frame_oam 0x0, 0x1000, 0x59, 30, -68
	banim_frame_oam 0x0, 0x5000, 0x1A, 14, -76
	banim_frame_oam 0x4000, 0x1000, 0x5A, 14, -60
	banim_frame_oam 0x0, 0x5000, 0x97, -2, -68
	banim_frame_oam 0x0, 0x1000, 0x78, -2, -76
	banim_frame_oam 0x8000, 0x5000, 0x3C, -10, -84
	banim_frame_oam 0x8000, 0x9000, 0x1D, -26, -92
	banim_frame_oam 0x0, 0x1000, 0x1C, -34, -92
	banim_frame_oam 0x0, 0x1000, 0x77, -23, -100
	banim_frame_oam 0x0, 0x5000, 0x31, -18, -52
	banim_frame_oam 0x0, 0x1000, 0xB6, 14, -52
	banim_frame_oam 0x4000, 0x1000, 0xA8, 22, -52
	banim_frame_oam 0x0, 0x1000, 0x7, 38, -52
	banim_frame_oam 0x4000, 0x5000, 0x80, 14, -44
	banim_frame_oam 0x4000, 0x1000, 0xB, 13, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 29, 9
	banim_frame_oam 0x4000, 0x1000, 0xA3, 14, -84
	banim_frame_oam 0x0, 0x1000, 0xA0, 30, -36
	banim_frame_oam 0x0, 0x1000, 0x5, -6, -56
	banim_frame_oam 0x0, 0x1000, 0xCD, 6, -76
	banim_frame_oam 0x0, 0x1000, 0x7B, -18, -60
	banim_frame_oam 0x0, 0x1000, 0x7A, -34, -81
	banim_frame_oam 0x0, 0x1000, 0x11, 38, -116
	banim_frame_end
banim_pekf_sp1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x5000, 0x20, 27, -96
	banim_frame_oam 0x8000, 0x9000, 0x5, -21, -88
	banim_frame_oam 0x0, 0x1000, 0x6, -13, -96
	banim_frame_oam 0x8000, 0x1000, 0x27, -29, -80
	banim_frame_oam 0x0, 0x1000, 0x67, -29, -64
	banim_frame_oam 0x0, 0x5000, 0x85, -30, -56
	banim_frame_oam 0x4000, 0x9000, 0x68, -5, -96
	banim_frame_oam 0x4000, 0x5000, 0xA8, -5, -80
	banim_frame_oam 0x4000, 0x1000, 0x81, 11, -72
	banim_frame_oam 0x0, 0x1000, 0x83, 3, -72
	banim_frame_oam 0x0, 0x1000, 0xA0, 19, -64
	banim_frame_oam 0x0, 0x1000, 0x84, -5, -72
	banim_frame_oam 0x4000, 0x1000, 0x1A, 3, -104
	banim_frame_oam 0x0, 0x1000, 0x1, 19, -104
	banim_frame_oam 0x4000, 0x1000, 0xB, 3, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 19, 9
	banim_frame_oam 0x0, 0x5000, 0x8, 43, -93
	banim_frame_oam 0x4000, 0x1000, 0x48, 43, -77
	banim_frame_oam 0x8000, 0x1000, 0x87, 59, -85
	banim_frame_oam 0x0, 0x1000, 0x0, 67, -77
	banim_frame_oam 0x4000, 0x1000, 0xA1, 59, -69
	banim_frame_oam 0x8000, 0x1000, 0xA, 35, -90
	banim_frame_oam 0x4000, 0x1000, 0xA3, 3, -112
	banim_frame_end
banim_pekf_sp1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x5, -16, -99
	banim_frame_oam 0x8000, 0x1000, 0x71, -16, -83
	banim_frame_oam 0x0, 0x1000, 0x92, -24, -75
	banim_frame_oam 0x8000, 0x1000, 0x50, -8, -91
	banim_frame_oam 0x0, 0x1000, 0x90, -8, -75
	banim_frame_oam 0x4000, 0x9000, 0x13, -8, -107
	banim_frame_oam 0x4000, 0x5000, 0x53, -8, -91
	banim_frame_oam 0x8000, 0x1000, 0x4F, 0, -92
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, -83
	banim_frame_oam 0x0, 0x1000, 0x6, -16, -107
	banim_frame_oam 0x0, 0x2000, 0x6, -8, -99
	banim_frame_oam 0x4000, 0x1000, 0x1A, 0, -115
	banim_frame_oam 0x0, 0x1000, 0x1, 16, -115
	banim_frame_oam 0x8000, 0x1000, 0x2C, 24, -99
	banim_frame_oam 0x0, 0x5000, 0x4D, 40, -95
	banim_frame_oam 0x0, 0x1000, 0x6C, 56, -87
	banim_frame_oam 0x8000, 0x1000, 0x2B, 32, -95
	banim_frame_oam 0x0, 0x1000, 0x8E, 40, -79
	banim_frame_oam 0x0, 0x5000, 0x8C, 48, -79
	banim_frame_oam 0x0, 0x1000, 0xA0, 16, -75
	banim_frame_oam 0x0, 0x1000, 0x4A, 49, -63
	banim_frame_oam 0x4000, 0x1000, 0xA3, 0, -123
	banim_frame_oam 0x0, 0x5000, 0x31, -32, -91
	banim_frame_oam 0x4000, 0x1000, 0x5, -22, -101
	banim_frame_oam 0x0, 0x1000, 0x5, -20, -95
	banim_frame_oam 0x0, 0x1000, 0x8F, -18, -51
	banim_frame_oam 0x0, 0x5000, 0xAE, -23, -67
	banim_frame_oam 0x4000, 0x1000, 0xB, 0, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 16, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0xB, -10, 9
	banim_frame_oam 0x4000, 0x0, 0xB, 6, 9
	banim_frame_oam 0x0, 0x1000, 0x79, 10, -95
	banim_frame_oam 0x8000, 0x1000, 0x76, 34, -119
	banim_frame_oam 0x0, 0x5000, 0x17, 18, -119
	banim_frame_oam 0x8000, 0x1000, 0x19, 10, -119
	banim_frame_oam 0x4000, 0x1000, 0x57, 18, -103
	banim_frame_oam 0x0, 0x1000, 0x59, 10, -103
	banim_frame_oam 0x0, 0x5000, 0x1A, -6, -111
	banim_frame_oam 0x4000, 0x1000, 0x5A, -6, -95
	banim_frame_oam 0x0, 0x5000, 0x97, -22, -103
	banim_frame_oam 0x0, 0x1000, 0x78, -22, -111
	banim_frame_oam 0x8000, 0x5000, 0x3C, -30, -119
	banim_frame_oam 0x8000, 0x9000, 0x1D, -46, -127
	banim_frame_oam 0x0, 0x1000, 0x1C, -54, -127
	banim_frame_oam 0x0, 0x5000, 0x31, -38, -87
	banim_frame_oam 0x0, 0x1000, 0xB6, -6, -87
	banim_frame_oam 0x4000, 0x1000, 0xA8, 2, -87
	banim_frame_oam 0x0, 0x1000, 0x7, 18, -87
	banim_frame_oam 0x4000, 0x5000, 0x80, -6, -79
	banim_frame_oam 0x4000, 0x1000, 0xA3, -6, -119
	banim_frame_oam 0x0, 0x1000, 0xA0, 10, -71
	banim_frame_oam 0x0, 0x1000, 0x5, -26, -91
	banim_frame_oam 0x0, 0x1000, 0xCD, -14, -111
	banim_frame_oam 0x4000, 0x1000, 0xB3, 26, -127
	banim_frame_oam 0x0, 0x1000, 0xB5, 18, -127
	banim_frame_oam 0x0, 0x1000, 0x7B, -38, -95
	banim_frame_oam 0x0, 0x1000, 0x7A, -54, -116
	banim_frame_end
banim_pekf_sp1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x99, -41, -91
	banim_frame_oam 0x4000, 0x5000, 0xE9, -1, -115
	banim_frame_oam 0x4000, 0x5000, 0xC9, -1, -123
	banim_frame_oam 0x0, 0x1000, 0xED, -9, -115
	banim_frame_oam 0x8000, 0x1000, 0xC7, -49, -115
	banim_frame_oam 0x8000, 0x1000, 0xC8, -57, -115
	banim_frame_oam 0x4000, 0x1000, 0xE5, -57, -123
	banim_frame_oam 0x4000, 0x1000, 0xC3, -17, -75
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, -67
	banim_frame_oam 0x4000, 0x1000, 0xB, -20, 9
	banim_frame_oam 0x4000, 0x0, 0xB, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x72, -23, -115
	banim_frame_oam 0x0, 0x1000, 0x5, -10, -126
	banim_frame_oam 0x0, 0x1000, 0x5, -16, -120
	banim_frame_oam 0x0, 0x1000, 0x52, -50, -86
	banim_frame_oam 0x0, 0x1000, 0x12, -41, -115
	banim_frame_oam 0x4000, 0x1000, 0xEE, -57, -99
	banim_frame_oam 0x0, 0x1000, 0xB0, -49, -91
	banim_frame_oam 0x0, 0x1000, 0xB2, 23, -107
	banim_frame_oam 0x4000, 0x9000, 0xD0, -9, -107
	banim_frame_oam 0x4000, 0x9000, 0xD4, -41, -107
	banim_frame_oam 0x4000, 0x9000, 0xD8, -17, -91
	banim_frame_oam 0x8000, 0x1000, 0xDC, -25, -91
	banim_frame_end
banim_pekf_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0xE4, -11, -125
	banim_frame_oam 0x4000, 0x1000, 0xC5, -59, -125
	banim_frame_oam 0x4000, 0x1000, 0xB, -22, 9
	banim_frame_oam 0x4000, 0x0, 0xB, -6, 9
	banim_frame_oam 0x0, 0x5000, 0x99, -43, -85
	banim_frame_oam 0x4000, 0x5000, 0xE9, -3, -109
	banim_frame_oam 0x4000, 0x5000, 0xC9, -3, -117
	banim_frame_oam 0x0, 0x1000, 0xED, -11, -109
	banim_frame_oam 0x8000, 0x1000, 0xC7, -51, -109
	banim_frame_oam 0x8000, 0x1000, 0xC8, -59, -109
	banim_frame_oam 0x4000, 0x1000, 0xE5, -59, -117
	banim_frame_oam 0x4000, 0x1000, 0xC3, -19, -69
	banim_frame_oam 0x0, 0x1000, 0xE3, -18, -61
	banim_frame_oam 0x0, 0x1000, 0x72, -25, -109
	banim_frame_oam 0x0, 0x1000, 0x5, -12, -120
	banim_frame_oam 0x0, 0x1000, 0x5, -18, -114
	banim_frame_oam 0x0, 0x1000, 0x52, -52, -80
	banim_frame_oam 0x4000, 0x1000, 0xE0, 13, -125
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -125
	banim_frame_oam 0x0, 0x1000, 0x12, -43, -109
	banim_frame_oam 0x4000, 0x1000, 0xEE, -59, -93
	banim_frame_oam 0x0, 0x1000, 0xB0, -51, -85
	banim_frame_oam 0x0, 0x1000, 0xB2, 21, -101
	banim_frame_oam 0x4000, 0x9000, 0xD0, -11, -101
	banim_frame_oam 0x4000, 0x9000, 0xD4, -43, -101
	banim_frame_oam 0x4000, 0x9000, 0xD8, -19, -85
	banim_frame_oam 0x8000, 0x1000, 0xDC, -27, -85
	banim_frame_end
banim_pekf_sp1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -48, -95
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, -63
	banim_frame_oam 0x4000, 0x5000, 0x84, -48, -63
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, -55
	banim_frame_oam 0x4000, 0x1000, 0xA5, -40, -55
	banim_frame_oam 0x0, 0x1000, 0xA0, -17, -103
	banim_frame_oam 0x0, 0x1000, 0xA7, -22, -47
	banim_frame_oam 0x0, 0x1000, 0x68, -13, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -21, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -29, 9
	banim_frame_oam 0x0, 0x0, 0xC, -5, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -47, -87
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, -55
	banim_frame_oam 0x4000, 0x5000, 0x84, -47, -55
	banim_frame_oam 0x4000, 0x5000, 0xA1, -23, -47
	banim_frame_oam 0x4000, 0x1000, 0xA5, -39, -47
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, -95
	banim_frame_oam 0x0, 0x1000, 0xA7, -21, -39
	banim_frame_oam 0x0, 0x1000, 0x68, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -20, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -28, 9
	banim_frame_oam 0x0, 0x0, 0xC, -4, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -15, -70
	banim_frame_oam 0x8000, 0x5000, 0xB, -23, -70
	banim_frame_oam 0x0, 0x5000, 0x89, -15, -38
	banim_frame_oam 0x8000, 0x1000, 0x8B, -23, -38
	banim_frame_oam 0x4000, 0x1000, 0xC9, -15, -22
	banim_frame_oam 0x0, 0x1000, 0xCB, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xA8, 1, -30
	banim_frame_oam 0x8000, 0x9000, 0x2C, -39, -62
	banim_frame_oam 0x8000, 0x1000, 0xAC, -31, -30
	banim_frame_oam 0x0, 0x1000, 0x8, -15, -14
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -14
	banim_frame_oam 0x0, 0x1000, 0x88, -2, -14
	banim_frame_oam 0x0, 0x1000, 0x48, 1, -54
	banim_frame_oam 0x0, 0x1000, 0x68, -9, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -17, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -25, 9
	banim_frame_oam 0x0, 0x0, 0xC, -1, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -33, -58
	banim_frame_oam 0x4000, 0x9000, 0x90, -33, -26
	banim_frame_oam 0x8000, 0x5000, 0x2F, -1, -50
	banim_frame_oam 0x8000, 0x1000, 0xAF, -1, -18
	banim_frame_oam 0x0, 0x1000, 0xEF, -1, -2
	banim_frame_oam 0x4000, 0x1000, 0xD0, -17, -10
	banim_frame_oam 0x0, 0x1000, 0xD2, -25, -10
	banim_frame_oam 0x4000, 0x1000, 0xF0, -17, -2
	banim_frame_oam 0x8000, 0x5000, 0x6E, 7, -34
	banim_frame_oam 0x0, 0x1000, 0xEE, 7, -2
	banim_frame_oam 0x8000, 0x1000, 0xAD, 15, -18
	banim_frame_oam 0x0, 0x1000, 0xED, 15, -2
	banim_frame_oam 0x0, 0x1000, 0xE, -26, -66
	banim_frame_oam 0x0, 0x1000, 0x2E, -15, -66
	banim_frame_oam 0x0, 0x1000, 0xD, -41, -38
	banim_frame_oam 0x0, 0x1000, 0x4E, -41, -26
	banim_frame_oam 0x0, 0x1000, 0x68, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -21, 9
	banim_frame_oam 0x0, 0x0, 0xC, 3, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x1000, 0x16, -11, -38
	banim_frame_oam 0x0, 0x1000, 0x18, -19, -38
	banim_frame_oam 0x4000, 0x5000, 0x35, -19, -30
	banim_frame_oam 0x4000, 0x5000, 0x55, -19, -22
	banim_frame_oam 0x0, 0x1000, 0x59, -27, -22
	banim_frame_oam 0x4000, 0x5000, 0x74, -11, -14
	banim_frame_oam 0x4000, 0x1000, 0x78, -27, -14
	banim_frame_oam 0x4000, 0x5000, 0x94, -11, -6
	banim_frame_oam 0x4000, 0x1000, 0x98, -27, -6
	banim_frame_oam 0x4000, 0x5000, 0xB4, -11, 2
	banim_frame_oam 0x4000, 0x1000, 0xB8, -27, 2
	banim_frame_oam 0x4000, 0x5000, 0xD5, -19, 10
	banim_frame_oam 0x8000, 0x1000, 0xAD, 21, -6
	banim_frame_oam 0x0, 0x1000, 0xED, 21, 10
	banim_frame_oam 0x0, 0x1000, 0xAD, 13, -22
	banim_frame_oam 0x0, 0x1000, 0xAD, 5, -38
	banim_frame_oam 0x0, 0x1000, 0x34, -35, -22
	banim_frame_oam 0x0, 0x1000, 0x2E, -9, -54
	banim_frame_oam 0x0, 0x1000, 0x68, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -21, 9
	banim_frame_oam 0x0, 0x0, 0xC, 3, 9
	banim_frame_oam 0x0, 0x1000, 0x14, -5, -46
	banim_frame_oam 0x0, 0x1000, 0x15, -12, -46
	banim_frame_end
banim_pekf_sp1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x5A, -11, -22
	banim_frame_oam 0x8000, 0x5000, 0x5E, -19, -22
	banim_frame_oam 0x0, 0x1000, 0xDB, 2, 10
	banim_frame_oam 0x4000, 0x1000, 0xDD, -19, 10
	banim_frame_oam 0x0, 0x1000, 0xDF, -27, 10
	banim_frame_oam 0x8000, 0x1000, 0x9F, -27, -6
	banim_frame_oam 0x0, 0x1000, 0x7F, -27, -17
	banim_frame_oam 0x4000, 0x5000, 0x3B, -19, -30
	banim_frame_oam 0x0, 0x1000, 0x3F, -27, -30
	banim_frame_oam 0x0, 0x1000, 0x1C, -3, -38
	banim_frame_oam 0x0, 0x1000, 0x1A, -24, -38
	banim_frame_oam 0x0, 0x1000, 0xDA, -35, -19
	banim_frame_oam 0x8000, 0x1000, 0x19, 21, -14
	banim_frame_oam 0x8000, 0x1000, 0xCD, 21, 2
	banim_frame_oam 0x0, 0x3000, 0x6E, -3, 10
	banim_frame_oam 0x0, 0x2000, 0x6E, -27, -22
	banim_frame_oam 0x0, 0x1000, 0x6E, 5, -38
	banim_frame_oam 0x0, 0x1000, 0x14, -5, -46
	banim_frame_oam 0x0, 0x1000, 0x2E, -9, -54
	banim_frame_oam 0x0, 0x1000, 0x68, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -21, 9
	banim_frame_oam 0x0, 0x0, 0xC, 3, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, 5, -22
	banim_frame_oam 0x4000, 0x9000, 0xC4, -27, -22
	banim_frame_oam 0x4000, 0x5000, 0xF2, -3, -30
	banim_frame_oam 0x4000, 0x1000, 0xF6, -19, -30
	banim_frame_oam 0x0, 0x1000, 0xF8, -27, -30
	banim_frame_oam 0x4000, 0x5000, 0xF9, -11, -38
	banim_frame_oam 0x4000, 0x1000, 0xFD, -27, -38
	banim_frame_oam 0x4000, 0x5000, 0xE8, 5, -6
	banim_frame_oam 0x0, 0x1000, 0xEC, -3, -6
	banim_frame_oam 0x4000, 0x1000, 0x1D, -19, -6
	banim_frame_oam 0x0, 0x1000, 0x5F, -27, -6
	banim_frame_oam 0x0, 0x1000, 0x1B, -13, 2
	banim_frame_oam 0x0, 0x1000, 0x3A, -3, 2
	banim_frame_oam 0x0, 0x1000, 0x54, 5, 2
	banim_frame_oam 0x0, 0x1000, 0xDB, 2, 10
	banim_frame_oam 0x0, 0x1000, 0x68, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x68, -13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -21, 9
	banim_frame_oam 0x0, 0x0, 0xC, 3, 9
	banim_frame_oam 0x0, 0x1000, 0xD3, 16, 2
	banim_frame_oam 0x0, 0x3000, 0xF2, 25, 2
	banim_frame_end
banim_pekf_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_50_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -23, -60
	banim_frame_oam 0x8000, 0x1000, 0x4, -31, -60
	banim_frame_oam 0x4000, 0x5000, 0x41, -31, -44
	banim_frame_oam 0x0, 0x9000, 0x60, -23, -36
	banim_frame_oam 0x4000, 0x5000, 0xE0, -23, -4
	banim_frame_oam 0x0, 0x5000, 0x84, -39, -28
	banim_frame_oam 0x4000, 0x1000, 0xC4, -39, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -31, -36
	banim_frame_oam 0x0, 0x5000, 0x6, -23, -76
	banim_frame_oam 0x8000, 0x1000, 0x8, -31, -76
	banim_frame_oam 0x8000, 0x1000, 0x5, 9, -18
	banim_frame_oam 0x0, 0x1000, 0x40, 1, 4
	banim_frame_oam 0x0, 0x1000, 0x64, -7, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -15, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -23, 9
	banim_frame_oam 0x0, 0x0, 0x65, 1, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x9, -25, -57
	banim_frame_oam 0x8000, 0x5000, 0xD, -33, -57
	banim_frame_oam 0x4000, 0x9000, 0x89, -25, -25
	banim_frame_oam 0x8000, 0x1000, 0x8D, -33, -25
	banim_frame_oam 0x4000, 0x5000, 0xC9, -25, -9
	banim_frame_oam 0x0, 0x1000, 0xCD, -33, -9
	banim_frame_oam 0x4000, 0x5000, 0xEB, -41, -1
	banim_frame_oam 0x8000, 0x1000, 0xAE, -41, -17
	banim_frame_oam 0x8000, 0x1000, 0xE, -41, -57
	banim_frame_oam 0x0, 0x5000, 0x47, -9, -73
	banim_frame_oam 0x0, 0x1000, 0x88, -25, -65
	banim_frame_oam 0x0, 0x1000, 0xA8, -41, -65
	banim_frame_oam 0x0, 0x1000, 0xEA, -17, 7
	banim_frame_oam 0x0, 0x1000, 0x64, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -20, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -28, 9
	banim_frame_oam 0x0, 0x0, 0x65, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x12, -17, -58
	banim_frame_end
banim_pekf_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0x36, -8, -26
	banim_frame_oam 0x0, 0x5000, 0x3A, -24, -26
	banim_frame_oam 0x8000, 0x1000, 0x3C, -32, -26
	banim_frame_oam 0x4000, 0x5000, 0x76, -8, -10
	banim_frame_oam 0x4000, 0x1000, 0x7A, -24, -10
	banim_frame_oam 0x0, 0x1000, 0x7C, -32, -10
	banim_frame_oam 0x4000, 0x5000, 0x98, -24, -2
	banim_frame_oam 0x0, 0x1000, 0x9C, -32, -2
	banim_frame_oam 0x0, 0x1000, 0xB8, 0, 6
	banim_frame_oam 0x4000, 0x1000, 0xBA, -24, 6
	banim_frame_oam 0x4000, 0x5000, 0x17, -16, -34
	banim_frame_oam 0x0, 0x5000, 0x96, 16, -42
	banim_frame_oam 0x0, 0x1000, 0x64, -4, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -20, 9
	banim_frame_oam 0x0, 0x0, 0x65, 4, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x2, -10, -34
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x4000, 0x5000, 0x8, -27, -55
	banim_frame_oam 0x4000, 0x5000, 0x29, -35, -47
	banim_frame_oam 0x0, 0x1000, 0x2D, -35, -39
	banim_frame_oam 0x4000, 0x1000, 0xC, -27, -39
	banim_frame_end
banim_pekf_sp1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x2, -10, -34
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x4000, 0x5000, 0x68, -22, -28
	banim_frame_oam 0x0, 0x1000, 0x6C, -30, -28
	banim_frame_oam 0x4000, 0x5000, 0x49, -30, -36
	banim_frame_oam 0x0, 0x1000, 0x4D, -38, -36
	banim_frame_oam 0x0, 0x1000, 0x28, -38, -44
	banim_frame_end
banim_pekf_sp1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x2, -10, -34
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x5000, 0x51, 16, -42
	banim_frame_oam 0x8000, 0x1000, 0x53, 8, -42
	banim_frame_oam 0x0, 0x1000, 0x74, 0, -34
	banim_frame_oam 0x4000, 0x1000, 0x54, 8, -26
	banim_frame_oam 0x0, 0x1000, 0x56, 0, -26
	banim_frame_oam 0x4000, 0x1000, 0x75, -16, -26
	banim_frame_end
banim_pekf_sp1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x2, -10, -34
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x4000, 0x5000, 0x12, -9, -55
	banim_frame_oam 0x0, 0x1000, 0x16, -17, -55
	banim_frame_oam 0x4000, 0x5000, 0x32, -9, -47
	banim_frame_oam 0x8000, 0x1000, 0x11, 23, -47
	banim_frame_end
banim_pekf_sp1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x2, -10, -34
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x5000, 0x6, 10, -44
	banim_frame_oam 0x0, 0x1000, 0x46, 2, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -6, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -14, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -22, -36
	banim_frame_oam 0x0, 0x1000, 0x47, -30, -36
	banim_frame_end
banim_pekf_sp1_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x5000, 0xC7, -12, -34
	banim_frame_oam 0x0, 0x1000, 0xA8, -12, -42
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0x6, 7, -44
	banim_frame_oam 0x0, 0x1000, 0x46, -1, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -9, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -17, -36
	banim_frame_oam 0x0, 0x1000, 0x46, -25, -36
	banim_frame_oam 0x0, 0x1000, 0x47, -33, -36
	banim_frame_end
banim_pekf_sp1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, 16, -36
	banim_frame_oam 0x0, 0x1000, 0xC2, 8, -36
	banim_frame_oam 0x0, 0x1000, 0xC2, 0, -36
	banim_frame_oam 0x4000, 0x2000, 0xC0, -16, -36
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0xC4, 1, -34
	banim_frame_oam 0x8000, 0x1000, 0xC6, -7, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -10, -18
	banim_frame_oam 0x0, 0x5000, 0x44, -26, -18
	banim_frame_oam 0x4000, 0x5000, 0x80, -10, -2
	banim_frame_oam 0x4000, 0x1000, 0x84, -26, -2
	banim_frame_oam 0x4000, 0x5000, 0xA1, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA5, -34, 6
	banim_frame_oam 0x4000, 0x1000, 0x24, -26, -26
	banim_frame_oam 0x0, 0x1000, 0x21, 6, -26
	banim_frame_oam 0x4000, 0x1000, 0x4, -42, 14
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, 14
	banim_frame_oam 0x0, 0x1000, 0x20, 0, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -16, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 9
	banim_frame_oam 0x0, 0x5000, 0xC4, 1, -34
	banim_frame_oam 0x8000, 0x1000, 0xC6, -7, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -16, -42
	banim_frame_oam 0x8000, 0x5000, 0x8D, -24, -42
	banim_frame_oam 0x8000, 0x1000, 0xCE, -32, -26
	banim_frame_oam 0x0, 0x5000, 0xE, 0, -10
	banim_frame_oam 0x8000, 0x1000, 0x10, -8, -10
	banim_frame_oam 0x0, 0x1000, 0x4F, 0, 6
	banim_frame_oam 0x0, 0x1000, 0x4E, 16, -15
	banim_frame_oam 0x0, 0x5000, 0x6E, -24, -10
	banim_frame_oam 0x8000, 0x1000, 0x70, -32, -10
	banim_frame_oam 0x0, 0x1000, 0xEF, 16, -33
	banim_frame_oam 0x0, 0x5000, 0xAF, 24, -34
	banim_frame_oam 0x0, 0x1000, 0x20, -2, 9
	banim_frame_oam 0x0, 0x1000, 0x20, -10, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 6, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -18, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_52_l:
	banim_frame_oam 0x8000, 0x9000, 0x37, 39, -26
	banim_frame_oam 0x8000, 0x5000, 0x39, 31, -26
	banim_frame_oam 0x4000, 0x1000, 0xB6, 42, 6
	banim_frame_oam 0x8000, 0x1000, 0x75, 63, -9
	banim_frame_oam 0x8000, 0x1000, 0x56, 55, -18
	banim_frame_oam 0x0, 0x1000, 0x96, 55, -2
	banim_frame_oam 0x0, 0x5000, 0x34, 15, -22
	banim_frame_oam 0x0, 0x1000, 0x47, 43, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 35, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 51, 9
	banim_frame_oam 0x0, 0x2000, 0x68, 27, 9
	banim_frame_oam 0x4000, 0x9000, 0x1B, 53, -25
	banim_frame_oam 0x4000, 0x1000, 0x5B, 69, -9
	banim_frame_oam 0x0, 0x1000, 0x5D, 61, -9
	banim_frame_oam 0x0, 0x1000, 0x5E, 69, -1
	banim_frame_oam 0x0, 0x1000, 0x3F, 45, -22
	banim_frame_oam 0x8000, 0x1000, 0x3A, 85, -25
	banim_frame_oam 0x0, 0x1000, 0x7A, 85, -9
	banim_frame_oam 0x8000, 0x1000, 0xD6, 93, -25
	banim_frame_end
banim_pekf_sp1_oam_frame_53_l:
	banim_frame_oam 0x8000, 0x9000, 0x7B, 41, -27
	banim_frame_oam 0x8000, 0x5000, 0x7D, 33, -27
	banim_frame_oam 0x4000, 0x1000, 0xFB, 41, 5
	banim_frame_oam 0x0, 0x1000, 0xFD, 33, 5
	banim_frame_oam 0x0, 0x5000, 0x9E, 17, -19
	banim_frame_oam 0x8000, 0x1000, 0xDE, 25, -3
	banim_frame_oam 0x0, 0x1000, 0x47, 42, 9
	banim_frame_oam 0x0, 0x1000, 0x47, 34, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 50, 9
	banim_frame_oam 0x0, 0x2000, 0x68, 26, 9
	banim_frame_oam 0x4000, 0x1000, 0xB8, 55, -27
	banim_frame_oam 0x0, 0x1000, 0xBA, 47, -27
	banim_frame_oam 0x4000, 0x5000, 0xD7, 47, -19
	banim_frame_oam 0x4000, 0x5000, 0xF7, 47, -11
	banim_frame_oam 0x0, 0x1000, 0xF5, 79, -19
	banim_frame_oam 0x4000, 0x1000, 0x7E, 71, -3
	banim_frame_oam 0x0, 0x1000, 0x5F, 79, -11
	banim_frame_end
banim_pekf_sp1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0x20, 22, -24
	banim_frame_oam 0x4000, 0x1000, 0xA0, 38, 8
	banim_frame_oam 0x0, 0x1000, 0xA2, 30, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 30, -32
	banim_frame_oam 0x0, 0x1000, 0x2, 21, -16
	banim_frame_oam 0x0, 0x1000, 0x3, 40, 9
	banim_frame_oam 0x0, 0x1000, 0x3, 32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, 24, 9
	banim_frame_oam 0x0, 0x0, 0x4, 48, 9
	banim_frame_oam 0x0, 0x5000, 0xC0, 53, -30
	banim_frame_oam 0x8000, 0x1000, 0xC2, 45, -30
	banim_frame_oam 0x0, 0x1000, 0xA3, 69, -22
	banim_frame_oam 0x4000, 0x5000, 0xC3, 53, -14
	banim_frame_oam 0x0, 0x1000, 0xC7, 45, -14
	banim_frame_oam 0x4000, 0x5000, 0xE3, 53, -6
	banim_frame_end
banim_pekf_sp1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 53, -30
	banim_frame_oam 0x8000, 0x1000, 0xC2, 45, -30
	banim_frame_oam 0x0, 0x1000, 0xA3, 69, -22
	banim_frame_oam 0x4000, 0x5000, 0xC3, 53, -14
	banim_frame_oam 0x0, 0x1000, 0xC7, 45, -14
	banim_frame_oam 0x4000, 0x5000, 0xE3, 53, -6
	banim_frame_oam 0x0, 0x9000, 0x20, 22, -24
	banim_frame_oam 0x4000, 0x1000, 0xA0, 38, 8
	banim_frame_oam 0x0, 0x1000, 0xA2, 30, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 30, -32
	banim_frame_oam 0x0, 0x1000, 0x3, 40, 9
	banim_frame_oam 0x0, 0x1000, 0x3, 32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, 24, 9
	banim_frame_oam 0x0, 0x0, 0x4, 48, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_56_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 8, -38
	banim_frame_oam 0x4000, 0x5000, 0x84, 24, -6
	banim_frame_oam 0x0, 0x1000, 0x88, 16, -6
	banim_frame_oam 0x4000, 0x1000, 0xA4, 40, 2
	banim_frame_oam 0x0, 0x1000, 0xA6, 32, 2
	banim_frame_oam 0x0, 0x5000, 0x24, 40, -30
	banim_frame_oam 0x4000, 0x1000, 0x64, 40, -14
	banim_frame_oam 0x0, 0x1000, 0x3, 40, 9
	banim_frame_oam 0x0, 0x1000, 0x3, 32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, 24, 9
	banim_frame_oam 0x0, 0x0, 0x4, 48, 9
	banim_frame_oam 0x4000, 0x9000, 0xA, 53, -31
	banim_frame_oam 0x8000, 0x1000, 0xE, 45, -31
	banim_frame_oam 0x4000, 0x5000, 0x4A, 53, -15
	banim_frame_oam 0x0, 0x1000, 0x4E, 45, -15
	banim_frame_oam 0x4000, 0x1000, 0x6A, 69, -7
	banim_frame_oam 0x0, 0x1000, 0x6C, 61, -7
	banim_frame_oam 0x4000, 0x1000, 0xA7, 61, -39
	banim_frame_oam 0x0, 0x1000, 0xA9, 53, -39
	banim_frame_end
	.section .data.oam_r
banim_pekf_sp1_oam_r:
banim_pekf_sp1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -14, 5
	banim_frame_oam 0x4000, 0x0, 0x47, 2, 9
	banim_frame_oam 0x0, 0x0, 0x66, 18, 9
	banim_frame_oam 0x4000, 0x8000, 0xC0, -22, -11
	banim_frame_oam 0x0, 0x4000, 0xC4, 10, -11
	banim_frame_oam 0x8000, 0x8000, 0x0, -22, -59
	banim_frame_oam 0x0, 0x4000, 0x80, -22, -27
	banim_frame_oam 0x0, 0x8000, 0x22, -6, -51
	banim_frame_oam 0x4000, 0x4000, 0xA2, -6, -19
	banim_frame_oam 0x4000, 0x0, 0x3, 2, -59
	banim_frame_oam 0x0, 0x0, 0x5, 18, -59
	banim_frame_oam 0x8000, 0x0, 0x6, 26, -59
	banim_frame_oam 0x0, 0x0, 0x46, 26, -43
	banim_frame_oam 0x0, 0x0, 0x2, 10, -67
	banim_frame_oam 0x4000, 0x0, 0x86, -38, -34
	banim_frame_oam 0x0, 0x0, 0x67, -30, -42
	banim_frame_end
banim_pekf_sp1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -14, -40
	banim_frame_oam 0x8000, 0x0, 0xE, 18, -40
	banim_frame_oam 0x4000, 0x4000, 0x4A, -14, -24
	banim_frame_oam 0x0, 0x0, 0x4E, 18, -24
	banim_frame_oam 0x8000, 0x0, 0x29, -22, -32
	banim_frame_oam 0x4000, 0x8000, 0x6A, -14, -16
	banim_frame_oam 0x4000, 0x4000, 0xAA, -14, 0
	banim_frame_oam 0x4000, 0x0, 0xA6, -38, -22
	banim_frame_oam 0x0, 0x0, 0xC7, -30, -14
	banim_frame_oam 0x0, 0x0, 0xC6, -9, -48
	banim_frame_oam 0x4000, 0x0, 0xE6, 7, -48
	banim_frame_oam 0x4000, 0x0, 0xA8, 10, -56
	banim_frame_oam 0x0, 0x0, 0x47, -4, 9
	banim_frame_oam 0x0, 0x0, 0x47, 4, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -12, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 12, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -14, -37
	banim_frame_oam 0x0, 0x4000, 0xC8, -9, -5
	banim_frame_oam 0x8000, 0x0, 0xCA, 7, -5
	banim_frame_oam 0x8000, 0x0, 0x6E, -22, -28
	banim_frame_oam 0x4000, 0x0, 0x88, 10, -45
	banim_frame_oam 0x4000, 0x0, 0xA6, -38, -22
	banim_frame_oam 0x0, 0x0, 0xC7, -30, -14
	banim_frame_oam 0x0, 0x0, 0x47, -4, 9
	banim_frame_oam 0x0, 0x0, 0x47, 4, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -12, 9
	banim_frame_oam 0x0, 0x3000, 0x68, 12, 9
	banim_frame_oam 0x8000, 0x0, 0x13, 18, -37
	banim_frame_oam 0x0, 0x0, 0x53, 18, -21
	banim_frame_end
banim_pekf_sp1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x8F, -43, -17
	banim_frame_oam 0x0, 0x4000, 0x93, -11, -17
	banim_frame_oam 0x0, 0x0, 0xD2, -19, -1
	banim_frame_oam 0x0, 0x4000, 0xCB, -67, -17
	banim_frame_oam 0x8000, 0x0, 0xCD, -51, -17
	banim_frame_oam 0x8000, 0x0, 0xAE, 5, -17
	banim_frame_oam 0x0, 0x0, 0xEE, 5, -1
	banim_frame_oam 0x4000, 0x4000, 0x14, -43, -25
	banim_frame_oam 0x4000, 0x0, 0x18, -11, -25
	banim_frame_oam 0x0, 0x0, 0x1A, 5, -25
	banim_frame_oam 0x0, 0x0, 0xD1, -27, -1
	banim_frame_oam 0x4000, 0x0, 0xF3, 13, -1
	banim_frame_oam 0x4000, 0x0, 0xD3, 13, -9
	banim_frame_oam 0x0, 0x0, 0xD5, 29, -9
	banim_frame_oam 0x4000, 0x0, 0xF1, 21, -17
	banim_frame_oam 0x4000, 0x0, 0xCF, -43, -1
	banim_frame_oam 0x0, 0x0, 0xF0, -35, 7
	banim_frame_oam 0x0, 0x0, 0x47, -26, 9
	banim_frame_oam 0x0, 0x0, 0x47, -18, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -34, 9
	banim_frame_oam 0x0, 0x3000, 0x68, -2, 9
	banim_frame_oam 0x0, 0x0, 0x47, -10, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x37, -55, -26
	banim_frame_oam 0x8000, 0x4000, 0x39, -39, -26
	banim_frame_oam 0x4000, 0x0, 0xB6, -58, 6
	banim_frame_oam 0x8000, 0x0, 0x75, -71, -9
	banim_frame_oam 0x8000, 0x0, 0x56, -63, -18
	banim_frame_oam 0x0, 0x0, 0x96, -63, -2
	banim_frame_oam 0x0, 0x4000, 0x34, -31, -22
	banim_frame_oam 0x0, 0x0, 0x47, -51, 9
	banim_frame_oam 0x0, 0x0, 0x47, -43, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -59, 9
	banim_frame_oam 0x0, 0x3000, 0x68, -35, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0x1B, -85, -25
	banim_frame_oam 0x4000, 0x0, 0x5B, -85, -9
	banim_frame_oam 0x0, 0x0, 0x5D, -69, -9
	banim_frame_oam 0x0, 0x0, 0x5E, -77, -1
	banim_frame_oam 0x0, 0x0, 0x3F, -53, -22
	banim_frame_oam 0x8000, 0x0, 0x3A, -93, -25
	banim_frame_oam 0x0, 0x0, 0x7A, -93, -9
	banim_frame_oam 0x8000, 0x0, 0xD6, -101, -25
	banim_frame_end
banim_pekf_sp1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x7B, -57, -27
	banim_frame_oam 0x8000, 0x4000, 0x7D, -41, -27
	banim_frame_oam 0x4000, 0x0, 0xFB, -57, 5
	banim_frame_oam 0x0, 0x0, 0xFD, -41, 5
	banim_frame_oam 0x0, 0x4000, 0x9E, -33, -19
	banim_frame_oam 0x8000, 0x0, 0xDE, -33, -3
	banim_frame_oam 0x0, 0x0, 0x47, -50, 9
	banim_frame_oam 0x0, 0x0, 0x47, -42, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -58, 9
	banim_frame_oam 0x0, 0x3000, 0x68, -34, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x0, 0xB8, -71, -27
	banim_frame_oam 0x0, 0x0, 0xBA, -55, -27
	banim_frame_oam 0x4000, 0x4000, 0xD7, -79, -19
	banim_frame_oam 0x4000, 0x4000, 0xF7, -79, -11
	banim_frame_oam 0x0, 0x0, 0xF5, -87, -19
	banim_frame_oam 0x4000, 0x0, 0x7E, -87, -3
	banim_frame_oam 0x0, 0x0, 0x5F, -87, -11
	banim_frame_end
banim_pekf_sp1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -54, -24
	banim_frame_oam 0x4000, 0x0, 0xA0, -54, 8
	banim_frame_oam 0x0, 0x0, 0xA2, -38, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -46, -32
	banim_frame_oam 0x0, 0x0, 0x2, -29, -16
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -69, -30
	banim_frame_oam 0x8000, 0x0, 0xC2, -53, -30
	banim_frame_oam 0x0, 0x0, 0xA3, -77, -22
	banim_frame_oam 0x4000, 0x4000, 0xC3, -85, -14
	banim_frame_oam 0x0, 0x0, 0xC7, -53, -14
	banim_frame_oam 0x4000, 0x4000, 0xE3, -85, -6
	banim_frame_end
banim_pekf_sp1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -54, -24
	banim_frame_oam 0x4000, 0x0, 0xA0, -54, 8
	banim_frame_oam 0x0, 0x0, 0xA2, -38, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -46, -32
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x0, 0xB, -34, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -50, 9
	banim_frame_oam 0x4000, 0x4000, 0xD, -39, -67
	banim_frame_oam 0x0, 0x4000, 0x31, 1, -51
	banim_frame_oam 0x8000, 0x0, 0x50, -15, -51
	banim_frame_oam 0x4000, 0x0, 0x2D, -39, -59
	banim_frame_oam 0x0, 0x0, 0x2F, -23, -59
	banim_frame_oam 0x8000, 0x0, 0x4F, -23, -51
	banim_frame_oam 0x4000, 0x0, 0x61, -39, -51
	banim_frame_oam 0x0, 0x0, 0x82, -31, -43
	banim_frame_oam 0x8000, 0x0, 0x71, -7, -43
	banim_frame_oam 0x0, 0x0, 0x90, -15, -35
	banim_frame_oam 0x0, 0x0, 0x92, 1, -35
	banim_frame_oam 0x0, 0x0, 0x8F, -5, -11
	banim_frame_oam 0x4000, 0x4000, 0x1, -39, -75
	banim_frame_oam 0x4000, 0x0, 0xA3, -31, -83
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -61
	banim_frame_oam 0x0, 0x0, 0x5, -3, -55
	banim_frame_oam 0x4000, 0x0, 0x80, -47, -43
	banim_frame_oam 0x0, 0x4000, 0xAE, -8, -27
	banim_frame_oam 0x8000, 0x0, 0x2C, -47, -59
	banim_frame_oam 0x0, 0x4000, 0x4D, -71, -55
	banim_frame_oam 0x0, 0x0, 0x6C, -79, -47
	banim_frame_oam 0x8000, 0x0, 0x2B, -55, -55
	banim_frame_oam 0x0, 0x0, 0x8E, -63, -39
	banim_frame_oam 0x0, 0x4000, 0x8C, -79, -39
	banim_frame_oam 0x0, 0x0, 0xA0, -39, -35
	banim_frame_oam 0x0, 0x0, 0x4A, -72, -23
	banim_frame_end
banim_pekf_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -40, -38
	banim_frame_oam 0x4000, 0x4000, 0x84, -56, -6
	banim_frame_oam 0x0, 0x0, 0x88, -24, -6
	banim_frame_oam 0x4000, 0x0, 0xA4, -56, 2
	banim_frame_oam 0x0, 0x0, 0xA6, -40, 2
	banim_frame_oam 0x0, 0x4000, 0x24, -56, -30
	banim_frame_oam 0x4000, 0x0, 0x64, -56, -14
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -85, -31
	banim_frame_oam 0x8000, 0x0, 0xE, -53, -31
	banim_frame_oam 0x4000, 0x4000, 0x4A, -85, -15
	banim_frame_oam 0x0, 0x0, 0x4E, -53, -15
	banim_frame_oam 0x4000, 0x0, 0x6A, -85, -7
	banim_frame_oam 0x0, 0x0, 0x6C, -69, -7
	banim_frame_oam 0x4000, 0x0, 0xA7, -77, -39
	banim_frame_oam 0x0, 0x0, 0xA9, -61, -39
	banim_frame_end
banim_pekf_sp1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x8A, -78, -50
	banim_frame_oam 0x4000, 0x4000, 0xCA, -78, -34
	banim_frame_oam 0x4000, 0x8000, 0xAE, -46, -42
	banim_frame_oam 0x8000, 0x0, 0xB4, 2, -42
	banim_frame_oam 0x4000, 0x4000, 0xEB, -70, -26
	banim_frame_oam 0x0, 0x0, 0x8F, -38, -50
	banim_frame_oam 0x8000, 0x0, 0xC8, -8, -66
	banim_frame_oam 0x0, 0x4000, 0x4F, -78, -66
	banim_frame_oam 0x8000, 0x0, 0x51, -62, -66
	banim_frame_oam 0x4000, 0x0, 0x6D, -46, -2
	banim_frame_oam 0x0, 0x0, 0x8E, -46, 6
	banim_frame_oam 0x8000, 0x8000, 0x15, -62, -18
	banim_frame_oam 0x4000, 0x0, 0xF, -30, -18
	banim_frame_oam 0x0, 0x0, 0x11, -14, -18
	banim_frame_oam 0x8000, 0x0, 0xC9, -83, -25
	banim_frame_oam 0x0, 0x0, 0x89, -83, -9
	banim_frame_oam 0x4000, 0x0, 0x30, -63, -74
	banim_frame_oam 0x0, 0x4000, 0x12, -47, -82
	banim_frame_oam 0x0, 0x0, 0x14, -31, -82
	banim_frame_oam 0x8000, 0x0, 0x34, -42, -66
	banim_frame_oam 0x0, 0x4000, 0x52, -46, -18
	banim_frame_oam 0x8000, 0x8000, 0x92, -14, -50
	banim_frame_oam 0x4000, 0x4000, 0xEF, -38, -26
	banim_frame_oam 0x0, 0x0, 0x94, 2, -50
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x4000, 0x9C, -6, -74
	banim_frame_oam 0x8000, 0x8000, 0x17, -78, -66
	banim_frame_oam 0x8000, 0x4000, 0x19, -62, -66
	banim_frame_oam 0x4000, 0x4000, 0xEB, -70, -26
	banim_frame_oam 0x4000, 0x0, 0xB1, -22, -42
	banim_frame_oam 0x8000, 0x0, 0xC8, -8, -66
	banim_frame_oam 0x8000, 0x8000, 0x15, -62, -18
	banim_frame_oam 0x0, 0x0, 0xF, -30, -18
	banim_frame_oam 0x4000, 0x0, 0x6D, -46, -2
	banim_frame_oam 0x0, 0x0, 0x8E, -46, 6
	banim_frame_oam 0x0, 0x4000, 0x52, -46, -18
	banim_frame_oam 0x0, 0x0, 0x92, -14, -50
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_oam 0x4000, 0x4000, 0xCB, -70, -34
	banim_frame_oam 0x0, 0x0, 0xCA, -78, -34
	banim_frame_oam 0x4000, 0x0, 0x90, -44, -42
	banim_frame_oam 0x0, 0x0, 0xEA, -63, -74
	banim_frame_oam 0x4000, 0x0, 0xF4, -60, -47
	banim_frame_oam 0x8000, 0x0, 0x94, 2, -50
	banim_frame_oam 0x0, 0x0, 0xD4, 2, -34
	banim_frame_oam 0x0, 0x4000, 0x1A, -38, -34
	banim_frame_oam 0x0, 0x4000, 0xB9, -22, -34
	banim_frame_oam 0x4000, 0x0, 0xF9, -22, -18
	banim_frame_oam 0x8000, 0x4000, 0x9B, -6, -42
	banim_frame_oam 0x0, 0x0, 0x99, -14, -76
	banim_frame_end
banim_pekf_sp1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xCD, -54, -34
	banim_frame_oam 0x4000, 0x0, 0xED, -54, -26
	banim_frame_oam 0x8000, 0x8000, 0x17, -78, -66
	banim_frame_oam 0x8000, 0x4000, 0x19, -62, -66
	banim_frame_oam 0x8000, 0x0, 0xC8, -8, -66
	banim_frame_oam 0x8000, 0x8000, 0x15, -62, -18
	banim_frame_oam 0x4000, 0x0, 0x6D, -46, -2
	banim_frame_oam 0x0, 0x0, 0x8E, -46, 6
	banim_frame_oam 0x0, 0x0, 0xCA, -78, -34
	banim_frame_oam 0x0, 0x4000, 0x52, -46, -18
	banim_frame_oam 0x4000, 0x0, 0x3, -40, 9
	banim_frame_oam 0x4000, 0x1000, 0x3, -56, 9
	banim_frame_oam 0x8000, 0x8000, 0x92, -14, -50
	banim_frame_oam 0x0, 0x0, 0x94, 2, -50
	banim_frame_oam 0x8000, 0x0, 0xB4, 2, -42
	banim_frame_oam 0x0, 0x0, 0xEA, -63, -74
	banim_frame_oam 0x0, 0x0, 0x74, -51, -53
	banim_frame_oam 0x0, 0x0, 0x95, -44, -48
	banim_frame_oam 0x8000, 0x0, 0xB5, -38, -42
	banim_frame_oam 0x0, 0x0, 0xD6, -13, -11
	banim_frame_oam 0x8000, 0x0, 0x96, -14, -26
	banim_frame_oam 0x8000, 0x8000, 0x97, -30, -42
	banim_frame_oam 0x0, 0x0, 0xF3, -6, -26
	banim_frame_oam 0x0, 0x0, 0x3A, -38, -26
	banim_frame_oam 0x0, 0x4000, 0xCB, -70, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -46, -58
	banim_frame_oam 0x8000, 0x4000, 0x20, -54, -50
	banim_frame_oam 0x4000, 0x4000, 0x81, -46, -26
	banim_frame_oam 0x0, 0x4000, 0x8, -78, -47
	banim_frame_oam 0x4000, 0x0, 0x48, -78, -31
	banim_frame_oam 0x8000, 0x0, 0x87, -86, -39
	banim_frame_oam 0x0, 0x0, 0x0, -94, -31
	banim_frame_oam 0x8000, 0x8000, 0x5, -14, -42
	banim_frame_oam 0x0, 0x0, 0x6, -14, -50
	banim_frame_oam 0x8000, 0x0, 0x27, 2, -34
	banim_frame_oam 0x0, 0x0, 0x67, 2, -18
	banim_frame_oam 0x0, 0x4000, 0x85, -5, -10
	banim_frame_oam 0x4000, 0x0, 0xB, -39, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -55, 9
	banim_frame_oam 0x0, 0x0, 0xA0, -46, -18
	banim_frame_oam 0x4000, 0x0, 0xA3, -38, -66
	banim_frame_oam 0x4000, 0x0, 0xA1, -94, -23
	banim_frame_oam 0x8000, 0x0, 0xA, -62, -44
	banim_frame_end
banim_pekf_sp1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x4000, 0xD, -41, -63
	banim_frame_oam 0x0, 0x4000, 0x31, -1, -47
	banim_frame_oam 0x8000, 0x0, 0x50, -17, -47
	banim_frame_oam 0x4000, 0x0, 0x2D, -41, -55
	banim_frame_oam 0x0, 0x0, 0x2F, -25, -55
	banim_frame_oam 0x8000, 0x0, 0x4F, -25, -47
	banim_frame_oam 0x4000, 0x0, 0x61, -41, -47
	banim_frame_oam 0x0, 0x0, 0x82, -33, -39
	banim_frame_oam 0x8000, 0x0, 0x71, -9, -39
	banim_frame_oam 0x0, 0x0, 0x90, -17, -31
	banim_frame_oam 0x0, 0x0, 0x92, -1, -31
	banim_frame_oam 0x0, 0x0, 0x8F, -7, -7
	banim_frame_oam 0x4000, 0x4000, 0x1, -41, -71
	banim_frame_oam 0x4000, 0x0, 0xA3, -33, -79
	banim_frame_oam 0x4000, 0x0, 0x5, -11, -57
	banim_frame_oam 0x0, 0x0, 0x5, -5, -51
	banim_frame_oam 0x4000, 0x0, 0x80, -49, -39
	banim_frame_oam 0x0, 0x4000, 0xAE, -10, -23
	banim_frame_oam 0x8000, 0x0, 0x2C, -49, -55
	banim_frame_oam 0x0, 0x4000, 0x4D, -73, -51
	banim_frame_oam 0x0, 0x0, 0x6C, -81, -43
	banim_frame_oam 0x8000, 0x0, 0x2B, -57, -51
	banim_frame_oam 0x0, 0x0, 0x8E, -65, -35
	banim_frame_oam 0x0, 0x4000, 0x8C, -81, -35
	banim_frame_oam 0x0, 0x0, 0xA0, -41, -31
	banim_frame_oam 0x0, 0x0, 0x4A, -74, -19
	banim_frame_oam 0x4000, 0x0, 0xB, -35, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -51, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x79, -38, -60
	banim_frame_oam 0x0, 0x4000, 0x93, -62, -100
	banim_frame_oam 0x8000, 0x0, 0x95, -46, -100
	banim_frame_oam 0x8000, 0x0, 0x76, -62, -84
	banim_frame_oam 0x4000, 0x0, 0x74, -54, -108
	banim_frame_oam 0x0, 0x4000, 0x17, -54, -84
	banim_frame_oam 0x8000, 0x0, 0x19, -38, -84
	banim_frame_oam 0x4000, 0x0, 0x57, -54, -68
	banim_frame_oam 0x0, 0x0, 0x59, -38, -68
	banim_frame_oam 0x0, 0x4000, 0x1A, -30, -76
	banim_frame_oam 0x4000, 0x0, 0x5A, -30, -60
	banim_frame_oam 0x0, 0x4000, 0x97, -14, -68
	banim_frame_oam 0x0, 0x0, 0x78, -6, -76
	banim_frame_oam 0x8000, 0x4000, 0x3C, 2, -84
	banim_frame_oam 0x8000, 0x8000, 0x1D, 10, -92
	banim_frame_oam 0x0, 0x0, 0x1C, 26, -92
	banim_frame_oam 0x0, 0x0, 0x77, 15, -100
	banim_frame_oam 0x0, 0x4000, 0x31, 2, -52
	banim_frame_oam 0x0, 0x0, 0xB6, -22, -52
	banim_frame_oam 0x4000, 0x0, 0xA8, -38, -52
	banim_frame_oam 0x0, 0x0, 0x7, -46, -52
	banim_frame_oam 0x4000, 0x4000, 0x80, -46, -44
	banim_frame_oam 0x4000, 0x0, 0xB, -29, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -45, 9
	banim_frame_oam 0x4000, 0x0, 0xA3, -30, -84
	banim_frame_oam 0x0, 0x0, 0xA0, -38, -36
	banim_frame_oam 0x0, 0x0, 0x5, -2, -56
	banim_frame_oam 0x0, 0x0, 0xCD, -14, -76
	banim_frame_oam 0x0, 0x0, 0x7B, 10, -60
	banim_frame_oam 0x0, 0x0, 0x7A, 26, -81
	banim_frame_oam 0x0, 0x0, 0x11, -46, -116
	banim_frame_end
banim_pekf_sp1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x4000, 0x20, -35, -96
	banim_frame_oam 0x8000, 0x8000, 0x5, 5, -88
	banim_frame_oam 0x0, 0x0, 0x6, 5, -96
	banim_frame_oam 0x8000, 0x0, 0x27, 21, -80
	banim_frame_oam 0x0, 0x0, 0x67, 21, -64
	banim_frame_oam 0x0, 0x4000, 0x85, 14, -56
	banim_frame_oam 0x4000, 0x8000, 0x68, -27, -96
	banim_frame_oam 0x4000, 0x4000, 0xA8, -27, -80
	banim_frame_oam 0x4000, 0x0, 0x81, -27, -72
	banim_frame_oam 0x0, 0x0, 0x83, -11, -72
	banim_frame_oam 0x0, 0x0, 0xA0, -27, -64
	banim_frame_oam 0x0, 0x0, 0x84, -3, -72
	banim_frame_oam 0x4000, 0x0, 0x1A, -19, -104
	banim_frame_oam 0x0, 0x0, 0x1, -27, -104
	banim_frame_oam 0x4000, 0x0, 0xB, -19, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -35, 9
	banim_frame_oam 0x0, 0x4000, 0x8, -59, -93
	banim_frame_oam 0x4000, 0x0, 0x48, -59, -77
	banim_frame_oam 0x8000, 0x0, 0x87, -67, -85
	banim_frame_oam 0x0, 0x0, 0x0, -75, -77
	banim_frame_oam 0x4000, 0x0, 0xA1, -75, -69
	banim_frame_oam 0x8000, 0x0, 0xA, -43, -90
	banim_frame_oam 0x4000, 0x0, 0xA3, -19, -112
	banim_frame_end
banim_pekf_sp1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x5, 8, -99
	banim_frame_oam 0x8000, 0x0, 0x71, 8, -83
	banim_frame_oam 0x0, 0x0, 0x92, 16, -75
	banim_frame_oam 0x8000, 0x0, 0x50, 0, -91
	banim_frame_oam 0x0, 0x0, 0x90, 0, -75
	banim_frame_oam 0x4000, 0x8000, 0x13, -24, -107
	banim_frame_oam 0x4000, 0x4000, 0x53, -24, -91
	banim_frame_oam 0x8000, 0x0, 0x4F, -8, -92
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, -83
	banim_frame_oam 0x0, 0x0, 0x6, 8, -107
	banim_frame_oam 0x0, 0x3000, 0x6, 0, -99
	banim_frame_oam 0x4000, 0x0, 0x1A, -16, -115
	banim_frame_oam 0x0, 0x0, 0x1, -24, -115
	banim_frame_oam 0x8000, 0x0, 0x2C, -32, -99
	banim_frame_oam 0x0, 0x4000, 0x4D, -56, -95
	banim_frame_oam 0x0, 0x0, 0x6C, -64, -87
	banim_frame_oam 0x8000, 0x0, 0x2B, -40, -95
	banim_frame_oam 0x0, 0x0, 0x8E, -48, -79
	banim_frame_oam 0x0, 0x4000, 0x8C, -64, -79
	banim_frame_oam 0x0, 0x0, 0xA0, -24, -75
	banim_frame_oam 0x0, 0x0, 0x4A, -57, -63
	banim_frame_oam 0x4000, 0x0, 0xA3, -16, -123
	banim_frame_oam 0x0, 0x4000, 0x31, 16, -91
	banim_frame_oam 0x4000, 0x0, 0x5, 6, -101
	banim_frame_oam 0x0, 0x0, 0x5, 12, -95
	banim_frame_oam 0x0, 0x0, 0x8F, 10, -51
	banim_frame_oam 0x0, 0x4000, 0xAE, 7, -67
	banim_frame_oam 0x4000, 0x0, 0xB, -16, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -32, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0xB, -6, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -22, 9
	banim_frame_oam 0x0, 0x0, 0x79, -18, -95
	banim_frame_oam 0x8000, 0x0, 0x76, -42, -119
	banim_frame_oam 0x0, 0x4000, 0x17, -34, -119
	banim_frame_oam 0x8000, 0x0, 0x19, -18, -119
	banim_frame_oam 0x4000, 0x0, 0x57, -34, -103
	banim_frame_oam 0x0, 0x0, 0x59, -18, -103
	banim_frame_oam 0x0, 0x4000, 0x1A, -10, -111
	banim_frame_oam 0x4000, 0x0, 0x5A, -10, -95
	banim_frame_oam 0x0, 0x4000, 0x97, 6, -103
	banim_frame_oam 0x0, 0x0, 0x78, 14, -111
	banim_frame_oam 0x8000, 0x4000, 0x3C, 22, -119
	banim_frame_oam 0x8000, 0x8000, 0x1D, 30, -127
	banim_frame_oam 0x0, 0x0, 0x1C, 46, -127
	banim_frame_oam 0x0, 0x4000, 0x31, 22, -87
	banim_frame_oam 0x0, 0x0, 0xB6, -2, -87
	banim_frame_oam 0x4000, 0x0, 0xA8, -18, -87
	banim_frame_oam 0x0, 0x0, 0x7, -26, -87
	banim_frame_oam 0x4000, 0x4000, 0x80, -26, -79
	banim_frame_oam 0x4000, 0x0, 0xA3, -10, -119
	banim_frame_oam 0x0, 0x0, 0xA0, -18, -71
	banim_frame_oam 0x0, 0x0, 0x5, 18, -91
	banim_frame_oam 0x0, 0x0, 0xCD, 6, -111
	banim_frame_oam 0x4000, 0x0, 0xB3, -42, -127
	banim_frame_oam 0x0, 0x0, 0xB5, -26, -127
	banim_frame_oam 0x0, 0x0, 0x7B, 30, -95
	banim_frame_oam 0x0, 0x0, 0x7A, 46, -116
	banim_frame_end
banim_pekf_sp1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x99, 25, -91
	banim_frame_oam 0x4000, 0x4000, 0xE9, -31, -115
	banim_frame_oam 0x4000, 0x4000, 0xC9, -31, -123
	banim_frame_oam 0x0, 0x0, 0xED, 1, -115
	banim_frame_oam 0x8000, 0x0, 0xC7, 41, -115
	banim_frame_oam 0x8000, 0x0, 0xC8, 49, -115
	banim_frame_oam 0x4000, 0x0, 0xE5, 41, -123
	banim_frame_oam 0x4000, 0x0, 0xC3, 1, -75
	banim_frame_oam 0x0, 0x0, 0xE3, 8, -67
	banim_frame_oam 0x4000, 0x0, 0xB, 4, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -12, 9
	banim_frame_oam 0x0, 0x0, 0x72, 15, -115
	banim_frame_oam 0x0, 0x0, 0x5, 2, -126
	banim_frame_oam 0x0, 0x0, 0x5, 8, -120
	banim_frame_oam 0x0, 0x0, 0x52, 42, -86
	banim_frame_oam 0x0, 0x0, 0x12, 33, -115
	banim_frame_oam 0x4000, 0x0, 0xEE, 41, -99
	banim_frame_oam 0x0, 0x0, 0xB0, 41, -91
	banim_frame_oam 0x0, 0x0, 0xB2, -31, -107
	banim_frame_oam 0x4000, 0x8000, 0xD0, -23, -107
	banim_frame_oam 0x4000, 0x8000, 0xD4, 9, -107
	banim_frame_oam 0x4000, 0x8000, 0xD8, -15, -91
	banim_frame_oam 0x8000, 0x0, 0xDC, 17, -91
	banim_frame_end
banim_pekf_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0xE4, 3, -125
	banim_frame_oam 0x4000, 0x0, 0xC5, 43, -125
	banim_frame_oam 0x4000, 0x0, 0xB, 6, 9
	banim_frame_oam 0x4000, 0x1000, 0xB, -10, 9
	banim_frame_oam 0x0, 0x4000, 0x99, 27, -85
	banim_frame_oam 0x4000, 0x4000, 0xE9, -29, -109
	banim_frame_oam 0x4000, 0x4000, 0xC9, -29, -117
	banim_frame_oam 0x0, 0x0, 0xED, 3, -109
	banim_frame_oam 0x8000, 0x0, 0xC7, 43, -109
	banim_frame_oam 0x8000, 0x0, 0xC8, 51, -109
	banim_frame_oam 0x4000, 0x0, 0xE5, 43, -117
	banim_frame_oam 0x4000, 0x0, 0xC3, 3, -69
	banim_frame_oam 0x0, 0x0, 0xE3, 10, -61
	banim_frame_oam 0x0, 0x0, 0x72, 17, -109
	banim_frame_oam 0x0, 0x0, 0x5, 4, -120
	banim_frame_oam 0x0, 0x0, 0x5, 10, -114
	banim_frame_oam 0x0, 0x0, 0x52, 44, -80
	banim_frame_oam 0x4000, 0x0, 0xE0, -29, -125
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -125
	banim_frame_oam 0x0, 0x0, 0x12, 35, -109
	banim_frame_oam 0x4000, 0x0, 0xEE, 43, -93
	banim_frame_oam 0x0, 0x0, 0xB0, 43, -85
	banim_frame_oam 0x0, 0x0, 0xB2, -29, -101
	banim_frame_oam 0x4000, 0x8000, 0xD0, -21, -101
	banim_frame_oam 0x4000, 0x8000, 0xD4, 11, -101
	banim_frame_oam 0x4000, 0x8000, 0xD8, -13, -85
	banim_frame_oam 0x8000, 0x0, 0xDC, 19, -85
	banim_frame_end
banim_pekf_sp1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -16, -95
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, -63
	banim_frame_oam 0x4000, 0x4000, 0x84, 16, -63
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, -55
	banim_frame_oam 0x4000, 0x0, 0xA5, 24, -55
	banim_frame_oam 0x0, 0x0, 0xA0, 9, -103
	banim_frame_oam 0x0, 0x0, 0xA7, 14, -47
	banim_frame_oam 0x0, 0x0, 0x68, 5, 9
	banim_frame_oam 0x0, 0x0, 0x68, 13, 9
	banim_frame_oam 0x0, 0x0, 0xC, 21, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -3, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -17, -87
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, -55
	banim_frame_oam 0x4000, 0x4000, 0x84, 15, -55
	banim_frame_oam 0x4000, 0x4000, 0xA1, -9, -47
	banim_frame_oam 0x4000, 0x0, 0xA5, 23, -47
	banim_frame_oam 0x0, 0x0, 0xA0, 8, -95
	banim_frame_oam 0x0, 0x0, 0xA7, 13, -39
	banim_frame_oam 0x0, 0x0, 0x68, 4, 9
	banim_frame_oam 0x0, 0x0, 0x68, 12, 9
	banim_frame_oam 0x0, 0x0, 0xC, 20, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -4, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -1, -70
	banim_frame_oam 0x8000, 0x4000, 0xB, 15, -70
	banim_frame_oam 0x0, 0x4000, 0x89, -1, -38
	banim_frame_oam 0x8000, 0x0, 0x8B, 15, -38
	banim_frame_oam 0x4000, 0x0, 0xC9, -1, -22
	banim_frame_oam 0x0, 0x0, 0xCB, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xA8, -9, -30
	banim_frame_oam 0x8000, 0x8000, 0x2C, 23, -62
	banim_frame_oam 0x8000, 0x0, 0xAC, 23, -30
	banim_frame_oam 0x0, 0x0, 0x8, 7, -14
	banim_frame_oam 0x0, 0x0, 0x28, 15, -14
	banim_frame_oam 0x0, 0x0, 0x88, -6, -14
	banim_frame_oam 0x0, 0x0, 0x48, -9, -54
	banim_frame_oam 0x0, 0x0, 0x68, 1, 9
	banim_frame_oam 0x0, 0x0, 0x68, 9, 9
	banim_frame_oam 0x0, 0x0, 0xC, 17, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -7, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x10, 1, -58
	banim_frame_oam 0x4000, 0x8000, 0x90, 1, -26
	banim_frame_oam 0x8000, 0x4000, 0x2F, -7, -50
	banim_frame_oam 0x8000, 0x0, 0xAF, -7, -18
	banim_frame_oam 0x0, 0x0, 0xEF, -7, -2
	banim_frame_oam 0x4000, 0x0, 0xD0, 1, -10
	banim_frame_oam 0x0, 0x0, 0xD2, 17, -10
	banim_frame_oam 0x4000, 0x0, 0xF0, 1, -2
	banim_frame_oam 0x8000, 0x4000, 0x6E, -15, -34
	banim_frame_oam 0x0, 0x0, 0xEE, -15, -2
	banim_frame_oam 0x8000, 0x0, 0xAD, -23, -18
	banim_frame_oam 0x0, 0x0, 0xED, -23, -2
	banim_frame_oam 0x0, 0x0, 0xE, 18, -66
	banim_frame_oam 0x0, 0x0, 0x2E, 7, -66
	banim_frame_oam 0x0, 0x0, 0xD, 33, -38
	banim_frame_oam 0x0, 0x0, 0x4E, 33, -26
	banim_frame_oam 0x0, 0x0, 0x68, -3, 9
	banim_frame_oam 0x0, 0x0, 0x68, 5, 9
	banim_frame_oam 0x0, 0x0, 0xC, 13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -11, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x0, 0x16, -5, -38
	banim_frame_oam 0x0, 0x0, 0x18, 11, -38
	banim_frame_oam 0x4000, 0x4000, 0x35, -13, -30
	banim_frame_oam 0x4000, 0x4000, 0x55, -13, -22
	banim_frame_oam 0x0, 0x0, 0x59, 19, -22
	banim_frame_oam 0x4000, 0x4000, 0x74, -21, -14
	banim_frame_oam 0x4000, 0x0, 0x78, 11, -14
	banim_frame_oam 0x4000, 0x4000, 0x94, -21, -6
	banim_frame_oam 0x4000, 0x0, 0x98, 11, -6
	banim_frame_oam 0x4000, 0x4000, 0xB4, -21, 2
	banim_frame_oam 0x4000, 0x0, 0xB8, 11, 2
	banim_frame_oam 0x4000, 0x4000, 0xD5, -13, 10
	banim_frame_oam 0x8000, 0x0, 0xAD, -29, -6
	banim_frame_oam 0x0, 0x0, 0xED, -29, 10
	banim_frame_oam 0x0, 0x0, 0xAD, -21, -22
	banim_frame_oam 0x0, 0x0, 0xAD, -13, -38
	banim_frame_oam 0x0, 0x0, 0x34, 27, -22
	banim_frame_oam 0x0, 0x0, 0x2E, 1, -54
	banim_frame_oam 0x0, 0x0, 0x68, -3, 9
	banim_frame_oam 0x0, 0x0, 0x68, 5, 9
	banim_frame_oam 0x0, 0x0, 0xC, 13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -11, 9
	banim_frame_oam 0x0, 0x0, 0x14, -3, -46
	banim_frame_oam 0x0, 0x0, 0x15, 4, -46
	banim_frame_end
banim_pekf_sp1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x5A, -21, -22
	banim_frame_oam 0x8000, 0x4000, 0x5E, 11, -22
	banim_frame_oam 0x0, 0x0, 0xDB, -10, 10
	banim_frame_oam 0x4000, 0x0, 0xDD, 3, 10
	banim_frame_oam 0x0, 0x0, 0xDF, 19, 10
	banim_frame_oam 0x8000, 0x0, 0x9F, 19, -6
	banim_frame_oam 0x0, 0x0, 0x7F, 19, -17
	banim_frame_oam 0x4000, 0x4000, 0x3B, -13, -30
	banim_frame_oam 0x0, 0x0, 0x3F, 19, -30
	banim_frame_oam 0x0, 0x0, 0x1C, -5, -38
	banim_frame_oam 0x0, 0x0, 0x1A, 16, -38
	banim_frame_oam 0x0, 0x0, 0xDA, 27, -19
	banim_frame_oam 0x8000, 0x0, 0x19, -29, -14
	banim_frame_oam 0x8000, 0x0, 0xCD, -29, 2
	banim_frame_oam 0x0, 0x2000, 0x6E, -5, 10
	banim_frame_oam 0x0, 0x3000, 0x6E, 19, -22
	banim_frame_oam 0x0, 0x0, 0x6E, -13, -38
	banim_frame_oam 0x0, 0x0, 0x14, -3, -46
	banim_frame_oam 0x0, 0x0, 0x2E, 1, -54
	banim_frame_oam 0x0, 0x0, 0x68, -3, 9
	banim_frame_oam 0x0, 0x0, 0x68, 5, 9
	banim_frame_oam 0x0, 0x0, 0xC, 13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -11, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -37, -22
	banim_frame_oam 0x4000, 0x8000, 0xC4, -5, -22
	banim_frame_oam 0x4000, 0x4000, 0xF2, -29, -30
	banim_frame_oam 0x4000, 0x0, 0xF6, 3, -30
	banim_frame_oam 0x0, 0x0, 0xF8, 19, -30
	banim_frame_oam 0x4000, 0x4000, 0xF9, -21, -38
	banim_frame_oam 0x4000, 0x0, 0xFD, 11, -38
	banim_frame_oam 0x4000, 0x4000, 0xE8, -37, -6
	banim_frame_oam 0x0, 0x0, 0xEC, -5, -6
	banim_frame_oam 0x4000, 0x0, 0x1D, 3, -6
	banim_frame_oam 0x0, 0x0, 0x5F, 19, -6
	banim_frame_oam 0x0, 0x0, 0x1B, 5, 2
	banim_frame_oam 0x0, 0x0, 0x3A, -5, 2
	banim_frame_oam 0x0, 0x0, 0x54, -13, 2
	banim_frame_oam 0x0, 0x0, 0xDB, -10, 10
	banim_frame_oam 0x0, 0x0, 0x68, -3, 9
	banim_frame_oam 0x0, 0x0, 0x68, 5, 9
	banim_frame_oam 0x0, 0x0, 0xC, 13, 9
	banim_frame_oam 0x0, 0x1000, 0xC, -11, 9
	banim_frame_oam 0x0, 0x0, 0xD3, -24, 2
	banim_frame_oam 0x0, 0x2000, 0xF2, -33, 2
	banim_frame_end
banim_pekf_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_50_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -9, -60
	banim_frame_oam 0x8000, 0x0, 0x4, 23, -60
	banim_frame_oam 0x4000, 0x4000, 0x41, -1, -44
	banim_frame_oam 0x0, 0x8000, 0x60, -9, -36
	banim_frame_oam 0x4000, 0x4000, 0xE0, -9, -4
	banim_frame_oam 0x0, 0x4000, 0x84, 23, -28
	banim_frame_oam 0x4000, 0x0, 0xC4, 23, -12
	banim_frame_oam 0x0, 0x0, 0x85, 23, -36
	banim_frame_oam 0x0, 0x4000, 0x6, 7, -76
	banim_frame_oam 0x8000, 0x0, 0x8, 23, -76
	banim_frame_oam 0x8000, 0x0, 0x5, -17, -18
	banim_frame_oam 0x0, 0x0, 0x40, -9, 4
	banim_frame_oam 0x0, 0x0, 0x64, -1, 9
	banim_frame_oam 0x0, 0x0, 0x64, 7, 9
	banim_frame_oam 0x0, 0x0, 0x65, 15, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -9, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -7, -57
	banim_frame_oam 0x8000, 0x4000, 0xD, 25, -57
	banim_frame_oam 0x4000, 0x8000, 0x89, -7, -25
	banim_frame_oam 0x8000, 0x0, 0x8D, 25, -25
	banim_frame_oam 0x4000, 0x4000, 0xC9, -7, -9
	banim_frame_oam 0x0, 0x0, 0xCD, 25, -9
	banim_frame_oam 0x4000, 0x4000, 0xEB, 9, -1
	banim_frame_oam 0x8000, 0x0, 0xAE, 33, -17
	banim_frame_oam 0x8000, 0x0, 0xE, 33, -57
	banim_frame_oam 0x0, 0x4000, 0x47, -7, -73
	banim_frame_oam 0x0, 0x0, 0x88, 17, -65
	banim_frame_oam 0x0, 0x0, 0xA8, 33, -65
	banim_frame_oam 0x0, 0x0, 0xEA, 9, 7
	banim_frame_oam 0x0, 0x0, 0x64, 4, 9
	banim_frame_oam 0x0, 0x0, 0x64, 12, 9
	banim_frame_oam 0x0, 0x0, 0x65, 20, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -4, 9
	banim_frame_oam 0x0, 0x0, 0x12, 9, -58
	banim_frame_end
banim_pekf_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0x36, -24, -26
	banim_frame_oam 0x0, 0x4000, 0x3A, 8, -26
	banim_frame_oam 0x8000, 0x0, 0x3C, 24, -26
	banim_frame_oam 0x4000, 0x4000, 0x76, -24, -10
	banim_frame_oam 0x4000, 0x0, 0x7A, 8, -10
	banim_frame_oam 0x0, 0x0, 0x7C, 24, -10
	banim_frame_oam 0x4000, 0x4000, 0x98, -8, -2
	banim_frame_oam 0x0, 0x0, 0x9C, 24, -2
	banim_frame_oam 0x0, 0x0, 0xB8, -8, 6
	banim_frame_oam 0x4000, 0x0, 0xBA, 8, 6
	banim_frame_oam 0x4000, 0x4000, 0x17, -16, -34
	banim_frame_oam 0x0, 0x4000, 0x96, -32, -42
	banim_frame_oam 0x0, 0x0, 0x64, -4, 9
	banim_frame_oam 0x0, 0x0, 0x64, 4, 9
	banim_frame_oam 0x0, 0x0, 0x65, 12, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -12, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x2, -6, -34
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -42
	banim_frame_oam 0x4000, 0x4000, 0x8, -5, -55
	banim_frame_oam 0x4000, 0x4000, 0x29, 3, -47
	banim_frame_oam 0x0, 0x0, 0x2D, 27, -39
	banim_frame_oam 0x4000, 0x0, 0xC, 11, -39
	banim_frame_end
banim_pekf_sp1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x2, -6, -34
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -42
	banim_frame_oam 0x4000, 0x4000, 0x68, -10, -28
	banim_frame_oam 0x0, 0x0, 0x6C, 22, -28
	banim_frame_oam 0x4000, 0x4000, 0x49, -2, -36
	banim_frame_oam 0x0, 0x0, 0x4D, 30, -36
	banim_frame_oam 0x0, 0x0, 0x28, 30, -44
	banim_frame_end
banim_pekf_sp1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x2, -6, -34
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -42
	banim_frame_oam 0x0, 0x4000, 0x51, -32, -42
	banim_frame_oam 0x8000, 0x0, 0x53, -16, -42
	banim_frame_oam 0x0, 0x0, 0x74, -8, -34
	banim_frame_oam 0x4000, 0x0, 0x54, -24, -26
	banim_frame_oam 0x0, 0x0, 0x56, -8, -26
	banim_frame_oam 0x4000, 0x0, 0x75, 0, -26
	banim_frame_end
banim_pekf_sp1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x2, -6, -34
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -42
	banim_frame_oam 0x4000, 0x4000, 0x12, -23, -55
	banim_frame_oam 0x0, 0x0, 0x16, 9, -55
	banim_frame_oam 0x4000, 0x4000, 0x32, -23, -47
	banim_frame_oam 0x8000, 0x0, 0x11, -31, -47
	banim_frame_end
banim_pekf_sp1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x2, -6, -34
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -42
	banim_frame_oam 0x0, 0x4000, 0x6, -26, -44
	banim_frame_oam 0x0, 0x0, 0x46, -10, -36
	banim_frame_oam 0x0, 0x0, 0x46, -2, -36
	banim_frame_oam 0x0, 0x0, 0x46, 6, -36
	banim_frame_oam 0x0, 0x0, 0x46, 14, -36
	banim_frame_oam 0x0, 0x0, 0x47, 22, -36
	banim_frame_end
banim_pekf_sp1_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x4000, 0xC7, -4, -34
	banim_frame_oam 0x0, 0x0, 0xA8, 4, -42
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0x6, -23, -44
	banim_frame_oam 0x0, 0x0, 0x46, -7, -36
	banim_frame_oam 0x0, 0x0, 0x46, 1, -36
	banim_frame_oam 0x0, 0x0, 0x46, 9, -36
	banim_frame_oam 0x0, 0x0, 0x46, 17, -36
	banim_frame_oam 0x0, 0x0, 0x47, 25, -36
	banim_frame_end
banim_pekf_sp1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, -32, -36
	banim_frame_oam 0x0, 0x0, 0xC2, -16, -36
	banim_frame_oam 0x0, 0x0, 0xC2, -8, -36
	banim_frame_oam 0x4000, 0x3000, 0xC0, 0, -36
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0xC4, -17, -34
	banim_frame_oam 0x8000, 0x0, 0xC6, -1, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -22, -18
	banim_frame_oam 0x0, 0x4000, 0x44, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x80, -22, -2
	banim_frame_oam 0x4000, 0x0, 0x84, 10, -2
	banim_frame_oam 0x4000, 0x4000, 0xA1, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xA5, 18, 6
	banim_frame_oam 0x4000, 0x0, 0x24, 10, -26
	banim_frame_oam 0x0, 0x0, 0x21, -14, -26
	banim_frame_oam 0x4000, 0x0, 0x4, 26, 14
	banim_frame_oam 0x4000, 0x0, 0x0, 10, 14
	banim_frame_oam 0x0, 0x0, 0x20, -8, 9
	banim_frame_oam 0x0, 0x0, 0x20, 0, 9
	banim_frame_oam 0x0, 0x0, 0x20, 8, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 9
	banim_frame_oam 0x0, 0x4000, 0xC4, -17, -34
	banim_frame_oam 0x8000, 0x0, 0xC6, -1, -34
	banim_frame_end
banim_pekf_sp1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -16, -42
	banim_frame_oam 0x8000, 0x4000, 0x8D, 16, -42
	banim_frame_oam 0x8000, 0x0, 0xCE, 24, -26
	banim_frame_oam 0x0, 0x4000, 0xE, -16, -10
	banim_frame_oam 0x8000, 0x0, 0x10, 0, -10
	banim_frame_oam 0x0, 0x0, 0x4F, -8, 6
	banim_frame_oam 0x0, 0x0, 0x4E, -24, -15
	banim_frame_oam 0x0, 0x4000, 0x6E, 8, -10
	banim_frame_oam 0x8000, 0x0, 0x70, 24, -10
	banim_frame_oam 0x0, 0x0, 0xEF, -24, -33
	banim_frame_oam 0x0, 0x4000, 0xAF, -40, -34
	banim_frame_oam 0x0, 0x0, 0x20, -6, 9
	banim_frame_oam 0x0, 0x0, 0x20, 2, 9
	banim_frame_oam 0x0, 0x1000, 0xA0, -14, 9
	banim_frame_oam 0x0, 0x0, 0xA0, 10, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pekf_sp1_oam_frame_52_r:
	banim_frame_oam 0x8000, 0x8000, 0x37, -55, -26
	banim_frame_oam 0x8000, 0x4000, 0x39, -39, -26
	banim_frame_oam 0x4000, 0x0, 0xB6, -58, 6
	banim_frame_oam 0x8000, 0x0, 0x75, -71, -9
	banim_frame_oam 0x8000, 0x0, 0x56, -63, -18
	banim_frame_oam 0x0, 0x0, 0x96, -63, -2
	banim_frame_oam 0x0, 0x4000, 0x34, -31, -22
	banim_frame_oam 0x0, 0x0, 0x47, -51, 9
	banim_frame_oam 0x0, 0x0, 0x47, -43, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -59, 9
	banim_frame_oam 0x0, 0x3000, 0x68, -35, 9
	banim_frame_oam 0x4000, 0x8000, 0x1B, -85, -25
	banim_frame_oam 0x4000, 0x0, 0x5B, -85, -9
	banim_frame_oam 0x0, 0x0, 0x5D, -69, -9
	banim_frame_oam 0x0, 0x0, 0x5E, -77, -1
	banim_frame_oam 0x0, 0x0, 0x3F, -53, -22
	banim_frame_oam 0x8000, 0x0, 0x3A, -93, -25
	banim_frame_oam 0x0, 0x0, 0x7A, -93, -9
	banim_frame_oam 0x8000, 0x0, 0xD6, -101, -25
	banim_frame_end
banim_pekf_sp1_oam_frame_53_r:
	banim_frame_oam 0x8000, 0x8000, 0x7B, -57, -27
	banim_frame_oam 0x8000, 0x4000, 0x7D, -41, -27
	banim_frame_oam 0x4000, 0x0, 0xFB, -57, 5
	banim_frame_oam 0x0, 0x0, 0xFD, -41, 5
	banim_frame_oam 0x0, 0x4000, 0x9E, -33, -19
	banim_frame_oam 0x8000, 0x0, 0xDE, -33, -3
	banim_frame_oam 0x0, 0x0, 0x47, -50, 9
	banim_frame_oam 0x0, 0x0, 0x47, -42, 9
	banim_frame_oam 0x0, 0x2000, 0x68, -58, 9
	banim_frame_oam 0x0, 0x3000, 0x68, -34, 9
	banim_frame_oam 0x4000, 0x0, 0xB8, -71, -27
	banim_frame_oam 0x0, 0x0, 0xBA, -55, -27
	banim_frame_oam 0x4000, 0x4000, 0xD7, -79, -19
	banim_frame_oam 0x4000, 0x4000, 0xF7, -79, -11
	banim_frame_oam 0x0, 0x0, 0xF5, -87, -19
	banim_frame_oam 0x4000, 0x0, 0x7E, -87, -3
	banim_frame_oam 0x0, 0x0, 0x5F, -87, -11
	banim_frame_end
banim_pekf_sp1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -54, -24
	banim_frame_oam 0x4000, 0x0, 0xA0, -54, 8
	banim_frame_oam 0x0, 0x0, 0xA2, -38, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -46, -32
	banim_frame_oam 0x0, 0x0, 0x2, -29, -16
	banim_frame_oam 0x0, 0x0, 0x3, -48, 9
	banim_frame_oam 0x0, 0x0, 0x3, -40, 9
	banim_frame_oam 0x0, 0x0, 0x4, -32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, -56, 9
	banim_frame_oam 0x0, 0x4000, 0xC0, -69, -30
	banim_frame_oam 0x8000, 0x0, 0xC2, -53, -30
	banim_frame_oam 0x0, 0x0, 0xA3, -77, -22
	banim_frame_oam 0x4000, 0x4000, 0xC3, -85, -14
	banim_frame_oam 0x0, 0x0, 0xC7, -53, -14
	banim_frame_oam 0x4000, 0x4000, 0xE3, -85, -6
	banim_frame_end
banim_pekf_sp1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -69, -30
	banim_frame_oam 0x8000, 0x0, 0xC2, -53, -30
	banim_frame_oam 0x0, 0x0, 0xA3, -77, -22
	banim_frame_oam 0x4000, 0x4000, 0xC3, -85, -14
	banim_frame_oam 0x0, 0x0, 0xC7, -53, -14
	banim_frame_oam 0x4000, 0x4000, 0xE3, -85, -6
	banim_frame_oam 0x0, 0x8000, 0x20, -54, -24
	banim_frame_oam 0x4000, 0x0, 0xA0, -54, 8
	banim_frame_oam 0x0, 0x0, 0xA2, -38, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -46, -32
	banim_frame_oam 0x0, 0x0, 0x3, -48, 9
	banim_frame_oam 0x0, 0x0, 0x3, -40, 9
	banim_frame_oam 0x0, 0x0, 0x4, -32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, -56, 9
	banim_frame_end
banim_pekf_sp1_oam_frame_56_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -40, -38
	banim_frame_oam 0x4000, 0x4000, 0x84, -56, -6
	banim_frame_oam 0x0, 0x0, 0x88, -24, -6
	banim_frame_oam 0x4000, 0x0, 0xA4, -56, 2
	banim_frame_oam 0x0, 0x0, 0xA6, -40, 2
	banim_frame_oam 0x0, 0x4000, 0x24, -56, -30
	banim_frame_oam 0x4000, 0x0, 0x64, -56, -14
	banim_frame_oam 0x0, 0x0, 0x3, -48, 9
	banim_frame_oam 0x0, 0x0, 0x3, -40, 9
	banim_frame_oam 0x0, 0x0, 0x4, -32, 9
	banim_frame_oam 0x0, 0x1000, 0x4, -56, 9
	banim_frame_oam 0x4000, 0x8000, 0xA, -85, -31
	banim_frame_oam 0x8000, 0x0, 0xE, -53, -31
	banim_frame_oam 0x4000, 0x4000, 0x4A, -85, -15
	banim_frame_oam 0x0, 0x0, 0x4E, -53, -15
	banim_frame_oam 0x4000, 0x0, 0x6A, -85, -7
	banim_frame_oam 0x0, 0x0, 0x6C, -69, -7
	banim_frame_oam 0x4000, 0x0, 0xA7, -77, -39
	banim_frame_oam 0x0, 0x0, 0xA9, -61, -39
	banim_frame_end
	.section .data.script
banim_pekf_sp1_script:
banim_pekf_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 1, banim_pekf_sp1_oam_frame_1_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_0, 2, banim_pekf_sp1_oam_frame_2_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 3, banim_pekf_sp1_oam_frame_3_r - banim_pekf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 4, banim_pekf_sp1_oam_frame_4_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 6, banim_pekf_sp1_oam_frame_5_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 8, banim_pekf_sp1_oam_frame_6_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_1, 10, banim_pekf_sp1_oam_frame_7_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_1, 12, banim_pekf_sp1_oam_frame_8_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 14, banim_pekf_sp1_oam_frame_9_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 15, banim_pekf_sp1_oam_frame_10_r - banim_pekf_sp1_oam_r
	banim_code_frame 10, banim_pekf_sp1_sheet_1, 16, banim_pekf_sp1_oam_frame_11_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_pekf_sp1_sheet_2, 17, banim_pekf_sp1_oam_frame_12_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 18, banim_pekf_sp1_oam_frame_13_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 11, banim_pekf_sp1_oam_frame_14_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_2, 19, banim_pekf_sp1_oam_frame_15_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 20, banim_pekf_sp1_oam_frame_16_r - banim_pekf_sp1_oam_r
	banim_code_frame 9, banim_pekf_sp1_sheet_2, 21, banim_pekf_sp1_oam_frame_17_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 22, banim_pekf_sp1_oam_frame_18_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 23, banim_pekf_sp1_oam_frame_19_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 24, banim_pekf_sp1_oam_frame_20_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 25, banim_pekf_sp1_oam_frame_21_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 26, banim_pekf_sp1_oam_frame_22_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 27, banim_pekf_sp1_oam_frame_23_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 28, banim_pekf_sp1_oam_frame_24_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 29, banim_pekf_sp1_oam_frame_25_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 31, banim_pekf_sp1_oam_frame_27_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 5, banim_pekf_sp1_oam_frame_29_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 7, banim_pekf_sp1_oam_frame_30_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 9, banim_pekf_sp1_oam_frame_31_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_1, 9, banim_pekf_sp1_oam_frame_31_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_1, 13, banim_pekf_sp1_oam_frame_32_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_frame 10, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 9, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 38, banim_pekf_sp1_oam_frame_36_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_5, 47, banim_pekf_sp1_oam_frame_41_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 1, banim_pekf_sp1_oam_frame_1_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_0, 2, banim_pekf_sp1_oam_frame_2_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 3, banim_pekf_sp1_oam_frame_3_r - banim_pekf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_5
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 4, banim_pekf_sp1_oam_frame_4_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 6, banim_pekf_sp1_oam_frame_5_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 8, banim_pekf_sp1_oam_frame_6_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_1, 10, banim_pekf_sp1_oam_frame_7_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_1, 12, banim_pekf_sp1_oam_frame_8_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 14, banim_pekf_sp1_oam_frame_9_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 15, banim_pekf_sp1_oam_frame_10_r - banim_pekf_sp1_oam_r
	banim_code_frame 12, banim_pekf_sp1_sheet_1, 16, banim_pekf_sp1_oam_frame_11_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_pekf_sp1_sheet_2, 17, banim_pekf_sp1_oam_frame_12_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 18, banim_pekf_sp1_oam_frame_13_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 11, banim_pekf_sp1_oam_frame_14_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_2, 19, banim_pekf_sp1_oam_frame_15_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 20, banim_pekf_sp1_oam_frame_16_r - banim_pekf_sp1_oam_r
	banim_code_frame 9, banim_pekf_sp1_sheet_2, 21, banim_pekf_sp1_oam_frame_17_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 22, banim_pekf_sp1_oam_frame_18_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 23, banim_pekf_sp1_oam_frame_19_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 24, banim_pekf_sp1_oam_frame_20_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 25, banim_pekf_sp1_oam_frame_21_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 26, banim_pekf_sp1_oam_frame_22_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 27, banim_pekf_sp1_oam_frame_23_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 28, banim_pekf_sp1_oam_frame_24_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 29, banim_pekf_sp1_oam_frame_25_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 31, banim_pekf_sp1_oam_frame_27_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 48, banim_pekf_sp1_oam_frame_42_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_6, 50, banim_pekf_sp1_oam_frame_44_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_7, 51, banim_pekf_sp1_oam_frame_45_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_5, 49, banim_pekf_sp1_oam_frame_43_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 32, banim_pekf_sp1_oam_frame_28_r - banim_pekf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_5
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 5, banim_pekf_sp1_oam_frame_29_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 7, banim_pekf_sp1_oam_frame_30_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 9, banim_pekf_sp1_oam_frame_31_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_1, 9, banim_pekf_sp1_oam_frame_31_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_1, 13, banim_pekf_sp1_oam_frame_32_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_frame 12, banim_pekf_sp1_sheet_1, 33, banim_pekf_sp1_oam_frame_33_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 9, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 34, banim_pekf_sp1_oam_frame_34_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 35, banim_pekf_sp1_oam_frame_35_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_5, 43, banim_pekf_sp1_oam_frame_46_r - banim_pekf_sp1_oam_r
	banim_code_frame 10, banim_pekf_sp1_sheet_5, 44, banim_pekf_sp1_oam_frame_47_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pekf_sp1_sheet_5, 45, banim_pekf_sp1_oam_frame_48_r - banim_pekf_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 46, banim_pekf_sp1_oam_frame_49_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_pekf_sp1_sheet_5, 47, banim_pekf_sp1_oam_frame_41_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 38, banim_pekf_sp1_oam_frame_36_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_5, 43, banim_pekf_sp1_oam_frame_46_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 39, banim_pekf_sp1_oam_frame_37_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 40, banim_pekf_sp1_oam_frame_38_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 41, banim_pekf_sp1_oam_frame_39_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 42, banim_pekf_sp1_oam_frame_40_r - banim_pekf_sp1_oam_r
	banim_code_frame 8, banim_pekf_sp1_sheet_5, 43, banim_pekf_sp1_oam_frame_46_r - banim_pekf_sp1_oam_r
	banim_code_frame 12, banim_pekf_sp1_sheet_5, 44, banim_pekf_sp1_oam_frame_47_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_pekf_sp1_sheet_5, 45, banim_pekf_sp1_oam_frame_48_r - banim_pekf_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pekf_sp1_sheet_5, 46, banim_pekf_sp1_oam_frame_49_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_pekf_sp1_sheet_5, 47, banim_pekf_sp1_oam_frame_41_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 36, banim_pekf_sp1_oam_frame_50_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 37, banim_pekf_sp1_oam_frame_51_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 36, banim_pekf_sp1_oam_frame_50_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 36, banim_pekf_sp1_oam_frame_50_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 37, banim_pekf_sp1_oam_frame_51_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 36, banim_pekf_sp1_oam_frame_50_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_mode_stand_close:
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_mode_stand:
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_mode_stand_range:
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pekf_sp1_sheet_0, 0, banim_pekf_sp1_oam_frame_0_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 1, banim_pekf_sp1_oam_frame_1_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_0, 2, banim_pekf_sp1_oam_frame_2_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_pekf_sp1_sheet_0, 3, banim_pekf_sp1_oam_frame_3_r - banim_pekf_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 52, banim_pekf_sp1_oam_frame_52_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_0, 53, banim_pekf_sp1_oam_frame_53_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 54, banim_pekf_sp1_oam_frame_54_r - banim_pekf_sp1_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_1, 55, banim_pekf_sp1_oam_frame_55_r - banim_pekf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_1, 56, banim_pekf_sp1_oam_frame_56_r - banim_pekf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 14, banim_pekf_sp1_oam_frame_9_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_1, 15, banim_pekf_sp1_oam_frame_10_r - banim_pekf_sp1_oam_r
	banim_code_frame 10, banim_pekf_sp1_sheet_1, 16, banim_pekf_sp1_oam_frame_11_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_pekf_sp1_sheet_2, 17, banim_pekf_sp1_oam_frame_12_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 18, banim_pekf_sp1_oam_frame_13_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 11, banim_pekf_sp1_oam_frame_14_r - banim_pekf_sp1_oam_r
	banim_code_frame 6, banim_pekf_sp1_sheet_2, 19, banim_pekf_sp1_oam_frame_15_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 20, banim_pekf_sp1_oam_frame_16_r - banim_pekf_sp1_oam_r
	banim_code_frame 9, banim_pekf_sp1_sheet_2, 21, banim_pekf_sp1_oam_frame_17_r - banim_pekf_sp1_oam_r
	banim_code_frame 7, banim_pekf_sp1_sheet_2, 22, banim_pekf_sp1_oam_frame_18_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 23, banim_pekf_sp1_oam_frame_19_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_pekf_sp1_sheet_2, 24, banim_pekf_sp1_oam_frame_20_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 25, banim_pekf_sp1_oam_frame_21_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 26, banim_pekf_sp1_oam_frame_22_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 27, banim_pekf_sp1_oam_frame_23_r - banim_pekf_sp1_oam_r
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 28, banim_pekf_sp1_oam_frame_24_r - banim_pekf_sp1_oam_r
	banim_code_frame 4, banim_pekf_sp1_sheet_3, 29, banim_pekf_sp1_oam_frame_25_r - banim_pekf_sp1_oam_r
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_pekf_sp1_sheet_3, 30, banim_pekf_sp1_oam_frame_26_r - banim_pekf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_pekf_sp1_sheet_3, 31, banim_pekf_sp1_oam_frame_27_r - banim_pekf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pekf_sp1_mode_attack_close - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_close_back - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_close_critical - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_close_critical_back - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_range - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_range_critical - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_dodge_close - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_dodge_range - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_stand_close - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_stand - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_stand_range - banim_pekf_sp1_script
	.word banim_pekf_sp1_mode_attack_miss - banim_pekf_sp1_script
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

