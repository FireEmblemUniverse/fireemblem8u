@ vim:ft=armv4
	.global banim_genm_sw1_script
	.global banim_genm_sw1_oam_r
	.global banim_genm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x43
	.section .data.oam_l
banim_genm_sw1_oam_l:
banim_genm_sw1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -1, -20
	banim_frame_oam 0x0, 0x5000, 0xBE, 4, -30
	banim_frame_oam 0x8000, 0x1000, 0x3F, -20, -46
	banim_frame_oam 0x4000, 0x1000, 0x5D, -12, -38
	banim_frame_oam 0x0, 0x1000, 0x3E, -12, -46
	banim_frame_oam 0x4000, 0x1000, 0xFE, 4, -14
	banim_frame_oam 0x4000, 0x1000, 0xC2, -12, -30
	banim_frame_oam 0x0, 0x1000, 0xE2, -4, -22
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -28
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -28
	banim_frame_oam 0x4000, 0x9000, 0x80, -20, 4
	banim_frame_oam 0x8000, 0x1000, 0x84, -28, 4
	banim_frame_end
banim_genm_sw1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x1000, 0xC0, 6, -20
	banim_frame_oam 0x0, 0x1000, 0xC1, -2, -20
	banim_frame_oam 0x0, 0x1000, 0xE3, -2, -12
	banim_frame_oam 0x0, 0x5000, 0xBE, 3, -30
	banim_frame_oam 0x8000, 0x1000, 0x3F, -21, -46
	banim_frame_oam 0x4000, 0x1000, 0x5D, -13, -38
	banim_frame_oam 0x0, 0x1000, 0x3E, -13, -46
	banim_frame_oam 0x4000, 0x1000, 0xFE, 3, -14
	banim_frame_oam 0x0, 0x9000, 0x5, -20, -28
	banim_frame_oam 0x8000, 0x5000, 0x9, -28, -28
	banim_frame_oam 0x4000, 0x1000, 0xC2, -13, -30
	banim_frame_oam 0x0, 0x1000, 0xE2, -5, -22
	banim_frame_oam 0x4000, 0x9000, 0x80, -20, 4
	banim_frame_oam 0x8000, 0x1000, 0x84, -28, 4
	banim_frame_end
banim_genm_sw1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xC5, -1, -24
	banim_frame_oam 0x0, 0x9000, 0xA, -25, -28
	banim_frame_oam 0x4000, 0x9000, 0x8A, -25, 4
	banim_frame_oam 0x8000, 0x1000, 0xC4, 7, 0
	banim_frame_oam 0x4000, 0x1000, 0xCF, -23, -40
	banim_frame_oam 0x0, 0x1000, 0xD1, -31, -40
	banim_frame_oam 0x4000, 0x5000, 0xCB, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0xEB, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC9, 13, -16
	banim_frame_end
banim_genm_sw1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -21, -28
	banim_frame_oam 0x4000, 0x9000, 0x8E, -21, 4
	banim_frame_oam 0x8000, 0x1000, 0xCA, 11, -10
	banim_frame_oam 0x4000, 0x1000, 0xCF, -31, -40
	banim_frame_oam 0x0, 0x1000, 0xD1, -39, -40
	banim_frame_oam 0x4000, 0x5000, 0xCB, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xEF, -11, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, -19, 20
	banim_frame_oam 0x0, 0x1000, 0xC9, 5, -16
	banim_frame_end
banim_genm_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -5, -26
	banim_frame_oam 0x8000, 0x5000, 0x16, -13, -26
	banim_frame_oam 0x4000, 0x9000, 0x92, -5, 6
	banim_frame_oam 0x8000, 0x1000, 0x96, -13, 6
	banim_frame_oam 0x0, 0x1000, 0xE7, 11, 22
	banim_frame_oam 0x0, 0x1000, 0xE8, -3, -34
	banim_frame_oam 0x4000, 0x1000, 0xCF, -41, -34
	banim_frame_oam 0x4000, 0x5000, 0xCB, -42, -26
	banim_frame_oam 0x4000, 0x1000, 0xED, -26, -18
	banim_frame_oam 0x0, 0x1000, 0xD1, -49, -34
	banim_frame_end
banim_genm_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -1, -26
	banim_frame_oam 0x8000, 0x5000, 0x4, -9, -26
	banim_frame_oam 0x4000, 0x9000, 0x80, -1, 6
	banim_frame_oam 0x8000, 0x1000, 0x84, -9, 6
	banim_frame_oam 0x8000, 0x1000, 0xC0, -17, -18
	banim_frame_oam 0x0, 0x1000, 0xE1, -2, -34
	banim_frame_oam 0x0, 0x1000, 0xC1, -17, 14
	banim_frame_oam 0x8000, 0x0, 0x1E, -51, -24
	banim_frame_oam 0x0, 0x4000, 0x5E, -43, -24
	banim_frame_oam 0x0, 0x4000, 0x9E, -27, -24
	banim_frame_oam 0x0, 0x0, 0xE1, -19, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -11, -21
	banim_frame_oam 0x0, 0x1000, 0xF6, -17, -1
	banim_frame_end
banim_genm_sw1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x8000, 0x1000, 0xC2, -18, -18
	banim_frame_oam 0x0, 0x1000, 0xE1, -2, -34
	banim_frame_oam 0x8000, 0x0, 0x1E, -51, -24
	banim_frame_oam 0x0, 0x4000, 0x5E, -43, -24
	banim_frame_oam 0x0, 0x4000, 0x9E, -27, -24
	banim_frame_oam 0x0, 0x0, 0xE1, -19, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -11, -21
	banim_frame_end
banim_genm_sw1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x1000, 0xC2, -18, -18
	banim_frame_oam 0x4000, 0x9000, 0xA, -2, -26
	banim_frame_oam 0x8000, 0x1000, 0xE, -10, -26
	banim_frame_oam 0x4000, 0x5000, 0x4A, -2, -10
	banim_frame_oam 0x0, 0x1000, 0x4E, -10, -10
	banim_frame_oam 0x4000, 0x9000, 0x65, -2, -2
	banim_frame_oam 0x8000, 0x1000, 0x69, -10, -2
	banim_frame_oam 0x4000, 0x5000, 0xA5, -2, 14
	banim_frame_oam 0x0, 0x1000, 0xA9, -10, 14
	banim_frame_oam 0x8000, 0x0, 0x1E, -51, -24
	banim_frame_oam 0x0, 0x4000, 0x5E, -43, -24
	banim_frame_oam 0x0, 0x4000, 0x9E, -27, -24
	banim_frame_oam 0x0, 0x0, 0xE1, -19, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -11, -21
	banim_frame_end
banim_genm_sw1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, -2, -26
	banim_frame_oam 0x8000, 0x1000, 0xE, -10, -26
	banim_frame_oam 0x4000, 0x5000, 0x4A, -2, -10
	banim_frame_oam 0x0, 0x1000, 0x4E, -10, -10
	banim_frame_oam 0x8000, 0x1000, 0xC2, -18, -18
	banim_frame_oam 0x4000, 0x9000, 0x65, -2, -2
	banim_frame_oam 0x8000, 0x1000, 0x69, -10, -2
	banim_frame_oam 0x4000, 0x5000, 0xA5, -2, 14
	banim_frame_oam 0x0, 0x1000, 0xA9, -10, 14
	banim_frame_oam 0x8000, 0x0, 0x1E, -51, -23
	banim_frame_oam 0x0, 0x4000, 0x5E, -43, -23
	banim_frame_oam 0x0, 0x4000, 0x9E, -27, -23
	banim_frame_oam 0x0, 0x0, 0xE1, -19, -31
	banim_frame_oam 0x0, 0x0, 0x3F, -11, -20
	banim_frame_end
banim_genm_sw1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, 8, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, 0, 20
	banim_frame_oam 0x0, 0x9000, 0x17, -2, -28
	banim_frame_oam 0x4000, 0x5000, 0x97, -2, 4
	banim_frame_oam 0x4000, 0x5000, 0xB7, -2, 12
	banim_frame_oam 0x0, 0x5000, 0xD2, -2, -31
	banim_frame_oam 0x0, 0x5000, 0xBE, -1, -42
	banim_frame_oam 0x0, 0x5000, 0x7E, -17, -42
	banim_frame_oam 0x0, 0x5000, 0x3E, -25, -58
	banim_frame_oam 0x0, 0x1000, 0x5D, -9, -50
	banim_frame_end
banim_genm_sw1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, 8, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, 0, 20
	banim_frame_oam 0x0, 0x9000, 0x17, -2, -28
	banim_frame_oam 0x4000, 0x5000, 0x97, -2, 4
	banim_frame_oam 0x4000, 0x5000, 0xB7, -2, 12
	banim_frame_oam 0x0, 0x5000, 0xD2, -2, -31
	banim_frame_oam 0x8000, 0x9000, 0x7C, 1, -71
	banim_frame_oam 0x4000, 0x1000, 0xFC, 1, -39
	banim_frame_oam 0x0, 0x1000, 0x3D, -7, -39
	banim_frame_oam 0x0, 0x1000, 0x1D, 5, -31
	banim_frame_end
banim_genm_sw1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x40, 58, -26
	banim_frame_oam 0x8000, 0x5000, 0x44, 50, -26
	banim_frame_oam 0x4000, 0x5000, 0xC0, 58, 6
	banim_frame_oam 0x0, 0x1000, 0xC4, 50, 6
	banim_frame_oam 0x4000, 0x5000, 0x20, 52, -34
	banim_frame_oam 0x4000, 0x1000, 0x0, 62, -42
	banim_frame_oam 0x0, 0x1000, 0x2, 54, -42
	banim_frame_oam 0x4000, 0x1000, 0x3, 62, -50
	banim_frame_oam 0x0, 0x1000, 0x5, 54, -50
	banim_frame_oam 0x4000, 0x1000, 0xE0, 66, 14
	banim_frame_oam 0x0, 0x1000, 0xE2, 58, 14
	banim_frame_oam 0x4000, 0x1000, 0x26, 52, -58
	banim_frame_oam 0x0, 0x1000, 0x28, 44, -58
	banim_frame_oam 0x4000, 0x1000, 0x24, 28, -64
	banim_frame_oam 0x0, 0x9000, 0x45, 18, -26
	banim_frame_oam 0x8000, 0x9000, 0x49, 2, -26
	banim_frame_oam 0x4000, 0x5000, 0xC5, 18, 6
	banim_frame_oam 0x4000, 0x1000, 0xC9, 2, 6
	banim_frame_oam 0x4000, 0x5000, 0xE7, 2, 14
	banim_frame_oam 0x0, 0x1000, 0xE6, 34, 14
	banim_frame_oam 0x0, 0x1000, 0xE5, -6, 14
	banim_frame_oam 0x0, 0x1000, 0xE3, -6, -10
	banim_frame_oam 0x0, 0x1000, 0xE4, -6, -2
	banim_frame_end
banim_genm_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0xF, 12, -26
	banim_frame_oam 0x8000, 0x9000, 0x13, -4, -26
	banim_frame_oam 0x4000, 0x9000, 0x8F, 12, 6
	banim_frame_oam 0x0, 0x5000, 0x93, -4, 6
	banim_frame_oam 0x0, 0x1000, 0xC9, 71, 14
	banim_frame_oam 0x0, 0x1000, 0xE9, 63, 14
	banim_frame_oam 0x0, 0x5000, 0xC7, 39, -5
	banim_frame_oam 0x0, 0x5000, 0xC5, 55, -2
	banim_frame_oam 0x0, 0x1000, 0xE4, 71, 6
	banim_frame_oam 0x0, 0x1000, 0xC4, 31, -8
	banim_frame_end
