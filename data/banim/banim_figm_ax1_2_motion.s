@ vim:ft=armv4
	.global banim_figm_ax1_2_script
	.global banim_figm_ax1_2_oam_r
	.global banim_figm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x19
	.section .data.oam_l
banim_figm_ax1_2_oam_l:
banim_figm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x5C, -8, -31
	banim_frame_oam 0x8000, 0x5000, 0x5E, -16, -31
	banim_frame_oam 0x0, 0x5000, 0xDC, -8, 1
	banim_frame_oam 0x8000, 0x1000, 0xDE, -16, 1
	banim_frame_oam 0x8000, 0x1000, 0xBB, 8, -7
	banim_frame_oam 0x0, 0x1000, 0xFB, 8, 9
	banim_frame_end
banim_figm_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xAE, 3, -18
	banim_frame_oam 0x4000, 0x5000, 0xED, -29, -10
	banim_frame_oam 0x0, 0x1000, 0xF1, -37, -10
	banim_frame_oam 0x0, 0x1000, 0xCD, -37, -18
	banim_frame_oam 0x0, 0x1000, 0xAD, -29, -18
	banim_frame_oam 0x4000, 0x5000, 0x99, -18, 10
	banim_frame_oam 0x0, 0x1000, 0x5, 14, -14
	banim_frame_oam 0x8000, 0x9000, 0x19, -2, -22
	banim_frame_oam 0x8000, 0x5000, 0x1B, -10, -22
	banim_frame_oam 0x8000, 0x1000, 0x3C, -18, -14
	banim_frame_oam 0x0, 0x1000, 0x7C, -18, 2
	banim_frame_end
banim_figm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x1000, 0xAA, 22, -15
	banim_frame_oam 0x0, 0x1000, 0xAB, 22, -7
	banim_frame_oam 0x4000, 0x5000, 0x99, -18, 10
	banim_frame_oam 0x0, 0x1000, 0x5, 14, -14
	banim_frame_oam 0x8000, 0x9000, 0x19, -2, -22
	banim_frame_oam 0x8000, 0x5000, 0x1B, -10, -22
	banim_frame_oam 0x8000, 0x1000, 0x3C, -18, -14
	banim_frame_oam 0x0, 0x1000, 0x7C, -18, 2
	banim_frame_end
banim_figm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0x8D, 9, -22
	banim_frame_oam 0x0, 0x1000, 0x89, 1, -22
	banim_frame_oam 0x0, 0x1000, 0xAD, -7, -22
	banim_frame_oam 0x4000, 0x1000, 0x11, 9, -14
	banim_frame_oam 0x0, 0x1000, 0x13, 1, -14
	banim_frame_oam 0x0, 0x1000, 0x32, -7, -14
	banim_frame_oam 0x0, 0x1000, 0x52, -15, -14
	banim_frame_oam 0x0, 0x1000, 0x71, 17, -6
	banim_frame_oam 0x0, 0x1000, 0x91, 9, -6
	banim_frame_oam 0x0, 0x1000, 0x95, 1, -6
	banim_frame_oam 0x0, 0x1000, 0xB5, -7, -6
	banim_frame_oam 0x0, 0x1000, 0xBA, -15, -6
	banim_frame_oam 0x4000, 0x9000, 0xDB, -16, 1
	banim_frame_end
banim_figm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x1000, 0x4, -9, -23
	banim_frame_oam 0x4000, 0x1000, 0x24, -1, -15
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -15
	banim_frame_oam 0x0, 0x1000, 0x80, -17, -15
	banim_frame_oam 0x0, 0x1000, 0x85, 7, -7
	banim_frame_oam 0x0, 0x1000, 0xA5, -1, -7
	banim_frame_oam 0x4000, 0x1000, 0x6D, -17, -7
	banim_frame_oam 0x4000, 0x9000, 0xDB, -16, 1
	banim_frame_end
banim_figm_ax1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -34
	banim_frame_oam 0x8000, 0x5000, 0x1F, -8, -34
	banim_frame_oam 0x0, 0x5000, 0x9D, 0, -2
	banim_frame_oam 0x8000, 0x1000, 0x9F, -8, -2
	banim_frame_oam 0x8000, 0x1000, 0xDF, 16, -34
	banim_frame_end
