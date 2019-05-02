@ vim:ft=armv4
	.global banim_brsm_ax1_script
	.global banim_brsm_ax1_oam_r
	.global banim_brsm_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x22
	.section .data.oam_l
banim_brsm_ax1_oam_l:
banim_brsm_ax1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x5000, 0x0, 8, -38
	banim_frame_oam 0x0, 0x5000, 0x1, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x41, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x43, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x23, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x3, -8, -48
	banim_frame_oam 0x0, 0x1000, 0x80, 8, -6
	banim_frame_end
banim_brsm_ax1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -2, -31
	banim_frame_oam 0x0, 0x5000, 0x25, 14, -23
	banim_frame_oam 0x4000, 0x5000, 0x64, 6, -7
	banim_frame_oam 0x0, 0x1000, 0x47, 6, -15
	banim_frame_oam 0x4000, 0x1000, 0x86, 6, 1
	banim_frame_oam 0x0, 0x1000, 0x88, -2, 1
	banim_frame_oam 0x0, 0x1000, 0x44, 30, -15
	banim_frame_oam 0x4000, 0x1000, 0x4, 6, 9
	banim_frame_oam 0x0, 0x1000, 0x6, -2, 9
	banim_frame_oam 0x4000, 0x1000, 0xA7, -2, -39
	banim_frame_oam 0x0, 0x5000, 0xA4, -2, -55
	banim_frame_oam 0x8000, 0x1000, 0xA6, -10, -55
	banim_frame_oam 0x0, 0x1000, 0xC7, -18, -47
	banim_frame_oam 0x0, 0x1000, 0x84, -13, -39
	banim_frame_oam 0x0, 0x1000, 0x24, -2, -63
	banim_frame_oam 0x0, 0x1000, 0x85, 22, 1
	banim_frame_oam 0x0, 0x1000, 0xC8, 22, 9
	banim_frame_end
banim_brsm_ax1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x48, 23, -14
	banim_frame_oam 0x4000, 0x5000, 0x29, -1, -22
	banim_frame_oam 0x0, 0x5000, 0x4A, 7, -14
	banim_frame_oam 0x4000, 0x1000, 0x8A, 7, 2
	banim_frame_oam 0x0, 0x1000, 0x8C, -1, 2
	banim_frame_oam 0x4000, 0x1000, 0xB, -1, -30
	banim_frame_oam 0x4000, 0x1000, 0x9, 7, 10
	banim_frame_oam 0x0, 0x1000, 0x89, -1, 10
	banim_frame_oam 0x0, 0x5000, 0xA4, -5, -54
	banim_frame_oam 0x8000, 0x1000, 0xA6, -13, -54
	banim_frame_oam 0x0, 0x1000, 0xC7, -21, -46
	banim_frame_oam 0x0, 0x1000, 0x24, -5, -62
	banim_frame_oam 0x0, 0x1000, 0x84, -16, -38
	banim_frame_oam 0x4000, 0x1000, 0xA7, -5, -38
	banim_frame_oam 0x0, 0x1000, 0x6C, -1, -6
	banim_frame_end
banim_brsm_ax1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0x8D, 13, -16
	banim_frame_oam 0x8000, 0x1000, 0x8F, 5, -16
	banim_frame_oam 0x4000, 0x5000, 0xCD, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, 29, -15
	banim_frame_oam 0x8000, 0x9000, 0xE, 45, -31
	banim_frame_oam 0x0, 0x1000, 0x2D, 61, -23
	banim_frame_oam 0x8000, 0x1000, 0x50, 37, -15
	banim_frame_oam 0x4000, 0x1000, 0xCB, 5, -24
	banim_frame_oam 0x0, 0x1000, 0x90, -3, -16
	banim_frame_oam 0x4000, 0x5000, 0xA9, -3, 8
	banim_frame_end
banim_brsm_ax1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 54, -20
	banim_frame_end
banim_brsm_ax1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, 5, -24
	banim_frame_oam 0x8000, 0x5000, 0x31, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0x92, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -3, -21
	banim_frame_oam 0x8000, 0x1000, 0x10, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x11, -3, -8
	banim_frame_oam 0x0, 0x5000, 0x4F, 36, -18
	banim_frame_oam 0x8000, 0x1000, 0x4D, 28, -17
	banim_frame_oam 0x0, 0x1000, 0x2D, 60, -26
	banim_frame_oam 0x8000, 0x5000, 0xE, 52, -34
	banim_frame_oam 0x8000, 0x1000, 0xF, 44, -34
	banim_frame_end
banim_brsm_ax1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 53, -23
	banim_frame_end
banim_brsm_ax1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xD1, 7, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, 7, -24
	banim_frame_oam 0x8000, 0x1000, 0xB5, -1, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, 7, 0
	banim_frame_oam 0x8000, 0x1000, 0xD8, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xF5, 23, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 33, -20
	banim_frame_oam 0x8000, 0x9000, 0xE, 41, -36
	banim_frame_oam 0x0, 0x1000, 0x2D, 57, -28
	banim_frame_end
banim_brsm_ax1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 50, -25
	banim_frame_end
banim_brsm_ax1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, 6, -24
	banim_frame_oam 0x8000, 0x5000, 0x16, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x17, -10, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -10, 8
	banim_frame_oam 0x4000, 0x5000, 0x37, -10, -48
	banim_frame_oam 0x4000, 0x5000, 0x57, -10, -40
	banim_frame_oam 0x4000, 0x5000, 0x77, -10, -32
	banim_frame_oam 0x4000, 0x1000, 0x18, 6, -56
	banim_frame_oam 0x0, 0x1000, 0x1A, -2, -56
	banim_frame_oam 0x0, 0x1000, 0x3, 1, -64
	banim_frame_end
