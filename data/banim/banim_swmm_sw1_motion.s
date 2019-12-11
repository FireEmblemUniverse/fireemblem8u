@ vim:ft=armv4
	.global banim_swmm_sw1_script
	.global banim_swmm_sw1_oam_r
	.global banim_swmm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x14
	.section .data.oam_l
banim_swmm_sw1_oam_l:
banim_swmm_sw1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x62, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x42, -24, 6
	banim_frame_oam 0x0, 0x1000, 0x93, -16, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x22, -24, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x1000, 0x68, -21, -17
	banim_frame_oam 0x0, 0x1000, 0x2, -21, 7
	banim_frame_oam 0x8000, 0x9000, 0x26, -13, -15
	banim_frame_oam 0x0, 0x1000, 0x6, -13, -23
	banim_frame_end
banim_swmm_sw1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -16, -23
	banim_frame_oam 0x8000, 0x9000, 0x9, -14, -15
	banim_frame_oam 0x8000, 0x5000, 0xB, -22, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x1000, 0x8, -9, -7
	banim_frame_oam 0x0, 0x1000, 0x48, -9, 9
	banim_frame_oam 0x8000, 0x9000, 0xC, -25, -15
	banim_frame_oam 0x8000, 0x1000, 0x8F, -33, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -31, -15
	banim_frame_oam 0x0, 0x1000, 0x8E, 1, 3
	banim_frame_end
banim_swmm_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -31, -16
	banim_frame_oam 0x4000, 0x1000, 0xAC, -21, -24
	banim_frame_oam 0x0, 0x1000, 0xAE, -29, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 1, -6
	banim_frame_end
banim_swmm_sw1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x39, -19, -8
	banim_frame_oam 0x4000, 0x5000, 0x79, -19, 8
	banim_frame_oam 0x4000, 0x1000, 0x1B, -19, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -18, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -26, -16
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -6
	banim_frame_oam 0x4000, 0x1000, 0x8C, -2, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0x3F, -26, -16
	banim_frame_oam 0x4000, 0x1000, 0x7D, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x7F, -26, 0
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -6
	banim_frame_oam 0x4000, 0x1000, 0xA6, -32, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -21, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -6
	banim_frame_oam 0x0, 0x5000, 0xA0, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, -26, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -18, 0
	banim_frame_oam 0x0, 0x1000, 0xE2, -26, 0
	banim_frame_oam 0x4000, 0x1000, 0xC6, -28, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -21, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0xA5, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -6
	banim_frame_oam 0x0, 0x5000, 0xC3, -18, -8
	banim_frame_oam 0x8000, 0x1000, 0xC5, -26, -8
	banim_frame_oam 0x4000, 0x1000, 0xA3, -18, -16
	banim_frame_oam 0x4000, 0x1000, 0xE6, -26, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x96, -26, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x1000, 0x89, -17, -16
	banim_frame_oam 0x4000, 0x9000, 0xA8, -23, -8
	banim_frame_oam 0x4000, 0x5000, 0xE8, -23, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -25, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -19, -18
	banim_frame_oam 0x8000, 0x5000, 0x2, -27, -18
	banim_frame_oam 0x0, 0x1000, 0x3, -35, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x5000, 0x4, -37, 0
	banim_frame_oam 0x4000, 0x1000, 0x8, -53, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0x27, 1, -32
	banim_frame_oam 0x0, 0x1000, 0x29, -7, -32
	banim_frame_oam 0x4000, 0x1000, 0x47, 1, 0
	banim_frame_oam 0x0, 0x1000, 0x49, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x4A, -12, -24
	banim_frame_oam 0x0, 0x1000, 0xA, -6, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, -14, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0x67, 21, 5
	banim_frame_oam 0x0, 0x1000, 0x69, 13, 5
	banim_frame_end
banim_swmm_sw1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, 25, 0
	banim_frame_oam 0x4000, 0x1000, 0xA0, 39, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, 31, -8
	banim_frame_oam 0x4000, 0x1000, 0x80, 33, -16
	banim_frame_oam 0x4000, 0x1000, 0x82, 57, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, 40, -16
	banim_frame_oam 0x8000, 0x5000, 0x26, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x23, 56, -14
	banim_frame_end
banim_swmm_sw1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x5000, 0xA5, 33, 10
	banim_frame_oam 0x0, 0x5000, 0x89, 51, -18
	banim_frame_oam 0x0, 0x5000, 0xCB, 27, -34
	banim_frame_oam 0x8000, 0x1000, 0xCA, 37, -18
	banim_frame_oam 0x8000, 0x9000, 0x4B, 43, -50
	banim_frame_oam 0x0, 0x1000, 0x2C, 27, -42
	banim_frame_oam 0x8000, 0x1000, 0xD, 35, -50
	banim_frame_oam 0x8000, 0x1000, 0xB, 49, -66
	banim_frame_end
banim_swmm_sw1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0xC4, 53, 1
	banim_frame_oam 0x0, 0x5000, 0xC6, 31, 1
	banim_frame_oam 0x8000, 0x1000, 0xC8, 23, 1
	banim_frame_oam 0x0, 0x1000, 0xE9, 15, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, 69, 8
	banim_frame_oam 0x0, 0x5000, 0x89, 51, -23
	banim_frame_oam 0x0, 0x5000, 0xCB, 27, -39
	banim_frame_oam 0x8000, 0x1000, 0xCA, 37, -23
	banim_frame_oam 0x8000, 0x9000, 0x4B, 43, -55
	banim_frame_oam 0x0, 0x1000, 0x2C, 27, -47
	banim_frame_oam 0x8000, 0x1000, 0xD, 35, -55
	banim_frame_oam 0x8000, 0x1000, 0xB, 49, -71
	banim_frame_end
banim_swmm_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x4D, 20, -85
	banim_frame_oam 0x8000, 0x9000, 0xE, 28, -117
	banim_frame_oam 0x8000, 0x5000, 0x10, 20, -117
	banim_frame_oam 0x8000, 0x1000, 0x6D, 28, -85
	banim_frame_end
banim_swmm_sw1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -13, -116
	banim_frame_oam 0x4000, 0x1000, 0xF4, -5, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -13, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_19_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -18, -112
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_20_l:
	banim_frame_affine 255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -16, -101
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_21_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -11, -100
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -13, -97
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -8, -89
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -73
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -57
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -97
	banim_frame_end
banim_swmm_sw1_oam_frame_97_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, -8, -82
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, -66
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -50
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xED, -3, -90
	banim_frame_end
banim_swmm_sw1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -8, -82
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -66
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -50
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -90
	banim_frame_end
banim_swmm_sw1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, -8, -73
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, -57
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -41
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xED, -3, -81
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x92, -8, -72
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -56
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -40
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -80
	banim_frame_end
banim_swmm_sw1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, -8, -64
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, -48
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -32
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xED, -3, -72
	banim_frame_end
banim_swmm_sw1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -8, -56
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -64
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x8E, -8, -56
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xED, -3, -64
	banim_frame_end
banim_swmm_sw1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -8, -48
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, -16
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -56
	banim_frame_end
banim_swmm_sw1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, -8, -32
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xAD, -4, 0
	banim_frame_oam 0x4000, 0x1000, 0xF4, -6, 9
	banim_frame_oam 0x0, 0x1000, 0xF6, -14, 9
	banim_frame_oam 0x0, 0x1000, 0xED, -3, -40
	banim_frame_end
banim_swmm_sw1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x1000, 0xCE, -2, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, -2, -32
	banim_frame_oam 0x8000, 0x9000, 0x90, -2, -16
	banim_frame_oam 0x8000, 0x5000, 0x92, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0xB3, -18, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x94, -7, -16
	banim_frame_oam 0x4000, 0x1000, 0x97, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xB6, -15, -8
	banim_frame_oam 0x0, 0x1000, 0xF6, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -18, 4
	banim_frame_end
