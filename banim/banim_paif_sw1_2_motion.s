@ vim:ft=armv4
	.global banim_paif_sw1_2_script
	.global banim_paif_sw1_2_oam_r
	.global banim_paif_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3D
	.section .data.oam_l
banim_paif_sw1_2_oam_l:
banim_paif_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -11, -32
	banim_frame_oam 0x4000, 0x9000, 0xC0, -19, 0
	banim_frame_oam 0x4000, 0x9000, 0x80, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x20, 0, -40
	banim_frame_oam 0x0, 0x5000, 0x5A, 0, -47
	banim_frame_oam 0x0, 0x1000, 0x9C, -27, -11
	banim_frame_oam 0x4000, 0x1000, 0xBC, -19, -19
	banim_frame_oam 0x0, 0x1000, 0xBC, -19, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -18, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -26, 0
	banim_frame_oam 0x0, 0x1000, 0x20, -7, -40
	banim_frame_oam 0x0, 0x5000, 0x88, -27, -16
	banim_frame_oam 0x0, 0x5000, 0x44, -9, -32
	banim_frame_oam 0x8000, 0x1000, 0x46, -17, -32
	banim_frame_oam 0x0, 0x1000, 0xF2, 7, -24
	banim_frame_oam 0x0, 0x5000, 0x5A, -7, -47
	banim_frame_oam 0x0, 0x1000, 0x9C, -34, -11
	banim_frame_oam 0x4000, 0x1000, 0xBC, -26, -19
	banim_frame_oam 0x0, 0x1000, 0xBC, -26, -11
	banim_frame_oam 0x8000, 0x1000, 0x4D, 13, -20
	banim_frame_oam 0x0, 0x5000, 0x85, -3, -16
	banim_frame_oam 0x8000, 0x1000, 0x87, -11, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xC9, -18, 0
	banim_frame_oam 0x8000, 0x1000, 0xCD, -26, 0
	banim_frame_oam 0x0, 0x5000, 0x4B, -27, -16
	banim_frame_oam 0x0, 0x5000, 0x8A, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0x8C, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x20, -9, -40
	banim_frame_oam 0x0, 0x5000, 0x1B, -9, -43
	banim_frame_oam 0x4000, 0x1000, 0x39, -33, -16
	banim_frame_oam 0x0, 0x1000, 0x3D, -25, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, 13, -20
	banim_frame_oam 0x0, 0x5000, 0x48, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x4A, -11, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xCE, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0x4D, -12, -16
	banim_frame_oam 0x4000, 0x9000, 0x51, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x8D, -18, 0
	banim_frame_oam 0x0, 0x5000, 0x91, -34, 0
	banim_frame_oam 0x0, 0x1000, 0xF1, -12, -40
	banim_frame_oam 0x4000, 0x1000, 0x9D, -10, -40
	banim_frame_oam 0x0, 0x1000, 0xBE, -2, -32
	banim_frame_oam 0x4000, 0x1000, 0x7C, -34, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0xD3, -33, 0
	banim_frame_oam 0x4000, 0x9000, 0x93, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x97, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x55, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x59, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xD7, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xD9, -24, -39
	banim_frame_oam 0x0, 0x1000, 0xF7, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0x5C, -32, -43
	banim_frame_oam 0x0, 0x1000, 0x5C, -18, -41
	banim_frame_oam 0x0, 0x5000, 0x5E, 7, -34
	banim_frame_oam 0x0, 0x1000, 0x5C, 0, -35
	banim_frame_oam 0x0, 0x1000, 0x5C, -6, -37
	banim_frame_end
banim_paif_sw1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x1, 3, 1
	banim_frame_oam 0x0, 0x5000, 0x3, -21, 1
	banim_frame_oam 0x8000, 0x1000, 0x5, -29, 1
	banim_frame_oam 0x0, 0x1000, 0x26, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x6, -21, -7
	banim_frame_oam 0x4000, 0x9000, 0x7, 3, -15
	banim_frame_oam 0x0, 0x5000, 0xB, -13, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -29, -26
	banim_frame_oam 0x4000, 0x9000, 0xF, -5, -31
	banim_frame_oam 0x8000, 0x1000, 0x13, -13, -31
	banim_frame_oam 0x8000, 0x1000, 0x14, 26, -34
	banim_frame_oam 0x4000, 0x5000, 0x35, -6, -39
	banim_frame_oam 0x0, 0x1000, 0x0, 19, 1
	banim_frame_oam 0x4000, 0x1000, 0x5C, -25, -41
	banim_frame_oam 0x0, 0x1000, 0x5C, -11, -39
	banim_frame_oam 0x0, 0x5000, 0x5E, 16, -31
	banim_frame_end
banim_paif_sw1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x22, 40, -24
	banim_frame_oam 0x0, 0x1000, 0x41, 56, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 64, -14
	banim_frame_oam 0x4000, 0x1000, 0x20, 40, -32
	banim_frame_oam 0x4000, 0x5000, 0xE0, 17, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, 1, 8
	banim_frame_oam 0x4000, 0x9000, 0xA0, -1, -8
	banim_frame_oam 0x4000, 0x9000, 0x60, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xC4, 31, -8
	banim_frame_oam 0x0, 0x5000, 0xC6, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x85, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x87, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xA4, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x84, 0, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x94, 13, 0
	banim_frame_oam 0x0, 0x1000, 0x93, 29, 0
	banim_frame_oam 0x0, 0x0, 0xB3, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xB3, 37, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 29, 9
	banim_frame_oam 0x4000, 0x9000, 0x55, 18, -16
	banim_frame_oam 0x0, 0x5000, 0x59, 2, -16
	banim_frame_oam 0x4000, 0x9000, 0x16, 13, -32
	banim_frame_oam 0x8000, 0x1000, 0x1A, 5, -32
	banim_frame_oam 0x0, 0x1000, 0x35, 45, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, 13, -40
	banim_frame_oam 0x4000, 0x1000, 0xAA, 44, -17
	banim_frame_oam 0x0, 0x1000, 0x15, 36, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 18, -10
	banim_frame_oam 0x4000, 0x9000, 0x32, 18, -26
	banim_frame_oam 0x4000, 0x1000, 0x12, 34, -34
	banim_frame_oam 0x0, 0x1000, 0x14, 26, -34
	banim_frame_oam 0x0, 0x1000, 0x15, 10, -18
	banim_frame_oam 0x8000, 0x1000, 0xB3, 12, -41
	banim_frame_oam 0x0, 0x1000, 0x90, 20, -37
	banim_frame_oam 0x0, 0x1000, 0x8F, 28, -33
	banim_frame_oam 0x0, 0x1000, 0xD2, 36, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x91, 34, -24
	banim_frame_oam 0x4000, 0x1000, 0x72, 33, -32
	banim_frame_oam 0x0, 0x1000, 0x74, 25, -32
	banim_frame_oam 0x0, 0x5000, 0x34, 18, -26
	banim_frame_oam 0x0, 0x9000, 0xE, 18, -10
	banim_frame_oam 0x4000, 0x1000, 0xD4, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x94, 3, -34
	banim_frame_oam 0x0, 0x1000, 0x93, 19, -31
	banim_frame_oam 0x8000, 0x1000, 0xD6, 35, -50
	banim_frame_oam 0x0, 0x1000, 0xB6, 27, -50
	banim_frame_oam 0x0, 0x1000, 0xF5, 27, -36
	banim_frame_oam 0x0, 0x1000, 0x15, 10, -18
	banim_frame_end
banim_paif_sw1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x91, 34, -24
	banim_frame_oam 0x4000, 0x1000, 0x72, 33, -32
	banim_frame_oam 0x0, 0x1000, 0x74, 25, -32
	banim_frame_oam 0x0, 0x5000, 0x34, 18, -26
	banim_frame_oam 0x0, 0x1000, 0x15, 10, -18
	banim_frame_oam 0x4000, 0x1000, 0xD4, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x94, 3, -34
	banim_frame_oam 0x0, 0x1000, 0x93, 19, -31
	banim_frame_oam 0x8000, 0x1000, 0xD6, 35, -50
	banim_frame_oam 0x0, 0x1000, 0xB6, 27, -50
	banim_frame_oam 0x0, 0x1000, 0xF5, 27, -36
	banim_frame_oam 0x4000, 0x9000, 0xE, 18, -10
	banim_frame_oam 0x0, 0x5000, 0x37, 33, 6
	banim_frame_oam 0x8000, 0x1000, 0x39, 25, 6
	banim_frame_oam 0x0, 0x1000, 0x3A, 17, 6
	banim_frame_oam 0x0, 0x1000, 0x71, 17, 14
	banim_frame_end
banim_paif_sw1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x9000, 0xD7, 26, 8
	banim_frame_oam 0x0, 0x5000, 0x97, 29, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, 21, -8
	banim_frame_oam 0x4000, 0x9000, 0xDB, 10, -24
	banim_frame_oam 0x0, 0x1000, 0x96, 26, -32
	banim_frame_oam 0x0, 0x1000, 0x56, 12, -32
	banim_frame_oam 0x0, 0x5000, 0x9A, 1, -40
	banim_frame_oam 0x0, 0x1000, 0x79, 25, -32
	banim_frame_oam 0x4000, 0x1000, 0x77, 36, -24
	banim_frame_oam 0x0, 0x1000, 0x75, 13, -8
	banim_frame_oam 0x0, 0x1000, 0x76, 17, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, 39, 12
	banim_frame_oam 0x8000, 0x1000, 0x9C, 37, -32
	banim_frame_oam 0x0, 0x1000, 0xBD, 29, -24
	banim_frame_oam 0x4000, 0x9000, 0xD7, 26, 8
	banim_frame_oam 0x0, 0x5000, 0x97, 29, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, 21, -8
	banim_frame_oam 0x4000, 0x9000, 0xDB, 10, -24
	banim_frame_oam 0x0, 0x1000, 0x56, 12, -32
	banim_frame_oam 0x8000, 0x1000, 0x3C, 49, -54
	banim_frame_oam 0x0, 0x1000, 0x5D, 41, -46
	banim_frame_oam 0x0, 0x1000, 0x3D, 41, -39
	banim_frame_oam 0x0, 0x1000, 0x3D, 37, -31
	banim_frame_oam 0x0, 0x1000, 0x75, 13, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x3, 13, -49
	banim_frame_oam 0x0, 0x5000, 0xD, 4, -78
	banim_frame_oam 0x8000, 0x1000, 0xC, 14, -53
	banim_frame_oam 0x8000, 0x1000, 0xC, 12, -63
	banim_frame_oam 0x8000, 0x5000, 0xC, 17, -38
	banim_frame_oam 0x4000, 0x1000, 0xC5, 21, 11
	banim_frame_oam 0x4000, 0x0, 0xC5, 5, 11
	banim_frame_oam 0x8000, 0x1000, 0xC0, 52, -22
	banim_frame_oam 0x0, 0x5000, 0xC1, 36, -14
	banim_frame_oam 0x8000, 0x1000, 0xC3, 28, -14
	banim_frame_oam 0x0, 0x1000, 0xC4, 20, -14
	banim_frame_oam 0x4000, 0x1000, 0xE4, -4, -22
	banim_frame_oam 0x0, 0x1000, 0xE6, -12, -22
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, -30
	banim_frame_oam 0x0, 0x5000, 0x40, -4, -38
	banim_frame_oam 0x8000, 0x1000, 0x42, -12, -38
	banim_frame_oam 0x0, 0x1000, 0x63, -20, -31
	banim_frame_oam 0x0, 0x1000, 0x43, -3, -14
	banim_frame_oam 0x0, 0x5000, 0x0, 20, -46
	banim_frame_oam 0x8000, 0x1000, 0x2, 12, -46
	banim_frame_oam 0x0, 0x1000, 0x23, 44, -22
	banim_frame_oam 0x0, 0x1000, 0x1B, 36, -39
	banim_frame_end