banim_figm_ax1_2_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0x9E, 11, -19
	banim_frame_oam 0x0, 0x5000, 0xBA, 11, -11
	banim_frame_oam 0x8000, 0x1000, 0xBC, 3, -11
	banim_frame_oam 0x4000, 0x1000, 0xFA, 11, 5
	banim_frame_oam 0x0, 0x1000, 0xFC, 3, 5
	banim_frame_oam 0x4000, 0x1000, 0x7D, 11, -19
	banim_frame_oam 0x0, 0x1000, 0x7F, 3, -19
	banim_frame_oam 0x4000, 0x1000, 0xB8, 27, -19
	banim_frame_oam 0x0, 0x1000, 0xD8, 27, 5
	banim_frame_oam 0x4000, 0x1000, 0xBE, -5, -19
	banim_frame_oam 0x0, 0x1000, 0xBD, -5, -11
	banim_frame_oam 0x0, 0x1000, 0xFD, -5, 5
	banim_frame_oam 0x4000, 0x1000, 0x1C, 11, -27
	banim_frame_oam 0x0, 0x1000, 0x1E, 3, -27
	banim_frame_oam 0x4000, 0x1000, 0xDE, 3, -35
	banim_frame_end
banim_figm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x3000, 0x15, -11, -14
	banim_frame_oam 0x0, 0x3000, 0x55, -11, -22
	banim_frame_oam 0x0, 0x7000, 0x36, -27, -22
	banim_frame_oam 0x4000, 0x5000, 0x6, -19, -7
	banim_frame_oam 0x0, 0x5000, 0x26, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0x28, -11, 1
	banim_frame_oam 0x0, 0x1000, 0x49, -19, 9
	banim_frame_oam 0x0, 0x1000, 0x25, -19, -15
	banim_frame_oam 0x0, 0x5000, 0xC4, -11, -23
	banim_frame_oam 0x0, 0x1000, 0xE3, 5, -15
	banim_frame_oam 0x0, 0x1000, 0xA4, 13, 9
	banim_frame_oam 0x0, 0x1000, 0x29, -9, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x4000, 0x76, -29, -22
	banim_frame_oam 0x0, 0x0, 0x78, -13, -22
	banim_frame_oam 0x4000, 0x0, 0x16, -29, -6
	banim_frame_oam 0x4000, 0x5000, 0x6, -19, -7
	banim_frame_oam 0x0, 0x5000, 0x26, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0x28, -11, 1
	banim_frame_oam 0x0, 0x1000, 0x49, -19, 9
	banim_frame_oam 0x0, 0x1000, 0x25, -19, -15
	banim_frame_oam 0x0, 0x5000, 0xC4, -11, -23
	banim_frame_oam 0x0, 0x1000, 0xE3, 5, -15
	banim_frame_oam 0x0, 0x1000, 0xA4, 13, 9
	banim_frame_oam 0x0, 0x1000, 0x29, -9, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x0, 0x15, -30, -19
	banim_frame_oam 0x0, 0x0, 0x55, -30, -3
	banim_frame_oam 0x0, 0x4000, 0x36, -22, -11
	banim_frame_oam 0x4000, 0x5000, 0x6, -19, -7
	banim_frame_oam 0x0, 0x5000, 0x26, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0x28, -11, 1
	banim_frame_oam 0x0, 0x1000, 0x49, -19, 9
	banim_frame_oam 0x0, 0x1000, 0x25, -19, -15
	banim_frame_oam 0x0, 0x5000, 0xC4, -11, -23
	banim_frame_oam 0x0, 0x1000, 0xE3, 5, -15
	banim_frame_oam 0x0, 0x1000, 0xA4, 13, 9
	banim_frame_oam 0x0, 0x1000, 0x29, -9, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x7000, 0x76, -19, -13
	banim_frame_oam 0x0, 0x3000, 0x78, -27, -5
	banim_frame_oam 0x4000, 0x3000, 0x16, -19, -21
	banim_frame_oam 0x4000, 0x5000, 0x6, -19, -7
	banim_frame_oam 0x0, 0x5000, 0x26, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0x28, -11, 1
	banim_frame_oam 0x0, 0x1000, 0x49, -19, 9
	banim_frame_oam 0x0, 0x1000, 0x25, -19, -15
	banim_frame_oam 0x0, 0x5000, 0xC4, -11, -23
	banim_frame_oam 0x0, 0x1000, 0xE3, 5, -15
	banim_frame_oam 0x0, 0x1000, 0xA4, 13, 9
	banim_frame_oam 0x0, 0x1000, 0x29, -9, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_figm_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_figm_ax1_2_oam_frame_6_l:
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
banim_figm_ax1_2_oam_r:
banim_figm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x5C, -8, -31
	banim_frame_oam 0x8000, 0x4000, 0x5E, 8, -31
	banim_frame_oam 0x0, 0x4000, 0xDC, -8, 1
	banim_frame_oam 0x8000, 0x0, 0xDE, 8, 1
	banim_frame_oam 0x8000, 0x0, 0xBB, -16, -7
	banim_frame_oam 0x0, 0x0, 0xFB, -16, 9
	banim_frame_end
