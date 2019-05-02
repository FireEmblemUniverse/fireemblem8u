@ vim:ft=armv4
	.global banim_warm_ax1_2_script
	.global banim_warm_ax1_2_oam_r
	.global banim_warm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1C
	.section .data.oam_l
banim_warm_ax1_2_oam_l:
	banim_frame_oam 0x0, 0x5000, 0x25, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0x27, -13, 0
	banim_frame_oam 0x4000, 0x1000, 0x65, -5, 16
	banim_frame_oam 0x0, 0x1000, 0x67, -13, 16
	banim_frame_oam 0x0, 0x1000, 0x5, 3, -8
	banim_frame_oam 0x0, 0x1000, 0x6, 11, -8
	banim_frame_oam 0x0, 0x9000, 0x0, -7, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -15, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x2C, -6, -4
	banim_frame_oam 0x8000, 0x1000, 0x2E, -14, -4
	banim_frame_oam 0x4000, 0x1000, 0x6C, -6, 12
	banim_frame_oam 0x0, 0x1000, 0x6E, -14, 12
	banim_frame_oam 0x0, 0x1000, 0xC, 2, -12
	banim_frame_oam 0x0, 0x1000, 0xD, -22, 4
	banim_frame_oam 0x0, 0x9000, 0xF, -15, -40
	banim_frame_oam 0x4000, 0x5000, 0x8F, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xB1, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xB0, -15, 8
	banim_frame_oam 0x4000, 0x1000, 0x85, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x87, -12, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x2C, -5, -10
	banim_frame_oam 0x8000, 0x1000, 0x2E, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0x6C, -5, 6
	banim_frame_oam 0x0, 0x1000, 0x6E, -13, 6
	banim_frame_oam 0x0, 0x1000, 0xC, 3, -18
	banim_frame_oam 0x0, 0x1000, 0xD, -21, -2
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -50
	banim_frame_oam 0x4000, 0x9000, 0x88, -15, -18
	banim_frame_oam 0x4000, 0x1000, 0xA5, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xA7, -14, 9
	banim_frame_end
banim_warm_ax1_2_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -34, -25
	banim_frame_oam 0x4000, 0x5000, 0x8F, -34, 7
	banim_frame_oam 0x0, 0x1000, 0xB2, -2, 7
	banim_frame_oam 0x4000, 0x9000, 0x88, -17, 1
	banim_frame_oam 0x8000, 0x9000, 0x8, -1, -31
	banim_frame_oam 0x8000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0x8000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
	banim_frame_end
banim_warm_ax1_2_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x9000, 0x88, -17, 1
	banim_frame_oam 0x8000, 0x9000, 0x8, -1, -31
	banim_frame_oam 0x8000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0x8000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
	banim_frame_oam 0x0, 0x7000, 0xC0, -17, -14
	banim_frame_end
banim_warm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x7000, 0xC0, 17, -10
	banim_frame_oam 0x0, 0x9000, 0x13, -14, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, -22, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -14, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, -22, 0
	banim_frame_oam 0x0, 0x1000, 0xC2, 18, -13
	banim_frame_end
banim_warm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -5, -26
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -14, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_1_l:
	banim_frame_affine 128, -221, -221, -128, 1
	banim_frame_oam 0x100, 0x4000, 0xC0, 14, -10
	banim_frame_oam 0x0, 0x9000, 0x13, -14, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, -22, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -14, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, -22, 0
	banim_frame_oam 0x0, 0x1000, 0xC2, 18, -13
	banim_frame_end
banim_warm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x6000, 0xC0, -2, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -7, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -15, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -4, -25
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -14, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x9C, -21, -32
	banim_frame_oam 0x4000, 0x9000, 0xCB, -13, 0
	banim_frame_oam 0x4000, 0x1000, 0x8C, 11, -18
	banim_frame_end
banim_warm_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -31, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -37, -26
	banim_frame_end
banim_warm_ax1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -31, -24
	banim_frame_oam 0x0, 0x9000, 0x1C, -38, -33
	banim_frame_end
banim_warm_ax1_2_oam_frame_17_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x0, 0x9000, 0x98, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -31, -24
	banim_frame_oam 0x100, 0x8000, 0x1C, -38, -32
	banim_frame_end
banim_warm_ax1_2_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -31, -24
	banim_frame_oam 0x0, 0xA000, 0x1C, -38, -31
	banim_frame_end
banim_warm_ax1_2_oam_frame_19_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x0, 0x9000, 0x98, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -31, -24
	banim_frame_oam 0x100, 0x8000, 0x1C, -38, -32
	banim_frame_end
banim_warm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xC4, 9, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -7, 8
	banim_frame_oam 0x8000, 0x1000, 0x86, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xC6, -23, -16
	banim_frame_oam 0x0, 0x1000, 0xA2, -15, -24
	banim_frame_end
banim_warm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -11, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x5000, 0xC2, -14, -19
	banim_frame_oam 0x0, 0x5000, 0x4, 24, -23
	banim_frame_oam 0x4000, 0x1000, 0x44, 24, -7
	banim_frame_oam 0x0, 0x5000, 0x64, 8, -15
	banim_frame_oam 0x4000, 0x1000, 0xA4, -8, -7
	banim_frame_end
banim_warm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -11, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, 14, -26
	banim_frame_oam 0x4000, 0x1000, 0xE0, 14, -10
	banim_frame_oam 0x0, 0x5000, 0xC2, -14, -20
	banim_frame_end
banim_warm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -11, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -11, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, 14, -27
	banim_frame_oam 0x4000, 0x1000, 0xE0, 14, -11
	banim_frame_oam 0x0, 0x5000, 0xC2, -14, -20
	banim_frame_end