banim_brsm_ax1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xDD, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xDF, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, 8, 7
	banim_frame_oam 0x4000, 0x1000, 0xBE, -8, -40
	banim_frame_end
banim_brsm_ax1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xB1, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xE7, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x3D, 18, -31
	banim_frame_oam 0x8000, 0x1000, 0x3F, 10, -31
	banim_frame_oam 0x4000, 0x1000, 0x7D, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x7F, 10, -15
	banim_frame_oam 0x4000, 0x1000, 0x9E, 10, -7
	banim_frame_oam 0x0, 0x1000, 0x1D, 2, -30
	banim_frame_oam 0x0, 0x1000, 0x1E, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x98, 4, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xB1, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xE7, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, -15, -24
	banim_frame_oam 0x8000, 0x9000, 0xE, 15, -26
	banim_frame_oam 0x0, 0x1000, 0x2D, 31, -18
	banim_frame_oam 0x8000, 0x1000, 0x5B, 7, -10
	banim_frame_oam 0x0, 0x1000, 0x7C, -1, -2
	banim_frame_oam 0x0, 0x5000, 0x1B, 24, -15
	banim_frame_end
banim_brsm_ax1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x6000, 0x8, 9, -29
	banim_frame_oam 0x8000, 0x6000, 0xA, 25, -45
	banim_frame_oam 0x8000, 0x2000, 0x49, 17, -45
	banim_frame_oam 0x8000, 0x2000, 0x2B, 33, -37
	banim_frame_oam 0x0, 0x2000, 0x6B, 33, -45
	banim_frame_oam 0x0, 0x2000, 0xB, 1, -21
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x1000, 0x86, 31, -58
	banim_frame_oam 0x0, 0x1000, 0xC6, 31, -42
	banim_frame_oam 0x8000, 0x5000, 0x87, 23, -58
	banim_frame_oam 0x8000, 0x5000, 0x88, 15, -58
	banim_frame_oam 0x8000, 0x1000, 0x48, 7, -58
	banim_frame_oam 0x0, 0x1000, 0xE6, 15, -26
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x9000, 0x4, 12, -68
	banim_frame_oam 0x8000, 0x1000, 0x6, 4, -68
	banim_frame_oam 0x0, 0x1000, 0x46, 4, -52
	banim_frame_oam 0x8000, 0x1000, 0x27, -4, -60
	banim_frame_oam 0x0, 0x1000, 0x3, 18, -36
	banim_frame_end
banim_brsm_ax1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0xC1, -1, -74
	banim_frame_oam 0x0, 0x1000, 0xC3, -9, -74
	banim_frame_oam 0x4000, 0x5000, 0xE0, -9, -66
	banim_frame_oam 0x0, 0x5000, 0xC4, -9, -58
	banim_frame_oam 0x4000, 0x1000, 0xA4, 7, -58
	banim_frame_oam 0x0, 0x1000, 0xC0, 23, -58
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_18_l:
	banim_frame_affine -70, 246, 246, 70, 1
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x100, 0x8000, 0x4, -10, -70
	banim_frame_end
banim_brsm_ax1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x1000, 0x8, 14, -70
	banim_frame_oam 0x8000, 0x9000, 0x9, -2, -70
	banim_frame_oam 0x8000, 0x1000, 0x2B, -10, -62
	banim_frame_oam 0x0, 0x1000, 0x6B, -10, -46
	banim_frame_oam 0x0, 0x1000, 0xB, 22, -70
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_20_l:
	banim_frame_affine 127, 221, 221, -127, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -7, -66
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x2000, 0x86, -7, -51
	banim_frame_oam 0x0, 0x2000, 0xC6, -7, -59
	banim_frame_oam 0x8000, 0x6000, 0x87, 1, -67
	banim_frame_oam 0x8000, 0x6000, 0x88, 9, -67
	banim_frame_oam 0x8000, 0x2000, 0x48, 17, -51
	banim_frame_oam 0x0, 0x2000, 0xE6, 9, -75
	banim_frame_end
banim_brsm_ax1_oam_frame_22_l:
	banim_frame_affine 247, 66, 66, -247, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -2, -66
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0xA000, 0x4, 0, -66
	banim_frame_oam 0x8000, 0x2000, 0x6, 16, -50
	banim_frame_oam 0x0, 0x2000, 0x46, 16, -58
	banim_frame_oam 0x8000, 0x2000, 0x27, 24, -58
	banim_frame_oam 0x0, 0x2000, 0x3, 2, -74
	banim_frame_end
banim_brsm_ax1_oam_frame_24_l:
	banim_frame_affine 240, -87, -87, -240, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -67
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x2000, 0xC1, 10, -45
	banim_frame_oam 0x0, 0x2000, 0xC3, 26, -45
	banim_frame_oam 0x4000, 0x6000, 0xE0, 2, -53
	banim_frame_oam 0x0, 0x6000, 0xC4, 18, -69
	banim_frame_oam 0x4000, 0x2000, 0xA4, 2, -61
	banim_frame_oam 0x0, 0x2000, 0xC0, -6, -61
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_26_l:
	banim_frame_affine 128, -221, -221, -128, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 3, -72
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x2000, 0x8, 1, -56
	banim_frame_oam 0x8000, 0xA000, 0x9, 9, -72
	banim_frame_oam 0x8000, 0x2000, 0x2B, 25, -64
	banim_frame_oam 0x0, 0x2000, 0x6B, 25, -72
	banim_frame_oam 0x0, 0x2000, 0xB, -7, -48
	banim_frame_end
