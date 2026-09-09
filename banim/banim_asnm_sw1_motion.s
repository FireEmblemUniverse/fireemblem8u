@ vim:ft=armv4
	.global banim_asnm_sw1_script
	.global banim_asnm_sw1_oam_r
	.global banim_asnm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8A
	.section .data.oam_l
banim_asnm_sw1_oam_l:
banim_asnm_sw1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x65, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x0, -5, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -3, -22
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x28, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x68, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x2B, -15, -8
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 9, -7
	banim_frame_oam 0x8000, 0x1000, 0xA2, 1, -7
	banim_frame_oam 0x4000, 0x9000, 0xC, -6, -8
	banim_frame_oam 0x8000, 0x1000, 0x10, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0x4C, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x50, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x0, 8, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xC, -6, -8
	banim_frame_oam 0x8000, 0x1000, 0x10, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0x4C, -6, 8
	banim_frame_oam 0x0, 0x1000, 0x50, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x0, 8, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_82_l:
	banim_frame_end
banim_asnm_sw1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x15, 14, -17
	banim_frame_oam 0x4000, 0x1000, 0x11, 27, -1
	banim_frame_oam 0x4000, 0x1000, 0x13, 22, -25
	banim_frame_oam 0x0, 0x1000, 0x2, 29, 8
	banim_frame_oam 0x0, 0x0, 0x2, 37, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x2, 30, 8
	banim_frame_oam 0x0, 0x0, 0x2, 38, 8
	banim_frame_oam 0x4000, 0x1000, 0x11, 29, -1
	banim_frame_oam 0x4000, 0x1000, 0x13, 24, -25
	banim_frame_oam 0x4000, 0x5000, 0x39, 16, -9
	banim_frame_oam 0x4000, 0x1000, 0x19, 32, -17
	banim_frame_oam 0x0, 0x1000, 0x1B, 24, -17
	banim_frame_oam 0x0, 0x1000, 0x18, 16, -17
	banim_frame_end
banim_asnm_sw1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0x51, 30, -1
	banim_frame_oam 0x0, 0x1000, 0x70, 38, 8
	banim_frame_oam 0x0, 0x1000, 0x70, 38, 8
	banim_frame_oam 0x0, 0x0, 0x70, 30, 8
	banim_frame_oam 0x4000, 0x9000, 0x11, 16, -17
	banim_frame_oam 0x4000, 0x1000, 0x53, 24, -25
	banim_frame_end
banim_asnm_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x15, 29, -24
	banim_frame_oam 0x8000, 0x1000, 0x17, 21, -24
	banim_frame_oam 0x4000, 0x1000, 0x55, 29, -8
	banim_frame_oam 0x0, 0x1000, 0x57, 21, -8
	banim_frame_oam 0x8000, 0x1000, 0x73, 13, -24
	banim_frame_oam 0x8000, 0x1000, 0xD2, 45, -16
	banim_frame_oam 0x4000, 0x1000, 0x51, 30, -1
	banim_frame_oam 0x0, 0x1000, 0x70, 38, 8
	banim_frame_oam 0x0, 0x1000, 0x70, 38, 8
	banim_frame_oam 0x0, 0x0, 0x70, 30, 8
	banim_frame_end
	banim_frame_end
banim_asnm_sw1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x1000, 0x74, 19, -24
	banim_frame_oam 0x4000, 0x5000, 0xB0, 27, -8
	banim_frame_oam 0x0, 0x1000, 0xB4, 19, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, 19, 0
	banim_frame_oam 0x0, 0x1000, 0x2, 31, 8
	banim_frame_oam 0x0, 0x0, 0x2, 39, 8
	banim_frame_oam 0x4000, 0x1000, 0x90, 43, -16
	banim_frame_oam 0x0, 0x1000, 0x92, 35, -16
	banim_frame_oam 0x8000, 0x1000, 0x73, 27, -24
	banim_frame_oam 0x0, 0x1000, 0x72, 35, -24
	banim_frame_oam 0x0, 0x1000, 0x71, 43, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x1000, 0x55, 50, -17
	banim_frame_oam 0x0, 0x1000, 0x95, 50, -1
	banim_frame_end
banim_asnm_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x2, 33, 8
	banim_frame_oam 0x0, 0x0, 0x2, 41, 8
	banim_frame_oam 0x4000, 0x9000, 0x56, 31, -24
	banim_frame_oam 0x8000, 0x1000, 0x5A, 23, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, 31, -8
	banim_frame_oam 0x0, 0x1000, 0x9A, 23, -8
	banim_frame_oam 0x4000, 0x5000, 0xB7, 23, 0
	banim_frame_oam 0x0, 0x1000, 0xB6, 15, -6
	banim_frame_oam 0x4000, 0x5000, 0x31, 28, -32
	banim_frame_end
banim_asnm_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0x5B, 63, -24
	banim_frame_oam 0x4000, 0x1000, 0x9B, 63, -8
	banim_frame_oam 0x0, 0x1000, 0xBB, 63, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 55, -32
	banim_frame_oam 0x0, 0x1000, 0x52, 55, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0xDE, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x3F, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xBC, 48, -8
	banim_frame_oam 0x8000, 0x1000, 0x1D, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x70, 40, -16
	banim_frame_oam 0x0, 0x1000, 0x83, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xDB, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x1C, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xB, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x8, 56, -23
	banim_frame_oam 0x0, 0x1000, 0x5, 33, -32
	banim_frame_oam 0x0, 0x1000, 0x1, 41, -32
	banim_frame_oam 0x4000, 0x1000, 0xF3, 43, 0
	banim_frame_oam 0x0, 0x1000, 0x2, 31, 8
	banim_frame_oam 0x0, 0x0, 0x2, 39, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x2, 28, 8
	banim_frame_oam 0x0, 0x0, 0x2, 36, 8
	banim_frame_oam 0x8000, 0x9000, 0x5E, 23, -24
	banim_frame_oam 0x8000, 0x1000, 0x7D, 39, -16
	banim_frame_oam 0x0, 0x1000, 0xBD, 39, 0
	banim_frame_oam 0x8000, 0x1000, 0x1E, 47, -16
	banim_frame_oam 0x0, 0x1000, 0x5D, 15, -21
	banim_frame_end
banim_asnm_sw1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, 24, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, 16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE3, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xE7, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0x86, 23, 0
	banim_frame_oam 0x0, 0x1000, 0x6C, 39, 0
	banim_frame_oam 0x0, 0x1000, 0x2, 25, 8
	banim_frame_oam 0x0, 0x0, 0x2, 33, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0xCE, 17, -23
	banim_frame_oam 0x0, 0x5000, 0xCF, 17, -7
	banim_frame_oam 0x4000, 0x1000, 0xF1, 33, -7
	banim_frame_oam 0x4000, 0x1000, 0xF3, 33, 1
	banim_frame_oam 0x0, 0x1000, 0x2, 23, 8
	banim_frame_oam 0x0, 0x0, 0x2, 31, 8
	banim_frame_oam 0x8000, 0x1000, 0xCD, 25, -23
	banim_frame_oam 0x0, 0x1000, 0xEC, 33, -15
	banim_frame_oam 0x0, 0x1000, 0xD6, 32, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0xD6, 24, -23
	banim_frame_oam 0x8000, 0x1000, 0xD8, 16, -23
	banim_frame_oam 0x0, 0x1000, 0xF5, 40, -15
	banim_frame_oam 0x4000, 0x1000, 0xF1, 33, -7
	banim_frame_oam 0x4000, 0x1000, 0xEF, 17, 1
	banim_frame_oam 0x4000, 0x1000, 0xF3, 33, 1
	banim_frame_oam 0x4000, 0x1000, 0xD9, 16, -7
	banim_frame_oam 0x0, 0x1000, 0xCF, 25, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 23, 8
	banim_frame_oam 0x0, 0x0, 0x2, 31, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x20, 16, -17
	banim_frame_oam 0x4000, 0x1000, 0x2, 16, -25
	banim_frame_oam 0x4000, 0x1000, 0x0, 22, -1
	banim_frame_oam 0x0, 0x1000, 0x7, 24, 8
	banim_frame_oam 0x0, 0x0, 0x7, 32, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x24, 32, -17
	banim_frame_oam 0x8000, 0x1000, 0x26, 24, -17
	banim_frame_oam 0x0, 0x1000, 0x6, 24, -25
	banim_frame_oam 0x0, 0x1000, 0x4, 16, -17
	banim_frame_oam 0x0, 0x1000, 0x5, 16, -9
	banim_frame_oam 0x4000, 0x1000, 0x0, 22, -1
	banim_frame_oam 0x0, 0x1000, 0x7, 25, 8
	banim_frame_oam 0x0, 0x0, 0x7, 33, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x7, 25, 8
	banim_frame_oam 0x0, 0x0, 0x7, 33, 8
	banim_frame_oam 0x4000, 0x1000, 0x8, 32, -25
	banim_frame_oam 0x0, 0x1000, 0xA, 24, -25
	banim_frame_oam 0x4000, 0x9000, 0x27, 24, -17
	banim_frame_oam 0x0, 0x1000, 0x4B, 16, -9
	banim_frame_oam 0x4000, 0x1000, 0x0, 22, -1
	banim_frame_oam 0x0, 0x1000, 0x4, 16, -17
	banim_frame_end