banim_swmm_sw1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x17, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x97, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9F, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -24, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x5000, 0x15, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x95, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x18, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9F, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -24, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x5000, 0x15, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x95, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x1A, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x9A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9F, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -24, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x9C, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x7E, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x3F, -24, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x9000, 0x39, -23, -8
	banim_frame_oam 0x4000, 0x5000, 0x79, -23, 8
	banim_frame_oam 0x4000, 0x1000, 0x1B, -23, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_44_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0x1D, -8, -6
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -28, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -28, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -36, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -33, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -41, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -41, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -35, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -43, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -43, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -37, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -45, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -45, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -62, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -46, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -54, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -46, -18
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -39, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -47, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -47, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_50_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -64, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -48, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -56, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -48, -18
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -66, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -50, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -58, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -50, -18
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -39, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -47, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -47, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_52_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -68, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -52, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -60, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -52, -18
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -39, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -47, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -47, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -60, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -76, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -76, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -69, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -53, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -61, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -53, -18
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x49, -62, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -78, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -78, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -41, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -49, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -49, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -64, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -80, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -80, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_56_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -75, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -75, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -83, 7
	banim_frame_oam 0x4000, 0x9000, 0x83, -69, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -53, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -61, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -53, -18
	banim_frame_oam 0x8000, 0x9000, 0x49, -66, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -82, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -82, -19
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_57_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -41, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -49, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -49, -32
	banim_frame_oam 0x8000, 0x9000, 0x7, -77, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -77, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -85, 7
	banim_frame_oam 0x8000, 0x9000, 0x49, -66, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -82, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -82, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -69, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -53, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -61, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -53, -18
	banim_frame_oam 0x8000, 0x9000, 0x7, -79, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -79, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -87, 7
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_59_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -41, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -49, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -49, -32
	banim_frame_oam 0x8000, 0x9000, 0x7, -81, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -81, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -89, 7
	banim_frame_oam 0x8000, 0x9000, 0x49, -68, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -84, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -84, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -70, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -54, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -62, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -54, -18
	banim_frame_oam 0x8000, 0x9000, 0x7, -83, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -83, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -91, 7
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_61_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -41, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -49, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -49, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -71, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -87, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -87, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_62_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -71, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -55, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -63, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -55, -18
	banim_frame_oam 0x8000, 0x9000, 0x7, -84, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -84, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -92, 7
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_63_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -42, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -50, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -50, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -71, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -87, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -87, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_64_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -72, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -56, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -64, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -56, -18
	banim_frame_oam 0x8000, 0x9000, 0x7, -85, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -85, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -93, 7
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_65_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -42, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -50, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -50, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -72, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -88, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -88, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -72, 6
	banim_frame_oam 0x0, 0x5000, 0x43, -56, -10
	banim_frame_oam 0x8000, 0x1000, 0x45, -64, -10
	banim_frame_oam 0x0, 0x1000, 0x24, -56, -18
	banim_frame_oam 0x8000, 0x9000, 0x7, -86, -17
	banim_frame_oam 0x0, 0x5000, 0x87, -86, 15
	banim_frame_oam 0x8000, 0x1000, 0x6, -94, 7
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_67_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -29, -16
	banim_frame_oam 0x4000, 0x9000, 0xC4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -37, 0
	banim_frame_oam 0x8000, 0x9000, 0x40, -42, -16
	banim_frame_oam 0x8000, 0x5000, 0x42, -50, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -50, -32
	banim_frame_oam 0x8000, 0x9000, 0x49, -73, -19
	banim_frame_oam 0x4000, 0x9000, 0x9, -89, -35
	banim_frame_oam 0x4000, 0x1000, 0x4, -89, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_68_l:
	banim_frame_oam 0x4000, 0x5000, 0x6B, -28, -8
	banim_frame_oam 0x0, 0x1000, 0x6F, -36, -8
	banim_frame_oam 0x4000, 0x9000, 0x8B, -36, 0
	banim_frame_oam 0x4000, 0x5000, 0x4B, -36, -16
	banim_frame_oam 0x0, 0x1000, 0x2D, -4, 8
	banim_frame_oam 0x4000, 0x9000, 0x10, -62, 9
	banim_frame_oam 0x4000, 0x5000, 0x50, -62, 25
	banim_frame_oam 0x4000, 0x1000, 0xD, -54, 1
	banim_frame_oam 0x0, 0x1000, 0xF, -62, 1
	banim_frame_oam 0x0, 0x1000, 0x2E, -55, -7
	banim_frame_oam 0x8000, 0x9000, 0x14, -89, -7
	banim_frame_oam 0x0, 0x1000, 0x72, -97, 3
	banim_frame_oam 0x4000, 0x1000, 0x70, -89, 25
	banim_frame_oam 0x8000, 0x1000, 0x2F, -81, 33
	banim_frame_oam 0x8000, 0x9000, 0x16, -78, -48
	banim_frame_oam 0x0, 0x1000, 0x73, -70, -16
	banim_frame_oam 0x8000, 0x9000, 0x18, -92, -63
	banim_frame_oam 0x8000, 0x9000, 0x92, -50, -34
	banim_frame_oam 0x0, 0x5000, 0x8F, -42, -50
	banim_frame_oam 0x8000, 0x1000, 0x91, -50, -50
	banim_frame_end
banim_swmm_sw1_oam_frame_69_l:
	banim_frame_oam 0x4000, 0x5000, 0x6B, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x6F, -39, -8
	banim_frame_oam 0x4000, 0x9000, 0x8B, -39, 0
	banim_frame_oam 0x4000, 0x5000, 0x4B, -39, -16
	banim_frame_oam 0x0, 0x1000, 0x2D, -7, 8
	banim_frame_oam 0x4000, 0x9000, 0x10, -59, 12
	banim_frame_oam 0x4000, 0x5000, 0x50, -59, 28
	banim_frame_oam 0x4000, 0x1000, 0xD, -51, 4
	banim_frame_oam 0x0, 0x1000, 0xF, -59, 4
	banim_frame_oam 0x0, 0x1000, 0x2E, -52, -4
	banim_frame_oam 0x8000, 0x9000, 0x14, -88, -1
	banim_frame_oam 0x0, 0x1000, 0x72, -96, 9
	banim_frame_oam 0x4000, 0x1000, 0x70, -88, 31
	banim_frame_oam 0x8000, 0x1000, 0x2F, -80, 39
	banim_frame_oam 0x8000, 0x9000, 0x16, -80, -54
	banim_frame_oam 0x0, 0x1000, 0x73, -72, -22
	banim_frame_oam 0x8000, 0x9000, 0x18, -94, -69
	banim_frame_oam 0x8000, 0x9000, 0x92, -52, -38
	banim_frame_oam 0x0, 0x5000, 0x8F, -44, -54
	banim_frame_oam 0x8000, 0x1000, 0x91, -52, -54
	banim_frame_end
banim_swmm_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_80_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_72_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_70_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 49, -8
	banim_frame_oam 0x4000, 0x9000, 0x2, -39, 29
	banim_frame_oam 0x0, 0x5000, 0x6, -55, 29
	banim_frame_oam 0x8000, 0x1000, 0x40, 41, -5
	banim_frame_oam 0x0, 0x1000, 0x80, 41, 11
	banim_frame_oam 0x0, 0x1000, 0xA0, 49, 8
	banim_frame_oam 0x4000, 0x5000, 0xE3, -39, 21
	banim_frame_oam 0x0, 0x5000, 0xA3, -7, 23
	banim_frame_oam 0x0, 0x5000, 0x41, 25, 8
	banim_frame_oam 0x4000, 0x1000, 0x81, 25, 24
	banim_frame_oam 0x4000, 0x1000, 0x43, -39, 13
	banim_frame_oam 0x8000, 0x1000, 0x45, -47, 5
	banim_frame_oam 0x8000, 0x1000, 0x46, -51, -11
	banim_frame_oam 0x0, 0x5000, 0x63, 9, 18
	banim_frame_end
banim_swmm_sw1_oam_frame_81_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 57, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, 49, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_71_l:
	banim_frame_oam 0x8000, 0x1000, 0x85, 83, -50
	banim_frame_oam 0x0, 0x1000, 0xC5, 83, -34
	banim_frame_oam 0x0, 0x1000, 0x86, 75, -42
	banim_frame_oam 0x8000, 0x1000, 0xA6, 67, -2
	banim_frame_oam 0x8000, 0x9000, 0x87, 67, -34
	banim_frame_oam 0x8000, 0x5000, 0x89, 59, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_82_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 62, -38
	banim_frame_oam 0x8000, 0x1000, 0x47, 78, -46
	banim_frame_oam 0x4000, 0x1000, 0x48, 54, -22
	banim_frame_oam 0x4000, 0x1000, 0x68, 46, -14
	banim_frame_oam 0x0, 0x1000, 0xA, 45, -6
	banim_frame_oam 0x0, 0x1000, 0x2A, 70, -46
	banim_frame_end
banim_swmm_sw1_oam_frame_73_l:
	banim_frame_oam 0x0, 0x5000, 0xAA, 55, -12
	banim_frame_oam 0x4000, 0x1000, 0xEA, 55, 4
	banim_frame_end
banim_swmm_sw1_oam_frame_83_l:
	banim_frame_oam 0x0, 0x5000, 0x6A, 39, -28
	banim_frame_oam 0x0, 0x1000, 0x4A, 47, -12
	banim_frame_oam 0x0, 0x1000, 0x4B, 55, -19
	banim_frame_oam 0x0, 0x1000, 0xB, 39, -36
	banim_frame_oam 0x0, 0x5000, 0xC, 23, -38
	banim_frame_oam 0x4000, 0x5000, 0xEC, -25, -43
	banim_frame_oam 0x4000, 0x1000, 0xCD, -25, -35
	banim_frame_oam 0x0, 0x1000, 0x8D, -57, 15
	banim_frame_oam 0x0, 0x1000, 0xAD, -41, 5
	banim_frame_oam 0x8000, 0x5000, 0xE, -41, -27
	banim_frame_oam 0x8000, 0x5000, 0xF, -49, -11
	banim_frame_oam 0x0, 0x5000, 0x4C, 7, -45
	banim_frame_oam 0x8000, 0x1000, 0x8C, -33, -35
	banim_frame_oam 0x0, 0x1000, 0xCC, -33, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_84_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, 70, 13
	banim_frame_oam 0x0, 0x5000, 0x8E, 54, 5
	banim_frame_oam 0x4000, 0x1000, 0xF1, 78, 45
	banim_frame_oam 0x8000, 0x1000, 0xD0, 86, 29
	banim_frame_oam 0x4000, 0x1000, 0x90, 38, 3
	banim_frame_oam 0x4000, 0x1000, 0xB0, 30, -5
	banim_frame_oam 0x0, 0x1000, 0xD1, 62, 21
	banim_frame_oam 0x0, 0x1000, 0xD2, 22, -11
	banim_frame_end