banim_brsm_ax1_oam_frame_28_l:
	banim_frame_affine -95, -237, -237, 95, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 0, -76
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, 23, -77
	banim_frame_oam 0x0, 0x1000, 0xC6, 23, -61
	banim_frame_oam 0x8000, 0x5000, 0x87, 15, -77
	banim_frame_oam 0x8000, 0x5000, 0x88, 7, -77
	banim_frame_oam 0x8000, 0x1000, 0x48, -1, -77
	banim_frame_oam 0x0, 0x1000, 0xE6, 7, -45
	banim_frame_end
banim_brsm_ax1_oam_frame_30_l:
	banim_frame_affine -240, -88, -88, 240, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -5, -77
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x9000, 0x4, 9, -76
	banim_frame_oam 0x8000, 0x1000, 0x6, 1, -76
	banim_frame_oam 0x0, 0x1000, 0x46, 1, -60
	banim_frame_oam 0x8000, 0x1000, 0x27, -7, -68
	banim_frame_oam 0x0, 0x1000, 0x3, 15, -44
	banim_frame_end
banim_brsm_ax1_oam_frame_32_l:
	banim_frame_affine -242, 83, 83, 242, 1
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_oam 0x100, 0x8000, 0x4, -8, -76
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x86, 20, -70
	banim_frame_oam 0x0, 0x1000, 0xC6, 20, -54
	banim_frame_oam 0x8000, 0x5000, 0x87, 12, -70
	banim_frame_oam 0x8000, 0x5000, 0x88, 4, -70
	banim_frame_oam 0x8000, 0x1000, 0x48, -4, -70
	banim_frame_oam 0x0, 0x1000, 0xE6, 4, -38
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 8, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x1000, 0xC9, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xB6, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0xC9, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xB6, -8, 8
	banim_frame_oam 0x0, 0x5000, 0x7, -2, -31
	banim_frame_oam 0x0, 0x5000, 0x25, 14, -23
	banim_frame_oam 0x4000, 0x5000, 0x64, 6, -7
	banim_frame_oam 0x0, 0x1000, 0x47, 6, -15
	banim_frame_oam 0x4000, 0x1000, 0x86, 6, 1
	banim_frame_oam 0x0, 0x1000, 0x88, -2, 1
	banim_frame_oam 0x0, 0x1000, 0x44, 30, -15
	banim_frame_oam 0x4000, 0x1000, 0x4, 6, 9
	banim_frame_oam 0x0, 0x1000, 0x6, -2, 9
	banim_frame_oam 0x4000, 0x1000, 0xA7, -2, -39
	banim_frame_oam 0x0, 0x5000, 0xA4, -2, -55
	banim_frame_oam 0x8000, 0x1000, 0xA6, -10, -55
	banim_frame_oam 0x0, 0x1000, 0xC7, -18, -47
	banim_frame_oam 0x0, 0x1000, 0x84, -13, -39
	banim_frame_oam 0x0, 0x1000, 0x24, -2, -63
	banim_frame_oam 0x0, 0x1000, 0x85, 22, 1
	banim_frame_oam 0x0, 0x1000, 0xC8, 22, 9
	banim_frame_oam 0x4000, 0x1000, 0xC9, -19, -3
	banim_frame_oam 0x4000, 0x1000, 0xB6, -19, 5
	banim_frame_end
banim_brsm_ax1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x1000, 0xC9, -11, -1
	banim_frame_oam 0x4000, 0x1000, 0xB6, -11, 7
	banim_frame_oam 0x0, 0x5000, 0x48, 23, -14
	banim_frame_oam 0x4000, 0x5000, 0x29, -1, -22
	banim_frame_oam 0x0, 0x5000, 0x4A, 7, -14
	banim_frame_oam 0x4000, 0x1000, 0x8A, 7, 2
	banim_frame_oam 0x0, 0x1000, 0x8C, -1, 2
	banim_frame_oam 0x4000, 0x1000, 0xB, -1, -30
	banim_frame_oam 0x4000, 0x1000, 0x9, 7, 10
	banim_frame_oam 0x0, 0x1000, 0x89, -1, 10
	banim_frame_oam 0x0, 0x5000, 0xA4, -5, -54
	banim_frame_oam 0x8000, 0x1000, 0xA6, -13, -54
	banim_frame_oam 0x0, 0x1000, 0xC7, -21, -46
	banim_frame_oam 0x0, 0x1000, 0x24, -5, -62
	banim_frame_oam 0x0, 0x1000, 0x84, -16, -38
	banim_frame_oam 0x4000, 0x1000, 0xA7, -5, -38
	banim_frame_oam 0x0, 0x1000, 0x6C, -1, -6
	banim_frame_oam 0x0, 0x1000, 0xB8, 23, 4
	banim_frame_end
banim_brsm_ax1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -18, -17
	banim_frame_oam 0x0, 0x5000, 0xC, 0, -41
	banim_frame_oam 0x8000, 0x1000, 0xE, -8, -41
	banim_frame_oam 0x4000, 0x1000, 0x4C, 0, -25
	banim_frame_oam 0x0, 0x1000, 0x4E, -8, -25
	banim_frame_oam 0x8000, 0x1000, 0x2F, -16, -33
	banim_frame_oam 0x4000, 0x1000, 0xF, -8, -49
	banim_frame_end
