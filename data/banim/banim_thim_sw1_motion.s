@ vim:ft=armv4
	.global banim_thim_sw1_script
	.global banim_thim_sw1_oam_r
	.global banim_thim_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x88
	.section .data.oam_l
banim_thim_sw1_oam_l:
banim_thim_sw1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x62, -16, 0
	banim_frame_end
banim_thim_sw1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x43, 6, 8
	banim_frame_end
banim_thim_sw1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x8, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x4, -10, -24
	banim_frame_end
banim_thim_sw1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xA5, -7, -16
	banim_frame_oam 0x4000, 0x1000, 0xE5, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0xA7, -15, -8
	banim_frame_oam 0x0, 0x1000, 0xA8, -23, -8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -15, 8
	banim_frame_oam 0x4000, 0x1000, 0x4, -10, -24
	banim_frame_end
banim_thim_sw1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0x9, -21, -16
	banim_frame_oam 0x0, 0x5000, 0x48, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0x4A, -13, 0
	banim_frame_end
banim_thim_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x4B, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x8C, 32, -8
	banim_frame_oam 0x0, 0x5000, 0xAA, 32, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, 56, -23
	banim_frame_oam 0x4000, 0x9000, 0xD, 8, -24
	banim_frame_oam 0x4000, 0x9000, 0x4D, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0x8D, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, 8, 8
	banim_frame_oam 0x4000, 0x5000, 0xEA, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xC8, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, 0, -24
	banim_frame_end
banim_thim_sw1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x1000, 0xAF, 48, -16
	banim_frame_oam 0x8000, 0x1000, 0x90, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, 40, 0
	banim_frame_oam 0x0, 0x5000, 0x11, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x51, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xF0, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xCD, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_end
banim_thim_sw1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x71, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xB2, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xB4, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_oam 0x0, 0x1000, 0x16, 41, -24
	banim_frame_end
banim_thim_sw1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x33, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, 40, -24
	banim_frame_oam 0x0, 0x1000, 0x15, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xD4, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xD6, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_end
banim_thim_sw1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x17, 30, -16
	banim_frame_oam 0x8000, 0x1000, 0x1B, 22, -16
	banim_frame_oam 0x4000, 0x1000, 0x59, 30, 0
	banim_frame_oam 0x0, 0x1000, 0x5B, 22, 0
	banim_frame_oam 0x4000, 0x1000, 0x77, 38, -24
	banim_frame_oam 0x4000, 0x1000, 0xB5, 38, 8
	banim_frame_oam 0x4000, 0x1000, 0x57, 22, 8
	banim_frame_end
banim_thim_sw1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0x97, 21, -16
	banim_frame_oam 0x4000, 0x1000, 0xD7, 29, 0
	banim_frame_oam 0x0, 0x1000, 0xD9, 13, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, 29, 8
	banim_frame_oam 0x4000, 0x1000, 0xAC, 31, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 23, 8
	banim_frame_end
banim_thim_sw1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x9000, 0x3C, 21, -8
	banim_frame_oam 0x4000, 0x1000, 0x1C, 37, -16
	banim_frame_oam 0x0, 0x1000, 0x1E, 29, -16
	banim_frame_oam 0x4000, 0x1000, 0x79, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x7B, 21, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, 13, -5
	banim_frame_end
banim_thim_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0x9B, 29, -8
	banim_frame_oam 0x8000, 0x1000, 0x9D, 21, -8
	banim_frame_oam 0x4000, 0x1000, 0xDB, 29, 8
	banim_frame_oam 0x0, 0x1000, 0xDD, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, 13, -8
	banim_frame_oam 0x8000, 0x1000, 0x7F, 45, -8
	banim_frame_oam 0x0, 0x1000, 0x16, 31, -16
	banim_frame_end