banim_genm_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 12, -26
	banim_frame_oam 0x8000, 0x9000, 0x19, -4, -26
	banim_frame_oam 0x4000, 0x9000, 0x95, 12, 6
	banim_frame_oam 0x0, 0x5000, 0x99, -4, 6
	banim_frame_oam 0x0, 0x1000, 0xC9, 71, 14
	banim_frame_oam 0x0, 0x1000, 0xE9, 63, 14
	banim_frame_oam 0x0, 0x5000, 0xC7, 39, -5
	banim_frame_oam 0x0, 0x5000, 0xC5, 55, -2
	banim_frame_oam 0x0, 0x1000, 0xE4, 71, 6
	banim_frame_oam 0x0, 0x1000, 0xC4, 31, -8
	banim_frame_end
banim_genm_sw1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0x75, 12, -2
	banim_frame_oam 0x0, 0x5000, 0x79, -4, -2
	banim_frame_oam 0x4000, 0x5000, 0xB5, 12, 14
	banim_frame_oam 0x4000, 0x1000, 0xB9, -4, 14
	banim_frame_oam 0x0, 0x5000, 0x1B, 28, -26
	banim_frame_oam 0x8000, 0x1000, 0x1D, 20, -26
	banim_frame_oam 0x4000, 0x1000, 0x5B, 28, -10
	banim_frame_oam 0x0, 0x1000, 0x5D, 20, -10
	banim_frame_oam 0x0, 0x5000, 0x7B, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x7D, -4, -26
	banim_frame_oam 0x4000, 0x1000, 0xBB, 4, -10
	banim_frame_oam 0x0, 0x1000, 0xBD, -4, -10
	banim_frame_oam 0x0, 0x1000, 0xC9, 71, 14
	banim_frame_oam 0x0, 0x1000, 0xE9, 63, 14
	banim_frame_oam 0x0, 0x5000, 0xC7, 39, -5
	banim_frame_oam 0x0, 0x5000, 0xC5, 55, -2
	banim_frame_oam 0x0, 0x1000, 0xE4, 71, 6
	banim_frame_oam 0x0, 0x1000, 0xC4, 31, -8
	banim_frame_end
banim_genm_sw1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0xCA, 10, -26
	banim_frame_oam 0x8000, 0x1000, 0xCE, 2, -26
	banim_frame_oam 0x4000, 0x5000, 0xCF, 12, -10
	banim_frame_oam 0x4000, 0x1000, 0xEF, -4, -10
	banim_frame_oam 0x4000, 0x9000, 0x75, 12, -2
	banim_frame_oam 0x0, 0x5000, 0x79, -4, -2
	banim_frame_oam 0x4000, 0x5000, 0xB5, 12, 14
	banim_frame_oam 0x4000, 0x1000, 0xB9, -4, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 71, 14
	banim_frame_oam 0x0, 0x1000, 0xE9, 63, 14
	banim_frame_oam 0x0, 0x5000, 0xC7, 39, -5
	banim_frame_oam 0x0, 0x5000, 0xC5, 55, -2
	banim_frame_oam 0x0, 0x1000, 0xE4, 71, 6
	banim_frame_oam 0x0, 0x1000, 0xC4, 31, -8
	banim_frame_end
banim_genm_sw1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x9000, 0xCA, 10, -26
	banim_frame_oam 0x8000, 0x1000, 0xCE, 2, -26
	banim_frame_oam 0x4000, 0x5000, 0xCF, 12, -10
	banim_frame_oam 0x4000, 0x1000, 0xEF, -4, -10
	banim_frame_oam 0x4000, 0x9000, 0x75, 12, -2
	banim_frame_oam 0x0, 0x5000, 0x79, -4, -2
	banim_frame_oam 0x4000, 0x5000, 0xB5, 12, 14
	banim_frame_oam 0x4000, 0x1000, 0xB9, -4, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 71, 15
	banim_frame_oam 0x0, 0x1000, 0xE9, 63, 15
	banim_frame_oam 0x0, 0x5000, 0xC7, 39, -4
	banim_frame_oam 0x0, 0x5000, 0xC5, 55, -1
	banim_frame_oam 0x0, 0x1000, 0xE4, 71, 7
	banim_frame_oam 0x0, 0x1000, 0xC4, 31, -7
	banim_frame_end
banim_genm_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x17, 2, -28
	banim_frame_oam 0x4000, 0x1000, 0xEF, 10, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, 2, 20
	banim_frame_oam 0x4000, 0x5000, 0x97, 2, 4
	banim_frame_oam 0x4000, 0x5000, 0xB7, 0, 12
	banim_frame_oam 0x4000, 0x6000, 0xCB, 26, -5
	banim_frame_oam 0x4000, 0x2000, 0xCF, 41, 3
	banim_frame_oam 0x0, 0x2000, 0xD1, 57, 3
	banim_frame_oam 0x4000, 0x2000, 0xED, 26, -13
	banim_frame_end
banim_genm_sw1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x60, 0, -2
	banim_frame_oam 0x8000, 0x1000, 0x64, -8, -2
	banim_frame_oam 0x4000, 0x5000, 0xA0, 0, 14
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, 14
	banim_frame_oam 0x4000, 0x9000, 0x0, 0, -26
	banim_frame_oam 0x4000, 0x5000, 0x40, 0, -10
	banim_frame_oam 0x4000, 0x1000, 0xD3, -16, -18
	banim_frame_oam 0x0, 0x1000, 0xF1, -8, -10
	banim_frame_oam 0x0, 0x1000, 0x4, -8, -26
	banim_frame_oam 0x0, 0x1000, 0xE1, -1, -34
	banim_frame_oam 0x0, 0x1000, 0xC1, -16, 14
	banim_frame_oam 0x8000, 0x1000, 0x1E, 35, -14
	banim_frame_oam 0x0, 0x5000, 0x5E, 19, -14
	banim_frame_oam 0x0, 0x1000, 0xDF, -13, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, -16, -1
	banim_frame_end
banim_genm_sw1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0x65, -1, -2
	banim_frame_oam 0x8000, 0x1000, 0x69, -9, -2
	banim_frame_oam 0x4000, 0x5000, 0xA5, -1, 14
	banim_frame_oam 0x0, 0x1000, 0xA9, -9, 14
	banim_frame_oam 0x4000, 0x9000, 0x5, -1, -26
	banim_frame_oam 0x4000, 0x5000, 0x45, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0xF3, -16, -18
	banim_frame_oam 0x0, 0x1000, 0xF2, -8, -10
	banim_frame_oam 0x0, 0x1000, 0x9, -9, -26
	banim_frame_oam 0x0, 0x1000, 0xE1, -1, -34
	banim_frame_oam 0x8000, 0x1000, 0x1E, 35, -14
	banim_frame_oam 0x0, 0x5000, 0x5E, 19, -14
	banim_frame_oam 0x0, 0x1000, 0xDF, -13, -11
	banim_frame_end
banim_genm_sw1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, -1, -26
	banim_frame_oam 0x4000, 0x5000, 0x4A, -1, -10
	banim_frame_oam 0x4000, 0x9000, 0x65, -1, -2
	banim_frame_oam 0x8000, 0x1000, 0x69, -9, -2
	banim_frame_oam 0x4000, 0x5000, 0xA5, -1, 14
	banim_frame_oam 0x0, 0x1000, 0xA9, -9, 14
	banim_frame_oam 0x4000, 0x1000, 0xD5, -16, -18
	banim_frame_oam 0x0, 0x1000, 0xF5, -8, -10
	banim_frame_oam 0x0, 0x1000, 0xE, -9, -26
	banim_frame_oam 0x8000, 0x1000, 0x1E, 35, -14
	banim_frame_oam 0x0, 0x5000, 0x5E, 19, -14
	banim_frame_oam 0x0, 0x1000, 0xDF, -13, -11
	banim_frame_end
banim_genm_sw1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x9000, 0x92, -5, 6
	banim_frame_oam 0x8000, 0x1000, 0x96, -13, 6
	banim_frame_oam 0x0, 0x1000, 0xE8, -3, -34
	banim_frame_oam 0x8000, 0x9000, 0x12, 11, -26
	banim_frame_oam 0x8000, 0x5000, 0x14, 3, -26
	banim_frame_oam 0x4000, 0x1000, 0x75, -13, -2
	banim_frame_oam 0x0, 0x5000, 0x1B, -13, -18
	banim_frame_oam 0x4000, 0x1000, 0x15, -13, -26
	banim_frame_oam 0x0, 0x5000, 0xD4, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xFB, -16, -13
	banim_frame_end
banim_genm_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -23, -28
	banim_frame_oam 0x4000, 0x9000, 0x8E, -23, 4
	banim_frame_oam 0x8000, 0x1000, 0xCA, 9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEF, -15, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, -23, 20
	banim_frame_oam 0x0, 0x1000, 0x87, 29, -22
	banim_frame_oam 0x0, 0x5000, 0x88, 13, -22
	banim_frame_oam 0x8000, 0x1000, 0x89, 7, -20
	banim_frame_oam 0x8000, 0x1000, 0x89, 1, -18
	banim_frame_oam 0x0, 0x1000, 0xFB, -18, -6
	banim_frame_end
banim_genm_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0xD7, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x7E, 16, -44
	banim_frame_oam 0x4000, 0x1000, 0xBE, 12, -28
	banim_frame_oam 0x0, 0x5000, 0xDE, 8, -20
	banim_frame_oam 0x0, 0x1000, 0x7B, 5, -4
	banim_frame_oam 0x0, 0x9000, 0x15, -20, -28
	banim_frame_oam 0x8000, 0x5000, 0x19, -28, -28
	banim_frame_oam 0x4000, 0x9000, 0x95, -20, 4
	banim_frame_oam 0x8000, 0x1000, 0x99, -28, 4
	banim_frame_end
banim_genm_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x5000, 0xD9, 2, -21
	banim_frame_oam 0x8000, 0x8000, 0x7C, 2, -62
	banim_frame_oam 0x4000, 0x0, 0xFC, 2, -30
	banim_frame_oam 0x0, 0x0, 0x9B, 18, -30
	banim_frame_oam 0x8000, 0x0, 0x7A, 6, -22
	banim_frame_oam 0x4000, 0x9000, 0x1A, -20, -28
	banim_frame_oam 0x8000, 0x1000, 0x1E, -28, -28
	banim_frame_oam 0x4000, 0x5000, 0x5A, -20, -12
	banim_frame_oam 0x0, 0x1000, 0x5E, -28, -12
	banim_frame_oam 0x4000, 0x9000, 0x75, -20, -4
	banim_frame_oam 0x8000, 0x1000, 0x79, -28, -4
	banim_frame_oam 0x4000, 0x5000, 0xB5, -20, 12
	banim_frame_oam 0x0, 0x1000, 0xB9, -28, 12
	banim_frame_end
banim_genm_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -1, -21
	banim_frame_oam 0x0, 0x5000, 0xD7, -10, -54
	banim_frame_oam 0x0, 0x5000, 0xD9, 0, -30
	banim_frame_oam 0x4000, 0x1000, 0x5B, -5, -38
	banim_frame_oam 0x0, 0x1000, 0xD6, 11, -14
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -28
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -28
	banim_frame_oam 0x4000, 0x9000, 0x80, -20, 4
	banim_frame_oam 0x8000, 0x1000, 0x84, -28, 4
	banim_frame_end
banim_genm_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -1, -19
	banim_frame_oam 0x0, 0x5000, 0xBE, 4, -29
	banim_frame_oam 0x8000, 0x1000, 0x3F, -20, -45
	banim_frame_oam 0x4000, 0x1000, 0x5D, -12, -37
	banim_frame_oam 0x0, 0x1000, 0x3E, -12, -45
	banim_frame_oam 0x4000, 0x1000, 0xFE, 4, -13
	banim_frame_oam 0x4000, 0x1000, 0xC2, -12, -29
	banim_frame_oam 0x0, 0x1000, 0xE2, -4, -21
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -28
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -28
	banim_frame_oam 0x4000, 0x9000, 0x80, -20, 4
	banim_frame_oam 0x8000, 0x1000, 0x84, -28, 4
	banim_frame_end
	banim_frame_end
