@ vim:ft=armv4
	.global banim_merm_sw1_script
	.global banim_merm_sw1_oam_r
	.global banim_merm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA
	.section .data.oam_l
banim_merm_sw1_oam_l:
banim_merm_sw1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x42, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x62, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3, 8, -16
	banim_frame_end
banim_merm_sw1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xE2, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -15, -24
	banim_frame_end
banim_merm_sw1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x5, -6, -16
	banim_frame_oam 0x8000, 0x1000, 0x7, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x45, -6, 0
	banim_frame_oam 0x0, 0x1000, 0x47, -14, 0
	banim_frame_oam 0x4000, 0x1000, 0x43, -5, 8
	banim_frame_oam 0x0, 0x1000, 0x63, -13, 8
	banim_frame_oam 0x8000, 0x1000, 0x4, 10, -8
	banim_frame_oam 0x0, 0x1000, 0x8, -22, -8
	banim_frame_end
banim_merm_sw1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x83, 5, -72
	banim_frame_oam 0x0, 0x1000, 0x64, 5, -64
	banim_frame_oam 0x0, 0x5000, 0x84, -1, -56
	banim_frame_oam 0x4000, 0x1000, 0xC4, 2, -40
	banim_frame_oam 0x0, 0x1000, 0xC6, -6, -40
	banim_frame_oam 0x0, 0x5000, 0xC7, -3, -32
	banim_frame_oam 0x8000, 0x1000, 0xC9, -11, -32
	banim_frame_oam 0x0, 0x5000, 0x66, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x68, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0xA6, -5, 0
	banim_frame_oam 0x0, 0x1000, 0xA8, -13, 0
	banim_frame_oam 0x4000, 0x1000, 0xEA, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -12, 8
	banim_frame_end
banim_merm_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x28, -1, -71
	banim_frame_oam 0x4000, 0x1000, 0x9, 4, -55
	banim_frame_oam 0x0, 0x1000, 0xB, -4, -55
	banim_frame_oam 0x0, 0x5000, 0x2A, 4, -47
	banim_frame_oam 0x8000, 0x1000, 0x2C, -4, -47
	banim_frame_oam 0x4000, 0x1000, 0x69, -3, -31
	banim_frame_oam 0x0, 0x1000, 0xC, -3, -23
	banim_frame_oam 0x4000, 0x1000, 0xCA, -7, 7
	banim_frame_oam 0x0, 0x1000, 0xCC, -15, 7
	banim_frame_oam 0x8000, 0x1000, 0x89, -14, -9
	banim_frame_end
banim_merm_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x28, 0, -76
	banim_frame_oam 0x4000, 0x1000, 0x9, 5, -60
	banim_frame_oam 0x0, 0x1000, 0xB, -3, -60
	banim_frame_oam 0x0, 0x5000, 0x2A, 5, -52
	banim_frame_oam 0x8000, 0x1000, 0x2C, -3, -52
	banim_frame_oam 0x4000, 0x1000, 0x69, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xC, -2, -28
	banim_frame_oam 0x4000, 0x1000, 0xCA, -7, 7
	banim_frame_oam 0x0, 0x1000, 0xCC, -15, 7
	banim_frame_oam 0x8000, 0x1000, 0x89, -14, -9
	banim_frame_end
banim_merm_sw1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x8A, 8, -63
	banim_frame_oam 0x8000, 0x1000, 0x8C, 0, -63
	banim_frame_oam 0x4000, 0x1000, 0x6B, 8, -71
	banim_frame_oam 0x0, 0x1000, 0x6D, 0, -71
	banim_frame_oam 0x8000, 0x1000, 0x8D, 0, -47
	banim_frame_oam 0x4000, 0x1000, 0xCA, -4, 7
	banim_frame_end
banim_merm_sw1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 0, -71
	banim_frame_oam 0x4000, 0x1000, 0xCA, 3, 7
	banim_frame_end
banim_merm_sw1_oam_frame_8_l:
	banim_frame_affine -195, -165, -165, 195, 1
	banim_frame_oam 0x100, 0x8000, 0xE, 3, -72
	banim_frame_oam 0x4000, 0x1000, 0xCA, 5, 8
	banim_frame_end
banim_merm_sw1_oam_frame_9_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0xE, 4, -75
	banim_frame_oam 0x4000, 0x1000, 0xCA, 10, 7
	banim_frame_end
banim_merm_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0xA000, 0xE, 5, -76
	banim_frame_oam 0x4000, 0x1000, 0xCA, 11, 7
	banim_frame_end
banim_merm_sw1_oam_frame_11_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0xE, 12, -77
	banim_frame_oam 0x4000, 0x1000, 0xCA, 18, 7
	banim_frame_end
banim_merm_sw1_oam_frame_12_l:
	banim_frame_affine -221, 127, 127, 221, 1
	banim_frame_oam 0x100, 0x8000, 0xE, 14, -75
	banim_frame_oam 0x4000, 0x1000, 0xCA, 18, 7
	banim_frame_end
banim_merm_sw1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, 25, -68
	banim_frame_oam 0x0, 0x1000, 0x91, 41, -46
	banim_frame_oam 0x0, 0x1000, 0x90, 25, -76
	banim_frame_oam 0x8000, 0x1000, 0xCD, 17, -76
	banim_frame_oam 0x8000, 0x1000, 0xD, 17, -60
	banim_frame_oam 0x0, 0x1000, 0x4D, 17, -44
	banim_frame_oam 0x4000, 0x1000, 0xCA, 20, 7
	banim_frame_end
banim_merm_sw1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x1000, 0x12, 41, -65
	banim_frame_oam 0x0, 0x1000, 0x52, 41, -49
	banim_frame_oam 0x8000, 0x1000, 0x13, 33, -58
	banim_frame_oam 0x0, 0x5000, 0x14, 17, -57
	banim_frame_oam 0x0, 0x1000, 0x55, 9, -49
	banim_frame_oam 0x4000, 0x1000, 0x53, 12, -41
	banim_frame_oam 0x8000, 0x1000, 0x73, 12, -33
	banim_frame_oam 0x8000, 0x1000, 0x72, 49, -65
	banim_frame_oam 0x4000, 0x1000, 0xD0, 27, 7
	banim_frame_oam 0x0, 0x0, 0xD0, 21, 7
	banim_frame_end
banim_merm_sw1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0xF0, -1, -72
	banim_frame_oam 0x4000, 0x1000, 0xF5, 19, -64
	banim_frame_oam 0x0, 0x1000, 0xF7, 11, -64
	banim_frame_oam 0x0, 0x1000, 0xF4, 3, -64
	banim_frame_oam 0x0, 0x5000, 0xB5, 14, -56
	banim_frame_oam 0x0, 0x5000, 0xB2, 27, -40
	banim_frame_oam 0x8000, 0x1000, 0xB4, 19, -40
	banim_frame_oam 0x4000, 0x1000, 0xF2, 27, -24
	banim_frame_oam 0x4000, 0x1000, 0xB0, 29, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 21, 8
	banim_frame_end
banim_merm_sw1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x74, 13, -81
	banim_frame_oam 0x0, 0x1000, 0x94, 25, -17
	banim_frame_oam 0x4000, 0x1000, 0x16, 15, -73
	banim_frame_oam 0x0, 0x5000, 0x36, 16, -65
	banim_frame_oam 0x4000, 0x1000, 0x75, 17, -49
	banim_frame_oam 0x4000, 0x1000, 0x95, 24, -41
	banim_frame_oam 0x0, 0x1000, 0x97, 16, -41
	banim_frame_oam 0x0, 0x5000, 0xB7, 24, -33
	banim_frame_oam 0x4000, 0x1000, 0xB0, 30, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 22, 8
	banim_frame_end
banim_merm_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x74, 14, -76
	banim_frame_oam 0x0, 0x1000, 0x94, 26, -12
	banim_frame_oam 0x4000, 0x1000, 0x16, 16, -68
	banim_frame_oam 0x0, 0x5000, 0x36, 17, -60
	banim_frame_oam 0x4000, 0x1000, 0x75, 18, -44
	banim_frame_oam 0x4000, 0x1000, 0x95, 25, -36
	banim_frame_oam 0x0, 0x1000, 0x97, 17, -36
	banim_frame_oam 0x0, 0x5000, 0xB7, 25, -28
	banim_frame_oam 0x4000, 0x1000, 0xB0, 30, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 22, 8
	banim_frame_end
banim_merm_sw1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0xF8, 53, -64
	banim_frame_oam 0x0, 0x5000, 0x18, 53, -56
	banim_frame_oam 0x4000, 0x1000, 0x58, 53, -40
	banim_frame_oam 0x0, 0x1000, 0x77, 69, -40
	banim_frame_oam 0x8000, 0x1000, 0x79, 69, -32
	banim_frame_oam 0x0, 0x1000, 0xB9, 69, -16
	banim_frame_oam 0x4000, 0x9000, 0x1A, 37, -32
	banim_frame_oam 0x4000, 0x5000, 0x5A, 37, -16
	banim_frame_oam 0x4000, 0x1000, 0x7A, 45, -8
	banim_frame_oam 0x0, 0x1000, 0x7C, 37, -8
	banim_frame_oam 0x8000, 0x5000, 0x1E, 29, -16
	banim_frame_oam 0x8000, 0x1000, 0x3F, 21, -8
	banim_frame_oam 0x0, 0x1000, 0x7F, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x78, 37, 0
	banim_frame_oam 0x0, 0x1000, 0x98, 37, -40
	banim_frame_oam 0x4000, 0x1000, 0x9A, 37, 8
	banim_frame_end
banim_merm_sw1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 39, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, 31, -16
	banim_frame_oam 0x8000, 0x1000, 0x43, 23, 0
	banim_frame_oam 0x8000, 0x1000, 0x3, 55, -16
	banim_frame_end
banim_merm_sw1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 37, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, 29, -16
	banim_frame_oam 0x8000, 0x1000, 0x47, 21, 0
	banim_frame_oam 0x8000, 0x1000, 0x7, 53, -8
	banim_frame_end
banim_merm_sw1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 57, -19
	banim_frame_oam 0x0, 0x1000, 0xC2, 49, -19
	banim_frame_oam 0x4000, 0x1000, 0xE2, 47, -27
	banim_frame_oam 0x0, 0x1000, 0xC3, 41, -35
	banim_frame_oam 0x4000, 0x1000, 0x83, 25, -24
	banim_frame_oam 0x0, 0x1000, 0x82, 25, -40
	banim_frame_oam 0x4000, 0x1000, 0xA2, 25, -32
	banim_frame_oam 0x4000, 0x1000, 0x85, 33, -16
	banim_frame_oam 0x0, 0x1000, 0x87, 25, -16
	banim_frame_oam 0x0, 0x5000, 0xA4, 33, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, 17, 8
	banim_frame_oam 0x8000, 0x1000, 0xA6, 25, -8
	banim_frame_end
banim_merm_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0xA7, 33, -16
	banim_frame_oam 0x8000, 0x1000, 0xA9, 25, -16
	banim_frame_oam 0x4000, 0x1000, 0xE8, 33, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, 25, 0
	banim_frame_oam 0x0, 0x5000, 0x68, 22, -32
	banim_frame_oam 0x0, 0x1000, 0x48, 22, -40
	banim_frame_oam 0x4000, 0x5000, 0xE4, 17, 8
	banim_frame_end
banim_merm_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 24, -64
	banim_frame_oam 0x4000, 0x1000, 0xA, 25, -48
	banim_frame_oam 0x0, 0x1000, 0xC, 17, -48
	banim_frame_oam 0x0, 0x5000, 0x2A, 25, -40
	banim_frame_oam 0x8000, 0x1000, 0x2C, 17, -40
	banim_frame_oam 0x4000, 0x1000, 0x6A, 25, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, 27, -16
	banim_frame_oam 0x0, 0x5000, 0xAA, 33, -8
	banim_frame_oam 0x8000, 0x1000, 0xAC, 25, -8
	banim_frame_oam 0x4000, 0x5000, 0xEB, 17, 8
	banim_frame_end