banim_thim_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 28, -8
	banim_frame_oam 0x8000, 0x1000, 0x2, 20, -8
	banim_frame_oam 0x4000, 0x1000, 0x40, 28, 8
	banim_frame_oam 0x0, 0x1000, 0x42, 20, 8
	banim_frame_oam 0x8000, 0x1000, 0x3, 44, -8
	banim_frame_end
banim_thim_sw1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x4, 29, -8
	banim_frame_oam 0x8000, 0x1000, 0x6, 21, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x46, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x43, 45, 0
	banim_frame_end
banim_thim_sw1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0x64, 30, 0
	banim_frame_oam 0x8000, 0x1000, 0x66, 22, 0
	banim_frame_oam 0x0, 0x5000, 0x82, 22, -16
	banim_frame_end
banim_thim_sw1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 5, -15
	banim_frame_oam 0x4000, 0x1000, 0x48, 5, 1
	banim_frame_oam 0x8000, 0x1000, 0x27, 21, -7
	banim_frame_oam 0x8000, 0x1000, 0x67, 29, 1
	banim_frame_oam 0x0, 0x1000, 0x7, 19, 8
	banim_frame_oam 0x0, 0x0, 0x7, 11, 8
	banim_frame_end
banim_thim_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x68, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x6A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xAA, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xA7, 5, -24
	banim_frame_oam 0x0, 0x1000, 0x7, 3, 8
	banim_frame_oam 0x0, 0x0, 0x7, -5, 8
	banim_frame_end
banim_thim_sw1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0xA, -6, -18
	banim_frame_oam 0x4000, 0x1000, 0x4A, -6, -2
	banim_frame_oam 0x4000, 0x1000, 0x6B, -6, 6
	banim_frame_oam 0x0, 0x1000, 0xE7, 10, -2
	banim_frame_oam 0x0, 0x1000, 0x7, 0, 8
	banim_frame_oam 0x0, 0x0, 0x7, -8, 8
	banim_frame_end
banim_thim_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xC, -11, -16
	banim_frame_oam 0x4000, 0x1000, 0x4C, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x6D, 5, 0
	banim_frame_oam 0x4000, 0x1000, 0x8B, -11, 8
	banim_frame_end
banim_thim_sw1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0xE, -13, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, 3, 0
	banim_frame_oam 0x0, 0x1000, 0xA7, -6, -24
	banim_frame_end
banim_thim_sw1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x60, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xDE, -16, 0
	banim_frame_end
banim_thim_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xAE, -5, -24
	banim_frame_oam 0x0, 0x5000, 0x50, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xAF, -16, 8
	banim_frame_end
banim_thim_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x91, -9, -16
	banim_frame_oam 0x4000, 0x1000, 0xD0, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xD2, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -7, -24
	banim_frame_end
banim_thim_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x13, -10, -16
	banim_frame_oam 0x0, 0x5000, 0xD3, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xF2, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xAE, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xAF, -16, 8
	banim_frame_end
banim_thim_sw1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x15, -9, -16
	banim_frame_oam 0x4000, 0x1000, 0x54, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x56, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x74, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xAF, -16, 8
	banim_frame_end
banim_thim_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x17, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x57, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x19, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x76, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -3, -24
	banim_frame_oam 0x0, 0x1000, 0xAF, -16, 8
	banim_frame_end
banim_thim_sw1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x78, -15, -8
	banim_frame_oam 0x0, 0x5000, 0x59, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x5B, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xAE, -1, -24
	banim_frame_end
banim_thim_sw1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0x1, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x42, 32, 0
	banim_frame_oam 0x0, 0x1000, 0x44, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x5, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x20, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 34, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, 18, 8
	banim_frame_end
banim_thim_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -9, -16
	banim_frame_oam 0x8000, 0x9000, 0x9A, -25, -8
	banim_frame_oam 0x8000, 0x5000, 0x9C, -33, -8
	banim_frame_oam 0x8000, 0x1000, 0x9D, -41, 0
	banim_frame_oam 0x0, 0x1000, 0xDD, -41, 16
	banim_frame_oam 0x0, 0x1000, 0xD9, -49, 7
	banim_frame_oam 0x0, 0x1000, 0xD8, -17, -16
	banim_frame_oam 0x0, 0x1000, 0xF8, -1, -24
	banim_frame_end