banim_paif_sw1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 11, -49
	banim_frame_oam 0x8000, 0x2000, 0x68, 6, -60
	banim_frame_oam 0x8000, 0x1000, 0x49, -2, -76
	banim_frame_oam 0x0, 0x1000, 0xC9, 24, -19
	banim_frame_oam 0x0, 0x1000, 0x48, 6, -68
	banim_frame_oam 0x8000, 0x1000, 0x68, 14, -48
	banim_frame_oam 0x8000, 0x2000, 0x68, 20, -32
	banim_frame_oam 0x4000, 0x1000, 0xC5, 16, 10
	banim_frame_oam 0x4000, 0x0, 0xC5, 0, 10
	banim_frame_oam 0x8000, 0x1000, 0xC0, 50, -23
	banim_frame_oam 0x0, 0x5000, 0xC1, 34, -15
	banim_frame_oam 0x8000, 0x1000, 0xC3, 26, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, 18, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -6, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -14, -23
	banim_frame_oam 0x4000, 0x9000, 0x80, 10, -31
	banim_frame_oam 0x0, 0x5000, 0x40, -6, -39
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, -39
	banim_frame_oam 0x0, 0x1000, 0x63, -22, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -5, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 18, -47
	banim_frame_oam 0x8000, 0x1000, 0x2, 10, -47
	banim_frame_oam 0x0, 0x1000, 0x23, 42, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, 34, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 10, -49
	banim_frame_oam 0x0, 0x5000, 0x4A, -14, -72
	banim_frame_oam 0x8000, 0x1000, 0x89, 1, -57
	banim_frame_oam 0x0, 0x1000, 0xA8, 32, -26
	banim_frame_oam 0x8000, 0x1000, 0x89, 8, -50
	banim_frame_oam 0x8000, 0x1000, 0x89, 15, -43
	banim_frame_oam 0x8000, 0x1000, 0x89, 22, -36
	banim_frame_oam 0x0, 0x1000, 0x89, 25, -33
	banim_frame_oam 0x4000, 0x1000, 0xC5, 15, 10
	banim_frame_oam 0x4000, 0x0, 0xC5, -1, 10
	banim_frame_oam 0x8000, 0x1000, 0xC0, 49, -23
	banim_frame_oam 0x0, 0x5000, 0xC1, 33, -15
	banim_frame_oam 0x8000, 0x1000, 0xC3, 25, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, 17, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -7, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -15, -23
	banim_frame_oam 0x4000, 0x9000, 0x80, 9, -31
	banim_frame_oam 0x0, 0x5000, 0x40, -7, -39
	banim_frame_oam 0x8000, 0x1000, 0x42, -15, -39
	banim_frame_oam 0x0, 0x1000, 0x63, -23, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -6, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 17, -47
	banim_frame_oam 0x8000, 0x1000, 0x2, 9, -47
	banim_frame_oam 0x0, 0x1000, 0x23, 41, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, 33, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 7, -49
	banim_frame_oam 0x0, 0x1000, 0x29, -20, -62
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -62
	banim_frame_oam 0x0, 0x1000, 0xE7, 38, -36
	banim_frame_oam 0x4000, 0x1000, 0xC7, -4, -54
	banim_frame_oam 0x4000, 0x1000, 0xC7, 8, -48
	banim_frame_oam 0x4000, 0x2000, 0xC7, 20, -40
	banim_frame_oam 0x4000, 0x1000, 0xC7, 28, -38
	banim_frame_oam 0x4000, 0x1000, 0xC5, 13, 10
	banim_frame_oam 0x4000, 0x0, 0xC5, -3, 10
	banim_frame_oam 0x8000, 0x1000, 0xC0, 47, -23
	banim_frame_oam 0x0, 0x5000, 0xC1, 31, -15
	banim_frame_oam 0x8000, 0x1000, 0xC3, 23, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, 15, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -9, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -17, -23
	banim_frame_oam 0x4000, 0x9000, 0x80, 7, -31
	banim_frame_oam 0x0, 0x5000, 0x40, -9, -39
	banim_frame_oam 0x8000, 0x1000, 0x42, -17, -39
	banim_frame_oam 0x0, 0x1000, 0x63, -25, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -8, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 15, -47
	banim_frame_oam 0x8000, 0x1000, 0x2, 7, -47
	banim_frame_oam 0x0, 0x1000, 0x23, 39, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, 31, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 5, -49
	banim_frame_oam 0x4000, 0x1000, 0xCA, 31, -40
	banim_frame_oam 0x4000, 0x1000, 0x8, -23, -59
	banim_frame_oam 0x0, 0x1000, 0x28, -15, -51
	banim_frame_oam 0x4000, 0x2000, 0xAA, -7, -52
	banim_frame_oam 0x0, 0x1000, 0xAA, 11, -48
	banim_frame_oam 0x4000, 0x1000, 0xAA, 15, -44
	banim_frame_oam 0x4000, 0x1000, 0xC5, 12, 10
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 10
	banim_frame_oam 0x8000, 0x1000, 0xC0, 45, -23
	banim_frame_oam 0x0, 0x5000, 0xC1, 29, -15
	banim_frame_oam 0x8000, 0x1000, 0xC3, 21, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, 13, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -11, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -19, -23
	banim_frame_oam 0x4000, 0x9000, 0x80, 5, -31
	banim_frame_oam 0x0, 0x5000, 0x40, -11, -39
	banim_frame_oam 0x8000, 0x1000, 0x42, -19, -39
	banim_frame_oam 0x0, 0x1000, 0x63, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -10, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 13, -47
	banim_frame_oam 0x8000, 0x1000, 0x2, 5, -47
	banim_frame_oam 0x0, 0x1000, 0x23, 37, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, 29, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 0, -31
	banim_frame_oam 0x4000, 0x1000, 0xE8, 29, -31
	banim_frame_oam 0x0, 0x5000, 0x4D, -29, -35
	banim_frame_oam 0x4000, 0x1000, 0xE9, 13, -31
	banim_frame_oam 0x4000, 0x1000, 0xE9, -3, -31
	banim_frame_oam 0x4000, 0x1000, 0xE9, -19, -31
	banim_frame_oam 0x4000, 0x1000, 0xC5, 12, 11
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 11
	banim_frame_oam 0x4000, 0x1000, 0xF, 6, -46
	banim_frame_oam 0x4000, 0x5000, 0x2F, -2, -38
	banim_frame_oam 0x0, 0x1000, 0x4F, 4, -30
	banim_frame_oam 0x8000, 0x1000, 0xC0, 43, -22
	banim_frame_oam 0x0, 0x5000, 0xC1, 27, -14
	banim_frame_oam 0x8000, 0x1000, 0xC3, 19, -14
	banim_frame_oam 0x0, 0x1000, 0xC4, 11, -14
	banim_frame_oam 0x4000, 0x1000, 0xE4, -13, -22
	banim_frame_oam 0x0, 0x1000, 0xE6, -21, -22
	banim_frame_oam 0x4000, 0x9000, 0x80, 3, -30
	banim_frame_oam 0x0, 0x5000, 0x40, -13, -38
	banim_frame_oam 0x8000, 0x1000, 0x42, -21, -38
	banim_frame_oam 0x0, 0x1000, 0x63, -29, -31
	banim_frame_oam 0x0, 0x1000, 0x43, -12, -14
	banim_frame_oam 0x0, 0x1000, 0x23, 35, -22
	banim_frame_oam 0x0, 0x1000, 0x1B, 22, -43
	banim_frame_end
banim_paif_sw1_2_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0xDB, 14, -38
	banim_frame_oam 0x4000, 0x1000, 0xF9, -18, -29
	banim_frame_oam 0x4000, 0x1000, 0xFB, -2, -33
	banim_frame_oam 0x0, 0x5000, 0xB9, -34, -29
	banim_frame_oam 0x0, 0x1000, 0x1B, 14, -45
	banim_frame_oam 0x8000, 0x9000, 0x8F, 14, -39
	banim_frame_oam 0x8000, 0x9000, 0x51, -2, -48
	banim_frame_oam 0x0, 0x5000, 0xD1, -2, -16
	banim_frame_oam 0x8000, 0x1000, 0x50, 30, -38
	banim_frame_oam 0x0, 0x1000, 0x6F, 19, -47
	banim_frame_oam 0x8000, 0x1000, 0x8E, -10, -32
	banim_frame_oam 0x0, 0x5000, 0x8C, -18, -16
	banim_frame_oam 0x4000, 0x1000, 0xCC, -10, 0
	banim_frame_oam 0x0, 0x1000, 0xCE, -18, 0
	banim_frame_oam 0x4000, 0x1000, 0xC5, 8, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -8, 12
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xDB, 13, -36
	banim_frame_oam 0x4000, 0x1000, 0xF9, -19, -27
	banim_frame_oam 0x4000, 0x1000, 0xFB, -3, -31
	banim_frame_oam 0x0, 0x5000, 0xB9, -35, -27
	banim_frame_oam 0x0, 0x1000, 0x1B, 13, -43
	banim_frame_oam 0x8000, 0x9000, 0x8F, 13, -37
	banim_frame_oam 0x8000, 0x9000, 0x51, -3, -46
	banim_frame_oam 0x0, 0x5000, 0xD1, -3, -14
	banim_frame_oam 0x8000, 0x1000, 0x50, 29, -36
	banim_frame_oam 0x0, 0x1000, 0x6F, 18, -45
	banim_frame_oam 0x8000, 0x1000, 0x8E, -11, -30
	banim_frame_oam 0x0, 0x5000, 0x8C, -19, -14
	banim_frame_oam 0x4000, 0x1000, 0xCC, -11, 2
	banim_frame_oam 0x0, 0x1000, 0xCE, -19, 2
	banim_frame_oam 0x4000, 0x1000, 0xC5, 6, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -10, 12
	banim_frame_end
banim_paif_sw1_2_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x1000, 0xDB, 10, -33
	banim_frame_oam 0x4000, 0x1000, 0xF9, -22, -24
	banim_frame_oam 0x4000, 0x1000, 0xFB, -6, -28
	banim_frame_oam 0x0, 0x1000, 0x1B, 10, -40
	banim_frame_oam 0x0, 0x5000, 0xB9, -38, -24
	banim_frame_oam 0x8000, 0x9000, 0x8F, 10, -34
	banim_frame_oam 0x8000, 0x9000, 0x51, -6, -43
	banim_frame_oam 0x0, 0x5000, 0xD1, -6, -11
	banim_frame_oam 0x8000, 0x1000, 0x50, 26, -33
	banim_frame_oam 0x0, 0x1000, 0x6F, 15, -42
	banim_frame_oam 0x8000, 0x1000, 0x8E, -14, -27
	banim_frame_oam 0x0, 0x5000, 0x8C, -22, -11
	banim_frame_oam 0x4000, 0x1000, 0xCC, -14, 5
	banim_frame_oam 0x0, 0x1000, 0xCE, -22, 5
	banim_frame_oam 0x4000, 0x1000, 0xC5, 1, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -15, 12
	banim_frame_end
banim_paif_sw1_2_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x1000, 0xB7, -12, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, 4, -28
	banim_frame_oam 0x4000, 0x9000, 0x9B, -20, 1
	banim_frame_oam 0x8000, 0x1000, 0x9F, -28, 1
	banim_frame_oam 0x4000, 0x9000, 0x5B, -20, -15
	banim_frame_oam 0x0, 0x1000, 0x7F, -28, -7
	banim_frame_oam 0x0, 0x5000, 0xDD, 12, -23
	banim_frame_oam 0x0, 0x5000, 0x1D, -12, -31
	banim_frame_oam 0x0, 0x1000, 0x3F, 4, -23
	banim_frame_oam 0x0, 0x1000, 0x5F, -20, -23
	banim_frame_oam 0x0, 0x1000, 0xD6, -37, -12
	banim_frame_oam 0x0, 0x1000, 0xB6, -21, -14
	banim_frame_oam 0x8000, 0x1000, 0xA, -29, -14
	banim_frame_end
banim_paif_sw1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0xF2, -26, -15
	banim_frame_oam 0x0, 0x1000, 0xF3, -26, -7
	banim_frame_oam 0x0, 0x1000, 0xF4, -26, 1
	banim_frame_oam 0x0, 0x1000, 0xBE, -20, -29
	banim_frame_oam 0x0, 0x1000, 0xBF, -20, -21
	banim_frame_oam 0x4000, 0x9000, 0x8A, -25, 3
	banim_frame_oam 0x0, 0x5000, 0x4B, -10, -29
	banim_frame_oam 0x8000, 0x1000, 0x4D, -18, -29
	banim_frame_oam 0x4000, 0x9000, 0xA, -26, -13
	banim_frame_oam 0x0, 0x1000, 0xB0, -26, -21
	banim_frame_oam 0x8000, 0x1000, 0x8E, 6, -21
	banim_frame_oam 0x0, 0x1000, 0xAF, 6, -5
	banim_frame_end
banim_paif_sw1_2_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -25, 2
	banim_frame_oam 0x4000, 0x9000, 0xC4, -25, -14
	banim_frame_oam 0x0, 0x5000, 0xC8, -18, -30
	banim_frame_oam 0x8000, 0x1000, 0xCA, -26, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -2, -22
	banim_frame_oam 0x8000, 0x1000, 0xCB, -26, -30
	banim_frame_end