banim_warm_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0x87, 15, -14
	banim_frame_oam 0x4000, 0x1000, 0xA7, -1, -14
	banim_frame_oam 0x0, 0x5000, 0x89, -17, -22
	banim_frame_oam 0x8000, 0x1000, 0x8B, -25, -22
	banim_frame_oam 0x0, 0x9000, 0xA, -13, -32
	banim_frame_oam 0x4000, 0x9000, 0xC8, -13, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0x8C, -1, -20
	banim_frame_oam 0x8000, 0x1000, 0x8E, -9, -20
	banim_frame_oam 0x0, 0x5000, 0xCC, -23, -22
	banim_frame_oam 0x0, 0x9000, 0xA, -13, -32
	banim_frame_oam 0x4000, 0x9000, 0xC8, -13, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -7, -16
	banim_frame_oam 0x4000, 0x1000, 0x4E, 1, 0
	banim_frame_oam 0x0, 0x1000, 0x50, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6E, -15, -16
	banim_frame_oam 0x0, 0x9000, 0xA, -13, -32
	banim_frame_oam 0x4000, 0x9000, 0xC8, -13, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x11, -15, -27
	banim_frame_oam 0x4000, 0x9000, 0x91, -15, 5
	banim_frame_oam 0x0, 0x1000, 0xD1, 1, 21
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x15, -7, -28
	banim_frame_oam 0x8000, 0x5000, 0x19, -15, -28
	banim_frame_oam 0x4000, 0x9000, 0x95, -7, 4
	banim_frame_oam 0x8000, 0x1000, 0x99, -15, 4
	banim_frame_oam 0x0, 0x1000, 0xD3, 0, 20
	banim_frame_oam 0x0, 0x1000, 0xD2, 17, 20
	banim_frame_oam 0x0, 0x1000, 0xD4, -2, -36
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x1B, -7, -31
	banim_frame_oam 0x8000, 0x5000, 0x1F, -15, -31
	banim_frame_oam 0x4000, 0x9000, 0x9B, -7, 1
	banim_frame_oam 0x8000, 0x1000, 0x9F, -15, 1
	banim_frame_oam 0x0, 0x1000, 0xF1, 9, 17
	banim_frame_oam 0x8000, 0x1000, 0x1A, 25, -13
	banim_frame_oam 0x0, 0x1000, 0x5A, 25, 3
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, 1, -39
	banim_frame_oam 0x8000, 0x9000, 0x4, -15, -39
	banim_frame_oam 0x4000, 0x9000, 0x82, -15, -7
	banim_frame_oam 0x4000, 0x5000, 0xC2, -15, 9
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x6, -15, -31
	banim_frame_oam 0x4000, 0x9000, 0x86, -15, 1
	banim_frame_oam 0x0, 0x5000, 0x80, -31, -30
	banim_frame_oam 0x0, 0x7000, 0x2A, -35, -36
	banim_frame_oam 0x8000, 0x3000, 0x2C, -43, -36
	banim_frame_oam 0x4000, 0x3000, 0x6A, -35, -44
	banim_frame_oam 0x0, 0x3000, 0x6C, -43, -44
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x6, -15, -31
	banim_frame_oam 0x4000, 0x9000, 0x86, -15, 1
	banim_frame_oam 0x0, 0x5000, 0x80, -31, -30
	banim_frame_oam 0x0, 0x7000, 0x2A, -37, -35
	banim_frame_oam 0x8000, 0x3000, 0x2C, -45, -35
	banim_frame_oam 0x4000, 0x3000, 0x6A, -37, -43
	banim_frame_oam 0x0, 0x3000, 0x6C, -45, -43
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xD, -12, -34
	banim_frame_oam 0x4000, 0x9000, 0x8D, -12, -2
	banim_frame_oam 0x0, 0x9000, 0x12, -32, -60
	banim_frame_oam 0x8000, 0x5000, 0x16, -40, -60
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x17, 30, -47
	banim_frame_oam 0x8000, 0x9000, 0x1B, 14, -47
	banim_frame_oam 0x8000, 0x5000, 0x1D, 6, -47
	banim_frame_oam 0x4000, 0x1000, 0x9B, 14, -15
	banim_frame_oam 0x0, 0x1000, 0x9D, 6, -15
	banim_frame_oam 0x4000, 0x9000, 0x91, 24, -63
	banim_frame_oam 0x8000, 0x1000, 0x95, 16, -63
	banim_frame_oam 0x4000, 0x1000, 0x99, 30, -15
	banim_frame_oam 0x0, 0x5000, 0xB8, 16, -7
	banim_frame_oam 0x8000, 0x1000, 0xBA, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0xF8, 16, 9
	banim_frame_oam 0x0, 0x1000, 0xFA, 8, 9
	banim_frame_oam 0x4000, 0x9000, 0xDB, -24, -1
	banim_frame_oam 0x4000, 0x1000, 0x96, 0, -63
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -9
	banim_frame_oam 0x0, 0x9000, 0x3, 13, -38
	banim_frame_oam 0x4000, 0x9000, 0x83, 13, -6
	banim_frame_oam 0x4000, 0x1000, 0x80, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x82, 13, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -26
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -26
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -10
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -34
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -10
	banim_frame_oam 0x0, 0x9000, 0x3, 14, -38
	banim_frame_oam 0x4000, 0x9000, 0x83, 14, -6
	banim_frame_oam 0x4000, 0x1000, 0x80, 23, 8
	banim_frame_oam 0x0, 0x1000, 0x82, 15, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -27
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -27
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -11
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -11
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -35
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -11
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x7, 19, -31
	banim_frame_oam 0x8000, 0x5000, 0xB, 11, -31
	banim_frame_oam 0x4000, 0x9000, 0x87, 19, 1
	banim_frame_oam 0x8000, 0x1000, 0x8B, 11, 1
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -10
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -26
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -26
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -10
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -34
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -10
	banim_frame_oam 0x0, 0x9000, 0xC, 11, -31
	banim_frame_oam 0x4000, 0x9000, 0x8C, 11, 1
	banim_frame_oam 0x8000, 0x1000, 0x47, 43, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -26
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -26
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -10
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -34
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x10, 23, -30
	banim_frame_oam 0x8000, 0x9000, 0x14, 7, -30
	banim_frame_oam 0x4000, 0x9000, 0x90, 23, 2
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -10
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -26
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -26
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -10
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -34
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -10
	banim_frame_oam 0x8000, 0x1000, 0x94, 15, 2
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x95, 47, -17
	banim_frame_oam 0x0, 0x1000, 0x61, 36, -10
	banim_frame_oam 0x0, 0x9000, 0x16, 22, -28
	banim_frame_oam 0x8000, 0x5000, 0x1A, 14, -28
	banim_frame_oam 0x4000, 0x9000, 0x96, 22, 4
	banim_frame_oam 0x8000, 0x1000, 0x9A, 14, 4
	banim_frame_oam 0x0, 0x1000, 0xA2, 38, -10
	banim_frame_oam 0x0, 0x5000, 0x0, 52, -26
	banim_frame_oam 0x8000, 0x1000, 0x2, 44, -26
	banim_frame_oam 0x4000, 0x1000, 0x40, 52, -10
	banim_frame_oam 0x0, 0x1000, 0x42, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x60, 52, -34
	banim_frame_oam 0x0, 0x1000, 0x62, 36, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x1C, 12, -40
	banim_frame_oam 0x4000, 0x9000, 0x9C, 12, -8
	banim_frame_oam 0x4000, 0x5000, 0xDC, 12, 8
	banim_frame_oam 0x8000, 0x1000, 0x1B, 44, -30
	banim_frame_end
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 17, -63
	banim_frame_end
	banim_frame_affine 44, 252, 252, -44, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 17, -63
	banim_frame_end
	banim_frame_affine 87, 240, 240, -87, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 16, -64
	banim_frame_end
	banim_frame_affine 127, 221, 221, -127, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 15, -65
	banim_frame_end
	banim_frame_affine 164, 196, 196, -164, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 14, -65
	banim_frame_end
	banim_frame_affine 195, 164, 164, -195, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 14, -65
	banim_frame_end
	banim_frame_affine 231, 108, 108, -231, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 12, -65
	banim_frame_end
	banim_frame_affine 252, 44, 44, -252, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 11, -64
	banim_frame_end
	banim_frame_affine 255, 0, 0, -255, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 9, -64
	banim_frame_end
	banim_frame_affine 252, -44, -44, -252, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 9, -63
	banim_frame_end
	banim_frame_affine 240, -87, -87, -240, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 7, -62
	banim_frame_end
	banim_frame_affine 221, -127, -127, -221, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 6, -62
	banim_frame_end
	banim_frame_affine 196, -164, -164, -196, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 5, -61
	banim_frame_end
	banim_frame_affine 164, -195, -195, -164, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 5, -60
	banim_frame_end
	banim_frame_affine 128, -221, -221, -128, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 3, -59
	banim_frame_end
	banim_frame_affine 88, -240, -240, -88, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -57
	banim_frame_end
	banim_frame_affine 45, -252, -252, -45, 1
	banim_frame_oam 0x0, 0x9000, 0x0, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -24
	banim_frame_oam 0x100, 0x8000, 0x4, 1, -55
	banim_frame_end
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 1, -54
	banim_frame_oam 0x0, 0x9000, 0x13, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 12, 0
	banim_frame_end
	banim_frame_affine -43, -252, -252, 43, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -53
	banim_frame_oam 0x0, 0x9000, 0x13, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 12, 0
	banim_frame_end
	banim_frame_affine -86, -240, -240, 86, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -51
	banim_frame_oam 0x0, 0x9000, 0x13, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 12, 0
	banim_frame_end
	banim_frame_affine -127, -222, -222, 127, 1
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -51
	banim_frame_oam 0x0, 0x9000, 0x13, 12, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 12, 0
	banim_frame_end
	banim_frame_affine -164, -196, -196, 164, 1
	banim_frame_oam 0x0, 0x9000, 0x17, 5, -25
	banim_frame_oam 0x4000, 0x5000, 0x97, 5, 7
	banim_frame_oam 0x100, 0x8000, 0x4, 2, -48
	banim_frame_end
	banim_frame_affine -195, -165, -165, 195, 1
	banim_frame_oam 0x0, 0x9000, 0x17, 5, -25
	banim_frame_oam 0x4000, 0x5000, 0x97, 5, 7
	banim_frame_oam 0x100, 0x8000, 0x4, 0, -47
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE2, 19, -20
	banim_frame_oam 0x0, 0x9000, 0x4, -1, -40
	banim_frame_oam 0x0, 0x9000, 0x8, -5, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -13, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, -13, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x86, 19, -18
	banim_frame_oam 0x0, 0x1000, 0xE2, 19, -20
	banim_frame_oam 0x0, 0x7000, 0xA4, 12, -32
	banim_frame_oam 0x8000, 0x3000, 0xA6, 4, -32
	banim_frame_oam 0x4000, 0x3000, 0xE4, 12, -40
	banim_frame_oam 0x0, 0x3000, 0xE6, 4, -40
	banim_frame_oam 0x0, 0x1000, 0x85, -4, -32
	banim_frame_oam 0x4000, 0x9000, 0x89, -13, 0
	banim_frame_oam 0x4000, 0x9000, 0xD, -5, -24
	banim_frame_oam 0x0, 0x5000, 0x11, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0x4D, -5, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -21, -8
	banim_frame_oam 0x4000, 0x1000, 0xA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xC, -13, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x7000, 0xC7, 11, -35
	banim_frame_oam 0x8000, 0x3000, 0xC9, 3, -35
	banim_frame_oam 0x4000, 0x3000, 0xEA, 11, -19
	banim_frame_oam 0x0, 0x3000, 0xEC, 3, -19
	banim_frame_oam 0x0, 0x3000, 0xC2, 19, -43
	banim_frame_oam 0x0, 0x3000, 0xC3, 3, -43
	banim_frame_oam 0x0, 0x3000, 0x85, -5, -31
	banim_frame_oam 0x4000, 0x9000, 0x89, -13, 0
	banim_frame_oam 0x4000, 0x9000, 0x6D, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0xAD, -15, -8
	banim_frame_oam 0x0, 0x1000, 0xCA, 1, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x89, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x1B, -16, -36
	banim_frame_oam 0x4000, 0x5000, 0x9B, -16, -4
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x89, -13, 0
	banim_frame_oam 0x4000, 0x9000, 0xCD, -18, -36
	banim_frame_oam 0x4000, 0x9000, 0xD1, -18, -20
	banim_frame_oam 0x4000, 0x1000, 0x9B, 0, -4
	banim_frame_oam 0x0, 0x1000, 0x9D, -8, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -12, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -25, -15
	banim_frame_oam 0x8000, 0x1000, 0xC2, -33, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -25, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -33, -23
	banim_frame_oam 0x0, 0x1000, 0xC3, -41, -23
	banim_frame_oam 0x0, 0x1000, 0xE3, -41, -7
	banim_frame_oam 0x0, 0x1000, 0xC4, -29, -31
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x5, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -19, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -24, -12
	banim_frame_oam 0x8000, 0x1000, 0xC2, -32, -12
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, -20
	banim_frame_oam 0x0, 0x1000, 0xE6, -32, -20
	banim_frame_oam 0x0, 0x1000, 0xC3, -40, -20
	banim_frame_oam 0x0, 0x1000, 0xE3, -40, -4
	banim_frame_oam 0x0, 0x1000, 0xC4, -28, -28
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xC0, -14, -5
	banim_frame_oam 0x8000, 0x1000, 0xC2, -22, -5
	banim_frame_oam 0x4000, 0x1000, 0xE4, -14, -13
	banim_frame_oam 0x0, 0x1000, 0xE6, -22, -13
	banim_frame_oam 0x0, 0x1000, 0xC3, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xE3, -30, 3
	banim_frame_oam 0x0, 0x1000, 0xC4, -18, -21
	banim_frame_oam 0x0, 0x9000, 0x12, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x92, -14, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xC5, 9, -5
	banim_frame_oam 0x0, 0xB000, 0xE, -11, -8
	banim_frame_oam 0x0, 0x9000, 0xA, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -14, 0
	banim_frame_oam 0x8000, 0x1000, 0xC7, -22, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 52, -26
	banim_frame_oam 0x4000, 0x1000, 0xE0, 52, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 52, -27
	banim_frame_oam 0x4000, 0x1000, 0xE0, 52, -11
	banim_frame_end