banim_asnm_sw1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x7, 25, 8
	banim_frame_oam 0x0, 0x0, 0x7, 33, 8
	banim_frame_oam 0x4000, 0x1000, 0x8, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xA, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x27, 24, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0x0, 22, 0
	banim_frame_oam 0x0, 0x1000, 0x4, 16, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x7, 25, 8
	banim_frame_oam 0x0, 0x0, 0x7, 33, 8
	banim_frame_oam 0x4000, 0x1000, 0x8, 32, -21
	banim_frame_oam 0x0, 0x1000, 0xA, 24, -21
	banim_frame_oam 0x4000, 0x9000, 0x27, 24, -13
	banim_frame_oam 0x0, 0x1000, 0x4B, 16, -5
	banim_frame_oam 0x4000, 0x1000, 0x0, 22, 3
	banim_frame_oam 0x0, 0x1000, 0x4, 16, -13
	banim_frame_end
banim_asnm_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0xC, 29, -16
	banim_frame_oam 0x8000, 0x1000, 0xE, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0x4C, 29, 0
	banim_frame_oam 0x0, 0x1000, 0x4E, 21, 0
	banim_frame_oam 0x8000, 0x1000, 0xB, 45, -14
	banim_frame_oam 0x4000, 0x1000, 0xF, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x11, 21, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 29, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0x52, 29, 0
	banim_frame_oam 0x0, 0x1000, 0x54, 21, 0
	banim_frame_oam 0x4000, 0x1000, 0x2F, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x31, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x4F, 45, -7
	banim_frame_end
banim_asnm_sw1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0x15, 21, -8
	banim_frame_oam 0x4000, 0x1000, 0x56, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x58, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x55, 24, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 28, -8
	banim_frame_oam 0x8000, 0x1000, 0x1C, 20, -8
	banim_frame_oam 0x4000, 0x1000, 0x5A, 28, 8
	banim_frame_oam 0x0, 0x1000, 0x5C, 20, 8
	banim_frame_oam 0x8000, 0x1000, 0x19, 44, -6
	banim_frame_oam 0x0, 0x1000, 0x55, 24, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, 25, -8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 17, -8
	banim_frame_oam 0x4000, 0x1000, 0x7D, 25, 8
	banim_frame_oam 0x0, 0x1000, 0x7F, 17, 8
	banim_frame_oam 0x0, 0x1000, 0x1E, 41, 0
	banim_frame_oam 0x0, 0x1000, 0x1D, 41, 8
	banim_frame_oam 0x0, 0x1000, 0x55, 24, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x61, 21, -14
	banim_frame_oam 0x8000, 0x1000, 0x63, 13, -14
	banim_frame_oam 0x4000, 0x1000, 0xA1, 21, 2
	banim_frame_oam 0x0, 0x1000, 0xA3, 13, 2
	banim_frame_oam 0x8000, 0x1000, 0x60, 37, -12
	banim_frame_oam 0x0, 0x1000, 0xA0, 37, 4
	banim_frame_oam 0x0, 0x1000, 0x7, 24, 8
	banim_frame_oam 0x0, 0x0, 0x7, 32, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x61, 18, -16
	banim_frame_oam 0x8000, 0x1000, 0x63, 10, -16
	banim_frame_oam 0x4000, 0x1000, 0xA1, 18, 0
	banim_frame_oam 0x0, 0x1000, 0xA3, 10, 0
	banim_frame_oam 0x8000, 0x1000, 0x60, 34, -14
	banim_frame_oam 0x0, 0x1000, 0xA0, 34, 2
	banim_frame_oam 0x0, 0x1000, 0x7, 21, 8
	banim_frame_oam 0x0, 0x0, 0x7, 29, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x9000, 0x84, 3, -9
	banim_frame_oam 0x4000, 0x5000, 0xC4, 3, 7
	banim_frame_oam 0x4000, 0x1000, 0x65, 11, -17
	banim_frame_oam 0x0, 0x1000, 0x67, 3, -17
	banim_frame_oam 0x0, 0x1000, 0x64, 35, -1
	banim_frame_oam 0x0, 0x1000, 0x7, 6, 8
	banim_frame_oam 0x0, 0x0, 0x7, 14, 8
	banim_frame_end
	banim_frame_end
banim_asnm_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x6C, -6, -19
	banim_frame_oam 0x8000, 0x1000, 0x8B, 10, -10
	banim_frame_oam 0x0, 0x1000, 0x6B, 18, -4
	banim_frame_oam 0x0, 0x1000, 0x7, -4, 8
	banim_frame_oam 0x0, 0x0, 0x7, 4, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x6F, -9, -16
	banim_frame_oam 0x8000, 0x5000, 0x71, -17, -16
	banim_frame_oam 0x8000, 0x1000, 0x6E, 7, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x9000, 0x6F, -9, -16
	banim_frame_oam 0x8000, 0x5000, 0x71, -17, -16
	banim_frame_oam 0x8000, 0x1000, 0x6E, 7, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x76, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, 6, 8
	banim_frame_oam 0x0, 0x1000, 0x95, 6, -3
	banim_frame_oam 0x0, 0x1000, 0x75, -2, -24
	banim_frame_oam 0x8000, 0x1000, 0x98, -18, -8
	banim_frame_oam 0x0, 0x1000, 0xD8, -18, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x79, -9, -16
	banim_frame_oam 0x8000, 0x1000, 0x9B, -17, -8
	banim_frame_oam 0x0, 0x1000, 0xDB, -17, 8
	banim_frame_oam 0x0, 0x1000, 0x7B, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x9E, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xDC, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xDE, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9F, -24, -11
	banim_frame_oam 0x0, 0x1000, 0x7B, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xFE, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, -9, -16
	banim_frame_oam 0x0, 0x1000, 0xC2, -17, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -25, 0
	banim_frame_oam 0x4000, 0x1000, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xFE, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x7B, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x1000, 0xE8, -13, -16
	banim_frame_oam 0x4000, 0x5000, 0xEA, -21, -8
	banim_frame_oam 0x4000, 0x5000, 0xEE, -21, 0
	banim_frame_oam 0x4000, 0x1000, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xFE, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x7B, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0xE2, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xE4, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -9, 0
	banim_frame_oam 0x0, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x22, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x62, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_46_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x65, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -23
	banim_frame_oam 0x0, 0x5000, 0x26, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x28, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x6, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x65, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -23
	banim_frame_oam 0x0, 0x5000, 0x9, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x2B, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x49, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x65, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0xC, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x4C, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x2E, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -23
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x65, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_50_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x31, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x71, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -7, -24
	banim_frame_oam 0x0, 0x1000, 0x6E, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x6D, 8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_51_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE, 8, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE, 8, 1
	banim_frame_oam 0x0, 0x5000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x17, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x55, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x57, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x1000, 0x75, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0x77, -12, -11
	banim_frame_oam 0x0, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x58, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x5A, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x75, -3, -19
	banim_frame_oam 0x4000, 0x1000, 0x77, -3, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x1000, 0x69, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0x6B, -12, -11
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x58, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x5A, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x69, -3, -19
	banim_frame_oam 0x4000, 0x1000, 0x6B, -3, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x1000, 0x67, -12, -19
	banim_frame_oam 0x0, 0x1000, 0x66, -12, -11
	banim_frame_oam 0x0, 0x1000, 0xB, -4, -11
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x58, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x5A, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x67, -3, -19
	banim_frame_oam 0x0, 0x1000, 0x66, -3, -11
	banim_frame_oam 0x0, 0x1000, 0xB, 5, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x1000, 0x75, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0x77, -12, -11
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x58, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x5A, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x75, -3, -19
	banim_frame_oam 0x4000, 0x1000, 0x77, -3, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_57_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1D, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x5B, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x5D, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x1E, 8, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_58_l:
	banim_frame_oam 0x0, 0x5000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x82, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xC2, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x8, 8, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x5000, 0x83, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x85, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xC3, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xC5, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x5, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_80_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x8D, -7, -24
	banim_frame_oam 0x4000, 0x5000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_81_l:
	banim_frame_oam 0x4000, 0x9000, 0xB3, -21, -8
	banim_frame_oam 0x4000, 0x5000, 0xF3, -21, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, -11, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_74_l:
	banim_frame_oam 0x0, 0x5000, 0x96, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x98, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD6, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xD8, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_75_l:
	banim_frame_oam 0x0, 0x1000, 0x7C, 5, -10
	banim_frame_oam 0x4000, 0x1000, 0x7D, -11, -8
	banim_frame_oam 0x8000, 0x9000, 0x79, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x7B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, 8, -10
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_76_l:
	banim_frame_oam 0x8000, 0x9000, 0x79, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x7B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, 8, -10
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_77_l:
	banim_frame_oam 0x8000, 0x5000, 0x7B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_oam 0x0, 0x5000, 0x9C, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x5E, 8, -16
	banim_frame_oam 0x0, 0x5000, 0xB9, -8, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_79_l:
	banim_frame_oam 0x8000, 0x5000, 0x7B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_oam 0x0, 0x5000, 0x9C, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xB9, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x3F, 8, -15
	banim_frame_oam 0x0, 0x1000, 0xDC, 16, -14
	banim_frame_end
banim_asnm_sw1_oam_frame_78_l:
	banim_frame_oam 0x8000, 0x1000, 0x5F, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x9E, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x96, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x98, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x11, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_83_l:
	banim_frame_oam 0x8000, 0x1000, 0x74, 19, -24
	banim_frame_oam 0x4000, 0x5000, 0xB0, 27, -8
	banim_frame_oam 0x0, 0x1000, 0xB4, 19, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, 19, 0
	banim_frame_oam 0x0, 0x1000, 0x2, 31, 8
	banim_frame_oam 0x0, 0x0, 0x2, 39, 8
	banim_frame_oam 0x4000, 0x1000, 0x90, 43, -16
	banim_frame_oam 0x0, 0x1000, 0x92, 35, -16
	banim_frame_oam 0x8000, 0x1000, 0x73, 27, -24
	banim_frame_oam 0x0, 0x1000, 0x72, 35, -24
	banim_frame_oam 0x0, 0x1000, 0x71, 47, -24
	banim_frame_oam 0x8000, 0x1000, 0x55, 50, -17
	banim_frame_oam 0x0, 0x1000, 0x95, 50, -1
	banim_frame_end
