@ vim:ft=armv4
	.global banim_solm_sp1_script
	.global banim_solm_sp1_oam_r
	.global banim_solm_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x97
	.section .data.oam_l
banim_solm_sp1_oam_l:
banim_solm_sp1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x20, -7, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x0, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 1, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -23, -5
	banim_frame_oam 0x0, 0x1000, 0x1, -7, -24
	banim_frame_end
banim_solm_sp1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0x84, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x26, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x3, -16, -7
	banim_frame_oam 0x0, 0x1000, 0x23, -24, -7
	banim_frame_oam 0x8000, 0x1000, 0x63, 16, -16
	banim_frame_oam 0x0, 0x5000, 0x4, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x44, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0x64, -2, 0
	banim_frame_end
banim_solm_sp1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x47, 3, -8
	banim_frame_oam 0x8000, 0x1000, 0x49, -5, -8
	banim_frame_oam 0x4000, 0x1000, 0x87, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -5, 8
	banim_frame_oam 0x4000, 0x1000, 0x27, 3, -16
	banim_frame_oam 0x0, 0x1000, 0x6, 10, -24
	banim_frame_oam 0x0, 0x1000, 0x66, 19, 0
	banim_frame_oam 0x0, 0x1000, 0x7, 19, -8
	banim_frame_oam 0x0, 0x1000, 0x8, -13, -8
	banim_frame_end
banim_solm_sp1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x2A, 15, -16
	banim_frame_oam 0x8000, 0x5000, 0x2C, 7, -16
	banim_frame_oam 0x0, 0x1000, 0xB, 15, -24
	banim_frame_oam 0x0, 0x1000, 0x8D, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x4D, -1, -9
	banim_frame_oam 0x0, 0x1000, 0x2D, -9, -9
	banim_frame_oam 0x8000, 0x1000, 0x9, 31, -8
	banim_frame_end
banim_solm_sp1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x2E, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x30, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x6E, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x70, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0x8E, 1, 8
	banim_frame_oam 0x0, 0x1000, 0xE, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xF, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xB, 21, -24
	banim_frame_oam 0x0, 0x1000, 0x6D, 32, -12
	banim_frame_oam 0x0, 0x1000, 0x8, 40, -10
	banim_frame_oam 0x4000, 0x1000, 0x10, 46, -9
	banim_frame_end
banim_solm_sp1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, 57, -11
	banim_frame_end
banim_solm_sp1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x31, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x33, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xB, 21, -24
	banim_frame_oam 0x4000, 0x1000, 0x6E, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x70, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0x8E, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x71, 32, -10
	banim_frame_oam 0x0, 0x1000, 0x8, 40, -10
	banim_frame_oam 0x4000, 0x1000, 0x10, 46, -9
	banim_frame_end
banim_solm_sp1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0x14, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x54, 3, -8
	banim_frame_oam 0x0, 0x1000, 0x13, 32, -16
	banim_frame_oam 0x0, 0x5000, 0x72, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x74, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x8D, 0, 8
	banim_frame_end
banim_solm_sp1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x75, 15, -16
	banim_frame_oam 0x8000, 0x1000, 0x77, 7, -16
	banim_frame_oam 0x0, 0x1000, 0x12, 7, -24
	banim_frame_oam 0x4000, 0x9000, 0x18, -1, 0
	banim_frame_oam 0x8000, 0x1000, 0x5B, -1, -16
	banim_frame_oam 0x0, 0x5000, 0x58, -17, -24
	banim_frame_oam 0x0, 0x1000, 0x98, -9, -8
	banim_frame_end
banim_solm_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xE2, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x6, 3, -24
	banim_frame_oam 0x4000, 0x1000, 0xA6, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, -8, -2
	banim_frame_oam 0x0, 0x5000, 0xC4, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xA5, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xC3, 24, -11
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xE6, 3, -17
	banim_frame_oam 0x0, 0x1000, 0xE8, -5, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, -1, -25
	banim_frame_oam 0x0, 0x5000, 0xA9, 3, -9
	banim_frame_oam 0x8000, 0x1000, 0xAB, -5, -9
	banim_frame_oam 0x4000, 0x1000, 0xE9, 3, 7
	banim_frame_oam 0x0, 0x1000, 0xEB, -5, 7
	banim_frame_oam 0x0, 0x1000, 0xEC, -13, 7
	banim_frame_oam 0x0, 0x1000, 0xC8, -13, -8
	banim_frame_oam 0x4000, 0x1000, 0xA3, -29, -7
	banim_frame_end
banim_solm_sp1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xAD, -7, -9
	banim_frame_oam 0x8000, 0x1000, 0xAF, -15, -9
	banim_frame_oam 0x4000, 0x1000, 0xED, -7, 7
	banim_frame_oam 0x0, 0x1000, 0xEF, -15, 7
	banim_frame_oam 0x8000, 0x1000, 0xAC, 9, -1
	banim_frame_oam 0x0, 0x1000, 0xD0, -23, -2
	banim_frame_oam 0x0, 0x1000, 0xB0, -31, -1
	banim_frame_oam 0x4000, 0x1000, 0xB5, -7, -17
	banim_frame_oam 0x0, 0x1000, 0x6, -3, -25
	banim_frame_end
