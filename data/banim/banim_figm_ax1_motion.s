@ vim:ft=armv4
	.global banim_figm_ax1_script
	.global banim_figm_ax1_oam_r
	.global banim_figm_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x18
	.section .data.oam_l
banim_figm_ax1_oam_l:
banim_figm_ax1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x41, -19, -14
	banim_frame_oam 0x8000, 0x1000, 0x20, 13, -22
	banim_frame_oam 0x0, 0x1000, 0x60, 13, -6
	banim_frame_oam 0x0, 0x5000, 0x1, -3, -30
	banim_frame_oam 0x8000, 0x1000, 0x3, -11, -30
	banim_frame_oam 0x0, 0x1000, 0xA0, 13, 10
	banim_frame_end
banim_figm_ax1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -17, -38
	banim_frame_oam 0x0, 0x5000, 0x87, -17, -6
	banim_frame_oam 0x4000, 0x5000, 0xC5, -17, 10
	banim_frame_oam 0x8000, 0x5000, 0x6, -1, -38
	banim_frame_oam 0x8000, 0x1000, 0x86, -1, -6
	banim_frame_oam 0x8000, 0x1000, 0x45, 7, -22
	banim_frame_end
banim_figm_ax1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x9, -21, -30
	banim_frame_oam 0x8000, 0x1000, 0xD, -29, -30
	banim_frame_oam 0x0, 0x1000, 0x4D, -29, -14
	banim_frame_oam 0x4000, 0x5000, 0xA9, -21, 10
	banim_frame_oam 0x4000, 0x1000, 0x8A, -13, 2
	banim_frame_oam 0x0, 0x1000, 0x8C, -21, 2
	banim_frame_end
banim_figm_ax1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x8000, 0x1000, 0x10, -15, -30
	banim_frame_oam 0x0, 0x9000, 0x18, -40, -28
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_4_l:
	banim_frame_affine -252, 44, 44, 252, 1
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x8000, 0x1000, 0x10, -15, -30
	banim_frame_oam 0x100, 0x8000, 0x18, -39, -28
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_5_l:
	banim_frame_affine -240, 87, 87, 240, 1
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x8000, 0x1000, 0x10, -15, -30
	banim_frame_oam 0x100, 0x8000, 0x18, -38, -26
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_6_l:
	banim_frame_affine -221, 127, 127, 221, 1
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x100, 0x8000, 0x18, -37, -26
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_7_l:
	banim_frame_affine -196, 164, 164, 196, 1
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x100, 0x8000, 0x18, -36, -25
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_8_l:
	banim_frame_affine -164, 196, 196, 164, 1
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x100, 0x8000, 0x18, -35, -25
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -19
	banim_frame_oam 0x8000, 0x9000, 0x98, -25, -26
	banim_frame_oam 0x8000, 0x1000, 0xDA, -33, -10
	banim_frame_oam 0x0, 0x1000, 0x9A, -25, 6
	banim_frame_oam 0x4000, 0x5000, 0xAE, -23, 10
	banim_frame_oam 0x8000, 0x9000, 0x2F, -15, -22
	banim_frame_oam 0x8000, 0x1000, 0x31, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x4E, 1, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, -15, -30
	banim_frame_end
banim_figm_ax1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x5000, 0xD2, -24, 10
	banim_frame_oam 0x8000, 0x9000, 0x53, -16, -22
	banim_frame_oam 0x8000, 0x1000, 0x72, 0, -14
	banim_frame_oam 0x0, 0x1000, 0xB2, 0, 2
	banim_frame_oam 0x4000, 0x9000, 0x14, -40, -38
	banim_frame_oam 0x0, 0x1000, 0x57, -40, -22
	banim_frame_oam 0x0, 0x5000, 0x55, -32, -22
	banim_frame_oam 0x0, 0x1000, 0x33, -8, -30
	banim_frame_end
banim_figm_ax1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x5000, 0x84, -3, -29
	banim_frame_oam 0x4000, 0x1000, 0x88, -19, -29
	banim_frame_oam 0x0, 0x5000, 0xA8, -19, -21
	banim_frame_oam 0x4000, 0x5000, 0xE6, -19, -5
	banim_frame_oam 0x4000, 0x5000, 0xA0, 5, -69
	banim_frame_oam 0x4000, 0x1000, 0xC0, -11, -69
	banim_frame_oam 0x0, 0x1000, 0xC2, -19, -69
	banim_frame_oam 0x0, 0x5000, 0xA, -3, 3
	banim_frame_oam 0x0, 0x5000, 0x4A, -19, 3
	banim_frame_oam 0x0, 0x5000, 0xA6, -3, -21
	banim_frame_oam 0x0, 0x1000, 0xA5, 13, -21
	banim_frame_oam 0x4000, 0x1000, 0x81, 37, -29
	banim_frame_oam 0x0, 0x1000, 0x83, 29, -29
	banim_frame_oam 0x4000, 0x5000, 0x60, 29, -37
	banim_frame_oam 0x4000, 0x5000, 0x64, -3, -37
	banim_frame_oam 0x4000, 0x1000, 0x68, -19, -37
	banim_frame_oam 0x4000, 0x5000, 0x40, 29, -45
	banim_frame_oam 0x4000, 0x1000, 0x44, 13, -45
	banim_frame_oam 0x4000, 0x5000, 0x21, 21, -53
	banim_frame_oam 0x4000, 0x5000, 0x2, 13, -61
	banim_frame_oam 0x0, 0x1000, 0x20, -3, -61
	banim_frame_oam 0x4000, 0x1000, 0x0, -19, -61
	banim_frame_oam 0x0, 0x1000, 0x80, 5, -61
	banim_frame_oam 0x0, 0x1000, 0xE2, -27, -61
	banim_frame_oam 0x4000, 0x1000, 0xE0, -35, -53
	banim_frame_end
banim_figm_ax1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -1, -43
	banim_frame_oam 0x4000, 0x1000, 0xCE, 7, -51
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -51
	banim_frame_oam 0x0, 0x5000, 0xAC, 31, -28
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x5000, 0x10, -17, -43
	banim_frame_oam 0x4000, 0x1000, 0x50, -17, -27
	banim_frame_oam 0x0, 0x1000, 0x70, -9, -19
	banim_frame_oam 0x8000, 0x9000, 0x71, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x73, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xAB, 47, -28
	banim_frame_oam 0x0, 0x1000, 0xCB, 47, -20
	banim_frame_oam 0x0, 0x1000, 0x8F, -1, -11
	banim_frame_end
banim_figm_ax1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 47, -36
	banim_frame_oam 0x4000, 0x1000, 0x52, 47, -20
	banim_frame_end
banim_figm_ax1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xCE, 7, -51
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -51
	banim_frame_oam 0x0, 0x5000, 0xAC, 31, -27
	banim_frame_oam 0x8000, 0x9000, 0xC, 15, -43
	banim_frame_oam 0x8000, 0x5000, 0xE, 7, -43
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -43
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -27
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -19
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -51
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -35
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0xAB, 47, -27
	banim_frame_oam 0x0, 0x1000, 0xCB, 47, -19
	banim_frame_end
banim_figm_ax1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 47, -35
	banim_frame_oam 0x4000, 0x1000, 0x52, 47, -19
	banim_frame_end