banim_thim_sw1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0x9000, 0x80, -25, -7
	banim_frame_oam 0x8000, 0x5000, 0x82, -33, -7
	banim_frame_oam 0x8000, 0x1000, 0x63, -41, 1
	banim_frame_oam 0x0, 0x1000, 0xA3, -41, 17
	banim_frame_oam 0x0, 0x1000, 0x62, -49, 4
	banim_frame_end
banim_thim_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x46, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -13, 0
	banim_frame_oam 0x0, 0x5000, 0x7, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x9, -13, -16
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -12
	banim_frame_end
banim_thim_sw1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0xC3, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0xC5, -13, -16
	banim_frame_oam 0x0, 0x5000, 0xC6, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -13, 0
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -12
	banim_frame_end
banim_thim_sw1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0x49, -5, -16
	banim_frame_oam 0x0, 0x5000, 0x88, -5, 0
	banim_frame_oam 0x8000, 0x1000, 0x8A, -13, 0
	banim_frame_oam 0x0, 0x5000, 0xA, -21, -16
	banim_frame_end
banim_thim_sw1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xC, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x4B, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -8
	banim_frame_end
banim_thim_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCD, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xEE, -2, -24
	banim_frame_end
banim_thim_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_thim_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_thim_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0xCC, 56, -12
	banim_frame_end
banim_thim_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x0, 56, -10
	banim_frame_end
banim_thim_sw1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x1000, 0xAF, 48, -16
	banim_frame_oam 0x8000, 0x1000, 0x90, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, 40, 0
	banim_frame_oam 0x0, 0x5000, 0x11, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x51, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xF0, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xCD, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, 56, -12
	banim_frame_end
banim_thim_sw1_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x9000, 0x71, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xB2, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xB4, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_oam 0x0, 0x1000, 0x16, 41, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 56, -12
	banim_frame_end
banim_thim_sw1_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x9000, 0x33, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, 40, -24
	banim_frame_oam 0x0, 0x1000, 0x15, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xD4, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xD6, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xAC, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, 56, -12
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
banim_thim_sw1_oam_r:
banim_thim_sw1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x62, 8, 0
	banim_frame_end
banim_thim_sw1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -6, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -6, 8
	banim_frame_oam 0x0, 0x0, 0x43, -14, 8
	banim_frame_end
banim_thim_sw1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x8, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x4, -6, -24
	banim_frame_end
banim_thim_sw1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xA5, -9, -16
	banim_frame_oam 0x4000, 0x0, 0xE5, -9, 0
	banim_frame_oam 0x8000, 0x0, 0xA7, 7, -8
	banim_frame_oam 0x0, 0x0, 0xA8, 15, -8
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 7, 8
	banim_frame_oam 0x4000, 0x0, 0x4, -6, -24
	banim_frame_end
banim_thim_sw1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0x9, -11, -16
	banim_frame_oam 0x0, 0x4000, 0x48, -11, 0
	banim_frame_oam 0x8000, 0x0, 0x4A, 5, 0
	banim_frame_end
banim_thim_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x4B, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -56, -8
	banim_frame_oam 0x0, 0x0, 0x8C, -40, -8
	banim_frame_oam 0x0, 0x4000, 0xAA, -48, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, -64, -23
	banim_frame_oam 0x4000, 0x8000, 0xD, -40, -24
	banim_frame_oam 0x4000, 0x8000, 0x4D, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x8D, -32, 8
	banim_frame_oam 0x0, 0x0, 0x8F, -16, 8
	banim_frame_oam 0x4000, 0x4000, 0xEA, -48, -32
	banim_frame_oam 0x0, 0x0, 0xEE, -16, -32
	banim_frame_oam 0x0, 0x0, 0xC8, 0, -24
	banim_frame_oam 0x0, 0x0, 0xEF, -8, -24
	banim_frame_end