banim_swmm_sw1_oam_frame_74_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 62, 1
	banim_frame_oam 0x4000, 0x1000, 0x52, 70, 17
	banim_frame_oam 0x8000, 0x1000, 0x72, 54, -9
	banim_frame_oam 0x0, 0x1000, 0xB2, 54, 7
	banim_frame_oam 0x8000, 0x1000, 0x73, 46, -17
	banim_frame_end
banim_swmm_sw1_oam_frame_75_l:
	banim_frame_oam 0x4000, 0x1000, 0xF3, 56, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_85_l:
	banim_frame_oam 0x0, 0x1000, 0xD3, 56, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD5, -80, -56
	banim_frame_oam 0x4000, 0x5000, 0x98, -64, -56
	banim_frame_oam 0x4000, 0x1000, 0xF5, -56, -16
	banim_frame_oam 0x4000, 0x9000, 0x94, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x54, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x14, 24, -16
	banim_frame_oam 0x4000, 0x9000, 0x18, -64, -48
	banim_frame_oam 0x8000, 0x1000, 0x1C, -72, -48
	banim_frame_oam 0x4000, 0x9000, 0x58, -80, -32
	banim_frame_oam 0x8000, 0x1000, 0x5C, -80, -48
	banim_frame_oam 0x0, 0x1000, 0xB3, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xB8, -32, -48
	banim_frame_end
banim_swmm_sw1_oam_frame_86_l:
	banim_frame_oam 0x4000, 0x9000, 0xD7, 69, -3
	banim_frame_oam 0x4000, 0x9000, 0xDB, 37, -3
	banim_frame_oam 0x8000, 0x1000, 0xDF, 29, -3
	banim_frame_end
banim_swmm_sw1_oam_frame_76_l:
	banim_frame_oam 0x4000, 0x9000, 0x9C, 61, -11
	banim_frame_oam 0x0, 0x5000, 0x5E, 45, -19
	banim_frame_oam 0x0, 0x1000, 0x7D, 69, -19
	banim_frame_oam 0x0, 0x1000, 0x5D, 37, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_77_l:
	banim_frame_oam 0x0, 0x3000, 0xD3, 56, 0
	banim_frame_oam 0x0, 0x3000, 0xD4, 16, 0
	banim_frame_oam 0x4000, 0x3000, 0xD5, -80, 40
	banim_frame_oam 0x4000, 0x7000, 0x98, -64, 40
	banim_frame_oam 0x4000, 0x3000, 0xF5, -56, 0
	banim_frame_oam 0x4000, 0xB000, 0x94, 0, 8
	banim_frame_oam 0x4000, 0xB000, 0x54, -32, 16
	banim_frame_oam 0x4000, 0xB000, 0x14, 24, -8
	banim_frame_oam 0x4000, 0xB000, 0x18, -64, 24
	banim_frame_oam 0x8000, 0x3000, 0x1C, -72, 24
	banim_frame_oam 0x4000, 0xB000, 0x58, -80, 8
	banim_frame_oam 0x8000, 0x3000, 0x5C, -80, 24
	banim_frame_oam 0x0, 0x3000, 0xB3, 32, 8
	banim_frame_oam 0x4000, 0x3000, 0xB8, -32, 32
	banim_frame_end
banim_swmm_sw1_oam_frame_78_l:
	banim_frame_oam 0x4000, 0xB000, 0x9C, 67, -15
	banim_frame_oam 0x0, 0x7000, 0x5E, 51, -7
	banim_frame_oam 0x0, 0x3000, 0x7D, 75, 1
	banim_frame_oam 0x0, 0x3000, 0x5D, 43, 1
	banim_frame_end
banim_swmm_sw1_oam_frame_88_l:
	banim_frame_oam 0x4000, 0xB000, 0xD7, 75, -23
	banim_frame_oam 0x4000, 0xB000, 0xDB, 43, -23
	banim_frame_oam 0x8000, 0x3000, 0xDF, 35, -23
	banim_frame_end
banim_swmm_sw1_oam_frame_87_l:
	banim_frame_oam 0x4000, 0x3000, 0xF3, 56, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_79_l:
	banim_frame_oam 0x4000, 0x9000, 0xB4, 21, 1
	banim_frame_oam 0x4000, 0x9000, 0xB8, -11, 1
	banim_frame_oam 0x4000, 0x9000, 0xBC, -43, 1
	banim_frame_oam 0x4000, 0x5000, 0xF7, 5, -7
	banim_frame_oam 0x4000, 0x1000, 0xFB, 45, -15
	banim_frame_oam 0x4000, 0x1000, 0xFD, 45, -7
	banim_frame_oam 0x8000, 0x1000, 0x5F, 37, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_89_l:
	banim_frame_oam 0x8000, 0x9000, 0x99, -8, -44
	banim_frame_oam 0x8000, 0x1000, 0xDB, -16, -28
	banim_frame_oam 0x4000, 0x1000, 0x7A, -8, -12
	banim_frame_oam 0x0, 0x1000, 0x7C, -16, -12
	banim_frame_oam 0x4000, 0x1000, 0x9B, -16, -4
	banim_frame_oam 0x4000, 0x1000, 0xBB, -16, 4
	banim_frame_oam 0x0, 0x1000, 0x98, 0, -4
	banim_frame_oam 0x0, 0x1000, 0xDC, -24, 4
	banim_frame_oam 0x0, 0x5000, 0x1A, -7, -5
	banim_frame_oam 0x8000, 0x1000, 0x1C, -15, -5
	banim_frame_oam 0x4000, 0x1000, 0x5A, -7, 11
	banim_frame_oam 0x0, 0x1000, 0x5C, -15, 11
	banim_frame_end
banim_swmm_sw1_oam_frame_90_l:
	banim_frame_oam 0x8000, 0x5000, 0x97, -3, -45
	banim_frame_oam 0x8000, 0x1000, 0xB8, -11, -37
	banim_frame_oam 0x0, 0x1000, 0xF8, -11, -21
	banim_frame_oam 0x4000, 0x1000, 0xF7, -11, -21
	banim_frame_oam 0x8000, 0x9000, 0x94, -7, -13
	banim_frame_oam 0x8000, 0x5000, 0x96, -15, -13
	banim_frame_end
banim_swmm_sw1_oam_frame_91_l:
	banim_frame_oam 0x0, 0x5000, 0x3A, -7, 3
	banim_frame_oam 0x8000, 0x1000, 0x3C, -15, 3
	banim_frame_oam 0x0, 0x5000, 0x94, -7, -13
	banim_frame_oam 0x8000, 0x1000, 0x96, -15, -13
	banim_frame_oam 0x4000, 0x1000, 0xF7, -11, -21
	banim_frame_oam 0x8000, 0x5000, 0x97, -3, -45
	banim_frame_oam 0x8000, 0x1000, 0xB8, -11, -37
	banim_frame_end
banim_swmm_sw1_oam_frame_92_l:
	banim_frame_oam 0x8000, 0x1000, 0x7D, -3, -45
	banim_frame_oam 0x0, 0x1000, 0xBD, -3, -29
	banim_frame_oam 0x8000, 0x1000, 0x9E, -11, -37
	banim_frame_oam 0x0, 0x5000, 0x3A, -7, 3
	banim_frame_oam 0x8000, 0x1000, 0x3C, -15, 3
	banim_frame_oam 0x0, 0x5000, 0x94, -7, -13
	banim_frame_oam 0x8000, 0x1000, 0x96, -15, -13
	banim_frame_oam 0x4000, 0x1000, 0xF7, -11, -21
	banim_frame_oam 0x0, 0x1000, 0x5E, -11, -45
	banim_frame_end
	banim_frame_end
