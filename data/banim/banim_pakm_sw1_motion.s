@ vim:ft=armv4
	.global banim_pakm_sw1_script
	.global banim_pakm_sw1_oam_r
	.global banim_pakm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x39
	.section .data.oam_l
banim_pakm_sw1_oam_l:
banim_pakm_sw1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -11, -32
	banim_frame_oam 0x4000, 0x9000, 0xC0, -19, 0
	banim_frame_oam 0x4000, 0x9000, 0x80, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x20, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x9A, -15, -35
	banim_frame_oam 0x0, 0x1000, 0x9B, -23, -35
	banim_frame_oam 0x0, 0x1000, 0xBB, -27, -43
	banim_frame_oam 0x0, 0x0, 0x3A, -10, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -18, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -26, 0
	banim_frame_oam 0x0, 0x1000, 0x20, -7, -40
	banim_frame_oam 0x0, 0x5000, 0x88, -27, -16
	banim_frame_oam 0x0, 0x5000, 0x44, -9, -32
	banim_frame_oam 0x8000, 0x1000, 0x46, -17, -32
	banim_frame_oam 0x0, 0x1000, 0xF2, 7, -24
	banim_frame_oam 0x8000, 0x1000, 0x9A, -22, -35
	banim_frame_oam 0x0, 0x1000, 0x9B, -30, -35
	banim_frame_oam 0x0, 0x1000, 0xBB, -34, -43
	banim_frame_oam 0x0, 0x0, 0x3A, -18, -25
	banim_frame_oam 0x8000, 0x1000, 0x4D, 13, -20
	banim_frame_oam 0x0, 0x5000, 0x85, -3, -16
	banim_frame_oam 0x8000, 0x1000, 0x87, -11, -16
	banim_frame_end
banim_pakm_sw1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xC9, -18, 0
	banim_frame_oam 0x8000, 0x1000, 0xCD, -26, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0x8C, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x20, -9, -40
	banim_frame_oam 0x0, 0x5000, 0x4B, -27, -16
	banim_frame_oam 0x8000, 0x1000, 0x9A, -24, -35
	banim_frame_oam 0x0, 0x1000, 0x9B, -32, -35
	banim_frame_oam 0x0, 0x1000, 0xBB, -36, -43
	banim_frame_oam 0x0, 0x0, 0x3A, -20, -25
	banim_frame_oam 0x8000, 0x1000, 0x4D, 13, -20
	banim_frame_oam 0x0, 0x5000, 0x48, -3, -16
	banim_frame_oam 0x8000, 0x1000, 0x4A, -11, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 4, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xCE, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0x4D, -12, -16
	banim_frame_oam 0x4000, 0x9000, 0x51, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x8D, -18, 0
	banim_frame_oam 0x0, 0x5000, 0x91, -34, 0
	banim_frame_oam 0x0, 0x1000, 0xF1, -12, -40
	banim_frame_oam 0x8000, 0x1000, 0x9A, -25, -35
	banim_frame_oam 0x0, 0x1000, 0x9B, -33, -35
	banim_frame_oam 0x0, 0x1000, 0xBB, -37, -43
	banim_frame_oam 0x0, 0x1000, 0x99, -30, -24
	banim_frame_oam 0x0, 0x0, 0x3A, -21, -25
	banim_frame_end
banim_pakm_sw1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x1000, 0xF8, -23, -38
	banim_frame_oam 0x4000, 0x9000, 0xD3, -33, 0
	banim_frame_oam 0x4000, 0x9000, 0x93, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x97, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x55, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x59, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x9A, -18, -50
	banim_frame_oam 0x0, 0x1000, 0x9B, -26, -50
	banim_frame_oam 0x0, 0x1000, 0xBB, -30, -58
	banim_frame_oam 0x0, 0x1000, 0xF7, -40, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_5_l:
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
	banim_frame_oam 0x8000, 0x1000, 0x9A, -12, -46
	banim_frame_oam 0x0, 0x1000, 0x9B, -20, -46
	banim_frame_oam 0x0, 0x1000, 0xBB, -24, -54
	banim_frame_end
banim_pakm_sw1_oam_frame_6_l:
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
	banim_frame_oam 0x4000, 0x9000, 0xC8, 45, -27
	banim_frame_oam 0x4000, 0x5000, 0xEC, 42, -35
	banim_frame_oam 0x4000, 0x5000, 0xCC, 34, -43
	banim_frame_oam 0x4000, 0x5000, 0x0, 19, -51
	banim_frame_oam 0x8000, 0x1000, 0x24, 37, -30
	banim_frame_oam 0x0, 0x1000, 0x64, 40, -16
	banim_frame_oam 0x0, 0x1000, 0x6, 16, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_7_l:
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
	banim_frame_oam 0x4000, 0x0, 0xEB, 43, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 25, -12
	banim_frame_oam 0x4000, 0x9000, 0x32, 25, -28
	banim_frame_oam 0x4000, 0x1000, 0x12, 41, -36
	banim_frame_oam 0x0, 0x1000, 0x14, 33, -36
	banim_frame_oam 0x0, 0x1000, 0x15, 17, -20
	banim_frame_oam 0x4000, 0x1000, 0xD0, 52, -15
	banim_frame_oam 0x4000, 0x2000, 0xD0, 39, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x91, 41, -26
	banim_frame_oam 0x4000, 0x1000, 0x72, 40, -34
	banim_frame_oam 0x0, 0x1000, 0x74, 32, -34
	banim_frame_oam 0x0, 0x5000, 0x34, 25, -28
	banim_frame_oam 0x0, 0x9000, 0xE, 25, -12
	banim_frame_oam 0x0, 0x1000, 0x15, 17, -20
	banim_frame_oam 0x4000, 0x1000, 0x16, 21, -34
	banim_frame_oam 0x0, 0x1000, 0x18, 13, -34
	banim_frame_oam 0x0, 0x1000, 0x36, 21, -26
	banim_frame_end
banim_pakm_sw1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x9000, 0xD7, 36, 8
	banim_frame_oam 0x0, 0x5000, 0x97, 39, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, 31, -8
	banim_frame_oam 0x4000, 0x9000, 0xDB, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x96, 36, -32
	banim_frame_oam 0x0, 0x1000, 0x56, 22, -32
	banim_frame_oam 0x0, 0x1000, 0x19, 39, -35
	banim_frame_oam 0x4000, 0x1000, 0x1A, 23, -37
	banim_frame_oam 0x8000, 0x1000, 0x3B, 15, -37
	banim_frame_oam 0x0, 0x1000, 0x75, 23, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, 49, 12
	banim_frame_oam 0x8000, 0x1000, 0x9C, 47, -32
	banim_frame_oam 0x0, 0x1000, 0xBD, 39, -24
	banim_frame_oam 0x4000, 0x9000, 0xD7, 36, 8
	banim_frame_oam 0x0, 0x5000, 0x97, 39, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, 31, -8
	banim_frame_oam 0x4000, 0x9000, 0xDB, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x56, 22, -32
	banim_frame_oam 0x0, 0x1000, 0x75, 23, -8
	banim_frame_oam 0x8000, 0x5000, 0x3F, 49, -57
	banim_frame_end