banim_brsm_ax1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x5000, 0x6C, -14, -26
	banim_frame_oam 0x0, 0x1000, 0x70, -22, -26
	banim_frame_oam 0x4000, 0x9000, 0x8D, -14, -18
	banim_frame_oam 0x8000, 0x1000, 0x91, -22, -18
	banim_frame_oam 0x4000, 0x1000, 0xCD, -6, -2
	banim_frame_oam 0x0, 0x1000, 0xCF, -14, -2
	banim_frame_oam 0x4000, 0x5000, 0xED, -17, 6
	banim_frame_oam 0x0, 0x5000, 0xD1, 2, -42
	banim_frame_oam 0x8000, 0x1000, 0x30, -6, -42
	banim_frame_oam 0x4000, 0x1000, 0xF, -6, -50
	banim_frame_oam 0x0, 0x1000, 0x2F, -14, -34
	banim_frame_end
banim_brsm_ax1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x8D, 13, -16
	banim_frame_oam 0x8000, 0x1000, 0x8F, 5, -16
	banim_frame_oam 0x4000, 0x5000, 0xCD, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, 29, -15
	banim_frame_oam 0x8000, 0x9000, 0xE, 45, -31
	banim_frame_oam 0x0, 0x1000, 0x2D, 61, -23
	banim_frame_oam 0x8000, 0x1000, 0x50, 37, -15
	banim_frame_oam 0x4000, 0x1000, 0xCB, 5, -24
	banim_frame_oam 0x0, 0x1000, 0x90, -3, -16
	banim_frame_oam 0x4000, 0x5000, 0xA9, -3, 8
	banim_frame_oam 0x0, 0x5000, 0x1B, 54, -20
	banim_frame_end
banim_brsm_ax1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, 5, -24
	banim_frame_oam 0x8000, 0x5000, 0x31, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0x92, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -3, -21
	banim_frame_oam 0x8000, 0x1000, 0x10, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x11, -3, -8
	banim_frame_oam 0x0, 0x5000, 0x4F, 36, -18
	banim_frame_oam 0x8000, 0x1000, 0x4D, 28, -17
	banim_frame_oam 0x0, 0x1000, 0x2D, 60, -26
	banim_frame_oam 0x8000, 0x5000, 0xE, 52, -34
	banim_frame_oam 0x8000, 0x1000, 0xF, 44, -34
	banim_frame_oam 0x0, 0x5000, 0x1B, 53, -23
	banim_frame_end
banim_brsm_ax1_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x9000, 0xD1, 7, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, 7, -24
	banim_frame_oam 0x8000, 0x1000, 0xB5, -1, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, 7, 0
	banim_frame_oam 0x8000, 0x1000, 0xD8, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xF5, 23, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 33, -20
	banim_frame_oam 0x8000, 0x9000, 0xE, 41, -36
	banim_frame_oam 0x0, 0x1000, 0x2D, 57, -28
	banim_frame_oam 0x0, 0x5000, 0x1B, 50, -25
	banim_frame_end
banim_brsm_ax1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_brsm_ax1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_brsm_ax1_oam_frame_36_l:
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
banim_brsm_ax1_oam_r:
banim_brsm_ax1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x4000, 0x0, -16, -38
	banim_frame_oam 0x0, 0x4000, 0x1, -8, -40
	banim_frame_oam 0x8000, 0x8000, 0x41, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x43, 8, -24
	banim_frame_oam 0x0, 0x0, 0x23, 8, -32
	banim_frame_oam 0x0, 0x0, 0x3, 0, -48
	banim_frame_oam 0x0, 0x0, 0x80, -16, -6
	banim_frame_end
banim_brsm_ax1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -14, -31
	banim_frame_oam 0x0, 0x4000, 0x25, -30, -23
	banim_frame_oam 0x4000, 0x4000, 0x64, -38, -7
	banim_frame_oam 0x0, 0x0, 0x47, -14, -15
	banim_frame_oam 0x4000, 0x0, 0x86, -22, 1
	banim_frame_oam 0x0, 0x0, 0x88, -6, 1
	banim_frame_oam 0x0, 0x0, 0x44, -38, -15
	banim_frame_oam 0x4000, 0x0, 0x4, -22, 9
	banim_frame_oam 0x0, 0x0, 0x6, -6, 9
	banim_frame_oam 0x4000, 0x0, 0xA7, -14, -39
	banim_frame_oam 0x0, 0x4000, 0xA4, -14, -55
	banim_frame_oam 0x8000, 0x0, 0xA6, 2, -55
	banim_frame_oam 0x0, 0x0, 0xC7, 10, -47
	banim_frame_oam 0x0, 0x0, 0x84, 5, -39
	banim_frame_oam 0x0, 0x0, 0x24, -6, -63
	banim_frame_oam 0x0, 0x0, 0x85, -30, 1
	banim_frame_oam 0x0, 0x0, 0xC8, -30, 9
	banim_frame_end
banim_brsm_ax1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x48, -39, -14
	banim_frame_oam 0x4000, 0x4000, 0x29, -31, -22
	banim_frame_oam 0x0, 0x4000, 0x4A, -23, -14
	banim_frame_oam 0x4000, 0x0, 0x8A, -23, 2
	banim_frame_oam 0x0, 0x0, 0x8C, -7, 2
	banim_frame_oam 0x4000, 0x0, 0xB, -15, -30
	banim_frame_oam 0x4000, 0x0, 0x9, -23, 10
	banim_frame_oam 0x0, 0x0, 0x89, -7, 10
	banim_frame_oam 0x0, 0x4000, 0xA4, -11, -54
	banim_frame_oam 0x8000, 0x0, 0xA6, 5, -54
	banim_frame_oam 0x0, 0x0, 0xC7, 13, -46
	banim_frame_oam 0x0, 0x0, 0x24, -3, -62
	banim_frame_oam 0x0, 0x0, 0x84, 8, -38
	banim_frame_oam 0x4000, 0x0, 0xA7, -11, -38
	banim_frame_oam 0x0, 0x0, 0x6C, -7, -6
	banim_frame_end