banim_swmm_sw1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0xA3, 57, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_96_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, 40, -16
	banim_frame_oam 0x8000, 0x5000, 0x26, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x23, 56, -14
	banim_frame_oam 0x4000, 0x1000, 0xA3, 57, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_95_l:
	banim_frame_oam 0x0, 0x5000, 0xB7, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x99, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9B, -16, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_93_l:
	banim_frame_oam 0x0, 0x1000, 0xBF, -4, -21
	banim_frame_oam 0x0, 0x1000, 0x9F, -12, -21
	banim_frame_oam 0x8000, 0x1000, 0x97, -3, -43
	banim_frame_oam 0x0, 0x1000, 0xD7, -3, -27
	banim_frame_oam 0x8000, 0x1000, 0xB8, -11, -35
	banim_frame_oam 0x0, 0x1000, 0xFC, -5, -13
	banim_frame_oam 0x0, 0x1000, 0xFF, -13, -13
	banim_frame_oam 0x0, 0x5000, 0x3A, -7, 3
	banim_frame_oam 0x8000, 0x1000, 0x3C, -15, 3
	banim_frame_oam 0x0, 0x5000, 0x94, -7, -13
	banim_frame_oam 0x0, 0x1000, 0xB6, -15, -5
	banim_frame_end
banim_swmm_sw1_oam_frame_94_l:
	banim_frame_oam 0x8000, 0x9000, 0x94, -7, -13
	banim_frame_oam 0x8000, 0x5000, 0x96, -15, -13
	banim_frame_oam 0x8000, 0x1000, 0x3F, -12, -37
	banim_frame_oam 0x0, 0x1000, 0x7F, -12, -21
	banim_frame_oam 0x0, 0x1000, 0x1E, -12, -45
	banim_frame_oam 0x0, 0x1000, 0x7E, -4, -21
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x94, -7, -13
	banim_frame_oam 0x8000, 0x5000, 0x96, -15, -13
	banim_frame_oam 0x8000, 0x1000, 0x3F, -12, -37
	banim_frame_oam 0x0, 0x1000, 0x7F, -12, -21
	banim_frame_oam 0x0, 0x1000, 0x1E, -12, -45
	banim_frame_oam 0x0, 0x1000, 0x7E, -4, -21
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_swmm_sw1_oam_r:
banim_swmm_sw1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x62, 8, 0
	banim_frame_oam 0x0, 0x0, 0x42, 16, 6
	banim_frame_oam 0x0, 0x0, 0x93, 8, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -24
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_oam 0x0, 0x0, 0x22, 16, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x0, 0x68, 13, -17
	banim_frame_oam 0x0, 0x0, 0x2, 13, 7
	banim_frame_oam 0x8000, 0x8000, 0x26, -3, -15
	banim_frame_oam 0x0, 0x0, 0x6, 5, -23
	banim_frame_end
banim_swmm_sw1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x0, 0x7, 8, -23
	banim_frame_oam 0x8000, 0x8000, 0x9, -2, -15
	banim_frame_oam 0x8000, 0x4000, 0xB, 14, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x0, 0x8, 1, -7
	banim_frame_oam 0x0, 0x0, 0x48, 1, 9
	banim_frame_oam 0x8000, 0x8000, 0xC, 9, -15
	banim_frame_oam 0x8000, 0x0, 0x8F, 25, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -1, -15
	banim_frame_oam 0x0, 0x0, 0x8E, -9, 3
	banim_frame_end
banim_swmm_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -1, -16
	banim_frame_oam 0x4000, 0x0, 0xAC, 5, -24
	banim_frame_oam 0x0, 0x0, 0xAE, 21, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -9, -6
	banim_frame_end
banim_swmm_sw1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x39, -13, -8
	banim_frame_oam 0x4000, 0x4000, 0x79, -13, 8
	banim_frame_oam 0x4000, 0x0, 0x1B, 3, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 2, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 18, -16
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -6
	banim_frame_oam 0x4000, 0x0, 0x8C, -14, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, 2, -16
	banim_frame_oam 0x8000, 0x0, 0x3F, 18, -16
	banim_frame_oam 0x4000, 0x0, 0x7D, 2, 0
	banim_frame_oam 0x0, 0x0, 0x7F, 18, 0
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -6
	banim_frame_oam 0x4000, 0x0, 0xA6, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -11, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -6
	banim_frame_oam 0x0, 0x4000, 0xA0, 2, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, 18, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, 2, 0
	banim_frame_oam 0x0, 0x0, 0xE2, 18, 0
	banim_frame_oam 0x4000, 0x0, 0xC6, 12, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -11, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0xA5, 5, 8
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -6
	banim_frame_oam 0x0, 0x4000, 0xC3, 2, -8
	banim_frame_oam 0x8000, 0x0, 0xC5, 18, -8
	banim_frame_oam 0x4000, 0x0, 0xA3, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xE6, 10, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -11, 8
	banim_frame_oam 0x0, 0x0, 0x96, 18, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x0, 0x89, 1, -16
	banim_frame_oam 0x4000, 0x8000, 0xA8, -9, -8
	banim_frame_oam 0x4000, 0x4000, 0xE8, -9, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 17, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 3, -18
	banim_frame_oam 0x8000, 0x4000, 0x2, 19, -18
	banim_frame_oam 0x0, 0x0, 0x3, 27, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x4000, 0x4, 5, 0
	banim_frame_oam 0x4000, 0x0, 0x8, 37, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0x27, -17, -32
	banim_frame_oam 0x0, 0x0, 0x29, -1, -32
	banim_frame_oam 0x4000, 0x0, 0x47, -17, 0
	banim_frame_oam 0x0, 0x0, 0x49, -1, 0
	banim_frame_oam 0x8000, 0x0, 0x4A, 4, -24
	banim_frame_oam 0x0, 0x0, 0xA, -2, -8
	banim_frame_oam 0x0, 0x0, 0x2A, 6, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0x67, -37, 5
	banim_frame_oam 0x0, 0x0, 0x69, -21, 5
	banim_frame_end
banim_swmm_sw1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -57, 0
	banim_frame_oam 0x4000, 0x0, 0xA0, -55, -8
	banim_frame_oam 0x0, 0x0, 0xA2, -39, -8
	banim_frame_oam 0x4000, 0x0, 0x80, -49, -16
	banim_frame_oam 0x4000, 0x0, 0x82, -73, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x26, -40, -16
	banim_frame_oam 0x0, 0x0, 0x23, -64, -14
	banim_frame_end
banim_swmm_sw1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x4000, 0xA5, -65, 10
	banim_frame_oam 0x0, 0x4000, 0x89, -67, -18
	banim_frame_oam 0x0, 0x4000, 0xCB, -43, -34
	banim_frame_oam 0x8000, 0x0, 0xCA, -45, -18
	banim_frame_oam 0x8000, 0x8000, 0x4B, -59, -50
	banim_frame_oam 0x0, 0x0, 0x2C, -35, -42
	banim_frame_oam 0x8000, 0x0, 0xD, -43, -50
	banim_frame_oam 0x8000, 0x0, 0xB, -57, -66
	banim_frame_end
banim_swmm_sw1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0xC4, -69, 1
	banim_frame_oam 0x0, 0x4000, 0xC6, -47, 1
	banim_frame_oam 0x8000, 0x0, 0xC8, -31, 1
	banim_frame_oam 0x0, 0x0, 0xE9, -23, 8
	banim_frame_oam 0x0, 0x0, 0xC9, -77, 8
	banim_frame_oam 0x0, 0x4000, 0x89, -67, -23
	banim_frame_oam 0x0, 0x4000, 0xCB, -43, -39
	banim_frame_oam 0x8000, 0x0, 0xCA, -45, -23
	banim_frame_oam 0x8000, 0x8000, 0x4B, -59, -55
	banim_frame_oam 0x0, 0x0, 0x2C, -35, -47
	banim_frame_oam 0x8000, 0x0, 0xD, -43, -55
	banim_frame_oam 0x8000, 0x0, 0xB, -57, -71
	banim_frame_end
banim_swmm_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x4D, -28, -85
	banim_frame_oam 0x8000, 0x8000, 0xE, -44, -117
	banim_frame_oam 0x8000, 0x4000, 0x10, -28, -117
	banim_frame_oam 0x8000, 0x0, 0x6D, -36, -85
	banim_frame_end
banim_swmm_sw1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -19, -116
	banim_frame_oam 0x4000, 0x0, 0xF4, -11, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 5, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_19_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -14, -112
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_20_r:
	banim_frame_affine -255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -16, -101
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_21_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x11, -21, -100
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -19, -97
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_end
banim_swmm_sw1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -8, -89
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -73
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -57
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -97
	banim_frame_end
banim_swmm_sw1_oam_frame_97_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -8, -82
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, -66
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -50
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xED, -5, -90
	banim_frame_end
banim_swmm_sw1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -8, -82
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -66
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -50
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -90
	banim_frame_end
banim_swmm_sw1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -8, -73
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, -57
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -41
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xED, -5, -81
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x92, -8, -72
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -56
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -40
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -80
	banim_frame_end
banim_swmm_sw1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -8, -64
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, -48
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -32
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xED, -5, -72
	banim_frame_end
banim_swmm_sw1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -8, -56
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -40
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -24
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -64
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x8E, -8, -56
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, -40
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -24
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xED, -5, -64
	banim_frame_end
banim_swmm_sw1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -32
	banim_frame_oam 0x0, 0x0, 0xAD, -4, -16
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -56
	banim_frame_end