banim_pakm_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 12, -49
	banim_frame_oam 0x4000, 0x1000, 0xC5, 21, 11
	banim_frame_oam 0x4000, 0x0, 0xC5, 5, 11
	banim_frame_oam 0x8000, 0x1000, 0xC0, 52, -23
	banim_frame_oam 0x0, 0x5000, 0xC1, 36, -15
	banim_frame_oam 0x8000, 0x1000, 0xC3, 28, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, 20, -15
	banim_frame_oam 0x4000, 0x1000, 0xE4, -4, -23
	banim_frame_oam 0x0, 0x1000, 0xE6, -12, -23
	banim_frame_oam 0x4000, 0x9000, 0x80, 12, -31
	banim_frame_oam 0x0, 0x5000, 0x40, -4, -39
	banim_frame_oam 0x8000, 0x1000, 0x42, -12, -39
	banim_frame_oam 0x0, 0x1000, 0x63, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -3, -15
	banim_frame_oam 0x0, 0x5000, 0x0, 20, -47
	banim_frame_oam 0x8000, 0x1000, 0x2, 12, -47
	banim_frame_oam 0x0, 0x1000, 0x23, 44, -23
	banim_frame_oam 0x8000, 0x1000, 0x46, 8, -59
	banim_frame_oam 0x0, 0x1000, 0x47, 0, -59
	banim_frame_oam 0x0, 0x1000, 0x67, -4, -67
	banim_frame_end
banim_pakm_sw1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 11, -48
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
	banim_frame_oam 0x8000, 0x1000, 0x46, 6, -59
	banim_frame_oam 0x0, 0x1000, 0x47, -2, -59
	banim_frame_oam 0x0, 0x1000, 0x67, -6, -67
	banim_frame_end
banim_pakm_sw1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 10, -48
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
	banim_frame_oam 0x0, 0x1000, 0x86, -4, -55
	banim_frame_oam 0x0, 0x1000, 0x87, -12, -58
	banim_frame_oam 0x4000, 0x1000, 0x44, 4, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -49
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
	banim_frame_oam 0x0, 0x1000, 0x86, -6, -55
	banim_frame_oam 0x0, 0x1000, 0x87, -14, -58
	banim_frame_oam 0x4000, 0x1000, 0x44, 2, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x3, 6, -49
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
	banim_frame_oam 0x0, 0x1000, 0x86, -8, -55
	banim_frame_oam 0x0, 0x1000, 0x87, -16, -58
	banim_frame_oam 0x4000, 0x1000, 0x44, 0, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x5000, 0xEB, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xF, 6, -46
	banim_frame_oam 0x4000, 0x5000, 0x2F, -2, -38
	banim_frame_oam 0x0, 0x1000, 0x4F, 4, -30
	banim_frame_oam 0x4000, 0x1000, 0xC5, 12, 11
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 11
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
	banim_frame_end
banim_pakm_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x11, -11, -29
	banim_frame_oam 0x0, 0x1000, 0x12, -19, -25
	banim_frame_oam 0x0, 0x1000, 0x13, -27, -21
	banim_frame_oam 0x4000, 0x1000, 0xC5, 8, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -8, 12
	banim_frame_oam 0x8000, 0x9000, 0x8F, 14, -39
	banim_frame_oam 0x8000, 0x9000, 0x51, -2, -48
	banim_frame_oam 0x0, 0x5000, 0xD1, -2, -16
	banim_frame_oam 0x8000, 0x1000, 0x50, 30, -38
	banim_frame_oam 0x0, 0x1000, 0x6F, 19, -47
	banim_frame_oam 0x8000, 0x1000, 0x8E, -10, -32
	banim_frame_oam 0x0, 0x5000, 0x8C, -18, -16
	banim_frame_oam 0x4000, 0x1000, 0xCC, -10, 0
	banim_frame_oam 0x0, 0x1000, 0xCE, -18, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x11, -12, -27
	banim_frame_oam 0x0, 0x1000, 0x12, -20, -23
	banim_frame_oam 0x0, 0x1000, 0x13, -28, -19
	banim_frame_oam 0x4000, 0x1000, 0xC5, 6, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -10, 12
	banim_frame_oam 0x8000, 0x9000, 0x8F, 13, -37
	banim_frame_oam 0x8000, 0x9000, 0x51, -3, -46
	banim_frame_oam 0x0, 0x5000, 0xD1, -3, -14
	banim_frame_oam 0x8000, 0x1000, 0x50, 29, -36
	banim_frame_oam 0x0, 0x1000, 0x6F, 18, -45
	banim_frame_oam 0x8000, 0x1000, 0x8E, -11, -30
	banim_frame_oam 0x0, 0x5000, 0x8C, -19, -14
	banim_frame_oam 0x4000, 0x1000, 0xCC, -11, 2
	banim_frame_oam 0x0, 0x1000, 0xCE, -19, 2
	banim_frame_end
banim_pakm_sw1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x11, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x12, -23, -20
	banim_frame_oam 0x0, 0x1000, 0x13, -31, -16
	banim_frame_oam 0x4000, 0x1000, 0xC5, 1, 12
	banim_frame_oam 0x4000, 0x0, 0xC5, -15, 12
	banim_frame_oam 0x8000, 0x9000, 0x8F, 10, -34
	banim_frame_oam 0x8000, 0x9000, 0x51, -6, -43
	banim_frame_oam 0x0, 0x5000, 0xD1, -6, -11
	banim_frame_oam 0x8000, 0x1000, 0x50, 26, -33
	banim_frame_oam 0x0, 0x1000, 0x6F, 15, -42
	banim_frame_oam 0x8000, 0x1000, 0x8E, -14, -27
	banim_frame_oam 0x0, 0x5000, 0x8C, -22, -11
	banim_frame_oam 0x4000, 0x1000, 0xCC, -14, 5
	banim_frame_oam 0x0, 0x1000, 0xCE, -22, 5
	banim_frame_end
banim_pakm_sw1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0x8A, -26, -18
	banim_frame_oam 0x4000, 0x1000, 0xA6, -34, -10
	banim_frame_oam 0x4000, 0x9000, 0x9B, -20, 1
	banim_frame_oam 0x8000, 0x1000, 0x9F, -28, 1
	banim_frame_oam 0x4000, 0x9000, 0x5B, -20, -15
	banim_frame_oam 0x0, 0x1000, 0x7F, -28, -7
	banim_frame_oam 0x0, 0x5000, 0xDD, 12, -23
	banim_frame_oam 0x0, 0x5000, 0x1D, -12, -31
	banim_frame_oam 0x0, 0x1000, 0x3F, 4, -23
	banim_frame_oam 0x0, 0x1000, 0x5F, -20, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0x8A, -26, 3
	banim_frame_oam 0x0, 0x5000, 0x4B, -11, -29
	banim_frame_oam 0x8000, 0x1000, 0x4D, -19, -29
	banim_frame_oam 0x4000, 0x9000, 0xA, -27, -13
	banim_frame_oam 0x0, 0x1000, 0xB0, -27, -21
	banim_frame_oam 0x8000, 0x1000, 0x8E, 5, -21
	banim_frame_oam 0x0, 0x1000, 0xAF, 5, -5
	banim_frame_oam 0x8000, 0x1000, 0xDF, -27, -11
	banim_frame_end