banim_thim_sw1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x0, 0xAF, -56, -16
	banim_frame_oam 0x8000, 0x0, 0x90, -48, -16
	banim_frame_oam 0x0, 0x0, 0xD0, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x11, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x51, -40, 0
	banim_frame_oam 0x0, 0x0, 0xF0, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xCD, -48, -24
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_end
banim_thim_sw1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x71, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xB2, -48, 0
	banim_frame_oam 0x0, 0x0, 0xB4, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_oam 0x0, 0x0, 0x16, -49, -24
	banim_frame_end
banim_thim_sw1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x33, -56, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -56, -24
	banim_frame_oam 0x0, 0x0, 0x15, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xD4, -48, 0
	banim_frame_oam 0x0, 0x0, 0xD6, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_end
banim_thim_sw1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x17, -62, -16
	banim_frame_oam 0x8000, 0x0, 0x1B, -30, -16
	banim_frame_oam 0x4000, 0x0, 0x59, -46, 0
	banim_frame_oam 0x0, 0x0, 0x5B, -30, 0
	banim_frame_oam 0x4000, 0x0, 0x77, -54, -24
	banim_frame_oam 0x4000, 0x0, 0xB5, -54, 8
	banim_frame_oam 0x4000, 0x0, 0x57, -38, 8
	banim_frame_end
banim_thim_sw1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0x97, -53, -16
	banim_frame_oam 0x4000, 0x0, 0xD7, -45, 0
	banim_frame_oam 0x0, 0x0, 0xD9, -21, -8
	banim_frame_oam 0x0, 0x0, 0xF8, -37, 8
	banim_frame_oam 0x4000, 0x0, 0xAC, -47, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -31, 8
	banim_frame_end
banim_thim_sw1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x8000, 0x3C, -53, -8
	banim_frame_oam 0x4000, 0x0, 0x1C, -53, -16
	banim_frame_oam 0x0, 0x0, 0x1E, -37, -16
	banim_frame_oam 0x4000, 0x0, 0x79, -45, 8
	banim_frame_oam 0x0, 0x0, 0x7B, -29, 8
	banim_frame_oam 0x0, 0x0, 0xD9, -21, -5
	banim_frame_end
banim_thim_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0x9B, -45, -8
	banim_frame_oam 0x8000, 0x0, 0x9D, -29, -8
	banim_frame_oam 0x4000, 0x0, 0xDB, -45, 8
	banim_frame_oam 0x0, 0x0, 0xDD, -29, 8
	banim_frame_oam 0x0, 0x0, 0x9E, -21, -8
	banim_frame_oam 0x8000, 0x0, 0x7F, -53, -8
	banim_frame_oam 0x0, 0x0, 0x16, -39, -16
	banim_frame_end
banim_thim_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -44, -8
	banim_frame_oam 0x8000, 0x0, 0x2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0x40, -44, 8
	banim_frame_oam 0x0, 0x0, 0x42, -28, 8
	banim_frame_oam 0x8000, 0x0, 0x3, -52, -8
	banim_frame_end
banim_thim_sw1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x4, -45, -8
	banim_frame_oam 0x8000, 0x0, 0x6, -29, -8
	banim_frame_oam 0x4000, 0x0, 0x44, -45, 8
	banim_frame_oam 0x0, 0x0, 0x46, -29, 8
	banim_frame_oam 0x0, 0x0, 0x43, -53, 0
	banim_frame_end
banim_thim_sw1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0x64, -46, 0
	banim_frame_oam 0x8000, 0x0, 0x66, -30, 0
	banim_frame_oam 0x0, 0x4000, 0x82, -38, -16
	banim_frame_end