banim_warm_ax1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -6, -8
	banim_frame_end
banim_warm_ax1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -5, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -4, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -6, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -3, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -6, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -4, -3
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x16, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0x8E, -9, -32
	banim_frame_oam 0x0, 0x1000, 0x90, -17, -32
	banim_frame_oam 0x0, 0x5000, 0xC9, -26, -9
	banim_frame_oam 0x8000, 0x1000, 0xCB, -34, -9
	banim_frame_oam 0x0, 0x1000, 0xC8, -10, -9
	banim_frame_oam 0x4000, 0x1000, 0xAF, -26, 7
	banim_frame_oam 0x0, 0x1000, 0xB1, -34, 7
	banim_frame_oam 0x0, 0x1000, 0xE8, -26, 15
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x1A, -4, -31
	banim_frame_oam 0x8000, 0x5000, 0x1C, -12, -31
	banim_frame_oam 0x4000, 0x9000, 0x76, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xCC, -28, -15
	banim_frame_oam 0x0, 0x5000, 0xC9, -37, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -45, -14
	banim_frame_oam 0x0, 0x1000, 0xC8, -21, -14
	banim_frame_oam 0x4000, 0x1000, 0xAF, -37, 2
	banim_frame_oam 0x0, 0x1000, 0xB1, -45, 2
	banim_frame_oam 0x0, 0x1000, 0xE8, -37, 10
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xAE, -25, -23
	banim_frame_oam 0x4000, 0x9000, 0x76, -17, 0
	banim_frame_oam 0x4000, 0x9000, 0xB6, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xBA, -27, -24
	banim_frame_oam 0x4000, 0x5000, 0xF6, -19, -8
	banim_frame_oam 0x0, 0x1000, 0xFA, -27, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0xCE, -49, -22
	banim_frame_oam 0x4000, 0x1000, 0xD2, -41, -6
	banim_frame_oam 0x0, 0x1000, 0xD4, -49, -6
	banim_frame_end
	banim_frame_oam 0x4000, 0xD000, 0x0, -34, -57
	banim_frame_oam 0x8000, 0x5000, 0x8, -42, -57
	banim_frame_oam 0x4000, 0x9000, 0x80, -2, -25
	banim_frame_oam 0x4000, 0x9000, 0x84, -34, -25
	banim_frame_oam 0x4000, 0x5000, 0xC0, -2, -9
	banim_frame_oam 0x4000, 0x5000, 0xC4, -34, -9
	banim_frame_oam 0x4000, 0x1000, 0xE2, -3, -1
	banim_frame_oam 0x0, 0x1000, 0xE4, -11, -1
	banim_frame_oam 0x4000, 0x1000, 0xE6, -3, 7
	banim_frame_oam 0x0, 0x1000, 0xE8, -11, 7
	banim_frame_end
	banim_frame_oam 0x0, 0xD000, 0x9, -19, -41
	banim_frame_oam 0x8000, 0x5000, 0x11, -27, -41
	banim_frame_oam 0x8000, 0x5000, 0x91, -27, -9
	banim_frame_end
	banim_frame_oam 0x4000, 0xD000, 0x12, -35, -33
	banim_frame_oam 0x8000, 0x5000, 0x1A, -43, -33
	banim_frame_oam 0x4000, 0x9000, 0x94, -19, -1
	banim_frame_oam 0x0, 0x5000, 0x98, -35, -1
	banim_frame_oam 0x8000, 0x1000, 0x9A, -43, -1
	banim_frame_oam 0x4000, 0x5000, 0xD4, -19, 15
	banim_frame_oam 0x4000, 0x1000, 0xD8, -35, 15
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xA, -17, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xE, -26, -26
	banim_frame_oam 0x8000, 0x1000, 0x10, -34, -26
	banim_frame_oam 0x4000, 0x1000, 0x4E, -26, -10
	banim_frame_oam 0x0, 0x1000, 0x50, -34, -10
	banim_frame_oam 0x0, 0x1000, 0xC0, -10, -28
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x91, -16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE0, 16, -24
	banim_frame_oam 0x0, 0x4000, 0xE, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x10, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x4E, 19, -8
	banim_frame_oam 0x0, 0x0, 0x50, 35, -8
	banim_frame_oam 0x0, 0x0, 0xC0, 11, -26
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xC1, 9, 16
	banim_frame_oam 0x0, 0x1000, 0xC3, 1, 16
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, -15
	banim_frame_oam 0x0, 0x5000, 0x6E, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xAE, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x7000, 0xC0, -15, 5
	banim_frame_oam 0x8000, 0x3000, 0xC2, -23, 5
	banim_frame_oam 0x4000, 0x3000, 0xE3, -15, -3
	banim_frame_oam 0x0, 0x3000, 0xE5, -23, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -23, -18
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x8A, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0xCF, -22, -16
	banim_frame_oam 0x0, 0x5000, 0xCC, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xCE, -9, -32
	banim_frame_oam 0x0, 0x5000, 0xC5, -34, -15
	banim_frame_oam 0x8000, 0x1000, 0xC7, -42, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -18, -15
	banim_frame_oam 0x4000, 0x1000, 0xC9, -34, 1
	banim_frame_oam 0x0, 0x1000, 0xCB, -42, 1
	banim_frame_oam 0x0, 0x1000, 0xE4, -34, 9
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	.section .data.oam_r
banim_warm_ax1_2_oam_r:
	banim_frame_oam 0x0, 0x4000, 0x25, -11, 0
	banim_frame_oam 0x8000, 0x0, 0x27, 5, 0
	banim_frame_oam 0x4000, 0x0, 0x65, -11, 16
	banim_frame_oam 0x0, 0x0, 0x67, 5, 16
	banim_frame_oam 0x0, 0x0, 0x5, -11, -8
	banim_frame_oam 0x0, 0x0, 0x6, -19, -8
	banim_frame_oam 0x0, 0x8000, 0x0, -25, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 7, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -25, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 7, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x2C, -10, -4
	banim_frame_oam 0x8000, 0x0, 0x2E, 6, -4
	banim_frame_oam 0x4000, 0x0, 0x6C, -10, 12
	banim_frame_oam 0x0, 0x0, 0x6E, 6, 12
	banim_frame_oam 0x0, 0x0, 0xC, -10, -12
	banim_frame_oam 0x0, 0x0, 0xD, 14, 4
	banim_frame_oam 0x0, 0x8000, 0xF, -17, -40
	banim_frame_oam 0x4000, 0x4000, 0x8F, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xB1, -1, 0
	banim_frame_oam 0x0, 0x0, 0xB0, 7, 8
	banim_frame_oam 0x4000, 0x0, 0x85, -12, 8
	banim_frame_oam 0x0, 0x0, 0x87, 4, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x2C, -11, -10
	banim_frame_oam 0x8000, 0x0, 0x2E, 5, -10
	banim_frame_oam 0x4000, 0x0, 0x6C, -11, 6
	banim_frame_oam 0x0, 0x0, 0x6E, 5, 6
	banim_frame_oam 0x0, 0x0, 0xC, -11, -18
	banim_frame_oam 0x0, 0x0, 0xD, 13, -2
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -50
	banim_frame_oam 0x4000, 0x8000, 0x88, -17, -18
	banim_frame_oam 0x4000, 0x0, 0xA5, -10, 9
	banim_frame_oam 0x0, 0x0, 0xA7, 6, 9
	banim_frame_end