banim_figm_ax1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x1000, 0xEC, 44, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, 36, -32
	banim_frame_oam 0x4000, 0x1000, 0xEF, 44, -24
	banim_frame_oam 0x4000, 0x1000, 0xF1, 36, -40
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -43
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -27
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -19
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -51
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -51
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -35
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -43
	banim_frame_oam 0x0, 0x1000, 0x8E, 15, -43
	banim_frame_oam 0x4000, 0x5000, 0x8A, 7, -51
	banim_frame_oam 0x0, 0x1000, 0xAA, 31, -43
	banim_frame_oam 0x0, 0x1000, 0xCA, 23, -43
	banim_frame_oam 0x0, 0x5000, 0xB6, 23, -35
	banim_frame_oam 0x4000, 0x1000, 0xAF, 19, -19
	banim_frame_oam 0x4000, 0x1000, 0x98, 7, -35
	banim_frame_oam 0x8000, 0x1000, 0xB8, 15, -27
	banim_frame_oam 0x8000, 0x1000, 0x1A, 7, -27
	banim_frame_end
banim_figm_ax1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -40
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -24
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -48
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -32
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -40
	banim_frame_oam 0x0, 0x1000, 0x8E, 15, -40
	banim_frame_oam 0x4000, 0x5000, 0x8A, 7, -48
	banim_frame_oam 0x0, 0x1000, 0xAA, 31, -40
	banim_frame_oam 0x0, 0x1000, 0xCA, 23, -40
	banim_frame_oam 0x0, 0x5000, 0xB6, 23, -32
	banim_frame_oam 0x4000, 0x1000, 0xAF, 19, -16
	banim_frame_oam 0x4000, 0x1000, 0x98, 7, -32
	banim_frame_oam 0x8000, 0x1000, 0xB8, 15, -24
	banim_frame_oam 0x8000, 0x1000, 0x1A, 7, -24
	banim_frame_end
banim_figm_ax1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -37
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -21
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -13
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -45
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -45
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -29
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -37
	banim_frame_oam 0x0, 0x1000, 0x8E, 15, -37
	banim_frame_oam 0x4000, 0x5000, 0x8A, 7, -45
	banim_frame_oam 0x0, 0x1000, 0xAA, 31, -37
	banim_frame_oam 0x0, 0x1000, 0xCA, 23, -37
	banim_frame_oam 0x0, 0x5000, 0xB6, 23, -29
	banim_frame_oam 0x4000, 0x1000, 0xAF, 19, -13
	banim_frame_oam 0x4000, 0x1000, 0x98, 7, -29
	banim_frame_oam 0x8000, 0x1000, 0xB8, 15, -21
	banim_frame_oam 0x8000, 0x1000, 0x1A, 7, -21
	banim_frame_end
banim_figm_ax1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -33
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -17
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -9
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -41
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -40
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -24
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -33
	banim_frame_oam 0x0, 0x1000, 0x8E, 15, -33
	banim_frame_oam 0x4000, 0x5000, 0x8A, 7, -41
	banim_frame_oam 0x0, 0x1000, 0xAA, 31, -33
	banim_frame_oam 0x0, 0x1000, 0xCA, 23, -33
	banim_frame_oam 0x0, 0x5000, 0xB6, 23, -25
	banim_frame_oam 0x4000, 0x1000, 0xAF, 19, -9
	banim_frame_oam 0x4000, 0x1000, 0x98, 7, -25
	banim_frame_oam 0x8000, 0x1000, 0xB8, 15, -17
	banim_frame_oam 0x8000, 0x1000, 0x1A, 7, -17
	banim_frame_end
banim_figm_ax1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x1000, 0x14, -1, -29
	banim_frame_oam 0x0, 0x1000, 0x54, -1, -13
	banim_frame_oam 0x0, 0x5000, 0x74, -9, -5
	banim_frame_oam 0x0, 0x1000, 0xD0, -1, -37
	banim_frame_oam 0x0, 0x5000, 0x18, -9, -36
	banim_frame_oam 0x4000, 0x1000, 0x58, -9, -20
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 7, -29
	banim_frame_oam 0x0, 0x1000, 0x8E, 15, -29
	banim_frame_oam 0x4000, 0x5000, 0x8A, 7, -37
	banim_frame_oam 0x0, 0x1000, 0xAA, 31, -29
	banim_frame_oam 0x0, 0x1000, 0xCA, 23, -29
	banim_frame_oam 0x0, 0x5000, 0xB6, 23, -21
	banim_frame_oam 0x4000, 0x1000, 0xAF, 19, -5
	banim_frame_oam 0x4000, 0x1000, 0x98, 7, -21
	banim_frame_oam 0x8000, 0x1000, 0xB8, 15, -13
	banim_frame_oam 0x8000, 0x1000, 0x1A, 7, -13
	banim_frame_end
banim_figm_ax1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0xB9, 8, -29
	banim_frame_oam 0x4000, 0x5000, 0xF9, 8, -13
	banim_frame_oam 0x4000, 0x1000, 0xFD, -8, -13
	banim_frame_oam 0x4000, 0x5000, 0xF3, 8, -5
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, -5
	banim_frame_oam 0x0, 0x5000, 0xB4, 0, 3
	banim_frame_oam 0x0, 0x1000, 0xFF, 32, 3
	banim_frame_oam 0x8000, 0x1000, 0xBD, 0, -29
	banim_frame_oam 0x0, 0x1000, 0xDE, -8, -21
	banim_frame_oam 0x0, 0x5000, 0x5A, 16, 3
	banim_frame_end
banim_figm_ax1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 8, -29
	banim_frame_oam 0x8000, 0x5000, 0x4, 0, -29
	banim_frame_oam 0x4000, 0x9000, 0x80, 8, 3
	banim_frame_oam 0x8000, 0x1000, 0x84, 0, 3
	banim_frame_end
banim_figm_ax1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x5000, 0x45, 8, -17
	banim_frame_oam 0x4000, 0x9000, 0x65, 8, -9
	banim_frame_oam 0x4000, 0x5000, 0xA5, 8, 7
	banim_frame_oam 0x8000, 0x5000, 0x29, 0, -25
	banim_frame_oam 0x0, 0x1000, 0xA9, 0, 7
	banim_frame_oam 0x0, 0x5000, 0x6, 16, -33
	banim_frame_oam 0x8000, 0x1000, 0x8, 8, -33
	banim_frame_end
banim_figm_ax1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x5000, 0x45, 0, -18
	banim_frame_oam 0x4000, 0x9000, 0x4A, 0, -10
	banim_frame_oam 0x4000, 0x5000, 0x8A, 0, 6
	banim_frame_oam 0x8000, 0x5000, 0xE, -8, -26
	banim_frame_oam 0x0, 0x1000, 0x8E, -8, 6
	banim_frame_oam 0x4000, 0x5000, 0xA, 0, -26
	banim_frame_oam 0x4000, 0x1000, 0x6, 8, -34
	banim_frame_oam 0x0, 0x1000, 0x8, 0, -34
	banim_frame_end
banim_figm_ax1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x9000, 0xF, -2, -25
	banim_frame_oam 0x4000, 0x5000, 0x4F, -2, -9
	banim_frame_oam 0x4000, 0x9000, 0x70, -10, -1
	banim_frame_oam 0x8000, 0x1000, 0x13, -10, -25
	banim_frame_oam 0x0, 0x1000, 0x53, -10, -9
	banim_frame_oam 0x8000, 0x1000, 0x6F, -18, -17
	banim_frame_oam 0x4000, 0x1000, 0x6, 5, -33
	banim_frame_oam 0x0, 0x1000, 0x8, -3, -33
	banim_frame_end
banim_figm_ax1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -11, -26
	banim_frame_oam 0x8000, 0x5000, 0x18, -19, -26
	banim_frame_oam 0x4000, 0x5000, 0x94, -11, 6
	banim_frame_oam 0x0, 0x1000, 0x98, -19, 6
	banim_frame_oam 0x4000, 0x1000, 0x6, -3, -34
	banim_frame_oam 0x0, 0x1000, 0x8, -11, -34
	banim_frame_end