banim_genm_sw1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0x85, -1, -23
	banim_frame_oam 0x0, 0x9000, 0xA, -26, -28
	banim_frame_oam 0x4000, 0x9000, 0x8A, -26, 4
	banim_frame_oam 0x8000, 0x1000, 0xC4, 6, 0
	banim_frame_oam 0x0, 0x5000, 0xD7, -13, -56
	banim_frame_oam 0x0, 0x5000, 0xD9, -3, -32
	banim_frame_oam 0x4000, 0x1000, 0x5B, -8, -40
	banim_frame_oam 0x0, 0x1000, 0xD6, 8, -16
	banim_frame_end
banim_genm_sw1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -28, -29
	banim_frame_oam 0x4000, 0x1000, 0xEF, -20, 19
	banim_frame_oam 0x0, 0x1000, 0xF1, -28, 19
	banim_frame_oam 0x4000, 0x5000, 0xB7, -30, 11
	banim_frame_oam 0x4000, 0x5000, 0x97, -28, 3
	banim_frame_oam 0x0, 0x5000, 0xD7, -32, -60
	banim_frame_oam 0x0, 0x5000, 0xD9, -22, -36
	banim_frame_oam 0x4000, 0x1000, 0x5B, -27, -44
	banim_frame_end
banim_genm_sw1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -34, -27
	banim_frame_oam 0x8000, 0x5000, 0x4, -42, -27
	banim_frame_oam 0x4000, 0x9000, 0x80, -34, 5
	banim_frame_oam 0x8000, 0x1000, 0x84, -42, 5
	banim_frame_oam 0x8000, 0x1000, 0xC0, -50, -19
	banim_frame_oam 0x0, 0x1000, 0xF6, -50, -2
	banim_frame_oam 0x0, 0x1000, 0xC1, -50, 13
	banim_frame_oam 0x0, 0x1000, 0xE1, -35, -35
	banim_frame_oam 0x0, 0x4000, 0xD7, -50, -59
	banim_frame_oam 0x0, 0x4000, 0xD9, -50, -43
	banim_frame_oam 0x4000, 0x0, 0xDB, -50, -27
	banim_frame_oam 0x0, 0x0, 0xFF, -34, -27
	banim_frame_oam 0x8000, 0x0, 0xDE, -46, -19
	banim_frame_end
banim_genm_sw1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -35, -27
	banim_frame_oam 0x8000, 0x5000, 0x9, -43, -27
	banim_frame_oam 0x4000, 0x9000, 0x85, -35, 5
	banim_frame_oam 0x8000, 0x1000, 0x89, -43, 5
	banim_frame_oam 0x8000, 0x1000, 0xC2, -51, -19
	banim_frame_oam 0x0, 0x1000, 0xE1, -35, -35
	banim_frame_oam 0x0, 0x4000, 0xD7, -50, -59
	banim_frame_oam 0x0, 0x4000, 0xD9, -50, -43
	banim_frame_oam 0x4000, 0x0, 0xDB, -50, -27
	banim_frame_oam 0x0, 0x0, 0xFF, -34, -27
	banim_frame_oam 0x8000, 0x0, 0xDE, -46, -19
	banim_frame_end
banim_genm_sw1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x9000, 0x65, -35, -3
	banim_frame_oam 0x8000, 0x1000, 0x69, -43, -3
	banim_frame_oam 0x4000, 0x5000, 0xA5, -35, 13
	banim_frame_oam 0x0, 0x1000, 0xA9, -43, 13
	banim_frame_oam 0x4000, 0x9000, 0xA, -35, -27
	banim_frame_oam 0x8000, 0x1000, 0xE, -43, -27
	banim_frame_oam 0x4000, 0x5000, 0x4A, -35, -11
	banim_frame_oam 0x0, 0x1000, 0x4E, -43, -11
	banim_frame_oam 0x8000, 0x1000, 0xC3, -51, -19
	banim_frame_oam 0x0, 0x4000, 0xD7, -50, -60
	banim_frame_oam 0x0, 0x4000, 0xD9, -50, -44
	banim_frame_oam 0x4000, 0x0, 0xDB, -50, -28
	banim_frame_oam 0x0, 0x0, 0xFF, -34, -28
	banim_frame_oam 0x8000, 0x0, 0xDE, -46, -20
	banim_frame_end
	banim_frame_end
banim_genm_sw1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x5000, 0xCE, 0, -23
	banim_frame_oam 0x0, 0x1000, 0xED, 2, -13
	banim_frame_oam 0x0, 0x5000, 0x9, -6, -29
	banim_frame_oam 0x0, 0x1000, 0xCD, 0, -37
	banim_frame_oam 0x4000, 0x1000, 0xEB, -8, -45
	banim_frame_oam 0x4000, 0x1000, 0x6, 0, -53
	banim_frame_oam 0x0, 0x1000, 0x8, -8, -53
	banim_frame_oam 0x4000, 0x1000, 0xCB, -6, -61
	banim_frame_oam 0x0, 0x9000, 0xB, -16, -33
	banim_frame_oam 0x8000, 0x5000, 0xF, -24, -33
	banim_frame_oam 0x4000, 0x9000, 0x8B, -16, -1
	banim_frame_oam 0x8000, 0x1000, 0x8F, -24, -1
	banim_frame_end
banim_genm_sw1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0xD5, -5, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, 10, -64
	banim_frame_oam 0x8000, 0x1000, 0x94, 2, -56
	banim_frame_oam 0x0, 0x1000, 0xD4, 2, -40
	banim_frame_oam 0x0, 0x5000, 0xD2, -6, -32
	banim_frame_oam 0x0, 0x1000, 0xF4, -6, -16
	banim_frame_oam 0x0, 0x9000, 0x10, -22, -33
	banim_frame_oam 0x4000, 0x9000, 0x90, -22, -1
	banim_frame_oam 0x8000, 0x1000, 0xD0, 10, -25
	banim_frame_oam 0x8000, 0x1000, 0xD1, 10, -1
	banim_frame_end
banim_genm_sw1_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x1000, 0xCE, -1, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, -14, -62
	banim_frame_oam 0x8000, 0x0, 0x94, -6, -54
	banim_frame_oam 0x0, 0x0, 0xD4, -6, -38
	banim_frame_oam 0x0, 0x4000, 0xD2, -6, -30
	banim_frame_oam 0x0, 0x0, 0xF4, 2, -14
	banim_frame_oam 0x4000, 0x1000, 0xEE, -1, -16
	banim_frame_oam 0x0, 0x9000, 0xB, -16, -33
	banim_frame_oam 0x8000, 0x5000, 0xF, -24, -33
	banim_frame_oam 0x4000, 0x9000, 0x8B, -16, -1
	banim_frame_oam 0x8000, 0x1000, 0x8F, -24, -1
	banim_frame_end
banim_genm_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0x201F, -8, -8
	banim_frame_end
banim_genm_sw1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x201F, -8, -8
	banim_frame_end
banim_genm_sw1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x1000, 0x201F, -8, -8
	banim_frame_end
banim_genm_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x201F, -8, -8
	banim_frame_end
banim_genm_sw1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x5000, 0xA, 4, -63
	banim_frame_oam 0x0, 0x1000, 0xE, -4, -63
	banim_frame_oam 0x0, 0x5000, 0x2A, 20, -55
	banim_frame_oam 0x8000, 0x1000, 0x2C, 12, -55
	banim_frame_oam 0x0, 0x5000, 0x6A, 12, -39
	banim_frame_oam 0x8000, 0x1000, 0x6C, 4, -39
	banim_frame_oam 0x4000, 0x1000, 0xAA, 12, -23
	banim_frame_oam 0x0, 0x1000, 0xAC, 4, -23
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x5000, 0x2D, 46, -45
	banim_frame_oam 0x0, 0x1000, 0xAD, 46, -13
	banim_frame_oam 0x8000, 0x1000, 0xC5, 6, -38
	banim_frame_oam 0x0, 0x5000, 0x2E, 30, -30
	banim_frame_oam 0x4000, 0x1000, 0x6E, 30, -14
	banim_frame_oam 0x0, 0x5000, 0x8E, 14, -30
	banim_frame_oam 0x0, 0x1000, 0xF, 22, -38
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0xB2, 13, -22
	banim_frame_oam 0x8000, 0x1000, 0x10, 45, -21
	banim_frame_oam 0x0, 0x1000, 0x50, 45, -5
	banim_frame_oam 0x0, 0x5000, 0x70, 29, -14
	banim_frame_oam 0x4000, 0x1000, 0xB0, 29, 2
	banim_frame_oam 0x4000, 0x1000, 0x51, 21, -22
	banim_frame_oam 0x8000, 0x1000, 0x72, 21, -14
	banim_frame_oam 0x4000, 0x1000, 0x31, 13, -30
	banim_frame_oam 0x4000, 0x1000, 0x11, 5, -38
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x6000, 0xA, -2, 4
	banim_frame_oam 0x0, 0x2000, 0xE, 30, 4
	banim_frame_oam 0x0, 0x6000, 0x2A, -2, -12
	banim_frame_oam 0x8000, 0x2000, 0x2C, 14, -12
	banim_frame_oam 0x0, 0x6000, 0x6A, 6, -28
	banim_frame_oam 0x8000, 0x2000, 0x6C, 22, -28
	banim_frame_oam 0x4000, 0x2000, 0xAA, 6, -36
	banim_frame_oam 0x0, 0x2000, 0xAC, 22, -36
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x6000, 0x2D, -21, -39
	banim_frame_oam 0x0, 0x2000, 0xAD, -21, -47
	banim_frame_oam 0x8000, 0x2000, 0xC5, 19, -30
	banim_frame_oam 0x0, 0x6000, 0x2E, -13, -38
	banim_frame_oam 0x4000, 0x2000, 0x6E, -13, -46
	banim_frame_oam 0x0, 0x6000, 0x8E, 3, -38
	banim_frame_oam 0x0, 0x2000, 0xF, 3, -22
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x2000, 0xB2, 14, -37
	banim_frame_oam 0x8000, 0x2000, 0x10, -18, -46
	banim_frame_oam 0x0, 0x2000, 0x50, -18, -54
	banim_frame_oam 0x0, 0x6000, 0x70, -10, -53
	banim_frame_oam 0x4000, 0x2000, 0xB0, -10, -61
	banim_frame_oam 0x4000, 0x2000, 0x51, -2, -37
	banim_frame_oam 0x8000, 0x2000, 0x72, 6, -53
	banim_frame_oam 0x4000, 0x2000, 0x31, 6, -29
	banim_frame_oam 0x4000, 0x2000, 0x11, 14, -21
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -33
	banim_frame_oam 0x0, 0x9000, 0x40, -19, -17
	banim_frame_oam 0x8000, 0x5000, 0x44, -27, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -33
	banim_frame_oam 0x4000, 0x5000, 0xC1, -27, 15
	banim_frame_end
banim_genm_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -23, -28
	banim_frame_oam 0x4000, 0x9000, 0x8E, -23, 4
	banim_frame_oam 0x8000, 0x1000, 0xCA, 9, -10
	banim_frame_oam 0x4000, 0x1000, 0xEF, -15, 20
	banim_frame_oam 0x0, 0x1000, 0xF1, -23, 20
	banim_frame_end
banim_genm_sw1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -6, -26
	banim_frame_oam 0x8000, 0x5000, 0x16, -14, -26
	banim_frame_oam 0x4000, 0x9000, 0x92, -6, 6
	banim_frame_oam 0x8000, 0x1000, 0x96, -14, 6
	banim_frame_oam 0x0, 0x1000, 0xE8, -4, -34
	banim_frame_end