banim_solm_sp1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0xB2, -13, -16
	banim_frame_oam 0x8000, 0x1000, 0xB4, -21, -16
	banim_frame_oam 0x4000, 0x1000, 0xF2, -13, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -21, 0
	banim_frame_oam 0x4000, 0x1000, 0xB7, -13, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -21, -24
	banim_frame_oam 0x8000, 0x1000, 0xD1, 3, -10
	banim_frame_oam 0x0, 0x1000, 0xF0, 11, 0
	banim_frame_oam 0x4000, 0x1000, 0xF9, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -21, 8
	banim_frame_end
banim_solm_sp1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xBB, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0x5A, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x9A, 0, -24
	banim_frame_oam 0x4000, 0x9000, 0xD5, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x99, -24, -8
	banim_frame_end
banim_solm_sp1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x1000, 0x0, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x2, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -16
	banim_frame_oam 0x0, 0x1000, 0x22, -11, -16
	banim_frame_oam 0x0, 0x5000, 0x41, -10, -8
	banim_frame_oam 0x8000, 0x1000, 0x43, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x80, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x83, 6, -32
	banim_frame_oam 0x8000, 0x1000, 0x40, 6, -48
	banim_frame_end
banim_solm_sp1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x1000, 0x5, 6, -40
	banim_frame_oam 0x0, 0x1000, 0x4, 6, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -2, -24
	banim_frame_oam 0x8000, 0x1000, 0x3, 14, -48
	banim_frame_oam 0x0, 0x1000, 0x2, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x45, -10, -16
	banim_frame_oam 0x0, 0x5000, 0x42, -18, -8
	banim_frame_oam 0x0, 0x1000, 0x65, -18, -16
	banim_frame_end
banim_solm_sp1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x9000, 0x26, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x68, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x87, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x67, -20, 8
	banim_frame_oam 0x4000, 0x1000, 0x6, 4, -24
	banim_frame_oam 0x0, 0x1000, 0x66, 12, -32
	banim_frame_oam 0x0, 0x1000, 0x8, -9, -24
	banim_frame_oam 0x4000, 0x1000, 0x85, -28, -8
	banim_frame_end
banim_solm_sp1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0x2A, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -9, -24
	banim_frame_oam 0x4000, 0x1000, 0x4A, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xA, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x6A, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x8A, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -23, -8
	banim_frame_oam 0x0, 0x1000, 0x9, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x86, -28, -8
	banim_frame_end
banim_solm_sp1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x8C, -8, 0
	banim_frame_oam 0x8000, 0x9000, 0x2E, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xAE, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x50, -32, -17
	banim_frame_oam 0x0, 0x1000, 0x30, -40, -9
	banim_frame_oam 0x0, 0x1000, 0xB, -40, -17
	banim_frame_oam 0x4000, 0x1000, 0xE, -16, 16
	banim_frame_oam 0x0, 0x1000, 0x10, -24, 16
	banim_frame_end
banim_solm_sp1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -22, -13
	banim_frame_oam 0x8000, 0x1000, 0x34, -30, -5
	banim_frame_oam 0x0, 0x1000, 0x74, -30, 11
	banim_frame_oam 0x0, 0x1000, 0x71, -6, 11
	banim_frame_oam 0x8000, 0x1000, 0x31, -6, -8
	banim_frame_oam 0x8000, 0x1000, 0x15, -38, -14
	banim_frame_end
banim_solm_sp1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -7, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x19, -23, -5
	banim_frame_oam 0x0, 0x1000, 0x14, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x11, 1, -32
	banim_frame_oam 0x0, 0x1000, 0x8, -9, -24
	banim_frame_end
banim_solm_sp1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, 0
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xA0, -2, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, -10, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -26, -8
	banim_frame_oam 0x0, 0x5000, 0xC5, -2, -24
	banim_frame_oam 0x8000, 0x1000, 0xC7, -10, -24
	banim_frame_oam 0x0, 0x1000, 0xC2, 5, -32
	banim_frame_oam 0x0, 0x1000, 0xA6, -18, -16
	banim_frame_end
banim_solm_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x5000, 0xA8, 2, -24
	banim_frame_oam 0x8000, 0x1000, 0xAA, -6, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, 2, -8
	banim_frame_oam 0x0, 0x1000, 0xEA, -6, -8
	banim_frame_oam 0x0, 0x5000, 0xCB, -6, 0
	banim_frame_oam 0x0, 0x1000, 0xED, -14, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, -14, -14
	banim_frame_oam 0x4000, 0x1000, 0xE3, -30, -9
	banim_frame_end
banim_solm_sp1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0xCE, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0xD0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xF1, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x93, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0xD1, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xD3, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x91, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0xB1, -3, 0
	banim_frame_oam 0x0, 0x1000, 0xCD, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xAB, -20, -10
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, -9
	banim_frame_end