banim_thim_sw1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -21, -15
	banim_frame_oam 0x4000, 0x0, 0x48, -21, 1
	banim_frame_oam 0x8000, 0x0, 0x27, -29, -7
	banim_frame_oam 0x8000, 0x0, 0x67, -37, 1
	banim_frame_oam 0x0, 0x0, 0x7, -27, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -19, 8
	banim_frame_end
banim_thim_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x68, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x6A, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -16, 0
	banim_frame_oam 0x0, 0x0, 0xAA, 0, 0
	banim_frame_oam 0x0, 0x0, 0xA7, -13, -24
	banim_frame_oam 0x0, 0x0, 0x7, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -3, 8
	banim_frame_end
banim_thim_sw1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0xA, -10, -18
	banim_frame_oam 0x4000, 0x0, 0x4A, -10, -2
	banim_frame_oam 0x4000, 0x0, 0x6B, -10, 6
	banim_frame_oam 0x0, 0x0, 0xE7, -18, -2
	banim_frame_oam 0x0, 0x0, 0x7, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x7, 0, 8
	banim_frame_end
banim_thim_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -5, -16
	banim_frame_oam 0x4000, 0x0, 0x4C, -5, 0
	banim_frame_oam 0x8000, 0x0, 0x6D, -13, 0
	banim_frame_oam 0x4000, 0x0, 0x8B, -5, 8
	banim_frame_end
banim_thim_sw1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0xE, -3, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -11, 0
	banim_frame_oam 0x0, 0x0, 0xA7, -2, -24
	banim_frame_end
banim_thim_sw1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x60, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xDE, 0, 0
	banim_frame_end
banim_thim_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -8, -16
	banim_frame_oam 0x0, 0x0, 0xAE, -3, -24
	banim_frame_oam 0x0, 0x4000, 0x50, -8, 0
	banim_frame_oam 0x0, 0x0, 0xAF, 8, 8
	banim_frame_end
banim_thim_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0xAF, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x91, -7, -16
	banim_frame_oam 0x4000, 0x0, 0xD0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD2, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xF0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -1, -24
	banim_frame_end
banim_thim_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x13, -6, -16
	banim_frame_oam 0x0, 0x4000, 0xD3, -8, 0
	banim_frame_oam 0x0, 0x0, 0xF2, 8, 0
	banim_frame_oam 0x0, 0x0, 0xAE, -1, -24
	banim_frame_oam 0x0, 0x0, 0xAF, 8, 8
	banim_frame_end
banim_thim_sw1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -7, -16
	banim_frame_oam 0x4000, 0x0, 0x54, -8, 0
	banim_frame_oam 0x0, 0x0, 0x56, 8, 0
	banim_frame_oam 0x4000, 0x0, 0x74, -8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -4, -24
	banim_frame_oam 0x0, 0x0, 0xAF, 8, 8
	banim_frame_end
banim_thim_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x17, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x57, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x19, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x76, -8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -5, -24
	banim_frame_oam 0x0, 0x0, 0xAF, 8, 8
	banim_frame_end
banim_thim_sw1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -9, -16
	banim_frame_oam 0x0, 0x0, 0x78, 7, -8
	banim_frame_oam 0x0, 0x4000, 0x59, -9, 0
	banim_frame_oam 0x8000, 0x0, 0x5B, 7, 0
	banim_frame_oam 0x0, 0x0, 0xAE, -7, -24
	banim_frame_end
banim_thim_sw1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0x1, -56, -16
	banim_frame_oam 0x4000, 0x0, 0x42, -48, 0
	banim_frame_oam 0x0, 0x0, 0x44, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x5, -24, -8
	banim_frame_oam 0x0, 0x0, 0x20, -48, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -50, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -34, 8
	banim_frame_end
