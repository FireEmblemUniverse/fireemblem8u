@ vim:ft=armv4
	.global banim_drum_mg1_script
	.global banim_drum_mg1_oam_r
	.global banim_drum_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x76
	.section .data.oam_l
banim_drum_mg1_oam_l:
banim_drum_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x99, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x9D, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD9, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xDD, -32, 8
	banim_frame_end
banim_drum_mg1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xAC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, 0
	banim_frame_end
banim_drum_mg1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xAA, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEA, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xCC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_end
banim_drum_mg1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0xB0, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF4, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xEC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_end
banim_drum_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_end
banim_drum_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x4C, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0x6C, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -48, -16
	banim_frame_end
banim_drum_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x11, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, -32, 0
	banim_frame_oam 0x0, 0x5000, 0x12, -48, -32
	banim_frame_oam 0x4000, 0x1000, 0x52, -48, -16
	banim_frame_oam 0x8000, 0x1000, 0x92, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x72, -40, -8
	banim_frame_end
banim_drum_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x18, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x94, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x98, -32, 0
	banim_frame_end
banim_drum_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x1A, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1E, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x9A, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9E, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, 0
	banim_frame_end
banim_drum_mg1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xC4, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xE5, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xC5, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC9, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -32, 8
	banim_frame_end
banim_drum_mg1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0xD1, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xD5, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xD6, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xDA, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xFF, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -7, 8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -39, 8
	banim_frame_end
banim_drum_mg1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xC0, -6, 5
	banim_frame_oam 0x4000, 0x8000, 0xC0, -38, 5
	banim_frame_end
banim_drum_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xA4, 2, 6
	banim_frame_oam 0x8000, 0x1000, 0xA8, -6, 6
	banim_frame_oam 0x4000, 0x8000, 0xA4, -46, 6
	banim_frame_oam 0x8000, 0x0, 0xA8, -14, 6
	banim_frame_end
banim_drum_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xA9, 1, 1
	banim_frame_oam 0x8000, 0x1000, 0xAD, -7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE9, 1, 17
	banim_frame_oam 0x0, 0x1000, 0xED, -7, 17
	banim_frame_oam 0x4000, 0x8000, 0xA9, -47, 1
	banim_frame_oam 0x8000, 0x0, 0xAD, -15, 1
	banim_frame_oam 0x4000, 0x4000, 0xE9, -47, 17
	banim_frame_oam 0x0, 0x0, 0xED, -15, 17
	banim_frame_end
banim_drum_mg1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0xD4, -2, -9
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x55, -32, -8
	banim_frame_oam 0x4000, 0x9000, 0xAE, 1, 1
	banim_frame_oam 0x8000, 0x1000, 0xB2, -7, 1
	banim_frame_oam 0x4000, 0x5000, 0xEE, 1, 17
	banim_frame_oam 0x0, 0x1000, 0xF2, -7, 17
	banim_frame_oam 0x4000, 0x8000, 0xAE, -47, 1
	banim_frame_oam 0x8000, 0x0, 0xB2, -15, 1
	banim_frame_oam 0x4000, 0x4000, 0xEE, -47, 17
	banim_frame_oam 0x0, 0x0, 0xF2, -15, 17
	banim_frame_oam 0x0, 0x1000, 0xB3, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xD3, 20, -25
	banim_frame_oam 0x0, 0x0, 0xF3, -37, -8
	banim_frame_oam 0x0, 0x1000, 0xD3, -23, -23
	banim_frame_end