banim_paif_sw1_2_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, -37, -25
	banim_frame_oam 0x0, 0x9000, 0x40, -29, -14
	banim_frame_oam 0x0, 0x5000, 0x0, -21, -30
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -22
	banim_frame_oam 0x0, 0x1000, 0x22, -29, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x44, -21, -14
	banim_frame_oam 0x8000, 0x5000, 0x48, -29, -14
	banim_frame_oam 0x0, 0x5000, 0x5, -21, -30
	banim_frame_oam 0x4000, 0x1000, 0x27, -37, -20
	banim_frame_oam 0x0, 0x1000, 0x7, -37, -12
	banim_frame_oam 0x0, 0x1000, 0x23, -39, -22
	banim_frame_oam 0x0, 0x1000, 0x29, -8, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x49, -21, -14
	banim_frame_oam 0x8000, 0x9000, 0x4D, -37, -14
	banim_frame_oam 0x4000, 0x5000, 0x29, -32, -22
	banim_frame_oam 0x0, 0x1000, 0xB, -45, -6
	banim_frame_oam 0x4000, 0x1000, 0x5, -21, -30
	banim_frame_oam 0x0, 0x1000, 0x8, -39, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x9000, 0x96, -26, 1
	banim_frame_oam 0x8000, 0x1000, 0x9A, -34, 1
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -15
	banim_frame_oam 0x8000, 0x1000, 0x5B, -32, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -21, -30
	banim_frame_oam 0x8000, 0x1000, 0x49, 3, -14
	banim_frame_oam 0x4000, 0x1000, 0x29, -16, -22
	banim_frame_oam 0x4000, 0x1000, 0x9, -29, -23
	banim_frame_oam 0x4000, 0x1000, 0x55, -38, -19
	banim_frame_end
banim_paif_sw1_2_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0x8F, -12, 0
	banim_frame_oam 0x0, 0x5000, 0x93, -28, 0
	banim_frame_oam 0x8000, 0x1000, 0x95, -36, 0
	banim_frame_oam 0x4000, 0x5000, 0x6F, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x73, -28, -8
	banim_frame_oam 0x0, 0x1000, 0x75, -36, -8
	banim_frame_oam 0x0, 0x1000, 0x51, 20, 0
	banim_frame_oam 0x4000, 0x1000, 0x52, -38, -16
	banim_frame_oam 0x0, 0x1000, 0x54, -44, -8
	banim_frame_oam 0x4000, 0x1000, 0x4F, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0xD, -22, -24
	banim_frame_oam 0x0, 0x1000, 0xC, 10, -16
	banim_frame_oam 0x0, 0x5000, 0x11, -4, -46
	banim_frame_end
banim_paif_sw1_2_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0xCC, 0, -39
	banim_frame_oam 0x4000, 0x5000, 0x5C, -8, 1
	banim_frame_oam 0x4000, 0x5000, 0x3C, -17, 9
	banim_frame_oam 0x4000, 0x9000, 0xDA, -10, -15
	banim_frame_oam 0x0, 0x5000, 0xDE, -26, -15
	banim_frame_oam 0x4000, 0x1000, 0x1C, -24, 1
	banim_frame_oam 0x0, 0x5000, 0x9B, -2, -31
	banim_frame_oam 0x8000, 0x1000, 0x9D, -10, -31
	banim_frame_oam 0x0, 0x1000, 0xBE, -18, -23
	banim_frame_oam 0x0, 0x5000, 0x11, 3, -47
	banim_frame_oam 0x0, 0x1000, 0xBF, -19, -18
	banim_frame_oam 0x0, 0x1000, 0x1E, -32, 1
	banim_frame_oam 0x0, 0x1000, 0x7D, -34, -7
	banim_frame_end
banim_paif_sw1_2_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0xD6, -19, 0
	banim_frame_oam 0x4000, 0x5000, 0xF1, -19, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -27, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -20, -16
	banim_frame_oam 0x4000, 0x9000, 0xCD, -13, -32
	banim_frame_oam 0x0, 0x1000, 0xEC, 19, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x1B, -27, 0
	banim_frame_oam 0x0, 0x5000, 0x11, 3, -48
	banim_frame_oam 0x0, 0x1000, 0xBF, -16, -21
	banim_frame_oam 0x0, 0x1000, 0x7C, -26, -11
	banim_frame_oam 0x0, 0x1000, 0xBF, -21, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_68_l:
	banim_frame_oam 0x0, 0x5000, 0x94, 13, 0
	banim_frame_oam 0x0, 0x1000, 0x93, 29, 0
	banim_frame_oam 0x0, 0x0, 0xB3, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xB3, 37, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 29, 9
	banim_frame_oam 0x4000, 0x9000, 0x55, 18, -16
	banim_frame_oam 0x0, 0x5000, 0x59, 2, -16
	banim_frame_oam 0x4000, 0x9000, 0x16, 13, -32
	banim_frame_oam 0x8000, 0x1000, 0x1A, 5, -32
	banim_frame_oam 0x0, 0x1000, 0x35, 45, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, 13, -40
	banim_frame_oam 0x4000, 0x2000, 0x8, 61, -10
	banim_frame_oam 0x0, 0x2000, 0x28, 61, -18
	banim_frame_oam 0x4000, 0x1000, 0xAA, 47, -16
	banim_frame_oam 0x0, 0x1000, 0x15, 36, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x2000, 0x8, 61, -10
	banim_frame_oam 0x0, 0x2000, 0x28, 61, -18
	banim_frame_oam 0x4000, 0x1000, 0xAA, 47, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x0, 0x9000, 0x20, -19, -32
	banim_frame_oam 0x0, 0x5000, 0x66, -43, -43
	banim_frame_oam 0x0, 0x5000, 0xA6, -27, -19
	banim_frame_oam 0x0, 0x1000, 0x68, -31, -27
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x0, 0x9000, 0x20, -19, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x0, 0x5000, 0x88, -42, -22
	banim_frame_oam 0x4000, 0x1000, 0xC8, -42, -6
	banim_frame_oam 0x0, 0x5000, 0x9, -18, -50
	banim_frame_end
banim_paif_sw1_2_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x9000, 0xB, -59, -33
	banim_frame_oam 0x4000, 0x1000, 0x49, -27, -20
	banim_frame_oam 0x8000, 0x1000, 0x4E, -57, -17
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x5, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -58, -47
	banim_frame_oam 0x0, 0x1000, 0xCA, -34, -31
	banim_frame_oam 0x0, 0x1000, 0x87, -31, -20
	banim_frame_oam 0x0, 0x1000, 0xA7, -28, -21
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x5, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_end
banim_paif_sw1_2_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_oam 0x0, 0x5000, 0x4B, -23, -50
	banim_frame_oam 0x0, 0x1000, 0x69, -31, -50
	banim_frame_oam 0x0, 0x1000, 0x6A, -23, -34
	banim_frame_oam 0x0, 0x1000, 0xF, -33, -23
	banim_frame_oam 0x8000, 0x1000, 0x2F, -38, -15
	banim_frame_oam 0x0, 0x1000, 0x50, -46, -7
	banim_frame_end
banim_paif_sw1_2_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, -43, -29
	banim_frame_oam 0x0, 0x1000, 0xE2, -27, -35
	banim_frame_oam 0x4000, 0x1000, 0xE3, -1, -51
	banim_frame_oam 0x0, 0x1000, 0xE5, -1, -43
	banim_frame_oam 0x4000, 0x1000, 0xE0, -23, -39
	banim_frame_oam 0x0, 0x1000, 0xE2, -7, -45
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x4000, 0x1000, 0xE0, -43, -29
	banim_frame_oam 0x0, 0x1000, 0xE2, -27, -35
	banim_frame_oam 0x4000, 0x1000, 0xE3, -1, -51
	banim_frame_oam 0x0, 0x1000, 0xE5, -1, -43
	banim_frame_oam 0x4000, 0x1000, 0xE0, -23, -39
	banim_frame_oam 0x0, 0x1000, 0xE2, -7, -45
	banim_frame_oam 0x0, 0x5000, 0xCB, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 13, -12
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_42_l:
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x4000, 0x1000, 0xE0, -43, -29
	banim_frame_oam 0x0, 0x1000, 0xE2, -27, -35
	banim_frame_oam 0x4000, 0x1000, 0xE3, -1, -51
	banim_frame_oam 0x0, 0x1000, 0xE5, -1, -43
	banim_frame_oam 0x4000, 0x1000, 0xE0, -23, -39
	banim_frame_oam 0x0, 0x1000, 0xE2, -7, -45
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_43_l:
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x5, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, -43, -29
	banim_frame_oam 0x0, 0x1000, 0xE2, -27, -35
	banim_frame_oam 0x4000, 0x1000, 0xE3, -1, -51
	banim_frame_oam 0x0, 0x1000, 0xE5, -1, -43
	banim_frame_oam 0x4000, 0x1000, 0xE0, -23, -39
	banim_frame_oam 0x0, 0x1000, 0xE2, -7, -45
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_44_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x8000, 0x9000, 0x6F, -19, -40
	banim_frame_oam 0x8000, 0x5000, 0x71, -27, -40
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x4000, 0x1000, 0xE0, -48, -31
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -37
	banim_frame_oam 0x4000, 0x1000, 0xE3, -6, -53
	banim_frame_oam 0x0, 0x1000, 0xE5, -6, -45
	banim_frame_oam 0x4000, 0x1000, 0xE0, -28, -41
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -47
	banim_frame_oam 0x0, 0x5000, 0xCB, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 13, -12
	banim_frame_end
banim_paif_sw1_2_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x9000, 0x42, -39, -14
	banim_frame_oam 0x0, 0x1000, 0x61, -7, -6
	banim_frame_oam 0x0, 0x5000, 0x7, -7, -14
	banim_frame_oam 0x4000, 0x9000, 0x80, -31, 2
	banim_frame_oam 0x0, 0x5000, 0x84, -47, 2
	banim_frame_oam 0x0, 0x5000, 0x3, -55, -14
	banim_frame_oam 0x8000, 0x1000, 0x5, -63, -14
	banim_frame_oam 0x0, 0x1000, 0x6, -71, -13
	banim_frame_oam 0x0, 0x5000, 0x0, -24, -30
	banim_frame_oam 0x8000, 0x1000, 0x2, -32, -30
	banim_frame_oam 0x0, 0x1000, 0xAF, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -2, -20
	banim_frame_oam 0x8000, 0x1000, 0x1E, -10, -25
	banim_frame_oam 0x4000, 0x1000, 0x5E, -55, -20
	banim_frame_oam 0x0, 0x1000, 0x5E, -39, -20
	banim_frame_oam 0x0, 0x1000, 0x5E, -31, -20
	banim_frame_end
banim_paif_sw1_2_oam_frame_46_l:
	banim_frame_oam 0x0, 0x5000, 0x84, -47, 0
	banim_frame_oam 0x0, 0x5000, 0x3, -55, -16
	banim_frame_oam 0x8000, 0x1000, 0x5, -63, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -71, -15
	banim_frame_oam 0x4000, 0x9000, 0x80, -31, 0
	banim_frame_oam 0x0, 0x5000, 0x0, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -32, -32
	banim_frame_oam 0x0, 0x1000, 0xAF, -1, 6
	banim_frame_oam 0x0, 0x5000, 0x7, -7, -16
	banim_frame_oam 0x4000, 0x9000, 0x42, -39, -16
	banim_frame_oam 0x0, 0x1000, 0x61, -7, -8
	banim_frame_oam 0x0, 0x1000, 0x3F, -2, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, -10, -27
	banim_frame_oam 0x4000, 0x1000, 0x5E, -55, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -39, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -31, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0x88, -29, 2
	banim_frame_oam 0x0, 0x5000, 0x8C, -45, 2
	banim_frame_oam 0x8000, 0x1000, 0x8E, -53, 2
	banim_frame_oam 0x0, 0x1000, 0x87, 3, 10
	banim_frame_oam 0x4000, 0x9000, 0x7, -21, -14
	banim_frame_oam 0x4000, 0x9000, 0xB, -53, -14
	banim_frame_oam 0x8000, 0x1000, 0xF, -61, -14
	banim_frame_oam 0x0, 0x5000, 0x0, -22, -30
	banim_frame_oam 0x8000, 0x1000, 0x2, -30, -30
	banim_frame_oam 0x4000, 0x1000, 0xA6, -47, -22
	banim_frame_oam 0x0, 0x1000, 0x6, -69, -14
	banim_frame_oam 0x0, 0x1000, 0x3F, 0, -20
	banim_frame_oam 0x8000, 0x1000, 0x1E, -8, -25
	banim_frame_oam 0x4000, 0x1000, 0x5E, -53, -20
	banim_frame_oam 0x0, 0x1000, 0x5E, -37, -20
	banim_frame_oam 0x0, 0x1000, 0x5E, -29, -20
	banim_frame_end