banim_pakm_sw1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -25, 2
	banim_frame_oam 0x4000, 0x9000, 0xC4, -25, -14
	banim_frame_oam 0x0, 0x5000, 0xC8, -18, -30
	banim_frame_oam 0x8000, 0x1000, 0xCA, -26, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -2, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x40, -29, -14
	banim_frame_oam 0x0, 0x5000, 0x0, -21, -30
	banim_frame_oam 0x0, 0x1000, 0x2, -5, -22
	banim_frame_oam 0x0, 0x1000, 0x22, -29, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x44, -21, -14
	banim_frame_oam 0x8000, 0x5000, 0x48, -29, -14
	banim_frame_oam 0x0, 0x5000, 0x5, -21, -30
	banim_frame_oam 0x4000, 0x1000, 0x27, -37, -20
	banim_frame_oam 0x0, 0x1000, 0x7, -37, -12
	banim_frame_oam 0x0, 0x1000, 0x29, -8, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x49, -21, -14
	banim_frame_oam 0x8000, 0x9000, 0x4D, -37, -14
	banim_frame_oam 0x4000, 0x5000, 0x29, -32, -22
	banim_frame_oam 0x0, 0x1000, 0xB, -45, -6
	banim_frame_oam 0x4000, 0x1000, 0x5, -21, -30
	banim_frame_end
banim_pakm_sw1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0x8F, -11, 0
	banim_frame_oam 0x0, 0x5000, 0x93, -27, 0
	banim_frame_oam 0x8000, 0x1000, 0x95, -35, 0
	banim_frame_oam 0x4000, 0x5000, 0x6F, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0x73, -27, -8
	banim_frame_oam 0x0, 0x1000, 0x75, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x51, 21, 0
	banim_frame_oam 0x4000, 0x1000, 0x52, -37, -16
	banim_frame_oam 0x0, 0x1000, 0x54, -43, -8
	banim_frame_oam 0x4000, 0x1000, 0x4F, -13, -32
	banim_frame_oam 0x4000, 0x9000, 0xD, -21, -24
	banim_frame_oam 0x0, 0x1000, 0xC, 11, -16
	banim_frame_oam 0x8000, 0x1000, 0x13, -21, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -29, -32
	banim_frame_oam 0x0, 0x1000, 0x34, -33, -40
	banim_frame_oam 0x0, 0x0, 0x3A, -16, -21
	banim_frame_end
banim_pakm_sw1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x9000, 0x96, -26, 1
	banim_frame_oam 0x8000, 0x1000, 0x9A, -34, 1
	banim_frame_oam 0x4000, 0x9000, 0x57, -24, -15
	banim_frame_oam 0x8000, 0x1000, 0x5B, -32, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -21, -30
	banim_frame_oam 0x8000, 0x1000, 0x49, 3, -14
	banim_frame_oam 0x4000, 0x1000, 0x29, -16, -22
	banim_frame_oam 0x4000, 0x1000, 0x9, -29, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0x32, 25, -27
	banim_frame_oam 0x4000, 0x1000, 0x12, 41, -35
	banim_frame_oam 0x0, 0x1000, 0x14, 33, -35
	banim_frame_oam 0x0, 0x1000, 0x15, 17, -19
	banim_frame_oam 0x4000, 0x9000, 0xE, 25, -11
	banim_frame_oam 0x0, 0x5000, 0x37, 40, 5
	banim_frame_oam 0x8000, 0x1000, 0x39, 32, 5
	banim_frame_oam 0x0, 0x1000, 0x3A, 24, 5
	banim_frame_oam 0x0, 0x1000, 0x71, 24, 13
	banim_frame_oam 0x0, 0x5000, 0x91, 41, -25
	banim_frame_oam 0x4000, 0x1000, 0x72, 40, -33
	banim_frame_oam 0x0, 0x1000, 0x74, 32, -33
	banim_frame_oam 0x0, 0x5000, 0x34, 25, -27
	banim_frame_oam 0x0, 0x1000, 0x15, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0x16, 21, -33
	banim_frame_oam 0x0, 0x1000, 0x18, 13, -33
	banim_frame_oam 0x0, 0x1000, 0x36, 21, -25
	banim_frame_end
banim_pakm_sw1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x9000, 0xD6, -19, 0
	banim_frame_oam 0x4000, 0x5000, 0xF1, -19, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -27, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -20, -16
	banim_frame_oam 0x4000, 0x9000, 0xCD, -13, -32
	banim_frame_oam 0x0, 0x1000, 0xEC, 19, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x1B, -27, 0
	banim_frame_oam 0x8000, 0x1000, 0x13, -15, -34
	banim_frame_oam 0x0, 0x1000, 0x14, -23, -34
	banim_frame_oam 0x0, 0x1000, 0x34, -27, -42
	banim_frame_oam 0x0, 0x0, 0x3A, -12, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, 8
	banim_frame_oam 0x0, 0x9000, 0x60, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x64, -28, -24
	banim_frame_oam 0x0, 0x5000, 0x20, -13, -40
	banim_frame_oam 0x8000, 0x1000, 0x22, -21, -40
	banim_frame_oam 0x0, 0x1000, 0x43, 3, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -36, 0
	banim_frame_oam 0x8000, 0x1000, 0xC5, -30, -33
	banim_frame_oam 0x0, 0x1000, 0xC6, -38, -33
	banim_frame_oam 0x0, 0x1000, 0xE6, -42, -41
	banim_frame_oam 0x0, 0x1000, 0x44, -23, -21
	banim_frame_end
banim_pakm_sw1_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x5000, 0x0, -26, 8
	banim_frame_oam 0x0, 0x5000, 0x4, -15, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, -23, -40
	banim_frame_oam 0x0, 0x1000, 0x23, 1, -32
	banim_frame_oam 0x0, 0x9000, 0x7, -22, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -30, -24
	banim_frame_oam 0x8000, 0x1000, 0x87, -38, -8
	banim_frame_oam 0x8000, 0x1000, 0xC5, -33, -32
	banim_frame_oam 0x0, 0x1000, 0xC6, -41, -32
	banim_frame_oam 0x0, 0x1000, 0xE6, -45, -40
	banim_frame_oam 0x0, 0x1000, 0x44, -26, -20
	banim_frame_end
banim_pakm_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -7
	banim_frame_end
banim_pakm_sw1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -9, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_57_l:
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
	banim_frame_oam 0x4000, 0x0, 0xEB, 43, -19
	banim_frame_oam 0x4000, 0x0, 0xED, 59, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x0, 0xED, 59, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x0, 0x9000, 0x20, -19, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xB6, -27, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x0, 0x9000, 0x20, -19, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x0, 0x5000, 0x33, -42, -14
	banim_frame_oam 0x0, 0x1000, 0x13, -34, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x5, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x4000, 0x1000, 0x15, -50, -31
	banim_frame_oam 0x0, 0x1000, 0x17, -58, -31
	banim_frame_oam 0x8000, 0x1000, 0x35, -58, -23
	banim_frame_oam 0x0, 0x1000, 0x14, -34, -27
	banim_frame_end
banim_pakm_sw1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x5, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_oam 0x0, 0x5000, 0x44, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x24, -27, -32
	banim_frame_oam 0x8000, 0x1000, 0x36, -33, -37
	banim_frame_oam 0x8000, 0x1000, 0x37, -41, -45
	banim_frame_oam 0x4000, 0x1000, 0x74, -57, -45
	banim_frame_end