banim_figm_ax1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -3, -32
	banim_frame_oam 0x8000, 0x1000, 0xC2, -11, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -10, -16
	banim_frame_oam 0x0, 0x5000, 0xC7, -26, -16
	banim_frame_oam 0x4000, 0x9000, 0xC9, -18, 0
	banim_frame_end
banim_figm_ax1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -19, 2
	banim_frame_oam 0x4000, 0x9000, 0x0, -19, -30
	banim_frame_oam 0x8000, 0x1000, 0x4, -27, -30
	banim_frame_oam 0x4000, 0x5000, 0x40, -19, -14
	banim_frame_oam 0x0, 0x1000, 0x44, -27, -14
	banim_frame_oam 0x4000, 0x5000, 0x60, -19, -6
	banim_frame_oam 0x0, 0x1000, 0x64, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x82, 13, -6
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -14
	banim_frame_oam 0x0, 0x1000, 0x80, 13, -22
	banim_frame_end
banim_figm_ax1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -19, 2
	banim_frame_oam 0x4000, 0x9000, 0xA0, -19, -22
	banim_frame_oam 0x4000, 0x5000, 0xE0, -19, -6
	banim_frame_oam 0x4000, 0x1000, 0x83, -27, -30
	banim_frame_oam 0x8000, 0x1000, 0xA4, -27, -22
	banim_frame_oam 0x0, 0x1000, 0xE4, -35, -24
	banim_frame_end
banim_figm_ax1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -19, 2
	banim_frame_oam 0x0, 0x5000, 0x65, -11, -22
	banim_frame_oam 0x8000, 0x1000, 0x67, -19, -22
	banim_frame_oam 0x4000, 0x1000, 0xA5, -11, -6
	banim_frame_oam 0x0, 0x1000, 0xA7, -19, -6
	banim_frame_oam 0x4000, 0x1000, 0x47, -27, -30
	banim_frame_oam 0x8000, 0x1000, 0x68, -27, -22
	banim_frame_oam 0x0, 0x1000, 0xA8, -27, -38
	banim_frame_oam 0x0, 0x1000, 0x45, -35, -30
	banim_frame_oam 0x0, 0x1000, 0x46, -35, -22
	banim_frame_oam 0x8000, 0x1000, 0xA0, 5, -22
	banim_frame_oam 0x0, 0x1000, 0xE0, 5, -6
	banim_frame_end
banim_figm_ax1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x4000, 0x9000, 0x49, -11, -6
	banim_frame_oam 0x8000, 0x1000, 0x4D, -19, -6
	banim_frame_oam 0x4000, 0x9000, 0xA, -19, -22
	banim_frame_oam 0x8000, 0x1000, 0xE, -27, -22
	banim_frame_oam 0x0, 0x1000, 0x4E, -35, -22
	banim_frame_oam 0x0, 0x1000, 0x29, -34, -30
	banim_frame_oam 0x0, 0x1000, 0x6E, 21, 2
	banim_frame_oam 0x0, 0x1000, 0x9, 21, -6
	banim_frame_end
banim_figm_ax1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x8000, 0x1000, 0x8A, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x8C, 12, -8
	banim_frame_oam 0x0, 0x1000, 0x8B, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xAB, 20, -8
	banim_frame_oam 0x4000, 0x1000, 0xEB, 20, 8
	banim_frame_oam 0x8000, 0x1000, 0xCA, 36, 0
	banim_frame_end
banim_figm_ax1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xCF, -1, -6
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x4000, 0x9000, 0xD1, -33, -6
	banim_frame_oam 0x8000, 0x1000, 0x89, 31, 0
	banim_frame_oam 0x4000, 0x1000, 0x8D, -29, -14
	banim_frame_oam 0x0, 0x5000, 0xCD, 15, -3
	banim_frame_end
banim_figm_ax1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x0, 0x5000, 0x2F, -22, -8
	banim_frame_oam 0x8000, 0x1000, 0x31, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x11, -30, 8
	banim_frame_oam 0x0, 0x1000, 0x10, -38, -8
	banim_frame_oam 0x0, 0x1000, 0xF, -38, 0
	banim_frame_end
banim_figm_ax1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x4000, 0x9000, 0x6F, -36, -23
	banim_frame_oam 0x4000, 0x5000, 0xAF, -36, -7
	banim_frame_end
banim_figm_ax1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x0, 0x5000, 0x12, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x52, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x54, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x73, -16, -16
	banim_frame_end
banim_figm_ax1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x0, 0x1000, 0xAD, 22, -46
	banim_frame_oam 0x0, 0x1000, 0xAE, 22, -38
	banim_frame_oam 0x8000, 0x5000, 0x15, 14, -54
	banim_frame_oam 0x8000, 0x5000, 0x36, 6, -46
	banim_frame_oam 0x0, 0x1000, 0xB6, 6, -14
	banim_frame_oam 0x0, 0x1000, 0x95, 14, -21
	banim_frame_oam 0x0, 0x1000, 0x16, -2, -15
	banim_frame_end
banim_figm_ax1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x0, 0x9000, 0x17, 12, -32
	banim_frame_oam 0x8000, 0x5000, 0x1B, 4, -32
	banim_frame_oam 0x4000, 0x1000, 0xB4, 20, -40
	banim_frame_oam 0x4000, 0x1000, 0x93, 28, 0
	banim_frame_oam 0x0, 0x1000, 0xB3, 20, 0
	banim_frame_end
banim_figm_ax1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xC, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 2
	banim_frame_oam 0x4000, 0x5000, 0x25, -19, 10
	banim_frame_oam 0x0, 0x5000, 0x97, 3, -8
	banim_frame_oam 0x4000, 0x1000, 0xD7, 3, 8
	banim_frame_oam 0x8000, 0x1000, 0xD5, 19, -5
	banim_frame_oam 0x0, 0x9000, 0x99, -42, -19
	banim_frame_oam 0x4000, 0x1000, 0xF6, -42, -27
	banim_frame_oam 0x8000, 0x1000, 0xDD, -42, -43
	banim_frame_oam 0x0, 0x1000, 0xFE, -50, -11
	banim_frame_end
banim_figm_ax1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0xB2, 0, -10
	banim_frame_oam 0x8000, 0x1000, 0xB4, -8, -10
	banim_frame_oam 0x4000, 0x1000, 0xF2, 0, 6
	banim_frame_oam 0x0, 0x1000, 0xF4, -8, 6
	banim_frame_oam 0x0, 0x5000, 0xD5, 0, -26
	banim_frame_oam 0x8000, 0x1000, 0xD7, -8, -26
	banim_frame_oam 0x4000, 0x1000, 0xB5, 5, -34
	banim_frame_oam 0x0, 0x1000, 0xB7, -3, -34
	banim_frame_oam 0x4000, 0x1000, 0xF8, -3, -42
	banim_frame_end
banim_figm_ax1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x5000, 0xBA, 11, -11
	banim_frame_oam 0x8000, 0x1000, 0xBC, 3, -11
	banim_frame_oam 0x4000, 0x1000, 0xFA, 11, 5
	banim_frame_oam 0x0, 0x1000, 0xFC, 3, 5
	banim_frame_oam 0x0, 0x5000, 0x3D, 11, -35
	banim_frame_oam 0x8000, 0x1000, 0x3F, 3, -35
	banim_frame_oam 0x4000, 0x1000, 0x7D, 11, -19
	banim_frame_oam 0x0, 0x1000, 0x7F, 3, -19
	banim_frame_oam 0x0, 0x1000, 0xD9, 13, -43
	banim_frame_oam 0x4000, 0x1000, 0xB8, 27, -19
	banim_frame_oam 0x8000, 0x1000, 0x9D, -5, -19
	banim_frame_oam 0x0, 0x1000, 0xD8, 27, 5
	banim_frame_end