banim_paif_sw1_2_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x9000, 0x88, -29, 0
	banim_frame_oam 0x0, 0x5000, 0x8C, -45, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -53, 0
	banim_frame_oam 0x0, 0x1000, 0x87, 3, 8
	banim_frame_oam 0x4000, 0x9000, 0x7, -21, -16
	banim_frame_oam 0x4000, 0x9000, 0xB, -53, -16
	banim_frame_oam 0x8000, 0x1000, 0xF, -61, -16
	banim_frame_oam 0x0, 0x5000, 0x0, -22, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -30, -32
	banim_frame_oam 0x4000, 0x1000, 0xA6, -47, -24
	banim_frame_oam 0x0, 0x1000, 0x6, -69, -16
	banim_frame_oam 0x0, 0x1000, 0x3F, 0, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, -8, -27
	banim_frame_oam 0x4000, 0x1000, 0x5E, -53, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -37, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -29, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x9000, 0x4C, -39, -16
	banim_frame_oam 0x4000, 0x9000, 0x8F, -39, 0
	banim_frame_oam 0x8000, 0x1000, 0x93, -47, -8
	banim_frame_oam 0x0, 0x1000, 0x26, -64, -16
	banim_frame_oam 0x0, 0x5000, 0x0, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -32, -32
	banim_frame_oam 0x0, 0x5000, 0x46, -48, -24
	banim_frame_oam 0x8000, 0x1000, 0x48, -56, -24
	banim_frame_oam 0x0, 0x1000, 0x49, -63, -8
	banim_frame_oam 0x0, 0x5000, 0x7, -7, -14
	banim_frame_oam 0x0, 0x1000, 0x3F, -3, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, -11, -27
	banim_frame_oam 0x4000, 0x1000, 0x5E, -56, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -40, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -32, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_50_l:
	banim_frame_oam 0x4000, 0x9000, 0x10, -39, -16
	banim_frame_oam 0x0, 0x5000, 0x14, -55, -16
	banim_frame_oam 0x0, 0x5000, 0x54, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x56, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xF3, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0x50, -42, 0
	banim_frame_oam 0x4000, 0x5000, 0x70, -39, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -16, -23
	banim_frame_oam 0x4000, 0x1000, 0x94, -71, -16
	banim_frame_oam 0x0, 0x5000, 0x7, -7, -14
	banim_frame_oam 0x0, 0x1000, 0x3F, -3, -23
	banim_frame_oam 0x8000, 0x1000, 0x1E, -11, -28
	banim_frame_oam 0x4000, 0x1000, 0x5E, -56, -23
	banim_frame_oam 0x0, 0x1000, 0x5E, -40, -23
	banim_frame_oam 0x0, 0x1000, 0x5E, -32, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x9000, 0xC9, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0xCD, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xCF, -26, -32
	banim_frame_oam 0x4000, 0x9000, 0xC5, -66, -24
	banim_frame_oam 0x4000, 0x1000, 0xE3, -34, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -26, -16
	banim_frame_oam 0x0, 0x1000, 0xC2, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xC3, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -48, -8
	banim_frame_oam 0x4000, 0x1000, 0xEE, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -2, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, -10, -27
	banim_frame_oam 0x4000, 0x1000, 0x5E, -55, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -39, -22
	banim_frame_oam 0x0, 0x1000, 0x5E, -31, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_54_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -24, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -24, -13
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x1000, 0x5B, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x9D, -27, -48
	banim_frame_oam 0x4000, 0x1000, 0x7E, -29, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, 4, -42
	banim_frame_oam 0x8000, 0x1000, 0x1E, -4, -47
	banim_frame_oam 0x4000, 0x1000, 0x5E, -50, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -34, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -26, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -12, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -20, -42
	banim_frame_end
banim_paif_sw1_2_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -24, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -24, -13
	banim_frame_oam 0x0, 0x5000, 0xBE, -30, -40
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x1000, 0x5B, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x9D, -27, -48
	banim_frame_oam 0x4000, 0x1000, 0x7E, -29, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, 4, -43
	banim_frame_oam 0x8000, 0x1000, 0x1E, -4, -48
	banim_frame_oam 0x4000, 0x1000, 0x5E, -50, -43
	banim_frame_oam 0x0, 0x1000, 0x5E, -34, -43
	banim_frame_oam 0x0, 0x1000, 0x5E, -26, -43
	banim_frame_oam 0x0, 0x1000, 0x5E, -12, -43
	banim_frame_oam 0x0, 0x1000, 0x5E, -20, -43
	banim_frame_end
banim_paif_sw1_2_oam_frame_56_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -23, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -23, -13
	banim_frame_oam 0x4000, 0x1000, 0x9E, -30, -40
	banim_frame_oam 0x0, 0x1000, 0x9D, -27, -48
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x1000, 0x5B, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x9D, -27, -48
	banim_frame_oam 0x4000, 0x1000, 0x7E, -29, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, 3, -42
	banim_frame_oam 0x8000, 0x1000, 0x1E, -5, -47
	banim_frame_oam 0x4000, 0x1000, 0x5E, -51, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -35, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -27, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -13, -42
	banim_frame_oam 0x0, 0x1000, 0x5E, -21, -42
	banim_frame_end
banim_paif_sw1_2_oam_frame_57_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -20, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -20, -13
	banim_frame_oam 0x0, 0x5000, 0x19, -29, -40
	banim_frame_oam 0x0, 0x1000, 0x1B, -37, -40
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x1000, 0x5B, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, -3, -38
	banim_frame_oam 0x8000, 0x1000, 0x1E, -11, -43
	banim_frame_oam 0x4000, 0x1000, 0x5E, -57, -38
	banim_frame_oam 0x0, 0x1000, 0x5E, -41, -38
	banim_frame_oam 0x0, 0x1000, 0x5E, -33, -38
	banim_frame_oam 0x0, 0x1000, 0x5E, -19, -38
	banim_frame_oam 0x0, 0x1000, 0x5E, -27, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_58_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -28, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -28, -13
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x5000, 0x57, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0x79, -24, -24
	banim_frame_oam 0x0, 0x5000, 0x16, -17, -40
	banim_frame_oam 0x8000, 0x1000, 0x18, -25, -40
	banim_frame_oam 0x4000, 0x1000, 0xFD, 7, -38
	banim_frame_oam 0x0, 0x1000, 0xFF, -1, -38
	banim_frame_oam 0x4000, 0x0, 0xFD, -33, -38
	banim_frame_oam 0x0, 0x0, 0xFF, -17, -38
	banim_frame_oam 0x0, 0x0, 0xFF, -9, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_59_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -29, -29
	banim_frame_oam 0x4000, 0x1000, 0x7C, -29, -13
	banim_frame_oam 0x4000, 0x9000, 0xD9, -35, 0
	banim_frame_oam 0x4000, 0x9000, 0x97, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -16
	banim_frame_oam 0x0, 0x1000, 0xDD, -43, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, -52, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -41, -24
	banim_frame_oam 0x0, 0x5000, 0x57, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0x79, -24, -24
	banim_frame_oam 0x0, 0x5000, 0x16, -17, -40
	banim_frame_oam 0x8000, 0x1000, 0x18, -25, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_60_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x0, 0x5000, 0x66, -40, -63
	banim_frame_oam 0x0, 0x5000, 0xA6, -24, -39
	banim_frame_oam 0x0, 0x1000, 0x68, -28, -47
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_61_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_oam 0x0, 0x5000, 0x88, -43, -34
	banim_frame_oam 0x4000, 0x1000, 0xC8, -43, -18
	banim_frame_oam 0x0, 0x5000, 0x9, -19, -62
	banim_frame_oam 0x0, 0x1000, 0x6A, -22, -46
	banim_frame_oam 0x0, 0x1000, 0xF, -31, -39
	banim_frame_oam 0x0, 0x1000, 0x6A, -24, -44
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_end
banim_paif_sw1_2_oam_frame_62_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x4000, 0x9000, 0xB, -55, -50
	banim_frame_oam 0x4000, 0x1000, 0x49, -23, -37
	banim_frame_oam 0x8000, 0x1000, 0x4E, -53, -34
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_63_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, -55, -63
	banim_frame_oam 0x0, 0x1000, 0xCA, -31, -47
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_64_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_oam 0x0, 0x1000, 0x6A, -26, -43
	banim_frame_oam 0x0, 0x5000, 0x4B, -23, -63
	banim_frame_oam 0x0, 0x1000, 0x69, -31, -63
	banim_frame_oam 0x0, 0x1000, 0x6A, -23, -47
	banim_frame_oam 0x0, 0x1000, 0xF, -33, -36
	banim_frame_oam 0x8000, 0x1000, 0x2F, -38, -28
	banim_frame_oam 0x0, 0x1000, 0x50, -46, -20
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_end
banim_paif_sw1_2_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, 8
	banim_frame_oam 0x0, 0x9000, 0x60, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x64, -28, -24
	banim_frame_oam 0x0, 0x5000, 0x20, -13, -40
	banim_frame_oam 0x8000, 0x1000, 0x22, -21, -40
	banim_frame_oam 0x0, 0x1000, 0x43, 3, -32
	banim_frame_oam 0x0, 0x5000, 0x65, -13, -48
	banim_frame_oam 0x4000, 0x1000, 0xA5, -38, -19
	banim_frame_oam 0x0, 0x1000, 0xE4, -36, 0
	banim_frame_oam 0x4000, 0x1000, 0x45, -39, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_67_l:
	banim_frame_oam 0x4000, 0x5000, 0x0, -26, 8
	banim_frame_oam 0x0, 0x5000, 0x4, -15, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, -23, -40
	banim_frame_oam 0x0, 0x1000, 0x23, 1, -32
	banim_frame_oam 0x0, 0x9000, 0x7, -22, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -30, -24
	banim_frame_oam 0x8000, 0x1000, 0x87, -38, -8
	banim_frame_oam 0x0, 0x5000, 0x65, -15, -47
	banim_frame_oam 0x4000, 0x1000, 0xA5, -39, -19
	banim_frame_oam 0x4000, 0x1000, 0x45, -40, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_31_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_53_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_52_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_65_l:
	banim_frame_oam 0x0, 0x5000, 0x9C, -30, -29
	banim_frame_oam 0x4000, 0x1000, 0xDC, -30, -13
	banim_frame_oam 0x0, 0x1000, 0xF9, -52, -11
	banim_frame_oam 0x4000, 0x9000, 0x58, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x5C, -44, -16
	banim_frame_oam 0x4000, 0x5000, 0x98, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0xB8, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xDA, -28, -40
	banim_frame_oam 0x0, 0x3000, 0xD9, -42, -24
	banim_frame_oam 0x0, 0x1000, 0xD9, -45, 0
	banim_frame_oam 0x0, 0x5000, 0xBE, -6, -53
	banim_frame_oam 0x0, 0x1000, 0xB7, -14, -48
	banim_frame_oam 0x0, 0x1000, 0xB7, -22, -46
	banim_frame_oam 0x0, 0x1000, 0xB7, -30, -44
	banim_frame_oam 0x0, 0x1000, 0xB7, -38, -42
	banim_frame_oam 0x0, 0x1000, 0xB7, -40, -42
	banim_frame_end
	.section .data.oam_r
banim_paif_sw1_2_oam_r:
banim_paif_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -21, -32
	banim_frame_oam 0x4000, 0x8000, 0xC0, -13, 0
	banim_frame_oam 0x4000, 0x8000, 0x80, -15, -16
	banim_frame_oam 0x0, 0x0, 0x20, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x5A, -16, -47
	banim_frame_oam 0x0, 0x0, 0x9C, 19, -11
	banim_frame_oam 0x4000, 0x0, 0xBC, 3, -19
	banim_frame_oam 0x0, 0x0, 0xBC, 11, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, -14, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 18, 0
	banim_frame_oam 0x0, 0x0, 0x20, -1, -40
	banim_frame_oam 0x0, 0x4000, 0x88, 11, -16
	banim_frame_oam 0x0, 0x4000, 0x44, -7, -32
	banim_frame_oam 0x8000, 0x0, 0x46, 9, -32
	banim_frame_oam 0x0, 0x0, 0xF2, -15, -24
	banim_frame_oam 0x0, 0x4000, 0x5A, -9, -47
	banim_frame_oam 0x0, 0x0, 0x9C, 26, -11
	banim_frame_oam 0x4000, 0x0, 0xBC, 10, -19
	banim_frame_oam 0x0, 0x0, 0xBC, 18, -11
	banim_frame_oam 0x8000, 0x0, 0x4D, -21, -20
	banim_frame_oam 0x0, 0x4000, 0x85, -13, -16
	banim_frame_oam 0x8000, 0x0, 0x87, 3, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xC9, -14, 0
	banim_frame_oam 0x8000, 0x0, 0xCD, 18, 0
	banim_frame_oam 0x0, 0x4000, 0x4B, 11, -16
	banim_frame_oam 0x0, 0x4000, 0x8A, -4, -32
	banim_frame_oam 0x8000, 0x0, 0x8C, 12, -32
	banim_frame_oam 0x0, 0x0, 0x20, 1, -40
	banim_frame_oam 0x0, 0x4000, 0x1B, -7, -43
	banim_frame_oam 0x4000, 0x0, 0x39, 17, -16
	banim_frame_oam 0x0, 0x0, 0x3D, 17, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, -21, -20
	banim_frame_oam 0x0, 0x4000, 0x48, -13, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x4A, 3, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xCE, -4, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, 12, -32
	banim_frame_oam 0x4000, 0x8000, 0x4D, -20, -16
	banim_frame_oam 0x4000, 0x8000, 0x51, 12, -16
	banim_frame_oam 0x4000, 0x8000, 0x8D, -14, 0
	banim_frame_oam 0x0, 0x4000, 0x91, 18, 0
	banim_frame_oam 0x0, 0x0, 0xF1, 4, -40
	banim_frame_oam 0x4000, 0x0, 0x9D, -6, -40
	banim_frame_oam 0x0, 0x0, 0xBE, -6, -32
	banim_frame_oam 0x4000, 0x0, 0x7C, 18, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0xD3, 1, 0
	banim_frame_oam 0x4000, 0x8000, 0x93, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x97, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x55, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x59, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xD7, 0, -39
	banim_frame_oam 0x0, 0x0, 0xD9, 16, -39
	banim_frame_oam 0x0, 0x0, 0xF7, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x5C, 16, -43
	banim_frame_oam 0x0, 0x0, 0x5C, 10, -41
	banim_frame_oam 0x0, 0x4000, 0x5E, -23, -34
	banim_frame_oam 0x0, 0x0, 0x5C, -8, -35
	banim_frame_oam 0x0, 0x0, 0x5C, -2, -37
	banim_frame_end