banim_pakm_sw1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0xD7, -27, -37
	banim_frame_oam 0x4000, 0x1000, 0x84, -35, -8
	banim_frame_oam 0x8000, 0x9000, 0x22, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x45, -35, -24
	banim_frame_oam 0x4000, 0x1000, 0x64, -35, -16
	banim_frame_oam 0x0, 0x5000, 0x11, -26, -53
	banim_frame_oam 0x0, 0x1000, 0x51, -34, -53
	banim_frame_oam 0x0, 0x1000, 0x52, -26, -37
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x38, -8, -55
	banim_frame_oam 0x4000, 0x1000, 0x18, -20, -47
	banim_frame_oam 0x0, 0x1000, 0x39, -20, -39
	banim_frame_oam 0x0, 0x1000, 0x10, -27, -36
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0xCB, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 13, -12
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_oam 0x0, 0x1000, 0x38, -8, -55
	banim_frame_oam 0x4000, 0x1000, 0x18, -20, -47
	banim_frame_oam 0x0, 0x1000, 0x39, -20, -39
	banim_frame_oam 0x0, 0x1000, 0x10, -27, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x8000, 0x1000, 0xCD, -19, -40
	banim_frame_oam 0x0, 0x1000, 0xEE, -27, -32
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x0, 0x5000, 0x7, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0x47, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x46, 13, -8
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_oam 0x0, 0x1000, 0x38, -8, -55
	banim_frame_oam 0x4000, 0x1000, 0x18, -20, -47
	banim_frame_oam 0x0, 0x1000, 0x39, -20, -39
	banim_frame_oam 0x0, 0x1000, 0x10, -27, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_42_l:
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
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, -14
	banim_frame_oam 0x0, 0x5000, 0xAF, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, -27, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -32
	banim_frame_oam 0x0, 0x1000, 0x38, -8, -55
	banim_frame_oam 0x4000, 0x1000, 0x18, -20, -47
	banim_frame_oam 0x0, 0x1000, 0x39, -20, -39
	banim_frame_oam 0x0, 0x1000, 0x10, -27, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -35, 0
	banim_frame_oam 0x8000, 0x9000, 0x6F, -19, -40
	banim_frame_oam 0x8000, 0x5000, 0x71, -27, -40
	banim_frame_oam 0x8000, 0x1000, 0x4D, -35, -24
	banim_frame_oam 0x0, 0x5000, 0xA0, -51, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -32
	banim_frame_oam 0x4000, 0x5000, 0x82, -35, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 3, -40
	banim_frame_oam 0x4000, 0x1000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x5000, 0xCB, -3, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 13, -12
	banim_frame_oam 0x0, 0x1000, 0x38, -13, -56
	banim_frame_oam 0x4000, 0x1000, 0x18, -25, -48
	banim_frame_oam 0x0, 0x1000, 0x39, -25, -40
	banim_frame_oam 0x0, 0x1000, 0x10, -32, -37
	banim_frame_end
banim_pakm_sw1_oam_frame_44_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -38, -29
	banim_frame_oam 0x0, 0x1000, 0xD8, -46, -29
	banim_frame_oam 0x0, 0x1000, 0xF8, -50, -37
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
	banim_frame_oam 0x0, 0x1000, 0x3B, -35, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -38, -31
	banim_frame_oam 0x0, 0x1000, 0xD8, -46, -31
	banim_frame_oam 0x0, 0x1000, 0xF8, -50, -39
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
	banim_frame_oam 0x0, 0x1000, 0x3B, -33, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_46_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -35, -29
	banim_frame_oam 0x0, 0x1000, 0xD8, -43, -29
	banim_frame_oam 0x0, 0x1000, 0xF8, -47, -37
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
	banim_frame_end
banim_pakm_sw1_oam_frame_47_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -35, -31
	banim_frame_oam 0x0, 0x1000, 0xD8, -43, -31
	banim_frame_oam 0x0, 0x1000, 0xF8, -47, -39
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
	banim_frame_end
banim_pakm_sw1_oam_frame_48_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -37, -31
	banim_frame_oam 0x0, 0x1000, 0xD8, -45, -31
	banim_frame_oam 0x0, 0x1000, 0xF8, -49, -39
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
	banim_frame_end
banim_pakm_sw1_oam_frame_49_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -38, -32
	banim_frame_oam 0x0, 0x1000, 0xD8, -46, -32
	banim_frame_oam 0x0, 0x1000, 0xF8, -50, -40
	banim_frame_oam 0x4000, 0x9000, 0x10, -39, -16
	banim_frame_oam 0x0, 0x5000, 0x14, -55, -16
	banim_frame_oam 0x0, 0x5000, 0x54, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x56, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xF3, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0x50, -42, 0
	banim_frame_oam 0x4000, 0x5000, 0x70, -39, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, -71, -16
	banim_frame_oam 0x0, 0x5000, 0x7, -7, -14
	banim_frame_oam 0x0, 0x1000, 0x3B, -34, -18
	banim_frame_end
banim_pakm_sw1_oam_frame_50_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, -37, -31
	banim_frame_oam 0x0, 0x1000, 0xD8, -45, -31
	banim_frame_oam 0x0, 0x1000, 0xF8, -49, -39
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
	banim_frame_oam 0x0, 0x1000, 0xCE, -20, -40
	banim_frame_oam 0x0, 0x1000, 0x3B, -32, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x1000, 0xF8, -23, -38
	banim_frame_oam 0x4000, 0x9000, 0xD3, -33, 0
	banim_frame_oam 0x4000, 0x9000, 0x93, -28, -16
	banim_frame_oam 0x0, 0x5000, 0x97, -44, -16
	banim_frame_oam 0x4000, 0x9000, 0x55, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x59, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x1D, -27, -48
	banim_frame_oam 0x4000, 0x1000, 0x3E, -30, -56
	banim_frame_oam 0x8000, 0x1000, 0x9A, -18, -50
	banim_frame_oam 0x0, 0x1000, 0x9B, -26, -50
	banim_frame_oam 0x0, 0x1000, 0xBB, -30, -58
	banim_frame_oam 0x0, 0x1000, 0xF7, -40, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pakm_sw1_oam_r:
banim_pakm_sw1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -21, -32
	banim_frame_oam 0x4000, 0x8000, 0xC0, -13, 0
	banim_frame_oam 0x4000, 0x8000, 0x80, -15, -16
	banim_frame_oam 0x0, 0x0, 0x20, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x9A, 7, -35
	banim_frame_oam 0x0, 0x0, 0x9B, 15, -35
	banim_frame_oam 0x0, 0x0, 0xBB, 19, -43
	banim_frame_oam 0x0, 0x1000, 0x3A, 2, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, -14, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 18, 0
	banim_frame_oam 0x0, 0x0, 0x20, -1, -40
	banim_frame_oam 0x0, 0x4000, 0x88, 11, -16
	banim_frame_oam 0x0, 0x4000, 0x44, -7, -32
	banim_frame_oam 0x8000, 0x0, 0x46, 9, -32
	banim_frame_oam 0x0, 0x0, 0xF2, -15, -24
	banim_frame_oam 0x8000, 0x0, 0x9A, 14, -35
	banim_frame_oam 0x0, 0x0, 0x9B, 22, -35
	banim_frame_oam 0x0, 0x0, 0xBB, 26, -43
	banim_frame_oam 0x0, 0x1000, 0x3A, 10, -25
	banim_frame_oam 0x8000, 0x0, 0x4D, -21, -20
	banim_frame_oam 0x0, 0x4000, 0x85, -13, -16
	banim_frame_oam 0x8000, 0x0, 0x87, 3, -16
	banim_frame_end