banim_figm_ax1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 6, -20
	banim_frame_oam 0x4000, 0x1000, 0xCE, 14, -28
	banim_frame_oam 0x0, 0x1000, 0xD0, 6, -28
	banim_frame_oam 0x0, 0x5000, 0xAC, 38, -5
	banim_frame_oam 0x0, 0x1000, 0xAB, 54, -5
	banim_frame_oam 0x0, 0x1000, 0xCB, 54, 3
	banim_frame_oam 0x0, 0x1000, 0x8F, 6, 12
	banim_frame_oam 0x0, 0x1000, 0x70, -2, 4
	banim_frame_oam 0x0, 0x5000, 0x10, -10, -20
	banim_frame_oam 0x0, 0x1000, 0x51, -10, -4
	banim_frame_oam 0x0, 0x5000, 0x12, 55, -13
	banim_frame_oam 0x4000, 0x1000, 0x52, 55, 3
	banim_frame_oam 0x4000, 0x1000, 0xEA, 8, 10
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_end
banim_figm_ax1_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x1000, 0xCE, 14, -28
	banim_frame_oam 0x0, 0x1000, 0xD0, 6, -28
	banim_frame_oam 0x0, 0x5000, 0xAC, 38, -4
	banim_frame_oam 0x8000, 0x9000, 0xC, 22, -20
	banim_frame_oam 0x8000, 0x5000, 0xE, 14, -20
	banim_frame_oam 0x8000, 0x1000, 0x14, 6, -20
	banim_frame_oam 0x0, 0x1000, 0x54, 6, -4
	banim_frame_oam 0x0, 0x5000, 0x74, -2, 4
	banim_frame_oam 0x0, 0x5000, 0x18, -2, -28
	banim_frame_oam 0x4000, 0x1000, 0x58, -2, -12
	banim_frame_oam 0x0, 0x1000, 0xAB, 54, -4
	banim_frame_oam 0x0, 0x1000, 0xCB, 54, 4
	banim_frame_oam 0x4000, 0x1000, 0xEA, 8, 10
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x5000, 0x12, 55, -12
	banim_frame_oam 0x4000, 0x1000, 0x52, 55, 4
	banim_frame_end
banim_figm_ax1_oam_frame_48_l:
	banim_frame_oam 0x8000, 0x1000, 0x14, 6, -20
	banim_frame_oam 0x0, 0x1000, 0x54, 6, -4
	banim_frame_oam 0x0, 0x5000, 0x74, -2, 4
	banim_frame_oam 0x0, 0x1000, 0xD0, 6, -28
	banim_frame_oam 0x0, 0x5000, 0x18, -2, -28
	banim_frame_oam 0x4000, 0x1000, 0x58, -2, -12
	banim_frame_oam 0x4000, 0x1000, 0xEA, 8, 10
	banim_frame_oam 0x4000, 0x1000, 0xEA, 0, 10
	banim_frame_oam 0x0, 0x1000, 0x90, 14, -20
	banim_frame_oam 0x0, 0x1000, 0x8E, 22, -20
	banim_frame_oam 0x4000, 0x5000, 0x8A, 14, -28
	banim_frame_oam 0x0, 0x1000, 0xAA, 38, -20
	banim_frame_oam 0x0, 0x1000, 0xCA, 30, -20
	banim_frame_oam 0x0, 0x5000, 0xB6, 30, -12
	banim_frame_oam 0x4000, 0x1000, 0xAF, 26, 4
	banim_frame_oam 0x4000, 0x1000, 0x98, 14, -12
	banim_frame_oam 0x8000, 0x1000, 0xB8, 22, -4
	banim_frame_oam 0x8000, 0x1000, 0x1A, 14, -4
	banim_frame_end
banim_figm_ax1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_figm_ax1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_figm_ax1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_figm_ax1_oam_frame_43_l:
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
	.section .data.oam_r
banim_figm_ax1_oam_r:
banim_figm_ax1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x41, -13, -14
	banim_frame_oam 0x8000, 0x0, 0x20, -21, -22
	banim_frame_oam 0x0, 0x0, 0x60, -21, -6
	banim_frame_oam 0x0, 0x4000, 0x1, -13, -30
	banim_frame_oam 0x8000, 0x0, 0x3, 3, -30
	banim_frame_oam 0x0, 0x0, 0xA0, -21, 10
	banim_frame_end
banim_figm_ax1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, 1, -38
	banim_frame_oam 0x0, 0x4000, 0x87, 1, -6
	banim_frame_oam 0x4000, 0x4000, 0xC5, -15, 10
	banim_frame_oam 0x8000, 0x4000, 0x6, -7, -38
	banim_frame_oam 0x8000, 0x0, 0x86, -7, -6
	banim_frame_oam 0x8000, 0x0, 0x45, -15, -22
	banim_frame_end
banim_figm_ax1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -11, -30
	banim_frame_oam 0x8000, 0x0, 0xD, 21, -30
	banim_frame_oam 0x0, 0x0, 0x4D, 21, -14
	banim_frame_oam 0x4000, 0x4000, 0xA9, -11, 10
	banim_frame_oam 0x4000, 0x0, 0x8A, -3, 2
	banim_frame_oam 0x0, 0x0, 0x8C, 13, 2
	banim_frame_end
banim_figm_ax1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x8000, 0x0, 0x10, 7, -30
	banim_frame_oam 0x0, 0x8000, 0x18, 8, -28
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_4_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x8000, 0x0, 0x10, 7, -30
	banim_frame_oam 0x100, 0x8000, 0x18, 7, -28
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_5_r:
	banim_frame_affine 240, 87, -87, 240, 1
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x8000, 0x0, 0x10, 7, -30
	banim_frame_oam 0x100, 0x8000, 0x18, 6, -26
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_6_r:
	banim_frame_affine 221, 127, -127, 221, 1
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x100, 0x8000, 0x18, 5, -26
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_7_r:
	banim_frame_affine 196, 164, -164, 196, 1
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x100, 0x8000, 0x18, 4, -25
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_8_r:
	banim_frame_affine 164, 196, -196, 164, 1
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x100, 0x8000, 0x18, 3, -25
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -19
	banim_frame_oam 0x8000, 0x8000, 0x98, 9, -26
	banim_frame_oam 0x8000, 0x0, 0xDA, 25, -10
	banim_frame_oam 0x0, 0x0, 0x9A, 17, 6
	banim_frame_oam 0x4000, 0x4000, 0xAE, -9, 10
	banim_frame_oam 0x8000, 0x8000, 0x2F, -1, -22
	banim_frame_oam 0x8000, 0x0, 0x31, 15, -22
	banim_frame_oam 0x8000, 0x0, 0xE, -9, -30
	banim_frame_oam 0x0, 0x0, 0x4E, -9, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -1, -30
	banim_frame_end
banim_figm_ax1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x4000, 0xD2, -8, 10
	banim_frame_oam 0x8000, 0x8000, 0x53, 0, -22
	banim_frame_oam 0x8000, 0x0, 0x72, -8, -14
	banim_frame_oam 0x0, 0x0, 0xB2, -8, 2
	banim_frame_oam 0x4000, 0x8000, 0x14, 8, -38
	banim_frame_oam 0x0, 0x0, 0x57, 32, -22
	banim_frame_oam 0x0, 0x4000, 0x55, 16, -22
	banim_frame_oam 0x0, 0x0, 0x33, 0, -30
	banim_frame_end