banim_solm_sp1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0x94, 0, -25
	banim_frame_oam 0x8000, 0x1000, 0x98, -8, -25
	banim_frame_oam 0x4000, 0x5000, 0xD4, 0, -9
	banim_frame_oam 0x0, 0x1000, 0xD8, -8, -9
	banim_frame_oam 0x4000, 0x1000, 0xF7, 0, -1
	banim_frame_oam 0x4000, 0x1000, 0xF4, 5, 7
	banim_frame_oam 0x0, 0x1000, 0xF6, -3, 7
	banim_frame_oam 0x0, 0x1000, 0xB3, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xF2, 40, -24
	banim_frame_end
banim_solm_sp1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x39, 6, -18
	banim_frame_oam 0x8000, 0x5000, 0x3B, -2, -18
	banim_frame_oam 0x0, 0x1000, 0x1A, 22, -4
	banim_frame_oam 0x8000, 0x1000, 0x55, -10, -18
	banim_frame_oam 0x0, 0x1000, 0x1B, -3, -26
	banim_frame_end
banim_solm_sp1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x2E, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x30, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x6E, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x70, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0x8E, 1, 8
	banim_frame_oam 0x0, 0x1000, 0xE, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xF, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xB, 21, -24
	banim_frame_oam 0x0, 0x1000, 0x6D, 32, -12
	banim_frame_oam 0x0, 0x1000, 0x8, 40, -10
	banim_frame_oam 0x4000, 0x1000, 0x10, 46, -9
	banim_frame_oam 0x4000, 0x1000, 0xC, 57, -11
	banim_frame_end
banim_solm_sp1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x5000, 0x31, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x33, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xB, 21, -24
	banim_frame_oam 0x4000, 0x1000, 0x6E, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x70, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0x8E, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x71, 32, -10
	banim_frame_oam 0x0, 0x1000, 0x8, 40, -10
	banim_frame_oam 0x4000, 0x1000, 0x10, 46, -9
	banim_frame_oam 0x4000, 0x1000, 0xC, 57, -11
	banim_frame_end
banim_solm_sp1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_solm_sp1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_solm_sp1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x5000, 0x1C, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0x3D, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x7D, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x1D, 1, 0
	banim_frame_oam 0x4000, 0x1000, 0x3E, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -15, 8
	banim_frame_oam 0x0, 0x5000, 0xB9, 1, -33
	banim_frame_oam 0x4000, 0x1000, 0xF9, 1, -17
	banim_frame_oam 0x0, 0x1000, 0xDB, -7, -23
	banim_frame_oam 0x0, 0x1000, 0xBB, 9, -9
	banim_frame_end
banim_solm_sp1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x5000, 0x1C, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0x3D, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x7D, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x1D, 1, 0
	banim_frame_oam 0x4000, 0x1000, 0x3E, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -15, 8
	banim_frame_oam 0x0, 0x5000, 0x9C, -16, -34
	banim_frame_oam 0x8000, 0x1000, 0x9E, -24, -34
	banim_frame_oam 0x0, 0x1000, 0xDC, -9, -18
	banim_frame_oam 0x0, 0x1000, 0xDD, 0, -34
	banim_frame_end
banim_solm_sp1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x5000, 0x1C, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0x3D, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x7D, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x1D, 1, 0
	banim_frame_oam 0x4000, 0x1000, 0x3E, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -15, 8
	banim_frame_oam 0x0, 0x6000, 0xB9, -23, -9
	banim_frame_oam 0x4000, 0x2000, 0xF9, -23, -17
	banim_frame_oam 0x0, 0x2000, 0xDB, -7, -11
	banim_frame_oam 0x0, 0x2000, 0xBB, -23, -25
	banim_frame_end
banim_solm_sp1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x5000, 0x1C, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0x3D, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x7D, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x1D, 1, 0
	banim_frame_oam 0x4000, 0x1000, 0x3E, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -15, 8
	banim_frame_oam 0x0, 0x6000, 0x9C, -7, -10
	banim_frame_oam 0x8000, 0x2000, 0x9E, 9, -10
	banim_frame_oam 0x0, 0x2000, 0xDC, -6, -18
	banim_frame_oam 0x0, 0x2000, 0xDD, -15, -2
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_solm_sp1_oam_r:
banim_solm_sp1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x20, -9, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 7, -16
	banim_frame_oam 0x0, 0x0, 0x0, -9, -24
	banim_frame_oam 0x0, 0x0, 0x2, -9, -32
	banim_frame_oam 0x0, 0x0, 0x43, 15, -5
	banim_frame_oam 0x0, 0x0, 0x1, -1, -24
	banim_frame_end
banim_solm_sp1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0x84, -16, 8
	banim_frame_oam 0x0, 0x0, 0x86, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x26, 0, -16
	banim_frame_oam 0x0, 0x0, 0x3, 8, -7
	banim_frame_oam 0x0, 0x0, 0x23, 16, -7
	banim_frame_oam 0x8000, 0x0, 0x63, -24, -16
	banim_frame_oam 0x0, 0x4000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x44, -16, -8
	banim_frame_oam 0x4000, 0x0, 0x64, -14, 0
	banim_frame_end