banim_asnm_sw1_oam_frame_84_l:
	banim_frame_oam 0x0, 0x1000, 0x2, 33, 8
	banim_frame_oam 0x0, 0x0, 0x2, 41, 8
	banim_frame_oam 0x4000, 0x9000, 0x56, 31, -24
	banim_frame_oam 0x8000, 0x1000, 0x5A, 23, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, 31, -8
	banim_frame_oam 0x0, 0x1000, 0x9A, 23, -8
	banim_frame_oam 0x4000, 0x5000, 0xB7, 23, 0
	banim_frame_oam 0x0, 0x1000, 0xB6, 15, -6
	banim_frame_oam 0x4000, 0x5000, 0x31, 28, -32
	banim_frame_oam 0x0, 0x5000, 0x5B, 63, -24
	banim_frame_oam 0x4000, 0x1000, 0x9B, 63, -8
	banim_frame_oam 0x0, 0x1000, 0xBB, 63, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 55, -32
	banim_frame_oam 0x0, 0x1000, 0x52, 55, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_61_l:
	banim_frame_oam 0x4000, 0x1000, 0x41, 76, -24
	banim_frame_oam 0x0, 0x1000, 0x43, 68, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, 68, -32
	banim_frame_oam 0x0, 0x1000, 0x40, 21, -21
	banim_frame_oam 0x4000, 0x5000, 0x0, 68, -40
	banim_frame_oam 0x4000, 0x5000, 0xEE, 67, -48
	banim_frame_oam 0x0, 0x5000, 0x4, 15, -45
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -45
	banim_frame_oam 0x4000, 0x1000, 0x44, 15, -29
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, 15, -53
	banim_frame_oam 0x0, 0x1000, 0xD1, 7, -53
	banim_frame_oam 0x8000, 0x1000, 0x6F, -1, -45
	banim_frame_end
banim_asnm_sw1_oam_frame_62_l:
	banim_frame_oam 0x0, 0x5000, 0xC8, 53, 0
	banim_frame_oam 0x4000, 0x1000, 0xA7, 61, -8
	banim_frame_oam 0x0, 0x1000, 0xA9, 53, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, 69, 0
	banim_frame_oam 0x4000, 0x1000, 0x6B, 61, -16
	banim_frame_oam 0x8000, 0x5000, 0x6A, 77, -56
	banim_frame_oam 0x0, 0x1000, 0xE7, 77, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 21, -21
	banim_frame_oam 0x0, 0x5000, 0x4, 15, -45
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -45
	banim_frame_oam 0x4000, 0x1000, 0x44, 15, -29
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, 15, -53
	banim_frame_oam 0x0, 0x1000, 0xD1, 7, -53
	banim_frame_oam 0x8000, 0x1000, 0x6F, -1, -45
	banim_frame_oam 0x0, 0x5000, 0xB, 61, -40
	banim_frame_oam 0x4000, 0x1000, 0x4B, 61, -24
	banim_frame_oam 0x8000, 0x1000, 0xD, 53, -32
	banim_frame_oam 0x0, 0x1000, 0x4D, 53, -16
	banim_frame_oam 0x0, 0x1000, 0x8E, 67, -48
	banim_frame_oam 0x0, 0x1000, 0xAF, 53, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_63_l:
	banim_frame_oam 0x0, 0x1000, 0x40, 21, -21
	banim_frame_oam 0x0, 0x5000, 0x4, 15, -45
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -45
	banim_frame_oam 0x4000, 0x1000, 0x44, 15, -29
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, 15, -53
	banim_frame_oam 0x0, 0x1000, 0xD1, 7, -53
	banim_frame_oam 0x8000, 0x1000, 0x6F, -1, -45
	banim_frame_oam 0x0, 0x5000, 0xC8, 48, 8
	banim_frame_oam 0x4000, 0x1000, 0xA7, 56, 0
	banim_frame_oam 0x0, 0x1000, 0xA9, 48, 0
	banim_frame_oam 0x0, 0x1000, 0xC7, 64, 8
	banim_frame_oam 0x4000, 0x1000, 0x6B, 56, -8
	banim_frame_oam 0x8000, 0x5000, 0x6A, 72, -48
	banim_frame_oam 0x0, 0x1000, 0xE7, 72, -8
	banim_frame_oam 0x0, 0x5000, 0xB, 56, -32
	banim_frame_oam 0x4000, 0x1000, 0x4B, 56, -16
	banim_frame_oam 0x8000, 0x1000, 0xD, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x4D, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x8E, 62, -40
	banim_frame_oam 0x0, 0x1000, 0xAF, 48, -32
	banim_frame_end
banim_asnm_sw1_oam_frame_64_l:
	banim_frame_oam 0x0, 0x1000, 0x40, 21, -21
	banim_frame_oam 0x0, 0x5000, 0x4, 15, -45
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -45
	banim_frame_oam 0x4000, 0x1000, 0x44, 15, -29
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, 15, -53
	banim_frame_oam 0x0, 0x1000, 0xD1, 7, -53
	banim_frame_oam 0x8000, 0x1000, 0x6F, -1, -45
	banim_frame_end
banim_asnm_sw1_oam_frame_65_l:
	banim_frame_oam 0x0, 0x4000, 0xC8, 32, 0
	banim_frame_oam 0x4000, 0x0, 0xA7, 24, -8
	banim_frame_oam 0x0, 0x0, 0xA9, 40, -8
	banim_frame_oam 0x0, 0x0, 0xC7, 24, 0
	banim_frame_oam 0x4000, 0x0, 0x6B, 24, -16
	banim_frame_oam 0x8000, 0x4000, 0x6A, 16, -56
	banim_frame_oam 0x0, 0x0, 0xE7, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xB, 24, -40
	banim_frame_oam 0x4000, 0x0, 0x4B, 24, -24
	banim_frame_oam 0x8000, 0x0, 0xD, 40, -32
	banim_frame_oam 0x0, 0x0, 0x4D, 40, -16
	banim_frame_oam 0x0, 0x0, 0x8E, 26, -48
	banim_frame_oam 0x0, 0x0, 0xAF, 40, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_66_l:
	banim_frame_oam 0x0, 0x4000, 0xC8, 38, 10
	banim_frame_oam 0x4000, 0x0, 0xA7, 30, 2
	banim_frame_oam 0x0, 0x0, 0xA9, 46, 2
	banim_frame_oam 0x0, 0x0, 0xC7, 30, 10
	banim_frame_oam 0x4000, 0x0, 0x6B, 30, -6
	banim_frame_oam 0x8000, 0x4000, 0x6A, 22, -46
	banim_frame_oam 0x0, 0x0, 0xE7, 22, -6
	banim_frame_oam 0x0, 0x4000, 0xB, 30, -30
	banim_frame_oam 0x4000, 0x0, 0x4B, 30, -14
	banim_frame_oam 0x8000, 0x0, 0xD, 46, -22
	banim_frame_oam 0x0, 0x0, 0x4D, 46, -6
	banim_frame_oam 0x0, 0x0, 0x8E, 32, -38
	banim_frame_oam 0x0, 0x0, 0xAF, 46, -30
	banim_frame_end
banim_asnm_sw1_oam_frame_67_l:
	banim_frame_oam 0x8000, 0x9000, 0x80, 45, -8
	banim_frame_oam 0x8000, 0x5000, 0x82, 37, -8
	banim_frame_oam 0x8000, 0x1000, 0x83, 61, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, 47, -16
	banim_frame_oam 0x0, 0x1000, 0x62, 39, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_68_l:
	banim_frame_oam 0x8000, 0x9000, 0x84, 45, -8
	banim_frame_oam 0x8000, 0x5000, 0x86, 37, -8
	banim_frame_oam 0x8000, 0x1000, 0xC3, 61, 8
	banim_frame_oam 0x4000, 0x1000, 0x63, 45, -16
	banim_frame_oam 0x0, 0x1000, 0x65, 37, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_69_l:
	banim_frame_oam 0x4000, 0x1000, 0x28, 54, -32
	banim_frame_oam 0x0, 0x1000, 0x2A, 46, -32
	banim_frame_oam 0x8000, 0x1000, 0x27, 70, -40
	banim_frame_oam 0x4000, 0x1000, 0x48, 46, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, 38, -24
	banim_frame_oam 0x0, 0x1000, 0x68, 54, -16
	banim_frame_oam 0x8000, 0x1000, 0x67, 38, -40
	banim_frame_oam 0x4000, 0x1000, 0xB0, 54, -48
	banim_frame_oam 0x0, 0x1000, 0xB2, 46, -48
	banim_frame_oam 0x4000, 0x1000, 0x8, 54, -40
	banim_frame_oam 0x0, 0x1000, 0xA, 46, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_70_l:
	banim_frame_oam 0x4000, 0x1000, 0x88, 51, -78
	banim_frame_oam 0x4000, 0x1000, 0x28, 54, -60
	banim_frame_oam 0x0, 0x1000, 0x2A, 46, -60
	banim_frame_oam 0x8000, 0x1000, 0x27, 70, -68
	banim_frame_oam 0x4000, 0x1000, 0x48, 46, -52
	banim_frame_oam 0x0, 0x1000, 0x4A, 38, -52
	banim_frame_oam 0x0, 0x1000, 0x68, 54, -44
	banim_frame_oam 0x8000, 0x1000, 0x67, 38, -68
	banim_frame_oam 0x4000, 0x1000, 0xB0, 54, -76
	banim_frame_oam 0x0, 0x1000, 0xB2, 46, -76
	banim_frame_oam 0x4000, 0x1000, 0x8, 54, -68
	banim_frame_oam 0x0, 0x1000, 0xA, 46, -68
	banim_frame_oam 0x0, 0x1000, 0x6E, 61, -14
	banim_frame_oam 0x4000, 0x5000, 0xEA, 61, -54
	banim_frame_oam 0x4000, 0x9000, 0xAB, 59, -70
	banim_frame_oam 0x4000, 0x1000, 0x8B, 61, -78
	banim_frame_oam 0x0, 0x1000, 0x8D, 53, -78
	banim_frame_oam 0x0, 0x1000, 0x6D, 85, -46
	banim_frame_oam 0x4000, 0x1000, 0x90, 69, -46
	banim_frame_oam 0x0, 0x1000, 0x92, 61, -46
	banim_frame_oam 0x0, 0x5000, 0xE, 69, -38
	banim_frame_oam 0x8000, 0x1000, 0x10, 61, -38
	banim_frame_oam 0x4000, 0x1000, 0x4E, 69, -22
	banim_frame_oam 0x0, 0x1000, 0x50, 61, -22
	banim_frame_end