banim_drum_mg1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x5000, 0x15, 4, -41
	banim_frame_oam 0x0, 0x9000, 0x0, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0x4, -30, -22
	banim_frame_oam 0x4000, 0x5000, 0x81, -22, 10
	banim_frame_oam 0x0, 0x1000, 0x80, 8, -30
	banim_frame_oam 0x4000, 0x9000, 0xA0, 1, 1
	banim_frame_oam 0x8000, 0x1000, 0xA4, -7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE0, 1, 17
	banim_frame_oam 0x0, 0x1000, 0xE4, -7, 17
	banim_frame_oam 0x4000, 0x8000, 0xA0, -47, 1
	banim_frame_oam 0x8000, 0x0, 0xA4, -15, 1
	banim_frame_oam 0x4000, 0x4000, 0xE0, -47, 17
	banim_frame_oam 0x0, 0x0, 0xE4, -15, 17
	banim_frame_oam 0x8000, 0x5000, 0x12, -43, -58
	banim_frame_oam 0x0, 0x1000, 0x92, -43, -26
	banim_frame_oam 0x8000, 0x5000, 0x13, 19, -34
	banim_frame_oam 0x0, 0x1000, 0x93, 19, -2
	banim_frame_oam 0x8000, 0x5000, 0x15, -45, -18
	banim_frame_oam 0x8000, 0x6000, 0x13, 0, -64
	banim_frame_oam 0x0, 0x2000, 0x93, 0, -72
	banim_frame_oam 0x0, 0x1000, 0x34, -3, -80
	banim_frame_oam 0x0, 0x1000, 0x14, -20, -38
	banim_frame_oam 0x0, 0x1000, 0x12, 22, -57
	banim_frame_oam 0x8000, 0x5000, 0x12, 8, -104
	banim_frame_oam 0x0, 0x1000, 0x92, 8, -72
	banim_frame_oam 0x8000, 0x7000, 0x13, -33, -85
	banim_frame_oam 0x0, 0x3000, 0x93, -33, -93
	banim_frame_oam 0x0, 0x1000, 0x12, -44, -102
	banim_frame_end
banim_drum_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0x4, -30, -22
	banim_frame_oam 0x4000, 0x5000, 0x81, -22, 10
	banim_frame_oam 0x0, 0x1000, 0x80, 8, -30
	banim_frame_end
banim_drum_mg1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x4000, 0x12, 7, -21
	banim_frame_oam 0x0, 0x0, 0x92, 7, 11
	banim_frame_oam 0x8000, 0x4000, 0x12, -26, -32
	banim_frame_oam 0x0, 0x0, 0x92, -26, 0
	banim_frame_oam 0x0, 0x9000, 0x6, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0xA, -30, -22
	banim_frame_oam 0x4000, 0x5000, 0x87, -22, 10
	banim_frame_oam 0x0, 0x1000, 0x86, 5, -30
	banim_frame_oam 0x4000, 0x9000, 0xA5, 0, 1
	banim_frame_oam 0x8000, 0x1000, 0xA9, -8, 1
	banim_frame_oam 0x4000, 0x5000, 0xE5, 0, 17
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 17
	banim_frame_oam 0x4000, 0x8000, 0xA5, -48, 1
	banim_frame_oam 0x8000, 0x0, 0xA9, -16, 1
	banim_frame_oam 0x4000, 0x4000, 0xE5, -48, 17
	banim_frame_oam 0x0, 0x0, 0xE9, -16, 17
	banim_frame_oam 0x8000, 0x4000, 0x15, -22, -41
	banim_frame_oam 0x8000, 0x4000, 0x12, 22, -48
	banim_frame_oam 0x0, 0x0, 0x92, 22, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, 12, -72
	banim_frame_oam 0x8000, 0x7000, 0x13, -18, -64
	banim_frame_oam 0x0, 0x3000, 0x93, -18, -72
	banim_frame_oam 0x0, 0x0, 0x34, -15, -80
	banim_frame_oam 0x0, 0x0, 0x12, -40, -57
	banim_frame_oam 0x8000, 0x4000, 0x12, -26, -104
	banim_frame_oam 0x0, 0x0, 0x92, -26, -72
	banim_frame_oam 0x8000, 0x6000, 0x13, -46, -21
	banim_frame_oam 0x0, 0x2000, 0x93, -46, -29
	banim_frame_end