banim_figm_ax1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x4000, 0x84, -29, -29
	banim_frame_oam 0x4000, 0x0, 0x88, 3, -29
	banim_frame_oam 0x0, 0x4000, 0xA8, 3, -21
	banim_frame_oam 0x4000, 0x4000, 0xE6, -13, -5
	banim_frame_oam 0x4000, 0x4000, 0xA0, -37, -69
	banim_frame_oam 0x4000, 0x0, 0xC0, -5, -69
	banim_frame_oam 0x0, 0x0, 0xC2, 11, -69
	banim_frame_oam 0x0, 0x4000, 0xA, -13, 3
	banim_frame_oam 0x0, 0x4000, 0x4A, 3, 3
	banim_frame_oam 0x0, 0x4000, 0xA6, -13, -21
	banim_frame_oam 0x0, 0x0, 0xA5, -21, -21
	banim_frame_oam 0x4000, 0x0, 0x81, -53, -29
	banim_frame_oam 0x0, 0x0, 0x83, -37, -29
	banim_frame_oam 0x4000, 0x4000, 0x60, -61, -37
	banim_frame_oam 0x4000, 0x4000, 0x64, -29, -37
	banim_frame_oam 0x4000, 0x0, 0x68, 3, -37
	banim_frame_oam 0x4000, 0x4000, 0x40, -61, -45
	banim_frame_oam 0x4000, 0x0, 0x44, -29, -45
	banim_frame_oam 0x4000, 0x4000, 0x21, -53, -53
	banim_frame_oam 0x4000, 0x4000, 0x2, -45, -61
	banim_frame_oam 0x0, 0x0, 0x20, -5, -61
	banim_frame_oam 0x4000, 0x0, 0x0, 3, -61
	banim_frame_oam 0x0, 0x0, 0x80, -13, -61
	banim_frame_oam 0x0, 0x0, 0xE2, 19, -61
	banim_frame_oam 0x4000, 0x0, 0xE0, 19, -53
	banim_frame_end
banim_figm_ax1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -31, -43
	banim_frame_oam 0x4000, 0x0, 0xCE, -23, -51
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -51
	banim_frame_oam 0x0, 0x4000, 0xAC, -47, -28
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x4000, 0x10, 1, -43
	banim_frame_oam 0x4000, 0x0, 0x50, 1, -27
	banim_frame_oam 0x0, 0x0, 0x70, 1, -19
	banim_frame_oam 0x8000, 0x8000, 0x71, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x73, 16, -16
	banim_frame_oam 0x0, 0x0, 0xAB, -55, -28
	banim_frame_oam 0x0, 0x0, 0xCB, -55, -20
	banim_frame_oam 0x0, 0x0, 0x8F, -7, -11
	banim_frame_end
banim_figm_ax1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -63, -36
	banim_frame_oam 0x4000, 0x0, 0x52, -63, -20
	banim_frame_end
banim_figm_ax1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xCE, -23, -51
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -51
	banim_frame_oam 0x0, 0x4000, 0xAC, -47, -27
	banim_frame_oam 0x8000, 0x8000, 0xC, -31, -43
	banim_frame_oam 0x8000, 0x4000, 0xE, -15, -43
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -43
	banim_frame_oam 0x0, 0x0, 0x54, -7, -27
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -51
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -35
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0xAB, -55, -27
	banim_frame_oam 0x0, 0x0, 0xCB, -55, -19
	banim_frame_end
banim_figm_ax1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -63, -35
	banim_frame_oam 0x4000, 0x0, 0x52, -63, -19
	banim_frame_end
banim_figm_ax1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x0, 0xEC, -60, -32
	banim_frame_oam 0x0, 0x0, 0xEE, -44, -32
	banim_frame_oam 0x4000, 0x0, 0xEF, -60, -24
	banim_frame_oam 0x4000, 0x0, 0xF1, -52, -40
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -43
	banim_frame_oam 0x0, 0x0, 0x54, -7, -27
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -19
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -51
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -51
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -35
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -15, -43
	banim_frame_oam 0x0, 0x0, 0x8E, -23, -43
	banim_frame_oam 0x4000, 0x4000, 0x8A, -39, -51
	banim_frame_oam 0x0, 0x0, 0xAA, -39, -43
	banim_frame_oam 0x0, 0x0, 0xCA, -31, -43
	banim_frame_oam 0x0, 0x4000, 0xB6, -39, -35
	banim_frame_oam 0x4000, 0x0, 0xAF, -35, -19
	banim_frame_oam 0x4000, 0x0, 0x98, -23, -35
	banim_frame_oam 0x8000, 0x0, 0xB8, -23, -27
	banim_frame_oam 0x8000, 0x0, 0x1A, -15, -27
	banim_frame_end
banim_figm_ax1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -40
	banim_frame_oam 0x0, 0x0, 0x54, -7, -24
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -16
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -48
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -48
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -32
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -15, -40
	banim_frame_oam 0x0, 0x0, 0x8E, -23, -40
	banim_frame_oam 0x4000, 0x4000, 0x8A, -39, -48
	banim_frame_oam 0x0, 0x0, 0xAA, -39, -40
	banim_frame_oam 0x0, 0x0, 0xCA, -31, -40
	banim_frame_oam 0x0, 0x4000, 0xB6, -39, -32
	banim_frame_oam 0x4000, 0x0, 0xAF, -35, -16
	banim_frame_oam 0x4000, 0x0, 0x98, -23, -32
	banim_frame_oam 0x8000, 0x0, 0xB8, -23, -24
	banim_frame_oam 0x8000, 0x0, 0x1A, -15, -24
	banim_frame_end
banim_figm_ax1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -37
	banim_frame_oam 0x0, 0x0, 0x54, -7, -21
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -13
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -45
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -45
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -29
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -15, -37
	banim_frame_oam 0x0, 0x0, 0x8E, -23, -37
	banim_frame_oam 0x4000, 0x4000, 0x8A, -39, -45
	banim_frame_oam 0x0, 0x0, 0xAA, -39, -37
	banim_frame_oam 0x0, 0x0, 0xCA, -31, -37
	banim_frame_oam 0x0, 0x4000, 0xB6, -39, -29
	banim_frame_oam 0x4000, 0x0, 0xAF, -35, -13
	banim_frame_oam 0x4000, 0x0, 0x98, -23, -29
	banim_frame_oam 0x8000, 0x0, 0xB8, -23, -21
	banim_frame_oam 0x8000, 0x0, 0x1A, -15, -21
	banim_frame_end
banim_figm_ax1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -33
	banim_frame_oam 0x0, 0x0, 0x54, -7, -17
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -9
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -41
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -40
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -24
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -15, -33
	banim_frame_oam 0x0, 0x0, 0x8E, -23, -33
	banim_frame_oam 0x4000, 0x4000, 0x8A, -39, -41
	banim_frame_oam 0x0, 0x0, 0xAA, -39, -33
	banim_frame_oam 0x0, 0x0, 0xCA, -31, -33
	banim_frame_oam 0x0, 0x4000, 0xB6, -39, -25
	banim_frame_oam 0x4000, 0x0, 0xAF, -35, -9
	banim_frame_oam 0x4000, 0x0, 0x98, -23, -25
	banim_frame_oam 0x8000, 0x0, 0xB8, -23, -17
	banim_frame_oam 0x8000, 0x0, 0x1A, -15, -17
	banim_frame_end