banim_paif_sw1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x1, -19, 1
	banim_frame_oam 0x0, 0x4000, 0x3, 5, 1
	banim_frame_oam 0x8000, 0x0, 0x5, 21, 1
	banim_frame_oam 0x0, 0x0, 0x26, -3, 9
	banim_frame_oam 0x0, 0x0, 0x6, 13, -7
	banim_frame_oam 0x4000, 0x8000, 0x7, -35, -15
	banim_frame_oam 0x0, 0x4000, 0xB, -3, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 13, -26
	banim_frame_oam 0x4000, 0x8000, 0xF, -27, -31
	banim_frame_oam 0x8000, 0x0, 0x13, 5, -31
	banim_frame_oam 0x8000, 0x0, 0x14, -34, -34
	banim_frame_oam 0x4000, 0x4000, 0x35, -26, -39
	banim_frame_oam 0x0, 0x0, 0x0, -27, 1
	banim_frame_oam 0x4000, 0x0, 0x5C, 9, -41
	banim_frame_oam 0x0, 0x0, 0x5C, 3, -39
	banim_frame_oam 0x0, 0x4000, 0x5E, -32, -31
	banim_frame_end
banim_paif_sw1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0x22, -56, -24
	banim_frame_oam 0x0, 0x0, 0x41, -64, -16
	banim_frame_oam 0x0, 0x0, 0x40, -72, -14
	banim_frame_oam 0x4000, 0x0, 0x20, -56, -32
	banim_frame_oam 0x4000, 0x4000, 0xE0, -49, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, -17, 8
	banim_frame_oam 0x4000, 0x8000, 0xA0, -31, -8
	banim_frame_oam 0x4000, 0x8000, 0x60, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xC4, -47, -8
	banim_frame_oam 0x0, 0x4000, 0xC6, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x85, -40, -40
	banim_frame_oam 0x8000, 0x0, 0x87, -24, -40
	banim_frame_oam 0x0, 0x0, 0xA4, -16, -32
	banim_frame_oam 0x0, 0x0, 0x84, -8, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x94, -29, 0
	banim_frame_oam 0x0, 0x0, 0x93, -37, 0
	banim_frame_oam 0x0, 0x1000, 0xB3, -13, 8
	banim_frame_oam 0x0, 0x0, 0xB3, -45, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -37, 9
	banim_frame_oam 0x4000, 0x8000, 0x55, -50, -16
	banim_frame_oam 0x0, 0x4000, 0x59, -18, -16
	banim_frame_oam 0x4000, 0x8000, 0x16, -45, -32
	banim_frame_oam 0x8000, 0x0, 0x1A, -13, -32
	banim_frame_oam 0x0, 0x0, 0x35, -53, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -45, -40
	banim_frame_oam 0x4000, 0x0, 0xAA, -60, -17
	banim_frame_oam 0x0, 0x0, 0x15, -44, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -50, -10
	banim_frame_oam 0x4000, 0x8000, 0x32, -50, -26
	banim_frame_oam 0x4000, 0x0, 0x12, -50, -34
	banim_frame_oam 0x0, 0x0, 0x14, -34, -34
	banim_frame_oam 0x0, 0x0, 0x15, -18, -18
	banim_frame_oam 0x8000, 0x0, 0xB3, -20, -41
	banim_frame_oam 0x0, 0x0, 0x90, -28, -37
	banim_frame_oam 0x0, 0x0, 0x8F, -36, -33
	banim_frame_oam 0x0, 0x0, 0xD2, -44, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x91, -50, -24
	banim_frame_oam 0x4000, 0x0, 0x72, -49, -32
	banim_frame_oam 0x0, 0x0, 0x74, -33, -32
	banim_frame_oam 0x0, 0x4000, 0x34, -34, -26
	banim_frame_oam 0x0, 0x8000, 0xE, -50, -10
	banim_frame_oam 0x4000, 0x0, 0xD4, -3, -26
	banim_frame_oam 0x0, 0x4000, 0x94, -19, -34
	banim_frame_oam 0x0, 0x0, 0x93, -27, -31
	banim_frame_oam 0x8000, 0x0, 0xD6, -43, -50
	banim_frame_oam 0x0, 0x0, 0xB6, -35, -50
	banim_frame_oam 0x0, 0x0, 0xF5, -35, -36
	banim_frame_oam 0x0, 0x0, 0x15, -18, -18
	banim_frame_end
banim_paif_sw1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x91, -50, -24
	banim_frame_oam 0x4000, 0x0, 0x72, -49, -32
	banim_frame_oam 0x0, 0x0, 0x74, -33, -32
	banim_frame_oam 0x0, 0x4000, 0x34, -34, -26
	banim_frame_oam 0x0, 0x0, 0x15, -18, -18
	banim_frame_oam 0x4000, 0x0, 0xD4, -3, -26
	banim_frame_oam 0x0, 0x4000, 0x94, -19, -34
	banim_frame_oam 0x0, 0x0, 0x93, -27, -31
	banim_frame_oam 0x8000, 0x0, 0xD6, -43, -50
	banim_frame_oam 0x0, 0x0, 0xB6, -35, -50
	banim_frame_oam 0x0, 0x0, 0xF5, -35, -36
	banim_frame_oam 0x4000, 0x8000, 0xE, -50, -10
	banim_frame_oam 0x0, 0x4000, 0x37, -49, 6
	banim_frame_oam 0x8000, 0x0, 0x39, -33, 6
	banim_frame_oam 0x0, 0x0, 0x3A, -25, 6
	banim_frame_oam 0x0, 0x0, 0x71, -25, 14
	banim_frame_end
banim_paif_sw1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x8000, 0xD7, -58, 8
	banim_frame_oam 0x0, 0x4000, 0x97, -45, -8
	banim_frame_oam 0x8000, 0x0, 0x99, -29, -8
	banim_frame_oam 0x4000, 0x8000, 0xDB, -42, -24
	banim_frame_oam 0x0, 0x0, 0x96, -34, -32
	banim_frame_oam 0x0, 0x0, 0x56, -20, -32
	banim_frame_oam 0x0, 0x4000, 0x9A, -17, -40
	banim_frame_oam 0x0, 0x0, 0x79, -33, -32
	banim_frame_oam 0x4000, 0x0, 0x77, -52, -24
	banim_frame_oam 0x0, 0x0, 0x75, -21, -8
	banim_frame_oam 0x0, 0x0, 0x76, -25, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -55, 12
	banim_frame_oam 0x8000, 0x0, 0x9C, -45, -32
	banim_frame_oam 0x0, 0x0, 0xBD, -37, -24
	banim_frame_oam 0x4000, 0x8000, 0xD7, -58, 8
	banim_frame_oam 0x0, 0x4000, 0x97, -45, -8
	banim_frame_oam 0x8000, 0x0, 0x99, -29, -8
	banim_frame_oam 0x4000, 0x8000, 0xDB, -42, -24
	banim_frame_oam 0x0, 0x0, 0x56, -20, -32
	banim_frame_oam 0x8000, 0x0, 0x3C, -57, -54
	banim_frame_oam 0x0, 0x0, 0x5D, -49, -46
	banim_frame_oam 0x0, 0x0, 0x3D, -49, -39
	banim_frame_oam 0x0, 0x0, 0x3D, -45, -31
	banim_frame_oam 0x0, 0x0, 0x75, -21, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x3, -21, -49
	banim_frame_oam 0x0, 0x4000, 0xD, -20, -78
	banim_frame_oam 0x8000, 0x0, 0xC, -22, -53
	banim_frame_oam 0x8000, 0x0, 0xC, -20, -63
	banim_frame_oam 0x8000, 0x4000, 0xC, -25, -38
	banim_frame_oam 0x4000, 0x0, 0xC5, -37, 11
	banim_frame_oam 0x4000, 0x1000, 0xC5, -21, 11
	banim_frame_oam 0x8000, 0x0, 0xC0, -60, -22
	banim_frame_oam 0x0, 0x4000, 0xC1, -52, -14
	banim_frame_oam 0x8000, 0x0, 0xC3, -36, -14
	banim_frame_oam 0x0, 0x0, 0xC4, -28, -14
	banim_frame_oam 0x4000, 0x0, 0xE4, -12, -22
	banim_frame_oam 0x0, 0x0, 0xE6, 4, -22
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, -30
	banim_frame_oam 0x0, 0x4000, 0x40, -12, -38
	banim_frame_oam 0x8000, 0x0, 0x42, 4, -38
	banim_frame_oam 0x0, 0x0, 0x63, 12, -31
	banim_frame_oam 0x0, 0x0, 0x43, -5, -14
	banim_frame_oam 0x0, 0x4000, 0x0, -36, -46
	banim_frame_oam 0x8000, 0x0, 0x2, -20, -46
	banim_frame_oam 0x0, 0x0, 0x23, -52, -22
	banim_frame_oam 0x0, 0x0, 0x1B, -44, -39
	banim_frame_end