banim_brsm_ax1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0x8D, -29, -16
	banim_frame_oam 0x8000, 0x0, 0x8F, -13, -16
	banim_frame_oam 0x4000, 0x4000, 0xCD, -29, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, -37, -15
	banim_frame_oam 0x8000, 0x8000, 0xE, -61, -31
	banim_frame_oam 0x0, 0x0, 0x2D, -69, -23
	banim_frame_oam 0x8000, 0x0, 0x50, -45, -15
	banim_frame_oam 0x4000, 0x0, 0xCB, -21, -24
	banim_frame_oam 0x0, 0x0, 0x90, -5, -16
	banim_frame_oam 0x4000, 0x4000, 0xA9, -29, 8
	banim_frame_end
banim_brsm_ax1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -70, -20
	banim_frame_end
banim_brsm_ax1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -21, -24
	banim_frame_oam 0x8000, 0x4000, 0x31, -29, -16
	banim_frame_oam 0x4000, 0x0, 0x92, -21, 8
	banim_frame_oam 0x0, 0x0, 0xB0, -5, -21
	banim_frame_oam 0x8000, 0x0, 0x10, -5, 0
	banim_frame_oam 0x0, 0x0, 0x11, -5, -8
	banim_frame_oam 0x0, 0x4000, 0x4F, -52, -18
	banim_frame_oam 0x8000, 0x0, 0x4D, -36, -17
	banim_frame_oam 0x0, 0x0, 0x2D, -68, -26
	banim_frame_oam 0x8000, 0x4000, 0xE, -60, -34
	banim_frame_oam 0x8000, 0x0, 0xF, -52, -34
	banim_frame_end
banim_brsm_ax1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -69, -23
	banim_frame_end
banim_brsm_ax1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xD1, -39, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -23, -24
	banim_frame_oam 0x8000, 0x0, 0xB5, -7, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, -23, 0
	banim_frame_oam 0x8000, 0x0, 0xD8, -7, 0
	banim_frame_oam 0x0, 0x0, 0xF5, -31, 8
	banim_frame_oam 0x0, 0x0, 0xD, -41, -20
	banim_frame_oam 0x8000, 0x8000, 0xE, -57, -36
	banim_frame_oam 0x0, 0x0, 0x2D, -65, -28
	banim_frame_end
banim_brsm_ax1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -66, -25
	banim_frame_end
banim_brsm_ax1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -22, -24
	banim_frame_oam 0x8000, 0x4000, 0x16, -6, -24
	banim_frame_oam 0x0, 0x0, 0x17, 2, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -22, 8
	banim_frame_oam 0x4000, 0x4000, 0x37, -22, -48
	banim_frame_oam 0x4000, 0x4000, 0x57, -22, -40
	banim_frame_oam 0x4000, 0x4000, 0x77, -22, -32
	banim_frame_oam 0x4000, 0x0, 0x18, -22, -56
	banim_frame_oam 0x0, 0x0, 0x1A, -6, -56
	banim_frame_oam 0x0, 0x0, 0x3, -9, -64
	banim_frame_end
banim_brsm_ax1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xDD, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xDF, 8, 0
	banim_frame_oam 0x0, 0x0, 0xBD, -16, 7
	banim_frame_oam 0x4000, 0x0, 0xBE, -8, -40
	banim_frame_end
banim_brsm_ax1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xB1, 0, 8
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0xE7, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE3, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -9, -24
	banim_frame_oam 0x0, 0x0, 0xE2, 7, -24
	banim_frame_oam 0x0, 0x4000, 0x3D, -34, -31
	banim_frame_oam 0x8000, 0x0, 0x3F, -18, -31
	banim_frame_oam 0x4000, 0x0, 0x7D, -34, -15
	banim_frame_oam 0x0, 0x0, 0x7F, -18, -15
	banim_frame_oam 0x4000, 0x0, 0x9E, -26, -7
	banim_frame_oam 0x0, 0x0, 0x1D, -10, -30
	banim_frame_oam 0x0, 0x0, 0x1E, -10, -7
	banim_frame_oam 0x0, 0x0, 0x98, -12, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xB1, 0, 8
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0xE7, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE3, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -9, -24
	banim_frame_oam 0x0, 0x0, 0xE2, 7, -24
	banim_frame_oam 0x8000, 0x8000, 0xE, -31, -26
	banim_frame_oam 0x0, 0x0, 0x2D, -39, -18
	banim_frame_oam 0x8000, 0x0, 0x5B, -15, -10
	banim_frame_oam 0x0, 0x0, 0x7C, -7, -2
	banim_frame_oam 0x0, 0x4000, 0x1B, -40, -15
	banim_frame_end
banim_brsm_ax1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x7000, 0x8, -25, -29
	banim_frame_oam 0x8000, 0x7000, 0xA, -33, -45
	banim_frame_oam 0x8000, 0x3000, 0x49, -25, -45
	banim_frame_oam 0x8000, 0x3000, 0x2B, -41, -37
	banim_frame_oam 0x0, 0x3000, 0x6B, -41, -45
	banim_frame_oam 0x0, 0x3000, 0xB, -9, -21
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x0, 0x86, -39, -58
	banim_frame_oam 0x0, 0x0, 0xC6, -39, -42
	banim_frame_oam 0x8000, 0x4000, 0x87, -31, -58
	banim_frame_oam 0x8000, 0x4000, 0x88, -23, -58
	banim_frame_oam 0x8000, 0x0, 0x48, -15, -58
	banim_frame_oam 0x0, 0x0, 0xE6, -23, -26
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x8000, 0x4, -28, -68
	banim_frame_oam 0x8000, 0x0, 0x6, -12, -68
	banim_frame_oam 0x0, 0x0, 0x46, -12, -52
	banim_frame_oam 0x8000, 0x0, 0x27, -4, -60
	banim_frame_oam 0x0, 0x0, 0x3, -26, -36
	banim_frame_end