banim_figm_ax1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x0, 0x14, -7, -29
	banim_frame_oam 0x0, 0x0, 0x54, -7, -13
	banim_frame_oam 0x0, 0x4000, 0x74, -7, -5
	banim_frame_oam 0x0, 0x0, 0xD0, -7, -37
	banim_frame_oam 0x0, 0x4000, 0x18, -7, -36
	banim_frame_oam 0x4000, 0x0, 0x58, -7, -20
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -15, -29
	banim_frame_oam 0x0, 0x0, 0x8E, -23, -29
	banim_frame_oam 0x4000, 0x4000, 0x8A, -39, -37
	banim_frame_oam 0x0, 0x0, 0xAA, -39, -29
	banim_frame_oam 0x0, 0x0, 0xCA, -31, -29
	banim_frame_oam 0x0, 0x4000, 0xB6, -39, -21
	banim_frame_oam 0x4000, 0x0, 0xAF, -35, -5
	banim_frame_oam 0x4000, 0x0, 0x98, -23, -21
	banim_frame_oam 0x8000, 0x0, 0xB8, -23, -13
	banim_frame_oam 0x8000, 0x0, 0x1A, -15, -13
	banim_frame_end
banim_figm_ax1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0xB9, -40, -29
	banim_frame_oam 0x4000, 0x4000, 0xF9, -40, -13
	banim_frame_oam 0x4000, 0x0, 0xFD, -8, -13
	banim_frame_oam 0x4000, 0x4000, 0xF3, -40, -5
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, -5
	banim_frame_oam 0x0, 0x4000, 0xB4, -16, 3
	banim_frame_oam 0x0, 0x0, 0xFF, -40, 3
	banim_frame_oam 0x8000, 0x0, 0xBD, -8, -29
	banim_frame_oam 0x0, 0x0, 0xDE, 0, -21
	banim_frame_oam 0x0, 0x4000, 0x5A, -32, 3
	banim_frame_end
banim_figm_ax1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -40, -29
	banim_frame_oam 0x8000, 0x4000, 0x4, -8, -29
	banim_frame_oam 0x4000, 0x8000, 0x80, -40, 3
	banim_frame_oam 0x8000, 0x0, 0x84, -8, 3
	banim_frame_end
banim_figm_ax1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x4000, 0x45, -40, -17
	banim_frame_oam 0x4000, 0x8000, 0x65, -40, -9
	banim_frame_oam 0x4000, 0x4000, 0xA5, -40, 7
	banim_frame_oam 0x8000, 0x4000, 0x29, -8, -25
	banim_frame_oam 0x0, 0x0, 0xA9, -8, 7
	banim_frame_oam 0x0, 0x4000, 0x6, -32, -33
	banim_frame_oam 0x8000, 0x0, 0x8, -16, -33
	banim_frame_end
banim_figm_ax1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x4000, 0x45, -32, -18
	banim_frame_oam 0x4000, 0x8000, 0x4A, -32, -10
	banim_frame_oam 0x4000, 0x4000, 0x8A, -32, 6
	banim_frame_oam 0x8000, 0x4000, 0xE, 0, -26
	banim_frame_oam 0x0, 0x0, 0x8E, 0, 6
	banim_frame_oam 0x4000, 0x4000, 0xA, -32, -26
	banim_frame_oam 0x4000, 0x0, 0x6, -24, -34
	banim_frame_oam 0x0, 0x0, 0x8, -8, -34
	banim_frame_end
banim_figm_ax1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x8000, 0xF, -30, -25
	banim_frame_oam 0x4000, 0x4000, 0x4F, -30, -9
	banim_frame_oam 0x4000, 0x8000, 0x70, -22, -1
	banim_frame_oam 0x8000, 0x0, 0x13, 2, -25
	banim_frame_oam 0x0, 0x0, 0x53, 2, -9
	banim_frame_oam 0x8000, 0x0, 0x6F, 10, -17
	banim_frame_oam 0x4000, 0x0, 0x6, -21, -33
	banim_frame_oam 0x0, 0x0, 0x8, -5, -33
	banim_frame_end
banim_figm_ax1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -21, -26
	banim_frame_oam 0x8000, 0x4000, 0x18, 11, -26
	banim_frame_oam 0x4000, 0x4000, 0x94, -21, 6
	banim_frame_oam 0x0, 0x0, 0x98, 11, 6
	banim_frame_oam 0x4000, 0x0, 0x6, -13, -34
	banim_frame_oam 0x0, 0x0, 0x8, 3, -34
	banim_frame_end
banim_figm_ax1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -13, -32
	banim_frame_oam 0x8000, 0x0, 0xC2, 3, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -22, -16
	banim_frame_oam 0x0, 0x4000, 0xC7, 10, -16
	banim_frame_oam 0x4000, 0x8000, 0xC9, -14, 0
	banim_frame_end
banim_figm_ax1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -13, 2
	banim_frame_oam 0x4000, 0x8000, 0x0, -13, -30
	banim_frame_oam 0x8000, 0x0, 0x4, 19, -30
	banim_frame_oam 0x4000, 0x4000, 0x40, -13, -14
	banim_frame_oam 0x0, 0x0, 0x44, 19, -14
	banim_frame_oam 0x4000, 0x4000, 0x60, -13, -6
	banim_frame_oam 0x0, 0x0, 0x64, 27, -24
	banim_frame_oam 0x0, 0x0, 0x82, -21, -6
	banim_frame_oam 0x0, 0x0, 0x81, -21, -14
	banim_frame_oam 0x0, 0x0, 0x80, -21, -22
	banim_frame_end
banim_figm_ax1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -13, 2
	banim_frame_oam 0x4000, 0x8000, 0xA0, -13, -22
	banim_frame_oam 0x4000, 0x4000, 0xE0, -13, -6
	banim_frame_oam 0x4000, 0x0, 0x83, 11, -30
	banim_frame_oam 0x8000, 0x0, 0xA4, 19, -22
	banim_frame_oam 0x0, 0x0, 0xE4, 27, -24
	banim_frame_end
banim_figm_ax1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -13, 2
	banim_frame_oam 0x0, 0x4000, 0x65, -5, -22
	banim_frame_oam 0x8000, 0x0, 0x67, 11, -22
	banim_frame_oam 0x4000, 0x0, 0xA5, -5, -6
	banim_frame_oam 0x0, 0x0, 0xA7, 11, -6
	banim_frame_oam 0x4000, 0x0, 0x47, 11, -30
	banim_frame_oam 0x8000, 0x0, 0x68, 19, -22
	banim_frame_oam 0x0, 0x0, 0xA8, 19, -38
	banim_frame_oam 0x0, 0x0, 0x45, 27, -30
	banim_frame_oam 0x0, 0x0, 0x46, 27, -22
	banim_frame_oam 0x8000, 0x0, 0xA0, -13, -22
	banim_frame_oam 0x0, 0x0, 0xE0, -13, -6
	banim_frame_end
banim_figm_ax1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x4000, 0x8000, 0x49, -21, -6
	banim_frame_oam 0x8000, 0x0, 0x4D, 11, -6
	banim_frame_oam 0x4000, 0x8000, 0xA, -13, -22
	banim_frame_oam 0x8000, 0x0, 0xE, 19, -22
	banim_frame_oam 0x0, 0x0, 0x4E, 27, -22
	banim_frame_oam 0x0, 0x0, 0x29, 26, -30
	banim_frame_oam 0x0, 0x0, 0x6E, -29, 2
	banim_frame_oam 0x0, 0x0, 0x9, -29, -6
	banim_frame_end
banim_figm_ax1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x8000, 0x0, 0x8A, -12, -16
	banim_frame_oam 0x0, 0x0, 0x8C, -20, -8
	banim_frame_oam 0x0, 0x0, 0x8B, -20, 0
	banim_frame_oam 0x0, 0x4000, 0xAB, -36, -8
	banim_frame_oam 0x4000, 0x0, 0xEB, -36, 8
	banim_frame_oam 0x8000, 0x0, 0xCA, -44, 0
	banim_frame_end
banim_figm_ax1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xCF, -15, -6
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x4000, 0x8000, 0xD1, 1, -6
	banim_frame_oam 0x8000, 0x0, 0x89, -39, 0
	banim_frame_oam 0x4000, 0x0, 0x8D, 13, -14
	banim_frame_oam 0x0, 0x4000, 0xCD, -31, -3
	banim_frame_end