banim_paif_sw1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x3, -19, -49
	banim_frame_oam 0x8000, 0x3000, 0x68, -14, -60
	banim_frame_oam 0x8000, 0x0, 0x49, -6, -76
	banim_frame_oam 0x0, 0x0, 0xC9, -32, -19
	banim_frame_oam 0x0, 0x0, 0x48, -14, -68
	banim_frame_oam 0x8000, 0x0, 0x68, -22, -48
	banim_frame_oam 0x8000, 0x3000, 0x68, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xC5, -32, 10
	banim_frame_oam 0x4000, 0x1000, 0xC5, -16, 10
	banim_frame_oam 0x8000, 0x0, 0xC0, -58, -23
	banim_frame_oam 0x0, 0x4000, 0xC1, -50, -15
	banim_frame_oam 0x8000, 0x0, 0xC3, -34, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -26, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, -10, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 6, -23
	banim_frame_oam 0x4000, 0x8000, 0x80, -42, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -10, -39
	banim_frame_oam 0x8000, 0x0, 0x42, 6, -39
	banim_frame_oam 0x0, 0x0, 0x63, 14, -32
	banim_frame_oam 0x0, 0x0, 0x43, -3, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -34, -47
	banim_frame_oam 0x8000, 0x0, 0x2, -18, -47
	banim_frame_oam 0x0, 0x0, 0x23, -50, -23
	banim_frame_oam 0x0, 0x0, 0x1B, -42, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x3, -18, -49
	banim_frame_oam 0x0, 0x4000, 0x4A, -2, -72
	banim_frame_oam 0x8000, 0x0, 0x89, -9, -57
	banim_frame_oam 0x0, 0x0, 0xA8, -40, -26
	banim_frame_oam 0x8000, 0x0, 0x89, -16, -50
	banim_frame_oam 0x8000, 0x0, 0x89, -23, -43
	banim_frame_oam 0x8000, 0x0, 0x89, -30, -36
	banim_frame_oam 0x0, 0x0, 0x89, -33, -33
	banim_frame_oam 0x4000, 0x0, 0xC5, -31, 10
	banim_frame_oam 0x4000, 0x1000, 0xC5, -15, 10
	banim_frame_oam 0x8000, 0x0, 0xC0, -57, -23
	banim_frame_oam 0x0, 0x4000, 0xC1, -49, -15
	banim_frame_oam 0x8000, 0x0, 0xC3, -33, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -25, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, -9, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 7, -23
	banim_frame_oam 0x4000, 0x8000, 0x80, -41, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -9, -39
	banim_frame_oam 0x8000, 0x0, 0x42, 7, -39
	banim_frame_oam 0x0, 0x0, 0x63, 15, -32
	banim_frame_oam 0x0, 0x0, 0x43, -2, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -33, -47
	banim_frame_oam 0x8000, 0x0, 0x2, -17, -47
	banim_frame_oam 0x0, 0x0, 0x23, -49, -23
	banim_frame_oam 0x0, 0x0, 0x1B, -41, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x3, -15, -49
	banim_frame_oam 0x0, 0x0, 0x29, 12, -62
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -62
	banim_frame_oam 0x0, 0x0, 0xE7, -46, -36
	banim_frame_oam 0x4000, 0x0, 0xC7, -12, -54
	banim_frame_oam 0x4000, 0x0, 0xC7, -24, -48
	banim_frame_oam 0x4000, 0x3000, 0xC7, -36, -40
	banim_frame_oam 0x4000, 0x0, 0xC7, -44, -38
	banim_frame_oam 0x4000, 0x0, 0xC5, -29, 10
	banim_frame_oam 0x4000, 0x1000, 0xC5, -13, 10
	banim_frame_oam 0x8000, 0x0, 0xC0, -55, -23
	banim_frame_oam 0x0, 0x4000, 0xC1, -47, -15
	banim_frame_oam 0x8000, 0x0, 0xC3, -31, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -23, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, -7, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 9, -23
	banim_frame_oam 0x4000, 0x8000, 0x80, -39, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -7, -39
	banim_frame_oam 0x8000, 0x0, 0x42, 9, -39
	banim_frame_oam 0x0, 0x0, 0x63, 17, -32
	banim_frame_oam 0x0, 0x0, 0x43, 0, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -31, -47
	banim_frame_oam 0x8000, 0x0, 0x2, -15, -47
	banim_frame_oam 0x0, 0x0, 0x23, -47, -23
	banim_frame_oam 0x0, 0x0, 0x1B, -39, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x3, -13, -49
	banim_frame_oam 0x4000, 0x0, 0xCA, -47, -40
	banim_frame_oam 0x4000, 0x0, 0x8, 7, -59
	banim_frame_oam 0x0, 0x0, 0x28, 7, -51
	banim_frame_oam 0x4000, 0x3000, 0xAA, -9, -52
	banim_frame_oam 0x0, 0x0, 0xAA, -19, -48
	banim_frame_oam 0x4000, 0x0, 0xAA, -31, -44
	banim_frame_oam 0x4000, 0x0, 0xC5, -28, 10
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 10
	banim_frame_oam 0x8000, 0x0, 0xC0, -53, -23
	banim_frame_oam 0x0, 0x4000, 0xC1, -45, -15
	banim_frame_oam 0x8000, 0x0, 0xC3, -29, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -21, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, -5, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 11, -23
	banim_frame_oam 0x4000, 0x8000, 0x80, -37, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -5, -39
	banim_frame_oam 0x8000, 0x0, 0x42, 11, -39
	banim_frame_oam 0x0, 0x0, 0x63, 19, -32
	banim_frame_oam 0x0, 0x0, 0x43, 2, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -29, -47
	banim_frame_oam 0x8000, 0x0, 0x2, -13, -47
	banim_frame_oam 0x0, 0x0, 0x23, -45, -23
	banim_frame_oam 0x0, 0x0, 0x1B, -37, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x3, -8, -31
	banim_frame_oam 0x4000, 0x0, 0xE8, -45, -31
	banim_frame_oam 0x0, 0x4000, 0x4D, 13, -35
	banim_frame_oam 0x4000, 0x0, 0xE9, -29, -31
	banim_frame_oam 0x4000, 0x0, 0xE9, -13, -31
	banim_frame_oam 0x4000, 0x0, 0xE9, 3, -31
	banim_frame_oam 0x4000, 0x0, 0xC5, -28, 11
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 11
	banim_frame_oam 0x4000, 0x0, 0xF, -22, -46
	banim_frame_oam 0x4000, 0x4000, 0x2F, -30, -38
	banim_frame_oam 0x0, 0x0, 0x4F, -12, -30
	banim_frame_oam 0x8000, 0x0, 0xC0, -51, -22
	banim_frame_oam 0x0, 0x4000, 0xC1, -43, -14
	banim_frame_oam 0x8000, 0x0, 0xC3, -27, -14
	banim_frame_oam 0x0, 0x0, 0xC4, -19, -14
	banim_frame_oam 0x4000, 0x0, 0xE4, -3, -22
	banim_frame_oam 0x0, 0x0, 0xE6, 13, -22
	banim_frame_oam 0x4000, 0x8000, 0x80, -35, -30
	banim_frame_oam 0x0, 0x4000, 0x40, -3, -38
	banim_frame_oam 0x8000, 0x0, 0x42, 13, -38
	banim_frame_oam 0x0, 0x0, 0x63, 21, -31
	banim_frame_oam 0x0, 0x0, 0x43, 4, -14
	banim_frame_oam 0x0, 0x0, 0x23, -43, -22
	banim_frame_oam 0x0, 0x0, 0x1B, -30, -43
	banim_frame_end
banim_paif_sw1_2_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0xDB, -30, -38
	banim_frame_oam 0x4000, 0x0, 0xF9, 2, -29
	banim_frame_oam 0x4000, 0x0, 0xFB, -14, -33
	banim_frame_oam 0x0, 0x4000, 0xB9, 18, -29
	banim_frame_oam 0x0, 0x0, 0x1B, -22, -45
	banim_frame_oam 0x8000, 0x8000, 0x8F, -30, -39
	banim_frame_oam 0x8000, 0x8000, 0x51, -14, -48
	banim_frame_oam 0x0, 0x4000, 0xD1, -14, -16
	banim_frame_oam 0x8000, 0x0, 0x50, -38, -38
	banim_frame_oam 0x0, 0x0, 0x6F, -27, -47
	banim_frame_oam 0x8000, 0x0, 0x8E, 2, -32
	banim_frame_oam 0x0, 0x4000, 0x8C, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xCC, -6, 0
	banim_frame_oam 0x0, 0x0, 0xCE, 10, 0
	banim_frame_oam 0x4000, 0x0, 0xC5, -24, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -8, 12
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xDB, -29, -36
	banim_frame_oam 0x4000, 0x0, 0xF9, 3, -27
	banim_frame_oam 0x4000, 0x0, 0xFB, -13, -31
	banim_frame_oam 0x0, 0x4000, 0xB9, 19, -27
	banim_frame_oam 0x0, 0x0, 0x1B, -21, -43
	banim_frame_oam 0x8000, 0x8000, 0x8F, -29, -37
	banim_frame_oam 0x8000, 0x8000, 0x51, -13, -46
	banim_frame_oam 0x0, 0x4000, 0xD1, -13, -14
	banim_frame_oam 0x8000, 0x0, 0x50, -37, -36
	banim_frame_oam 0x0, 0x0, 0x6F, -26, -45
	banim_frame_oam 0x8000, 0x0, 0x8E, 3, -30
	banim_frame_oam 0x0, 0x4000, 0x8C, 3, -14
	banim_frame_oam 0x4000, 0x0, 0xCC, -5, 2
	banim_frame_oam 0x0, 0x0, 0xCE, 11, 2
	banim_frame_oam 0x4000, 0x0, 0xC5, -22, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -6, 12
	banim_frame_end
banim_paif_sw1_2_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x0, 0xDB, -26, -33
	banim_frame_oam 0x4000, 0x0, 0xF9, 6, -24
	banim_frame_oam 0x4000, 0x0, 0xFB, -10, -28
	banim_frame_oam 0x0, 0x0, 0x1B, -18, -40
	banim_frame_oam 0x0, 0x4000, 0xB9, 22, -24
	banim_frame_oam 0x8000, 0x8000, 0x8F, -26, -34
	banim_frame_oam 0x8000, 0x8000, 0x51, -10, -43
	banim_frame_oam 0x0, 0x4000, 0xD1, -10, -11
	banim_frame_oam 0x8000, 0x0, 0x50, -34, -33
	banim_frame_oam 0x0, 0x0, 0x6F, -23, -42
	banim_frame_oam 0x8000, 0x0, 0x8E, 6, -27
	banim_frame_oam 0x0, 0x4000, 0x8C, 6, -11
	banim_frame_oam 0x4000, 0x0, 0xCC, -2, 5
	banim_frame_oam 0x0, 0x0, 0xCE, 14, 5
	banim_frame_oam 0x4000, 0x0, 0xC5, -17, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -1, 12
	banim_frame_end
banim_paif_sw1_2_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x0, 0xB7, -4, -23
	banim_frame_oam 0x0, 0x0, 0x1B, -12, -28
	banim_frame_oam 0x4000, 0x8000, 0x9B, -12, 1
	banim_frame_oam 0x8000, 0x0, 0x9F, 20, 1
	banim_frame_oam 0x4000, 0x8000, 0x5B, -12, -15
	banim_frame_oam 0x0, 0x0, 0x7F, 20, -7
	banim_frame_oam 0x0, 0x4000, 0xDD, -28, -23
	banim_frame_oam 0x0, 0x4000, 0x1D, -4, -31
	banim_frame_oam 0x0, 0x0, 0x3F, -12, -23
	banim_frame_oam 0x0, 0x0, 0x5F, 12, -23
	banim_frame_oam 0x0, 0x0, 0xD6, 29, -12
	banim_frame_oam 0x0, 0x0, 0xB6, 13, -14
	banim_frame_oam 0x8000, 0x0, 0xA, 21, -14
	banim_frame_end
banim_paif_sw1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0xF2, 18, -15
	banim_frame_oam 0x0, 0x0, 0xF3, 18, -7
	banim_frame_oam 0x0, 0x0, 0xF4, 18, 1
	banim_frame_oam 0x0, 0x0, 0xBE, 12, -29
	banim_frame_oam 0x0, 0x0, 0xBF, 12, -21
	banim_frame_oam 0x4000, 0x8000, 0x8A, -7, 3
	banim_frame_oam 0x0, 0x4000, 0x4B, -6, -29
	banim_frame_oam 0x8000, 0x0, 0x4D, 10, -29
	banim_frame_oam 0x4000, 0x8000, 0xA, -6, -13
	banim_frame_oam 0x0, 0x0, 0xB0, 18, -21
	banim_frame_oam 0x8000, 0x0, 0x8E, -14, -21
	banim_frame_oam 0x0, 0x0, 0xAF, -14, -5
	banim_frame_end
banim_paif_sw1_2_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -7, 2
	banim_frame_oam 0x4000, 0x8000, 0xC4, -7, -14
	banim_frame_oam 0x0, 0x4000, 0xC8, 2, -30
	banim_frame_oam 0x8000, 0x0, 0xCA, 18, -30
	banim_frame_oam 0x0, 0x0, 0x24, -6, -22
	banim_frame_oam 0x8000, 0x0, 0xCB, 18, -30
	banim_frame_end
banim_paif_sw1_2_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x0, 0x3, 21, -25
	banim_frame_oam 0x0, 0x8000, 0x40, -3, -14
	banim_frame_oam 0x0, 0x4000, 0x0, 5, -30
	banim_frame_oam 0x0, 0x0, 0x2, -3, -22
	banim_frame_oam 0x0, 0x0, 0x22, 21, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x44, -11, -14
	banim_frame_oam 0x8000, 0x4000, 0x48, 21, -14
	banim_frame_oam 0x0, 0x4000, 0x5, 5, -30
	banim_frame_oam 0x4000, 0x0, 0x27, 21, -20
	banim_frame_oam 0x0, 0x0, 0x7, 29, -12
	banim_frame_oam 0x0, 0x0, 0x23, 31, -22
	banim_frame_oam 0x0, 0x0, 0x29, 0, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x49, -11, -14
	banim_frame_oam 0x8000, 0x8000, 0x4D, 21, -14
	banim_frame_oam 0x4000, 0x4000, 0x29, 0, -22
	banim_frame_oam 0x0, 0x0, 0xB, 37, -6
	banim_frame_oam 0x4000, 0x0, 0x5, 5, -30
	banim_frame_oam 0x0, 0x0, 0x8, 31, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x8000, 0x96, -6, 1
	banim_frame_oam 0x8000, 0x0, 0x9A, 26, 1
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -15
	banim_frame_oam 0x8000, 0x0, 0x5B, 24, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 5, -30
	banim_frame_oam 0x8000, 0x0, 0x49, -11, -14
	banim_frame_oam 0x4000, 0x0, 0x29, 0, -22
	banim_frame_oam 0x4000, 0x0, 0x9, 13, -23
	banim_frame_oam 0x4000, 0x0, 0x55, 22, -19
	banim_frame_end
banim_paif_sw1_2_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0x8F, -20, 0
	banim_frame_oam 0x0, 0x4000, 0x93, 12, 0
	banim_frame_oam 0x8000, 0x0, 0x95, 28, 0
	banim_frame_oam 0x4000, 0x4000, 0x6F, -20, -8
	banim_frame_oam 0x4000, 0x0, 0x73, 12, -8
	banim_frame_oam 0x0, 0x0, 0x75, 28, -8
	banim_frame_oam 0x0, 0x0, 0x51, -28, 0
	banim_frame_oam 0x4000, 0x0, 0x52, 22, -16
	banim_frame_oam 0x0, 0x0, 0x54, 36, -8
	banim_frame_oam 0x4000, 0x0, 0x4F, -2, -32
	banim_frame_oam 0x4000, 0x8000, 0xD, -10, -24
	banim_frame_oam 0x0, 0x0, 0xC, -18, -16
	banim_frame_oam 0x0, 0x4000, 0x11, -12, -46
	banim_frame_end