banim_figm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xAE, -35, -18
	banim_frame_oam 0x4000, 0x4000, 0xED, -3, -10
	banim_frame_oam 0x0, 0x0, 0xF1, 29, -10
	banim_frame_oam 0x0, 0x0, 0xCD, 29, -18
	banim_frame_oam 0x0, 0x0, 0xAD, 21, -18
	banim_frame_oam 0x4000, 0x4000, 0x99, -14, 10
	banim_frame_oam 0x0, 0x0, 0x5, -22, -14
	banim_frame_oam 0x8000, 0x8000, 0x19, -14, -22
	banim_frame_oam 0x8000, 0x4000, 0x1B, 2, -22
	banim_frame_oam 0x8000, 0x0, 0x3C, 10, -14
	banim_frame_oam 0x0, 0x0, 0x7C, 10, 2
	banim_frame_end
banim_figm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0xAA, -30, -15
	banim_frame_oam 0x0, 0x0, 0xAB, -30, -7
	banim_frame_oam 0x4000, 0x4000, 0x99, -14, 10
	banim_frame_oam 0x0, 0x0, 0x5, -22, -14
	banim_frame_oam 0x8000, 0x8000, 0x19, -14, -22
	banim_frame_oam 0x8000, 0x4000, 0x1B, 2, -22
	banim_frame_oam 0x8000, 0x0, 0x3C, 10, -14
	banim_frame_oam 0x0, 0x0, 0x7C, 10, 2
	banim_frame_end
banim_figm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0x8D, -25, -22
	banim_frame_oam 0x0, 0x0, 0x89, -9, -22
	banim_frame_oam 0x0, 0x0, 0xAD, -1, -22
	banim_frame_oam 0x4000, 0x0, 0x11, -25, -14
	banim_frame_oam 0x0, 0x0, 0x13, -9, -14
	banim_frame_oam 0x0, 0x0, 0x32, -1, -14
	banim_frame_oam 0x0, 0x0, 0x52, 7, -14
	banim_frame_oam 0x0, 0x0, 0x71, -25, -6
	banim_frame_oam 0x0, 0x0, 0x91, -17, -6
	banim_frame_oam 0x0, 0x0, 0x95, -9, -6
	banim_frame_oam 0x0, 0x0, 0xB5, -1, -6
	banim_frame_oam 0x0, 0x0, 0xBA, 7, -6
	banim_frame_oam 0x4000, 0x8000, 0xDB, -16, 1
	banim_frame_end
banim_figm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x0, 0x4, -7, -23
	banim_frame_oam 0x4000, 0x0, 0x24, -15, -15
	banim_frame_oam 0x0, 0x0, 0x0, 1, -15
	banim_frame_oam 0x0, 0x0, 0x80, 9, -15
	banim_frame_oam 0x0, 0x0, 0x85, -15, -7
	banim_frame_oam 0x0, 0x0, 0xA5, -7, -7
	banim_frame_oam 0x4000, 0x0, 0x6D, 1, -7
	banim_frame_oam 0x4000, 0x8000, 0xDB, -16, 1
	banim_frame_end