banim_swmm_sw1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -8, -32
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, -16
	banim_frame_oam 0x0, 0x0, 0xAD, -4, 0
	banim_frame_oam 0x4000, 0x0, 0xF4, -10, 9
	banim_frame_oam 0x0, 0x0, 0xF6, 6, 9
	banim_frame_oam 0x0, 0x0, 0xED, -5, -40
	banim_frame_end
banim_swmm_sw1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x0, 0xCE, -14, -24
	banim_frame_oam 0x0, 0x0, 0xCD, -6, -32
	banim_frame_oam 0x8000, 0x8000, 0x90, -14, -16
	banim_frame_oam 0x8000, 0x4000, 0x92, 2, -16
	banim_frame_oam 0x8000, 0x0, 0xB3, 10, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x94, -9, -16
	banim_frame_oam 0x4000, 0x0, 0x97, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xB6, 7, -8
	banim_frame_oam 0x0, 0x0, 0xF6, 7, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 10, 4
	banim_frame_end
banim_swmm_sw1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x17, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -8, 8
	banim_frame_oam 0x0, 0x0, 0x97, 8, 8
	banim_frame_oam 0x0, 0x0, 0x9F, 16, 8
	banim_frame_oam 0x0, 0x0, 0x3F, 16, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x4000, 0x15, -8, -24
	banim_frame_oam 0x0, 0x0, 0x95, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x18, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x98, 0, 8
	banim_frame_oam 0x0, 0x0, 0x9F, 16, 8
	banim_frame_oam 0x0, 0x0, 0x3F, 16, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x4000, 0x15, -8, -24
	banim_frame_oam 0x0, 0x0, 0x95, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x1A, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, 0, 8
	banim_frame_oam 0x0, 0x0, 0x9F, 16, 8
	banim_frame_oam 0x0, 0x0, 0x3F, 16, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x9C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x7E, 8, 0
	banim_frame_oam 0x0, 0x0, 0x3F, 16, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x8000, 0x39, -9, -8
	banim_frame_oam 0x4000, 0x4000, 0x79, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x1B, 7, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_44_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -16
	banim_frame_oam 0x4000, 0x0, 0x1D, -8, -6
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_end
banim_swmm_sw1_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -4, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -4, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 28, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 17, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 33, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 9, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 19, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 35, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 11, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 21, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 37, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 13, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 30, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 30, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 46, -10
	banim_frame_oam 0x0, 0x0, 0x24, 38, -18
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 23, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 39, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 15, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_50_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 32, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 32, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 48, -10
	banim_frame_oam 0x0, 0x0, 0x24, 40, -18
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 34, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 34, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 50, -10
	banim_frame_oam 0x0, 0x0, 0x24, 42, -18
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 23, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 39, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 15, -32
	banim_frame_end
banim_swmm_sw1_oam_frame_52_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 36, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 36, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 52, -10
	banim_frame_oam 0x0, 0x0, 0x24, 44, -18
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 23, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 39, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 15, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 44, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 44, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 60, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 37, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 37, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 53, -10
	banim_frame_oam 0x0, 0x0, 0x24, 45, -18
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x49, 46, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 46, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 62, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 25, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 41, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 17, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 48, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 48, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 64, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_56_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, 59, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 59, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 75, 7
	banim_frame_oam 0x4000, 0x8000, 0x83, 37, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 37, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 53, -10
	banim_frame_oam 0x0, 0x0, 0x24, 45, -18
	banim_frame_oam 0x8000, 0x8000, 0x49, 50, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 50, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 66, -19
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_57_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 25, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 41, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 17, -32
	banim_frame_oam 0x8000, 0x8000, 0x7, 61, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 61, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 77, 7
	banim_frame_oam 0x8000, 0x8000, 0x49, 50, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 50, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 66, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 37, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 37, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 53, -10
	banim_frame_oam 0x0, 0x0, 0x24, 45, -18
	banim_frame_oam 0x8000, 0x8000, 0x7, 63, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 63, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 79, 7
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_59_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 25, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 41, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 17, -32
	banim_frame_oam 0x8000, 0x8000, 0x7, 65, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 65, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 81, 7
	banim_frame_oam 0x8000, 0x8000, 0x49, 52, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 52, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 68, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 38, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 38, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 54, -10
	banim_frame_oam 0x0, 0x0, 0x24, 46, -18
	banim_frame_oam 0x8000, 0x8000, 0x7, 67, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 67, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 83, 7
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_61_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 25, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 41, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 17, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 55, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 55, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 71, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_62_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 39, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 39, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 55, -10
	banim_frame_oam 0x0, 0x0, 0x24, 47, -18
	banim_frame_oam 0x8000, 0x8000, 0x7, 68, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 68, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 84, 7
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_63_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 26, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 42, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 18, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 55, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 55, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 71, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_64_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 40, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 40, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 56, -10
	banim_frame_oam 0x0, 0x0, 0x24, 48, -18
	banim_frame_oam 0x8000, 0x8000, 0x7, 69, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 69, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 85, 7
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_65_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 26, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 42, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 18, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 56, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 56, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 72, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, 40, 6
	banim_frame_oam 0x0, 0x4000, 0x43, 40, -10
	banim_frame_oam 0x8000, 0x0, 0x45, 56, -10
	banim_frame_oam 0x0, 0x0, 0x24, 48, -18
	banim_frame_oam 0x8000, 0x8000, 0x7, 70, -17
	banim_frame_oam 0x0, 0x4000, 0x87, 70, 15
	banim_frame_oam 0x8000, 0x0, 0x6, 86, 7
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_67_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -3, -16
	banim_frame_oam 0x4000, 0x8000, 0xC4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 29, 0
	banim_frame_oam 0x8000, 0x8000, 0x40, 26, -16
	banim_frame_oam 0x8000, 0x4000, 0x42, 42, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, 18, -32
	banim_frame_oam 0x8000, 0x8000, 0x49, 57, -19
	banim_frame_oam 0x4000, 0x8000, 0x9, 57, -35
	banim_frame_oam 0x4000, 0x0, 0x4, 73, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_68_r:
	banim_frame_oam 0x4000, 0x4000, 0x6B, -4, -8
	banim_frame_oam 0x0, 0x0, 0x6F, 28, -8
	banim_frame_oam 0x4000, 0x8000, 0x8B, 4, 0
	banim_frame_oam 0x4000, 0x4000, 0x4B, 4, -16
	banim_frame_oam 0x0, 0x0, 0x2D, -4, 8
	banim_frame_oam 0x4000, 0x8000, 0x10, 30, 9
	banim_frame_oam 0x4000, 0x4000, 0x50, 30, 25
	banim_frame_oam 0x4000, 0x0, 0xD, 38, 1
	banim_frame_oam 0x0, 0x0, 0xF, 54, 1
	banim_frame_oam 0x0, 0x0, 0x2E, 47, -7
	banim_frame_oam 0x8000, 0x8000, 0x14, 73, -7
	banim_frame_oam 0x0, 0x0, 0x72, 89, 3
	banim_frame_oam 0x4000, 0x0, 0x70, 73, 25
	banim_frame_oam 0x8000, 0x0, 0x2F, 73, 33
	banim_frame_oam 0x8000, 0x8000, 0x16, 62, -48
	banim_frame_oam 0x0, 0x0, 0x73, 62, -16
	banim_frame_oam 0x8000, 0x8000, 0x18, 76, -63
	banim_frame_oam 0x8000, 0x8000, 0x92, 34, -34
	banim_frame_oam 0x0, 0x4000, 0x8F, 26, -50
	banim_frame_oam 0x8000, 0x0, 0x91, 42, -50
	banim_frame_end
banim_swmm_sw1_oam_frame_69_r:
	banim_frame_oam 0x4000, 0x4000, 0x6B, -1, -8
	banim_frame_oam 0x0, 0x0, 0x6F, 31, -8
	banim_frame_oam 0x4000, 0x8000, 0x8B, 7, 0
	banim_frame_oam 0x4000, 0x4000, 0x4B, 7, -16
	banim_frame_oam 0x0, 0x0, 0x2D, -1, 8
	banim_frame_oam 0x4000, 0x8000, 0x10, 27, 12
	banim_frame_oam 0x4000, 0x4000, 0x50, 27, 28
	banim_frame_oam 0x4000, 0x0, 0xD, 35, 4
	banim_frame_oam 0x0, 0x0, 0xF, 51, 4
	banim_frame_oam 0x0, 0x0, 0x2E, 44, -4
	banim_frame_oam 0x8000, 0x8000, 0x14, 72, -1
	banim_frame_oam 0x0, 0x0, 0x72, 88, 9
	banim_frame_oam 0x4000, 0x0, 0x70, 72, 31
	banim_frame_oam 0x8000, 0x0, 0x2F, 72, 39
	banim_frame_oam 0x8000, 0x8000, 0x16, 64, -54
	banim_frame_oam 0x0, 0x0, 0x73, 64, -22
	banim_frame_oam 0x8000, 0x8000, 0x18, 78, -69
	banim_frame_oam 0x8000, 0x8000, 0x92, 36, -38
	banim_frame_oam 0x0, 0x4000, 0x8F, 28, -54
	banim_frame_oam 0x8000, 0x0, 0x91, 44, -54
	banim_frame_end