banim_brsm_ax1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0xC1, -15, -74
	banim_frame_oam 0x0, 0x0, 0xC3, 1, -74
	banim_frame_oam 0x4000, 0x4000, 0xE0, -23, -66
	banim_frame_oam 0x0, 0x4000, 0xC4, -7, -58
	banim_frame_oam 0x4000, 0x0, 0xA4, -23, -58
	banim_frame_oam 0x0, 0x0, 0xC0, -31, -58
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_18_r:
	banim_frame_affine 70, 246, -246, 70, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x100, 0x8000, 0x4, -22, -70
	banim_frame_end
banim_brsm_ax1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x0, 0x8, -22, -70
	banim_frame_oam 0x8000, 0x8000, 0x9, -14, -70
	banim_frame_oam 0x8000, 0x0, 0x2B, 2, -62
	banim_frame_oam 0x0, 0x0, 0x6B, 2, -46
	banim_frame_oam 0x0, 0x0, 0xB, -30, -70
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_20_r:
	banim_frame_affine -127, 221, -221, -127, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -25, -66
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x3000, 0x86, -1, -51
	banim_frame_oam 0x0, 0x3000, 0xC6, -1, -59
	banim_frame_oam 0x8000, 0x7000, 0x87, -9, -67
	banim_frame_oam 0x8000, 0x7000, 0x88, -17, -67
	banim_frame_oam 0x8000, 0x3000, 0x48, -25, -51
	banim_frame_oam 0x0, 0x3000, 0xE6, -17, -75
	banim_frame_end
banim_brsm_ax1_oam_frame_22_r:
	banim_frame_affine -247, 66, -66, -247, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -30, -66
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0xB000, 0x4, -16, -66
	banim_frame_oam 0x8000, 0x3000, 0x6, -24, -50
	banim_frame_oam 0x0, 0x3000, 0x46, -24, -58
	banim_frame_oam 0x8000, 0x3000, 0x27, -32, -58
	banim_frame_oam 0x0, 0x3000, 0x3, -10, -74
	banim_frame_end
banim_brsm_ax1_oam_frame_24_r:
	banim_frame_affine -240, -87, 87, -240, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -67
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x3000, 0xC1, -26, -45
	banim_frame_oam 0x0, 0x3000, 0xC3, -34, -45
	banim_frame_oam 0x4000, 0x7000, 0xE0, -34, -53
	banim_frame_oam 0x0, 0x7000, 0xC4, -34, -69
	banim_frame_oam 0x4000, 0x3000, 0xA4, -18, -61
	banim_frame_oam 0x0, 0x3000, 0xC0, -2, -61
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_26_r:
	banim_frame_affine -128, -221, 221, -128, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -35, -72
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x3000, 0x8, -9, -56
	banim_frame_oam 0x8000, 0xB000, 0x9, -25, -72
	banim_frame_oam 0x8000, 0x3000, 0x2B, -33, -64
	banim_frame_oam 0x0, 0x3000, 0x6B, -33, -72
	banim_frame_oam 0x0, 0x3000, 0xB, -1, -48
	banim_frame_end
banim_brsm_ax1_oam_frame_28_r:
	banim_frame_affine 95, -237, 237, 95, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -32, -76
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x86, -31, -77
	banim_frame_oam 0x0, 0x0, 0xC6, -31, -61
	banim_frame_oam 0x8000, 0x4000, 0x87, -23, -77
	banim_frame_oam 0x8000, 0x4000, 0x88, -15, -77
	banim_frame_oam 0x8000, 0x0, 0x48, -7, -77
	banim_frame_oam 0x0, 0x0, 0xE6, -15, -45
	banim_frame_end
banim_brsm_ax1_oam_frame_30_r:
	banim_frame_affine 240, -88, 88, 240, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -27, -77
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x8000, 0x4, -25, -76
	banim_frame_oam 0x8000, 0x0, 0x6, -9, -76
	banim_frame_oam 0x0, 0x0, 0x46, -9, -60
	banim_frame_oam 0x8000, 0x0, 0x27, -1, -68
	banim_frame_oam 0x0, 0x0, 0x3, -23, -44
	banim_frame_end
banim_brsm_ax1_oam_frame_32_r:
	banim_frame_affine 242, 83, -83, 242, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_oam 0x100, 0x8000, 0x4, -24, -76
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x86, -28, -70
	banim_frame_oam 0x0, 0x0, 0xC6, -28, -54
	banim_frame_oam 0x8000, 0x4000, 0x87, -20, -70
	banim_frame_oam 0x8000, 0x4000, 0x88, -12, -70
	banim_frame_oam 0x8000, 0x0, 0x48, -4, -70
	banim_frame_oam 0x0, 0x0, 0xE6, -12, -38
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -16, -16
	banim_frame_oam 0x0, 0x0, 0x42, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x61, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -16, 0
	banim_frame_end