banim_genm_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x6000, 0x2D, -51, -20
	banim_frame_oam 0x0, 0x2000, 0xAD, -51, -28
	banim_frame_oam 0x8000, 0x2000, 0xC5, -11, -11
	banim_frame_oam 0x0, 0x6000, 0x2E, -43, -19
	banim_frame_oam 0x4000, 0x2000, 0x6E, -43, -27
	banim_frame_oam 0x0, 0x6000, 0x8E, -27, -19
	banim_frame_oam 0x0, 0x2000, 0xF, -27, -3
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x2000, 0xB2, -17, -20
	banim_frame_oam 0x8000, 0x2000, 0x10, -49, -29
	banim_frame_oam 0x0, 0x2000, 0x50, -49, -37
	banim_frame_oam 0x0, 0x6000, 0x70, -41, -36
	banim_frame_oam 0x4000, 0x2000, 0xB0, -41, -44
	banim_frame_oam 0x4000, 0x2000, 0x51, -33, -20
	banim_frame_oam 0x8000, 0x2000, 0x72, -25, -36
	banim_frame_oam 0x4000, 0x2000, 0x31, -25, -12
	banim_frame_oam 0x4000, 0x2000, 0x11, -17, -4
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x5000, 0xA, -27, -46
	banim_frame_oam 0x0, 0x1000, 0xE, -35, -46
	banim_frame_oam 0x0, 0x5000, 0x2A, -11, -38
	banim_frame_oam 0x8000, 0x1000, 0x2C, -19, -38
	banim_frame_oam 0x0, 0x5000, 0x6A, -19, -22
	banim_frame_oam 0x8000, 0x1000, 0x6C, -27, -22
	banim_frame_oam 0x4000, 0x1000, 0xAA, -19, -6
	banim_frame_oam 0x0, 0x1000, 0xAC, -27, -6
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x5000, 0x2D, 16, -27
	banim_frame_oam 0x0, 0x1000, 0xAD, 16, 5
	banim_frame_oam 0x8000, 0x1000, 0xC5, -24, -20
	banim_frame_oam 0x0, 0x5000, 0x2E, 0, -12
	banim_frame_oam 0x4000, 0x1000, 0x6E, 0, 4
	banim_frame_oam 0x0, 0x5000, 0x8E, -16, -12
	banim_frame_oam 0x0, 0x1000, 0xF, -8, -20
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0xB2, -18, -2
	banim_frame_oam 0x8000, 0x1000, 0x10, 14, -1
	banim_frame_oam 0x0, 0x1000, 0x50, 14, 15
	banim_frame_oam 0x0, 0x5000, 0x70, -2, 6
	banim_frame_oam 0x4000, 0x1000, 0xB0, -2, 22
	banim_frame_oam 0x4000, 0x1000, 0x51, -10, -2
	banim_frame_oam 0x8000, 0x1000, 0x72, -10, 6
	banim_frame_oam 0x4000, 0x1000, 0x31, -18, -10
	banim_frame_oam 0x4000, 0x1000, 0x11, -26, -18
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x6000, 0xA, -33, 24
	banim_frame_oam 0x0, 0x2000, 0xE, -1, 24
	banim_frame_oam 0x0, 0x6000, 0x2A, -33, 8
	banim_frame_oam 0x8000, 0x2000, 0x2C, -17, 8
	banim_frame_oam 0x0, 0x6000, 0x6A, -25, -8
	banim_frame_oam 0x8000, 0x2000, 0x6C, -9, -8
	banim_frame_oam 0x4000, 0x2000, 0xAA, -25, -16
	banim_frame_oam 0x0, 0x2000, 0xAC, -9, -16
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC6, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xC8, -23, -17
	banim_frame_end
banim_genm_sw1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC9, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xCB, -23, -17
	banim_frame_oam 0x4000, 0x5000, 0xEC, -31, -10
	banim_frame_oam 0x4000, 0x5000, 0xCC, -47, -18
	banim_frame_oam 0x4000, 0x1000, 0xD0, -46, -26
	banim_frame_oam 0x0, 0x1000, 0xD2, -54, -26
	banim_frame_oam 0x0, 0x1000, 0xF0, -11, -2
	banim_frame_end
banim_genm_sw1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -2, -26
	banim_frame_oam 0x8000, 0x5000, 0x9, -10, -26
	banim_frame_oam 0x4000, 0x9000, 0x85, -2, 6
	banim_frame_oam 0x8000, 0x1000, 0x89, -10, 6
	banim_frame_oam 0x0, 0x1000, 0xE1, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xC9, -15, -17
	banim_frame_oam 0x8000, 0x1000, 0xCB, -23, -17
	banim_frame_oam 0x4000, 0x5000, 0xEC, -31, -11
	banim_frame_oam 0x4000, 0x5000, 0xCC, -47, -19
	banim_frame_oam 0x4000, 0x1000, 0xD0, -46, -27
	banim_frame_oam 0x0, 0x1000, 0xD2, -54, -27
	banim_frame_oam 0x0, 0x1000, 0xF0, -11, -3
	banim_frame_end
banim_genm_sw1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 0, -28
	banim_frame_oam 0x4000, 0x1000, 0xE2, 6, 20
	banim_frame_oam 0x0, 0x1000, 0xE4, -2, 20
	banim_frame_oam 0x4000, 0x5000, 0xB3, -2, 12
	banim_frame_oam 0x4000, 0x5000, 0x93, 0, 4
	banim_frame_oam 0x0, 0x5000, 0xD3, -2, -32
	banim_frame_oam 0x0, 0x2000, 0xB2, 4, -38
	banim_frame_oam 0x8000, 0x2000, 0x10, -28, -47
	banim_frame_oam 0x0, 0x2000, 0x50, -28, -55
	banim_frame_oam 0x0, 0x6000, 0x70, -20, -54
	banim_frame_oam 0x4000, 0x2000, 0xB0, -20, -62
	banim_frame_oam 0x4000, 0x2000, 0x51, -12, -38
	banim_frame_oam 0x8000, 0x2000, 0x72, -4, -54
	banim_frame_oam 0x4000, 0x2000, 0x31, -4, -30
	banim_frame_oam 0x4000, 0x2000, 0x11, 4, -22
	banim_frame_end
banim_genm_sw1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 0, -28
	banim_frame_oam 0x4000, 0x1000, 0xE2, 6, 20
	banim_frame_oam 0x0, 0x1000, 0xE4, -2, 20
	banim_frame_oam 0x4000, 0x5000, 0xB3, -2, 12
	banim_frame_oam 0x4000, 0x5000, 0x93, 0, 4
	banim_frame_oam 0x0, 0x5000, 0xD3, 5, -31
	banim_frame_oam 0x4000, 0x5000, 0xA, 1, -67
	banim_frame_oam 0x0, 0x1000, 0xE, -7, -67
	banim_frame_oam 0x0, 0x5000, 0x2A, 17, -59
	banim_frame_oam 0x8000, 0x1000, 0x2C, 9, -59
	banim_frame_oam 0x0, 0x5000, 0x6A, 9, -43
	banim_frame_oam 0x8000, 0x1000, 0x6C, 1, -43
	banim_frame_oam 0x4000, 0x1000, 0xAA, 9, -27
	banim_frame_oam 0x0, 0x1000, 0xAC, 1, -27
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
banim_genm_sw1_oam_r:
banim_genm_sw1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -15, -20
	banim_frame_oam 0x0, 0x4000, 0xBE, -20, -30
	banim_frame_oam 0x8000, 0x0, 0x3F, 12, -46
	banim_frame_oam 0x4000, 0x0, 0x5D, -4, -38
	banim_frame_oam 0x0, 0x0, 0x3E, 4, -46
	banim_frame_oam 0x4000, 0x0, 0xFE, -20, -14
	banim_frame_oam 0x4000, 0x0, 0xC2, -4, -30
	banim_frame_oam 0x0, 0x0, 0xE2, -4, -22
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -28
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -28
	banim_frame_oam 0x4000, 0x8000, 0x80, -12, 4
	banim_frame_oam 0x8000, 0x0, 0x84, 20, 4
	banim_frame_end
banim_genm_sw1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x0, 0xC0, -14, -20
	banim_frame_oam 0x0, 0x0, 0xC1, -6, -20
	banim_frame_oam 0x0, 0x0, 0xE3, -6, -12
	banim_frame_oam 0x0, 0x4000, 0xBE, -19, -30
	banim_frame_oam 0x8000, 0x0, 0x3F, 13, -46
	banim_frame_oam 0x4000, 0x0, 0x5D, -3, -38
	banim_frame_oam 0x0, 0x0, 0x3E, 5, -46
	banim_frame_oam 0x4000, 0x0, 0xFE, -19, -14
	banim_frame_oam 0x0, 0x8000, 0x5, -12, -28
	banim_frame_oam 0x8000, 0x4000, 0x9, 20, -28
	banim_frame_oam 0x4000, 0x0, 0xC2, -3, -30
	banim_frame_oam 0x0, 0x0, 0xE2, -3, -22
	banim_frame_oam 0x4000, 0x8000, 0x80, -12, 4
	banim_frame_oam 0x8000, 0x0, 0x84, 20, 4
	banim_frame_end
banim_genm_sw1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xC5, -15, -24
	banim_frame_oam 0x0, 0x8000, 0xA, -7, -28
	banim_frame_oam 0x4000, 0x8000, 0x8A, -7, 4
	banim_frame_oam 0x8000, 0x0, 0xC4, -15, 0
	banim_frame_oam 0x4000, 0x0, 0xCF, 7, -40
	banim_frame_oam 0x0, 0x0, 0xD1, 23, -40
	banim_frame_oam 0x4000, 0x4000, 0xCB, -8, -32
	banim_frame_oam 0x4000, 0x4000, 0xEB, -24, -24
	banim_frame_oam 0x0, 0x0, 0xC9, -21, -16
	banim_frame_end
banim_genm_sw1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -11, -28
	banim_frame_oam 0x4000, 0x8000, 0x8E, -11, 4
	banim_frame_oam 0x8000, 0x0, 0xCA, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xCF, 15, -40
	banim_frame_oam 0x0, 0x0, 0xD1, 31, -40
	banim_frame_oam 0x4000, 0x4000, 0xCB, 0, -32
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xEF, -5, 20
	banim_frame_oam 0x0, 0x0, 0xF1, 11, 20
	banim_frame_oam 0x0, 0x0, 0xC9, -13, -16
	banim_frame_end
banim_genm_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -27, -26
	banim_frame_oam 0x8000, 0x4000, 0x16, 5, -26
	banim_frame_oam 0x4000, 0x8000, 0x92, -27, 6
	banim_frame_oam 0x8000, 0x0, 0x96, 5, 6
	banim_frame_oam 0x0, 0x0, 0xE7, -19, 22
	banim_frame_oam 0x0, 0x0, 0xE8, -5, -34
	banim_frame_oam 0x4000, 0x0, 0xCF, 25, -34
	banim_frame_oam 0x4000, 0x4000, 0xCB, 10, -26
	banim_frame_oam 0x4000, 0x0, 0xED, 10, -18
	banim_frame_oam 0x0, 0x0, 0xD1, 41, -34
	banim_frame_end
banim_genm_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -31, -26
	banim_frame_oam 0x8000, 0x4000, 0x4, 1, -26
	banim_frame_oam 0x4000, 0x8000, 0x80, -31, 6
	banim_frame_oam 0x8000, 0x0, 0x84, 1, 6
	banim_frame_oam 0x8000, 0x0, 0xC0, 9, -18
	banim_frame_oam 0x0, 0x0, 0xE1, -6, -34
	banim_frame_oam 0x0, 0x0, 0xC1, 9, 14
	banim_frame_oam 0x8000, 0x1000, 0x1E, 43, -24
	banim_frame_oam 0x0, 0x5000, 0x5E, 27, -24
	banim_frame_oam 0x0, 0x5000, 0x9E, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xE1, 11, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, 3, -21
	banim_frame_oam 0x0, 0x0, 0xF6, 9, -1
	banim_frame_end