banim_paif_sw1_2_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0xCC, -8, -39
	banim_frame_oam 0x4000, 0x4000, 0x5C, -24, 1
	banim_frame_oam 0x4000, 0x4000, 0x3C, -15, 9
	banim_frame_oam 0x4000, 0x8000, 0xDA, -22, -15
	banim_frame_oam 0x0, 0x4000, 0xDE, 10, -15
	banim_frame_oam 0x4000, 0x0, 0x1C, 8, 1
	banim_frame_oam 0x0, 0x4000, 0x9B, -14, -31
	banim_frame_oam 0x8000, 0x0, 0x9D, 2, -31
	banim_frame_oam 0x0, 0x0, 0xBE, 10, -23
	banim_frame_oam 0x0, 0x4000, 0x11, -19, -47
	banim_frame_oam 0x0, 0x0, 0xBF, 11, -18
	banim_frame_oam 0x0, 0x0, 0x1E, 24, 1
	banim_frame_oam 0x0, 0x0, 0x7D, 26, -7
	banim_frame_end
banim_paif_sw1_2_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0xD6, -13, 0
	banim_frame_oam 0x4000, 0x4000, 0xF1, -13, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 19, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -20, -16
	banim_frame_oam 0x0, 0x0, 0xD5, 12, -16
	banim_frame_oam 0x4000, 0x8000, 0xCD, -19, -32
	banim_frame_oam 0x0, 0x0, 0xEC, -27, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -8, -40
	banim_frame_oam 0x0, 0x0, 0x1B, 19, 0
	banim_frame_oam 0x0, 0x4000, 0x11, -19, -48
	banim_frame_oam 0x0, 0x0, 0xBF, 8, -21
	banim_frame_oam 0x0, 0x0, 0x7C, 18, -11
	banim_frame_oam 0x0, 0x0, 0xBF, 13, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_68_r:
	banim_frame_oam 0x0, 0x4000, 0x94, -29, 0
	banim_frame_oam 0x0, 0x0, 0x93, -37, 0
	banim_frame_oam 0x0, 0x1000, 0xB3, -13, 8
	banim_frame_oam 0x0, 0x0, 0xB3, -45, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -37, 9
	banim_frame_oam 0x4000, 0x8000, 0x55, -50, -16
	banim_frame_oam 0x0, 0x4000, 0x59, -18, -16
	banim_frame_oam 0x4000, 0x8000, 0x16, -45, -32
	banim_frame_oam 0x8000, 0x0, 0x1A, -13, -32
	banim_frame_oam 0x0, 0x0, 0x35, -53, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -45, -40
	banim_frame_oam 0x4000, 0x3000, 0x8, -77, -10
	banim_frame_oam 0x0, 0x3000, 0x28, -69, -18
	banim_frame_oam 0x4000, 0x0, 0xAA, -63, -16
	banim_frame_oam 0x0, 0x0, 0x15, -44, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x3000, 0x8, -77, -10
	banim_frame_oam 0x0, 0x3000, 0x28, -69, -18
	banim_frame_oam 0x4000, 0x0, 0xAA, -63, -16
	banim_frame_end
banim_paif_sw1_2_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -13, -32
	banim_frame_oam 0x0, 0x4000, 0x66, 27, -43
	banim_frame_oam 0x0, 0x4000, 0xA6, 11, -19
	banim_frame_oam 0x0, 0x0, 0x68, 23, -27
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x0, 0x4000, 0x88, 26, -22
	banim_frame_oam 0x4000, 0x0, 0xC8, 26, -6
	banim_frame_oam 0x0, 0x4000, 0x9, 2, -50
	banim_frame_end
banim_paif_sw1_2_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x8000, 0xB, 27, -33
	banim_frame_oam 0x4000, 0x0, 0x49, 11, -20
	banim_frame_oam 0x8000, 0x0, 0x4E, 49, -17
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, 26, -47
	banim_frame_oam 0x0, 0x0, 0xCA, 26, -31
	banim_frame_oam 0x0, 0x0, 0x87, 23, -20
	banim_frame_oam 0x0, 0x0, 0xA7, 20, -21
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_end
banim_paif_sw1_2_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_oam 0x0, 0x4000, 0x4B, 7, -50
	banim_frame_oam 0x0, 0x0, 0x69, 23, -50
	banim_frame_oam 0x0, 0x0, 0x6A, 15, -34
	banim_frame_oam 0x0, 0x0, 0xF, 25, -23
	banim_frame_oam 0x8000, 0x0, 0x2F, 30, -15
	banim_frame_oam 0x0, 0x0, 0x50, 38, -7
	banim_frame_end
banim_paif_sw1_2_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, 27, -29
	banim_frame_oam 0x0, 0x0, 0xE2, 19, -35
	banim_frame_oam 0x4000, 0x0, 0xE3, -15, -51
	banim_frame_oam 0x0, 0x0, 0xE5, -7, -43
	banim_frame_oam 0x4000, 0x0, 0xE0, 7, -39
	banim_frame_oam 0x0, 0x0, 0xE2, -1, -45
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x4000, 0x0, 0xE0, 27, -29
	banim_frame_oam 0x0, 0x0, 0xE2, 19, -35
	banim_frame_oam 0x4000, 0x0, 0xE3, -15, -51
	banim_frame_oam 0x0, 0x0, 0xE5, -7, -43
	banim_frame_oam 0x4000, 0x0, 0xE0, 7, -39
	banim_frame_oam 0x0, 0x0, 0xE2, -1, -45
	banim_frame_oam 0x0, 0x4000, 0xCB, -13, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -21, -12
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_42_r:
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x4000, 0x0, 0xE0, 27, -29
	banim_frame_oam 0x0, 0x0, 0xE2, 19, -35
	banim_frame_oam 0x4000, 0x0, 0xE3, -15, -51
	banim_frame_oam 0x0, 0x0, 0xE5, -7, -43
	banim_frame_oam 0x4000, 0x0, 0xE0, 7, -39
	banim_frame_oam 0x0, 0x0, 0xE2, -1, -45
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_43_r:
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, 27, -29
	banim_frame_oam 0x0, 0x0, 0xE2, 19, -35
	banim_frame_oam 0x4000, 0x0, 0xE3, -15, -51
	banim_frame_oam 0x0, 0x0, 0xE5, -7, -43
	banim_frame_oam 0x4000, 0x0, 0xE0, 7, -39
	banim_frame_oam 0x0, 0x0, 0xE2, -1, -45
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_end
banim_paif_sw1_2_oam_frame_44_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x8000, 0x8000, 0x6F, 3, -40
	banim_frame_oam 0x8000, 0x4000, 0x71, 19, -40
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x4000, 0x0, 0xE0, 32, -31
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -37
	banim_frame_oam 0x4000, 0x0, 0xE3, -10, -53
	banim_frame_oam 0x0, 0x0, 0xE5, -2, -45
	banim_frame_oam 0x4000, 0x0, 0xE0, 12, -41
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -47
	banim_frame_oam 0x0, 0x4000, 0xCB, -13, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -21, -12
	banim_frame_end
banim_paif_sw1_2_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x8000, 0x42, 7, -14
	banim_frame_oam 0x0, 0x0, 0x61, -1, -6
	banim_frame_oam 0x0, 0x4000, 0x7, -9, -14
	banim_frame_oam 0x4000, 0x8000, 0x80, -1, 2
	banim_frame_oam 0x0, 0x4000, 0x84, 31, 2
	banim_frame_oam 0x0, 0x4000, 0x3, 39, -14
	banim_frame_oam 0x8000, 0x0, 0x5, 55, -14
	banim_frame_oam 0x0, 0x0, 0x6, 63, -13
	banim_frame_oam 0x0, 0x4000, 0x0, 8, -30
	banim_frame_oam 0x8000, 0x0, 0x2, 24, -30
	banim_frame_oam 0x0, 0x0, 0xAF, -7, 8
	banim_frame_oam 0x0, 0x0, 0x3F, -6, -20
	banim_frame_oam 0x8000, 0x0, 0x1E, 2, -25
	banim_frame_oam 0x4000, 0x0, 0x5E, 39, -20
	banim_frame_oam 0x0, 0x0, 0x5E, 31, -20
	banim_frame_oam 0x0, 0x0, 0x5E, 23, -20
	banim_frame_end
banim_paif_sw1_2_oam_frame_46_r:
	banim_frame_oam 0x0, 0x4000, 0x84, 31, 0
	banim_frame_oam 0x0, 0x4000, 0x3, 39, -16
	banim_frame_oam 0x8000, 0x0, 0x5, 55, -16
	banim_frame_oam 0x0, 0x0, 0x6, 63, -15
	banim_frame_oam 0x4000, 0x8000, 0x80, -1, 0
	banim_frame_oam 0x0, 0x4000, 0x0, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 24, -32
	banim_frame_oam 0x0, 0x0, 0xAF, -7, 6
	banim_frame_oam 0x0, 0x4000, 0x7, -9, -16
	banim_frame_oam 0x4000, 0x8000, 0x42, 7, -16
	banim_frame_oam 0x0, 0x0, 0x61, -1, -8
	banim_frame_oam 0x0, 0x0, 0x3F, -6, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, 2, -27
	banim_frame_oam 0x4000, 0x0, 0x5E, 39, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 31, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 23, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0x88, -3, 2
	banim_frame_oam 0x0, 0x4000, 0x8C, 29, 2
	banim_frame_oam 0x8000, 0x0, 0x8E, 45, 2
	banim_frame_oam 0x0, 0x0, 0x87, -11, 10
	banim_frame_oam 0x4000, 0x8000, 0x7, -11, -14
	banim_frame_oam 0x4000, 0x8000, 0xB, 21, -14
	banim_frame_oam 0x8000, 0x0, 0xF, 53, -14
	banim_frame_oam 0x0, 0x4000, 0x0, 6, -30
	banim_frame_oam 0x8000, 0x0, 0x2, 22, -30
	banim_frame_oam 0x4000, 0x0, 0xA6, 31, -22
	banim_frame_oam 0x0, 0x0, 0x6, 61, -14
	banim_frame_oam 0x0, 0x0, 0x3F, -8, -20
	banim_frame_oam 0x8000, 0x0, 0x1E, 0, -25
	banim_frame_oam 0x4000, 0x0, 0x5E, 37, -20
	banim_frame_oam 0x0, 0x0, 0x5E, 29, -20
	banim_frame_oam 0x0, 0x0, 0x5E, 21, -20
	banim_frame_end
banim_paif_sw1_2_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x8000, 0x88, -3, 0
	banim_frame_oam 0x0, 0x4000, 0x8C, 29, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 45, 0
	banim_frame_oam 0x0, 0x0, 0x87, -11, 8
	banim_frame_oam 0x4000, 0x8000, 0x7, -11, -16
	banim_frame_oam 0x4000, 0x8000, 0xB, 21, -16
	banim_frame_oam 0x8000, 0x0, 0xF, 53, -16
	banim_frame_oam 0x0, 0x4000, 0x0, 6, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 22, -32
	banim_frame_oam 0x4000, 0x0, 0xA6, 31, -24
	banim_frame_oam 0x0, 0x0, 0x6, 61, -16
	banim_frame_oam 0x0, 0x0, 0x3F, -8, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, 0, -27
	banim_frame_oam 0x4000, 0x0, 0x5E, 37, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 29, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 21, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x8000, 0x4C, 7, -16
	banim_frame_oam 0x4000, 0x8000, 0x8F, 7, 0
	banim_frame_oam 0x8000, 0x0, 0x93, 39, -8
	banim_frame_oam 0x0, 0x0, 0x26, 56, -16
	banim_frame_oam 0x0, 0x4000, 0x0, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 24, -32
	banim_frame_oam 0x0, 0x4000, 0x46, 32, -24
	banim_frame_oam 0x8000, 0x0, 0x48, 48, -24
	banim_frame_oam 0x0, 0x0, 0x49, 55, -8
	banim_frame_oam 0x0, 0x4000, 0x7, -9, -14
	banim_frame_oam 0x0, 0x0, 0x3F, -5, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, 3, -27
	banim_frame_oam 0x4000, 0x0, 0x5E, 40, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 32, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 24, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_50_r:
	banim_frame_oam 0x4000, 0x8000, 0x10, 7, -16
	banim_frame_oam 0x0, 0x4000, 0x14, 39, -16
	banim_frame_oam 0x0, 0x4000, 0x54, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x56, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xF3, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0x50, 10, 0
	banim_frame_oam 0x4000, 0x4000, 0x70, 7, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 8, -23
	banim_frame_oam 0x4000, 0x0, 0x94, 55, -16
	banim_frame_oam 0x0, 0x4000, 0x7, -9, -14
	banim_frame_oam 0x0, 0x0, 0x3F, -5, -23
	banim_frame_oam 0x8000, 0x0, 0x1E, 3, -28
	banim_frame_oam 0x4000, 0x0, 0x5E, 40, -23
	banim_frame_oam 0x0, 0x0, 0x5E, 32, -23
	banim_frame_oam 0x0, 0x0, 0x5E, 24, -23
	banim_frame_end