banim_asnm_sw1_oam_frame_71_l:
	banim_frame_oam 0x4000, 0x1000, 0x28, 54, -60
	banim_frame_oam 0x0, 0x1000, 0x2A, 46, -60
	banim_frame_oam 0x8000, 0x1000, 0x27, 70, -68
	banim_frame_oam 0x4000, 0x1000, 0x48, 46, -52
	banim_frame_oam 0x0, 0x1000, 0x4A, 38, -52
	banim_frame_oam 0x0, 0x1000, 0x68, 54, -44
	banim_frame_oam 0x8000, 0x1000, 0x67, 38, -68
	banim_frame_oam 0x4000, 0x1000, 0xB0, 54, -76
	banim_frame_oam 0x0, 0x1000, 0xB2, 46, -76
	banim_frame_oam 0x4000, 0x1000, 0x8, 54, -68
	banim_frame_oam 0x0, 0x1000, 0xA, 46, -68
	banim_frame_end
banim_asnm_sw1_oam_frame_72_l:
	banim_frame_oam 0x4000, 0x1000, 0x28, 54, -64
	banim_frame_oam 0x0, 0x1000, 0x2A, 46, -64
	banim_frame_oam 0x8000, 0x1000, 0x27, 70, -72
	banim_frame_oam 0x4000, 0x1000, 0x48, 46, -56
	banim_frame_oam 0x0, 0x1000, 0x4A, 38, -56
	banim_frame_oam 0x0, 0x1000, 0x68, 54, -48
	banim_frame_oam 0x8000, 0x1000, 0x67, 38, -72
	banim_frame_oam 0x4000, 0x1000, 0xB0, 54, -80
	banim_frame_oam 0x0, 0x1000, 0xB2, 46, -80
	banim_frame_oam 0x4000, 0x1000, 0x8, 54, -72
	banim_frame_oam 0x0, 0x1000, 0xA, 46, -72
	banim_frame_end
banim_asnm_sw1_oam_frame_73_l:
	banim_frame_oam 0x4000, 0x1000, 0x28, 54, -67
	banim_frame_oam 0x0, 0x1000, 0x2A, 46, -67
	banim_frame_oam 0x8000, 0x1000, 0x27, 70, -75
	banim_frame_oam 0x4000, 0x1000, 0x48, 46, -59
	banim_frame_oam 0x0, 0x1000, 0x4A, 38, -59
	banim_frame_oam 0x0, 0x1000, 0x68, 54, -51
	banim_frame_oam 0x8000, 0x1000, 0x67, 38, -75
	banim_frame_oam 0x4000, 0x1000, 0xB0, 54, -83
	banim_frame_oam 0x0, 0x1000, 0xB2, 46, -83
	banim_frame_oam 0x4000, 0x1000, 0x8, 54, -75
	banim_frame_oam 0x0, 0x1000, 0xA, 46, -75
	banim_frame_end
	.section .data.oam_r
banim_asnm_sw1_oam_r:
banim_asnm_sw1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x0, 0x0, 0x0, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 8, -8
	banim_frame_oam 0x0, 0x0, 0x65, 8, 8
	banim_frame_oam 0x0, 0x0, 0x0, -3, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0x0, -5, -22
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x28, 8, -8
	banim_frame_oam 0x0, 0x0, 0x68, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x2B, 7, -8
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -25, -7
	banim_frame_oam 0x8000, 0x0, 0xA2, -9, -7
	banim_frame_oam 0x4000, 0x8000, 0xC, -26, -8
	banim_frame_oam 0x8000, 0x0, 0x10, 6, -8
	banim_frame_oam 0x4000, 0x4000, 0x4C, -26, 8
	banim_frame_oam 0x0, 0x0, 0x50, 6, 8
	banim_frame_oam 0x0, 0x0, 0x0, -16, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xC, -26, -8
	banim_frame_oam 0x8000, 0x0, 0x10, 6, -8
	banim_frame_oam 0x4000, 0x4000, 0x4C, -26, 8
	banim_frame_oam 0x0, 0x0, 0x50, 6, 8
	banim_frame_oam 0x0, 0x0, 0x0, -16, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_82_r:
	banim_frame_end
banim_asnm_sw1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x15, -46, -17
	banim_frame_oam 0x4000, 0x0, 0x11, -43, -1
	banim_frame_oam 0x4000, 0x0, 0x13, -38, -25
	banim_frame_oam 0x0, 0x0, 0x2, -37, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -45, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x2, -38, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -46, 8
	banim_frame_oam 0x4000, 0x0, 0x11, -45, -1
	banim_frame_oam 0x4000, 0x0, 0x13, -40, -25
	banim_frame_oam 0x4000, 0x4000, 0x39, -48, -9
	banim_frame_oam 0x4000, 0x0, 0x19, -48, -17
	banim_frame_oam 0x0, 0x0, 0x1B, -32, -17
	banim_frame_oam 0x0, 0x0, 0x18, -24, -17
	banim_frame_end
banim_asnm_sw1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0x51, -46, -1
	banim_frame_oam 0x0, 0x0, 0x70, -46, 8
	banim_frame_oam 0x0, 0x0, 0x70, -46, 8
	banim_frame_oam 0x0, 0x1000, 0x70, -38, 8
	banim_frame_oam 0x4000, 0x8000, 0x11, -48, -17
	banim_frame_oam 0x4000, 0x0, 0x53, -40, -25
	banim_frame_end
banim_asnm_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -45, -24
	banim_frame_oam 0x8000, 0x0, 0x17, -29, -24
	banim_frame_oam 0x4000, 0x0, 0x55, -45, -8
	banim_frame_oam 0x0, 0x0, 0x57, -29, -8
	banim_frame_oam 0x8000, 0x0, 0x73, -21, -24
	banim_frame_oam 0x8000, 0x0, 0xD2, -53, -16
	banim_frame_oam 0x4000, 0x0, 0x51, -46, -1
	banim_frame_oam 0x0, 0x0, 0x70, -46, 8
	banim_frame_oam 0x0, 0x0, 0x70, -46, 8
	banim_frame_oam 0x0, 0x1000, 0x70, -38, 8
	banim_frame_end
	banim_frame_end
banim_asnm_sw1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x0, 0x74, -27, -24
	banim_frame_oam 0x4000, 0x4000, 0xB0, -59, -8
	banim_frame_oam 0x0, 0x0, 0xB4, -27, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -51, 0
	banim_frame_oam 0x0, 0x0, 0x2, -39, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -47, 8
	banim_frame_oam 0x4000, 0x0, 0x90, -59, -16
	banim_frame_oam 0x0, 0x0, 0x92, -43, -16
	banim_frame_oam 0x8000, 0x0, 0x73, -35, -24
	banim_frame_oam 0x0, 0x0, 0x72, -43, -24
	banim_frame_oam 0x0, 0x0, 0x71, -51, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x0, 0x55, -58, -17
	banim_frame_oam 0x0, 0x0, 0x95, -58, -1
	banim_frame_end
banim_asnm_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x2, -41, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -49, 8
	banim_frame_oam 0x4000, 0x8000, 0x56, -63, -24
	banim_frame_oam 0x8000, 0x0, 0x5A, -31, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -63, -8
	banim_frame_oam 0x0, 0x0, 0x9A, -31, -8
	banim_frame_oam 0x4000, 0x4000, 0xB7, -55, 0
	banim_frame_oam 0x0, 0x0, 0xB6, -23, -6
	banim_frame_oam 0x4000, 0x4000, 0x31, -60, -32
	banim_frame_end