banim_pakm_sw1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xC9, -14, 0
	banim_frame_oam 0x8000, 0x0, 0xCD, 18, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, -4, -32
	banim_frame_oam 0x8000, 0x0, 0x8C, 12, -32
	banim_frame_oam 0x0, 0x0, 0x20, 1, -40
	banim_frame_oam 0x0, 0x4000, 0x4B, 11, -16
	banim_frame_oam 0x8000, 0x0, 0x9A, 16, -35
	banim_frame_oam 0x0, 0x0, 0x9B, 24, -35
	banim_frame_oam 0x0, 0x0, 0xBB, 28, -43
	banim_frame_oam 0x0, 0x1000, 0x3A, 12, -25
	banim_frame_oam 0x8000, 0x0, 0x4D, -21, -20
	banim_frame_oam 0x0, 0x4000, 0x48, -13, -16
	banim_frame_oam 0x8000, 0x0, 0x4A, 3, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -12, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xCE, -4, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, 12, -32
	banim_frame_oam 0x4000, 0x8000, 0x4D, -20, -16
	banim_frame_oam 0x4000, 0x8000, 0x51, 12, -16
	banim_frame_oam 0x4000, 0x8000, 0x8D, -14, 0
	banim_frame_oam 0x0, 0x4000, 0x91, 18, 0
	banim_frame_oam 0x0, 0x0, 0xF1, 4, -40
	banim_frame_oam 0x8000, 0x0, 0x9A, 17, -35
	banim_frame_oam 0x0, 0x0, 0x9B, 25, -35
	banim_frame_oam 0x0, 0x0, 0xBB, 29, -43
	banim_frame_oam 0x0, 0x0, 0x99, 22, -24
	banim_frame_oam 0x0, 0x1000, 0x3A, 13, -25
	banim_frame_end
banim_pakm_sw1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x0, 0xF8, 7, -38
	banim_frame_oam 0x4000, 0x8000, 0xD3, 1, 0
	banim_frame_oam 0x4000, 0x8000, 0x93, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x97, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x55, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x59, 24, -32
	banim_frame_oam 0x8000, 0x0, 0x9A, 10, -50
	banim_frame_oam 0x0, 0x0, 0x9B, 18, -50
	banim_frame_oam 0x0, 0x0, 0xBB, 22, -58
	banim_frame_oam 0x0, 0x0, 0xF7, 32, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_5_r:
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
	banim_frame_oam 0x8000, 0x0, 0x9A, 4, -46
	banim_frame_oam 0x0, 0x0, 0x9B, 12, -46
	banim_frame_oam 0x0, 0x0, 0xBB, 16, -54
	banim_frame_end
banim_pakm_sw1_oam_frame_6_r:
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
	banim_frame_oam 0x4000, 0x8000, 0xC8, -77, -27
	banim_frame_oam 0x4000, 0x4000, 0xEC, -74, -35
	banim_frame_oam 0x4000, 0x4000, 0xCC, -66, -43
	banim_frame_oam 0x4000, 0x4000, 0x0, -51, -51
	banim_frame_oam 0x8000, 0x0, 0x24, -45, -30
	banim_frame_oam 0x0, 0x0, 0x64, -48, -16
	banim_frame_oam 0x0, 0x0, 0x6, -24, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_7_r:
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
	banim_frame_oam 0x4000, 0x1000, 0xEB, -59, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -57, -12
	banim_frame_oam 0x4000, 0x8000, 0x32, -57, -28
	banim_frame_oam 0x4000, 0x0, 0x12, -57, -36
	banim_frame_oam 0x0, 0x0, 0x14, -41, -36
	banim_frame_oam 0x0, 0x0, 0x15, -25, -20
	banim_frame_oam 0x4000, 0x0, 0xD0, -68, -15
	banim_frame_oam 0x4000, 0x3000, 0xD0, -55, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x91, -57, -26
	banim_frame_oam 0x4000, 0x0, 0x72, -56, -34
	banim_frame_oam 0x0, 0x0, 0x74, -40, -34
	banim_frame_oam 0x0, 0x4000, 0x34, -41, -28
	banim_frame_oam 0x0, 0x8000, 0xE, -57, -12
	banim_frame_oam 0x0, 0x0, 0x15, -25, -20
	banim_frame_oam 0x4000, 0x0, 0x16, -37, -34
	banim_frame_oam 0x0, 0x0, 0x18, -21, -34
	banim_frame_oam 0x0, 0x0, 0x36, -29, -26
	banim_frame_end
banim_pakm_sw1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x8000, 0xD7, -68, 8
	banim_frame_oam 0x0, 0x4000, 0x97, -55, -8
	banim_frame_oam 0x8000, 0x0, 0x99, -39, -8
	banim_frame_oam 0x4000, 0x8000, 0xDB, -52, -24
	banim_frame_oam 0x0, 0x0, 0x96, -44, -32
	banim_frame_oam 0x0, 0x0, 0x56, -30, -32
	banim_frame_oam 0x0, 0x0, 0x19, -47, -35
	banim_frame_oam 0x4000, 0x0, 0x1A, -39, -37
	banim_frame_oam 0x8000, 0x0, 0x3B, -23, -37
	banim_frame_oam 0x0, 0x0, 0x75, -31, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -65, 12
	banim_frame_oam 0x8000, 0x0, 0x9C, -55, -32
	banim_frame_oam 0x0, 0x0, 0xBD, -47, -24
	banim_frame_oam 0x4000, 0x8000, 0xD7, -68, 8
	banim_frame_oam 0x0, 0x4000, 0x97, -55, -8
	banim_frame_oam 0x8000, 0x0, 0x99, -39, -8
	banim_frame_oam 0x4000, 0x8000, 0xDB, -52, -24
	banim_frame_oam 0x0, 0x0, 0x56, -30, -32
	banim_frame_oam 0x0, 0x0, 0x75, -31, -8
	banim_frame_oam 0x8000, 0x4000, 0x3F, -57, -57
	banim_frame_end
banim_pakm_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x3, -20, -49
	banim_frame_oam 0x4000, 0x0, 0xC5, -37, 11
	banim_frame_oam 0x4000, 0x1000, 0xC5, -21, 11
	banim_frame_oam 0x8000, 0x0, 0xC0, -60, -23
	banim_frame_oam 0x0, 0x4000, 0xC1, -52, -15
	banim_frame_oam 0x8000, 0x0, 0xC3, -36, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -28, -15
	banim_frame_oam 0x4000, 0x0, 0xE4, -12, -23
	banim_frame_oam 0x0, 0x0, 0xE6, 4, -23
	banim_frame_oam 0x4000, 0x8000, 0x80, -44, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -12, -39
	banim_frame_oam 0x8000, 0x0, 0x42, 4, -39
	banim_frame_oam 0x0, 0x0, 0x63, 12, -32
	banim_frame_oam 0x0, 0x0, 0x43, -5, -15
	banim_frame_oam 0x0, 0x4000, 0x0, -36, -47
	banim_frame_oam 0x8000, 0x0, 0x2, -20, -47
	banim_frame_oam 0x0, 0x0, 0x23, -52, -23
	banim_frame_oam 0x8000, 0x0, 0x46, -16, -59
	banim_frame_oam 0x0, 0x0, 0x47, -8, -59
	banim_frame_oam 0x0, 0x0, 0x67, -4, -67
	banim_frame_end
banim_pakm_sw1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x3, -19, -48
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
	banim_frame_oam 0x8000, 0x0, 0x46, -14, -59
	banim_frame_oam 0x0, 0x0, 0x47, -6, -59
	banim_frame_oam 0x0, 0x0, 0x67, -2, -67
	banim_frame_end