banim_merm_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x94, 28, -23
	banim_frame_oam 0x0, 0x5000, 0xB7, 27, -39
	banim_frame_oam 0x0, 0x5000, 0xD9, 27, -55
	banim_frame_oam 0x4000, 0x1000, 0xBA, 19, -63
	banim_frame_oam 0x0, 0x5000, 0xDB, 11, -55
	banim_frame_oam 0x0, 0x1000, 0xBC, 11, -39
	banim_frame_oam 0x0, 0x1000, 0x9C, 27, -71
	banim_frame_oam 0x8000, 0x1000, 0x9D, 34, 0
	banim_frame_oam 0x0, 0x1000, 0xBE, 26, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, 42, 8
	banim_frame_end
banim_merm_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0xD, 7, -59
	banim_frame_oam 0x0, 0x1000, 0x6C, 26, 8
	banim_frame_oam 0x0, 0x0, 0x6C, 18, 8
	banim_frame_end
banim_merm_sw1_oam_frame_26_l:
	banim_frame_affine -181, 180, 180, 181, 1
	banim_frame_oam 0x100, 0x8000, 0xD, 3, -59
	banim_frame_oam 0x0, 0x1000, 0x6C, 20, 8
	banim_frame_oam 0x0, 0x0, 0x6C, 12, 8
	banim_frame_end
banim_merm_sw1_oam_frame_27_l:
	banim_frame_affine -4, 255, 255, 4, 1
	banim_frame_oam 0x100, 0x8000, 0xD, -2, -62
	banim_frame_oam 0x0, 0x1000, 0x6C, 11, 8
	banim_frame_oam 0x0, 0x0, 0x6C, 3, 8
	banim_frame_end
banim_merm_sw1_oam_frame_28_l:
	banim_frame_affine 180, 181, 181, -180, 1
	banim_frame_oam 0x100, 0x8000, 0xD, -8, -61
	banim_frame_oam 0x0, 0x1000, 0x6C, 8, 8
	banim_frame_oam 0x0, 0x0, 0x6C, 0, 8
	banim_frame_end
banim_merm_sw1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x5000, 0x91, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0x90, 7, -32
	banim_frame_oam 0x0, 0x1000, 0xD0, 7, -16
	banim_frame_oam 0x0, 0x5000, 0x8E, -1, -56
	banim_frame_oam 0x4000, 0x1000, 0xCE, -1, -40
	banim_frame_oam 0x4000, 0x1000, 0xEF, -17, -56
	banim_frame_oam 0x0, 0x1000, 0xCD, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0x8C, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -9, -16
	banim_frame_end
banim_merm_sw1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x5000, 0x91, -4, -26
	banim_frame_oam 0x8000, 0x1000, 0x90, 4, -26
	banim_frame_oam 0x0, 0x1000, 0xD0, 4, -10
	banim_frame_oam 0x0, 0x5000, 0x8E, -4, -50
	banim_frame_oam 0x4000, 0x1000, 0xCE, -4, -34
	banim_frame_oam 0x4000, 0x1000, 0xEF, -20, -50
	banim_frame_oam 0x0, 0x1000, 0xCD, -12, -42
	banim_frame_oam 0x4000, 0x1000, 0x8C, -1, 8
	banim_frame_oam 0x4000, 0x0, 0x8C, -11, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -12, -10
	banim_frame_end
banim_merm_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x5000, 0x91, -6, -21
	banim_frame_oam 0x8000, 0x1000, 0x90, 2, -21
	banim_frame_oam 0x0, 0x1000, 0xD0, 2, -5
	banim_frame_oam 0x0, 0x5000, 0x8E, -6, -45
	banim_frame_oam 0x4000, 0x1000, 0xCE, -6, -29
	banim_frame_oam 0x4000, 0x1000, 0xEF, -22, -45
	banim_frame_oam 0x0, 0x1000, 0xCD, -14, -37
	banim_frame_oam 0x4000, 0x1000, 0x8C, -2, 8
	banim_frame_oam 0x4000, 0x0, 0x8C, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -14, -5
	banim_frame_end
banim_merm_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -2, -24
	banim_frame_oam 0x8000, 0x1000, 0x13, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x51, -2, -8
	banim_frame_oam 0x0, 0x1000, 0x53, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x54, 6, 8
	banim_frame_oam 0x0, 0x1000, 0x14, 14, -10
	banim_frame_oam 0x0, 0x1000, 0x34, -7, -32
	banim_frame_end
banim_merm_sw1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x1000, 0x53, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x54, 6, 8
	banim_frame_oam 0x0, 0x5000, 0x93, -2, -24
	banim_frame_oam 0x4000, 0x1000, 0xD3, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0xB2, 14, -16
	banim_frame_oam 0x0, 0x1000, 0x92, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x33, -10, -16
	banim_frame_end
banim_merm_sw1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x1000, 0xF2, -2, -16
	banim_frame_oam 0x0, 0x1000, 0x53, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x54, 6, 8
	banim_frame_oam 0x0, 0x5000, 0x93, -2, -24
	banim_frame_oam 0x4000, 0x1000, 0xD3, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0xB2, 14, -16
	banim_frame_oam 0x0, 0x1000, 0x92, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x33, -10, -16
	banim_frame_end
banim_merm_sw1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x15, -5, -24
	banim_frame_oam 0x4000, 0x1000, 0x55, -5, -8
	banim_frame_oam 0x4000, 0x1000, 0x75, -6, 0
	banim_frame_oam 0x0, 0x1000, 0x37, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x17, -13, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -12, 8
	banim_frame_end
banim_merm_sw1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x1A, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x57, 9, -10
	banim_frame_oam 0x0, 0x5000, 0xB5, -13, -33
	banim_frame_oam 0x0, 0x1000, 0x95, -5, -41
	banim_frame_end
banim_merm_sw1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0x97, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xD7, -7, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, -15, -24
	banim_frame_oam 0x0, 0x1000, 0xD9, 9, -10
	banim_frame_oam 0x0, 0x1000, 0x96, 17, -9
	banim_frame_oam 0x0, 0x1000, 0x77, -23, -17
	banim_frame_oam 0x4000, 0x1000, 0x78, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0xF3, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -12, 8
	banim_frame_oam 0x0, 0x5000, 0xB5, -14, -34
	banim_frame_oam 0x0, 0x1000, 0x95, -6, -42
	banim_frame_end
banim_merm_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xBA, -3, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, -11, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xF6, -2, 0
	banim_frame_oam 0x0, 0x1000, 0xF8, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0xF9, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xFB, -11, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, -3, -32
	banim_frame_end
banim_merm_sw1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0x5A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x9A, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x3B, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x1B, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x1C, 8, -21
	banim_frame_oam 0x4000, 0x1000, 0xF3, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -12, 8
	banim_frame_end
banim_merm_sw1_oam_frame_44_l:
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x20, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xA1, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x2, 5, -76
	banim_frame_oam 0x0, 0x1000, 0x42, 4, -60
	banim_frame_oam 0x8000, 0x1000, 0x62, 1, -52
	banim_frame_oam 0x0, 0x1000, 0xE1, 4, -36
	banim_frame_oam 0x0, 0x1000, 0xE2, -3, -68
	banim_frame_oam 0x0, 0x1000, 0x22, 5, -68
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_end
banim_merm_sw1_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, -1, -73
	banim_frame_oam 0x0, 0x5000, 0x23, -2, -65
	banim_frame_oam 0x0, 0x1000, 0x63, 7, -81
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x1000, 0x83, 6, -79
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -79
	banim_frame_oam 0x4000, 0x1000, 0xA3, -1, -71
	banim_frame_oam 0x0, 0x1000, 0xA5, -9, -71
	banim_frame_oam 0x4000, 0x1000, 0x64, -10, -63
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x1000, 0xE3, 14, -76
	banim_frame_oam 0x0, 0x1000, 0xE3, 6, -76
	banim_frame_oam 0x0, 0x1000, 0xE5, 22, -76
	banim_frame_oam 0x8000, 0x1000, 0xC4, -2, -76
	banim_frame_oam 0x0, 0x1000, 0xC3, -10, -76
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x3000, 0x83, 7, -71
	banim_frame_oam 0x0, 0x3000, 0x85, -1, -71
	banim_frame_oam 0x4000, 0x3000, 0xA3, 0, -79
	banim_frame_oam 0x0, 0x3000, 0xA5, -8, -79
	banim_frame_oam 0x4000, 0x3000, 0x64, -9, -87
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x3000, 0x3, 1, -76
	banim_frame_oam 0x0, 0x7000, 0x23, 0, -92
	banim_frame_oam 0x0, 0x3000, 0x63, 9, -68
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_50_l:
	banim_frame_oam 0x8000, 0x1000, 0x5, 5, -95
	banim_frame_oam 0x0, 0x1000, 0x26, -3, -87
	banim_frame_oam 0x0, 0x1000, 0x45, 5, -79
	banim_frame_oam 0x0, 0x1000, 0x45, 5, -71
	banim_frame_oam 0x0, 0x1000, 0x6, 5, -63
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x2000, 0x3, 0, -80
	banim_frame_oam 0x0, 0x6000, 0x23, 1, -96
	banim_frame_oam 0x0, 0x2000, 0x63, 0, -72
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_52_l:
	banim_frame_oam 0x4000, 0x2000, 0x83, -7, -82
	banim_frame_oam 0x0, 0x2000, 0x85, 9, -82
	banim_frame_oam 0x4000, 0x2000, 0xA3, 0, -90
	banim_frame_oam 0x0, 0x2000, 0xA5, 16, -90
	banim_frame_oam 0x4000, 0x2000, 0x64, 9, -98
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x0, 0xE3, -3, -91
	banim_frame_oam 0x0, 0x0, 0xE3, 5, -91
	banim_frame_oam 0x0, 0x0, 0xE5, -11, -91
	banim_frame_oam 0x8000, 0x0, 0xC4, 13, -91
	banim_frame_oam 0x0, 0x0, 0xC3, 21, -91
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x0, 0x83, -3, -100
	banim_frame_oam 0x0, 0x0, 0x85, 13, -100
	banim_frame_oam 0x4000, 0x0, 0xA3, 4, -92
	banim_frame_oam 0x0, 0x0, 0xA5, 20, -92
	banim_frame_oam 0x4000, 0x0, 0x64, 13, -84
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x0, 0x3, 7, -100
	banim_frame_oam 0x0, 0x4000, 0x23, 8, -92
	banim_frame_oam 0x0, 0x0, 0x63, 7, -108
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_56_l:
	banim_frame_oam 0x8000, 0x3000, 0x5, 14, -92
	banim_frame_oam 0x0, 0x3000, 0x26, 6, -92
	banim_frame_oam 0x0, 0x3000, 0x45, 14, -100
	banim_frame_oam 0x0, 0x3000, 0x45, 14, -108
	banim_frame_oam 0x0, 0x3000, 0x6, 14, -116
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_57_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, 12, -104
	banim_frame_oam 0x0, 0x5000, 0x23, 11, -96
	banim_frame_oam 0x0, 0x1000, 0x63, 20, -112
	banim_frame_oam 0x0, 0x1000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0x80, -10, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x21, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x1000, 0x83, 22, -109
	banim_frame_oam 0x0, 0x1000, 0x85, 14, -109
	banim_frame_oam 0x4000, 0x1000, 0xA3, 15, -101
	banim_frame_oam 0x0, 0x1000, 0xA5, 7, -101
	banim_frame_oam 0x4000, 0x1000, 0x64, 6, -93
	banim_frame_oam 0x0, 0x5000, 0x7, -2, -16
	banim_frame_oam 0x8000, 0x1000, 0x9, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x48, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x66, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x68, -10, 8
	banim_frame_end