banim_asnm_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0x5B, -79, -24
	banim_frame_oam 0x4000, 0x0, 0x9B, -79, -8
	banim_frame_oam 0x0, 0x0, 0xBB, -71, 0
	banim_frame_oam 0x0, 0x0, 0x51, -63, -32
	banim_frame_oam 0x0, 0x0, 0x52, -63, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0xDE, -48, -8
	banim_frame_oam 0x0, 0x0, 0x3F, -32, 0
	banim_frame_oam 0x0, 0x0, 0xBC, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x1D, -32, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -40, -16
	banim_frame_oam 0x0, 0x0, 0x70, -48, -16
	banim_frame_oam 0x0, 0x0, 0x83, -56, -16
	banim_frame_oam 0x0, 0x0, 0xDB, -32, -24
	banim_frame_oam 0x0, 0x0, 0x1C, -40, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -48, -24
	banim_frame_oam 0x0, 0x0, 0xB, -56, -24
	banim_frame_oam 0x0, 0x0, 0x8, -64, -23
	banim_frame_oam 0x0, 0x0, 0x5, -41, -32
	banim_frame_oam 0x0, 0x0, 0x1, -49, -32
	banim_frame_oam 0x4000, 0x0, 0xF3, -59, 0
	banim_frame_oam 0x0, 0x0, 0x2, -39, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -47, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x2, -36, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -44, 8
	banim_frame_oam 0x8000, 0x8000, 0x5E, -39, -24
	banim_frame_oam 0x8000, 0x0, 0x7D, -47, -16
	banim_frame_oam 0x0, 0x0, 0xBD, -47, 0
	banim_frame_oam 0x8000, 0x0, 0x1E, -55, -16
	banim_frame_oam 0x0, 0x0, 0x5D, -23, -21
	banim_frame_end
banim_asnm_sw1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -40, -24
	banim_frame_oam 0x0, 0x0, 0xE2, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0xE3, -48, -16
	banim_frame_oam 0x4000, 0x4000, 0xE7, -48, -8
	banim_frame_oam 0x4000, 0x0, 0x86, -39, 0
	banim_frame_oam 0x0, 0x0, 0x6C, -47, 0
	banim_frame_oam 0x0, 0x0, 0x2, -33, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -41, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0xCE, -25, -23
	banim_frame_oam 0x0, 0x4000, 0xCF, -33, -7
	banim_frame_oam 0x4000, 0x0, 0xF1, -49, -7
	banim_frame_oam 0x4000, 0x0, 0xF3, -49, 1
	banim_frame_oam 0x0, 0x0, 0x2, -31, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -39, 8
	banim_frame_oam 0x8000, 0x0, 0xCD, -33, -23
	banim_frame_oam 0x0, 0x0, 0xEC, -41, -15
	banim_frame_oam 0x0, 0x0, 0xD6, -40, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0xD6, -40, -23
	banim_frame_oam 0x8000, 0x0, 0xD8, -24, -23
	banim_frame_oam 0x0, 0x0, 0xF5, -48, -15
	banim_frame_oam 0x4000, 0x0, 0xF1, -49, -7
	banim_frame_oam 0x4000, 0x0, 0xEF, -33, 1
	banim_frame_oam 0x4000, 0x0, 0xF3, -49, 1
	banim_frame_oam 0x4000, 0x0, 0xD9, -32, -7
	banim_frame_oam 0x0, 0x0, 0xCF, -33, -7
	banim_frame_oam 0x0, 0x0, 0x2, -31, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -39, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x20, -48, -17
	banim_frame_oam 0x4000, 0x0, 0x2, -32, -25
	banim_frame_oam 0x4000, 0x0, 0x0, -38, -1
	banim_frame_oam 0x0, 0x0, 0x7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -40, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x24, -48, -17
	banim_frame_oam 0x8000, 0x0, 0x26, -32, -17
	banim_frame_oam 0x0, 0x0, 0x6, -32, -25
	banim_frame_oam 0x0, 0x0, 0x4, -24, -17
	banim_frame_oam 0x0, 0x0, 0x5, -24, -9
	banim_frame_oam 0x4000, 0x0, 0x0, -38, -1
	banim_frame_oam 0x0, 0x0, 0x7, -33, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -41, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x7, -33, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -41, 8
	banim_frame_oam 0x4000, 0x0, 0x8, -48, -25
	banim_frame_oam 0x0, 0x0, 0xA, -32, -25
	banim_frame_oam 0x4000, 0x8000, 0x27, -56, -17
	banim_frame_oam 0x0, 0x0, 0x4B, -24, -9
	banim_frame_oam 0x4000, 0x0, 0x0, -38, -1
	banim_frame_oam 0x0, 0x0, 0x4, -24, -17
	banim_frame_end
banim_asnm_sw1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x7, -33, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -41, 8
	banim_frame_oam 0x4000, 0x0, 0x8, -48, -24
	banim_frame_oam 0x0, 0x0, 0xA, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x27, -56, -16
	banim_frame_oam 0x0, 0x0, 0x4B, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x0, -38, 0
	banim_frame_oam 0x0, 0x0, 0x4, -24, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x7, -33, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -41, 8
	banim_frame_oam 0x4000, 0x0, 0x8, -48, -21
	banim_frame_oam 0x0, 0x0, 0xA, -32, -21
	banim_frame_oam 0x4000, 0x8000, 0x27, -56, -13
	banim_frame_oam 0x0, 0x0, 0x4B, -24, -5
	banim_frame_oam 0x4000, 0x0, 0x0, -38, 3
	banim_frame_oam 0x0, 0x0, 0x4, -24, -13
	banim_frame_end
banim_asnm_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -45, -16
	banim_frame_oam 0x8000, 0x0, 0xE, -29, -16
	banim_frame_oam 0x4000, 0x0, 0x4C, -45, 0
	banim_frame_oam 0x0, 0x0, 0x4E, -29, 0
	banim_frame_oam 0x8000, 0x0, 0xB, -53, -14
	banim_frame_oam 0x4000, 0x0, 0xF, -45, 8
	banim_frame_oam 0x0, 0x0, 0x11, -29, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -45, -16
	banim_frame_oam 0x8000, 0x0, 0x14, -29, -16
	banim_frame_oam 0x4000, 0x0, 0x52, -45, 0
	banim_frame_oam 0x0, 0x0, 0x54, -29, 0
	banim_frame_oam 0x4000, 0x0, 0x2F, -45, 8
	banim_frame_oam 0x0, 0x0, 0x31, -29, 8
	banim_frame_oam 0x0, 0x0, 0x4F, -53, -7
	banim_frame_end
banim_asnm_sw1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0x15, -53, -8
	banim_frame_oam 0x4000, 0x0, 0x56, -45, 8
	banim_frame_oam 0x0, 0x0, 0x58, -29, 8
	banim_frame_oam 0x0, 0x0, 0x55, -32, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -44, -8
	banim_frame_oam 0x8000, 0x0, 0x1C, -28, -8
	banim_frame_oam 0x4000, 0x0, 0x5A, -44, 8
	banim_frame_oam 0x0, 0x0, 0x5C, -28, 8
	banim_frame_oam 0x8000, 0x0, 0x19, -52, -6
	banim_frame_oam 0x0, 0x0, 0x55, -32, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, -41, -8
	banim_frame_oam 0x8000, 0x0, 0x3F, -25, -8
	banim_frame_oam 0x4000, 0x0, 0x7D, -41, 8
	banim_frame_oam 0x0, 0x0, 0x7F, -25, 8
	banim_frame_oam 0x0, 0x0, 0x1E, -49, 0
	banim_frame_oam 0x0, 0x0, 0x1D, -49, 8
	banim_frame_oam 0x0, 0x0, 0x55, -32, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x61, -37, -14
	banim_frame_oam 0x8000, 0x0, 0x63, -21, -14
	banim_frame_oam 0x4000, 0x0, 0xA1, -37, 2
	banim_frame_oam 0x0, 0x0, 0xA3, -21, 2
	banim_frame_oam 0x8000, 0x0, 0x60, -45, -12
	banim_frame_oam 0x0, 0x0, 0xA0, -45, 4
	banim_frame_oam 0x0, 0x0, 0x7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -40, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x61, -34, -16
	banim_frame_oam 0x8000, 0x0, 0x63, -18, -16
	banim_frame_oam 0x4000, 0x0, 0xA1, -34, 0
	banim_frame_oam 0x0, 0x0, 0xA3, -18, 0
	banim_frame_oam 0x8000, 0x0, 0x60, -42, -14
	banim_frame_oam 0x0, 0x0, 0xA0, -42, 2
	banim_frame_oam 0x0, 0x0, 0x7, -29, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -37, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x8000, 0x84, -35, -9
	banim_frame_oam 0x4000, 0x4000, 0xC4, -35, 7
	banim_frame_oam 0x4000, 0x0, 0x65, -27, -17
	banim_frame_oam 0x0, 0x0, 0x67, -11, -17
	banim_frame_oam 0x0, 0x0, 0x64, -43, -1
	banim_frame_oam 0x0, 0x0, 0x7, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -22, 8
	banim_frame_end
	banim_frame_end