banim_pakm_sw1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x3, -18, -48
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
	banim_frame_oam 0x0, 0x0, 0x86, -4, -55
	banim_frame_oam 0x0, 0x0, 0x87, 4, -58
	banim_frame_oam 0x4000, 0x0, 0x44, -20, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x3, -16, -49
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
	banim_frame_oam 0x0, 0x0, 0x86, -2, -55
	banim_frame_oam 0x0, 0x0, 0x87, 6, -58
	banim_frame_oam 0x4000, 0x0, 0x44, -18, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x3, -14, -49
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
	banim_frame_oam 0x0, 0x0, 0x86, 0, -55
	banim_frame_oam 0x0, 0x0, 0x87, 8, -58
	banim_frame_oam 0x4000, 0x0, 0x44, -16, -51
	banim_frame_end
banim_pakm_sw1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x4000, 0xEB, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xF, -22, -46
	banim_frame_oam 0x4000, 0x4000, 0x2F, -30, -38
	banim_frame_oam 0x0, 0x0, 0x4F, -12, -30
	banim_frame_oam 0x4000, 0x0, 0xC5, -28, 11
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 11
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
	banim_frame_end
banim_pakm_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x11, 3, -29
	banim_frame_oam 0x0, 0x0, 0x12, 11, -25
	banim_frame_oam 0x0, 0x0, 0x13, 19, -21
	banim_frame_oam 0x4000, 0x0, 0xC5, -24, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -8, 12
	banim_frame_oam 0x8000, 0x8000, 0x8F, -30, -39
	banim_frame_oam 0x8000, 0x8000, 0x51, -14, -48
	banim_frame_oam 0x0, 0x4000, 0xD1, -14, -16
	banim_frame_oam 0x8000, 0x0, 0x50, -38, -38
	banim_frame_oam 0x0, 0x0, 0x6F, -27, -47
	banim_frame_oam 0x8000, 0x0, 0x8E, 2, -32
	banim_frame_oam 0x0, 0x4000, 0x8C, 2, -16
	banim_frame_oam 0x4000, 0x0, 0xCC, -6, 0
	banim_frame_oam 0x0, 0x0, 0xCE, 10, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x11, 4, -27
	banim_frame_oam 0x0, 0x0, 0x12, 12, -23
	banim_frame_oam 0x0, 0x0, 0x13, 20, -19
	banim_frame_oam 0x4000, 0x0, 0xC5, -22, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -6, 12
	banim_frame_oam 0x8000, 0x8000, 0x8F, -29, -37
	banim_frame_oam 0x8000, 0x8000, 0x51, -13, -46
	banim_frame_oam 0x0, 0x4000, 0xD1, -13, -14
	banim_frame_oam 0x8000, 0x0, 0x50, -37, -36
	banim_frame_oam 0x0, 0x0, 0x6F, -26, -45
	banim_frame_oam 0x8000, 0x0, 0x8E, 3, -30
	banim_frame_oam 0x0, 0x4000, 0x8C, 3, -14
	banim_frame_oam 0x4000, 0x0, 0xCC, -5, 2
	banim_frame_oam 0x0, 0x0, 0xCE, 11, 2
	banim_frame_end
banim_pakm_sw1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x11, 7, -24
	banim_frame_oam 0x0, 0x0, 0x12, 15, -20
	banim_frame_oam 0x0, 0x0, 0x13, 23, -16
	banim_frame_oam 0x4000, 0x0, 0xC5, -17, 12
	banim_frame_oam 0x4000, 0x1000, 0xC5, -1, 12
	banim_frame_oam 0x8000, 0x8000, 0x8F, -26, -34
	banim_frame_oam 0x8000, 0x8000, 0x51, -10, -43
	banim_frame_oam 0x0, 0x4000, 0xD1, -10, -11
	banim_frame_oam 0x8000, 0x0, 0x50, -34, -33
	banim_frame_oam 0x0, 0x0, 0x6F, -23, -42
	banim_frame_oam 0x8000, 0x0, 0x8E, 6, -27
	banim_frame_oam 0x0, 0x4000, 0x8C, 6, -11
	banim_frame_oam 0x4000, 0x0, 0xCC, -2, 5
	banim_frame_oam 0x0, 0x0, 0xCE, 14, 5
	banim_frame_end
banim_pakm_sw1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0x8A, 10, -18
	banim_frame_oam 0x4000, 0x0, 0xA6, 18, -10
	banim_frame_oam 0x4000, 0x8000, 0x9B, -12, 1
	banim_frame_oam 0x8000, 0x0, 0x9F, 20, 1
	banim_frame_oam 0x4000, 0x8000, 0x5B, -12, -15
	banim_frame_oam 0x0, 0x0, 0x7F, 20, -7
	banim_frame_oam 0x0, 0x4000, 0xDD, -28, -23
	banim_frame_oam 0x0, 0x4000, 0x1D, -4, -31
	banim_frame_oam 0x0, 0x0, 0x3F, -12, -23
	banim_frame_oam 0x0, 0x0, 0x5F, 12, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0x8A, -6, 3
	banim_frame_oam 0x0, 0x4000, 0x4B, -5, -29
	banim_frame_oam 0x8000, 0x0, 0x4D, 11, -29
	banim_frame_oam 0x4000, 0x8000, 0xA, -5, -13
	banim_frame_oam 0x0, 0x0, 0xB0, 19, -21
	banim_frame_oam 0x8000, 0x0, 0x8E, -13, -21
	banim_frame_oam 0x0, 0x0, 0xAF, -13, -5
	banim_frame_oam 0x8000, 0x0, 0xDF, 19, -11
	banim_frame_end
banim_pakm_sw1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -7, 2
	banim_frame_oam 0x4000, 0x8000, 0xC4, -7, -14
	banim_frame_oam 0x0, 0x4000, 0xC8, 2, -30
	banim_frame_oam 0x8000, 0x0, 0xCA, 18, -30
	banim_frame_oam 0x0, 0x0, 0x24, -6, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x40, -3, -14
	banim_frame_oam 0x0, 0x4000, 0x0, 5, -30
	banim_frame_oam 0x0, 0x0, 0x2, -3, -22
	banim_frame_oam 0x0, 0x0, 0x22, 21, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x44, -11, -14
	banim_frame_oam 0x8000, 0x4000, 0x48, 21, -14
	banim_frame_oam 0x0, 0x4000, 0x5, 5, -30
	banim_frame_oam 0x4000, 0x0, 0x27, 21, -20
	banim_frame_oam 0x0, 0x0, 0x7, 29, -12
	banim_frame_oam 0x0, 0x0, 0x29, 0, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x49, -11, -14
	banim_frame_oam 0x8000, 0x8000, 0x4D, 21, -14
	banim_frame_oam 0x4000, 0x4000, 0x29, 0, -22
	banim_frame_oam 0x0, 0x0, 0xB, 37, -6
	banim_frame_oam 0x4000, 0x0, 0x5, 5, -30
	banim_frame_end