banim_brsm_ax1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x0, 0xC9, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xB6, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC9, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xB6, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x7, -14, -31
	banim_frame_oam 0x0, 0x4000, 0x25, -30, -23
	banim_frame_oam 0x4000, 0x4000, 0x64, -38, -7
	banim_frame_oam 0x0, 0x0, 0x47, -14, -15
	banim_frame_oam 0x4000, 0x0, 0x86, -22, 1
	banim_frame_oam 0x0, 0x0, 0x88, -6, 1
	banim_frame_oam 0x0, 0x0, 0x44, -38, -15
	banim_frame_oam 0x4000, 0x0, 0x4, -22, 9
	banim_frame_oam 0x0, 0x0, 0x6, -6, 9
	banim_frame_oam 0x4000, 0x0, 0xA7, -14, -39
	banim_frame_oam 0x0, 0x4000, 0xA4, -14, -55
	banim_frame_oam 0x8000, 0x0, 0xA6, 2, -55
	banim_frame_oam 0x0, 0x0, 0xC7, 10, -47
	banim_frame_oam 0x0, 0x0, 0x84, 5, -39
	banim_frame_oam 0x0, 0x0, 0x24, -6, -63
	banim_frame_oam 0x0, 0x0, 0x85, -30, 1
	banim_frame_oam 0x0, 0x0, 0xC8, -30, 9
	banim_frame_oam 0x4000, 0x0, 0xC9, 3, -3
	banim_frame_oam 0x4000, 0x0, 0xB6, 3, 5
	banim_frame_end
banim_brsm_ax1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x0, 0xC9, -5, -1
	banim_frame_oam 0x4000, 0x0, 0xB6, -5, 7
	banim_frame_oam 0x0, 0x4000, 0x48, -39, -14
	banim_frame_oam 0x4000, 0x4000, 0x29, -31, -22
	banim_frame_oam 0x0, 0x4000, 0x4A, -23, -14
	banim_frame_oam 0x4000, 0x0, 0x8A, -23, 2
	banim_frame_oam 0x0, 0x0, 0x8C, -7, 2
	banim_frame_oam 0x4000, 0x0, 0xB, -15, -30
	banim_frame_oam 0x4000, 0x0, 0x9, -23, 10
	banim_frame_oam 0x0, 0x0, 0x89, -7, 10
	banim_frame_oam 0x0, 0x4000, 0xA4, -11, -54
	banim_frame_oam 0x8000, 0x0, 0xA6, 5, -54
	banim_frame_oam 0x0, 0x0, 0xC7, 13, -46
	banim_frame_oam 0x0, 0x0, 0x24, -3, -62
	banim_frame_oam 0x0, 0x0, 0x84, 8, -38
	banim_frame_oam 0x4000, 0x0, 0xA7, -11, -38
	banim_frame_oam 0x0, 0x0, 0x6C, -7, -6
	banim_frame_oam 0x0, 0x0, 0xB8, -31, 4
	banim_frame_end
banim_brsm_ax1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -14, -17
	banim_frame_oam 0x0, 0x4000, 0xC, -16, -41
	banim_frame_oam 0x8000, 0x0, 0xE, 0, -41
	banim_frame_oam 0x4000, 0x0, 0x4C, -16, -25
	banim_frame_oam 0x0, 0x0, 0x4E, 0, -25
	banim_frame_oam 0x8000, 0x0, 0x2F, 8, -33
	banim_frame_oam 0x4000, 0x0, 0xF, -8, -49
	banim_frame_end
banim_brsm_ax1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x4000, 0x6C, -18, -26
	banim_frame_oam 0x0, 0x0, 0x70, 14, -26
	banim_frame_oam 0x4000, 0x8000, 0x8D, -18, -18
	banim_frame_oam 0x8000, 0x0, 0x91, 14, -18
	banim_frame_oam 0x4000, 0x0, 0xCD, -10, -2
	banim_frame_oam 0x0, 0x0, 0xCF, 6, -2
	banim_frame_oam 0x4000, 0x4000, 0xED, -15, 6
	banim_frame_oam 0x0, 0x4000, 0xD1, -18, -42
	banim_frame_oam 0x8000, 0x0, 0x30, -2, -42
	banim_frame_oam 0x4000, 0x0, 0xF, -10, -50
	banim_frame_oam 0x0, 0x0, 0x2F, 6, -34
	banim_frame_end
banim_brsm_ax1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x8D, -29, -16
	banim_frame_oam 0x8000, 0x0, 0x8F, -13, -16
	banim_frame_oam 0x4000, 0x4000, 0xCD, -29, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, -37, -15
	banim_frame_oam 0x8000, 0x8000, 0xE, -61, -31
	banim_frame_oam 0x0, 0x0, 0x2D, -69, -23
	banim_frame_oam 0x8000, 0x0, 0x50, -45, -15
	banim_frame_oam 0x4000, 0x0, 0xCB, -21, -24
	banim_frame_oam 0x0, 0x0, 0x90, -5, -16
	banim_frame_oam 0x4000, 0x4000, 0xA9, -29, 8
	banim_frame_oam 0x0, 0x4000, 0x1B, -70, -20
	banim_frame_end
banim_brsm_ax1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -21, -24
	banim_frame_oam 0x8000, 0x4000, 0x31, -29, -16
	banim_frame_oam 0x4000, 0x0, 0x92, -21, 8
	banim_frame_oam 0x0, 0x0, 0xB0, -5, -21
	banim_frame_oam 0x8000, 0x0, 0x10, -5, 0
	banim_frame_oam 0x0, 0x0, 0x11, -5, -8
	banim_frame_oam 0x0, 0x4000, 0x4F, -52, -18
	banim_frame_oam 0x8000, 0x0, 0x4D, -36, -17
	banim_frame_oam 0x0, 0x0, 0x2D, -68, -26
	banim_frame_oam 0x8000, 0x4000, 0xE, -60, -34
	banim_frame_oam 0x8000, 0x0, 0xF, -52, -34
	banim_frame_oam 0x0, 0x4000, 0x1B, -69, -23
	banim_frame_end