banim_solm_sp1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x47, -19, -8
	banim_frame_oam 0x8000, 0x0, 0x49, -3, -8
	banim_frame_oam 0x4000, 0x0, 0x87, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -3, 8
	banim_frame_oam 0x4000, 0x0, 0x27, -19, -16
	banim_frame_oam 0x0, 0x0, 0x6, -18, -24
	banim_frame_oam 0x0, 0x0, 0x66, -27, 0
	banim_frame_oam 0x0, 0x0, 0x7, -27, -8
	banim_frame_oam 0x0, 0x0, 0x8, 5, -8
	banim_frame_end
banim_solm_sp1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x2A, -31, -16
	banim_frame_oam 0x8000, 0x4000, 0x2C, -15, -16
	banim_frame_oam 0x0, 0x0, 0xB, -23, -24
	banim_frame_oam 0x0, 0x0, 0x8D, -7, 8
	banim_frame_oam 0x0, 0x0, 0x4D, -7, -9
	banim_frame_oam 0x0, 0x0, 0x2D, 1, -9
	banim_frame_oam 0x8000, 0x0, 0x9, -39, -8
	banim_frame_end
banim_solm_sp1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x2E, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x30, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x6E, -32, 0
	banim_frame_oam 0x0, 0x0, 0x70, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0x8E, -33, 8
	banim_frame_oam 0x0, 0x0, 0xE, -8, -16
	banim_frame_oam 0x0, 0x0, 0xF, -8, -8
	banim_frame_oam 0x0, 0x0, 0xB, -29, -24
	banim_frame_oam 0x0, 0x0, 0x6D, -40, -12
	banim_frame_oam 0x0, 0x0, 0x8, -48, -10
	banim_frame_oam 0x4000, 0x0, 0x10, -62, -9
	banim_frame_end
banim_solm_sp1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -73, -11
	banim_frame_end
banim_solm_sp1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x31, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x33, -16, -16
	banim_frame_oam 0x0, 0x0, 0xB, -29, -24
	banim_frame_oam 0x4000, 0x0, 0x6E, -32, 0
	banim_frame_oam 0x0, 0x0, 0x70, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0x8E, -33, 8
	banim_frame_oam 0x0, 0x0, 0x71, -40, -10
	banim_frame_oam 0x0, 0x0, 0x8, -48, -10
	banim_frame_oam 0x4000, 0x0, 0x10, -62, -9
	banim_frame_end
banim_solm_sp1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0x14, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x54, -35, -8
	banim_frame_oam 0x0, 0x0, 0x13, -40, -16
	banim_frame_oam 0x0, 0x4000, 0x72, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x74, -16, 0
	banim_frame_oam 0x0, 0x0, 0x8D, -8, 8
	banim_frame_end
banim_solm_sp1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x75, -31, -16
	banim_frame_oam 0x8000, 0x0, 0x77, -15, -16
	banim_frame_oam 0x0, 0x0, 0x12, -15, -24
	banim_frame_oam 0x4000, 0x8000, 0x18, -31, 0
	banim_frame_oam 0x8000, 0x0, 0x5B, -7, -16
	banim_frame_oam 0x0, 0x4000, 0x58, 1, -24
	banim_frame_oam 0x0, 0x0, 0x98, 1, -8
	banim_frame_end
banim_solm_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -24, 0
	banim_frame_oam 0x0, 0x0, 0xE2, -8, 0
	banim_frame_oam 0x0, 0x0, 0x6, -11, -24
	banim_frame_oam 0x4000, 0x0, 0xA6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE3, 0, -2
	banim_frame_oam 0x0, 0x4000, 0xC4, 8, -8
	banim_frame_oam 0x0, 0x0, 0xA5, 16, -16
	banim_frame_oam 0x0, 0x0, 0xC3, -32, -11
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xE6, -19, -17
	banim_frame_oam 0x0, 0x0, 0xE8, -3, -17
	banim_frame_oam 0x0, 0x0, 0xC6, -7, -25
	banim_frame_oam 0x0, 0x4000, 0xA9, -19, -9
	banim_frame_oam 0x8000, 0x0, 0xAB, -3, -9
	banim_frame_oam 0x4000, 0x0, 0xE9, -19, 7
	banim_frame_oam 0x0, 0x0, 0xEB, -3, 7
	banim_frame_oam 0x0, 0x0, 0xEC, 5, 7
	banim_frame_oam 0x0, 0x0, 0xC8, 5, -8
	banim_frame_oam 0x4000, 0x0, 0xA3, 13, -7
	banim_frame_end
banim_solm_sp1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xAD, -9, -9
	banim_frame_oam 0x8000, 0x0, 0xAF, 7, -9
	banim_frame_oam 0x4000, 0x0, 0xED, -9, 7
	banim_frame_oam 0x0, 0x0, 0xEF, 7, 7
	banim_frame_oam 0x8000, 0x0, 0xAC, -17, -1
	banim_frame_oam 0x0, 0x0, 0xD0, 15, -2
	banim_frame_oam 0x0, 0x0, 0xB0, 23, -1
	banim_frame_oam 0x4000, 0x0, 0xB5, -9, -17
	banim_frame_oam 0x0, 0x0, 0x6, -5, -25
	banim_frame_end