banim_asnm_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x6C, -10, -19
	banim_frame_oam 0x8000, 0x0, 0x8B, -18, -10
	banim_frame_oam 0x0, 0x0, 0x6B, -26, -4
	banim_frame_oam 0x0, 0x0, 0x7, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -12, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x6F, -7, -16
	banim_frame_oam 0x8000, 0x4000, 0x71, 9, -16
	banim_frame_oam 0x8000, 0x0, 0x6E, -15, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x8000, 0x6F, -7, -16
	banim_frame_oam 0x8000, 0x4000, 0x71, 9, -16
	banim_frame_oam 0x8000, 0x0, 0x6E, -15, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x76, -6, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -14, 8
	banim_frame_oam 0x0, 0x0, 0x95, -14, -3
	banim_frame_oam 0x0, 0x0, 0x75, -6, -24
	banim_frame_oam 0x8000, 0x0, 0x98, 10, -8
	banim_frame_oam 0x0, 0x0, 0xD8, 10, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x79, -7, -16
	banim_frame_oam 0x8000, 0x0, 0x9B, 9, -8
	banim_frame_oam 0x0, 0x0, 0xDB, 9, 8
	banim_frame_oam 0x0, 0x0, 0x7B, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x9E, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xDC, -8, 0
	banim_frame_oam 0x0, 0x0, 0xDE, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x9F, 16, -11
	banim_frame_oam 0x0, 0x0, 0x7B, -1, -24
	banim_frame_oam 0x4000, 0x0, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x0, 0xFE, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, -7, -16
	banim_frame_oam 0x0, 0x0, 0xC2, 9, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x0, 0xFE, 8, 8
	banim_frame_oam 0x0, 0x0, 0x7B, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x0, 0xE8, -3, -16
	banim_frame_oam 0x4000, 0x4000, 0xEA, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xEE, -11, 0
	banim_frame_oam 0x4000, 0x0, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x0, 0xFE, 8, 8
	banim_frame_oam 0x0, 0x0, 0x7B, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -3, -16
	banim_frame_oam 0x4000, 0x0, 0xE2, -9, -8
	banim_frame_oam 0x0, 0x0, 0xE4, 7, -8
	banim_frame_oam 0x4000, 0x0, 0xE5, -7, 0
	banim_frame_oam 0x0, 0x0, 0xE7, 9, 0
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 8, 8
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x22, 8, -8
	banim_frame_oam 0x0, 0x0, 0x62, 8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -3, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_46_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 8, -8
	banim_frame_oam 0x0, 0x0, 0x65, 8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -3, -23
	banim_frame_end
banim_asnm_sw1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x0, 0x2, -3, -23
	banim_frame_oam 0x0, 0x4000, 0x26, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x28, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x6, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x63, -8, 8
	banim_frame_oam 0x0, 0x0, 0x65, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x0, 0x2, -3, -23
	banim_frame_oam 0x0, 0x4000, 0x9, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x2B, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x49, -8, 0
	banim_frame_oam 0x4000, 0x0, 0x63, -8, 8
	banim_frame_oam 0x0, 0x0, 0x65, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x4C, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x2E, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2, -3, -23
	banim_frame_oam 0x4000, 0x0, 0x63, -8, 8
	banim_frame_oam 0x0, 0x0, 0x65, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_50_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x31, 8, -8
	banim_frame_oam 0x0, 0x0, 0x71, 8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x6E, -16, 0
	banim_frame_oam 0x0, 0x0, 0x6D, -16, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_51_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -16
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x0, 0xE, -16, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x0, 0xE, -16, 1
	banim_frame_oam 0x0, 0x4000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x17, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x55, -8, 0
	banim_frame_oam 0x0, 0x0, 0x57, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x0, 0x75, -4, -19
	banim_frame_oam 0x4000, 0x0, 0x77, -4, -11
	banim_frame_oam 0x0, 0x4000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x58, -8, 0
	banim_frame_oam 0x0, 0x0, 0x5A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x75, -13, -19
	banim_frame_oam 0x4000, 0x0, 0x77, -13, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x0, 0x69, -4, -19
	banim_frame_oam 0x4000, 0x0, 0x6B, -4, -11
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x58, -8, 0
	banim_frame_oam 0x0, 0x0, 0x5A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x69, -13, -19
	banim_frame_oam 0x4000, 0x0, 0x6B, -13, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x0, 0x67, -4, -19
	banim_frame_oam 0x0, 0x0, 0x66, 4, -11
	banim_frame_oam 0x0, 0x0, 0xB, -4, -11
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x58, -8, 0
	banim_frame_oam 0x0, 0x0, 0x5A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x67, -13, -19
	banim_frame_oam 0x0, 0x0, 0x66, -5, -11
	banim_frame_oam 0x0, 0x0, 0xB, -13, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x0, 0x75, -4, -19
	banim_frame_oam 0x4000, 0x0, 0x77, -4, -11
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x18, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x58, -8, 0
	banim_frame_oam 0x0, 0x0, 0x5A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x75, -13, -19
	banim_frame_oam 0x4000, 0x0, 0x77, -13, -11
	banim_frame_end
banim_asnm_sw1_oam_frame_57_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x1D, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x5B, -8, 0
	banim_frame_oam 0x0, 0x0, 0x5D, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x8000, 0x0, 0x1E, -16, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_58_r:
	banim_frame_oam 0x0, 0x4000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x82, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xC2, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x0, 0x8, -16, -8
	banim_frame_end
banim_asnm_sw1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x4000, 0x83, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x85, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xC3, -8, 0
	banim_frame_oam 0x0, 0x0, 0xC5, 8, 0
	banim_frame_oam 0x0, 0x0, 0x5, -16, -8
	banim_frame_oam 0x0, 0x0, 0x11, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x0, 0x87, -8, -16
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_80_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x0, 0x8D, -1, -24
	banim_frame_oam 0x4000, 0x4000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x0, 0xB1, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_81_r:
	banim_frame_oam 0x4000, 0x8000, 0xB3, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xF3, -11, 8
	banim_frame_oam 0x4000, 0x0, 0x94, -5, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_74_r:
	banim_frame_oam 0x0, 0x4000, 0x96, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x98, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xD6, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD8, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_75_r:
	banim_frame_oam 0x0, 0x0, 0x7C, -13, -10
	banim_frame_oam 0x4000, 0x0, 0x7D, -5, -8
	banim_frame_oam 0x8000, 0x8000, 0x79, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x7B, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -16, -10
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_76_r:
	banim_frame_oam 0x8000, 0x8000, 0x79, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x7B, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -16, -10
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_77_r:
	banim_frame_oam 0x8000, 0x4000, 0x7B, 8, -16
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_oam 0x0, 0x4000, 0x9C, -8, -16
	banim_frame_oam 0x0, 0x0, 0x5E, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xB9, -8, 0
	banim_frame_end
banim_asnm_sw1_oam_frame_79_r:
	banim_frame_oam 0x8000, 0x4000, 0x7B, 8, -16
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_oam 0x0, 0x4000, 0x9C, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xB9, -8, 0
	banim_frame_oam 0x0, 0x0, 0x3F, -16, -15
	banim_frame_oam 0x0, 0x0, 0xDC, -24, -14
	banim_frame_end
banim_asnm_sw1_oam_frame_78_r:
	banim_frame_oam 0x8000, 0x0, 0x5F, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x9E, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x96, -8, -16
	banim_frame_oam 0x0, 0x0, 0x98, 8, -16
	banim_frame_oam 0x0, 0x0, 0x11, -1, -24
	banim_frame_oam 0x4000, 0x0, 0x72, -8, 8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_end
banim_asnm_sw1_oam_frame_83_r:
	banim_frame_oam 0x8000, 0x0, 0x74, -27, -24
	banim_frame_oam 0x4000, 0x4000, 0xB0, -59, -8
	banim_frame_oam 0x0, 0x0, 0xB4, -27, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -51, 0
	banim_frame_oam 0x0, 0x0, 0x2, -39, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -47, 8
	banim_frame_oam 0x4000, 0x0, 0x90, -59, -16
	banim_frame_oam 0x0, 0x0, 0x92, -43, -16
	banim_frame_oam 0x8000, 0x0, 0x73, -35, -24
	banim_frame_oam 0x0, 0x0, 0x72, -43, -24
	banim_frame_oam 0x0, 0x0, 0x71, -55, -24
	banim_frame_oam 0x8000, 0x0, 0x55, -58, -17
	banim_frame_oam 0x0, 0x0, 0x95, -58, -1
	banim_frame_end
banim_asnm_sw1_oam_frame_84_r:
	banim_frame_oam 0x0, 0x0, 0x2, -41, 8
	banim_frame_oam 0x0, 0x1000, 0x2, -49, 8
	banim_frame_oam 0x4000, 0x8000, 0x56, -63, -24
	banim_frame_oam 0x8000, 0x0, 0x5A, -31, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -63, -8
	banim_frame_oam 0x0, 0x0, 0x9A, -31, -8
	banim_frame_oam 0x4000, 0x4000, 0xB7, -55, 0
	banim_frame_oam 0x0, 0x0, 0xB6, -23, -6
	banim_frame_oam 0x4000, 0x4000, 0x31, -60, -32
	banim_frame_oam 0x0, 0x4000, 0x5B, -79, -24
	banim_frame_oam 0x4000, 0x0, 0x9B, -79, -8
	banim_frame_oam 0x0, 0x0, 0xBB, -71, 0
	banim_frame_oam 0x0, 0x0, 0x51, -63, -32
	banim_frame_oam 0x0, 0x0, 0x52, -63, -24
	banim_frame_end
banim_asnm_sw1_oam_frame_61_r:
	banim_frame_oam 0x4000, 0x0, 0x41, -92, -24
	banim_frame_oam 0x0, 0x0, 0x43, -76, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -100, -32
	banim_frame_oam 0x0, 0x0, 0x40, -29, -21
	banim_frame_oam 0x4000, 0x4000, 0x0, -100, -40
	banim_frame_oam 0x4000, 0x4000, 0xEE, -99, -48
	banim_frame_oam 0x0, 0x4000, 0x4, -31, -45
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -45
	banim_frame_oam 0x4000, 0x0, 0x44, -31, -29
	banim_frame_oam 0x0, 0x0, 0x46, -15, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, -31, -53
	banim_frame_oam 0x0, 0x0, 0xD1, -15, -53
	banim_frame_oam 0x8000, 0x0, 0x6F, -7, -45
	banim_frame_end