banim_warm_ax1_2_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0xF, 2, -25
	banim_frame_oam 0x4000, 0x4000, 0x8F, 2, 7
	banim_frame_oam 0x0, 0x0, 0xB2, -6, 7
	banim_frame_oam 0x4000, 0x8000, 0x88, -15, 1
	banim_frame_oam 0x8000, 0x8000, 0x8, -15, -31
	banim_frame_oam 0x8000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0x8000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_end
banim_warm_ax1_2_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x8000, 0x88, -15, 1
	banim_frame_oam 0x8000, 0x8000, 0x8, -15, -31
	banim_frame_oam 0x8000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0x8000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_oam 0x0, 0x6000, 0xC0, 1, -14
	banim_frame_end
banim_warm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x6000, 0xC0, -33, -10
	banim_frame_oam 0x0, 0x8000, 0x13, -18, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, 14, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -18, 0
	banim_frame_oam 0x8000, 0x0, 0x97, 14, 0
	banim_frame_oam 0x0, 0x0, 0xC2, -26, -13
	banim_frame_end
banim_warm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, -11, -26
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -18, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_1_r:
	banim_frame_affine -128, -221, 221, -128, 1
	banim_frame_oam 0x100, 0x4000, 0xC0, -30, -10
	banim_frame_oam 0x0, 0x8000, 0x13, -18, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, 14, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -18, 0
	banim_frame_oam 0x8000, 0x0, 0x97, 14, 0
	banim_frame_oam 0x0, 0x0, 0xC2, -26, -13
	banim_frame_end
banim_warm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x7000, 0xC0, -14, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -25, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 7, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -25, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 7, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, -12, -25
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -18, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x9C, -11, -32
	banim_frame_oam 0x4000, 0x8000, 0xCB, -19, 0
	banim_frame_oam 0x4000, 0x0, 0x8C, -27, -18
	banim_frame_end