banim_drum_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0xA, -30, -22
	banim_frame_oam 0x4000, 0x5000, 0x87, -22, 10
	banim_frame_oam 0x0, 0x1000, 0x86, 5, -30
	banim_frame_end
banim_drum_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0x10, -30, -22
	banim_frame_oam 0x0, 0x1000, 0x8C, 5, -30
	banim_frame_oam 0x4000, 0x5000, 0x8D, -22, 10
	banim_frame_oam 0x4000, 0x9000, 0xA0, 1, 1
	banim_frame_oam 0x8000, 0x1000, 0xA4, -7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE0, 1, 17
	banim_frame_oam 0x0, 0x1000, 0xE4, -7, 17
	banim_frame_oam 0x4000, 0x8000, 0xA0, -47, 1
	banim_frame_oam 0x8000, 0x0, 0xA4, -15, 1
	banim_frame_oam 0x4000, 0x4000, 0xE0, -47, 17
	banim_frame_oam 0x0, 0x0, 0xE4, -15, 17
	banim_frame_oam 0x8000, 0x6000, 0x15, -22, -83
	banim_frame_oam 0x8000, 0x6000, 0x12, 22, -76
	banim_frame_oam 0x0, 0x2000, 0x92, 22, -84
	banim_frame_oam 0x8000, 0x6000, 0x15, 12, -52
	banim_frame_oam 0x8000, 0x5000, 0x13, -18, -60
	banim_frame_oam 0x0, 0x1000, 0x93, -18, -28
	banim_frame_oam 0x0, 0x2000, 0x34, -15, -20
	banim_frame_oam 0x0, 0x2000, 0x12, -40, -43
	banim_frame_oam 0x8000, 0x6000, 0x12, -26, -20
	banim_frame_oam 0x0, 0x2000, 0x92, -26, -28
	banim_frame_oam 0x8000, 0x4000, 0x13, 24, -24
	banim_frame_oam 0x0, 0x0, 0x93, 24, 8
	banim_frame_oam 0x8000, 0x6000, 0x15, -45, -33
	banim_frame_oam 0x8000, 0x6000, 0x12, -45, -96
	banim_frame_oam 0x0, 0x2000, 0x92, -45, -104
	banim_frame_end
banim_drum_mg1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -14, -22
	banim_frame_oam 0x8000, 0x9000, 0x10, -30, -22
	banim_frame_oam 0x0, 0x1000, 0x8C, 5, -30
	banim_frame_oam 0x4000, 0x5000, 0x8D, -22, 10
	banim_frame_end
banim_drum_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0xA, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x8A, -32, 8
	banim_frame_end
banim_drum_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -22, -24
	banim_frame_oam 0x8000, 0x5000, 0xF, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -22, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, -30, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_drum_mg1_oam_r:
banim_drum_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x99, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x9D, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD9, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xDD, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xAC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE5, 24, 0
	banim_frame_end
banim_drum_mg1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xAA, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xEA, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xCC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_end
banim_drum_mg1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0xB0, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xF4, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xEC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_end
banim_drum_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_end
banim_drum_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 32, -32
	banim_frame_oam 0x0, 0x0, 0x4C, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x6C, 40, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 40, -16
	banim_frame_end
banim_drum_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x11, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x91, 24, 0
	banim_frame_oam 0x0, 0x4000, 0x12, 32, -32
	banim_frame_oam 0x4000, 0x0, 0x52, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x92, -16, -16
	banim_frame_oam 0x0, 0x0, 0x72, 32, -8
	banim_frame_end
banim_drum_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x18, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x94, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x98, 16, 0
	banim_frame_end
banim_drum_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x1A, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1E, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x9A, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9E, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, 0
	banim_frame_end
banim_drum_mg1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xC4, 8, -24
	banim_frame_oam 0x0, 0x0, 0xE5, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xC5, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xC9, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xEF, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0xD1, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD5, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0xD6, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xDA, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xFF, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_drum_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -25, 8
	banim_frame_oam 0x4000, 0x5000, 0xA0, 7, 8
	banim_frame_end