banim_asnm_sw1_oam_frame_62_r:
	banim_frame_oam 0x0, 0x4000, 0xC8, -69, 0
	banim_frame_oam 0x4000, 0x0, 0xA7, -77, -8
	banim_frame_oam 0x0, 0x0, 0xA9, -61, -8
	banim_frame_oam 0x0, 0x0, 0xC7, -77, 0
	banim_frame_oam 0x4000, 0x0, 0x6B, -77, -16
	banim_frame_oam 0x8000, 0x4000, 0x6A, -85, -56
	banim_frame_oam 0x0, 0x0, 0xE7, -85, -16
	banim_frame_oam 0x0, 0x0, 0x40, -29, -21
	banim_frame_oam 0x0, 0x4000, 0x4, -31, -45
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -45
	banim_frame_oam 0x4000, 0x0, 0x44, -31, -29
	banim_frame_oam 0x0, 0x0, 0x46, -15, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, -31, -53
	banim_frame_oam 0x0, 0x0, 0xD1, -15, -53
	banim_frame_oam 0x8000, 0x0, 0x6F, -7, -45
	banim_frame_oam 0x0, 0x4000, 0xB, -77, -40
	banim_frame_oam 0x4000, 0x0, 0x4B, -77, -24
	banim_frame_oam 0x8000, 0x0, 0xD, -61, -32
	banim_frame_oam 0x0, 0x0, 0x4D, -61, -16
	banim_frame_oam 0x0, 0x0, 0x8E, -75, -48
	banim_frame_oam 0x0, 0x0, 0xAF, -61, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_63_r:
	banim_frame_oam 0x0, 0x0, 0x40, -29, -21
	banim_frame_oam 0x0, 0x4000, 0x4, -31, -45
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -45
	banim_frame_oam 0x4000, 0x0, 0x44, -31, -29
	banim_frame_oam 0x0, 0x0, 0x46, -15, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, -31, -53
	banim_frame_oam 0x0, 0x0, 0xD1, -15, -53
	banim_frame_oam 0x8000, 0x0, 0x6F, -7, -45
	banim_frame_oam 0x0, 0x4000, 0xC8, -64, 8
	banim_frame_oam 0x4000, 0x0, 0xA7, -72, 0
	banim_frame_oam 0x0, 0x0, 0xA9, -56, 0
	banim_frame_oam 0x0, 0x0, 0xC7, -72, 8
	banim_frame_oam 0x4000, 0x0, 0x6B, -72, -8
	banim_frame_oam 0x8000, 0x4000, 0x6A, -80, -48
	banim_frame_oam 0x0, 0x0, 0xE7, -80, -8
	banim_frame_oam 0x0, 0x4000, 0xB, -72, -32
	banim_frame_oam 0x4000, 0x0, 0x4B, -72, -16
	banim_frame_oam 0x8000, 0x0, 0xD, -56, -24
	banim_frame_oam 0x0, 0x0, 0x4D, -56, -8
	banim_frame_oam 0x0, 0x0, 0x8E, -70, -40
	banim_frame_oam 0x0, 0x0, 0xAF, -56, -32
	banim_frame_end
banim_asnm_sw1_oam_frame_64_r:
	banim_frame_oam 0x0, 0x0, 0x40, -29, -21
	banim_frame_oam 0x0, 0x4000, 0x4, -31, -45
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -45
	banim_frame_oam 0x4000, 0x0, 0x44, -31, -29
	banim_frame_oam 0x0, 0x0, 0x46, -15, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, -31, -53
	banim_frame_oam 0x0, 0x0, 0xD1, -15, -53
	banim_frame_oam 0x8000, 0x0, 0x6F, -7, -45
	banim_frame_end
banim_asnm_sw1_oam_frame_65_r:
	banim_frame_oam 0x0, 0x5000, 0xC8, -48, 0
	banim_frame_oam 0x4000, 0x1000, 0xA7, -40, -8
	banim_frame_oam 0x0, 0x1000, 0xA9, -48, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0x6B, -40, -16
	banim_frame_oam 0x8000, 0x5000, 0x6A, -24, -56
	banim_frame_oam 0x0, 0x1000, 0xE7, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xB, -40, -40
	banim_frame_oam 0x4000, 0x1000, 0x4B, -40, -24
	banim_frame_oam 0x8000, 0x1000, 0xD, -48, -32
	banim_frame_oam 0x0, 0x1000, 0x4D, -48, -16
	banim_frame_oam 0x0, 0x1000, 0x8E, -34, -48
	banim_frame_oam 0x0, 0x1000, 0xAF, -48, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_66_r:
	banim_frame_oam 0x0, 0x5000, 0xC8, -54, 10
	banim_frame_oam 0x4000, 0x1000, 0xA7, -46, 2
	banim_frame_oam 0x0, 0x1000, 0xA9, -54, 2
	banim_frame_oam 0x0, 0x1000, 0xC7, -38, 10
	banim_frame_oam 0x4000, 0x1000, 0x6B, -46, -6
	banim_frame_oam 0x8000, 0x5000, 0x6A, -30, -46
	banim_frame_oam 0x0, 0x1000, 0xE7, -30, -6
	banim_frame_oam 0x0, 0x5000, 0xB, -46, -30
	banim_frame_oam 0x4000, 0x1000, 0x4B, -46, -14
	banim_frame_oam 0x8000, 0x1000, 0xD, -54, -22
	banim_frame_oam 0x0, 0x1000, 0x4D, -54, -6
	banim_frame_oam 0x0, 0x1000, 0x8E, -40, -38
	banim_frame_oam 0x0, 0x1000, 0xAF, -54, -30
	banim_frame_end
banim_asnm_sw1_oam_frame_67_r:
	banim_frame_oam 0x8000, 0x8000, 0x80, -61, -8
	banim_frame_oam 0x8000, 0x4000, 0x82, -45, -8
	banim_frame_oam 0x8000, 0x0, 0x83, -69, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -63, -16
	banim_frame_oam 0x0, 0x0, 0x62, -47, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_68_r:
	banim_frame_oam 0x8000, 0x8000, 0x84, -61, -8
	banim_frame_oam 0x8000, 0x4000, 0x86, -45, -8
	banim_frame_oam 0x8000, 0x0, 0xC3, -69, 8
	banim_frame_oam 0x4000, 0x0, 0x63, -61, -16
	banim_frame_oam 0x0, 0x0, 0x65, -45, -16
	banim_frame_end
banim_asnm_sw1_oam_frame_69_r:
	banim_frame_oam 0x4000, 0x0, 0x28, -70, -32
	banim_frame_oam 0x0, 0x0, 0x2A, -54, -32
	banim_frame_oam 0x8000, 0x0, 0x27, -78, -40
	banim_frame_oam 0x4000, 0x0, 0x48, -62, -24
	banim_frame_oam 0x0, 0x0, 0x4A, -46, -24
	banim_frame_oam 0x0, 0x0, 0x68, -62, -16
	banim_frame_oam 0x8000, 0x0, 0x67, -46, -40
	banim_frame_oam 0x4000, 0x0, 0xB0, -70, -48
	banim_frame_oam 0x0, 0x0, 0xB2, -54, -48
	banim_frame_oam 0x4000, 0x0, 0x8, -70, -40
	banim_frame_oam 0x0, 0x0, 0xA, -54, -40
	banim_frame_end
banim_asnm_sw1_oam_frame_70_r:
	banim_frame_oam 0x4000, 0x0, 0x88, -67, -78
	banim_frame_oam 0x4000, 0x0, 0x28, -70, -60
	banim_frame_oam 0x0, 0x0, 0x2A, -54, -60
	banim_frame_oam 0x8000, 0x0, 0x27, -78, -68
	banim_frame_oam 0x4000, 0x0, 0x48, -62, -52
	banim_frame_oam 0x0, 0x0, 0x4A, -46, -52
	banim_frame_oam 0x0, 0x0, 0x68, -62, -44
	banim_frame_oam 0x8000, 0x0, 0x67, -46, -68
	banim_frame_oam 0x4000, 0x0, 0xB0, -70, -76
	banim_frame_oam 0x0, 0x0, 0xB2, -54, -76
	banim_frame_oam 0x4000, 0x0, 0x8, -70, -68
	banim_frame_oam 0x0, 0x0, 0xA, -54, -68
	banim_frame_oam 0x0, 0x0, 0x6E, -69, -14
	banim_frame_oam 0x4000, 0x4000, 0xEA, -93, -54
	banim_frame_oam 0x4000, 0x8000, 0xAB, -91, -70
	banim_frame_oam 0x4000, 0x0, 0x8B, -77, -78
	banim_frame_oam 0x0, 0x0, 0x8D, -61, -78
	banim_frame_oam 0x0, 0x0, 0x6D, -93, -46
	banim_frame_oam 0x4000, 0x0, 0x90, -85, -46
	banim_frame_oam 0x0, 0x0, 0x92, -69, -46
	banim_frame_oam 0x0, 0x4000, 0xE, -85, -38
	banim_frame_oam 0x8000, 0x0, 0x10, -69, -38
	banim_frame_oam 0x4000, 0x0, 0x4E, -85, -22
	banim_frame_oam 0x0, 0x0, 0x50, -69, -22
	banim_frame_end
banim_asnm_sw1_oam_frame_71_r:
	banim_frame_oam 0x4000, 0x0, 0x28, -70, -60
	banim_frame_oam 0x0, 0x0, 0x2A, -54, -60
	banim_frame_oam 0x8000, 0x0, 0x27, -78, -68
	banim_frame_oam 0x4000, 0x0, 0x48, -62, -52
	banim_frame_oam 0x0, 0x0, 0x4A, -46, -52
	banim_frame_oam 0x0, 0x0, 0x68, -62, -44
	banim_frame_oam 0x8000, 0x0, 0x67, -46, -68
	banim_frame_oam 0x4000, 0x0, 0xB0, -70, -76
	banim_frame_oam 0x0, 0x0, 0xB2, -54, -76
	banim_frame_oam 0x4000, 0x0, 0x8, -70, -68
	banim_frame_oam 0x0, 0x0, 0xA, -54, -68
	banim_frame_end