banim_solm_sp1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0xB2, -3, -16
	banim_frame_oam 0x8000, 0x0, 0xB4, 13, -16
	banim_frame_oam 0x4000, 0x0, 0xF2, -3, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 13, 0
	banim_frame_oam 0x4000, 0x0, 0xB7, -3, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 13, -24
	banim_frame_oam 0x8000, 0x0, 0xD1, -11, -10
	banim_frame_oam 0x0, 0x0, 0xF0, -19, 0
	banim_frame_oam 0x4000, 0x0, 0xF9, -11, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 5, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 13, 8
	banim_frame_end
banim_solm_sp1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xBB, 8, -16
	banim_frame_oam 0x0, 0x0, 0x6, 1, -24
	banim_frame_oam 0x8000, 0x0, 0x5A, -8, -40
	banim_frame_oam 0x0, 0x0, 0x9A, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0xD5, -8, 0
	banim_frame_oam 0x0, 0x0, 0x99, 16, -8
	banim_frame_end
banim_solm_sp1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x0, 0x0, -14, -24
	banim_frame_oam 0x0, 0x0, 0x2, 2, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -16
	banim_frame_oam 0x0, 0x0, 0x22, 3, -16
	banim_frame_oam 0x0, 0x4000, 0x41, -6, -8
	banim_frame_oam 0x8000, 0x0, 0x43, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x80, -10, 8
	banim_frame_oam 0x0, 0x0, 0x82, 6, 8
	banim_frame_oam 0x0, 0x0, 0x83, -14, -32
	banim_frame_oam 0x8000, 0x0, 0x40, -14, -48
	banim_frame_end
banim_solm_sp1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x0, 0x5, -14, -40
	banim_frame_oam 0x0, 0x0, 0x4, -14, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, -6, -24
	banim_frame_oam 0x8000, 0x0, 0x3, -22, -48
	banim_frame_oam 0x0, 0x0, 0x2, 2, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -10, 8
	banim_frame_oam 0x0, 0x0, 0x82, 6, 8
	banim_frame_oam 0x0, 0x0, 0x45, 2, -16
	banim_frame_oam 0x0, 0x4000, 0x42, 2, -8
	banim_frame_oam 0x0, 0x0, 0x65, 10, -16
	banim_frame_end
banim_solm_sp1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x8000, 0x26, -20, -16
	banim_frame_oam 0x4000, 0x0, 0x68, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x87, -12, 8
	banim_frame_oam 0x0, 0x0, 0x89, 4, 8
	banim_frame_oam 0x0, 0x0, 0x67, 12, 8
	banim_frame_oam 0x4000, 0x0, 0x6, -20, -24
	banim_frame_oam 0x0, 0x0, 0x66, -20, -32
	banim_frame_oam 0x0, 0x0, 0x8, 1, -24
	banim_frame_oam 0x4000, 0x0, 0x85, 12, -8
	banim_frame_end
banim_solm_sp1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0x2A, -4, -16
	banim_frame_oam 0x0, 0x0, 0x8, 1, -24
	banim_frame_oam 0x4000, 0x0, 0x4A, -9, -8
	banim_frame_oam 0x0, 0x0, 0xA, 7, -8
	banim_frame_oam 0x4000, 0x0, 0x6A, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x8A, -10, 8
	banim_frame_oam 0x0, 0x0, 0x82, 6, 8
	banim_frame_oam 0x0, 0x0, 0x85, 15, -8
	banim_frame_oam 0x0, 0x0, 0x9, -17, -8
	banim_frame_oam 0x0, 0x0, 0x86, 20, -8
	banim_frame_end
banim_solm_sp1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x8C, -8, 0
	banim_frame_oam 0x8000, 0x8000, 0x2E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xAE, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x50, 24, -17
	banim_frame_oam 0x0, 0x0, 0x30, 32, -9
	banim_frame_oam 0x0, 0x0, 0xB, 32, -17
	banim_frame_oam 0x4000, 0x0, 0xE, 0, 16
	banim_frame_oam 0x0, 0x0, 0x10, 16, 16
	banim_frame_end
banim_solm_sp1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 6, -13
	banim_frame_oam 0x8000, 0x0, 0x34, 22, -5
	banim_frame_oam 0x0, 0x0, 0x74, 22, 11
	banim_frame_oam 0x0, 0x0, 0x71, -2, 11
	banim_frame_oam 0x8000, 0x0, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x0, 0x15, 30, -14
	banim_frame_end
banim_solm_sp1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -9, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 7, -16
	banim_frame_oam 0x0, 0x0, 0x19, 15, -5
	banim_frame_oam 0x0, 0x0, 0x14, -9, -24
	banim_frame_oam 0x0, 0x0, 0x11, -9, -32
	banim_frame_oam 0x0, 0x0, 0x8, 1, -24
	banim_frame_end