banim_merm_sw1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x1000, 0xE3, 30, -107
	banim_frame_oam 0x0, 0x1000, 0xE3, 22, -107
	banim_frame_oam 0x0, 0x1000, 0xE5, 38, -107
	banim_frame_oam 0x8000, 0x1000, 0xC4, 14, -107
	banim_frame_oam 0x0, 0x1000, 0xC3, 6, -107
	banim_frame_oam 0x0, 0x5000, 0x86, -1, -8
	banim_frame_oam 0x8000, 0x1000, 0x88, -9, -8
	banim_frame_oam 0x4000, 0x1000, 0xC6, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -9, 8
	banim_frame_end
banim_merm_sw1_oam_frame_60_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -1, -8
	banim_frame_oam 0x8000, 0x1000, 0x88, -9, -8
	banim_frame_oam 0x4000, 0x1000, 0xC6, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -9, 8
	banim_frame_oam 0x4000, 0x3000, 0x83, 22, -100
	banim_frame_oam 0x0, 0x3000, 0x85, 14, -100
	banim_frame_oam 0x4000, 0x3000, 0xA3, 15, -108
	banim_frame_oam 0x0, 0x3000, 0xA5, 7, -108
	banim_frame_oam 0x4000, 0x3000, 0x64, 6, -116
	banim_frame_end
banim_merm_sw1_oam_frame_61_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -1, -8
	banim_frame_oam 0x8000, 0x1000, 0x88, -9, -8
	banim_frame_oam 0x4000, 0x1000, 0xC6, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -9, 8
	banim_frame_oam 0x4000, 0x3000, 0x3, 15, -101
	banim_frame_oam 0x0, 0x7000, 0x23, 14, -117
	banim_frame_oam 0x0, 0x3000, 0x63, 23, -93
	banim_frame_end
banim_merm_sw1_oam_frame_62_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -1, -8
	banim_frame_oam 0x8000, 0x1000, 0x88, -9, -8
	banim_frame_oam 0x4000, 0x1000, 0xC6, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -9, 8
	banim_frame_oam 0x8000, 0x1000, 0x5, 18, -117
	banim_frame_oam 0x0, 0x1000, 0x26, 10, -109
	banim_frame_oam 0x0, 0x1000, 0x45, 18, -101
	banim_frame_oam 0x0, 0x1000, 0x45, 18, -93
	banim_frame_oam 0x0, 0x1000, 0x6, 18, -85
	banim_frame_end
banim_merm_sw1_oam_frame_63_l:
	banim_frame_oam 0x4000, 0x1000, 0xE6, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x69, 3, -64
	banim_frame_oam 0x0, 0x1000, 0x49, 5, -72
	banim_frame_oam 0x0, 0x5000, 0xA, -2, -56
	banim_frame_oam 0x0, 0x5000, 0x4A, -4, -40
	banim_frame_oam 0x4000, 0x1000, 0x89, -5, -24
	banim_frame_oam 0x0, 0x5000, 0xA9, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0xE9, -7, 0
	banim_frame_oam 0x4000, 0x2000, 0x3, 14, -101
	banim_frame_oam 0x0, 0x6000, 0x23, 15, -117
	banim_frame_oam 0x0, 0x2000, 0x63, 14, -93
	banim_frame_end
banim_merm_sw1_oam_frame_64_l:
	banim_frame_oam 0x0, 0x1000, 0xCB, -10, 6
	banim_frame_oam 0x8000, 0x1000, 0x8B, -9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEB, -6, 7
	banim_frame_oam 0x0, 0x5000, 0xC, -4, -68
	banim_frame_oam 0x4000, 0x1000, 0x4C, -3, -52
	banim_frame_oam 0x4000, 0x1000, 0x6C, -2, -44
	banim_frame_oam 0x4000, 0x1000, 0x8C, -4, -36
	banim_frame_oam 0x0, 0x1000, 0xAC, -5, -28
	banim_frame_oam 0x4000, 0x2000, 0x83, 5, -96
	banim_frame_oam 0x0, 0x2000, 0x85, 21, -96
	banim_frame_oam 0x4000, 0x2000, 0xA3, 12, -104
	banim_frame_oam 0x0, 0x2000, 0xA5, 28, -104
	banim_frame_oam 0x4000, 0x2000, 0x64, 21, -112
	banim_frame_end
banim_merm_sw1_oam_frame_65_l:
	banim_frame_oam 0x0, 0x1000, 0xCB, -10, 6
	banim_frame_oam 0x8000, 0x1000, 0x8B, -9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEB, -6, 7
	banim_frame_oam 0x0, 0x5000, 0xC, -4, -68
	banim_frame_oam 0x4000, 0x1000, 0x4C, -3, -52
	banim_frame_oam 0x4000, 0x1000, 0x6C, -2, -44
	banim_frame_oam 0x4000, 0x1000, 0x8C, -4, -36
	banim_frame_oam 0x0, 0x1000, 0xAC, -5, -28
	banim_frame_oam 0x0, 0x0, 0xE3, 8, -104
	banim_frame_oam 0x0, 0x0, 0xE3, 16, -104
	banim_frame_oam 0x0, 0x0, 0xE5, 0, -104
	banim_frame_oam 0x8000, 0x0, 0xC4, 24, -104
	banim_frame_oam 0x0, 0x0, 0xC3, 32, -104
	banim_frame_end
banim_merm_sw1_oam_frame_66_l:
	banim_frame_oam 0x0, 0x1000, 0xCB, -10, 6
	banim_frame_oam 0x8000, 0x1000, 0x8B, -9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEB, -6, 7
	banim_frame_oam 0x0, 0x5000, 0xC, -4, -76
	banim_frame_oam 0x4000, 0x1000, 0x4C, -3, -60
	banim_frame_oam 0x4000, 0x1000, 0x6C, -2, -52
	banim_frame_oam 0x4000, 0x1000, 0x8C, -4, -44
	banim_frame_oam 0x0, 0x1000, 0xAC, -5, -36
	banim_frame_oam 0x4000, 0x0, 0x83, 8, -108
	banim_frame_oam 0x0, 0x0, 0x85, 24, -108
	banim_frame_oam 0x4000, 0x0, 0xA3, 15, -100
	banim_frame_oam 0x0, 0x0, 0xA5, 31, -100
	banim_frame_oam 0x4000, 0x0, 0x64, 24, -92
	banim_frame_end
banim_merm_sw1_oam_frame_67_l:
	banim_frame_oam 0x0, 0x1000, 0xCB, -10, 6
	banim_frame_oam 0x8000, 0x1000, 0x8B, -9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEB, -6, 7
	banim_frame_oam 0x0, 0x5000, 0xC, -4, -76
	banim_frame_oam 0x4000, 0x1000, 0x4C, -3, -60
	banim_frame_oam 0x4000, 0x1000, 0x6C, -2, -52
	banim_frame_oam 0x4000, 0x1000, 0x8C, -4, -44
	banim_frame_oam 0x0, 0x1000, 0xAC, -5, -36
	banim_frame_oam 0x4000, 0x0, 0x3, 17, -105
	banim_frame_oam 0x0, 0x4000, 0x23, 18, -97
	banim_frame_oam 0x0, 0x0, 0x63, 17, -113
	banim_frame_end
banim_merm_sw1_oam_frame_68_l:
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -78
	banim_frame_oam 0x8000, 0x1000, 0x10, -7, -78
	banim_frame_oam 0x4000, 0x1000, 0x4E, -2, -62
	banim_frame_oam 0x0, 0x1000, 0x6E, -2, -54
	banim_frame_oam 0x8000, 0x3000, 0x5, 22, -94
	banim_frame_oam 0x0, 0x3000, 0x26, 14, -94
	banim_frame_oam 0x0, 0x3000, 0x45, 22, -102
	banim_frame_oam 0x0, 0x3000, 0x45, 22, -110
	banim_frame_oam 0x0, 0x3000, 0x6, 22, -118
	banim_frame_oam 0x4000, 0x1000, 0xEB, -4, 7
	banim_frame_end
banim_merm_sw1_oam_frame_69_l:
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -78
	banim_frame_oam 0x8000, 0x1000, 0x10, -7, -78
	banim_frame_oam 0x4000, 0x1000, 0x4E, -2, -62
	banim_frame_oam 0x0, 0x1000, 0x6E, -2, -54
	banim_frame_oam 0x4000, 0x1000, 0xEB, -3, 7
	banim_frame_oam 0x4000, 0x1000, 0x3, 18, -103
	banim_frame_oam 0x0, 0x5000, 0x23, 17, -95
	banim_frame_oam 0x0, 0x1000, 0x63, 26, -111
	banim_frame_end
banim_merm_sw1_oam_frame_70_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, 18, -103
	banim_frame_oam 0x0, 0x5000, 0x23, 17, -95
	banim_frame_oam 0x0, 0x1000, 0x63, 26, -111
	banim_frame_oam 0x0, 0x9000, 0x8E, -6, -89
	banim_frame_oam 0x4000, 0x1000, 0xEB, 1, 7
	banim_frame_end
banim_merm_sw1_oam_frame_71_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x4000, 0x1000, 0x83, 26, -104
	banim_frame_oam 0x0, 0x1000, 0x85, 18, -104
	banim_frame_oam 0x4000, 0x1000, 0xA3, 19, -96
	banim_frame_oam 0x0, 0x1000, 0xA5, 11, -96
	banim_frame_oam 0x4000, 0x1000, 0x64, 10, -88
	banim_frame_oam 0x100, 0x8000, 0x8E, -3, -90
	banim_frame_oam 0x4000, 0x1000, 0xEB, 4, 7
	banim_frame_end
banim_merm_sw1_oam_frame_72_l:
	banim_frame_affine 255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 0, -90
	banim_frame_oam 0x4000, 0x1000, 0xEB, 6, 7
	banim_frame_oam 0x0, 0x1000, 0xE3, 34, -96
	banim_frame_oam 0x0, 0x1000, 0xE3, 26, -96
	banim_frame_oam 0x0, 0x1000, 0xE5, 42, -96
	banim_frame_oam 0x8000, 0x1000, 0xC4, 18, -96
	banim_frame_oam 0x0, 0x1000, 0xC3, 10, -96
	banim_frame_end
banim_merm_sw1_oam_frame_73_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 0, -90
	banim_frame_oam 0x4000, 0x1000, 0xEB, 7, 7
	banim_frame_oam 0x4000, 0x3000, 0x83, 27, -88
	banim_frame_oam 0x0, 0x3000, 0x85, 19, -88
	banim_frame_oam 0x4000, 0x3000, 0xA3, 20, -96
	banim_frame_oam 0x0, 0x3000, 0xA5, 12, -96
	banim_frame_oam 0x4000, 0x3000, 0x64, 11, -104
	banim_frame_end
banim_merm_sw1_oam_frame_74_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 0, -90
	banim_frame_oam 0x4000, 0x1000, 0xEB, 8, 7
	banim_frame_oam 0x4000, 0x3000, 0x3, 22, -89
	banim_frame_oam 0x0, 0x7000, 0x23, 21, -105
	banim_frame_oam 0x0, 0x3000, 0x63, 30, -81
	banim_frame_end
banim_merm_sw1_oam_frame_75_l:
	banim_frame_affine -181, 180, 180, 181, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 1, -89
	banim_frame_oam 0x4000, 0x1000, 0xEB, 9, 7
	banim_frame_oam 0x8000, 0x1000, 0x5, 27, -105
	banim_frame_oam 0x0, 0x1000, 0x26, 19, -97
	banim_frame_oam 0x0, 0x1000, 0x45, 27, -89
	banim_frame_oam 0x0, 0x1000, 0x45, 27, -81
	banim_frame_oam 0x0, 0x1000, 0x6, 27, -73
	banim_frame_end