banim_genm_sw1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x8000, 0x0, 0xC2, 10, -18
	banim_frame_oam 0x0, 0x0, 0xE1, -6, -34
	banim_frame_oam 0x8000, 0x1000, 0x1E, 43, -24
	banim_frame_oam 0x0, 0x5000, 0x5E, 27, -24
	banim_frame_oam 0x0, 0x5000, 0x9E, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xE1, 11, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, 3, -21
	banim_frame_end
banim_genm_sw1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x0, 0xC2, 10, -18
	banim_frame_oam 0x4000, 0x8000, 0xA, -30, -26
	banim_frame_oam 0x8000, 0x0, 0xE, 2, -26
	banim_frame_oam 0x4000, 0x4000, 0x4A, -30, -10
	banim_frame_oam 0x0, 0x0, 0x4E, 2, -10
	banim_frame_oam 0x4000, 0x8000, 0x65, -30, -2
	banim_frame_oam 0x8000, 0x0, 0x69, 2, -2
	banim_frame_oam 0x4000, 0x4000, 0xA5, -30, 14
	banim_frame_oam 0x0, 0x0, 0xA9, 2, 14
	banim_frame_oam 0x8000, 0x1000, 0x1E, 43, -24
	banim_frame_oam 0x0, 0x5000, 0x5E, 27, -24
	banim_frame_oam 0x0, 0x5000, 0x9E, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xE1, 11, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, 3, -21
	banim_frame_end
banim_genm_sw1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -30, -26
	banim_frame_oam 0x8000, 0x0, 0xE, 2, -26
	banim_frame_oam 0x4000, 0x4000, 0x4A, -30, -10
	banim_frame_oam 0x0, 0x0, 0x4E, 2, -10
	banim_frame_oam 0x8000, 0x0, 0xC2, 10, -18
	banim_frame_oam 0x4000, 0x8000, 0x65, -30, -2
	banim_frame_oam 0x8000, 0x0, 0x69, 2, -2
	banim_frame_oam 0x4000, 0x4000, 0xA5, -30, 14
	banim_frame_oam 0x0, 0x0, 0xA9, 2, 14
	banim_frame_oam 0x8000, 0x1000, 0x1E, 43, -23
	banim_frame_oam 0x0, 0x5000, 0x5E, 27, -23
	banim_frame_oam 0x0, 0x5000, 0x9E, 11, -23
	banim_frame_oam 0x0, 0x1000, 0xE1, 11, -31
	banim_frame_oam 0x0, 0x1000, 0x3F, 3, -20
	banim_frame_end
banim_genm_sw1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -24, 20
	banim_frame_oam 0x0, 0x0, 0xF1, -8, 20
	banim_frame_oam 0x0, 0x8000, 0x17, -30, -28
	banim_frame_oam 0x4000, 0x4000, 0x97, -30, 4
	banim_frame_oam 0x4000, 0x4000, 0xB7, -30, 12
	banim_frame_oam 0x0, 0x4000, 0xD2, -14, -31
	banim_frame_oam 0x0, 0x4000, 0xBE, -15, -42
	banim_frame_oam 0x0, 0x4000, 0x7E, 1, -42
	banim_frame_oam 0x0, 0x4000, 0x3E, 9, -58
	banim_frame_oam 0x0, 0x0, 0x5D, 1, -50
	banim_frame_end
banim_genm_sw1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -24, 20
	banim_frame_oam 0x0, 0x0, 0xF1, -8, 20
	banim_frame_oam 0x0, 0x8000, 0x17, -30, -28
	banim_frame_oam 0x4000, 0x4000, 0x97, -30, 4
	banim_frame_oam 0x4000, 0x4000, 0xB7, -30, 12
	banim_frame_oam 0x0, 0x4000, 0xD2, -14, -31
	banim_frame_oam 0x8000, 0x8000, 0x7C, -17, -71
	banim_frame_oam 0x4000, 0x0, 0xFC, -17, -39
	banim_frame_oam 0x0, 0x0, 0x3D, -1, -39
	banim_frame_oam 0x0, 0x0, 0x1D, -13, -31
	banim_frame_end
banim_genm_sw1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x40, -90, -26
	banim_frame_oam 0x8000, 0x4000, 0x44, -58, -26
	banim_frame_oam 0x4000, 0x4000, 0xC0, -90, 6
	banim_frame_oam 0x0, 0x0, 0xC4, -58, 6
	banim_frame_oam 0x4000, 0x4000, 0x20, -84, -34
	banim_frame_oam 0x4000, 0x0, 0x0, -78, -42
	banim_frame_oam 0x0, 0x0, 0x2, -62, -42
	banim_frame_oam 0x4000, 0x0, 0x3, -78, -50
	banim_frame_oam 0x0, 0x0, 0x5, -62, -50
	banim_frame_oam 0x4000, 0x0, 0xE0, -82, 14
	banim_frame_oam 0x0, 0x0, 0xE2, -66, 14
	banim_frame_oam 0x4000, 0x0, 0x26, -68, -58
	banim_frame_oam 0x0, 0x0, 0x28, -52, -58
	banim_frame_oam 0x4000, 0x0, 0x24, -44, -64
	banim_frame_oam 0x0, 0x8000, 0x45, -50, -26
	banim_frame_oam 0x8000, 0x8000, 0x49, -18, -26
	banim_frame_oam 0x4000, 0x4000, 0xC5, -50, 6
	banim_frame_oam 0x4000, 0x0, 0xC9, -18, 6
	banim_frame_oam 0x4000, 0x4000, 0xE7, -34, 14
	banim_frame_oam 0x0, 0x0, 0xE6, -42, 14
	banim_frame_oam 0x0, 0x0, 0xE5, -2, 14
	banim_frame_oam 0x0, 0x0, 0xE3, -2, -10
	banim_frame_oam 0x0, 0x0, 0xE4, -2, -2
	banim_frame_end
banim_genm_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -44, -26
	banim_frame_oam 0x8000, 0x8000, 0x13, -12, -26
	banim_frame_oam 0x4000, 0x8000, 0x8F, -44, 6
	banim_frame_oam 0x0, 0x4000, 0x93, -12, 6
	banim_frame_oam 0x0, 0x0, 0xC9, -79, 14
	banim_frame_oam 0x0, 0x0, 0xE9, -71, 14
	banim_frame_oam 0x0, 0x4000, 0xC7, -55, -5
	banim_frame_oam 0x0, 0x4000, 0xC5, -71, -2
	banim_frame_oam 0x0, 0x0, 0xE4, -79, 6
	banim_frame_oam 0x0, 0x0, 0xC4, -39, -8
	banim_frame_end
banim_genm_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -44, -26
	banim_frame_oam 0x8000, 0x8000, 0x19, -12, -26
	banim_frame_oam 0x4000, 0x8000, 0x95, -44, 6
	banim_frame_oam 0x0, 0x4000, 0x99, -12, 6
	banim_frame_oam 0x0, 0x0, 0xC9, -79, 14
	banim_frame_oam 0x0, 0x0, 0xE9, -71, 14
	banim_frame_oam 0x0, 0x4000, 0xC7, -55, -5
	banim_frame_oam 0x0, 0x4000, 0xC5, -71, -2
	banim_frame_oam 0x0, 0x0, 0xE4, -79, 6
	banim_frame_oam 0x0, 0x0, 0xC4, -39, -8
	banim_frame_end
banim_genm_sw1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0x75, -44, -2
	banim_frame_oam 0x0, 0x4000, 0x79, -12, -2
	banim_frame_oam 0x4000, 0x4000, 0xB5, -44, 14
	banim_frame_oam 0x4000, 0x0, 0xB9, -12, 14
	banim_frame_oam 0x0, 0x4000, 0x1B, -44, -26
	banim_frame_oam 0x8000, 0x0, 0x1D, -28, -26
	banim_frame_oam 0x4000, 0x0, 0x5B, -44, -10
	banim_frame_oam 0x0, 0x0, 0x5D, -28, -10
	banim_frame_oam 0x0, 0x4000, 0x7B, -20, -26
	banim_frame_oam 0x8000, 0x0, 0x7D, -4, -26
	banim_frame_oam 0x4000, 0x0, 0xBB, -20, -10
	banim_frame_oam 0x0, 0x0, 0xBD, -4, -10
	banim_frame_oam 0x0, 0x0, 0xC9, -79, 14
	banim_frame_oam 0x0, 0x0, 0xE9, -71, 14
	banim_frame_oam 0x0, 0x4000, 0xC7, -55, -5
	banim_frame_oam 0x0, 0x4000, 0xC5, -71, -2
	banim_frame_oam 0x0, 0x0, 0xE4, -79, 6
	banim_frame_oam 0x0, 0x0, 0xC4, -39, -8
	banim_frame_end
banim_genm_sw1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0xCA, -42, -26
	banim_frame_oam 0x8000, 0x0, 0xCE, -10, -26
	banim_frame_oam 0x4000, 0x4000, 0xCF, -44, -10
	banim_frame_oam 0x4000, 0x0, 0xEF, -12, -10
	banim_frame_oam 0x4000, 0x8000, 0x75, -44, -2
	banim_frame_oam 0x0, 0x4000, 0x79, -12, -2
	banim_frame_oam 0x4000, 0x4000, 0xB5, -44, 14
	banim_frame_oam 0x4000, 0x0, 0xB9, -12, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -79, 14
	banim_frame_oam 0x0, 0x0, 0xE9, -71, 14
	banim_frame_oam 0x0, 0x4000, 0xC7, -55, -5
	banim_frame_oam 0x0, 0x4000, 0xC5, -71, -2
	banim_frame_oam 0x0, 0x0, 0xE4, -79, 6
	banim_frame_oam 0x0, 0x0, 0xC4, -39, -8
	banim_frame_end
banim_genm_sw1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x8000, 0xCA, -42, -26
	banim_frame_oam 0x8000, 0x0, 0xCE, -10, -26
	banim_frame_oam 0x4000, 0x4000, 0xCF, -44, -10
	banim_frame_oam 0x4000, 0x0, 0xEF, -12, -10
	banim_frame_oam 0x4000, 0x8000, 0x75, -44, -2
	banim_frame_oam 0x0, 0x4000, 0x79, -12, -2
	banim_frame_oam 0x4000, 0x4000, 0xB5, -44, 14
	banim_frame_oam 0x4000, 0x0, 0xB9, -12, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -79, 15
	banim_frame_oam 0x0, 0x0, 0xE9, -71, 15
	banim_frame_oam 0x0, 0x4000, 0xC7, -55, -4
	banim_frame_oam 0x0, 0x4000, 0xC5, -71, -1
	banim_frame_oam 0x0, 0x0, 0xE4, -79, 7
	banim_frame_oam 0x0, 0x0, 0xC4, -39, -7
	banim_frame_end
banim_genm_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -34, -28
	banim_frame_oam 0x4000, 0x0, 0xEF, -26, 20
	banim_frame_oam 0x0, 0x0, 0xF1, -10, 20
	banim_frame_oam 0x4000, 0x4000, 0x97, -34, 4
	banim_frame_oam 0x4000, 0x4000, 0xB7, -32, 12
	banim_frame_oam 0x4000, 0x7000, 0xCB, -58, -5
	banim_frame_oam 0x4000, 0x3000, 0xCF, -57, 3
	banim_frame_oam 0x0, 0x3000, 0xD1, -65, 3
	banim_frame_oam 0x4000, 0x3000, 0xED, -42, -13
	banim_frame_end
banim_genm_sw1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x60, -32, -2
	banim_frame_oam 0x8000, 0x0, 0x64, 0, -2
	banim_frame_oam 0x4000, 0x4000, 0xA0, -32, 14
	banim_frame_oam 0x0, 0x0, 0xA4, 0, 14
	banim_frame_oam 0x4000, 0x8000, 0x0, -32, -26
	banim_frame_oam 0x4000, 0x4000, 0x40, -32, -10
	banim_frame_oam 0x4000, 0x0, 0xD3, 0, -18
	banim_frame_oam 0x0, 0x0, 0xF1, 0, -10
	banim_frame_oam 0x0, 0x0, 0x4, 0, -26
	banim_frame_oam 0x0, 0x0, 0xE1, -7, -34
	banim_frame_oam 0x0, 0x0, 0xC1, 8, 14
	banim_frame_oam 0x8000, 0x0, 0x1E, -43, -14
	banim_frame_oam 0x0, 0x4000, 0x5E, -35, -14
	banim_frame_oam 0x0, 0x0, 0xDF, 5, -11
	banim_frame_oam 0x0, 0x0, 0xF6, 8, -1
	banim_frame_end