banim_swmm_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_80_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_72_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_70_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -65, -8
	banim_frame_oam 0x4000, 0x8000, 0x2, 7, 29
	banim_frame_oam 0x0, 0x4000, 0x6, 39, 29
	banim_frame_oam 0x8000, 0x0, 0x40, -49, -5
	banim_frame_oam 0x0, 0x0, 0x80, -49, 11
	banim_frame_oam 0x0, 0x0, 0xA0, -57, 8
	banim_frame_oam 0x4000, 0x4000, 0xE3, 7, 21
	banim_frame_oam 0x0, 0x4000, 0xA3, -9, 23
	banim_frame_oam 0x0, 0x4000, 0x41, -41, 8
	banim_frame_oam 0x4000, 0x0, 0x81, -41, 24
	banim_frame_oam 0x4000, 0x0, 0x43, 23, 13
	banim_frame_oam 0x8000, 0x0, 0x45, 39, 5
	banim_frame_oam 0x8000, 0x0, 0x46, 43, -11
	banim_frame_oam 0x0, 0x4000, 0x63, -25, 18
	banim_frame_end
banim_swmm_sw1_oam_frame_81_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -73, -24
	banim_frame_oam 0x0, 0x0, 0xE2, -57, -16
	banim_frame_end
banim_swmm_sw1_oam_frame_71_r:
	banim_frame_oam 0x8000, 0x0, 0x85, -91, -50
	banim_frame_oam 0x0, 0x0, 0xC5, -91, -34
	banim_frame_oam 0x0, 0x0, 0x86, -83, -42
	banim_frame_oam 0x8000, 0x0, 0xA6, -75, -2
	banim_frame_oam 0x8000, 0x8000, 0x87, -83, -34
	banim_frame_oam 0x8000, 0x4000, 0x89, -67, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_82_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -78, -38
	banim_frame_oam 0x8000, 0x0, 0x47, -86, -46
	banim_frame_oam 0x4000, 0x0, 0x48, -70, -22
	banim_frame_oam 0x4000, 0x0, 0x68, -62, -14
	banim_frame_oam 0x0, 0x0, 0xA, -53, -6
	banim_frame_oam 0x0, 0x0, 0x2A, -78, -46
	banim_frame_end
banim_swmm_sw1_oam_frame_73_r:
	banim_frame_oam 0x0, 0x4000, 0xAA, -71, -12
	banim_frame_oam 0x4000, 0x0, 0xEA, -71, 4
	banim_frame_end
banim_swmm_sw1_oam_frame_83_r:
	banim_frame_oam 0x0, 0x4000, 0x6A, -55, -28
	banim_frame_oam 0x0, 0x0, 0x4A, -55, -12
	banim_frame_oam 0x0, 0x0, 0x4B, -63, -19
	banim_frame_oam 0x0, 0x0, 0xB, -47, -36
	banim_frame_oam 0x0, 0x4000, 0xC, -39, -38
	banim_frame_oam 0x4000, 0x4000, 0xEC, -7, -43
	banim_frame_oam 0x4000, 0x0, 0xCD, 9, -35
	banim_frame_oam 0x0, 0x0, 0x8D, 49, 15
	banim_frame_oam 0x0, 0x0, 0xAD, 33, 5
	banim_frame_oam 0x8000, 0x4000, 0xE, 33, -27
	banim_frame_oam 0x8000, 0x4000, 0xF, 41, -11
	banim_frame_oam 0x0, 0x4000, 0x4C, -23, -45
	banim_frame_oam 0x8000, 0x0, 0x8C, 25, -35
	banim_frame_oam 0x0, 0x0, 0xCC, 25, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_84_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -86, 13
	banim_frame_oam 0x0, 0x4000, 0x8E, -70, 5
	banim_frame_oam 0x4000, 0x0, 0xF1, -94, 45
	banim_frame_oam 0x8000, 0x0, 0xD0, -94, 29
	banim_frame_oam 0x4000, 0x0, 0x90, -54, 3
	banim_frame_oam 0x4000, 0x0, 0xB0, -46, -5
	banim_frame_oam 0x0, 0x0, 0xD1, -70, 21
	banim_frame_oam 0x0, 0x0, 0xD2, -30, -11
	banim_frame_end
banim_swmm_sw1_oam_frame_74_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -78, 1
	banim_frame_oam 0x4000, 0x0, 0x52, -86, 17
	banim_frame_oam 0x8000, 0x0, 0x72, -62, -9
	banim_frame_oam 0x0, 0x0, 0xB2, -62, 7
	banim_frame_oam 0x8000, 0x0, 0x73, -54, -17
	banim_frame_end
banim_swmm_sw1_oam_frame_75_r:
	banim_frame_oam 0x4000, 0x0, 0xF3, -72, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_85_r:
	banim_frame_oam 0x0, 0x0, 0xD3, -64, -16
	banim_frame_oam 0x0, 0x0, 0xD4, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xD5, 64, -56
	banim_frame_oam 0x4000, 0x4000, 0x98, 32, -56
	banim_frame_oam 0x4000, 0x0, 0xF5, 40, -16
	banim_frame_oam 0x4000, 0x8000, 0x94, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0x54, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x14, -56, -16
	banim_frame_oam 0x4000, 0x8000, 0x18, 32, -48
	banim_frame_oam 0x8000, 0x0, 0x1C, 64, -48
	banim_frame_oam 0x4000, 0x8000, 0x58, 48, -32
	banim_frame_oam 0x8000, 0x0, 0x5C, 72, -48
	banim_frame_oam 0x0, 0x0, 0xB3, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xB8, 16, -48
	banim_frame_end
banim_swmm_sw1_oam_frame_86_r:
	banim_frame_oam 0x4000, 0x8000, 0xD7, -101, -3
	banim_frame_oam 0x4000, 0x8000, 0xDB, -69, -3
	banim_frame_oam 0x8000, 0x0, 0xDF, -37, -3
	banim_frame_end
banim_swmm_sw1_oam_frame_76_r:
	banim_frame_oam 0x4000, 0x8000, 0x9C, -93, -11
	banim_frame_oam 0x0, 0x4000, 0x5E, -61, -19
	banim_frame_oam 0x0, 0x0, 0x7D, -77, -19
	banim_frame_oam 0x0, 0x0, 0x5D, -45, -19
	banim_frame_end
banim_swmm_sw1_oam_frame_77_r:
	banim_frame_oam 0x0, 0x2000, 0xD3, -64, 0
	banim_frame_oam 0x0, 0x2000, 0xD4, -24, 0
	banim_frame_oam 0x4000, 0x2000, 0xD5, 64, 40
	banim_frame_oam 0x4000, 0x6000, 0x98, 32, 40
	banim_frame_oam 0x4000, 0x2000, 0xF5, 40, 0
	banim_frame_oam 0x4000, 0xA000, 0x94, -32, 8
	banim_frame_oam 0x4000, 0xA000, 0x54, 0, 16
	banim_frame_oam 0x4000, 0xA000, 0x14, -56, -8
	banim_frame_oam 0x4000, 0xA000, 0x18, 32, 24
	banim_frame_oam 0x8000, 0x2000, 0x1C, 64, 24
	banim_frame_oam 0x4000, 0xA000, 0x58, 48, 8
	banim_frame_oam 0x8000, 0x2000, 0x5C, 72, 24
	banim_frame_oam 0x0, 0x2000, 0xB3, -40, 8
	banim_frame_oam 0x4000, 0x2000, 0xB8, 16, 32
	banim_frame_end
banim_swmm_sw1_oam_frame_78_r:
	banim_frame_oam 0x4000, 0xA000, 0x9C, -99, -15
	banim_frame_oam 0x0, 0x6000, 0x5E, -67, -7
	banim_frame_oam 0x0, 0x2000, 0x7D, -83, 1
	banim_frame_oam 0x0, 0x2000, 0x5D, -51, 1
	banim_frame_end
banim_swmm_sw1_oam_frame_88_r:
	banim_frame_oam 0x4000, 0xA000, 0xD7, -107, -23
	banim_frame_oam 0x4000, 0xA000, 0xDB, -75, -23
	banim_frame_oam 0x8000, 0x2000, 0xDF, -43, -23
	banim_frame_end
banim_swmm_sw1_oam_frame_87_r:
	banim_frame_oam 0x4000, 0x2000, 0xF3, -72, -8
	banim_frame_end
banim_swmm_sw1_oam_frame_79_r:
	banim_frame_oam 0x4000, 0x8000, 0xB4, -53, 1
	banim_frame_oam 0x4000, 0x8000, 0xB8, -21, 1
	banim_frame_oam 0x4000, 0x8000, 0xBC, 11, 1
	banim_frame_oam 0x4000, 0x4000, 0xF7, -37, -7
	banim_frame_oam 0x4000, 0x0, 0xFB, -61, -15
	banim_frame_oam 0x4000, 0x0, 0xFD, -61, -7
	banim_frame_oam 0x8000, 0x0, 0x5F, -45, -15
	banim_frame_end