banim_merm_sw1_oam_frame_76_l:
	banim_frame_affine -181, 180, 180, 181, 1
	banim_frame_oam 0x4000, 0x2000, 0x3, 22, -87
	banim_frame_oam 0x0, 0x6000, 0x23, 23, -103
	banim_frame_oam 0x0, 0x2000, 0x63, 22, -79
	banim_frame_oam 0x100, 0x8000, 0x8E, 1, -89
	banim_frame_oam 0x4000, 0x1000, 0xEB, 10, 7
	banim_frame_end
banim_merm_sw1_oam_frame_77_l:
	banim_frame_oam 0x4000, 0x2000, 0x83, 11, -79
	banim_frame_oam 0x0, 0x2000, 0x85, 27, -79
	banim_frame_oam 0x4000, 0x2000, 0xA3, 18, -87
	banim_frame_oam 0x0, 0x2000, 0xA5, 34, -87
	banim_frame_oam 0x4000, 0x2000, 0x64, 27, -95
	banim_frame_oam 0x0, 0x9000, 0x8E, 1, -88
	banim_frame_oam 0x4000, 0x1000, 0xEB, 11, 7
	banim_frame_end
banim_merm_sw1_oam_frame_78_l:
	banim_frame_oam 0x0, 0x0, 0xE3, 14, -83
	banim_frame_oam 0x0, 0x0, 0xE3, 22, -83
	banim_frame_oam 0x0, 0x0, 0xE5, 6, -83
	banim_frame_oam 0x8000, 0x0, 0xC4, 30, -83
	banim_frame_oam 0x0, 0x0, 0xC3, 38, -83
	banim_frame_oam 0x0, 0x9000, 0x8E, 1, -88
	banim_frame_oam 0x4000, 0x1000, 0xEB, 12, 7
	banim_frame_end
banim_merm_sw1_oam_frame_79_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x83, 10, -86
	banim_frame_oam 0x0, 0x0, 0x85, 26, -86
	banim_frame_oam 0x4000, 0x0, 0xA3, 17, -78
	banim_frame_oam 0x0, 0x0, 0xA5, 33, -78
	banim_frame_oam 0x4000, 0x0, 0x64, 26, -70
	banim_frame_oam 0x100, 0x8000, 0x8E, 2, -84
	banim_frame_oam 0x4000, 0x1000, 0xEB, 13, 7
	banim_frame_end
banim_merm_sw1_oam_frame_80_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 2, -84
	banim_frame_oam 0x4000, 0x1000, 0xEB, 14, 7
	banim_frame_oam 0x4000, 0x0, 0x3, 23, -80
	banim_frame_oam 0x0, 0x4000, 0x23, 24, -72
	banim_frame_oam 0x0, 0x0, 0x63, 23, -88
	banim_frame_end
banim_merm_sw1_oam_frame_81_l:
	banim_frame_affine 255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, 3, -80
	banim_frame_oam 0x4000, 0x1000, 0xEB, 15, 7
	banim_frame_oam 0x8000, 0x3000, 0x5, 31, -69
	banim_frame_oam 0x0, 0x3000, 0x26, 23, -69
	banim_frame_oam 0x0, 0x3000, 0x45, 31, -77
	banim_frame_oam 0x0, 0x3000, 0x45, 31, -85
	banim_frame_oam 0x0, 0x3000, 0x6, 31, -93
	banim_frame_end
banim_merm_sw1_oam_frame_82_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x4000, 0x1000, 0x3, 27, -78
	banim_frame_oam 0x0, 0x5000, 0x23, 26, -70
	banim_frame_oam 0x0, 0x1000, 0x63, 35, -86
	banim_frame_oam 0x100, 0x8000, 0x8E, 5, -78
	banim_frame_oam 0x4000, 0x1000, 0xEB, 16, 7
	banim_frame_end
banim_merm_sw1_oam_frame_83_l:
	banim_frame_affine 0, 255, 255, 0, 1
	banim_frame_oam 0x4000, 0x1000, 0x83, 37, -71
	banim_frame_oam 0x0, 0x1000, 0x85, 29, -71
	banim_frame_oam 0x4000, 0x1000, 0xA3, 30, -63
	banim_frame_oam 0x0, 0x1000, 0xA5, 22, -63
	banim_frame_oam 0x4000, 0x1000, 0x64, 21, -55
	banim_frame_oam 0x100, 0x8000, 0x8E, 6, -75
	banim_frame_oam 0x4000, 0x1000, 0xEB, 17, 7
	banim_frame_end
banim_merm_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_merm_sw1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_merm_sw1_oam_frame_84_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_merm_sw1_oam_frame_88_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -1, -16
	banim_frame_oam 0x8000, 0x1000, 0x13, -9, -16
	banim_frame_oam 0x4000, 0x5000, 0x6F, -17, -24
	banim_frame_oam 0x4000, 0x1000, 0x50, -1, 0
	banim_frame_oam 0x0, 0x1000, 0x52, -9, 0
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_end
banim_merm_sw1_oam_frame_89_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -2, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0x73, -2, -24
	banim_frame_end
banim_merm_sw1_oam_frame_85_l:
	banim_frame_oam 0x8000, 0x1000, 0x79, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x95, -10, 0
	banim_frame_oam 0x0, 0x1000, 0x53, -19, -32
	banim_frame_oam 0x0, 0x1000, 0xCD, -11, -40
	banim_frame_oam 0x0, 0x1000, 0xAD, -19, -40
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_oam 0x0, 0x5000, 0x14, -3, -32
	banim_frame_oam 0x8000, 0x1000, 0x16, -11, -32
	banim_frame_oam 0x4000, 0x1000, 0x54, -3, -16
	banim_frame_oam 0x0, 0x1000, 0x56, -11, -16
	banim_frame_oam 0x4000, 0x1000, 0x75, -10, -8
	banim_frame_end
banim_merm_sw1_oam_frame_86_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, -5, -40
	banim_frame_oam 0x8000, 0x1000, 0x79, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x97, -5, -8
	banim_frame_oam 0x4000, 0x1000, 0xB5, -6, 0
	banim_frame_oam 0x0, 0x5000, 0xD5, -13, -56
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_end
banim_merm_sw1_oam_frame_87_l:
	banim_frame_oam 0x8000, 0x1000, 0x79, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x97, -5, -8
	banim_frame_oam 0x4000, 0x1000, 0xB5, -6, 0
	banim_frame_oam 0x0, 0x1000, 0xB7, 0, -32
	banim_frame_oam 0x0, 0x5000, 0xD7, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xB8, -8, -56
	banim_frame_oam 0x8000, 0x5000, 0x17, 3, -40
	banim_frame_oam 0x8000, 0x1000, 0x58, -5, -24
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_end
banim_merm_sw1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x1000, 0x81, 67, -15
	banim_frame_oam 0x0, 0x1000, 0x80, 75, -15
	banim_frame_oam 0x0, 0x1000, 0xA0, 59, -12
	banim_frame_end
banim_merm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x1000, 0x81, 65, -12
	banim_frame_oam 0x0, 0x1000, 0x80, 73, -12
	banim_frame_oam 0x0, 0x1000, 0xA0, 57, -9
	banim_frame_end
banim_merm_sw1_oam_frame_90_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 39, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, 31, -16
	banim_frame_oam 0x8000, 0x1000, 0x43, 23, 0
	banim_frame_oam 0x8000, 0x1000, 0x3, 55, -16
	banim_frame_oam 0x8000, 0x1000, 0x81, 67, -15
	banim_frame_oam 0x0, 0x1000, 0x80, 75, -15
	banim_frame_oam 0x0, 0x1000, 0xA0, 59, -12
	banim_frame_end
banim_merm_sw1_oam_frame_91_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 37, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, 29, -16
	banim_frame_oam 0x8000, 0x1000, 0x47, 21, 0
	banim_frame_oam 0x8000, 0x1000, 0x7, 53, -8
	banim_frame_oam 0x8000, 0x1000, 0x81, 65, -12
	banim_frame_oam 0x0, 0x1000, 0x80, 73, -12
	banim_frame_oam 0x0, 0x1000, 0xA0, 57, -9
	banim_frame_end
	.section .data.oam_r
banim_merm_sw1_oam_r:
banim_merm_sw1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -24
	banim_frame_oam 0x0, 0x0, 0x42, 8, -8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x0, 0x0, 0x62, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3, -16, -16
	banim_frame_end
banim_merm_sw1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -17, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE2, -11, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 5, 8
	banim_frame_oam 0x4000, 0x0, 0xE5, -1, -24
	banim_frame_end
banim_merm_sw1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x5, -10, -16
	banim_frame_oam 0x8000, 0x0, 0x7, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x45, -10, 0
	banim_frame_oam 0x0, 0x0, 0x47, 6, 0
	banim_frame_oam 0x4000, 0x0, 0x43, -11, 8
	banim_frame_oam 0x0, 0x0, 0x63, 5, 8
	banim_frame_oam 0x8000, 0x0, 0x4, -18, -8
	banim_frame_oam 0x0, 0x0, 0x8, 14, -8
	banim_frame_end
banim_merm_sw1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x83, -13, -72
	banim_frame_oam 0x0, 0x0, 0x64, -13, -64
	banim_frame_oam 0x0, 0x4000, 0x84, -15, -56
	banim_frame_oam 0x4000, 0x0, 0xC4, -18, -40
	banim_frame_oam 0x0, 0x0, 0xC6, -2, -40
	banim_frame_oam 0x0, 0x4000, 0xC7, -13, -32
	banim_frame_oam 0x8000, 0x0, 0xC9, 3, -32
	banim_frame_oam 0x0, 0x4000, 0x66, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x68, 5, -16
	banim_frame_oam 0x4000, 0x0, 0xA6, -11, 0
	banim_frame_oam 0x0, 0x0, 0xA8, 5, 0
	banim_frame_oam 0x4000, 0x0, 0xEA, -12, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 4, 8
	banim_frame_end
banim_merm_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x28, -15, -71
	banim_frame_oam 0x4000, 0x0, 0x9, -20, -55
	banim_frame_oam 0x0, 0x0, 0xB, -4, -55
	banim_frame_oam 0x0, 0x4000, 0x2A, -20, -47
	banim_frame_oam 0x8000, 0x0, 0x2C, -4, -47
	banim_frame_oam 0x4000, 0x0, 0x69, -13, -31
	banim_frame_oam 0x0, 0x0, 0xC, -5, -23
	banim_frame_oam 0x4000, 0x0, 0xCA, -9, 7
	banim_frame_oam 0x0, 0x0, 0xCC, 7, 7
	banim_frame_oam 0x8000, 0x0, 0x89, 6, -9
	banim_frame_end
banim_merm_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x28, -16, -76
	banim_frame_oam 0x4000, 0x0, 0x9, -21, -60
	banim_frame_oam 0x0, 0x0, 0xB, -5, -60
	banim_frame_oam 0x0, 0x4000, 0x2A, -21, -52
	banim_frame_oam 0x8000, 0x0, 0x2C, -5, -52
	banim_frame_oam 0x4000, 0x0, 0x69, -14, -36
	banim_frame_oam 0x0, 0x0, 0xC, -6, -28
	banim_frame_oam 0x4000, 0x0, 0xCA, -9, 7
	banim_frame_oam 0x0, 0x0, 0xCC, 7, 7
	banim_frame_oam 0x8000, 0x0, 0x89, 6, -9
	banim_frame_end