banim_pakm_sw1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0x8F, -21, 0
	banim_frame_oam 0x0, 0x4000, 0x93, 11, 0
	banim_frame_oam 0x8000, 0x0, 0x95, 27, 0
	banim_frame_oam 0x4000, 0x4000, 0x6F, -21, -8
	banim_frame_oam 0x4000, 0x0, 0x73, 11, -8
	banim_frame_oam 0x0, 0x0, 0x75, 27, -8
	banim_frame_oam 0x0, 0x0, 0x51, -29, 0
	banim_frame_oam 0x4000, 0x0, 0x52, 21, -16
	banim_frame_oam 0x0, 0x0, 0x54, 35, -8
	banim_frame_oam 0x4000, 0x0, 0x4F, -3, -32
	banim_frame_oam 0x4000, 0x8000, 0xD, -11, -24
	banim_frame_oam 0x0, 0x0, 0xC, -19, -16
	banim_frame_oam 0x8000, 0x0, 0x13, 13, -32
	banim_frame_oam 0x0, 0x0, 0x14, 21, -32
	banim_frame_oam 0x0, 0x0, 0x34, 25, -40
	banim_frame_oam 0x0, 0x1000, 0x3A, 8, -21
	banim_frame_end
banim_pakm_sw1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x8000, 0x96, -6, 1
	banim_frame_oam 0x8000, 0x0, 0x9A, 26, 1
	banim_frame_oam 0x4000, 0x8000, 0x57, -8, -15
	banim_frame_oam 0x8000, 0x0, 0x5B, 24, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 5, -30
	banim_frame_oam 0x8000, 0x0, 0x49, -11, -14
	banim_frame_oam 0x4000, 0x0, 0x29, 0, -22
	banim_frame_oam 0x4000, 0x0, 0x9, 13, -23
	banim_frame_end
banim_pakm_sw1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0x32, -57, -27
	banim_frame_oam 0x4000, 0x0, 0x12, -57, -35
	banim_frame_oam 0x0, 0x0, 0x14, -41, -35
	banim_frame_oam 0x0, 0x0, 0x15, -25, -19
	banim_frame_oam 0x4000, 0x8000, 0xE, -57, -11
	banim_frame_oam 0x0, 0x4000, 0x37, -56, 5
	banim_frame_oam 0x8000, 0x0, 0x39, -40, 5
	banim_frame_oam 0x0, 0x0, 0x3A, -32, 5
	banim_frame_oam 0x0, 0x0, 0x71, -32, 13
	banim_frame_oam 0x0, 0x4000, 0x91, -57, -25
	banim_frame_oam 0x4000, 0x0, 0x72, -56, -33
	banim_frame_oam 0x0, 0x0, 0x74, -40, -33
	banim_frame_oam 0x0, 0x4000, 0x34, -41, -27
	banim_frame_oam 0x0, 0x0, 0x15, -25, -19
	banim_frame_oam 0x4000, 0x0, 0x16, -37, -33
	banim_frame_oam 0x0, 0x0, 0x18, -21, -33
	banim_frame_oam 0x0, 0x0, 0x36, -29, -25
	banim_frame_end
banim_pakm_sw1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x8000, 0xD6, -13, 0
	banim_frame_oam 0x4000, 0x4000, 0xF1, -13, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 19, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -20, -16
	banim_frame_oam 0x0, 0x0, 0xD5, 12, -16
	banim_frame_oam 0x4000, 0x8000, 0xCD, -19, -32
	banim_frame_oam 0x0, 0x0, 0xEC, -27, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -8, -40
	banim_frame_oam 0x0, 0x0, 0x1B, 19, 0
	banim_frame_oam 0x8000, 0x0, 0x13, 7, -34
	banim_frame_oam 0x0, 0x0, 0x14, 15, -34
	banim_frame_oam 0x0, 0x0, 0x34, 19, -42
	banim_frame_oam 0x0, 0x1000, 0x3A, 4, -24
	banim_frame_end
banim_pakm_sw1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, 8
	banim_frame_oam 0x0, 0x8000, 0x60, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x64, 20, -24
	banim_frame_oam 0x0, 0x4000, 0x20, -3, -40
	banim_frame_oam 0x8000, 0x0, 0x22, 13, -40
	banim_frame_oam 0x0, 0x0, 0x43, -11, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 28, 0
	banim_frame_oam 0x8000, 0x0, 0xC5, 22, -33
	banim_frame_oam 0x0, 0x0, 0xC6, 30, -33
	banim_frame_oam 0x0, 0x0, 0xE6, 34, -41
	banim_frame_oam 0x0, 0x0, 0x44, 15, -21
	banim_frame_end
banim_pakm_sw1_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x4000, 0x0, -6, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -1, -40
	banim_frame_oam 0x8000, 0x0, 0x6, 15, -40
	banim_frame_oam 0x0, 0x0, 0x23, -9, -32
	banim_frame_oam 0x0, 0x8000, 0x7, -10, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 22, -24
	banim_frame_oam 0x8000, 0x0, 0x87, 30, -8
	banim_frame_oam 0x8000, 0x0, 0xC5, 25, -32
	banim_frame_oam 0x0, 0x0, 0xC6, 33, -32
	banim_frame_oam 0x0, 0x0, 0xE6, 37, -40
	banim_frame_oam 0x0, 0x0, 0x44, 18, -20
	banim_frame_end
banim_pakm_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -7
	banim_frame_end
banim_pakm_sw1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 1, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_57_r:
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
	banim_frame_oam 0x4000, 0x1000, 0xEB, -59, -19
	banim_frame_oam 0x4000, 0x1000, 0xED, -75, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x1000, 0xED, -75, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x0, 0xB6, 19, -19
	banim_frame_end
banim_pakm_sw1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x0, 0x4000, 0x33, 26, -14
	banim_frame_oam 0x0, 0x0, 0x13, 26, -22
	banim_frame_end
banim_pakm_sw1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x4000, 0x0, 0x15, 34, -31
	banim_frame_oam 0x0, 0x0, 0x17, 50, -31
	banim_frame_oam 0x8000, 0x0, 0x35, 50, -23
	banim_frame_oam 0x0, 0x0, 0x14, 26, -27
	banim_frame_end
banim_pakm_sw1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_oam 0x0, 0x4000, 0x44, 19, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x0, 0x0, 0x24, 19, -32
	banim_frame_oam 0x8000, 0x0, 0x36, 25, -37
	banim_frame_oam 0x8000, 0x0, 0x37, 33, -45
	banim_frame_oam 0x4000, 0x0, 0x74, 41, -45
	banim_frame_end
banim_pakm_sw1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0xD7, 11, -37
	banim_frame_oam 0x4000, 0x0, 0x84, 19, -8
	banim_frame_oam 0x8000, 0x8000, 0x22, 3, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x0, 0x45, 27, -24
	banim_frame_oam 0x4000, 0x0, 0x64, 19, -16
	banim_frame_oam 0x0, 0x4000, 0x11, 10, -53
	banim_frame_oam 0x0, 0x0, 0x51, 26, -53
	banim_frame_oam 0x0, 0x0, 0x52, 18, -37
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x0, 0x0, 0x38, 0, -55
	banim_frame_oam 0x4000, 0x0, 0x18, 4, -47
	banim_frame_oam 0x0, 0x0, 0x39, 12, -39
	banim_frame_oam 0x0, 0x0, 0x10, 19, -36
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_end
banim_pakm_sw1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0xCB, -13, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -21, -12
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_oam 0x0, 0x0, 0x38, 0, -55
	banim_frame_oam 0x4000, 0x0, 0x18, 4, -47
	banim_frame_oam 0x0, 0x0, 0x39, 12, -39
	banim_frame_oam 0x0, 0x0, 0x10, 19, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x8000, 0x0, 0xCD, 11, -40
	banim_frame_oam 0x0, 0x0, 0xEE, 19, -32
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x0, 0x4000, 0x7, -13, -24
	banim_frame_oam 0x4000, 0x0, 0x47, -13, -8
	banim_frame_oam 0x0, 0x0, 0x46, -21, -8
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_oam 0x0, 0x0, 0x38, 0, -55
	banim_frame_oam 0x4000, 0x0, 0x18, 4, -47
	banim_frame_oam 0x0, 0x0, 0x39, 12, -39
	banim_frame_oam 0x0, 0x0, 0x10, 19, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_42_r:
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
	banim_frame_oam 0x0, 0x0, 0xE6, -21, -14
	banim_frame_oam 0x0, 0x4000, 0xAF, 3, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, 19, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -32
	banim_frame_oam 0x0, 0x0, 0x38, 0, -55
	banim_frame_oam 0x4000, 0x0, 0x18, 4, -47
	banim_frame_oam 0x0, 0x0, 0x39, 12, -39
	banim_frame_oam 0x0, 0x0, 0x10, 19, -36
	banim_frame_end