banim_paif_sw1_2_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x8000, 0xC9, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xCD, 32, -8
	banim_frame_oam 0x4000, 0x0, 0xCF, 10, -32
	banim_frame_oam 0x4000, 0x8000, 0xC5, 34, -24
	banim_frame_oam 0x4000, 0x0, 0xE3, 18, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -6, -16
	banim_frame_oam 0x0, 0x0, 0xC2, 24, -24
	banim_frame_oam 0x0, 0x0, 0xC3, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 40, -8
	banim_frame_oam 0x4000, 0x0, 0xEE, 8, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 24, 8
	banim_frame_oam 0x0, 0x0, 0x3F, -6, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, 2, -27
	banim_frame_oam 0x4000, 0x0, 0x5E, 39, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 31, -22
	banim_frame_oam 0x0, 0x0, 0x5E, 23, -22
	banim_frame_end
banim_paif_sw1_2_oam_frame_54_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 8, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 8, -13
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -32
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x0, 0x5B, 24, -32
	banim_frame_oam 0x0, 0x0, 0x9D, 19, -48
	banim_frame_oam 0x4000, 0x0, 0x7E, 13, -40
	banim_frame_oam 0x0, 0x0, 0x3F, -12, -42
	banim_frame_oam 0x8000, 0x0, 0x1E, -4, -47
	banim_frame_oam 0x4000, 0x0, 0x5E, 34, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 26, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 18, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 4, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 12, -42
	banim_frame_end
banim_paif_sw1_2_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 8, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 8, -13
	banim_frame_oam 0x0, 0x4000, 0xBE, 14, -40
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -32
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x0, 0x5B, 24, -32
	banim_frame_oam 0x0, 0x0, 0x9D, 19, -48
	banim_frame_oam 0x4000, 0x0, 0x7E, 13, -40
	banim_frame_oam 0x0, 0x0, 0x3F, -12, -43
	banim_frame_oam 0x8000, 0x0, 0x1E, -4, -48
	banim_frame_oam 0x4000, 0x0, 0x5E, 34, -43
	banim_frame_oam 0x0, 0x0, 0x5E, 26, -43
	banim_frame_oam 0x0, 0x0, 0x5E, 18, -43
	banim_frame_oam 0x0, 0x0, 0x5E, 4, -43
	banim_frame_oam 0x0, 0x0, 0x5E, 12, -43
	banim_frame_end
banim_paif_sw1_2_oam_frame_56_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 7, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 7, -13
	banim_frame_oam 0x4000, 0x0, 0x9E, 14, -40
	banim_frame_oam 0x0, 0x0, 0x9D, 19, -48
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -32
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x0, 0x5B, 24, -32
	banim_frame_oam 0x0, 0x0, 0x9D, 19, -48
	banim_frame_oam 0x4000, 0x0, 0x7E, 13, -40
	banim_frame_oam 0x0, 0x0, 0x3F, -11, -42
	banim_frame_oam 0x8000, 0x0, 0x1E, -3, -47
	banim_frame_oam 0x4000, 0x0, 0x5E, 35, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 27, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 19, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 5, -42
	banim_frame_oam 0x0, 0x0, 0x5E, 13, -42
	banim_frame_end
banim_paif_sw1_2_oam_frame_57_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 4, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 4, -13
	banim_frame_oam 0x0, 0x4000, 0x19, 13, -40
	banim_frame_oam 0x0, 0x0, 0x1B, 29, -40
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -32
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x0, 0x5B, 24, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -5, -38
	banim_frame_oam 0x8000, 0x0, 0x1E, 3, -43
	banim_frame_oam 0x4000, 0x0, 0x5E, 41, -38
	banim_frame_oam 0x0, 0x0, 0x5E, 33, -38
	banim_frame_oam 0x0, 0x0, 0x5E, 25, -38
	banim_frame_oam 0x0, 0x0, 0x5E, 11, -38
	banim_frame_oam 0x0, 0x0, 0x5E, 19, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_58_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 12, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 12, -13
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x4000, 0x57, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x79, 8, -24
	banim_frame_oam 0x0, 0x4000, 0x16, 1, -40
	banim_frame_oam 0x8000, 0x0, 0x18, 17, -40
	banim_frame_oam 0x4000, 0x0, 0xFD, -23, -38
	banim_frame_oam 0x0, 0x0, 0xFF, -7, -38
	banim_frame_oam 0x4000, 0x1000, 0xFD, 17, -38
	banim_frame_oam 0x0, 0x1000, 0xFF, 9, -38
	banim_frame_oam 0x0, 0x1000, 0xFF, 1, -38
	banim_frame_end
banim_paif_sw1_2_oam_frame_59_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, 13, -29
	banim_frame_oam 0x4000, 0x0, 0x7C, 13, -13
	banim_frame_oam 0x4000, 0x8000, 0xD9, 3, 0
	banim_frame_oam 0x4000, 0x8000, 0x97, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -16
	banim_frame_oam 0x0, 0x0, 0xDD, 35, 0
	banim_frame_oam 0x0, 0x0, 0xBD, 44, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 33, -24
	banim_frame_oam 0x0, 0x4000, 0x57, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x79, 8, -24
	banim_frame_oam 0x0, 0x4000, 0x16, 1, -40
	banim_frame_oam 0x8000, 0x0, 0x18, 17, -40
	banim_frame_end
banim_paif_sw1_2_oam_frame_60_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x0, 0x4000, 0x66, 24, -63
	banim_frame_oam 0x0, 0x4000, 0xA6, 8, -39
	banim_frame_oam 0x0, 0x0, 0x68, 20, -47
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_61_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_oam 0x0, 0x4000, 0x88, 27, -34
	banim_frame_oam 0x4000, 0x0, 0xC8, 27, -18
	banim_frame_oam 0x0, 0x4000, 0x9, 3, -62
	banim_frame_oam 0x0, 0x0, 0x6A, 14, -46
	banim_frame_oam 0x0, 0x0, 0xF, 23, -39
	banim_frame_oam 0x0, 0x0, 0x6A, 16, -44
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_end
banim_paif_sw1_2_oam_frame_62_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x4000, 0x8000, 0xB, 23, -50
	banim_frame_oam 0x4000, 0x0, 0x49, 7, -37
	banim_frame_oam 0x8000, 0x0, 0x4E, 45, -34
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_63_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, 23, -63
	banim_frame_oam 0x0, 0x0, 0xCA, 23, -47
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_end
banim_paif_sw1_2_oam_frame_64_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_oam 0x0, 0x0, 0x6A, 18, -43
	banim_frame_oam 0x0, 0x4000, 0x4B, 7, -63
	banim_frame_oam 0x0, 0x0, 0x69, 23, -63
	banim_frame_oam 0x0, 0x0, 0x6A, 15, -47
	banim_frame_oam 0x0, 0x0, 0xF, 25, -36
	banim_frame_oam 0x8000, 0x0, 0x2F, 30, -28
	banim_frame_oam 0x0, 0x0, 0x50, 38, -20
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_end
banim_paif_sw1_2_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, 8
	banim_frame_oam 0x0, 0x8000, 0x60, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x64, 20, -24
	banim_frame_oam 0x0, 0x4000, 0x20, -3, -40
	banim_frame_oam 0x8000, 0x0, 0x22, 13, -40
	banim_frame_oam 0x0, 0x0, 0x43, -11, -32
	banim_frame_oam 0x0, 0x4000, 0x65, -3, -48
	banim_frame_oam 0x4000, 0x0, 0xA5, 22, -19
	banim_frame_oam 0x0, 0x0, 0xE4, 28, 0
	banim_frame_oam 0x4000, 0x0, 0x45, 23, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_67_r:
	banim_frame_oam 0x4000, 0x4000, 0x0, -6, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -1, -40
	banim_frame_oam 0x8000, 0x0, 0x6, 15, -40
	banim_frame_oam 0x0, 0x0, 0x23, -9, -32
	banim_frame_oam 0x0, 0x8000, 0x7, -10, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 22, -24
	banim_frame_oam 0x8000, 0x0, 0x87, 30, -8
	banim_frame_oam 0x0, 0x4000, 0x65, -1, -47
	banim_frame_oam 0x4000, 0x0, 0xA5, 23, -19
	banim_frame_oam 0x4000, 0x0, 0x45, 24, -11
	banim_frame_end
banim_paif_sw1_2_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_31_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_53_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_52_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_paif_sw1_2_oam_frame_65_r:
	banim_frame_oam 0x0, 0x4000, 0x9C, 14, -29
	banim_frame_oam 0x4000, 0x0, 0xDC, 14, -13
	banim_frame_oam 0x0, 0x0, 0xF9, 44, -11
	banim_frame_oam 0x4000, 0x8000, 0x58, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x5C, 28, -16
	banim_frame_oam 0x4000, 0x4000, 0x98, 5, 0
	banim_frame_oam 0x4000, 0x4000, 0xB8, 1, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xDA, 12, -40
	banim_frame_oam 0x0, 0x2000, 0xD9, 34, -24
	banim_frame_oam 0x0, 0x0, 0xD9, 37, 0
	banim_frame_oam 0x0, 0x4000, 0xBE, -10, -53
	banim_frame_oam 0x0, 0x0, 0xB7, 6, -48
	banim_frame_oam 0x0, 0x0, 0xB7, 14, -46
	banim_frame_oam 0x0, 0x0, 0xB7, 22, -44
	banim_frame_oam 0x0, 0x0, 0xB7, 30, -42
	banim_frame_oam 0x0, 0x0, 0xB7, 32, -42
	banim_frame_end
	.section .data.script
banim_paif_sw1_2_script:
banim_paif_sw1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 5, banim_paif_sw1_2_oam_frame_5_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 6, banim_paif_sw1_2_oam_frame_6_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_paif_sw1_sheet_2, 7, banim_paif_sw1_2_oam_frame_7_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_paif_sw1_sheet_2, 33, banim_paif_sw1_2_oam_frame_32_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 34, banim_paif_sw1_2_oam_frame_35_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_paif_sw1_sheet_4, 35, banim_paif_sw1_2_oam_frame_36_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 36, banim_paif_sw1_2_oam_frame_37_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 37, banim_paif_sw1_2_oam_frame_38_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 38, banim_paif_sw1_2_oam_frame_39_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 39, banim_paif_sw1_2_oam_frame_40_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 40, banim_paif_sw1_2_oam_frame_41_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 41, banim_paif_sw1_2_oam_frame_42_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 42, banim_paif_sw1_2_oam_frame_43_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 39, banim_paif_sw1_2_oam_frame_40_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 40, banim_paif_sw1_2_oam_frame_41_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 43, banim_paif_sw1_2_oam_frame_44_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_2, 7, banim_paif_sw1_2_oam_frame_7_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_2, 33, banim_paif_sw1_2_oam_frame_32_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 51, banim_paif_sw1_2_oam_frame_54_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 52, banim_paif_sw1_2_oam_frame_55_r - banim_paif_sw1_2_oam_r
	banim_code_frame 7, banim_paif_sw1_sheet_5, 53, banim_paif_sw1_2_oam_frame_56_r - banim_paif_sw1_2_oam_r
	banim_code_frame 11, banim_paif_sw1_sheet_5, 54, banim_paif_sw1_2_oam_frame_57_r - banim_paif_sw1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_paif_sw1_sheet_5, 55, banim_paif_sw1_2_oam_frame_58_r - banim_paif_sw1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_paif_sw1_sheet_5, 56, banim_paif_sw1_2_oam_frame_59_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 57, banim_paif_sw1_2_oam_frame_60_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_paif_sw1_sheet_4, 58, banim_paif_sw1_2_oam_frame_61_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_4, 59, banim_paif_sw1_2_oam_frame_62_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_4, 60, banim_paif_sw1_2_oam_frame_63_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_4, 61, banim_paif_sw1_2_oam_frame_64_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_4, 71, banim_paif_sw1_2_oam_frame_65_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 51, banim_paif_sw1_2_oam_frame_54_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 52, banim_paif_sw1_2_oam_frame_55_r - banim_paif_sw1_2_oam_r
	banim_code_frame 7, banim_paif_sw1_sheet_5, 53, banim_paif_sw1_2_oam_frame_56_r - banim_paif_sw1_2_oam_r
	banim_code_frame 11, banim_paif_sw1_sheet_5, 54, banim_paif_sw1_2_oam_frame_57_r - banim_paif_sw1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_paif_sw1_sheet_5, 55, banim_paif_sw1_2_oam_frame_58_r - banim_paif_sw1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_paif_sw1_sheet_5, 56, banim_paif_sw1_2_oam_frame_59_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_6, 63, banim_paif_sw1_2_oam_frame_67_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_6, 63, banim_paif_sw1_2_oam_frame_67_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_stand:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 5, banim_paif_sw1_2_oam_frame_5_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 6, banim_paif_sw1_2_oam_frame_6_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_2, 32, banim_paif_sw1_2_oam_frame_68_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_paif_sw1_2_mode_attack_close - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_close_back - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_close_critical - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_close_critical_back - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_range - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_range_critical - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_dodge_close - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_dodge_range - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_stand_close - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_stand - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_stand_range - banim_paif_sw1_2_script
	.word banim_paif_sw1_2_mode_attack_miss - banim_paif_sw1_2_script
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