banim_genm_sw1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0x65, -31, -2
	banim_frame_oam 0x8000, 0x0, 0x69, 1, -2
	banim_frame_oam 0x4000, 0x4000, 0xA5, -31, 14
	banim_frame_oam 0x0, 0x0, 0xA9, 1, 14
	banim_frame_oam 0x4000, 0x8000, 0x5, -31, -26
	banim_frame_oam 0x4000, 0x4000, 0x45, -31, -10
	banim_frame_oam 0x4000, 0x0, 0xF3, 0, -18
	banim_frame_oam 0x0, 0x0, 0xF2, 0, -10
	banim_frame_oam 0x0, 0x0, 0x9, 1, -26
	banim_frame_oam 0x0, 0x0, 0xE1, -7, -34
	banim_frame_oam 0x8000, 0x0, 0x1E, -43, -14
	banim_frame_oam 0x0, 0x4000, 0x5E, -35, -14
	banim_frame_oam 0x0, 0x0, 0xDF, 5, -11
	banim_frame_end
banim_genm_sw1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -31, -26
	banim_frame_oam 0x4000, 0x4000, 0x4A, -31, -10
	banim_frame_oam 0x4000, 0x8000, 0x65, -31, -2
	banim_frame_oam 0x8000, 0x0, 0x69, 1, -2
	banim_frame_oam 0x4000, 0x4000, 0xA5, -31, 14
	banim_frame_oam 0x0, 0x0, 0xA9, 1, 14
	banim_frame_oam 0x4000, 0x0, 0xD5, 0, -18
	banim_frame_oam 0x0, 0x0, 0xF5, 0, -10
	banim_frame_oam 0x0, 0x0, 0xE, 1, -26
	banim_frame_oam 0x8000, 0x0, 0x1E, -43, -14
	banim_frame_oam 0x0, 0x4000, 0x5E, -35, -14
	banim_frame_oam 0x0, 0x0, 0xDF, 5, -11
	banim_frame_end
banim_genm_sw1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x8000, 0x92, -27, 6
	banim_frame_oam 0x8000, 0x0, 0x96, 5, 6
	banim_frame_oam 0x0, 0x0, 0xE8, -5, -34
	banim_frame_oam 0x8000, 0x8000, 0x12, -27, -26
	banim_frame_oam 0x8000, 0x4000, 0x14, -11, -26
	banim_frame_oam 0x4000, 0x0, 0x75, -3, -2
	banim_frame_oam 0x0, 0x4000, 0x1B, -3, -18
	banim_frame_oam 0x4000, 0x0, 0x15, -3, -26
	banim_frame_oam 0x0, 0x4000, 0xD4, -40, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -24, -8
	banim_frame_oam 0x0, 0x0, 0xFB, 8, -13
	banim_frame_end
banim_genm_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -9, -28
	banim_frame_oam 0x4000, 0x8000, 0x8E, -9, 4
	banim_frame_oam 0x8000, 0x0, 0xCA, -17, -10
	banim_frame_oam 0x4000, 0x0, 0xEF, -1, 20
	banim_frame_oam 0x0, 0x0, 0xF1, 15, 20
	banim_frame_oam 0x0, 0x0, 0x87, -37, -22
	banim_frame_oam 0x0, 0x4000, 0x88, -29, -22
	banim_frame_oam 0x8000, 0x0, 0x89, -15, -20
	banim_frame_oam 0x8000, 0x0, 0x89, -9, -18
	banim_frame_oam 0x0, 0x0, 0xFB, 10, -6
	banim_frame_end
banim_genm_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0xD7, -15, -19
	banim_frame_oam 0x0, 0x4000, 0x7E, -32, -44
	banim_frame_oam 0x4000, 0x0, 0xBE, -28, -28
	banim_frame_oam 0x0, 0x4000, 0xDE, -24, -20
	banim_frame_oam 0x0, 0x0, 0x7B, -13, -4
	banim_frame_oam 0x0, 0x8000, 0x15, -12, -28
	banim_frame_oam 0x8000, 0x4000, 0x19, 20, -28
	banim_frame_oam 0x4000, 0x8000, 0x95, -12, 4
	banim_frame_oam 0x8000, 0x0, 0x99, 20, 4
	banim_frame_end
banim_genm_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x4000, 0xD9, -18, -21
	banim_frame_oam 0x8000, 0x9000, 0x7C, -18, -62
	banim_frame_oam 0x4000, 0x1000, 0xFC, -18, -30
	banim_frame_oam 0x0, 0x1000, 0x9B, -26, -30
	banim_frame_oam 0x8000, 0x1000, 0x7A, -14, -22
	banim_frame_oam 0x4000, 0x8000, 0x1A, -12, -28
	banim_frame_oam 0x8000, 0x0, 0x1E, 20, -28
	banim_frame_oam 0x4000, 0x4000, 0x5A, -12, -12
	banim_frame_oam 0x0, 0x0, 0x5E, 20, -12
	banim_frame_oam 0x4000, 0x8000, 0x75, -12, -4
	banim_frame_oam 0x8000, 0x0, 0x79, 20, -4
	banim_frame_oam 0x4000, 0x4000, 0xB5, -12, 12
	banim_frame_oam 0x0, 0x0, 0xB9, 20, 12
	banim_frame_end
banim_genm_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -15, -21
	banim_frame_oam 0x0, 0x4000, 0xD7, -6, -54
	banim_frame_oam 0x0, 0x4000, 0xD9, -16, -30
	banim_frame_oam 0x4000, 0x0, 0x5B, -11, -38
	banim_frame_oam 0x0, 0x0, 0xD6, -19, -14
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -28
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -28
	banim_frame_oam 0x4000, 0x8000, 0x80, -12, 4
	banim_frame_oam 0x8000, 0x0, 0x84, 20, 4
	banim_frame_end
banim_genm_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -15, -19
	banim_frame_oam 0x0, 0x4000, 0xBE, -20, -29
	banim_frame_oam 0x8000, 0x0, 0x3F, 12, -45
	banim_frame_oam 0x4000, 0x0, 0x5D, -4, -37
	banim_frame_oam 0x0, 0x0, 0x3E, 4, -45
	banim_frame_oam 0x4000, 0x0, 0xFE, -20, -13
	banim_frame_oam 0x4000, 0x0, 0xC2, -4, -29
	banim_frame_oam 0x0, 0x0, 0xE2, -4, -21
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -28
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -28
	banim_frame_oam 0x4000, 0x8000, 0x80, -12, 4
	banim_frame_oam 0x8000, 0x0, 0x84, 20, 4
	banim_frame_end
	banim_frame_end
banim_genm_sw1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0x85, -15, -23
	banim_frame_oam 0x0, 0x8000, 0xA, -6, -28
	banim_frame_oam 0x4000, 0x8000, 0x8A, -6, 4
	banim_frame_oam 0x8000, 0x0, 0xC4, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xD7, -3, -56
	banim_frame_oam 0x0, 0x4000, 0xD9, -13, -32
	banim_frame_oam 0x4000, 0x0, 0x5B, -8, -40
	banim_frame_oam 0x0, 0x0, 0xD6, -16, -16
	banim_frame_end
banim_genm_sw1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -4, -29
	banim_frame_oam 0x4000, 0x0, 0xEF, 4, 19
	banim_frame_oam 0x0, 0x0, 0xF1, 20, 19
	banim_frame_oam 0x4000, 0x4000, 0xB7, -2, 11
	banim_frame_oam 0x4000, 0x4000, 0x97, -4, 3
	banim_frame_oam 0x0, 0x4000, 0xD7, 16, -60
	banim_frame_oam 0x0, 0x4000, 0xD9, 6, -36
	banim_frame_oam 0x4000, 0x0, 0x5B, 11, -44
	banim_frame_end
banim_genm_sw1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x0, 2, -27
	banim_frame_oam 0x8000, 0x4000, 0x4, 34, -27
	banim_frame_oam 0x4000, 0x8000, 0x80, 2, 5
	banim_frame_oam 0x8000, 0x0, 0x84, 34, 5
	banim_frame_oam 0x8000, 0x0, 0xC0, 42, -19
	banim_frame_oam 0x0, 0x0, 0xF6, 42, -2
	banim_frame_oam 0x0, 0x0, 0xC1, 42, 13
	banim_frame_oam 0x0, 0x0, 0xE1, 27, -35
	banim_frame_oam 0x0, 0x5000, 0xD7, 34, -59
	banim_frame_oam 0x0, 0x5000, 0xD9, 34, -43
	banim_frame_oam 0x4000, 0x1000, 0xDB, 34, -27
	banim_frame_oam 0x0, 0x1000, 0xFF, 26, -27
	banim_frame_oam 0x8000, 0x1000, 0xDE, 38, -19
	banim_frame_end
banim_genm_sw1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x8000, 0x5, 3, -27
	banim_frame_oam 0x8000, 0x4000, 0x9, 35, -27
	banim_frame_oam 0x4000, 0x8000, 0x85, 3, 5
	banim_frame_oam 0x8000, 0x0, 0x89, 35, 5
	banim_frame_oam 0x8000, 0x0, 0xC2, 43, -19
	banim_frame_oam 0x0, 0x0, 0xE1, 27, -35
	banim_frame_oam 0x0, 0x5000, 0xD7, 34, -59
	banim_frame_oam 0x0, 0x5000, 0xD9, 34, -43
	banim_frame_oam 0x4000, 0x1000, 0xDB, 34, -27
	banim_frame_oam 0x0, 0x1000, 0xFF, 26, -27
	banim_frame_oam 0x8000, 0x1000, 0xDE, 38, -19
	banim_frame_end
banim_genm_sw1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x8000, 0x65, 3, -3
	banim_frame_oam 0x8000, 0x0, 0x69, 35, -3
	banim_frame_oam 0x4000, 0x4000, 0xA5, 3, 13
	banim_frame_oam 0x0, 0x0, 0xA9, 35, 13
	banim_frame_oam 0x4000, 0x8000, 0xA, 3, -27
	banim_frame_oam 0x8000, 0x0, 0xE, 35, -27
	banim_frame_oam 0x4000, 0x4000, 0x4A, 3, -11
	banim_frame_oam 0x0, 0x0, 0x4E, 35, -11
	banim_frame_oam 0x8000, 0x0, 0xC3, 43, -19
	banim_frame_oam 0x0, 0x5000, 0xD7, 34, -60
	banim_frame_oam 0x0, 0x5000, 0xD9, 34, -44
	banim_frame_oam 0x4000, 0x1000, 0xDB, 34, -28
	banim_frame_oam 0x0, 0x1000, 0xFF, 26, -28
	banim_frame_oam 0x8000, 0x1000, 0xDE, 38, -20
	banim_frame_end
	banim_frame_end
banim_genm_sw1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x4000, 0xCE, -16, -23
	banim_frame_oam 0x0, 0x0, 0xED, -10, -13
	banim_frame_oam 0x0, 0x4000, 0x9, -10, -29
	banim_frame_oam 0x0, 0x0, 0xCD, -8, -37
	banim_frame_oam 0x4000, 0x0, 0xEB, -8, -45
	banim_frame_oam 0x4000, 0x0, 0x6, -16, -53
	banim_frame_oam 0x0, 0x0, 0x8, 0, -53
	banim_frame_oam 0x4000, 0x0, 0xCB, -10, -61
	banim_frame_oam 0x0, 0x8000, 0xB, -16, -33
	banim_frame_oam 0x8000, 0x4000, 0xF, 16, -33
	banim_frame_oam 0x4000, 0x8000, 0x8B, -16, -1
	banim_frame_oam 0x8000, 0x0, 0x8F, 16, -1
	banim_frame_end