banim_thim_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -7, -16
	banim_frame_oam 0x8000, 0x8000, 0x9A, 9, -8
	banim_frame_oam 0x8000, 0x4000, 0x9C, 25, -8
	banim_frame_oam 0x8000, 0x0, 0x9D, 33, 0
	banim_frame_oam 0x0, 0x0, 0xDD, 33, 16
	banim_frame_oam 0x0, 0x0, 0xD9, 41, 7
	banim_frame_oam 0x0, 0x0, 0xD8, 9, -16
	banim_frame_oam 0x0, 0x0, 0xF8, -7, -24
	banim_frame_end
banim_thim_sw1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0x8000, 0x80, 9, -7
	banim_frame_oam 0x8000, 0x4000, 0x82, 25, -7
	banim_frame_oam 0x8000, 0x0, 0x63, 33, 1
	banim_frame_oam 0x0, 0x0, 0xA3, 33, 17
	banim_frame_oam 0x0, 0x0, 0x62, 41, 4
	banim_frame_end
banim_thim_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x46, -11, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 5, 0
	banim_frame_oam 0x0, 0x4000, 0x7, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x9, 5, -16
	banim_frame_oam 0x0, 0x0, 0x45, 13, -12
	banim_frame_end
banim_thim_sw1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0xC3, -11, -16
	banim_frame_oam 0x8000, 0x0, 0xC5, 5, -16
	banim_frame_oam 0x0, 0x4000, 0xC6, -11, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 5, 0
	banim_frame_oam 0x0, 0x0, 0x45, 13, -12
	banim_frame_end
banim_thim_sw1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0x49, -11, -16
	banim_frame_oam 0x0, 0x4000, 0x88, -11, 0
	banim_frame_oam 0x8000, 0x0, 0x8A, 5, 0
	banim_frame_oam 0x0, 0x4000, 0xA, 5, -16
	banim_frame_end
banim_thim_sw1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x4B, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, 8, 0
	banim_frame_oam 0x0, 0x0, 0xE, 8, -8
	banim_frame_end
banim_thim_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCD, 8, 0
	banim_frame_oam 0x0, 0x0, 0xEE, -6, -24
	banim_frame_end
banim_thim_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_thim_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_thim_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0xCC, -64, -12
	banim_frame_end
banim_thim_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x0, -64, -10
	banim_frame_end
banim_thim_sw1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x0, 0xAF, -56, -16
	banim_frame_oam 0x8000, 0x0, 0x90, -48, -16
	banim_frame_oam 0x0, 0x0, 0xD0, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x11, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x51, -40, 0
	banim_frame_oam 0x0, 0x0, 0xF0, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xCD, -48, -24
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_oam 0x0, 0x0, 0xCC, -64, -12
	banim_frame_end
banim_thim_sw1_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x8000, 0x71, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xB2, -48, 0
	banim_frame_oam 0x0, 0x0, 0xB4, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_oam 0x0, 0x0, 0x16, -49, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -64, -12
	banim_frame_end