banim_swmm_sw1_oam_frame_89_r:
	banim_frame_oam 0x8000, 0x8000, 0x99, -8, -44
	banim_frame_oam 0x8000, 0x0, 0xDB, 8, -28
	banim_frame_oam 0x4000, 0x0, 0x7A, -8, -12
	banim_frame_oam 0x0, 0x0, 0x7C, 8, -12
	banim_frame_oam 0x4000, 0x0, 0x9B, 0, -4
	banim_frame_oam 0x4000, 0x0, 0xBB, 0, 4
	banim_frame_oam 0x0, 0x0, 0x98, -8, -4
	banim_frame_oam 0x0, 0x0, 0xDC, 16, 4
	banim_frame_oam 0x0, 0x4000, 0x1A, -9, -5
	banim_frame_oam 0x8000, 0x0, 0x1C, 7, -5
	banim_frame_oam 0x4000, 0x0, 0x5A, -9, 11
	banim_frame_oam 0x0, 0x0, 0x5C, 7, 11
	banim_frame_end
banim_swmm_sw1_oam_frame_90_r:
	banim_frame_oam 0x8000, 0x4000, 0x97, -5, -45
	banim_frame_oam 0x8000, 0x0, 0xB8, 3, -37
	banim_frame_oam 0x0, 0x0, 0xF8, 3, -21
	banim_frame_oam 0x4000, 0x0, 0xF7, -5, -21
	banim_frame_oam 0x8000, 0x8000, 0x94, -9, -13
	banim_frame_oam 0x8000, 0x4000, 0x96, 7, -13
	banim_frame_end
banim_swmm_sw1_oam_frame_91_r:
	banim_frame_oam 0x0, 0x4000, 0x3A, -9, 3
	banim_frame_oam 0x8000, 0x0, 0x3C, 7, 3
	banim_frame_oam 0x0, 0x4000, 0x94, -9, -13
	banim_frame_oam 0x8000, 0x0, 0x96, 7, -13
	banim_frame_oam 0x4000, 0x0, 0xF7, -5, -21
	banim_frame_oam 0x8000, 0x4000, 0x97, -5, -45
	banim_frame_oam 0x8000, 0x0, 0xB8, 3, -37
	banim_frame_end
banim_swmm_sw1_oam_frame_92_r:
	banim_frame_oam 0x8000, 0x0, 0x7D, -5, -45
	banim_frame_oam 0x0, 0x0, 0xBD, -5, -29
	banim_frame_oam 0x8000, 0x0, 0x9E, 3, -37
	banim_frame_oam 0x0, 0x4000, 0x3A, -9, 3
	banim_frame_oam 0x8000, 0x0, 0x3C, 7, 3
	banim_frame_oam 0x0, 0x4000, 0x94, -9, -13
	banim_frame_oam 0x8000, 0x0, 0x96, 7, -13
	banim_frame_oam 0x4000, 0x0, 0xF7, -5, -21
	banim_frame_oam 0x0, 0x0, 0x5E, 3, -45
	banim_frame_end
	banim_frame_end
banim_swmm_sw1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0xA3, -73, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_96_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x26, -40, -16
	banim_frame_oam 0x0, 0x0, 0x23, -64, -14
	banim_frame_oam 0x4000, 0x0, 0xA3, -73, -10
	banim_frame_end
banim_swmm_sw1_oam_frame_95_r:
	banim_frame_oam 0x0, 0x4000, 0xB7, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x99, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x9B, 8, 0
	banim_frame_end
banim_swmm_sw1_oam_frame_93_r:
	banim_frame_oam 0x0, 0x0, 0xBF, -4, -21
	banim_frame_oam 0x0, 0x0, 0x9F, 4, -21
	banim_frame_oam 0x8000, 0x0, 0x97, -5, -43
	banim_frame_oam 0x0, 0x0, 0xD7, -5, -27
	banim_frame_oam 0x8000, 0x0, 0xB8, 3, -35
	banim_frame_oam 0x0, 0x0, 0xFC, -3, -13
	banim_frame_oam 0x0, 0x0, 0xFF, 5, -13
	banim_frame_oam 0x0, 0x4000, 0x3A, -9, 3
	banim_frame_oam 0x8000, 0x0, 0x3C, 7, 3
	banim_frame_oam 0x0, 0x4000, 0x94, -9, -13
	banim_frame_oam 0x0, 0x0, 0xB6, 7, -5
	banim_frame_end