banim_figm_ax1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -34
	banim_frame_oam 0x8000, 0x4000, 0x1F, 0, -34
	banim_frame_oam 0x0, 0x4000, 0x9D, -16, -2
	banim_frame_oam 0x8000, 0x0, 0x9F, 0, -2
	banim_frame_oam 0x8000, 0x0, 0xDF, -24, -34
	banim_frame_end
banim_figm_ax1_2_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0x9E, -27, -19
	banim_frame_oam 0x0, 0x4000, 0xBA, -27, -11
	banim_frame_oam 0x8000, 0x0, 0xBC, -11, -11
	banim_frame_oam 0x4000, 0x0, 0xFA, -27, 5
	banim_frame_oam 0x0, 0x0, 0xFC, -11, 5
	banim_frame_oam 0x4000, 0x0, 0x7D, -27, -19
	banim_frame_oam 0x0, 0x0, 0x7F, -11, -19
	banim_frame_oam 0x4000, 0x0, 0xB8, -43, -19
	banim_frame_oam 0x0, 0x0, 0xD8, -35, 5
	banim_frame_oam 0x4000, 0x0, 0xBE, -11, -19
	banim_frame_oam 0x0, 0x0, 0xBD, -3, -11
	banim_frame_oam 0x0, 0x0, 0xFD, -3, 5
	banim_frame_oam 0x4000, 0x0, 0x1C, -27, -27
	banim_frame_oam 0x0, 0x0, 0x1E, -11, -27
	banim_frame_oam 0x4000, 0x0, 0xDE, -19, -35
	banim_frame_end
banim_figm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x2000, 0x15, 3, -14
	banim_frame_oam 0x0, 0x2000, 0x55, 3, -22
	banim_frame_oam 0x0, 0x6000, 0x36, 11, -22
	banim_frame_oam 0x4000, 0x4000, 0x6, -13, -7
	banim_frame_oam 0x0, 0x4000, 0x26, -13, 1
	banim_frame_oam 0x8000, 0x0, 0x28, 3, 1
	banim_frame_oam 0x0, 0x0, 0x49, 11, 9
	banim_frame_oam 0x0, 0x0, 0x25, 11, -15
	banim_frame_oam 0x0, 0x4000, 0xC4, -5, -23
	banim_frame_oam 0x0, 0x0, 0xE3, -13, -15
	banim_frame_oam 0x0, 0x0, 0xA4, -21, 9
	banim_frame_oam 0x0, 0x0, 0x29, 1, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x5000, 0x76, 13, -22
	banim_frame_oam 0x0, 0x1000, 0x78, 5, -22
	banim_frame_oam 0x4000, 0x1000, 0x16, 13, -6
	banim_frame_oam 0x4000, 0x4000, 0x6, -13, -7
	banim_frame_oam 0x0, 0x4000, 0x26, -13, 1
	banim_frame_oam 0x8000, 0x0, 0x28, 3, 1
	banim_frame_oam 0x0, 0x0, 0x49, 11, 9
	banim_frame_oam 0x0, 0x0, 0x25, 11, -15
	banim_frame_oam 0x0, 0x4000, 0xC4, -5, -23
	banim_frame_oam 0x0, 0x0, 0xE3, -13, -15
	banim_frame_oam 0x0, 0x0, 0xA4, -21, 9
	banim_frame_oam 0x0, 0x0, 0x29, 1, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x1000, 0x15, 22, -19
	banim_frame_oam 0x0, 0x1000, 0x55, 22, -3
	banim_frame_oam 0x0, 0x5000, 0x36, 6, -11
	banim_frame_oam 0x4000, 0x4000, 0x6, -13, -7
	banim_frame_oam 0x0, 0x4000, 0x26, -13, 1
	banim_frame_oam 0x8000, 0x0, 0x28, 3, 1
	banim_frame_oam 0x0, 0x0, 0x49, 11, 9
	banim_frame_oam 0x0, 0x0, 0x25, 11, -15
	banim_frame_oam 0x0, 0x4000, 0xC4, -5, -23
	banim_frame_oam 0x0, 0x0, 0xE3, -13, -15
	banim_frame_oam 0x0, 0x0, 0xA4, -21, 9
	banim_frame_oam 0x0, 0x0, 0x29, 1, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x6000, 0x76, 3, -13
	banim_frame_oam 0x0, 0x2000, 0x78, 19, -5
	banim_frame_oam 0x4000, 0x2000, 0x16, 3, -21
	banim_frame_oam 0x4000, 0x4000, 0x6, -13, -7
	banim_frame_oam 0x0, 0x4000, 0x26, -13, 1
	banim_frame_oam 0x8000, 0x0, 0x28, 3, 1
	banim_frame_oam 0x0, 0x0, 0x49, 11, 9
	banim_frame_oam 0x0, 0x0, 0x25, 11, -15
	banim_frame_oam 0x0, 0x4000, 0xC4, -5, -23
	banim_frame_oam 0x0, 0x0, 0xE3, -13, -15
	banim_frame_oam 0x0, 0x0, 0xA4, -21, 9
	banim_frame_oam 0x0, 0x0, 0x29, 1, -7
	banim_frame_end