banim_asnm_sw1_oam_frame_72_r:
	banim_frame_oam 0x4000, 0x0, 0x28, -70, -64
	banim_frame_oam 0x0, 0x0, 0x2A, -54, -64
	banim_frame_oam 0x8000, 0x0, 0x27, -78, -72
	banim_frame_oam 0x4000, 0x0, 0x48, -62, -56
	banim_frame_oam 0x0, 0x0, 0x4A, -46, -56
	banim_frame_oam 0x0, 0x0, 0x68, -62, -48
	banim_frame_oam 0x8000, 0x0, 0x67, -46, -72
	banim_frame_oam 0x4000, 0x0, 0xB0, -70, -80
	banim_frame_oam 0x0, 0x0, 0xB2, -54, -80
	banim_frame_oam 0x4000, 0x0, 0x8, -70, -72
	banim_frame_oam 0x0, 0x0, 0xA, -54, -72
	banim_frame_end
banim_asnm_sw1_oam_frame_73_r:
	banim_frame_oam 0x4000, 0x0, 0x28, -70, -67
	banim_frame_oam 0x0, 0x0, 0x2A, -54, -67
	banim_frame_oam 0x8000, 0x0, 0x27, -78, -75
	banim_frame_oam 0x4000, 0x0, 0x48, -62, -59
	banim_frame_oam 0x0, 0x0, 0x4A, -46, -59
	banim_frame_oam 0x0, 0x0, 0x68, -62, -51
	banim_frame_oam 0x8000, 0x0, 0x67, -46, -75
	banim_frame_oam 0x4000, 0x0, 0xB0, -70, -83
	banim_frame_oam 0x0, 0x0, 0xB2, -54, -83
	banim_frame_oam 0x4000, 0x0, 0x8, -70, -75
	banim_frame_oam 0x0, 0x0, 0xA, -54, -75
	banim_frame_end
	.section .data.script
banim_asnm_sw1_script:
banim_asnm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 1, banim_asnm_sw1_oam_frame_1_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 2, banim_asnm_sw1_oam_frame_2_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 3, banim_asnm_sw1_oam_frame_3_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 4, banim_asnm_sw1_oam_frame_4_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_oam_frame_7_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_oam_frame_7_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_oam_frame_7_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 8, banim_asnm_sw1_oam_frame_8_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 9, banim_asnm_sw1_oam_frame_9_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 10, banim_asnm_sw1_oam_frame_10_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 12, banim_asnm_sw1_oam_frame_11_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 14, banim_asnm_sw1_oam_frame_12_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 16, banim_asnm_sw1_oam_frame_13_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 17, banim_asnm_sw1_oam_frame_14_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 18, banim_asnm_sw1_oam_frame_15_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 19, banim_asnm_sw1_oam_frame_16_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 20, banim_asnm_sw1_oam_frame_17_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 21, banim_asnm_sw1_oam_frame_18_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 22, banim_asnm_sw1_oam_frame_19_r - banim_asnm_sw1_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_oam_frame_20_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_oam_frame_21_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_oam_frame_22_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_oam_frame_23_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_oam_frame_24_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_oam_frame_25_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_oam_frame_26_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_oam_frame_27_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_oam_frame_28_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_oam_frame_29_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_oam_frame_30_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_oam_frame_31_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_oam_frame_32_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_oam_frame_33_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_oam_frame_34_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_oam_frame_35_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_oam_frame_36_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_oam_frame_38_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_oam_frame_39_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 13, banim_asnm_sw1_oam_frame_41_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 15, banim_asnm_sw1_oam_frame_42_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_effect_instant_kill_1
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 48, banim_asnm_sw1_oam_frame_45_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 49, banim_asnm_sw1_oam_frame_46_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_3, 50, banim_asnm_sw1_oam_frame_47_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 51, banim_asnm_sw1_oam_frame_48_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 52, banim_asnm_sw1_oam_frame_49_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 53, banim_asnm_sw1_oam_frame_50_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_3, 54, banim_asnm_sw1_oam_frame_51_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 55, banim_asnm_sw1_oam_frame_52_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 56, banim_asnm_sw1_oam_frame_53_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 57, banim_asnm_sw1_oam_frame_54_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 58, banim_asnm_sw1_oam_frame_55_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 59, banim_asnm_sw1_oam_frame_56_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 60, banim_asnm_sw1_oam_frame_57_r - banim_asnm_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 61, banim_asnm_sw1_oam_frame_58_r - banim_asnm_sw1_oam_r
	banim_code_frame 11, banim_asnm_sw1_sheet_3, 62, banim_asnm_sw1_oam_frame_59_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 63, banim_asnm_sw1_oam_frame_60_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_oam_frame_61_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_oam_frame_61_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_oam_frame_61_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 75, banim_asnm_sw1_oam_frame_62_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 76, banim_asnm_sw1_oam_frame_63_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 77, banim_asnm_sw1_oam_frame_64_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 78, banim_asnm_sw1_oam_frame_65_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 79, banim_asnm_sw1_oam_frame_66_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 6, banim_asnm_sw1_sheet_1, 80, banim_asnm_sw1_oam_frame_67_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_1, 81, banim_asnm_sw1_oam_frame_68_r - banim_asnm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 82, banim_asnm_sw1_oam_frame_69_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 83, banim_asnm_sw1_oam_frame_70_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 84, banim_asnm_sw1_oam_frame_71_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 85, banim_asnm_sw1_oam_frame_72_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 86, banim_asnm_sw1_oam_frame_73_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_oam_frame_20_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_oam_frame_20_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_oam_frame_20_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_oam_frame_21_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_oam_frame_22_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_oam_frame_23_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_oam_frame_24_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_oam_frame_25_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_oam_frame_26_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_oam_frame_27_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_oam_frame_28_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_oam_frame_29_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_oam_frame_30_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_oam_frame_31_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_oam_frame_32_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_oam_frame_33_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_oam_frame_34_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_oam_frame_35_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_oam_frame_36_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_oam_frame_38_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_oam_frame_39_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_effect_instant_kill_1
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 11, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 6, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_oam_frame_40_r - banim_asnm_sw1_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_oam_frame_43_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_oam_frame_44_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 66, banim_asnm_sw1_oam_frame_74_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_oam_frame_75_r - banim_asnm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 68, banim_asnm_sw1_oam_frame_76_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_oam_frame_75_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 71, banim_asnm_sw1_oam_frame_78_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 66, banim_asnm_sw1_oam_frame_74_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_oam_frame_75_r - banim_asnm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 68, banim_asnm_sw1_oam_frame_76_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_oam_frame_79_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_oam_frame_79_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_oam_frame_79_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_oam_frame_79_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_oam_frame_79_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_oam_frame_77_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_oam_frame_75_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 71, banim_asnm_sw1_oam_frame_78_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_oam_frame_80_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 65, banim_asnm_sw1_oam_frame_81_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_oam_frame_80_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_oam_frame_80_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 65, banim_asnm_sw1_oam_frame_81_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_oam_frame_80_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_mode_stand_close:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_mode_stand:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_mode_stand_range:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_oam_frame_0_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 1, banim_asnm_sw1_oam_frame_1_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 2, banim_asnm_sw1_oam_frame_2_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 3, banim_asnm_sw1_oam_frame_3_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 4, banim_asnm_sw1_oam_frame_4_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_oam_frame_5_r - banim_asnm_sw1_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_oam_frame_82_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_oam_frame_82_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_oam_frame_6_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_oam_frame_82_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_oam_frame_7_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 8, banim_asnm_sw1_oam_frame_8_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 9, banim_asnm_sw1_oam_frame_9_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 10, banim_asnm_sw1_oam_frame_10_r - banim_asnm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 72, banim_asnm_sw1_oam_frame_83_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 73, banim_asnm_sw1_oam_frame_84_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 16, banim_asnm_sw1_oam_frame_13_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 17, banim_asnm_sw1_oam_frame_14_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 18, banim_asnm_sw1_oam_frame_15_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 19, banim_asnm_sw1_oam_frame_16_r - banim_asnm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 20, banim_asnm_sw1_oam_frame_17_r - banim_asnm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 21, banim_asnm_sw1_oam_frame_18_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 22, banim_asnm_sw1_oam_frame_19_r - banim_asnm_sw1_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_oam_frame_20_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_oam_frame_21_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_oam_frame_22_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_oam_frame_23_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_oam_frame_24_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_oam_frame_25_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_oam_frame_26_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_oam_frame_27_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_oam_frame_28_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_oam_frame_29_r - banim_asnm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_oam_frame_30_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_oam_frame_31_r - banim_asnm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_oam_frame_32_r - banim_asnm_sw1_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_oam_frame_33_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_oam_frame_34_r - banim_asnm_sw1_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_oam_frame_35_r - banim_asnm_sw1_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_oam_frame_36_r - banim_asnm_sw1_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_oam_frame_37_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_oam_frame_38_r - banim_asnm_sw1_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_oam_frame_39_r - banim_asnm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_asnm_sw1_mode_attack_close - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_close_back - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_close_critical - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_close_critical_back - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_range - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_range_critical - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_dodge_close - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_dodge_range - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_stand_close - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_stand - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_stand_range - banim_asnm_sw1_script
	.word banim_asnm_sw1_mode_attack_miss - banim_asnm_sw1_script
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