banim_warm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 15, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, 21, -26
	banim_frame_end
banim_warm_ax1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 15, -24
	banim_frame_oam 0x0, 0x8000, 0x1C, 6, -33
	banim_frame_end
banim_warm_ax1_2_oam_frame_17_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x0, 0x8000, 0x98, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 15, -24
	banim_frame_oam 0x100, 0x8000, 0x1C, 6, -32
	banim_frame_end
banim_warm_ax1_2_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 15, -24
	banim_frame_oam 0x0, 0xB000, 0x1C, 6, -31
	banim_frame_end
banim_warm_ax1_2_oam_frame_19_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x0, 0x8000, 0x98, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 15, -24
	banim_frame_oam 0x100, 0x8000, 0x1C, 6, -32
	banim_frame_end
banim_warm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -25, -24
	banim_frame_oam 0x4000, 0x0, 0xC4, -25, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, -9, 8
	banim_frame_oam 0x8000, 0x0, 0x86, 7, 0
	banim_frame_oam 0x0, 0x4000, 0xC6, 7, -16
	banim_frame_oam 0x0, 0x0, 0xA2, 7, -24
	banim_frame_end
banim_warm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x4000, 0xC2, -2, -19
	banim_frame_oam 0x0, 0x4000, 0x4, -40, -23
	banim_frame_oam 0x4000, 0x0, 0x44, -40, -7
	banim_frame_oam 0x0, 0x4000, 0x64, -24, -15
	banim_frame_oam 0x4000, 0x0, 0xA4, -8, -7
	banim_frame_end
banim_warm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -30, -26
	banim_frame_oam 0x4000, 0x0, 0xE0, -30, -10
	banim_frame_oam 0x0, 0x4000, 0xC2, -2, -20
	banim_frame_end
banim_warm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -21, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -21, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -30, -27
	banim_frame_oam 0x4000, 0x0, 0xE0, -30, -11
	banim_frame_oam 0x0, 0x4000, 0xC2, -2, -20
	banim_frame_end
banim_warm_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0x87, -31, -14
	banim_frame_oam 0x4000, 0x0, 0xA7, -15, -14
	banim_frame_oam 0x0, 0x4000, 0x89, 1, -22
	banim_frame_oam 0x8000, 0x0, 0x8B, 17, -22
	banim_frame_oam 0x0, 0x8000, 0xA, -19, -32
	banim_frame_oam 0x4000, 0x8000, 0xC8, -19, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0x8C, -15, -20
	banim_frame_oam 0x8000, 0x0, 0x8E, 1, -20
	banim_frame_oam 0x0, 0x4000, 0xCC, 7, -22
	banim_frame_oam 0x0, 0x8000, 0xA, -19, -32
	banim_frame_oam 0x4000, 0x8000, 0xC8, -19, 0
	banim_frame_end