banim_brsm_ax1_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x8000, 0xD1, -39, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -23, -24
	banim_frame_oam 0x8000, 0x0, 0xB5, -7, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, -23, 0
	banim_frame_oam 0x8000, 0x0, 0xD8, -7, 0
	banim_frame_oam 0x0, 0x0, 0xF5, -31, 8
	banim_frame_oam 0x0, 0x0, 0xD, -41, -20
	banim_frame_oam 0x8000, 0x8000, 0xE, -57, -36
	banim_frame_oam 0x0, 0x0, 0x2D, -65, -28
	banim_frame_oam 0x0, 0x4000, 0x1B, -66, -25
	banim_frame_end
banim_brsm_ax1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_brsm_ax1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_brsm_ax1_oam_frame_36_r:
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
banim_brsm_ax1_script:
banim_brsm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 1, banim_brsm_ax1_oam_frame_1_r - banim_brsm_ax1_oam_r
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 2, banim_brsm_ax1_oam_frame_2_r - banim_brsm_ax1_oam_r
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 3, banim_brsm_ax1_oam_frame_3_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 5, banim_brsm_ax1_oam_frame_4_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 7, banim_brsm_ax1_oam_frame_5_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 9, banim_brsm_ax1_oam_frame_6_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 10, banim_brsm_ax1_oam_frame_7_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 4, banim_brsm_ax1_oam_frame_9_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 6, banim_brsm_ax1_oam_frame_10_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 8, banim_brsm_ax1_oam_frame_11_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 11, banim_brsm_ax1_oam_frame_12_r - banim_brsm_ax1_oam_r
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 12, banim_brsm_ax1_oam_frame_13_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 13, banim_brsm_ax1_oam_frame_14_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 14, banim_brsm_ax1_oam_frame_15_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 15, banim_brsm_ax1_oam_frame_16_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 16, banim_brsm_ax1_oam_frame_17_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 17, banim_brsm_ax1_oam_frame_18_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 18, banim_brsm_ax1_oam_frame_19_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 19, banim_brsm_ax1_oam_frame_20_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 20, banim_brsm_ax1_oam_frame_21_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 21, banim_brsm_ax1_oam_frame_22_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 22, banim_brsm_ax1_oam_frame_23_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 23, banim_brsm_ax1_oam_frame_24_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 24, banim_brsm_ax1_oam_frame_25_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 25, banim_brsm_ax1_oam_frame_26_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 26, banim_brsm_ax1_oam_frame_27_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 27, banim_brsm_ax1_oam_frame_28_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 28, banim_brsm_ax1_oam_frame_29_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 29, banim_brsm_ax1_oam_frame_30_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 30, banim_brsm_ax1_oam_frame_31_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 31, banim_brsm_ax1_oam_frame_32_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 16, banim_brsm_ax1_oam_frame_17_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 17, banim_brsm_ax1_oam_frame_18_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 18, banim_brsm_ax1_oam_frame_19_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 19, banim_brsm_ax1_oam_frame_20_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 20, banim_brsm_ax1_oam_frame_21_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 21, banim_brsm_ax1_oam_frame_22_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 22, banim_brsm_ax1_oam_frame_23_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 24, banim_brsm_ax1_oam_frame_25_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 25, banim_brsm_ax1_oam_frame_26_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 26, banim_brsm_ax1_oam_frame_27_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 33, banim_brsm_ax1_oam_frame_33_r - banim_brsm_ax1_oam_r
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 34, banim_brsm_ax1_oam_frame_34_r - banim_brsm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 3, banim_brsm_ax1_oam_frame_3_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 5, banim_brsm_ax1_oam_frame_4_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 7, banim_brsm_ax1_oam_frame_5_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 9, banim_brsm_ax1_oam_frame_6_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 10, banim_brsm_ax1_oam_frame_7_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_0, 42, banim_brsm_ax1_oam_frame_36_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_frame 2, banim_brsm_ax1_sheet_1, 41, banim_brsm_ax1_oam_frame_35_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 4, banim_brsm_ax1_oam_frame_9_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 6, banim_brsm_ax1_oam_frame_10_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 8, banim_brsm_ax1_oam_frame_11_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 40, banim_brsm_ax1_oam_frame_8_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_attack_range:
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_end_mode
banim_brsm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_end_mode
banim_brsm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 35, banim_brsm_ax1_oam_frame_37_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 36, banim_brsm_ax1_oam_frame_38_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 35, banim_brsm_ax1_oam_frame_37_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 35, banim_brsm_ax1_oam_frame_37_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 36, banim_brsm_ax1_oam_frame_38_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 35, banim_brsm_ax1_oam_frame_37_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_mode_stand_close:
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_mode_stand:
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_mode_stand_range:
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 1, banim_brsm_ax1_oam_frame_1_r - banim_brsm_ax1_oam_r
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 2, banim_brsm_ax1_oam_frame_2_r - banim_brsm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_brsm_ax1_sheet_0, 37, banim_brsm_ax1_oam_frame_39_r - banim_brsm_ax1_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_0, 38, banim_brsm_ax1_oam_frame_40_r - banim_brsm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 39, banim_brsm_ax1_oam_frame_41_r - banim_brsm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 9, banim_brsm_ax1_oam_frame_6_r - banim_brsm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_brsm_ax1_sheet_0, 0, banim_brsm_ax1_oam_frame_0_r - banim_brsm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_brsm_ax1_sheet_0, 10, banim_brsm_ax1_oam_frame_7_r - banim_brsm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_brsm_ax1_mode_attack_close - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_close_back - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_close_critical - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_close_critical_back - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_range - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_range_critical - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_dodge_close - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_dodge_range - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_stand_close - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_stand - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_stand_range - banim_brsm_ax1_script
	.word banim_brsm_ax1_mode_attack_miss - banim_brsm_ax1_script
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