banim_figm_ax1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x0, 0x4000, 0x2F, 6, -8
	banim_frame_oam 0x8000, 0x0, 0x31, 22, -8
	banim_frame_oam 0x0, 0x0, 0x11, 22, 8
	banim_frame_oam 0x0, 0x0, 0x10, 30, -8
	banim_frame_oam 0x0, 0x0, 0xF, 30, 0
	banim_frame_end
banim_figm_ax1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x4000, 0x8000, 0x6F, 4, -23
	banim_frame_oam 0x4000, 0x4000, 0xAF, 4, -7
	banim_frame_end
banim_figm_ax1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x0, 0x4000, 0x12, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x52, 0, -24
	banim_frame_oam 0x0, 0x0, 0x54, 16, -24
	banim_frame_oam 0x0, 0x0, 0x73, 8, -16
	banim_frame_end
banim_figm_ax1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x0, 0x0, 0xAD, -30, -46
	banim_frame_oam 0x0, 0x0, 0xAE, -30, -38
	banim_frame_oam 0x8000, 0x4000, 0x15, -22, -54
	banim_frame_oam 0x8000, 0x4000, 0x36, -14, -46
	banim_frame_oam 0x0, 0x0, 0xB6, -14, -14
	banim_frame_oam 0x0, 0x0, 0x95, -22, -21
	banim_frame_oam 0x0, 0x0, 0x16, -6, -15
	banim_frame_end
banim_figm_ax1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x0, 0x8000, 0x17, -44, -32
	banim_frame_oam 0x8000, 0x4000, 0x1B, -12, -32
	banim_frame_oam 0x4000, 0x0, 0xB4, -36, -40
	banim_frame_oam 0x4000, 0x0, 0x93, -44, 0
	banim_frame_oam 0x0, 0x0, 0xB3, -28, 0
	banim_frame_end
banim_figm_ax1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -8, -14
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, -14
	banim_frame_oam 0x4000, 0x0, 0xA, -12, -22
	banim_frame_oam 0x0, 0x0, 0xC, 4, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 2
	banim_frame_oam 0x4000, 0x4000, 0x25, -13, 10
	banim_frame_oam 0x0, 0x4000, 0x97, -19, -8
	banim_frame_oam 0x4000, 0x0, 0xD7, -19, 8
	banim_frame_oam 0x8000, 0x0, 0xD5, -27, -5
	banim_frame_oam 0x0, 0x8000, 0x99, 10, -19
	banim_frame_oam 0x4000, 0x0, 0xF6, 26, -27
	banim_frame_oam 0x8000, 0x0, 0xDD, 34, -43
	banim_frame_oam 0x0, 0x0, 0xFE, 42, -11
	banim_frame_end
banim_figm_ax1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0xB2, -16, -10
	banim_frame_oam 0x8000, 0x0, 0xB4, 0, -10
	banim_frame_oam 0x4000, 0x0, 0xF2, -16, 6
	banim_frame_oam 0x0, 0x0, 0xF4, 0, 6
	banim_frame_oam 0x0, 0x4000, 0xD5, -16, -26
	banim_frame_oam 0x8000, 0x0, 0xD7, 0, -26
	banim_frame_oam 0x4000, 0x0, 0xB5, -21, -34
	banim_frame_oam 0x0, 0x0, 0xB7, -5, -34
	banim_frame_oam 0x4000, 0x0, 0xF8, -13, -42
	banim_frame_end
banim_figm_ax1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x4000, 0xBA, -27, -11
	banim_frame_oam 0x8000, 0x0, 0xBC, -11, -11
	banim_frame_oam 0x4000, 0x0, 0xFA, -27, 5
	banim_frame_oam 0x0, 0x0, 0xFC, -11, 5
	banim_frame_oam 0x0, 0x4000, 0x3D, -27, -35
	banim_frame_oam 0x8000, 0x0, 0x3F, -11, -35
	banim_frame_oam 0x4000, 0x0, 0x7D, -27, -19
	banim_frame_oam 0x0, 0x0, 0x7F, -11, -19
	banim_frame_oam 0x0, 0x0, 0xD9, -21, -43
	banim_frame_oam 0x4000, 0x0, 0xB8, -43, -19
	banim_frame_oam 0x8000, 0x0, 0x9D, -3, -19
	banim_frame_oam 0x0, 0x0, 0xD8, -35, 5
	banim_frame_end
banim_figm_ax1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -38, -20
	banim_frame_oam 0x4000, 0x0, 0xCE, -30, -28
	banim_frame_oam 0x0, 0x0, 0xD0, -14, -28
	banim_frame_oam 0x0, 0x4000, 0xAC, -54, -5
	banim_frame_oam 0x0, 0x0, 0xAB, -62, -5
	banim_frame_oam 0x0, 0x0, 0xCB, -62, 3
	banim_frame_oam 0x0, 0x0, 0x8F, -14, 12
	banim_frame_oam 0x0, 0x0, 0x70, -6, 4
	banim_frame_oam 0x0, 0x4000, 0x10, -6, -20
	banim_frame_oam 0x0, 0x0, 0x51, 2, -4
	banim_frame_oam 0x0, 0x4000, 0x12, -71, -13
	banim_frame_oam 0x4000, 0x0, 0x52, -71, 3
	banim_frame_oam 0x4000, 0x0, 0xEA, -24, 10
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_end
banim_figm_ax1_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x0, 0xCE, -30, -28
	banim_frame_oam 0x0, 0x0, 0xD0, -14, -28
	banim_frame_oam 0x0, 0x4000, 0xAC, -54, -4
	banim_frame_oam 0x8000, 0x8000, 0xC, -38, -20
	banim_frame_oam 0x8000, 0x4000, 0xE, -22, -20
	banim_frame_oam 0x8000, 0x0, 0x14, -14, -20
	banim_frame_oam 0x0, 0x0, 0x54, -14, -4
	banim_frame_oam 0x0, 0x4000, 0x74, -14, 4
	banim_frame_oam 0x0, 0x4000, 0x18, -14, -28
	banim_frame_oam 0x4000, 0x0, 0x58, -14, -12
	banim_frame_oam 0x0, 0x0, 0xAB, -62, -4
	banim_frame_oam 0x0, 0x0, 0xCB, -62, 4
	banim_frame_oam 0x4000, 0x0, 0xEA, -24, 10
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x4000, 0x12, -71, -12
	banim_frame_oam 0x4000, 0x0, 0x52, -71, 4
	banim_frame_end
banim_figm_ax1_oam_frame_48_r:
	banim_frame_oam 0x8000, 0x0, 0x14, -14, -20
	banim_frame_oam 0x0, 0x0, 0x54, -14, -4
	banim_frame_oam 0x0, 0x4000, 0x74, -14, 4
	banim_frame_oam 0x0, 0x0, 0xD0, -14, -28
	banim_frame_oam 0x0, 0x4000, 0x18, -14, -28
	banim_frame_oam 0x4000, 0x0, 0x58, -14, -12
	banim_frame_oam 0x4000, 0x0, 0xEA, -24, 10
	banim_frame_oam 0x4000, 0x0, 0xEA, -16, 10
	banim_frame_oam 0x0, 0x0, 0x90, -22, -20
	banim_frame_oam 0x0, 0x0, 0x8E, -30, -20
	banim_frame_oam 0x4000, 0x4000, 0x8A, -46, -28
	banim_frame_oam 0x0, 0x0, 0xAA, -46, -20
	banim_frame_oam 0x0, 0x0, 0xCA, -38, -20
	banim_frame_oam 0x0, 0x4000, 0xB6, -46, -12
	banim_frame_oam 0x4000, 0x0, 0xAF, -42, 4
	banim_frame_oam 0x4000, 0x0, 0x98, -30, -12
	banim_frame_oam 0x8000, 0x0, 0xB8, -30, -4
	banim_frame_oam 0x8000, 0x0, 0x1A, -22, -4
	banim_frame_end