banim_merm_sw1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0x8A, -24, -63
	banim_frame_oam 0x8000, 0x0, 0x8C, -8, -63
	banim_frame_oam 0x4000, 0x0, 0x6B, -24, -71
	banim_frame_oam 0x0, 0x0, 0x6D, -8, -71
	banim_frame_oam 0x8000, 0x0, 0x8D, -8, -47
	banim_frame_oam 0x4000, 0x0, 0xCA, -12, 7
	banim_frame_end
banim_merm_sw1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -32, -71
	banim_frame_oam 0x4000, 0x0, 0xCA, -19, 7
	banim_frame_end
banim_merm_sw1_oam_frame_8_r:
	banim_frame_affine 195, -165, 165, 195, 1
	banim_frame_oam 0x100, 0x8000, 0xE, -35, -72
	banim_frame_oam 0x4000, 0x0, 0xCA, -21, 8
	banim_frame_end
banim_merm_sw1_oam_frame_9_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0xE, -36, -75
	banim_frame_oam 0x4000, 0x0, 0xCA, -26, 7
	banim_frame_end
banim_merm_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0xB000, 0xE, -37, -76
	banim_frame_oam 0x4000, 0x0, 0xCA, -27, 7
	banim_frame_end
banim_merm_sw1_oam_frame_11_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0xE, -44, -77
	banim_frame_oam 0x4000, 0x0, 0xCA, -34, 7
	banim_frame_end
banim_merm_sw1_oam_frame_12_r:
	banim_frame_affine 221, 127, -127, 221, 1
	banim_frame_oam 0x100, 0x8000, 0xE, -46, -75
	banim_frame_oam 0x4000, 0x0, 0xCA, -34, 7
	banim_frame_end
banim_merm_sw1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -41, -68
	banim_frame_oam 0x0, 0x0, 0x91, -49, -46
	banim_frame_oam 0x0, 0x0, 0x90, -33, -76
	banim_frame_oam 0x8000, 0x0, 0xCD, -25, -76
	banim_frame_oam 0x8000, 0x0, 0xD, -25, -60
	banim_frame_oam 0x0, 0x0, 0x4D, -25, -44
	banim_frame_oam 0x4000, 0x0, 0xCA, -36, 7
	banim_frame_end
banim_merm_sw1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x0, 0x12, -49, -65
	banim_frame_oam 0x0, 0x0, 0x52, -49, -49
	banim_frame_oam 0x8000, 0x0, 0x13, -41, -58
	banim_frame_oam 0x0, 0x4000, 0x14, -33, -57
	banim_frame_oam 0x0, 0x0, 0x55, -17, -49
	banim_frame_oam 0x4000, 0x0, 0x53, -28, -41
	banim_frame_oam 0x8000, 0x0, 0x73, -20, -33
	banim_frame_oam 0x8000, 0x0, 0x72, -57, -65
	banim_frame_oam 0x4000, 0x0, 0xD0, -43, 7
	banim_frame_oam 0x0, 0x1000, 0xD0, -29, 7
	banim_frame_end
banim_merm_sw1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0xF0, -15, -72
	banim_frame_oam 0x4000, 0x0, 0xF5, -35, -64
	banim_frame_oam 0x0, 0x0, 0xF7, -19, -64
	banim_frame_oam 0x0, 0x0, 0xF4, -11, -64
	banim_frame_oam 0x0, 0x4000, 0xB5, -30, -56
	banim_frame_oam 0x0, 0x4000, 0xB2, -43, -40
	banim_frame_oam 0x8000, 0x0, 0xB4, -27, -40
	banim_frame_oam 0x4000, 0x0, 0xF2, -43, -24
	banim_frame_oam 0x4000, 0x0, 0xB0, -45, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -29, 8
	banim_frame_end
banim_merm_sw1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x74, -21, -81
	banim_frame_oam 0x0, 0x0, 0x94, -33, -17
	banim_frame_oam 0x4000, 0x0, 0x16, -31, -73
	banim_frame_oam 0x0, 0x4000, 0x36, -32, -65
	banim_frame_oam 0x4000, 0x0, 0x75, -33, -49
	banim_frame_oam 0x4000, 0x0, 0x95, -40, -41
	banim_frame_oam 0x0, 0x0, 0x97, -24, -41
	banim_frame_oam 0x0, 0x4000, 0xB7, -40, -33
	banim_frame_oam 0x4000, 0x0, 0xB0, -46, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -30, 8
	banim_frame_end
banim_merm_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x74, -22, -76
	banim_frame_oam 0x0, 0x0, 0x94, -34, -12
	banim_frame_oam 0x4000, 0x0, 0x16, -32, -68
	banim_frame_oam 0x0, 0x4000, 0x36, -33, -60
	banim_frame_oam 0x4000, 0x0, 0x75, -34, -44
	banim_frame_oam 0x4000, 0x0, 0x95, -41, -36
	banim_frame_oam 0x0, 0x0, 0x97, -25, -36
	banim_frame_oam 0x0, 0x4000, 0xB7, -41, -28
	banim_frame_oam 0x4000, 0x0, 0xB0, -46, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -30, 8
	banim_frame_end
banim_merm_sw1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0xF8, -61, -64
	banim_frame_oam 0x0, 0x4000, 0x18, -69, -56
	banim_frame_oam 0x4000, 0x0, 0x58, -69, -40
	banim_frame_oam 0x0, 0x0, 0x77, -77, -40
	banim_frame_oam 0x8000, 0x0, 0x79, -77, -32
	banim_frame_oam 0x0, 0x0, 0xB9, -77, -16
	banim_frame_oam 0x4000, 0x8000, 0x1A, -69, -32
	banim_frame_oam 0x4000, 0x4000, 0x5A, -69, -16
	banim_frame_oam 0x4000, 0x0, 0x7A, -61, -8
	banim_frame_oam 0x0, 0x0, 0x7C, -45, -8
	banim_frame_oam 0x8000, 0x4000, 0x1E, -37, -16
	banim_frame_oam 0x8000, 0x0, 0x3F, -29, -8
	banim_frame_oam 0x0, 0x0, 0x7F, -29, 8
	banim_frame_oam 0x0, 0x0, 0x78, -45, 0
	banim_frame_oam 0x0, 0x0, 0x98, -45, -40
	banim_frame_oam 0x4000, 0x0, 0x9A, -53, 8
	banim_frame_end
banim_merm_sw1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -55, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, -39, -16
	banim_frame_oam 0x8000, 0x0, 0x43, -31, 0
	banim_frame_oam 0x8000, 0x0, 0x3, -63, -16
	banim_frame_end
banim_merm_sw1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -53, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, -37, -16
	banim_frame_oam 0x8000, 0x0, 0x47, -29, 0
	banim_frame_oam 0x8000, 0x0, 0x7, -61, -8
	banim_frame_end
banim_merm_sw1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -73, -19
	banim_frame_oam 0x0, 0x0, 0xC2, -57, -19
	banim_frame_oam 0x4000, 0x0, 0xE2, -63, -27
	banim_frame_oam 0x0, 0x0, 0xC3, -49, -35
	banim_frame_oam 0x4000, 0x0, 0x83, -41, -24
	banim_frame_oam 0x0, 0x0, 0x82, -33, -40
	banim_frame_oam 0x4000, 0x0, 0xA2, -41, -32
	banim_frame_oam 0x4000, 0x0, 0x85, -49, -16
	banim_frame_oam 0x0, 0x0, 0x87, -33, -16
	banim_frame_oam 0x0, 0x4000, 0xA4, -49, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -49, 8
	banim_frame_oam 0x8000, 0x0, 0xA6, -33, -8
	banim_frame_end
banim_merm_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0xA7, -49, -16
	banim_frame_oam 0x8000, 0x0, 0xA9, -33, -16
	banim_frame_oam 0x4000, 0x0, 0xE8, -49, 0
	banim_frame_oam 0x0, 0x0, 0xEA, -33, 0
	banim_frame_oam 0x0, 0x4000, 0x68, -38, -32
	banim_frame_oam 0x0, 0x0, 0x48, -30, -40
	banim_frame_oam 0x4000, 0x4000, 0xE4, -49, 8
	banim_frame_end
banim_merm_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -40, -64
	banim_frame_oam 0x4000, 0x0, 0xA, -41, -48
	banim_frame_oam 0x0, 0x0, 0xC, -25, -48
	banim_frame_oam 0x0, 0x4000, 0x2A, -41, -40
	banim_frame_oam 0x8000, 0x0, 0x2C, -25, -40
	banim_frame_oam 0x4000, 0x0, 0x6A, -41, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -43, -16
	banim_frame_oam 0x0, 0x4000, 0xAA, -49, -8
	banim_frame_oam 0x8000, 0x0, 0xAC, -33, -8
	banim_frame_oam 0x4000, 0x4000, 0xEB, -49, 8
	banim_frame_end
banim_merm_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x94, -36, -23
	banim_frame_oam 0x0, 0x4000, 0xB7, -43, -39
	banim_frame_oam 0x0, 0x4000, 0xD9, -43, -55
	banim_frame_oam 0x4000, 0x0, 0xBA, -35, -63
	banim_frame_oam 0x0, 0x4000, 0xDB, -27, -55
	banim_frame_oam 0x0, 0x0, 0xBC, -19, -39
	banim_frame_oam 0x0, 0x0, 0x9C, -35, -71
	banim_frame_oam 0x8000, 0x0, 0x9D, -42, 0
	banim_frame_oam 0x0, 0x0, 0xBE, -34, 8
	banim_frame_oam 0x0, 0x0, 0x9E, -50, 8
	banim_frame_end
banim_merm_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -39, -59
	banim_frame_oam 0x0, 0x0, 0x6C, -34, 8
	banim_frame_oam 0x0, 0x1000, 0x6C, -26, 8
	banim_frame_end
banim_merm_sw1_oam_frame_26_r:
	banim_frame_affine 181, 180, -180, 181, 1
	banim_frame_oam 0x100, 0x8000, 0xD, -35, -59
	banim_frame_oam 0x0, 0x0, 0x6C, -28, 8
	banim_frame_oam 0x0, 0x1000, 0x6C, -20, 8
	banim_frame_end
banim_merm_sw1_oam_frame_27_r:
	banim_frame_affine 4, 255, -255, 4, 1
	banim_frame_oam 0x100, 0x8000, 0xD, -30, -62
	banim_frame_oam 0x0, 0x0, 0x6C, -19, 8
	banim_frame_oam 0x0, 0x1000, 0x6C, -11, 8
	banim_frame_end
banim_merm_sw1_oam_frame_28_r:
	banim_frame_affine -180, 181, -181, -180, 1
	banim_frame_oam 0x100, 0x8000, 0xD, -24, -61
	banim_frame_oam 0x0, 0x0, 0x6C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x6C, -8, 8
	banim_frame_end
banim_merm_sw1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x4000, 0x91, -7, -32
	banim_frame_oam 0x8000, 0x0, 0x90, -15, -32
	banim_frame_oam 0x0, 0x0, 0xD0, -15, -16
	banim_frame_oam 0x0, 0x4000, 0x8E, -15, -56
	banim_frame_oam 0x4000, 0x0, 0xCE, -15, -40
	banim_frame_oam 0x4000, 0x0, 0xEF, 1, -56
	banim_frame_oam 0x0, 0x0, 0xCD, 1, -48
	banim_frame_oam 0x4000, 0x0, 0x8C, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 1, -16
	banim_frame_end
banim_merm_sw1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x4000, 0x91, -4, -26
	banim_frame_oam 0x8000, 0x0, 0x90, -12, -26
	banim_frame_oam 0x0, 0x0, 0xD0, -12, -10
	banim_frame_oam 0x0, 0x4000, 0x8E, -12, -50
	banim_frame_oam 0x4000, 0x0, 0xCE, -12, -34
	banim_frame_oam 0x4000, 0x0, 0xEF, 4, -50
	banim_frame_oam 0x0, 0x0, 0xCD, 4, -42
	banim_frame_oam 0x4000, 0x0, 0x8C, -15, 8
	banim_frame_oam 0x4000, 0x1000, 0x8C, -5, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 4, -10
	banim_frame_end