banim_warm_ax1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -1, -16
	banim_frame_oam 0x4000, 0x0, 0x4E, -17, 0
	banim_frame_oam 0x0, 0x0, 0x50, -1, 0
	banim_frame_oam 0x0, 0x0, 0x6E, 7, -16
	banim_frame_oam 0x0, 0x8000, 0xA, -19, -32
	banim_frame_oam 0x4000, 0x8000, 0xC8, -19, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x11, -17, -27
	banim_frame_oam 0x4000, 0x8000, 0x91, -17, 5
	banim_frame_oam 0x0, 0x0, 0xD1, -9, 21
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x15, -25, -28
	banim_frame_oam 0x8000, 0x4000, 0x19, 7, -28
	banim_frame_oam 0x4000, 0x8000, 0x95, -25, 4
	banim_frame_oam 0x8000, 0x0, 0x99, 7, 4
	banim_frame_oam 0x0, 0x0, 0xD3, -8, 20
	banim_frame_oam 0x0, 0x0, 0xD2, -25, 20
	banim_frame_oam 0x0, 0x0, 0xD4, -6, -36
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x1B, -25, -31
	banim_frame_oam 0x8000, 0x4000, 0x1F, 7, -31
	banim_frame_oam 0x4000, 0x8000, 0x9B, -25, 1
	banim_frame_oam 0x8000, 0x0, 0x9F, 7, 1
	banim_frame_oam 0x0, 0x0, 0xF1, -17, 17
	banim_frame_oam 0x8000, 0x0, 0x1A, -33, -13
	banim_frame_oam 0x0, 0x0, 0x5A, -33, 3
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -33, -39
	banim_frame_oam 0x8000, 0x8000, 0x4, -1, -39
	banim_frame_oam 0x4000, 0x8000, 0x82, -17, -7
	banim_frame_oam 0x4000, 0x4000, 0xC2, -17, 9
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x6, -17, -31
	banim_frame_oam 0x4000, 0x8000, 0x86, -17, 1
	banim_frame_oam 0x0, 0x4000, 0x80, 15, -30
	banim_frame_oam 0x0, 0x6000, 0x2A, 19, -36
	banim_frame_oam 0x8000, 0x2000, 0x2C, 35, -36
	banim_frame_oam 0x4000, 0x2000, 0x6A, 19, -44
	banim_frame_oam 0x0, 0x2000, 0x6C, 35, -44
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x6, -17, -31
	banim_frame_oam 0x4000, 0x8000, 0x86, -17, 1
	banim_frame_oam 0x0, 0x4000, 0x80, 15, -30
	banim_frame_oam 0x0, 0x6000, 0x2A, 21, -35
	banim_frame_oam 0x8000, 0x2000, 0x2C, 37, -35
	banim_frame_oam 0x4000, 0x2000, 0x6A, 21, -43
	banim_frame_oam 0x0, 0x2000, 0x6C, 37, -43
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xD, -20, -34
	banim_frame_oam 0x4000, 0x8000, 0x8D, -20, -2
	banim_frame_oam 0x0, 0x8000, 0x12, 0, -60
	banim_frame_oam 0x8000, 0x4000, 0x16, 32, -60
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x17, -62, -47
	banim_frame_oam 0x8000, 0x8000, 0x1B, -30, -47
	banim_frame_oam 0x8000, 0x4000, 0x1D, -14, -47
	banim_frame_oam 0x4000, 0x0, 0x9B, -30, -15
	banim_frame_oam 0x0, 0x0, 0x9D, -14, -15
	banim_frame_oam 0x4000, 0x8000, 0x91, -56, -63
	banim_frame_oam 0x8000, 0x0, 0x95, -24, -63
	banim_frame_oam 0x4000, 0x0, 0x99, -46, -15
	banim_frame_oam 0x0, 0x4000, 0xB8, -32, -7
	banim_frame_oam 0x8000, 0x0, 0xBA, -16, -7
	banim_frame_oam 0x4000, 0x0, 0xF8, -32, 9
	banim_frame_oam 0x0, 0x0, 0xFA, -16, 9
	banim_frame_oam 0x4000, 0x8000, 0xDB, -8, -1
	banim_frame_oam 0x4000, 0x0, 0x96, -16, -63
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x61, -44, -9
	banim_frame_oam 0x0, 0x8000, 0x3, -45, -38
	banim_frame_oam 0x4000, 0x8000, 0x83, -45, -6
	banim_frame_oam 0x4000, 0x0, 0x80, -37, 8
	banim_frame_oam 0x0, 0x0, 0x82, -21, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -26
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -26
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -10
	banim_frame_oam 0x0, 0x0, 0x42, -52, -10
	banim_frame_oam 0x0, 0x0, 0x60, -60, -34
	banim_frame_oam 0x0, 0x0, 0x62, -44, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x61, -44, -10
	banim_frame_oam 0x0, 0x8000, 0x3, -46, -38
	banim_frame_oam 0x4000, 0x8000, 0x83, -46, -6
	banim_frame_oam 0x4000, 0x0, 0x80, -39, 8
	banim_frame_oam 0x0, 0x0, 0x82, -23, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -27
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -27
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -11
	banim_frame_oam 0x0, 0x0, 0x42, -52, -11
	banim_frame_oam 0x0, 0x0, 0x60, -60, -35
	banim_frame_oam 0x0, 0x0, 0x62, -44, -11
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x7, -51, -31
	banim_frame_oam 0x8000, 0x4000, 0xB, -19, -31
	banim_frame_oam 0x4000, 0x8000, 0x87, -51, 1
	banim_frame_oam 0x8000, 0x0, 0x8B, -19, 1
	banim_frame_oam 0x0, 0x0, 0x61, -44, -10
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -26
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -26
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -10
	banim_frame_oam 0x0, 0x0, 0x42, -52, -10
	banim_frame_oam 0x0, 0x0, 0x60, -60, -34
	banim_frame_oam 0x0, 0x0, 0x62, -44, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x61, -44, -10
	banim_frame_oam 0x0, 0x8000, 0xC, -43, -31
	banim_frame_oam 0x4000, 0x8000, 0x8C, -43, 1
	banim_frame_oam 0x8000, 0x0, 0x47, -51, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -26
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -26
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -10
	banim_frame_oam 0x0, 0x0, 0x42, -52, -10
	banim_frame_oam 0x0, 0x0, 0x60, -60, -34
	banim_frame_oam 0x0, 0x0, 0x62, -44, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x10, -55, -30
	banim_frame_oam 0x8000, 0x8000, 0x14, -23, -30
	banim_frame_oam 0x4000, 0x8000, 0x90, -55, 2
	banim_frame_oam 0x0, 0x0, 0x61, -44, -10
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -26
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -26
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -10
	banim_frame_oam 0x0, 0x0, 0x42, -52, -10
	banim_frame_oam 0x0, 0x0, 0x60, -60, -34
	banim_frame_oam 0x0, 0x0, 0x62, -44, -10
	banim_frame_oam 0x8000, 0x0, 0x94, -23, 2
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x95, -55, -17
	banim_frame_oam 0x0, 0x0, 0x61, -44, -10
	banim_frame_oam 0x0, 0x8000, 0x16, -54, -28
	banim_frame_oam 0x8000, 0x4000, 0x1A, -22, -28
	banim_frame_oam 0x4000, 0x8000, 0x96, -54, 4
	banim_frame_oam 0x8000, 0x0, 0x9A, -22, 4
	banim_frame_oam 0x0, 0x0, 0xA2, -46, -10
	banim_frame_oam 0x0, 0x4000, 0x0, -68, -26
	banim_frame_oam 0x8000, 0x0, 0x2, -52, -26
	banim_frame_oam 0x4000, 0x0, 0x40, -68, -10
	banim_frame_oam 0x0, 0x0, 0x42, -52, -10
	banim_frame_oam 0x0, 0x0, 0x60, -60, -34
	banim_frame_oam 0x0, 0x0, 0x62, -44, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x1C, -44, -40
	banim_frame_oam 0x4000, 0x8000, 0x9C, -44, -8
	banim_frame_oam 0x4000, 0x4000, 0xDC, -44, 8
	banim_frame_oam 0x8000, 0x0, 0x1B, -52, -30
	banim_frame_end
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -49, -63
	banim_frame_end
	banim_frame_affine -44, 252, -252, -44, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -49, -63
	banim_frame_end
	banim_frame_affine -87, 240, -240, -87, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -48, -64
	banim_frame_end
	banim_frame_affine -127, 221, -221, -127, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -47, -65
	banim_frame_end
	banim_frame_affine -164, 196, -196, -164, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -46, -65
	banim_frame_end
	banim_frame_affine -195, 164, -164, -195, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -46, -65
	banim_frame_end
	banim_frame_affine -231, 108, -108, -231, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -44, -65
	banim_frame_end
	banim_frame_affine -252, 44, -44, -252, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -43, -64
	banim_frame_end
	banim_frame_affine -255, 0, 0, -255, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -41, -64
	banim_frame_end
	banim_frame_affine -252, -44, 44, -252, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -41, -63
	banim_frame_end
	banim_frame_affine -240, -87, 87, -240, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -39, -62
	banim_frame_end
	banim_frame_affine -221, -127, 127, -221, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -38, -62
	banim_frame_end
	banim_frame_affine -196, -164, 164, -196, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -37, -61
	banim_frame_end
	banim_frame_affine -164, -195, 195, -164, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -37, -60
	banim_frame_end
	banim_frame_affine -128, -221, 221, -128, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -35, -59
	banim_frame_end
	banim_frame_affine -88, -240, 240, -88, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -57
	banim_frame_end
	banim_frame_affine -45, -252, 252, -45, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -24
	banim_frame_oam 0x100, 0x8000, 0x4, -33, -55
	banim_frame_end
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -33, -54
	banim_frame_oam 0x0, 0x8000, 0x13, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -44, 0
	banim_frame_end
	banim_frame_affine 43, -252, 252, 43, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -53
	banim_frame_oam 0x0, 0x8000, 0x13, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -44, 0
	banim_frame_end
	banim_frame_affine 86, -240, 240, 86, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -51
	banim_frame_oam 0x0, 0x8000, 0x13, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -44, 0
	banim_frame_end
	banim_frame_affine 127, -222, 222, 127, 1
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -51
	banim_frame_oam 0x0, 0x8000, 0x13, -44, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -44, 0
	banim_frame_end
	banim_frame_affine 164, -196, 196, 164, 1
	banim_frame_oam 0x0, 0x8000, 0x17, -37, -25
	banim_frame_oam 0x4000, 0x4000, 0x97, -37, 7
	banim_frame_oam 0x100, 0x8000, 0x4, -34, -48
	banim_frame_end
	banim_frame_affine 195, -165, 165, 195, 1
	banim_frame_oam 0x0, 0x8000, 0x17, -37, -25
	banim_frame_oam 0x4000, 0x4000, 0x97, -37, 7
	banim_frame_oam 0x100, 0x8000, 0x4, -32, -47
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE2, -27, -20
	banim_frame_oam 0x0, 0x8000, 0x4, -31, -40
	banim_frame_oam 0x0, 0x8000, 0x8, -27, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 5, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -27, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, 5, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x86, -27, -18
	banim_frame_oam 0x0, 0x0, 0xE2, -27, -20
	banim_frame_oam 0x0, 0x6000, 0xA4, -28, -32
	banim_frame_oam 0x8000, 0x2000, 0xA6, -12, -32
	banim_frame_oam 0x4000, 0x2000, 0xE4, -28, -40
	banim_frame_oam 0x0, 0x2000, 0xE6, -12, -40
	banim_frame_oam 0x0, 0x0, 0x85, -4, -32
	banim_frame_oam 0x4000, 0x8000, 0x89, -19, 0
	banim_frame_oam 0x4000, 0x8000, 0xD, -27, -24
	banim_frame_oam 0x0, 0x4000, 0x11, 5, -24
	banim_frame_oam 0x4000, 0x4000, 0x4D, -27, -8
	banim_frame_oam 0x4000, 0x0, 0x51, 5, -8
	banim_frame_oam 0x4000, 0x0, 0xA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xC, 5, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x6000, 0xC7, -27, -35
	banim_frame_oam 0x8000, 0x2000, 0xC9, -11, -35
	banim_frame_oam 0x4000, 0x2000, 0xEA, -27, -19
	banim_frame_oam 0x0, 0x2000, 0xEC, -11, -19
	banim_frame_oam 0x0, 0x2000, 0xC2, -27, -43
	banim_frame_oam 0x0, 0x2000, 0xC3, -11, -43
	banim_frame_oam 0x0, 0x2000, 0x85, -3, -31
	banim_frame_oam 0x4000, 0x8000, 0x89, -19, 0
	banim_frame_oam 0x4000, 0x8000, 0x6D, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0xAD, -17, -8
	banim_frame_oam 0x0, 0x0, 0xCA, -9, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x89, -19, 0
	banim_frame_oam 0x0, 0x8000, 0x1B, -16, -36
	banim_frame_oam 0x4000, 0x4000, 0x9B, -16, -4
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x89, -19, 0
	banim_frame_oam 0x4000, 0x8000, 0xCD, -14, -36
	banim_frame_oam 0x4000, 0x8000, 0xD1, -14, -20
	banim_frame_oam 0x4000, 0x0, 0x9B, -16, -4
	banim_frame_oam 0x0, 0x0, 0x9D, 0, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 11, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -20, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 9, -15
	banim_frame_oam 0x8000, 0x0, 0xC2, 25, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, 9, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 25, -23
	banim_frame_oam 0x0, 0x0, 0xC3, 33, -23
	banim_frame_oam 0x0, 0x0, 0xE3, 33, -7
	banim_frame_oam 0x0, 0x0, 0xC4, 21, -31
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x5, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 11, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -21, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 11, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 8, -12
	banim_frame_oam 0x8000, 0x0, 0xC2, 24, -12
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, -20
	banim_frame_oam 0x0, 0x0, 0xE6, 24, -20
	banim_frame_oam 0x0, 0x0, 0xC3, 32, -20
	banim_frame_oam 0x0, 0x0, 0xE3, 32, -4
	banim_frame_oam 0x0, 0x0, 0xC4, 20, -28
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xC0, -2, -5
	banim_frame_oam 0x8000, 0x0, 0xC2, 14, -5
	banim_frame_oam 0x4000, 0x0, 0xE4, -2, -13
	banim_frame_oam 0x0, 0x0, 0xE6, 14, -13
	banim_frame_oam 0x0, 0x0, 0xC3, 22, -13
	banim_frame_oam 0x0, 0x0, 0xE3, 22, 3
	banim_frame_oam 0x0, 0x0, 0xC4, 10, -21
	banim_frame_oam 0x0, 0x8000, 0x12, -18, -32
	banim_frame_oam 0x4000, 0x8000, 0x92, -18, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xC5, -17, -5
	banim_frame_oam 0x0, 0xA000, 0xE, -21, -8
	banim_frame_oam 0x0, 0x8000, 0xA, -18, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -18, 0
	banim_frame_oam 0x8000, 0x0, 0xC7, 14, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -68, -26
	banim_frame_oam 0x4000, 0x0, 0xE0, -68, -10
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -68, -27
	banim_frame_oam 0x4000, 0x0, 0xE0, -68, -11
	banim_frame_end