banim_drum_mg1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xC0, -26, 5
	banim_frame_oam 0x4000, 0x9000, 0xC0, 6, 5
	banim_frame_end
banim_drum_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xA4, -34, 6
	banim_frame_oam 0x8000, 0x0, 0xA8, -2, 6
	banim_frame_oam 0x4000, 0x9000, 0xA4, 14, 6
	banim_frame_oam 0x8000, 0x1000, 0xA8, 6, 6
	banim_frame_end
banim_drum_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xA9, -33, 1
	banim_frame_oam 0x8000, 0x0, 0xAD, -1, 1
	banim_frame_oam 0x4000, 0x4000, 0xE9, -33, 17
	banim_frame_oam 0x0, 0x0, 0xED, -1, 17
	banim_frame_oam 0x4000, 0x9000, 0xA9, 15, 1
	banim_frame_oam 0x8000, 0x1000, 0xAD, 7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE9, 15, 17
	banim_frame_oam 0x0, 0x1000, 0xED, 7, 17
	banim_frame_end
banim_drum_mg1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0xD4, -6, -9
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0x94, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x55, 24, -8
	banim_frame_oam 0x4000, 0x8000, 0xAE, -33, 1
	banim_frame_oam 0x8000, 0x0, 0xB2, -1, 1
	banim_frame_oam 0x4000, 0x4000, 0xEE, -33, 17
	banim_frame_oam 0x0, 0x0, 0xF2, -1, 17
	banim_frame_oam 0x4000, 0x9000, 0xAE, 15, 1
	banim_frame_oam 0x8000, 0x1000, 0xB2, 7, 1
	banim_frame_oam 0x4000, 0x5000, 0xEE, 15, 17
	banim_frame_oam 0x0, 0x1000, 0xF2, 7, 17
	banim_frame_oam 0x0, 0x0, 0xB3, -24, -32
	banim_frame_oam 0x0, 0x0, 0xD3, -28, -25
	banim_frame_oam 0x0, 0x1000, 0xF3, 29, -8
	banim_frame_oam 0x0, 0x0, 0xD3, 15, -23
	banim_frame_end
banim_drum_mg1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x4000, 0x15, -12, -41
	banim_frame_oam 0x0, 0x8000, 0x0, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0x4, 14, -22
	banim_frame_oam 0x4000, 0x4000, 0x81, -10, 10
	banim_frame_oam 0x0, 0x0, 0x80, -16, -30
	banim_frame_oam 0x4000, 0x8000, 0xA0, -33, 1
	banim_frame_oam 0x8000, 0x0, 0xA4, -1, 1
	banim_frame_oam 0x4000, 0x4000, 0xE0, -33, 17
	banim_frame_oam 0x0, 0x0, 0xE4, -1, 17
	banim_frame_oam 0x4000, 0x9000, 0xA0, 15, 1
	banim_frame_oam 0x8000, 0x1000, 0xA4, 7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE0, 15, 17
	banim_frame_oam 0x0, 0x1000, 0xE4, 7, 17
	banim_frame_oam 0x8000, 0x4000, 0x12, 35, -58
	banim_frame_oam 0x0, 0x0, 0x92, 35, -26
	banim_frame_oam 0x8000, 0x4000, 0x13, -27, -34
	banim_frame_oam 0x0, 0x0, 0x93, -27, -2
	banim_frame_oam 0x8000, 0x4000, 0x15, 37, -18
	banim_frame_oam 0x8000, 0x7000, 0x13, -8, -64
	banim_frame_oam 0x0, 0x3000, 0x93, -8, -72
	banim_frame_oam 0x0, 0x0, 0x34, -5, -80
	banim_frame_oam 0x0, 0x0, 0x14, 12, -38
	banim_frame_oam 0x0, 0x0, 0x12, -30, -57
	banim_frame_oam 0x8000, 0x4000, 0x12, -16, -104
	banim_frame_oam 0x0, 0x0, 0x92, -16, -72
	banim_frame_oam 0x8000, 0x6000, 0x13, 25, -85
	banim_frame_oam 0x0, 0x2000, 0x93, 25, -93
	banim_frame_oam 0x0, 0x0, 0x12, 36, -102
	banim_frame_end