banim_merm_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x4000, 0x91, -2, -21
	banim_frame_oam 0x8000, 0x0, 0x90, -10, -21
	banim_frame_oam 0x0, 0x0, 0xD0, -10, -5
	banim_frame_oam 0x0, 0x4000, 0x8E, -10, -45
	banim_frame_oam 0x4000, 0x0, 0xCE, -10, -29
	banim_frame_oam 0x4000, 0x0, 0xEF, 6, -45
	banim_frame_oam 0x0, 0x0, 0xCD, 6, -37
	banim_frame_oam 0x4000, 0x0, 0x8C, -14, 8
	banim_frame_oam 0x4000, 0x1000, 0x8C, -4, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 6, -5
	banim_frame_end
banim_merm_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -14, -24
	banim_frame_oam 0x8000, 0x0, 0x13, 2, -24
	banim_frame_oam 0x4000, 0x0, 0x51, -14, -8
	banim_frame_oam 0x0, 0x0, 0x53, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x73, -6, 8
	banim_frame_oam 0x0, 0x0, 0x54, -14, 8
	banim_frame_oam 0x0, 0x0, 0x14, -22, -10
	banim_frame_oam 0x0, 0x0, 0x34, -1, -32
	banim_frame_end
banim_merm_sw1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x0, 0x53, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x73, -6, 8
	banim_frame_oam 0x0, 0x0, 0x54, -14, 8
	banim_frame_oam 0x0, 0x4000, 0x93, -14, -24
	banim_frame_oam 0x4000, 0x0, 0xD3, -14, -8
	banim_frame_oam 0x8000, 0x0, 0xB2, -22, -16
	banim_frame_oam 0x0, 0x0, 0x92, -8, -32
	banim_frame_oam 0x0, 0x0, 0x33, 2, -16
	banim_frame_end
banim_merm_sw1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x0, 0xF2, -6, -16
	banim_frame_oam 0x0, 0x0, 0x53, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x73, -6, 8
	banim_frame_oam 0x0, 0x0, 0x54, -14, 8
	banim_frame_oam 0x0, 0x4000, 0x93, -14, -24
	banim_frame_oam 0x4000, 0x0, 0xD3, -14, -8
	banim_frame_oam 0x8000, 0x0, 0xB2, -22, -16
	banim_frame_oam 0x0, 0x0, 0x92, -8, -32
	banim_frame_oam 0x0, 0x0, 0x33, 2, -16
	banim_frame_end
banim_merm_sw1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -11, -24
	banim_frame_oam 0x4000, 0x0, 0x55, -11, -8
	banim_frame_oam 0x4000, 0x0, 0x75, -10, 0
	banim_frame_oam 0x0, 0x0, 0x37, 5, -32
	banim_frame_oam 0x0, 0x0, 0x17, 5, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 4, 8
	banim_frame_end
banim_merm_sw1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -9, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x1A, 7, -24
	banim_frame_oam 0x0, 0x0, 0x57, -17, -10
	banim_frame_oam 0x0, 0x4000, 0xB5, -3, -33
	banim_frame_oam 0x0, 0x0, 0x95, -3, -41
	banim_frame_end
banim_merm_sw1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0x97, -9, -24
	banim_frame_oam 0x4000, 0x0, 0xD7, -9, -8
	banim_frame_oam 0x8000, 0x0, 0x99, 7, -24
	banim_frame_oam 0x0, 0x0, 0xD9, -17, -10
	banim_frame_oam 0x0, 0x0, 0x96, -25, -9
	banim_frame_oam 0x0, 0x0, 0x77, 15, -17
	banim_frame_oam 0x4000, 0x0, 0x78, -9, 0
	banim_frame_oam 0x4000, 0x0, 0xF3, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 4, 8
	banim_frame_oam 0x0, 0x4000, 0xB5, -2, -34
	banim_frame_oam 0x0, 0x0, 0x95, -2, -42
	banim_frame_end
banim_merm_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xBA, -13, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xF6, -14, 0
	banim_frame_oam 0x0, 0x0, 0xF8, 2, 0
	banim_frame_oam 0x4000, 0x0, 0xF9, -13, -8
	banim_frame_oam 0x0, 0x0, 0xFB, 3, -8
	banim_frame_oam 0x0, 0x0, 0xFC, -5, -32
	banim_frame_end
banim_merm_sw1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0x5A, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x9A, -8, 0
	banim_frame_oam 0x4000, 0x0, 0x3B, -8, -24
	banim_frame_oam 0x0, 0x0, 0x1B, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1C, -16, -21
	banim_frame_oam 0x4000, 0x0, 0xF3, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 4, 8
	banim_frame_end
banim_merm_sw1_oam_frame_44_r:
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x4000, 0x20, -6, -16
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x0, 0x0, 0xA1, -8, -32
	banim_frame_oam 0x0, 0x0, 0x2, -13, -76
	banim_frame_oam 0x0, 0x0, 0x42, -12, -60
	banim_frame_oam 0x8000, 0x0, 0x62, -9, -52
	banim_frame_oam 0x0, 0x0, 0xE1, -12, -36
	banim_frame_oam 0x0, 0x0, 0xE2, -5, -68
	banim_frame_oam 0x0, 0x0, 0x22, -13, -68
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_end
banim_merm_sw1_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x0, 0x3, -15, -73
	banim_frame_oam 0x0, 0x4000, 0x23, -14, -65
	banim_frame_oam 0x0, 0x0, 0x63, -15, -81
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x0, 0x83, -22, -79
	banim_frame_oam 0x0, 0x0, 0x85, -6, -79
	banim_frame_oam 0x4000, 0x0, 0xA3, -15, -71
	banim_frame_oam 0x0, 0x0, 0xA5, 1, -71
	banim_frame_oam 0x4000, 0x0, 0x64, -6, -63
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x0, 0xE3, -22, -76
	banim_frame_oam 0x0, 0x0, 0xE3, -14, -76
	banim_frame_oam 0x0, 0x0, 0xE5, -30, -76
	banim_frame_oam 0x8000, 0x0, 0xC4, -6, -76
	banim_frame_oam 0x0, 0x0, 0xC3, 2, -76
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x2000, 0x83, -23, -71
	banim_frame_oam 0x0, 0x2000, 0x85, -7, -71
	banim_frame_oam 0x4000, 0x2000, 0xA3, -16, -79
	banim_frame_oam 0x0, 0x2000, 0xA5, 0, -79
	banim_frame_oam 0x4000, 0x2000, 0x64, -7, -87
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x2000, 0x3, -17, -76
	banim_frame_oam 0x0, 0x6000, 0x23, -16, -92
	banim_frame_oam 0x0, 0x2000, 0x63, -17, -68
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_50_r:
	banim_frame_oam 0x8000, 0x0, 0x5, -13, -95
	banim_frame_oam 0x0, 0x0, 0x26, -5, -87
	banim_frame_oam 0x0, 0x0, 0x45, -13, -79
	banim_frame_oam 0x0, 0x0, 0x45, -13, -71
	banim_frame_oam 0x0, 0x0, 0x6, -13, -63
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x3000, 0x3, -16, -80
	banim_frame_oam 0x0, 0x7000, 0x23, -17, -96
	banim_frame_oam 0x0, 0x3000, 0x63, -8, -72
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_52_r:
	banim_frame_oam 0x4000, 0x3000, 0x83, -9, -82
	banim_frame_oam 0x0, 0x3000, 0x85, -17, -82
	banim_frame_oam 0x4000, 0x3000, 0xA3, -16, -90
	banim_frame_oam 0x0, 0x3000, 0xA5, -24, -90
	banim_frame_oam 0x4000, 0x3000, 0x64, -25, -98
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x1000, 0xE3, -5, -91
	banim_frame_oam 0x0, 0x1000, 0xE3, -13, -91
	banim_frame_oam 0x0, 0x1000, 0xE5, 3, -91
	banim_frame_oam 0x8000, 0x1000, 0xC4, -21, -91
	banim_frame_oam 0x0, 0x1000, 0xC3, -29, -91
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x1000, 0x83, -13, -100
	banim_frame_oam 0x0, 0x1000, 0x85, -21, -100
	banim_frame_oam 0x4000, 0x1000, 0xA3, -20, -92
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, -92
	banim_frame_oam 0x4000, 0x1000, 0x64, -29, -84
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x1000, 0x3, -23, -100
	banim_frame_oam 0x0, 0x5000, 0x23, -24, -92
	banim_frame_oam 0x0, 0x1000, 0x63, -15, -108
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_56_r:
	banim_frame_oam 0x8000, 0x2000, 0x5, -22, -92
	banim_frame_oam 0x0, 0x2000, 0x26, -14, -92
	banim_frame_oam 0x0, 0x2000, 0x45, -22, -100
	banim_frame_oam 0x0, 0x2000, 0x45, -22, -108
	banim_frame_oam 0x0, 0x2000, 0x6, -22, -116
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_57_r:
	banim_frame_oam 0x4000, 0x0, 0x3, -28, -104
	banim_frame_oam 0x0, 0x4000, 0x23, -27, -96
	banim_frame_oam 0x0, 0x0, 0x63, -28, -112
	banim_frame_oam 0x0, 0x0, 0xA0, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x60, -7, 0
	banim_frame_oam 0x4000, 0x0, 0x80, -6, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x21, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x0, 0x83, -38, -109
	banim_frame_oam 0x0, 0x0, 0x85, -22, -109
	banim_frame_oam 0x4000, 0x0, 0xA3, -31, -101
	banim_frame_oam 0x0, 0x0, 0xA5, -15, -101
	banim_frame_oam 0x4000, 0x0, 0x64, -22, -93
	banim_frame_oam 0x0, 0x4000, 0x7, -14, -16
	banim_frame_oam 0x8000, 0x0, 0x9, 2, -16
	banim_frame_oam 0x0, 0x0, 0x48, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x66, -14, 8
	banim_frame_oam 0x0, 0x0, 0x68, 2, 8
	banim_frame_end
banim_merm_sw1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x0, 0xE3, -38, -107
	banim_frame_oam 0x0, 0x0, 0xE3, -30, -107
	banim_frame_oam 0x0, 0x0, 0xE5, -46, -107
	banim_frame_oam 0x8000, 0x0, 0xC4, -22, -107
	banim_frame_oam 0x0, 0x0, 0xC3, -14, -107
	banim_frame_oam 0x0, 0x4000, 0x86, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x88, 1, -8
	banim_frame_oam 0x4000, 0x0, 0xC6, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 1, 8
	banim_frame_end
banim_merm_sw1_oam_frame_60_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x88, 1, -8
	banim_frame_oam 0x4000, 0x0, 0xC6, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 1, 8
	banim_frame_oam 0x4000, 0x2000, 0x83, -38, -100
	banim_frame_oam 0x0, 0x2000, 0x85, -22, -100
	banim_frame_oam 0x4000, 0x2000, 0xA3, -31, -108
	banim_frame_oam 0x0, 0x2000, 0xA5, -15, -108
	banim_frame_oam 0x4000, 0x2000, 0x64, -22, -116
	banim_frame_end
banim_merm_sw1_oam_frame_61_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x88, 1, -8
	banim_frame_oam 0x4000, 0x0, 0xC6, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 1, 8
	banim_frame_oam 0x4000, 0x2000, 0x3, -31, -101
	banim_frame_oam 0x0, 0x6000, 0x23, -30, -117
	banim_frame_oam 0x0, 0x2000, 0x63, -31, -93
	banim_frame_end