banim_solm_sp1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, 0
	banim_frame_oam 0x0, 0x0, 0xE2, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xA0, -14, -8
	banim_frame_oam 0x0, 0x0, 0xA2, 2, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 10, -8
	banim_frame_oam 0x0, 0x4000, 0xC5, -14, -24
	banim_frame_oam 0x8000, 0x0, 0xC7, 2, -24
	banim_frame_oam 0x0, 0x0, 0xC2, -13, -32
	banim_frame_oam 0x0, 0x0, 0xA6, 10, -16
	banim_frame_end
banim_solm_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x4000, 0xA8, -18, -24
	banim_frame_oam 0x8000, 0x0, 0xAA, -2, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -18, -8
	banim_frame_oam 0x0, 0x0, 0xEA, -2, -8
	banim_frame_oam 0x0, 0x4000, 0xCB, -10, 0
	banim_frame_oam 0x0, 0x0, 0xED, 6, 8
	banim_frame_oam 0x0, 0x0, 0xA7, 6, -14
	banim_frame_oam 0x4000, 0x0, 0xE3, 14, -9
	banim_frame_end
banim_solm_sp1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0xCE, -20, -24
	banim_frame_oam 0x8000, 0x0, 0xD0, -4, -24
	banim_frame_oam 0x0, 0x0, 0xF1, 4, -16
	banim_frame_oam 0x0, 0x0, 0x93, 4, -8
	banim_frame_oam 0x4000, 0x0, 0xD1, -14, 8
	banim_frame_oam 0x0, 0x0, 0xD3, 2, 8
	banim_frame_oam 0x4000, 0x0, 0x91, -12, -8
	banim_frame_oam 0x4000, 0x0, 0xB1, -13, 0
	banim_frame_oam 0x0, 0x0, 0xCD, -20, -8
	banim_frame_oam 0x0, 0x0, 0xAB, 12, -10
	banim_frame_oam 0x0, 0x0, 0xA5, 20, -9
	banim_frame_end
banim_solm_sp1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0x94, -32, -25
	banim_frame_oam 0x8000, 0x0, 0x98, 0, -25
	banim_frame_oam 0x4000, 0x4000, 0xD4, -32, -9
	banim_frame_oam 0x0, 0x0, 0xD8, 0, -9
	banim_frame_oam 0x4000, 0x0, 0xF7, -16, -1
	banim_frame_oam 0x4000, 0x0, 0xF4, -21, 7
	banim_frame_oam 0x0, 0x0, 0xF6, -5, 7
	banim_frame_oam 0x0, 0x0, 0xB3, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xF2, -56, -24
	banim_frame_end
banim_solm_sp1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x39, -22, -18
	banim_frame_oam 0x8000, 0x4000, 0x3B, -6, -18
	banim_frame_oam 0x0, 0x0, 0x1A, -30, -4
	banim_frame_oam 0x8000, 0x0, 0x55, 2, -18
	banim_frame_oam 0x0, 0x0, 0x1B, -5, -26
	banim_frame_end
banim_solm_sp1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x2E, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x30, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x6E, -32, 0
	banim_frame_oam 0x0, 0x0, 0x70, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0x8E, -33, 8
	banim_frame_oam 0x0, 0x0, 0xE, -8, -16
	banim_frame_oam 0x0, 0x0, 0xF, -8, -8
	banim_frame_oam 0x0, 0x0, 0xB, -29, -24
	banim_frame_oam 0x0, 0x0, 0x6D, -40, -12
	banim_frame_oam 0x0, 0x0, 0x8, -48, -10
	banim_frame_oam 0x4000, 0x0, 0x10, -62, -9
	banim_frame_oam 0x4000, 0x0, 0xC, -73, -11
	banim_frame_end
banim_solm_sp1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x4000, 0x31, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x33, -16, -16
	banim_frame_oam 0x0, 0x0, 0xB, -29, -24
	banim_frame_oam 0x4000, 0x0, 0x6E, -32, 0
	banim_frame_oam 0x0, 0x0, 0x70, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0x8E, -33, 8
	banim_frame_oam 0x0, 0x0, 0x71, -40, -10
	banim_frame_oam 0x0, 0x0, 0x8, -48, -10
	banim_frame_oam 0x4000, 0x0, 0x10, -62, -9
	banim_frame_oam 0x4000, 0x0, 0xC, -73, -11
	banim_frame_end
banim_solm_sp1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_solm_sp1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_solm_sp1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x4000, 0x1C, -1, -24
	banim_frame_oam 0x8000, 0x0, 0x3D, 7, -16
	banim_frame_oam 0x0, 0x0, 0x7D, 7, 0
	banim_frame_oam 0x0, 0x0, 0x1D, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x3E, -9, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 7, 8
	banim_frame_oam 0x0, 0x4000, 0xB9, -17, -33
	banim_frame_oam 0x4000, 0x0, 0xF9, -17, -17
	banim_frame_oam 0x0, 0x0, 0xDB, -1, -23
	banim_frame_oam 0x0, 0x0, 0xBB, -17, -9
	banim_frame_end