banim_figm_ax1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_figm_ax1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_figm_ax1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_figm_ax1_oam_frame_43_r:
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
	.section .data.script
banim_figm_ax1_script:
banim_figm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_oam_frame_1_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 2, banim_figm_ax1_oam_frame_2_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_oam_frame_3_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_oam_frame_4_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 5, banim_figm_ax1_oam_frame_5_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 6, banim_figm_ax1_oam_frame_6_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 7, banim_figm_ax1_oam_frame_7_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 8, banim_figm_ax1_oam_frame_8_r - banim_figm_ax1_oam_r
	banim_code_frame 10, banim_figm_ax1_sheet_0, 9, banim_figm_ax1_oam_frame_9_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 10, banim_figm_ax1_oam_frame_10_r - banim_figm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_1, 11, banim_figm_ax1_oam_frame_11_r - banim_figm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_oam_frame_12_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 14, banim_figm_ax1_oam_frame_13_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_1, 16, banim_figm_ax1_oam_frame_14_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 17, banim_figm_ax1_oam_frame_15_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 18, banim_figm_ax1_oam_frame_16_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 19, banim_figm_ax1_oam_frame_17_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 20, banim_figm_ax1_oam_frame_18_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_1, 21, banim_figm_ax1_oam_frame_19_r - banim_figm_ax1_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_2, 22, banim_figm_ax1_oam_frame_20_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_figm_ax1_sheet_2, 23, banim_figm_ax1_oam_frame_21_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_2, 24, banim_figm_ax1_oam_frame_22_r - banim_figm_ax1_oam_r
	banim_code_frame 6, banim_figm_ax1_sheet_2, 25, banim_figm_ax1_oam_frame_23_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_2, 26, banim_figm_ax1_oam_frame_24_r - banim_figm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_figm_ax1_sheet_2, 27, banim_figm_ax1_oam_frame_25_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 10, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_figm_ax1_sheet_1, 13, banim_figm_ax1_oam_frame_28_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 15, banim_figm_ax1_oam_frame_29_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_frame 6, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_figm_ax1_sheet_3, 28, banim_figm_ax1_oam_frame_31_r - banim_figm_ax1_oam_r
	banim_code_frame 17, banim_figm_ax1_sheet_3, 29, banim_figm_ax1_oam_frame_32_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 30, banim_figm_ax1_oam_frame_33_r - banim_figm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_3, 31, banim_figm_ax1_oam_frame_34_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 32, banim_figm_ax1_oam_frame_35_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 33, banim_figm_ax1_oam_frame_36_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 34, banim_figm_ax1_oam_frame_37_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 35, banim_figm_ax1_oam_frame_38_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 36, banim_figm_ax1_oam_frame_39_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 37, banim_figm_ax1_oam_frame_40_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 38, banim_figm_ax1_oam_frame_41_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 39, banim_figm_ax1_oam_frame_42_r - banim_figm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_1, 11, banim_figm_ax1_oam_frame_11_r - banim_figm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_oam_frame_12_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 14, banim_figm_ax1_oam_frame_13_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_1, 16, banim_figm_ax1_oam_frame_14_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 17, banim_figm_ax1_oam_frame_15_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 18, banim_figm_ax1_oam_frame_16_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 19, banim_figm_ax1_oam_frame_17_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 20, banim_figm_ax1_oam_frame_18_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_1, 21, banim_figm_ax1_oam_frame_19_r - banim_figm_ax1_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_2, 22, banim_figm_ax1_oam_frame_20_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_figm_ax1_sheet_2, 23, banim_figm_ax1_oam_frame_21_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_2, 24, banim_figm_ax1_oam_frame_22_r - banim_figm_ax1_oam_r
	banim_code_frame 6, banim_figm_ax1_sheet_2, 25, banim_figm_ax1_oam_frame_23_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_2, 26, banim_figm_ax1_oam_frame_24_r - banim_figm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_figm_ax1_sheet_2, 27, banim_figm_ax1_oam_frame_25_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 45, banim_figm_ax1_oam_frame_26_r - banim_figm_ax1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 17, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_3, 48, banim_figm_ax1_oam_frame_43_r - banim_figm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_figm_ax1_sheet_1, 13, banim_figm_ax1_oam_frame_28_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 15, banim_figm_ax1_oam_frame_29_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_1, 46, banim_figm_ax1_oam_frame_27_r - banim_figm_ax1_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_frame 6, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_figm_ax1_sheet_2, 47, banim_figm_ax1_oam_frame_30_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_attack_range:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_end_mode
banim_figm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_end_mode
banim_figm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_2, 40, banim_figm_ax1_oam_frame_44_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 41, banim_figm_ax1_oam_frame_45_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_2, 40, banim_figm_ax1_oam_frame_44_r - banim_figm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_2, 40, banim_figm_ax1_oam_frame_44_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 41, banim_figm_ax1_oam_frame_45_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_2, 40, banim_figm_ax1_oam_frame_44_r - banim_figm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_mode_stand_close:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_mode_stand:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_mode_stand_range:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_oam_frame_0_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_oam_frame_1_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 2, banim_figm_ax1_oam_frame_2_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_oam_frame_3_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_oam_frame_4_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 5, banim_figm_ax1_oam_frame_5_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 6, banim_figm_ax1_oam_frame_6_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 7, banim_figm_ax1_oam_frame_7_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 8, banim_figm_ax1_oam_frame_8_r - banim_figm_ax1_oam_r
	banim_code_frame 10, banim_figm_ax1_sheet_0, 9, banim_figm_ax1_oam_frame_9_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_0, 10, banim_figm_ax1_oam_frame_10_r - banim_figm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_figm_ax1_sheet_1, 11, banim_figm_ax1_oam_frame_11_r - banim_figm_ax1_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 42, banim_figm_ax1_oam_frame_46_r - banim_figm_ax1_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_1, 43, banim_figm_ax1_oam_frame_47_r - banim_figm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_1, 44, banim_figm_ax1_oam_frame_48_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_1, 21, banim_figm_ax1_oam_frame_19_r - banim_figm_ax1_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_2, 22, banim_figm_ax1_oam_frame_20_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_figm_ax1_sheet_2, 23, banim_figm_ax1_oam_frame_21_r - banim_figm_ax1_oam_r
	banim_code_frame 3, banim_figm_ax1_sheet_2, 24, banim_figm_ax1_oam_frame_22_r - banim_figm_ax1_oam_r
	banim_code_frame 6, banim_figm_ax1_sheet_2, 25, banim_figm_ax1_oam_frame_23_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_figm_ax1_sheet_2, 26, banim_figm_ax1_oam_frame_24_r - banim_figm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_figm_ax1_sheet_2, 27, banim_figm_ax1_oam_frame_25_r - banim_figm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_figm_ax1_mode_attack_close - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_close_back - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_close_critical - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_close_critical_back - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_range - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_range_critical - banim_figm_ax1_script
	.word banim_figm_ax1_mode_dodge_close - banim_figm_ax1_script
	.word banim_figm_ax1_mode_dodge_range - banim_figm_ax1_script
	.word banim_figm_ax1_mode_stand_close - banim_figm_ax1_script
	.word banim_figm_ax1_mode_stand - banim_figm_ax1_script
	.word banim_figm_ax1_mode_stand_range - banim_figm_ax1_script
	.word banim_figm_ax1_mode_attack_miss - banim_figm_ax1_script
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