banim_warm_ax1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, -2, -8
	banim_frame_end
banim_warm_ax1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -3, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -4, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -2, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -5, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -2, -4
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -4, -3
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x16, -15, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -15, 8
	banim_frame_oam 0x4000, 0x0, 0x8E, -7, -32
	banim_frame_oam 0x0, 0x0, 0x90, 9, -32
	banim_frame_oam 0x0, 0x4000, 0xC9, 10, -9
	banim_frame_oam 0x8000, 0x0, 0xCB, 26, -9
	banim_frame_oam 0x0, 0x0, 0xC8, 2, -9
	banim_frame_oam 0x4000, 0x0, 0xAF, 10, 7
	banim_frame_oam 0x0, 0x0, 0xB1, 26, 7
	banim_frame_oam 0x0, 0x0, 0xE8, 18, 15
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x4000, 0x1C, 4, -31
	banim_frame_oam 0x4000, 0x8000, 0x76, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xCC, 12, -15
	banim_frame_oam 0x0, 0x4000, 0xC9, 21, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, 37, -14
	banim_frame_oam 0x0, 0x0, 0xC8, 13, -14
	banim_frame_oam 0x4000, 0x0, 0xAF, 21, 2
	banim_frame_oam 0x0, 0x0, 0xB1, 37, 2
	banim_frame_oam 0x0, 0x0, 0xE8, 29, 10
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xAE, 17, -23
	banim_frame_oam 0x4000, 0x8000, 0x76, -15, 0
	banim_frame_oam 0x4000, 0x8000, 0xB6, -13, -24
	banim_frame_oam 0x8000, 0x0, 0xBA, 19, -24
	banim_frame_oam 0x4000, 0x4000, 0xF6, -13, -8
	banim_frame_oam 0x0, 0x0, 0xFA, 19, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0xCE, 17, -22
	banim_frame_oam 0x4000, 0x0, 0xD2, 25, -6
	banim_frame_oam 0x0, 0x0, 0xD4, 41, -6
	banim_frame_end
	banim_frame_oam 0x4000, 0xC000, 0x0, -30, -57
	banim_frame_oam 0x8000, 0x4000, 0x8, 34, -57
	banim_frame_oam 0x4000, 0x8000, 0x80, -30, -25
	banim_frame_oam 0x4000, 0x8000, 0x84, 2, -25
	banim_frame_oam 0x4000, 0x4000, 0xC0, -30, -9
	banim_frame_oam 0x4000, 0x4000, 0xC4, 2, -9
	banim_frame_oam 0x4000, 0x0, 0xE2, -13, -1
	banim_frame_oam 0x0, 0x0, 0xE4, 3, -1
	banim_frame_oam 0x4000, 0x0, 0xE6, -13, 7
	banim_frame_oam 0x0, 0x0, 0xE8, 3, 7
	banim_frame_end
	banim_frame_oam 0x0, 0xC000, 0x9, -45, -41
	banim_frame_oam 0x8000, 0x4000, 0x11, 19, -41
	banim_frame_oam 0x8000, 0x4000, 0x91, 19, -9
	banim_frame_end
	banim_frame_oam 0x4000, 0xC000, 0x12, -29, -33
	banim_frame_oam 0x8000, 0x4000, 0x1A, 35, -33
	banim_frame_oam 0x4000, 0x8000, 0x94, -13, -1
	banim_frame_oam 0x0, 0x4000, 0x98, 19, -1
	banim_frame_oam 0x8000, 0x0, 0x9A, 35, -1
	banim_frame_oam 0x4000, 0x4000, 0xD4, -13, 15
	banim_frame_oam 0x4000, 0x0, 0xD8, 19, 15
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xA, -15, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xE, 10, -26
	banim_frame_oam 0x8000, 0x0, 0x10, 26, -26
	banim_frame_oam 0x4000, 0x0, 0x4E, 10, -10
	banim_frame_oam 0x0, 0x0, 0x50, 26, -10
	banim_frame_oam 0x0, 0x0, 0xC0, 2, -28
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x91, -16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE0, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xE, -35, -24
	banim_frame_oam 0x8000, 0x1000, 0x10, -43, -24
	banim_frame_oam 0x4000, 0x1000, 0x4E, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x50, -43, -8
	banim_frame_oam 0x0, 0x1000, 0xC0, -19, -26
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xC1, -25, 16
	banim_frame_oam 0x0, 0x0, 0xC3, -9, 16
	banim_frame_oam 0x0, 0x0, 0xE1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x6E, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xAE, -32, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x6000, 0xC0, -1, 5
	banim_frame_oam 0x8000, 0x2000, 0xC2, 15, 5
	banim_frame_oam 0x4000, 0x2000, 0xE3, -1, -3
	banim_frame_oam 0x0, 0x2000, 0xE5, 15, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -17, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 15, -18
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x8A, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0xCF, -10, -16
	banim_frame_oam 0x0, 0x4000, 0xCC, -15, -32
	banim_frame_oam 0x8000, 0x0, 0xCE, 1, -32
	banim_frame_oam 0x0, 0x4000, 0xC5, 18, -15
	banim_frame_oam 0x8000, 0x0, 0xC7, 34, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 10, -15
	banim_frame_oam 0x4000, 0x0, 0xC9, 18, 1
	banim_frame_oam 0x0, 0x0, 0xCB, 34, 1
	banim_frame_oam 0x0, 0x0, 0xE4, 26, 9
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	.section .data.script
banim_warm_ax1_2_script:
banim_warm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 7, banim_warm_ax1_2_oam_frame_1_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 5, banim_warm_ax1_2_oam_frame_2_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 9, banim_warm_ax1_2_oam_frame_3_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 6, banim_warm_ax1_2_oam_frame_4_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 10, banim_warm_ax1_2_oam_frame_5_r - banim_warm_ax1_2_oam_r
	banim_code_frame 10, banim_warm_ax1_sheet_0, 11, banim_warm_ax1_2_oam_frame_6_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 16, banim_warm_ax1_2_oam_frame_7_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 17, banim_warm_ax1_2_oam_frame_8_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 18, banim_warm_ax1_2_oam_frame_9_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 19, banim_warm_ax1_2_oam_frame_10_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 20, banim_warm_ax1_2_oam_frame_11_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 21, banim_warm_ax1_2_oam_frame_12_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 22, banim_warm_ax1_2_oam_frame_13_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 10, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 7, banim_warm_ax1_2_oam_frame_1_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 5, banim_warm_ax1_2_oam_frame_2_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 9, banim_warm_ax1_2_oam_frame_3_r - banim_warm_ax1_2_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_0, 6, banim_warm_ax1_2_oam_frame_4_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 16, banim_warm_ax1_2_oam_frame_7_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 17, banim_warm_ax1_2_oam_frame_8_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 18, banim_warm_ax1_2_oam_frame_9_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 19, banim_warm_ax1_2_oam_frame_10_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 20, banim_warm_ax1_2_oam_frame_11_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 21, banim_warm_ax1_2_oam_frame_12_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 22, banim_warm_ax1_2_oam_frame_13_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_2_oam_frame_14_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_2_oam_frame_15_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 7, banim_warm_ax1_2_oam_frame_1_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 5, banim_warm_ax1_2_oam_frame_2_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 9, banim_warm_ax1_2_oam_frame_3_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 6, banim_warm_ax1_2_oam_frame_4_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 10, banim_warm_ax1_2_oam_frame_5_r - banim_warm_ax1_2_oam_r
	banim_code_frame 10, banim_warm_ax1_sheet_0, 11, banim_warm_ax1_2_oam_frame_6_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 16, banim_warm_ax1_2_oam_frame_7_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 17, banim_warm_ax1_2_oam_frame_8_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 18, banim_warm_ax1_2_oam_frame_9_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 19, banim_warm_ax1_2_oam_frame_10_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 20, banim_warm_ax1_2_oam_frame_11_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 21, banim_warm_ax1_2_oam_frame_12_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 22, banim_warm_ax1_2_oam_frame_13_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 7, banim_warm_ax1_2_oam_frame_1_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 5, banim_warm_ax1_2_oam_frame_2_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 9, banim_warm_ax1_2_oam_frame_3_r - banim_warm_ax1_2_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_0, 6, banim_warm_ax1_2_oam_frame_4_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 12, banim_warm_ax1_2_oam_frame_16_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 13, banim_warm_ax1_2_oam_frame_17_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 14, banim_warm_ax1_2_oam_frame_18_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 15, banim_warm_ax1_2_oam_frame_19_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 16, banim_warm_ax1_2_oam_frame_7_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 17, banim_warm_ax1_2_oam_frame_8_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 18, banim_warm_ax1_2_oam_frame_9_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 19, banim_warm_ax1_2_oam_frame_10_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 20, banim_warm_ax1_2_oam_frame_11_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 21, banim_warm_ax1_2_oam_frame_12_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 22, banim_warm_ax1_2_oam_frame_13_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 3, banim_warm_ax1_2_oam_frame_20_r - banim_warm_ax1_2_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 4, banim_warm_ax1_2_oam_frame_21_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 3, banim_warm_ax1_2_oam_frame_20_r - banim_warm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 3, banim_warm_ax1_2_oam_frame_20_r - banim_warm_ax1_2_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 4, banim_warm_ax1_2_oam_frame_21_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 3, banim_warm_ax1_2_oam_frame_20_r - banim_warm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_2_mode_stand:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_2_oam_frame_0_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 7, banim_warm_ax1_2_oam_frame_1_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 5, banim_warm_ax1_2_oam_frame_2_r - banim_warm_ax1_2_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_0, 9, banim_warm_ax1_2_oam_frame_3_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 6, banim_warm_ax1_2_oam_frame_4_r - banim_warm_ax1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_0, 10, banim_warm_ax1_2_oam_frame_5_r - banim_warm_ax1_2_oam_r
	banim_code_frame 10, banim_warm_ax1_sheet_0, 11, banim_warm_ax1_2_oam_frame_6_r - banim_warm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_warm_ax1_sheet_1, 16, banim_warm_ax1_2_oam_frame_7_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 17, banim_warm_ax1_2_oam_frame_8_r - banim_warm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_warm_ax1_sheet_1, 18, banim_warm_ax1_2_oam_frame_9_r - banim_warm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_warm_ax1_sheet_1, 19, banim_warm_ax1_2_oam_frame_10_r - banim_warm_ax1_2_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_1, 20, banim_warm_ax1_2_oam_frame_11_r - banim_warm_ax1_2_oam_r
	banim_code_frame 15, banim_warm_ax1_sheet_1, 21, banim_warm_ax1_2_oam_frame_12_r - banim_warm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_1, 22, banim_warm_ax1_2_oam_frame_13_r - banim_warm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_warm_ax1_2_mode_attack_close - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_close_back - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_close_critical - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_close_critical_back - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_range - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_range_critical - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_dodge_close - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_dodge_range - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_stand_close - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_stand - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_stand_range - banim_warm_ax1_2_script
	.word banim_warm_ax1_2_mode_attack_miss - banim_warm_ax1_2_script
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