banim_genm_sw1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0xD5, -11, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, -18, -64
	banim_frame_oam 0x8000, 0x0, 0x94, -10, -56
	banim_frame_oam 0x0, 0x0, 0xD4, -10, -40
	banim_frame_oam 0x0, 0x4000, 0xD2, -10, -32
	banim_frame_oam 0x0, 0x0, 0xF4, -2, -16
	banim_frame_oam 0x0, 0x8000, 0x10, -10, -33
	banim_frame_oam 0x4000, 0x8000, 0x90, -10, -1
	banim_frame_oam 0x8000, 0x0, 0xD0, -18, -25
	banim_frame_oam 0x8000, 0x0, 0xD1, -18, -1
	banim_frame_end
banim_genm_sw1_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x0, 0xCE, -15, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, 6, -62
	banim_frame_oam 0x8000, 0x1000, 0x94, -2, -54
	banim_frame_oam 0x0, 0x1000, 0xD4, -2, -38
	banim_frame_oam 0x0, 0x5000, 0xD2, -10, -30
	banim_frame_oam 0x0, 0x1000, 0xF4, -10, -14
	banim_frame_oam 0x4000, 0x0, 0xEE, -15, -16
	banim_frame_oam 0x0, 0x8000, 0xB, -16, -33
	banim_frame_oam 0x8000, 0x4000, 0xF, 16, -33
	banim_frame_oam 0x4000, 0x8000, 0x8B, -16, -1
	banim_frame_oam 0x8000, 0x0, 0x8F, 16, -1
	banim_frame_end
banim_genm_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0x201F, 0, -8
	banim_frame_end
banim_genm_sw1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x201F, 0, -8
	banim_frame_end
banim_genm_sw1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x0, 0x201F, 0, -8
	banim_frame_end
banim_genm_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x201F, 0, -8
	banim_frame_end
banim_genm_sw1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x4000, 0xA, -36, -63
	banim_frame_oam 0x0, 0x0, 0xE, -4, -63
	banim_frame_oam 0x0, 0x4000, 0x2A, -36, -55
	banim_frame_oam 0x8000, 0x0, 0x2C, -20, -55
	banim_frame_oam 0x0, 0x4000, 0x6A, -28, -39
	banim_frame_oam 0x8000, 0x0, 0x6C, -12, -39
	banim_frame_oam 0x4000, 0x0, 0xAA, -28, -23
	banim_frame_oam 0x0, 0x0, 0xAC, -12, -23
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x4000, 0x2D, -54, -45
	banim_frame_oam 0x0, 0x0, 0xAD, -54, -13
	banim_frame_oam 0x8000, 0x0, 0xC5, -14, -38
	banim_frame_oam 0x0, 0x4000, 0x2E, -46, -30
	banim_frame_oam 0x4000, 0x0, 0x6E, -46, -14
	banim_frame_oam 0x0, 0x4000, 0x8E, -30, -30
	banim_frame_oam 0x0, 0x0, 0xF, -30, -38
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0xB2, -21, -22
	banim_frame_oam 0x8000, 0x0, 0x10, -53, -21
	banim_frame_oam 0x0, 0x0, 0x50, -53, -5
	banim_frame_oam 0x0, 0x4000, 0x70, -45, -14
	banim_frame_oam 0x4000, 0x0, 0xB0, -45, 2
	banim_frame_oam 0x4000, 0x0, 0x51, -37, -22
	banim_frame_oam 0x8000, 0x0, 0x72, -29, -14
	banim_frame_oam 0x4000, 0x0, 0x31, -29, -30
	banim_frame_oam 0x4000, 0x0, 0x11, -21, -38
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x7000, 0xA, -30, 4
	banim_frame_oam 0x0, 0x3000, 0xE, -38, 4
	banim_frame_oam 0x0, 0x7000, 0x2A, -14, -12
	banim_frame_oam 0x8000, 0x3000, 0x2C, -22, -12
	banim_frame_oam 0x0, 0x7000, 0x6A, -22, -28
	banim_frame_oam 0x8000, 0x3000, 0x6C, -30, -28
	banim_frame_oam 0x4000, 0x3000, 0xAA, -22, -36
	banim_frame_oam 0x0, 0x3000, 0xAC, -30, -36
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x7000, 0x2D, 13, -39
	banim_frame_oam 0x0, 0x3000, 0xAD, 13, -47
	banim_frame_oam 0x8000, 0x3000, 0xC5, -27, -30
	banim_frame_oam 0x0, 0x7000, 0x2E, -3, -38
	banim_frame_oam 0x4000, 0x3000, 0x6E, -3, -46
	banim_frame_oam 0x0, 0x7000, 0x8E, -19, -38
	banim_frame_oam 0x0, 0x3000, 0xF, -11, -22
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x3000, 0xB2, -22, -37
	banim_frame_oam 0x8000, 0x3000, 0x10, 10, -46
	banim_frame_oam 0x0, 0x3000, 0x50, 10, -54
	banim_frame_oam 0x0, 0x7000, 0x70, -6, -53
	banim_frame_oam 0x4000, 0x3000, 0xB0, -6, -61
	banim_frame_oam 0x4000, 0x3000, 0x51, -14, -37
	banim_frame_oam 0x8000, 0x3000, 0x72, -14, -53
	banim_frame_oam 0x4000, 0x3000, 0x31, -22, -29
	banim_frame_oam 0x4000, 0x3000, 0x11, -30, -21
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -33
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -33
	banim_frame_oam 0x0, 0x8000, 0x40, -13, -17
	banim_frame_oam 0x8000, 0x4000, 0x44, 19, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -33
	banim_frame_oam 0x4000, 0x4000, 0xC1, -5, 15
	banim_frame_end
banim_genm_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -9, -28
	banim_frame_oam 0x4000, 0x8000, 0x8E, -9, 4
	banim_frame_oam 0x8000, 0x0, 0xCA, -17, -10
	banim_frame_oam 0x4000, 0x0, 0xEF, -1, 20
	banim_frame_oam 0x0, 0x0, 0xF1, 15, 20
	banim_frame_end
banim_genm_sw1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -26, -26
	banim_frame_oam 0x8000, 0x4000, 0x16, 6, -26
	banim_frame_oam 0x4000, 0x8000, 0x92, -26, 6
	banim_frame_oam 0x8000, 0x0, 0x96, 6, 6
	banim_frame_oam 0x0, 0x0, 0xE8, -4, -34
	banim_frame_end
banim_genm_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x7000, 0x2D, 43, -20
	banim_frame_oam 0x0, 0x3000, 0xAD, 43, -28
	banim_frame_oam 0x8000, 0x3000, 0xC5, 3, -11
	banim_frame_oam 0x0, 0x7000, 0x2E, 27, -19
	banim_frame_oam 0x4000, 0x3000, 0x6E, 27, -27
	banim_frame_oam 0x0, 0x7000, 0x8E, 11, -19
	banim_frame_oam 0x0, 0x3000, 0xF, 19, -3
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x3000, 0xB2, 9, -20
	banim_frame_oam 0x8000, 0x3000, 0x10, 41, -29
	banim_frame_oam 0x0, 0x3000, 0x50, 41, -37
	banim_frame_oam 0x0, 0x7000, 0x70, 25, -36
	banim_frame_oam 0x4000, 0x3000, 0xB0, 25, -44
	banim_frame_oam 0x4000, 0x3000, 0x51, 17, -20
	banim_frame_oam 0x8000, 0x3000, 0x72, 17, -36
	banim_frame_oam 0x4000, 0x3000, 0x31, 9, -12
	banim_frame_oam 0x4000, 0x3000, 0x11, 1, -4
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x4000, 0xA, -5, -46
	banim_frame_oam 0x0, 0x0, 0xE, 27, -46
	banim_frame_oam 0x0, 0x4000, 0x2A, -5, -38
	banim_frame_oam 0x8000, 0x0, 0x2C, 11, -38
	banim_frame_oam 0x0, 0x4000, 0x6A, 3, -22
	banim_frame_oam 0x8000, 0x0, 0x6C, 19, -22
	banim_frame_oam 0x4000, 0x0, 0xAA, 3, -6
	banim_frame_oam 0x0, 0x0, 0xAC, 19, -6
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x4000, 0x2D, -24, -27
	banim_frame_oam 0x0, 0x0, 0xAD, -24, 5
	banim_frame_oam 0x8000, 0x0, 0xC5, 16, -20
	banim_frame_oam 0x0, 0x4000, 0x2E, -16, -12
	banim_frame_oam 0x4000, 0x0, 0x6E, -16, 4
	banim_frame_oam 0x0, 0x4000, 0x8E, 0, -12
	banim_frame_oam 0x0, 0x0, 0xF, 0, -20
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0xB2, 10, -2
	banim_frame_oam 0x8000, 0x0, 0x10, -22, -1
	banim_frame_oam 0x0, 0x0, 0x50, -22, 15
	banim_frame_oam 0x0, 0x4000, 0x70, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xB0, -14, 22
	banim_frame_oam 0x4000, 0x0, 0x51, -6, -2
	banim_frame_oam 0x8000, 0x0, 0x72, 2, 6
	banim_frame_oam 0x4000, 0x0, 0x31, 2, -10
	banim_frame_oam 0x4000, 0x0, 0x11, 10, -18
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x7000, 0xA, 1, 24
	banim_frame_oam 0x0, 0x3000, 0xE, -7, 24
	banim_frame_oam 0x0, 0x7000, 0x2A, 17, 8
	banim_frame_oam 0x8000, 0x3000, 0x2C, 9, 8
	banim_frame_oam 0x0, 0x7000, 0x6A, 9, -8
	banim_frame_oam 0x8000, 0x3000, 0x6C, 1, -8
	banim_frame_oam 0x4000, 0x3000, 0xAA, 9, -16
	banim_frame_oam 0x0, 0x3000, 0xAC, 1, -16
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC6, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xC8, 15, -17
	banim_frame_end
banim_genm_sw1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC9, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xCB, 15, -17
	banim_frame_oam 0x4000, 0x4000, 0xEC, -1, -10
	banim_frame_oam 0x4000, 0x4000, 0xCC, 15, -18
	banim_frame_oam 0x4000, 0x0, 0xD0, 30, -26
	banim_frame_oam 0x0, 0x0, 0xD2, 46, -26
	banim_frame_oam 0x0, 0x0, 0xF0, 3, -2
	banim_frame_end
banim_genm_sw1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -30, -26
	banim_frame_oam 0x8000, 0x4000, 0x9, 2, -26
	banim_frame_oam 0x4000, 0x8000, 0x85, -30, 6
	banim_frame_oam 0x8000, 0x0, 0x89, 2, 6
	banim_frame_oam 0x0, 0x0, 0xE1, 10, -18
	banim_frame_oam 0x0, 0x4000, 0xC9, -1, -17
	banim_frame_oam 0x8000, 0x0, 0xCB, 15, -17
	banim_frame_oam 0x4000, 0x4000, 0xEC, -1, -11
	banim_frame_oam 0x4000, 0x4000, 0xCC, 15, -19
	banim_frame_oam 0x4000, 0x0, 0xD0, 30, -27
	banim_frame_oam 0x0, 0x0, 0xD2, 46, -27
	banim_frame_oam 0x0, 0x0, 0xF0, 3, -3
	banim_frame_end