banim_solm_sp1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x4000, 0x1C, -1, -24
	banim_frame_oam 0x8000, 0x0, 0x3D, 7, -16
	banim_frame_oam 0x0, 0x0, 0x7D, 7, 0
	banim_frame_oam 0x0, 0x0, 0x1D, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x3E, -9, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 7, 8
	banim_frame_oam 0x0, 0x4000, 0x9C, 0, -34
	banim_frame_oam 0x8000, 0x0, 0x9E, 16, -34
	banim_frame_oam 0x0, 0x0, 0xDC, 1, -18
	banim_frame_oam 0x0, 0x0, 0xDD, -8, -34
	banim_frame_end
banim_solm_sp1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x4000, 0x1C, -1, -24
	banim_frame_oam 0x8000, 0x0, 0x3D, 7, -16
	banim_frame_oam 0x0, 0x0, 0x7D, 7, 0
	banim_frame_oam 0x0, 0x0, 0x1D, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x3E, -9, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 7, 8
	banim_frame_oam 0x0, 0x7000, 0xB9, 7, -9
	banim_frame_oam 0x4000, 0x3000, 0xF9, 7, -17
	banim_frame_oam 0x0, 0x3000, 0xDB, -1, -11
	banim_frame_oam 0x0, 0x3000, 0xBB, 15, -25
	banim_frame_end