banim_merm_sw1_oam_frame_62_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x88, 1, -8
	banim_frame_oam 0x4000, 0x0, 0xC6, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 1, 8
	banim_frame_oam 0x8000, 0x0, 0x5, -26, -117
	banim_frame_oam 0x0, 0x0, 0x26, -18, -109
	banim_frame_oam 0x0, 0x0, 0x45, -26, -101
	banim_frame_oam 0x0, 0x0, 0x45, -26, -93
	banim_frame_oam 0x0, 0x0, 0x6, -26, -85
	banim_frame_end
banim_merm_sw1_oam_frame_63_r:
	banim_frame_oam 0x4000, 0x0, 0xE6, -12, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 4, 8
	banim_frame_oam 0x0, 0x0, 0x69, -11, -64
	banim_frame_oam 0x0, 0x0, 0x49, -13, -72
	banim_frame_oam 0x0, 0x4000, 0xA, -14, -56
	banim_frame_oam 0x0, 0x4000, 0x4A, -12, -40
	banim_frame_oam 0x4000, 0x0, 0x89, -11, -24
	banim_frame_oam 0x0, 0x4000, 0xA9, -10, -16
	banim_frame_oam 0x4000, 0x0, 0xE9, -9, 0
	banim_frame_oam 0x4000, 0x3000, 0x3, -30, -101
	banim_frame_oam 0x0, 0x7000, 0x23, -31, -117
	banim_frame_oam 0x0, 0x3000, 0x63, -22, -93
	banim_frame_end
banim_merm_sw1_oam_frame_64_r:
	banim_frame_oam 0x0, 0x0, 0xCB, 2, 6
	banim_frame_oam 0x8000, 0x0, 0x8B, 1, -10
	banim_frame_oam 0x4000, 0x0, 0xEB, -10, 7
	banim_frame_oam 0x0, 0x4000, 0xC, -12, -68
	banim_frame_oam 0x4000, 0x0, 0x4C, -13, -52
	banim_frame_oam 0x4000, 0x0, 0x6C, -14, -44
	banim_frame_oam 0x4000, 0x0, 0x8C, -12, -36
	banim_frame_oam 0x0, 0x0, 0xAC, -3, -28
	banim_frame_oam 0x4000, 0x3000, 0x83, -21, -96
	banim_frame_oam 0x0, 0x3000, 0x85, -29, -96
	banim_frame_oam 0x4000, 0x3000, 0xA3, -28, -104
	banim_frame_oam 0x0, 0x3000, 0xA5, -36, -104
	banim_frame_oam 0x4000, 0x3000, 0x64, -37, -112
	banim_frame_end
banim_merm_sw1_oam_frame_65_r:
	banim_frame_oam 0x0, 0x0, 0xCB, 2, 6
	banim_frame_oam 0x8000, 0x0, 0x8B, 1, -10
	banim_frame_oam 0x4000, 0x0, 0xEB, -10, 7
	banim_frame_oam 0x0, 0x4000, 0xC, -12, -68
	banim_frame_oam 0x4000, 0x0, 0x4C, -13, -52
	banim_frame_oam 0x4000, 0x0, 0x6C, -14, -44
	banim_frame_oam 0x4000, 0x0, 0x8C, -12, -36
	banim_frame_oam 0x0, 0x0, 0xAC, -3, -28
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, -104
	banim_frame_oam 0x0, 0x1000, 0xE3, -24, -104
	banim_frame_oam 0x0, 0x1000, 0xE5, -8, -104
	banim_frame_oam 0x8000, 0x1000, 0xC4, -32, -104
	banim_frame_oam 0x0, 0x1000, 0xC3, -40, -104
	banim_frame_end
banim_merm_sw1_oam_frame_66_r:
	banim_frame_oam 0x0, 0x0, 0xCB, 2, 6
	banim_frame_oam 0x8000, 0x0, 0x8B, 1, -10
	banim_frame_oam 0x4000, 0x0, 0xEB, -10, 7
	banim_frame_oam 0x0, 0x4000, 0xC, -12, -76
	banim_frame_oam 0x4000, 0x0, 0x4C, -13, -60
	banim_frame_oam 0x4000, 0x0, 0x6C, -14, -52
	banim_frame_oam 0x4000, 0x0, 0x8C, -12, -44
	banim_frame_oam 0x0, 0x0, 0xAC, -3, -36
	banim_frame_oam 0x4000, 0x1000, 0x83, -24, -108
	banim_frame_oam 0x0, 0x1000, 0x85, -32, -108
	banim_frame_oam 0x4000, 0x1000, 0xA3, -31, -100
	banim_frame_oam 0x0, 0x1000, 0xA5, -39, -100
	banim_frame_oam 0x4000, 0x1000, 0x64, -40, -92
	banim_frame_end
banim_merm_sw1_oam_frame_67_r:
	banim_frame_oam 0x0, 0x0, 0xCB, 2, 6
	banim_frame_oam 0x8000, 0x0, 0x8B, 1, -10
	banim_frame_oam 0x4000, 0x0, 0xEB, -10, 7
	banim_frame_oam 0x0, 0x4000, 0xC, -12, -76
	banim_frame_oam 0x4000, 0x0, 0x4C, -13, -60
	banim_frame_oam 0x4000, 0x0, 0x6C, -14, -52
	banim_frame_oam 0x4000, 0x0, 0x8C, -12, -44
	banim_frame_oam 0x0, 0x0, 0xAC, -3, -36
	banim_frame_oam 0x4000, 0x1000, 0x3, -33, -105
	banim_frame_oam 0x0, 0x5000, 0x23, -34, -97
	banim_frame_oam 0x0, 0x1000, 0x63, -25, -113
	banim_frame_end
banim_merm_sw1_oam_frame_68_r:
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -78
	banim_frame_oam 0x8000, 0x0, 0x10, -1, -78
	banim_frame_oam 0x4000, 0x0, 0x4E, -14, -62
	banim_frame_oam 0x0, 0x0, 0x6E, -6, -54
	banim_frame_oam 0x8000, 0x2000, 0x5, -30, -94
	banim_frame_oam 0x0, 0x2000, 0x26, -22, -94
	banim_frame_oam 0x0, 0x2000, 0x45, -30, -102
	banim_frame_oam 0x0, 0x2000, 0x45, -30, -110
	banim_frame_oam 0x0, 0x2000, 0x6, -30, -118
	banim_frame_oam 0x4000, 0x0, 0xEB, -12, 7
	banim_frame_end
banim_merm_sw1_oam_frame_69_r:
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -78
	banim_frame_oam 0x8000, 0x0, 0x10, -1, -78
	banim_frame_oam 0x4000, 0x0, 0x4E, -14, -62
	banim_frame_oam 0x0, 0x0, 0x6E, -6, -54
	banim_frame_oam 0x4000, 0x0, 0xEB, -13, 7
	banim_frame_oam 0x4000, 0x0, 0x3, -34, -103
	banim_frame_oam 0x0, 0x4000, 0x23, -33, -95
	banim_frame_oam 0x0, 0x0, 0x63, -34, -111
	banim_frame_end
banim_merm_sw1_oam_frame_70_r:
	banim_frame_oam 0x4000, 0x0, 0x3, -34, -103
	banim_frame_oam 0x0, 0x4000, 0x23, -33, -95
	banim_frame_oam 0x0, 0x0, 0x63, -34, -111
	banim_frame_oam 0x0, 0x8000, 0x8E, -26, -89
	banim_frame_oam 0x4000, 0x0, 0xEB, -17, 7
	banim_frame_end
banim_merm_sw1_oam_frame_71_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x83, -42, -104
	banim_frame_oam 0x0, 0x0, 0x85, -26, -104
	banim_frame_oam 0x4000, 0x0, 0xA3, -35, -96
	banim_frame_oam 0x0, 0x0, 0xA5, -19, -96
	banim_frame_oam 0x4000, 0x0, 0x64, -26, -88
	banim_frame_oam 0x100, 0x8000, 0x8E, -29, -90
	banim_frame_oam 0x4000, 0x0, 0xEB, -20, 7
	banim_frame_end
banim_merm_sw1_oam_frame_72_r:
	banim_frame_affine -255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -32, -90
	banim_frame_oam 0x4000, 0x0, 0xEB, -22, 7
	banim_frame_oam 0x0, 0x0, 0xE3, -42, -96
	banim_frame_oam 0x0, 0x0, 0xE3, -34, -96
	banim_frame_oam 0x0, 0x0, 0xE5, -50, -96
	banim_frame_oam 0x8000, 0x0, 0xC4, -26, -96
	banim_frame_oam 0x0, 0x0, 0xC3, -18, -96
	banim_frame_end
banim_merm_sw1_oam_frame_73_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -32, -90
	banim_frame_oam 0x4000, 0x0, 0xEB, -23, 7
	banim_frame_oam 0x4000, 0x2000, 0x83, -43, -88
	banim_frame_oam 0x0, 0x2000, 0x85, -27, -88
	banim_frame_oam 0x4000, 0x2000, 0xA3, -36, -96
	banim_frame_oam 0x0, 0x2000, 0xA5, -20, -96
	banim_frame_oam 0x4000, 0x2000, 0x64, -27, -104
	banim_frame_end
banim_merm_sw1_oam_frame_74_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -32, -90
	banim_frame_oam 0x4000, 0x0, 0xEB, -24, 7
	banim_frame_oam 0x4000, 0x2000, 0x3, -38, -89
	banim_frame_oam 0x0, 0x6000, 0x23, -37, -105
	banim_frame_oam 0x0, 0x2000, 0x63, -38, -81
	banim_frame_end
banim_merm_sw1_oam_frame_75_r:
	banim_frame_affine 181, 180, -180, 181, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -33, -89
	banim_frame_oam 0x4000, 0x0, 0xEB, -25, 7
	banim_frame_oam 0x8000, 0x0, 0x5, -35, -105
	banim_frame_oam 0x0, 0x0, 0x26, -27, -97
	banim_frame_oam 0x0, 0x0, 0x45, -35, -89
	banim_frame_oam 0x0, 0x0, 0x45, -35, -81
	banim_frame_oam 0x0, 0x0, 0x6, -35, -73
	banim_frame_end
banim_merm_sw1_oam_frame_76_r:
	banim_frame_affine 181, 180, -180, 181, 1
	banim_frame_oam 0x4000, 0x3000, 0x3, -38, -87
	banim_frame_oam 0x0, 0x7000, 0x23, -39, -103
	banim_frame_oam 0x0, 0x3000, 0x63, -30, -79
	banim_frame_oam 0x100, 0x8000, 0x8E, -33, -89
	banim_frame_oam 0x4000, 0x0, 0xEB, -26, 7
	banim_frame_end
banim_merm_sw1_oam_frame_77_r:
	banim_frame_oam 0x4000, 0x3000, 0x83, -27, -79
	banim_frame_oam 0x0, 0x3000, 0x85, -35, -79
	banim_frame_oam 0x4000, 0x3000, 0xA3, -34, -87
	banim_frame_oam 0x0, 0x3000, 0xA5, -42, -87
	banim_frame_oam 0x4000, 0x3000, 0x64, -43, -95
	banim_frame_oam 0x0, 0x8000, 0x8E, -33, -88
	banim_frame_oam 0x4000, 0x0, 0xEB, -27, 7
	banim_frame_end
banim_merm_sw1_oam_frame_78_r:
	banim_frame_oam 0x0, 0x1000, 0xE3, -22, -83
	banim_frame_oam 0x0, 0x1000, 0xE3, -30, -83
	banim_frame_oam 0x0, 0x1000, 0xE5, -14, -83
	banim_frame_oam 0x8000, 0x1000, 0xC4, -38, -83
	banim_frame_oam 0x0, 0x1000, 0xC3, -46, -83
	banim_frame_oam 0x0, 0x8000, 0x8E, -33, -88
	banim_frame_oam 0x4000, 0x0, 0xEB, -28, 7
	banim_frame_end