banim_thim_sw1_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x8000, 0x33, -56, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -56, -24
	banim_frame_oam 0x0, 0x0, 0x15, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xD4, -48, 0
	banim_frame_oam 0x0, 0x0, 0xD6, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xAC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -32, 8
	banim_frame_oam 0x0, 0x0, 0xCC, -64, -12
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
banim_thim_sw1_script:
banim_thim_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 1, banim_thim_sw1_oam_frame_1_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 2, banim_thim_sw1_oam_frame_2_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_0, 3, banim_thim_sw1_oam_frame_3_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 4, banim_thim_sw1_oam_frame_4_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_thim_sw1_sheet_0, 5, banim_thim_sw1_oam_frame_5_r - banim_thim_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_thim_sw1_sheet_0, 6, banim_thim_sw1_oam_frame_6_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_thim_sw1_sheet_0, 7, banim_thim_sw1_oam_frame_7_r - banim_thim_sw1_oam_r
	banim_code_frame 9, banim_thim_sw1_sheet_0, 8, banim_thim_sw1_oam_frame_8_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_thim_sw1_sheet_0, 9, banim_thim_sw1_oam_frame_9_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 10, banim_thim_sw1_oam_frame_10_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_0, 11, banim_thim_sw1_oam_frame_11_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 12, banim_thim_sw1_oam_frame_12_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 13, banim_thim_sw1_oam_frame_13_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 14, banim_thim_sw1_oam_frame_14_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 15, banim_thim_sw1_oam_frame_15_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 16, banim_thim_sw1_oam_frame_16_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 17, banim_thim_sw1_oam_frame_17_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_1, 18, banim_thim_sw1_oam_frame_18_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 19, banim_thim_sw1_oam_frame_19_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_0, 21, banim_thim_sw1_oam_frame_21_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_frame 9, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 22, banim_thim_sw1_oam_frame_25_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_1, 23, banim_thim_sw1_oam_frame_26_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_1, 24, banim_thim_sw1_oam_frame_27_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 25, banim_thim_sw1_oam_frame_28_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 26, banim_thim_sw1_oam_frame_29_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 27, banim_thim_sw1_oam_frame_30_r - banim_thim_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_thim_sw1_sheet_2, 28, banim_thim_sw1_oam_frame_31_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_thim_sw1_sheet_0, 6, banim_thim_sw1_oam_frame_6_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 9, banim_thim_sw1_oam_frame_9_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_0, 10, banim_thim_sw1_oam_frame_10_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_thim_sw1_sheet_0, 6, banim_thim_sw1_oam_frame_6_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 9, banim_thim_sw1_oam_frame_9_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_0, 10, banim_thim_sw1_oam_frame_10_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 6, banim_thim_sw1_oam_frame_6_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_thim_sw1_sheet_0, 7, banim_thim_sw1_oam_frame_7_r - banim_thim_sw1_oam_r
	banim_code_frame 9, banim_thim_sw1_sheet_0, 8, banim_thim_sw1_oam_frame_8_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_thim_sw1_sheet_0, 9, banim_thim_sw1_oam_frame_9_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 10, banim_thim_sw1_oam_frame_10_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_0, 11, banim_thim_sw1_oam_frame_11_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 12, banim_thim_sw1_oam_frame_12_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 13, banim_thim_sw1_oam_frame_13_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 14, banim_thim_sw1_oam_frame_14_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 15, banim_thim_sw1_oam_frame_15_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 16, banim_thim_sw1_oam_frame_16_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 17, banim_thim_sw1_oam_frame_17_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_1, 18, banim_thim_sw1_oam_frame_18_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 19, banim_thim_sw1_oam_frame_19_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_0, 21, banim_thim_sw1_oam_frame_21_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_thim_sw1_sheet_2, 41, banim_thim_sw1_oam_frame_32_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 5, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_frame 9, banim_thim_sw1_sheet_0, 40, banim_thim_sw1_oam_frame_23_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_1, 37, banim_thim_sw1_oam_frame_24_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_0, 36, banim_thim_sw1_oam_frame_22_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 1, banim_thim_sw1_oam_frame_1_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 2, banim_thim_sw1_oam_frame_2_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 3, banim_thim_sw1_oam_frame_3_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 4, banim_thim_sw1_oam_frame_4_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_2, 31, banim_thim_sw1_oam_frame_33_r - banim_thim_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_thim_sw1_sheet_2, 34, banim_thim_sw1_oam_frame_35_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_2, 35, banim_thim_sw1_oam_frame_36_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 1, banim_thim_sw1_oam_frame_1_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 2, banim_thim_sw1_oam_frame_2_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 3, banim_thim_sw1_oam_frame_3_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 4, banim_thim_sw1_oam_frame_4_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_2, 31, banim_thim_sw1_oam_frame_33_r - banim_thim_sw1_oam_r
	banim_code_frame 2, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_frame 2, banim_thim_sw1_sheet_2, 33, banim_thim_sw1_oam_frame_37_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 33, banim_thim_sw1_oam_frame_37_r - banim_thim_sw1_oam_r
	banim_code_frame 2, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_frame 2, banim_thim_sw1_sheet_2, 33, banim_thim_sw1_oam_frame_37_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_frame 2, banim_thim_sw1_sheet_2, 33, banim_thim_sw1_oam_frame_37_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 33, banim_thim_sw1_oam_frame_37_r - banim_thim_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_thim_sw1_sheet_2, 32, banim_thim_sw1_oam_frame_34_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_thim_sw1_sheet_2, 34, banim_thim_sw1_oam_frame_35_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_2, 35, banim_thim_sw1_oam_frame_36_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_thim_sw1_sheet_1, 29, banim_thim_sw1_oam_frame_38_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 30, banim_thim_sw1_oam_frame_39_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_thim_sw1_sheet_1, 29, banim_thim_sw1_oam_frame_38_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_thim_sw1_sheet_1, 29, banim_thim_sw1_oam_frame_38_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 30, banim_thim_sw1_oam_frame_39_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_thim_sw1_sheet_1, 29, banim_thim_sw1_oam_frame_38_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_mode_stand_close:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_mode_stand:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_mode_stand_range:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_oam_frame_0_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 1, banim_thim_sw1_oam_frame_1_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 2, banim_thim_sw1_oam_frame_2_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_0, 3, banim_thim_sw1_oam_frame_3_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 4, banim_thim_sw1_oam_frame_4_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_thim_sw1_sheet_0, 5, banim_thim_sw1_oam_frame_5_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_0, 42, banim_thim_sw1_oam_frame_40_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 43, banim_thim_sw1_oam_frame_41_r - banim_thim_sw1_oam_r
	banim_code_frame 9, banim_thim_sw1_sheet_0, 44, banim_thim_sw1_oam_frame_42_r - banim_thim_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_thim_sw1_sheet_0, 9, banim_thim_sw1_oam_frame_9_r - banim_thim_sw1_oam_r
	banim_code_frame 8, banim_thim_sw1_sheet_0, 10, banim_thim_sw1_oam_frame_10_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_0, 11, banim_thim_sw1_oam_frame_11_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_0, 12, banim_thim_sw1_oam_frame_12_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 13, banim_thim_sw1_oam_frame_13_r - banim_thim_sw1_oam_r
	banim_code_frame 6, banim_thim_sw1_sheet_1, 14, banim_thim_sw1_oam_frame_14_r - banim_thim_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_thim_sw1_sheet_1, 15, banim_thim_sw1_oam_frame_15_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_1, 16, banim_thim_sw1_oam_frame_16_r - banim_thim_sw1_oam_r
	banim_code_frame 4, banim_thim_sw1_sheet_1, 17, banim_thim_sw1_oam_frame_17_r - banim_thim_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 4, banim_thim_sw1_sheet_1, 18, banim_thim_sw1_oam_frame_18_r - banim_thim_sw1_oam_r
	banim_code_frame 7, banim_thim_sw1_sheet_1, 19, banim_thim_sw1_oam_frame_19_r - banim_thim_sw1_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_thim_sw1_sheet_1, 20, banim_thim_sw1_oam_frame_20_r - banim_thim_sw1_oam_r
	banim_code_frame 3, banim_thim_sw1_sheet_0, 21, banim_thim_sw1_oam_frame_21_r - banim_thim_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_thim_sw1_mode_attack_close - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_close_back - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_close_critical - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_close_critical_back - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_range - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_range_critical - banim_thim_sw1_script
	.word banim_thim_sw1_mode_dodge_close - banim_thim_sw1_script
	.word banim_thim_sw1_mode_dodge_range - banim_thim_sw1_script
	.word banim_thim_sw1_mode_stand_close - banim_thim_sw1_script
	.word banim_thim_sw1_mode_stand - banim_thim_sw1_script
	.word banim_thim_sw1_mode_stand_range - banim_thim_sw1_script
	.word banim_thim_sw1_mode_attack_miss - banim_thim_sw1_script
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