banim_figm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_figm_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_figm_ax1_2_oam_frame_6_r:
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
banim_figm_ax1_2_script:
banim_figm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 1, banim_figm_ax1_2_oam_frame_1_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 2, banim_figm_ax1_2_oam_frame_2_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_2_oam_frame_3_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_2_oam_frame_4_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 13, banim_figm_ax1_2_oam_frame_6_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 13, banim_figm_ax1_2_oam_frame_6_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_figm_ax1_sheet_1, 7, banim_figm_ax1_2_oam_frame_7_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 8, banim_figm_ax1_2_oam_frame_8_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 9, banim_figm_ax1_2_oam_frame_9_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 10, banim_figm_ax1_2_oam_frame_10_r - banim_figm_ax1_2_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 1, banim_figm_ax1_2_oam_frame_1_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 2, banim_figm_ax1_2_oam_frame_2_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_2_oam_frame_3_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_2_oam_frame_4_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_2_oam_frame_11_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_2_oam_frame_11_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_2_oam_frame_11_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 12, banim_figm_ax1_2_oam_frame_11_r - banim_figm_ax1_2_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 13, banim_figm_ax1_2_oam_frame_6_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 13, banim_figm_ax1_2_oam_frame_6_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 11, banim_figm_ax1_2_oam_frame_5_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 1, banim_figm_ax1_2_oam_frame_1_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 2, banim_figm_ax1_2_oam_frame_2_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_2_oam_frame_3_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_2_oam_frame_4_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_figm_ax1_sheet_1, 7, banim_figm_ax1_2_oam_frame_7_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 8, banim_figm_ax1_2_oam_frame_8_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 9, banim_figm_ax1_2_oam_frame_9_r - banim_figm_ax1_2_oam_r
	banim_code_frame 2, banim_figm_ax1_sheet_1, 10, banim_figm_ax1_2_oam_frame_10_r - banim_figm_ax1_2_oam_r
	banim_code_frame 15, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 1, banim_figm_ax1_2_oam_frame_1_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 2, banim_figm_ax1_2_oam_frame_2_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_2_oam_frame_3_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_2_oam_frame_4_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_3, 5, banim_figm_ax1_2_oam_frame_12_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 6, banim_figm_ax1_2_oam_frame_13_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_3, 5, banim_figm_ax1_2_oam_frame_12_r - banim_figm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_3, 5, banim_figm_ax1_2_oam_frame_12_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 6, banim_figm_ax1_2_oam_frame_13_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_3, 5, banim_figm_ax1_2_oam_frame_12_r - banim_figm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_2_mode_stand:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_figm_ax1_sheet_2, 1, banim_figm_ax1_2_oam_frame_1_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_2, 2, banim_figm_ax1_2_oam_frame_2_r - banim_figm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_figm_ax1_sheet_0, 3, banim_figm_ax1_2_oam_frame_3_r - banim_figm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_figm_ax1_sheet_0, 4, banim_figm_ax1_2_oam_frame_4_r - banim_figm_ax1_2_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_2_oam_frame_0_r - banim_figm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_figm_ax1_2_mode_attack_close - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_close_back - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_close_critical - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_close_critical_back - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_range - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_range_critical - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_dodge_close - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_dodge_range - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_stand_close - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_stand - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_stand_range - banim_figm_ax1_2_script
	.word banim_figm_ax1_2_mode_attack_miss - banim_figm_ax1_2_script
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