banim_merm_sw1_oam_frame_79_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x4000, 0x1000, 0x83, -26, -86
	banim_frame_oam 0x0, 0x1000, 0x85, -34, -86
	banim_frame_oam 0x4000, 0x1000, 0xA3, -33, -78
	banim_frame_oam 0x0, 0x1000, 0xA5, -41, -78
	banim_frame_oam 0x4000, 0x1000, 0x64, -42, -70
	banim_frame_oam 0x100, 0x8000, 0x8E, -34, -84
	banim_frame_oam 0x4000, 0x0, 0xEB, -29, 7
	banim_frame_end
banim_merm_sw1_oam_frame_80_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -34, -84
	banim_frame_oam 0x4000, 0x0, 0xEB, -30, 7
	banim_frame_oam 0x4000, 0x1000, 0x3, -39, -80
	banim_frame_oam 0x0, 0x5000, 0x23, -40, -72
	banim_frame_oam 0x0, 0x1000, 0x63, -31, -88
	banim_frame_end
banim_merm_sw1_oam_frame_81_r:
	banim_frame_affine -255, 0, 0, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x8E, -35, -80
	banim_frame_oam 0x4000, 0x0, 0xEB, -31, 7
	banim_frame_oam 0x8000, 0x2000, 0x5, -39, -69
	banim_frame_oam 0x0, 0x2000, 0x26, -31, -69
	banim_frame_oam 0x0, 0x2000, 0x45, -39, -77
	banim_frame_oam 0x0, 0x2000, 0x45, -39, -85
	banim_frame_oam 0x0, 0x2000, 0x6, -39, -93
	banim_frame_end
banim_merm_sw1_oam_frame_82_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x3, -43, -78
	banim_frame_oam 0x0, 0x4000, 0x23, -42, -70
	banim_frame_oam 0x0, 0x0, 0x63, -43, -86
	banim_frame_oam 0x100, 0x8000, 0x8E, -37, -78
	banim_frame_oam 0x4000, 0x0, 0xEB, -32, 7
	banim_frame_end
banim_merm_sw1_oam_frame_83_r:
	banim_frame_affine 0, 255, -255, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x83, -53, -71
	banim_frame_oam 0x0, 0x0, 0x85, -37, -71
	banim_frame_oam 0x4000, 0x0, 0xA3, -46, -63
	banim_frame_oam 0x0, 0x0, 0xA5, -30, -63
	banim_frame_oam 0x4000, 0x0, 0x64, -37, -55
	banim_frame_oam 0x100, 0x8000, 0x8E, -38, -75
	banim_frame_oam 0x4000, 0x0, 0xEB, -33, 7
	banim_frame_end
banim_merm_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_merm_sw1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_merm_sw1_oam_frame_84_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_merm_sw1_oam_frame_88_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -15, -16
	banim_frame_oam 0x8000, 0x0, 0x13, 1, -16
	banim_frame_oam 0x4000, 0x4000, 0x6F, -15, -24
	banim_frame_oam 0x4000, 0x0, 0x50, -15, 0
	banim_frame_oam 0x0, 0x0, 0x52, 1, 0
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_end
banim_merm_sw1_oam_frame_89_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -14, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 2, -16
	banim_frame_oam 0x4000, 0x0, 0x73, -14, -24
	banim_frame_end
banim_merm_sw1_oam_frame_85_r:
	banim_frame_oam 0x8000, 0x0, 0x79, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x95, -6, 0
	banim_frame_oam 0x0, 0x0, 0x53, 11, -32
	banim_frame_oam 0x0, 0x0, 0xCD, 3, -40
	banim_frame_oam 0x0, 0x0, 0xAD, 11, -40
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_oam 0x0, 0x4000, 0x14, -13, -32
	banim_frame_oam 0x8000, 0x0, 0x16, 3, -32
	banim_frame_oam 0x4000, 0x0, 0x54, -13, -16
	banim_frame_oam 0x0, 0x0, 0x56, 3, -16
	banim_frame_oam 0x4000, 0x0, 0x75, -6, -8
	banim_frame_end
banim_merm_sw1_oam_frame_86_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -11, -40
	banim_frame_oam 0x8000, 0x0, 0x79, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x97, -11, -8
	banim_frame_oam 0x4000, 0x0, 0xB5, -10, 0
	banim_frame_oam 0x0, 0x4000, 0xD5, -3, -56
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_end
banim_merm_sw1_oam_frame_87_r:
	banim_frame_oam 0x8000, 0x0, 0x79, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x97, -11, -8
	banim_frame_oam 0x4000, 0x0, 0xB5, -10, 0
	banim_frame_oam 0x0, 0x0, 0xB7, -8, -32
	banim_frame_oam 0x0, 0x4000, 0xD7, -8, -48
	banim_frame_oam 0x0, 0x0, 0xB8, 0, -56
	banim_frame_oam 0x8000, 0x4000, 0x17, -11, -40
	banim_frame_oam 0x8000, 0x0, 0x58, -3, -24
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_end
banim_merm_sw1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x0, 0x81, -75, -15
	banim_frame_oam 0x0, 0x0, 0x80, -83, -15
	banim_frame_oam 0x0, 0x0, 0xA0, -67, -12
	banim_frame_end
banim_merm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x0, 0x81, -73, -12
	banim_frame_oam 0x0, 0x0, 0x80, -81, -12
	banim_frame_oam 0x0, 0x0, 0xA0, -65, -9
	banim_frame_end
banim_merm_sw1_oam_frame_90_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -55, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, -39, -16
	banim_frame_oam 0x8000, 0x0, 0x43, -31, 0
	banim_frame_oam 0x8000, 0x0, 0x3, -63, -16
	banim_frame_oam 0x8000, 0x0, 0x81, -75, -15
	banim_frame_oam 0x0, 0x0, 0x80, -83, -15
	banim_frame_oam 0x0, 0x0, 0xA0, -67, -12
	banim_frame_end
banim_merm_sw1_oam_frame_91_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -53, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, -37, -16
	banim_frame_oam 0x8000, 0x0, 0x47, -29, 0
	banim_frame_oam 0x8000, 0x0, 0x7, -61, -8
	banim_frame_oam 0x8000, 0x0, 0x81, -73, -12
	banim_frame_oam 0x0, 0x0, 0x80, -81, -12
	banim_frame_oam 0x0, 0x0, 0xA0, -65, -9
	banim_frame_end
	.section .data.script
banim_merm_sw1_script:
banim_merm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 2, banim_merm_sw1_oam_frame_2_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 3, banim_merm_sw1_oam_frame_3_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 4, banim_merm_sw1_oam_frame_4_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 5, banim_merm_sw1_oam_frame_5_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 6, banim_merm_sw1_oam_frame_6_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 7, banim_merm_sw1_oam_frame_7_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 8, banim_merm_sw1_oam_frame_8_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 9, banim_merm_sw1_oam_frame_9_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 10, banim_merm_sw1_oam_frame_10_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 11, banim_merm_sw1_oam_frame_11_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 12, banim_merm_sw1_oam_frame_12_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 19, banim_merm_sw1_oam_frame_19_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 20, banim_merm_sw1_oam_frame_20_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 89, banim_merm_sw1_oam_frame_33_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 90, banim_merm_sw1_oam_frame_34_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 30, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 15, banim_merm_sw1_sheet_1, 34, banim_merm_sw1_oam_frame_38_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 35, banim_merm_sw1_oam_frame_39_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 36, banim_merm_sw1_oam_frame_40_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 37, banim_merm_sw1_oam_frame_41_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 38, banim_merm_sw1_oam_frame_42_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 39, banim_merm_sw1_oam_frame_43_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_merm_sw1_sheet_2, 40, banim_merm_sw1_oam_frame_44_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 41, banim_merm_sw1_oam_frame_45_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 42, banim_merm_sw1_oam_frame_46_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 43, banim_merm_sw1_oam_frame_47_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 44, banim_merm_sw1_oam_frame_48_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 45, banim_merm_sw1_oam_frame_49_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 46, banim_merm_sw1_oam_frame_50_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 47, banim_merm_sw1_oam_frame_51_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 48, banim_merm_sw1_oam_frame_52_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 49, banim_merm_sw1_oam_frame_53_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 50, banim_merm_sw1_oam_frame_54_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 51, banim_merm_sw1_oam_frame_55_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 52, banim_merm_sw1_oam_frame_56_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 53, banim_merm_sw1_oam_frame_57_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 54, banim_merm_sw1_oam_frame_58_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 55, banim_merm_sw1_oam_frame_59_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 56, banim_merm_sw1_oam_frame_60_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 57, banim_merm_sw1_oam_frame_61_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 58, banim_merm_sw1_oam_frame_62_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_merm_sw1_sheet_2, 59, banim_merm_sw1_oam_frame_63_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 60, banim_merm_sw1_oam_frame_64_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 61, banim_merm_sw1_oam_frame_65_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 62, banim_merm_sw1_oam_frame_66_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 63, banim_merm_sw1_oam_frame_67_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 64, banim_merm_sw1_oam_frame_68_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 65, banim_merm_sw1_oam_frame_69_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 66, banim_merm_sw1_oam_frame_70_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 67, banim_merm_sw1_oam_frame_71_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 68, banim_merm_sw1_oam_frame_72_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 69, banim_merm_sw1_oam_frame_73_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 70, banim_merm_sw1_oam_frame_74_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 71, banim_merm_sw1_oam_frame_75_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 72, banim_merm_sw1_oam_frame_76_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 73, banim_merm_sw1_oam_frame_77_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 74, banim_merm_sw1_oam_frame_78_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 75, banim_merm_sw1_oam_frame_79_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 76, banim_merm_sw1_oam_frame_80_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 77, banim_merm_sw1_oam_frame_81_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 78, banim_merm_sw1_oam_frame_82_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 79, banim_merm_sw1_oam_frame_83_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_shake_screnn_heavily
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 19, banim_merm_sw1_oam_frame_19_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 20, banim_merm_sw1_oam_frame_20_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 30, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 15, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_shake_screnn_heavily
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 89, banim_merm_sw1_oam_frame_33_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 90, banim_merm_sw1_oam_frame_34_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 50, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 50, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 50, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 50, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 85, banim_merm_sw1_oam_frame_89_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 85, banim_merm_sw1_oam_frame_89_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_stand_close:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_stand:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_stand_range:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 2, banim_merm_sw1_oam_frame_2_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 3, banim_merm_sw1_oam_frame_3_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 4, banim_merm_sw1_oam_frame_4_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 5, banim_merm_sw1_oam_frame_5_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 6, banim_merm_sw1_oam_frame_6_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 7, banim_merm_sw1_oam_frame_7_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 8, banim_merm_sw1_oam_frame_8_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 9, banim_merm_sw1_oam_frame_9_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 10, banim_merm_sw1_oam_frame_10_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 11, banim_merm_sw1_oam_frame_11_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 12, banim_merm_sw1_oam_frame_12_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_merm_sw1_sheet_1, 91, banim_merm_sw1_oam_frame_90_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 92, banim_merm_sw1_oam_frame_91_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_merm_sw1_mode_attack_close - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_close_back - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_close_critical - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_close_critical_back - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_range - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_range_critical - banim_merm_sw1_script
	.word banim_merm_sw1_mode_dodge_close - banim_merm_sw1_script
	.word banim_merm_sw1_mode_dodge_range - banim_merm_sw1_script
	.word banim_merm_sw1_mode_stand_close - banim_merm_sw1_script
	.word banim_merm_sw1_mode_stand - banim_merm_sw1_script
	.word banim_merm_sw1_mode_stand_range - banim_merm_sw1_script
	.word banim_merm_sw1_mode_attack_miss - banim_merm_sw1_script
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