banim_drum_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0x4, 14, -22
	banim_frame_oam 0x4000, 0x4000, 0x81, -10, 10
	banim_frame_oam 0x0, 0x0, 0x80, -16, -30
	banim_frame_end
banim_drum_mg1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x5000, 0x12, -15, -21
	banim_frame_oam 0x0, 0x1000, 0x92, -15, 11
	banim_frame_oam 0x8000, 0x5000, 0x12, 18, -32
	banim_frame_oam 0x0, 0x1000, 0x92, 18, 0
	banim_frame_oam 0x0, 0x8000, 0x6, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0xA, 14, -22
	banim_frame_oam 0x4000, 0x4000, 0x87, -10, 10
	banim_frame_oam 0x0, 0x0, 0x86, -13, -30
	banim_frame_oam 0x4000, 0x8000, 0xA5, -32, 1
	banim_frame_oam 0x8000, 0x0, 0xA9, 0, 1
	banim_frame_oam 0x4000, 0x4000, 0xE5, -32, 17
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 17
	banim_frame_oam 0x4000, 0x9000, 0xA5, 16, 1
	banim_frame_oam 0x8000, 0x1000, 0xA9, 8, 1
	banim_frame_oam 0x4000, 0x5000, 0xE5, 16, 17
	banim_frame_oam 0x0, 0x1000, 0xE9, 8, 17
	banim_frame_oam 0x8000, 0x5000, 0x15, 14, -41
	banim_frame_oam 0x8000, 0x5000, 0x12, -30, -48
	banim_frame_oam 0x0, 0x1000, 0x92, -30, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, -20, -72
	banim_frame_oam 0x8000, 0x6000, 0x13, 10, -64
	banim_frame_oam 0x0, 0x2000, 0x93, 10, -72
	banim_frame_oam 0x0, 0x1000, 0x34, 7, -80
	banim_frame_oam 0x0, 0x1000, 0x12, 32, -57
	banim_frame_oam 0x8000, 0x5000, 0x12, 18, -104
	banim_frame_oam 0x0, 0x1000, 0x92, 18, -72
	banim_frame_oam 0x8000, 0x7000, 0x13, 38, -21
	banim_frame_oam 0x0, 0x3000, 0x93, 38, -29
	banim_frame_end
banim_drum_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0xA, 14, -22
	banim_frame_oam 0x4000, 0x4000, 0x87, -10, 10
	banim_frame_oam 0x0, 0x0, 0x86, -13, -30
	banim_frame_end
banim_drum_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0x10, 14, -22
	banim_frame_oam 0x0, 0x0, 0x8C, -13, -30
	banim_frame_oam 0x4000, 0x4000, 0x8D, -10, 10
	banim_frame_oam 0x4000, 0x8000, 0xA0, -33, 1
	banim_frame_oam 0x8000, 0x0, 0xA4, -1, 1
	banim_frame_oam 0x4000, 0x4000, 0xE0, -33, 17
	banim_frame_oam 0x0, 0x0, 0xE4, -1, 17
	banim_frame_oam 0x4000, 0x9000, 0xA0, 15, 1
	banim_frame_oam 0x8000, 0x1000, 0xA4, 7, 1
	banim_frame_oam 0x4000, 0x5000, 0xE0, 15, 17
	banim_frame_oam 0x0, 0x1000, 0xE4, 7, 17
	banim_frame_oam 0x8000, 0x7000, 0x15, 14, -83
	banim_frame_oam 0x8000, 0x7000, 0x12, -30, -76
	banim_frame_oam 0x0, 0x3000, 0x92, -30, -84
	banim_frame_oam 0x8000, 0x7000, 0x15, -20, -52
	banim_frame_oam 0x8000, 0x4000, 0x13, 10, -60
	banim_frame_oam 0x0, 0x0, 0x93, 10, -28
	banim_frame_oam 0x0, 0x3000, 0x34, 7, -20
	banim_frame_oam 0x0, 0x3000, 0x12, 32, -43
	banim_frame_oam 0x8000, 0x7000, 0x12, 18, -20
	banim_frame_oam 0x0, 0x3000, 0x92, 18, -28
	banim_frame_oam 0x8000, 0x5000, 0x13, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x93, -32, 8
	banim_frame_oam 0x8000, 0x7000, 0x15, 37, -33
	banim_frame_oam 0x8000, 0x7000, 0x12, 37, -96
	banim_frame_oam 0x0, 0x3000, 0x92, 37, -104
	banim_frame_end