banim_pakm_sw1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, 3, 0
	banim_frame_oam 0x8000, 0x8000, 0x6F, 3, -40
	banim_frame_oam 0x8000, 0x4000, 0x71, 19, -40
	banim_frame_oam 0x8000, 0x0, 0x4D, 27, -24
	banim_frame_oam 0x0, 0x4000, 0xA0, 35, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -32
	banim_frame_oam 0x4000, 0x4000, 0x82, 3, -8
	banim_frame_oam 0x0, 0x0, 0x0, -11, -40
	banim_frame_oam 0x4000, 0x0, 0x1, 3, -40
	banim_frame_oam 0x0, 0x4000, 0xCB, -13, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -21, -12
	banim_frame_oam 0x0, 0x0, 0x38, 5, -56
	banim_frame_oam 0x4000, 0x0, 0x18, 9, -48
	banim_frame_oam 0x0, 0x0, 0x39, 17, -40
	banim_frame_oam 0x0, 0x0, 0x10, 24, -37
	banim_frame_end
banim_pakm_sw1_oam_frame_44_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 30, -29
	banim_frame_oam 0x0, 0x0, 0xD8, 38, -29
	banim_frame_oam 0x0, 0x0, 0xF8, 42, -37
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
	banim_frame_oam 0x0, 0x0, 0x3B, 27, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 30, -31
	banim_frame_oam 0x0, 0x0, 0xD8, 38, -31
	banim_frame_oam 0x0, 0x0, 0xF8, 42, -39
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
	banim_frame_oam 0x0, 0x0, 0x3B, 25, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_46_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 27, -29
	banim_frame_oam 0x0, 0x0, 0xD8, 35, -29
	banim_frame_oam 0x0, 0x0, 0xF8, 39, -37
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
	banim_frame_end
banim_pakm_sw1_oam_frame_47_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 27, -31
	banim_frame_oam 0x0, 0x0, 0xD8, 35, -31
	banim_frame_oam 0x0, 0x0, 0xF8, 39, -39
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
	banim_frame_end
banim_pakm_sw1_oam_frame_48_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 29, -31
	banim_frame_oam 0x0, 0x0, 0xD8, 37, -31
	banim_frame_oam 0x0, 0x0, 0xF8, 41, -39
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
	banim_frame_end
banim_pakm_sw1_oam_frame_49_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 30, -32
	banim_frame_oam 0x0, 0x0, 0xD8, 38, -32
	banim_frame_oam 0x0, 0x0, 0xF8, 42, -40
	banim_frame_oam 0x4000, 0x8000, 0x10, 7, -16
	banim_frame_oam 0x0, 0x4000, 0x14, 39, -16
	banim_frame_oam 0x0, 0x4000, 0x54, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x56, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xF3, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0x50, 10, 0
	banim_frame_oam 0x4000, 0x4000, 0x70, 7, 8
	banim_frame_oam 0x4000, 0x0, 0x94, 55, -16
	banim_frame_oam 0x0, 0x4000, 0x7, -9, -14
	banim_frame_oam 0x0, 0x0, 0x3B, 26, -18
	banim_frame_end
banim_pakm_sw1_oam_frame_50_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, 29, -31
	banim_frame_oam 0x0, 0x0, 0xD8, 37, -31
	banim_frame_oam 0x0, 0x0, 0xF8, 41, -39
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
	banim_frame_oam 0x0, 0x0, 0xCE, 12, -40
	banim_frame_oam 0x0, 0x0, 0x3B, 24, -17
	banim_frame_end
banim_pakm_sw1_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x0, 0xF8, 7, -38
	banim_frame_oam 0x4000, 0x8000, 0xD3, 1, 0
	banim_frame_oam 0x4000, 0x8000, 0x93, -4, -16
	banim_frame_oam 0x0, 0x4000, 0x97, 28, -16
	banim_frame_oam 0x4000, 0x8000, 0x55, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x59, 24, -32
	banim_frame_oam 0x4000, 0x0, 0x1D, 11, -48
	banim_frame_oam 0x4000, 0x0, 0x3E, 14, -56
	banim_frame_oam 0x8000, 0x0, 0x9A, 10, -50
	banim_frame_oam 0x0, 0x0, 0x9B, 18, -50
	banim_frame_oam 0x0, 0x0, 0xBB, 22, -58
	banim_frame_oam 0x0, 0x0, 0xF7, 32, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pakm_sw1_script:
banim_pakm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 16, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_0, 5, banim_pakm_sw1_oam_frame_5_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 6, banim_pakm_sw1_oam_frame_6_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 7, banim_pakm_sw1_oam_frame_7_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 9, banim_pakm_sw1_oam_frame_9_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 16, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 42, banim_pakm_sw1_oam_frame_31_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 43, banim_pakm_sw1_oam_frame_34_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 44, banim_pakm_sw1_oam_frame_35_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 45, banim_pakm_sw1_oam_frame_36_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 46, banim_pakm_sw1_oam_frame_37_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 47, banim_pakm_sw1_oam_frame_38_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 48, banim_pakm_sw1_oam_frame_39_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 49, banim_pakm_sw1_oam_frame_40_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 50, banim_pakm_sw1_oam_frame_41_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 51, banim_pakm_sw1_oam_frame_42_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 48, banim_pakm_sw1_oam_frame_39_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 49, banim_pakm_sw1_oam_frame_40_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 52, banim_pakm_sw1_oam_frame_43_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 7, banim_pakm_sw1_oam_frame_7_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 9, banim_pakm_sw1_oam_frame_9_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 42, banim_pakm_sw1_oam_frame_31_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 28, banim_pakm_sw1_oam_frame_53_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 7, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 28, banim_pakm_sw1_oam_frame_53_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 7, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_start_dodge
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_6, 32, banim_pakm_sw1_oam_frame_56_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_start_dodge
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_6, 32, banim_pakm_sw1_oam_frame_56_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_stand_close:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_stand:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_stand_range:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 14, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 5, banim_pakm_sw1_oam_frame_5_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 6, banim_pakm_sw1_oam_frame_6_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 41, banim_pakm_sw1_oam_frame_57_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pakm_sw1_mode_attack_close - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_close_back - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_close_critical - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_close_critical_back - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_range - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_range_critical - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_dodge_close - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_dodge_range - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_stand_close - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_stand - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_stand_range - banim_pakm_sw1_script
	.word banim_pakm_sw1_mode_attack_miss - banim_pakm_sw1_script
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