banim_solm_sp1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x4000, 0x1C, -1, -24
	banim_frame_oam 0x8000, 0x0, 0x3D, 7, -16
	banim_frame_oam 0x0, 0x0, 0x7D, 7, 0
	banim_frame_oam 0x0, 0x0, 0x1D, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x3E, -9, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 7, 8
	banim_frame_oam 0x0, 0x7000, 0x9C, -9, -10
	banim_frame_oam 0x8000, 0x3000, 0x9E, -17, -10
	banim_frame_oam 0x0, 0x3000, 0xDC, -2, -18
	banim_frame_oam 0x0, 0x3000, 0xDD, 7, -2
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_solm_sp1_script:
banim_solm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_frame 4, banim_solm_sp1_sheet_0, 1, banim_solm_sp1_oam_frame_1_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_solm_sp1_sheet_0, 2, banim_solm_sp1_oam_frame_2_r - banim_solm_sp1_oam_r
	banim_code_frame 6, banim_solm_sp1_sheet_0, 3, banim_solm_sp1_oam_frame_3_r - banim_solm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 1, banim_solm_sp1_sheet_0, 4, banim_solm_sp1_oam_frame_4_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_solm_sp1_sheet_0, 6, banim_solm_sp1_oam_frame_5_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_solm_sp1_sheet_0, 7, banim_solm_sp1_oam_frame_6_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 8, banim_solm_sp1_oam_frame_7_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_solm_sp1_sheet_0, 9, banim_solm_sp1_oam_frame_8_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 11, banim_solm_sp1_oam_frame_9_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_solm_sp1_sheet_0, 12, banim_solm_sp1_oam_frame_10_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 4, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 1, banim_solm_sp1_sheet_0, 5, banim_solm_sp1_oam_frame_13_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_solm_sp1_sheet_0, 5, banim_solm_sp1_oam_frame_13_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 14, banim_solm_sp1_oam_frame_14_r - banim_solm_sp1_oam_r
	banim_code_frame 4, banim_solm_sp1_sheet_1, 15, banim_solm_sp1_oam_frame_15_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_solm_sp1_sheet_1, 16, banim_solm_sp1_oam_frame_16_r - banim_solm_sp1_oam_r
	banim_code_frame 23, banim_solm_sp1_sheet_1, 17, banim_solm_sp1_oam_frame_17_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_solm_sp1_sheet_0, 2, banim_solm_sp1_oam_frame_2_r - banim_solm_sp1_oam_r
	banim_code_frame 6, banim_solm_sp1_sheet_0, 3, banim_solm_sp1_oam_frame_3_r - banim_solm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 1, banim_solm_sp1_sheet_0, 4, banim_solm_sp1_oam_frame_4_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_solm_sp1_sheet_0, 6, banim_solm_sp1_oam_frame_5_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_solm_sp1_sheet_0, 7, banim_solm_sp1_oam_frame_6_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 8, banim_solm_sp1_oam_frame_7_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_solm_sp1_sheet_0, 9, banim_solm_sp1_oam_frame_8_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 11, banim_solm_sp1_oam_frame_9_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_solm_sp1_sheet_0, 12, banim_solm_sp1_oam_frame_10_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 29, banim_solm_sp1_oam_frame_18_r - banim_solm_sp1_oam_r
	banim_code_frame 4, banim_solm_sp1_sheet_1, 29, banim_solm_sp1_oam_frame_18_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_solm_sp1_sheet_1, 29, banim_solm_sp1_oam_frame_18_r - banim_solm_sp1_oam_r
	banim_code_frame 23, banim_solm_sp1_sheet_1, 29, banim_solm_sp1_oam_frame_18_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 1, banim_solm_sp1_sheet_0, 5, banim_solm_sp1_oam_frame_13_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_solm_sp1_sheet_0, 5, banim_solm_sp1_oam_frame_13_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_solm_sp1_sheet_0, 28, banim_solm_sp1_oam_frame_12_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 5, banim_solm_sp1_sheet_1, 21, banim_solm_sp1_oam_frame_19_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_1, 22, banim_solm_sp1_oam_frame_20_r - banim_solm_sp1_oam_r
	banim_code_frame 11, banim_solm_sp1_sheet_1, 23, banim_solm_sp1_oam_frame_21_r - banim_solm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_solm_sp1_sheet_1, 24, banim_solm_sp1_oam_frame_22_r - banim_solm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_solm_sp1_sheet_1, 25, banim_solm_sp1_oam_frame_23_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 7, banim_solm_sp1_sheet_1, 23, banim_solm_sp1_oam_frame_21_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 22, banim_solm_sp1_oam_frame_20_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_solm_sp1_sheet_1, 21, banim_solm_sp1_oam_frame_19_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 20, banim_solm_sp1_oam_frame_24_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_solm_sp1_sheet_1, 31, banim_solm_sp1_oam_frame_25_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 32, banim_solm_sp1_oam_frame_26_r - banim_solm_sp1_oam_r
	banim_code_frame 2, banim_solm_sp1_sheet_1, 33, banim_solm_sp1_oam_frame_27_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_1, 34, banim_solm_sp1_oam_frame_28_r - banim_solm_sp1_oam_r
	banim_code_frame 10, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 5, banim_solm_sp1_sheet_1, 21, banim_solm_sp1_oam_frame_19_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_1, 22, banim_solm_sp1_oam_frame_20_r - banim_solm_sp1_oam_r
	banim_code_frame 11, banim_solm_sp1_sheet_1, 23, banim_solm_sp1_oam_frame_21_r - banim_solm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_solm_sp1_sheet_1, 24, banim_solm_sp1_oam_frame_22_r - banim_solm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_solm_sp1_sheet_1, 25, banim_solm_sp1_oam_frame_23_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 7, banim_solm_sp1_sheet_1, 23, banim_solm_sp1_oam_frame_21_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 22, banim_solm_sp1_oam_frame_20_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_solm_sp1_sheet_1, 21, banim_solm_sp1_oam_frame_19_r - banim_solm_sp1_oam_r
	banim_code_frame 3, banim_solm_sp1_sheet_1, 20, banim_solm_sp1_oam_frame_24_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_sheet_1, 18, banim_solm_sp1_oam_frame_29_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_1, 19, banim_solm_sp1_oam_frame_30_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_sheet_1, 18, banim_solm_sp1_oam_frame_29_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_sheet_1, 18, banim_solm_sp1_oam_frame_29_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_1, 19, banim_solm_sp1_oam_frame_30_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_sheet_1, 18, banim_solm_sp1_oam_frame_29_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_mode_stand_close:
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_mode_stand:
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_mode_stand_range:
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_solm_sp1_sheet_0, 0, banim_solm_sp1_oam_frame_0_r - banim_solm_sp1_oam_r
	banim_code_frame 4, banim_solm_sp1_sheet_0, 1, banim_solm_sp1_oam_frame_1_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_solm_sp1_sheet_0, 2, banim_solm_sp1_oam_frame_2_r - banim_solm_sp1_oam_r
	banim_code_frame 6, banim_solm_sp1_sheet_0, 3, banim_solm_sp1_oam_frame_3_r - banim_solm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_solm_sp1_sheet_0, 26, banim_solm_sp1_oam_frame_31_r - banim_solm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_solm_sp1_sheet_0, 27, banim_solm_sp1_oam_frame_32_r - banim_solm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_solm_sp1_sheet_0, 7, banim_solm_sp1_oam_frame_6_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 8, banim_solm_sp1_oam_frame_7_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_solm_sp1_sheet_0, 9, banim_solm_sp1_oam_frame_8_r - banim_solm_sp1_oam_r
	banim_code_frame 5, banim_solm_sp1_sheet_0, 11, banim_solm_sp1_oam_frame_9_r - banim_solm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_solm_sp1_sheet_0, 12, banim_solm_sp1_oam_frame_10_r - banim_solm_sp1_oam_r
	banim_code_frame 1, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_solm_sp1_sheet_0, 13, banim_solm_sp1_oam_frame_11_r - banim_solm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_solm_sp1_mode_attack_close - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_close_back - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_close_critical - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_close_critical_back - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_range - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_range_critical - banim_solm_sp1_script
	.word banim_solm_sp1_mode_dodge_close - banim_solm_sp1_script
	.word banim_solm_sp1_mode_dodge_range - banim_solm_sp1_script
	.word banim_solm_sp1_mode_stand_close - banim_solm_sp1_script
	.word banim_solm_sp1_mode_stand - banim_solm_sp1_script
	.word banim_solm_sp1_mode_stand_range - banim_solm_sp1_script
	.word banim_solm_sp1_mode_attack_miss - banim_solm_sp1_script
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