banim_drum_mg1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -18, -22
	banim_frame_oam 0x8000, 0x8000, 0x10, 14, -22
	banim_frame_oam 0x0, 0x0, 0x8C, -13, -30
	banim_frame_oam 0x4000, 0x4000, 0x8D, -10, 10
	banim_frame_end
banim_drum_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0xA, 24, -24
	banim_frame_oam 0x0, 0x0, 0x8A, 24, 8
	banim_frame_end
banim_drum_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -10, -24
	banim_frame_oam 0x8000, 0x4000, 0xF, 22, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -10, 8
	banim_frame_oam 0x0, 0x0, 0x8F, 22, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_drum_mg1_script:
banim_drum_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_sound_magic_druid_critical
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 20, banim_drum_mg1_oam_frame_19_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_sound_magic_druid_critical
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 20, banim_drum_mg1_oam_frame_19_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_sound_magic_druid_critical
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 20, banim_drum_mg1_oam_frame_19_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 22, banim_drum_mg1_oam_frame_21_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 23, banim_drum_mg1_oam_frame_22_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 24, banim_drum_mg1_oam_frame_23_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 25, banim_drum_mg1_oam_frame_24_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 26, banim_drum_mg1_oam_frame_25_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_3, 27, banim_drum_mg1_oam_frame_26_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 21, banim_drum_mg1_oam_frame_20_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 19, banim_drum_mg1_oam_frame_18_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_oam_frame_17_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_oam_frame_16_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 28, banim_drum_mg1_oam_frame_27_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 29, banim_drum_mg1_oam_frame_28_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 28, banim_drum_mg1_oam_frame_27_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 28, banim_drum_mg1_oam_frame_27_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 29, banim_drum_mg1_oam_frame_28_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 28, banim_drum_mg1_oam_frame_27_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_mode_stand_close:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_mode_stand:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_mode_stand_range:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_oam_frame_0_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_oam_frame_1_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_oam_frame_2_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_oam_frame_3_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_oam_frame_4_r - banim_drum_mg1_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_oam_frame_5_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_oam_frame_6_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_oam_frame_7_r - banim_drum_mg1_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_oam_frame_8_r - banim_drum_mg1_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_oam_frame_9_r - banim_drum_mg1_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_oam_frame_10_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_oam_frame_11_r - banim_drum_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_oam_frame_12_r - banim_drum_mg1_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_oam_frame_13_r - banim_drum_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_oam_frame_14_r - banim_drum_mg1_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_oam_frame_15_r - banim_drum_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_drum_mg1_mode_attack_close - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_close_back - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_close_critical - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_close_critical_back - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_range - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_range_critical - banim_drum_mg1_script
	.word banim_drum_mg1_mode_dodge_close - banim_drum_mg1_script
	.word banim_drum_mg1_mode_dodge_range - banim_drum_mg1_script
	.word banim_drum_mg1_mode_stand_close - banim_drum_mg1_script
	.word banim_drum_mg1_mode_stand - banim_drum_mg1_script
	.word banim_drum_mg1_mode_stand_range - banim_drum_mg1_script
	.word banim_drum_mg1_mode_attack_miss - banim_drum_mg1_script
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