banim_swmm_sw1_oam_frame_94_r:
	banim_frame_oam 0x8000, 0x8000, 0x94, -9, -13
	banim_frame_oam 0x8000, 0x4000, 0x96, 7, -13
	banim_frame_oam 0x8000, 0x0, 0x3F, 4, -37
	banim_frame_oam 0x0, 0x0, 0x7F, 4, -21
	banim_frame_oam 0x0, 0x0, 0x1E, 4, -45
	banim_frame_oam 0x0, 0x0, 0x7E, -4, -21
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x94, -9, -13
	banim_frame_oam 0x8000, 0x4000, 0x96, 7, -13
	banim_frame_oam 0x8000, 0x0, 0x3F, 4, -37
	banim_frame_oam 0x0, 0x0, 0x7F, 4, -21
	banim_frame_oam 0x0, 0x0, 0x1E, 4, -45
	banim_frame_oam 0x0, 0x0, 0x7E, -4, -21
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_swmm_sw1_script:
banim_swmm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 1, banim_swmm_sw1_oam_frame_1_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 7, banim_swmm_sw1_oam_frame_2_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 8, banim_swmm_sw1_oam_frame_3_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 9, banim_swmm_sw1_oam_frame_4_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 10, banim_swmm_sw1_oam_frame_5_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 11, banim_swmm_sw1_oam_frame_6_r - banim_swmm_sw1_oam_r
	banim_code_frame 8, banim_swmm_sw1_sheet_0, 12, banim_swmm_sw1_oam_frame_7_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 13, banim_swmm_sw1_oam_frame_8_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 14, banim_swmm_sw1_oam_frame_9_r - banim_swmm_sw1_oam_r
	banim_code_frame 25, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 15, banim_swmm_sw1_oam_frame_11_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 16, banim_swmm_sw1_oam_frame_12_r - banim_swmm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 4, banim_swmm_sw1_sheet_1, 17, banim_swmm_sw1_oam_frame_13_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 7, banim_swmm_sw1_sheet_1, 18, banim_swmm_sw1_oam_frame_14_r - banim_swmm_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 19, banim_swmm_sw1_oam_frame_15_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 20, banim_swmm_sw1_oam_frame_16_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 21, banim_swmm_sw1_oam_frame_17_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 22, banim_swmm_sw1_oam_frame_18_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 23, banim_swmm_sw1_oam_frame_19_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 24, banim_swmm_sw1_oam_frame_20_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 25, banim_swmm_sw1_oam_frame_21_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 26, banim_swmm_sw1_oam_frame_22_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 27, banim_swmm_sw1_oam_frame_23_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 29, banim_swmm_sw1_oam_frame_24_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 30, banim_swmm_sw1_oam_frame_25_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 32, banim_swmm_sw1_oam_frame_26_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 33, banim_swmm_sw1_oam_frame_27_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 35, banim_swmm_sw1_oam_frame_28_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 36, banim_swmm_sw1_oam_frame_29_r - banim_swmm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 37, banim_swmm_sw1_oam_frame_30_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 38, banim_swmm_sw1_oam_frame_31_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 39, banim_swmm_sw1_oam_frame_32_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 40, banim_swmm_sw1_oam_frame_33_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 41, banim_swmm_sw1_oam_frame_34_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 42, banim_swmm_sw1_oam_frame_35_r - banim_swmm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 8, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 25, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 4, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 7, banim_swmm_sw1_sheet_1, 96, banim_swmm_sw1_oam_frame_37_r - banim_swmm_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 1, banim_swmm_sw1_oam_frame_1_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 2, banim_swmm_sw1_oam_frame_38_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 3, banim_swmm_sw1_oam_frame_39_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 4, banim_swmm_sw1_oam_frame_40_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 5, banim_swmm_sw1_oam_frame_41_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 6, banim_swmm_sw1_oam_frame_42_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 43, banim_swmm_sw1_oam_frame_43_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 44, banim_swmm_sw1_oam_frame_44_r - banim_swmm_sw1_oam_r
	banim_code_frame 6, banim_swmm_sw1_sheet_2, 45, banim_swmm_sw1_oam_frame_45_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 46, banim_swmm_sw1_oam_frame_46_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 47, banim_swmm_sw1_oam_frame_47_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 48, banim_swmm_sw1_oam_frame_48_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 49, banim_swmm_sw1_oam_frame_49_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 50, banim_swmm_sw1_oam_frame_50_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 51, banim_swmm_sw1_oam_frame_51_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 52, banim_swmm_sw1_oam_frame_52_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 53, banim_swmm_sw1_oam_frame_53_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 54, banim_swmm_sw1_oam_frame_54_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 55, banim_swmm_sw1_oam_frame_55_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 56, banim_swmm_sw1_oam_frame_56_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 57, banim_swmm_sw1_oam_frame_57_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 58, banim_swmm_sw1_oam_frame_58_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 59, banim_swmm_sw1_oam_frame_59_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 60, banim_swmm_sw1_oam_frame_60_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 61, banim_swmm_sw1_oam_frame_61_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 62, banim_swmm_sw1_oam_frame_62_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 63, banim_swmm_sw1_oam_frame_63_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 64, banim_swmm_sw1_oam_frame_64_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 65, banim_swmm_sw1_oam_frame_65_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 66, banim_swmm_sw1_oam_frame_66_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 67, banim_swmm_sw1_oam_frame_67_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 66, banim_swmm_sw1_oam_frame_66_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 67, banim_swmm_sw1_oam_frame_67_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 68, banim_swmm_sw1_oam_frame_68_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 69, banim_swmm_sw1_oam_frame_69_r - banim_swmm_sw1_oam_r
	banim_code_frame 20, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 10, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 74, banim_swmm_sw1_oam_frame_70_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 76, banim_swmm_sw1_oam_frame_71_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 78, banim_swmm_sw1_oam_frame_73_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 81, banim_swmm_sw1_oam_frame_74_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 82, banim_swmm_sw1_oam_frame_75_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 85, banim_swmm_sw1_oam_frame_76_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 86, banim_swmm_sw1_oam_frame_77_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 87, banim_swmm_sw1_oam_frame_78_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 90, banim_swmm_sw1_oam_frame_79_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 17, banim_swmm_sw1_oam_frame_13_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 7, banim_swmm_sw1_sheet_1, 18, banim_swmm_sw1_oam_frame_14_r - banim_swmm_sw1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 19, banim_swmm_sw1_oam_frame_15_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 20, banim_swmm_sw1_oam_frame_16_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 21, banim_swmm_sw1_oam_frame_17_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 22, banim_swmm_sw1_oam_frame_18_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 23, banim_swmm_sw1_oam_frame_19_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 24, banim_swmm_sw1_oam_frame_20_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 25, banim_swmm_sw1_oam_frame_21_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 26, banim_swmm_sw1_oam_frame_22_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 27, banim_swmm_sw1_oam_frame_23_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 29, banim_swmm_sw1_oam_frame_24_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 30, banim_swmm_sw1_oam_frame_25_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 32, banim_swmm_sw1_oam_frame_26_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 33, banim_swmm_sw1_oam_frame_27_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 35, banim_swmm_sw1_oam_frame_28_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 36, banim_swmm_sw1_oam_frame_29_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 37, banim_swmm_sw1_oam_frame_30_r - banim_swmm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 38, banim_swmm_sw1_oam_frame_31_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 39, banim_swmm_sw1_oam_frame_32_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 40, banim_swmm_sw1_oam_frame_33_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 41, banim_swmm_sw1_oam_frame_34_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 42, banim_swmm_sw1_oam_frame_35_r - banim_swmm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 6, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 72, banim_swmm_sw1_oam_frame_80_r - banim_swmm_sw1_oam_r
	banim_code_frame 20, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 10, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 75, banim_swmm_sw1_oam_frame_81_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 77, banim_swmm_sw1_oam_frame_82_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 79, banim_swmm_sw1_oam_frame_83_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 80, banim_swmm_sw1_oam_frame_84_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_swmm_sw1_sheet_3, 83, banim_swmm_sw1_oam_frame_85_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 84, banim_swmm_sw1_oam_frame_86_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 89, banim_swmm_sw1_oam_frame_87_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_3, 88, banim_swmm_sw1_oam_frame_88_r - banim_swmm_sw1_oam_r
	banim_code_frame 10, banim_swmm_sw1_sheet_3, 73, banim_swmm_sw1_oam_frame_72_r - banim_swmm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 7, banim_swmm_sw1_sheet_1, 96, banim_swmm_sw1_oam_frame_37_r - banim_swmm_sw1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 71, banim_swmm_sw1_oam_frame_36_r - banim_swmm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_swmm_sw1_sheet_2, 91, banim_swmm_sw1_oam_frame_89_r - banim_swmm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 92, banim_swmm_sw1_oam_frame_90_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_swmm_sw1_sheet_2, 91, banim_swmm_sw1_oam_frame_89_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_swmm_sw1_sheet_2, 91, banim_swmm_sw1_oam_frame_89_r - banim_swmm_sw1_oam_r
	banim_code_frame 5, banim_swmm_sw1_sheet_2, 93, banim_swmm_sw1_oam_frame_91_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_2, 94, banim_swmm_sw1_oam_frame_92_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 93, banim_swmm_sw1_oam_frame_91_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_2, 94, banim_swmm_sw1_oam_frame_92_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_2, 93, banim_swmm_sw1_oam_frame_91_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_2, 94, banim_swmm_sw1_oam_frame_92_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_2, 93, banim_swmm_sw1_oam_frame_91_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_2, 94, banim_swmm_sw1_oam_frame_92_r - banim_swmm_sw1_oam_r
	banim_code_frame 12, banim_swmm_sw1_sheet_2, 99, banim_swmm_sw1_oam_frame_93_r - banim_swmm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_swmm_sw1_sheet_2, 100, banim_swmm_sw1_oam_frame_94_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_swmm_sw1_sheet_2, 91, banim_swmm_sw1_oam_frame_89_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 98, banim_swmm_sw1_oam_frame_95_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 98, banim_swmm_sw1_oam_frame_95_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmm_sw1_mode_stand_close:
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmm_sw1_mode_stand:
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmm_sw1_mode_stand_range:
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 0, banim_swmm_sw1_oam_frame_0_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 1, banim_swmm_sw1_oam_frame_1_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 7, banim_swmm_sw1_oam_frame_2_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_0, 8, banim_swmm_sw1_oam_frame_3_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 9, banim_swmm_sw1_oam_frame_4_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 10, banim_swmm_sw1_oam_frame_5_r - banim_swmm_sw1_oam_r
	banim_code_frame 4, banim_swmm_sw1_sheet_0, 11, banim_swmm_sw1_oam_frame_6_r - banim_swmm_sw1_oam_r
	banim_code_frame 8, banim_swmm_sw1_sheet_0, 12, banim_swmm_sw1_oam_frame_7_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 13, banim_swmm_sw1_oam_frame_8_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 14, banim_swmm_sw1_oam_frame_9_r - banim_swmm_sw1_oam_r
	banim_code_frame 25, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 15, banim_swmm_sw1_oam_frame_11_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 16, banim_swmm_sw1_oam_frame_12_r - banim_swmm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 4, banim_swmm_sw1_sheet_1, 17, banim_swmm_sw1_oam_frame_13_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 97, banim_swmm_sw1_oam_frame_96_r - banim_swmm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 19, banim_swmm_sw1_oam_frame_15_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 20, banim_swmm_sw1_oam_frame_16_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 21, banim_swmm_sw1_oam_frame_17_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 70, banim_swmm_sw1_oam_frame_10_r - banim_swmm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 22, banim_swmm_sw1_oam_frame_18_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 23, banim_swmm_sw1_oam_frame_19_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 24, banim_swmm_sw1_oam_frame_20_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 25, banim_swmm_sw1_oam_frame_21_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 26, banim_swmm_sw1_oam_frame_22_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 27, banim_swmm_sw1_oam_frame_23_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 28, banim_swmm_sw1_oam_frame_97_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 30, banim_swmm_sw1_oam_frame_25_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 32, banim_swmm_sw1_oam_frame_26_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 33, banim_swmm_sw1_oam_frame_27_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 35, banim_swmm_sw1_oam_frame_28_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 36, banim_swmm_sw1_oam_frame_29_r - banim_swmm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 37, banim_swmm_sw1_oam_frame_30_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_0, 38, banim_swmm_sw1_oam_frame_31_r - banim_swmm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 39, banim_swmm_sw1_oam_frame_32_r - banim_swmm_sw1_oam_r
	banim_code_frame 1, banim_swmm_sw1_sheet_1, 40, banim_swmm_sw1_oam_frame_33_r - banim_swmm_sw1_oam_r
	banim_code_frame 2, banim_swmm_sw1_sheet_1, 41, banim_swmm_sw1_oam_frame_34_r - banim_swmm_sw1_oam_r
	banim_code_frame 3, banim_swmm_sw1_sheet_1, 42, banim_swmm_sw1_oam_frame_35_r - banim_swmm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_swmm_sw1_mode_attack_close - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_close_back - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_close_critical - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_close_critical_back - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_range - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_range_critical - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_dodge_close - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_dodge_range - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_stand_close - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_stand - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_stand_range - banim_swmm_sw1_script
	.word banim_swmm_sw1_mode_attack_miss - banim_swmm_sw1_script
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