banim_genm_sw1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -32, -28
	banim_frame_oam 0x4000, 0x0, 0xE2, -22, 20
	banim_frame_oam 0x0, 0x0, 0xE4, -6, 20
	banim_frame_oam 0x4000, 0x4000, 0xB3, -30, 12
	banim_frame_oam 0x4000, 0x4000, 0x93, -32, 4
	banim_frame_oam 0x0, 0x4000, 0xD3, -14, -32
	banim_frame_oam 0x0, 0x3000, 0xB2, -12, -38
	banim_frame_oam 0x8000, 0x3000, 0x10, 20, -47
	banim_frame_oam 0x0, 0x3000, 0x50, 20, -55
	banim_frame_oam 0x0, 0x7000, 0x70, 4, -54
	banim_frame_oam 0x4000, 0x3000, 0xB0, 4, -62
	banim_frame_oam 0x4000, 0x3000, 0x51, -4, -38
	banim_frame_oam 0x8000, 0x3000, 0x72, -4, -54
	banim_frame_oam 0x4000, 0x3000, 0x31, -12, -30
	banim_frame_oam 0x4000, 0x3000, 0x11, -20, -22
	banim_frame_end
banim_genm_sw1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -32, -28
	banim_frame_oam 0x4000, 0x0, 0xE2, -22, 20
	banim_frame_oam 0x0, 0x0, 0xE4, -6, 20
	banim_frame_oam 0x4000, 0x4000, 0xB3, -30, 12
	banim_frame_oam 0x4000, 0x4000, 0x93, -32, 4
	banim_frame_oam 0x0, 0x4000, 0xD3, -21, -31
	banim_frame_oam 0x4000, 0x4000, 0xA, -33, -67
	banim_frame_oam 0x0, 0x0, 0xE, -1, -67
	banim_frame_oam 0x0, 0x4000, 0x2A, -33, -59
	banim_frame_oam 0x8000, 0x0, 0x2C, -17, -59
	banim_frame_oam 0x0, 0x4000, 0x6A, -25, -43
	banim_frame_oam 0x8000, 0x0, 0x6C, -9, -43
	banim_frame_oam 0x4000, 0x0, 0xAA, -25, -27
	banim_frame_oam 0x0, 0x0, 0xAC, -9, -27
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
banim_genm_sw1_script:
banim_genm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 4, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 1, banim_genm_sw1_oam_frame_1_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 2, banim_genm_sw1_oam_frame_2_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 3, banim_genm_sw1_oam_frame_3_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 4, banim_genm_sw1_oam_frame_4_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_genm_sw1_sheet_1, 5, banim_genm_sw1_oam_frame_5_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 2, banim_genm_sw1_sheet_1, 6, banim_genm_sw1_oam_frame_6_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 7, banim_genm_sw1_oam_frame_7_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 8, banim_genm_sw1_oam_frame_8_r - banim_genm_sw1_oam_r
	banim_code_frame 15, banim_genm_sw1_sheet_1, 7, banim_genm_sw1_oam_frame_7_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_genm_sw1_sheet_0, 9, banim_genm_sw1_oam_frame_9_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_genm_sw1_sheet_0, 10, banim_genm_sw1_oam_frame_10_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_2, 11, banim_genm_sw1_oam_frame_11_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_genm_sw1_sheet_1, 12, banim_genm_sw1_oam_frame_12_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 13, banim_genm_sw1_oam_frame_13_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 14, banim_genm_sw1_oam_frame_14_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 16, banim_genm_sw1_oam_frame_16_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_genm_sw1_sheet_0, 17, banim_genm_sw1_oam_frame_17_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_sw1_sheet_1, 18, banim_genm_sw1_oam_frame_18_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_sw1_sheet_1, 19, banim_genm_sw1_oam_frame_19_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_1, 20, banim_genm_sw1_oam_frame_20_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 21, banim_genm_sw1_oam_frame_21_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 22, banim_genm_sw1_oam_frame_22_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_2, 23, banim_genm_sw1_oam_frame_23_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_2, 24, banim_genm_sw1_oam_frame_24_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 26, banim_genm_sw1_oam_frame_26_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 4, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 15, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 4, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 41, banim_genm_sw1_oam_frame_30_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 42, banim_genm_sw1_oam_frame_31_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 43, banim_genm_sw1_oam_frame_32_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 44, banim_genm_sw1_oam_frame_33_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 45, banim_genm_sw1_oam_frame_34_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 46, banim_genm_sw1_oam_frame_35_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 41, banim_genm_sw1_oam_frame_30_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 42, banim_genm_sw1_oam_frame_31_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 43, banim_genm_sw1_oam_frame_32_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 44, banim_genm_sw1_oam_frame_33_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 45, banim_genm_sw1_oam_frame_34_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 46, banim_genm_sw1_oam_frame_35_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_0, 47, banim_genm_sw1_oam_frame_36_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_0, 48, banim_genm_sw1_oam_frame_37_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 49, banim_genm_sw1_oam_frame_38_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 50, banim_genm_sw1_oam_frame_39_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 51, banim_genm_sw1_oam_frame_40_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 52, banim_genm_sw1_oam_frame_41_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 53, banim_genm_sw1_oam_frame_42_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 54, banim_genm_sw1_oam_frame_43_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 49, banim_genm_sw1_oam_frame_38_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 50, banim_genm_sw1_oam_frame_39_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 51, banim_genm_sw1_oam_frame_40_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 52, banim_genm_sw1_oam_frame_41_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 53, banim_genm_sw1_oam_frame_42_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 54, banim_genm_sw1_oam_frame_43_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 49, banim_genm_sw1_oam_frame_38_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_genm_sw1_sheet_3, 55, banim_genm_sw1_oam_frame_44_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 56, banim_genm_sw1_oam_frame_45_r - banim_genm_sw1_oam_r
	banim_code_frame 10, banim_genm_sw1_sheet_3, 55, banim_genm_sw1_oam_frame_44_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_genm_sw1_sheet_3, 57, banim_genm_sw1_oam_frame_46_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_3, 58, banim_genm_sw1_oam_frame_47_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_genm_sw1_sheet_2, 11, banim_genm_sw1_oam_frame_11_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_genm_sw1_sheet_1, 12, banim_genm_sw1_oam_frame_12_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 13, banim_genm_sw1_oam_frame_13_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 14, banim_genm_sw1_oam_frame_14_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 16, banim_genm_sw1_oam_frame_16_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_genm_sw1_sheet_0, 17, banim_genm_sw1_oam_frame_17_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_sw1_sheet_1, 18, banim_genm_sw1_oam_frame_18_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_sw1_sheet_1, 19, banim_genm_sw1_oam_frame_19_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_1, 20, banim_genm_sw1_oam_frame_20_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 21, banim_genm_sw1_oam_frame_21_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 22, banim_genm_sw1_oam_frame_22_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_2, 23, banim_genm_sw1_oam_frame_23_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_2, 24, banim_genm_sw1_oam_frame_24_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 26, banim_genm_sw1_oam_frame_26_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 4, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 10, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_3, 39, banim_genm_sw1_oam_frame_48_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 1, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_1, 38, banim_genm_sw1_oam_frame_28_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_2, 40, banim_genm_sw1_oam_frame_29_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 37, banim_genm_sw1_oam_frame_27_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 1, banim_genm_sw1_oam_frame_1_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 28, banim_genm_sw1_oam_frame_49_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 29, banim_genm_sw1_oam_frame_50_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 3, banim_genm_sw1_sheet_1, 30, banim_genm_sw1_oam_frame_51_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_1, 31, banim_genm_sw1_oam_frame_52_r - banim_genm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_genm_sw1_sheet_1, 32, banim_genm_sw1_oam_frame_53_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_genm_sw1_sheet_0, 29, banim_genm_sw1_oam_frame_50_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 26, banim_genm_sw1_oam_frame_26_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 1, banim_genm_sw1_oam_frame_1_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 28, banim_genm_sw1_oam_frame_49_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 29, banim_genm_sw1_oam_frame_50_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 3, banim_genm_sw1_sheet_1, 30, banim_genm_sw1_oam_frame_51_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_1, 31, banim_genm_sw1_oam_frame_52_r - banim_genm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_genm_sw1_sheet_1, 32, banim_genm_sw1_oam_frame_53_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_genm_sw1_sheet_0, 29, banim_genm_sw1_oam_frame_50_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 26, banim_genm_sw1_oam_frame_26_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_2, 34, banim_genm_sw1_oam_frame_54_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_sw1_sheet_2, 35, banim_genm_sw1_oam_frame_55_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_sw1_sheet_2, 36, banim_genm_sw1_oam_frame_56_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_2, 34, banim_genm_sw1_oam_frame_54_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_sw1_sheet_2, 35, banim_genm_sw1_oam_frame_55_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_sw1_sheet_2, 36, banim_genm_sw1_oam_frame_56_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_sw1_mode_stand_close:
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_sw1_mode_stand:
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_sw1_mode_stand_range:
	banim_code_frame 1, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 4, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 1, banim_genm_sw1_oam_frame_1_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 2, banim_genm_sw1_oam_frame_2_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 3, banim_genm_sw1_oam_frame_3_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 4, banim_genm_sw1_oam_frame_4_r - banim_genm_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_genm_sw1_sheet_1, 5, banim_genm_sw1_oam_frame_5_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 2, banim_genm_sw1_sheet_1, 6, banim_genm_sw1_oam_frame_6_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 7, banim_genm_sw1_oam_frame_7_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 8, banim_genm_sw1_oam_frame_8_r - banim_genm_sw1_oam_r
	banim_code_frame 15, banim_genm_sw1_sheet_1, 7, banim_genm_sw1_oam_frame_7_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_genm_sw1_sheet_0, 9, banim_genm_sw1_oam_frame_9_r - banim_genm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_genm_sw1_sheet_0, 10, banim_genm_sw1_oam_frame_10_r - banim_genm_sw1_oam_r
	banim_code_frame 3, banim_genm_sw1_sheet_2, 11, banim_genm_sw1_oam_frame_11_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_genm_sw1_sheet_1, 12, banim_genm_sw1_oam_frame_12_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 13, banim_genm_sw1_oam_frame_13_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 14, banim_genm_sw1_oam_frame_14_r - banim_genm_sw1_oam_r
	banim_code_frame 2, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_1, 16, banim_genm_sw1_oam_frame_16_r - banim_genm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_genm_sw1_sheet_1, 15, banim_genm_sw1_oam_frame_15_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 17, banim_genm_sw1_oam_frame_17_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_sw1_sheet_1, 18, banim_genm_sw1_oam_frame_18_r - banim_genm_sw1_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_sw1_sheet_1, 19, banim_genm_sw1_oam_frame_19_r - banim_genm_sw1_oam_r
	banim_code_frame 4, banim_genm_sw1_sheet_1, 20, banim_genm_sw1_oam_frame_20_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 21, banim_genm_sw1_oam_frame_21_r - banim_genm_sw1_oam_r
	banim_code_frame 8, banim_genm_sw1_sheet_0, 22, banim_genm_sw1_oam_frame_22_r - banim_genm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 6, banim_genm_sw1_sheet_2, 23, banim_genm_sw1_oam_frame_23_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_2, 24, banim_genm_sw1_oam_frame_24_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 25, banim_genm_sw1_oam_frame_25_r - banim_genm_sw1_oam_r
	banim_code_frame 6, banim_genm_sw1_sheet_0, 0, banim_genm_sw1_oam_frame_0_r - banim_genm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_genm_sw1_sheet_0, 26, banim_genm_sw1_oam_frame_26_r - banim_genm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_genm_sw1_mode_attack_close - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_close_back - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_close_critical - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_close_critical_back - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_range - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_range_critical - banim_genm_sw1_script
	.word banim_genm_sw1_mode_dodge_close - banim_genm_sw1_script
	.word banim_genm_sw1_mode_dodge_range - banim_genm_sw1_script
	.word banim_genm_sw1_mode_stand_close - banim_genm_sw1_script
	.word banim_genm_sw1_mode_stand - banim_genm_sw1_script
	.word banim_genm_sw1_mode_stand_range - banim_genm_sw1_script
	.word banim_genm_sw1_mode_attack_miss - banim_genm_sw1_script
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

